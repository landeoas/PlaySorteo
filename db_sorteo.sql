/*
Navicat MySQL Data Transfer

Source Server         : Servidor MySQL
Source Server Version : 50141
Source Host           : localhost:3306
Source Database       : db_sorteo

Target Server Type    : MYSQL
Target Server Version : 50141
File Encoding         : 65001

Date: 2013-12-01 12:51:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `participante`
-- ----------------------------
DROP TABLE IF EXISTS `participante`;
CREATE TABLE `participante` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `codSorteo` int(10) NOT NULL,
  `numPersona` int(10) NOT NULL,
  `fechaInscripcion` datetime NOT NULL,
  `indicadorSorteado` int(1) NOT NULL,
  `indicadorGanador` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participante_sorteo1_idx` (`codSorteo`),
  KEY `fk_participante_persona1_idx` (`numPersona`),
  CONSTRAINT `fk_participante_sorteo1` FOREIGN KEY (`codSorteo`) REFERENCES `sorteo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participante_persona1` FOREIGN KEY (`numPersona`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of participante
-- ----------------------------

-- ----------------------------
-- Table structure for `persona`
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(250) NOT NULL,
  `docIdentidad` varchar(8) NOT NULL,
  `fechaNacimiento` datetime NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of persona
-- ----------------------------

-- ----------------------------
-- Table structure for `premios`
-- ----------------------------
DROP TABLE IF EXISTS `premios`;
CREATE TABLE `premios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descPremio` varchar(100) NOT NULL,
  `codSorteo` int(10) NOT NULL,
  `cantidadPremio` int(2) NOT NULL,
  `garantiaPremio` int(2) NOT NULL,
  `numParticipante` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_premios_sorteo1_idx` (`codSorteo`),
  KEY `fk_premios_participante1_idx` (`numParticipante`),
  CONSTRAINT `fk_premios_sorteo1` FOREIGN KEY (`codSorteo`) REFERENCES `sorteo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_premios_participante1` FOREIGN KEY (`numParticipante`) REFERENCES `participante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of premios
-- ----------------------------

-- ----------------------------
-- Table structure for `sorteo`
-- ----------------------------
DROP TABLE IF EXISTS `sorteo`;
CREATE TABLE `sorteo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nomSorteo` varchar(250) NOT NULL,
  `fechaIni` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `estadoSorteo` varchar(15) NOT NULL,
  `metodoSorteo` varchar(40) NOT NULL,
  `fechaSorteo` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sorteo
-- ----------------------------

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `password` varchar(15) NOT NULL,
  `nombreCompleto` varchar(60) NOT NULL,
  `estado` int(1) NOT NULL,
  `administrador` int(1) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
