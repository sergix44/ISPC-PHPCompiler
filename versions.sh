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
    ["PHP 7.3.25"]="https://www.php.net/distributions/php-7.3.25.tar.gz"
    ["PHP 7.4.13"]="https://www.php.net/distributions/php-7.4.13.tar.gz"
    ["PHP 8.0.0"]="https://www.php.net/distributions/php-8.0.0.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.34"]="8b2777c741e83f188d3ca6d8e98ece7264acafee86787298fae57e05d0dddc78"
    ["PHP 7.3.25"]="097c7a2a2f9189b33799d79ee5a8aac68a4d72696c1cd69c66ef5d0941ce28ad"
    ["PHP 7.4.13"]="0865cff41e7210de2537bcd5750377cfe09a9312b9b44c1a166cf372d5204b8f"
    ["PHP 8.0.0"]="3ed7b48d64357d3e8fa9e828dbe7416228f84105b8290c2f9779cd66be31ea71"
)
