<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "acceso";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {

    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT telefono_admin FROM administrador WHERE id = 13"; // Asegúrate de ajustar la condición WHERE según tu lógica
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
    echo json_encode($row);
    }
} else {
    echo json_encode(["telefono_admin" => ""]);
}
$conn->close();
?>
