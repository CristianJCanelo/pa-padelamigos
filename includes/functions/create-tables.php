<?php
function createTables(): void
{
    // Asegurarse de que la función dbDelta esté disponible
    if ( ! function_exists( 'dbDelta' ) ) {
        require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
    }

    // Obtener la ruta completa del archivo SQL
    $sql_file = PA_PADELAMIGOS_SOURCES_DIR . 'tables.sql';

    // Verificar si el archivo existe
    if ( file_exists( $sql_file ) ) {
        // Leer el contenido del archivo SQL
        $sql_content = file_get_contents( $sql_file );

        ob_start(); // Iniciar el búfer de salida para capturar los errores
        // Ejecutar la consulta utilizando dbDelta
        dbDelta( $sql_content );
        $db_delta_output = ob_get_clean(); // Capturar el resultado del búfer y limpiarlo

        // Verificar si hubo errores en dbDelta
        if ( ! empty( $db_delta_output ) ) {
            // Puedes registrar el error en el registro de errores o mostrarlo al administrador
            error_log( 'Error durante la activación del plugin Padel Amigos: ' . $db_delta_output );
            // También puedes notificar al administrador mediante un mensaje en el panel de administración
            add_action( 'admin_notices', function () use ( $db_delta_output ) {
                echo '<div class="error"><p>' . esc_html( 'Error durante la activación del plugin Padel Amigos: ' . $db_delta_output ) . '</p></div>';
            } );
        } else {
            // Puedes imprimir un mensaje o registrar un aviso de éxito si lo deseas
            error_log( 'Tablas de Padel Amigos creadas exitosamente.' );
        }
    } else {
        // Puedes imprimir un mensaje o registrar un aviso de error si el archivo no existe
        error_log( 'Error: El archivo tables.sql no se encuentra.' );
    }
}
