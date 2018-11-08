#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.38"]="http://php.net/distributions/php-5.6.38.tar.gz"
    ["PHP 7.0.32"]="http://php.net/distributions/php-7.0.32.tar.gz"
    ["PHP 7.1.24"]="http://php.net/distributions/php-7.1.24.tar.gz"
    ["PHP 7.2.12"]="http://php.net/distributions/php-7.2.12.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.38"]="3b74d46cd79a45cce90c8059e09d8bd0beeb5de562cbb0cb42f96ff8fa665fd4"
    ["PHP 7.0.32"]="08d13389f611ec55f3b9164347a97e410099238a3dd85946e556a288ce366fbe"
    ["PHP 7.1.24"]="1e780b1af3eeb8fba9e5af6205c960184a0c3a0ef091aaa192e7b7d6b67405d0"
    ["PHP 7.2.12"]="d7cabdf4e51db38121daf0d494dc074743b24b6c79e592037eeedd731f1719dd"
)