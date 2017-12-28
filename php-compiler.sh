#!/usr/bin/env bash


#-- Globals

COMPILE_PATH="/usr/local/src/php-build"
CURRENT_PHP_PATH="" # like /opt/php70
CURRENT_PHP_NAME="" # like php70
OUTPUT=""

#-- Helpers Functions

check_return_code() {
        # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
       echo "Error detected in latest command, exiting..."
       rm -r "${COMPILE_PATH:?}/php*" 2&> /dev/null
       exit 500
    fi
}

install_utils() {
	echo -e "Do OS updates..."
    if [ "${DISTRO}" == "centos7" ]; then
        yum -y update
        yum -y install whiptail curl wget
    else
        apt-get update && apt-get -y upgrade
        apt-get -y install whiptail curl wget
    fi
    check_return_code
}

check_folder() {
    if [ ! -d "${1}" ]; then
        echo -e "Creating directory ${1}..."
        mkdir -p "${1}"
        check_return_code
    fi
}

download_extract() {
    ARCHIVE_NAME=${1##*/}
    FOLDER_NAME=${ARCHIVE_NAME/.tar.gz/}

	echo -e "Downloading ${1}..."
    wget "${1}" -O "${COMPILE_PATH}/${ARCHIVE_NAME}"
    check_return_code

    if [ "$(sha256sum "${COMPILE_PATH}/${ARCHIVE_NAME}" | cut -d' ' -f1)" != "${2}" ]; then
        echo -e "Checksum mismatch, try to run the script again"
        sha256sum "${COMPILE_PATH}/${ARCHIVE_NAME}"; echo
        exit 409
    else
        echo -e "Checksum matched!"
    fi

    tar zxf "${COMPILE_PATH}/${ARCHIVE_NAME}" -C "${COMPILE_PATH}"
    check_return_code
}

#-- Install Functions

am_i_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root"
        exit
    fi
}

detect_distro() {
    # shellcheck disable=SC1091
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

    if [ "${DISTRO}" == "" ]; then
        echo "Your distro is not supported"
        echo "You can add it and make a PR ;)"
        exit 404
    fi

}

install_dependencies() {
    if [ "${DISTRO}" == "debian8" ]; then
        apt-get -y install build-essential autoconf libfcgi-dev libfcgi0ldbl libjpeg62-turbo-dbg libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev libwebp-dev libvpx-dev
    fi

    if [ "${DISTRO}" == "debian9" ]; then
        apt-get -y install build-essential autoconf libfcgi-dev libfcgi0ldbl libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev libwebp-dev libvpx-dev libc-client2007e-dev
        ln -s  /usr/include/x86_64-linux-gnu/curl  /usr/include/curl
    fi

    if [ "${DISTRO}" == "ubuntu-16.04" ]; then
        apt-get -y install build-essential autoconf libxml2-dev libjpeg62-dbg libfcgi-dev libfcgi0ldbl libjpeg62-turbo-dbg libmcrypt-dev libssl-dev libc-client2007e libc-client2007e-dev libxml2-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev libfreetype6-dev libkrb5-dev libpq-dev libxml2-dev libxslt1-dev libwebp-dev libvpx-dev
    fi
    check_return_code
}

show_menu() {
    menu=()

    readarray -t _sorted < <(printf '%s\n' "${!VERSIONS[@]}" | sort)

    for version in "${_sorted[@]}"; do
        menu+=( "${version}" "" OFF )
    done

    USER_SELECTION=$(whiptail --title "PHP Compiler" --checklist "Select PHP versions to install or update:" 15 35 "$((${#menu[@]}/3))" "${menu[@]}" 3>&1 1>&2 2>&3)
}

# $1=php_name (like 'php70'), $2=php_path (like '/opt/php70')
create_init_script() {

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

# $1=php_name (like 'php70'), $2=php_path (like '/opt/php70')
create_systemd_script() {

cat << "EOF" > "/lib/systemd/system/${1}-fpm.service"
[Unit]
Description=The &NAME& FastCGI Process Manager
After=network.target

[Service]
Type=simple
PIDFile=&PATH&/var/run/php-fpm.pid
ExecStart=&PATH&/sbin/php-fpm --nodaemonize --fpm-config &PATH&/etc/php-fpm.conf
ExecReload=/bin/kill -USR2 $MAINPID

[Install]
WantedBy=multi-user.target
EOF

sed -i "s:&NAME&:${1}:g" "/lib/systemd/system/${1}-fpm.service"
sed -i "s:&PATH&:${2}:g" "/lib/systemd/system/${1}-fpm.service"
}

compile() {
    ln -s /usr/lib/libc-client.a /usr/lib/x86_64-linux-gnu/libc-client.a

    if [ "${CURRENT_PHP_VERSION}" -lt 7 ]; then
        webp="--with-vpx-dir=/usr"
    else
        webp="--with-webp-dir=/usr"
    fi

    (cd "${COMPILE_PATH}/${FOLDER_NAME}" && ./configure \
        --prefix=${CURRENT_PHP_PATH} --with-pdo-pgsql --with-zlib-dir --with-freetype-dir --enable-mbstring \
        --with-libxml-dir=/usr --enable-soap --enable-calendar --with-curl --with-mcrypt \
        --with-zlib --with-gd --with-pgsql --disable-rpath --enable-inline-optimization \
        --with-bz2 --with-zlib --enable-sockets --enable-sysvsem --enable-sysvshm \
        --enable-pcntl --enable-mbregex --enable-exif --enable-bcmath --with-mhash \
        --enable-zip --with-pcre-regex --with-pdo-mysql --with-mysqli --with-mysql-sock=/var/run/mysqld/mysqld.sock \
        --with-jpeg-dir=/usr --with-png-dir=/usr --enable-gd-native-ttf --with-openssl --with-fpm-user=www-data \
        --with-fpm-group=www-data --with-libdir=/lib/x86_64-linux-gnu --enable-ftp --with-imap --with-imap-ssl \
        --with-kerberos --with-gettext --with-xmlrpc $webp --with-xsl \
        --enable-opcache --enable-fpm)
    check_return_code

    CPU_COUNT=$(grep -c ^processor /proc/cpuinfo)

    make -C "${COMPILE_PATH}/${FOLDER_NAME}" -j"${CPU_COUNT}"
    check_return_code

    if [ -d "${CURRENT_PHP_PATH}" ]; then
        echo -e "Stopping services..."
        systemctl stop "${CURRENT_PHP_NAME}-fpm.service"
    fi

    make -C "${COMPILE_PATH}/${FOLDER_NAME}" install
    check_return_code
}

install() {
    # shellcheck disable=SC2086
    if [ -f /.dockerenv ]; then
	FPM_PORT=$(shuf -i 2000-50000 -n 1)
    else
	while :; do
		FPM_PORT=$(whiptail --title "PHP Compiler" --nocancel --inputbox "Choose the FPM port for ${CURRENT_PHP_NAME}" 10 40 ""  3>&1 1>&2 2>&3)
		if [ "$(netstat -tunl | grep -P "^(?=.*LISTEN)(?=.*${FPM_PORT})" -c)" -eq 0 ]; then
		    break
		fi
	done
    fi

    cp "${COMPILE_PATH}/${FOLDER_NAME}/php.ini-production" "${CURRENT_PHP_PATH}/lib/php.ini"
    cp "${CURRENT_PHP_PATH}/etc/php-fpm.conf.default" "${CURRENT_PHP_PATH}/etc/php-fpm.conf"

    sed -i 's/;pid = run\/php-fpm.pid/pid = run\/php-fpm.pid/' ${CURRENT_PHP_PATH}/etc/php-fpm.conf

    if [ "${CURRENT_PHP_VERSION}" -lt 7 ]; then
        sed -i "s/listen = 127.0.0.1:9000/listen = 127.0.0.1:${FPM_PORT}/" ${CURRENT_PHP_PATH}/etc/php-fpm.conf
	    echo "include=${CURRENT_PHP_PATH}/etc/php-fpm.d/*.conf" >> ${CURRENT_PHP_PATH}/etc/php-fpm.conf
	    check_folder "${CURRENT_PHP_PATH}/etc/php-fpm.d"
    else
        cp "${CURRENT_PHP_PATH}/etc/php-fpm.d/www.conf.default" "${CURRENT_PHP_PATH}/etc/php-fpm.d/www.conf"
        sed -i "s/listen = 127.0.0.1:9000/listen = 127.0.0.1:${FPM_PORT}/" ${CURRENT_PHP_PATH}/etc/php-fpm.d/www.conf
    fi

    create_init_script "${CURRENT_PHP_NAME}" "${CURRENT_PHP_PATH}"
    chmod 755 "/etc/init.d/${CURRENT_PHP_NAME}-fpm"
    insserv "${CURRENT_PHP_NAME}-fpm"

    create_systemd_script "${CURRENT_PHP_NAME}" "${CURRENT_PHP_PATH}"

    systemctl enable "${CURRENT_PHP_NAME}-fpm.service"
    systemctl daemon-reload

    echo "zend_extension=opcache.so" >> "${CURRENT_PHP_PATH}/lib/php.ini"

    systemctl start "${CURRENT_PHP_NAME}-fpm.service"
}

completed() {
    OUTPUT="${OUTPUT}----------- COMPLETED: [${CURRENT_PHP_NAME}] -----------\\n"
    OUTPUT="${OUTPUT}FastCGI Settings:\\n"
    OUTPUT="${OUTPUT} - Path to the PHP FastCGI binary: ${CURRENT_PHP_PATH}/bin/php-cgi\\n"
    OUTPUT="${OUTPUT} - Path to the php.ini directory: ${CURRENT_PHP_PATH}/lib\\n"
    OUTPUT="${OUTPUT}PHP-FPM Settings:\\n"
    OUTPUT="${OUTPUT} - Path to the PHP-FPM init script: /etc/init.d/${CURRENT_PHP_NAME}-fpm\\n"
    OUTPUT="${OUTPUT} - Path to the php.ini directory: ${CURRENT_PHP_PATH}/lib\\n"
    OUTPUT="${OUTPUT} - Path to the PHP-FPM pool directory: ${CURRENT_PHP_PATH}/etc/php-fpm.d\\n"
    OUTPUT="${OUTPUT}------------------------------------------\\n"
}

cleanup() {
    rm -r "${COMPILE_PATH:?}/${FOLDER_NAME}"
    rm -r "${COMPILE_PATH:?}/${ARCHIVE_NAME}"
}

elaborate_selection() {
    for selection in "${USER_SELECTION[@]//\"/}"; do
        CURRENT_PHP_NAME="php${selection:4:1}${selection:6:1}"
        CURRENT_PHP_PATH="/opt/${CURRENT_PHP_NAME}"
        CURRENT_PHP_VERSION="${selection:4:1}"

        if [ "${CURRENT_PHP_NAME}" == "php56" ] && [ "${DISTRO}" == "debian9" ]; then
            echo -e "Your current distro(${DISTRO}) currently not support this php version building (${CURRENT_PHP_NAME}). Skipping..."
            continue
        fi

		echo -e "Checking compile path..."
        check_folder "${COMPILE_PATH}"

        echo -e "Downloading ${selection}..."
        download_extract "${VERSIONS[$selection]}" "${CHECKSUM[$selection]}"

        echo -e "Compiling..."
        if [ ! -d "${CURRENT_PHP_PATH}" ]; then
            compile
            echo -e "First time setup..."
            install
        else
            compile
            echo -e "Restarting services..."
            systemctl restart "${CURRENT_PHP_NAME}-fpm.service"
        fi
        completed
        cleanup
    done
    echo -e "${OUTPUT}"
}

am_i_root
detect_distro
install_utils
install_dependencies

# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/SergiX44/ISPC-PHPCompiler/bash-version/versions.sh)
check_return_code

if [ -f /.dockerenv ]; then
    USER_SELECTION=( $1 )
else
    show_menu
fi

elaborate_selection
