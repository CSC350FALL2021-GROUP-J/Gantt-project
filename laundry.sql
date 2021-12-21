-- MySQL Script generated by MySQL Workbench
-- Mon Dec 20 23:17:45 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema laundry
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema laundry
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laundry` DEFAULT CHARACTER SET utf8 ;
USE `laundry` ;

-- -----------------------------------------------------
-- Table `laundry`.`Tenant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laundry`.`Tenant` (
  `userID` VARCHAR(20) NOT NULL,
  `userPassword` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `laundry`.`TimeSlot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laundry`.`TimeSlot` (
  `availableTimeslot` CHAR(6) NOT NULL,
  `selectedTimeslot` CHAR(6) NULL,
  PRIMARY KEY (`availableTimeslot`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `laundry`.`Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laundry`.`Schedule` (
  `weeklySchedule` VARCHAR(45) NOT NULL,
  `Tenant_userID` VARCHAR(20) NOT NULL,
  `TimeSlot_availableTimeslot` CHAR(6) NOT NULL,
  PRIMARY KEY (`weeklySchedule`, `Tenant_userID`, `TimeSlot_availableTimeslot`),
  INDEX `fk_Schedule_Tenant_idx` (`Tenant_userID` ASC) VISIBLE,
  INDEX `fk_Schedule_TimeSlot1_idx` (`TimeSlot_availableTimeslot` ASC) VISIBLE,
  CONSTRAINT `fk_Schedule_Tenant`
    FOREIGN KEY (`Tenant_userID`)
    REFERENCES `laundry`.`Tenant` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_TimeSlot1`
    FOREIGN KEY (`TimeSlot_availableTimeslot`)
    REFERENCES `laundry`.`TimeSlot` (`availableTimeslot`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
