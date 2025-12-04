/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 12.1.2-MariaDB : Database - gestion_ventas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gestion_ventas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `gestion_ventas`;

/*Table structure for table `ventas_detalleventa` */

DROP TABLE IF EXISTS `ventas_detalleventa`;

CREATE TABLE `ventas_detalleventa` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `id_producto_id` int(11) DEFAULT NULL,
  `id_venta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `ventas_detalleventa_id_producto_id_901cf687_fk_ventas_pr` (`id_producto_id`),
  KEY `ventas_detalleventa_id_venta_id_55c94b1a_fk_ventas_ve` (`id_venta_id`),
  CONSTRAINT `ventas_detalleventa_id_producto_id_901cf687_fk_ventas_pr` FOREIGN KEY (`id_producto_id`) REFERENCES `ventas_producto` (`id_producto`),
  CONSTRAINT `ventas_detalleventa_id_venta_id_55c94b1a_fk_ventas_ve` FOREIGN KEY (`id_venta_id`) REFERENCES `ventas_venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ventas_detalleventa` */

insert  into `ventas_detalleventa`(`id_detalle`,`cantidad`,`precio_unitario`,`subtotal`,`id_producto_id`,`id_venta_id`) values (1,3,5500.00,16500.00,1,1),(2,2,2600.00,5200.00,2,2),(3,2,5500.00,11000.00,1,3),(4,1,2600.00,2600.00,2,4),(5,1,45000.00,45000.00,5,5),(6,1,25000.00,25000.00,4,6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
