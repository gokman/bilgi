CREATE TABLE `musteri` (
  `ad` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `soyad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sehir` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ulke` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adres_detay` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` int(10) DEFAULT NULL,
  `occupation` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education_level` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_of_work` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settlement_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci$$