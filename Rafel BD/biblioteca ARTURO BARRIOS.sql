-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33066
-- Tiempo de generación: 27-04-2023 a las 08:01:08
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `codigo` int(10) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`codigo`, `nombre`) VALUES
(111, 'Tomas'),
(112, 'Franklin'),
(113, 'Michell'),
(114, 'Gusto'),
(115, 'Eduarada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `codigo_ejemplar` int(15) NOT NULL,
  `localidad` varchar(40) DEFAULT NULL,
  `codigo_libro` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejemplar`
--

INSERT INTO `ejemplar` (`codigo_ejemplar`, `localidad`, `codigo_libro`) VALUES
(221, 'avenida de los lagos No.98', 109),
(222, 'lomas de sotelo No.3', 206),
(223, 'san bartolo No.8', 387),
(224, 'las americas No1.11', 703),
(225, 'hidalgo y costilla No.22', 892);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `codigo_libro` int(10) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `no_pag` smallint(5) DEFAULT NULL,
  `isbn` varchar(10) DEFAULT NULL,
  `codigo_autor` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`codigo_libro`, `titulo`, `no_pag`, `isbn`, `codigo_autor`) VALUES
(109, 'Un mundo feliz', 150, '1234098739', 114),
(206, 'The Return Joker', 200, '1357908642', 113),
(387, 'Un hombre feo', 106, '7650983214', 115),
(703, 'El toxico', 100, '1234567890', 111),
(892, 'The duck hunt', 50, '0987654321', 112);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `fecha_devolucion` int(50) DEFAULT NULL,
  `fecha_prestamo` varchar(20) DEFAULT NULL,
  `codigo_ejemplar` int(15) DEFAULT NULL,
  `codigo_usuario` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`fecha_devolucion`, `fecha_prestamo`, `codigo_ejemplar`, `codigo_usuario`) VALUES
(11, '21/01/23', 221, 331),
(30, '09/05/10', 222, 332),
(14, '15/10/22', 223, 333),
(16, '29/04/20', 224, 334),
(9, '31/01/07', 225, 335);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigo_usuario` int(20) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigo_usuario`, `nombre`, `direccion`, `telefono`) VALUES
(331, 'pedro', 'tepito No.97', 55555555),
(332, 'adriana', 'colombia No.44', 2147483647),
(333, 'carlos', 'la doctores No.6', 2147483647),
(334, 'rodrigo', 'juanito No.7', 2147483647),
(335, 'chana', 'la lagunilla No.14', 2147483647);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`codigo_ejemplar`),
  ADD KEY `codigo_libro` (`codigo_libro`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`codigo_libro`),
  ADD KEY `codigo_autor` (`codigo_autor`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD KEY `codigo_ejemplar` (`codigo_ejemplar`),
  ADD KEY `codigo_usuario` (`codigo_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `ejemplar_ibfk_1` FOREIGN KEY (`codigo_libro`) REFERENCES `libro` (`codigo_libro`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`codigo_autor`) REFERENCES `autor` (`codigo`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`codigo_ejemplar`) REFERENCES `ejemplar` (`codigo_ejemplar`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuario` (`codigo_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
