<?php
// Configuración de conexión a la base de datos
$host = 'localhost';          // Dirección del servidor de base de datos
$user = 'root';               // Usuario de la base de datos
$password = '';               // Contraseña (por defecto en XAMPP es vacío)
$database = 'acceso';         // Nombre de la base de datos

// Crear conexión a la base de datos
$conn = new mysqli($host, $user, $password, $database);

// Verificar conexión
if ($conn->connect_error) {
    die(json_encode([
        "success" => false,
        "error" => "Error de conexión a la base de datos: " . $conn->connect_error
    ]));
}

// Consulta para obtener el código
$sql = "SELECT codigo FROM administrador LIMIT 1"; // Cambia si necesitas más lógica para seleccionar el registro

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode([
        "success" => true,
        "codigo" => $row['codigo']
    ]);
} else {
    echo json_encode([
        "success" => false,
        "error" => "No se encontró el código en la base de datos"
    ]);
}

// Cerrar conexión
$conn->close();
?>
