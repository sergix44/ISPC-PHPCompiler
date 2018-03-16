#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.34"]="http://php.net/distributions/php-5.6.34.tar.gz"
    ["PHP 7.0.28"]="http://php.net/distributions/php-7.0.28.tar.gz"
    ["PHP 7.1.15"]="http://php.net/distributions/php-7.1.15.tar.gz"
    ["PHP 7.2.3"]="http://php.net/distributions/php-7.2.3.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.34"]="de28251ef6d7eb945eb7b770ff668b9f978d9adad52a8c763f6ee409a96732ea"
    ["PHP 7.0.28"]="cd2fd94feb0d5809ffb9d900138643fa74e70656436e5f2595b03239dd97aa9c"
    ["PHP 7.1.15"]="0669c68a52cbd2f1cfa83354918ed03b0bcaa34ed9bafaee7dfd343461b881d4"
    ["PHP 7.2.3"]="5dc98f2266db40c5e4d9b5edf5e29e2449e819fff8321a07eb3830cf0b104bbb"
)
