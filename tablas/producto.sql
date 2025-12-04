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

/*Table structure for table `ventas_producto` */

DROP TABLE IF EXISTS `ventas_producto`;

CREATE TABLE `ventas_producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `ventas_producto_id_usuario_id_4d35f773_fk_ventas_usuario_id` (`id_usuario_id`),
  CONSTRAINT `ventas_producto_id_usuario_id_4d35f773_fk_ventas_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `ventas_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ventas_producto` */

insert  into `ventas_producto`(`id_producto`,`nombre_producto`,`precio`,`stock`,`id_usuario_id`) values (1,'Portatil',5500.00,15,1),(2,'Mobil',2600.00,12,1),(3,'Escritorio',15000.00,35,4),(4,'Auto mobil',25000.00,7,5),(5,'Ferrari',45000.00,4,5),(6,'MT03',30000.00,10,5),(7,'Cicla',10000.00,15,6),(8,'Bera200',8500.00,5,6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
