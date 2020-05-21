CREATE TABLE `municipis` (
  `municipi_id` SMALLINT(5) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  `codi_ine_municipi` CHAR(3) NULL DEFAULT NULL,
  `codi_ine_provincia` CHAR(2) NOT NULL,
  CONSTRAINT PK_municipis PRIMARY KEY (`municipi_id`),
  CONSTRAINT FK_municipis_provincies FOREIGN KEY (`codi_ine_provincia`)
    REFERENCES provincies(`codi_ine_provincia`)
);