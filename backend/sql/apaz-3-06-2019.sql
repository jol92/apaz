-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2019 a las 13:07:29
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
(18, 'asd'),
(19, 'Pequeño'),
(20, 'Caracteristica'),
(21, 'Caracteristica Prueba'),
(22, 'PPP');

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
(25, 19, 60),
(26, 22, 61),
(27, 21, 61),
(28, 19, 63),
(29, 19, 64);

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
  `descripcion` text,
  `raza` varchar(200) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `nombre`, `fecha_nacimiento`, `fecha_registro`, `id_estado`, `chip`, `genero`, `imagen`, `descripcion`, `raza`, `id_tipo`) VALUES
(60, 'Toby', 1559599200, '2019-06-03 09:32:20', 2, NULL, 0, '1559554340352-WhatsApp Image 2019-04-30 at 19.39.28(1).jpeg', '<p>Toby es un perro <strong>amistoso </strong>y <strong>amable</strong></p><p><strong style=\"background-color: rgb(255, 255, 102);\">Necesitamos que alguien le acoja urgentemente</strong></p>', 'Cruce de labrador', 1),
(61, 'Tyreon', 1559599200, '2019-06-03 09:33:58', 3, NULL, 1, '1559554438116-WhatsApp Image 2019-04-30 at 19.39.28.jpeg', '<p>Tyreon macho mix de burterrier, castrado, de 1 año de edad, <strong style=\"background-color: rgb(255, 255, 0);\">testado con perros y gatos</strong>, muy bueno pero nervioso, <strong style=\"color: rgb(255, 255, 0);\">está adiestrado</strong>. Está en residencia.</p>', 'Cruce de doberman', 1),
(62, 'Mascotita', 1560204000, '2019-06-03 09:38:51', 3, NULL, 0, '1559554731926-WhatsApp Image 2019-04-30 at 19.42.00.jpeg', '<p>Mascotita es un perro blablabla</p><p><strong style=\"background-color: rgb(255, 255, 0);\">Salto de línea</strong></p><blockquote>Cita</blockquote>', 'Mix de pastor aleman', 1),
(63, 'Gato', 1560290400, '2019-06-03 10:52:05', 3, NULL, 0, '1559559125263-el-gato-necesita-tener-acceso-al-exterior.jpg', '<p>xzczxczxczxcz</p>', '', 2),
(64, 'GatoViejo', 1265756400, '2019-06-03 11:06:38', 3, NULL, 0, '1559559998426-WhatsApp Image 2019-04-30 at 19.48.46.jpeg', '<blockquote>Gato con más edad para ver si sale bien el moment locale blabla</blockquote>', 'Siamés', 2);

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
(12, 3, 60, '2019-06-03 09:42:16');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias`
--

CREATE TABLE `preferencias` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_caracteristica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estructura de tabla para la tabla `tipos_mascota`
--

CREATE TABLE `tipos_mascota` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_mascota`
--

INSERT INTO `tipos_mascota` (`id`, `nombre`) VALUES
(1, 'Perro'),
(2, 'Gato'),
(3, 'Otro');

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
(9, '444222111', 'asd@asd.com', '$2b$10$8WtzjdPl1DFp/ilMUrVomO0o97ByExQP16qCIiA/jP5pAUrwpeCii', 'cxcxc', 'El', 666111222, 'asd', 1557352800, 2, 48, 'asd', 4),
(11, '45945472A', 'admin@admin.com', '$2b$10$B8E2nYdT0YIHdGK2SDLOh.yLCV4ko1mTn9yduK6iqInzAHzDNqfIG', 'admin', 'admin', 666666666, 'asd', 1557180000, 1, 19, 'asd', 3),
(12, '123123123', 'asd@xd.com', '$2b$10$t/nrBJIZGu6b/Y5dQbWWuuznw/w6h/yhQt//vKEnlk2PMWutBsH6K', 'xd', 'xd', 666999888, 'asd', 1556748000, 2, 20, 'asd', 3),
(13, '45945472M', 'mail@mail.com', '$2b$10$isZ5L3QAn2ExBhuqJRG75.ithgl19.zBiyHiZwjzqdlQIulDS8rWe', 'usuario', 'erm', 666777888, 'dasd', 1556661600, 2, 22, 'asd', 2),
(14, '444222111', 'zzz@aaa.com', '$2b$10$oNMFMClAEUVxB3Fto3yMK.5v0byyJE538nLJy8WBNcVPRhtifrNb6', 'User', 'zzzzzzzzzzzzzzz', 123123123, 'asd', 1557266400, 2, 22, 'asd', 2);

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
-- Indices de la tabla `tipos_mascota`
--
ALTER TABLE `tipos_mascota`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `caracteristicas_mascota`
--
ALTER TABLE `caracteristicas_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `estados_mascota`
--
ALTER TABLE `estados_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `mascotas_acogidas`
--
ALTER TABLE `mascotas_acogidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mascotas_adoptadas`
--
ALTER TABLE `mascotas_adoptadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id_provincia` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `tipos_mascota`
--
ALTER TABLE `tipos_mascota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
