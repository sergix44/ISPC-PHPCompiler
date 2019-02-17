#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="http://php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="http://php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.26"]="http://php.net/distributions/php-7.1.26.tar.gz"
    ["PHP 7.2.15"]="http://php.net/distributions/php-7.2.15.tar.gz"
    ["PHP 7.3.2"]="http://php.net/distributions/php-7.3.2.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.26"]="069315d3c3f964fd165bbbb3c2fc56005813e2cf97bed05055318dcc4e775328"
    ["PHP 7.2.15"]="9b13bde9f5a32d6f6bdb8b911bb55bb818d0c4073538f8dc48aa2deb560f55a3"
    ["PHP 7.3.2"]="4597294b00edc1c63a021b6c7838eb43384f62eeb9e392f0b91c38a3c090f499"
)