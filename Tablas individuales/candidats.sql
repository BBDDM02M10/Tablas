
CREATE TABLE `candidats` (
  `candidat_id` BIGINT(19) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nom_complet` VARCHAR(50) NOT NULL,
  `num_ordre` TINYINT(4) NULL DEFAULT NULL,
  `tipus` ENUM('T', 'S') NULL DEFAULT NULL,
  `provincia_id` TINYINT(3) UNSIGNED NOT NULL,
  `candidatura_id` INT(10) UNSIGNED NOT NULL,
  CONSTRAINT PK_candidats PRIMARY KEY (candidat_id),
  CONSTRAINT FK_candidats_candidatures FOREIGN KEY (candidatura_id)
    REFERENCES candidatures(candidatura_id),
  CONSTRAINT FK_candidats_provincies FOREIGN KEY (provincia_id)
    REFERENCES provincies(provincia_id)
);
