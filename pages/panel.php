<?php


// Conexión a la base de datos
$servername = "localhost";
$database = "acceso";
$username = "root";
$password = "";

$conexion = mysqli_connect($servername, $username, $password, $database);
if ($conexion->connect_errno) {
    die("Conexión fallida: " . $conexion->connect_errno);
}

// Obtener datos de la base de datos
$datosBarras = [];
$datosCirculares = [];
$nombreMasIngresos = '';
$fechaMasIngresos = '';

// Obtener la cantidad de aperturas por día en el mes actual
$mesActual = date('Y-m');
$queryDiarias = "SELECT DATE(fecha_hora) as fecha, COUNT(*) as cantidad FROM acceso_de_user WHERE tipo_acceso='Apertura' AND DATE_FORMAT(fecha_hora, '%Y-%m') = '$mesActual' GROUP BY DATE(fecha_hora)";
$resultadoDiarias = mysqli_query($conexion, $queryDiarias);
while ($fila = mysqli_fetch_assoc($resultadoDiarias)) {
    $datosBarras[] = ['fecha' => $fila['fecha'], 'cantidad' => $fila['cantidad']];
}

// Obtener la cantidad de aperturas en el mes actual
$queryMensuales = "SELECT COUNT(*) as cantidad FROM acceso_de_user WHERE tipo_acceso='Apertura' AND DATE_FORMAT(fecha_hora, '%Y-%m') = '$mesActual'";
$resultadoMensuales = mysqli_query($conexion, $queryMensuales);
if ($fila = mysqli_fetch_assoc($resultadoMensuales)) {
    $datosCirculares[] = $fila['cantidad'];
}

// Obtener el nombre de la persona que más ingresa
$queryMasIngresos = "SELECT u.nombre, COUNT(a.id) as cantidad FROM acceso_de_user a INNER JOIN usuarios u ON a.idUsuario = u.idUsuario WHERE a.tipo_acceso='Apertura' GROUP BY a.idUsuario ORDER BY cantidad DESC LIMIT 1";
$resultadoMasIngresos = mysqli_query($conexion, $queryMasIngresos);
if ($fila = mysqli_fetch_assoc($resultadoMasIngresos)) {
    $nombreMasIngresos = $fila['nombre'];
}

// Obtener la fecha con más ingresos
$queryFechaMasIngresos = "SELECT DATE(fecha_hora) as fecha, COUNT(*) as cantidad FROM acceso_de_user WHERE tipo_acceso='Apertura' GROUP BY DATE(fecha_hora) ORDER BY cantidad DESC LIMIT 1";
$resultadoFechaMasIngresos = mysqli_query($conexion, $queryFechaMasIngresos);
if ($fila = mysqli_fetch_assoc($resultadoFechaMasIngresos)) {
    $fechaMasIngresos = $fila['fecha'];
}

mysqli_close($conexion);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administrador</title>
    <?php require_once('../container/Link.php') ?>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .chart-container {
            width: 300px;
            height: 200px;
            margin: auto;
        }
    </style>
</head>

<body class="bg-gray-100 pt-24">
    <?php require_once('../container/Navar.php') ?>
    <div>
        <div class="container mx-auto grid grid-cols-1 md:grid-cols-2 gap-4">
            <div class="md:w-2/6 mx-auto mt-10 relative -right-60">
                <div class="p-5 bg-blue-200 shadow-lg rounded-lg border border-gray-200">
                    <h2 class="text-1xl font-semibold mb-2">Persona con más ingresos</h2>
                    <p class="text-lg"><?php echo $nombreMasIngresos; ?></p>
                </div>
            </div>

            <div class="md:w-2/6 mx-auto mt-10">
                <div class="p-5 bg-pink-200 shadow-lg rounded-lg border border-gray-200">
                    <h2 class="text-1xl font-semibold mb-2">Fecha con más ingresos</h2>
                    <p class="text-lg"><?php echo $fechaMasIngresos; ?></p>
                </div>
            </div>
        </div>
    </div>
    <div class="mx-auto mt-10 grid grid-cols-1 md:grid-cols-2 gap-0">
        <div class="col-span-1 relative">
            <div class="chart-container">
                <canvas id="barChartDiario"></canvas>
            </div>
        </div>

        <div class="col-span-1">
            <div class="chart-container">
                <canvas id="barChartMensual"></canvas>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Configurar datos para el gráfico de barras diarias
            var datosBarrasDiarias = <?php echo json_encode($datosBarras); ?>;
            var etiquetasBarrasDiarias = datosBarrasDiarias.map(item => item.fecha);
            var cantidadesBarrasDiarias = datosBarrasDiarias.map(item => item.cantidad);

            // Configurar datos para el gráfico de barras mensuales
            var datosMensuales = <?php echo json_encode($datosCirculares); ?>;
            var etiquetasBarrasMensuales = ['Aperturas Mensuales'];
            var cantidadesBarrasMensuales = datosMensuales;

            // Configurar y dibujar el gráfico de barras diarias
            var ctxBarDiario = document.getElementById('barChartDiario').getContext('2d');
            var barChartDiario = new Chart(ctxBarDiario, {
                type: 'bar',
                data: {
                    labels: etiquetasBarrasDiarias,
                    datasets: [{
                        label: 'Aperturas por Día',
                        data: cantidadesBarrasDiarias,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Cantidad de Aperturas'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Fecha'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    }
                }
            });

            // Configurar y dibujar el gráfico de barras mensuales
            var ctxBarMensual = document.getElementById('barChartMensual').getContext('2d');
            var barChartMensual = new Chart(ctxBarMensual, {
                type: 'bar',
                data: {
                    labels: etiquetasBarrasMensuales,
                    datasets: [{
                        label: 'Aperturas en el Mes Actual',
                        data: cantidadesBarrasMensuales,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Cantidad de Aperturas'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Resumen Mensual'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    }
                }
            });
        });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
</body>

</html>