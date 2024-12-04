-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2024 a las 16:39:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `acceso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso_de_user`
--

CREATE TABLE `acceso_de_user` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_acceso` enum('Apertura','cierre') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acceso_de_user`
--

INSERT INTO `acceso_de_user` (`id`, `idUsuario`, `fecha_hora`, `tipo_acceso`) VALUES
(134, 85, '2024-11-27 22:20:31', 'Apertura'),
(135, 86, '2024-11-27 22:20:42', 'Apertura'),
(136, 85, '2024-11-27 22:43:32', 'Apertura'),
(137, 85, '2024-11-27 22:48:59', 'Apertura'),
(138, 85, '2024-11-28 20:45:55', 'Apertura'),
(139, 85, '2024-11-28 20:46:07', 'Apertura'),
(140, 85, '2024-11-28 20:50:45', 'Apertura'),
(141, 85, '2024-11-28 21:08:15', 'Apertura'),
(142, 85, '2024-11-28 21:17:11', 'Apertura'),
(143, 85, '2024-11-28 21:25:18', 'Apertura'),
(144, 85, '2024-11-28 21:25:52', 'Apertura'),
(145, 85, '2024-11-28 21:26:41', 'Apertura'),
(146, 85, '2024-11-28 21:27:26', 'Apertura'),
(147, 85, '2024-11-28 21:28:07', 'Apertura'),
(148, 85, '2024-11-28 21:30:07', 'Apertura'),
(149, 85, '2024-11-28 22:06:57', 'Apertura'),
(150, 86, '2024-11-28 22:33:35', 'Apertura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `telefono_admin` varchar(20) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_expire` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `correo`, `contraseña`, `telefono_admin`, `codigo`, `token`, `token_expire`) VALUES
(13, 'maderadiazdaniela@gmail.com', 'dani*', '573125073881', 2725414, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alarmas`
--

CREATE TABLE `alarmas` (
  `idAlarma` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alarmas`
--

INSERT INTO `alarmas` (`idAlarma`, `fecha_hora`, `descripcion`) VALUES
(64, '2024-11-27 22:12:42', 'Alarma activada'),
(68, '2024-11-27 22:22:11', 'Alarma activada'),
(69, '2024-11-27 22:22:48', 'Alarma activada'),
(70, '2024-11-27 22:23:22', 'Alarma activada'),
(71, '2024-11-27 22:25:48', 'Alarma activada'),
(77, '2024-11-28 21:08:27', 'Alarma activada'),
(78, '2024-11-28 21:08:51', 'Alarma activada'),
(79, '2024-11-28 21:11:33', 'Alarma activada'),
(80, '2024-11-28 21:14:34', 'Alarma activada'),
(81, '2024-11-28 21:17:18', 'Alarma activada'),
(82, '2024-11-28 21:17:51', 'Alarma activada'),
(83, '2024-11-28 21:18:56', 'Alarma activada'),
(84, '2024-11-28 21:20:14', 'Alarma activada'),
(85, '2024-11-28 21:20:29', 'Alarma activada'),
(86, '2024-11-28 21:28:15', 'Alarma activada'),
(87, '2024-11-28 21:31:26', 'Alarma activada'),
(88, '2024-11-28 21:32:03', 'Alarma activada'),
(89, '2024-11-28 21:35:49', 'Alarma activada'),
(90, '2024-11-28 21:36:08', 'Alarma activada'),
(91, '2024-11-28 21:37:36', 'Alarma activada'),
(92, '2024-11-28 21:39:39', 'Alarma activada'),
(93, '2024-11-28 21:40:05', 'Alarma activada'),
(94, '2024-11-28 21:40:37', 'Alarma activada'),
(95, '2024-11-28 21:41:18', 'Alarma activada'),
(96, '2024-11-28 21:42:26', 'Alarma activada'),
(97, '2024-11-28 21:43:27', 'Alarma activada'),
(98, '2024-11-28 21:44:11', 'Alarma activada'),
(99, '2024-11-28 21:45:01', 'Alarma activada'),
(100, '2024-11-28 21:46:45', 'Alarma activada'),
(101, '2024-11-28 21:47:02', 'Alarma activada'),
(102, '2024-11-28 21:47:36', 'Alarma activada'),
(103, '2024-11-28 21:48:39', 'Alarma activada'),
(104, '2024-11-28 21:49:49', 'Alarma activada'),
(105, '2024-11-28 21:50:03', 'Alarma activada'),
(106, '2024-11-28 21:51:24', 'Alarma activada'),
(107, '2024-11-28 21:52:01', 'Alarma activada'),
(108, '2024-11-28 21:52:36', 'Alarma activada'),
(109, '2024-11-28 21:52:50', 'Alarma activada'),
(110, '2024-11-28 21:53:59', 'Alarma activada'),
(111, '2024-11-28 21:54:14', 'Alarma activada'),
(112, '2024-11-28 21:54:59', 'Alarma activada'),
(113, '2024-11-28 21:55:13', 'Alarma activada'),
(114, '2024-11-28 21:56:15', 'Alarma activada'),
(115, '2024-11-28 21:57:05', 'Alarma activada'),
(116, '2024-11-28 21:57:18', 'Alarma activada'),
(117, '2024-11-28 22:04:33', 'Alarma activada'),
(118, '2024-11-28 22:05:14', 'Alarma activada'),
(119, '2024-11-28 22:08:16', 'Alarma activada'),
(120, '2024-11-28 22:11:54', 'Alarma activada'),
(121, '2024-11-28 22:12:53', 'Alarma activada'),
(122, '2024-11-28 22:13:33', 'Alarma activada'),
(123, '2024-11-28 22:14:03', 'Alarma activada'),
(124, '2024-11-28 22:16:00', 'Alarma activada'),
(125, '2024-11-28 22:17:46', 'Alarma activada'),
(126, '2024-11-28 22:18:48', 'Alarma activada'),
(127, '2024-11-28 22:19:05', 'Alarma activada'),
(128, '2024-11-28 22:19:34', 'Alarma activada'),
(129, '2024-11-28 22:20:26', 'Alarma activada'),
(130, '2024-11-28 22:20:43', 'Alarma activada'),
(131, '2024-11-28 22:20:55', 'Alarma activada'),
(132, '2024-11-28 22:21:16', 'Alarma activada'),
(133, '2024-11-28 22:28:29', 'Alarma activada'),
(134, '2024-11-28 22:29:37', 'Alarma activada'),
(135, '2024-11-28 22:30:19', 'Alarma activada'),
(136, '2024-11-28 22:31:17', 'Alarma activada'),
(137, '2024-11-28 22:31:45', 'Alarma activada'),
(138, '2024-11-28 22:32:33', 'Alarma activada'),
(139, '2024-11-28 22:32:52', 'Alarma activada'),
(140, '2024-11-28 22:33:13', 'Alarma activada'),
(141, '2024-11-28 22:33:47', 'Alarma activada'),
(142, '2024-11-28 22:34:18', 'Alarma activada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivo`
--

CREATE TABLE `dispositivo` (
  `idDispositivo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huellas_temporales`
--

CREATE TABLE `huellas_temporales` (
  `id` int(11) NOT NULL,
  `idHuella` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `huella_digital` int(11) NOT NULL DEFAULT 0,
  `cedula` int(20) DEFAULT NULL,
  `celular` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `huella_digital`, `cedula`, `celular`) VALUES
(85, 'marcelo', 10, 123567, 76543),
(86, 'darwin', 11, 123456, 2345678);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso_de_user`
--
ALTER TABLE `acceso_de_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alarmas`
--
ALTER TABLE `alarmas`
  ADD PRIMARY KEY (`idAlarma`);

--
-- Indices de la tabla `dispositivo`
--
ALTER TABLE `dispositivo`
  ADD PRIMARY KEY (`idDispositivo`);

--
-- Indices de la tabla `huellas_temporales`
--
ALTER TABLE `huellas_temporales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso_de_user`
--
ALTER TABLE `acceso_de_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `alarmas`
--
ALTER TABLE `alarmas`
  MODIFY `idAlarma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `dispositivo`
--
ALTER TABLE `dispositivo`
  MODIFY `idDispositivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `huellas_temporales`
--
ALTER TABLE `huellas_temporales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso_de_user`
--
ALTER TABLE `acceso_de_user`
  ADD CONSTRAINT `acceso_de_user_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
