-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PreTpi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PreTpi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PreTpi` DEFAULT CHARACTER SET utf8 ;
USE `PreTpi` ;

-- -----------------------------------------------------
-- Table `PreTpi`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` CHAR(60) NOT NULL,
  `Blocked` TINYINT NOT NULL,
  `Roles_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Users_Roles1_idx` (`Roles_id` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Roles1`
    FOREIGN KEY (`Roles_id`)
    REFERENCES `PreTpi`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`firstname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `Authors_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_Books_Authors1_idx` (`Authors_id` ASC) VISIBLE,
  CONSTRAINT `fk_Books_Authors1`
    FOREIGN KEY (`Authors_id`)
    REFERENCES `PreTpi`.`Authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Creators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Creators` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`firstname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Series` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `releasedate` DATE NULL,
  `season` INT NULL,
  `Creators_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_Series_Creators1_idx` (`Creators_id` ASC) VISIBLE,
  CONSTRAINT `fk_Series_Creators1`
    FOREIGN KEY (`Creators_id`)
    REFERENCES `PreTpi`.`Creators` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Films` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `releasedate` DATE NULL,
  `Creators_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_Films_Creators1_idx` (`Creators_id` ASC) VISIBLE,
  CONSTRAINT `fk_Films_Creators1`
    FOREIGN KEY (`Creators_id`)
    REFERENCES `PreTpi`.`Creators` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Developers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Developers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `companyname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `companyname_UNIQUE` (`companyname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Platforms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Platforms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Type_UNIQUE` (`type` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`VideoGames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`VideoGames` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `releasedate` DATE NULL,
  `Developers_id` INT NOT NULL,
  `Platforms_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_VideoGames_Devloppers1_idx` (`Developers_id` ASC) VISIBLE,
  INDEX `fk_VideoGames_Platforms1_idx` (`Platforms_id` ASC) VISIBLE,
  CONSTRAINT `fk_VideoGames_Devloppers1`
    FOREIGN KEY (`Developers_id`)
    REFERENCES `PreTpi`.`Developers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VideoGames_Platforms1`
    FOREIGN KEY (`Platforms_id`)
    REFERENCES `PreTpi`.`Platforms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`Reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `review` VARCHAR(500) NOT NULL,
  `rating` INT NOT NULL,
  `date` DATE NOT NULL,
  `approuved` TINYINT NOT NULL,
  `Users_id` INT NOT NULL,
  `Books_id` INT NULL,
  `Series_id` INT NULL,
  `Films_id` INT NULL,
  `VideoGames_id` INT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`VideoGameCategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`VideoGameCategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Genre_UNIQUE` (`Genre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`BookCategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`BookCategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `genre_UNIQUE` (`genre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`MediaCategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`MediaCategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `genre_UNIQUE` (`genre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`VideoGameCategories_classifies_VideoGames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`VideoGameCategories_classifies_VideoGames` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `VideoGames_id` INT NOT NULL,
  `VideoGameCategories_id` INT NOT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`MediaCategories_classifies_Series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`MediaCategories_classifies_Series` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Series_id` INT NOT NULL,
  `MediaCategories_id` INT NOT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`MediaCategories_classifies_Films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`MediaCategories_classifies_Films` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Films_id` INT NOT NULL,
  `MediaCategories_id` INT NOT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PreTpi`.`BookCategories_classifies_Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PreTpi`.`BookCategories_classifies_Books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `BookCategories_id` INT NOT NULL,
  `Books_id` INT NOT NULL,
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
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
