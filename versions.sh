#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.35"]="http://php.net/distributions/php-5.6.35.tar.gz"
    ["PHP 7.0.29"]="http://php.net/distributions/php-7.0.29.tar.gz"
    ["PHP 7.1.16"]="http://php.net/distributions/php-7.1.16.tar.gz"
    ["PHP 7.2.4"]="http://php.net/distributions/php-7.2.4.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.35"]="dd0242304f510d48a5216dd2f5796bcf59e8e18366658259aaf205e1d63abf71"
    ["PHP 7.0.29"]="5efe45e345f967cb20f9ff92cd514753872a65feffea1bf311c71864344bd8e8"
    ["PHP 7.1.16"]="c8e6fed5b350b29a5b9eaa9fce7c5e8618629346e9a58212f3dc380046065442"
    ["PHP 7.2.4"]="58e28e978baea0fe9009432bcb436934eaacccfdcb5f5409c7526431a595857b"
)
