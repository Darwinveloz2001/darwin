<?php
require_once('../config/db.php');

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    // Validación de los datos recibidos
    if (
        isset($data['idAdmin'], $data['correo'], $data['contraseña'], $data['telefono'], $data['codigo']) &&
        !empty($data['idAdmin']) &&
        !empty($data['correo']) &&
        !empty($data['contraseña']) &&
        !empty($data['telefono']) &&
        !empty($data['codigo'])
    ) {
        $id = intval($data['idAdmin']);
        $correo = trim($data['correo']);
        $contraseña = trim($data['contraseña']);
        $telefono = trim($data['telefono']);
        $codigo = trim($data['codigo']);

        // Preparar la consulta
        $stmt = $conexion->prepare("UPDATE administrador SET correo = ?, contraseña = ?, telefono_admin = ?, codigo = ? WHERE id = ?");
        if ($stmt) {
            $stmt->bind_param('ssssi', $correo, $contraseña, $telefono, $codigo, $id);

            if ($stmt->execute()) {
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'message' => 'Error al ejecutar la consulta: ' . $stmt->error]);
            }
            $stmt->close();
        } else {
            echo json_encode(['success' => false, 'message' => 'Error al preparar la consulta: ' . $conexion->error]);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Datos incompletos o inválidos']);
    }
    $conexion->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Método no permitido']);
}