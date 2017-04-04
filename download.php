<?php

$file = $_GET['file'];
$dir = '';

if(isset($_GET['file']) && file_exists($dir . $file)) {
    $finfo = new finfo(FILEINFO_MIME_TYPE);
    $type = $finfo->file($file); // get MIME-Type
    header("Content-Type: " . $type);
    header("Content-Disposition: attachment; filename=\"" . $file . "\"");
    readfile($dir . $file);
}
