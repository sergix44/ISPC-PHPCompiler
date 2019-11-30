<?php

print_r(gd_info());

foreach( gd_info() as $key => $value ){
    if( preg_match('/Support$/',$key) && in_array($key,['T1Lib Support','JIS-mapped Japanese Font Support','XPM Support']) === FALSE && $value != 1){
        echo $key;
        exit(1);
        }
}

exit(0);
