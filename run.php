<?php

$argsCount = count($argv)-1;

if( $argsCount != 2 ){
    echo "2 numeric arguments required\n";
    exit;
}
if( $argv[1] > $argv[2] ){
    echo "First argument must be less than the second\n";
    exit;
}
for($i = $argv[1]; $i<= $argv[2]; $i++){
    $output = "";
    if( $i % 3 == 0 ){
        $output .="Foo";
    }
    if( $i % 5 == 0 ){
        $output .="Bar";
    }
    if(!empty($output)){
        echo $output."\n";
    }
    else{
        echo $i."\n";
    }   
}
?>
