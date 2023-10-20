-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2020 a las 21:01:47
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `demodental`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergia`
--

CREATE TABLE IF NOT EXISTS `alergia` (
  `cod_ale` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ale` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cod_ale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `alergia`
--

INSERT INTO `alergia` (`cod_ale`, `nombre_ale`) VALUES
(1, 'Penecilina'),
(2, 'Polvo'),
(3, 'Aguja'),
(4, 'Lactosa'),
(5, 'Sol'),
(6, 'Mariscos'),
(7, 'sulfas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE IF NOT EXISTS `banco` (
  `cod_banco` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo',
  PRIMARY KEY (`cod_banco`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`cod_banco`, `descripcion`, `estado`) VALUES
(1, 'BANCO DE CREDITO DEL PERU', 1),
(2, 'INTERBANK', 1),
(3, 'SCOTIABANK', 1),
(4, 'BANCO CONTINENTAL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `codi_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_cat` varchar(45) DEFAULT NULL,
  `esta_cat` char(1) DEFAULT NULL,
  PRIMARY KEY (`codi_cat`),
  UNIQUE KEY `nomb_cat` (`nomb_cat`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`codi_cat`, `nomb_cat`, `esta_cat`) VALUES
(1, 'Bajo', 'A'),
(2, 'Medio', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE IF NOT EXISTS `cita_medica` (
  `codi_cit` int(11) NOT NULL AUTO_INCREMENT,
  `codi_pac` int(11) DEFAULT NULL,
  `codi_med` int(11) DEFAULT NULL,
  `cod_especialidad` int(11) DEFAULT NULL,
  `cod_sede` int(11) DEFAULT NULL,
  `motivo_consult` varchar(80) DEFAULT NULL,
  `cod_citado` int(11) DEFAULT NULL,
  `fech_cit` datetime NOT NULL,
  `obsv_cit` varchar(200) NOT NULL,
  `esta_cit` varchar(1) NOT NULL,
  PRIMARY KEY (`codi_cit`),
  KEY `fk_cita_medica_paciente` (`codi_pac`),
  KEY `fk_cita_medica_medico` (`codi_med`),
  KEY `fk_cita_medica_especialidad` (`cod_especialidad`),
  KEY `fk_cita_medica_tipo_citado` (`cod_citado`),
  KEY `fk_cita_medica_sede` (`cod_sede`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `cita_medica`
--

INSERT INTO `cita_medica` (`codi_cit`, `codi_pac`, `codi_med`, `cod_especialidad`, `cod_sede`, `motivo_consult`, `cod_citado`, `fech_cit`, `obsv_cit`, `esta_cit`) VALUES
(1, 1, 1, 1, 1, 'dolores en los dientes', 3, '2018-12-07 08:00:00', 'ninguno', '1'),
(2, 1, 1, 1, 1, 'dolores fuertes', 2, '2018-12-07 09:00:00', 'por dolores', '1'),
(3, 2, 1, 1, 1, 'sacar diente', 5, '2018-12-07 16:00:00', 'por dolores', '1'),
(4, 2, 1, 1, 1, 'dolor molar', 5, '2018-12-07 14:00:00', '.', '1'),
(5, 1, 1, 1, 1, 'Dolor umbral fuerte', 4, '2018-12-10 09:00:00', 'No tiene ninguna observacion', '1'),
(6, 1, 4, 2, 1, 'motivo', 3, '2019-03-07 07:30:00', 'obsr', '1'),
(7, 1, 3, 1, 1, 'dolor', 1, '2019-07-10 08:30:00', '', '1'),
(8, 7, 1, 1, 1, 'restauraciones', 5, '2019-07-20 16:00:00', '', '1'),
(9, 8, 6, 2, 1, 'por dolor de diente', 5, '2019-07-22 20:00:00', '', '1'),
(10, 2, 7, 1, 1, 'dolor', 2, '2019-07-23 19:30:00', '', '1'),
(11, 2, 8, 2, 1, 'dolor molar', 5, '2019-07-25 10:15:00', 'ninguna', '1'),
(12, 1, 6, 2, 1, 'dolor humbral', 5, '2019-07-26 09:00:00', '', '1'),
(13, 6, 6, 2, 1, 'por humbral', 5, '2019-07-26 11:15:00', '', '1'),
(14, 9, 12, 1, 1, 'por dolor', 5, '2019-07-27 19:45:00', '', '1'),
(15, 10, 15, 4, 1, 'dolor', 5, '2020-01-16 10:30:00', '', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinica`
--

CREATE TABLE IF NOT EXISTS `clinica` (
  `id_clin` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_clin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direc_clin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telf_clin` int(15) NOT NULL,
  `email_clin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ruc_clin` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_clin` date DEFAULT NULL,
  `photo` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_plan` int(11) NOT NULL,
  `esta_clin` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_clin`),
  KEY `FK_clinica_planes` (`cod_plan`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `clinica`
--

INSERT INTO `clinica` (`id_clin`, `nomb_clin`, `direc_clin`, `telf_clin`, `email_clin`, `ruc_clin`, `fecha_clin`, `photo`, `cod_plan`, `esta_clin`) VALUES
(1, 'VITAL DENT', 'PROL. SAN MARTÍN 170 - 2 PISO - HUACHO ', 2394087, 'clinicavitaldent@gmail.com', '10424584555', '0000-00-00', 'logogeneral-1564023677.png', 2, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE IF NOT EXISTS `comprobante` (
  `id_com` int(8) NOT NULL AUTO_INCREMENT,
  `fecha_com` date DEFAULT NULL,
  `serie_com` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `secuencia_com` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cod_tipodocumento` int(8) DEFAULT NULL,
  `cod_tipopago` int(8) DEFAULT NULL,
  `cod_tarjeta` int(8) DEFAULT NULL,
  `igv_com` decimal(8,2) DEFAULT NULL,
  `igvparam_com` decimal(6,2) DEFAULT NULL,
  `recibido_com` decimal(8,2) DEFAULT NULL,
  `vuelto_com` decimal(8,2) DEFAULT NULL,
  `subtotal_comp` decimal(8,2) DEFAULT NULL,
  `total_comp` decimal(8,2) DEFAULT NULL,
  `estado_com` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Normal, 2 = Anulado',
  PRIMARY KEY (`id_com`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=66 ;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`id_com`, `fecha_com`, `serie_com`, `secuencia_com`, `cod_tipodocumento`, `cod_tipopago`, `cod_tarjeta`, `igv_com`, `igvparam_com`, `recibido_com`, `vuelto_com`, `subtotal_comp`, `total_comp`, `estado_com`) VALUES
(40, '2019-03-23', '001', '0000017', 3, 4, NULL, '0.00', '18.00', '1000.00', '100.00', '900.00', '900.00', 1),
(41, '2019-03-23', '004', '0000010', 1, 4, NULL, '137.29', '18.00', '1000.00', '100.00', '762.71', '900.00', 1),
(42, '2019-03-23', '001', '0000018', 3, 4, NULL, '0.00', '18.00', '400.00', '40.00', '360.00', '360.00', 1),
(43, '2019-03-23', '004', '0000011', 1, 4, NULL, '54.92', '18.00', '400.00', '40.00', '305.08', '360.00', 1),
(44, '2019-03-24', '001', '0000019', 3, 4, NULL, '0.00', '18.00', '1200.00', '4.00', '1196.00', '1196.00', 1),
(45, '2019-03-24', '004', '0000012', 1, 4, NULL, '91.22', '18.00', '600.00', '2.00', '506.78', '598.00', 1),
(46, '2019-03-27', '001', '0000020', 3, 4, NULL, '0.00', '18.00', '800.00', '12.75', '787.25', '787.25', 1),
(47, '2019-03-27', '001', '0000021', 3, 4, NULL, '0.00', '18.00', '800.00', '12.75', '787.25', '787.25', 1),
(48, '2019-03-27', '001', '0000022', 3, 4, NULL, '0.00', '18.00', '1000.00', '212.75', '787.25', '787.25', 1),
(49, '2019-03-28', '004', '0000013', 1, 3, 1, '137.36', '18.00', '1000.00', '99.50', '763.14', '900.50', 1),
(50, '2019-03-28', '004', '0000014', 1, 4, NULL, '137.36', '18.00', '1000.00', '99.50', '763.14', '900.50', 1),
(51, '2019-03-28', '004', '0000015', 1, 4, NULL, '137.36', '18.00', '910.00', '9.50', '763.14', '900.50', 1),
(52, '2019-04-04', '001', '0000023', 3, 4, NULL, '0.00', '18.00', '500.00', '77.17', '422.83', '422.83', 1),
(54, '2019-04-04', '001', '0000025', 3, 4, NULL, '0.00', '18.00', '600.00', '177.17', '422.83', '422.83', 2),
(55, '2019-04-06', '001', '0000026', 3, 4, NULL, '0.00', '18.00', '800.00', '12.75', '787.25', '787.25', 1),
(56, '2019-04-06', '001', '0000027', 3, 4, NULL, '0.00', '18.00', '100.00', '15.50', '84.50', '84.50', 2),
(57, '2019-04-06', '001', '0000028', 3, 4, NULL, '0.00', '18.00', '600.00', '74.66', '525.34', '525.34', 1),
(58, '2019-04-14', '001', '0000001', 2, 4, NULL, '0.00', '0.00', '300.00', '37.33', '262.67', '262.67', 1),
(59, '2019-04-15', '001', '0000029', 3, 4, NULL, '0.00', '0.00', '300.00', '37.33', '262.67', '262.67', 1),
(60, '2019-04-28', '001', '0000030', 3, 4, NULL, '0.00', '0.00', '600.00', '29.00', '571.00', '571.00', 1),
(61, '2019-07-18', '001', '0000002', 2, 4, NULL, '0.00', '0.00', '200.00', '58.00', '142.00', '142.00', 1),
(62, '2019-07-27', '001', '0000003', 2, 4, NULL, '0.00', '0.00', '400.00', '19.33', '380.67', '380.67', 1),
(63, '2019-07-27', '001', '0000004', 2, 3, 1, '0.00', '0.00', '500.00', '119.33', '380.67', '380.67', 1),
(64, '2019-07-27', '001', '0000005', 2, 4, NULL, '0.00', '0.00', '600.00', '219.33', '380.67', '380.67', 1),
(65, '2020-01-16', '002', '0000031', 3, 4, NULL, '0.00', '0.00', '300.00', '100.00', '200.00', '200.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `departamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento_nombre` varchar(250) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`departamento_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`departamento_id`, `departamento_nombre`, `estado`) VALUES
(1, 'Amazonas', 1),
(2, 'Ancash', 1),
(3, 'Apurimac', 1),
(4, 'Arequipa', 1),
(5, 'Ayacucho', 1),
(6, 'Cajamarca', 1),
(7, 'Callao', 1),
(8, 'Cusco', 1),
(9, 'Huancavelica', 1),
(10, 'Huanuco', 1),
(11, 'Ica', 1),
(12, 'Junin', 1),
(13, 'La Libertad', 1),
(14, 'Lambayeque', 1),
(15, 'Lima', 1),
(16, 'Loreto', 1),
(17, 'Madre de Dios', 1),
(18, 'Moquegua', 1),
(19, 'Pasco', 1),
(20, 'Piura', 1),
(21, 'Puno', 1),
(22, 'San Martin', 1),
(23, 'Tacna', 1),
(24, 'Tumbes', 1),
(25, 'Ucayali', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_fac`
--

CREATE TABLE IF NOT EXISTS `detalle_fac` (
  `precio` decimal(10,2) DEFAULT NULL,
  `codi_dpr` int(11) NOT NULL,
  `codi_fac` int(11) NOT NULL,
  PRIMARY KEY (`codi_dpr`,`codi_fac`),
  KEY `fk_detalle_fac_detalle_proc` (`codi_dpr`),
  KEY `fk_detalle_fac_factura` (`codi_fac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_proc`
--

CREATE TABLE IF NOT EXISTS `detalle_proc` (
  `codi_dpr` int(11) NOT NULL AUTO_INCREMENT,
  `codi_odo` int(11) NOT NULL,
  `codi_tar` int(11) NOT NULL,
  `aseg_dpr` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`codi_dpr`),
  KEY `fk_detalle_proc_odontograma` (`codi_odo`),
  KEY `fk_detalle_proc_tarifa_proc` (`codi_tar`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dientes`
--

CREATE TABLE IF NOT EXISTS `dientes` (
  `numero_die` int(4) NOT NULL,
  `tipo_die` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden_die` int(2) DEFAULT NULL,
  PRIMARY KEY (`numero_die`),
  UNIQUE KEY `numero_die` (`numero_die`),
  UNIQUE KEY `orden_die` (`orden_die`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `dientes`
--

INSERT INTO `dientes` (`numero_die`, `tipo_die`, `orden_die`) VALUES
(11, 'Inciso', 8),
(12, 'Inciso', 7),
(13, 'Inciso', 6),
(14, 'Premolar', 5),
(15, 'Premolar', 4),
(16, 'Molar', 3),
(17, 'Molar', 2),
(18, 'Molar', 1),
(21, 'Inciso', 9),
(22, 'Inciso', 10),
(23, 'Inciso', 11),
(24, 'Premolar', 12),
(25, 'Premolar', 13),
(26, 'Molar', 14),
(27, 'Molar', 15),
(28, 'Molar', 16),
(31, 'Inciso', 45),
(32, 'Inciso', 46),
(33, 'Inciso', 47),
(34, 'Premolar', 48),
(35, 'Premolar', 49),
(36, 'Molar', 50),
(37, 'Molar', 51),
(38, 'Molar', 52),
(41, 'Inciso', 44),
(42, 'Inciso', 43),
(43, 'Inciso', 42),
(44, 'Premolar', 41),
(45, 'Premolar', 40),
(46, 'Molar', 39),
(47, 'Molar', 38),
(48, 'Molar', 37),
(51, 'Inciso', 21),
(52, 'Inciso', 20),
(53, 'Inciso', 19),
(54, 'Molar', 18),
(55, 'Molar', 17),
(61, 'Inciso', 22),
(62, 'Inciso', 23),
(63, 'Inciso', 24),
(64, 'Molar', 25),
(65, 'Molar', 26),
(71, 'Inciso', 32),
(72, 'Inciso', 33),
(73, 'Inciso', 34),
(74, 'Molar', 35),
(75, 'Molar', 36),
(81, 'Inciso', 31),
(82, 'Inciso', 30),
(83, 'Inciso', 29),
(84, 'Molar', 28),
(85, 'Molar', 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE IF NOT EXISTS `distrito` (
  `distrito_id` int(11) NOT NULL AUTO_INCREMENT,
  `distrito_nombre` varchar(250) NOT NULL,
  `provincia_id` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`distrito_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1864 ;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`distrito_id`, `distrito_nombre`, `provincia_id`, `estado`) VALUES
(1, 'Chachapoyas', 1, 1),
(2, 'Asuncion', 1, 1),
(3, 'Balsas', 1, 1),
(4, 'Cheto', 1, 1),
(5, 'Chiliquin', 1, 1),
(6, 'Chuquibamba', 1, 1),
(7, 'Granada', 1, 1),
(8, 'Huancas', 1, 1),
(9, 'La Jalca', 1, 1),
(10, 'Leimebamba', 1, 1),
(11, 'Levanto', 1, 1),
(12, 'Magdalena', 1, 1),
(13, 'Mariscal Castilla', 1, 1),
(14, 'Molinopampa', 1, 1),
(15, 'Montevideo', 1, 1),
(16, 'Olleros', 1, 1),
(17, 'Quinjalca', 1, 1),
(18, 'San Francisco de Daguas', 1, 1),
(19, 'San Isidro de Maino', 1, 1),
(20, 'Soloco', 1, 1),
(21, 'Sonche', 1, 1),
(22, 'Bagua', 2, 1),
(23, 'Aramango', 2, 1),
(24, 'Copallin', 2, 1),
(25, 'El Parco', 2, 1),
(26, 'Imaza', 2, 1),
(27, 'La Peca', 2, 1),
(28, 'Jumbilla', 3, 1),
(29, 'Chisquilla', 3, 1),
(30, 'Churuja', 3, 1),
(31, 'Corosha', 3, 1),
(32, 'Cuispes', 3, 1),
(33, 'Florida', 3, 1),
(34, 'Jazan', 3, 1),
(35, 'Recta', 3, 1),
(36, 'San Carlos', 3, 1),
(37, 'Shipasbamba', 3, 1),
(38, 'Valera', 3, 1),
(39, 'Yambrasbamba', 3, 1),
(40, 'Nieva', 4, 1),
(41, 'El Cenepa', 4, 1),
(42, 'RÃ­o Santiago', 4, 1),
(43, 'Lamud', 5, 1),
(44, 'Camporredondo', 5, 1),
(45, 'Cocabamba', 5, 1),
(46, 'Colcamar', 5, 1),
(47, 'Conila', 5, 1),
(48, 'Inguilpata', 5, 1),
(49, 'Longuita', 5, 1),
(50, 'Lonya Chico', 5, 1),
(51, 'Luya', 5, 1),
(52, 'Luya Viejo', 5, 1),
(53, 'Maria', 5, 1),
(54, 'Ocalli', 5, 1),
(55, 'Ocumal', 5, 1),
(56, 'Pisuquia', 5, 1),
(57, 'Providencia', 5, 1),
(58, 'San CristÃ³bal', 5, 1),
(59, 'San Francisco de Yeso', 5, 1),
(60, 'San Jeranimo', 5, 1),
(61, 'San Juan de Lopecancha', 5, 1),
(62, 'Santa Catalina', 5, 1),
(63, 'Santo Tomas', 5, 1),
(64, 'Tingo', 5, 1),
(65, 'Trita', 5, 1),
(66, 'San Nicolas', 6, 1),
(67, 'Chirimoto', 6, 1),
(68, 'Cochamal', 6, 1),
(69, 'Huambo', 6, 1),
(70, 'Limabamba', 6, 1),
(71, 'Longar', 6, 1),
(72, 'Mariscal Benavides', 6, 1),
(73, 'Milpuc', 6, 1),
(74, 'Omia', 6, 1),
(75, 'Santa Rosa', 6, 1),
(76, 'Totora', 6, 1),
(77, 'Vista Alegre', 6, 1),
(78, 'Bagua Grande', 7, 1),
(79, 'Cajaruro', 7, 1),
(80, 'Cumba', 7, 1),
(81, 'El Milagro', 7, 1),
(82, 'Jamalca', 7, 1),
(83, 'Lonya Grande', 7, 1),
(84, 'Yamon', 7, 1),
(85, 'Huaraz', 8, 1),
(86, 'Cochabamba', 8, 1),
(87, 'Huanchay', 8, 1),
(88, 'Independencia', 8, 1),
(89, 'Jangas', 8, 1),
(90, 'La Libertad', 8, 1),
(91, 'Pampas Grande', 8, 1),
(92, 'Pariacoto', 8, 1),
(93, 'Pira', 8, 1),
(94, 'Tarica', 8, 1),
(95, 'Aija', 9, 1),
(96, 'Coris', 9, 1),
(97, 'Huacllan', 9, 1),
(98, 'La Merced', 9, 1),
(99, 'Succha', 9, 1),
(100, 'Llamellin', 10, 1),
(101, 'Aczo', 10, 1),
(102, 'Chaccho', 10, 1),
(103, 'Chingas', 10, 1),
(104, 'Mirgas', 10, 1),
(105, 'San Juan de Rontoy', 10, 1),
(106, 'Chacas', 11, 1),
(107, 'Acochaca', 11, 1),
(108, 'Chiquian', 12, 1),
(109, 'Abelardo Pardo Lezameta', 12, 1),
(110, 'Antonio Raymondi', 12, 1),
(111, 'Aquia', 12, 1),
(112, 'Cajacay', 12, 1),
(113, 'Canis', 12, 1),
(114, 'Colquioc', 12, 1),
(115, 'Huallanca', 12, 1),
(116, 'Huasta', 12, 1),
(117, 'Huayllacayan', 12, 1),
(118, 'La Primavera', 12, 1),
(119, 'Mangas', 12, 1),
(120, 'Pacllon', 12, 1),
(121, 'San Miguel de Corpanqui', 12, 1),
(122, 'Ticllos', 12, 1),
(123, 'Carhuaz', 13, 1),
(124, 'Acopampa', 13, 1),
(125, 'Amashca', 13, 1),
(126, 'Anta', 13, 1),
(127, 'Ataquero', 13, 1),
(128, 'Marcara', 13, 1),
(129, 'Pariahuanca', 13, 1),
(130, 'San Miguel de Aco', 13, 1),
(131, 'Shilla', 13, 1),
(132, 'Tinco', 13, 1),
(133, 'Yungar', 13, 1),
(134, 'San Luis', 14, 1),
(135, 'San Nicolas', 14, 1),
(136, 'Yauya', 14, 1),
(137, 'Casma', 15, 1),
(138, 'Buena Vista Alta', 15, 1),
(139, 'Comandante Noel', 15, 1),
(140, 'Yautan', 15, 1),
(141, 'Corongo', 16, 1),
(142, 'Aco', 16, 1),
(143, 'Bambas', 16, 1),
(144, 'Cusca', 16, 1),
(145, 'La Pampa', 16, 1),
(146, 'Yanac', 16, 1),
(147, 'Yupan', 16, 1),
(148, 'Huari', 17, 1),
(149, 'Anra', 17, 1),
(150, 'Cajay', 17, 1),
(151, 'Chavin de Huantar', 17, 1),
(152, 'Huacachi', 17, 1),
(153, 'Huacchis', 17, 1),
(154, 'Huantar', 17, 1),
(155, 'Masin', 17, 1),
(156, 'Paucas', 17, 1),
(157, 'Ponto', 17, 1),
(158, 'Rahuapampa', 17, 1),
(159, 'Rapayan', 17, 1),
(160, 'San Marcos', 17, 1),
(161, 'San Pedro de Chana', 17, 1),
(162, 'Uco', 17, 1),
(163, 'Huarmey', 18, 1),
(164, 'Cochapeti', 18, 1),
(165, 'Culebras', 18, 1),
(166, 'Huayan', 18, 1),
(167, 'Malvas', 18, 1),
(168, 'Caraz', 19, 1),
(169, 'Huayanca', 19, 1),
(170, 'Huata', 19, 1),
(171, 'Huaylas', 19, 1),
(172, 'Mato', 19, 1),
(173, 'Pamparomas', 19, 1),
(174, 'Pueblo Libre', 19, 1),
(175, 'Santa Cruz', 19, 1),
(176, 'Santo Toribio', 19, 1),
(177, 'Yuracmarca', 19, 1),
(178, 'Piscobamba', 20, 1),
(179, 'Casca', 20, 1),
(180, 'Eleazar Guzman Barron', 20, 1),
(181, 'Fidel Olivas Escudero', 20, 1),
(182, 'Llama', 20, 1),
(183, 'Llumpa', 20, 1),
(184, 'Lucma', 20, 1),
(185, 'Musga', 20, 1),
(186, 'Ocros', 21, 1),
(187, 'Acas', 21, 1),
(188, 'Cajamarquilla', 21, 1),
(189, 'Cochas', 21, 1),
(190, 'Congas', 21, 1),
(191, 'Llipa', 21, 1),
(192, 'San CristÃ³bal de Rajan', 21, 1),
(193, 'San Pedro', 21, 1),
(194, 'Santiago de Chilcas', 21, 1),
(195, 'Cabana', 22, 1),
(196, 'Bolognesi', 22, 1),
(197, 'Conchucos', 22, 1),
(198, 'Huacaschuque', 22, 1),
(199, 'Huandoval', 22, 1),
(200, 'Lacabamba', 22, 1),
(201, 'Llapo', 22, 1),
(202, 'Pallasca', 22, 1),
(203, 'Pampas', 22, 1),
(204, 'Santa rosÃ¡', 22, 1),
(205, 'Tauca', 22, 1),
(206, 'Pomabamba', 23, 1),
(207, 'Huayllan', 23, 1),
(208, 'Parobamba', 23, 1),
(209, 'Quinuabamba', 23, 1),
(210, 'Recuay', 24, 1),
(211, 'Catac', 24, 1),
(212, 'Cotaparaco', 24, 1),
(213, 'Huayllapampa', 24, 1),
(214, ' Huayllapampa', 24, 1),
(215, 'Llacllin', 24, 1),
(216, 'Marca', 24, 1),
(217, 'Pampas Chico', 24, 1),
(218, 'Pararin', 24, 1),
(219, 'Tapacocha', 24, 1),
(220, 'Ticapampa', 24, 1),
(221, 'Chimbote', 25, 1),
(222, 'Caceres del Peru', 25, 1),
(223, 'Coishco', 25, 1),
(224, 'Macate', 25, 1),
(225, 'Moro', 25, 1),
(226, 'NepeÃ±a', 25, 1),
(227, 'Samanco', 25, 1),
(228, 'Santa', 25, 1),
(229, 'Nuevo Chimbote', 25, 1),
(230, 'Sihuas', 26, 1),
(231, 'Acobamba', 26, 1),
(232, 'Alfonso Ugarte', 26, 1),
(233, 'Cashapampa', 26, 1),
(234, 'Chingalpo', 26, 1),
(235, 'Huayllabamba', 26, 1),
(236, 'Quiches', 26, 1),
(237, 'Ragash', 26, 1),
(238, 'San Juan', 26, 1),
(239, 'Sicsibamba', 26, 1),
(240, 'Yungay', 27, 1),
(241, 'Cascapara', 27, 1),
(242, 'Mancos', 27, 1),
(243, 'Matacoto', 27, 1),
(244, 'Quillo', 27, 1),
(245, 'Ranrahirca', 27, 1),
(246, 'Shupluy', 27, 1),
(247, 'Yanama', 27, 1),
(248, 'Abancay', 28, 1),
(249, 'Chacoche', 28, 1),
(250, 'Circa', 28, 1),
(251, 'Curahuasi', 28, 1),
(252, 'Huanipaca', 28, 1),
(253, 'Lambrama', 28, 1),
(254, 'Pichirhua', 28, 1),
(255, 'San Pedro de Cachora', 28, 1),
(256, 'Tamburco', 28, 1),
(257, 'Andahuaylas', 29, 1),
(258, 'Andarapa', 29, 1),
(259, 'Chiara', 29, 1),
(260, 'Huancarama', 29, 1),
(261, 'Huancaray', 29, 1),
(262, 'Huayana', 29, 1),
(263, 'Kishuara', 29, 1),
(264, 'Pacobamba', 29, 1),
(265, 'Pacucha', 29, 1),
(266, 'Pampachiri', 29, 1),
(267, 'Pomacocha', 29, 1),
(268, 'San Antonio de Cachi', 29, 1),
(269, 'San Jeronimo', 29, 1),
(270, 'San Miguel de Chaccrampa', 29, 1),
(271, 'Santa Maria de Chicmo', 29, 1),
(272, 'Talavera', 29, 1),
(273, 'Tumay Huaraca', 29, 1),
(274, 'Turpo', 29, 1),
(275, 'Kaquiabamba', 29, 1),
(276, 'Jose Maria Arguedas', 29, 1),
(277, 'Antabamba', 30, 1),
(278, 'El Oro', 30, 1),
(279, 'Huaquirca', 30, 1),
(280, 'Juan Espinoza Medrano', 30, 1),
(281, 'Oropesa', 30, 1),
(282, 'Pachaconas', 30, 1),
(283, 'Sabaino', 30, 1),
(284, 'Chalhuanca', 31, 1),
(285, 'Capaya', 31, 1),
(286, 'Caraybamba', 31, 1),
(287, 'Chapimarca', 31, 1),
(288, 'Colcabamba', 31, 1),
(289, 'Cotaruse', 31, 1),
(290, 'Ihuayllo', 31, 1),
(291, 'Justo Apu Sahuaraura', 31, 1),
(292, 'Lucre', 31, 1),
(293, 'Pocohuanca', 31, 1),
(294, 'San Juan de ChacÃ±a', 31, 1),
(295, 'SaÃ±ayca', 31, 1),
(296, 'Soraya', 31, 1),
(297, 'Tapairihua', 31, 1),
(298, 'Tintay', 31, 1),
(299, 'Toraya', 31, 1),
(300, 'Yanaca', 31, 1),
(301, 'Tambobamba', 32, 1),
(302, 'Cotabambas', 32, 1),
(303, 'Coyllurqui', 32, 1),
(304, 'Haquira', 32, 1),
(305, 'Mara', 32, 1),
(306, 'Challhuahuacho', 32, 1),
(307, 'Chincheros', 33, 1),
(308, 'Anco Huallo', 33, 1),
(309, 'Cocharcas', 33, 1),
(310, 'Huaccana', 33, 1),
(311, 'Ocobamba', 33, 1),
(312, 'Ongoy', 33, 1),
(313, 'Uranmarca', 33, 1),
(314, 'Ranracancha', 33, 1),
(315, 'Rocchacc', 33, 1),
(316, 'El Porvenir', 33, 1),
(317, 'Chuquibambilla', 34, 1),
(318, 'Curpahuasi', 34, 1),
(319, 'Gamarra', 34, 1),
(320, 'Huayllati', 34, 1),
(321, 'Mamara', 34, 1),
(322, 'Micaela Bastidas', 34, 1),
(323, 'Pataypampa', 34, 1),
(324, 'Progreso', 34, 1),
(325, 'San Antonio', 34, 1),
(326, 'SantÃ¡ rosa', 34, 1),
(327, 'turpay', 34, 1),
(328, 'Vilcabamba', 34, 1),
(329, 'Virundo', 34, 1),
(330, 'Curasco', 34, 1),
(331, 'Arequipa', 35, 1),
(332, 'Alto Selva Alegre', 35, 1),
(333, 'Cayma', 35, 1),
(334, 'Cerro Colorado', 35, 1),
(335, 'Characato', 35, 1),
(336, 'Chiguata', 35, 1),
(337, 'Jacobo Hunter', 35, 1),
(338, 'La Joya', 35, 1),
(339, 'Mariano Melgar', 35, 1),
(340, 'Miraflores', 35, 1),
(341, 'Mollebaya', 35, 1),
(342, 'Paucarpata', 35, 1),
(343, 'Pocsi', 35, 1),
(344, 'Polobaya', 35, 1),
(345, 'QuequeÃ±a', 35, 1),
(346, 'Sabandia', 35, 1),
(347, 'Sachaca', 35, 1),
(348, 'San Juan de Siguas', 35, 1),
(349, 'Santa Rita de Siguas', 35, 1),
(350, 'Socabaya', 35, 1),
(351, 'Tiabaya', 35, 1),
(352, 'Uchumayo', 35, 1),
(353, 'Vitor', 35, 1),
(354, 'Yanahuara', 35, 1),
(355, 'Yarabamba', 35, 1),
(356, 'Yura', 35, 1),
(357, 'JosÃ© Luis Bustamante Y Rivero', 35, 1),
(358, 'Camana', 36, 1),
(359, 'Jose Mari­a Quimper', 36, 1),
(360, 'Mariano Nicolas Valcarcel', 36, 1),
(361, 'Mariscal Caceres', 36, 1),
(362, 'Nicolas de Pierola', 36, 1),
(363, 'Ocoaña', 36, 1),
(364, 'Quilca', 36, 1),
(365, 'Samuel Pastor', 36, 1),
(366, 'Caravela', 37, 1),
(367, 'Acara', 37, 1),
(368, 'Atico', 37, 1),
(369, 'Atiquipa', 37, 1),
(370, 'Bella Union', 37, 1),
(371, 'Cahuacho', 37, 1),
(372, 'Chala', 37, 1),
(373, 'Chaparra', 37, 1),
(374, 'Huanuhuanu', 37, 1),
(375, 'Jaqui', 37, 1),
(376, 'Lomas', 37, 1),
(377, 'Quicacha', 37, 1),
(378, 'Yauca', 37, 1),
(379, 'Aplao', 38, 1),
(380, 'Andagua', 38, 1),
(381, 'Ayo', 38, 1),
(382, 'Chachas', 38, 1),
(383, 'Chilcaymarca', 38, 1),
(384, 'Choco', 38, 1),
(385, 'Huancarqui', 38, 1),
(386, 'Machaguay', 38, 1),
(387, 'Orcopampa', 38, 1),
(388, 'Pampacolca', 38, 1),
(389, 'Tipan', 38, 1),
(390, 'Union', 38, 1),
(391, 'Uraca', 38, 1),
(392, 'Viraco', 38, 1),
(393, 'Chivay', 39, 1),
(394, 'Achoma', 39, 1),
(395, 'Cabanaconde', 39, 1),
(396, 'Callalli', 39, 1),
(397, 'Caylloma', 39, 1),
(398, 'Coporaque', 39, 1),
(399, 'Huamba', 39, 1),
(400, 'Huanca', 39, 1),
(401, 'Ichupampa', 39, 1),
(402, 'Lari', 39, 1),
(403, 'Lluta', 39, 1),
(404, 'Maca', 39, 1),
(405, 'Madrigal', 39, 1),
(406, 'San Antonio de Chuca', 39, 1),
(407, 'Sibayo', 39, 1),
(408, 'Tapay', 39, 1),
(409, 'Tisco', 39, 1),
(410, 'Tuti', 39, 1),
(411, 'Yanque', 39, 1),
(412, 'Majes', 39, 1),
(413, 'Chuquibamba', 40, 1),
(414, 'Andaray', 40, 1),
(415, 'Cayarani', 40, 1),
(416, 'Chichas', 40, 1),
(417, 'Iray', 40, 1),
(418, 'Rio Grande', 40, 1),
(419, 'Salamanca', 40, 1),
(420, 'Yanaquihua', 40, 1),
(421, 'Mollendo', 41, 1),
(422, 'Cocachacra', 41, 1),
(423, 'Dean Valdivia', 41, 1),
(424, 'Islay', 41, 1),
(425, 'Mejia', 41, 1),
(426, 'Punta de Bombin', 41, 1),
(427, 'Cotahuasi', 42, 1),
(428, 'Alca', 42, 1),
(429, 'Charcana', 42, 1),
(430, 'Huaynacotas', 42, 1),
(431, 'Pampamarca', 42, 1),
(432, 'Puyca', 42, 1),
(433, 'Quechualla', 42, 1),
(434, 'Sayla', 42, 1),
(435, 'Tauria', 42, 1),
(436, 'Tomepampa', 42, 1),
(437, 'Toro', 42, 1),
(438, 'Ayacucho', 43, 1),
(439, 'Acocro', 43, 1),
(440, 'Acos Vinchos', 43, 1),
(441, 'Carmen Alto', 43, 1),
(442, 'Chiara', 43, 1),
(443, 'Ocras', 43, 1),
(444, 'Pacaycasa', 43, 1),
(445, 'Quinua', 43, 1),
(446, 'San JosÃ© de Ticllas', 43, 1),
(447, 'San Juan Bautista', 43, 1),
(448, 'Santiago de Pischa', 43, 1),
(449, 'Socos', 43, 1),
(450, 'Tambillo', 43, 1),
(451, 'Vinchos', 43, 1),
(452, 'JesÃºs Nazareno', 43, 1),
(453, 'Andres Avelino Caceres Dorregaray', 43, 1),
(454, 'Cangallo', 44, 1),
(455, 'Chuschi', 44, 1),
(456, 'Los Morochucos', 44, 1),
(457, 'Maria Parado de Bellido', 44, 1),
(458, 'Paras', 44, 1),
(459, 'Totos', 44, 1),
(460, 'Sancos', 45, 1),
(461, 'Carapo', 45, 1),
(462, 'Sacsamarca', 45, 1),
(463, 'Santiago de Lucanamarca', 45, 1),
(464, 'Huanta', 46, 1),
(465, 'Ayahuanco', 46, 1),
(466, 'Huamanguilla', 46, 1),
(467, 'Iguain', 46, 1),
(468, 'Luricocha', 46, 1),
(469, 'Santillana', 46, 1),
(470, 'Sivia', 46, 1),
(471, 'Llochegua', 46, 1),
(472, 'Canayre', 46, 1),
(473, 'Uchuraccay', 46, 1),
(474, 'Pucacolpa', 46, 1),
(475, 'Chaca', 46, 1),
(476, 'San Miguel', 47, 1),
(477, 'Anco', 47, 1),
(478, 'Ayna', 47, 1),
(479, 'Chilcas', 47, 1),
(480, 'Chungui', 47, 1),
(481, 'Luis Carranza', 47, 1),
(482, 'SantaRosa', 47, 1),
(483, 'Tambo', 47, 1),
(484, 'Samugari', 47, 1),
(485, 'Anchihuay', 47, 1),
(486, 'Puquio', 48, 1),
(487, 'Aucara', 48, 1),
(488, 'CabanÃ¡', 48, 1),
(489, 'Carmen Salcedo', 48, 1),
(490, 'Chaviña', 48, 1),
(491, 'Chipao', 48, 1),
(492, 'Huac-Huas', 48, 1),
(493, 'Laramate', 48, 1),
(494, 'Leoncio Prado', 48, 1),
(495, 'Llauta', 48, 1),
(496, 'Lucanas', 48, 1),
(497, 'OcaÃ±a', 48, 1),
(498, 'Otoca', 48, 1),
(499, 'Saisa', 48, 1),
(500, 'San Cristobal', 48, 1),
(501, 'San Juan', 48, 1),
(502, 'San Pedro', 48, 1),
(503, 'San Pedro de Palco', 48, 1),
(504, 'Sancos', 48, 1),
(505, 'Santa Ana de Huaycahuacho', 48, 1),
(506, 'Santa Lucia', 48, 1),
(507, 'Coracora', 49, 1),
(508, 'Chumpi', 49, 1),
(509, 'Coronel Castañeda', 49, 1),
(510, 'Pacapausa', 49, 1),
(511, 'Pullo', 49, 1),
(512, 'Puyusca', 49, 1),
(513, 'San Francisco de Ravacayco', 49, 1),
(514, 'Upahuacho', 49, 1),
(515, 'Pausa', 50, 1),
(516, 'Colta', 50, 1),
(517, 'Corculla', 50, 1),
(518, 'Lampa', 50, 1),
(519, 'Marcabamba', 50, 1),
(520, 'Oyolo', 50, 1),
(521, 'Pararca', 50, 1),
(522, 'San Javier de Alpabamba', 50, 1),
(523, 'San Jose de Ushua', 50, 1),
(524, 'Sara Sara', 50, 1),
(525, 'Querobamba', 51, 1),
(526, 'BelÃ©n', 51, 1),
(527, 'Chalcos', 51, 1),
(528, 'Chilcayoc', 51, 1),
(529, 'HuacaÃ±a', 51, 1),
(530, 'Morcolla', 51, 1),
(531, 'Paico', 51, 1),
(532, 'San Pedro de Larcay', 51, 1),
(533, 'San Salvador de Quije', 51, 1),
(534, 'Santiago de Paucaray', 51, 1),
(535, 'Soras', 51, 1),
(536, 'Huancapi', 52, 1),
(537, 'Alcamenca', 52, 1),
(538, 'Apongo', 52, 1),
(539, 'Asquipata', 52, 1),
(540, 'Canaria', 52, 1),
(541, 'Cayara', 52, 1),
(542, 'Colca', 52, 1),
(543, 'Huamanquiquia', 52, 1),
(544, 'Huancaraylla', 52, 1),
(545, 'Huaya', 52, 1),
(546, 'Sarhua', 52, 1),
(547, 'Vilcanchos', 52, 1),
(548, 'Vilcas Huaman', 53, 1),
(549, 'Accomarca', 53, 1),
(550, 'Carhuanca', 53, 1),
(551, 'ConcepciÃ³n', 53, 1),
(552, 'Huambalpa', 53, 1),
(553, 'Independencia', 53, 1),
(554, 'Saurama', 53, 1),
(555, 'Vischongo', 53, 1),
(556, 'Cajamarca', 54, 1),
(557, 'Asuncion', 54, 1),
(558, 'Chetilla', 54, 1),
(559, 'Cospan', 54, 1),
(560, 'EncaÃ±ada', 54, 1),
(561, 'Jesus', 54, 1),
(562, 'Llacanora', 54, 1),
(563, 'Los BaÃ±os del Inca', 54, 1),
(564, 'MagdalenÃ¡', 54, 1),
(565, 'Matara', 54, 1),
(566, 'Namora', 54, 1),
(567, 'San JÃºan', 54, 1),
(568, 'Cajabamba', 55, 1),
(569, 'Cachachi', 55, 1),
(570, 'Condebamba', 55, 1),
(571, 'Sitacocha', 55, 1),
(572, 'CelendÃ­n', 56, 1),
(573, 'Chumuch', 56, 1),
(574, 'Cortegana', 56, 1),
(575, 'Huasmin', 56, 1),
(576, 'Jorge Chavez', 56, 1),
(577, 'Jose Galvez', 56, 1),
(578, 'Miguel Iglesias', 56, 1),
(579, 'Oxamarca', 56, 1),
(580, 'Sorochuco', 56, 1),
(581, 'Sucre', 56, 1),
(582, 'Utco', 56, 1),
(583, 'La Libertad de Pallan', 56, 1),
(584, 'Chota', 57, 1),
(585, 'Anguia', 57, 1),
(586, 'Chadin', 57, 1),
(587, 'Chiguirip', 57, 1),
(588, 'Chimban', 57, 1),
(589, 'Choropampa', 57, 1),
(590, 'CochabambÃ¡', 57, 1),
(591, 'Conchan', 57, 1),
(592, 'Huambos', 57, 1),
(593, 'Lajas', 57, 1),
(594, 'Llama', 57, 1),
(595, 'Miracosta', 57, 1),
(596, 'Paccha', 57, 1),
(597, 'Pion', 57, 1),
(598, 'Querocoto', 57, 1),
(599, 'San Juan de Licupis', 57, 1),
(600, 'Tacabamba', 57, 1),
(601, 'Tocmoche', 57, 1),
(602, 'Chalamarca', 57, 1),
(603, 'Contumaza', 58, 1),
(604, 'Chilete', 58, 1),
(605, 'Cupisnique', 58, 1),
(606, 'Guzmango', 58, 1),
(607, 'San Benito', 58, 1),
(608, 'Santa Cruz de Toledo', 58, 1),
(609, 'Tantarica', 58, 1),
(610, 'Yonan', 58, 1),
(611, 'Cutervo', 59, 1),
(612, 'Callayuc', 59, 1),
(613, 'Choros', 59, 1),
(614, 'Cujillo', 59, 1),
(615, 'La Ramada', 59, 1),
(616, 'Pimpingos', 59, 1),
(617, 'Querocotillo', 59, 1),
(618, 'San AndrÃ©s de Cutervo', 59, 1),
(619, 'San Juan de Cutervo', 59, 1),
(620, 'San Luis de Lucma', 59, 1),
(621, 'Santa CrÃºz', 59, 1),
(622, 'Santo Domingo de la Capilla', 59, 1),
(623, 'Santo TomÃ¡s', 59, 1),
(624, 'Socota', 59, 1),
(625, 'Toribio Casanova', 59, 1),
(626, 'Bambamarca', 60, 1),
(627, 'Chugur', 60, 1),
(628, 'Hualgayoc', 60, 1),
(629, 'JaÃ©n', 61, 1),
(630, 'Bellavista', 61, 1),
(631, 'Chontali', 61, 1),
(632, 'Colasay', 61, 1),
(633, 'Huabal', 61, 1),
(634, 'Las Pirias', 61, 1),
(635, 'Pomahuaca', 61, 1),
(636, 'Pucara', 61, 1),
(637, 'Sallique', 61, 1),
(638, 'San Felipe', 61, 1),
(639, 'San JosÃ© del Alto', 61, 1),
(640, 'Santa RÃ³sa', 61, 1),
(641, 'San Ignacio', 62, 1),
(642, 'Chirinos', 62, 1),
(643, 'Huarango', 62, 1),
(644, 'La Coipa', 62, 1),
(645, 'Namballe', 62, 1),
(646, 'San JosÃ© de Lourdes', 62, 1),
(647, 'Tabaconas', 62, 1),
(648, 'Pedro GÃ¡lvez', 63, 1),
(649, 'Chancay', 63, 1),
(650, 'Eduardo Villanueva', 63, 1),
(651, 'Gregorio Pita', 63, 1),
(652, 'Ichocan', 63, 1),
(653, 'JosÃ© Manuel Quiroz', 63, 1),
(654, 'JosÃ© Sabogal', 63, 1),
(655, 'San Miguel', 64, 1),
(656, 'Bolivar', 64, 1),
(657, 'Calquis', 64, 1),
(658, 'Catilluc', 64, 1),
(659, 'El Prado', 64, 1),
(660, 'La Florida', 64, 1),
(661, 'Llapa', 64, 1),
(662, 'Nanchoc', 64, 1),
(663, 'Niepos', 64, 1),
(664, 'San Gregorio', 64, 1),
(665, 'San Silvestre de Cochan', 64, 1),
(666, 'Tongod', 64, 1),
(667, 'Union Agua Blanca', 64, 1),
(668, 'San Pablo', 65, 1),
(669, 'San Bernardino', 65, 1),
(670, 'San Luis', 65, 1),
(671, 'Tumbaden', 65, 1),
(672, 'SantÃ¡ Cruz', 66, 1),
(673, 'Andabamba', 66, 1),
(674, 'Catache', 66, 1),
(675, 'ChancaybaÃ±os', 66, 1),
(676, 'La Esperanza', 66, 1),
(677, 'Ninabamba', 66, 1),
(678, 'Pulan', 66, 1),
(679, 'Saucepampa', 66, 1),
(680, 'Sexi', 66, 1),
(681, 'Uticyacu', 66, 1),
(682, 'Yauyucan', 66, 1),
(683, 'Callao', 67, 1),
(684, 'BellavistÃ¡', 67, 1),
(685, 'Carmen de la Legua Reynoso', 67, 1),
(686, 'La Perla', 67, 1),
(687, 'La Punta', 67, 1),
(688, 'Ventanilla', 67, 1),
(689, 'Mi PerÃº', 67, 1),
(690, 'Cusco', 68, 1),
(691, 'Ccorca', 68, 1),
(692, 'Poroy', 68, 1),
(693, 'San JeronimÃ³', 68, 1),
(694, 'San Sebastian', 68, 1),
(695, 'Santiago', 68, 1),
(696, 'Saylla', 68, 1),
(697, 'Wanchaq', 68, 1),
(698, 'Acomayo', 69, 1),
(699, 'Acopia', 69, 1),
(700, 'Acos', 69, 1),
(701, 'Mosoc Llacta', 69, 1),
(702, 'Pomacanchi', 69, 1),
(703, 'Rondocan', 69, 1),
(704, 'Sangarara', 69, 1),
(705, 'AntÃ¡', 70, 1),
(706, 'Ancahuasi', 70, 1),
(707, 'Cachimayo', 70, 1),
(708, 'Chinchaypujio', 70, 1),
(709, 'Huarocondo', 70, 1),
(710, 'Limatambo', 70, 1),
(711, 'Mollepata', 70, 1),
(712, 'Pucyura', 70, 1),
(713, 'Zurite', 70, 1),
(715, 'Coya', 71, 1),
(720, 'Taray', 71, 1),
(714, 'Calca', 71, 1),
(719, 'San Salvador', 71, 1),
(718, 'Pisac', 71, 1),
(717, 'Lares', 71, 1),
(716, 'Lamay', 71, 1),
(721, 'Yanatile', 71, 1),
(722, 'Yanaoca', 72, 1),
(723, 'Checca', 72, 1),
(724, 'Kunturkanki', 72, 1),
(725, 'Langui', 72, 1),
(726, 'Layo', 72, 1),
(727, 'Pampamarca', 72, 1),
(728, 'Quehue', 72, 1),
(729, 'Tupac Amaru', 72, 1),
(730, 'Sicuani', 73, 1),
(731, 'Checacupe', 73, 1),
(732, 'Combapata', 73, 1),
(733, 'Marangani', 73, 1),
(734, 'Pitumarca', 73, 1),
(735, 'San Pablo', 73, 1),
(736, 'San Pedro', 73, 1),
(737, 'Tinta', 73, 1),
(738, 'Santo Tomas', 74, 1),
(739, 'Capacmarca', 74, 1),
(740, 'Chamaca', 74, 1),
(741, 'Colquemarca', 74, 1),
(742, 'Livitaca', 74, 1),
(743, 'Llusco', 74, 1),
(744, 'Quiañota', 74, 1),
(745, 'Velille', 74, 1),
(746, 'Espinar', 75, 1),
(747, 'Condoroma', 75, 1),
(748, 'Coporaqui', 75, 1),
(749, 'Ocoruro', 75, 1),
(750, 'Pallpata', 75, 1),
(751, 'Pichigua', 75, 1),
(752, 'Suyckutambo', 75, 1),
(753, 'Alto Pichigua', 75, 1),
(754, 'Santa Ana', 76, 1),
(755, 'Echarate', 76, 1),
(756, 'Huayopata', 76, 1),
(757, 'Maranura', 76, 1),
(758, 'Ocobamba', 76, 1),
(759, 'Quellouno', 76, 1),
(760, 'Kimbiri', 76, 1),
(761, 'Santa Teresa', 76, 1),
(762, 'VilcabambÃ¡', 76, 1),
(763, 'Pichari', 76, 1),
(764, 'Inkawasi', 76, 1),
(765, 'Villa Virgen', 76, 1),
(766, 'Villa Kintiarina', 76, 1),
(767, 'Paruro', 77, 1),
(768, 'Accha', 77, 1),
(769, 'Ccapi', 77, 1),
(770, 'Colcha', 77, 1),
(771, 'Huanoquite', 77, 1),
(772, 'Omacha', 77, 1),
(773, 'Paccaritambo', 77, 1),
(774, 'Pillpinto', 77, 1),
(775, 'Yaurisque', 77, 1),
(776, 'Paucartambo', 78, 1),
(777, 'Caicay', 78, 1),
(778, 'Challabamba', 78, 1),
(779, 'Colquepata', 78, 1),
(780, 'Huancarani', 78, 1),
(781, 'KosÃ±ipata', 78, 1),
(782, 'Urcos', 79, 1),
(783, 'Andahuaylillas', 79, 1),
(784, 'Camanti', 79, 1),
(785, 'Ccarhuayo', 79, 1),
(786, 'Ccatca', 79, 1),
(787, 'Cusipata', 79, 1),
(788, 'Huaro', 79, 1),
(789, 'LucrÃ©', 79, 1),
(790, 'Marcapata', 79, 1),
(791, 'Ocongate', 79, 1),
(792, 'Oropesa', 79, 1),
(793, 'Quiquijana', 79, 1),
(794, 'Urubamba', 80, 1),
(795, 'Chinchero', 80, 1),
(796, 'Huayllabamba', 80, 1),
(797, 'Machupicchu', 80, 1),
(798, 'Maras', 80, 1),
(799, 'Ollantaytambo', 80, 1),
(800, 'Yucay', 80, 1),
(801, 'Huancavelica', 81, 1),
(802, 'Acobambilla', 81, 1),
(803, 'Acoria', 81, 1),
(804, 'Conayca', 81, 1),
(805, 'Cuenca', 81, 1),
(806, 'Huachocolpa', 81, 1),
(807, 'Huayllahuara', 81, 1),
(808, 'Izcuchaca', 81, 1),
(809, 'Laria', 81, 1),
(810, 'Manta', 81, 1),
(811, 'Mariscal Caceres', 81, 1),
(812, 'Moya', 81, 1),
(813, 'Nuevo Occoro', 81, 1),
(814, 'Palca', 81, 1),
(815, 'Pilchaca', 81, 1),
(816, 'Vilca', 81, 1),
(817, 'Yauli', 81, 1),
(818, 'Ascension', 81, 1),
(819, 'Huando', 81, 1),
(820, 'Acobamba', 82, 1),
(821, 'Andabamba', 82, 1),
(822, 'Anta', 82, 1),
(823, 'Caja', 82, 1),
(824, 'Marcas', 82, 1),
(825, 'Paucara', 82, 1),
(826, 'Pomacocha', 82, 1),
(827, 'Rosario', 82, 1),
(828, 'Lircay', 83, 1),
(829, 'Anchonga', 83, 1),
(830, 'Callanmarca', 83, 1),
(831, 'Ccochaccasa', 83, 1),
(832, 'Chincho', 83, 1),
(833, 'Congalla', 83, 1),
(834, 'Huanca-Huanca', 83, 1),
(835, 'Huayllay Grande', 83, 1),
(836, 'Julcamarca', 83, 1),
(837, 'San Antonio de Antaparco', 83, 1),
(838, 'Santo Tomas de Pata', 83, 1),
(839, 'Secclla', 83, 1),
(840, 'Castrovirreyna', 84, 1),
(841, 'Arma', 84, 1),
(842, 'Aurahua', 84, 1),
(843, 'Capillas', 84, 1),
(844, 'Chupamarca', 84, 1),
(845, 'Cocas', 84, 1),
(846, 'Huachos', 84, 1),
(847, 'Huamatambo', 84, 1),
(848, 'Mollepampa', 84, 1),
(849, 'San Juan', 84, 1),
(850, 'Santa AnÃ¡', 84, 1),
(851, 'Tantara', 84, 1),
(852, 'Ticrapo', 84, 1),
(853, 'Churcampa', 85, 1),
(854, 'Ancash', 85, 1),
(855, 'Chinchihuasi', 85, 1),
(856, 'El Carmen', 85, 1),
(857, 'La MercÃ©d', 85, 1),
(858, 'Locroja', 85, 1),
(859, 'Paucarbamba', 85, 1),
(860, 'San Miguel de Mayocc', 85, 1),
(861, 'San Pedro de Coris', 85, 1),
(862, 'Pachamarca', 85, 1),
(863, 'Cosme', 85, 1),
(864, 'Huaytara', 86, 1),
(865, 'Ayavi', 86, 1),
(866, 'Cardova', 86, 1),
(867, 'Huayacundo Arma', 86, 1),
(868, 'Laramarca', 86, 1),
(869, 'Ocoyo', 86, 1),
(870, 'Pilpichaca', 86, 1),
(871, 'Querco', 86, 1),
(872, 'Quito-Arma', 86, 1),
(873, 'San Antonio de Cusicancha', 86, 1),
(874, 'San Francisco de Sangayaico', 86, 1),
(875, 'San Isidro', 86, 1),
(876, 'Santiago de Chocorvos', 86, 1),
(877, 'Santiago de Quirahuara', 86, 1),
(878, 'Santo Domingo de Capillas', 86, 1),
(879, 'Tamba', 86, 1),
(880, 'Pampas', 87, 1),
(881, 'Acostambo', 87, 1),
(882, 'Acraquia', 87, 1),
(883, 'Ahuaycha', 87, 1),
(884, 'ColcabambÃ¡', 87, 1),
(885, 'Daniel Hernandez', 87, 1),
(886, 'Huachocolpq', 87, 1),
(887, 'Huaribamba', 87, 1),
(888, 'Ã‘ahuimpuquio', 87, 1),
(889, 'Pazos', 87, 1),
(890, 'Quishuar', 87, 1),
(891, 'Salcabamba', 87, 1),
(892, 'Salcahuasi', 87, 1),
(893, 'San Marcos de Rocchac', 87, 1),
(894, 'Surcubamba', 87, 1),
(895, 'Tintay Puncu', 87, 1),
(896, 'Quichuas', 87, 1),
(897, 'Andaymarca', 87, 1),
(898, 'Roble', 87, 1),
(899, 'Pichos', 87, 1),
(900, 'Huanuco', 88, 1),
(901, 'Amarilis', 88, 1),
(902, 'Chinchao', 88, 1),
(903, 'Churubamba', 88, 1),
(904, 'Margos', 88, 1),
(905, 'Quisqui (Kichki)', 88, 1),
(906, 'San Francisco de Cayran', 88, 1),
(907, 'San Pedro de Chaulan', 88, 1),
(908, 'Santa MarÃ­a del Valle', 88, 1),
(909, 'Yarumayo', 88, 1),
(910, 'Pillco Marca', 88, 1),
(911, 'Yacus', 88, 1),
(912, 'San Pablo de Pillao', 88, 1),
(913, 'Ambo', 89, 1),
(914, 'Cayna', 89, 1),
(915, 'Colpas', 89, 1),
(916, 'Conchamarca', 89, 1),
(917, 'Huacar', 89, 1),
(918, 'San Francisco', 89, 1),
(919, 'San Rafael', 89, 1),
(920, 'Tomay Kichwa', 89, 1),
(921, 'La Union', 90, 1),
(922, 'Chuquis', 90, 1),
(923, 'MarÃ­as', 90, 1),
(924, 'Pachas', 90, 1),
(925, 'Quivilla', 90, 1),
(926, 'Ripan', 90, 1),
(927, 'Shunqui', 90, 1),
(928, 'Sillapata', 90, 1),
(929, 'Yanas', 90, 1),
(930, 'Huacaybamba', 91, 1),
(931, 'Canchabamba', 91, 1),
(932, 'Cochabamba', 91, 1),
(933, 'Pinra', 91, 1),
(934, 'Llata', 92, 1),
(935, 'Arancay', 92, 1),
(936, 'Chavin de Pariarca', 92, 1),
(937, 'Jacas Grande', 92, 1),
(938, 'Jircan', 92, 1),
(939, 'Miraflores', 92, 1),
(940, 'MonzÃ³n', 92, 1),
(941, 'Punchao', 92, 1),
(942, 'PuÃ±os', 92, 1),
(943, 'Singa', 92, 1),
(944, 'Tantamayo', 92, 1),
(945, 'Rupa-Rupa', 93, 1),
(946, 'Daniel AlomÃ­a Robles', 93, 1),
(947, 'HermÃ­lio Valdizan', 93, 1),
(948, 'JosÃ© Crespo y Castillo', 93, 1),
(949, 'Luyando', 93, 1),
(950, 'Mariano Damaso Beraun', 93, 1),
(951, 'Pucayacu', 93, 1),
(952, 'Castillo Grande', 93, 1),
(953, 'Huacrachuco', 94, 1),
(954, 'Cholon', 94, 1),
(955, 'San Buenaventura', 94, 1),
(956, 'La Morada', 94, 1),
(957, 'Santa Rosa de Alto Yanajanca', 94, 1),
(958, 'Panao', 95, 1),
(959, 'Chaglla', 95, 1),
(960, 'Molino', 95, 1),
(961, 'Umari', 95, 1),
(962, 'Puerto Inca', 96, 1),
(963, 'Codo del Pozuzo', 96, 1),
(964, 'Honoria', 96, 1),
(965, 'Tournavista', 96, 1),
(966, 'Yuyapichis', 96, 1),
(967, 'Jesus', 97, 1),
(968, 'BaÃ±os', 97, 1),
(969, 'Jivia', 97, 1),
(970, 'Queropalca', 97, 1),
(971, 'Rondos', 97, 1),
(972, 'San Francisco de AsÃ­s', 97, 1),
(973, 'San Miguel de Cauri', 97, 1),
(974, 'Chavinillo', 98, 1),
(975, 'Cahuac', 98, 1),
(976, 'Chacabamba', 98, 1),
(977, 'Aparicio Pomares', 98, 1),
(978, 'Jacas Chico', 98, 1),
(979, 'Obas', 98, 1),
(980, 'PampamÃ¡rca', 98, 1),
(981, 'Choras', 98, 1),
(988, 'Pueblo Nuevo', 99, 1),
(987, 'Parcona', 99, 1),
(986, 'Pachacutec', 99, 1),
(985, 'Ocucaje', 99, 1),
(984, 'Los Aquijes', 99, 1),
(983, 'La TinguiÃ±a', 99, 1),
(982, 'Ica', 99, 1),
(989, 'Salas', 99, 1),
(990, 'San JosÃ© de Los Molinos', 99, 1),
(991, 'San Juan BautistÃ¡', 99, 1),
(992, 'SantiagÃ³', 99, 1),
(993, 'Subtanjalla', 99, 1),
(994, 'Tate', 99, 1),
(995, 'Yauca del Rosario', 99, 1),
(996, 'Chincha Alta', 100, 1),
(997, 'Alto Laran', 100, 1),
(998, 'Chavin', 100, 1),
(999, ' Chincha Baja', 100, 1),
(1000, 'El CarmÃ©n', 100, 1),
(1001, 'Grocio Prado', 100, 1),
(1002, 'Pueblo NuevÃ³', 100, 1),
(1003, 'San Juan de Yanac', 100, 1),
(1004, 'San Pedro de Huacarpana', 100, 1),
(1005, 'Sunampe', 100, 1),
(1006, 'Tambo de Mora', 100, 1),
(1007, 'Nasca', 101, 1),
(1008, 'Changuillo', 101, 1),
(1009, 'El Ingenio', 101, 1),
(1010, 'Marcona', 101, 1),
(1011, 'Vista AlegrÃ©', 101, 1),
(1012, 'Palpa', 102, 1),
(1013, 'Llipata', 102, 1),
(1014, 'RÃ­o GrandÃ©', 102, 1),
(1015, 'SÃ¡nta Cruz', 102, 1),
(1016, 'Tibillo', 102, 1),
(1017, 'Pisco', 103, 1),
(1018, 'Huancano', 103, 1),
(1019, 'Humay', 103, 1),
(1020, 'IndepÃ©ndencia', 103, 1),
(1021, 'HuancanÃ³', 103, 1),
(1022, 'HumÃ¡y', 103, 1),
(1023, 'IndependencÃ­a', 103, 1),
(1024, 'Paracas', 103, 1),
(1025, 'San AndrÃ©s', 103, 1),
(1026, 'San Clemente', 103, 1),
(1027, 'Tupac Amaru Inca', 103, 1),
(1028, 'Carhuacallanga', 104, 1),
(1029, 'Chacapampa', 1041, 1),
(1030, 'Huancayo', 104, 1),
(1031, 'Chicche', 104, 1),
(1032, 'Chilca', 104, 1),
(1033, 'Chongos Alto', 104, 1),
(1034, 'Chupuro', 104, 1),
(1035, 'ColcÃ¡', 104, 1),
(1036, 'Cullhuas', 104, 1),
(1037, 'El Tambo', 104, 1),
(1038, 'Huacrapuquio', 104, 1),
(1039, 'Hualhuas', 104, 1),
(1040, 'Huancan', 104, 1),
(1041, 'Huasicancha', 104, 1),
(1042, 'Huayucachi', 104, 1),
(1043, 'Ingenio', 104, 1),
(1044, 'PariahuancÃ¡', 104, 1),
(1045, 'Pilcomayo', 104, 1),
(1046, 'PucarÃ¡', 104, 1),
(1047, 'Quichuay', 104, 1),
(1048, 'Quilcas', 104, 1),
(1049, 'San AgustÃ­n', 104, 1),
(1050, 'San JerÃ³nimo de Tunan', 104, 1),
(1051, 'SaÃ±o', 104, 1),
(1052, 'Sapallanga', 104, 1),
(1053, 'Sicaya', 104, 1),
(1054, 'Santo Domingo de Acobamba', 104, 1),
(1055, 'Viques', 104, 1),
(1056, 'Concepcion', 105, 1),
(1057, 'AcÃ³', 105, 1),
(1058, 'Andamarca', 105, 1),
(1059, 'Chambara', 105, 1),
(1060, 'CochÃ¡s', 105, 1),
(1061, 'Comas', 105, 1),
(1062, 'HeroÃ­nas Toledo', 105, 1),
(1063, 'Manzanares', 105, 1),
(1064, 'Mariscal CastillÃ¡', 105, 1),
(1065, 'Matahuasi', 105, 1),
(1066, 'Mito', 105, 1),
(1067, 'Nueve de Julio', 105, 1),
(1068, 'Orcotuna', 105, 1),
(1069, 'San JosÃ© de Quero', 105, 1),
(1070, 'Santa Rosa de Ocopa', 105, 1),
(1071, 'Chanchamayo', 106, 1),
(1072, 'Perene', 106, 1),
(1073, 'Pichanaqui', 106, 1),
(1074, 'San Luis de Shuaro', 106, 1),
(1075, 'San RamÃ³n', 106, 1),
(1076, 'Vitoc', 106, 1),
(1077, 'Jauja', 107, 1),
(1078, 'Acolla', 107, 1),
(1079, 'Apata', 107, 1),
(1080, 'Ataura', 107, 1),
(1081, 'Canchayllo', 107, 1),
(1082, 'Curicaca', 107, 1),
(1083, 'El Mantaro', 107, 1),
(1084, 'Huamali', 107, 1),
(1085, 'Huaripampa', 107, 1),
(1086, 'Huertas', 107, 1),
(1087, 'Janjaillo', 107, 1),
(1088, 'JulcÃ¡n', 107, 1),
(1089, 'Leonor OrdÃ³Ã±ez', 107, 1),
(1090, 'Llocllapampa', 107, 1),
(1091, 'Marco', 107, 1),
(1092, 'Masma', 107, 1),
(1093, 'Masma Chicche', 107, 1),
(1094, 'Molinos', 107, 1),
(1095, 'Monobamba', 107, 1),
(1096, 'Muqui', 107, 1),
(1097, 'Muquiyauyo', 107, 1),
(1098, 'Paca', 107, 1),
(1099, 'PacchÃ¡', 107, 1),
(1100, 'Pancan', 107, 1),
(1101, 'Parco', 107, 1),
(1102, 'Pomacancha', 107, 1),
(1103, 'Ricran', 107, 1),
(1104, 'San Lorenzo', 107, 1),
(1105, 'San Pedro de Chunan', 107, 1),
(1106, 'Sausa', 107, 1),
(1107, 'Sincos', 107, 1),
(1108, 'Tunan Marca', 107, 1),
(1109, 'YaulÃ­', 107, 1),
(1110, 'Yauyos', 107, 1),
(1111, 'Junin', 108, 1),
(1112, 'Carhuamayo', 108, 1),
(1113, 'Ondores', 108, 1),
(1114, 'Ulcumayo', 108, 1),
(1115, 'Satipo', 109, 1),
(1116, 'Coviriali', 109, 1),
(1117, 'Llaylla', 109, 1),
(1118, 'Mazamari', 109, 1),
(1119, 'Pampa Hermosa', 109, 1),
(1120, 'Pangoa', 109, 1),
(1121, 'RÃ­o Negro', 109, 1),
(1122, 'RÃ­o Tambo', 109, 1),
(1123, 'Vizcatan del Ene', 109, 1),
(1124, 'Tarma', 110, 1),
(1125, 'AcobambÃ¡', 110, 1),
(1126, 'Huaricolca', 110, 1),
(1127, 'Huasahuasi', 110, 1),
(1128, 'La Union', 110, 1),
(1129, 'PalcÃ¡', 110, 1),
(1130, 'Palcamayo', 110, 1),
(1131, 'San Pedro de Cajas', 110, 1),
(1132, 'Tapo', 110, 1),
(1133, 'La Oroya', 111, 1),
(1134, 'Chacapalpa', 111, 1),
(1135, 'Huay-Huay', 111, 1),
(1136, 'Marcapomacocha', 111, 1),
(1137, 'Morococha', 111, 1),
(1138, 'PÃ¡ccha', 111, 1),
(1139, 'Santa BÃ¡rbara de Carhuacayan', 111, 1),
(1140, 'Santa Rosa de Sacco', 111, 1),
(1141, 'Suitucancha', 111, 1),
(1142, 'YaÃºli', 111, 1),
(1143, 'Chupaca', 112, 1),
(1144, 'Ahuac', 112, 1),
(1145, 'Chongos Bajo', 112, 1),
(1146, 'Huachac', 112, 1),
(1147, 'Huamancaca Chico', 112, 1),
(1148, 'San Juan de Iscos', 112, 1),
(1149, 'San Juan de Jarpa', 112, 1),
(1150, 'Tres de Diciembre', 112, 1),
(1151, 'Yanacancha', 112, 1),
(1152, 'Trujillo', 113, 1),
(1153, 'El PorvenÃ­r', 113, 1),
(1154, 'Florencia de Mora', 113, 1),
(1155, 'Huanchaco', 113, 1),
(1156, 'La EsperanzÃ¡', 113, 1),
(1157, 'Laredo', 113, 1),
(1158, 'Moche', 113, 1),
(1159, 'Poroto', 113, 1),
(1160, 'Salaverry', 113, 1),
(1161, 'Simbal', 113, 1),
(1162, 'Victor Larco Herrera', 113, 1),
(1163, 'Ascope', 114, 1),
(1164, 'Chicama', 114, 1),
(1165, 'Chocope', 114, 1),
(1166, 'Magdalena de Cao', 114, 1),
(1167, 'Paijan', 114, 1),
(1168, 'RÃ¡zuri', 114, 1),
(1169, 'Santiago de Cao', 114, 1),
(1170, 'Casa Grande', 114, 1),
(1171, 'Bolivar', 115, 1),
(1172, 'BambamarcÃ¡', 115, 1),
(1173, 'Condormarca', 115, 1),
(1174, 'Longotea', 115, 1),
(1175, 'Uchumarca', 115, 1),
(1176, 'Ucuncha', 115, 1),
(1177, 'Chepen', 116, 1),
(1178, 'Pacanga', 116, 1),
(1179, 'Pueblo NuÃ©vo', 116, 1),
(1180, 'Julcan', 117, 1),
(1181, 'Calamarca', 117, 1),
(1182, 'Carabamba', 117, 1),
(1183, 'Huaso', 117, 1),
(1184, 'Otuzco', 118, 1),
(1185, 'Agallpampa', 118, 1),
(1186, 'Charat', 118, 1),
(1187, 'Huaranchal', 118, 1),
(1188, 'La Cuesta', 118, 1),
(1189, 'Mache', 118, 1),
(1190, 'Paranday', 118, 1),
(1191, 'Salpo', 118, 1),
(1192, 'Sinsicap', 118, 1),
(1193, 'Usquil', 118, 1),
(1194, 'San Pedro de Lloc', 119, 1),
(1195, 'Guadalupe', 119, 1),
(1196, 'Jequetepeque', 119, 1),
(1197, 'Pacasmayo', 119, 1),
(1198, 'San JosÃ©', 119, 1),
(1199, 'Tayabamba', 120, 1),
(1200, 'Buldibuyo', 120, 1),
(1201, 'Chillia', 120, 1),
(1202, 'Huancaspata', 120, 1),
(1203, 'Huaylillas', 120, 1),
(1204, 'Huayo', 120, 1),
(1205, 'Ongon', 120, 1),
(1206, 'Parcoy', 120, 1),
(1207, 'Pataz', 120, 1),
(1208, 'Pias', 120, 1),
(1209, 'Santiago de Challas', 120, 1),
(1210, 'Taurija', 120, 1),
(1211, 'Urpay', 120, 1),
(1212, 'Huamachuco', 121, 1),
(1213, 'Chugay', 121, 1),
(1214, 'Cochorco', 121, 1),
(1215, 'Curgos', 121, 1),
(1216, 'Marcabal', 121, 1),
(1217, 'Sanagoran', 121, 1),
(1218, 'Sarin', 121, 1),
(1219, 'Sartimbamba', 121, 1),
(1220, 'Santiago de Chuco', 122, 1),
(1221, 'Angasmarca', 122, 1),
(1222, 'Cachicadan', 122, 1),
(1223, 'Mollebamba', 122, 1),
(1224, 'MollepatÃ¡', 122, 1),
(1225, 'Quiruvilca', 122, 1),
(1226, 'Santa Cruz de Chuca', 122, 1),
(1227, 'Sitabamba', 122, 1),
(1228, 'Cascas', 123, 1),
(1229, 'LucmÃ¡', 123, 1),
(1230, 'Marmot', 123, 1),
(1231, 'Sayapullo', 123, 1),
(1232, 'Viru', 124, 1),
(1233, 'Chao', 124, 1),
(1234, 'Guadalupito', 124, 1),
(1235, 'Chiclayo', 125, 1),
(1236, 'Chongoyape', 125, 1),
(1237, 'Eten', 125, 1),
(1238, 'Eten Puerto', 125, 1),
(1239, 'JosÃ© Leonardo Ortiz', 125, 1),
(1240, 'La Victoria', 125, 1),
(1241, 'Lagunas', 125, 1),
(1242, 'Monsefu', 125, 1),
(1243, 'Nueva Arica', 125, 1),
(1244, 'Oyotun', 125, 1),
(1245, 'Picsi', 125, 1),
(1246, 'Pimentel', 125, 1),
(1247, 'Reque', 125, 1),
(1248, 'SÃ¡nta Rosa', 125, 1),
(1249, 'SaÃ±a', 125, 1),
(1250, 'Cayalti', 125, 1),
(1251, 'Patapo', 125, 1),
(1252, 'Pomalca', 125, 1),
(1253, 'Pucala', 125, 1),
(1254, 'Tuman', 125, 1),
(1255, 'FerreÃ±afe', 126, 1),
(1256, 'CaÃ±aris', 126, 1),
(1257, 'Incahuasi', 126, 1),
(1258, 'Manuel Antonio Mesones Muro', 126, 1),
(1259, 'Pitipo', 126, 1),
(1260, 'Pueblo Nuevo', 126, 1),
(1261, 'Lambayeque', 127, 1),
(1262, 'Chochope', 127, 1),
(1263, 'Illimo', 127, 1),
(1264, 'Jayanca', 127, 1),
(1265, 'Mochumi', 127, 1),
(1266, 'Morrope', 127, 1),
(1267, 'Motupe', 127, 1),
(1268, 'Olmos', 127, 1),
(1269, 'Pacora', 127, 1),
(1270, 'SalÃ¡s', 127, 1),
(1271, 'San Jose', 127, 1),
(1272, 'Tucume', 127, 1),
(1273, 'Lima', 128, 1),
(1274, 'Ancash', 128, 1),
(1275, 'Ate', 128, 1),
(1276, 'Barranco', 128, 1),
(1277, 'Breña', 128, 1),
(1278, 'Carabayllo', 128, 1),
(1279, 'Chaclacayo', 128, 1),
(1280, 'Chorrillos', 128, 1),
(1281, 'Cieneguilla', 128, 1),
(1282, 'ComÃ¡s', 128, 1),
(1283, 'El Agustino', 128, 1),
(1284, 'IndependÃ©ncia', 128, 1),
(1285, 'JesÃºs MarÃ­a', 128, 1),
(1286, 'La Molina', 128, 1),
(1287, 'La VictoriÃ¡', 128, 1),
(1288, 'Lince', 128, 1),
(1289, 'Los Olivos', 128, 1),
(1290, 'Lurigancho', 128, 1),
(1291, 'Lurin', 128, 1),
(1292, 'Magdalena del Mar', 128, 1),
(1293, 'Pueblo LibrÃ©', 128, 1),
(1294, 'MiraflÃ³res', 128, 1),
(1295, 'Pachacamac', 128, 1),
(1296, 'Pucusana', 128, 1),
(1297, 'Puente Piedra', 128, 1),
(1298, 'Punta Hermosa', 128, 1),
(1299, 'Punta Negra', 128, 1),
(1300, 'RÃ­mac', 128, 1),
(1301, 'San Bartolo', 128, 1),
(1302, 'San Borja', 128, 1),
(1303, 'San IsidrÃ³', 128, 1),
(1304, 'San Juan de Lurigancho', 128, 1),
(1305, 'San Juan de Miraflores', 128, 1),
(1306, 'San LÃºis', 128, 1),
(1307, 'San MartÃ­n de Porres', 128, 1),
(1308, 'San MÃ­guel', 128, 1),
(1309, 'Santa Anita', 128, 1),
(1310, 'Santa MarÃ­a del Mar', 128, 1),
(1311, 'SantaRosÃ¡', 128, 1),
(1312, 'Santiago de Surco', 128, 1),
(1313, 'Villa El Salvador', 128, 1),
(1314, 'Villa MarÃ­a del Triunfo', 128, 1),
(1315, 'Barranca', 129, 1),
(1316, 'Paramonga', 129, 1),
(1317, 'Pativilca', 129, 1),
(1318, 'Supe', 129, 1),
(1319, 'Supe Puerto', 129, 1),
(1320, 'Cajatambo', 130, 1),
(1321, 'Copa', 130, 1),
(1322, 'Gorgor', 130, 1),
(1323, 'Huancapon', 130, 1),
(1324, 'Manas', 130, 1),
(1325, 'Canta', 131, 1),
(1326, 'Arahuay', 131, 1),
(1327, 'Huamantanga', 131, 1),
(1328, 'Huaros', 131, 1),
(1329, 'Lachaqui', 131, 1),
(1330, 'San BuenaventurÃ¡', 131, 1),
(1331, 'Santa Rosa de Quives', 131, 1),
(1332, 'San Vicente de CaÃ±ete', 132, 1),
(1333, 'Asia', 132, 1),
(1334, 'Calango', 132, 1),
(1335, 'Cerro Azul', 132, 1),
(1336, 'ChilcÃ¡', 132, 1),
(1337, 'Coayllo', 132, 1),
(1338, 'Imperial', 132, 1),
(1339, 'Lunahuana', 132, 1),
(1340, 'Mala', 132, 1),
(1341, 'Nuevo Imperial', 132, 1),
(1342, 'Pacaran', 132, 1),
(1343, 'Quilmana', 132, 1),
(1344, 'San AntoniÃ³', 132, 1),
(1345, 'SÃ¡n Luis', 132, 1),
(1346, 'Santa Cruz de Flores', 132, 1),
(1347, 'ZÃºÃ±iga', 132, 1),
(1348, 'Huaral', 133, 1),
(1349, 'Atavillos Alto', 133, 1),
(1350, 'Atavillos Bajo', 133, 1),
(1351, 'Aucallama', 133, 1),
(1352, 'ChancÃ¡y', 133, 1),
(1353, 'Ihuari', 133, 1),
(1354, 'Lampian', 133, 1),
(1355, 'Pacaraos', 133, 1),
(1356, 'San Miguel de Acos', 133, 1),
(1357, 'Santa Cruz de Andamarca', 133, 1),
(1358, 'Sumbilca', 133, 1),
(1359, 'Veintisiete de Noviembre', 133, 1),
(1360, 'Matucana', 134, 1),
(1361, 'Antioquia', 134, 1),
(1362, 'Callahuanca', 134, 1),
(1363, 'Carampoma', 134, 1),
(1364, 'Chicla', 134, 1),
(1365, 'CuencÃ¡', 134, 1),
(1366, 'Huachupampa', 134, 1),
(1367, 'Huanza', 134, 1),
(1368, 'Huarochiri', 134, 1),
(1369, 'Lahuaytambo', 134, 1),
(1370, 'Langa', 134, 1),
(1371, 'Laraos', 134, 1),
(1372, 'Mariatana', 134, 1),
(1373, 'Ricardo Palma', 134, 1),
(1374, 'San AndrÃ©s de Tupicocha', 134, 1),
(1375, 'San AntonÃ­o', 134, 1),
(1376, 'San BartolomÃ©', 134, 1),
(1377, 'San Damian', 134, 1),
(1378, 'San Juan de Iris', 134, 1),
(1379, 'San Juan de Tantaranche', 134, 1),
(1380, 'San Lorenzo de Quinti', 134, 1),
(1381, 'San Mateo', 134, 1),
(1382, 'San Mateo de Otao', 134, 1),
(1383, 'San Pedro de Casta', 134, 1),
(1384, 'San Pedro de Huancayre', 134, 1),
(1385, 'Sangallaya', 134, 1),
(1386, 'Santa Cruz de Cocachacra', 134, 1),
(1387, 'Santa Eulalia', 134, 1),
(1388, 'Santiago de Anchucaya', 134, 1),
(1389, 'Santiago de Tuna', 134, 1),
(1390, 'Santo Domingo de Los Olleros', 134, 1),
(1391, 'Surco', 134, 1),
(1392, 'Huacho', 135, 1),
(1393, 'Ambar', 135, 1),
(1394, 'Caleta de Carquin', 135, 1),
(1395, 'Checras', 135, 1),
(1396, 'Hualmay', 135, 1),
(1397, 'Huaura', 135, 1),
(1398, 'Leoncio Prado', 135, 1),
(1399, 'Paccho', 135, 1),
(1400, 'Santa Leonor', 135, 1),
(1401, 'Santa Maria', 135, 1),
(1402, 'Sayan', 135, 1),
(1403, 'Vegueta', 135, 1),
(1404, 'Oyon', 136, 1),
(1405, 'Andajes', 136, 1),
(1406, 'Caujul', 136, 1),
(1407, 'Cochamarca', 136, 1),
(1408, 'Navan', 136, 1),
(1409, 'Pachangara', 136, 1),
(1410, 'YauyÃ³s', 137, 1),
(1411, 'Alis', 137, 1),
(1412, 'Allauca', 137, 1),
(1413, 'Ayaviri', 137, 1),
(1414, 'Azangaro', 137, 1),
(1415, 'Cacra', 137, 1),
(1416, 'Carania', 137, 1),
(1417, 'Catahuasi', 137, 1),
(1418, 'Chocos', 137, 1),
(1419, 'Cachas', 137, 1),
(1420, 'Colonia', 137, 1),
(1421, 'Hongos', 137, 1),
(1422, 'Huampara', 137, 1),
(1423, 'Huancaya', 137, 1),
(1424, 'Huangascar', 137, 1),
(1425, 'Huantan', 137, 1),
(1426, 'HuaÃ±ec', 137, 1),
(1427, 'LaraÃ³s', 137, 1),
(1428, 'Lincha', 137, 1),
(1429, 'Madean', 137, 1),
(1430, 'Miraflores', 137, 1),
(1431, 'Omas', 137, 1),
(1432, 'Putinza', 137, 1),
(1433, 'Quinches', 137, 1),
(1434, 'Quinocay', 137, 1),
(1435, 'San JoaquÃ­n', 137, 1),
(1436, 'San Pedro de Pilas', 137, 1),
(1437, 'Tanta', 137, 1),
(1438, 'Tauripampa', 137, 1),
(1439, 'Tomas', 137, 1),
(1440, 'Tupe', 137, 1),
(1441, 'ViÃ±ac', 137, 1),
(1442, 'Vitis', 137, 1),
(1443, 'Iquitos', 138, 1),
(1444, 'Alto Nanay', 138, 1),
(1445, 'Fernando Lores', 138, 1),
(1446, 'Indiana', 138, 1),
(1447, 'Las Amazonas', 138, 1),
(1448, 'Mazan', 138, 1),
(1449, 'Napo', 138, 1),
(1450, 'Punchana', 138, 1),
(1451, 'Torres Causana', 138, 1),
(1452, 'Belen', 138, 1),
(1453, 'San JuÃ¡n Bautista', 138, 1),
(1454, 'Yurimaguas', 139, 1),
(1455, 'Balsapuerto', 139, 1),
(1456, 'Jeberos', 139, 1),
(1457, 'LagunÃ¡s', 139, 1),
(1458, 'SÃ¡ntaCruz', 139, 1),
(1459, 'Teniente Cesar LÃ³pez Rojas', 139, 1),
(1460, 'Nauta', 140, 1),
(1461, 'Parinari', 140, 1),
(1462, 'Tigre', 140, 1),
(1463, 'Trompeteros', 140, 1),
(1464, 'Urarinas', 140, 1),
(1465, 'Ramon Castilla', 141, 1),
(1466, 'Pebas', 141, 1),
(1467, 'Yavari', 141, 1),
(1468, 'SÃ¡n Pablo', 141, 1),
(1469, 'Requena', 142, 1),
(1470, 'Alto Tapiche', 142, 1),
(1471, 'Capelo', 142, 1),
(1472, 'Emilio San MartÃ­n', 142, 1),
(1473, 'Maquia', 142, 1),
(1474, 'Puinahua', 142, 1),
(1475, 'Saquena', 142, 1),
(1476, 'Soplin', 142, 1),
(1477, 'Tapiche', 142, 1),
(1478, 'Jenaro Herrera', 142, 1),
(1479, 'Yaquerana', 142, 1),
(1480, 'Contamana', 143, 1),
(1481, 'Inahuaya', 143, 1),
(1482, 'Padre MÃ¡rquez', 143, 1),
(1483, 'Pampa HermosÃ¡', 143, 1),
(1484, 'Sarayacu', 143, 1),
(1485, 'Vargas Guerra', 143, 1),
(1486, 'BarrancÃ¡', 144, 1),
(1487, 'Cahuapanas', 144, 1),
(1488, 'Manseriche', 144, 1),
(1489, 'Morona', 144, 1),
(1490, 'Pastaza', 144, 1),
(1491, 'Andoas', 144, 1),
(1492, 'Putumayo', 145, 1),
(1493, 'Rosa Panduro', 145, 1),
(1494, 'Teniente Manuel Clavero', 145, 1),
(1495, 'Yaguas', 145, 1),
(1496, 'Tambopata', 146, 1),
(1497, 'Inambari', 146, 1),
(1498, 'Las Piedras', 146, 1),
(1499, 'Laberinto', 146, 1),
(1500, 'Manu', 147, 1),
(1501, 'Fitzcarrald', 147, 1),
(1502, 'Madre de Dios', 147, 1),
(1503, 'Huepetuhe', 147, 1),
(1504, 'IÃ±apari', 148, 1),
(1505, 'Iberia', 148, 1),
(1506, 'Tahuamanu', 148, 1),
(1507, 'Moquegua', 149, 1),
(1508, 'Carumas', 149, 1),
(1509, 'Cuchumbaya', 149, 1),
(1510, 'Samegua', 149, 1),
(1511, 'SanCristobal', 149, 1),
(1512, 'Torata', 149, 1),
(1513, 'Omate', 150, 1),
(1514, 'Chojata', 150, 1),
(1515, 'Coalaque', 150, 1),
(1516, 'IchuÃ±a', 150, 1),
(1517, 'La Capilla', 150, 1),
(1518, 'Lloque', 150, 1),
(1519, 'Matalaque', 150, 1),
(1520, 'Puquina', 150, 1),
(1521, 'Quinistaquillas', 150, 1),
(1522, 'Ubinas', 150, 1),
(1523, 'Yunga', 150, 1),
(1524, 'Ilo', 151, 1),
(1525, 'El Algarrobal', 151, 1),
(1526, 'Pacocha', 151, 1),
(1527, 'Chaupimarca', 152, 1),
(1528, 'Huachon', 152, 1),
(1529, 'Huariaca', 152, 1),
(1530, 'Huayllay', 152, 1),
(1531, 'Ninacaca', 152, 1),
(1532, 'Pallanchacra', 152, 1),
(1533, 'PaucartambÃ³', 152, 1),
(1534, 'San Francisco de AsÃ­s de Yarusyacan', 152, 1),
(1535, 'Simon BolÃ­var', 152, 1),
(1536, 'Ticlacayan', 152, 1),
(1537, 'Tinyahuarco', 152, 1),
(1538, 'Vicco', 152, 1),
(1539, 'YanacanchÃ¡', 152, 1),
(1540, 'Yanahuanca', 153, 1),
(1541, 'Chacayan', 153, 1),
(1542, 'Goyllarisquizga', 153, 1),
(1543, 'Paucar', 153, 1),
(1544, 'San Pedro de Pillao', 153, 1),
(1545, 'Santa Ana de Tusi', 153, 1),
(1546, 'Tapuc', 153, 1),
(1547, 'VilcÃ¡bamba', 153, 1),
(1548, 'Oxapampa', 154, 1),
(1549, 'Chontabamba', 154, 1),
(1550, 'Huancabamba', 154, 1),
(1551, 'Palcazu', 154, 1),
(1552, 'Pozuzo', 154, 1),
(1553, 'Puerto BermÃºdez', 154, 1),
(1554, 'Villa Rica', 154, 1),
(1555, 'ConstituciÃ³n', 154, 1),
(1556, 'Piura', 155, 1),
(1557, 'Castilla', 155, 1),
(1558, 'Catacaos', 155, 1),
(1559, 'Cura Mori', 155, 1),
(1560, 'El Tallan', 155, 1),
(1561, 'La Arena', 155, 1),
(1562, 'LaUnion', 155, 1),
(1563, 'Las Lomas', 155, 1),
(1564, 'Tambo Grande', 155, 1),
(1565, 'Veintiseis de Octubre', 155, 1),
(1566, 'Ayabaca', 156, 1),
(1567, 'Frias', 156, 1),
(1568, 'Jilili', 156, 1),
(1569, 'LÃ¡gunas', 156, 1),
(1570, 'Montero', 156, 1),
(1571, 'Pacaipampa', 156, 1),
(1572, 'Paimas', 156, 1),
(1573, 'Sapillica', 156, 1),
(1574, 'Sicchez', 156, 1),
(1575, 'Suyo', 156, 1),
(1576, 'HuancabambÃ¡', 157, 1),
(1577, 'Canchaque', 157, 1),
(1578, 'El Carmen de la Frontera', 157, 1),
(1579, 'Huarmaca', 157, 1),
(1580, 'Lalaquiz', 157, 1),
(1581, 'San Miguel de El Faique', 157, 1),
(1582, 'Sondor', 157, 1),
(1583, 'Sondorillo', 157, 1),
(1584, 'Chulucanas', 158, 1),
(1585, 'Buenos Aires', 158, 1),
(1586, 'Chalaco', 158, 1),
(1587, 'La Matanza', 158, 1),
(1588, 'Morropon', 158, 1),
(1589, 'Salitral', 158, 1),
(1590, 'San Juan de Bigote', 158, 1),
(1591, 'Santa Catalina de Mossa', 158, 1),
(1592, 'Santo Domingo', 158, 1),
(1593, 'Yamango', 158, 1),
(1594, 'Paita', 159, 1),
(1595, 'Amotape', 159, 1),
(1596, 'Arenal', 159, 1),
(1597, 'Colan', 159, 1),
(1598, 'La Huaca', 159, 1),
(1599, 'Tamarindo', 159, 1),
(1600, 'Vichayal', 159, 1),
(1601, 'Sullana', 160, 1),
(1602, 'BÃ©llavista', 160, 1),
(1603, 'Ignacio Escudero', 160, 1),
(1604, 'Lancones', 160, 1),
(1605, 'Marcavelica', 160, 1),
(1606, 'Miguel Checa', 160, 1),
(1607, 'Querecotillo', 160, 1),
(1608, 'PariÃ±as', 161, 1),
(1609, 'El Alto', 161, 1),
(1610, 'La Brea', 161, 1),
(1611, 'Lobitos', 161, 1),
(1612, 'Los Organos', 161, 1),
(1613, 'Mancora', 161, 1),
(1614, 'Sechura', 162, 1),
(1615, 'Bellavista de la UniÃ³n', 162, 1),
(1616, 'Bernal', 162, 1),
(1617, 'Cristo Nos Valga', 162, 1),
(1618, 'Vice', 162, 1),
(1619, 'Rinconada Llicuar', 162, 1),
(1620, 'Puno', 163, 1),
(1621, 'Acora', 163, 1),
(1622, 'Amantani', 163, 1),
(1623, 'Atuncolla', 163, 1),
(1624, 'Capachica', 163, 1),
(1625, 'Chucuito', 163, 1),
(1626, 'Coata', 163, 1),
(1627, 'HuatÃ¡', 163, 1),
(1628, 'MaÃ±azo', 163, 1),
(1629, 'Paucarcolla', 163, 1),
(1630, 'Pichacani', 163, 1),
(1631, 'Plateria', 163, 1),
(1632, 'SanAntonio', 163, 1),
(1633, 'Tiquillaca', 163, 1),
(1634, 'Vilque', 163, 1),
(1635, 'Azangaro', 164, 1),
(1636, 'Achaya', 164, 1),
(1637, 'Arapa', 164, 1),
(1638, 'Asillo', 164, 1),
(1639, 'Caminaca', 164, 1),
(1640, 'Chupa', 164, 1),
(1641, 'JosÃ© Domingo Choquehuanca', 164, 1),
(1642, 'MuÃ±ani', 164, 1),
(1643, 'Potoni', 164, 1),
(1644, 'Saman', 164, 1),
(1645, 'San Anton', 164, 1),
(1646, 'San JÃ³se', 164, 1),
(1647, 'San Juan de Salinas', 164, 1),
(1648, 'Santiago de Pupuja', 164, 1),
(1649, 'Tirapata', 164, 1),
(1650, 'Macusani', 165, 1),
(1651, 'Ajoyani', 165, 1),
(1652, 'Ayapata', 165, 1),
(1653, 'Coasa', 165, 1),
(1654, 'Corani', 165, 1),
(1655, 'Crucero', 165, 1),
(1656, 'Ituata', 165, 1),
(1657, 'Ollachea', 165, 1),
(1658, 'San Gaban', 165, 1),
(1659, 'Usicayos', 165, 1),
(1660, 'Juli', 166, 1),
(1661, 'Desaguadero', 166, 1),
(1662, 'Huacullani', 166, 1),
(1663, 'Kelluyo', 166, 1),
(1664, 'Pisacoma', 166, 1),
(1665, 'Pomata', 166, 1),
(1666, 'Zepita', 166, 1),
(1667, 'Ilave', 167, 1),
(1668, 'Capazo', 167, 1),
(1669, 'Pilcuyo', 167, 1),
(1670, 'Santa Rosas', 167, 1),
(1671, 'Conduriri', 167, 1),
(1672, 'Huancane', 168, 1),
(1673, 'Cojata', 168, 1),
(1674, 'CojatÃ¡', 168, 1),
(1675, 'Huatasani', 168, 1),
(1676, 'Inchupalla', 168, 1),
(1677, 'Pusi', 168, 1),
(1678, 'Rosaspata', 168, 1),
(1679, 'Taraco', 168, 1),
(1680, 'Vilque Chico', 168, 1),
(1681, 'LampÃ¡', 169, 1),
(1682, 'Cabanilla', 169, 1),
(1683, 'Calapuja', 169, 1),
(1684, 'Nicasio', 169, 1),
(1685, 'Ocuviri', 169, 1),
(1686, 'PÃ¡lca', 169, 1),
(1687, 'Paratia', 169, 1),
(1688, 'PucÃ¡ra', 169, 1),
(1689, 'SantÃ¡ Lucia', 169, 1),
(1690, 'Vilavila', 169, 1),
(1691, 'AyavirÃ­', 170, 1),
(1692, 'Antauta', 170, 1),
(1693, 'Cupi', 170, 1),
(1694, 'Llalli', 170, 1),
(1695, 'Macari', 170, 1),
(1696, 'NuÃ±oa', 170, 1),
(1697, 'Orurillo', 170, 1),
(1698, 'Santa_Rosa', 170, 1),
(1699, 'Umachiri', 170, 1),
(1700, 'Moho', 171, 1),
(1701, 'Conima', 171, 1),
(1702, 'Huayrapata', 171, 1),
(1703, 'Tilali', 171, 1),
(1704, 'Putina', 172, 1),
(1705, 'Ananea', 172, 1),
(1706, 'Pedro Vilca Apaza', 172, 1),
(1707, 'Quilcapuncu', 172, 1),
(1708, 'Sina', 172, 1),
(1709, 'Juliaca', 173, 1),
(1710, 'CabÃ¡na', 173, 1),
(1711, 'Cabanillas', 173, 1),
(1712, 'Caracoto', 173, 1),
(1713, 'Sandia', 174, 1),
(1714, 'Cuyocuyo', 174, 1),
(1715, 'Limbani', 174, 1),
(1716, 'Patambuco', 174, 1),
(1717, 'Phara', 174, 1),
(1718, 'Quiaca', 174, 1),
(1719, 'San Juan del Oro', 174, 1),
(1720, 'Yanahuaya', 174, 1),
(1721, 'Alto Inambari', 174, 1),
(1722, 'San Pedro de Putina Punco', 174, 1),
(1723, 'Yunguyo', 175, 1),
(1724, 'Anapia', 175, 1),
(1725, 'Copani', 175, 1),
(1726, 'Cuturapi', 175, 1),
(1727, 'Ollaraya', 175, 1),
(1728, 'Tinicachi', 175, 1),
(1729, 'Unicachi', 175, 1),
(1730, 'Moyobamba', 176, 1),
(1731, 'Calzada', 176, 1),
(1732, 'Habana', 176, 1),
(1733, 'Jepelacio', 176, 1),
(1734, 'Soritor', 176, 1),
(1735, 'Yantalo', 176, 1),
(1736, 'BellÃ¡vista', 177, 1),
(1737, 'Alto Biavo', 177, 1),
(1738, 'Bajo Biavo', 177, 1),
(1739, 'Huallaga', 177, 1),
(1740, 'SanPablo', 177, 1),
(1741, 'San RafaÃ©l', 177, 1),
(1742, 'San JosÃ© de Sisa', 178, 1),
(1743, 'Agua Blanca', 178, 1),
(1744, 'San MartÃ­n', 178, 1),
(1745, 'Santa_RosÃ¡', 178, 1),
(1746, 'Shatoja', 178, 1),
(1747, 'Saposoa', 179, 1),
(1748, 'Alto Saposoa', 179, 1),
(1749, 'El EslabÃ³n', 179, 1),
(1750, 'Piscoyacu', 179, 1),
(1751, 'Sacanche', 179, 1),
(1752, 'Tingo de Saposoa', 179, 1),
(1753, 'Lamas', 180, 1),
(1754, 'Alonso de Alvarado', 180, 1),
(1755, 'Barranquita', 180, 1),
(1756, 'Caynarachi', 180, 1),
(1757, 'CuÃ±umbuqui', 180, 1),
(1758, 'Pinto Recodo', 180, 1),
(1759, 'Rumisapa', 180, 1),
(1760, 'San Roque de Cumbaza', 180, 1),
(1761, 'Shanao', 180, 1),
(1762, 'Tabalosos', 180, 1),
(1763, 'Zapatero', 180, 1),
(1764, 'JuanjuÃ­', 181, 1),
(1765, 'Campanilla', 181, 1),
(1766, 'Huicungo', 181, 1),
(1767, 'Pachiza', 181, 1),
(1768, 'Pajarillo', 181, 1),
(1769, 'Picota', 182, 1),
(1770, 'Buenos AirÃ©s', 182, 1),
(1771, 'Caspisapa', 182, 1),
(1772, 'Pilluana', 182, 1),
(1773, 'Pucacaca', 182, 1),
(1774, 'SÃ¡n Cristobal', 182, 1),
(1775, 'San HilariÃ³n', 182, 1),
(1776, 'Shamboyacu', 182, 1),
(1777, 'Tingo de Ponasa', 182, 1),
(1778, 'Tres Unidos', 182, 1),
(1779, 'Rioja', 183, 1),
(1780, 'Awajun', 183, 1),
(1781, 'ElÃ­as Soplin Vargas', 183, 1),
(1782, 'Nueva Cajamarca', 183, 1),
(1783, 'Pardo Miguel', 183, 1),
(1784, 'Posic', 183, 1),
(1785, 'San Fernando', 183, 1),
(1786, 'Yorongos', 183, 1),
(1787, 'Yuracyacu', 183, 1),
(1788, 'Tarapoto', 184, 1),
(1789, 'Alberto Leveau', 184, 1),
(1790, 'Cacatachi', 184, 1),
(1791, 'Chazuta', 184, 1),
(1792, 'Chipurana', 184, 1),
(1793, 'Huimbayoc', 184, 1),
(1794, 'Juan Guerra', 184, 1),
(1795, 'La Banda de Shilcayo', 184, 1),
(1796, 'Morales', 184, 1),
(1797, 'Papaplaya', 184, 1),
(1798, 'San AntÃ³nio', 184, 1),
(1799, 'Sauce', 184, 1),
(1800, 'Shapaja', 184, 1),
(1801, 'Tocache', 185, 1),
(1802, 'Nuevo Progreso', 185, 1),
(1803, 'Polvora', 185, 1),
(1804, 'Shunte', 185, 1),
(1805, 'Uchiza', 185, 1),
(1814, 'Sama', 186, 1),
(1813, 'Pocollay', 186, 1),
(1812, 'PÃ¡lcas', 186, 1),
(1811, 'Pachia', 186, 1),
(1810, 'Inclan', 186, 1),
(1809, 'Ciudad Nueva', 186, 1),
(1808, 'Calana', 186, 1),
(1807, 'Alto de la Alianza', 186, 1),
(1806, 'Tacna', 186, 1),
(1815, 'Coronel Gregorio AlbarracÃ­n Lanchipa', 186, 1),
(1816, 'La Yarada los Palos', 186, 1),
(1817, 'Candarave', 187, 1),
(1818, 'Cairani', 187, 1),
(1819, 'Camilaca', 187, 1),
(1820, 'Curibaya', 187, 1),
(1821, 'Huanuara', 187, 1),
(1822, 'Quilahuani', 187, 1),
(1823, 'Locumba', 188, 1),
(1824, 'Ilabaya', 188, 1),
(1825, 'Ite', 188, 1),
(1826, 'Tarata', 189, 1),
(1827, 'HÃ©roes AlbarracÃ­n', 189, 1),
(1828, 'Estique', 189, 1),
(1829, 'Estique-Pampa', 189, 1),
(1830, 'Sitajara', 189, 1),
(1831, 'Susapaya', 189, 1),
(1832, 'Tarucachi', 189, 1),
(1833, 'Ticaco', 189, 1),
(1834, 'Tumbes', 190, 1),
(1835, 'Corrales', 190, 1),
(1836, 'La Cruz', 190, 1),
(1837, 'Pampas de Hospital', 190, 1),
(1838, 'San Jacinto', 190, 1),
(1839, 'San Juan de la Virgen', 190, 1),
(1840, 'Zorritos', 191, 1),
(1841, 'Casitas', 191, 1),
(1842, 'Canoas de Punta Sal', 191, 1),
(1843, 'Zarumilla', 192, 1),
(1844, 'Aguas Verdes', 192, 1),
(1845, 'Matapalo', 192, 1),
(1846, 'Papayal', 192, 1),
(1847, 'Calleria', 193, 1),
(1848, 'Campoverde', 193, 1),
(1849, 'Iparia', 193, 1),
(1850, 'Masisea', 193, 1),
(1851, 'Yarinacocha', 193, 1),
(1852, 'Nueva Requena', 193, 1),
(1853, 'Manantay', 193, 1),
(1854, 'Raymondi', 194, 1),
(1855, 'Sepahua', 194, 1),
(1856, 'Tahuania', 194, 1),
(1857, 'Yurua', 194, 1),
(1858, 'Padre Abad', 195, 1),
(1859, 'Irazola', 195, 1),
(1860, 'Curimana', 195, 1),
(1861, 'Neshuya', 195, 1),
(1862, 'Alexander Von Humboldt', 195, 1),
(1863, 'Purus', 196, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE IF NOT EXISTS `enfermedad` (
  `codi_enf` varchar(6) NOT NULL,
  `desc_enf` varchar(200) DEFAULT NULL,
  `esta_enf` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`codi_enf`),
  KEY `codi_enf_2` (`codi_enf`),
  FULLTEXT KEY `codi_enf` (`codi_enf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `enfermedad`
--

INSERT INTO `enfermedad` (`codi_enf`, `desc_enf`, `esta_enf`) VALUES
('CO6.9', 'Tumor maligno en la boca, no especificas', 'N'),
('K00.0', 'Anodoncia', 'S'),
('K00.1', 'Hiperodontia', 'S'),
('k00.19', 'Exodoncia', 'S'),
('K00.2', 'Anormalidades de tamaño y forma de los dientes', 'S'),
('K00.30', 'Diagnostico diente molar', 'S'),
('K00.4', 'Trastornos en la formación ', 'S'),
('K00.5', 'Trastornos hereditarios en la estructura de los dientes, no clasificados en otra parte', 'S'),
('K00.6', 'Trastornos en la erupción de los dientes', 'S'),
('K00.7', 'Síndrome de la dentición', 'S'),
('K00.8', 'Otros trastornos del desarrollo de los dientes', 'S'),
('K00.9', 'Trastorno del desarrollo de los dientes sin especificar', 'S'),
('K01.0', 'Dientes embebidos', 'S'),
('K01.1', 'Dientes impactados', 'S'),
('K02.0', 'Caries limitada al esmalte', 'S'),
('K02.1', 'Caries de dentina', 'S'),
('K02.2', 'Caries del cemento', 'S'),
('K02.3', 'Caries arrestada', 'S'),
('K02.4', 'Odontoclasia', 'S'),
('K02.8', 'Otras caries', 'S'),
('K02.9', 'Caries sin especificar', 'S'),
('K03.0', 'Atrición excesiva de los dientes', 'S'),
('K03.1', 'Abrasion de los dientes', 'S'),
('K03.2', 'Erosión de los dientes', 'S'),
('K03.3', 'Resorción patológica de los dientes', 'S'),
('K03.4', 'Hipercementosis', 'S'),
('K03.5', 'Anquilosis de los dientes', 'S'),
('K03.6', 'Depósitos (acreciones) de los dientes', 'S'),
('K03.7', 'Cambios de color posteruptivos de los tejidos duros dentales', 'S'),
('K03.8', 'Otras enfermedades especificadas de los tejidos duros de los dientes', 'S'),
('K03.9', 'Enfermedad de los tejidos duros de los dientes sin especificar', 'S'),
('K04.0', 'Pulpitis', 'S'),
('K04.1', 'Necrosis de la pulpa dentaria', 'S'),
('K04.2', 'Degeneración de la pulpa dentaria', 'S'),
('K04.3', 'Formación anormal de los tejidos duros de la pulpa dentaria', 'S'),
('K04.4', 'Periodontitis apical aguda de la pulpa dentaria', 'S'),
('K04.5', 'Periodontitis apical crónica', 'S'),
('K04.6', 'Absceso periapical con senos', 'S'),
('K04.7', 'Absceso periapical sin senos', 'S'),
('K04.8', 'Quiste radicular', 'S'),
('K04.9', 'Otras enfermedades de la pulpa dentaria y los tejidos periapicales y enfermedades sin especificar', 'S'),
('K05.0', 'Gingivitis aguda', 'S'),
('K05.1', 'Gingivitis crónica', 'S'),
('K05.2', 'Periodontitis aguda', 'S'),
('K05.3', 'Periodontitis crónica', 'S'),
('K05.4', 'Periodontosis', 'S'),
('K05.5', 'Otras enfermedades periodontales', 'S'),
('K05.6', 'Enfermedad periodontal sin especificar', 'S'),
('K06.0', 'Recesión gingival', 'S'),
('K06.1', 'Alargamiento gingival', 'S'),
('K06.2', 'Lesiones gingivales y de la cresta alveolar edentulosa asociadas con traumas', 'S'),
('K06.8', 'Otros trastornos gingivales y de la cresta alveolar edentulosa especificados', 'S'),
('K06.9', 'Trastorno gingival y de la cresta alveolar edentulosa sin especificar', 'A'),
('K07.0', 'Anomalías mayores del tamaño de la mandíbula', 'S'),
('K07.1', 'Anomalías de la relación mandíbula-base del craneo', 'S'),
('K07.2', 'Anomalías de la relación del arco dental', 'S'),
('K07.3', 'Anomalías de la posición de los dientes', 'S'),
('K07.4', 'Maloclusión sin especificar', 'S'),
('K07.5', 'Anormalidades funcionales dentofaciales', 'S'),
('K07.6', 'Trastornos de la unión temporomandibular', 'S'),
('K07.8', 'Otras anomalías dentofaciales', 'S'),
('K07.9', 'Anomalía dentofacial sin especificar', 'S'),
('K08.0', 'Exfoliación de los dientes debida a causas sistémicas', 'S'),
('K08.1', 'Pérdida de los dientes debido a un accidente, extracción o enfermedad periodontal local', 'S'),
('K08.2', 'Atrofia de la cresta alveolar edentulosa', 'S'),
('K08.3', 'Raíz dental retenida', 'S'),
('K08.8', 'Otros trastornos especificados de dientes y estructuras de soporte', 'S'),
('K08.9', 'Trastorno especificado de dientes y estructuras de soporte sin especificar', 'S'),
('K09.0', 'Quiste odontogánico de desarrollo', 'S'),
('K09.1', 'Quistes de desarrollo (no-odontogénicos) de la región oral', 'S'),
('K09.2', 'Otros quistes de la mandíbula', 'S'),
('K09.8', 'Otros quistes de la región oral, no clasificados en otra parte', 'S'),
('K09.9', 'Quiste de la región oral sin especificar', 'S'),
('K10.0', 'Trastornos de desarrollo de las mandíbulas', 'S'),
('K10.1', 'Granuloma celular gigante, central', 'S'),
('K10.2', 'Condiciones inflamatorias de las mandíbulas', 'S'),
('K10.3', 'Alveolitis de las mandíbulas', 'S'),
('K10.8', 'Otras enfermedades de las mandíbulas especificadas', 'S'),
('K10.9', 'Enfermedad de las mandíbulas, sin especificar', 'S'),
('K11.0', 'Atrofia de las glándulas salivales', 'S'),
('K11.1', 'Hipertrofia de las glándulas salivales', 'S'),
('K11.2', 'Sialadenitis', 'S'),
('K11.3', 'Abceso de las glándulas salivales', 'S'),
('K11.4', 'Fístula de las glándulas salivales', 'S'),
('K11.5', 'Sialolitiasis', 'S'),
('K11.6', 'Mucocele de las glándulas salivales', 'S'),
('K11.7', 'Trastornos de la secreción salival', 'S'),
('K11.8', 'Otras enfermedades de las glándulas salivales', 'S'),
('K11.9', 'Enfermedad de las glándulas salivales sin especificar', 'S'),
('K12.0', 'Afta oral recurrente', 'S'),
('K12.1', 'Otras formas de estomatitis', 'S'),
('K12.2', 'Celulitis y abceso bucal', 'S'),
('K13.0', 'Enfermedades de los labios', 'S'),
('K13.1', 'Picadure en la mejilla y los labios', 'S'),
('K13.2', 'Leucoplaquia y otros trastornos del epitelio oral, incluyendo la lengua', 'S'),
('K13.3', 'Leucoplaquia capilar', 'S'),
('K13.4', 'Granuloma y lesiones de tipo granulómico de la mucosa oral', 'S'),
('K13.5', 'Fibrosis oral submucosa', 'S'),
('K13.6', 'Hiperplasia irritativa de la mucosa oral', 'S'),
('K13.7', 'Otras lesiones y lesiones sin especificar de la mucosa oral', 'S'),
('K14.0', 'Glositis', 'S'),
('K14.1', 'Lengua geográfica', 'S'),
('K14.2', 'Glositis romboidea mediana', 'S'),
('K14.3', 'Hipertrofia de las papilas gustativas', 'S'),
('K14.4', 'Atrofia de las papilas gustativas', 'S'),
('K14.5', 'Lengua plicada', 'S'),
('K14.6', 'Glosodinia', 'S'),
('K14.8', 'Otras enfermedades de la lengua', 'S'),
('K14.9', 'Enfermedad de la lengua sin especificar', 'S'),
('M00.7', 'Brakers', 'N'),
('Z00.1', 'Diagnostico de pruebas', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE IF NOT EXISTS `especialidad` (
  `cod_especialidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_especialidad` varchar(45) NOT NULL,
  `descripcion_especialidad` varchar(45) DEFAULT NULL,
  `estado_especialidad` varchar(1) DEFAULT 'S',
  PRIMARY KEY (`cod_especialidad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`cod_especialidad`, `nombre_especialidad`, `descripcion_especialidad`, `estado_especialidad`) VALUES
(1, 'Ortodoncia', 'Ortodoncia', 'S'),
(2, 'Endodoncia', 'Endodoncia dental', 'S'),
(3, 'Odontopediatria', 'tratamiento en niños', 'S'),
(4, 'General', 'No tiene especialidad', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_diente`
--

CREATE TABLE IF NOT EXISTS `estado_diente` (
  `codi_edi` int(11) NOT NULL AUTO_INCREMENT,
  `titu_edi` varchar(5) NOT NULL,
  `nomb_edi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codi_edi`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `estado_diente`
--

INSERT INTO `estado_diente` (`codi_edi`, `titu_edi`, `nomb_edi`) VALUES
(1, '', 'Sano'),
(2, '', 'Curado'),
(5, '--', 'Faltante'),
(3, 'DO', 'Diente obturado'),
(4, 'C', 'Cariado'),
(7, 'X', 'Exodoncia'),
(8, 'CP', 'Caries penetrante'),
(9, 'R', 'Retenido'),
(10, 'PP', 'Pieza de puente'),
(11, 'CO', 'Corona'),
(12, 'PR', 'Protesis removible'),
(13, 'INC', 'Incrustación'),
(14, 'EP', 'Enfermedad periodontal'),
(15, 'FD', 'Fractura dentaria'),
(16, 'MPD', 'Mal posición dentaria'),
(17, 'PM', 'Perno muñon'),
(18, 'TC', 'Tratamiento de cto'),
(19, 'F', 'Fluorosis'),
(20, 'IMP', 'Implante dental'),
(21, 'MB', 'Mancha blanca'),
(22, 'SE', 'Sellador'),
(23, 'SP SR', 'Surco profundo o mineralizado'),
(24, 'HP', 'Hipoplasia de esmalte'),
(25, 'MS', 'Maxilar Superior'),
(6, 'X', 'Extraido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hallazgos`
--

CREATE TABLE IF NOT EXISTS `hallazgos` (
  `id_hal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_hal` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `siglas_hal` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_hal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `hallazgos`
--

INSERT INTO `hallazgos` (`id_hal`, `nombre_hal`, `siglas_hal`) VALUES
(1, 'Aparato Ortótico Fijo', NULL),
(2, 'Aparato Ortótico Removible', NULL),
(3, 'Corona', 'CM,CF,CMC,CV,CJ'),
(4, 'Lesión de Caries Dental', 'MB,CE,CD,CDP'),
(5, 'Defectos de Desarrollo de Esmalte', 'HP,HM,O,D,Fluorosis'),
(6, 'Sellantes', 'S'),
(7, 'Fractura', NULL),
(8, 'Fosas y Fisuras Profundas', 'FFP'),
(9, 'Pieza Dentaria Ausente', NULL),
(10, 'Pieza Dentaria en Erupción', NULL),
(11, 'Restauración Definitiva', 'AM,R,IV,IM,IE,C'),
(12, 'Restauración Temporal', NULL),
(13, 'Edéntulo Total', NULL),
(14, 'Pieza Dentaria Supernumeraria', NULL),
(15, 'Pieza Dentaria Extruida', NULL),
(16, 'Pieza Dentaria Intruida', NULL),
(17, 'Diastema', NULL),
(18, 'Giroversión', NULL),
(19, 'Posición Dentaria', 'M,D,V,P,L'),
(20, 'Pieza Dentaria en Clavija', NULL),
(21, 'Pieza Dentaria Ectópica', 'E'),
(22, 'Macrodoncia', 'MAC'),
(23, 'Microdoncia', 'MIC'),
(24, 'Fusión', NULL),
(25, 'Geminación', NULL),
(26, 'Impactación', 'I'),
(27, 'Superficie Desgastada', 'DES'),
(28, 'Remanente Radicular', 'RR'),
(29, 'Movilidad Patológica', 'M'),
(30, 'Espigo Muñon', NULL),
(31, 'Implante Dental', 'IMP'),
(32, 'Prótesis Fija', NULL),
(33, 'Protesis Removible', NULL),
(34, 'Prótesis Total', NULL),
(35, 'Tratamiento Pulpar', 'TC,PC,PP'),
(36, 'Transposición', NULL),
(37, 'Corona Temporal', 'CT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
  `cod_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_barra` varchar(50) DEFAULT NULL,
  `nombre_almacen` varchar(80) NOT NULL,
  `nombre_producto` varchar(60) DEFAULT NULL,
  `cod_tipo_inventario` int(11) NOT NULL,
  `precio_entrada` decimal(10,2) DEFAULT NULL,
  `precio_salida` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(100) DEFAULT NULL,
  `stock_inventario` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cod_inventario`),
  KEY `fk_inventario_tipo_inventario` (`cod_tipo_inventario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE IF NOT EXISTS `medico` (
  `codi_med` int(11) NOT NULL AUTO_INCREMENT,
  `cod_especialidad` int(11) NOT NULL,
  `nomb_med` varchar(20) DEFAULT NULL,
  `apel_med` varchar(20) DEFAULT NULL,
  `dni_med` varchar(10) DEFAULT NULL,
  `ruc_med` varchar(11) NOT NULL,
  `coleg_med` varchar(50) NOT NULL,
  `telf_med` varchar(10) DEFAULT NULL,
  `cel_med` varchar(12) DEFAULT NULL,
  `dire_med` varchar(100) DEFAULT NULL,
  `emai_med` varchar(100) DEFAULT NULL,
  `fena_med` date DEFAULT NULL,
  `sexo_med` char(1) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `esta_med` varchar(1) NOT NULL DEFAULT 'S',
  `codi_usu` int(6) NOT NULL,
  PRIMARY KEY (`codi_med`),
  UNIQUE KEY `dni_med` (`dni_med`),
  KEY `fk_medico_especialidad` (`cod_especialidad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`codi_med`, `cod_especialidad`, `nomb_med`, `apel_med`, `dni_med`, `ruc_med`, `coleg_med`, `telf_med`, `cel_med`, `dire_med`, `emai_med`, `fena_med`, `sexo_med`, `fecha_registro`, `esta_med`, `codi_usu`) VALUES
(1, 1, 'DIEGO ALFONSO', 'LOAYZA LOPEZ', '42458455', '10424584555', '40508', '949105955', NULL, 'URB. LOS JARDINES C11', 'clinicavitaldent@hotmail.com', '1984-06-20', 'M', '2019-02-18 00:00:00', 'S', 0),
(2, 1, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '0000-00-00', 't', '0000-00-00 00:00:00', 'S', 0),
(3, 1, 'patricia', 'almeyda', '', '', '', '', '', 'asda', '', '0000-00-00', 'M', '2019-02-27 04:41:49', 'S', 0),
(4, 2, 'carlos', 'espinoza', '454646', '55555555', 'ASFA', '46456', '64654', 'ASDFA6', 'ED@GMAIL.COM', '2019-02-26', 'M', '2019-02-27 04:46:20', 'S', 0),
(5, 3, 'mayra', 'samanamud', '22222222', '22222222222', '12344', '2327308', '992398412', 'Av. Tupac amaru', 'damaris@hotmail.com', '2019-07-18', 'F', '2019-07-19 04:44:30', 'S', 0),
(6, 2, 'jose ', 'valladare', '12345666', '33333333333', '23134', '2327308', '992398412', 'av. echenique', 'jose@gmail.com', '2019-07-18', 'M', '2019-07-26 19:37:47', 'S', 0),
(7, 1, 'Silvana', 'Diaz Saona', '23431234', '111', '111', '111', '111', 'direccion', 'silvana@gmail.com', '2019-07-23', 'M', '2019-07-23 20:39:04', 'S', 5),
(8, 2, 'PEDRO', 'GALLO', '32111112', '', '53222', '922398412', '932222222', 'SAN JACINTO', 'sanjacinto@gmail.com', '2019-07-24', 'M', '2019-07-25 15:47:56', 'S', 7),
(9, 1, 'AVILIO', 'ESPINOZA', '54321111', '32111111111', '43222', '3221', '43211', 'SAN KILOMBO', 'avilio@gmail.com', '2019-07-26', 'M', '2019-07-26 19:40:06', 'S', 10),
(10, 1, 'SANTA FE', 'CODIBOLL', '43133443', '111', '111', '111', '111', 'direccion', 'alex@gmail.com', '2019-07-27', 'M', '2019-07-28 00:46:34', 'S', 12),
(11, 1, 'ERT', 'TRE', '54321', '111', '111', '111', '111', 'direccion', 'QWE@GMAIL.COM', '2019-07-27', 'M', '2019-07-28 00:55:29', 'S', 13),
(12, 1, 'PEDRO PAULO', 'DIAZ CORSO', '123456', '111', '111', '111', '111', 'direccion', 'SANTIAGO@GMAIL.COM', '2019-07-27', 'M', '2019-07-28 00:56:38', 'S', 14),
(13, 2, 'PRUEBA', 'PRUEBA', '74512345', '', '1115', '111', '111', 'direccion', 'zoila@gmail.com', '2019-07-27', 'M', '2019-07-28 01:06:17', 'S', 15),
(14, 1, 'RAMIREZ', 'FALCON', '32145325', '111', '111', '111', '111', 'direccion', 'miguel@gmail.com', '2019-07-27', 'M', '2019-07-28 01:08:38', 'S', 16),
(15, 4, 'ABELARDO', 'SAONA', '65124376', '', '3213', '432', '23', 'SAN JACINTO', 'abelardo@gmail.com', '2019-07-27', 'M', '2019-07-28 01:56:29', 'S', 17),
(16, 1, 'GIANCARLOS', 'GUTIERRES SAMANAMUD', '43215678', '', '1117', '111', '111', 'direccion', 'santiago@gmail.com', '2019-07-27', 'M', '2019-07-28 02:13:27', 'S', 18),
(17, 1, 'CALIN ALEX', 'VELASQUEZ', '43212345', '', '32134', '32111', '54344', 'SAN BARTOLOME HUSARES', 'calin@gmail.com', '1988-06-15', 'M', '2019-07-28 05:09:39', 'S', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id_menu`, `nombre`, `link`) VALUES
(1, 'Inicio (ver tu cuenta)', 'dashboard'),
(2, 'Inicio (ver tutorial)', 'RegTuto'),
(3, 'Citas (agenda)', 'citas/agenda'),
(4, 'Citas (registrar)', 'citas/registrar'),
(5, 'Tratamientos (registrar)', 'tratamientos/panel'),
(6, 'Tratamientos (ver reporte de comprobantes)', 'tratamientos/Comprobantes'),
(7, 'Tarifario (ver registro)', 'mantenimiento/tarifario'),
(8, 'Procedimiento (registro de CIE10)', 'mantenimiento/Diagnostico'),
(9, 'Historia ( ver movimiento)', 'historia/Movimiento'),
(10, 'Reportes', 'reportes/redashboard'),
(11, 'Paciente (ver registro)', 'mantenimiento/Paciente'),
(12, 'Odontologo (ver registro)', 'mantenimiento/Medico'),
(13, 'Mantenimiento (registro tipo de pago)', 'mantenimiento/Pago'),
(14, 'Mantenimiento (registro moneda)', 'mantenimiento/Moneda'),
(15, 'Mantenimiento (registro banco)', 'mantenimiento/banco'),
(16, 'Mantenimiento (registro tarjeta)', 'mantenimiento/tarjeta'),
(17, 'Catalogo (registro de unidad medida)', 'mantenimiento/medida'),
(18, 'Catalogo (registro de tipo concepto)', 'mantenimiento/Concepto'),
(19, 'Catalogo (registro de categoria)', 'mantenimiento/Categoria'),
(20, 'Catalogo (registro de especialidad)', 'mantenimiento/Especialidad'),
(21, 'Catalogo (registro de tipo citado)', 'mantenimiento/Citado'),
(22, 'Catalogo (registro de alergia)', 'mantenimiento/Alergia'),
(23, 'Usuario (ver registro de usuarios)', 'mantenimiento/Usuario'),
(24, 'Usuario (ver registro de cargos)', 'mantenimiento/rol'),
(25, 'Usuario (ver registro de permisos)', 'administrador/Permisos'),
(26, 'Configuracion (mi clinica)', 'clinica/Regclinica'),
(27, 'Configuracion (registro de tipo documento)', 'mantenimiento/tipodocumento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `codi_pac` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_pac` varchar(20) NOT NULL,
  `apel_pac` varchar(20) NOT NULL,
  `edad_pac` varchar(3) NOT NULL,
  `ocupacion` varchar(40) NOT NULL,
  `lugar_nacimiento` varchar(30) NOT NULL,
  `informacion_clinica` varchar(70) DEFAULT NULL,
  `dire_pac` varchar(100) DEFAULT NULL,
  `telf_pac` varchar(20) DEFAULT NULL,
  `dni_pac` varchar(10) NOT NULL,
  `foto_paciente` varchar(255) DEFAULT NULL,
  `fena_pac` date NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sexo_pac` char(1) NOT NULL,
  `civi_pac` char(1) NOT NULL,
  `afil_pac` varchar(30) DEFAULT NULL,
  `aler_pac` varchar(120) DEFAULT NULL,
  `emai_pac` varchar(50) DEFAULT NULL,
  `titu_pac` varchar(20) NOT NULL,
  `pais_id` int(6) DEFAULT NULL,
  `departamento_id` int(11) NOT NULL,
  `provincia_id` int(11) NOT NULL,
  `distrito_id` int(11) NOT NULL,
  `observacion` varchar(100) NOT NULL,
  `esta_pac` varchar(1) DEFAULT 'S',
  `registro_pac` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estudios_pac` varchar(100) DEFAULT NULL,
  `detalleodontograma_pac` text,
  PRIMARY KEY (`codi_pac`),
  UNIQUE KEY `nomb_pac` (`nomb_pac`),
  UNIQUE KEY `dni_pac` (`dni_pac`),
  KEY `fk_paciente_departamento` (`departamento_id`),
  KEY `fk_paciente_provincia` (`provincia_id`),
  KEY `fk_paciente_distrito` (`distrito_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`codi_pac`, `nomb_pac`, `apel_pac`, `edad_pac`, `ocupacion`, `lugar_nacimiento`, `informacion_clinica`, `dire_pac`, `telf_pac`, `dni_pac`, `foto_paciente`, `fena_pac`, `fecha_registro`, `sexo_pac`, `civi_pac`, `afil_pac`, `aler_pac`, `emai_pac`, `titu_pac`, `pais_id`, `departamento_id`, `provincia_id`, `distrito_id`, `observacion`, `esta_pac`, `registro_pac`, `estudios_pac`, `detalleodontograma_pac`) VALUES
(1, 'Christiam Alexis', 'Diaz Saona', '28', 'Ingeniero de sistemas', 'Huacho', 'por facebook', 'San bartolome 3ra etapa', '992398412', '44660415', 'usuario_inicio2.png', '1987-09-17', '2019-04-20 22:16:38', 'M', 'S', 'si', 'no', 'cdiaz_1987@outlook.com', 'si', 172, 13, 113, 1152, '                         \r\n                        ', 'S', '2019-04-08 15:06:49', 'U', 'dfhdfsh'),
(2, 'Jefferson Enmanuel', 'Sanchez sotil', '29', 'Estadistico Informatico', 'Huacho', 'por facebook', 'Los urba universidad', NULL, '466606466', NULL, '1987-09-17', '2019-04-20 22:16:38', 'M', 'S', 'si', 'no', 'timarius25@gmail.com', 'si', 173, 15, 129, 1317, 'ninguno', 'S', '2019-04-08 15:06:49', 'S', 'prueba'),
(6, 'edwing david', 'romero rodriguez', '25', 'Ingeniero de Sistemas', 'lugar de naci', 'entero de la clinic', 'direccion', '992398412', '45711437', NULL, '2019-04-12', '2019-04-13 12:21:36', 'M', 'V', 'afiliado', 'alkergia', 'edwing@gmail.com', '', 173, 6, 57, 597, '                         \r\n                        ', 'S', '2019-04-13 12:21:36', 'U', NULL),
(7, 'karina ', 'arevalo minaya', '46', 'U', 'huacho', 'amistad', 'urb pacocha', '992398412', '11111111', 'usuario_inicio1.png', '2019-07-18', '2019-07-18 17:14:23', 'F', 'C', '', 'sulfas', 'nayda31d@hotmail.com', '', 173, 15, 135, 1392, '                         \r\n                        ', 'S', '2019-07-18 17:14:23', 'S', NULL),
(8, 'CESAR', 'SOLANO', '25', 'U', 'Lima', 'por facebook', 'Av. Echenique 315', '2323967', '15760814', 'usuario_inicio.png', '1962-01-01', '2019-07-22 21:14:07', 'M', 'S', 'EPS', '', 'c_solano@gmail.com', '', NULL, 15, 128, 1277, '                         \r\n                        ', 'S', '2019-07-22 21:14:07', 'S', NULL),
(9, 'jose alfredo', 'diaz falcon', '23', 'S', 'Huacho', 'por facebook', 'san jacinto', NULL, '76541234', NULL, '2019-07-26', '2019-07-27 20:52:56', 'M', 'C', 'no', 'no', 'jose@gmail.com', '', 173, 15, 135, 1392, '', 'S', '2019-07-27 20:52:56', 'S', NULL),
(10, 'wendy', 'ramos', '23', 'U', 'huacho', NULL, 'san jacinto', '2327308', '43125456', NULL, '2020-01-16', '2020-01-16 19:09:44', 'F', 'C', '', '', 'wendy@gmail.com', '', 173, 15, 128, 1273, '                         \r\n                        ', 'S', '2020-01-16 19:09:44', 'S', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_alergia`
--

CREATE TABLE IF NOT EXISTS `paciente_alergia` (
  `pacale_id` int(11) NOT NULL AUTO_INCREMENT,
  `codi_pac` int(8) DEFAULT NULL,
  `cod_ale` int(8) DEFAULT NULL,
  `pacale_observacion` text COLLATE utf8_spanish_ci,
  `pacale_estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = activo, 2 = anulado',
  PRIMARY KEY (`pacale_id`),
  KEY `codi_pac` (`codi_pac`),
  KEY `cod_ale` (`cod_ale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `paciente_alergia`
--

INSERT INTO `paciente_alergia` (`pacale_id`, `codi_pac`, `cod_ale`, `pacale_observacion`, `pacale_estado`) VALUES
(1, 2, 2, 'observbacion 01', 1),
(2, 2, 5, 'obsrvacio 04', 1),
(6, 2, 2, 'asdada', 1),
(7, 2, 1, 'obdrtvbsvion', 1),
(8, 6, 1, 'obsevacion modificado', 2),
(9, 6, 3, 'observaciones adasd', 1),
(10, 6, 2, 'para el dolor de la muela', 1),
(11, 1, 2, 'estornuda al polvo', 1),
(12, 1, 5, 'prueba', 1),
(13, 7, 7, '', 1),
(14, 8, 4, '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_consulta`
--

CREATE TABLE IF NOT EXISTS `paciente_consulta` (
  `codi_pac` int(8) NOT NULL,
  `ortod_paccon` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ortodtexto_paccon` text COLLATE utf8_spanish_ci,
  `medic_paccon` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `medictexto_paccon` text COLLATE utf8_spanish_ci,
  `alergico_paccon` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `alergicotexto_paccon` text COLLATE utf8_spanish_ci,
  `hosp_paccon` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hosptexto_paccon` text COLLATE utf8_spanish_ci,
  `trans_paccon` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `transtexto_paccon` text COLLATE utf8_spanish_ci,
  `padece_paccon` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cepilla_paccon` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cepillatexto_paccon` text COLLATE utf8_spanish_ci,
  `presion_paccon` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `presiontexto_paccon` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`codi_pac`),
  UNIQUE KEY `codi_pac` (`codi_pac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente_consulta`
--

INSERT INTO `paciente_consulta` (`codi_pac`, `ortod_paccon`, `ortodtexto_paccon`, `medic_paccon`, `medictexto_paccon`, `alergico_paccon`, `alergicotexto_paccon`, `hosp_paccon`, `hosptexto_paccon`, `trans_paccon`, `transtexto_paccon`, `padece_paccon`, `cepilla_paccon`, `cepillatexto_paccon`, `presion_paccon`, `presiontexto_paccon`) VALUES
(1, '1', 'dos veces', '1', 'paracetamol', '1', 'inyeccion', '1', 'una vez', '0', NULL, 'Asma', '1', '3 veces al dia', '0', NULL),
(2, '1', 'ortodoncia', '0', 'medicamen1', '1', 'anestesco', '0', 'cirugia', '1', 'nervioso', 'Enf. renal', '0', 'diriament', '1', 'arteral'),
(6, '1', 'por ahora no', '1', 'medicamentos', '1', 'anestreia', NULL, NULL, NULL, NULL, 'Hepatitis', NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_diagnostico`
--

CREATE TABLE IF NOT EXISTS `paciente_diagnostico` (
  `pacdiag_id` int(8) NOT NULL AUTO_INCREMENT,
  `codi_pac` int(8) DEFAULT NULL,
  `pacdiag_fecha` date DEFAULT NULL,
  `codi_enf01` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `pacdiag_estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = activo, 2 = anulado',
  PRIMARY KEY (`pacdiag_id`),
  KEY `codi_pac` (`codi_pac`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `paciente_diagnostico`
--

INSERT INTO `paciente_diagnostico` (`pacdiag_id`, `codi_pac`, `pacdiag_fecha`, `codi_enf01`, `pacdiag_estado`) VALUES
(1, 1, '2019-07-26', 'K02.1', 1),
(2, 1, '2019-07-26', 'K00.6', 2),
(3, 1, '2019-07-26', 'K02.8', 1),
(4, 9, '2019-07-27', 'K00.5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_enfermedadactual`
--

CREATE TABLE IF NOT EXISTS `paciente_enfermedadactual` (
  `codi_pac` int(8) NOT NULL,
  `tiempo_enfact` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `motivo_enfact` text COLLATE utf8_spanish_ci,
  `signo_enfact` text COLLATE utf8_spanish_ci,
  `antecper_enfact` text COLLATE utf8_spanish_ci,
  `antecfam_enfact` text COLLATE utf8_spanish_ci,
  `medicam_enfact` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nommedicam_enfact` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `motivomedi_enfact` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dosis_enfact` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codi_pac`),
  UNIQUE KEY `codi_pac` (`codi_pac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente_enfermedadactual`
--

INSERT INTO `paciente_enfermedadactual` (`codi_pac`, `tiempo_enfact`, `motivo_enfact`, `signo_enfact`, `antecper_enfact`, `antecfam_enfact`, `medicam_enfact`, `nommedicam_enfact`, `motivomedi_enfact`, `dosis_enfact`) VALUES
(1, 'Un año', 'por dolor de muela', '', '', '', '1', 'paracetamol', 'via oral', ''),
(2, '34', 'motivo fe cvonsunlta', 'signos', 'antede personales', 'familiares', '0', 'nobre medcia', 'motivo uso', 'dosis'),
(6, 'fiebre', 'por dolor', '', '', '', '1', '', '', ''),
(7, 'una semana', 'odontalgia', 'dolor', 'alergias', 'niega', '1', 'tramadol', 'via oral', 'cada 6 horas'),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '', 'E', 'E', '', '', '1', '', 'via oral', ''),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_evolucion`
--

CREATE TABLE IF NOT EXISTS `paciente_evolucion` (
  `pacevol_id` int(11) NOT NULL AUTO_INCREMENT,
  `codi_pac` int(8) DEFAULT NULL,
  `cod_especialidad` int(8) DEFAULT NULL,
  `codi_med` int(8) DEFAULT NULL,
  `pacevol_descripcion` text COLLATE utf8_spanish_ci,
  `fecha_evolucion` date NOT NULL,
  `pacevol_estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = activo, 2 = anulado',
  PRIMARY KEY (`pacevol_id`),
  KEY `codi_pac` (`codi_pac`),
  KEY `cod_especialidad` (`cod_especialidad`),
  KEY `codi_med` (`codi_med`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=67 ;

--
-- Volcado de datos para la tabla `paciente_evolucion`
--

INSERT INTO `paciente_evolucion` (`pacevol_id`, `codi_pac`, `cod_especialidad`, `codi_med`, `pacevol_descripcion`, `fecha_evolucion`, `pacevol_estado`) VALUES
(1, 1, 1, 1, 'Mejorando el paciente su tratamiento', '2019-05-15', 1),
(2, 1, 1, 1, 'paciente va mejorando', '2019-05-16', 1),
(3, 1, 1, 1, 'paciente va mejorando lentamente', '2019-05-18', 1),
(4, 1, 1, 3, 'paciente va mejorando lentamente', '2019-05-16', 1),
(5, 1, 2, 4, 'mejorando con la doctore heleny yo', '2019-05-17', 1),
(6, 1, 1, 1, 'evolucionando constantemente', '2019-05-16', 1),
(7, 2, 1, 1, 'muy duro al comer', '2019-05-16', 1),
(8, 2, 1, 1, 'dolor al comer', '2019-05-16', 1),
(9, 2, 1, 1, 'prueba', '2019-05-16', 1),
(10, 2, 1, 1, 'prueba3', '2019-05-16', 1),
(11, 2, 1, 1, 'prueba4', '2019-05-16', 1),
(12, 2, 1, 1, 'prueba4', '2019-05-15', 1),
(13, 2, 1, 3, 's', '2019-05-15', 1),
(14, 2, 1, 1, 'des', '2019-05-16', 1),
(15, 2, 1, 1, 'desdes', '2019-05-15', 1),
(16, 2, 1, 1, 'qw', '2019-05-14', 1),
(17, 2, 1, 1, 'desdes', '2019-05-16', 1),
(18, 6, 1, 1, 'AVANZANDO', '2019-05-16', 1),
(19, 2, 1, 1, 'por devolucion', '2019-05-16', 1),
(20, 2, 1, 1, 'en estado perfecto funciona sus dientes', '2019-05-16', 1),
(21, 2, 1, 2, 'bien evoluciona el paciente', '2019-05-16', 1),
(22, 2, 1, 1, 'PACIENTE MEJORANDO', '2019-05-16', 1),
(23, 2, 1, 1, 'prueba de razon', '2019-05-16', 1),
(24, 2, 1, 2, 'lo', '2019-05-16', 1),
(25, 2, 1, 1, 'uuy', '2019-05-16', 1),
(26, 2, 1, 1, 'desde', '2019-05-16', 1),
(27, 2, 1, 1, 'desde', '2019-05-16', 1),
(28, 2, 2, 4, 'sw', '2019-05-16', 1),
(29, 2, 1, 1, 'desdesde', '2019-05-16', 1),
(30, 2, 2, 4, 'desdeeeee', '2019-05-16', 1),
(31, 2, 1, 1, 'desde', '2019-05-16', 1),
(32, 2, 2, 4, 'des', '2019-05-16', 1),
(33, 2, 1, 2, 'des', '2019-05-16', 1),
(34, 2, 2, 4, 'des', '2019-05-16', 1),
(35, 2, 1, 1, 'DES', '2019-05-16', 1),
(36, 1, 1, 1, 'DE', '2019-05-16', 1),
(37, 1, 1, 1, 'greee', '2019-05-16', 2),
(38, 1, 1, 1, 'tre', '2019-05-16', 1),
(39, 1, 1, 1, 'fre', '2019-05-16', 1),
(40, 1, 2, 4, 'prueba200', '2019-05-17', 2),
(41, 1, 1, 1, 'prue', '2019-05-16', 1),
(42, 1, 1, 1, 'd', '2019-05-16', 1),
(43, 1, 1, 1, 'desde45', '2019-05-16', 1),
(44, 1, 2, 4, 'de', '2019-05-16', 1),
(45, 6, 1, 1, 'avanzando su evolucion ', '2019-05-16', 1),
(46, 6, 1, 1, 'avanzando de la mejor manera', '2019-05-16', 1),
(47, 6, 1, 1, 'prue', '2019-05-16', 1),
(48, 6, 1, 1, 'prueba 102', '2019-05-16', 1),
(49, 1, 1, 1, 'deee', '2019-05-16', 1),
(50, 1, 1, 2, 'desss', '2019-05-16', 1),
(51, 1, 2, 4, 'dess', '2019-05-16', 1),
(52, 1, 2, 4, 'seee', '2019-05-16', 1),
(53, 1, 1, 1, 'deee', '2019-05-17', 1),
(54, 1, 1, 1, 'dee', '2019-05-17', 1),
(55, 1, 1, 1, 'de', '2019-05-17', 1),
(56, 1, 1, 1, 'desss', '2019-05-18', 1),
(57, 1, 1, 1, 'des', '2019-05-14', 1),
(58, 1, 1, 1, 'we', '2019-05-18', 1),
(59, 1, 1, 1, 'desdeeeee', '2019-05-18', 1),
(60, 1, 1, 2, 'prueba', '2019-05-19', 1),
(61, 1, 1, 1, 'melissa', '2019-05-20', 1),
(62, 1, 1, 1, 'reetre', '2019-05-19', 1),
(63, 1, 2, 4, 'fsafsdf', '2019-05-23', 2),
(64, 7, 1, 1, 'apertura  cameral', '2019-07-18', 1),
(65, 9, 1, 12, 'MEJORANDO', '2019-07-27', 1),
(66, 10, 3, 5, 'mejorando', '2020-01-16', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_exploracion`
--

CREATE TABLE IF NOT EXISTS `paciente_exploracion` (
  `codi_pac` int(8) NOT NULL,
  `pa_exp` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pulso_exp` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `temperat_exp` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fc_exp` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `frec_exp` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `peso_exp` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `talla_exp` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `masa_exp` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clinico_exp` text COLLATE utf8_spanish_ci,
  `complement_exp` text COLLATE utf8_spanish_ci,
  `odontoesto_exp` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`codi_pac`),
  UNIQUE KEY `codi_pac` (`codi_pac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente_exploracion`
--

INSERT INTO `paciente_exploracion` (`codi_pac`, `pa_exp`, `pulso_exp`, `temperat_exp`, `fc_exp`, `frec_exp`, `peso_exp`, `talla_exp`, `masa_exp`, `clinico_exp`, `complement_exp`, `odontoesto_exp`) VALUES
(1, '4', '12', '8', '13', '6', '87', '1.95', '3', 'normal', 'al paciente', 'normales'),
(2, '12', 'pulso', 'tempra', 'fc', 'frecuen', NULL, NULL, NULL, 'ecamern', 'compel', 'odotn'),
(6, '1.2', '4', '5', '', '45', '85', '4565', 'asa', '', '', 'POR MEDIR'),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_odontograma`
--

CREATE TABLE IF NOT EXISTS `paciente_odontograma` (
  `pacodo_id` int(11) NOT NULL AUTO_INCREMENT,
  `codi_pac` int(8) DEFAULT NULL,
  `pacodo_tipo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_hal` int(8) DEFAULT NULL,
  `pacodo_categoria` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pacodo_estado` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pacodo_marcas` text COLLATE utf8_spanish_ci,
  `numero_die` int(4) DEFAULT NULL,
  `pacodo_dientefinal` int(4) DEFAULT NULL,
  `pacodo_sigla` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pacodo_espec` text COLLATE utf8_spanish_ci,
  `codi_usu` int(8) DEFAULT NULL,
  `pacodo_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`pacodo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=198 ;

--
-- Volcado de datos para la tabla `paciente_odontograma`
--

INSERT INTO `paciente_odontograma` (`pacodo_id`, `codi_pac`, `pacodo_tipo`, `id_hal`, `pacodo_categoria`, `pacodo_estado`, `pacodo_marcas`, `numero_die`, `pacodo_dientefinal`, `pacodo_sigla`, `pacodo_espec`, `codi_usu`, `pacodo_datetime`) VALUES
(83, 1, 'Inicial', 2, NULL, 'bueno', NULL, 43, 33, NULL, 'sdhdfh', 1, '2019-06-19 20:26:50'),
(84, 1, 'Inicial', 2, NULL, 'bueno', NULL, 83, 73, NULL, 'gsdgd', 1, '2019-06-19 20:26:58'),
(85, 1, 'Inicial', 2, NULL, 'bueno', NULL, 53, 63, NULL, 'afasf', 1, '2019-06-19 20:27:05'),
(86, 1, 'Inicial', 2, NULL, 'bueno', NULL, 13, 24, NULL, 'asafsaf', 1, '2019-06-19 20:27:14'),
(87, 1, 'Inicial', 13, NULL, NULL, NULL, 12, 24, NULL, 'tgsdgh', 1, '2019-06-19 20:31:26'),
(88, 1, 'Inicial', 17, NULL, NULL, NULL, 16, NULL, NULL, 'especiifacion', 1, '2019-06-23 12:22:32'),
(89, 1, 'Inicial', 17, NULL, NULL, NULL, 55, NULL, NULL, 'afese', 1, '2019-06-25 00:06:49'),
(90, 1, 'Inicial', 17, NULL, NULL, NULL, 48, NULL, NULL, 'corona', 1, '2019-06-25 00:31:17'),
(91, 1, 'Inicial', 15, NULL, NULL, NULL, 35, NULL, NULL, 'octores', 1, '2019-06-25 00:31:32'),
(93, 1, 'Inicial', 3, NULL, 'malo', NULL, 14, NULL, 'CMC', 'discromica', 1, '2019-06-26 12:00:40'),
(94, 1, 'Inicial', 3, NULL, 'bueno', NULL, 38, NULL, 'CF', '', 1, '2019-06-26 12:01:14'),
(95, 1, 'Inicial', 3, NULL, 'bueno', NULL, 37, NULL, 'CV', '', 1, '2019-06-26 12:01:27'),
(96, 1, 'Inicial', 3, NULL, 'malo', NULL, 36, NULL, 'CJ', '', 1, '2019-06-26 12:01:40'),
(97, 1, 'Inicial', 37, NULL, 'bueno', NULL, 35, NULL, 'CT', '', 1, '2019-06-26 12:01:56'),
(98, 1, 'Inicial', 5, NULL, 'bueno', NULL, 43, NULL, 'HP', '', 1, '2019-06-26 12:02:16'),
(99, 1, 'Inicial', 5, NULL, 'malo', NULL, 44, NULL, 'HM', '', 1, '2019-06-26 12:02:27'),
(100, 1, 'Inicial', 5, NULL, 'malo', NULL, 45, NULL, 'O', '', 1, '2019-06-26 12:02:45'),
(101, 1, 'Inicial', 5, NULL, 'bueno', NULL, 46, NULL, 'O', '', 1, '2019-06-26 12:03:07'),
(102, 1, 'Inicial', 5, NULL, 'bueno', NULL, 47, NULL, 'D', '', 1, '2019-06-26 12:03:20'),
(103, 1, 'Inicial', 5, NULL, 'bueno', NULL, 48, NULL, 'Fluorosis', '', 1, '2019-06-26 12:03:32'),
(104, 1, 'Inicial', 17, NULL, NULL, NULL, 34, NULL, NULL, '', 1, '2019-06-26 12:03:52'),
(105, 1, 'Inicial', 17, NULL, NULL, NULL, 45, NULL, NULL, '', 1, '2019-06-26 12:04:13'),
(106, 1, 'Inicial', 17, NULL, NULL, NULL, 31, NULL, NULL, '', 1, '2019-06-26 12:04:31'),
(107, 1, 'Inicial', 9, NULL, NULL, NULL, 41, NULL, NULL, '', 1, '2019-06-26 12:04:47'),
(108, 1, 'Inicial', 21, NULL, NULL, NULL, 43, NULL, 'E', '', 1, '2019-06-26 12:05:03'),
(109, 1, 'Inicial', 20, NULL, NULL, NULL, 34, NULL, NULL, '', 1, '2019-06-26 12:05:18'),
(110, 1, 'Inicial', 10, NULL, NULL, NULL, 33, NULL, NULL, '', 1, '2019-06-26 12:05:31'),
(111, 1, 'Inicial', 15, NULL, NULL, NULL, 32, NULL, NULL, '', 1, '2019-06-26 12:05:43'),
(112, 1, 'Inicial', 16, NULL, NULL, NULL, 42, NULL, NULL, '', 1, '2019-06-26 12:05:57'),
(113, 1, 'Inicial', 13, NULL, NULL, NULL, 48, 38, NULL, '', 1, '2019-06-26 12:06:29'),
(114, 1, 'Inicial', 29, NULL, NULL, NULL, 24, NULL, 'M2', '', 1, '2019-06-28 19:49:26'),
(115, 1, 'Inicial', 29, NULL, NULL, NULL, 24, NULL, 'M2', 'k', 1, '2019-06-28 19:49:32'),
(116, 1, 'Inicial', 29, NULL, NULL, NULL, 23, NULL, 'M3', 'k', 1, '2019-06-28 19:50:05'),
(117, 1, 'Inicial', 29, NULL, NULL, NULL, 33, NULL, 'M2', '', 1, '2019-06-28 19:50:45'),
(118, 1, 'Inicial', 29, NULL, NULL, NULL, 32, NULL, 'M2', '', 1, '2019-06-28 19:51:33'),
(119, 1, 'Inicial', 29, NULL, NULL, NULL, 32, NULL, 'M2', 'prueba', 1, '2019-06-28 19:51:46'),
(120, 1, 'Inicial', 29, NULL, NULL, NULL, 32, NULL, 'M3', 'sdgdsg', 1, '2019-06-28 19:54:16'),
(121, 1, 'Inicial', 29, NULL, NULL, NULL, 32, NULL, 'M3', 'sdgdsg', 1, '2019-06-28 19:54:41'),
(122, 1, 'Inicial', 29, NULL, NULL, NULL, 32, NULL, 'M3', 'sdgdsg', 1, '2019-06-28 19:56:36'),
(123, 1, 'Inicial', 28, NULL, NULL, NULL, 75, NULL, NULL, 'PRUEBA', 1, '2019-06-30 01:39:08'),
(124, 1, 'Inicial', 3, NULL, 'bueno', NULL, 18, NULL, 'CM', 'prueba', 1, '2019-07-01 12:01:14'),
(126, 2, 'Inicial', 35, NULL, 'bueno', NULL, 72, NULL, 'TC', '', 1, '2019-07-01 19:26:51'),
(127, 1, 'Inicial', 4, NULL, NULL, '{"Distal":{"Valor":true},"Mesial":{"Valor":true}}', 53, NULL, 'CE', '', 1, '2019-07-10 15:38:11'),
(128, 1, 'Inicial', 11, NULL, NULL, '{"Vestibular":{"Valor":true,"Estado":"malo"},"Distal":{"Valor":true,"Estado":"bueno"},"Mesial":{"Valor":true,"Estado":"malo"}}', 65, NULL, 'IV', '', 1, '2019-07-10 15:38:41'),
(129, 1, 'Evolución', 1, NULL, 'bueno', NULL, 14, 25, NULL, 'sdgdsfh', 1, '2019-07-10 15:39:33'),
(130, 1, 'Evolución', 3, NULL, 'bueno', NULL, 11, NULL, 'CF', 'sdfhds', 1, '2019-07-10 15:41:10'),
(131, 1, 'Evolución', 37, NULL, 'malo', NULL, 51, NULL, 'CT', 'dfhdh', 1, '2019-07-10 15:43:26'),
(132, 2, 'Inicial', 13, NULL, NULL, NULL, 18, 28, NULL, '', 1, '2019-07-10 17:25:19'),
(133, 2, 'Inicial', 7, 'Incisal', NULL, NULL, 35, NULL, NULL, '', 1, '2019-07-10 17:25:39'),
(134, 2, 'Inicial', 4, NULL, NULL, '{"Lingual":{"Valor":true},"Distal":{"Valor":true}}', 34, NULL, 'MB', '', 1, '2019-07-10 17:26:19'),
(135, 2, 'Inicial', 4, NULL, NULL, '{"Lingual":{"Valor":true}}', 36, NULL, 'CDP', '', 1, '2019-07-10 17:26:37'),
(136, 2, 'Inicial', 28, NULL, NULL, NULL, 32, NULL, NULL, '', 1, '2019-07-10 17:27:27'),
(137, 2, 'Inicial', 35, NULL, 'malo', NULL, 42, NULL, 'TC', '', 1, '2019-07-10 17:27:44'),
(138, 2, 'Inicial', 6, NULL, NULL, '{"Oclusal":{"Valor":true,"Estado":"malo"}}', 74, NULL, NULL, '', 1, '2019-07-10 17:28:09'),
(139, 2, 'Inicial', 5, NULL, 'bueno', NULL, 63, NULL, 'HP', '', 1, '2019-07-10 18:34:04'),
(140, 2, 'Inicial', 7, 'Coronal', NULL, NULL, 84, NULL, NULL, '', 1, '2019-07-10 18:34:26'),
(141, 2, 'Inicial', 30, NULL, 'bueno', NULL, 85, NULL, NULL, '', 1, '2019-07-10 18:34:38'),
(142, 2, 'Inicial', 18, 'Distal', NULL, NULL, 53, NULL, NULL, '', 1, '2019-07-10 18:35:59'),
(143, 2, 'Inicial', 36, NULL, NULL, NULL, 52, NULL, NULL, '', 1, '2019-07-10 18:39:08'),
(144, 2, 'Inicial', 11, NULL, NULL, '{"Vestibular":{"Valor":true,"Estado":"bueno"},"Mesial":{"Valor":true,"Estado":"malo"}}', 81, NULL, 'IV', '', 1, '2019-07-10 18:41:26'),
(145, 1, 'Inicial', 5, NULL, 'bueno', NULL, 26, NULL, 'HP', 'buen estado', 1, '2019-07-18 00:41:44'),
(146, 1, 'Inicial', 17, NULL, NULL, NULL, 27, NULL, NULL, 'probando', 1, '2019-07-18 15:15:11'),
(147, 7, 'Inicial', 4, NULL, NULL, '{"Oclusal":{"Valor":true}}', 15, NULL, 'CDP', '', 1, '2019-07-18 17:46:33'),
(148, 7, 'Inicial', 35, NULL, 'malo', NULL, 24, NULL, 'TC', '', 1, '2019-07-18 17:47:55'),
(150, 7, 'Inicial', 6, NULL, NULL, '{"Oclusal":{"Valor":true}}', 16, NULL, NULL, '', 1, '2019-07-18 17:50:41'),
(151, 1, 'Inicial', 17, NULL, NULL, NULL, 85, NULL, NULL, '', 1, '2019-07-22 11:47:38'),
(154, 7, 'Inicial', 7, 'Coronal', NULL, NULL, 72, NULL, NULL, '', 1, '2019-07-22 12:42:47'),
(155, 7, 'Inicial', 7, 'Incisal', NULL, NULL, 51, NULL, NULL, '', 1, '2019-07-22 12:43:35'),
(156, 7, 'Inicial', 7, 'Incisal', NULL, NULL, 63, NULL, NULL, '', 1, '2019-07-22 12:47:13'),
(157, 7, 'Inicial', 7, 'Raiz y Coronal', NULL, NULL, 53, NULL, NULL, '', 1, '2019-07-22 12:53:54'),
(160, 7, 'Inicial', 9, NULL, NULL, NULL, 55, NULL, NULL, '', 1, '2019-07-22 13:43:48'),
(161, 7, 'Inicial', 21, NULL, NULL, NULL, 64, NULL, NULL, '', 1, '2019-07-22 13:47:28'),
(162, 7, 'Inicial', 20, NULL, NULL, NULL, 62, NULL, NULL, '', 1, '2019-07-22 13:50:00'),
(163, 7, 'Inicial', 10, NULL, NULL, NULL, 65, NULL, NULL, '', 1, '2019-07-22 13:52:26'),
(164, 7, 'Inicial', 14, NULL, NULL, NULL, 82, NULL, NULL, '', 1, '2019-07-22 13:56:38'),
(165, 7, 'Inicial', 19, NULL, NULL, NULL, 31, NULL, 'M', '', 1, '2019-07-22 13:58:15'),
(166, 7, 'Inicial', 13, NULL, NULL, NULL, 13, 12, NULL, '', 1, '2019-07-22 13:59:01'),
(167, 7, 'Inicial', 30, NULL, 'bueno', NULL, 62, NULL, NULL, '', 1, '2019-07-22 14:01:52'),
(168, 7, 'Inicial', 30, NULL, 'bueno', NULL, 61, NULL, NULL, '', 1, '2019-07-22 14:02:30'),
(169, 7, 'Inicial', 30, NULL, 'malo', NULL, 61, NULL, NULL, '', 1, '2019-07-22 14:02:40'),
(170, 7, 'Inicial', 8, NULL, NULL, NULL, 21, NULL, NULL, '', 1, '2019-07-22 14:04:06'),
(171, 7, 'Inicial', 25, NULL, NULL, NULL, 52, NULL, NULL, '', 1, '2019-07-22 14:07:14'),
(172, 7, 'Inicial', 30, NULL, 'bueno', NULL, 62, NULL, NULL, '', 1, '2019-07-22 14:08:54'),
(173, 7, 'Inicial', 18, 'Distal', NULL, NULL, 61, NULL, NULL, '', 1, '2019-07-22 14:09:17'),
(174, 7, 'Inicial', 18, 'Distal', NULL, NULL, 62, NULL, NULL, '', 1, '2019-07-22 14:11:38'),
(175, 1, 'Inicial', 11, NULL, NULL, '{"Vestibular":{"Valor":true,"Estado":"malo"},"Palatino":{"Valor":true,"Estado":"malo"},"Distal":{"Valor":true}}', 17, NULL, 'R', '', 1, '2019-07-22 21:08:03'),
(176, 8, 'Inicial', 9, NULL, NULL, NULL, 11, NULL, NULL, '', 1, '2019-07-22 21:19:13'),
(177, 8, 'Inicial', 4, NULL, NULL, '{"Palatino":{"Valor":true},"Distal":{"Valor":true},"Mesial":{"Valor":true},"Oclusal":{"Valor":true}}', 27, NULL, 'CDP', '', 1, '2019-07-22 21:20:41'),
(178, 8, 'Inicial', 3, NULL, 'malo', NULL, 17, NULL, 'CMC', '', 1, '2019-07-22 21:21:17'),
(179, 8, 'Inicial', 3, NULL, 'malo', NULL, 47, NULL, 'CMC', '', 1, '2019-07-22 21:21:51'),
(181, 8, 'Inicial', 11, NULL, NULL, '{"Oclusal":{"Valor":true,"Estado":"malo"}}', 24, NULL, 'R', '', 1, '2019-07-22 21:46:44'),
(182, 8, 'Inicial', 3, NULL, 'bueno', NULL, 52, NULL, 'CM', '', 1, '2019-07-22 22:25:39'),
(183, 8, 'Inicial', 3, NULL, 'bueno', NULL, 15, NULL, 'CF', '', 1, '2019-07-22 22:28:31'),
(184, 8, 'Inicial', 3, NULL, 'bueno', NULL, 13, NULL, 'CM', '', 1, '2019-07-22 22:32:45'),
(185, 8, 'Inicial', 3, NULL, 'bueno', NULL, 22, NULL, 'CF', '', 1, '2019-07-22 22:36:31'),
(186, 8, 'Inicial', 5, NULL, 'bueno', NULL, 23, NULL, 'HP', '', 1, '2019-07-22 22:36:48'),
(187, 1, 'Inicial', 3, NULL, 'bueno', NULL, 74, NULL, 'CM', '', 1, '2019-07-22 22:43:50'),
(188, 1, 'Inicial', 3, NULL, 'bueno', NULL, 25, NULL, 'CM', '', 1, '2019-07-24 21:50:42'),
(189, 1, 'Inicial', 37, NULL, 'bueno', NULL, 83, NULL, 'CT', '', 1, '2019-07-24 22:02:16'),
(190, 1, 'Inicial', 37, NULL, 'bueno', NULL, 81, NULL, 'CT', '', 1, '2019-07-24 22:02:27'),
(191, 1, 'Inicial', 37, NULL, 'bueno', NULL, 71, NULL, 'CT', '', 1, '2019-07-24 22:02:34'),
(192, 1, 'Inicial', 7, 'Coronal', NULL, NULL, 85, NULL, NULL, '', 1, '2019-07-24 23:49:19'),
(193, 1, 'Inicial', 7, 'Coronal', NULL, NULL, 84, NULL, NULL, '', 1, '2019-07-24 23:49:27'),
(194, 2, 'Inicial', 3, NULL, 'bueno', NULL, 62, NULL, 'CM', '', 1, '2019-07-25 13:21:15'),
(195, 9, 'Inicial', 37, NULL, 'bueno', NULL, 21, NULL, 'CT', '', 1, '2019-07-27 21:01:29'),
(196, 9, 'Inicial', 37, NULL, 'bueno', NULL, 22, NULL, 'CT', '', 1, '2019-07-27 21:01:35'),
(197, 10, 'Inicial', 1, NULL, 'bueno', NULL, 53, 51, NULL, '', 1, '2020-01-16 19:27:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_placa`
--

CREATE TABLE IF NOT EXISTS `paciente_placa` (
  `pla_id` int(8) NOT NULL AUTO_INCREMENT,
  `codi_pac` int(8) DEFAULT NULL,
  `pla_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pla_notas` text COLLATE utf8_spanish_ci,
  `pla_archivo` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pla_fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pla_estado` int(1) DEFAULT '1',
  PRIMARY KEY (`pla_id`),
  KEY `codi_pac` (`codi_pac`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `paciente_placa`
--

INSERT INTO `paciente_placa` (`pla_id`, `codi_pac`, `pla_nombre`, `pla_notas`, `pla_archivo`, `pla_fecha`, `pla_estado`) VALUES
(22, 6, 'placa posterior', 'esto presenta unas cosas extrañas', 'error_en_fichas.png', '2019-04-27 00:23:17', 2),
(23, 6, 'chaleco', 'notasa', 'chaleco02.jpg', '2019-04-27 00:24:49', 2),
(24, 6, 'comida criolla', 'notas notas notas', '4804_LaDamaJuana_img11.jpg', '2019-04-27 00:25:53', 2),
(25, 6, 'boton na', 'notasa', 'boton2.png', '2019-04-27 00:27:29', 2),
(26, 6, 'nombre original', 'notass yt mas notas', 'folios_sin_usar.png', '2019-04-27 00:47:28', 2),
(27, 6, 'placa de mandibula', 'aaaddd', 'fondo.jpg', '2019-04-27 09:35:44', 2),
(28, 6, 'Lentes de sol', '', '994740_10153834837940419_3234783633739683684_n.jpg', '2019-04-27 11:42:26', 1),
(29, 6, 'PLACA DENTAL', '', '1604907_803032483176793_6251016339880222135_n.jpg', '2019-04-27 11:46:40', 1),
(30, 6, 'PRUEBA 2', '', '10255849_1056391401090554_8590161764988025352_n.jpg', '2019-04-27 11:55:11', 1),
(31, 1, 'PLACA DENTAL', 'ODONTOGRAMA', '3464_1259891837364588_371872476449882433_n.jpg', '2019-04-28 18:47:30', 2),
(32, 6, 'actualizar tia', 'notas', '02_actualziar_tia.png', '2019-04-30 09:23:12', 1),
(33, 1, 'nobre', 'notas', '', '2019-05-01 22:57:05', 2),
(34, 1, 'nombre de placa', 'notas', 'graficos_sta_funcionando.png', '2019-05-03 13:48:02', 1),
(35, 1, 'asda', 'dadad', 'logo-iglesia.png', '2019-05-03 13:55:56', 1),
(36, 1, 'excel', 'notas', 'cronograma_auxiliar_cuota_mensual.png', '2019-05-03 15:56:57', 1),
(37, 1, 'PLACA DORA', 'PLACA', 'dora.jpg', '2019-07-01 12:02:39', 1),
(38, 7, 'rx periapical', '', 'diente.jpg', '2019-07-18 17:56:10', 1),
(39, 9, 'PLACA DOLOR', 'NINGUNA', '994740_10153834837940419_3234783633739683684_n1.jpg', '2019-07-27 21:02:54', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_receta`
--

CREATE TABLE IF NOT EXISTS `paciente_receta` (
  `pacrec_id` int(8) NOT NULL AUTO_INCREMENT,
  `codi_pac` int(8) DEFAULT NULL,
  `pacrec_fecha` date DEFAULT NULL,
  `pacrec_hora` time DEFAULT NULL,
  `pacrec_asunto` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pacrec_receta` text COLLATE utf8_spanish_ci,
  `codi_med` int(8) DEFAULT NULL,
  `codi_enf01` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `codi_enf02` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `codi_enf03` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `pacrec_indicaciones` text COLLATE utf8_spanish_ci NOT NULL,
  `pacrec_estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = activo, 2 = anulado',
  PRIMARY KEY (`pacrec_id`),
  KEY `codi_pac` (`codi_pac`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `paciente_receta`
--

INSERT INTO `paciente_receta` (`pacrec_id`, `codi_pac`, `pacrec_fecha`, `pacrec_hora`, `pacrec_asunto`, `pacrec_receta`, `codi_med`, `codi_enf01`, `codi_enf02`, `codi_enf03`, `pacrec_indicaciones`, `pacrec_estado`) VALUES
(1, 6, '2019-04-24', '05:16:32', 'asunto', 'receta', 1, 'K00.4', NULL, NULL, 'indicaciones', 1),
(2, 6, '2019-04-26', '17:58:51', 'Tratamiento bocales', 'recetaaa', 1, 'K00.2', 'K00.1', 'K00.1', 'por una hora ', 1),
(3, 6, '2019-04-26', '18:00:26', 'asuntoo modificado', 'receta', 1, 'K00.0', NULL, NULL, 'indicaciones', 2),
(4, 6, '2019-04-26', '18:08:53', 'asunto y nada mas', 'receta', 1, 'K00.0', 'K00.1', 'K04.3', 'indicaciones', 2),
(5, 6, '2019-04-26', '18:12:54', 'asunto', 'receta', 1, 'K00.1', 'K00.2', NULL, 'inic', 2),
(6, 1, '2019-04-28', '18:48:48', 'RECETA DENTAL', 'PARA LA MUELA', 1, 'K00.0', 'K00.0', 'K00.5', '1 VEZ AL DIA', 1),
(7, 2, '2019-05-01', '12:02:28', 'asunto', 'rectaa', 1, 'K00.2', 'K00.1', 'K00.1', 'indicaciones', 1),
(8, 7, '2019-07-18', '17:54:15', 'pulpitis', 'clindamicina 300 mg\nketerolaco 10mg', 1, 'K04.0', NULL, NULL, 'clindamicina 1 cap cada 6 horas\n', 1),
(9, 8, '2019-07-22', '21:51:58', 'TRATAR DIENTE ', 'PANADOL', 1, 'K05.4', 'K00.30', 'K00.5', 'UNA VEZ AL DIA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE IF NOT EXISTS `pago` (
  `id_pago` int(8) NOT NULL AUTO_INCREMENT,
  `codi_tra` int(8) DEFAULT NULL,
  `num_pago` int(3) DEFAULT NULL,
  `estado_pago` int(1) DEFAULT NULL COMMENT '1 = Pendiente, 2 = Finalizado',
  `fecharegistro_pago` date DEFAULT NULL,
  `fechavencimiento_pago` date DEFAULT NULL,
  `monto_pago` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `codi_tra` (`codi_tra`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=137 ;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `codi_tra`, `num_pago`, `estado_pago`, `fecharegistro_pago`, `fechavencimiento_pago`, `monto_pago`) VALUES
(87, 13, 1, 2, '2019-03-23', '2019-03-23', '900.00'),
(88, 13, 2, 2, '2019-03-23', '2019-03-30', '900.00'),
(89, 13, 3, 1, '2019-03-23', '2019-04-06', '900.00'),
(90, 13, 4, 1, '2019-03-23', '2019-04-13', '900.00'),
(91, 14, 1, 2, '2019-03-23', '2019-03-23', '360.00'),
(92, 14, 2, 2, '2019-03-23', '2019-03-30', '360.00'),
(93, 14, 3, 1, '2019-03-23', '2019-04-06', '360.00'),
(94, 14, 4, 1, '2019-03-23', '2019-04-13', '360.00'),
(95, 14, 5, 1, '2019-03-23', '2019-04-20', '360.00'),
(96, 14, 6, 1, '2019-03-23', '2019-04-27', '360.00'),
(97, 15, 1, 2, '2019-03-24', '2019-03-24', '598.00'),
(98, 15, 2, 2, '2019-03-24', '2019-03-31', '598.00'),
(99, 15, 3, 2, '2019-03-24', '2019-04-07', '598.00'),
(100, 15, 4, 1, '2019-03-24', '2019-04-14', '598.00'),
(101, 15, 5, 1, '2019-03-24', '2019-04-21', '598.00'),
(102, 16, 1, 2, '2019-03-27', '2019-03-27', '787.25'),
(103, 16, 2, 2, '2019-03-27', '2019-04-03', '787.25'),
(104, 16, 3, 2, '2019-03-27', '2019-04-10', '787.25'),
(105, 16, 4, 2, '2019-03-27', '2019-04-17', '787.25'),
(106, 17, 1, 2, '2019-03-28', '2019-03-28', '900.50'),
(107, 17, 2, 2, '2019-03-28', '2019-04-04', '900.50'),
(108, 17, 3, 2, '2019-03-28', '2019-04-11', '900.50'),
(109, 17, 4, 1, '2019-03-28', '2019-04-18', '900.50'),
(110, 18, 1, 2, '2019-04-04', '2019-04-04', '422.83'),
(111, 18, 2, 1, '2019-04-04', '2019-04-11', '422.83'),
(112, 18, 3, 1, '2019-04-04', '2019-04-18', '422.83'),
(113, 18, 4, 1, '2019-04-04', '2019-04-25', '422.83'),
(114, 18, 5, 1, '2019-04-04', '2019-05-02', '422.83'),
(115, 18, 6, 1, '2019-04-04', '2019-05-09', '422.83'),
(116, 20, 1, 1, '2019-04-06', '2019-04-06', '84.50'),
(117, 20, 2, 1, '2019-04-06', '2019-04-13', '84.50'),
(118, 20, 3, 1, '2019-04-06', '2019-04-20', '84.50'),
(119, 20, 4, 1, '2019-04-06', '2019-04-27', '84.50'),
(120, 21, 1, 2, '2019-04-06', '2019-04-06', '262.67'),
(121, 21, 2, 2, '2019-04-06', '2019-04-13', '262.67'),
(122, 21, 3, 2, '2019-04-06', '2019-04-20', '262.67'),
(123, 21, 4, 2, '2019-04-06', '2019-04-27', '262.67'),
(124, 21, 5, 1, '2019-04-06', '2019-05-04', '262.67'),
(125, 21, 6, 1, '2019-04-06', '2019-05-11', '262.67'),
(126, 23, 1, 2, '2019-04-28', '2019-04-28', '571.00'),
(127, 23, 2, 1, '2019-04-28', '2019-05-05', '571.00'),
(128, 26, 1, 2, '2019-07-18', '2019-07-18', '142.00'),
(129, 27, 1, 2, '2019-07-27', '2019-07-27', '380.67'),
(130, 27, 2, 2, '2019-07-27', '2019-08-10', '380.67'),
(131, 27, 3, 2, '2019-07-27', '2019-08-24', '380.67'),
(132, 28, 1, 2, '2020-01-16', '2020-01-16', '200.00'),
(133, 28, 2, 1, '2020-01-16', '2020-01-23', '200.00'),
(134, 28, 3, 1, '2020-01-16', '2020-01-30', '200.00'),
(135, 28, 4, 1, '2020-01-16', '2020-02-06', '200.00'),
(136, 28, 5, 1, '2020-01-16', '2020-02-13', '200.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_comprobante`
--

CREATE TABLE IF NOT EXISTS `pago_comprobante` (
  `id_pago` int(8) DEFAULT NULL,
  `id_com` int(8) DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = valido, 2 = anulado ',
  UNIQUE KEY `id_pago` (`id_pago`,`id_com`),
  KEY `id_pago_2` (`id_pago`),
  KEY `id_com` (`id_com`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pago_comprobante`
--

INSERT INTO `pago_comprobante` (`id_pago`, `id_com`, `estado`) VALUES
(87, 40, 1),
(88, 41, 1),
(91, 42, 1),
(92, 43, 1),
(97, 44, 1),
(98, 44, 1),
(99, 45, 1),
(102, 46, 1),
(103, 47, 1),
(104, 48, 1),
(106, 49, 1),
(107, 50, 1),
(108, 51, 1),
(110, 52, 1),
(111, 54, 2),
(105, 55, 1),
(116, 56, 2),
(120, 57, 1),
(121, 57, 1),
(122, 58, 1),
(123, 59, 1),
(126, 60, 1),
(128, 61, 1),
(129, 62, 1),
(130, 63, 1),
(131, 64, 1),
(132, 65, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `gentilicio` varchar(100) DEFAULT NULL,
  `orden` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=241 ;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `iso`, `nombre`, `gentilicio`, `orden`) VALUES
(1, 'AF', 'Afganistán', 'Afgana', 50),
(2, 'AX', 'Islas Gland', 'Islas Gland', 51),
(3, 'AL', 'Albania', 'Albanesa', 52),
(4, 'DE', 'Alemania', 'Alemana', 53),
(5, 'AD', 'Andorra', 'Andorrana', 54),
(6, 'AO', 'Angola', 'Angoleña', 55),
(7, 'AI', 'Anguilla', 'Anguilense', 56),
(8, 'AQ', 'Antártida', 'Antártico/a', 57),
(9, 'AG', 'Antigua y Barbuda', 'Antiguano', 58),
(10, 'AN', 'Antillas Holandesas', 'Antillas Holandesas', 59),
(11, 'SA', 'Arabia Saudí', 'Saudí', 60),
(12, 'DZ', 'Argelia', 'Argelina', 61),
(13, 'AR', 'Argentina', 'Argentina', 62),
(14, 'AM', 'Armenia', 'Armenio', 63),
(15, 'AW', 'Aruba', 'Arubano', 64),
(16, 'AU', 'Australia', 'Australiana', 65),
(17, 'AT', 'Austria', 'Austriaca', 66),
(18, 'AZ', 'Azerbaiyán', 'Azerbaiyano', 67),
(19, 'BS', 'Bahamas', 'Bahamesa', 68),
(20, 'BH', 'Bahréin', 'Bahreina', 69),
(21, 'BD', 'Bangladesh', 'Bangladesha', 70),
(22, 'BB', 'Barbados', 'Barbadesa', 71),
(23, 'BY', 'Bielorrusia', 'Bielorruso', 72),
(24, 'BE', 'Bélgica', 'Belga', 73),
(25, 'BZ', 'Belice', 'Beliceña', 74),
(26, 'BJ', 'Benin', 'Beninés', 75),
(27, 'BM', 'Bermudas', 'Bermudesa', 76),
(28, 'BT', 'Bhután', 'Butana', 77),
(29, 'BO', 'Bolivia', 'Boliviana', 78),
(30, 'BA', 'Bosnia y Herzegovina', 'Bosnioherzegovino', 79),
(31, 'BW', 'Botsuana', 'Botsuano', 80),
(32, 'BV', 'Isla Bouvet', 'Isla Bouvet', 81),
(33, 'BR', 'Brasil', 'Brasileña', 5),
(34, 'BN', 'Brunéi', 'Bruneano', 83),
(35, 'BG', 'Bulgaria', 'Búlgaro', 84),
(36, 'BF', 'Burkina Faso', 'Burkinés', 85),
(37, 'BI', 'Burundi', 'Burundés', 86),
(38, 'CV', 'Cabo Verde', 'Caboverdiano', 87),
(39, 'KY', 'Islas Caimán', 'Islas Caimán', 88),
(40, 'KH', 'Camboya', 'Camboyana', 89),
(41, 'CM', 'Camerún', 'Camerunesa', 90),
(42, 'CA', 'Canadá', 'Canadiense', 2),
(43, 'CF', 'República Centroafricana', 'Centroafricana', 92),
(44, 'TD', 'Chad', 'Chadeña', 93),
(45, 'CZ', 'República Checa', 'Checo', 94),
(46, 'CL', 'Chile', 'Chilena', 4),
(47, 'CN', 'China', 'China', 96),
(48, 'CY', 'Chipre', 'Chipriota', 97),
(49, 'CX', 'Isla de Navidad', 'Isla de Navidad', 98),
(50, 'VA', 'Ciudad del Vaticano', 'Vaticano', 99),
(51, 'CC', 'Islas Cocos', 'Islas Cocos\r\n', 100),
(52, 'CO', 'Colombia', 'Colombiana', 3),
(53, 'KM', 'Comoras', 'Comorense', 102),
(54, 'CD', 'República Democrática del Congo', 'Congoleño', 103),
(55, 'CG', 'Congo', 'Congoleña', 104),
(56, 'CK', 'Islas Cook', 'Islas Cook', 105),
(57, 'KP', 'Corea del Norte', 'Norcoreano', 106),
(58, 'KR', 'Corea del Sur', 'Surcoreano', 107),
(59, 'CI', 'Costa de Marfil', 'Marfileño', 108),
(60, 'CR', 'Costa Rica', 'Costarricense', 109),
(61, 'HR', 'Croacia', 'Croata', 110),
(62, 'CU', 'Cuba', 'Cubana', 111),
(63, 'DK', 'Dinamarca', 'Danes', 112),
(64, 'DM', 'Dominica', 'Dominicana', 113),
(65, 'DO', 'República Dominicana', 'Dominicano', 114),
(66, 'EC', 'Ecuador', 'Ecuatoriana', 115),
(67, 'EG', 'Egipto', 'Egipcia', 116),
(68, 'SV', 'El Salvador', 'Salvadoreño', 117),
(69, 'AE', 'Emiratos Árabes Unidos', 'Emiratí', 118),
(70, 'ER', 'Eritrea', 'Eritreo', 119),
(71, 'SK', 'Eslovaquia', 'Eslovaco', 120),
(72, 'SI', 'Eslovenia', 'Esloveno', 121),
(73, 'ES', 'España', 'Española', 122),
(74, 'UM', 'Islas ultramarinas de Estados Unidos', 'Islas ultramarinas de Estados Unidos', 123),
(75, 'US', 'Estados Unidos', 'Estadounidense', 1),
(76, 'EE', 'Estonia', 'Estona', 125),
(77, 'ET', 'Etiopía', 'Etiope', 126),
(78, 'FO', 'Islas Feroe', 'Islas Feroe', 127),
(79, 'PH', 'Filipinas', 'Filipina', 128),
(80, 'FI', 'Finlandia', 'Finlandesa', 129),
(81, 'FJ', 'Fiyi', 'Fiyiano', 130),
(82, 'FR', 'Francia', 'Francesa', 131),
(83, 'GA', 'Gabón', 'Gabona', 132),
(84, 'GM', 'Gambia', 'Gambiano', 133),
(85, 'GE', 'Georgia', 'Georgiano', 134),
(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur', 'Islas Georgias del Sur y Sandwich del Sur', 135),
(87, 'GH', 'Ghana', 'Ghanesa', 136),
(88, 'GI', 'Gibraltar', 'Gibraltareño', 137),
(89, 'GD', 'Granada', 'Granadino', 138),
(90, 'GR', 'Grecia', 'Griega', 139),
(91, 'GL', 'Groenlandia', 'Groenlandés', 140),
(92, 'GP', 'Guadalupe', 'Guadalupeño', 141),
(93, 'GU', 'Guam', 'Guameño', 142),
(94, 'GT', 'Guatemala', 'Guatemalteca', 143),
(95, 'GF', 'Guayana Francesa', 'Fancoguyanés', 144),
(96, 'GN', 'Guinea', 'Guinesa', 145),
(97, 'GQ', 'Guinea Ecuatorial', 'Guinesa Ecuatoriana', 146),
(98, 'GW', 'Guinea-Bissau', 'Bisauguineano', 147),
(99, 'GY', 'Guyana', 'Guyanes', 148),
(100, 'HT', 'Haití', 'Haitiana', 149),
(101, 'HM', 'Islas Heard y McDonald', 'Islas Heard y McDonald', 150),
(102, 'HN', 'Honduras', 'Hondureña', 151),
(103, 'HK', 'Hong Kong', 'Hongkonés', 152),
(104, 'HU', 'Hungría', 'Hungara', 153),
(105, 'IN', 'India', 'India', 154),
(106, 'ID', 'Indonesia', 'Indonesa', 155),
(107, 'IR', 'Irán', 'Irani', 156),
(108, 'IQ', 'Iraq', 'Iraki', 157),
(109, 'IE', 'Irlanda', 'Irlandesa', 158),
(110, 'IS', 'Islandia', 'Islandesa', 159),
(111, 'IL', 'Israel', 'Israeli', 160),
(112, 'IT', 'Italia', 'Italiana', 161),
(113, 'JM', 'Jamaica', 'Jamaiquina', 162),
(114, 'JP', 'Japón', 'Japonesa', 163),
(115, 'JO', 'Jordania', 'Jordana', 164),
(116, 'KZ', 'Kazajstán', 'Kazajo', 165),
(117, 'KE', 'Kenia', 'Keniana', 166),
(118, 'KG', 'Kirguistán', 'Kirguís', 167),
(119, 'KI', 'Kiribati', 'Kiribatiano', 168),
(120, 'KW', 'Kuwait', 'Kuwaiti', 169),
(121, 'LA', 'Laos', 'Laosiana', 170),
(122, 'LS', 'Lesotho', 'Lesothensa', 171),
(123, 'LV', 'Letonia', 'Letonesa', 172),
(124, 'LB', 'Líbano', 'Libanesa', 173),
(125, 'LR', 'Liberia', 'Liberiana', 174),
(126, 'LY', 'Libia', 'Libeña', 175),
(127, 'LI', 'Liechtenstein', 'Liechtenstein', 176),
(128, 'LT', 'Lituania', 'Lituana', 177),
(129, 'LU', 'Luxemburgo', 'Luxemburgo', 178),
(130, 'MO', 'Macao', 'Macaense', 179),
(131, 'MK', 'Macedonia', 'Macedonio', 180),
(132, 'MG', 'Madagascar', 'Madagascar', 181),
(133, 'MY', 'Malasia', 'Malasio', 182),
(134, 'MW', 'Malawi', 'Malauí', 183),
(135, 'MV', 'Maldivas', 'Maldivo', 184),
(136, 'ML', 'Malí', 'Maliense', 185),
(137, 'MT', 'Malta', 'Maltesa', 186),
(138, 'FK', 'Islas Malvinas', 'Islas Malvinas', 187),
(139, 'MP', 'Islas Marianas del Norte', 'Islas Marianas del Norte', 188),
(140, 'MA', 'Marruecos', 'Marroqui', 189),
(141, 'MH', 'Islas Marshall', 'Islas Marshall', 190),
(142, 'MQ', 'Martinica', 'Martiniqués', 191),
(143, 'MU', 'Mauricio', 'Mauricio', 192),
(144, 'MR', 'Mauritania', 'Mauritano', 193),
(145, 'YT', 'Mayotte', 'Mayotés', 194),
(146, 'MX', 'México', 'Mexicana', 6),
(147, 'FM', 'Micronesia', 'Micronesio', 196),
(148, 'MD', 'Moldavia', 'Moldavo', 197),
(149, 'MC', 'Mónaco', 'Monaco', 198),
(150, 'MN', 'Mongolia', 'Mongolesa', 199),
(151, 'MS', 'Montserrat', 'Montserratense', 200),
(152, 'MZ', 'Mozambique', 'Mozambiqueño', 201),
(153, 'MM', 'Birmania', 'Birmano', 202),
(154, 'NA', 'Namibia', 'Namibio', 203),
(155, 'NR', 'Nauru', 'Nauru', 204),
(156, 'NP', 'Nepal', 'Nepalesa', 205),
(157, 'NI', 'Nicaragua', 'Nicaraguense', 206),
(158, 'NE', 'Níger', 'Nigerana', 207),
(159, 'NG', 'Nigeria', 'Nigeriana', 208),
(160, 'NU', 'Niue', 'Niueño', 209),
(161, 'NF', 'Isla Norfolk', 'Isla Norfolk', 210),
(162, 'NO', 'Noruega', 'Noruega', 211),
(163, 'NC', 'Nueva Caledonia', 'Neocaledonio', 212),
(164, 'NZ', 'Nueva Zelanda', 'Neozelandesa', 213),
(165, 'OM', 'Omán', 'Omana', 214),
(166, 'NL', 'Países Bajos', 'Neerlandés', 215),
(167, 'PK', 'Pakistán', 'Pakistani', 216),
(168, 'PW', 'Palau', 'Palau', 217),
(169, 'PS', 'Palestina', 'Palestino', 218),
(170, 'PA', 'Panamá', 'Panameña', 219),
(171, 'PG', 'Papúa Nueva Guinea', 'Papuano', 220),
(172, 'PY', 'Paraguay', 'Paraguaya', 221),
(173, 'PE', 'Perú', 'Peruana', 222),
(174, 'PN', 'Islas Pitcairn', 'Islas Pitcairn', 223),
(175, 'PF', 'Polinesia Francesa', 'Francopolinesio', 224),
(176, 'PL', 'Polonia', 'Polaca', 225),
(177, 'PT', 'Portugal', 'Portuguesa', 226),
(178, 'PR', 'Puerto Rico', 'Portoriqueña', 227),
(179, 'QA', 'Qatar', 'Catarí', 228),
(180, 'GB', 'Reino Unido', 'Británico', 229),
(181, 'RE', 'Reunión', 'Reunionés', 230),
(182, 'RW', 'Ruanda', 'Ruanda', 231),
(183, 'RO', 'Rumania', 'Rumana', 232),
(184, 'RU', 'Rusia', 'Rusa', 233),
(185, 'EH', 'Sahara Occidental', 'Sahara Occidental', 234),
(186, 'SB', 'Islas Salomón', 'Islas Salomón', 235),
(187, 'WS', 'Samoa', 'Samoano', 236),
(188, 'AS', 'Samoa Americana', 'Samoano Estadounidense', 237),
(189, 'KN', 'San Cristóbal y Nevis', 'Sancristobaleño', 238),
(190, 'SM', 'San Marino', 'San marino', 239),
(191, 'PM', 'San Pedro y Miquelón', 'Sanpedrino', 240),
(192, 'VC', 'San Vicente y las Granadinas', 'Sanvicentino', 241),
(193, 'SH', 'Santa Helena', 'Santa Helena', 242),
(194, 'LC', 'Santa Lucía', 'Santa Lucía', 243),
(195, 'ST', 'Santo Tomé y Príncipe', 'Santo Tomé y Príncipe', 244),
(196, 'SN', 'Senegal', 'Senegalés', 245),
(197, 'CS', 'Serbia y Montenegro', 'Serbia y Montenegro', 246),
(198, 'SC', 'Seychelles', 'Seychellense', 247),
(199, 'SL', 'Sierra Leona', 'Sierraleonés', 248),
(200, 'SG', 'Singapur', 'Singapurense', 249),
(201, 'SY', 'Siria', 'Sirio', 250),
(202, 'SO', 'Somalia', 'Somalí', 251),
(203, 'LK', 'Sri Lanka', 'Srilanqués', 252),
(204, 'SZ', 'Suazilandia', 'Suazilandesa', 253),
(205, 'ZA', 'Sudáfrica', 'Sudafricana', 254),
(206, 'SD', 'Sudán', 'Sudanesa', 255),
(207, 'SE', 'Suecia', 'Sueca', 256),
(208, 'CH', 'Suiza', 'Suiza', 257),
(209, 'SR', 'Surinam', 'Surinamés', 258),
(210, 'SJ', 'Svalbard y Jan Mayen', 'Svalbard y Jan Mayen', 259),
(211, 'TH', 'Tailandia', 'Tailandesa', 260),
(212, 'TW', 'Taiwán', 'Taiwanés', 261),
(213, 'TZ', 'Tanzania', 'Tanzano', 262),
(214, 'TJ', 'Tayikistán', 'Tayiko', 263),
(215, 'IO', 'Territorio Británico del Océano Índico', 'Territorio Británico del Océano Índico', 264),
(216, 'TF', 'Territorios Australes Franceses', 'Territorios Australes Franceses', 265),
(217, 'TL', 'Timor Oriental', 'Timorense', 266),
(218, 'TG', 'Togo', 'Togolés', 267),
(219, 'TK', 'Tokelau', 'Tokelauano', 268),
(220, 'TO', 'Tonga', 'Tongano', 269),
(221, 'TT', 'Trinidad y Tobago', 'Trinidad y Tobago', 270),
(222, 'TN', 'Túnez', 'Tunecina', 271),
(223, 'TC', 'Islas Turcas y Caicos', 'Islas Turcas y Caicos', 272),
(224, 'TM', 'Turkmenistán', 'Turkmeno', 273),
(225, 'TR', 'Turquía', 'Turca', 274),
(226, 'TV', 'Tuvalu', 'Tuvaluano', 275),
(227, 'UA', 'Ucrania', 'Ucraniano', 276),
(228, 'UG', 'Uganda', 'Ugandesa', 277),
(229, 'UY', 'Uruguay', 'Uruguaya', 278),
(230, 'UZ', 'Uzbekistán', 'Uzbeko', 279),
(231, 'VU', 'Vanuatu', 'Vanuatuense', 280),
(232, 'VE', 'Venezuela', 'Venezolana', 281),
(233, 'VN', 'Vietnam', 'Vietnamita', 282),
(234, 'VG', 'Islas Vírgenes Británicas', 'Islas Vírgenes Británicas', 283),
(235, 'VI', 'Islas Vírgenes de los Estados Unidos', 'Islas Vírgenes de los Estados Unidos', 284),
(236, 'WF', 'Wallis y Futuna', 'Walisiano', 285),
(237, 'YE', 'Yemen', 'Yemen', 286),
(238, 'DJ', 'Yibuti', 'Yibutiano', 287),
(239, 'ZM', 'Zambia', 'Zambiano', 288),
(240, 'ZW', 'Zimbabue', 'Zimbabuense', 289);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

CREATE TABLE IF NOT EXISTS `parametro` (
  `cod_parametro` int(8) NOT NULL AUTO_INCREMENT,
  `igv` decimal(8,2) NOT NULL,
  `precio_dolar` decimal(8,2) NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruc` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `plan_basico` int(11) NOT NULL,
  `plan_intermedio` int(11) NOT NULL,
  `plan_avanzando` int(11) NOT NULL,
  `autor_1` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `autor_2` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `autor_3` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero_contacto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cod_parametro`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`cod_parametro`, `igv`, `precio_dolar`, `razon_social`, `ruc`, `direccion`, `plan_basico`, `plan_intermedio`, `plan_avanzando`, `autor_1`, `autor_2`, `autor_3`, `numero_contacto`, `logo`) VALUES
(1, '18.00', '3.30', 'SYSDENTAL', '20406012102', 'SAN BARTOLOME 3RA ETAPA - HUACHO', 2, 4, 10, 'DIAZ SAONA CHRISTIAM ALEXIS - ANALISTA SISTEMAS', 'EDWIN - PROGRAMADOR', '', '992398412', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `codi_rol` int(11) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `insert` int(11) DEFAULT NULL,
  `update` int(11) DEFAULT NULL,
  `delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`),
  KEY `fk_permisos_menus` (`id_menu`),
  KEY `fk_permisos_rol` (`codi_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `id_menu`, `codi_rol`, `read`, `insert`, `update`, `delete`) VALUES
(1, 1, 3, 1, 0, 0, 0),
(2, 2, 3, 1, 0, 0, 0),
(3, 3, 3, 1, 0, 0, 0),
(4, 4, 3, 1, 1, 1, 1),
(5, 5, 3, 1, 1, 1, 1),
(6, 6, 3, 1, 1, 1, 1),
(7, 7, 3, 1, 0, 0, 0),
(8, 8, 3, 1, 0, 0, 0),
(9, 9, 3, 1, 0, 0, 0),
(10, 10, 3, 0, 0, 0, 0),
(11, 11, 3, 1, 0, 0, 0),
(12, 12, 3, 0, 0, 0, 0),
(13, 13, 3, 0, 0, 0, 0),
(14, 14, 3, 1, 0, 0, 0),
(15, 15, 3, 0, 0, 0, 0),
(16, 16, 3, 1, 0, 0, 0),
(17, 17, 3, 1, 0, 0, 0),
(18, 18, 3, 1, 0, 0, 0),
(19, 19, 3, 1, 0, 0, 0),
(20, 20, 3, 1, 0, 0, 0),
(21, 21, 1, 0, 0, 0, 0),
(22, 21, 3, 0, 0, 0, 0),
(23, 22, 3, 0, 0, 0, 0),
(24, 23, 3, 0, 0, 0, 0),
(25, 24, 3, 0, 0, 0, 0),
(26, 25, 3, 0, 0, 0, 0),
(27, 26, 3, 0, 0, 0, 0),
(28, 27, 3, 0, 0, 0, 0),
(29, 12, 2, 1, 0, 0, 0),
(30, 1, 2, 1, 0, 0, 0),
(31, 2, 2, 1, 0, 0, 0),
(32, 11, 2, 1, 0, 0, 0),
(33, 3, 2, 1, 0, 0, 0),
(34, 4, 2, 1, 0, 0, 0),
(35, 5, 2, 1, 0, 0, 0),
(36, 6, 2, 1, 0, 0, 0),
(37, 9, 2, 1, 0, 0, 0),
(38, 10, 2, 1, 0, 0, 0),
(39, 7, 2, 1, 0, 0, 0),
(40, 8, 2, 1, 0, 0, 0),
(41, 13, 2, 1, 0, 0, 0),
(42, 14, 2, 1, 0, 0, 0),
(43, 15, 2, 1, 0, 0, 0),
(44, 16, 2, 1, 0, 0, 0),
(45, 17, 2, 1, 0, 0, 0),
(46, 18, 2, 1, 0, 0, 0),
(47, 19, 2, 1, 0, 0, 0),
(48, 20, 2, 1, 0, 0, 0),
(49, 21, 2, 1, 0, 0, 0),
(50, 22, 2, 1, 0, 0, 0),
(51, 23, 2, 1, 0, 0, 0),
(52, 24, 2, 1, 0, 0, 0),
(53, 25, 2, 1, 0, 0, 0),
(54, 26, 2, 1, 0, 0, 0),
(55, 27, 2, 1, 0, 0, 0),
(56, 9, 1, 1, 0, 0, 0),
(57, 1, 1, 1, 0, 0, 0),
(58, 5, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE IF NOT EXISTS `planes` (
  `cod_plan` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_plan` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_fincontrat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `max_plan` int(11) NOT NULL,
  `usu_max` int(11) NOT NULL,
  `costo_plan` decimal(10,2) NOT NULL,
  `est_plan` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Activo, 2 = Desactivo',
  PRIMARY KEY (`cod_plan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`cod_plan`, `nomb_plan`, `fecha_inicio`, `fecha_fincontrat`, `max_plan`, `usu_max`, `costo_plan`, `est_plan`) VALUES
(1, 'Free - Gratis', '2019-07-01 11:21:22', '2020-01-01 04:59:59', 30, 1, '0.00', 1),
(2, 'Basico', '2019-07-11 02:07:46', '2019-07-11 02:07:46', 30, 3, '70.00', 1),
(3, 'Deluxe', '2019-07-11 02:11:08', '2019-07-11 02:11:08', 30, 5, '90.00', 1),
(4, 'Platinium', '2019-07-11 02:12:23', '2019-07-11 02:12:23', 30, 7, '110.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procedimiento`
--

CREATE TABLE IF NOT EXISTS `procedimiento` (
  `id_procedimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipoconcepto` int(11) NOT NULL,
  `id_medida` int(11) NOT NULL,
  `codi_cat` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `prec_procedimiento` decimal(8,2) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id_procedimiento`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `fk_procedimiento_tipo_concepto` (`id_tipoconcepto`),
  KEY `fk_procedimiento_unidad_medida` (`id_medida`),
  KEY `fk_procedimiento_categoria` (`codi_cat`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `procedimiento`
--

INSERT INTO `procedimiento` (`id_procedimiento`, `id_tipoconcepto`, `id_medida`, `codi_cat`, `nombre`, `prec_procedimiento`, `fecha_registro`, `estado`) VALUES
(1, 1, 1, 1, 'TRATAMIENTO BOCAL', '300.00', '2019-01-03 16:00:00', 'S'),
(2, 2, 2, 2, 'BRAKERTS', '1000.00', '2019-01-03 18:06:00', 'S'),
(3, 2, 2, 2, 'MOLAR', '142.00', '2019-01-03 18:06:00', 'S'),
(4, 2, 2, 2, 'BLANQUEAMIENTO', '163.00', '2019-01-03 18:06:00', 'S'),
(5, 2, 2, 2, 'PROTECTOR', '856.00', '2019-01-03 18:06:00', 'S'),
(6, 2, 2, 2, 'PROCE 01', '248.00', '2019-01-03 18:06:00', 'S'),
(7, 2, 2, 2, 'PROCEDIMIETO 02', '75.00', '2019-01-03 18:06:00', 'S'),
(8, 2, 2, 2, 'PROCEDIMIENTO 03', '365.00', '2019-01-03 18:06:00', 'S'),
(9, 2, 2, 2, 'PROCEDIMIENTO 04', '286.00', '2019-01-03 18:06:00', 'S'),
(10, 2, 2, 2, 'PROCEDIMIENTO 05', '36.00', '2019-01-03 18:06:00', 'S'),
(11, 2, 2, 2, 'PROCEDIMIENTO 06', '46.00', '2019-01-03 18:06:00', 'S'),
(12, 2, 2, 2, 'PROCEDIMIENTO 07', '175.00', '2019-01-03 18:06:00', 'S'),
(13, 2, 2, 2, 'PROCEDIMIENTO 08', '263.00', '2019-01-03 18:06:00', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `provincia_id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia_nombre` varchar(250) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`provincia_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=197 ;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`provincia_id`, `provincia_nombre`, `departamento_id`, `estado`) VALUES
(1, 'Chachapoyas', 1, 1),
(2, 'Bagua', 1, 1),
(3, 'Bongara', 1, 1),
(4, 'Condorcanqui', 1, 1),
(5, 'Luya', 1, 1),
(6, 'Rodriguez de Mendoza', 1, 1),
(7, 'Utcubamba', 1, 1),
(8, 'Huaraz', 2, 1),
(9, 'Aija', 2, 1),
(10, 'Antonio Raymondi', 2, 1),
(11, 'Asuncion', 2, 1),
(12, 'Bolognesi', 2, 1),
(13, 'Carhuaz', 2, 1),
(14, 'Carlos Ferman Fitzcarrald', 2, 1),
(15, 'Casma', 2, 1),
(16, 'Corongo', 2, 1),
(17, 'Huari', 2, 1),
(18, 'Huarmey', 2, 1),
(19, 'Huaylas', 2, 1),
(20, 'Mariscal Luzuriaga', 2, 1),
(21, 'Ocros', 2, 1),
(22, 'Pallasca', 2, 1),
(23, 'Pomabamba', 2, 1),
(24, 'Recuay', 2, 1),
(25, 'Santa', 2, 1),
(26, 'Sihuas', 2, 1),
(27, 'Yungay', 2, 1),
(28, 'Abancay', 3, 1),
(29, 'Andahuaylas', 3, 1),
(30, 'Antabamba', 3, 1),
(31, 'Aymaraes', 3, 1),
(32, 'Cotabambas', 3, 1),
(33, 'Chincheros', 3, 1),
(34, 'Grau', 3, 1),
(35, 'Arequipa', 4, 1),
(36, 'Camana', 4, 1),
(37, 'Caravela', 4, 1),
(38, 'Castilla', 4, 1),
(39, 'Caylloma', 4, 1),
(40, 'Condesuyos', 4, 1),
(41, 'Islay', 4, 1),
(42, 'La Union', 4, 1),
(43, 'Huamanga', 5, 1),
(44, 'Cangallo', 5, 1),
(45, 'Huanca Sancos', 5, 1),
(46, 'Huanta', 5, 1),
(47, 'La Mar', 5, 1),
(48, 'Lucanas', 5, 1),
(49, 'Parinacochas', 5, 1),
(50, 'Paucar del Sara Sara', 5, 1),
(51, 'Sucre', 5, 1),
(52, 'Victor Fajardo', 5, 1),
(53, 'Vilcas Huaman', 5, 1),
(54, 'Cajamarca', 6, 1),
(55, 'Cajabamba', 6, 1),
(56, 'CelendÃ­n', 6, 1),
(57, 'Chota', 6, 1),
(58, 'Contumaza', 6, 1),
(59, 'Cutervo', 6, 1),
(60, 'Hualgayoc', 6, 1),
(61, 'Jaen', 6, 1),
(62, 'San Ignacio', 6, 1),
(63, 'San Marcos', 6, 1),
(64, 'San Miguel', 6, 1),
(65, 'San Pablo', 6, 1),
(66, 'Santa Cruz', 6, 1),
(67, 'Prov. Const. del Callao', 7, 1),
(68, 'Cusco', 8, 1),
(69, 'Acomayo', 8, 1),
(70, 'Anta', 8, 1),
(71, 'Calca', 8, 1),
(72, 'Canas', 8, 1),
(73, 'Canchis', 8, 1),
(74, 'Chumbivilcas', 8, 1),
(75, 'Espinar', 8, 1),
(76, 'La Convencion', 8, 1),
(77, 'Paruro', 8, 1),
(78, 'Paucartambo', 8, 1),
(79, 'Quispicanchi', 8, 1),
(80, 'Urubamba', 8, 1),
(81, 'Huancavelica', 9, 1),
(82, 'Acobamba', 9, 1),
(83, 'Angaraes', 9, 1),
(84, 'Castrovirreyna', 9, 1),
(85, 'Churcampa', 9, 1),
(86, 'Huaytara', 9, 1),
(87, 'Tayacaja', 9, 1),
(88, 'Huanuco', 10, 1),
(89, 'Ambo', 10, 1),
(90, 'Dos de Mayo', 10, 1),
(91, 'Huacaybamba', 10, 1),
(92, 'HuamalÃ­es', 10, 1),
(93, 'Leoncio Prado', 10, 1),
(94, 'Marañon', 10, 1),
(95, 'Pachitea', 10, 1),
(96, 'Puerto Inca', 10, 1),
(97, 'Lauricocha', 10, 1),
(98, 'Yarowilca', 10, 1),
(99, 'Ica', 11, 1),
(100, 'Chincha', 11, 1),
(101, 'Nasca', 11, 1),
(102, 'Palpa', 11, 1),
(103, 'Pisco', 11, 1),
(104, 'Huancayo', 12, 1),
(105, 'Concepcion', 12, 1),
(106, 'Chanchamayo', 12, 1),
(107, 'Jauja', 12, 1),
(108, 'Junin', 12, 1),
(109, 'Satipo', 12, 1),
(110, 'Tarma', 12, 1),
(111, 'Yauli', 12, 1),
(112, 'Chupaca', 12, 1),
(113, 'Trujillo', 13, 1),
(114, 'Ascope', 13, 1),
(115, 'Bolivar', 13, 1),
(116, 'Chepan', 13, 1),
(117, 'JulcÃ¡n', 13, 1),
(118, 'Otuzco', 13, 1),
(119, 'Pacasmayo', 13, 1),
(120, 'Pataz', 13, 1),
(121, 'Sanchez Carrion', 13, 1),
(122, 'Santiago de Chuco', 13, 1),
(123, 'Gran Chimu', 13, 1),
(124, 'Viru', 13, 1),
(125, 'Chiclayo', 14, 1),
(126, 'FerreÃ±afe', 14, 1),
(127, 'Lambayeque', 14, 1),
(128, 'Lima', 15, 1),
(129, 'Barranca', 15, 1),
(130, 'Cajatambo', 15, 1),
(131, 'Canta', 15, 1),
(132, 'Cañete', 15, 1),
(133, 'Huaral', 15, 1),
(134, 'Huarochiri', 15, 1),
(135, 'Huaura', 15, 1),
(136, 'Oyon', 15, 1),
(137, 'Yauyos', 15, 1),
(138, 'Maynas', 16, 1),
(139, 'Alto Amazonas', 16, 1),
(140, 'Loreto', 16, 1),
(141, 'Mariscal Ramon Castilla', 16, 1),
(142, 'Requena', 16, 1),
(143, 'Ucayali', 16, 1),
(144, 'Datem del Marañon', 16, 1),
(145, 'Putumayo', 16, 1),
(146, 'Tambopata ', 17, 1),
(147, 'Manu', 17, 1),
(148, 'Tahuamanu', 17, 1),
(149, 'Mariscal Nieto', 18, 1),
(150, 'General Sanchez Cerro', 18, 1),
(151, 'Ilo', 18, 1),
(152, 'Pasco', 19, 1),
(153, 'Daniel Alcides Carrion', 19, 1),
(154, 'Oxapampa', 19, 1),
(155, 'Piura', 20, 1),
(156, 'Ayabaca', 20, 1),
(157, 'Huancabamba', 20, 1),
(158, 'Morropan', 20, 1),
(159, 'Paita', 20, 1),
(160, 'Sullana', 20, 1),
(161, 'Talara', 20, 1),
(162, 'Sechura', 20, 1),
(163, 'Puno', 21, 1),
(164, 'Azangaro', 21, 1),
(165, 'Carabaya', 21, 1),
(166, 'Chucuito', 21, 1),
(167, 'El Collao', 21, 1),
(168, 'Huancano', 21, 1),
(169, 'Lampa', 21, 1),
(170, 'Melgar', 21, 1),
(171, 'Moho', 21, 1),
(172, 'San Antonio de Putina', 21, 1),
(173, 'San Roman', 21, 1),
(174, 'Sandia', 21, 1),
(175, 'Yunguyo', 21, 1),
(176, 'Moyobamba', 21, 1),
(177, 'Bellavista', 22, 1),
(178, 'El Dorado', 22, 1),
(179, 'Huallaga', 22, 1),
(180, 'Lamas', 22, 1),
(181, 'Mariscal Caceres ', 22, 1),
(182, 'Picota', 22, 1),
(183, 'Rioja', 22, 1),
(184, 'San Martin', 22, 1),
(185, 'Tocache', 22, 1),
(186, 'Tacna', 23, 1),
(187, 'Candarave', 23, 1),
(188, 'Jorge Basadre', 23, 1),
(189, 'Tarata', 23, 1),
(190, 'Tumbes', 24, 1),
(191, 'Contralmirante Villar', 24, 1),
(192, 'Zarumilla', 24, 1),
(193, 'Coronel Portillo', 25, 1),
(194, 'Atalaya', 25, 1),
(195, 'Padre Abad', 25, 1),
(196, 'PurÃºs', 25, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `codi_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_rol` varchar(30) DEFAULT NULL,
  `esta_rol` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`codi_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`codi_rol`, `nomb_rol`, `esta_rol`) VALUES
(1, 'Odontologo', 1),
(2, 'Administrador', 1),
(3, 'Secretaria', 1),
(4, 'Asistente', 1),
(5, 'No especifica', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE IF NOT EXISTS `sede` (
  `cod_sede` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sede` varchar(45) NOT NULL,
  `estado_sede` varchar(1) DEFAULT 'S',
  PRIMARY KEY (`cod_sede`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`cod_sede`, `nombre_sede`, `estado_sede`) VALUES
(1, 'Huacho', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_citado`
--

CREATE TABLE IF NOT EXISTS `tipo_citado` (
  `cod_citado` int(11) NOT NULL AUTO_INCREMENT,
  `nomb_citado` varchar(80) DEFAULT NULL,
  `esta_citado` varchar(1) DEFAULT 'S',
  PRIMARY KEY (`cod_citado`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `tipo_citado`
--

INSERT INTO `tipo_citado` (`cod_citado`, `nomb_citado`, `esta_citado`) VALUES
(1, 'Atendido', 'S'),
(2, 'Anulado', 'S'),
(3, 'Pendiente', 'S'),
(4, 'Atendiendose', 'S'),
(5, 'Citado', 'S'),
(6, 'Confirmado por Telefono', 'S'),
(7, 'En sala de espera', 'S'),
(8, 'No asiste', 'S'),
(9, 'No confirmado', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_concepto`
--

CREATE TABLE IF NOT EXISTS `tipo_concepto` (
  `id_tipoconcepto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_concepto` varchar(100) NOT NULL,
  `estado_tipo` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id_tipoconcepto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipo_concepto`
--

INSERT INTO `tipo_concepto` (`id_tipoconcepto`, `nombre_concepto`, `estado_tipo`) VALUES
(1, 'Tratamiento', 'S'),
(2, 'Radiobucal', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `cod_tipodocumento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `abreviatura` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `inicio` int(11) DEFAULT NULL,
  `fin` int(11) DEFAULT NULL,
  `correlativo_actual` int(11) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo',
  PRIMARY KEY (`cod_tipodocumento`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`cod_tipodocumento`, `descripcion`, `abreviatura`, `serie`, `inicio`, `fin`, `correlativo_actual`, `estado`) VALUES
(1, 'FACTURA', 'FA', '004', 1, 9999999, 16, 1),
(2, 'RECIBO', 'RE', '001', 1, 9999999, 6, 1),
(3, 'BOLETA', 'BO', '002', 1, 9999999, 32, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_inventario`
--

CREATE TABLE IF NOT EXISTS `tipo_inventario` (
  `cod_tipo_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cod_tipo_inventario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_moneda`
--

CREATE TABLE IF NOT EXISTS `tipo_moneda` (
  `cod_tipomoneda` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo',
  PRIMARY KEY (`cod_tipomoneda`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipo_moneda`
--

INSERT INTO `tipo_moneda` (`cod_tipomoneda`, `descripcion`, `estado`) VALUES
(1, 'SOLES', 1),
(2, 'DOLARES', 1),
(3, 'EUROS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE IF NOT EXISTS `tipo_pago` (
  `cod_tipopago` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo',
  PRIMARY KEY (`cod_tipopago`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`cod_tipopago`, `descripcion`, `estado`) VALUES
(2, 'CREDITO', 1),
(3, 'TARJETA', 1),
(4, 'EFECTIVO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_tarjeta`
--

CREATE TABLE IF NOT EXISTS `tipo_tarjeta` (
  `cod_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo',
  PRIMARY KEY (`cod_tarjeta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tipo_tarjeta`
--

INSERT INTO `tipo_tarjeta` (`cod_tarjeta`, `descripcion`, `estado`) VALUES
(1, 'VISA', 1),
(2, 'MASTERCAD', 1),
(3, 'EXPRESS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

CREATE TABLE IF NOT EXISTS `tmp` (
  `id_tmp` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_tmp` int(11) NOT NULL,
  `codi_pro_tmp` int(11) NOT NULL,
  `precio_tmp` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tmp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE IF NOT EXISTS `tratamiento` (
  `codi_tra` int(8) NOT NULL AUTO_INCREMENT,
  `codi_pac` int(8) DEFAULT NULL,
  `fecha_tra` date DEFAULT NULL,
  `codi_med` int(8) DEFAULT NULL,
  `asunto_tra` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observacion_tra` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `total_tra` decimal(8,2) DEFAULT NULL,
  `estadopago_tra` int(1) DEFAULT '1' COMMENT '1 = Por Cobrar, 2 = En Proceso, 3 = Cobrado',
  `condpago_tra` int(1) DEFAULT NULL COMMENT '1 = Cuotas, 2 = Contado',
  `estado_tra` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Activo 2 = Anulado',
  `estad_tra` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Activo 2 = Anulado',
  PRIMARY KEY (`codi_tra`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`codi_tra`, `codi_pac`, `fecha_tra`, `codi_med`, `asunto_tra`, `observacion_tra`, `total_tra`, `estadopago_tra`, `condpago_tra`, `estado_tra`, `estad_tra`) VALUES
(13, 1, '2019-03-23', 1, 'asunto', 'observacion', '3600.00', 2, 1, 1, 1),
(14, 1, '2019-03-23', 1, 'asuntoo', 'observac', '2160.00', 2, 1, 1, 1),
(15, 1, '2019-03-24', 1, 'asuto', 'asda', '2990.00', 2, 1, 1, 1),
(16, 2, '2019-03-27', 1, 'asunto', 'obvser', '3149.00', 3, 1, 1, 1),
(17, 2, '2019-03-28', 1, 'asuntop', 'observacion', '3602.00', 2, 1, 1, 1),
(18, 1, '2019-04-04', 1, 'asuntoo', 'obsrvacion', '2537.00', 2, 1, 1, 1),
(19, 1, '2019-04-05', 1, 'asunto', 'obsrvacion', '2066.00', 1, NULL, 1, 1),
(20, 1, '2019-04-06', 1, 'asutoo', 'observacion', '338.00', 4, 1, 2, 1),
(21, 1, '2019-04-06', 4, 'asuntoo', 'obvsr', '1576.00', 2, 1, 1, 1),
(22, 6, '2019-04-26', 1, 'asunto', 'obsevas', '1321.00', 4, NULL, 2, 1),
(23, 1, '2019-04-28', 1, 'BRAKERS DENTAL', '', '1142.00', 2, 1, 1, 1),
(24, 6, '2019-05-20', 4, 'asdad', 'asdad', '1142.00', 1, NULL, 1, 1),
(25, 1, '2019-06-30', 1, 'TRATAMIENTO BOCAL', 'NINGUNA', '856.00', 1, NULL, 1, 1),
(26, 7, '2019-07-18', 1, 'restauracion', '', '142.00', 3, 2, 1, 1),
(27, 9, '2019-07-27', 16, 'BOCAL', '', '1142.00', 3, 1, 1, 1),
(28, 10, '2020-01-16', 1, 'der', '', '1000.00', 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento_detalle`
--

CREATE TABLE IF NOT EXISTS `tratamiento_detalle` (
  `codi_tra` int(8) DEFAULT '0',
  `id_procedimiento` int(6) DEFAULT NULL,
  `preciounit_tradet` decimal(8,2) NOT NULL DEFAULT '0.00',
  `cant_tradet` int(4) DEFAULT '0',
  `subtotal_tradet` decimal(8,2) DEFAULT '0.00',
  `descuento_tradet` int(3) DEFAULT '0',
  UNIQUE KEY `codi_tra_2` (`codi_tra`,`id_procedimiento`),
  KEY `codi_tra` (`codi_tra`),
  KEY `id_procedimiento` (`id_procedimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tratamiento_detalle`
--

INSERT INTO `tratamiento_detalle` (`codi_tra`, `id_procedimiento`, `preciounit_tradet`, `cant_tradet`, `subtotal_tradet`, `descuento_tradet`) VALUES
(13, 1, '300.00', 2, '600.00', 0),
(13, 2, '1000.00', 3, '3000.00', 0),
(14, 1, '300.00', 4, '960.00', 20),
(14, 2, '1000.00', 2, '1200.00', 40),
(15, 1, '300.00', 6, '1350.00', 25),
(15, 2, '1000.00', 2, '1640.00', 18),
(16, 7, '75.00', 4, '255.00', 15),
(16, 13, '263.00', 3, '583.86', 26),
(16, 5, '856.00', 3, '2311.20', 10),
(17, 5, '856.00', 2, '1712.00', 0),
(17, 12, '175.00', 4, '630.00', 10),
(17, 11, '46.00', 2, '92.00', 0),
(17, 8, '365.00', 4, '1168.00', 20),
(18, 5, '856.00', 2, '1712.00', 0),
(18, 12, '175.00', 3, '525.00', 0),
(18, 7, '75.00', 4, '300.00', 0),
(19, 5, '856.00', 1, '856.00', 0),
(19, 7, '75.00', 1, '75.00', 0),
(19, 13, '263.00', 1, '263.00', 0),
(19, 12, '175.00', 1, '175.00', 0),
(19, 11, '46.00', 1, '46.00', 0),
(19, 9, '286.00', 1, '286.00', 0),
(19, 8, '365.00', 1, '365.00', 0),
(20, 7, '75.00', 1, '75.00', 0),
(20, 13, '263.00', 1, '263.00', 0),
(21, 13, '263.00', 1, '263.00', 0),
(21, 7, '75.00', 1, '75.00', 0),
(21, 5, '856.00', 1, '856.00', 0),
(21, 1, '300.00', 1, '300.00', 0),
(21, 11, '46.00', 1, '46.00', 0),
(21, 10, '36.00', 1, '36.00', 0),
(22, 3, '142.00', 1, '142.00', 0),
(22, 5, '856.00', 1, '856.00', 0),
(22, 6, '248.00', 1, '248.00', 0),
(22, 7, '75.00', 1, '75.00', 0),
(23, 3, '142.00', 1, '142.00', 0),
(23, 2, '1000.00', 1, '1000.00', 0),
(24, 2, '1000.00', 1, '1000.00', 0),
(24, 3, '142.00', 1, '142.00', 0),
(25, 5, '856.00', 1, '856.00', 0),
(26, 3, '142.00', 1, '142.00', 0),
(27, 3, '142.00', 1, '142.00', 0),
(27, 2, '1000.00', 1, '1000.00', 0),
(28, 2, '1000.00', 1, '1000.00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `id_medida` int(11) NOT NULL AUTO_INCREMENT,
  `nom_medida` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id_medida`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id_medida`, `nom_medida`, `estado`) VALUES
(1, 'GENERAL', 'S'),
(2, 'PIEZA', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `codi_usu` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(80) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `telefono` varchar(80) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tipo_documento` varchar(1) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `foto` varchar(260) DEFAULT NULL,
  `codi_rol` int(11) NOT NULL,
  `logi_usu` varchar(20) DEFAULT NULL,
  `pass_usu` text NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `esta_usu` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`codi_usu`),
  KEY `fk_usuario_rol` (`codi_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codi_usu`, `apellido`, `nombre`, `telefono`, `direccion`, `email`, `tipo_documento`, `documento`, `foto`, `codi_rol`, `logi_usu`, `pass_usu`, `fecha_registro`, `esta_usu`) VALUES
(1, 'Diaz Saona', 'Christiam Alexis', '992398412', 'San bartolome', 'cdiaz_1987@outlook.com', '1', '44660415', NULL, 2, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2018-09-16 00:00:00', 1),
(2, 'SAONA SANTILLANA', 'PATRICIA', '2327308', 'SAN BARTOLOME 3RA ETAPA', 'patricia@gmail.com', '1', '20230608', '', 3, 'PATRICIA', '8e0aa43884c7066c6ae02e73d3296996273226a2', '2019-07-14 13:38:50', 1),
(3, 'DIAZ CORZO', 'ANTONIO', '12345678', 'SAN JACINTO', 'patricia@gmail.com', '1', '12345678', NULL, 1, 'ANTONIO', 'b8f718d80271420d4cd82de7a1b7262e1bc597ff', '2019-07-14 15:24:32', 1),
(4, 'LOAYZA', 'DIEGOS', '949105955', 'Av. San Martin ', 'diego@gmail.com', '1', '20602109', NULL, 1, 'DIEGO', '8e0aa43884c7066c6ae02e73d3296996273226a2', '2019-07-14 15:35:06', 1),
(5, 'Diaz Saona', 'Silvana', NULL, '', 'silvana@gmail.com', '1', '23431234', NULL, 1, 'SILVANA', '7e0b3cf1183f7c06a7758d9c69870f695a25095e', '2019-07-23 15:39:04', 1),
(6, 'moncada', 'jazmin', '2327308', 'av. las fabelas', 'jazmin@gmail.com', '1', '43123412', NULL, 1, 'JAZMIN', 'c486b5e65ecc6a760ef46e031b616104066c70f7', '2019-07-23 15:55:57', 1),
(7, 'GALLO', 'PEDRO', '922398412', 'SAN JACINTO', 'sanjacinto@gmail.com', '1', '32111112', NULL, 2, 'PEDRO', '8e0aa43884c7066c6ae02e73d3296996273226a2', '2019-07-24 19:15:30', 1),
(8, 'DIAZ SAONA', 'HANS', '992398412', 'SAN JACINTO', 'aron@gmail.com', '1', '54321134', NULL, 3, 'HANS', '50a43903e3fb859e9041d175a1ef15ff5da27353', '2019-07-26 11:39:45', 1),
(9, 'NORIEGA', 'OSWALDO', '992398412', 'SAN JACINTO', 'admin@gmail.com', '1', '32143212', NULL, 1, 'NOLE', 'cc7b26cd34d06bf303fbdde59ef9d573ad9981e4', '2019-07-26 12:11:34', 1),
(10, 'ESPINOZA', 'AVILIO', '3221', 'SAN KILOMBO', 'avilio@gmail.com', '1', '54321111', NULL, 2, 'AVILIO', 'ddde20276faf36c68625459bb194a73696119a34', '2019-07-26 14:40:06', 1),
(11, 'CODIBOL', 'CODY', NULL, '', 'cody@gmail.com', '1', '76123545', NULL, 1, 'CODY', '42f123dc59749334df39613ee5bb3bf04522cfd7', '2019-07-27 19:40:07', 1),
(12, 'CODIBOLL', 'SANTA FE', NULL, '', 'alex@gmail.com', '1', '43133443', NULL, 1, 'HAKIM', '26959d48068f79f1fd88baaf85c4174f0cd285bb', '2019-07-27 19:46:34', 1),
(13, 'TRE', 'ERT', NULL, '', 'QWE@GMAIL.COM', '1', '54321', NULL, 1, 'THIAGO', 'a12e78240e62a4c17dec1d140e610034ff503c89', '2019-07-27 19:55:29', 1),
(14, 'DIAZ CORSO', 'PEDRO PAULO', NULL, '', 'SANTIAGO@GMAIL.COM', '1', '123456', NULL, 1, 'SANTIAGO', 'ac7764f3ea51f1fffe70b863aec59dd16928cbfd', '2019-07-27 19:56:38', 1),
(15, 'PRUEBA', 'PRUEBA', '111', 'direccion', 'zoila@gmail.com', '', '74512345', NULL, 1, 'ZOILA', '9a9fb675d1d0e1740d22630a83a7c928aa32275e', '2019-07-27 20:00:29', 1),
(16, 'FALCON', 'RAMIREZ', NULL, '', 'miguel@gmail.com', '1', '32145325', NULL, 1, 'MIGUEL', 'b9e29d35e8715961b985a962cae5113f999db22d', '2019-07-27 20:08:38', 1),
(17, 'SAONA', 'ABELARDO', '432', 'SAN JACINTO', 'abelardo@gmail.com', '1', '65124376', NULL, 1, 'ABELARDO', 'f0edb352362b803c01665b8ec048044b7537dfe8', '2019-07-27 20:56:29', 1),
(18, 'GUTIERRES SAMANAMUD', 'GIANCARLOS', '111', 'direccion', 'santiago@gmail.com', '', '43215678', NULL, 2, 'GIANCARLOS', '068d1ad086c425fe7d50b12ea3c81a3c54cd2000', '2019-07-27 21:10:29', 1),
(19, 'GUTIERREZ VENTOCILLA', 'KEVIN JOSE', '923134134', 'SAN JACINTO 231', 'kevin123@gmail.com', '1', '54312347', NULL, 3, 'ROJAS', '068d1ad086c425fe7d50b12ea3c81a3c54cd2000', '2019-07-27 23:56:59', 1),
(20, 'VELASQUEZ', 'CALIN ALEX', '32111', 'SAN BARTOLOME HUSARES', 'calin@gmail.com', '1', '43212345', NULL, 1, 'CALIN', 'a4af00b8eadcd5166e0ff1cbec70a00e9f7914f7', '2019-07-28 00:09:39', 1),
(21, 'DEMO', 'DEMO', '2322', 'SAN DEMO', 'demo@gmail.com', '1', '32133424', NULL, 1, 'DEMO', '038bc41a7c6c6423fba68ab38e1243e0673eb5b1', '2019-07-28 07:10:09', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `paciente_alergia`
--
ALTER TABLE `paciente_alergia`
  ADD CONSTRAINT `paciente_alergia_ibfk_1` FOREIGN KEY (`codi_pac`) REFERENCES `paciente` (`codi_pac`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_alergia_ibfk_2` FOREIGN KEY (`cod_ale`) REFERENCES `alergia` (`cod_ale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_consulta`
--
ALTER TABLE `paciente_consulta`
  ADD CONSTRAINT `paciente_consulta_ibfk_1` FOREIGN KEY (`codi_pac`) REFERENCES `paciente` (`codi_pac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_diagnostico`
--
ALTER TABLE `paciente_diagnostico`
  ADD CONSTRAINT `paciente_diagnostico_ibfk_1` FOREIGN KEY (`codi_pac`) REFERENCES `paciente` (`codi_pac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_enfermedadactual`
--
ALTER TABLE `paciente_enfermedadactual`
  ADD CONSTRAINT `paciente_enfermedadactual_ibfk_1` FOREIGN KEY (`codi_pac`) REFERENCES `paciente` (`codi_pac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_evolucion`
--
ALTER TABLE `paciente_evolucion`
  ADD CONSTRAINT `paciente_evolucion_ibfk_1` FOREIGN KEY (`codi_pac`) REFERENCES `paciente` (`codi_pac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_exploracion`
--
ALTER TABLE `paciente_exploracion`
  ADD CONSTRAINT `paciente_exploracion_ibfk_1` FOREIGN KEY (`codi_pac`) REFERENCES `paciente` (`codi_pac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_placa`
--
ALTER TABLE `paciente_placa`
  ADD CONSTRAINT `paciente_placa_ibfk_1` FOREIGN KEY (`codi_pac`) REFERENCES `paciente` (`codi_pac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_receta`
--
ALTER TABLE `paciente_receta`
  ADD CONSTRAINT `paciente_receta_ibfk_1` FOREIGN KEY (`codi_pac`) REFERENCES `paciente` (`codi_pac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`codi_tra`) REFERENCES `tratamiento` (`codi_tra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago_comprobante`
--
ALTER TABLE `pago_comprobante`
  ADD CONSTRAINT `pago_comprobante_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pago_comprobante_ibfk_2` FOREIGN KEY (`id_com`) REFERENCES `comprobante` (`id_com`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tratamiento_detalle`
--
ALTER TABLE `tratamiento_detalle`
  ADD CONSTRAINT `tratamiento_detalle_ibfk_1` FOREIGN KEY (`codi_tra`) REFERENCES `tratamiento` (`codi_tra`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
