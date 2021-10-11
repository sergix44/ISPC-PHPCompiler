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
    ["PHP 7.3.31"]="https://www.php.net/distributions/php-7.3.31.tar.gz"
    ["PHP 7.4.21"]="https://www.php.net/distributions/php-7.4.21.tar.gz"
    ["PHP 8.0.11"]="https://www.php.net/distributions/php-8.0.11.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.34"]="8b2777c741e83f188d3ca6d8e98ece7264acafee86787298fae57e05d0dddc78"
    ["PHP 7.3.31"]="57ca37b08d3eed4cadc3976e78b0f51d0305bb6e60333f6e8c76e8aee07c3f0f"
    ["PHP 7.4.21"]="4b9623accbe4b8923a801212f371f784069535009185e7bf7e4dec66bbea61db"
    ["PHP 8.0.11"]="c6a461f57b4bcb46cd4dec443253b1e2e8e981466f1280093322b7864afe8be7"
)
