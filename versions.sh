#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="http://php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="http://php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.27"]="http://php.net/distributions/php-7.1.27.tar.gz"
    ["PHP 7.2.17"]="http://php.net/distributions/php-7.2.17.tar.gz"
    ["PHP 7.3.4"]="http://php.net/distributions/php-7.3.4.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.27"]="353b9ed341048388cc95e6fa6dab587eee44a3d4d297989aa297936090864357"
    ["PHP 7.2.17"]="e1c6c2553cdb7edbfa65b89e259690ed01b31b12d57349c90b6ed00a410f62b5"
    ["PHP 7.3.4"]="dd41ecf43fe1172030f41d2581909457a0af7bd137a057c3874e0b0f3c2e8761"
)