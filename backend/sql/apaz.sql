-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2019 a las 22:25:10
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apaz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL,
  `nombre_caracteristica` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caracteristicas`
--

INSERT INTO `caracteristicas` (`id`, `nombre_caracteristica`) VALUES
(1, 'grande'),
(2, 'pequeña'),
(3, 'mediana'),
(4, 'cachorro'),
(5, 'adulta'),
(6, 'sociable'),
(7, 'peluda'),
(8, 'poco peluda'),
(9, 'ruidosa'),
(10, 'tranquila'),
(11, 'perro'),
(12, 'gato'),
(13, 'conejo'),
(14, 'pajaro'),
(15, 'asd'),
(16, ''),
(17, 'princeso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas_mascota`
--

CREATE TABLE `caracteristicas_mascota` (
  `id` int(11) NOT NULL,
  `id_caracteristica` int(11) NOT NULL,
  `id_mascota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caracteristicas_mascota`
--

INSERT INTO `caracteristicas_mascota` (`id`, `id_caracteristica`, `id_mascota`) VALUES
(4, 5, 7),
(5, 17, 7),
(6, 17, 9),
(7, 3, 10),
(8, 10, 10),
(22, 12, 30),
(23, 8, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_mascota`
--

CREATE TABLE `estados_mascota` (
  `id` int(11) NOT NULL,
  `nombre_estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados_mascota`
--

INSERT INTO `estados_mascota` (`id`, `nombre_estado`) VALUES
(1, 'adoptada'),
(2, 'acogida'),
(3, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `fecha_nacimiento` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_estado` int(11) NOT NULL,
  `chip` int(15) DEFAULT NULL,
  `genero` tinyint(1) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `nombre`, `fecha_nacimiento`, `fecha_registro`, `id_estado`, `chip`, `genero`, `imagen`, `descripcion`) VALUES
(2, 'Perro 1', NULL, '2019-05-11 19:44:32', 3, NULL, 1, 'a', 'asd'),
(3, 'Gato 2', NULL, '2019-05-11 19:44:32', 3, NULL, 0, 'a', 'a'),
(7, 'perro 4', 1557180000, '2019-05-12 18:41:16', 3, NULL, 0, 'perrete.jpg', NULL),
(8, 'asd', 1557180000, '2019-05-12 18:43:58', 3, NULL, 0, 'perrete.jpg', NULL),
(9, 'Max', 1557266400, '2019-05-12 19:14:16', 3, NULL, 1, 'perrete.jpg', '<p>Max es un perro de <strong>súper puta madre socio</strong></p>'),
(10, 'el gato loco', 1557093600, '2019-05-12 19:21:36', 2, NULL, 1, 'perrete.jpg', '<p>asdad</p>'),
(24, 'xdddddddddddddddddddddddddddddd', 1557093600, '2019-05-12 19:30:38', 2, NULL, 0, 'perrete.jpg', '<p>asd</p>'),
(30, 'ojooo', 1557180000, '2019-05-19 10:59:40', 2, 2147483647, 0, 'semana-7.pdf', '<p>Lolazo el ojo</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas_acogidas`
--

CREATE TABLE `mascotas_acogidas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_mascota` int(11) NOT NULL,
  `fecha_acogida` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mascotas_acogidas`
--

INSERT INTO `mascotas_acogidas` (`id`, `id_usuario`, `id_mascota`, `fecha_acogida`) VALUES
(1, 3, 3, '2019-05-19 16:37:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas_adoptadas`
--

CREATE TABLE `mascotas_adoptadas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_mascota` int(11) NOT NULL,
  `fecha_adopcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mascotas_adoptadas`
--

INSERT INTO `mascotas_adoptadas` (`id`, `id_usuario`, `id_mascota`, `fecha_adopcion`) VALUES
(7, 3, 2, '2019-05-19 19:58:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias`
--

CREATE TABLE `preferencias` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_caracteristica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preferencias`
--

INSERT INTO `preferencias` (`id`, `id_usuario`, `id_caracteristica`) VALUES
(6, 3, 2),
(7, 3, 4),
(14, 7, 1),
(15, 7, 3),
(16, 8, 3),
(17, 8, 13),
(18, 8, 5),
(19, 9, 2),
(20, 9, 4),
(21, 11, 2),
(22, 13, 14),
(23, 14, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id_provincia` int(2) NOT NULL,
  `provincia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id_provincia`, `provincia`) VALUES
(1, 'Álava'),
(2, 'Albacete'),
(3, 'Alicante'),
(4, 'Almería'),
(5, 'Ávila'),
(6, 'Badajoz'),
(7, 'Baleares (Illes)'),
(8, 'Barcelona'),
(9, 'Burgos'),
(10, 'Cáceres'),
(11, 'Cádiz'),
(12, 'Castellón'),
(13, 'Ciudad Real'),
(14, 'Córdoba'),
(15, 'A Coruña'),
(16, 'Cuenca'),
(17, 'Girona'),
(18, 'Granada'),
(19, 'Guadalajara'),
(20, 'Guipúzcoa'),
(21, 'Huelva'),
(22, 'Huesca'),
(23, 'Jaén'),
(24, 'León'),
(25, 'Lleida'),
(26, 'La Rioja'),
(27, 'Lugo'),
(28, 'Madrid'),
(29, 'Málaga'),
(30, 'Murcia'),
(31, 'Navarra'),
(32, 'Ourense'),
(33, 'Asturias'),
(34, 'Palencia'),
(35, 'Las Palmas'),
(36, 'Pontevedra'),
(37, 'Salamanca'),
(38, 'Santa Cruz de Tenerife'),
(39, 'Cantabria'),
(40, 'Segovia'),
(41, 'Sevilla'),
(42, 'Soria'),
(43, 'Tarragona'),
(44, 'Teruel'),
(45, 'Toledo'),
(46, 'Valencia'),
(47, 'Valladolid'),
(48, 'Vizcaya'),
(49, 'Zamora'),
(50, 'Zaragoza'),
(51, 'Ceuta'),
(52, 'Melilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuario`
--

CREATE TABLE `tipos_usuario` (
  `id` int(11) NOT NULL,
  `nombre_tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_usuario`
--

INSERT INTO `tipos_usuario` (`id`, `nombre_tipo`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_vivienda`
--

CREATE TABLE `tipos_vivienda` (
  `id_vivienda` int(11) NOT NULL,
  `nombre_vivienda` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_vivienda`
--

INSERT INTO `tipos_vivienda` (`id_vivienda`, `nombre_vivienda`) VALUES
(1, 'Vivienda Aislada'),
(2, 'Vivienda Pareada'),
(3, 'Vivienda Adosada'),
(4, 'Apartamento'),
(5, 'Estudio'),
(6, 'Dúplex'),
(7, 'Ático'),
(8, 'Piso'),
(9, 'Bajo con jardín');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `telefono` int(9) DEFAULT NULL,
  `direccion` varchar(500) NOT NULL,
  `fecha_nacimiento` int(11) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `id_provincia` int(2) NOT NULL,
  `direccion2` varchar(255) NOT NULL,
  `id_tipo_vivienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `dni`, `email`, `password`, `nombre`, `apellidos`, `telefono`, `direccion`, `fecha_nacimiento`, `id_tipo_usuario`, `id_provincia`, `direccion2`, `id_tipo_vivienda`) VALUES
(3, '4545421M', 'jorge@jorge.com', '$2b$10$d5MVvZVLSQvXE5PQGO9RF.p1KZmJBoj2U0ANOpDTXJlDS4cux1/Au', 'Jorge', 'Ojeda', 666111222, 'asdasd', 1557957600, 2, 8, 'asdasd', 4),
(7, '444411122', 'lolazo@lolazo.com', '$2b$10$ZubmYOuKpcf.IZdUG91FHeZSv8PIO0PL14hwCtHnnFE4RyQyQlgLa', 'asdasd', 'aasdasd', 123123123, 'asdasd', 1558044000, 2, 21, 'asdasd', 3),
(8, '45454512M', 'lala@lala.com', '$2b$10$fmYtd05e3z.QdVtBp7kbIeX6aGFLy9kj4fYek8Nds5ucFAwmDkbFm', 'Jorge', 'Ojeda', 777888999, '123', 1556748000, 2, 5, '123', 4),
(9, '444222111', 'asd@asd.com', '$2b$10$8WtzjdPl1DFp/ilMUrVomO0o97ByExQP16qCIiA/jP5pAUrwpeCii', 'jorge', 'ojeda', 666111222, 'asd', 1557352800, 2, 48, 'asd', 4),
(11, '45945472A', 'admin@admin.com', '$2b$10$B8E2nYdT0YIHdGK2SDLOh.yLCV4ko1mTn9yduK6iqInzAHzDNqfIG', 'admin', 'admin', 666666666, 'asd', 1557180000, 1, 19, 'asd', 3),
(12, '123123123', 'asd@xd.com', '$2b$10$t/nrBJIZGu6b/Y5dQbWWuuznw/w6h/yhQt//vKEnlk2PMWutBsH6K', 'xd', 'xd', 666999888, 'asd', 1556748000, 2, 20, 'asd', 3),
(13, '45945472M', 'lolazo@hotmail.com', '$2b$10$isZ5L3QAn2ExBhuqJRG75.ithgl19.zBiyHiZwjzqdlQIulDS8rWe', 'Pedrito', 'Lolazo', 666777888, 'dasd', 1556661600, 2, 22, 'asd', 2),
(14, '444222111', 'zzz@aaa.com', '$2b$10$oNMFMClAEUVxB3Fto3yMK.5v0byyJE538nLJy8WBNcVPRhtifrNb6', 'zzzzzzzzzzzzzzzzzzzzzz', 'zzzzzzzzzzzzzzz', 123123123, 'asd', 1557266400, 2, 22, 'asd', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caracteristicas_mascota`
--
ALTER TABLE `caracteristicas_mascota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caracteristicas_mascota_fk1` (`id_caracteristica`),
  ADD KEY `caracteristicas_mascota_fk2` (`id_mascota`);

--
-- Indices de la tabla `estados_mascota`
--
ALTER TABLE `estados_mascota`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_fk1` (`id_estado`);

--
-- Indices de la tabla `mascotas_acogidas`
--
ALTER TABLE `mascotas_acogidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_acogidas_fk1` (`id_mascota`),
  ADD KEY `mascotas_acogidas_fk2` (`id_usuario`);

--
-- Indices de la tabla `mascotas_adoptadas`
--
ALTER TABLE `mascotas_adoptadas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascotas_adoptadas_fk1` (`id_mascota`),
  ADD KEY `mascotas_adoptadas_fk2` (`id_usuario`);

--
-- Indices de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preferencias_fk1` (`id_caracteristica`),
  ADD KEY `preferencias_fk2` (`id_usuario`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id_provincia`);

--
-- Indices de la tabla `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_vivienda`
--
ALTER TABLE `tipos_vivienda`
  ADD PRIMARY KEY (`id_vivienda`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuario_fk1` (`id_tipo_usuario`),
  ADD KEY `usuario_fk2` (`id_provincia`),
  ADD KEY `usuario_fk3` (`id_tipo_vivienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `caracteristicas_mascota`
--
ALTER TABLE `caracteristicas_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `estados_mascota`
--
ALTER TABLE `estados_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `mascotas_acogidas`
--
ALTER TABLE `mascotas_acogidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mascotas_adoptadas`
--
ALTER TABLE `mascotas_adoptadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id_provincia` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_vivienda`
--
ALTER TABLE `tipos_vivienda`
  MODIFY `id_vivienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caracteristicas_mascota`
--
ALTER TABLE `caracteristicas_mascota`
  ADD CONSTRAINT `caracteristicas_mascota_fk1` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `caracteristicas_mascota_fk2` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_fk1` FOREIGN KEY (`id_estado`) REFERENCES `estados_mascota` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascotas_acogidas`
--
ALTER TABLE `mascotas_acogidas`
  ADD CONSTRAINT `mascotas_acogidas_fk1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mascotas_acogidas_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascotas_adoptadas`
--
ALTER TABLE `mascotas_adoptadas`
  ADD CONSTRAINT `mascotas_adoptadas_fk1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mascotas_adoptadas_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `preferencias_fk1` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preferencias_fk2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_fk1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipos_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_fk2` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_fk3` FOREIGN KEY (`id_tipo_vivienda`) REFERENCES `tipos_vivienda` (`id_vivienda`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
