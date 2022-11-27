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
    ["PHP 7.4.33"]="https://www.php.net/distributions/php-7.4.32.tar.gz"
    ["PHP 8.0.26"]="https://www.php.net/distributions/php-8.0.26.tar.gz"
    ["PHP 8.1.13"]="https://www.php.net/distributions/php-8.1.13.tar.gz"
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
    ["PHP 7.4.33"]="5a2337996f07c8a097e03d46263b5c98d2c8e355227756351421003bea8f463e"
    ["PHP 8.0.26"]="3c83a7355a640b2ba436b8202e8597df8f9daadee1ec9241729ece8e578d21cd"
    ["PHP 8.1.13"]="eed1981ce9999d807cb139a9d463ae54bbeda2a57a9a28ad513badf5b99b0073"
    ["PHP 8.2.0RC4"]="7b344d4763a99d01a13fda253941617fc1f732f9ee1ee1d6caccceb1e74e53e7"
)
