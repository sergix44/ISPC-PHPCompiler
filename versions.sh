#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.39"]="http://php.net/distributions/php-5.6.39.tar.gz"
    ["PHP 7.0.32"]="http://php.net/distributions/php-7.0.32.tar.gz"
    ["PHP 7.1.25"]="http://php.net/distributions/php-7.1.25.tar.gz"
    ["PHP 7.2.13"]="http://php.net/distributions/php-7.2.13.tar.gz"
    ["PHP 7.3.0"]="http://php.net/distributions/php-7.3.0.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.39"]="127b122b7d6c7f3c211c0ffa554979370c3131196137404a51a391d8e2e9c7bb"
    ["PHP 7.0.32"]="08d13389f611ec55f3b9164347a97e410099238a3dd85946e556a288ce366fbe"
    ["PHP 7.1.25"]="7dc40e202140e8b4fb3d992c15a68d98dc06b805e6b218497d260abbe51f5958"
    ["PHP 7.2.13"]="e563cee406b1ec96649c22ed2b35796cfe4e9aa9afa6eab6be4cf2fe5d724744"
    ["PHP 7.2.12"]="391bd0f91d9bdd01ab47ef9607bad8c65e35bc9bb098fb7777b2556e2c847b11"
)
