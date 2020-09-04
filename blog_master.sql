-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-09-2020 a las 20:02:59
-- Versión del servidor: 5.7.31-0ubuntu0.18.04.1
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog_master`
--
CREATE DATABASE IF NOT EXISTS `blog_master` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog_master`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Acción'),
(2, 'Rol'),
(3, 'Deportes'),
(4, 'religion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `id` int(255) NOT NULL,
  `usuario_id` int(255) NOT NULL,
  `categoria_id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id`, `usuario_id`, `categoria_id`, `titulo`, `descripcion`, `fecha`) VALUES
(2, 1, 2, 'Review de LOL Online', 'Todo sobre LOL', '2019-08-23'),
(3, 1, 3, 'Nuevos jugadores de FIFA 2019', 'Review de FIFA 2019', '2019-08-23'),
(5, 2, 1, 'Novedades de Assasins', 'Review de Assasins', '2019-08-23'),
(6, 2, 2, 'Review de WOW Online', 'Todo sobre WOW', '2019-08-23'),
(7, 2, 3, 'Nuevos jugadores de PES 2019', 'Review de PES 2019', '2019-08-23'),
(8, 3, 1, 'Novedades de Call od Duty Online', 'Review de Call od Duty', '2019-08-23'),
(9, 3, 2, 'Review de Fortnite Online', 'Todo sobre Fortnite', '2019-08-23'),
(10, 3, 3, 'Nuevos jugadores de Formula 1 2020', 'Review de Formula 1 2020', '2019-08-23'),
(11, 2, 1, 'fsadfsadfsdaf', 'asdfasdfsdaf', '2019-08-23'),
(12, 2, 3, 'cfbhfghdrtyrt54rtyrt', 't34te4rfgdfcxv', '2019-08-23'),
(13, 2, 2, 'prueba entrada', 'prueba entrada', '2019-08-26'),
(14, 2, 4, 'prueba 8', 'prueba 8', '2019-08-26'),
(17, 5, 4, '123456', '123456', '2019-09-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `fecha`) VALUES
(1, 'Ariel', 'Munoz', 'ariel.munoz.villegas@gmail.com', '$2y$04$2frp.yhk0RKcYM.EP4YfZeBh2HLqpodJSqV29S4QsQpZtiXGIMZf6', '2019-07-15'),
(2, 'holas', 'holas', 'holas@gmail.com', '$2y$04$CE3FGhS6bxqWpql5eqC3bucI1XWcEPcpRPGAFOYfPFUo.xqHEpsLO', '2019-08-23'),
(3, 'ana', 'garcia', 'ana@gmail.com', '$2y$04$5s8Hn0EwHUOakP6o8CfGiu6jPWhHp73LkP7gs2T1lVxk1buVVOXtW', '2019-08-23'),
(4, 'hola', 'hola', 'holahola@gmail.com', '$2y$04$ar9iZJ72wRZOGBqebsspUuJR25g/IRaWrmW4vqel91FcooteNnS9e', '2019-08-27'),
(5, 'hola', NULL, 'hola@gmail.com', '$2y$04$Kqoz5u9ExYjwcUfdGf1BruA8WFUi3EDmTzi6EVKAUbG6R90hOgmx2', '2018-09-03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_entrada_usuario` (`usuario_id`),
  ADD KEY `fk_entrada_categoria` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `fk_entrada_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fk_entrada_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
