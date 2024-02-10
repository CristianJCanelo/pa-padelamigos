<?php
// Función para crear las tablas en la activación del plugin
function activate_pa_padelamigos() {
    require_once(PA_PADELAMIGOS_FUNCTIONS_DIR . 'create-tables.php');
    createTables();
}