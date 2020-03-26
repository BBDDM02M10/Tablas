CREATE TABLE `comunitats_autonomes` (
  `comunitat_aut_id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `codi_ine` CHAR(2) NOT NULL,
  CONSTRAINT PK_comunitat_aut_id PRIMARY KEY (`comunitat_aut_id`)
);

CREATE TABLE `provincies` (
  `provincia_id` TINYINT(3) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nom` VARCHAR(45) DEFAULT NULL,
  `codi_ine_provincia` CHAR(2) NOT NULL,
  `comunitat_aut_id` TINYINT (3) UNSIGNED NOT NULL,
  CONSTRAINT PK_provincies PRIMARY KEY (`provincia_id`),
  CONSTRAINT FK_provincies_comunitats_autonomes FOREIGN KEY (`comunitat_aut_id`)
    REFERENCES comunitats_autonomes(comunitat_aut_id)
);

CREATE TABLE `municipis` (
  `municipi_id` SMALLINT(5) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nom` VARCHAR(50) NULL DEFAULT NULL,
  `codi_ine_municipi` CHAR(3) NULL DEFAULT NULL,
  `codi_ine_provincia` CHAR(2) NOT NULL,
  CONSTRAINT PK_municipis PRIMARY KEY (`municipi_id`),
  CONSTRAINT FK_municipis_provincies FOREIGN KEY (codi_ine_provincia)
    REFERENCES provincies(codi_ine_provincia)
);
  
CREATE TABLE `eleccions` (
  `eleccio_id` TINYINT(3) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nom` VARCHAR(20) NOT NULL,
  `any` YEAR NOT NULL,
  `mes` TINYINT(2) UNSIGNED NOT NULL,
  `data` TINYINT(2) NOT NULL ,
  UNIQUE INDEX `uk_eleccions_any_mes` USING BTREE (`any`, `mes`),
  CONSTRAINT PK_eleccions PRIMARY KEY (`eleccio_id`)
);

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

CREATE TABLE `eleccions_municipis` (
  `eleccio_municipi_id` INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `eleccio_id` TINYINT(3) UNSIGNED NOT NULL,
  `municipi_id` SMALLINT(5) UNSIGNED NOT NULL,
  `num_meses` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `poblacio` INT(10) UNSIGNED NULL DEFAULT NULL,
  `cens` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_emesos` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_valids` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_candidatures` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_blanc` INT(10) UNSIGNED NULL DEFAULT NULL,
  `vots_nuls` INT(10) UNSIGNED NULL DEFAULT NULL,
  UNIQUE INDEX `uk_eleccions_municipis` (`eleccio_id` ASC, `municipi_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;