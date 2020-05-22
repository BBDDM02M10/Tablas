CREATE TABLE `eleccions_municipis` (
  `eleccio_municipi_id` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `eleccio_id` TINYINT(3) UNSIGNED NOT NULL,
  `codi_ine_municipi` char(3) DEFAULT NULL,
  `num_meses` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `poblacio` INT(10) UNSIGNED NULL DEFAULT NULL,
  `cens` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_emesos` INT(10) AS (vots_candidatures + vots_blanc + vots_nuls),
  `vots_valids` INT(10) AS (vots_candidatures + vots_blanc),
  `vots_candidatures` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_blanc` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_nuls` INT(10) UNSIGNED NULL DEFAULT NULL,
  CONSTRAINT PK_eleccio_municipi_id PRIMARY KEY (`eleccio_municipi_id`),
  CONSTRAINT FK_eleccions_municipis_eleccions FOREIGN KEY (`eleccio_id`)
    REFERENCES eleccions (`eleccio_id`),
  CONSTRAINT FK_eleccions_municipis_municipis FOREIGN KEY (`codi_ine_municipi`)
    REFERENCES municipis (`codi_ine_municipi`)
);
