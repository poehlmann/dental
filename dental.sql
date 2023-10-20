-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2023 a las 05:17:29
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dental`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergia`
--

CREATE TABLE IF NOT EXISTS `alergia` (
  `cod_ale` int(11) NOT NULL,
  `nombre_ale` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `cod_banco` int(11) NOT NULL,
  `descripcion` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`cod_banco`, `descripcion`, `estado`) VALUES
(1, 'BCP', 1),
(2, 'BNB', 1),
(3, 'BISA', 1),
(4, 'BANCO UNION', 1),
(5, 'MERCANTIL', 1),
(6, 'ECONOMICO', 1),
(7, 'GANADERO', 1),
(8, 'FORTALEZA', 1),
(9, 'PRODEM', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `codi_cat` int(11) NOT NULL,
  `nomb_cat` varchar(45) DEFAULT NULL,
  `esta_cat` char(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `codi_cit` int(11) NOT NULL,
  `codi_pac` int(11) DEFAULT NULL,
  `codi_med` int(11) DEFAULT NULL,
  `cod_especialidad` int(11) DEFAULT NULL,
  `cod_sede` int(11) DEFAULT NULL,
  `motivo_consult` varchar(80) DEFAULT NULL,
  `cod_citado` int(11) DEFAULT NULL,
  `fech_cit` datetime NOT NULL,
  `obsv_cit` varchar(200) NOT NULL,
  `esta_cit` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinica`
--

CREATE TABLE IF NOT EXISTS `clinica` (
  `id_clin` int(11) NOT NULL,
  `nomb_clin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direc_clin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telf_clin` int(15) NOT NULL,
  `email_clin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ruc_clin` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_clin` date DEFAULT NULL,
  `photo` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_plan` int(11) NOT NULL,
  `esta_clin` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clinica`
--

INSERT INTO `clinica` (`id_clin`, `nomb_clin`, `direc_clin`, `telf_clin`, `email_clin`, `ruc_clin`, `fecha_clin`, `photo`, `cod_plan`, `esta_clin`) VALUES
(1, 'ODONTO MARTINEZ', 'AV NOEL KEMPF MERCADO CALLE 2 #3015', 70280244, 'rocamarlinmartinez@gmail.com', '', '0000-00-00', 'logogeneral-1697596538.png', 2, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE IF NOT EXISTS `comprobante` (
  `id_com` int(8) NOT NULL,
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
  `estado_com` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Normal, 2 = Anulado'
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `departamento_id` int(11) NOT NULL,
  `departamento_nombre` varchar(250) NOT NULL,
  `estado` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`departamento_id`, `departamento_nombre`, `estado`) VALUES
(1, 'SANTA CRUZ', 1),
(2, 'COCHABAMBA', 1),
(3, 'LA PAZ', 1),
(4, 'ORURO', 1),
(5, 'CHUQUISACA', 1),
(6, 'BENI', 1),
(7, 'PANDO', 1),
(8, 'SUCRE', 1),
(9, 'TARIJA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_fac`
--

CREATE TABLE IF NOT EXISTS `detalle_fac` (
  `precio` decimal(10,2) DEFAULT NULL,
  `codi_dpr` int(11) NOT NULL,
  `codi_fac` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_proc`
--

CREATE TABLE IF NOT EXISTS `detalle_proc` (
  `codi_dpr` int(11) NOT NULL,
  `codi_odo` int(11) NOT NULL,
  `codi_tar` int(11) NOT NULL,
  `aseg_dpr` decimal(3,1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dientes`
--

CREATE TABLE IF NOT EXISTS `dientes` (
  `numero_die` int(4) NOT NULL,
  `tipo_die` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden_die` int(2) DEFAULT NULL
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
  `distrito_id` int(11) NOT NULL,
  `distrito_nombre` varchar(250) NOT NULL,
  `provincia_id` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `distrito`
--

INSERT INTO `distrito` (`distrito_id`, `distrito_nombre`, `provincia_id`, `estado`) VALUES
(1, '1', 1, 1),
(2, '2', 1, 1),
(3, '3', 1, 1),
(4, '4', 1, 1),
(5, '5', 1, 1),
(6, '6', 1, 1),
(7, '7', 1, 1),
(8, '8', 1, 1),
(9, '9', 1, 1),
(10, '10', 1, 1),
(11, '11', 1, 1),
(12, '12', 1, 1),
(13, '13', 1, 1),
(14, '14', 1, 1),
(15, '15', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE IF NOT EXISTS `enfermedad` (
  `codi_enf` varchar(6) NOT NULL,
  `desc_enf` varchar(200) DEFAULT NULL,
  `esta_enf` char(1) NOT NULL DEFAULT 'S'
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
  `cod_especialidad` int(11) NOT NULL,
  `nombre_especialidad` varchar(45) NOT NULL,
  `descripcion_especialidad` varchar(45) DEFAULT NULL,
  `estado_especialidad` varchar(1) DEFAULT 'S'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  `codi_edi` int(11) NOT NULL,
  `titu_edi` varchar(5) NOT NULL,
  `nomb_edi` varchar(45) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
  `id_hal` int(11) NOT NULL,
  `nombre_hal` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `siglas_hal` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `cod_inventario` int(11) NOT NULL,
  `codigo_barra` varchar(50) DEFAULT NULL,
  `nombre_almacen` varchar(80) NOT NULL,
  `nombre_producto` varchar(60) DEFAULT NULL,
  `cod_tipo_inventario` int(11) NOT NULL,
  `precio_entrada` decimal(10,2) DEFAULT NULL,
  `precio_salida` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(100) DEFAULT NULL,
  `stock_inventario` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE IF NOT EXISTS `medico` (
  `codi_med` int(11) NOT NULL,
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
  `codi_usu` int(6) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`codi_med`, `cod_especialidad`, `nomb_med`, `apel_med`, `dni_med`, `ruc_med`, `coleg_med`, `telf_med`, `cel_med`, `dire_med`, `emai_med`, `fena_med`, `sexo_med`, `fecha_registro`, `esta_med`, `codi_usu`) VALUES
(1, 1, 'MARLIN ', 'ROCA MARTINEZ', '42458455', '10424584555', '40508', '70280244', NULL, '', 'rocamarlinmartinez@gmail.com', '1984-06-20', 'F', '2019-02-18 00:00:00', 'S', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id_menu` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
  `codi_pac` int(11) NOT NULL,
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
  `detalleodontograma_pac` text
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_alergia`
--

CREATE TABLE IF NOT EXISTS `paciente_alergia` (
  `pacale_id` int(11) NOT NULL,
  `codi_pac` int(8) DEFAULT NULL,
  `cod_ale` int(8) DEFAULT NULL,
  `pacale_observacion` text COLLATE utf8_spanish_ci,
  `pacale_estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = activo, 2 = anulado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `presiontexto_paccon` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_diagnostico`
--

CREATE TABLE IF NOT EXISTS `paciente_diagnostico` (
  `pacdiag_id` int(8) NOT NULL,
  `codi_pac` int(8) DEFAULT NULL,
  `pacdiag_fecha` date DEFAULT NULL,
  `codi_enf01` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `pacdiag_estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = activo, 2 = anulado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `dosis_enfact` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_evolucion`
--

CREATE TABLE IF NOT EXISTS `paciente_evolucion` (
  `pacevol_id` int(11) NOT NULL,
  `codi_pac` int(8) DEFAULT NULL,
  `cod_especialidad` int(8) DEFAULT NULL,
  `codi_med` int(8) DEFAULT NULL,
  `pacevol_descripcion` text COLLATE utf8_spanish_ci,
  `fecha_evolucion` date NOT NULL,
  `pacevol_estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = activo, 2 = anulado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `odontoesto_exp` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_odontograma`
--

CREATE TABLE IF NOT EXISTS `paciente_odontograma` (
  `pacodo_id` int(11) NOT NULL,
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
  `pacodo_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_placa`
--

CREATE TABLE IF NOT EXISTS `paciente_placa` (
  `pla_id` int(8) NOT NULL,
  `codi_pac` int(8) DEFAULT NULL,
  `pla_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pla_notas` text COLLATE utf8_spanish_ci,
  `pla_archivo` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pla_fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pla_estado` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_receta`
--

CREATE TABLE IF NOT EXISTS `paciente_receta` (
  `pacrec_id` int(8) NOT NULL,
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
  `pacrec_estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = activo, 2 = anulado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE IF NOT EXISTS `pago` (
  `id_pago` int(8) NOT NULL,
  `codi_tra` int(8) DEFAULT NULL,
  `num_pago` int(3) DEFAULT NULL,
  `estado_pago` int(1) DEFAULT NULL COMMENT '1 = Pendiente, 2 = Finalizado',
  `fecharegistro_pago` date DEFAULT NULL,
  `fechavencimiento_pago` date DEFAULT NULL,
  `monto_pago` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_comprobante`
--

CREATE TABLE IF NOT EXISTS `pago_comprobante` (
  `id_pago` int(8) DEFAULT NULL,
  `id_com` int(8) DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT '1' COMMENT '1 = valido, 2 = anulado '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
  `id` int(11) NOT NULL,
  `iso` char(2) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `gentilicio` varchar(100) DEFAULT NULL,
  `orden` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

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
  `cod_parametro` int(8) NOT NULL,
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
  `logo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`cod_parametro`, `igv`, `precio_dolar`, `razon_social`, `ruc`, `direccion`, `plan_basico`, `plan_intermedio`, `plan_avanzando`, `autor_1`, `autor_2`, `autor_3`, `numero_contacto`, `logo`) VALUES
(1, '18.00', '6.96', 'ODONTO MARTINEZ', '', 'AV NOEL KEMPF MERCADO CALLE 2 #3015', 2, 4, 10, 'BRUNO', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `codi_rol` int(11) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `insert` int(11) DEFAULT NULL,
  `update` int(11) DEFAULT NULL,
  `delete` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

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
  `cod_plan` int(11) NOT NULL,
  `nomb_plan` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_fincontrat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `max_plan` int(11) NOT NULL,
  `usu_max` int(11) NOT NULL,
  `costo_plan` decimal(10,2) NOT NULL,
  `est_plan` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Activo, 2 = Desactivo'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `id_procedimiento` int(11) NOT NULL,
  `id_tipoconcepto` int(11) NOT NULL,
  `id_medida` int(11) NOT NULL,
  `codi_cat` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `prec_procedimiento` decimal(8,2) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` char(1) NOT NULL DEFAULT 'S'
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
  `provincia_id` int(11) NOT NULL,
  `provincia_nombre` varchar(250) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`provincia_id`, `provincia_nombre`, `departamento_id`, `estado`) VALUES
(1, 'Santa Cruz de la Sierra', 1, 1),
(2, ' San Matías', 1, 1),
(3, 'San José de Chiquitos', 1, 1),
(4, 'Lagunillas', 1, 1),
(5, 'Samaipata', 1, 1),
(6, 'Puerto Suárez', 1, 1),
(7, 'Ascensión de Guarayos', 1, 1),
(8, 'Buena Vista', 2, 1),
(9, 'Warnes', 2, 1),
(10, 'San Ignacio de Velasco', 2, 1),
(11, 'Comarapa', 2, 1),
(12, 'Concepción', 2, 1),
(13, 'Montero', 2, 1),
(14, 'Portachuelo', 2, 1),
(15, 'Vallegrande', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `codi_rol` int(11) NOT NULL,
  `nomb_rol` varchar(30) DEFAULT NULL,
  `esta_rol` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
  `cod_sede` int(11) NOT NULL,
  `nombre_sede` varchar(45) NOT NULL,
  `estado_sede` varchar(1) DEFAULT 'S'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`cod_sede`, `nombre_sede`, `estado_sede`) VALUES
(1, 'ODONTO MARTINEZ', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_citado`
--

CREATE TABLE IF NOT EXISTS `tipo_citado` (
  `cod_citado` int(11) NOT NULL,
  `nomb_citado` varchar(80) DEFAULT NULL,
  `esta_citado` varchar(1) DEFAULT 'S'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
  `id_tipoconcepto` int(11) NOT NULL,
  `nombre_concepto` varchar(100) NOT NULL,
  `estado_tipo` char(1) NOT NULL DEFAULT 'S'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `cod_tipodocumento` int(11) NOT NULL,
  `descripcion` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `abreviatura` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `serie` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `inicio` int(11) DEFAULT NULL,
  `fin` int(11) DEFAULT NULL,
  `correlativo_actual` int(11) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `cod_tipo_inventario` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_moneda`
--

CREATE TABLE IF NOT EXISTS `tipo_moneda` (
  `cod_tipomoneda` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_moneda`
--

INSERT INTO `tipo_moneda` (`cod_tipomoneda`, `descripcion`, `estado`) VALUES
(2, 'DOLARES', 1),
(3, 'BOLIVIANOS', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE IF NOT EXISTS `tipo_pago` (
  `cod_tipopago` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`cod_tipopago`, `descripcion`, `estado`) VALUES
(2, 'CREDITO', 1),
(3, 'TARJETA', 1),
(4, 'EFECTIVO', 1),
(5, 'QR', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_tarjeta`
--

CREATE TABLE IF NOT EXISTS `tipo_tarjeta` (
  `cod_tarjeta` int(11) NOT NULL,
  `descripcion` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '1 = activo, 2 = inactivo'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `id_tmp` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `codi_pro_tmp` int(11) NOT NULL,
  `precio_tmp` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE IF NOT EXISTS `tratamiento` (
  `codi_tra` int(8) NOT NULL,
  `codi_pac` int(8) DEFAULT NULL,
  `fecha_tra` date DEFAULT NULL,
  `codi_med` int(8) DEFAULT NULL,
  `asunto_tra` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observacion_tra` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `total_tra` decimal(8,2) DEFAULT NULL,
  `estadopago_tra` int(1) DEFAULT '1' COMMENT '1 = Por Cobrar, 2 = En Proceso, 3 = Cobrado',
  `condpago_tra` int(1) DEFAULT NULL COMMENT '1 = Cuotas, 2 = Contado',
  `estado_tra` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Activo 2 = Anulado',
  `estad_tra` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Activo 2 = Anulado'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `descuento_tradet` int(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `id_medida` int(11) NOT NULL,
  `nom_medida` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'S'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `codi_usu` int(11) NOT NULL,
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
  `esta_usu` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codi_usu`, `apellido`, `nombre`, `telefono`, `direccion`, `email`, `tipo_documento`, `documento`, `foto`, `codi_rol`, `logi_usu`, `pass_usu`, `fecha_registro`, `esta_usu`) VALUES
(1, 'Roca Martinez', 'Marlin', '70280244', '', 'rocamartinez@gmail.com', '1', '', NULL, 2, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2018-09-16 00:00:00', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergia`
--
ALTER TABLE `alergia`
  ADD PRIMARY KEY (`cod_ale`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`cod_banco`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codi_cat`), ADD UNIQUE KEY `nomb_cat` (`nomb_cat`);

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`codi_cit`), ADD KEY `fk_cita_medica_paciente` (`codi_pac`), ADD KEY `fk_cita_medica_medico` (`codi_med`), ADD KEY `fk_cita_medica_especialidad` (`cod_especialidad`), ADD KEY `fk_cita_medica_tipo_citado` (`cod_citado`), ADD KEY `fk_cita_medica_sede` (`cod_sede`);

--
-- Indices de la tabla `clinica`
--
ALTER TABLE `clinica`
  ADD PRIMARY KEY (`id_clin`), ADD KEY `FK_clinica_planes` (`cod_plan`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`id_com`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`departamento_id`);

--
-- Indices de la tabla `detalle_fac`
--
ALTER TABLE `detalle_fac`
  ADD PRIMARY KEY (`codi_dpr`,`codi_fac`), ADD KEY `fk_detalle_fac_detalle_proc` (`codi_dpr`), ADD KEY `fk_detalle_fac_factura` (`codi_fac`);

--
-- Indices de la tabla `detalle_proc`
--
ALTER TABLE `detalle_proc`
  ADD PRIMARY KEY (`codi_dpr`), ADD KEY `fk_detalle_proc_odontograma` (`codi_odo`), ADD KEY `fk_detalle_proc_tarifa_proc` (`codi_tar`);

--
-- Indices de la tabla `dientes`
--
ALTER TABLE `dientes`
  ADD PRIMARY KEY (`numero_die`), ADD UNIQUE KEY `numero_die` (`numero_die`), ADD UNIQUE KEY `orden_die` (`orden_die`);

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`distrito_id`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`codi_enf`), ADD KEY `codi_enf_2` (`codi_enf`), ADD FULLTEXT KEY `codi_enf` (`codi_enf`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`cod_especialidad`);

--
-- Indices de la tabla `estado_diente`
--
ALTER TABLE `estado_diente`
  ADD PRIMARY KEY (`codi_edi`);

--
-- Indices de la tabla `hallazgos`
--
ALTER TABLE `hallazgos`
  ADD PRIMARY KEY (`id_hal`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`cod_inventario`), ADD KEY `fk_inventario_tipo_inventario` (`cod_tipo_inventario`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`codi_med`), ADD UNIQUE KEY `dni_med` (`dni_med`), ADD KEY `fk_medico_especialidad` (`cod_especialidad`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`codi_pac`), ADD UNIQUE KEY `nomb_pac` (`nomb_pac`), ADD UNIQUE KEY `dni_pac` (`dni_pac`), ADD KEY `fk_paciente_departamento` (`departamento_id`), ADD KEY `fk_paciente_provincia` (`provincia_id`), ADD KEY `fk_paciente_distrito` (`distrito_id`);

--
-- Indices de la tabla `paciente_alergia`
--
ALTER TABLE `paciente_alergia`
  ADD PRIMARY KEY (`pacale_id`), ADD KEY `codi_pac` (`codi_pac`), ADD KEY `cod_ale` (`cod_ale`);

--
-- Indices de la tabla `paciente_consulta`
--
ALTER TABLE `paciente_consulta`
  ADD PRIMARY KEY (`codi_pac`), ADD UNIQUE KEY `codi_pac` (`codi_pac`);

--
-- Indices de la tabla `paciente_diagnostico`
--
ALTER TABLE `paciente_diagnostico`
  ADD PRIMARY KEY (`pacdiag_id`), ADD KEY `codi_pac` (`codi_pac`);

--
-- Indices de la tabla `paciente_enfermedadactual`
--
ALTER TABLE `paciente_enfermedadactual`
  ADD PRIMARY KEY (`codi_pac`), ADD UNIQUE KEY `codi_pac` (`codi_pac`);

--
-- Indices de la tabla `paciente_evolucion`
--
ALTER TABLE `paciente_evolucion`
  ADD PRIMARY KEY (`pacevol_id`), ADD KEY `codi_pac` (`codi_pac`), ADD KEY `cod_especialidad` (`cod_especialidad`), ADD KEY `codi_med` (`codi_med`);

--
-- Indices de la tabla `paciente_exploracion`
--
ALTER TABLE `paciente_exploracion`
  ADD PRIMARY KEY (`codi_pac`), ADD UNIQUE KEY `codi_pac` (`codi_pac`);

--
-- Indices de la tabla `paciente_odontograma`
--
ALTER TABLE `paciente_odontograma`
  ADD PRIMARY KEY (`pacodo_id`);

--
-- Indices de la tabla `paciente_placa`
--
ALTER TABLE `paciente_placa`
  ADD PRIMARY KEY (`pla_id`), ADD KEY `codi_pac` (`codi_pac`);

--
-- Indices de la tabla `paciente_receta`
--
ALTER TABLE `paciente_receta`
  ADD PRIMARY KEY (`pacrec_id`), ADD KEY `codi_pac` (`codi_pac`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`), ADD KEY `codi_tra` (`codi_tra`);

--
-- Indices de la tabla `pago_comprobante`
--
ALTER TABLE `pago_comprobante`
  ADD UNIQUE KEY `id_pago` (`id_pago`,`id_com`), ADD KEY `id_pago_2` (`id_pago`), ADD KEY `id_com` (`id_com`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`cod_parametro`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`), ADD KEY `fk_permisos_menus` (`id_menu`), ADD KEY `fk_permisos_rol` (`codi_rol`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`cod_plan`);

--
-- Indices de la tabla `procedimiento`
--
ALTER TABLE `procedimiento`
  ADD PRIMARY KEY (`id_procedimiento`), ADD UNIQUE KEY `nombre` (`nombre`), ADD KEY `fk_procedimiento_tipo_concepto` (`id_tipoconcepto`), ADD KEY `fk_procedimiento_unidad_medida` (`id_medida`), ADD KEY `fk_procedimiento_categoria` (`codi_cat`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`provincia_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`codi_rol`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`cod_sede`);

--
-- Indices de la tabla `tipo_citado`
--
ALTER TABLE `tipo_citado`
  ADD PRIMARY KEY (`cod_citado`);

--
-- Indices de la tabla `tipo_concepto`
--
ALTER TABLE `tipo_concepto`
  ADD PRIMARY KEY (`id_tipoconcepto`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`cod_tipodocumento`), ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `tipo_inventario`
--
ALTER TABLE `tipo_inventario`
  ADD PRIMARY KEY (`cod_tipo_inventario`);

--
-- Indices de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  ADD PRIMARY KEY (`cod_tipomoneda`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`cod_tipopago`);

--
-- Indices de la tabla `tipo_tarjeta`
--
ALTER TABLE `tipo_tarjeta`
  ADD PRIMARY KEY (`cod_tarjeta`);

--
-- Indices de la tabla `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`codi_tra`);

--
-- Indices de la tabla `tratamiento_detalle`
--
ALTER TABLE `tratamiento_detalle`
  ADD UNIQUE KEY `codi_tra_2` (`codi_tra`,`id_procedimiento`), ADD KEY `codi_tra` (`codi_tra`), ADD KEY `id_procedimiento` (`id_procedimiento`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id_medida`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codi_usu`), ADD KEY `fk_usuario_rol` (`codi_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergia`
--
ALTER TABLE `alergia`
  MODIFY `cod_ale` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `cod_banco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codi_cat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `codi_cit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clinica`
--
ALTER TABLE `clinica`
  MODIFY `id_clin` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `id_com` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `departamento_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `detalle_proc`
--
ALTER TABLE `detalle_proc`
  MODIFY `codi_dpr` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `distrito_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `cod_especialidad` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `estado_diente`
--
ALTER TABLE `estado_diente`
  MODIFY `codi_edi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `hallazgos`
--
ALTER TABLE `hallazgos`
  MODIFY `id_hal` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `cod_inventario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `codi_med` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `codi_pac` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `paciente_alergia`
--
ALTER TABLE `paciente_alergia`
  MODIFY `pacale_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente_diagnostico`
--
ALTER TABLE `paciente_diagnostico`
  MODIFY `pacdiag_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente_evolucion`
--
ALTER TABLE `paciente_evolucion`
  MODIFY `pacevol_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente_odontograma`
--
ALTER TABLE `paciente_odontograma`
  MODIFY `pacodo_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente_placa`
--
ALTER TABLE `paciente_placa`
  MODIFY `pla_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente_receta`
--
ALTER TABLE `paciente_receta`
  MODIFY `pacrec_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=241;
--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `cod_parametro` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `cod_plan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `procedimiento`
--
ALTER TABLE `procedimiento`
  MODIFY `id_procedimiento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `provincia_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=197;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `codi_rol` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `cod_sede` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_citado`
--
ALTER TABLE `tipo_citado`
  MODIFY `cod_citado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tipo_concepto`
--
ALTER TABLE `tipo_concepto`
  MODIFY `id_tipoconcepto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `cod_tipodocumento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_inventario`
--
ALTER TABLE `tipo_inventario`
  MODIFY `cod_tipo_inventario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_moneda`
--
ALTER TABLE `tipo_moneda`
  MODIFY `cod_tipomoneda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `cod_tipopago` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tipo_tarjeta`
--
ALTER TABLE `tipo_tarjeta`
  MODIFY `cod_tarjeta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `codi_tra` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id_medida` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codi_usu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
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
