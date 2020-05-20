CREATE TABLE `eleccions_municipis` (
  `eleccio_municipi_id` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `eleccio_id` TINYINT(3) UNSIGNED NOT NULL,
  `municipi_id`SMALLINT(5) UNSIGNED NOT NULL,
  `num_meses` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `poblacio` INT(10) UNSIGNED NULL DEFAULT NULL,
  `cens` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_emesos` INT(10) AS (vots_candidatures + vots_blanc + vots_nuls),
  `vots_valids` INT(10) AS (vots_candidatures + vots_blanc),
  `vots_candidatures` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_blanc` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_nuls` INT(10) UNSIGNED NULL DEFAULT NULL,
  CONSTRAINT PK_eleccio_municipi_id PRIMARY KEY (`eleccio_municipi_id`),
  CONSTRAINT FK_eleccions_municipis_municipis FOREIGN KEY (municipi_id)
    REFERENCES municipis (municipi_id)
);
