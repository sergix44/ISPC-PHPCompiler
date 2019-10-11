#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="http://php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="http://php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.32"]="http://php.net/distributions/php-7.1.32.tar.gz"
    ["PHP 7.2.23"]="http://php.net/distributions/php-7.2.23.tar.gz"
    ["PHP 7.3.10"]="http://php.net/distributions/php-7.3.10.tar.gz"
    ["PHP 7.4.b"]="https://downloads.php.net/~derick/php-7.4.0beta4.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.32"]="6e51a2fc610352438b2a1c40310468a1e2b5baf2fff43be77f9f408a9111590c"
    ["PHP 7.2.23"]="b32b426c84ff45154d6c11f00aff433bcac831a5c0a09bf0297075eefaea8fcc"
    ["PHP 7.3.10"]="fb670723a9b8fda31c89529f27e0dda289d8af4b6ce9f152c8010876639c0fb4"
    ["PHP 7.4.b"]="d5af6148be6d53cb196a80b1b7025d4502a7865bc0251376c064edcd7cfb58d7"
)
