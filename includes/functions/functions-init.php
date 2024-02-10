<?php
/**
 * Importa los archivos que contienen las clases.
 * @param string $dir
 */
function loadClass($dir){
    $files = scandir($dir);
    foreach ($files as $file) {
        if (pathinfo($file, PATHINFO_EXTENSION) === 'php') {
            require_once $dir . $file;
        }
    }
}

require_once PA_PADELAMIGOS_FUNCTIONS_DIR . 'activate.php';
