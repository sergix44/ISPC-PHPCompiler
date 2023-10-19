#!/usr/bin/env bash
# File with all PHP version supported
# Download link and checksum from php.net/downloads.php

# All PHP versions
# shellcheck disable=SC2034
declare -A VERSIONS=(
    ["PHP 5.6.40"]="https://www.php.net/distributions/php-5.6.40.tar.gz"
    ["PHP 7.0.33"]="https://www.php.net/distributions/php-7.0.33.tar.gz"
    ["PHP 7.1.33"]="https://www.php.net/distributions/php-7.1.33.tar.gz"
    ["PHP 7.2.34"]="https://www.php.net/distributions/php-7.2.34.tar.gz"
    ["PHP 7.3.33"]="https://www.php.net/distributions/php-7.3.33.tar.gz"
    ["PHP 7.4.33"]="https://www.php.net/distributions/php-7.4.33.tar.gz"
    ["PHP 8.0.30"]="https://www.php.net/distributions/php-8.0.30.tar.gz"
    ["PHP 8.1.24"]="https://www.php.net/distributions/php-8.1.24.tar.gz"
    ["PHP 8.2.11"]="https://www.php.net/distributions/php-8.2.11.tar.gz"
)

# All PHP versions checksum
# shellcheck disable=SC2034
declare -A CHECKSUM=(
    ["PHP 5.6.40"]="56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac"
    ["PHP 7.0.33"]="d71a6ecb6b13dc53fed7532a7f8f949c4044806f067502f8fb6f9facbb40452a"
    ["PHP 7.1.33"]="0055f368ffefe51d5a4483755bd17475e88e74302c08b727952831c5b2682ea2"
    ["PHP 7.2.34"]="8b2777c741e83f188d3ca6d8e98ece7264acafee86787298fae57e05d0dddc78"
    ["PHP 7.3.33"]="9a369c32c6f52036b0a890f290327f148a1904ee66aa56e2c9a7546da6525ec8"
    ["PHP 7.4.33"]="5a2337996f07c8a097e03d46263b5c98d2c8e355227756351421003bea8f463e"
    ["PHP 8.0.28"]="449d2048fcb20a314d8c218097c6d1047a9f1c5bb72aa54d5d3eba0a27a4c80c"
    ["PHP 8.1.24"]="d6001a5c16765cd1897609fc71ff083e35db9a28c8874a1ff191cdebe80a6460"
    ["PHP 8.2.11"]="48b1b41279a678a4d4afcd0b256ed921ebf2a91febb0634fdc4449b91c75799f"
)
