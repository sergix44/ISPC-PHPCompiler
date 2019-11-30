<?php

print_r(gd_info());

foreach( gd_info() as $key => $value ){
    if( preg_match('/Support$/',$key) && $key != 'JIS-mapped Japanese Font Support' && $value != 1){
        echo $key;
        exit(1);
        }
}

exit(0);
