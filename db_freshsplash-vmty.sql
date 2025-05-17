-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2025 a las 01:31:26
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
  `calificacion_id` int(11) DEFAULT NULL,
  `etiqueta_id` int(11) NOT NULL,
  `horario_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `ubicacion_id` int(11) NOT NULL,
  `imagen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `baño`
--

INSERT INTO `baño` (`calificacion_id`, `etiqueta_id`, `horario_id`, `id`, `ubicacion_id`, `imagen_id`) VALUES
(1, 3, 4, 1, 1, 2),
(5, 4, 3, 2, 3, 4),
(3, 1, 1, 3, 2, 1),
(2, 2, 2, 4, 4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `id` int(11) NOT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`id`, `puntuacion`, `comentario`) VALUES
(1, 5, 'excelente servicio y limpieza'),
(2, NULL, 'asco de baño'),
(3, 4, NULL),
(4, 2, 'sin papel'),
(5, 5, 'la raja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_abierto`
--

CREATE TABLE `dias_abierto` (
  `id` int(11) NOT NULL,
  `dia_semana` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `dias_abierto`
--

INSERT INTO `dias_abierto` (`id`, `dia_semana`) VALUES
(1, 'lunes a viernes'),
(2, 'lunes a sabado'),
(3, 'todos los dias');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `etiqueta`
--

INSERT INTO `etiqueta` (`acceso_discapacitado`, `gratuito`, `id`, `precio`, `tipo_sitio_id`) VALUES
(b'0', b'0', 1, 500, 1),
(b'1', b'1', 2, 0, 2),
(b'1', b'1', 3, 0, 3),
(b'0', b'0', 4, 800, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `dias_abierto_id` int(11) DEFAULT NULL,
  `hora_apertura` time(6) DEFAULT NULL,
  `hora_cierre` time(6) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`dias_abierto_id`, `hora_apertura`, `hora_cierre`, `id`) VALUES
(1, '09:00:00.000000', '19:00:00.000000', 1),
(1, '08:00:00.000000', '22:00:00.000000', 2),
(2, '13:00:00.000000', '16:00:00.000000', 3),
(3, '10:00:00.000000', '22:00:00.000000', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `ruta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `ruta`) VALUES
(1, 'https://commons.wikimedia.org/wiki/File:Flag_of_Chile.svg'),
(2, 'https://www.gettyimages.com/photos/cristiano-ronaldo-dos-santos-aveiro'),
(3, ' https://movies.disney.com/cars'),
(4, 'https://commons.wikimedia.org/wiki/File:Flag_of_Brazil.svg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sitio`
--

CREATE TABLE `tipo_sitio` (
  `id` int(11) NOT NULL,
  `nombre_sitio` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipo_sitio`
--

INSERT INTO `tipo_sitio` (`id`, `nombre_sitio`) VALUES
(1, 'tienda'),
(2, 'publico'),
(3, 'bencinera'),
(4, 'restaurante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `comuna` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ruta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `ciudad`, `comuna`, `pais`, `region`, `direccion`, `ruta`) VALUES
(1, 'Santiago', 'Providencia', 'Chile', 'Región Metropolitana de Santiago', 'Avenida Andrés Bello 1234', NULL),
(2, 'Villarrica', 'Villarrica', 'Chile', 'Región de La Araucanía', 'Calle General Körner 789, Villarrica, Región de La Araucanía, Chile.', NULL),
(3, 'Puerto Varas', 'Puerto Varas', 'Chile', 'Región de Los Lagos ', 'Ruta 225 Km 2.5, Puerto Varas, Región de Los Lagos, Chile.', NULL),
(4, 'Viña del Mar', 'Viña del Mar ', 'Chile', 'Región de Valparaíso', 'Avenida San Martín 456, Viña del Mar, Región de Valparaíso, Chile', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `baño`
--
ALTER TABLE `baño`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK76os3m4yegu8kt0upvbdobfn3` (`calificacion_id`),
  ADD KEY `FKclj2f8brwrdciiig2vxicb1gn` (`etiqueta_id`),
  ADD KEY `FKmi2o4mpbk54uq7rsokmr9j9be` (`horario_id`),
  ADD KEY `FKk56wxhx3tr1h98kpda8ph2u7c` (`ubicacion_id`),
  ADD KEY `FKktqbgl8hu7vg9hbov4kr1ye63` (`imagen_id`);

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
  ADD KEY `FKg0fg3xe3ruh83wrff9ywte5iw` (`tipo_sitio_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKc0wjhv8oe64bilimb8oj2y7iu` (`dias_abierto_id`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `dias_abierto`
--
ALTER TABLE `dias_abierto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_sitio`
--
ALTER TABLE `tipo_sitio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `baño`
--
ALTER TABLE `baño`
  ADD CONSTRAINT `FK76os3m4yegu8kt0upvbdobfn3` FOREIGN KEY (`calificacion_id`) REFERENCES `calificacion` (`id`),
  ADD CONSTRAINT `FKclj2f8brwrdciiig2vxicb1gn` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiqueta` (`id`),
  ADD CONSTRAINT `FKk56wxhx3tr1h98kpda8ph2u7c` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`),
  ADD CONSTRAINT `FKktqbgl8hu7vg9hbov4kr1ye63` FOREIGN KEY (`imagen_id`) REFERENCES `imagen` (`id`),
  ADD CONSTRAINT `FKmi2o4mpbk54uq7rsokmr9j9be` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`);

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
