#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.32"]="http://php.net/distributions/php-5.6.32.tar.gz"
    ["PHP 7.0.27"]="http://php.net/distributions/php-7.0.27.tar.gz"
    ["PHP 7.1.13"]="http://php.net/distributions/php-7.1.13.tar.gz"
    ["PHP 7.2.1"]="http://php.net/distributions/php-7.2.1.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.32"]="7bef1ae8cd633df5b9c5964262d276d2dc21acbfcd94022d1e2084d199315df4"
    ["PHP 7.0.27"]="809c0181e970dd17c6a6cabbf64518e719c7253e7490f8e1279bc1e1fbdf7996"
    ["PHP 7.1.13"]="12fcbf59c9eb9af215ef38815d5da39b9d74549092c34b0dfc31442699740ce9"
    ["PHP 7.2.1"]="8ecb2950571054a00687ccbd023874a4a075ccd1e2ec3dc00fc25ef589a77dba"
)
