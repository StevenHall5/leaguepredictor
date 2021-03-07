-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE `companydirectory`;
-- Dumping structure for table prem
CREATE TABLE IF NOT EXISTS `prem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `badge` varchar(200) DEFAULT NULL,
  `played` int(11) DEFAULT NULL,
  `won` int(11) DEFAULT NULL,
  `drawn` int(11) DEFAULT NULL,
  `lost` int(11) DEFAULT NULL,
  `goalsFor` int(11) DEFAULT NULL,
  `goalsAgainst` int(11) DEFAULT NULL,
  `goalDifference` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table prem: ~20 rows (approximately)
/*!40000 ALTER TABLE `prem` DISABLE KEYS */;
INSERT INTO `prem` (`id`, `name`, `badge`, `played`, `won`, `drawn`, `lost`, `goalsFor`, `goalsAgainst`, `goalDifference`, `points`) VALUES
	(1, 'Arsenal', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21182406/580b57fcd9996e24bc43c4df-870x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(2, 'Aston Villa', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21154557/1200px-Aston_Villa_FC_crest_2016.svg_-723x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(3, 'Brighton', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21154338/1200px-Brighton__Hove_Albion_logo.svg_-1024x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(4, 'Burnley', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21153618/60d3f5f9d22c719cad5083d5dfcb7951.jpg', 0, 0, 0, 0, 0, 0, 0, 0),
	(5, 'Chelsea', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21165447/chelsea-png-file-chelsea-fc-svg-600.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(6, 'Crystal Palace', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21161236/1200px-Crystal_Palace_FC_logo.svg_-821x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(7, 'Everton', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21171532/everton-5.jpg', 0, 0, 0, 0, 0, 0, 0, 0),
	(8, 'Fulham', 'https://m0.joe.co.uk/wp-content/uploads/2020/09/09105139/1200px-Fulham_FC_shield.svg_.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(9, 'Leeds', 'https://m0.joe.co.uk/wp-content/uploads/2020/09/09105116/leeds.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(10, 'Leicester', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21171952/580b57fcd9996e24bc43c4e8.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(11, 'Liverpool', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21182801/1200px-Liverpool_FC.svg_-791x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(12, 'Manchester City', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21154544/1200px-Manchester_City_FC_badge.svg_-1024x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(13, 'Manchester United', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21161251/manchester-united-logo-premier-league-large-soccer.jpg', 0, 0, 0, 0, 0, 0, 0, 0),
	(14, 'Newcastle', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21161245/Newcastle_United_Logo.svg_-1017x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(15, 'Sheffield', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/24104522/sheffield-united-fc-logo-png-transparent-1024x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(16, 'Southampton', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21172931/1200px-FC_Southampton.svg_-897x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(17, 'Tottenham Hotspur', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21171652/580b57fcd9996e24bc43c4ee-1024x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(18, 'West Bromwich', 'https://m0.joe.co.uk/wp-content/uploads/2020/09/09105215/1200px-West_Bromwich_Albion.svg_.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(19, 'West Ham', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21152948/1200px-West_Ham_United_FC_logo.svg_-920x1024.png', 0, 0, 0, 0, 0, 0, 0, 0),
	(20, 'Wolverhampton', 'https://m0.joe.co.uk/wp-content/uploads/2019/06/21152810/LMK55IERNVBBVISVDK4U6CFT2M.jpg', 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `prem` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
