#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="http://php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="http://php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.33"]="http://php.net/distributions/php-7.1.33.tar.gz"
    ["PHP 7.2.24"]="http://php.net/distributions/php-7.2.24.tar.gz"
    ["PHP 7.3.11"]="http://php.net/distributions/php-7.3.11.tar.gz"
    ["PHP 7.4.b"]="https://downloads.php.net/~derick/php-7.4.0RC4.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.24"]="01baf7a34c856d2c552121fbad7296a8cde18389ce83db32f18252bc1cee4dd6"
    ["PHP 7.3.11"]="8f385f5bdf9193791f6c0f6303f518f3c324b6655ac108fdb3c426da7f3cf4d4"
    ["PHP 7.4.b"]="7cc25051b62266b7a473d69f6afb44c69206700c706f64bf8eb33dbc6c347db2"
)
