<?php

$argsCount = count($argv)-1;

if( $argsCount != 2 || !(is_numeric($argv[1]) && (int)$argv[1]==$argv[1]) || !(is_numeric($argv[2]) && (int)$argv[2]==$argv[2])){
    echo "2 integer arguments required\n";
    exit;
}
if( $argv[1] > $argv[2] ){
    echo "First argument must be less than the second or equal\n";
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
