-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2023 a las 18:55:38
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sofmedip`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Pediatría', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE `componentes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Sodio', 'El sodio es un elemento químico de símbolo Na'),
(2, 'Cloro', 'El cloro es un elemento químico'),
(3, 'Hierro', 'El hierro es un elemento químico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes_medicamentos`
--

CREATE TABLE `componentes_medicamentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `unidad_medida_id` bigint(20) NOT NULL,
  `componente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(3, 1, 'email', 'text', 'Correo electrónico', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:users\",\"messages\":{\"required\":\"El campo Correo Eletr\\u00f3nico es requerido\",\"unique\":\"El campo Correo Eletr\\u00f3nico debe ser unico\"}}}', 3),
(4, 1, 'password', 'password', 'Contraseña', 1, 0, 0, 1, 1, 0, '{}', 7),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 8),
(6, 1, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 0, '{}', 9),
(7, 1, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 10),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 14),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Nombre Identificación', 1, 0, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Nombre es obligatorio.\"}}}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(20, 3, 'display_name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Nombre para mostrar es obligatorio.\"}}}', 3),
(56, 1, 'email_verified_at', 'timestamp', 'Verificado', 0, 1, 1, 1, 1, 1, '{}', 6),
(60, 3, 'description', 'text', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 6),
(61, 1, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Nombre es requerido\"}}}', 4),
(62, 1, 'surname', 'text', 'Apellido', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Apellido es requerido\"}}}', 5),
(63, 1, 'identification', 'text', 'Identificación', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:users\",\"messages\":{\"required\":\"El campo Identificaci\\u00f3n es requerido\",\"unique\":\"El campo Identificaci\\u00f3n debe ser unico\"}}}', 2),
(65, 1, 'tipo_documento', 'select_dropdown', 'Tipo Documento', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Tipo Documento es requerido\"}}}', 13),
(69, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(70, 8, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo nombre es requerido\"}}}', 2),
(71, 8, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(73, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(74, 9, 'codigo_estudiante', 'text', 'Código Estudiante', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:estudiantes\",\"messages\":{\"required\":\"El campo C\\u00f3digo Estudiante es requerido\",\"unique\":\"El campo C\\u00f3digo Estudiante debe ser unico\"}}}', 2),
(75, 9, 'created_at', 'timestamp', 'Creado', 0, 0, 0, 0, 0, 0, '{}', 3),
(76, 9, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 4),
(77, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(78, 10, 'registro_medico', 'text', 'Registro Medico', 0, 1, 1, 1, 1, 1, '{}', 2),
(79, 10, 'created_at', 'timestamp', 'Creado', 0, 0, 0, 0, 0, 0, '{}', 3),
(80, 10, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 4),
(81, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 11, 'tipo_paciente', 'text', 'Tipo Paciente', 0, 1, 1, 1, 1, 1, '{}', 2),
(84, 11, 'peso', 'number', 'Peso (kg)', 0, 1, 1, 1, 1, 1, '{}', 4),
(85, 11, 'nombre_acudiente', 'text', 'Nombre Acudiente', 0, 1, 1, 1, 1, 1, '{}', 5),
(86, 11, 'documento_acudiente', 'text', 'Documento Acudiente', 0, 1, 1, 1, 1, 1, '{}', 6),
(87, 11, 'created_at', 'timestamp', 'Creado', 0, 0, 0, 0, 0, 0, '{}', 7),
(88, 11, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 8),
(89, 9, 'estudiante_belongsto_user_relationship', 'relationship', 'Usuario', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"usuario_id\",\"key\":\"id\",\"label\":\"identification\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(90, 9, 'usuario_id', 'text', 'Usuario Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(91, 10, 'medico_belongsto_user_relationship', 'relationship', 'Usuario', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"usuario_id\",\"key\":\"id\",\"label\":\"identification\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(92, 10, 'usuario_id', 'text', 'Usuario Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(93, 11, 'paciente_belongsto_user_relationship', 'relationship', 'Usuario', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"usuario_id\",\"key\":\"id\",\"label\":\"identification\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(94, 11, 'usuario_id', 'text', 'Usuario Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(95, 11, 'fecha_nacimiento', 'date', 'Fecha Nacimiento', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|date|date_format:Y-m-d|before:tomorrow\",\"messages\":{\"required\":\"El campo Fecha Nacimiento es requerido\",\"date\":\"El campo Fecha Nacimiento debe ser de tipo fecha\",\"date_format\":\"El campo Fecha Nacimiento debe tener el formato: a\\u00f1o-mes-dia\",\"before\":\"El campo Fecha Nacimiento no debe ser mayor a hoy\"}}}', 3),
(96, 1, 'user_belongsto_tipo_documento_relationship', 'relationship', 'Tipo documento', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\TipoDocumento\",\"table\":\"tipo_documentos\",\"type\":\"belongsTo\",\"column\":\"tipo_documento\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(113, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 1, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 15),
(114, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(115, 18, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:componentes\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(116, 18, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(117, 18, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 4),
(118, 18, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 5),
(119, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(120, 19, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:enfermedades\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(121, 19, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(122, 19, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 4),
(123, 19, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 5),
(124, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(125, 23, 'presentacion', 'text', 'Presentación', 0, 1, 1, 1, 1, 1, '{}', 2),
(126, 23, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo nombre es requerido\"}}}', 3),
(127, 23, 'fabricante', 'text', 'Fabricante', 0, 1, 1, 1, 1, 1, '{}', 4),
(130, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(131, 24, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:via_suministros\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(132, 24, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(133, 24, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 4),
(134, 24, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 5),
(135, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 26, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:dispositivos_medicos\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(137, 26, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(138, 26, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|image|mimes:jpg,jpeg,png\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"mimes\":\"La imagen tiene formato incorrecto\"}}}', 4),
(139, 26, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 5),
(140, 26, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 6),
(141, 8, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 4),
(142, 8, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 5),
(143, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(144, 22, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:unidades_medidas\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(145, 22, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(146, 22, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 4),
(147, 22, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 5),
(148, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(149, 27, 'fecha', 'date', 'Fecha', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|date|date_format:Y-m-d|before:tomorrow\",\"messages\":{\"required\":\"El campo Fecha es requerido\",\"date\":\"El campo Fecha debe ser de tipo fecha\",\"date_format\":\"El campo Fecha debe tener el formato: a\\u00f1o-mes-dia\",\"before\":\"El campo Fecha debe ser una fecha antes o igual a hoy\"}}}', 2),
(150, 27, 'hora', 'time', 'Hora', 1, 1, 1, 1, 1, 1, '{}', 3),
(151, 27, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 4),
(152, 27, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 5),
(153, 27, 'enfermedad_id', 'text', 'Enfermedad Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(154, 27, 'medico_id', 'text', 'Medico Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(155, 27, 'paciente_id', 'text', 'Paciente Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(156, 27, 'historias_clinica_belongsto_enfermedade_relationship', 'relationship', 'Enfermedades', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Enfermedad\",\"table\":\"enfermedades\",\"type\":\"belongsTo\",\"column\":\"enfermedad_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(157, 27, 'historias_clinica_belongsto_medico_relationship', 'relationship', 'Médicos', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Medico\",\"table\":\"medicos\",\"type\":\"belongsTo\",\"column\":\"medico_id\",\"key\":\"id\",\"label\":\"usuario_id\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(158, 27, 'historias_clinica_belongsto_paciente_relationship', 'relationship', 'Pacientes', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Paciente\",\"table\":\"pacientes\",\"type\":\"belongsTo\",\"column\":\"paciente_id\",\"key\":\"id\",\"label\":\"usuario_id\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(159, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(160, 31, 'cantidad', 'text', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 2),
(161, 31, 'detalle', 'text_area', 'Detalle', 0, 1, 1, 1, 1, 1, '{}', 3),
(162, 31, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 4),
(163, 31, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 5),
(164, 31, 'unidad_medida_id', 'text', 'Unidad Medida Id', 1, 1, 1, 1, 1, 1, '{}', 7),
(165, 31, 'medicamento_id', 'text', 'Medicamento Id', 1, 1, 1, 1, 1, 1, '{}', 9),
(166, 31, 'historia_clinica_id', 'text', 'Historia Clinica Id', 1, 1, 1, 1, 1, 1, '{}', 11),
(167, 31, 'medico_id', 'text', 'Medico Id', 1, 1, 1, 1, 1, 1, '{}', 13),
(168, 31, 'prescripciones_medica_belongsto_unidades_medida_relationship', 'relationship', 'unidades_medidas', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\UnidadMedida\",\"table\":\"unidades_medidas\",\"type\":\"belongsTo\",\"column\":\"unidad_medida_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(170, 31, 'prescripciones_medica_belongsto_historias_clinica_relationship', 'relationship', 'historias_clinicas', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\HistoriaClinica\",\"table\":\"historias_clinicas\",\"type\":\"belongsTo\",\"column\":\"historia_clinica_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(171, 31, 'prescripciones_medica_belongsto_medico_relationship', 'relationship', 'medicos', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Medico\",\"table\":\"medicos\",\"type\":\"belongsTo\",\"column\":\"medico_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(172, 31, 'prescripciones_medica_belongsto_medicamento_relationship', 'relationship', 'medicamentos', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Medicamento\",\"table\":\"medicamentos\",\"type\":\"belongsTo\",\"column\":\"medicamento_id\",\"key\":\"id\",\"label\":\"presentacion\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(173, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(174, 32, 'cantidad', 'number', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 2),
(175, 32, 'unidad_medida_id', 'text', 'Unidad Medida Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(176, 32, 'componente_id', 'text', 'Componente Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(177, 32, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(178, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(179, 32, 'componentes_medicamento_belongsto_unidades_medida_relationship', 'relationship', 'unidades_medidas', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\UnidadMedida\",\"table\":\"unidades_medidas\",\"type\":\"belongsTo\",\"column\":\"unidad_medida_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"Componentes_medicamentos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(180, 32, 'componentes_medicamento_belongsto_componente_relationship', 'relationship', 'componentes', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Componente\",\"table\":\"componentes\",\"type\":\"belongsTo\",\"column\":\"componente_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"Componentes_medicamentos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(182, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(183, 33, 'pregunta', 'text', 'Pregunta', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:preguntas_simulaciones\",\"messages\":{\"required\":\"El campo Pregunta es requerido\",\"unique\":\"El campo Pregunta debe ser unico\"}}}', 2),
(184, 33, 'respuesta_medida', 'text', 'Respuesta Medida', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Respuesta es requerido\"}}}', 3),
(185, 33, 'respuesta_unidad', 'text', 'Respuesta Unidad', 1, 1, 1, 1, 1, 1, '{}', 5),
(186, 33, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 6),
(187, 33, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 7),
(188, 33, 'escenario_id', 'text', 'Escenario Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Escenario es requerido\"}}}', 9),
(189, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(190, 34, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo nombre es requerido\"}}}', 2),
(191, 34, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(192, 34, 'imagen', 'image', 'Imagen', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|image|mimes:jpg,jpeg,png\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"mimes\":\"La imagen tiene formato incorrecto\"}}}', 4),
(193, 34, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 5),
(194, 34, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 6),
(195, 35, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(196, 35, 'mensaje', 'text', 'Mensaje', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Mensaje es requerido\"}}}', 4),
(197, 35, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 7),
(200, 35, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 8),
(201, 35, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 9),
(202, 35, 'escenario_id', 'text', 'Escenario Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Escenario es requerido\"}}}', 3),
(203, 33, 'preguntas_simulacione_belongsto_escenarios_simulacione_relationship', 'relationship', 'Escenario de Simulación', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\EscenarioSimulacion\",\"table\":\"escenarios_simulaciones\",\"type\":\"belongsTo\",\"column\":\"escenario_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(204, 35, 'mensajes_simulacione_belongsto_escenarios_simulacione_relationship', 'relationship', 'Escenario de Simulación', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\EscenarioSimulacion\",\"table\":\"escenarios_simulaciones\",\"type\":\"belongsTo\",\"column\":\"escenario_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(205, 34, 'escenarios_simulacione_hasmany_mensajes_simulacione_relationship', 'relationship', 'mensajes_simulaciones', 0, 0, 1, 0, 0, 0, '{\"model\":\"\\\\App\\\\Models\\\\MensajeSimulacion\",\"table\":\"mensajes_simulaciones\",\"type\":\"hasMany\",\"column\":\"escenario_id\",\"key\":\"id\",\"label\":\"mensaje\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(206, 34, 'escenarios_simulacione_hasmany_preguntas_simulacione_relationship', 'relationship', 'preguntas_simulaciones', 0, 0, 1, 0, 0, 0, '{\"model\":\"\\\\App\\\\Models\\\\PreguntaSimulacion\",\"table\":\"preguntas_simulaciones\",\"type\":\"hasMany\",\"column\":\"escenario_id\",\"key\":\"id\",\"label\":\"pregunta\",\"pivot_table\":\"componentes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(207, 33, 'preguntas_simulacione_belongsto_unidades_medida_relationship', 'relationship', 'Unidad de Medida', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\UnidadMedida\",\"table\":\"unidades_medidas\",\"type\":\"belongsTo\",\"column\":\"respuesta_unidad\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(208, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(209, 36, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:niveles\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(210, 36, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(211, 37, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(212, 37, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:categorias\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(213, 37, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(214, 33, 'preguntas_simulacione_hasone_nivele_relationship', 'relationship', 'Nivel', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Nivel\",\"table\":\"niveles\",\"type\":\"belongsTo\",\"column\":\"nivel_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(215, 33, 'preguntas_simulacione_hasone_categoria_relationship', 'relationship', 'Categoria', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsTo\",\"column\":\"categoria_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(216, 33, 'nivel_id', 'text', 'Nivel Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Nivel es requerido\"}}}', 11),
(217, 33, 'categoria_id', 'text', 'Categoria Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Categoria es requerido\"}}}', 13),
(218, 23, 'medicamento_hasmany_componentes_medicamento_relationship', 'relationship', 'componentes_medicamentos', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\ComponenteMedicamento\",\"table\":\"componentes_medicamentos\",\"type\":\"hasMany\",\"column\":\"componente_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(219, 39, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(220, 39, 'porcentaje', 'number', 'Porcentaje', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:100\",\"messages\":{\"required\":\"El campo Porcentaje es requerido\",\"numeric\":\"El campo Porcentaje debe ser un numero\",\"min\":\"El campo Porcentaje es minimo :min\",\"max\":\"El campo Porcentaje es maximo :max\"}}}', 2),
(221, 39, 'tiempo', 'number', 'Tiempo (s)', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0\",\"messages\":{\"required\":\"El campo Tiempo es requerido\",\"numeric\":\"El campo Tiempo debe ser un numero\",\"min\":\"El campo tiempo es minimo :min\"}}}', 3),
(222, 39, 'nota', 'number', 'Nota', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:100\",\"messages\":{\"required\":\"El campo Nota es requerido\",\"numeric\":\"El campo Nota debe ser un numero\",\"min\":\"El campo Nota es minimo :min\",\"max\":\"El campo Nota es maximo :max\"}}}', 4),
(223, 35, 'posicion_horizontal', 'text', 'Posicion Horizontal', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:100\",\"messages\":{\"required\":\"El campo Posici\\u00f3n Horizontal es requerido\",\"numeric\":\"El campo Posici\\u00f3n Horizontal debe ser un numero\",\"min\":\"El campo Posici\\u00f3n Horizontal es minimo :min\",\"max\":\"El campo Posici\\u00f3n Horizontal es maximo :max\"}}}', 5),
(224, 35, 'posicion_vertical', 'text', 'Posicion Vertical', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:100\",\"messages\":{\"required\":\"El campo Posici\\u00f3n Vertical es requerido\",\"numeric\":\"El campo Posici\\u00f3n Vertical debe ser un numero\",\"min\":\"El campo Posici\\u00f3n Vertical es minimo :min\",\"max\":\"El campo Posici\\u00f3n Vertical es maximo :max\"}}}', 6),
(225, 39, 'calificacione_belongsto_calificacione_relationship', 'relationship', 'calificaciones', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\PreguntaSimulacion\",\"table\":\"calificaciones\",\"type\":\"belongsTo\",\"column\":\"pregunta_id\",\"key\":\"id\",\"label\":\"nota\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(226, 39, 'pregunta_id', 'text', 'Pregunta Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(227, 33, 'preguntas_simulacione_hasmany_calificacione_relationship', 'relationship', 'calificaciones', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Calificacion\",\"table\":\"calificaciones\",\"type\":\"hasMany\",\"column\":\"pregunta_id\",\"key\":\"id\",\"label\":\"nota\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(228, 41, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(229, 41, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:pruebas\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(230, 41, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(231, 45, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(232, 45, 'respuesta_medida', 'text', 'Respuesta Medida', 0, 1, 1, 1, 1, 1, '{}', 2),
(233, 45, 'respuesta_unidad', 'text', 'Respuesta Unidad', 0, 1, 1, 1, 1, 1, '{}', 3),
(234, 45, 'nota', 'number', 'Nota', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:100\",\"messages\":{\"required\":\"El campo Nota es requerido\",\"numeric\":\"El campo Nota debe ser un numero\",\"min\":\"El campo Nota es minimo :min\",\"max\":\"El campo Nota es maximo :max\"}}}', 4),
(235, 45, 'pregunta_id', 'text', 'Pregunta Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(236, 45, 'estudiante_id', 'text', 'Estudiante Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(237, 45, 'profesor_id', 'text', 'Profesor Id', 0, 1, 1, 1, 1, 1, '{}', 10),
(238, 45, 'prueba_id', 'text', 'Prueba Id', 0, 1, 1, 1, 1, 1, '{}', 12),
(239, 45, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 1, 0, 1, '{}', 13),
(240, 45, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 14),
(241, 45, 'simulacione_belongsto_preguntas_simulacione_relationship', 'relationship', 'Preguntas', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\PreguntaSimulacion\",\"table\":\"preguntas_simulaciones\",\"type\":\"belongsTo\",\"column\":\"pregunta_id\",\"key\":\"id\",\"label\":\"pregunta\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(242, 45, 'simulacione_belongsto_estudiante_relationship', 'relationship', 'Estudiantes', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Estudiante\",\"table\":\"estudiantes\",\"type\":\"belongsTo\",\"column\":\"estudiante_id\",\"key\":\"id\",\"label\":\"codigo_estudiante\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(243, 45, 'simulacione_belongsto_profesor_relationship', 'relationship', 'Profesor', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Profesor\",\"table\":\"profesor\",\"type\":\"belongsTo\",\"column\":\"profesor_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(244, 45, 'simulacione_belongsto_prueba_relationship', 'relationship', 'Pruebas', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Prueba\",\"table\":\"pruebas\",\"type\":\"belongsTo\",\"column\":\"prueba_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(245, 33, 'preguntas_simulacione_hasmany_simulacione_relationship', 'relationship', 'simulaciones', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Simulacion\",\"table\":\"simulaciones\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nota\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '\\App\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":\"identification\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-28 09:13:25', '2023-02-01 00:50:55'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-28 09:13:25', '2023-01-31 23:33:55'),
(8, 'tipo_documentos', 'tipo-documentos', 'Tipo Documento', 'Tipo Documentos', 'voyager-categories', 'App\\Models\\TipoDocumento', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-30 23:16:47', '2023-01-31 23:38:10'),
(9, 'estudiantes', 'estudiantes', 'Estudiante', 'Estudiantes', 'voyager-study', 'App\\Models\\Estudiante', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 16:19:20', '2023-01-31 17:17:22'),
(10, 'medicos', 'medicos', 'Medico', 'Medicos', 'fa fa-user-md', 'App\\Models\\Medico', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 16:26:02', '2023-01-31 17:19:04'),
(11, 'pacientes', 'pacientes', 'Paciente', 'Pacientes', NULL, 'App\\Models\\Paciente', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 16:42:40', '2023-01-31 17:14:54'),
(18, 'componentes', 'componentes', 'Componente', 'Componentes', 'voyager-puzzle', 'App\\Models\\Componente', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 21:12:38', '2023-01-31 23:26:55'),
(19, 'enfermedades', 'enfermedades', 'Enfermedad', 'Enfermedades', 'voyager-droplet', 'App\\Models\\Enfermedad', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 21:13:33', '2023-01-31 23:27:14'),
(22, 'unidades_medidas', 'unidades-medidas', 'Unidad Medida', 'Unidades Medidas', 'fa fa-adjust', 'App\\Models\\UnidadMedida', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 21:17:10', '2023-04-12 13:10:04'),
(23, 'medicamentos', 'medicamentos', 'Medicamento', 'Medicamentos', 'voyager-lab', 'App\\Models\\Medicamento', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 21:19:27', '2023-05-19 12:49:42'),
(24, 'via_suministros', 'via-suministros', 'Via Suministro', 'Via Suministros', 'voyager-flashlight', 'App\\Models\\ViaSuministro', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 21:57:33', '2023-01-31 23:42:29'),
(26, 'dispositivos_medicos', 'dispositivos-medicos', 'Dispositivos Medico', 'Dispositivos Medicos', 'voyager-plug', 'App\\Models\\DispositivoMedico', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 21:59:34', '2023-01-31 23:27:03'),
(27, 'historias_clinicas', 'historias-clinicas', 'Historia Clínica', 'Historias Clínicas', 'voyager-documentation', 'App\\Models\\HistoriaClinica', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"fecha\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-01 00:05:45', '2023-02-01 00:46:06'),
(31, 'prescripciones_medicas', 'prescripciones-medicas', 'Prescripciones Medica', 'Prescripciones Medicas', 'voyager-pen', 'App\\Models\\PrescripcionMedica', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-01 01:01:51', '2023-02-02 18:09:35'),
(32, 'Componentes_medicamentos', 'componentes-medicamentos', 'Componente Medicamento', 'Componentes Medicamentos', 'voyager-rum-1', 'App\\Models\\ComponenteMedicamento', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-02 18:56:21', '2023-02-02 18:58:08'),
(33, 'preguntas_simulaciones', 'preguntas-simulaciones', 'Pregunta de Simulación', 'Preguntas de Simulaciones', 'voyager-bulb', 'App\\Models\\PreguntaSimulacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-02 23:44:24', '2023-05-22 16:37:21'),
(34, 'escenarios_simulaciones', 'escenarios-simulaciones', 'Escenario de Simulación', 'Escenarios de Simulaciones', 'voyager-tv', 'App\\Models\\EscenarioSimulacion', NULL, '\\App\\Http\\Controllers\\EscenarioSimulacionController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-02 23:46:49', '2023-05-22 16:38:05'),
(35, 'mensajes_simulaciones', 'mensajes-simulaciones', 'Mensaje Simulación', 'Mensajes Simulaciones', 'voyager-receipt', 'App\\Models\\MensajeSimulacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-02 23:50:46', '2023-05-20 14:27:30'),
(36, 'niveles', 'niveles', 'Nivel', 'Niveles', 'voyager-paint-bucket', 'App\\Models\\Nivel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-04-12 03:09:15', '2023-04-12 03:09:15'),
(37, 'categorias', 'categorias', 'Categoria', 'Categorias', 'voyager-categories', 'App\\Models\\Categoria', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-04-12 03:18:14', '2023-04-12 14:18:41'),
(39, 'calificaciones', 'calificaciones', 'Calificacione', 'Calificaciones', 'voyager-certificate', 'App\\Models\\Calificacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-05-20 14:19:20', '2023-05-22 15:28:48'),
(41, 'pruebas', 'pruebas', 'Prueba', 'Pruebas', 'voyager-list-add', 'App\\Models\\Prueba', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-05-22 15:54:14', '2023-05-22 15:54:14'),
(43, 'profesor', 'profesor', 'Profesor', 'Profesores', NULL, 'App\\Models\\Profesor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-05-22 16:04:29', '2023-05-22 16:04:29'),
(45, 'simulaciones', 'simulaciones', 'Simulacion', 'Simulaciones', NULL, 'App\\Models\\Simulacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-05-22 16:16:11', '2023-05-22 16:36:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos_medicos`
--

CREATE TABLE `dispositivos_medicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dispositivos_medicos`
--

INSERT INTO `dispositivos_medicos` (`id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 'Jeringa', 'Una jeringa consiste en un émbolo insertado en un tubo que tiene una pequeña apertura en uno de sus extremos.', 'dispositivos-medicos/January2023/L8b5hDKsHphtTdsBn7DK.png'),
(2, 'Bomba de infusión', 'La bomba de infusión es un sistema para administrar fármacos directamente a la sangre del paciente', 'dispositivos-medicos/January2023/OXYCXTHkWpikHrCNh8Xk.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

CREATE TABLE `enfermedades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `enfermedades`
--

INSERT INTO `enfermedades` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Cardioparía congénita', 'Enfermedad del corazón que aparece desde el nacimiento', '2023-01-31 23:25:11', '2023-01-31 23:25:11'),
(2, 'Neumonía', 'Inflamación de parénquima pulmonar', '2023-01-31 23:25:49', '2023-01-31 23:25:49'),
(3, 'Meningitis', 'Inflamación de las menínges cerebrales', '2023-01-31 23:26:06', '2023-01-31 23:26:06'),
(4, 'Bronquiolitis', 'Inflamación de los bronquiolos', '2023-01-31 23:26:25', '2023-01-31 23:26:25'),
(5, 'Epilepsia', 'Actividad eléctrica anormal de la corteza cerebral', '2023-01-31 23:26:41', '2023-01-31 23:26:41'),
(6, 'Síndrome nefrótico', 'Trastorno renal que se caracteriza por edema,proteinuria e hipercoagubilidad', '2023-01-31 23:27:36', '2023-01-31 23:27:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escenarios_simulaciones`
--

CREATE TABLE `escenarios_simulaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `escenarios_simulaciones`
--

INSERT INTO `escenarios_simulaciones` (`id`, `nombre`, `descripcion`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Caso 1', 'Diagnóstico de Enfermedad Diarreica Aguda. Tiene catéter venoso central por inserción periférica (PICC). En las últimas 4 horas ha eliminado  70 cc de orina. El pediatra indica pasar bolo de SSN 0,9% a 10 cc/kg en 10 minutos, luego iniciar líquidos al 120%.  El reporte de potasio sérico es 2meq/L, por lo tanto ordenan pasar un bolo de potasio en SSN 0.9% a 0,5 meq/kg a una velocidad de 0.5 meq/kg/hora. Recuerde que por vía central se pasa a 80meq/litro (presentación ampolla por 10 miliequivalentes 1ml=2 miliequivalentes)', 'escenarios-simulaciones\\March2023\\OCfnGtnoedHJUu1er4Cc.jpeg', '2023-02-03 12:01:38', '2023-03-10 17:06:42'),
(2, 'Caso 2', 'Se encuentra en su segundo día de hospitalización en pos operatorio de apendicectomía más drenaje de peritonitis. El pediatra prescribe Ampicilina Sulbactam 150 mg/Kg/día repartido en cuatro dosis. (Presentación polvo estéril para reconstituir por 1.5g) y pasar bolo de Lactato de Ringer a 20 cc/kg en veinte minutos.', 'escenarios-simulaciones\\March2023\\AAzshItHnbYQ580MvegH.jpeg', '2023-02-03 12:02:32', '2023-03-10 17:06:52'),
(3, 'Caso 3', 'El diagnóstico es Síndrome hemorrágico y dislipidemia. El pediatra de turno prescribe Colestiramina (Presentación sobre granulado de 4gr diluir en 50 ml de agua) 800mg VO c/4h, también ordena iniciar Inmunoglobulina humana (Presentación frasco por 50ml al 10%). Dosis: 2gr/kg. Iniciar la infusión a una velocidad de 0,5 ml/kg en 30 minutos y si es bien tolerada, continuar a 6 ml/Kg/hora.', 'escenarios-simulaciones\\March2023\\epgazaH9Lf2wNqvN337k.jpeg', '2023-02-03 12:02:51', '2023-03-10 17:07:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo_estudiante` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `codigo_estudiante`, `created_at`, `updated_at`, `usuario_id`) VALUES
(1, 160003749, '2023-01-31 17:17:03', '2023-01-31 17:17:03', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enfermedad_id` bigint(20) DEFAULT NULL,
  `medico_id` bigint(20) DEFAULT NULL,
  `paciente_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historias_clinicas`
--

INSERT INTO `historias_clinicas` (`id`, `fecha`, `hora`, `created_at`, `updated_at`, `enfermedad_id`, `medico_id`, `paciente_id`) VALUES
(1, '2023-01-31', '19:11:00', '2023-02-01 00:11:24', '2023-02-01 00:11:24', 4, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `presentacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `fabricante` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id`, `presentacion`, `nombre`, `fabricante`) VALUES
(1, 'SSN 0,9%', 'Bolsa por 500 ml', 'MK'),
(2, 'Ampicilina sulbactam por 1,5g', 'Polvo para reconstituir', 'MK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos_componentes`
--

CREATE TABLE `medicamentos_componentes` (
  `id` int(10) UNSIGNED NOT NULL,
  `medicamento_id` bigint(20) UNSIGNED NOT NULL,
  `componente_medicamento_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registro_medico` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `registro_medico`, `created_at`, `updated_at`, `usuario_id`) VALUES
(1, '2222', '2023-01-31 17:18:48', '2023-01-31 17:18:48', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes_simulaciones`
--

CREATE TABLE `mensajes_simulaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `posicion_horizontal` double NOT NULL DEFAULT 0,
  `posicion_vertical` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `escenario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mensajes_simulaciones`
--

INSERT INTO `mensajes_simulaciones` (`id`, `mensaje`, `descripcion`, `posicion_horizontal`, `posicion_vertical`, `created_at`, `updated_at`, `escenario_id`) VALUES
(1, 'Hola', 'Es para dar bienvenida', 0.2, 0.3, '2023-02-03 17:43:40', '2023-02-03 17:43:40', 8),
(2, 'Mensaje de prueba', NULL, 50, 50, '2023-02-03 17:46:07', '2023-05-20 14:31:35', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-01-28 09:13:25', '2023-02-28 16:25:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-home', '#000000', NULL, 1, '2023-01-28 09:13:25', '2023-01-31 16:27:16', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 5, 2, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.media.index', NULL),
(3, 1, 'Usuarios', '', '_self', 'voyager-person', '#000000', 18, 1, '2023-01-28 09:13:25', '2023-01-31 21:25:09', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 27, 12, '2023-01-28 09:13:25', '2023-05-22 16:53:20', 'voyager.roles.index', NULL),
(5, 1, 'Herramientas', '', '_self', 'voyager-tools', '#000000', NULL, 5, '2023-01-28 09:13:25', '2023-04-12 14:21:39', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 3, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 4, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 5, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.bread.index', NULL),
(10, 1, 'Ajustes', '', '_self', 'voyager-settings', '#000000', 5, 6, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.settings.index', 'null'),
(15, 1, 'Tipo Documentos', '', '_self', 'voyager-categories', '#000000', 27, 13, '2023-01-30 23:16:47', '2023-05-22 16:53:20', 'voyager.tipo-documentos.index', 'null'),
(16, 1, 'Estudiantes', '', '_self', 'voyager-study', NULL, 18, 2, '2023-01-31 16:19:20', '2023-05-22 16:52:08', 'voyager.estudiantes.index', NULL),
(17, 1, 'Medicos', '', '_self', 'fa fa-user-md', NULL, 18, 3, '2023-01-31 16:26:02', '2023-05-22 16:52:08', 'voyager.medicos.index', NULL),
(18, 1, 'Usuarios', '', '_self', 'voyager-people', '#000000', NULL, 3, '2023-01-31 16:37:09', '2023-04-12 14:23:15', NULL, ''),
(19, 1, 'Pacientes', '', '_self', 'fa fa-heartbeat', '#000000', 18, 4, '2023-01-31 16:42:40', '2023-05-22 16:52:08', 'voyager.pacientes.index', 'null'),
(23, 1, 'Componentes', '', '_self', 'voyager-puzzle', NULL, 27, 3, '2023-01-31 21:12:38', '2023-05-22 16:53:38', 'voyager.componentes.index', NULL),
(24, 1, 'Enfermedades', '', '_self', 'voyager-droplet', NULL, 27, 7, '2023-01-31 21:13:33', '2023-05-22 16:53:20', 'voyager.enfermedades.index', NULL),
(25, 1, 'Unidades Medidas', '', '_self', 'fa fa-adjust', NULL, 27, 14, '2023-01-31 21:17:10', '2023-05-22 16:53:20', 'voyager.unidades-medidas.index', NULL),
(26, 1, 'Medicamentos', '', '_self', 'voyager-lab', NULL, 27, 8, '2023-01-31 21:19:27', '2023-05-22 16:53:20', 'voyager.medicamentos.index', NULL),
(27, 1, 'Parametros', '', '_self', 'voyager-params', '#000000', NULL, 4, '2023-01-31 21:24:18', '2023-04-12 14:21:39', NULL, ''),
(28, 1, 'Via Suministros', '', '_self', 'voyager-flashlight', NULL, 27, 15, '2023-01-31 21:57:33', '2023-05-22 16:53:20', 'voyager.via-suministros.index', NULL),
(29, 1, 'Dispositivos Medicos', '', '_self', 'voyager-plug', NULL, 27, 5, '2023-01-31 21:59:34', '2023-05-22 16:54:04', 'voyager.dispositivos-medicos.index', NULL),
(30, 1, 'Historias Clínicas', '', '_self', 'voyager-documentation', NULL, 27, 6, '2023-02-01 00:05:45', '2023-05-22 16:54:04', 'voyager.historias-clinicas.index', NULL),
(32, 1, 'Prescripciones Medicas', '', '_self', 'voyager-pen', '#000000', 27, 10, '2023-02-01 01:01:51', '2023-05-22 16:53:20', 'voyager.prescripciones-medicas.index', 'null'),
(33, 1, 'Componentes Medicamentos', '', '_self', 'voyager-rum-1', NULL, 27, 4, '2023-02-02 18:56:21', '2023-05-22 16:53:45', 'voyager.componentes-medicamentos.index', NULL),
(34, 1, 'Preguntas Simulaciones', '', '_self', 'voyager-question', '#000000', 37, 4, '2023-02-02 23:44:24', '2023-05-22 16:52:46', 'voyager.preguntas-simulaciones.index', 'null'),
(35, 1, 'Escenarios Simulaciones', '', '_self', 'voyager-play', '#000000', 37, 2, '2023-02-02 23:46:49', '2023-05-22 16:52:38', 'voyager.escenarios-simulaciones.index', 'null'),
(36, 1, 'Mensajes Simulaciones', '', '_self', 'voyager-bubble', '#000000', 37, 3, '2023-02-02 23:50:46', '2023-05-22 16:52:46', 'voyager.mensajes-simulaciones.index', 'null'),
(37, 1, 'Simulación', '', '_self', 'voyager-activity', '#000000', NULL, 2, '2023-02-03 00:04:23', '2023-04-12 14:22:49', NULL, ''),
(41, 1, 'Niveles', '', '_self', 'voyager-paint-bucket', NULL, 27, 9, '2023-04-12 03:09:15', '2023-05-22 16:53:20', 'voyager.niveles.index', NULL),
(42, 1, 'Categorias', '', '_self', 'voyager-categories', NULL, 27, 1, '2023-04-12 03:18:14', '2023-05-22 16:53:41', 'voyager.categorias.index', NULL),
(43, 1, 'Calificaciones', '', '_self', 'voyager-certificate', NULL, 27, 2, '2023-05-20 14:19:20', '2023-05-22 16:53:41', 'voyager.calificaciones.index', NULL),
(45, 1, 'Pruebas', '', '_self', 'voyager-list-add', NULL, 27, 11, '2023-05-22 15:54:14', '2023-05-22 16:53:20', 'voyager.pruebas.index', NULL),
(47, 1, 'Profesores', '', '_self', NULL, NULL, 18, 5, '2023-05-22 16:04:29', '2023-05-22 16:52:08', 'voyager.profesor.index', NULL),
(48, 1, 'Simulaciones', '', '_self', NULL, NULL, 37, 1, '2023-05-22 16:16:12', '2023-05-22 16:52:38', 'voyager.simulaciones.index', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Fácil', NULL),
(2, 'Medio', NULL),
(3, 'Difícil', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_paciente` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `nombre_acudiente` varchar(255) DEFAULT NULL,
  `documento_acudiente` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `tipo_paciente`, `fecha_nacimiento`, `peso`, `nombre_acudiente`, `documento_acudiente`, `created_at`, `updated_at`, `usuario_id`) VALUES
(2, 'Hospitalizado', '2022-07-15', 10, 'Santiago', '112195', '2023-01-31 17:14:23', '2023-01-31 17:14:23', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(2, 'browse_bread', NULL, '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(3, 'browse_database', NULL, '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(4, 'browse_media', NULL, '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(5, 'browse_compass', NULL, '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(6, 'browse_menus', 'menus', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(7, 'read_menus', 'menus', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(8, 'edit_menus', 'menus', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(9, 'add_menus', 'menus', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(10, 'delete_menus', 'menus', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(11, 'browse_roles', 'roles', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(12, 'read_roles', 'roles', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(13, 'edit_roles', 'roles', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(14, 'add_roles', 'roles', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(15, 'delete_roles', 'roles', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(16, 'browse_users', 'users', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(17, 'read_users', 'users', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(18, 'edit_users', 'users', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(19, 'add_users', 'users', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(20, 'delete_users', 'users', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(21, 'browse_settings', 'settings', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(22, 'read_settings', 'settings', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(23, 'edit_settings', 'settings', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(24, 'add_settings', 'settings', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(25, 'delete_settings', 'settings', '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(46, 'browse_tipo_documentos', 'tipo_documentos', '2023-01-30 23:16:47', '2023-01-30 23:16:47'),
(47, 'read_tipo_documentos', 'tipo_documentos', '2023-01-30 23:16:47', '2023-01-30 23:16:47'),
(48, 'edit_tipo_documentos', 'tipo_documentos', '2023-01-30 23:16:47', '2023-01-30 23:16:47'),
(49, 'add_tipo_documentos', 'tipo_documentos', '2023-01-30 23:16:47', '2023-01-30 23:16:47'),
(50, 'delete_tipo_documentos', 'tipo_documentos', '2023-01-30 23:16:47', '2023-01-30 23:16:47'),
(51, 'browse_estudiantes', 'estudiantes', '2023-01-31 16:19:20', '2023-01-31 16:19:20'),
(52, 'read_estudiantes', 'estudiantes', '2023-01-31 16:19:20', '2023-01-31 16:19:20'),
(53, 'edit_estudiantes', 'estudiantes', '2023-01-31 16:19:20', '2023-01-31 16:19:20'),
(54, 'add_estudiantes', 'estudiantes', '2023-01-31 16:19:20', '2023-01-31 16:19:20'),
(55, 'delete_estudiantes', 'estudiantes', '2023-01-31 16:19:20', '2023-01-31 16:19:20'),
(56, 'browse_medicos', 'medicos', '2023-01-31 16:26:02', '2023-01-31 16:26:02'),
(57, 'read_medicos', 'medicos', '2023-01-31 16:26:02', '2023-01-31 16:26:02'),
(58, 'edit_medicos', 'medicos', '2023-01-31 16:26:02', '2023-01-31 16:26:02'),
(59, 'add_medicos', 'medicos', '2023-01-31 16:26:02', '2023-01-31 16:26:02'),
(60, 'delete_medicos', 'medicos', '2023-01-31 16:26:02', '2023-01-31 16:26:02'),
(61, 'browse_pacientes', 'pacientes', '2023-01-31 16:42:40', '2023-01-31 16:42:40'),
(62, 'read_pacientes', 'pacientes', '2023-01-31 16:42:40', '2023-01-31 16:42:40'),
(63, 'edit_pacientes', 'pacientes', '2023-01-31 16:42:40', '2023-01-31 16:42:40'),
(64, 'add_pacientes', 'pacientes', '2023-01-31 16:42:40', '2023-01-31 16:42:40'),
(65, 'delete_pacientes', 'pacientes', '2023-01-31 16:42:40', '2023-01-31 16:42:40'),
(81, 'browse_componentes', 'componentes', '2023-01-31 21:12:38', '2023-01-31 21:12:38'),
(82, 'read_componentes', 'componentes', '2023-01-31 21:12:38', '2023-01-31 21:12:38'),
(83, 'edit_componentes', 'componentes', '2023-01-31 21:12:38', '2023-01-31 21:12:38'),
(84, 'add_componentes', 'componentes', '2023-01-31 21:12:38', '2023-01-31 21:12:38'),
(85, 'delete_componentes', 'componentes', '2023-01-31 21:12:38', '2023-01-31 21:12:38'),
(86, 'browse_enfermedades', 'enfermedades', '2023-01-31 21:13:33', '2023-01-31 21:13:33'),
(87, 'read_enfermedades', 'enfermedades', '2023-01-31 21:13:33', '2023-01-31 21:13:33'),
(88, 'edit_enfermedades', 'enfermedades', '2023-01-31 21:13:33', '2023-01-31 21:13:33'),
(89, 'add_enfermedades', 'enfermedades', '2023-01-31 21:13:33', '2023-01-31 21:13:33'),
(90, 'delete_enfermedades', 'enfermedades', '2023-01-31 21:13:33', '2023-01-31 21:13:33'),
(91, 'browse_unidades_medidas', 'unidades_medidas', '2023-01-31 21:17:10', '2023-01-31 21:17:10'),
(92, 'read_unidades_medidas', 'unidades_medidas', '2023-01-31 21:17:10', '2023-01-31 21:17:10'),
(93, 'edit_unidades_medidas', 'unidades_medidas', '2023-01-31 21:17:10', '2023-01-31 21:17:10'),
(94, 'add_unidades_medidas', 'unidades_medidas', '2023-01-31 21:17:10', '2023-01-31 21:17:10'),
(95, 'delete_unidades_medidas', 'unidades_medidas', '2023-01-31 21:17:10', '2023-01-31 21:17:10'),
(96, 'browse_medicamentos', 'medicamentos', '2023-01-31 21:19:27', '2023-01-31 21:19:27'),
(97, 'read_medicamentos', 'medicamentos', '2023-01-31 21:19:27', '2023-01-31 21:19:27'),
(98, 'edit_medicamentos', 'medicamentos', '2023-01-31 21:19:27', '2023-01-31 21:19:27'),
(99, 'add_medicamentos', 'medicamentos', '2023-01-31 21:19:27', '2023-01-31 21:19:27'),
(100, 'delete_medicamentos', 'medicamentos', '2023-01-31 21:19:27', '2023-01-31 21:19:27'),
(101, 'browse_via_suministros', 'via_suministros', '2023-01-31 21:57:33', '2023-01-31 21:57:33'),
(102, 'read_via_suministros', 'via_suministros', '2023-01-31 21:57:33', '2023-01-31 21:57:33'),
(103, 'edit_via_suministros', 'via_suministros', '2023-01-31 21:57:33', '2023-01-31 21:57:33'),
(104, 'add_via_suministros', 'via_suministros', '2023-01-31 21:57:33', '2023-01-31 21:57:33'),
(105, 'delete_via_suministros', 'via_suministros', '2023-01-31 21:57:33', '2023-01-31 21:57:33'),
(106, 'browse_dispositivos_medicos', 'dispositivos_medicos', '2023-01-31 21:59:34', '2023-01-31 21:59:34'),
(107, 'read_dispositivos_medicos', 'dispositivos_medicos', '2023-01-31 21:59:34', '2023-01-31 21:59:34'),
(108, 'edit_dispositivos_medicos', 'dispositivos_medicos', '2023-01-31 21:59:34', '2023-01-31 21:59:34'),
(109, 'add_dispositivos_medicos', 'dispositivos_medicos', '2023-01-31 21:59:34', '2023-01-31 21:59:34'),
(110, 'delete_dispositivos_medicos', 'dispositivos_medicos', '2023-01-31 21:59:34', '2023-01-31 21:59:34'),
(111, 'browse_historias_clinicas', 'historias_clinicas', '2023-02-01 00:05:45', '2023-02-01 00:05:45'),
(112, 'read_historias_clinicas', 'historias_clinicas', '2023-02-01 00:05:45', '2023-02-01 00:05:45'),
(113, 'edit_historias_clinicas', 'historias_clinicas', '2023-02-01 00:05:45', '2023-02-01 00:05:45'),
(114, 'add_historias_clinicas', 'historias_clinicas', '2023-02-01 00:05:45', '2023-02-01 00:05:45'),
(115, 'delete_historias_clinicas', 'historias_clinicas', '2023-02-01 00:05:45', '2023-02-01 00:05:45'),
(121, 'browse_prescripciones_medicas', 'prescripciones_medicas', '2023-02-01 01:01:51', '2023-02-01 01:01:51'),
(122, 'read_prescripciones_medicas', 'prescripciones_medicas', '2023-02-01 01:01:51', '2023-02-01 01:01:51'),
(123, 'edit_prescripciones_medicas', 'prescripciones_medicas', '2023-02-01 01:01:51', '2023-02-01 01:01:51'),
(124, 'add_prescripciones_medicas', 'prescripciones_medicas', '2023-02-01 01:01:51', '2023-02-01 01:01:51'),
(125, 'delete_prescripciones_medicas', 'prescripciones_medicas', '2023-02-01 01:01:51', '2023-02-01 01:01:51'),
(126, 'browse_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(127, 'read_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(128, 'edit_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(129, 'add_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(130, 'delete_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(131, 'browse_preguntas_simulaciones', 'preguntas_simulaciones', '2023-02-02 23:44:24', '2023-02-02 23:44:24'),
(132, 'read_preguntas_simulaciones', 'preguntas_simulaciones', '2023-02-02 23:44:24', '2023-02-02 23:44:24'),
(133, 'edit_preguntas_simulaciones', 'preguntas_simulaciones', '2023-02-02 23:44:24', '2023-02-02 23:44:24'),
(134, 'add_preguntas_simulaciones', 'preguntas_simulaciones', '2023-02-02 23:44:24', '2023-02-02 23:44:24'),
(135, 'delete_preguntas_simulaciones', 'preguntas_simulaciones', '2023-02-02 23:44:24', '2023-02-02 23:44:24'),
(136, 'browse_escenarios_simulaciones', 'escenarios_simulaciones', '2023-02-02 23:46:49', '2023-02-02 23:46:49'),
(137, 'read_escenarios_simulaciones', 'escenarios_simulaciones', '2023-02-02 23:46:49', '2023-02-02 23:46:49'),
(138, 'edit_escenarios_simulaciones', 'escenarios_simulaciones', '2023-02-02 23:46:49', '2023-02-02 23:46:49'),
(139, 'add_escenarios_simulaciones', 'escenarios_simulaciones', '2023-02-02 23:46:49', '2023-02-02 23:46:49'),
(140, 'delete_escenarios_simulaciones', 'escenarios_simulaciones', '2023-02-02 23:46:49', '2023-02-02 23:46:49'),
(141, 'browse_mensajes_simulaciones', 'mensajes_simulaciones', '2023-02-02 23:50:46', '2023-02-02 23:50:46'),
(142, 'read_mensajes_simulaciones', 'mensajes_simulaciones', '2023-02-02 23:50:46', '2023-02-02 23:50:46'),
(143, 'edit_mensajes_simulaciones', 'mensajes_simulaciones', '2023-02-02 23:50:46', '2023-02-02 23:50:46'),
(144, 'add_mensajes_simulaciones', 'mensajes_simulaciones', '2023-02-02 23:50:46', '2023-02-02 23:50:46'),
(145, 'delete_mensajes_simulaciones', 'mensajes_simulaciones', '2023-02-02 23:50:46', '2023-02-02 23:50:46'),
(146, 'browse_niveles', 'niveles', '2023-04-12 03:09:15', '2023-04-12 03:09:15'),
(147, 'read_niveles', 'niveles', '2023-04-12 03:09:15', '2023-04-12 03:09:15'),
(148, 'edit_niveles', 'niveles', '2023-04-12 03:09:15', '2023-04-12 03:09:15'),
(149, 'add_niveles', 'niveles', '2023-04-12 03:09:15', '2023-04-12 03:09:15'),
(150, 'delete_niveles', 'niveles', '2023-04-12 03:09:15', '2023-04-12 03:09:15'),
(151, 'browse_categorias', 'categorias', '2023-04-12 03:18:14', '2023-04-12 03:18:14'),
(152, 'read_categorias', 'categorias', '2023-04-12 03:18:14', '2023-04-12 03:18:14'),
(153, 'edit_categorias', 'categorias', '2023-04-12 03:18:14', '2023-04-12 03:18:14'),
(154, 'add_categorias', 'categorias', '2023-04-12 03:18:14', '2023-04-12 03:18:14'),
(155, 'delete_categorias', 'categorias', '2023-04-12 03:18:14', '2023-04-12 03:18:14'),
(156, 'browse_calificaciones', 'calificaciones', '2023-05-20 14:19:20', '2023-05-20 14:19:20'),
(157, 'read_calificaciones', 'calificaciones', '2023-05-20 14:19:20', '2023-05-20 14:19:20'),
(158, 'edit_calificaciones', 'calificaciones', '2023-05-20 14:19:20', '2023-05-20 14:19:20'),
(159, 'add_calificaciones', 'calificaciones', '2023-05-20 14:19:20', '2023-05-20 14:19:20'),
(160, 'delete_calificaciones', 'calificaciones', '2023-05-20 14:19:20', '2023-05-20 14:19:20'),
(166, 'browse_pruebas', 'pruebas', '2023-05-22 15:54:14', '2023-05-22 15:54:14'),
(167, 'read_pruebas', 'pruebas', '2023-05-22 15:54:14', '2023-05-22 15:54:14'),
(168, 'edit_pruebas', 'pruebas', '2023-05-22 15:54:14', '2023-05-22 15:54:14'),
(169, 'add_pruebas', 'pruebas', '2023-05-22 15:54:14', '2023-05-22 15:54:14'),
(170, 'delete_pruebas', 'pruebas', '2023-05-22 15:54:14', '2023-05-22 15:54:14'),
(176, 'browse_profesor', 'profesor', '2023-05-22 16:04:29', '2023-05-22 16:04:29'),
(177, 'read_profesor', 'profesor', '2023-05-22 16:04:29', '2023-05-22 16:04:29'),
(178, 'edit_profesor', 'profesor', '2023-05-22 16:04:29', '2023-05-22 16:04:29'),
(179, 'add_profesor', 'profesor', '2023-05-22 16:04:29', '2023-05-22 16:04:29'),
(180, 'delete_profesor', 'profesor', '2023-05-22 16:04:29', '2023-05-22 16:04:29'),
(181, 'browse_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(182, 'read_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(183, 'edit_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(184, 'add_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(185, 'delete_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(51, 6),
(52, 1),
(52, 6),
(53, 1),
(53, 6),
(54, 1),
(54, 6),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(131, 6),
(132, 1),
(132, 6),
(133, 1),
(133, 6),
(134, 1),
(134, 6),
(135, 1),
(135, 6),
(136, 1),
(136, 2),
(136, 6),
(137, 1),
(137, 2),
(137, 6),
(138, 1),
(138, 6),
(139, 1),
(139, 6),
(140, 1),
(141, 1),
(141, 6),
(142, 1),
(142, 6),
(143, 1),
(143, 6),
(144, 1),
(144, 6),
(145, 1),
(145, 6),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_simulaciones`
--

CREATE TABLE `preguntas_simulaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `respuesta_medida` int(11) NOT NULL,
  `respuesta_unidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `escenario_id` bigint(20) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescripciones_medicas`
--

CREATE TABLE `prescripciones_medicas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unidad_medida_id` bigint(20) NOT NULL,
  `medicamento_id` bigint(20) NOT NULL,
  `historia_clinica_id` bigint(20) NOT NULL,
  `medico_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pruebas`
--

CREATE TABLE `pruebas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `description`) VALUES
(1, 'admin', 'Administrador', '2023-01-28 09:13:25', '2023-01-29 18:48:27', NULL),
(2, 'student', 'Estudiante', '2023-01-28 09:13:25', '2023-01-29 19:04:29', NULL),
(3, 'doctor', 'Médico', '2023-01-29 19:00:08', '2023-01-29 19:03:17', NULL),
(4, 'patient', 'Paciente', '2023-01-29 19:00:48', '2023-01-29 19:03:52', NULL),
(5, 'nurse', 'Enfermero', '2023-01-29 19:01:09', '2023-01-29 23:10:45', 'Profesional de enfermeria'),
(6, 'teacher', 'Profesor', '2023-01-29 19:01:35', '2023-01-29 19:04:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'sofmedip', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Administración de Medicamentos en Pediatría', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\March2023\\NUOlBF5hplMeiVpFjku9.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'sofmedip', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Administración de Medicamentos en Pediatría', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\March2023\\r6jx8EIdOmehfbAbk3ej.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `simulaciones`
--

CREATE TABLE `simulaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `respuesta_medida` varchar(255) DEFAULT NULL,
  `respuesta_unidad` int(11) DEFAULT NULL,
  `nota` float DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `profesor_id` int(11) DEFAULT NULL,
  `prueba_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'TI', 'Tarjeta de Identidad', NULL, NULL),
(2, 'CC', 'Cédula de Ciudadanía', NULL, NULL),
(3, 'RC', 'Registro Civil de Nacimiento', NULL, NULL),
(4, 'CE', 'Cédula de Extranjería', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-01-28 09:14:11', '2023-01-28 09:14:11'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-01-28 09:14:11', '2023-01-28 09:14:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medidas`
--

CREATE TABLE `unidades_medidas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidades_medidas`
--

INSERT INTO `unidades_medidas` (`id`, `nombre`, `descripcion`) VALUES
(1, 'mg', 'Miligramos'),
(2, 'ml', 'Mililitros'),
(3, 'gr', 'Gramos'),
(4, 'meq', 'Miliequivalentes'),
(5, 'mcg', 'Microgramos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `surname` varchar(255) NOT NULL,
  `identification` varchar(255) NOT NULL,
  `tipo_documento` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `surname`, `identification`, `tipo_documento`) VALUES
(1, 'Admin', 'admin@admin.com', 'users\\March2023\\24iz5EFiYzcaxiMYwirj.png', NULL, '$2y$10$Nn1Om.H24Pk9IO0RA9jMYed.qBeymevgcZ2t0UTzixH6llogLlz/a', 'xCkJoaWC7ghZy11S82ax3JhssL30jIxTjba9yUW29iS0Vv9DKT6BpPadrhWH', '{\"locale\":\"es\"}', '2023-01-28 09:14:11', '2023-03-10 16:20:31', 'Admin', '1', 2),
(4, 'Candido', 'candido@gmail.com', 'users/January2023/IBXx1ZgxszXPOLowJy7M.png', NULL, '$2y$10$OdTZfAeqUFcpaGQ9bAbSi.CLIkrfYjwubANo.5QOGRl3oWJ87F5hq', NULL, '{\"locale\":\"es\"}', '2023-01-30 20:03:21', '2023-03-15 14:22:43', 'Moreno', '333', 2),
(6, 'Bruno', 'bruno@gmail.com', 'users/January2023/neMfwNlrZAAOFtNyhiCY.png', NULL, '$2y$10$Cpr89S.C3O1Iv.K47pVSAez55Vwt6tz2/rMcZAlI67kCP9rA8p.Wm', NULL, '{\"locale\":\"es\"}', '2023-01-30 21:17:47', '2023-01-31 17:18:03', 'Roncancio', '111', 3),
(7, 'Sebastian', 'sebastian@gmail.com', 'users/default.png', NULL, '$2y$10$Bzzk0NVCxATaI1Dwxlt4geKRBlzCHFH8/rAA/bDbB.IpbvbPpE0OO', NULL, '{\"locale\":\"es\"}', '2023-01-31 20:49:43', '2023-01-31 17:17:53', 'Mosquera', '222', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(4, 2),
(6, 4),
(7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `via_medicamentos_dispositivos`
--

CREATE TABLE `via_medicamentos_dispositivos` (
  `id` int(10) UNSIGNED NOT NULL,
  `via_suministro_id` int(11) DEFAULT NULL,
  `dispositivo_id` int(11) DEFAULT NULL,
  `prescripcion_medica_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `via_suministros`
--

CREATE TABLE `via_suministros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `via_suministros`
--

INSERT INTO `via_suministros` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Oral', NULL, '2023-01-31 23:42:45', '2023-01-31 23:42:45'),
(2, 'Endovenosa', NULL, '2023-01-31 23:42:56', '2023-01-31 23:42:56'),
(3, 'Intradérmica', NULL, '2023-01-31 23:43:13', '2023-01-31 23:43:13'),
(4, 'Intramuscular', NULL, '2023-01-31 23:43:22', '2023-01-31 23:43:22'),
(5, 'Inhalatoria', NULL, '2023-01-31 23:43:32', '2023-01-31 23:43:32'),
(6, 'Local', NULL, '2023-01-31 23:43:44', '2023-01-31 23:43:44');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calificaciones_pregunta_id_index` (`pregunta_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `componentes_nombre_unique` (`nombre`);

--
-- Indices de la tabla `componentes_medicamentos`
--
ALTER TABLE `componentes_medicamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `componentes_medicamentos_unidad_medida_id_index` (`unidad_medida_id`),
  ADD KEY `componentes_medicamentos_componente_id_index` (`componente_id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `dispositivos_medicos`
--
ALTER TABLE `dispositivos_medicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dispositivos_medicos_nombre_unique` (`nombre`);

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enfermedades_nombre_unique` (`nombre`);

--
-- Indices de la tabla `escenarios_simulaciones`
--
ALTER TABLE `escenarios_simulaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `escenarios_simulaciones_nombre_unique` (`nombre`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estudiantes_codigo_estudiante_unique` (`codigo_estudiante`),
  ADD KEY `estudiantes_usuario_id_index` (`usuario_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historias_clinicas_enfermedad_id_index` (`enfermedad_id`),
  ADD KEY `historias_clinicas_medico_id_index` (`medico_id`),
  ADD KEY `historias_clinicas_paciente_id_index` (`paciente_id`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medicamentos_nombre_unique` (`nombre`);

--
-- Indices de la tabla `medicamentos_componentes`
--
ALTER TABLE `medicamentos_componentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conect_meds_comps_medicamento_id_index` (`medicamento_id`),
  ADD KEY `conect_meds_comps_componente_medicamento_id_index` (`componente_medicamento_id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `medicos_registro_medico_unique` (`registro_medico`),
  ADD KEY `medicos_usuario_id_index` (`usuario_id`);

--
-- Indices de la tabla `mensajes_simulaciones`
--
ALTER TABLE `mensajes_simulaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mensajes_simulaciones_escenario_id_index` (`escenario_id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pacientes_usuario_id_index` (`usuario_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `preguntas_simulaciones`
--
ALTER TABLE `preguntas_simulaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preguntas_simulaciones_escenario_id_index` (`escenario_id`),
  ADD KEY `preguntas_simulaciones_nivel_id_index` (`nivel_id`),
  ADD KEY `preguntas_simulaciones_categoria_id_index` (`categoria_id`);

--
-- Indices de la tabla `prescripciones_medicas`
--
ALTER TABLE `prescripciones_medicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescripciones_medicas_unidad_medida_id_index` (`unidad_medida_id`),
  ADD KEY `prescripciones_medicas_medicamento_id_index` (`medicamento_id`),
  ADD KEY `prescripciones_medicas_historia_clinica_id_index` (`historia_clinica_id`),
  ADD KEY `prescripciones_medicas_medico_id_index` (`medico_id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pruebas`
--
ALTER TABLE `pruebas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `simulaciones`
--
ALTER TABLE `simulaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simulaciones_respuesta_unidad_index` (`respuesta_unidad`),
  ADD KEY `simulaciones_pregunta_id_index` (`pregunta_id`),
  ADD KEY `simulaciones_estudiante_id_index` (`estudiante_id`),
  ADD KEY `simulaciones_profesor_id_index` (`profesor_id`),
  ADD KEY `simulaciones_prueba_id_index` (`prueba_id`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `unidades_medidas`
--
ALTER TABLE `unidades_medidas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unidades_medidas_nombre_unique` (`nombre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_identification_unique` (`identification`),
  ADD KEY `tipo_documento` (`tipo_documento`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indices de la tabla `via_medicamentos_dispositivos`
--
ALTER TABLE `via_medicamentos_dispositivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `via_medicamentos_dispositivos_via_suministro_id_index` (`via_suministro_id`),
  ADD KEY `via_medicamentos_dispositivos_dispositivo_id_index` (`dispositivo_id`),
  ADD KEY `via_medicamentos_dispositivos_prescripcion_medica_id_index` (`prescripcion_medica_id`);

--
-- Indices de la tabla `via_suministros`
--
ALTER TABLE `via_suministros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `via_suministros_nombre_unique` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `componentes_medicamentos`
--
ALTER TABLE `componentes_medicamentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `dispositivos_medicos`
--
ALTER TABLE `dispositivos_medicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `escenarios_simulaciones`
--
ALTER TABLE `escenarios_simulaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `medicamentos_componentes`
--
ALTER TABLE `medicamentos_componentes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mensajes_simulaciones`
--
ALTER TABLE `mensajes_simulaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas_simulaciones`
--
ALTER TABLE `preguntas_simulaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prescripciones_medicas`
--
ALTER TABLE `prescripciones_medicas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pruebas`
--
ALTER TABLE `pruebas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `simulaciones`
--
ALTER TABLE `simulaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `unidades_medidas`
--
ALTER TABLE `unidades_medidas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `via_medicamentos_dispositivos`
--
ALTER TABLE `via_medicamentos_dispositivos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `via_suministros`
--
ALTER TABLE `via_suministros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
