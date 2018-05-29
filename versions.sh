#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.36"]="http://php.net/distributions/php-5.6.36.tar.gz"
    ["PHP 7.0.30"]="http://php.net/distributions/php-7.0.30.tar.gz"
    ["PHP 7.1.18"]="http://php.net/distributions/php-7.1.18.tar.gz"
    ["PHP 7.2.6"]="http://php.net/distributions/php-7.2.6.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.36"]="06086a8b6a9964ef8009c4d9176b4eeb0c564ea39c1213f015e24f3466d2d69f"
    ["PHP 7.0.30"]="54e7615205123b940b996300bf99c707c2317b6b78388061a204b23ab3388a26"
    ["PHP 7.1.18"]="07c24ae4dd59d81d3dc0ce89025ae667979150e2ee0e9e30dd89e04e31d510fb"
    ["PHP 7.2.6"]="a9f30daf6af82ac02e692465cfd65b04a60d56106c961926e264d2621d313f0e"
)
