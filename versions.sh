#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.33"]="http://php.net/distributions/php-5.6.33.tar.gz"
    ["PHP 7.0.27"]="http://php.net/distributions/php-7.0.27.tar.gz"
    ["PHP 7.1.14"]="http://php.net/distributions/php-7.1.14.tar.gz"
    ["PHP 7.2.2"]="http://php.net/distributions/php-7.2.2.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.33"]="bedfac81cfaa25961812a1aec458c4109411a14991b43a416343ffb830b8da6a"
    ["PHP 7.0.27"]="809c0181e970dd17c6a6cabbf64518e719c7253e7490f8e1279bc1e1fbdf7996"
    ["PHP 7.1.14"]="8c7360209d255ee46d388bdcd43ef1a2d14b370c331be30ea628ece18a1e7683"
    ["PHP 7.2.2"]="5963df05fec21927c03fe9f7bf379be2d1eacde6c0f9dcde6143c7133e55abd4"
)
