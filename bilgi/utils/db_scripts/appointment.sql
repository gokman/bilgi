delimiter $$

CREATE TABLE `appointment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customerID` int(10) NOT NULL,
  `app_date` varchar(10) NOT NULL,
  `app_time` varchar(10) NOT NULL,
  `app_state` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8$$

