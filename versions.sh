#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="http://php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="http://php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.29"]="http://php.net/distributions/php-7.1.29.tar.gz"
    ["PHP 7.2.18"]="http://php.net/distributions/php-7.2.18.tar.gz"
    ["PHP 7.3.5"]="http://php.net/distributions/php-7.3.5.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.29"]="bdd0e1707100c8b87f1be516f5b95a26e3eb4114d4316eaf0663bf292ead35bb"
    ["PHP 7.2.18"]="48aeb291814f3cd3ba03c52e79e8e61896d0271fd4c228198f80a072e568f84b"
    ["PHP 7.3.5"]="c953749b7f3310a3a74f920ef698f6d1c04636d11656ac9ffb3ab10d34e30e1e"
)
