CREATE TABLE `provincies` (
  `provincia_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `codi_ine` char(2) NOT NULL,
  `comunitat_aut_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`provincia_id`),
  KEY `FK_provincies_comunitats_autonomes` (`comunitat_aut_id`),
  CONSTRAINT `FK_provincies_comunitats_autonomes` FOREIGN KEY (`comunitat_aut_id`) REFERENCES `comunitats_autonomes` (`comunitat_aut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
