#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="http://php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="http://php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.30"]="http://php.net/distributions/php-7.1.30.tar.gz"
    ["PHP 7.2.19"]="http://php.net/distributions/php-7.2.19.tar.gz"
    ["PHP 7.3.6"]="http://php.net/distributions/php-7.3.6.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.30"]="a604edf85d5dfc28e6ff3016dad3954c50b93db69afc42295178b4fdf42e026c"
    ["PHP 7.2.19"]="1cd2266a058f3224d3cba594540045542606996f026eeef96747f27f6b3d22b6"
    ["PHP 7.3.6"]="72fbf223ff8659a61eed08eebffb4ede0256e7a69d2151ae24affa5377b70bb8"
)