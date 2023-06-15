-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2023 a las 16:08:38
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
(102, 'maria'),
(103, 'juana'),
(104, 'abigail'),
(105, 'hurrem'),
(106, 'mariam'),
(107, 'perla'),
(108, 'nurvanu'),
(109, 'pedro'),
(110, 'kimberly'),
(111, 'ricardo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `codigo_editorial` int(20) DEFAULT NULL,
  `nombre_editorial` varchar(20) DEFAULT NULL,
  `ISBN_libro` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`codigo_editorial`, `nombre_editorial`, `ISBN_libro`) VALUES
(234, 'La codicia', 5641),
(337, 'La revelacion', 3832),
(345, 'The beast', 3434),
(423, 'El magico', 12356),
(432, 'Berkano', 4366),
(564, 'Phertro', 6706),
(832, 'Anzus', 4388),
(875, 'Alice madnnes return', 2569),
(926, 'Te mother', 5486),
(937, 'The book worm', 9240);

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
(1110, 'san lorenzo', 1107),
(1111, 'la avenida', 1108),
(1112, 'las lomas', 1109),
(1113, 'la olimpica', 1100),
(1114, 'izcalli', 1101);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `codigo_libro` int(10) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `no_pag` smallint(5) DEFAULT NULL,
  `isbn` varchar(10) DEFAULT NULL,
  `codigo_autor` int(10) DEFAULT NULL,
  `año_edicion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`codigo_libro`, `titulo`, `no_pag`, `isbn`, `codigo_autor`, `año_edicion`) VALUES
(1100, 'la boda de la niña', 100, '102938', 102, '01/03/01'),
(1101, 'piratas', 230, '574893', 103, '11/06/22'),
(1102, 'blanca nieves', 50, '824601', 107, '17/09/22'),
(1103, 'cenicienta', 250, '109357', 108, '31/12/1997'),
(1104, 'kosem', 1000, '918746', 108, '17/03/03'),
(1105, 'frozen', 30, '198757', 109, '20/01/1998'),
(1106, 'rosa de guadalupe', 320, '913764', 110, '23/12/21'),
(1107, 'las brujas', 200, '135789', 104, '11/10/1999'),
(1108, 'el principito', 300, '905623', 105, '14/12/02'),
(1109, 'el sultan', 250, '346590', 106, '31/07/05');

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
(1, '02/febreo/23', 1110, 18),
(3, '04/abril/23', 1111, 26),
(5, '06/junio/23', 1112, 33),
(7, '08/septiembre/23', 1113, 40),
(9, '11/octubre/23', 1114, 53);

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
(17, 'kimberli', 'la cañada', 5555555),
(18, 'melani', 'agustin lara', 55223311),
(23, 'Hurrem', 'via morelos', 5555556),
(26, 'daniela', 'venustiano carranza', 5578908),
(33, 'juan', 'miguel hialgo', 5578999),
(40, 'jesus', 'las torres', 551029874),
(53, 'brandon', 'valle dorado', 5572616),
(67, 'abel', 'la cerrada', 55543109),
(69, 'mari jose', 'la concagua', 55432901),
(100, 'cintia', 'argentina no.12', 55908765);

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
