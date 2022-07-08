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
    ["PHP 7.4.30"]="https://www.php.net/distributions/php-7.4.30.tar.gz"
    ["PHP 8.0.21"]="https://www.php.net/distributions/php-8.0.21.tar.gz"
    ["PHP 8.1.8"]="https://www.php.net/distributions/php-8.1.8.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.34"]="8b2777c741e83f188d3ca6d8e98ece7264acafee86787298fae57e05d0dddc78"
    ["PHP 7.3.33"]="9a369c32c6f52036b0a890f290327f148a1904ee66aa56e2c9a7546da6525ec8"
    ["PHP 7.4.30"]="e37ea37e0f79109351ac615da85eb7c2c336101fc5bc802ee79a124a4310dc10"
    ["PHP 8.0.21"]="2f51f6e90e2e8efd3a20db08f0dd61d7f8d5a9362f8c7325f1ad28ccea5be0ac"
    ["PHP 8.1.8"]="889d910558d2492f7f2236921b9bcde620674c8b684ec02d126060f8ca45dc8d"
)
