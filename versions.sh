#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.36"]="http://php.net/distributions/php-5.6.36.tar.gz"
    ["PHP 7.0.30"]="http://php.net/distributions/php-7.0.30.tar.gz"
    ["PHP 7.1.19"]="http://php.net/distributions/php-7.1.19.tar.gz"
    ["PHP 7.2.7"]="http://php.net/distributions/php-7.2.7.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.36"]="06086a8b6a9964ef8009c4d9176b4eeb0c564ea39c1213f015e24f3466d2d69f"
    ["PHP 7.0.30"]="54e7615205123b940b996300bf99c707c2317b6b78388061a204b23ab3388a26"
    ["PHP 7.1.19"]="e1ae477b72bed02cdcb04f0157b8f8767bd4f6030416ae06408b4f6d85ee66a1"
    ["PHP 7.2.7"]="014f0560cfa22e6301b0024a6fd888c3612a0dc102ff355fa2b49544d16d43b1"
)