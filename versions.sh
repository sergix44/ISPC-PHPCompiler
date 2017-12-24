#!/usr/bin/env bash
# File with all PHP version supported (with super epic multi dimensional arrays home made)
# Download link and chesum from php.net/downloads.php

# All PHP versions
declare -A VERSIONS=(
	["PHP 5.6.32"]="http://php.net/distributions/php-5.6.32.tar.gz"
	["PHP 7.0.26"]="http://php.net/distributions/php-7.0.26.tar.gz"
	["PHP 7.1.12"]="http://php.net/distributions/php-7.1.12.tar.gz"
	["PHP 7.2.0"]="http://php.net/distributions/php-7.2.0.tar.gz"
)

# All PHP versions checksum
declare -A CHECKSUM=(
	["PHP 5.6.32"]="7bef1ae8cd633df5b9c5964262d276d2dc21acbfcd94022d1e2084d199315df4"
	["PHP 7.0.26"]="04c345f7c9e3f1cd02f275bfec893a4e0290e724073f2f3d7282a219128b537c"
	["PHP 7.1.12"]="188c67d8e424ce7a6fe93475aa64f53182c1d80ca3ac99439651ca91569d969c"
	["PHP 7.2.0"]="801876abd52e0dc58a44701344252035fd50702d8f510cda7fdb317ab79897bc"
)
