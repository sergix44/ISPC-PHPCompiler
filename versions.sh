#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.36"]="http://php.net/distributions/php-5.6.36.tar.gz"
    ["PHP 7.0.30"]="http://php.net/distributions/php-7.0.30.tar.gz"
    ["PHP 7.1.17"]="http://php.net/distributions/php-7.1.17.tar.gz"
    ["PHP 7.2.5"]="http://php.net/distributions/php-7.2.5.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.36"]="06086a8b6a9964ef8009c4d9176b4eeb0c564ea39c1213f015e24f3466d2d69f"
    ["PHP 7.0.30"]="54e7615205123b940b996300bf99c707c2317b6b78388061a204b23ab3388a26"
    ["PHP 7.1.17"]="aba44265bf814a020282afa63321323e1f81da61bd7318ab2b941857a15cb144"
    ["PHP 7.2.5"]="c198aedd4cd16db0803e0ef955036722a1f4ce9ad3827546709fac05f1567ba5"
)
