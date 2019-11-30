# 🚀 The PHP Compiler Script [![Build Status](https://travis-ci.org/SergiX44/ISPC-PHPCompiler.svg?branch=bash-version)](https://travis-ci.org/SergiX44/ISPC-PHPCompiler)

This script will help you to manage different PHP version for your webserver (especially made for ISPConfig installations). 
This supports **auto compiling and auto configure feature** with a **very high optimization level** (`-O3` `-march=native` `-mtune=native` flags) for PHP >= 5.6. See the versions.sh file to see them.

At every launch a new version of the `versions.sh` file is imported from this repository, it **ensure always up to date links and builds**.

# How to use
Just run this command in your shell to download and run the script, and then just follow the instruction on your screen:
```bash
wget https://raw.githubusercontent.com/SergiX44/ISPC-PHPCompiler/bash-version/php-compiler.sh; chmod +x php-compiler.sh; bash php-compiler.sh
```
# Currently supported platforms
Checked entries are also successfully tested.
- [x] Devuan 1
- [x] Devuan 2 (ASCII)
- [x] Debian 8
- [x] Debian 9
- [x] Debian 10
- [x] CentOS 7
- [x] CentOS 8
- [x] Ubuntu 16.04
- [x] Ubuntu 18.04

# EOL
The script should also work on:
 - Ubuntu 14.04
 - Ubuntu 17.04
 - Ubuntu 17.10

But these platforms are no longer tested.

# Contributors
[<img src="https://www.gravatar.com/avatar/98b8d56f4a193e3f7154f236c16930b2?s=100" alt="" height="100">](https://github.com/SergiX44) | [<img src="https://www.gravatar.com/avatar/35923b3b04e23bef801553656b606bfag?s=100" alt="" height="100">](https://github.com/Pe46dro)
---|---|
[SergiX44](https://github.com/SergiX44) | [Pe46dro](https://github.com/Pe46dro)
