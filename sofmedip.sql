-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-11-2023 a las 12:34:16
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
-- Base de datos: `sofmedip`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nota` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `tiempo_inicial` time DEFAULT '00:00:00',
  `tiempo_final` time DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campos`
--

CREATE TABLE `campos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campos`
--

INSERT INTO `campos` (`id`, `nombre`, `descripcion`, `categoria_id`) VALUES
(1, 'Nombre', NULL, 2),
(2, 'Calibre aguja', NULL, 2),
(3, 'Vía de aplicación', NULL, 2);

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
(1, 'Pediatría', NULL),
(2, 'Vacunación', NULL);

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
(3, 1, 'email', 'text', 'Correo electrónico', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:users\",\"messages\":{\"required\":\"El campo Correo Eletr\\u00f3nico es requerido\",\"unique\":\"El campo Correo Eletr\\u00f3nico debe ser unico\"}}}', 5),
(4, 1, 'password', 'password', 'Contraseña', 1, 0, 0, 1, 1, 0, '{}', 9),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 10),
(6, 1, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 11),
(7, 1, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 12),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 13),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 14),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Nombre Identificación', 1, 0, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Nombre es obligatorio.\"}}}', 2),
(18, 3, 'created_at', 'timestamp', 'Creado', 0, 0, 0, 0, 0, 0, '{}', 4),
(19, 3, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 5),
(20, 3, 'display_name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Nombre para mostrar es obligatorio.\"}}}', 3),
(56, 1, 'email_verified_at', 'timestamp', 'Verificado', 0, 0, 1, 1, 1, 1, '{}', 8),
(60, 3, 'description', 'text', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 6),
(61, 1, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Nombre es requerido\"}}}', 6),
(62, 1, 'surname', 'text', 'Apellido', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Apellido es requerido\"}}}', 7),
(63, 1, 'identification', 'text', 'Identificación', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:users\",\"messages\":{\"required\":\"El campo Identificaci\\u00f3n es requerido\",\"unique\":\"El campo Identificaci\\u00f3n debe ser unico\"}}}', 4),
(65, 1, 'tipo_documento', 'select_dropdown', 'Tipo Documento', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Tipo Documento es requerido\"}}}', 3),
(69, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(70, 8, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo nombre es requerido\"}}}', 2),
(71, 8, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
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
(91, 10, 'medico_belongsto_user_relationship', 'relationship', 'Usuario', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"usuario_id\",\"key\":\"id\",\"label\":\"identification\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(92, 10, 'usuario_id', 'text', 'Usuario Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(93, 11, 'paciente_belongsto_user_relationship', 'relationship', 'Usuario', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"usuario_id\",\"key\":\"id\",\"label\":\"identification\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(94, 11, 'usuario_id', 'text', 'Usuario Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(95, 11, 'fecha_nacimiento', 'date', 'Fecha Nacimiento', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|date|date_format:Y-m-d|before:tomorrow\",\"messages\":{\"required\":\"El campo Fecha Nacimiento es requerido\",\"date\":\"El campo Fecha Nacimiento debe ser de tipo fecha\",\"date_format\":\"El campo Fecha Nacimiento debe tener el formato: a\\u00f1o-mes-dia\",\"before\":\"El campo Fecha Nacimiento no debe ser mayor a hoy\"}}}', 3),
(96, 1, 'user_belongsto_tipo_documento_relationship', 'relationship', 'Tipo documento', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\TipoDocumento\",\"table\":\"tipo_documentos\",\"type\":\"belongsTo\",\"column\":\"tipo_documento\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(113, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 1, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 15),
(141, 8, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 4),
(142, 8, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 5),
(173, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(174, 32, 'cantidad', 'number', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 2),
(175, 32, 'unidad_medida_id', 'text', 'Unidad Medida Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(176, 32, 'componente_id', 'text', 'Componente Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(177, 32, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(178, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(179, 32, 'componentes_medicamento_belongsto_unidades_medida_relationship', 'relationship', 'unidades_medidas', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\UnidadMedida\",\"table\":\"unidades_medidas\",\"type\":\"belongsTo\",\"column\":\"unidad_medida_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"Componentes_medicamentos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(180, 32, 'componentes_medicamento_belongsto_componente_relationship', 'relationship', 'componentes', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Componente\",\"table\":\"componentes\",\"type\":\"belongsTo\",\"column\":\"componente_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"Componentes_medicamentos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(189, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(190, 34, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo nombre es requerido\"}}}', 2),
(191, 34, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(192, 34, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"image|mimes:jpg,jpeg,png\",\"messages\":{\"mimes\":\"La imagen tiene formato incorrecto\"}}}', 4),
(193, 34, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 5),
(194, 34, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 6),
(195, 35, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(196, 35, 'mensaje', 'text', 'Mensaje', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Mensaje es requerido\"}}}', 4),
(197, 35, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 7),
(200, 35, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 8),
(201, 35, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 9),
(202, 35, 'escenario_id', 'text', 'Escenario Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Escenario es requerido\"}}}', 3),
(204, 35, 'mensajes_simulacione_belongsto_escenarios_simulacione_relationship', 'relationship', 'Escenario de Simulación', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\EscenarioSimulacion\",\"table\":\"escenarios_simulaciones\",\"type\":\"belongsTo\",\"column\":\"escenario_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(205, 34, 'escenarios_simulacione_hasmany_mensajes_simulacione_relationship', 'relationship', 'mensajes_simulaciones', 0, 0, 1, 0, 0, 0, '{\"model\":\"\\\\App\\\\Models\\\\MensajeSimulacion\",\"table\":\"mensajes_simulaciones\",\"type\":\"hasMany\",\"column\":\"escenario_id\",\"key\":\"id\",\"label\":\"mensaje\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(206, 34, 'escenarios_simulacione_hasmany_preguntas_simulacione_relationship', 'relationship', 'preguntas_simulaciones', 0, 0, 1, 0, 0, 0, '{\"model\":\"\\\\App\\\\Models\\\\PreguntaSimulacion\",\"table\":\"preguntas_simulaciones\",\"type\":\"hasMany\",\"column\":\"escenario_id\",\"key\":\"id\",\"label\":\"pregunta\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(208, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(209, 36, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:niveles\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(210, 36, 'descripcion', 'text_area', 'Descripción', 0, 0, 1, 1, 1, 1, '{}', 6),
(211, 37, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(212, 37, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:categorias\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(213, 37, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(219, 39, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(222, 39, 'nota', 'number', 'Nota', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:5\",\"messages\":{\"required\":\"El campo Nota es requerido\",\"numeric\":\"El campo Nota debe ser un numero\",\"min\":\"El campo Nota es minimo :min\",\"max\":\"El campo Nota es maximo :max\"}}}', 4),
(223, 35, 'posicion_horizontal', 'text', 'Posición Horizontal', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:100\",\"messages\":{\"required\":\"El campo Posici\\u00f3n Horizontal es requerido\",\"numeric\":\"El campo Posici\\u00f3n Horizontal debe ser un numero\",\"min\":\"El campo Posici\\u00f3n Horizontal es minimo :min\",\"max\":\"El campo Posici\\u00f3n Horizontal es maximo :max\"}}}', 5),
(224, 35, 'posicion_vertical', 'text', 'Posición Vertical', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:100\",\"messages\":{\"required\":\"El campo Posici\\u00f3n Vertical es requerido\",\"numeric\":\"El campo Posici\\u00f3n Vertical debe ser un numero\",\"min\":\"El campo Posici\\u00f3n Vertical es minimo :min\",\"max\":\"El campo Posici\\u00f3n Vertical es maximo :max\"}}}', 6),
(225, 39, 'calificacione_belongsto_calificacione_relationship', 'relationship', 'Pregunta', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\PreguntaSimulacion\",\"table\":\"preguntas_simulaciones\",\"type\":\"belongsTo\",\"column\":\"pregunta_id\",\"key\":\"id\",\"label\":\"pregunta\",\"pivot_table\":\"preguntas_simulaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(226, 39, 'pregunta_id', 'text', 'Pregunta Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(231, 45, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(234, 45, 'nota', 'number', 'Nota', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:5\",\"messages\":{\"required\":\"El campo Nota es requerido\",\"numeric\":\"El campo Nota debe ser un numero\",\"min\":\"El campo Nota es minimo :min\",\"max\":\"El campo Nota es maximo :max\"}}}', 4),
(235, 45, 'pregunta_id', 'text', 'Pregunta Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(236, 45, 'estudiante_id', 'text', 'Estudiante Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(239, 45, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 0, 0, 0, '{}', 10),
(240, 45, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 1, 0, 0, 0, '{}', 11),
(241, 45, 'simulacione_belongsto_preguntas_simulacione_relationship', 'relationship', 'Preguntas', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\PreguntaSimulacion\",\"table\":\"preguntas_simulaciones\",\"type\":\"belongsTo\",\"column\":\"pregunta_id\",\"key\":\"id\",\"label\":\"pregunta\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(242, 45, 'simulacione_belongsto_estudiante_relationship', 'relationship', 'Estudiantes', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Estudiante\",\"table\":\"estudiantes\",\"type\":\"belongsTo\",\"column\":\"estudiante_id\",\"key\":\"id\",\"label\":\"codigo_estudiante\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(250, 36, 'color', 'color', 'Color', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Color es requerido\"}}}', 5),
(251, 45, 'tiempo', 'number', 'Tiempo (seg)', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|min:0\",\"messages\":{\"required\":\"El campo Tiempo es requerido\",\"min\":\"El campo Tiempo es minimo 0\"}}}', 5),
(252, 39, 'tiempo_inicial', 'time', 'Tiempo Inicial', 0, 1, 1, 1, 1, 1, '{\"format\":\"%h:%i:%s\"}', 2),
(253, 39, 'tiempo_final', 'time', 'Tiempo Final', 0, 1, 1, 1, 1, 1, '{}', 3),
(273, 52, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(274, 52, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:via_aplicaciones\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(275, 52, 'abreviatura', 'text', 'Abreviatura', 1, 1, 1, 1, 1, 1, '{}', 3),
(276, 52, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 4),
(284, 55, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(285, 55, 'valor', 'text', 'Valor', 0, 1, 1, 1, 1, 1, '{}', 2),
(286, 55, 'recurso_id', 'text', 'Recurso Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(287, 55, 'simulacion_id', 'text', 'Simulación Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(288, 55, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 1, 0, 1, '{}', 7),
(289, 55, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 8),
(292, 55, 'respuesta_simulacione_belongsto_recurso_relationship', 'relationship', 'Recurso', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Recurso\",\"table\":\"recursos\",\"type\":\"belongsTo\",\"column\":\"recurso_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(293, 55, 'respuesta_simulacione_belongsto_simulacione_relationship', 'relationship', 'Simulación', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Simulacion\",\"table\":\"simulaciones\",\"type\":\"belongsTo\",\"column\":\"simulacion_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(294, 56, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(295, 56, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:examenes\",\"messages\":{\"required\":\"El campo Nombre es requerido\",\"unique\":\"El campo Nombre debe ser unico\"}}}', 2),
(296, 56, 'descripcion', 'text_area', 'Descripción', 0, 0, 1, 1, 1, 1, '{}', 3),
(297, 56, 'fecha_inicial', 'timestamp', 'Fecha Inicial', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|date|date_format:d\\/m\\/Y h:i A|before_or_equal:now\",\"messages\":{\"required\":\"El campo Fecha Inicial es requerido\",\"date\":\"El campo Fecha Inicial debe ser fecha\",\"before_or_equal\":\"El campo Fecha Inicial debe ser una fecha anterior o igual a hoy\"}}}', 4),
(298, 56, 'fecha_final', 'timestamp', 'Fecha Final', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|date|date_format:d\\/m\\/Y h:i A|after_or_equal:fecha_inicial\",\"messages\":{\"required\":\"El campo Fecha Final es requerido\",\"date\":\"El campo Fecha Final debe ser fecha\",\"after_or_equal\":\"El campo Fecha Final debe ser una fecha posterior o igual a la fecha inicial\"}}}', 5),
(299, 56, 'estado', 'radio_btn', 'Estado', 1, 1, 1, 1, 1, 1, '{\"default\":\"s\",\"options\":{\"s\":\"Activo\",\"n\":\"Inactivo\"}}', 6),
(300, 56, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 1, 0, 1, '{}', 13),
(301, 56, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 14),
(302, 56, 'examene_hasmany_examen_estudiante_relationship', 'relationship', 'Examen Estudiante', 0, 0, 0, 0, 0, 0, '{\"model\":\"\\\\App\\\\Models\\\\ExamenEstudiante\",\"table\":\"examen_estudiantes\",\"type\":\"hasMany\",\"column\":\"examen_id\",\"key\":\"id\",\"label\":\"examen_id\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(303, 56, 'examene_hasmany_examen_pregunta_relationship', 'relationship', 'Examen Pregunta', 0, 0, 0, 0, 0, 0, '{\"model\":\"\\\\App\\\\Models\\\\ExamenPregunta\",\"table\":\"examen_preguntas\",\"type\":\"hasMany\",\"column\":\"pregunta_id\",\"key\":\"id\",\"label\":\"pregunta_id\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(308, 58, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(309, 58, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(310, 58, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(311, 58, 'annio', 'number', 'Año', 0, 1, 1, 1, 1, 1, '{\"step\":1,\"min\":2023,\"max\":2024,\"default\":2023}', 4),
(319, 56, 'profesor_id', 'text', 'Profesor Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo Profesor es requerido\"}}}', 10),
(332, 61, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(333, 61, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(334, 61, 'descripcion', 'text_area', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(335, 61, 'categoria_id', 'text', 'Categoria Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(336, 61, 'campo_belongsto_categoria_relationship', 'relationship', 'Categoria', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsTo\",\"column\":\"categoria_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(349, 63, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(355, 63, 'created_at', 'timestamp', 'Creado', 0, 0, 1, 1, 0, 1, '{}', 7),
(356, 63, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 8),
(357, 61, 'campo_hasmany_recurso_campo_relationship', 'relationship', 'Recursos', 0, 0, 0, 0, 0, 0, '{\"model\":\"\\\\App\\\\Models\\\\RecursoCampo\",\"table\":\"recurso_campos\",\"type\":\"hasMany\",\"column\":\"campo_id\",\"key\":\"id\",\"label\":\"valor\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(358, 63, 'recurso_hasmany_recurso_campo_relationship', 'relationship', 'Campos', 0, 0, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\RecursoCampo\",\"table\":\"recurso_campos\",\"type\":\"hasMany\",\"column\":\"recurso_id\",\"key\":\"id\",\"label\":\"valor\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(359, 63, 'nombre', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 4),
(360, 64, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(361, 64, 'pregunta', 'text', 'Pregunta', 1, 1, 1, 1, 1, 1, '{}', 2),
(362, 64, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 1, 0, 1, '{}', 3),
(363, 64, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 4),
(364, 64, 'escenario_id', 'text', 'Escenario Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(365, 64, 'nivel_id', 'text', 'Nivel Id', 1, 1, 1, 1, 1, 1, '{}', 8),
(366, 64, 'categoria_id', 'text', 'Categoria Id', 1, 1, 1, 1, 1, 1, '{}', 10),
(367, 64, 'preguntas_simulacione_belongsto_escenarios_simulacione_relationship', 'relationship', 'Escenario', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\EscenarioSimulacion\",\"table\":\"escenarios_simulaciones\",\"type\":\"belongsTo\",\"column\":\"escenario_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(368, 64, 'preguntas_simulacione_belongsto_nivele_relationship', 'relationship', 'Nivel', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Nivel\",\"table\":\"niveles\",\"type\":\"belongsTo\",\"column\":\"nivel_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(369, 64, 'preguntas_simulacione_belongsto_categoria_relationship', 'relationship', 'Categoria', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsTo\",\"column\":\"categoria_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(370, 63, 'recurso_belongsto_categoria_relationship', 'relationship', 'Categoria', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsTo\",\"column\":\"categoria_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(371, 63, 'categoria_id', 'text', 'Categoria Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(372, 64, 'campo_id', 'text', 'Campo Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(373, 64, 'abierta', 'radio_btn', 'Pregunta Abierta', 0, 0, 1, 1, 1, 1, '{\"default\":\"n\",\"options\":{\"s\":\"Si\",\"n\":\"No\"}}', 9),
(374, 56, 'duracion', 'number', 'Duración (seg)', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|min:0\",\"messages\":{\"required\":\"El campo Duraci\\u00f3n es requerido\",\"min\":\"El campo Duraci\\u00f3n es minimo 0\"}}}', 12),
(375, 45, 'campo_id', 'text', 'Campo Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(376, 45, 'simulacione_belongsto_campo_relationship', 'relationship', 'Tipo', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Campo\",\"table\":\"campos\",\"type\":\"belongsTo\",\"column\":\"campo_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(377, 36, 'nivele_belongsto_categoria_relationship', 'relationship', 'Categoria', 1, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsTo\",\"column\":\"categoria_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(378, 36, 'categoria_id', 'text', 'Categoria Id', 1, 1, 1, 1, 1, 1, '{}', 8),
(379, 64, 'preguntas_simulacione_belongsto_campo_relationship', 'relationship', 'campos', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Campo\",\"table\":\"campos\",\"type\":\"belongsTo\",\"column\":\"campo_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":null}', 11),
(380, 56, 'examene_belongsto_profesore_relationship', 'relationship', 'Profesor', 0, 1, 1, 1, 1, 1, '{\"model\":\"\\\\App\\\\Models\\\\Profesor\",\"table\":\"profesores\",\"type\":\"belongsTo\",\"column\":\"profesor_id\",\"key\":\"id\",\"label\":\"usuario_id\",\"pivot_table\":\"calificaciones\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(382, 36, 'tiempo_maximo', 'number', 'Tiempo Maximo (seg)', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0\",\"messages\":{\"required\":\"El campo Tiempo M\\u00e1ximo es requerido\",\"numeric\":\"El campo Tiempo M\\u00e1ximo debe ser un numero\",\"min\":\"El campo Tiempo M\\u00e1ximo es minimo :min\"}}}', 3),
(383, 36, 'multiplicador', 'number', 'Multiplicador', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0\",\"messages\":{\"required\":\"El campo Multiplicador es requerido\",\"numeric\":\"El campo Multiplicador debe ser un numero\",\"min\":\"El campo Multiplicador es minimo :min\"}}}', 4),
(384, 45, 'examen_id', 'text', 'Examen Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(385, 56, 'n_pregunta', 'text', 'N Pregunta', 1, 1, 1, 1, 1, 1, '{}', 9);

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
(1, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '\\App\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":\"identification\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-28 09:13:25', '2023-08-23 18:10:40'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-01-28 09:13:25', '2023-01-28 09:13:25'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-28 09:13:25', '2023-11-17 14:24:59'),
(8, 'tipo_documentos', 'tipo-documentos', 'Tipo Documento', 'Tipo Documentos', 'voyager-categories', 'App\\Models\\TipoDocumento', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-30 23:16:47', '2023-01-31 23:38:10'),
(10, 'medicos', 'medicos', 'Medico', 'Medicos', 'fa fa-user-md', 'App\\Models\\Medico', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 16:26:02', '2023-01-31 17:19:04'),
(11, 'pacientes', 'pacientes', 'Paciente', 'Pacientes', NULL, 'App\\Models\\Paciente', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-01-31 16:42:40', '2023-01-31 17:14:54'),
(32, 'Componentes_medicamentos', 'componentes-medicamentos', 'Componente Medicamento', 'Componentes Medicamentos', 'voyager-rum-1', 'App\\Models\\ComponenteMedicamento', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-02 18:56:21', '2023-02-02 18:58:08'),
(34, 'escenarios_simulaciones', 'escenarios-simulaciones', 'Escenario de Simulación', 'Escenarios de Simulaciones', 'voyager-tv', 'App\\Models\\EscenarioSimulacion', NULL, '\\App\\Http\\Controllers\\EscenarioSimulacionController', NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":\"nombre\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-02 23:46:49', '2023-06-23 09:00:14'),
(35, 'mensajes_simulaciones', 'mensajes-simulaciones', 'Mensaje Simulación', 'Mensajes Simulaciones', 'voyager-receipt', 'App\\Models\\MensajeSimulacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-02 23:50:46', '2023-11-17 14:23:30'),
(36, 'niveles', 'niveles', 'Nivel', 'Niveles', 'voyager-paint-bucket', 'App\\Models\\Nivel', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":\"nombre\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-04-12 03:09:15', '2023-11-19 15:22:56'),
(37, 'categorias', 'categorias', 'Categoria', 'Categorias', 'voyager-categories', 'App\\Models\\Categoria', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-04-12 03:18:14', '2023-04-12 14:18:41'),
(39, 'calificaciones', 'calificaciones', 'Calificación', 'Calificaciones', 'voyager-certificate', 'App\\Models\\Calificacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nota\",\"order_display_column\":\"nota\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2023-05-20 14:19:20', '2023-11-17 13:18:23'),
(45, 'simulaciones', 'simulaciones', 'Simulacion', 'Simulaciones', NULL, 'App\\Models\\Simulacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-05-22 16:16:11', '2023-11-17 13:54:23'),
(52, 'via_aplicaciones', 'via-aplicaciones', 'Vía Aplicación', 'Via Aplicaciones', 'voyager-brush', 'App\\Models\\ViaAplicacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"nombre\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-01 22:08:31', '2023-07-28 18:47:45'),
(55, 'respuesta_simulaciones', 'respuesta-simulaciones', 'Respuesta Simulación', 'Respuesta Simulaciones', 'voyager-list', 'App\\Models\\RespuestaSimulacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-01 23:11:37', '2023-11-17 14:24:37'),
(56, 'examenes', 'examenes', 'Examen', 'Examenes', 'voyager-edit', 'App\\Models\\Examen', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"created_at\",\"order_display_column\":\"created_at\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-01 23:28:11', '2023-11-17 21:59:50'),
(58, 'grupos', 'grupos', 'Grupo', 'Grupos', 'voyager-group', 'App\\Models\\Grupo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-01 23:51:32', '2023-11-17 14:23:04'),
(61, 'campos', 'campos', 'Campo', 'Campos', 'voyager-milestone', 'App\\Models\\Campo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"nombre\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-02 13:41:33', '2023-07-25 18:02:41'),
(63, 'recursos', 'recursos', 'Recurso', 'Recursos', 'voyager-tree', 'App\\Models\\Recurso', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"nombre\",\"order_display_column\":\"nombre\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-02 15:41:21', '2023-06-23 10:53:53'),
(64, 'preguntas_simulaciones', 'preguntas-simulaciones', 'Preguntas Simulación', 'Preguntas Simulaciones', 'voyager-hook', 'App\\Models\\PreguntaSimulacion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"pregunta\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-06-02 17:20:37', '2023-06-25 22:49:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escenarios_simulaciones`
--

CREATE TABLE `escenarios_simulaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `escenarios_simulaciones`
--

INSERT INTO `escenarios_simulaciones` (`id`, `nombre`, `descripcion`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Caso 1', 'Niño de 4 meses de edad asiste al consultorio de vacunación, se revisa el carné encontrando que tiene las primeras dosis de vacuna que fueron aplicadas a los 2 meses de edad.', 'escenarios-simulaciones\\July2023\\OS4RoqajPP6yYdNa4tAM.jpeg', '2023-02-03 12:01:38', '2023-07-17 01:50:23'),
(2, 'Caso 2', 'Niño de 12 meses de edad asiste al consultorio de vacunación, se revisa el carné encontrando que tiene el esquema regular completo para hasta los seis meses.', 'escenarios-simulaciones\\July2023\\Nm6FHy78AB3OYcWihZBR.jpeg', '2023-02-03 12:02:32', '2023-07-17 01:50:39'),
(3, 'Caso 3', 'Niño de 6 años de edad asiste al consultorio de vacunación, se revisa el carné encontrando que no le han aplicado ninguna vacuna.', 'escenarios-simulaciones\\July2023\\CTAFwYfjk7n3lrOC3wRH.jpeg', '2023-02-03 12:02:51', '2023-07-17 01:50:55'),
(23, 'Caso 4', 'Niña de 5 años de edad con esquema regular completo hasta 18 meses de edad, asiste a programa de vacunación. ¿Qué vacunas le corresponde administrar a la menor?', 'escenarios-simulaciones\\July2023\\uVCy8nXni5grGfN1j6U8.jpeg', '2023-05-31 16:47:18', '2023-08-18 18:43:11'),
(24, 'Caso 5', 'Rosita tiene 6 meses de edad, asiste al consultorio de vacunación, al revisar el carné tiene registrada vacuna BCG, Hepatitis B, dos dosis de Rotavirus, dos dosis de Neumococo, dos dosis de Pentavalente, dos dosis de Polio IM. ¿Qué vacunas se le deben administrar?', 'escenarios-simulaciones\\August2023\\7QgkVNWTPWPW72jGAdD3.jpeg', '2023-08-18 18:43:36', '2023-08-18 18:43:36'),
(25, 'Caso 6', 'Llega a consultorio de vacunación Esteban de 6 años de edad en compañía de la madre, quien refiere `”no le he colocado las vacunas de los 5 años”. Según la edad del menor que le corresponde administrar, ¿Qué vacunas se le deben administrar?', 'escenarios-simulaciones\\August2023\\QMvglrifSWU64YS4XLrK.jpeg', '2023-08-18 18:43:55', '2023-08-18 18:43:55'),
(26, 'Caso 7', 'Florecita es una niña de 16 meses de edad quien a la valoración por el profesional de enfermería se evidencia el siguiente esquema de vacunación: 1 dosis de BCG, 2 dosis de Neumococo, 2 dosis de Pentavalente, 2 dosis de Rotavirus, 1 dosis de Hepatitis b, 2 dosis de Pentavalente. ¿Con qué vacunas se le completa el esquema?', 'escenarios-simulaciones\\August2023\\o5JkcZp2U8EQ1lMqBIkT.jpeg', '2023-08-18 18:44:23', '2023-08-18 18:44:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo_estudiante` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `estado` char(1) DEFAULT 'a'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `codigo_estudiante`, `created_at`, `updated_at`, `usuario_id`, `grupo_id`, `estado`) VALUES
(4, 160001001, '2023-08-18 19:59:34', '2023-08-18 19:59:34', 11, 1, 'a'),
(5, 160001002, '2023-08-18 20:11:16', '2023-08-18 20:11:16', 13, 1, 'a'),
(6, 160001003, '2023-08-18 20:11:42', '2023-08-18 20:11:42', 10, 1, 'a'),
(7, 160001004, '2023-08-18 20:12:03', '2023-08-18 20:12:03', 12, 1, 'a'),
(9, 115604534, '2023-11-26 16:21:21', '2023-11-26 21:27:06', 16, 2, 'a'),
(10, 500004223, '2023-11-27 02:22:54', '2023-11-27 02:22:54', 18, 1, 'a'),
(11, 2, '2023-11-27 11:32:29', '2023-11-27 11:32:29', 19, 2, 'a'),
(12, 1, '2023-11-27 11:32:29', '2023-11-27 11:32:29', 20, 1, 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicial` timestamp NULL DEFAULT NULL,
  `fecha_final` timestamp NULL DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 's',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profesor_id` int(11) NOT NULL,
  `n_pregunta` int(11) NOT NULL,
  `grupo` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `examenes`
--

INSERT INTO `examenes` (`id`, `nombre`, `descripcion`, `fecha_inicial`, `fecha_final`, `estado`, `created_at`, `updated_at`, `profesor_id`, `n_pregunta`, `grupo`) VALUES
(12, 'Prueba 1', NULL, '2023-11-19 15:16:00', '2023-11-19 16:58:00', 'f', '2023-11-19 15:17:19', '2023-11-19 17:12:30', 3, 10, 0),
(13, 'Examen Grupo A', NULL, '2023-11-26 21:24:00', '2023-11-28 21:24:00', 's', '2023-11-26 21:25:01', '2023-11-26 21:25:01', 3, 2, 1),
(14, 'Examen Grupo B', NULL, '2023-11-26 21:25:00', '2023-11-28 21:25:00', 's', '2023-11-26 21:25:25', '2023-11-26 21:25:25', 3, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_estudiantes`
--

CREATE TABLE `examen_estudiantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `nota` double DEFAULT NULL,
  `tiempo` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `examen_estudiantes`
--

INSERT INTO `examen_estudiantes` (`id`, `examen_id`, `estudiante_id`, `nota`, `tiempo`, `created_at`, `updated_at`) VALUES
(5, 12, 4, 1, 67, '2023-11-19 17:12:30', '2023-11-19 17:12:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_preguntas`
--

CREATE TABLE `examen_preguntas` (
  `id` int(10) UNSIGNED NOT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `examen_preguntas`
--

INSERT INTO `examen_preguntas` (`id`, `examen_id`, `pregunta_id`, `created_at`, `updated_at`) VALUES
(16, 5, 56, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(17, 5, 63, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(18, 5, 51, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(19, 5, 54, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(20, 5, 57, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(21, 5, 52, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(22, 5, 55, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(23, 5, 58, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(24, 5, 50, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(25, 5, 53, '2023-08-18 23:12:37', '2023-08-18 23:12:37'),
(26, 6, 56, '2023-08-21 15:10:35', '2023-08-21 15:10:35'),
(27, 6, 63, '2023-08-21 15:10:35', '2023-08-21 15:10:35'),
(28, 6, 54, '2023-08-21 15:10:35', '2023-08-21 15:10:35'),
(29, 6, 57, '2023-08-21 15:10:35', '2023-08-21 15:10:35'),
(30, 6, 52, '2023-08-21 15:10:35', '2023-08-21 15:10:35'),
(31, 6, 55, '2023-08-21 15:10:35', '2023-08-21 15:10:35'),
(32, 11, 56, '2023-08-23 14:03:25', '2023-08-23 14:03:25'),
(33, 11, 63, '2023-08-23 14:03:25', '2023-08-23 14:03:25'),
(34, 11, 51, '2023-08-23 14:03:25', '2023-08-23 14:03:25'),
(35, 11, 54, '2023-08-23 14:03:25', '2023-08-23 14:03:25'),
(36, 12, 63, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(37, 12, 60, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(38, 12, 61, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(39, 12, 62, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(40, 12, 51, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(41, 12, 54, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(42, 12, 52, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(43, 12, 55, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(44, 12, 50, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(45, 12, 53, '2023-11-19 15:17:19', '2023-11-19 15:17:19'),
(46, 13, 56, '2023-11-26 21:25:01', '2023-11-26 21:25:01'),
(47, 13, 63, '2023-11-26 21:25:01', '2023-11-26 21:25:01'),
(48, 13, 51, '2023-11-26 21:25:01', '2023-11-26 21:25:01'),
(49, 14, 63, '2023-11-26 21:25:25', '2023-11-26 21:25:25'),
(50, 14, 51, '2023-11-26 21:25:25', '2023-11-26 21:25:25'),
(51, 14, 54, '2023-11-26 21:25:25', '2023-11-26 21:25:25');

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
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `annio` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id`, `nombre`, `descripcion`, `annio`) VALUES
(1, 'Grupo A', NULL, '2023'),
(2, 'Grupo B', NULL, '2023');

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
(1, 'admin', '2023-01-28 09:13:25', '2023-02-28 16:25:16'),
(4, 'profesor', '2023-08-22 23:15:51', '2023-08-22 23:15:51'),
(5, 'estudiante', '2023-08-22 23:16:02', '2023-08-22 23:16:02');

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
(3, 1, 'Usuarios', '', '_self', 'voyager-person', '#000000', 18, 1, '2023-01-28 09:13:25', '2023-07-08 00:37:51', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 18, 4, '2023-01-28 09:13:25', '2023-08-18 23:01:17', 'voyager.roles.index', NULL),
(5, 1, 'Herramientas', '', '_self', 'voyager-tools', '#000000', NULL, 9, '2023-01-28 09:13:25', '2023-08-23 15:51:16', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 3, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 4, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 5, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.bread.index', NULL),
(10, 1, 'Ajustes', '', '_self', 'voyager-settings', '#000000', 5, 6, '2023-01-28 09:13:25', '2023-05-22 16:51:55', 'voyager.settings.index', 'null'),
(15, 1, 'Tipo Documentos', '', '_self', 'voyager-categories', '#000000', 27, 8, '2023-01-30 23:16:47', '2023-08-22 22:42:44', 'voyager.tipo-documentos.index', 'null'),
(18, 1, 'Usuarios', '', '_self', 'voyager-people', '#000000', NULL, 7, '2023-01-31 16:37:09', '2023-08-23 15:51:16', NULL, ''),
(27, 1, 'Parametros', '', '_self', 'voyager-params', '#000000', NULL, 8, '2023-01-31 21:24:18', '2023-08-23 15:51:16', NULL, ''),
(35, 1, 'Escenarios Simulaciones', '', '_self', 'voyager-play', '#000000', 27, 2, '2023-02-02 23:46:49', '2023-08-22 22:42:44', 'voyager.escenarios-simulaciones.index', 'null'),
(41, 1, 'Niveles', '', '_self', 'voyager-paint-bucket', NULL, 27, 7, '2023-04-12 03:09:15', '2023-08-22 22:42:44', 'voyager.niveles.index', NULL),
(42, 1, 'Categorias', '', '_self', 'voyager-categories', NULL, 27, 3, '2023-04-12 03:18:14', '2023-08-22 22:42:44', 'voyager.categorias.index', NULL),
(43, 1, 'Calificaciones', '', '_self', 'voyager-certificate', NULL, 27, 5, '2023-05-20 14:19:20', '2023-08-22 22:42:44', 'voyager.calificaciones.index', NULL),
(48, 1, 'Simulaciones', '', '_self', 'voyager-fire', '#000000', 27, 1, '2023-05-22 16:16:12', '2023-08-22 22:42:36', 'voyager.simulaciones.index', 'null'),
(54, 1, 'Via Aplicaciones', '', '_self', 'voyager-brush', '#000000', 27, 10, '2023-06-01 22:08:31', '2023-08-22 22:42:44', 'voyager.via-aplicaciones.index', 'null'),
(57, 1, 'Examen', '/examen', '_self', 'voyager-book', '#000000', NULL, 2, '2023-06-01 23:28:11', '2023-08-23 15:40:57', NULL, ''),
(58, 1, 'Grupos', '', '_self', 'voyager-group', NULL, 27, 6, '2023-06-01 23:51:33', '2023-08-22 22:42:44', 'voyager.grupos.index', NULL),
(60, 1, 'Campos', '', '_self', 'voyager-milestone', NULL, 27, 4, '2023-06-02 13:41:33', '2023-08-22 22:42:44', 'voyager.campos.index', NULL),
(63, 1, 'Recursos', '', '_self', 'voyager-tree', '#000000', 27, 9, '2023-06-02 15:41:21', '2023-08-22 22:42:44', 'voyager.recursos.index', 'null'),
(66, 1, 'Vacunación', '/vacunacion', '_self', 'voyager-lab', '#000000', NULL, 6, '2023-07-03 18:42:22', '2023-08-22 22:42:25', NULL, ''),
(67, 1, 'Preguntas', '/preguntas', '_self', 'voyager-question', '#000000', NULL, 4, '2023-07-03 19:03:23', '2023-08-22 22:42:25', NULL, ''),
(69, 1, 'Simulación', '/lab-simulacion', '_self', 'voyager-barbell', '#000000', NULL, 5, '2023-07-16 18:48:17', '2023-08-23 16:13:24', NULL, ''),
(70, 1, 'Estadistica', '', '_self', 'fa fa-line-chart', '#000000', NULL, 3, '2023-07-31 19:40:09', '2023-08-23 15:47:09', NULL, ''),
(72, 1, 'Participación', '/estadistica/intentos', '_self', 'voyager-bar-chart', '#000000', 70, 1, '2023-08-21 01:20:42', '2023-08-21 01:21:44', NULL, ''),
(73, 1, 'Preguntas', '/estadistica/preguntas', '_self', 'voyager-pie-graph', '#000000', 70, 2, '2023-08-21 01:21:15', '2023-08-21 01:21:46', NULL, ''),
(74, 4, 'Examen', '/examen', '_self', 'voyager-book', '#000000', NULL, 1, '2023-08-23 15:41:54', '2023-08-23 15:48:39', NULL, ''),
(75, 5, 'Examen', '/examen', '_self', 'voyager-book', '#000000', NULL, 1, '2023-08-23 15:42:08', '2023-08-23 15:48:54', NULL, ''),
(76, 4, 'Estadistica', '', '_self', 'fa fa-line-chart', '#000000', NULL, 2, '2023-08-23 15:47:25', '2023-08-23 15:48:39', NULL, ''),
(77, 5, 'Estadistica', '', '_self', 'fa fa-line-chart', '#000000', NULL, 2, '2023-08-23 15:47:39', '2023-08-23 15:48:54', NULL, ''),
(78, 4, 'Participación', '/estadistica/intentos', '_self', 'voyager-bar-chart', '#000000', 76, 1, '2023-08-23 15:48:34', '2023-08-23 15:48:39', NULL, ''),
(79, 5, 'Participación', '/estadistica/intentos', '_self', 'voyager-bar-chart', '#000000', 77, 1, '2023-08-23 15:48:51', '2023-08-23 15:48:54', NULL, ''),
(80, 4, 'Preguntas', '/estadistica/preguntas', '_self', 'voyager-pie-graph', '#000000', 76, 2, '2023-08-23 15:49:18', '2023-08-23 15:49:21', NULL, ''),
(81, 5, 'Preguntas', '/estadistica/preguntas', '_self', 'voyager-pie-graph', '#000000', 77, 2, '2023-08-23 15:49:35', '2023-08-23 15:49:38', NULL, ''),
(82, 4, 'Preguntas', '/preguntas', '_self', 'voyager-question', '#000000', NULL, 3, '2023-08-23 15:51:37', '2023-11-26 20:59:52', NULL, ''),
(83, 4, 'Simulación', '/lab-simulacion', '_self', 'voyager-barbell', '#000000', NULL, 5, '2023-08-23 15:52:59', '2023-11-26 20:59:52', NULL, ''),
(84, 5, 'Simulación', '/lab-simulacion', '_self', 'voyager-barbell', '#000000', NULL, 12, '2023-08-23 15:53:11', '2023-08-23 16:13:52', NULL, ''),
(85, 4, 'Vacunación', '/vacunacion', '_self', 'voyager-lab', '#000000', NULL, 6, '2023-08-23 15:53:58', '2023-11-26 20:59:52', NULL, ''),
(88, 1, 'Estudiantes', '/estudiantes', '_self', 'voyager-study', '#000000', 18, 3, '2023-11-26 17:04:53', '2023-11-26 20:59:15', NULL, ''),
(89, 1, 'Profesor', '/Profesores', '_self', 'voyager-person', '#000000', 18, 2, '2023-11-26 20:59:09', '2023-11-26 20:59:15', NULL, ''),
(90, 4, 'Estudiantes', '/estudiantes', '_self', 'voyager-study', '#000000', NULL, 4, '2023-11-26 20:59:47', '2023-11-26 20:59:52', NULL, '');

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
  `descripcion` text DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `tiempo_maximo` double DEFAULT 5,
  `multiplicador` double DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `descripcion`, `color`, `categoria_id`, `tiempo_maximo`, `multiplicador`) VALUES
(1, '2', NULL, '#19c844', 2, 60, 1),
(2, '3', NULL, '#ffc800', 2, 40, 2),
(3, '1', NULL, '#ff0000', 2, 20, 3);

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
(126, 'browse_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(127, 'read_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(128, 'edit_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(129, 'add_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
(130, 'delete_Componentes_medicamentos', 'Componentes_medicamentos', '2023-02-02 18:56:21', '2023-02-02 18:56:21'),
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
(181, 'browse_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(182, 'read_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(183, 'edit_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(184, 'add_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(185, 'delete_simulaciones', 'simulaciones', '2023-05-22 16:16:11', '2023-05-22 16:16:11'),
(186, 'browse_vacunacion', 'vacunacion', '2023-05-29 19:18:20', '2023-05-29 19:18:20'),
(187, 'read_vacunacion', 'vacunacion', '2023-05-29 19:18:20', '2023-05-29 19:18:20'),
(188, 'edit_vacunacion', 'vacunacion', '2023-05-29 19:18:20', '2023-05-29 19:18:20'),
(189, 'add_vacunacion', 'vacunacion', '2023-05-29 19:18:20', '2023-05-29 19:18:20'),
(190, 'delete_vacunacion', 'vacunacion', '2023-05-29 19:18:20', '2023-05-29 19:18:20'),
(211, 'browse_via_aplicaciones', 'via_aplicaciones', '2023-06-01 22:08:31', '2023-06-01 22:08:31'),
(212, 'read_via_aplicaciones', 'via_aplicaciones', '2023-06-01 22:08:31', '2023-06-01 22:08:31'),
(213, 'edit_via_aplicaciones', 'via_aplicaciones', '2023-06-01 22:08:31', '2023-06-01 22:08:31'),
(214, 'add_via_aplicaciones', 'via_aplicaciones', '2023-06-01 22:08:31', '2023-06-01 22:08:31'),
(215, 'delete_via_aplicaciones', 'via_aplicaciones', '2023-06-01 22:08:31', '2023-06-01 22:08:31'),
(221, 'browse_respuesta_simulaciones', 'respuesta_simulaciones', '2023-06-01 23:11:37', '2023-06-01 23:11:37'),
(222, 'read_respuesta_simulaciones', 'respuesta_simulaciones', '2023-06-01 23:11:37', '2023-06-01 23:11:37'),
(223, 'edit_respuesta_simulaciones', 'respuesta_simulaciones', '2023-06-01 23:11:37', '2023-06-01 23:11:37'),
(224, 'add_respuesta_simulaciones', 'respuesta_simulaciones', '2023-06-01 23:11:37', '2023-06-01 23:11:37'),
(225, 'delete_respuesta_simulaciones', 'respuesta_simulaciones', '2023-06-01 23:11:37', '2023-06-01 23:11:37'),
(226, 'browse_examenes', 'examenes', '2023-06-01 23:28:11', '2023-06-01 23:28:11'),
(227, 'read_examenes', 'examenes', '2023-06-01 23:28:11', '2023-06-01 23:28:11'),
(228, 'edit_examenes', 'examenes', '2023-06-01 23:28:11', '2023-06-01 23:28:11'),
(229, 'add_examenes', 'examenes', '2023-06-01 23:28:11', '2023-06-01 23:28:11'),
(230, 'delete_examenes', 'examenes', '2023-06-01 23:28:11', '2023-06-01 23:28:11'),
(231, 'browse_grupos', 'grupos', '2023-06-01 23:51:32', '2023-06-01 23:51:32'),
(232, 'read_grupos', 'grupos', '2023-06-01 23:51:32', '2023-06-01 23:51:32'),
(233, 'edit_grupos', 'grupos', '2023-06-01 23:51:33', '2023-06-01 23:51:33'),
(234, 'add_grupos', 'grupos', '2023-06-01 23:51:33', '2023-06-01 23:51:33'),
(235, 'delete_grupos', 'grupos', '2023-06-01 23:51:33', '2023-06-01 23:51:33'),
(241, 'browse_campos', 'campos', '2023-06-02 13:41:33', '2023-06-02 13:41:33'),
(242, 'read_campos', 'campos', '2023-06-02 13:41:33', '2023-06-02 13:41:33'),
(243, 'edit_campos', 'campos', '2023-06-02 13:41:33', '2023-06-02 13:41:33'),
(244, 'add_campos', 'campos', '2023-06-02 13:41:33', '2023-06-02 13:41:33'),
(245, 'delete_campos', 'campos', '2023-06-02 13:41:33', '2023-06-02 13:41:33'),
(251, 'browse_recursos', 'recursos', '2023-06-02 15:41:21', '2023-06-02 15:41:21'),
(252, 'read_recursos', 'recursos', '2023-06-02 15:41:21', '2023-06-02 15:41:21'),
(253, 'edit_recursos', 'recursos', '2023-06-02 15:41:21', '2023-06-02 15:41:21'),
(254, 'add_recursos', 'recursos', '2023-06-02 15:41:21', '2023-06-02 15:41:21'),
(255, 'delete_recursos', 'recursos', '2023-06-02 15:41:21', '2023-06-02 15:41:21'),
(256, 'browse_preguntas_simulaciones', 'preguntas_simulaciones', '2023-06-02 17:20:37', '2023-06-02 17:20:37'),
(257, 'read_preguntas_simulaciones', 'preguntas_simulaciones', '2023-06-02 17:20:37', '2023-06-02 17:20:37'),
(258, 'edit_preguntas_simulaciones', 'preguntas_simulaciones', '2023-06-02 17:20:37', '2023-06-02 17:20:37'),
(259, 'add_preguntas_simulaciones', 'preguntas_simulaciones', '2023-06-02 17:20:37', '2023-06-02 17:20:37'),
(260, 'delete_preguntas_simulaciones', 'preguntas_simulaciones', '2023-06-02 17:20:37', '2023-06-02 17:20:37');

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
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(136, 1),
(136, 6),
(137, 1),
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
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `escenario_id` bigint(20) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `campo_id` int(11) DEFAULT NULL,
  `abierta` char(255) NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `preguntas_simulaciones`
--

INSERT INTO `preguntas_simulaciones` (`id`, `pregunta`, `created_at`, `updated_at`, `escenario_id`, `nivel_id`, `categoria_id`, `campo_id`, `abierta`) VALUES
(50, '¿Cuáles vacunas aplica el profesional de enfermería?', '2023-08-18 19:06:43', '2023-08-18 19:06:43', 1, 1, 2, 1, 'n'),
(51, '¿Cuál es el calibre de las agujas para aplicar estas vacunas?', '2023-08-18 19:07:23', '2023-08-18 19:07:23', 1, 1, 2, 2, 'n'),
(52, '¿Cuál es la vía de aplicación de estas vacunas?', '2023-08-18 19:08:04', '2023-08-18 19:08:04', 1, 1, 2, 3, 'n'),
(53, '¿Cuáles vacunas aplica el profesional de enfermería?', '2023-08-18 19:08:51', '2023-08-18 19:08:51', 2, 1, 2, 1, 'n'),
(54, '¿Cuál es el calibre de las agujas para aplicar estas vacunas?', '2023-08-18 19:33:04', '2023-08-18 19:33:04', 2, 1, 2, 2, 'n'),
(55, '¿Cuál es la vía de aplicación de estas vacunas?', '2023-08-18 19:33:43', '2023-08-18 19:33:43', 2, 1, 2, 3, 'n'),
(56, 'Este día ¿Cuáles vacunas aplica el profesional de enfermería?', '2023-08-18 19:35:36', '2023-08-18 19:35:36', 3, 2, 2, 1, 'n'),
(57, '¿Cuál es el calibre de las agujas para aplicar estas vacunas?', '2023-08-18 19:36:31', '2023-08-18 19:36:31', 3, 2, 2, 2, 'n'),
(58, '¿Cuál es la vía de aplicación de estas vacunas?', '2023-08-18 19:37:36', '2023-08-18 19:37:36', 3, 2, 2, 3, 'n'),
(59, '¿En cuántas semanas cita al niño para continuar completando el esquema de vacunación?', '2023-08-18 19:38:24', '2023-08-18 19:38:24', 3, 2, 2, NULL, 's'),
(60, '¿Qué vacunas le corresponde administrar a la menor?', '2023-08-18 19:39:11', '2023-08-18 19:39:11', 23, 3, 2, 1, 'n'),
(61, '¿Qué vacunas se le deben administrar?', '2023-08-18 19:40:31', '2023-08-18 19:40:31', 24, 3, 2, 1, 'n'),
(62, '¿Qué vacunas se le deben administrar?', '2023-08-18 19:41:03', '2023-08-18 19:41:03', 25, 3, 2, 1, 'n'),
(63, '¿Con qué vacunas se le completa el esquema?', '2023-08-18 19:42:09', '2023-08-18 19:42:09', 26, 3, 2, 1, 'n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'a'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id`, `usuario_id`, `created_at`, `updated_at`, `estado`) VALUES
(3, 14, NULL, NULL, 'a'),
(4, 15, NULL, NULL, 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE `recursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recursos`
--

INSERT INTO `recursos` (`id`, `created_at`, `updated_at`, `nombre`, `categoria_id`) VALUES
(6, '2023-06-02 17:03:02', '2023-06-02 17:03:02', 'Pentavalente', 2),
(7, '2023-06-02 17:25:43', '2023-06-02 17:25:43', 'Polio VIP', 2),
(8, '2023-06-02 17:26:02', '2023-06-02 17:26:02', 'Rotavirus', 2),
(9, '2023-06-02 17:26:30', '2023-06-02 17:26:30', 'Neumococo', 2),
(10, '2023-06-02 17:26:58', '2023-06-02 17:26:58', 'Triple viral', 2),
(11, '2023-06-02 17:27:22', '2023-06-02 17:27:22', 'Varicela', 2),
(12, '2023-06-02 17:27:49', '2023-06-02 17:27:49', 'Hepatitis A', 2),
(13, '2023-06-02 18:49:06', '2023-06-02 18:49:06', 'Influenza Estacional', 2),
(14, '2023-06-16 15:35:41', '2023-06-16 15:35:41', 'Fiebre Amarilla', 2),
(18, '2023-06-23 10:56:09', '2023-06-23 10:56:09', 'Acetaminofen', 1),
(21, '2023-08-18 18:37:59', '2023-08-18 18:37:59', 'DPT', 2),
(22, '2023-08-18 18:39:31', '2023-08-18 18:39:31', 'Polio Oral', 2),
(23, '2023-08-18 19:47:02', '2023-08-18 19:47:02', 'Hepatitis B', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso_campos`
--

CREATE TABLE `recurso_campos` (
  `id` int(10) UNSIGNED NOT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `campo_id` int(11) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recurso_campos`
--

INSERT INTO `recurso_campos` (`id`, `recurso_id`, `campo_id`, `valor`) VALUES
(1, 6, 1, 'Pentavalente'),
(2, 6, 2, '23'),
(3, 6, 3, '1'),
(4, 7, 1, 'Polio VIP'),
(5, 7, 2, '23'),
(6, 7, 3, '1'),
(7, 8, 1, 'Rotavirus'),
(8, 8, 2, NULL),
(9, 8, 3, '3'),
(10, 9, 1, 'Neumococo'),
(11, 9, 2, '23'),
(12, 9, 3, '1'),
(13, 10, 1, 'Triple viral'),
(14, 10, 2, '25'),
(15, 10, 3, '2'),
(16, 11, 1, 'Varicela'),
(17, 11, 2, '25'),
(18, 11, 3, '2'),
(19, 12, 1, 'Hepatitis A'),
(20, 12, 2, '23'),
(21, 12, 3, '1'),
(22, 13, 1, 'Influenza Estacional'),
(23, 13, 2, '23'),
(24, 13, 3, '2'),
(25, 14, 1, 'Fiebre Amarilla'),
(26, 14, 2, '25'),
(27, 14, 3, '2'),
(43, 21, 1, 'DPT'),
(44, 21, 2, '23'),
(45, 21, 3, '1'),
(46, 22, 1, 'Polio Oral'),
(47, 22, 2, NULL),
(48, 22, 3, '3'),
(49, 23, 1, 'Hepatitis B'),
(50, 23, 2, '25'),
(51, 23, 3, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_preguntas`
--

CREATE TABLE `respuesta_preguntas` (
  `id` int(10) UNSIGNED NOT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `respuesta_preguntas`
--

INSERT INTO `respuesta_preguntas` (`id`, `valor`, `recurso_id`, `pregunta_id`, `created_at`, `updated_at`) VALUES
(107, '6', NULL, 50, '2023-08-18 19:06:43', '2023-08-18 19:06:43'),
(108, '7', NULL, 50, '2023-08-18 19:06:43', '2023-08-18 19:06:43'),
(109, '8', NULL, 50, '2023-08-18 19:06:43', '2023-08-18 19:06:43'),
(110, '9', NULL, 50, '2023-08-18 19:06:43', '2023-08-18 19:06:43'),
(111, '6', NULL, 51, '2023-08-18 19:07:23', '2023-08-18 19:07:23'),
(112, '7', NULL, 51, '2023-08-18 19:07:23', '2023-08-18 19:07:23'),
(113, '9', NULL, 51, '2023-08-18 19:07:23', '2023-08-18 19:07:23'),
(114, '6', NULL, 52, '2023-08-18 19:08:04', '2023-08-18 19:08:04'),
(115, '7', NULL, 52, '2023-08-18 19:08:04', '2023-08-18 19:08:04'),
(116, '8', NULL, 52, '2023-08-18 19:08:04', '2023-08-18 19:08:04'),
(117, '9', NULL, 52, '2023-08-18 19:08:04', '2023-08-18 19:08:04'),
(118, '9', NULL, 53, '2023-08-18 19:08:51', '2023-08-18 19:08:51'),
(119, '10', NULL, 53, '2023-08-18 19:08:51', '2023-08-18 19:08:51'),
(120, '11', NULL, 53, '2023-08-18 19:08:51', '2023-08-18 19:08:51'),
(121, '12', NULL, 53, '2023-08-18 19:08:51', '2023-08-18 19:08:51'),
(122, '13', NULL, 53, '2023-08-18 19:08:51', '2023-08-18 19:08:51'),
(123, '14', NULL, 53, '2023-08-18 19:08:51', '2023-08-18 19:08:51'),
(124, '9', NULL, 54, '2023-08-18 19:33:04', '2023-08-18 19:33:04'),
(125, '10', NULL, 54, '2023-08-18 19:33:04', '2023-08-18 19:33:04'),
(126, '11', NULL, 54, '2023-08-18 19:33:04', '2023-08-18 19:33:04'),
(127, '12', NULL, 54, '2023-08-18 19:33:04', '2023-08-18 19:33:04'),
(128, '13', NULL, 54, '2023-08-18 19:33:04', '2023-08-18 19:33:04'),
(129, '14', NULL, 54, '2023-08-18 19:33:04', '2023-08-18 19:33:04'),
(130, '9', NULL, 55, '2023-08-18 19:33:43', '2023-08-18 19:33:43'),
(131, '10', NULL, 55, '2023-08-18 19:33:43', '2023-08-18 19:33:43'),
(132, '11', NULL, 55, '2023-08-18 19:33:43', '2023-08-18 19:33:43'),
(133, '12', NULL, 55, '2023-08-18 19:33:43', '2023-08-18 19:33:43'),
(134, '13', NULL, 55, '2023-08-18 19:33:43', '2023-08-18 19:33:43'),
(135, '14', NULL, 55, '2023-08-18 19:33:43', '2023-08-18 19:33:43'),
(136, '7', NULL, 56, '2023-08-18 19:35:36', '2023-08-18 19:35:36'),
(137, '10', NULL, 56, '2023-08-18 19:35:36', '2023-08-18 19:35:36'),
(138, '11', NULL, 56, '2023-08-18 19:35:36', '2023-08-18 19:35:36'),
(139, '12', NULL, 56, '2023-08-18 19:35:36', '2023-08-18 19:35:36'),
(140, '14', NULL, 56, '2023-08-18 19:35:36', '2023-08-18 19:35:36'),
(141, '21', NULL, 56, '2023-08-18 19:35:36', '2023-08-18 19:35:36'),
(142, '7', NULL, 57, '2023-08-18 19:36:31', '2023-08-18 19:36:31'),
(143, '10', NULL, 57, '2023-08-18 19:36:31', '2023-08-18 19:36:31'),
(144, '11', NULL, 57, '2023-08-18 19:36:31', '2023-08-18 19:36:31'),
(145, '12', NULL, 57, '2023-08-18 19:36:31', '2023-08-18 19:36:31'),
(146, '14', NULL, 57, '2023-08-18 19:36:31', '2023-08-18 19:36:31'),
(147, '21', NULL, 57, '2023-08-18 19:36:31', '2023-08-18 19:36:31'),
(148, '7', NULL, 58, '2023-08-18 19:37:36', '2023-08-18 19:37:36'),
(149, '10', NULL, 58, '2023-08-18 19:37:36', '2023-08-18 19:37:36'),
(150, '11', NULL, 58, '2023-08-18 19:37:36', '2023-08-18 19:37:36'),
(151, '12', NULL, 58, '2023-08-18 19:37:36', '2023-08-18 19:37:36'),
(152, '14', NULL, 58, '2023-08-18 19:37:36', '2023-08-18 19:37:36'),
(153, '21', NULL, 58, '2023-08-18 19:37:36', '2023-08-18 19:37:36'),
(154, '4', NULL, 59, '2023-08-18 19:38:24', '2023-08-18 19:38:24'),
(155, '10', NULL, 60, '2023-08-18 19:39:11', '2023-08-18 19:39:11'),
(156, '11', NULL, 60, '2023-08-18 19:39:11', '2023-08-18 19:39:11'),
(157, '21', NULL, 60, '2023-08-18 19:39:11', '2023-08-18 19:39:11'),
(158, '22', NULL, 60, '2023-08-18 19:39:11', '2023-08-18 19:39:11'),
(159, '6', NULL, 61, '2023-08-18 19:40:31', '2023-08-18 19:40:31'),
(160, '7', NULL, 61, '2023-08-18 19:40:31', '2023-08-18 19:40:31'),
(161, '13', NULL, 61, '2023-08-18 19:40:31', '2023-08-18 19:40:31'),
(162, '7', NULL, 62, '2023-08-18 19:41:03', '2023-08-18 19:41:03'),
(163, '10', NULL, 62, '2023-08-18 19:41:03', '2023-08-18 19:41:03'),
(164, '11', NULL, 62, '2023-08-18 19:41:03', '2023-08-18 19:41:03'),
(182, '7', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25'),
(183, '9', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25'),
(184, '10', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25'),
(185, '11', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25'),
(186, '12', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25'),
(187, '13', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25'),
(188, '14', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25'),
(189, '21', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25'),
(190, '23', NULL, 63, '2023-08-18 19:47:25', '2023-08-18 19:47:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_simulaciones`
--

CREATE TABLE `respuesta_simulaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `simulacion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `respuesta_simulaciones`
--

INSERT INTO `respuesta_simulaciones` (`id`, `valor`, `recurso_id`, `simulacion_id`, `created_at`, `updated_at`) VALUES
(114, '1', 7, 73, '2023-08-18 23:05:24', '2023-08-18 23:05:24'),
(115, '1', 10, 73, '2023-08-18 23:05:24', '2023-08-18 23:05:24'),
(116, '2', 11, 73, '2023-08-18 23:05:24', '2023-08-18 23:05:24'),
(117, '1', 12, 73, '2023-08-18 23:05:24', '2023-08-18 23:05:24'),
(118, '2', 14, 73, '2023-08-18 23:05:24', '2023-08-18 23:05:24'),
(119, '1', 21, 73, '2023-08-18 23:05:24', '2023-08-18 23:05:24'),
(120, '6', NULL, 74, '2023-08-18 23:05:34', '2023-08-18 23:05:34'),
(121, '7', 1, 74, '2023-08-18 23:05:34', '2023-08-18 23:05:34'),
(122, '10', 2, 74, '2023-08-18 23:05:34', '2023-08-18 23:05:34'),
(123, '8', NULL, 75, '2023-08-18 23:05:42', '2023-08-18 23:05:42'),
(124, '9', 1, 75, '2023-08-18 23:05:42', '2023-08-18 23:05:42'),
(125, '25', 9, 76, '2023-08-18 23:06:00', '2023-08-18 23:06:00'),
(126, '25', 10, 76, '2023-08-18 23:06:00', '2023-08-18 23:06:00'),
(127, '25', 11, 76, '2023-08-18 23:06:00', '2023-08-18 23:06:00'),
(128, '25', 12, 76, '2023-08-18 23:06:00', '2023-08-18 23:06:00'),
(129, '25', 13, 76, '2023-08-18 23:06:00', '2023-08-18 23:06:00'),
(130, '25', 14, 76, '2023-08-18 23:06:00', '2023-08-18 23:06:00'),
(131, '2', 9, 77, '2023-08-18 23:06:15', '2023-08-18 23:06:15'),
(132, '1', 10, 77, '2023-08-18 23:06:15', '2023-08-18 23:06:15'),
(133, '1', 11, 77, '2023-08-18 23:06:15', '2023-08-18 23:06:15'),
(134, '2', 12, 77, '2023-08-18 23:06:15', '2023-08-18 23:06:15'),
(135, '1', 13, 77, '2023-08-18 23:06:15', '2023-08-18 23:06:15'),
(136, '2', 14, 77, '2023-08-18 23:06:15', '2023-08-18 23:06:15'),
(137, '1', 6, 78, '2023-08-18 23:14:07', '2023-08-18 23:14:07'),
(138, '1', 7, 78, '2023-08-18 23:14:07', '2023-08-18 23:14:07'),
(139, '1', 8, 78, '2023-08-18 23:14:07', '2023-08-18 23:14:07'),
(140, '2', 9, 78, '2023-08-18 23:14:07', '2023-08-18 23:14:07'),
(141, '23', 6, 79, '2023-08-18 23:14:17', '2023-08-18 23:14:17'),
(142, '25', 7, 79, '2023-08-18 23:14:17', '2023-08-18 23:14:17'),
(143, '25', 9, 79, '2023-08-18 23:14:17', '2023-08-18 23:14:17'),
(144, '6', NULL, 80, '2023-08-18 23:14:25', '2023-08-18 23:14:25'),
(145, '8', 1, 80, '2023-08-18 23:14:25', '2023-08-18 23:14:25'),
(146, '10', 2, 80, '2023-08-18 23:14:25', '2023-08-18 23:14:25'),
(147, '7', NULL, 81, '2023-08-18 23:14:35', '2023-08-18 23:14:35'),
(148, '8', 1, 81, '2023-08-18 23:14:35', '2023-08-18 23:14:35'),
(149, '9', 2, 81, '2023-08-18 23:14:35', '2023-08-18 23:14:35'),
(150, '10', 3, 81, '2023-08-18 23:14:35', '2023-08-18 23:14:35'),
(151, '8', NULL, 82, '2023-08-18 23:14:42', '2023-08-18 23:14:42'),
(152, '10', 1, 82, '2023-08-18 23:14:42', '2023-08-18 23:14:42'),
(153, '1', 9, 83, '2023-08-18 23:15:24', '2023-08-18 23:15:24'),
(154, '1', 10, 83, '2023-08-18 23:15:24', '2023-08-18 23:15:24'),
(155, '1', 11, 83, '2023-08-18 23:15:24', '2023-08-18 23:15:24'),
(156, '2', 12, 83, '2023-08-18 23:15:24', '2023-08-18 23:15:24'),
(157, '3', 13, 83, '2023-08-18 23:15:24', '2023-08-18 23:15:24'),
(158, '1', 14, 83, '2023-08-18 23:15:24', '2023-08-18 23:15:24'),
(159, '7', NULL, 84, '2023-08-18 23:15:32', '2023-08-18 23:15:32'),
(160, '9', 1, 84, '2023-08-18 23:15:32', '2023-08-18 23:15:32'),
(161, '10', 2, 84, '2023-08-18 23:15:32', '2023-08-18 23:15:32'),
(162, '1', 6, 85, '2023-08-18 23:15:45', '2023-08-18 23:15:45'),
(163, '3', 7, 85, '2023-08-18 23:15:45', '2023-08-18 23:15:45'),
(164, '1', 8, 85, '2023-08-18 23:15:45', '2023-08-18 23:15:45'),
(165, '1', 9, 85, '2023-08-18 23:15:45', '2023-08-18 23:15:45'),
(166, '6', NULL, 86, '2023-08-18 23:15:56', '2023-08-18 23:15:56'),
(167, '8', 1, 86, '2023-08-18 23:15:56', '2023-08-18 23:15:56'),
(168, '9', 2, 86, '2023-08-18 23:15:56', '2023-08-18 23:15:56'),
(169, '10', 3, 86, '2023-08-18 23:15:56', '2023-08-18 23:15:56'),
(170, '8', NULL, 87, '2023-08-18 23:16:02', '2023-08-18 23:16:02'),
(171, '7', NULL, 88, '2023-08-18 23:16:38', '2023-08-18 23:16:38'),
(172, '8', 1, 88, '2023-08-18 23:16:38', '2023-08-18 23:16:38'),
(173, '10', 2, 88, '2023-08-18 23:16:38', '2023-08-18 23:16:38'),
(174, '25', 7, 89, '2023-08-18 23:16:54', '2023-08-18 23:16:54'),
(175, '25', 10, 89, '2023-08-18 23:16:54', '2023-08-18 23:16:54'),
(176, '25', 11, 89, '2023-08-18 23:16:54', '2023-08-18 23:16:54'),
(177, '25', 12, 89, '2023-08-18 23:16:54', '2023-08-18 23:16:54'),
(178, '25', 14, 89, '2023-08-18 23:16:54', '2023-08-18 23:16:54'),
(179, '25', 21, 89, '2023-08-18 23:16:54', '2023-08-18 23:16:54'),
(180, '25', 6, 90, '2023-08-18 23:17:01', '2023-08-18 23:17:01'),
(181, '25', 7, 90, '2023-08-18 23:17:01', '2023-08-18 23:17:01'),
(182, '25', 9, 90, '2023-08-18 23:17:01', '2023-08-18 23:17:01'),
(183, '7', NULL, 91, '2023-08-18 23:17:09', '2023-08-18 23:17:09'),
(184, '9', 1, 91, '2023-08-18 23:17:09', '2023-08-18 23:17:09'),
(185, '10', 2, 91, '2023-08-18 23:17:09', '2023-08-18 23:17:09'),
(186, '25', 9, 92, '2023-08-18 23:17:19', '2023-08-18 23:17:19'),
(187, '25', 10, 92, '2023-08-18 23:17:19', '2023-08-18 23:17:19'),
(188, '25', 11, 92, '2023-08-18 23:17:19', '2023-08-18 23:17:19'),
(189, '25', 12, 92, '2023-08-18 23:17:19', '2023-08-18 23:17:19'),
(190, '25', 13, 92, '2023-08-18 23:17:19', '2023-08-18 23:17:19'),
(191, '25', 14, 92, '2023-08-18 23:17:19', '2023-08-18 23:17:19'),
(192, '7', NULL, 93, '2023-08-21 15:13:43', '2023-08-21 15:13:43'),
(193, '9', 1, 93, '2023-08-21 15:13:43', '2023-08-21 15:13:43'),
(194, '11', 2, 93, '2023-08-21 15:13:43', '2023-08-21 15:13:43'),
(195, '1', 9, 94, '2023-08-21 15:14:08', '2023-08-21 15:14:08'),
(196, '2', 10, 94, '2023-08-21 15:14:08', '2023-08-21 15:14:08'),
(197, '2', 11, 94, '2023-08-21 15:14:08', '2023-08-21 15:14:08'),
(198, '1', 12, 94, '2023-08-21 15:14:08', '2023-08-21 15:14:08'),
(199, '1', 13, 94, '2023-08-21 15:14:08', '2023-08-21 15:14:08'),
(200, '2', 14, 94, '2023-08-21 15:14:08', '2023-08-21 15:14:08'),
(201, '1', 6, 95, '2023-08-21 15:14:19', '2023-08-21 15:14:19'),
(202, '1', 7, 95, '2023-08-21 15:14:19', '2023-08-21 15:14:19'),
(203, '1', 8, 95, '2023-08-21 15:14:19', '2023-08-21 15:14:19'),
(204, '2', 9, 95, '2023-08-21 15:14:19', '2023-08-21 15:14:19'),
(205, '25', 9, 96, '2023-08-21 15:14:30', '2023-08-21 15:14:30'),
(206, '25', 10, 96, '2023-08-21 15:14:30', '2023-08-21 15:14:30'),
(207, '25', 11, 96, '2023-08-21 15:14:30', '2023-08-21 15:14:30'),
(208, '25', 12, 96, '2023-08-21 15:14:30', '2023-08-21 15:14:30'),
(209, '25', 13, 96, '2023-08-21 15:14:30', '2023-08-21 15:14:30'),
(210, '25', 14, 96, '2023-08-21 15:14:30', '2023-08-21 15:14:30'),
(211, '8', NULL, 97, '2023-08-21 15:14:40', '2023-08-21 15:14:40'),
(212, '11', 1, 97, '2023-08-21 15:14:40', '2023-08-21 15:14:40'),
(213, '7', NULL, 98, '2023-08-23 17:55:26', '2023-08-23 17:55:26'),
(214, '10', 1, 98, '2023-08-23 17:55:26', '2023-08-23 17:55:26'),
(215, '23', 6, 99, '2023-08-23 18:42:39', '2023-08-23 18:42:39'),
(216, '23', 7, 99, '2023-08-23 18:42:39', '2023-08-23 18:42:39'),
(217, '23', 9, 99, '2023-08-23 18:42:39', '2023-08-23 18:42:39'),
(218, '23', 6, 102, '2023-08-23 19:11:49', '2023-08-23 19:11:49'),
(219, '23', 7, 102, '2023-08-23 19:11:49', '2023-08-23 19:11:49'),
(220, '23', 9, 102, '2023-08-23 19:11:49', '2023-08-23 19:11:49'),
(221, '1', 6, 103, '2023-08-23 19:12:12', '2023-08-23 19:12:12'),
(222, '1', 7, 103, '2023-08-23 19:12:12', '2023-08-23 19:12:12'),
(223, '1', 8, 103, '2023-08-23 19:12:12', '2023-08-23 19:12:12'),
(224, '1', 9, 103, '2023-08-23 19:12:12', '2023-08-23 19:12:12'),
(225, '6', NULL, 104, '2023-08-23 19:12:46', '2023-08-23 19:12:46'),
(226, '7', 1, 104, '2023-08-23 19:12:46', '2023-08-23 19:12:46'),
(227, '8', 2, 104, '2023-08-23 19:12:46', '2023-08-23 19:12:46'),
(228, '10', NULL, 105, '2023-08-23 19:13:08', '2023-08-23 19:13:08'),
(229, '11', 1, 105, '2023-08-23 19:13:08', '2023-08-23 19:13:08'),
(230, '10', NULL, 106, '2023-08-23 19:13:27', '2023-08-23 19:13:27'),
(231, '11', 1, 106, '2023-08-23 19:13:27', '2023-08-23 19:13:27'),
(232, '22', 2, 106, '2023-08-23 19:13:27', '2023-08-23 19:13:27'),
(233, '6', NULL, 107, '2023-08-23 19:16:21', '2023-08-23 19:16:21'),
(234, '4', NULL, 108, '2023-08-23 19:16:30', '2023-08-23 19:16:30'),
(235, '6', NULL, 109, '2023-11-16 20:10:29', '2023-11-16 20:10:29'),
(236, '6', NULL, 110, '2023-11-16 20:10:46', '2023-11-16 20:10:46'),
(237, '7', 1, 110, '2023-11-16 20:10:46', '2023-11-16 20:10:46'),
(238, '8', 2, 110, '2023-11-16 20:10:46', '2023-11-16 20:10:46'),
(239, '9', 3, 110, '2023-11-16 20:10:46', '2023-11-16 20:10:46'),
(240, '4', NULL, 111, '2023-11-16 20:19:42', '2023-11-16 20:19:42'),
(241, '7', NULL, 112, '2023-11-17 13:27:11', '2023-11-17 13:27:11'),
(242, '8', 1, 112, '2023-11-17 13:27:11', '2023-11-17 13:27:11'),
(243, '10', 2, 112, '2023-11-17 13:27:11', '2023-11-17 13:27:11'),
(244, '7', NULL, 113, '2023-11-17 13:29:03', '2023-11-17 13:29:03'),
(245, '8', 1, 113, '2023-11-17 13:29:03', '2023-11-17 13:29:03'),
(246, '10', 2, 113, '2023-11-17 13:29:03', '2023-11-17 13:29:03'),
(247, '32', 6, 114, '2023-11-17 15:27:50', '2023-11-17 15:27:50'),
(248, '32', 7, 114, '2023-11-17 15:27:50', '2023-11-17 15:27:50'),
(249, '32', 9, 114, '2023-11-17 15:27:50', '2023-11-17 15:27:50'),
(250, '6', NULL, 115, '2023-11-17 15:38:55', '2023-11-17 15:38:55'),
(251, '8', 1, 115, '2023-11-17 15:38:55', '2023-11-17 15:38:55'),
(252, '9', 2, 115, '2023-11-17 15:38:55', '2023-11-17 15:38:55'),
(253, '23', 6, 116, '2023-11-17 15:39:27', '2023-11-17 15:39:27'),
(254, '23', 7, 116, '2023-11-17 15:39:27', '2023-11-17 15:39:27'),
(255, '23', 9, 116, '2023-11-17 15:39:27', '2023-11-17 15:39:27'),
(256, '6', NULL, 117, '2023-11-17 15:44:52', '2023-11-17 15:44:52'),
(257, '7', 1, 117, '2023-11-17 15:44:52', '2023-11-17 15:44:52'),
(258, '8', 2, 117, '2023-11-17 15:44:52', '2023-11-17 15:44:52'),
(259, '9', 3, 117, '2023-11-17 15:44:52', '2023-11-17 15:44:52'),
(260, '7', NULL, 118, '2023-11-17 15:45:07', '2023-11-17 15:45:07'),
(261, '8', 1, 118, '2023-11-17 15:45:07', '2023-11-17 15:45:07'),
(262, '9', 2, 118, '2023-11-17 15:45:07', '2023-11-17 15:45:07'),
(263, '10', 3, 118, '2023-11-17 15:45:07', '2023-11-17 15:45:07'),
(264, '13', 4, 118, '2023-11-17 15:45:07', '2023-11-17 15:45:07'),
(265, '8', NULL, 119, '2023-11-19 15:17:32', '2023-11-19 15:17:32'),
(266, '2', 9, 120, '2023-11-19 15:17:43', '2023-11-19 15:17:43'),
(267, '1', 10, 120, '2023-11-19 15:17:43', '2023-11-19 15:17:43'),
(268, '1', 11, 120, '2023-11-19 15:17:43', '2023-11-19 15:17:43'),
(269, '1', 12, 120, '2023-11-19 15:17:43', '2023-11-19 15:17:43'),
(270, '1', 13, 120, '2023-11-19 15:17:43', '2023-11-19 15:17:43'),
(271, '1', 14, 120, '2023-11-19 15:17:43', '2023-11-19 15:17:43'),
(272, '9', NULL, 121, '2023-11-19 15:17:47', '2023-11-19 15:17:47'),
(273, '6', NULL, 122, '2023-11-19 15:17:54', '2023-11-19 15:17:54'),
(274, '7', 1, 122, '2023-11-19 15:17:54', '2023-11-19 15:17:54'),
(275, '9', 2, 122, '2023-11-19 15:17:54', '2023-11-19 15:17:54'),
(276, '7', NULL, 123, '2023-11-19 15:17:59', '2023-11-19 15:17:59'),
(277, '10', 1, 123, '2023-11-19 15:17:59', '2023-11-19 15:17:59'),
(278, '23', 6, 124, '2023-11-19 15:18:07', '2023-11-19 15:18:07'),
(279, '23', 7, 124, '2023-11-19 15:18:07', '2023-11-19 15:18:07'),
(280, '23', 9, 124, '2023-11-19 15:18:07', '2023-11-19 15:18:07'),
(281, '6', NULL, 125, '2023-11-19 15:18:14', '2023-11-19 15:18:14'),
(282, '7', 1, 125, '2023-11-19 15:18:14', '2023-11-19 15:18:14'),
(283, '9', 2, 125, '2023-11-19 15:18:14', '2023-11-19 15:18:14'),
(284, '1', 6, 126, '2023-11-19 15:18:22', '2023-11-19 15:18:22'),
(285, '2', 7, 126, '2023-11-19 15:18:22', '2023-11-19 15:18:22'),
(286, '2', 8, 126, '2023-11-19 15:18:22', '2023-11-19 15:18:22'),
(287, '1', 9, 126, '2023-11-19 15:18:22', '2023-11-19 15:18:22'),
(288, '6', NULL, 127, '2023-11-19 15:18:27', '2023-11-19 15:18:27'),
(289, '8', 1, 127, '2023-11-19 15:18:27', '2023-11-19 15:18:27'),
(290, '23', 9, 128, '2023-11-19 15:18:36', '2023-11-19 15:18:36'),
(291, '23', 10, 128, '2023-11-19 15:18:36', '2023-11-19 15:18:36'),
(292, '23', 11, 128, '2023-11-19 15:18:36', '2023-11-19 15:18:36'),
(293, '23', 12, 128, '2023-11-19 15:18:36', '2023-11-19 15:18:36'),
(294, '23', 13, 128, '2023-11-19 15:18:36', '2023-11-19 15:18:36'),
(295, '23', 14, 128, '2023-11-19 15:18:36', '2023-11-19 15:18:36');

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
(1, 'site.title', 'Site Title', 'softvap 1.0', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Suministro de vacunación en pediatría - Unillanos® 2023', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/June2023/7ONKKfOPzftyzC9NXjrV.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/October2023/wPRnDlmIb47lzyZoVXRT.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'softvap 1.0', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Suministro de vacunación en pediatría - Unillanos® 2023', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\July2023\\CjxejdddaAT56i77CioA.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `simulaciones`
--

CREATE TABLE `simulaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nota` float DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tiempo` double DEFAULT NULL,
  `campo_id` int(11) DEFAULT NULL,
  `examen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `simulaciones`
--

INSERT INTO `simulaciones` (`id`, `nota`, `pregunta_id`, `estudiante_id`, `created_at`, `updated_at`, `tiempo`, `campo_id`, `examen_id`) VALUES
(112, 0.83, 53, 4, '2023-11-17 13:27:11', '2023-11-17 13:27:11', 0, 1, NULL),
(113, 2.5, 50, 4, '2023-11-17 13:29:03', '2023-11-17 13:29:03', 0, 1, NULL),
(114, 0, 51, 4, '2023-11-17 15:27:50', '2023-11-17 15:27:50', 2215, 2, NULL),
(115, 0, 62, 4, '2023-11-17 15:38:55', '2023-11-17 15:38:55', 8, 1, NULL),
(116, 5, 51, 4, '2023-11-17 15:39:27', '2023-11-17 15:39:27', 12, 2, NULL),
(117, 0.83, 56, 4, '2023-11-17 15:44:52', '2023-11-17 15:44:52', 10, 1, NULL),
(118, 2.22, 63, 4, '2023-11-17 15:45:07', '2023-11-17 15:45:07', 11, 1, NULL),
(119, 1.25, 50, 4, '2023-11-19 15:17:32', '2023-11-19 15:17:32', 4, 1, 12),
(120, 0.83, 55, 4, '2023-11-19 15:17:43', '2023-11-19 15:17:43', 11, 3, 12),
(121, 0, 62, 4, '2023-11-19 15:17:47', '2023-11-19 15:17:47', 4, 1, 12),
(122, 0.83, 53, 4, '2023-11-19 15:17:54', '2023-11-19 15:17:54', 7, 1, 12),
(123, 1.11, 63, 4, '2023-11-19 15:17:59', '2023-11-19 15:17:59', 5, 1, 12),
(124, 5, 51, 4, '2023-11-19 15:18:07', '2023-11-19 15:18:07', 8, 2, 12),
(125, 0, 60, 4, '2023-11-19 15:18:14', '2023-11-19 15:18:14', 7, 1, 12),
(126, 2.5, 52, 4, '2023-11-19 15:18:21', '2023-11-19 15:18:21', 7, 3, 12),
(127, 1.67, 61, 4, '2023-11-19 15:18:27', '2023-11-19 15:18:27', 5, 1, 12),
(128, 2.5, 54, 4, '2023-11-19 15:18:36', '2023-11-19 15:18:36', 9, 2, 12);

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
-- Estructura de tabla para la tabla `tipo_estados`
--

CREATE TABLE `tipo_estados` (
  `id` int(10) UNSIGNED NOT NULL,
  `acronimo` char(1) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_estados`
--

INSERT INTO `tipo_estados` (`id`, `acronimo`, `nombre`) VALUES
(1, 's', 'Activo'),
(2, 'n', 'Inactivo'),
(3, 'c', 'Cancelado'),
(4, 'f', 'Finalizado');

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
  `tipo_documento` bigint(20) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'a'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `surname`, `identification`, `tipo_documento`, `estado`) VALUES
(9, 'Felipe', 'felipe@softvap.com', 'users\\August2023\\INB9ydh7ONg3pWwEAumA.jpeg', NULL, '$2y$10$H3wTK7BiEXULbEnAoycFeetFvuCp/I0/CSmeXTOAtAXGYr6CzDpT.', NULL, NULL, '2023-08-18 17:38:06', '2023-08-21 15:39:21', 'Corredor', '1121000001', 2, 'a'),
(10, 'Candido', 'candido@softvap.com', 'users/default.png', NULL, '$2y$10$0ehnWaOk3ID5qZ01Aum5H.YBmKmyHd8uhGJa/kK3BfdPrypOC6QYq', NULL, NULL, '2023-08-18 17:39:27', '2023-08-18 17:39:27', 'Moreno', '1121956543', 2, 'a'),
(11, 'Luisa', 'luisa@softvap.com', 'users/default.png', NULL, '$2y$10$OCfMamiPY9zEDviHUoboZuZpY30p7N79Rn7tiQaYDM4AVBTemIOf2', NULL, NULL, '2023-08-18 17:56:37', '2023-08-18 17:56:37', 'Rojas', '1006826950', 2, 'a'),
(12, 'Santiago', 'santiago@softvap.com', 'users/default.png', NULL, '$2y$10$B1iYCHH5JQwM02AsK3f2f.M7C10iX69TD4wHEzxqoWOn8lmoTFxw.', NULL, NULL, '2023-08-18 17:58:03', '2023-08-18 17:58:03', 'Roncancio', '1121956650', 2, 'a'),
(13, 'Sebastian', 'sebastian@softvap.com', 'users/default.png', NULL, '$2y$10$o81VS0NrS8Mk5At8kV68purtMLodxuB.GzKDXLBvb7L5YPnh9tHiC', NULL, NULL, '2023-08-18 18:00:04', '2023-08-18 18:00:04', 'Rojas', '1121578144', 2, 'a'),
(14, 'MeryLuz', 'mery@softvap.com', 'users\\August2023\\AeBWLCljR34MHlpwZLtX.jpg', NULL, '$2y$10$rCg2CvGg54TxtMtqmCIaTO6K5hft9xHz39Y7M6t0zLDrdgfEBPAB6', 'JQUdTBHGvdgIbbkxNkTxu2vFRQKFtjxarlJGCAu81Y68uAsboKJhtqBv8vU4', NULL, '2023-08-22 21:01:57', '2023-08-22 22:22:37', 'Valderrama', '87663245', 2, 'a'),
(15, 'Javier Eduardo', 'javier@softvap.com', 'users\\August2023\\1vBOfZZbaQzjRqNDtp90.jpg', NULL, '$2y$10$TgfBKPC1EbWfpPHUYUc32ObT.awgt6Td8lqj2MWTM8B2xnHlIUG.6', NULL, NULL, '2023-08-22 22:37:04', '2023-11-26 20:52:25', 'Martinez', '1100998877', 2, 'a'),
(16, 'Paula', 'ronximena588@gmail.com', 'users/default.png', NULL, '$2y$10$uVgn3y4jCYKZ00K2rQQnse.yc1uJEKT9kt59WQXOaP8divdhLQKi6', NULL, NULL, '2023-11-26 16:21:21', '2023-11-26 21:27:06', 'Roncancio', '1007389914', 2, 'a'),
(18, 'thorNI', 'thor@softvap.com', 'users/default.png', NULL, '$2y$10$BjWliZqhjkf0jqG647whFeoTcKn6LKXx6DxJnTBg.VopZVSVuNY5O', NULL, NULL, '2023-11-27 02:22:54', '2023-11-27 02:22:54', 'NIllo', '112195665011', 2, 'a'),
(19, 'prueba2', 'prueba2@gmail.com', 'users/default.png', NULL, '$2y$10$a5qR6QJp7Mz3sPYn8TEsXunnDx4lr1Wr3XY4Di91RfAzo9uvh/aX.', NULL, NULL, '2023-11-27 11:32:29', '2023-11-27 11:32:29', 'prueba2', '2', 2, 'a'),
(20, 'Prueba', 'prueba1@gmail.com', 'users/default.png', NULL, '$2y$10$3BDLau9G/FPwBJgLFOArRePkhPDmkU6p3kyOZlfPepwIDPDT1luEu', NULL, NULL, '2023-11-27 11:32:29', '2023-11-27 11:32:29', 'prueba1', '1', 2, 'a');

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
(9, 1),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 1),
(14, 6),
(15, 6),
(16, 2),
(18, 2),
(19, 2),
(20, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `via_aplicaciones`
--

CREATE TABLE `via_aplicaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `abreviatura` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `via_aplicaciones`
--

INSERT INTO `via_aplicaciones` (`id`, `nombre`, `abreviatura`, `descripcion`) VALUES
(1, 'Inyección Intramuscular', 'IM', NULL),
(2, 'Inyección Subcutánea', 'SC', NULL),
(3, 'Vía Oral', 'VO', NULL);

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
-- Indices de la tabla `campos`
--
ALTER TABLE `campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_recursos_categoria_id_index` (`categoria_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `estudiantes_usuario_id_index` (`usuario_id`),
  ADD KEY `estudiantes_grupo_id_index` (`grupo_id`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examenes_profesor_id_index` (`profesor_id`);

--
-- Indices de la tabla `examen_estudiantes`
--
ALTER TABLE `examen_estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examen_estudiantes_examen_id_index` (`examen_id`),
  ADD KEY `examen_estudiantes_estudiante_id_index` (`estudiante_id`);

--
-- Indices de la tabla `examen_preguntas`
--
ALTER TABLE `examen_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examen_preguntas_examen_id_index` (`examen_id`),
  ADD KEY `examen_preguntas_pregunta_id_index` (`pregunta_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `niveles_categoria_id_index` (`categoria_id`);

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
  ADD KEY `preguntas_simulaciones_categoria_id_index` (`categoria_id`),
  ADD KEY `preguntas_simulaciones_campo_id_index` (`campo_id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recursos_categoria_id_index` (`categoria_id`);

--
-- Indices de la tabla `recurso_campos`
--
ALTER TABLE `recurso_campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recurso_campos_recurso_id_index` (`recurso_id`),
  ADD KEY `recurso_campos_campo_id_index` (`campo_id`);

--
-- Indices de la tabla `respuesta_preguntas`
--
ALTER TABLE `respuesta_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `respuesta_preguntas_recurso_id_index` (`recurso_id`),
  ADD KEY `respuesta_preguntas_pregunta_id_index` (`pregunta_id`);

--
-- Indices de la tabla `respuesta_simulaciones`
--
ALTER TABLE `respuesta_simulaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `respuesta_simulaciones_recurso_id_index` (`recurso_id`),
  ADD KEY `respuesta_simulaciones_simulacion_id_index` (`simulacion_id`);

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
  ADD KEY `simulaciones_pregunta_id_index` (`pregunta_id`),
  ADD KEY `simulaciones_estudiante_id_index` (`estudiante_id`),
  ADD KEY `simulaciones_campo_id_index` (`campo_id`),
  ADD KEY `simulaciones_examen_id_index` (`examen_id`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_estados`
--
ALTER TABLE `tipo_estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

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
-- Indices de la tabla `via_aplicaciones`
--
ALTER TABLE `via_aplicaciones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `campos`
--
ALTER TABLE `campos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `escenarios_simulaciones`
--
ALTER TABLE `escenarios_simulaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `examenes`
--
ALTER TABLE `examenes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `examen_estudiantes`
--
ALTER TABLE `examen_estudiantes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `examen_preguntas`
--
ALTER TABLE `examen_preguntas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas_simulaciones`
--
ALTER TABLE `preguntas_simulaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `recursos`
--
ALTER TABLE `recursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `recurso_campos`
--
ALTER TABLE `recurso_campos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `respuesta_preguntas`
--
ALTER TABLE `respuesta_preguntas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT de la tabla `respuesta_simulaciones`
--
ALTER TABLE `respuesta_simulaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_estados`
--
ALTER TABLE `tipo_estados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `via_aplicaciones`
--
ALTER TABLE `via_aplicaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
