CREATE TABLE `comunitats_autonomes` (
  `comunitat_aut_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `codi_ine` char(2) NOT NULL,
  PRIMARY KEY (`comunitat_aut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
