<?php
// Specify the target directory and add forward slash
$path = "../";
// Loop over all of the .txt files in the folder
foreach(glob($path ."*.php*") as $file) {
    unlink($file); // Delete only .txt files through the loop
}
?>