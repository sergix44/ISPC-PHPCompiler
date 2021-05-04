#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="https://www.php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="https://www.php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.33"]="https://www.php.net/distributions/php-7.1.33.tar.gz"
    ["PHP 7.2.34"]="https://www.php.net/distributions/php-7.2.34.tar.gz"
    ["PHP 7.3.28"]="https://www.php.net/distributions/php-7.3.28.tar.gz"
    ["PHP 7.4.18"]="https://www.php.net/distributions/php-7.4.18.tar.gz"
    ["PHP 8.0.5"]="https://www.php.net/distributions/php-8.0.5.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.34"]="8b2777c741e83f188d3ca6d8e98ece7264acafee86787298fae57e05d0dddc78"
    ["PHP 7.3.28"]="1f0d9b94e1b11518ffabd19b646c2fee95ea42ca9cd8d337f8d07986fdceede1"
    ["PHP 7.4.18"]="31a8a4a6e7d641f014749cef21421a6d1c9aaba6dce884e181a3370a8e69a04d"
    ["PHP 8.0.5"]="50aeac6fe9c2b5577d534369392ebb89c3e7a342b20ef538832b1df996cccb2a"
)
