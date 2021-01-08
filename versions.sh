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
    ["PHP 7.3.26"]="https://www.php.net/distributions/php-7.3.26.tar.gz"
    ["PHP 7.4.14"]="https://www.php.net/distributions/php-7.4.14.tar.gz"
    ["PHP 8.0.1"]="https://www.php.net/distributions/php-8.0.1.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.34"]="8b2777c741e83f188d3ca6d8e98ece7264acafee86787298fae57e05d0dddc78"
    ["PHP 7.3.26"]="2b55c2a54d1825e7c3feaf44cf42cdf782b8d5c611314172fbf8e234960b6a99"
    ["PHP 7.4.14"]="d359183e2436f4ab30b70d4fbd881b5705a46b2e68cc6069fe91cd63d6e98e13"
    ["PHP 8.0.1"]="f1fee0429aa2cce6bc5df5d7e65386e266b0aab8a5fad7882d10eb833d2f5376"
)
