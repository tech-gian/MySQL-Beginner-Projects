-- MySQL Script generated by MySQL Workbench
-- Sun Mar 14 22:15:37 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema School
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema School
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `School` DEFAULT CHARACTER SET utf8 ;
USE `School` ;

-- -----------------------------------------------------
-- Table `School`.`Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Teachers` (
  `idTeachers` INT NOT NULL,
  `First Name` VARCHAR(45) NOT NULL,
  `Last Name` VARCHAR(45) NOT NULL,
  `Phone` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTeachers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Students` (
  `idStudents` INT NOT NULL,
  `First Name` VARCHAR(45) NOT NULL,
  `Last Name` VARCHAR(45) NOT NULL,
  `Phone` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Video Conference User` VARCHAR(45) NOT NULL,
  `Comments` LONGTEXT NOT NULL,
  PRIMARY KEY (`idStudents`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Subjects` (
  `idSubjects` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Level` INT NOT NULL,
  PRIMARY KEY (`idSubjects`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Classes` (
  `idClasses` INT NOT NULL,
  `Max Students` INT NULL,
  `Teachers_idTeachers` INT NOT NULL,
  `Subjects_idSubjects` INT NOT NULL,
  PRIMARY KEY (`idClasses`),
  INDEX `fk_Classes_Teachers1_idx` (`Teachers_idTeachers` ASC) VISIBLE,
  INDEX `fk_Classes_Subjects1_idx` (`Subjects_idSubjects` ASC) VISIBLE,
  CONSTRAINT `fk_Classes_Teachers1`
    FOREIGN KEY (`Teachers_idTeachers`)
    REFERENCES `School`.`Teachers` (`idTeachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Classes_Subjects1`
    FOREIGN KEY (`Subjects_idSubjects`)
    REFERENCES `School`.`Subjects` (`idSubjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Class Hours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Class Hours` (
  `idClass Hours` INT NOT NULL,
  `Weekday` VARCHAR(45) NOT NULL,
  `Time Start` TIME NOT NULL,
  `Time End` TIME NOT NULL,
  PRIMARY KEY (`idClass Hours`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Teachers_has_Subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Teachers_has_Subjects` (
  `Teachers_idTeachers` INT NOT NULL,
  `Subjects_idSubjects` INT NOT NULL,
  PRIMARY KEY (`Teachers_idTeachers`, `Subjects_idSubjects`),
  INDEX `fk_Teachers_has_Subjects_Subjects1_idx` (`Subjects_idSubjects` ASC) VISIBLE,
  INDEX `fk_Teachers_has_Subjects_Teachers_idx` (`Teachers_idTeachers` ASC) VISIBLE,
  CONSTRAINT `fk_Teachers_has_Subjects_Teachers`
    FOREIGN KEY (`Teachers_idTeachers`)
    REFERENCES `School`.`Teachers` (`idTeachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teachers_has_Subjects_Subjects1`
    FOREIGN KEY (`Subjects_idSubjects`)
    REFERENCES `School`.`Subjects` (`idSubjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Students_has_Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Students_has_Classes` (
  `Students_idStudents` INT NOT NULL,
  `Classes_idClasses` INT NOT NULL,
  PRIMARY KEY (`Students_idStudents`, `Classes_idClasses`),
  INDEX `fk_Students_has_Classes_Classes1_idx` (`Classes_idClasses` ASC) VISIBLE,
  INDEX `fk_Students_has_Classes_Students1_idx` (`Students_idStudents` ASC) VISIBLE,
  CONSTRAINT `fk_Students_has_Classes_Students1`
    FOREIGN KEY (`Students_idStudents`)
    REFERENCES `School`.`Students` (`idStudents`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_Classes_Classes1`
    FOREIGN KEY (`Classes_idClasses`)
    REFERENCES `School`.`Classes` (`idClasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `School`.`Classes_has_Class Hours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `School`.`Classes_has_Class Hours` (
  `Classes_idClasses` INT NOT NULL,
  `Class Hours_idClass Hours` INT NOT NULL,
  PRIMARY KEY (`Classes_idClasses`, `Class Hours_idClass Hours`),
  INDEX `fk_Classes_has_Class Hours_Class Hours1_idx` (`Class Hours_idClass Hours` ASC) VISIBLE,
  INDEX `fk_Classes_has_Class Hours_Classes1_idx` (`Classes_idClasses` ASC) VISIBLE,
  CONSTRAINT `fk_Classes_has_Class Hours_Classes1`
    FOREIGN KEY (`Classes_idClasses`)
    REFERENCES `School`.`Classes` (`idClasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Classes_has_Class Hours_Class Hours1`
    FOREIGN KEY (`Class Hours_idClass Hours`)
    REFERENCES `School`.`Class Hours` (`idClass Hours`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
