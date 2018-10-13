#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.38"]="http://php.net/distributions/php-5.6.38.tar.gz"
    ["PHP 7.0.32"]="http://php.net/distributions/php-7.0.32.tar.gz"
    ["PHP 7.1.23"]="http://php.net/distributions/php-7.1.23.tar.gz"
    ["PHP 7.2.11"]="http://php.net/distributions/php-7.2.11.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.38"]="3b74d46cd79a45cce90c8059e09d8bd0beeb5de562cbb0cb42f96ff8fa665fd4"
    ["PHP 7.0.32"]="08d13389f611ec55f3b9164347a97e410099238a3dd85946e556a288ce366fbe"
    ["PHP 7.1.23"]="b839a4de32e6770d10b87c2495c070d09277fe61008804b2992466f0dcc5f0fa"
    ["PHP 7.2.11"]="180c63a9647c0a50d438b6bd5c7a8e7a11bceee8ad613a59d3ef15151fc158d4"
)