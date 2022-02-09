-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-04-2012 a las 22:08:16
-- Versión del servidor: 5.5.20
-- Versión de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `construccion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductores`
--

CREATE TABLE IF NOT EXISTS `conductores` (
  `c#` varchar(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `localidad` varchar(80) NOT NULL,
  `categ` int(11) NOT NULL,
  PRIMARY KEY (`c#`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conductores`
--

INSERT INTO `conductores` (`c#`, `nombre`, `localidad`, `categ`) VALUES
('C1', 'JOSE SANCHEZ', 'ARGANDA', 18),
('C2', 'MANUEL DIAZ', 'ARGANDA', 15),
('C3', 'JUAN PEREZ', 'RIVAS', 20),
('C4', 'LUIS ORTIZ', 'ARGANDA', 18),
('C5', 'JAVIER MARTIN', 'LOECHES', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinas`
--

CREATE TABLE IF NOT EXISTS `maquinas` (
  `m#` varchar(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio_hora` decimal(10,2) NOT NULL,
  PRIMARY KEY (`m#`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `maquinas`
--

INSERT INTO `maquinas` (`m#`, `nombre`, `precio_hora`) VALUES
('M1', 'EXCAVADORA', '90.00'),
('M2', 'HORMIGONERA', '120.00'),
('M3', 'VOLQUETE', '60.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE IF NOT EXISTS `proyectos` (
  `p#` varchar(5) NOT NULL,
  `descrip` varchar(130) NOT NULL,
  `localidad` varchar(80) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  PRIMARY KEY (`p#`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`p#`, `descrip`, `localidad`, `cliente`) VALUES
('P1', 'REFORMA VIVIENDA', 'ARGANDA', 'FELIPE GARCIA'),
('P2', 'CONSTRUCCION CHALET', 'RIVAS', 'PEDRO MARTINEZ'),
('P3', 'REFORMA VIVIENDA', 'ARGANDA', 'ROSA ALVAREZ'),
('P4', 'CONSTRUCCION PISCINA', 'LOECHES', 'FERMIN BLANCO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE IF NOT EXISTS `trabajos` (
  `c#` varchar(5) NOT NULL,
  `m#` varchar(5) NOT NULL,
  `p#` varchar(5) NOT NULL,
  `fecha` date NOT NULL,
  `tiempo` int(11) NOT NULL,
  PRIMARY KEY (`c#`,`m#`,`p#`),
  KEY `m#` (`m#`),
  KEY `p#` (`p#`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trabajos`
--

INSERT INTO `trabajos` (`c#`, `m#`, `p#`, `fecha`, `tiempo`) VALUES
('C1', 'M2', 'P2', '1994-09-12', 120),
('C1', 'M2', 'P4', '1994-09-17', 120),
('C1', 'M3', 'P4', '1994-09-15', 180),
('C2', 'M3', 'P1', '1994-09-10', 100),
('C2', 'M3', 'P2', '1994-09-15', 45),
('C2', 'M3', 'P3', '1994-09-13', 30),
('C3', 'M1', 'P2', '1994-09-10', 200),
('C3', 'M1', 'P4', '1994-09-15', 300),
('C4', 'M3', 'P2', '1994-09-10', 90),
('C5', 'M3', 'P2', '1994-09-10', 150),
('C5', 'M3', 'P4', '1994-09-15', 90);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD CONSTRAINT `trabajos_ibfk_6` FOREIGN KEY (`p#`) REFERENCES `proyectos` (`p#`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trabajos_ibfk_4` FOREIGN KEY (`c#`) REFERENCES `conductores` (`c#`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trabajos_ibfk_5` FOREIGN KEY (`m#`) REFERENCES `maquinas` (`m#`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
