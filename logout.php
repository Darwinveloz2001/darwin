<?php
// logout.php: Cierra la sesión del usuario

session_start(); // Inicia la sesión actual

// Limpia las variables de sesión
session_unset(); 

// Destruye la sesión completamente
session_destroy();

// Redirige al login (verifica que index.php sea la ruta correcta)
header("Location: index.php");
exit(); // Finaliza el script para asegurarte de que no se ejecute código adicional
