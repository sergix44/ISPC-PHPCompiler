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
    ["PHP 7.3.33"]="https://www.php.net/distributions/php-7.3.33.tar.gz"
    ["PHP 7.4.32"]="https://www.php.net/distributions/php-7.4.32.tar.gz"
    ["PHP 8.0.25"]="https://www.php.net/distributions/php-8.0.25.tar.gz"
    ["PHP 8.1.12"]="https://www.php.net/distributions/php-8.1.12.tar.gz"
    ["PHP 8.2.0RC4"]="https://downloads.php.net/~sergey/php-8.2.0RC4.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.34"]="8b2777c741e83f188d3ca6d8e98ece7264acafee86787298fae57e05d0dddc78"
    ["PHP 7.3.33"]="9a369c32c6f52036b0a890f290327f148a1904ee66aa56e2c9a7546da6525ec8"
    ["PHP 7.4.32"]="197e3372afd69694eb6b230838305eb9e1cbe5db272e0fa3bbe0d38e329a95bc"
    ["PHP 8.0.25"]="349a2b5a01bfccbc9af8afdf183e57bed3349706a084f3c4694aa4c7ff7cb2e9"
    ["PHP 8.1.11"]="3660e8408321149f5d382bb8eeb9ea7b12ea8dd7ea66069da33f6f7383750ab2"
    ["PHP 8.2.0RC4"]="7b344d4763a99d01a13fda253941617fc1f732f9ee1ee1d6caccceb1e74e53e7"
)
