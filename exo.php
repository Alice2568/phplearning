<?php 
$myVar = "";
$fp = fopen("essai.txt", "a");
fputs($fp, $myVar);
fclose($fp);
?>