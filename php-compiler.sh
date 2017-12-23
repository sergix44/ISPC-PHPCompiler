#!/usr/bin/env bash

#-- Globals

COMPILE_PATH="/usr/local/src/php-build"
CURRENT_PHP_PATH="" # /opt/php70
CURRENT_PHP_NAME="" # php70

#-- Helpers Functions

function check_return_code {
    if [ $? -ne 0 ]; then
       echo "Error detected in latest command, exiting..."
       exit 500
    fi
}

function install_utils {
    if "${DISTRO}" == "centos7"; then
        yum -y install whiptail curl
    else
        apt-get -y install whiptail curl
    fi
    check_return_code
}

function check_folder {
    if [ ! -d "${1}" ]; then
        mkdir -p "${1}"
        check_return_code
    fi
}

function download_extract {
    ARCHIVE_NAME=${1##*/}
    
    wget "${1}" -O "${ARCHIVE_NAME}"
    check_return_code
    
    tar zxf "${ARCHIVE_NAME}"
    check_return_code
}

#-- Install Functions

function am_i_root {
    if [ "$EUID" -ne 0 ]; then 
		echo "Please run as root"
		exit
    fi
}

function detect_distro {

  source /etc/os-release
  check_return_code

  DISTRO=""

  if echo "${ID}-${VERSION_ID}" | grep -iq "debian-7"; then
    DISTRO=debian7
  fi

  
  if echo "${ID}-${VERSION_ID}" | grep -iq "debian-8"; then
    DISTRO=debian8
  fi

  
  if echo "${ID}-${VERSION_ID}" | grep -iq "debian-9"; then
    DISTRO=debian9
  fi

  
  if echo "${ID}-${VERSION_ID}" | grep -iq "ubuntu-14.04"; then
    DISTRO=ubuntu-14.04
  fi


  if echo "${ID}-${VERSION_ID}" | grep -iq "ubuntu-15.10"; then
    DISTRO=ubuntu-15.10
  fi


  if echo "${ID}-${VERSION_ID}" | grep -iq "ubuntu-16.04"; then
    DISTRO=ubuntu-16.04
  fi


  if echo "${ID}-${VERSION_ID}" | grep -iq "ubuntu-16.10"; then
    DISTRO=ubuntu-16.10
  fi


  if echo "${ID}-${VERSION_ID}" | grep -iq "centos-7"; then
    DISTRO=centos7
  fi

  if "${DISTRO}" == ""; then
    echo "Your distro is not supported"
    echo "You can add it and make a PR ;)"
    exit 404
  fi
  
}

function install_dependencies {
:
}

function get_menu {
    source <(curl -s https://raw.githubusercontent.com/SergiX44/ISPC-PHPCompiler/bash-version/versions.sh)
    check_return_code
}

function show_menu {
	menu=()

	for version in "${!VERSIONS[@]}"; do
		menu+=( "${version}" "" OFF )
	done

	USER_SELECTION=$(whiptail --title "PHP Compiler" --checklist "Select PHP versions to install or update:" 15 35 "$((${#menu[@]}/3))" "${menu[@]}" 3>&1 1>&2 2>&3)
}

# $1=php_name (like 'php70'), $2=php_path (like '/opt/php70')
function create_init_script {

cat << "EOF" > "/etc/init.d/${1}-fpm"
#! /bin/sh
### BEGIN INIT INFO
# Provides:          &NAME&-fpm
# Required-Start:    $all
# Required-Stop:     $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts &NAME&-fpm
# Description:       starts the PHP FastCGI Process Manager daemon
### END INIT INFO
php_fpm_BIN=&PATH&/sbin/php-fpm
php_fpm_CONF=&PATH&/etc/php-fpm.conf
php_fpm_PID=&PATH&/var/run/php-fpm.pid
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
esac
EOF

sed -i "s:&NAME&:${1}:g" "/etc/init.d/${1}-fpm"
sed -i "s:&PATH&:${2}:g" "/etc/init.d/${1}-fpm"

}

function create_systemd_script {
:
}

function compile {
    ln -s /usr/lib/libc-client.a /usr/lib/x86_64-linux-gnu/libc-client.a

    ${COMPILE_PATH}/configure \
        --prefix=${CURRENT_PHP_PATH} --with-pdo-pgsql --with-zlib-dir --with-freetype-dir --enable-mbstring \
        --with-libxml-dir=/usr --enable-soap --enable-calendar --with-curl --with-mcrypt \
        --with-zlib --with-gd --with-pgsql --disable-rpath --enable-inline-optimization \
        --with-bz2 --with-zlib --enable-sockets --enable-sysvsem --enable-sysvshm \
        --enable-pcntl --enable-mbregex --enable-exif --enable-bcmath --with-mhash \
        --enable-zip --with-pcre-regex --with-pdo-mysql --with-mysqli --with-mysql-sock=/var/run/mysqld/mysqld.sock \
        --with-jpeg-dir=/usr --with-png-dir=/usr --enable-gd-native-ttf --with-openssl --with-fpm-user=www-data \
        --with-fpm-group=www-data --with-libdir=/lib/x86_64-linux-gnu --enable-ftp --with-imap --with-imap-ssl \
        --with-kerberos --with-gettext --with-xmlrpc --with-webp-dir=/usr --with-xsl \
        --enable-opcache --enable-fpm
    check_return_code
    
    CPU_COUNT=$(grep -c ^processor /proc/cpuinfo)
    
    FOLDER_NAME=${ARCHIVE_NAME/.tar.gz/}
    
    make -C "${FOLDER_NAME}" -j"${CPU_COUNT}"
    check_return_code
    
    make -C "${FOLDER_NAME}" install
    check_return_code
    
}

function install {
    if [ ! -d "${CURRENT_PHP_PATH}" ]; then
        FPM_PORT=$(whiptail --title "PHP Compiler" --inputbox "Choose the FPM port for ${CURRENT_PHP_NAME}" 15 35 Blue  3>&1 1>&2 2>&3)
        
        cp "/usr/local/src/php-build/${FOLDER_NAME}/php.ini-production" "${CURRENT_PHP_PATH}/lib/php.ini"
        cp "${CURRENT_PHP_PATH}/etc/php-fpm.conf.default" "${CURRENT_PHP_PATH}/etc/php-fpm.conf"
        
        sed -i 's/;pid = run\/php-fpm.pid/pid = run\/php-fpm.pid/' ${CURRENT_PHP_PATH}/etc/php-fpm.conf
  
        if [ ${1} -lt 7 ]; then
            cp "${CURRENT_PHP_PATH}/etc/php-fpm.d/www.conf.default" "${CURRENT_PHP_PATH}/etc/php-fpm.d/www.conf"
            sed -i 's/listen = 127.0.0.1:9000/listen = 127.0.0.1:${FPM_PORT}/' ${CURRENT_PHP_PATH}/etc/php-fpm.d/www.conf
        else
            sed -i 's/listen = 127.0.0.1:9000/listen = 127.0.0.1:${FPM_PORT}/' ${CURRENT_PHP_PATH}/etc/php-fpm.conf
            echo "include=${CURRENT_PHP_PATH}/etc/php-fpm.d/*.conf" >> ${CURRENT_PHP_PATH}/etc/php-fpm.conf
            check_folder "${CURRENT_PHP_PATH}/etc/php-fpm.d"
        fi
        
        
        
        
        
        
        
    fi
    
    
}

function postinstall {
:
}

function cleanup {
:
}

function elaborate_selection {
    for selection in "${USER_SELECTION[@]}"; do
    
        CURRENT_PHP_NAME="php${selection:4:1}${selection:6:1}"
        CURRENT_PHP_PATH="/opt/${CURRENT_PHP_NAME}"
        
        check_folder "${COMPILE_PATH}"
        download_extract "${VERSIONS[selection]}"
        compile
        create_folder "${CURRENT_PHP_PATH}"
        install ${selection:4:1}
        postinstall
        cleanup
    done
}

am_i_root
detect_distro
install_utils
install_dependencies
get_menu
show_menu
elaborate_selection