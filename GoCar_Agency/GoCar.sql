SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GoCar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GoCar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GoCar` DEFAULT CHARACTER SET utf8 ;
USE `GoCar` ;

-- -----------------------------------------------------
-- Table `GoCar`.`Seller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoCar`.`Seller` (
  `idSeller` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Date_of_Birth` DATE NOT NULL,
  `Telephone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSeller`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GoCar`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoCar`.`Customer` (
  `idCustomer` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Date_of_Birth` DATE NOT NULL,
  `Telephone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GoCar`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoCar`.`Invoice` (
  `idInvoice` INT NOT NULL,
  `Cost` INT NOT NULL,
  `Date_of_purchase` DATE NOT NULL,
  PRIMARY KEY (`idInvoice`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GoCar`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoCar`.`Car` (
  `idCar-Serial_number` INT NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `New` TINYINT NOT NULL,
  `Cost` INT NOT NULL,
  `Seller_idSeller` INT NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  `Invoice_idInvoice` INT NOT NULL,
  PRIMARY KEY (`idCar-Serial_number`, `Seller_idSeller`, `Customer_idCustomer`),
  INDEX `fk_Car_Seller_idx` (`Seller_idSeller` ASC) VISIBLE,
  INDEX `fk_Car_Customer1_idx` (`Customer_idCustomer` ASC) VISIBLE,
  INDEX `fk_Car_Invoice1_idx` (`Invoice_idInvoice` ASC) VISIBLE,
  CONSTRAINT `fk_Car_Seller`
    FOREIGN KEY (`Seller_idSeller`)
    REFERENCES `GoCar`.`Seller` (`idSeller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Car_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `GoCar`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Car_Invoice1`
    FOREIGN KEY (`Invoice_idInvoice`)
    REFERENCES `GoCar`.`Invoice` (`idInvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GoCar`.`Engineer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoCar`.`Engineer` (
  `idEngineer` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Date_of_Birth` DATE NOT NULL,
  `Telephone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Payment_per_hour` INT NOT NULL,
  PRIMARY KEY (`idEngineer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GoCar`.`Repair_Certificate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoCar`.`Repair_Certificate` (
  `idRepair_Certificate` INT NOT NULL,
  `Cost` INT NOT NULL,
  `Date_of_repair` DATE NOT NULL,
  PRIMARY KEY (`idRepair_Certificate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GoCar`.`Engineer_repairs_Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoCar`.`Engineer_repairs_Car` (
  `idRepair` INT NOT NULL,
  `Engineer_idEngineer` INT NOT NULL,
  `Car_idCar-Serial_number` INT NOT NULL,
  `Car_Seller_idSeller` INT NOT NULL,
  `Car_Invoice_idInvoice` INT NOT NULL,
  `Car_Customer_idCustomer` INT NOT NULL,
  `Working_Hours` INT NOT NULL,
  `Repair_Certificate_idRepair_Certificate` INT NOT NULL,
  PRIMARY KEY (`idRepair`),
  INDEX `fk_Engineer_has_Car_Car1_idx` (`Car_idCar-Serial_number` ASC, `Car_Seller_idSeller` ASC, `Car_Invoice_idInvoice` ASC, `Car_Customer_idCustomer` ASC) VISIBLE,
  INDEX `fk_Engineer_has_Car_Engineer1_idx` (`Engineer_idEngineer` ASC) VISIBLE,
  INDEX `fk_Engineer_repairs_Car_Repair_Certificate1_idx` (`Repair_Certificate_idRepair_Certificate` ASC) VISIBLE,
  CONSTRAINT `fk_Engineer_has_Car_Engineer1`
    FOREIGN KEY (`Engineer_idEngineer`)
    REFERENCES `GoCar`.`Engineer` (`idEngineer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Engineer_has_Car_Car1`
    FOREIGN KEY (`Car_idCar-Serial_number` , `Car_Seller_idSeller` , `Car_Customer_idCustomer`)
    REFERENCES `GoCar`.`Car` (`idCar-Serial_number` , `Seller_idSeller` , `Customer_idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Engineer_repairs_Car_Repair_Certificate1`
    FOREIGN KEY (`Repair_Certificate_idRepair_Certificate`)
    REFERENCES `GoCar`.`Repair_Certificate` (`idRepair_Certificate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GoCar`.`Spare_Part`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoCar`.`Spare_Part` (
  `idSpare_Part` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Cost` INT NOT NULL,
  `Engineer_repairs_Car_idRepair` INT NOT NULL,
  PRIMARY KEY (`idSpare_Part`),
  INDEX `fk_Spare_Part_Engineer_repairs_Car1_idx` (`Engineer_repairs_Car_idRepair` ASC) VISIBLE,
  CONSTRAINT `fk_Spare_Part_Engineer_repairs_Car1`
    FOREIGN KEY (`Engineer_repairs_Car_idRepair`)
    REFERENCES `GoCar`.`Engineer_repairs_Car` (`idRepair`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
