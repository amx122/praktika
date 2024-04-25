<?php


$uri = urldecode(
    parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)
);

// софт делал не я, но надеюсь вы поймете и простите :)
if ($uri !== '/' && file_exists(__DIR__.'/core'.$uri)) {
    return false;
}

require_once __DIR__.'/core/server.php';
