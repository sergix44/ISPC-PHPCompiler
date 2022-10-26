# 🚀 The PHP Compiler Script ![.github/workflows/compile-tests.yml](https://github.com/SergiX44/ISPC-PHPCompiler/workflows/.github/workflows/compile-tests.yml/badge.svg)

This script will help you to manage different PHP version for your webserver (especially made for ISPConfig installations). 
This supports **auto compiling and auto configure feature** with a **very high optimization level** (`-O3` `-march=native` `-mtune=native` flags) for PHP >= 5.6. See the versions.sh file to see them.

At every launch a new version of the `versions.sh` file is imported from this repository, it **ensure always up to date links and builds**.

# How to use
Just run this command in your shell to download and run the script, and then just follow the instruction on your screen:
```bash
wget https://raw.githubusercontent.com/SergiX44/ISPC-PHPCompiler/bash-version/php-compiler.sh; chmod +x php-compiler.sh; bash php-compiler.sh
```
# Currently supported platforms
| OS \ PHP     	| 5.6 	| 7.0 	| 7.1 	| 7.2 	| 7.3 	| 7.4 	| 8.0 	| 8.1  | 8.2 RC  |
|--------------	|-----	|-----	|-----	|-----	|-----	|-----	|-----	|-----	|-----	|
| Debian 9     	|     	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	|
| Debian 10    	|     	|     	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	|
| Debian 11    	|     	|     	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	|
| Centos 7     	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	|
| Ubuntu 18.04 	|     	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	|
| Ubuntu 20.04 	|     	|     	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	|
| Ubuntu 22.04 * 	|     	|     	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	| ✔️   	|

(*) on Ubuntu 22.x PHP <= 8.0 only without OpenSSL

# EOL
The script should also work on:
 - Ubuntu 14.04
 - Ubuntu 16.04
 - Ubuntu 17.04
 - Ubuntu 17.10
 - Devuan 1
 - Devuan 2
 - Devuan 3
 - Debian 8
 - CentOS 8

But these platforms are no longer tested.

# Contributors
[<img src="https://www.gravatar.com/avatar/98b8d56f4a193e3f7154f236c16930b2?s=100" alt="" height="100">](https://github.com/SergiX44) | [<img src="https://www.gravatar.com/avatar/35923b3b04e23bef801553656b606bfag?s=100" alt="" height="100">](https://github.com/Pe46dro)
---|---|
[SergiX44](https://github.com/SergiX44) | [Pe46dro](https://github.com/Pe46dro)
