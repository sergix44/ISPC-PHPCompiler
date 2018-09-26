#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.38"]="http://php.net/distributions/php-5.6.38.tar.gz"
    ["PHP 7.0.32"]="http://php.net/distributions/php-7.0.32.tar.gz"
    ["PHP 7.1.22"]="http://php.net/distributions/php-7.1.22.tar.gz"
    ["PHP 7.2.10"]="http://php.net/distributions/php-7.2.10.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.38"]="3b74d46cd79a45cce90c8059e09d8bd0beeb5de562cbb0cb42f96ff8fa665fd4"
    ["PHP 7.0.32"]="08d13389f611ec55f3b9164347a97e410099238a3dd85946e556a288ce366fbe"
    ["PHP 7.1.22"]="1d275115593a33315647094a5a4ee9bd73c7960c08686cee35dc2e683a68b157"
    ["PHP 7.2.10"]="d2d908b49b6005e65dcc46cdc986603a19b7ff103119fce8ddd4648586d430a4"
)
