<?php

$modules = [
    'bcmath',
    'bz2',
    'calendar',
    'Core',
    'ctype',
    'curl',
    'date',
    'dom',
    'exif',
    'fileinfo',
    'filter',
    'ftp',
    'gd',
    'gettext',
    'hash',
    'iconv',
    'imap',
    'intl',
    'json',
    'libxml',
    'mbstring',
    'mysqli',
    'mysqlnd',
    'openssl',
    'pcntl',
    'pcre',
    'PDO',
    'pdo_mysql',
    'pdo_pgsql',
    'pdo_sqlite',
    'pgsql',
    'Phar',
    'posix',
    'Reflection',
    'session',
    'SimpleXML',
    'soap',
    'sockets',
    'SPL',
    'sqlite3',
    'standard',
    'sysvsem',
    'sysvshm',
    'tokenizer',
    'xml',
    'xmlreader',
    'xmlrpc',
    'xmlwriter',
    'xsl',
    'Zend OPcache',
    'zip',
    'zlib',
];

$e = 0;

foreach($modules as $module){
    if(!extension_loaded ( $module )){
        echo $module.' not loaded';
        $e = 1;
    }
}

exit($e);
