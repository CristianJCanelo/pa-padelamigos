<?php
/**
 * Plugin Name:   Padel Amigos
 * Description:   Todos los elementos necesarios para gestionar las funciones del sitio Padel Amigos
 * Version:       1.0.0
 * Text Domain:   pa-pa-padelamigos
 * Plugin Author: Julian Canelo
 * @package pa-pa-padelamigos
 */

if ( ! defined( 'ABSPATH' ) ) {
    exit; // Exit if accessed directly.
}

/* ------------------------------------ DEFINICIÓN DE VARIABLES ESTÁTICAS -------------------------------------------*/
define( 'PA_PADELAMIGOS_DIR', plugin_dir_path( __FILE__ ) );
define( 'PA_PADELAMIGOS_INCLUDES_DIR', PA_PADELAMIGOS_DIR.'includes/' );
define( 'PA_PADELAMIGOS_JS_DIR', PA_PADELAMIGOS_DIR.'assets/js/' );
define( 'PA_PADELAMIGOS_API_DIR', PA_PADELAMIGOS_INCLUDES_DIR.'api/' );
define( 'PA_PADELAMIGOS_FUNCTIONS_DIR', PA_PADELAMIGOS_INCLUDES_DIR.'functions/' );
define( 'PA_PADELAMIGOS_SOURCES_DIR', PA_PADELAMIGOS_INCLUDES_DIR.'sources/' );
define( 'PA_PADELAMIGOS_TEMPLATES_DIR', PA_PADELAMIGOS_INCLUDES_DIR.'templates/' );
define( 'PA_PADELAMIGOS_SHORTCODES_DIR', PA_PADELAMIGOS_INCLUDES_DIR.'shortcodes/' );
define( 'PA_PADELAMIGOS_PLUGIN_URL', plugin_dir_url( __FILE__ ) );
define( 'PA_PADELAMIGOS_JS_URL', PA_PADELAMIGOS_PLUGIN_URL.'assets/js/' );
define( 'PA_PADELAMIGOS_PLUGIN_FILE', __FILE__ );
define( 'PA_PADELAMIGOS_VERSION', '1.0.0' );

// Se cargan las librerías
require_once(PA_PADELAMIGOS_DIR . 'vendor/autoload.php');

// Se inician las funciones
require_once (PA_PADELAMIGOS_FUNCTIONS_DIR . 'functions-init.php');

// Se cargan los modelos y sus traits
$traits_dir = PA_PADELAMIGOS_INCLUDES_DIR. 'models/traits/';
loadClass($traits_dir);
$models_dir = PA_PADELAMIGOS_INCLUDES_DIR. 'models/';
loadClass($models_dir);

// Registrar la función que se ejecutará cuando el plugin sea activado
register_activation_hook(__FILE__, 'activate_pa_padelamigos');