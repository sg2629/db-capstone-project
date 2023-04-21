-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Cutomer Detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Cutomer Detail` (
  `CustomerId` INT NOT NULL,
  `CustomerDate` DATE NOT NULL,
  `ContactNumber` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffId` INT NOT NULL,
  `StaffName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` FLOAT NOT NULL,
  PRIMARY KEY (`StaffId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuId` INT NOT NULL,
  `MenuType` VARCHAR(45) NOT NULL,
  `MenuNames` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingsId` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerId` INT NOT NULL,
  `Menu-Id` INT NOT NULL,
  `StaffId` INT NOT NULL,
  PRIMARY KEY (`BookingsId`),
  INDEX `CustomerId_idx` (`CustomerId` ASC) VISIBLE,
  INDEX `MenuId_fk_idx` (`Menu-Id` ASC) VISIBLE,
  INDEX `StaffId_fk_idx` (`StaffId` ASC) VISIBLE,
  CONSTRAINT `CustomerId_fk`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `LittleLemonDB`.`Cutomer Detail` (`CustomerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MenuId_fk`
    FOREIGN KEY (`Menu-Id`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `StaffId_fk`
    FOREIGN KEY (`StaffId`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderId` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` FLOAT NOT NULL,
  `CustomerId` INT NOT NULL,
  `MenuId` INT NOT NULL,
  PRIMARY KEY (`OrderId`),
  INDEX `CustomerId_fk_idx` (`CustomerId` ASC) VISIBLE,
  INDEX `MenuId_fk_idx` (`MenuId` ASC) VISIBLE,
  CONSTRAINT `CustomersId_fk`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `LittleLemonDB`.`Cutomer Detail` (`CustomerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MenusId_fk`
    FOREIGN KEY (`MenuId`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDelivery Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDelivery Status` (
  `DeliveryId` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(255) NOT NULL,
  `OrderId` INT NOT NULL,
  PRIMARY KEY (`DeliveryId`),
  INDEX `OrderId_fk_idx` (`OrderId` ASC) VISIBLE,
  CONSTRAINT `OrderId_fk`
    FOREIGN KEY (`OrderId`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;