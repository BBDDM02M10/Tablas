
CREATE TABLE `candidatures` (
  `candidatura_id` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `eleccio_id` TINYINT(3) UNSIGNED NOT NULL,
  `nom_curt` VARCHAR(50) NULL DEFAULT NULL,
  `nom_llarg` VARCHAR(100) NULL DEFAULT NULL,
  `codi_acumulacio_provincia` CHAR(6) NULL DEFAULT NULL,
  `codi_acumulacio_ca` CHAR(6) NULL DEFAULT NULL,
  CONSTRAINT PK_candidatures_id PRIMARY KEY (`candidatura_id`),
  CONSTRAINT FK_candidatures_eleccions FOREIGN KEY (`eleccio_id`)
    REFERENCES eleccions(`eleccio_id`)
);
