#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="http://php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="http://php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.30"]="http://php.net/distributions/php-7.1.30.tar.gz"
    ["PHP 7.2.20"]="http://php.net/distributions/php-7.2.20.tar.gz"
    ["PHP 7.3.7"]="http://php.net/distributions/php-7.3.7.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.30"]="a604edf85d5dfc28e6ff3016dad3954c50b93db69afc42295178b4fdf42e026c"
    ["PHP 7.2.20"]="d1dbf6f299514c9aa55b2995928b798b27c21811a0447f0688993cdf36be0749"
    ["PHP 7.3.7"]="4230bbc862df712b013369de94b131eddea1e5e946a8c5e286b82d441c313328"
)
