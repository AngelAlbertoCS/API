-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2024 a las 18:48:05
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
-- Base de datos: `revistas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriasrevistas`
--

CREATE TABLE `categoriasrevistas` (
  `CategoriaID` int(11) NOT NULL,
  `NombreCategoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoriasrevistas`
--

INSERT INTO `categoriasrevistas` (`CategoriaID`, `NombreCategoria`) VALUES
(1, 'terror'),
(2, 'romance'),
(3, 'Tecnología'),
(4, 'Ciencia'),
(5, 'Moda'),
(6, 'Deportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ClienteID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `CorreoElectrónico` varchar(100) NOT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `País` varchar(100) DEFAULT NULL,
  `token` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ClienteID`, `Nombre`, `Apellido`, `CorreoElectrónico`, `Teléfono`, `Ciudad`, `Estado`, `País`, `token`) VALUES
(1, 'Angel', 'Castellanos', 'kevindddd@yahoo.com', '1234567890', 'Merida', 'Yucatan', 'Mexico', '111'),
(6, 'Kevin', 'Sanchez', 'kevin.com', '1234567890', 'Merida', 'Yucatan', 'Mexico', ''),
(7, 'Juan', 'Pérez', 'juan.perez@example.com', '1234567890', 'Ciudad de México', 'CDMX', 'México', 'token123'),
(8, 'Ana', 'García', 'ana.garcia@example.com', '0987654321', 'Monterrey', 'Nuevo León', 'México', 'token456'),
(9, 'Carlos', 'López', 'carlos.lopez@example.com', '5551234567', 'Guadalajara', 'Jalisco', 'México', 'token789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedidos`
--

CREATE TABLE `detallespedidos` (
  `DetallePedidoID` int(11) NOT NULL,
  `PedidoID` int(11) DEFAULT NULL,
  `RevistaID` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioUnitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallespedidos`
--

INSERT INTO `detallespedidos` (`DetallePedidoID`, `PedidoID`, `RevistaID`, `Cantidad`, `PrecioUnitario`) VALUES
(1, 1, 1, 1, 123.00),
(2, 10, 2, 2, 59.00),
(3, 9, 3, 1, 499.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `EditorialID` int(11) NOT NULL,
  `NombreEditorial` varchar(100) NOT NULL,
  `Dirección` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `País` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `CorreoContacto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`EditorialID`, `NombreEditorial`, `Dirección`, `Ciudad`, `Estado`, `País`, `Teléfono`, `CorreoContacto`) VALUES
(1, 'angel', 'guadalajara', NULL, 'chucha', 'Mexico', '12345678', 'angelccc'),
(2, 'Editorial Alfa', 'Calle Primera 101', 'Ciudad de México', 'CDMX', 'México', '5551112233', 'contacto@alfa.com'),
(3, 'Editorial Beta', 'Avenida Segunda 202', 'Monterrey', 'Nuevo León', 'México', '5552223344', 'info@beta.com'),
(4, 'Editorial Gamma', 'Boulevard Tercero 303', 'Guadalajara', 'Jalisco', 'México', '5553334455', 'contact@gamma.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `PedidoID` int(11) NOT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `FechaPedido` date NOT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `MontoTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`PedidoID`, `ClienteID`, `FechaPedido`, `Estado`, `MontoTotal`) VALUES
(1, 1, '2024-05-23', 'Caucan', 123.00),
(8, 1, '2024-05-01', 'Procesando', 179.00),
(9, 7, '2024-05-02', 'Enviado', 99.00),
(10, 8, '2024-05-03', 'Entregado', 119.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ProveedorID` int(11) NOT NULL,
  `NombreProveedor` varchar(100) NOT NULL,
  `NombreContacto` varchar(100) DEFAULT NULL,
  `CorreoContacto` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `Dirección` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `CódigoPostal` varchar(20) DEFAULT NULL,
  `País` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ProveedorID`, `NombreProveedor`, `NombreContacto`, `CorreoContacto`, `Teléfono`, `Dirección`, `Ciudad`, `Estado`, `CódigoPostal`, `País`) VALUES
(1, 'adalvo', 'ada', 'azulin', '123456', 'fvghxfgngfnbgbf', 'Aguascalientes', 'Aguascalientes', '345', 'Mexico'),
(2, 'Distribuidora XYZ', 'María Fernanda', 'maria.fernanda@xyz.com', '5559876543', 'Av. Reforma 123', 'Ciudad de México', 'CDMX', '01234', 'México'),
(3, 'Proveedora ABC', 'Luis Martínez', 'luis.martinez@abc.com', '5551239876', 'Calle Falsa 456', 'Monterrey', 'Nuevo León', '56789', 'México'),
(4, 'Editoriales del Norte', 'Andrea Salinas', 'andrea.salinas@ednorte.com', '5556543210', 'Blvd. Norte 789', 'Guadalajara', 'Jalisco', '98765', 'México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revistas`
--

CREATE TABLE `revistas` (
  `RevistaID` int(11) NOT NULL,
  `Título` varchar(255) NOT NULL,
  `Descripción` text DEFAULT NULL,
  `EditorialID` int(11) DEFAULT NULL,
  `FechaPublicación` date DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `CategoriaID` int(11) DEFAULT NULL,
  `ProveedorID` int(11) DEFAULT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `revistas`
--

INSERT INTO `revistas` (`RevistaID`, `Título`, `Descripción`, `EditorialID`, `FechaPublicación`, `Precio`, `CategoriaID`, `ProveedorID`, `Stock`) VALUES
(1, 'estrella', 'qdrtfyghuj', 1, '2024-05-07', 1234.00, 2, 1, 23),
(2, 'Tech Today', 'Revista sobre las últimas novedades en tecnología', 1, '2023-01-15', 59.90, 1, 1, 100),
(3, 'Ciencia y Vida', 'Artículos sobre descubrimientos científicos', 2, '2023-02-20', 49.90, 2, 2, 150),
(4, 'Moda Actual', 'Tendencias de moda del momento', 3, '2023-03-10', 39.90, 3, 3, 200),
(5, 'Deportes al Día', 'Noticias y reportajes sobre deportes', 1, '2023-04-05', 29.90, 4, 1, 250);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoriasrevistas`
--
ALTER TABLE `categoriasrevistas`
  ADD PRIMARY KEY (`CategoriaID`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ClienteID`),
  ADD UNIQUE KEY `CorreoElectrónico` (`CorreoElectrónico`);

--
-- Indices de la tabla `detallespedidos`
--
ALTER TABLE `detallespedidos`
  ADD PRIMARY KEY (`DetallePedidoID`),
  ADD KEY `PedidoID` (`PedidoID`),
  ADD KEY `RevistaID` (`RevistaID`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`EditorialID`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`PedidoID`),
  ADD KEY `ClienteID` (`ClienteID`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ProveedorID`);

--
-- Indices de la tabla `revistas`
--
ALTER TABLE `revistas`
  ADD PRIMARY KEY (`RevistaID`),
  ADD KEY `CategoriaID` (`CategoriaID`),
  ADD KEY `ProveedorID` (`ProveedorID`),
  ADD KEY `EditorialID` (`EditorialID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoriasrevistas`
--
ALTER TABLE `categoriasrevistas`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `detallespedidos`
--
ALTER TABLE `detallespedidos`
  MODIFY `DetallePedidoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `EditorialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `PedidoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ProveedorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `revistas`
--
ALTER TABLE `revistas`
  MODIFY `RevistaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallespedidos`
--
ALTER TABLE `detallespedidos`
  ADD CONSTRAINT `detallespedidos_ibfk_1` FOREIGN KEY (`PedidoID`) REFERENCES `pedidos` (`PedidoID`),
  ADD CONSTRAINT `detallespedidos_ibfk_2` FOREIGN KEY (`RevistaID`) REFERENCES `revistas` (`RevistaID`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`);

--
-- Filtros para la tabla `revistas`
--
ALTER TABLE `revistas`
  ADD CONSTRAINT `revistas_ibfk_1` FOREIGN KEY (`CategoriaID`) REFERENCES `categoriasrevistas` (`CategoriaID`),
  ADD CONSTRAINT `revistas_ibfk_2` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`),
  ADD CONSTRAINT `revistas_ibfk_3` FOREIGN KEY (`EditorialID`) REFERENCES `editoriales` (`EditorialID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
