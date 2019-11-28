#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="https://www.php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="https://www.php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.33"]="https://www.php.net/distributions/php-7.1.33.tar.gz"
    ["PHP 7.2.25"]="https://www.php.net/distributions/php-7.2.25.tar.gz"
    ["PHP 7.3.12"]="https://www.php.net/distributions/php-7.3.12.tar.gz"
    ["PHP 7.4.0"]="https://www.php.net/distributions/php-7.4.0.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.25"]="b2cb1bd46454d33b2c65c2fd559f464cd14e57dd47b953adf5caa77fdf0de52b"
    ["PHP 7.3.12"]="d617e5116f8472a628083f448ebe4afdbc4ac013c9a890b08946649dcbe61b34"
    ["PHP 7.4.0"]="bf206be96a39e643180013df39ddcd0493966692a2422c4b7d3355b6a15a01c0"
)
