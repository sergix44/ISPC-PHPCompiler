#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="https://www.php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="https://www.php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.33"]="https://www.php.net/distributions/php-7.1.33.tar.gz"
    ["PHP 7.2.27"]="https://www.php.net/distributions/php-7.2.27.tar.gz"
    ["PHP 7.3.14"]="https://www.php.net/distributions/php-7.3.14.tar.gz"
    ["PHP 7.4.2"]="https://www.php.net/distributions/php-7.4.2.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.27"]="e00ace5e89cb162cba0aebd17144541e1c4d965589155a44ca706d9f9c5a8981"
    ["PHP 7.3.14"]="6aff532a380b0f30c9e295b67dc91d023fee3b0ae14b4771468bf5dda4cbf108"
    ["PHP 7.4.2"]="e1b8dbf561ac1d871362054ff4cd62dca5e19c8c896567996525dda7c4b320f9"
)
