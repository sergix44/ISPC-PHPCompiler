#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.37"]="http://php.net/distributions/php-5.6.37.tar.gz"
    ["PHP 7.0.31"]="http://php.net/distributions/php-7.0.31.tar.gz"
    ["PHP 7.1.20"]="http://php.net/distributions/php-7.1.20.tar.gz"
    ["PHP 7.2.8"]="http://php.net/distributions/php-7.2.8.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.37"]="b7ec077f35ef3a8cdd33c29124140b1761111a1429878b4c463bb20d2a31b184"
    ["PHP 7.0.31"]="182f36e5709837158bd4970ce57fe80735bdf79025133c00d6ad882d1c4d98dd"
    ["PHP 7.1.20"]="77a2091f4ab50367a6c68274a0d92e0da9ecdbf428b280c9836c5c6d512da450"
    ["PHP 7.2.8"]="a0cb9bf2f78498fc090eb553df03cdacc198785dec0818efa7a1804c2b7a8722"
)