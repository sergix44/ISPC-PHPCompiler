import json
import platform
import sys
import distutils.version

__version__ = 1.0

SUPPORTED_PLATFORMS = ['ubuntu', 'debian', '', 'linuxmint']  # '' and 'linuxmint' for development purposes

INSTALL_PARENT_PATH = '/opt/'
ROUNDCUBE_INSTALL_PATH = INSTALL_PARENT_PATH + 'roundcube'
PHP_INSTALL_PATH = INSTALL_PARENT_PATH + 'php{0}'


def parse_json(url):
	response = urllib2.urlopen(url)
	data = response.read().decode('utf-8')
	return json.loads(data)


def install_update_php(version):
	os.makedirs(PHP_INSTALL_PATH.format(version['name'][0]+version['name'][2])
	os.makedirs('/usr/local/src/php5-build')
	
	os.system('cd /usr/local/src/php5-build && wget {0} -O {1} && tar jxf {1}'.format(version['downloadurl'], os.path.basename(version['downloadurl'])))
	
	os.system('apt-get -y install libfcgi-dev libfcgi0ldbl libjpeg62-turbo-dbg libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev')
	os.system('ln -s /usr/lib/libc-client.a /usr/lib/x86_64-linux-gnu/libc-client.a')
	
	os.system('cd /usr/local/src/php5-build && ./configure --prefix={0} --with-pdo-pgsql --with-zlib-dir --with-freetype-dir --enable-mbstring --with-libxml-dir=/usr --enable-soap --enable-calendar --with-curl --with-mcrypt --with-zlib --with-gd --with-pgsql --disable-rpath --enable-inline-optimization --with-bz2 --with-zlib --enable-sockets --enable-sysvsem --enable-sysvshm --enable-pcntl --enable-mbregex --enable-exif --enable-bcmath --with-mhash --enable-zip --with-pcre-regex --with-pdo-mysql --with-mysqli --with-mysql-sock=/var/run/mysqld/mysqld.sock --with-jpeg-dir=/usr --with-png-dir=/usr --enable-gd-native-ttf --with-openssl --with-fpm-user=www-data --with-fpm-group=www-data --with-libdir=/lib/x86_64-linux-gnu --enable-ftp --with-imap --with-imap-ssl --with-kerberos --with-gettext --with-xmlrpc --with-xsl --enable-opcache --enable-fpm'.format(PHP_INSTALL_PATH))
	
def php_menu():
	php_versions = parse_json('https://raw.githubusercontent.com/SergiX44/ISPCHelper/master/php_versions.json')

	versions = {}
	i = 1
	for v in php_versions['versions']:
		print(str(i) + ') Update/install PHP ' + v['name'])
		versions[str(i)] = v
		i += 1

	sel = raw_input('\nChoose an option: ')
	if sel not in versions:
		print('Invalid selection.')
		main_menu()
	else:
		install_update_php(versions[sel])


def main_menu():
	print('1) Manage PHP Additional Versions')

	menu = {
		'1': php_menu
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
