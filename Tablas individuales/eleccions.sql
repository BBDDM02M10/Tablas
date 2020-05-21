  
CREATE TABLE `eleccions` (
  `eleccio_id` TINYINT(3) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nom` VARCHAR(20) NOT NULL,
  `any` YEAR NOT NULL,
  `mes` TINYINT(2) UNSIGNED NOT NULL,
  `data` TINYINT(2) NOT NULL ,
  UNIQUE INDEX `uk_eleccions_any_mes` USING BTREE (`any`, `mes`),
  CONSTRAINT PK_eleccions PRIMARY KEY (`eleccio_id`)
);