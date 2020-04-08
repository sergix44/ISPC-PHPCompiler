#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="https://www.php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="https://www.php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.33"]="https://www.php.net/distributions/php-7.1.33.tar.gz"
    ["PHP 7.2.29"]="https://www.php.net/distributions/php-7.2.29.tar.gz"
    ["PHP 7.3.16"]="https://www.php.net/distributions/php-7.3.16.tar.gz"
    ["PHP 7.4.4"]="https://www.php.net/distributions/php-7.4.4.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.29"]="ea5c96309394a03a38828cc182058be0c09dde1f00f35809622c2d05c50ee890"
    ["PHP 7.3.16"]="a01ae4f6baf427413c28f8cfddbae86aeff61cdb88658e75404f2d93d98e3255"
    ["PHP 7.4.4"]="1581b3e10c7854597e1086937d5753cdf92d132865c06a50aed4f4f407138616"
)
