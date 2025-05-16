-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2025 a las 01:16:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_freshsplash`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `baño`
--

CREATE TABLE `baño` (
  `calificacion_id` int(11) NOT NULL,
  `etiqueta_id` int(11) NOT NULL,
  `horario_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `ubicacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `baño`
--

INSERT INTO `baño` (`calificacion_id`, `etiqueta_id`, `horario_id`, `id`, `ubicacion_id`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `id` int(11) NOT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`id`, `puntuacion`, `comentario`) VALUES
(1, 3, 'Baño decente pero las puertas no funcionan correctamente'),
(2, 4, 'Buena higiene pero tiene pequeños orificios en las murallas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_abierto`
--

CREATE TABLE `dias_abierto` (
  `id` int(11) NOT NULL,
  `dia_semana` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dias_abierto`
--

INSERT INTO `dias_abierto` (`id`, `dia_semana`) VALUES
(1, 'Lunes a Do'),
(2, 'Lunes a Sa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE `etiqueta` (
  `acceso_discapacitado` bit(1) NOT NULL,
  `gratuito` bit(1) NOT NULL,
  `id` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `tipo_sitio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `etiqueta`
--

INSERT INTO `etiqueta` (`acceso_discapacitado`, `gratuito`, `id`, `precio`, `tipo_sitio_id`) VALUES
(b'1', b'1', 1, 0, 1),
(b'0', b'0', 2, 500, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `dias_abierto_id` int(11) DEFAULT NULL,
  `hora_apertura` time(6) DEFAULT NULL,
  `hora_cierre` time(6) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`dias_abierto_id`, `hora_apertura`, `hora_cierre`, `id`) VALUES
(1, '08:00:00.000000', '22:00:00.000000', 1),
(2, '00:00:00.000000', '23:59:59.000000', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sitio`
--

CREATE TABLE `tipo_sitio` (
  `id` int(11) NOT NULL,
  `nombre_sitio` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_sitio`
--

INSERT INTO `tipo_sitio` (`id`, `nombre_sitio`) VALUES
(1, 'Baño Publico'),
(2, 'Baño Privado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `comuna` varchar(20) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `region` varchar(20) NOT NULL,
  `ruta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `ciudad`, `comuna`, `direccion`, `pais`, `region`, `ruta`) VALUES
(1, 'Santiago', 'Maipu', 'Mall Arauco Maipu', 'Chile', 'Region Metropolitana', 'https://parquearauco.modyocdn.com/uploads/88ef8c0e-f160-4148-a82b-c455b571c1a5/original/parque_arauco_maipu.jpg'),
(2, 'Santiago', 'Cerrillos', 'Duoc Plaza Oeste', 'Chile', 'Region Metropolitana', 'https://i0.wp.com/tuprimerpaso.duoc.cl/wp-content/uploads/2024/07/PLAZA-oeste.jpg?fit=1600%2C987&ssl=1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `baño`
--
ALTER TABLE `baño`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqtgax6e6prfsavkilut7w8tmk` (`calificacion_id`),
  ADD KEY `FKf6qcs2afamwep5aaldjnmgvhr` (`etiqueta_id`),
  ADD KEY `FKgho8sv7h6kchvikyl7i27qhn7` (`horario_id`),
  ADD KEY `FKlwgx6uh7neicj1nf17r4r9vks` (`ubicacion_id`);

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dias_abierto`
--
ALTER TABLE `dias_abierto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKh3u81r7nt2suw52h51igdy3aw` (`tipo_sitio_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKc0wjhv8oe64bilimb8oj2y7iu` (`dias_abierto_id`);

--
-- Indices de la tabla `tipo_sitio`
--
ALTER TABLE `tipo_sitio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `baño`
--
ALTER TABLE `baño`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `dias_abierto`
--
ALTER TABLE `dias_abierto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_sitio`
--
ALTER TABLE `tipo_sitio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `baño`
--
ALTER TABLE `baño`
  ADD CONSTRAINT `FKf6qcs2afamwep5aaldjnmgvhr` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiqueta` (`id`),
  ADD CONSTRAINT `FKgho8sv7h6kchvikyl7i27qhn7` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`),
  ADD CONSTRAINT `FKlwgx6uh7neicj1nf17r4r9vks` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`),
  ADD CONSTRAINT `FKqtgax6e6prfsavkilut7w8tmk` FOREIGN KEY (`calificacion_id`) REFERENCES `calificacion` (`id`);

--
-- Filtros para la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD CONSTRAINT `FKg0fg3xe3ruh83wrff9ywte5iw` FOREIGN KEY (`tipo_sitio_id`) REFERENCES `tipo_sitio` (`id`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `FKc0wjhv8oe64bilimb8oj2y7iu` FOREIGN KEY (`dias_abierto_id`) REFERENCES `dias_abierto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
