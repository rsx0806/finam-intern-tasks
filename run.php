<?php

$argsCount = count($argv)-1;

if( $argsCount != 2 ){
    echo "2 arguments required\n";
    exit;
}
elseif( $argv[1] > $argv[2] ){
    echo "First argument must be less than the second\n";
    exit;
}
else{
    for($i = $argv[1]; $i<= $argv[2]; $i++){
        if( ($i % 3 == 0) && ($i % 5 == 0)){
            echo "FooBar\n";
        }
        elseif(($i % 3 == 0) && ($i % 5 != 0)){
            echo "Foo\n";
        }
        elseif(($i % 3 != 0) && ($i % 5 == 0)){
            echo "Bar\n";
        }else{
            echo $i."\n";
        }
    }
}

?>
