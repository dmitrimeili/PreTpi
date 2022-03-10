-- MySQL Workbench Synchronization
-- Generated: 2022-03-09 14:17
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: dmitr

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `PreTpi` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Reviews` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `review` VARCHAR(500) NOT NULL,
  `rating` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  `approuved` TINYINT(4) NOT NULL,
  `Users_id` INT(11) NOT NULL,
  `Books_id` INT(11) NULL DEFAULT NULL,
  `Series_id` INT(11) NULL DEFAULT NULL,
  `Films_id` INT(11) NULL DEFAULT NULL,
  `VideoGames_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UniqueItem` (`title` ASC) VISIBLE,
  INDEX `fk_Reviews_Users_idx` (`Users_id` ASC) VISIBLE,
  INDEX `fk_Reviews_Books1_idx` (`Books_id` ASC) VISIBLE,
  INDEX `fk_Reviews_Series1_idx` (`Series_id` ASC) VISIBLE,
  INDEX `fk_Reviews_Films1_idx` (`Films_id` ASC) VISIBLE,
  INDEX `fk_Reviews_VideoGames1_idx` (`VideoGames_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Users`
    FOREIGN KEY (`Users_id`)
    REFERENCES `PreTpi`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Books1`
    FOREIGN KEY (`Books_id`)
    REFERENCES `PreTpi`.`Books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Series1`
    FOREIGN KEY (`Series_id`)
    REFERENCES `PreTpi`.`Series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Films1`
    FOREIGN KEY (`Films_id`)
    REFERENCES `PreTpi`.`Films` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_VideoGames1`
    FOREIGN KEY (`VideoGames_id`)
    REFERENCES `PreTpi`.`VideoGames` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` CHAR(60) NOT NULL,
  `Blocked` TINYINT(4) NOT NULL,
  `Roles_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Users_Roles1_idx` (`Roles_id` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Roles1`
    FOREIGN KEY (`Roles_id`)
    REFERENCES `PreTpi`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`VideoGames` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `releasedate` DATE NULL DEFAULT NULL,
  `Devloppers_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_VideoGames_Devloppers1_idx` (`Devloppers_id` ASC) VISIBLE,
  CONSTRAINT `fk_VideoGames_Devloppers1`
    FOREIGN KEY (`Devloppers_id`)
    REFERENCES `PreTpi`.`Devloppers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Platforms` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Type_UNIQUE` (`type` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Devloppers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `companyname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `companyname_UNIQUE` (`companyname` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`VideoGameCategories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Genre_UNIQUE` (`Genre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Series` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `releasedate` DATE NULL DEFAULT NULL,
  `season` INT(11) NULL DEFAULT NULL,
  `Creators_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_Series_Creators1_idx` (`Creators_id` ASC) VISIBLE,
  CONSTRAINT `fk_Series_Creators1`
    FOREIGN KEY (`Creators_id`)
    REFERENCES `PreTpi`.`Creators` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Films` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `releasedate` DATE NULL DEFAULT NULL,
  `Creators_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_Films_Creators1_idx` (`Creators_id` ASC) VISIBLE,
  CONSTRAINT `fk_Films_Creators1`
    FOREIGN KEY (`Creators_id`)
    REFERENCES `PreTpi`.`Creators` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Books` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `Authors_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_Books_Authors1_idx` (`Authors_id` ASC) VISIBLE,
  CONSTRAINT `fk_Books_Authors1`
    FOREIGN KEY (`Authors_id`)
    REFERENCES `PreTpi`.`Authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Creators` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Authors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`BookCategories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `genre_UNIQUE` (`genre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`MediaCategories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `genre_UNIQUE` (`genre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`VideoGameCategories_classifies_VideoGames` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `VideoGames_id` INT(11) NOT NULL,
  `VideoGameCategories_id` INT(11) NOT NULL,
  INDEX `fk_VideoGames_has_VideoGameCategories_VideoGameCategories1_idx` (`VideoGameCategories_id` ASC) VISIBLE,
  INDEX `fk_VideoGames_has_VideoGameCategories_VideoGames1_idx` (`VideoGames_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_VideoGames_has_VideoGameCategories_VideoGames1`
    FOREIGN KEY (`VideoGames_id`)
    REFERENCES `PreTpi`.`VideoGames` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VideoGames_has_VideoGameCategories_VideoGameCategories1`
    FOREIGN KEY (`VideoGameCategories_id`)
    REFERENCES `PreTpi`.`VideoGameCategories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`MediaCategories_classifies_Series` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Series_id` INT(11) NOT NULL,
  `MediaCategories_id` INT(11) NOT NULL,
  INDEX `fk_Series_has_MediaCategories_MediaCategories1_idx` (`MediaCategories_id` ASC) VISIBLE,
  INDEX `fk_Series_has_MediaCategories_Series1_idx` (`Series_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Series_has_MediaCategories_Series1`
    FOREIGN KEY (`Series_id`)
    REFERENCES `PreTpi`.`Series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Series_has_MediaCategories_MediaCategories1`
    FOREIGN KEY (`MediaCategories_id`)
    REFERENCES `PreTpi`.`MediaCategories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`MediaCategories_classifies_Films` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Films_id` INT(11) NOT NULL,
  `MediaCategories_id` INT(11) NOT NULL,
  INDEX `fk_Films_has_MediaCategories_MediaCategories1_idx` (`MediaCategories_id` ASC) VISIBLE,
  INDEX `fk_Films_has_MediaCategories_Films1_idx` (`Films_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Films_has_MediaCategories_Films1`
    FOREIGN KEY (`Films_id`)
    REFERENCES `PreTpi`.`Films` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Films_has_MediaCategories_MediaCategories1`
    FOREIGN KEY (`MediaCategories_id`)
    REFERENCES `PreTpi`.`MediaCategories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`BookCategories_classifies_Books` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `BookCategories_id` INT(11) NOT NULL,
  `Books_id` INT(11) NOT NULL,
  INDEX `fk_BookCategories_has_Books_Books1_idx` (`Books_id` ASC) VISIBLE,
  INDEX `fk_BookCategories_has_Books_BookCategories1_idx` (`BookCategories_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_BookCategories_has_Books_BookCategories1`
    FOREIGN KEY (`BookCategories_id`)
    REFERENCES `PreTpi`.`BookCategories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookCategories_has_Books_Books1`
    FOREIGN KEY (`Books_id`)
    REFERENCES `PreTpi`.`Books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `PreTpi`.`Platforms_publishes_VideoGames` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Platforms_id` INT(11) NOT NULL,
  `VideoGames_id` INT(11) NOT NULL,
  INDEX `fk_Platforms_has_VideoGames_VideoGames1_idx` (`VideoGames_id` ASC) VISIBLE,
  INDEX `fk_Platforms_has_VideoGames_Platforms1_idx` (`Platforms_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Platforms_has_VideoGames_Platforms1`
    FOREIGN KEY (`Platforms_id`)
    REFERENCES `PreTpi`.`Platforms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Platforms_has_VideoGames_VideoGames1`
    FOREIGN KEY (`VideoGames_id`)
    REFERENCES `PreTpi`.`VideoGames` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
