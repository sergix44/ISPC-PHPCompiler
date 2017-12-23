#!/usr/bin/env bash

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

function install_dependencies {

}

am_i_root
detect_distro
install_utils
get_menu
show_menu