#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="http://php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="http://php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.26"]="http://php.net/distributions/php-7.1.26.tar.gz"
    ["PHP 7.2.14"]="http://php.net/distributions/php-7.2.14.tar.gz"
    ["PHP 7.3.1"]="http://php.net/distributions/php-7.3.1.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.26"]="069315d3c3f964fd165bbbb3c2fc56005813e2cf97bed05055318dcc4e775328"
    ["PHP 7.2.14"]="87e13d80b0c3a66bd463d1cb47dc101335884a0d192ab924f547f8aed7f70c08"
    ["PHP 7.3.1"]="8006211f7a041dde22fffedc416d142e0ebf22066014077ca936d7e6f655ead5"
)
