-- MariaDB dump 10.19  Distrib 10.5.23-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: padelamigos_wordpres
-- ------------------------------------------------------
-- Server version	10.5.23-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_pa_categoria`
--

DROP TABLE IF EXISTS `wp_pa_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_categoria` (
  `cate_id` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `cate_titulo` varchar(20) NOT NULL COMMENT 'Titulo',
  `cate_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `cate_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `cate_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `cate_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `cate_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`cate_id`) USING BTREE,
  KEY `wp_pa_categoria_wp_users_ID_ID_fk` (`cate_creador`),
  KEY `wp_pa_categoria_wp_users_ID_fk` (`cate_editor`),
  CONSTRAINT `wp_pa_categoria_wp_users_ID_ID_fk` FOREIGN KEY (`cate_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_categoria_wp_users_ID_fk` FOREIGN KEY (`cate_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_categoria`
--

LOCK TABLES `wp_pa_categoria` WRITE;
/*!40000 ALTER TABLE `wp_pa_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_categorialiga`
--

DROP TABLE IF EXISTS `wp_pa_categorialiga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_categorialiga` (
  `cali_id` int(11) NOT NULL COMMENT 'ID',
  `cali_torn_id` int(11) NOT NULL COMMENT 'Liga',
  `cali_cate_id` int(11) NOT NULL COMMENT 'Categoria',
  `cali_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `cali_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `cali_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `cali_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `cali_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`cali_id`) USING BTREE,
  KEY `wp_pa_categorialiga_ibfk_1` (`cali_torn_id`) USING BTREE,
  KEY `wp_pa_categorialiga_ibfk_2` (`cali_cate_id`) USING BTREE,
  KEY `wp_pa_categorialiga_wp_users_ID_fk` (`cali_creador`),
  KEY `wp_pa_categorialiga_wp_users_ID_fk_2` (`cali_editor`),
  CONSTRAINT `wp_pa_categorialiga_wp_pa_categoria_cate_id_fk` FOREIGN KEY (`cali_cate_id`) REFERENCES `wp_pa_categoria` (`cate_id`),
  CONSTRAINT `wp_pa_categorialiga_wp_pa_torneo_torn_id_fk` FOREIGN KEY (`cali_torn_id`) REFERENCES `wp_pa_torneo` (`torn_id`),
  CONSTRAINT `wp_pa_categorialiga_wp_users_ID_fk` FOREIGN KEY (`cali_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_categorialiga_wp_users_ID_fk_2` FOREIGN KEY (`cali_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_categorialiga`
--

LOCK TABLES `wp_pa_categorialiga` WRITE;
/*!40000 ALTER TABLE `wp_pa_categorialiga` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_categorialiga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_disponibilidadhoraria`
--

DROP TABLE IF EXISTS `wp_pa_disponibilidadhoraria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_disponibilidadhoraria` (
  `disp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dispo_torn_id` int(11) NOT NULL COMMENT 'Liga',
  `dispo_pare_id` int(11) NOT NULL COMMENT 'Pareja',
  `disp_dl` int(1) NOT NULL COMMENT 'Lunes',
  `dispo_dm` int(1) NOT NULL COMMENT 'Martes',
  `disp_dx` int(1) NOT NULL COMMENT 'Miercoles',
  `disp_dj` int(1) NOT NULL COMMENT 'Jueves',
  `disp_dv` int(1) NOT NULL COMMENT 'Viernes',
  `disp_ds` int(1) NOT NULL COMMENT 'Sabado',
  `disp_dd` int(1) NOT NULL COMMENT 'Domingo',
  `disp_hd` int(2) unsigned zerofill NOT NULL,
  `disp_md` int(2) unsigned zerofill NOT NULL,
  `disp_hh` int(2) unsigned zerofill NOT NULL,
  `disp_mh` int(2) unsigned zerofill NOT NULL,
  `disp_obs` varchar(255) DEFAULT NULL COMMENT 'Observaciones',
  `disp_creador` bigint(20) unsigned DEFAULT NULL COMMENT 'Creador',
  `disp_creado` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `disp_editor` bigint(20) unsigned DEFAULT NULL COMMENT 'Editor',
  `disp_editado` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `disp_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`disp_id`) USING BTREE,
  KEY `wp_pa_disponibilidadhoraria_ibfk_1` (`dispo_torn_id`) USING BTREE,
  KEY `wp_pa_disponibilidadhoraria_ibfk_2` (`dispo_pare_id`) USING BTREE,
  KEY `wp_pa_disponibilidadhoraria_wp_users_ID_fk` (`disp_creador`),
  KEY `wp_pa_disponibilidadhoraria_wp_users_ID_fk_2` (`disp_editor`),
  CONSTRAINT `wp_pa_disponibilidadhoraria_ibfk_2` FOREIGN KEY (`dispo_pare_id`) REFERENCES `wp_pa_pareja` (`pare_id`),
  CONSTRAINT `wp_pa_disponibilidadhoraria_wp_pa_torneo_torn_id_fk` FOREIGN KEY (`dispo_torn_id`) REFERENCES `wp_pa_torneo` (`torn_id`),
  CONSTRAINT `wp_pa_disponibilidadhoraria_wp_users_ID_fk` FOREIGN KEY (`disp_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_disponibilidadhoraria_wp_users_ID_fk_2` FOREIGN KEY (`disp_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_disponibilidadhoraria`
--

LOCK TABLES `wp_pa_disponibilidadhoraria` WRITE;
/*!40000 ALTER TABLE `wp_pa_disponibilidadhoraria` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_disponibilidadhoraria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_grupos`
--

DROP TABLE IF EXISTS `wp_pa_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_grupos` (
  `grup_id` int(11) NOT NULL COMMENT 'ID',
  `grup_torn_id` int(11) NOT NULL COMMENT 'Liga',
  `grup_cate_id` int(11) NOT NULL COMMENT 'Grupo',
  `grup_nombre` varchar(255) NOT NULL COMMENT 'Nombre',
  `grup_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `grup_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `grup_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `grup_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `grup_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`grup_id`) USING BTREE,
  KEY `wp_pa_grupos_ibfk_1` (`grup_torn_id`) USING BTREE,
  KEY `wp_pa_grupos_ibfk_2` (`grup_cate_id`) USING BTREE,
  KEY `wp_pa_grupos_wp_users_ID_fk` (`grup_creador`),
  KEY `wp_pa_grupos_wp_users_ID_fk_2` (`grup_editor`),
  CONSTRAINT `wp_pa_grupos_wp_pa_categoria_cate_id_fk` FOREIGN KEY (`grup_cate_id`) REFERENCES `wp_pa_categoria` (`cate_id`),
  CONSTRAINT `wp_pa_grupos_wp_pa_torneo_torn_id_fk` FOREIGN KEY (`grup_torn_id`) REFERENCES `wp_pa_torneo` (`torn_id`),
  CONSTRAINT `wp_pa_grupos_wp_users_ID_fk` FOREIGN KEY (`grup_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_grupos_wp_users_ID_fk_2` FOREIGN KEY (`grup_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_grupos`
--

LOCK TABLES `wp_pa_grupos` WRITE;
/*!40000 ALTER TABLE `wp_pa_grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_inscripcionpareja`
--

DROP TABLE IF EXISTS `wp_pa_inscripcionpareja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_inscripcionpareja` (
  `insc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `insc_torn_id` int(11) NOT NULL COMMENT 'Liga',
  `insc_pare_id` int(11) NOT NULL COMMENT 'Pareja',
  `insc_cate_id` int(11) NOT NULL COMMENT 'Categoria',
  `insc_rega_id_1` int(11) DEFAULT NULL COMMENT 'Regalo 1',
  `insc_rega_id_2` int(11) DEFAULT NULL COMMENT 'Regalo 2',
  `insc_cuota_1` timestamp NULL DEFAULT NULL COMMENT 'Cuota jugador 1',
  `insc_cuota_2` timestamp NULL DEFAULT NULL COMMENT 'Cuota jugador 2',
  `insc_talla_1` varchar(255) DEFAULT NULL COMMENT 'Talla 1',
  `insc_talla_2` varchar(255) DEFAULT NULL COMMENT 'Talla 2',
  `insc_obs` longtext DEFAULT NULL COMMENT 'Observaciones',
  `insc_situacion` varchar(255) DEFAULT NULL COMMENT 'Situacion',
  `insc_reservar` set('true','false') DEFAULT 'false' COMMENT 'Reservar',
  `insc_partidoincial` set('SI','NO') DEFAULT 'NO',
  `insc_resumencuotas` varchar(255) DEFAULT NULL COMMENT 'Resumen Cuotas',
  `insc_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `insc_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `insc_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `insc_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `insc_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`insc_id`) USING BTREE,
  KEY `wp_pa_inscripcionpareja_ibfk_1` (`insc_pare_id`) USING BTREE,
  KEY `wp_pa_inscripcionpareja_ibfk_2` (`insc_cate_id`) USING BTREE,
  KEY `wp_pa_inscripcionpareja_ibfk_2_copy_3` (`insc_torn_id`) USING BTREE,
  KEY `wp_pa_inscripcionpareja_ibfk_2_copy_4` (`insc_rega_id_1`) USING BTREE,
  KEY `wp_pa_inscripcionpareja_wp_pa_regalo_rega_id_fk_2` (`insc_rega_id_2`),
  KEY `wp_pa_inscripcionpareja_wp_users_ID_fk` (`insc_creador`),
  KEY `wp_pa_inscripcionpareja_wp_users_ID_fk_2` (`insc_editor`),
  CONSTRAINT `wp_pa_inscripcionpareja_ibfk_1` FOREIGN KEY (`insc_pare_id`) REFERENCES `wp_pa_pareja` (`pare_id`),
  CONSTRAINT `wp_pa_inscripcionpareja_ibfk_2` FOREIGN KEY (`insc_cate_id`) REFERENCES `wp_pa_categoria` (`cate_id`),
  CONSTRAINT `wp_pa_inscripcionpareja_ibfk_2_copy_4` FOREIGN KEY (`insc_rega_id_1`) REFERENCES `wp_pa_regalo` (`rega_id`),
  CONSTRAINT `wp_pa_inscripcionpareja_wp_pa_regalo_rega_id_fk` FOREIGN KEY (`insc_rega_id_1`) REFERENCES `wp_pa_regalo` (`rega_id`),
  CONSTRAINT `wp_pa_inscripcionpareja_wp_pa_regalo_rega_id_fk_2` FOREIGN KEY (`insc_rega_id_2`) REFERENCES `wp_pa_regalo` (`rega_id`),
  CONSTRAINT `wp_pa_inscripcionpareja_wp_pa_torneo_torn_id_fk` FOREIGN KEY (`insc_torn_id`) REFERENCES `wp_pa_torneo` (`torn_id`),
  CONSTRAINT `wp_pa_inscripcionpareja_wp_users_ID_fk` FOREIGN KEY (`insc_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_inscripcionpareja_wp_users_ID_fk_2` FOREIGN KEY (`insc_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_inscripcionpareja`
--

LOCK TABLES `wp_pa_inscripcionpareja` WRITE;
/*!40000 ALTER TABLE `wp_pa_inscripcionpareja` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_inscripcionpareja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_municipio`
--

DROP TABLE IF EXISTS `wp_pa_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_municipio` (
  `muni_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `muni_prov_id` int(11) NOT NULL COMMENT 'Provincia',
  `muni_nombre` varchar(255) NOT NULL COMMENT 'Nombre',
  `muni_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `muni_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `muni_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `muni_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `muni_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`muni_id`) USING BTREE,
  KEY `wp_pa_municipio_ibfk_1` (`muni_prov_id`) USING BTREE,
  KEY `wp_pa_municipio_wp_users_ID_fk` (`muni_creador`),
  KEY `wp_pa_municipio_wp_users_ID_fk_2` (`muni_editor`),
  CONSTRAINT `wp_pa_municipio_wp_pa_provincia_prov_id_fk` FOREIGN KEY (`muni_prov_id`) REFERENCES `wp_pa_provincia` (`prov_id`),
  CONSTRAINT `wp_pa_municipio_wp_users_ID_fk` FOREIGN KEY (`muni_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_municipio_wp_users_ID_fk_2` FOREIGN KEY (`muni_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_municipio`
--

LOCK TABLES `wp_pa_municipio` WRITE;
/*!40000 ALTER TABLE `wp_pa_municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_pareja`
--

DROP TABLE IF EXISTS `wp_pa_pareja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_pareja` (
  `pare_id` int(11) NOT NULL COMMENT 'ID',
  `pare_perf_id_1` int(11) DEFAULT NULL COMMENT 'Jugador 1',
  `pare_perf_id_2` int(11) DEFAULT NULL COMMENT 'Jugador 2',
  `pare_cate_id` int(11) NOT NULL COMMENT 'Categoria',
  `pare_grup_id` int(11) DEFAULT NULL COMMENT 'Grupo',
  `pare_nombre` varchar(255) NOT NULL COMMENT 'Nombre',
  `pare_foto` varchar(255) NOT NULL COMMENT 'Foto',
  `pare_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `pare_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `pare_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `pare_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `pare_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`pare_id`) USING BTREE,
  KEY `wp_pa_pareja_ibfk_1` (`pare_perf_id_1`) USING BTREE,
  KEY `wp_pa_pareja_ibfk_2` (`pare_perf_id_2`) USING BTREE,
  KEY `wp_pa_pareja_wp_pa_categoria_cate_id_fk` (`pare_cate_id`),
  KEY `wp_pa_pareja_wp_pa_grupos_grup_id_fk` (`pare_grup_id`),
  KEY `wp_pa_pareja_wp_users_ID_fk` (`pare_creador`),
  KEY `wp_pa_pareja_wp_users_ID_fk_2` (`pare_editor`),
  CONSTRAINT `wp_pa_pareja_ibfk_1` FOREIGN KEY (`pare_perf_id_1`) REFERENCES `wp_pa_perfil` (`perf_id`),
  CONSTRAINT `wp_pa_pareja_ibfk_2` FOREIGN KEY (`pare_perf_id_2`) REFERENCES `wp_pa_perfil` (`perf_id`),
  CONSTRAINT `wp_pa_pareja_wp_pa_categoria_cate_id_fk` FOREIGN KEY (`pare_cate_id`) REFERENCES `wp_pa_categoria` (`cate_id`),
  CONSTRAINT `wp_pa_pareja_wp_pa_grupos_grup_id_fk` FOREIGN KEY (`pare_grup_id`) REFERENCES `wp_pa_grupos` (`grup_id`),
  CONSTRAINT `wp_pa_pareja_wp_users_ID_fk` FOREIGN KEY (`pare_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_pareja_wp_users_ID_fk_2` FOREIGN KEY (`pare_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_pareja`
--

LOCK TABLES `wp_pa_pareja` WRITE;
/*!40000 ALTER TABLE `wp_pa_pareja` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_pareja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_partidos`
--

DROP TABLE IF EXISTS `wp_pa_partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_partidos` (
  `part_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `part_liga_id` int(11) NOT NULL COMMENT 'Liga',
  `part_cate_id` int(11) NOT NULL COMMENT 'Categoria',
  `part_grup_id` int(11) NOT NULL COMMENT 'Grupo',
  `part_sede_id` int(11) NOT NULL,
  `part_pare_id_1` int(11) NOT NULL,
  `part_pare_id_2` int(11) NOT NULL,
  `part_fase` int(1) NOT NULL,
  `part_jornada` int(2) NOT NULL,
  `part_sets_1` int(2) NOT NULL,
  `part_sets_2` int(2) NOT NULL,
  `part_set1_2` int(2) NOT NULL,
  `part_set1_1` int(2) NOT NULL,
  `part_set2_1` int(2) NOT NULL,
  `part_set2_2` int(2) NOT NULL,
  `part_set3_1` int(2) NOT NULL,
  `part_set3_2` int(2) NOT NULL,
  `part_ptos_1` int(2) NOT NULL,
  `part_ptos_2` int(2) NOT NULL,
  `part_obs` longtext DEFAULT NULL,
  `part_fpartido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `part_pincidencia` text DEFAULT NULL,
  `part_link` varchar(255) DEFAULT NULL,
  `part_crucep1` varchar(255) DEFAULT NULL,
  `part_crucep2` varchar(255) DEFAULT NULL,
  `part_cruceelim` int(1) DEFAULT NULL,
  `part_crucegan` varchar(255) DEFAULT NULL,
  `part_crucep` varchar(255) DEFAULT NULL,
  `part_jug11` int(11) DEFAULT NULL,
  `part_jug12` int(11) DEFAULT NULL,
  `part_jug21` int(11) DEFAULT NULL,
  `part_jug22` int(11) DEFAULT NULL,
  `part_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `part_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `part_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `part_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `part_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`part_id`) USING BTREE,
  KEY `wp_pa_partidos_wp_users_ID_fk` (`part_creador`),
  KEY `wp_pa_partidos_wp_users_ID_fk_2` (`part_editor`),
  KEY `wp_pa_partidos_wp_pa_perfil_perf_id_fk` (`part_jug11`),
  KEY `wp_pa_partidos_wp_pa_perfil_perf_id_fk_2` (`part_jug12`),
  KEY `wp_pa_partidos_wp_pa_perfil_perf_id_fk_3` (`part_jug21`),
  KEY `wp_pa_partidos_wp_pa_perfil_perf_id_fk_4` (`part_jug22`),
  CONSTRAINT `wp_pa_partidos_wp_pa_perfil_perf_id_fk` FOREIGN KEY (`part_jug11`) REFERENCES `wp_pa_perfil` (`perf_id`),
  CONSTRAINT `wp_pa_partidos_wp_pa_perfil_perf_id_fk_2` FOREIGN KEY (`part_jug12`) REFERENCES `wp_pa_perfil` (`perf_id`),
  CONSTRAINT `wp_pa_partidos_wp_pa_perfil_perf_id_fk_3` FOREIGN KEY (`part_jug21`) REFERENCES `wp_pa_perfil` (`perf_id`),
  CONSTRAINT `wp_pa_partidos_wp_pa_perfil_perf_id_fk_4` FOREIGN KEY (`part_jug22`) REFERENCES `wp_pa_perfil` (`perf_id`),
  CONSTRAINT `wp_pa_partidos_wp_users_ID_fk` FOREIGN KEY (`part_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_partidos_wp_users_ID_fk_2` FOREIGN KEY (`part_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_partidos`
--

LOCK TABLES `wp_pa_partidos` WRITE;
/*!40000 ALTER TABLE `wp_pa_partidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_perfil`
--

DROP TABLE IF EXISTS `wp_pa_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_perfil` (
  `perf_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `perf_users_id` bigint(20) unsigned NOT NULL COMMENT 'User',
  `perf_nombre` varchar(255) NOT NULL COMMENT 'Nombre y apellido',
  `perf_tipoident` varchar(255) NOT NULL COMMENT 'Tipo de identificacion',
  `perf_foto` varchar(255) DEFAULT NULL COMMENT 'Foto',
  `perf_nroident` varchar(255) NOT NULL COMMENT 'Numero de documento identificatorio',
  `perf_genero` enum('Masculino','Femenino') DEFAULT NULL COMMENT 'Genero',
  `perf_fnacimiento` date NOT NULL COMMENT 'Fecha de nacimiento',
  `perf_movil` varchar(255) NOT NULL COMMENT 'Movil',
  `perf_nivel` varchar(255) NOT NULL COMMENT 'Nivel de padel',
  `perf_posicion` enum('Derecha','Reves','Indistinto') NOT NULL COMMENT 'Posición',
  `perf_provincia` int(11) NOT NULL COMMENT 'Provincia',
  `perf_municipio` int(11) NOT NULL COMMENT 'Localidad',
  `perf_observaciones` varchar(255) DEFAULT NULL COMMENT 'Observaciones',
  `perf_referidolink` longtext DEFAULT NULL COMMENT 'Referido',
  `perf_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `perf_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `perf_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `perf_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `perf_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`perf_id`) USING BTREE,
  KEY `wp_pa_perfil_wp_users_ID_fk` (`perf_users_id`),
  KEY `wp_pa_perfil_wp_users_ID_fk_2` (`perf_creador`),
  KEY `wp_pa_perfil_wp_users_ID_fk_3` (`perf_editor`),
  CONSTRAINT `wp_pa_perfil_wp_users_ID_fk` FOREIGN KEY (`perf_users_id`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_perfil_wp_users_ID_fk_2` FOREIGN KEY (`perf_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_perfil_wp_users_ID_fk_3` FOREIGN KEY (`perf_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_perfil`
--

LOCK TABLES `wp_pa_perfil` WRITE;
/*!40000 ALTER TABLE `wp_pa_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_premio`
--

DROP TABLE IF EXISTS `wp_pa_premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_premio` (
  `prem_id` int(11) NOT NULL COMMENT 'ID',
  `prem_liga` int(11) NOT NULL COMMENT 'Liga',
  `prem_titulo` varchar(255) NOT NULL COMMENT 'Titulo',
  `prem_desc` varchar(255) NOT NULL COMMENT 'Descripcion',
  `prem_puesto` int(2) NOT NULL COMMENT 'Puesto',
  `prem_creador` bigint(20) NOT NULL COMMENT 'Creador',
  `prem_creado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Creado',
  `prem_editor` bigint(20) NOT NULL COMMENT 'Editor',
  `prem_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `prem_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`prem_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_premio`
--

LOCK TABLES `wp_pa_premio` WRITE;
/*!40000 ALTER TABLE `wp_pa_premio` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_producto`
--

DROP TABLE IF EXISTS `wp_pa_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_producto` (
  `prod_id` int(11) NOT NULL,
  `prod_precio` decimal(10,2) NOT NULL,
  `prod_nombre` varchar(255) NOT NULL COMMENT 'Nombre',
  `prod_desc` varchar(255) NOT NULL COMMENT 'Descripcion',
  `prod_img` varchar(255) NOT NULL COMMENT 'Imagen',
  `prod_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `prod_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `prod_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `prod_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `prod_estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`prod_id`) USING BTREE,
  KEY `wp_pa_producto_wp_users_ID_fk` (`prod_creador`),
  KEY `wp_pa_producto_wp_users_ID_fk_2` (`prod_editor`),
  CONSTRAINT `wp_pa_producto_wp_users_ID_fk` FOREIGN KEY (`prod_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_producto_wp_users_ID_fk_2` FOREIGN KEY (`prod_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_producto`
--

LOCK TABLES `wp_pa_producto` WRITE;
/*!40000 ALTER TABLE `wp_pa_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_provincia`
--

DROP TABLE IF EXISTS `wp_pa_provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_provincia` (
  `prov_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `prov_nombre` varchar(255) NOT NULL COMMENT 'Nombre',
  `prov_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `prov_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `prov_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `prov_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `prov_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`prov_id`) USING BTREE,
  KEY `wp_pa_provincia_wp_users_ID_fk` (`prov_creador`),
  KEY `wp_pa_provincia_wp_users_ID_fk_2` (`prov_editor`),
  CONSTRAINT `wp_pa_provincia_wp_users_ID_fk` FOREIGN KEY (`prov_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_provincia_wp_users_ID_fk_2` FOREIGN KEY (`prov_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_provincia`
--

LOCK TABLES `wp_pa_provincia` WRITE;
/*!40000 ALTER TABLE `wp_pa_provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_referidos`
--

DROP TABLE IF EXISTS `wp_pa_referidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_referidos` (
  `refe_id` int(11) NOT NULL COMMENT 'ID',
  `refe_perf_id` int(11) NOT NULL COMMENT 'Perfil',
  `refe_perfilalta` int(11) NOT NULL COMMENT 'Alta',
  `refe_creador` bigint(20) NOT NULL COMMENT 'Creador',
  `refe_creado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Creado',
  `refe_editor` bigint(20) NOT NULL COMMENT 'Editor',
  `refe_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `refe_estado` int(11) NOT NULL COMMENT 'Estado',
  PRIMARY KEY (`refe_id`),
  KEY `wp_referido_ibfk_1` (`refe_perf_id`),
  KEY `wp_referido_ibfk_2` (`refe_perfilalta`),
  CONSTRAINT `wp_referido_ibfk_1` FOREIGN KEY (`refe_perf_id`) REFERENCES `wp_pa_perfil` (`perf_id`),
  CONSTRAINT `wp_referido_ibfk_2` FOREIGN KEY (`refe_perfilalta`) REFERENCES `wp_pa_perfil` (`perf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_referidos`
--

LOCK TABLES `wp_pa_referidos` WRITE;
/*!40000 ALTER TABLE `wp_pa_referidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_referidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_regalo`
--

DROP TABLE IF EXISTS `wp_pa_regalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_regalo` (
  `rega_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rega_torn_id` int(11) NOT NULL COMMENT 'Liga',
  `rega_cate_id` int(11) NOT NULL COMMENT 'Categoria',
  `rega_prod_id` int(11) NOT NULL COMMENT 'Producto',
  `rega_precio` decimal(8,2) NOT NULL COMMENT 'Precio',
  `rega_multicategoria` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Multicategoria',
  `rega_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `rega_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `rega_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `rega_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `rega_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`rega_id`) USING BTREE,
  KEY `wp_pa_regalo_wp_pa_categoria_cate_id_fk` (`rega_cate_id`),
  KEY `wp_pa_regalo_wp_pa_producto_prod_id_fk` (`rega_prod_id`),
  KEY `wp_pa_regalo_wp_pa_torneo_torn_id_fk` (`rega_torn_id`),
  KEY `wp_pa_regalo_wp_users_ID_fk` (`rega_creador`),
  KEY `wp_pa_regalo_wp_users_ID_fk_2` (`rega_editor`),
  CONSTRAINT `wp_pa_regalo_wp_pa_categoria_cate_id_fk` FOREIGN KEY (`rega_cate_id`) REFERENCES `wp_pa_categoria` (`cate_id`),
  CONSTRAINT `wp_pa_regalo_wp_pa_producto_prod_id_fk` FOREIGN KEY (`rega_prod_id`) REFERENCES `wp_pa_producto` (`prod_id`),
  CONSTRAINT `wp_pa_regalo_wp_pa_torneo_torn_id_fk` FOREIGN KEY (`rega_torn_id`) REFERENCES `wp_pa_torneo` (`torn_id`),
  CONSTRAINT `wp_pa_regalo_wp_users_ID_fk` FOREIGN KEY (`rega_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_regalo_wp_users_ID_fk_2` FOREIGN KEY (`rega_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_regalo`
--

LOCK TABLES `wp_pa_regalo` WRITE;
/*!40000 ALTER TABLE `wp_pa_regalo` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_regalo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_sedeliga`
--

DROP TABLE IF EXISTS `wp_pa_sedeliga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_sedeliga` (
  `seli_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `seli_sede_id` int(11) NOT NULL COMMENT 'Sede',
  `seli_torn_id` int(11) NOT NULL COMMENT 'Liga',
  `seli_obs` longtext NOT NULL COMMENT 'Observaciones',
  `seli_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `seli_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `seli_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `seli_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `seli_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`seli_id`) USING BTREE,
  KEY `wp_pa_sedeliga_wp_pa_sedes_sede_id_fk` (`seli_sede_id`),
  KEY `wp_pa_sedeliga_wp_pa_torneo_torn_id_fk` (`seli_torn_id`),
  KEY `wp_pa_sedeliga_wp_users_ID_fk` (`seli_creador`),
  KEY `wp_pa_sedeliga_wp_users_ID_fk_2` (`seli_editor`),
  CONSTRAINT `wp_pa_sedeliga_wp_pa_sedes_sede_id_fk` FOREIGN KEY (`seli_sede_id`) REFERENCES `wp_pa_sedes` (`sede_id`),
  CONSTRAINT `wp_pa_sedeliga_wp_pa_torneo_torn_id_fk` FOREIGN KEY (`seli_torn_id`) REFERENCES `wp_pa_torneo` (`torn_id`),
  CONSTRAINT `wp_pa_sedeliga_wp_users_ID_fk` FOREIGN KEY (`seli_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_sedeliga_wp_users_ID_fk_2` FOREIGN KEY (`seli_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_sedeliga`
--

LOCK TABLES `wp_pa_sedeliga` WRITE;
/*!40000 ALTER TABLE `wp_pa_sedeliga` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_sedeliga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_sedes`
--

DROP TABLE IF EXISTS `wp_pa_sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_sedes` (
  `sede_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sede_nombre` varchar(100) NOT NULL COMMENT 'Nombre',
  `sede_pistasInterior` int(2) NOT NULL COMMENT 'Pistas interior',
  `sede_pistasExterior` int(2) NOT NULL COMMENT 'Pistas exterior',
  `sede_tel` varchar(50) NOT NULL COMMENT 'Teléfono',
  `sede_movil` varchar(50) NOT NULL COMMENT 'Movil',
  `sede_web` varchar(100) NOT NULL COMMENT 'Web',
  `sede_foto` varchar(150) NOT NULL COMMENT 'Foto',
  `sede_obs` text NOT NULL COMMENT 'Observaciones',
  `sede_maps` text NOT NULL COMMENT 'Maps',
  `sede_geo1` varchar(20) NOT NULL,
  `sede_geo2` varchar(20) NOT NULL,
  `sede_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `sede_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `sede_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `sede_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `sede_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`sede_id`) USING BTREE,
  KEY `wp_pa_sedes_wp_users_ID_fk` (`sede_creador`),
  KEY `wp_pa_sedes_wp_users_ID_fk_2` (`sede_editor`),
  CONSTRAINT `wp_pa_sedes_wp_users_ID_fk` FOREIGN KEY (`sede_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_sedes_wp_users_ID_fk_2` FOREIGN KEY (`sede_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_sedes`
--

LOCK TABLES `wp_pa_sedes` WRITE;
/*!40000 ALTER TABLE `wp_pa_sedes` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_sedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_pa_torneo`
--

DROP TABLE IF EXISTS `wp_pa_torneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `wp_pa_torneo` (
  `torn_id` int(11) NOT NULL COMMENT 'ID',
  `torn_nombre` varchar(255) NOT NULL COMMENT 'Nombre',
  `torn_desc` varchar(255) DEFAULT NULL COMMENT 'Descripcion',
  `torn_finicio` date NOT NULL COMMENT 'Fecha inicio',
  `torn_ffin` date NOT NULL COMMENT 'Fecha fin',
  `torn_finicioinscr` date NOT NULL COMMENT 'Inicio de inscripciones',
  `torn_ffininscr` date NOT NULL COMMENT 'Cierre de inscripciones',
  `torn_nsedes` int(3) NOT NULL COMMENT 'Numero de sedes',
  `torn_versede` bit(1) NOT NULL COMMENT 'Mostrar sedes',
  `torn_vercalendario` bit(1) NOT NULL COMMENT 'Mostrar calendario',
  `torn_ngrupos` varchar(255) DEFAULT NULL,
  `torn_nparejasgrupos` int(2) NOT NULL COMMENT 'Cantidad de parejas por grupo',
  `torn_ptos2setsvic` int(3) DEFAULT NULL,
  `torn_ptos3setsvic` int(3) DEFAULT NULL,
  `torn_ptosempate` int(3) DEFAULT NULL,
  `torn_ptosinicio` int(3) DEFAULT NULL,
  `torn_ptosextra` int(3) DEFAULT NULL,
  `torn_ptos2setsder` int(3) DEFAULT NULL,
  `torn_ptos3setsder` int(3) DEFAULT NULL,
  `torn_usafase` bit(1) NOT NULL,
  `torn_ptoswo` int(3) DEFAULT NULL,
  `torn_ganadorwo` int(1) DEFAULT NULL,
  `torn_perdedorwo` int(1) DEFAULT NULL,
  `torn_parejas` tinyint(1) DEFAULT NULL,
  `torn_equipos` tinyint(1) DEFAULT NULL,
  `torn_minequipo` int(3) DEFAULT NULL,
  `torn_maxequipo` int(3) DEFAULT NULL,
  `torn_f32avos` date DEFAULT NULL COMMENT 'Fecha de 32avos',
  `torn_f16avos` date DEFAULT NULL COMMENT 'Fecha 16avos',
  `torn_f8avos` date DEFAULT NULL COMMENT 'Fecha 8vos',
  `torn_f4tos` date DEFAULT NULL COMMENT 'Fecha 4tos',
  `torn_fsemi` date DEFAULT NULL COMMENT 'Fecha semifinal',
  `torn_ffinal` date DEFAULT NULL COMMENT 'Fecha final',
  `torn_img` varchar(255) DEFAULT NULL,
  `torn_registrolibre` int(1) DEFAULT NULL,
  `torn_cuota_1` decimal(10,2) DEFAULT NULL,
  `torn_cuota_2` decimal(10,2) DEFAULT NULL,
  `torn_cuota_jug` decimal(10,2) DEFAULT NULL,
  `torn_seguro` decimal(10,2) DEFAULT NULL,
  `torn_creador` bigint(20) unsigned NOT NULL COMMENT 'Creador',
  `torn_creado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creado',
  `torn_editor` bigint(20) unsigned NOT NULL COMMENT 'Editor',
  `torn_editado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Editado',
  `torn_estado` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado',
  PRIMARY KEY (`torn_id`) USING BTREE,
  KEY `wp_pa_torneo_wp_users_ID_fk` (`torn_creador`),
  KEY `wp_pa_torneo_wp_users_ID_fk_2` (`torn_editor`),
  CONSTRAINT `wp_pa_torneo_wp_users_ID_fk` FOREIGN KEY (`torn_creador`) REFERENCES `wp_users` (`ID`),
  CONSTRAINT `wp_pa_torneo_wp_users_ID_fk_2` FOREIGN KEY (`torn_editor`) REFERENCES `wp_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_pa_torneo`
--

LOCK TABLES `wp_pa_torneo` WRITE;
/*!40000 ALTER TABLE `wp_pa_torneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_pa_torneo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-08 18:43:56
