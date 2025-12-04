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

/*Table structure for table `ventas_venta` */

DROP TABLE IF EXISTS `ventas_venta`;

CREATE TABLE `ventas_venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `total_venta` decimal(10,2) NOT NULL,
  `id_usuario_id` int(11) DEFAULT NULL,
  `id_producto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `ventas_venta_id_usuario_id_3dfb99f4_fk_ventas_usuario_id` (`id_usuario_id`),
  KEY `ventas_venta_id_producto_id_296a964e_fk_ventas_pr` (`id_producto_id`),
  CONSTRAINT `ventas_venta_id_producto_id_296a964e_fk_ventas_pr` FOREIGN KEY (`id_producto_id`) REFERENCES `ventas_producto` (`id_producto`),
  CONSTRAINT `ventas_venta_id_usuario_id_3dfb99f4_fk_ventas_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `ventas_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ventas_venta` */

insert  into `ventas_venta`(`id_venta`,`fecha_venta`,`total_venta`,`id_usuario_id`,`id_producto_id`) values (1,'2025-12-02 03:57:02.558231',16500.00,1,1),(2,'2025-12-02 04:15:01.802838',5200.00,1,2),(3,'2025-12-02 04:20:26.515050',11000.00,1,1),(4,'2025-12-02 04:21:59.722953',2600.00,1,2),(5,'2025-12-02 05:34:39.577494',45000.00,5,5),(6,'2025-12-02 05:51:24.523366',25000.00,4,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
