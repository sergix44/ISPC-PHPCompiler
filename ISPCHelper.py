import json
import platform
import sys
import os
import urllib2
import multiprocessing
import shutil

__version__ = 1.0

SUPPORTED_PLATFORMS = ['ubuntu', 'debian']

INSTALL_PARENT_PATH = '/opt/'
PHP_INSTALL_PATH = INSTALL_PARENT_PATH + 'php{0}'


def parse_json(url):
    response = urllib2.urlopen(url)
    data = response.read().decode('utf-8')
    return json.loads(data)


def install_update_php(version):
    php_path = PHP_INSTALL_PATH.format(version['name'][0] + version['name'][2])
    php_name = os.path.basename(php_path)
    
    print('Creating folders...')
    
    upgrade_version = True
    if not os.path.exists(php_path):
        os.makedirs(php_path)
        upgrade_version = False
    if not os.path.exists('/usr/local/src/php5-build'):
        os.makedirs('/usr/local/src/php5-build')
    
    print('Downloading sources...')
    archive_name = os.path.basename(version['downloadurl'])
    folder_name = archive_name.replace('.tar.gz', '')
    
    os.system('cd /usr/local/src/php5-build && wget {0} -O {1} && tar zxf {1}'.format(version['downloadurl'], archive_name))
    
    if not os.path.exists('/usr/local/src/php5-build/' + folder_name):
        print('Cannot find extracted dir.')
        sys.exit(1)
    
    print('Dependecies check...')
    os.system(
        'apt-get -y install build-essential libfcgi-dev libfcgi0ldbl libjpeg62-turbo-dbg libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev')
    os.system('ln -s /usr/lib/libc-client.a /usr/lib/x86_64-linux-gnu/libc-client.a')
    
    print('Creating configure...')
    os.system(
        'cd /usr/local/src/php5-build/{0} && ./configure --prefix={1} --with-pdo-pgsql --with-zlib-dir --with-freetype-dir --enable-mbstring --with-libxml-dir=/usr --enable-soap --enable-calendar --with-curl --with-mcrypt --with-zlib --with-gd --with-pgsql --disable-rpath --enable-inline-optimization --with-bz2 --with-zlib --enable-sockets --enable-sysvsem --enable-sysvshm --enable-pcntl --enable-mbregex --enable-exif --enable-bcmath --with-mhash --enable-zip --with-pcre-regex --with-pdo-mysql --with-mysqli --with-mysql-sock=/var/run/mysqld/mysqld.sock --with-jpeg-dir=/usr --with-png-dir=/usr --enable-gd-native-ttf --with-openssl --with-fpm-user=www-data --with-fpm-group=www-data --with-libdir=/lib/x86_64-linux-gnu --enable-ftp --with-imap --with-imap-ssl --with-kerberos --with-gettext --with-xmlrpc --with-xsl --enable-opcache --enable-fpm'
            .format(folder_name, php_path))
    
    print('Creating compiling...')
    os.system('cd /usr/local/src/php5-build/{0} && make -j{1}'.format(folder_name, multiprocessing.cpu_count()))
    os.system('cd /usr/local/src/php5-build/{0} && make install'.format(folder_name))
    
    if not upgrade_version:
        fpm_port = input('PHP-FPM port: ')
        
        print('Writing configs...')
        os.system('cp /usr/local/src/php5-build/{0}/php.ini-production {1}/lib/php.ini'.format(folder_name, php_path))
        os.system('cp {0}/etc/php-fpm.conf.default {0}/etc/php-fpm.conf'.format(php_path))
        os.system('cp {0}/etc/php-fpm.d/www.conf.default {0}/etc/php-fpm.d/www.conf'.format(php_path))
        
        os.system("sed -i 's/;pid = run\/php-fpm.pid/pid = run\/php-fpm.pid/' {0}/etc/php-fpm.conf".format(php_path))
        os.system("sed -i 's/listen = 127.0.0.1:9000/listen = 127.0.0.1:{1}/' {0}/etc/php-fpm.d/www.conf".format(php_path, fpm_port))
        
        f = open('/etc/init.d/{0}-fpm'.format(php_name), 'w')
        f.write('''#! /bin/sh
### BEGIN INIT INFO
# Provides:          {1}-fpm
# Required-Start:    $all
# Required-Stop:     $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts {1}-fpm
# Description:       starts the PHP FastCGI Process Manager daemon
### END INIT INFO
php_fpm_BIN={0}/sbin/php-fpm
php_fpm_CONF={0}/etc/php-fpm.conf
php_fpm_PID={0}/var/run/php-fpm.pid
php_opts="--fpm-config $php_fpm_CONF"
wait_for_pid () {{
        try=0
        while test $try -lt 35 ; do
                case "$1" in
                        'created')
                        if [ -f "$2" ] ; then
                                try=''
                                break
                        fi
                        ;;
                        'removed')
                        if [ ! -f "$2" ] ; then
                                try=''
                                break
                        fi
                        ;;
                esac
                echo -n .
                try=`expr $try + 1`
                sleep 1
        done
}}
case "$1" in
        start)
                echo -n "Starting php-fpm "
                $php_fpm_BIN $php_opts
                if [ "$?" != 0 ] ; then
                        echo " failed"
                        exit 1
                fi
                wait_for_pid created $php_fpm_PID
                if [ -n "$try" ] ; then
                        echo " failed"
                        exit 1
                else
                        echo " done"
                fi
        ;;
        stop)
                echo -n "Gracefully shutting down php-fpm "
                if [ ! -r $php_fpm_PID ] ; then
                        echo "warning, no pid file found - php-fpm is not running ?"
                        exit 1
                fi
                kill -QUIT `cat $php_fpm_PID`
                wait_for_pid removed $php_fpm_PID
                if [ -n "$try" ] ; then
                        echo " failed. Use force-exit"
                        exit 1
                else
                        echo " done"
                       echo " done"
                fi
        ;;
        force-quit)
                echo -n "Terminating php-fpm "
                if [ ! -r $php_fpm_PID ] ; then
                        echo "warning, no pid file found - php-fpm is not running ?"
                        exit 1
                fi
                kill -TERM `cat $php_fpm_PID`
                wait_for_pid removed $php_fpm_PID
                if [ -n "$try" ] ; then
                        echo " failed"
                        exit 1
                else
                        echo " done"
                fi
        ;;
        restart)
                $0 stop
                $0 start
        ;;
        reload)
                echo -n "Reload service php-fpm "
                if [ ! -r $php_fpm_PID ] ; then
                        echo "warning, no pid file found - php-fpm is not running ?"
                        exit 1
                fi
                kill -USR2 `cat $php_fpm_PID`
                echo " done"
        ;;
        *)
                echo "Usage: $0 {{start|stop|force-quit|restart|reload}}"
                exit 1
        ;;
esac'''.format(php_path, php_name))
        f.close()
        
        os.system('chmod 755 /etc/init.d/{0}-fpm'.format(php_name))
        os.system('insserv {0}-fpm'.format(php_name))
        
        f = open('/lib/systemd/system/{0}-fpm.service'.format(php_name), 'w')
        f.write('''[Unit]
Description=The PHP {1} FastCGI Process Manager
After=network.target

[Service]
Type=simple
PIDFile={0}/var/run/php-fpm.pid
ExecStart={0}/sbin/php-fpm --nodaemonize --fpm-config {0}/etc/php-fpm.conf
ExecReload=/bin/kill -USR2 $MAINPID

[Install]
WantedBy=multi-user.target'''.format(php_path, php_name))
        f.close()
        
        print('Starting FPM daemon...')
        os.system('systemctl enable {0}-fpm.service'.format(php_name))
        os.system('systemctl daemon-reload')
        
        os.system('echo "zend_extension=opcache.so" >> {0}/lib/php.ini'.format(php_path))
        
        os.system('systemctl start {0}-fpm.service'.format(php_name))
    
    else:
        os.system('systemctl restart {0}-fpm.service'.format(php_name))
    
    shutil.rmtree('/usr/local/src/php5-build/' + folder_name)
    os.remove('/usr/local/src/php5-build/' + archive_name)
    
    print('----------- COMPLETED -----------')
    print('FastCGI Settings:')
    print(" - Path to the PHP FastCGI binary: {0}/bin/php-cgi\n - Path to the php.ini directory: {0}/lib".format(php_path))
    print('PHP-FPM Settings:')
    print(" - Path to the PHP-FPM init script: /etc/init.d/{1}-fpm\n"
          " - Path to the php.ini directory: {0}/lib\n"
          " - Path to the PHP-FPM pool directory: {0}/etc/php-fpm.d\n".format(php_path, php_name))
    print('---------------------------------')


def php_menu():
    php_versions = parse_json('https://raw.githubusercontent.com/SergiX44/ISPCHelper/master/php_versions.json')
    
    versions = {}
    i = 1
    for v in php_versions['versions']:
        print('{0}) Update/install PHP {1}({2})'.format(str(i), v['name'], v['version']))
        versions[str(i)] = v
        i += 1
    print('q) Main Menu')
    sel = raw_input('\nChoose an option: ')
    if sel == 'q':
        main_menu()
    elif sel not in versions:
        print('Invalid selection.')
        php_menu()
    else:
        install_update_php(versions[sel])


def main_menu():
    print('1) Manage PHP Additional Versions')
    print('q) Quit')
    
    menu = {
        '1': php_menu,
        'q': sys.exit
    }
    
    sel = raw_input('\nChoose an option: ')
    run_menu(sel, menu, main_menu)


def run_menu(sel, menu, caller):
    if sel in menu:
        menu[sel]()
    else:
        print('Invalid selection.')
        caller()


if __name__ == '__main__':
    print('-*- ISPConfig Helper {0} -*-\n'.format(__version__))
    
    if platform.dist()[0].lower() not in SUPPORTED_PLATFORMS:
        print('Your distribution is not supported.')
        sys.exit(1)
    main_menu()
