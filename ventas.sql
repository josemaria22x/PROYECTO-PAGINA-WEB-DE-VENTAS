-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2022 a las 19:18:56
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `prefijo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `descripcion`, `prefijo`) VALUES
(2, 'Bebidas', ''),
(3, 'Sabritas', ''),
(5, 'Dulces', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `nombreproveedor` text NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `calle` varchar(15) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `comuna` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nit`, `nombreproveedor`, `telefono`, `calle`, `numero`, `comuna`, `ciudad`) VALUES
(1, '465', 'Marina Sanchez', '45652288', '0', '0', 'REU', 'REU'),
(2, '897', 'Hector Lopez', '45652321', '0', '0', 'Pradera', 'Xela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `descripcion`) VALUES
(2, 'Usuarios'),
(3, 'Proveedores'),
(4, 'Productos'),
(5, 'Clientes'),
(6, 'Ventas'),
(7, 'Reportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `idtipousuario` int(11) NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `acceso` tinyint(4) NOT NULL,
  `crear` tinyint(4) NOT NULL,
  `modificar` tinyint(4) NOT NULL,
  `eliminar` tinyint(4) NOT NULL,
  `consultar` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `idtipousuario`, `idmodulo`, `acceso`, `crear`, `modificar`, `eliminar`, `consultar`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1, 1),
(16, 3, 1, 0, 0, 0, 0, 0),
(17, 3, 2, 0, 0, 0, 0, 0),
(31, 5, 1, 1, 1, 1, 1, 1),
(32, 5, 2, 1, 1, 0, 0, 0),
(46, 2, 1, 1, 1, 1, 1, 1),
(47, 2, 2, 0, 0, 0, 0, 0),
(61, 4, 1, 0, 0, 0, 0, 0),
(62, 4, 2, 0, 0, 0, 0, 0),
(84, 6, 1, 0, 0, 0, 0, 0),
(85, 6, 2, 0, 0, 0, 0, 0),
(116, 1, 3, 1, 1, 1, 1, 1),
(117, 2, 3, 0, 0, 0, 0, 0),
(118, 3, 3, 0, 0, 0, 0, 0),
(119, 4, 3, 1, 1, 1, 1, 1),
(120, 6, 3, 0, 0, 0, 0, 0),
(121, 5, 3, 0, 0, 0, 0, 0),
(122, 1, 4, 1, 1, 1, 1, 1),
(123, 1, 5, 1, 1, 1, 1, 1),
(124, 4, 4, 1, 1, 1, 1, 1),
(125, 4, 5, 1, 1, 1, 1, 1),
(126, 2, 4, 0, 0, 0, 0, 0),
(127, 2, 5, 0, 0, 0, 0, 0),
(128, 3, 4, 0, 0, 0, 0, 0),
(129, 3, 5, 0, 0, 0, 0, 0),
(130, 1, 6, 1, 1, 1, 1, 1),
(131, 1, 7, 1, 1, 1, 1, 1),
(132, 2, 6, 0, 0, 0, 0, 0),
(133, 2, 7, 0, 0, 0, 0, 0),
(134, 4, 6, 1, 1, 1, 1, 1),
(135, 4, 7, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idsubcategoria` int(11) DEFAULT NULL,
  `codigo` varchar(150) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `unidadmedida` varchar(25) NOT NULL,
  `preciocompratotal` float(10,2) NOT NULL COMMENT 'precio de compra de un producto con iva o sin ivas segun el proveedor',
  `preciocompra` float(10,2) NOT NULL COMMENT 'precio compra por unida de medida',
  `divisionunidad` varchar(25) NOT NULL,
  `cantidaddivision` float(10,2) NOT NULL,
  `impresion` tinyint(4) NOT NULL COMMENT '1=cocina ;  2=bar  ; 3=cocina y bar',
  `idproveedor` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `idcategoria`, `idsubcategoria`, `codigo`, `nombre`, `unidadmedida`, `preciocompratotal`, `preciocompra`, `divisionunidad`, `cantidaddivision`, `impresion`, `idproveedor`) VALUES
(2, 2, NULL, '20', 'Cubata Guarana', 'UNIDAD', 0.00, 2.50, 'UNIDAD', 1.00, 0, 2),
(3, 5, NULL, '0', 'Pepsi', 'UNIDAD', 0.00, 15.00, 'UNIDAD', 1.00, 0, 1),
(4, 3, NULL, '0', 'Chettos', 'UNIDAD', 0.00, 11.00, 'UNIDAD', 1.00, 0, 3),
(5, 2, NULL, '10', 'Cubata Citrus', 'UNIDAD', 0.00, 2.50, 'UNIDAD', 1.00, 0, 2),
(6, 2, NULL, '30', 'Cubata LIma Limon', 'UNIDAD', 0.00, 2.50, 'UNIDAD', 1.00, 0, 2),
(7, 2, NULL, '40', 'Bacardi Carta Blanca', 'UNIDAD', 0.00, 50.00, 'UNIDAD', 1.00, 0, 4),
(8, 2, NULL, '50', 'Bacardí Silver', 'UNIDAD', 0.00, 7.00, 'UNIDAD', 1.00, 0, 4),
(9, 2, NULL, '60', 'Bacardi Carta Oro', 'UNIDAD', 0.00, 55.00, 'UNIDAD', 1.00, 0, 4),
(10, 2, NULL, '70', 'Quetzalteca fresa', 'UNIDAD', 0.00, 30.00, 'UNIDAD', 1.00, 0, 2),
(11, 2, NULL, '80', 'Quetzalteca naranja pepita', 'UNIDAD', 0.00, 30.00, 'UNIDAD', 1.00, 0, 2),
(12, 2, NULL, '90', 'Quetzalteca mora', 'UNIDAD', 0.00, 30.00, 'UNIDAD', 1.00, 0, 2),
(13, 2, NULL, '100', 'Dorada Draft Michelada Lata 472ml', 'UNIDAD', 0.00, 10.00, 'UNIDAD', 1.00, 0, 5),
(16, 2, NULL, '110', 'Coca cola lata', 'UNIDAD', 0.00, 3.50, 'UNIDAD', 1.00, 0, 6),
(17, 2, NULL, '120', 'Pepsi Jumbo', 'UNIDAD', 0.00, 10.00, 'UNIDAD', 1.00, 0, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosubicaciones`
--

CREATE TABLE `productosubicaciones` (
  `id` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `precioventa` float(10,2) NOT NULL,
  `ingreso` float(10,2) NOT NULL,
  `salida` float(10,2) NOT NULL,
  `existencia` float(10,2) NOT NULL,
  `existenciaminima` float(10,2) NOT NULL,
  `existenciamaxima` float(10,2) NOT NULL,
  `estado` tinyint(4) NOT NULL COMMENT '0=activo   1=de baja',
  `ordencompra` tinyint(4) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productosubicaciones`
--

INSERT INTO `productosubicaciones` (`id`, `idsucursal`, `idproducto`, `precioventa`, `ingreso`, `salida`, `existencia`, `existenciaminima`, `existenciamaxima`, `estado`, `ordencompra`, `fecha_vencimiento`) VALUES
(356, 1, 2, 5.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, '2022-12-23'),
(357, 1, 3, 25.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(358, 1, 4, 22.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(359, 1, 5, 5.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(360, 1, 6, 5.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(361, 1, 7, 65.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(362, 1, 8, 12.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(363, 1, 9, 66.70, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(364, 1, 10, 55.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(365, 1, 11, 55.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(366, 1, 12, 55.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(367, 1, 13, 16.25, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(368, 1, 16, 5.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL),
(369, 1, 17, 15.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `nombreproveedor` text NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` text NOT NULL,
  `calle` varchar(15) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `comuna` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nit`, `nombreproveedor`, `telefono`, `email`, `calle`, `numero`, `comuna`, `ciudad`) VALUES
(2, '23124325324', 'LICORES DE GUATEMALA', '54661234', 'https://licoresdeguatemala.com', '21', '12', 'Roosevelt ', 'Guatemala'),
(4, '123456564645', 'BACARDI', '3435345', 'https://www.bacardi.com/lm/es/', '2', '5', 'Petapa', 'Guatemala'),
(5, '236273846', 'CERVECERIA CENTROAMERICANA', '4545-5454', 'http://cerveceriacentroamericana.com/cervezas/', '3', '22', 'Zona 11', 'Guatemala'),
(6, '12457698', 'Coca Cola Company', '44651058', 'www.cocacola.com', '4', '10', 'Guatemala', 'Guatemala'),
(7, '7845127845', 'PEPSI', '89456512', 'www.pepsi.com', '8', '10', 'Guatemala', 'Guatemala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `prefijo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`, `telefono`) VALUES
(1, 'Administración', 0),
(2, 'Habitaciones', 0),
(3, 'Oficina', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuarios`
--

CREATE TABLE `tipousuarios` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipousuarios`
--

INSERT INTO `tipousuarios` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Supervisor'),
(3, 'Bodeguero'),
(4, 'Digitador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `idtipousuario` int(11) NOT NULL,
  `idapertura` int(11) NOT NULL DEFAULT '0',
  `idsucursal` int(11) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `activado` tinyint(4) NOT NULL,
  `aleatorio` int(11) NOT NULL,
  `ultimafechaingreso` datetime NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `claveUsuario` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `idtipousuario`, `idapertura`, `idsucursal`, `usuario`, `clave`, `activado`, `aleatorio`, `ultimafechaingreso`, `nombre`, `claveUsuario`) VALUES
(1, 1, 0, 1, 'sinfo', '461f22cc02fcef77a510eb92a193a9b1f37b0527', 1, 0, '2022-03-10 09:43:20', 'SINFO', 0),
(59, 1, 285, 1, 'salfonso', '0c3f8e9dc779879f9888fc8fadb59ff59bd60087', 1, 111222, '2022-10-10 20:36:05', 'Alfonso Sanchez', 4),
(61, 4, 0, 2, 'usuario', '3c55950f0400029902b056c1492f4cc040898c79', 1, 111222, '2022-09-25 16:16:07', 'Usuario', 1),
(62, 4, 0, 2, 'joseralac', '0f777330dddebff914dcda1733688139c5f85645', 1, 111222, '2022-10-25 10:08:37', 'Jose Maria Ralac', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fechahora` datetime NOT NULL,
  `totalventa` float(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `idcliente`, `idusuario`, `fechahora`, `totalventa`) VALUES
(1, 1, 59, '2022-10-09 19:27:30', 31.00),
(2, 2, 59, '2022-10-09 19:29:17', 53.00),
(3, 1, 59, '2022-10-09 20:04:04', 50.00),
(4, 1, 59, '2022-10-09 21:15:57', 31.00),
(5, 1, 59, '2022-10-10 20:38:59', 53.00),
(6, 0, 62, '2022-10-12 15:31:39', 46.00),
(7, 0, 62, '2022-10-21 17:36:43', 84.20),
(8, 0, 62, '2022-10-22 21:53:35', 145.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventasdetalles`
--

CREATE TABLE `ventasdetalles` (
  `id` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idproductoubicacion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventasdetalles`
--

INSERT INTO `ventasdetalles` (`id`, `idventa`, `idproductoubicacion`, `cantidad`) VALUES
(1, 1, 356, 1),
(2, 1, 357, 1),
(3, 2, 357, 1),
(4, 2, 358, 1),
(5, 2, 356, 1),
(6, 3, 357, 1),
(7, 3, 357, 1),
(8, 4, 356, 1),
(9, 4, 357, 1),
(10, 5, 356, 1),
(11, 5, 357, 1),
(12, 5, 358, 1),
(13, 6, 356, 1),
(14, 6, 357, 1),
(15, 6, 359, 1),
(16, 7, 363, 1),
(17, 7, 362, 1),
(18, 7, 360, 1),
(19, 8, 365, 1),
(20, 8, 361, 1),
(21, 8, 356, 1),
(22, 8, 360, 1),
(23, 8, 369, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `descripcion` (`descripcion`),
  ADD KEY `prefijo` (`prefijo`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idmodulo` (`idmodulo`),
  ADD KEY `idtipousuario` (`idtipousuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcategoria` (`idcategoria`),
  ADD KEY `idsubcategoria` (`idsubcategoria`),
  ADD KEY `codigo` (`codigo`),
  ADD KEY `nombre` (`nombre`(255)),
  ADD KEY `preciocompratotal` (`preciocompratotal`),
  ADD KEY `preciocompra` (`preciocompra`);

--
-- Indices de la tabla `productosubicaciones`
--
ALTER TABLE `productosubicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idubicacion` (`idsucursal`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `ingreso` (`ingreso`),
  ADD KEY `salida` (`salida`),
  ADD KEY `existencia` (`existencia`),
  ADD KEY `existenciaminima` (`existenciaminima`),
  ADD KEY `existenciamaxima` (`existenciamaxima`),
  ADD KEY `estado` (`estado`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuarios`
--
ALTER TABLE `tipousuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtipousuario` (`idtipousuario`),
  ADD KEY `idsucursal` (`idsucursal`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `idapertura` (`idapertura`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `fechahora` (`fechahora`);

--
-- Indices de la tabla `ventasdetalles`
--
ALTER TABLE `ventasdetalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idventa` (`idventa`),
  ADD KEY `idcuenta` (`idproductoubicacion`),
  ADD KEY `cantidad` (`cantidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `productosubicaciones`
--
ALTER TABLE `productosubicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipousuarios`
--
ALTER TABLE `tipousuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `ventasdetalles`
--
ALTER TABLE `ventasdetalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idsubcategoria`) REFERENCES `subcategorias` (`id`);

--
-- Filtros para la tabla `productosubicaciones`
--
ALTER TABLE `productosubicaciones`
  ADD CONSTRAINT `productosubicaciones_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursales` (`id`),
  ADD CONSTRAINT `productosubicaciones_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `ventasdetalles`
--
ALTER TABLE `ventasdetalles`
  ADD CONSTRAINT `ventasdetalles_ibfk_1` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`id`),
  ADD CONSTRAINT `ventasdetalles_ibfk_2` FOREIGN KEY (`idproductoubicacion`) REFERENCES `productosubicaciones` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
