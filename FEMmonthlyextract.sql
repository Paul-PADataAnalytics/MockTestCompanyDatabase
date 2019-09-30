-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MockTestCompanyMonthly
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `MockTestCompanyMonthly` ;

-- -----------------------------------------------------
-- Schema MockTestCompanyMonthly
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MockTestCompanyMonthly` DEFAULT CHARACTER SET latin1 ;
USE `MockTestCompanyMonthly` ;

-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`Customer` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`Customer` (
  `idCustomer` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerAddress` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerCity` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerPostCode` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerEmailAddress` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerCountry` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerSpecialNeeds` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'The people who take the tests at the test centres';


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`TestCentre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`TestCentre` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`TestCentre` (
  `idTestCentre` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestCentreName` VARCHAR(255) NOT NULL,
  `TestCentreAddress` VARCHAR(255) NULL,
  `TestCentreCity` VARCHAR(255) NOT NULL,
  `TestCentrePostCode` VARCHAR(255) NULL,
  `TestCentreCountry` VARCHAR(255) NOT NULL,
  `TestCentreCompany` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idTestCentre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COMMENT = 'Represents the Place that at test takes place.';


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`TestMandate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`TestMandate` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`TestMandate` (
  `idTestMandate` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestMandateName` VARCHAR(255) NOT NULL,
  `TestMandateProfessionalBody` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTestMandate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`TestCertification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`TestCertification` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`TestCertification` (
  `idTestCertification` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestCertifcationName` VARCHAR(255) NOT NULL,
  `TestCertifcationPrice` DOUBLE NOT NULL,
  `idTestMandate` INT(10) UNSIGNED NULL DEFAULT NULL,
  `TestCertificationRequiredCertification` INT UNSIGNED NULL,
  PRIMARY KEY (`idTestCertification`),
  INDEX `abc` (`idTestMandate` ASC),
  CONSTRAINT `abc`
    FOREIGN KEY (`idTestMandate`)
    REFERENCES `MockTestCompanyMonthly`.`TestMandate` (`idTestMandate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`TestCertificationPart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`TestCertificationPart` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`TestCertificationPart` (
  `idTestCertificationPart` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idTestCertification` INT(10) UNSIGNED NULL DEFAULT NULL,
  `TestCertificationPartName` VARCHAR(255) NULL DEFAULT NULL,
  `TestCertificationRetestPrice` FLOAT UNSIGNED NOT NULL,
  `TestCertificationPartSequenceNumber` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idTestCertificationPart`),
  INDEX `Certification` (`idTestCertification` ASC),
  CONSTRAINT `cert`
    FOREIGN KEY (`idTestCertification`)
    REFERENCES `MockTestCompanyMonthly`.`TestCertification` (`idTestCertification`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`CustomerBooking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`CustomerBooking` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`CustomerBooking` (
  `idCustomerBooking` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idTestCentre` INT UNSIGNED NOT NULL,
  `CustomerBookingDateTime` DATETIME NOT NULL,
  `idTestCertificationPart` INT UNSIGNED NOT NULL,
  `idCustomer` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCustomerBooking`),
  INDEX `testcentre_idx` (`idTestCentre` ASC),
  INDEX `testpart_idx` (`idTestCertificationPart` ASC),
  INDEX `fkcust_idx` (`idCustomer` ASC),
  CONSTRAINT `fkTestCentre`
    FOREIGN KEY (`idTestCentre`)
    REFERENCES `MockTestCompanyMonthly`.`TestCentre` (`idTestCentre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fktestCertPart`
    FOREIGN KEY (`idTestCertificationPart`)
    REFERENCES `MockTestCompanyMonthly`.`TestCertificationPart` (`idTestCertificationPart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkcust`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `MockTestCompanyMonthly`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`CustomerVisit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`CustomerVisit` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`CustomerVisit` (
  `idCustomerVisit` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerVisitArrivalTime` DATETIME NOT NULL,
  `idCustomerBooking` INT UNSIGNED NOT NULL,
  `CustomerVisitOutcome` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCustomerVisit`),
  INDEX `booking` (`idCustomerBooking` ASC),
  CONSTRAINT `booking`
    FOREIGN KEY (`idCustomerBooking`)
    REFERENCES `MockTestCompanyMonthly`.`CustomerBooking` (`idCustomerBooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`PresentedIdentification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`PresentedIdentification` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`PresentedIdentification` (
  `idPresentedIdentification` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PresentedIdentificationType` VARCHAR(255) NOT NULL,
  `PresentedIdentificationValid` VARCHAR(255) NOT NULL,
  `PresentedIdentificationComments` VARCHAR(4000) NULL,
  `idCustomerVisit` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPresentedIdentification`),
  INDEX `visit_idx` (`idCustomerVisit` ASC),
  CONSTRAINT `visit`
    FOREIGN KEY (`idCustomerVisit`)
    REFERENCES `MockTestCompanyMonthly`.`CustomerVisit` (`idCustomerVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`CustomerPayment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`CustomerPayment` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`CustomerPayment` (
  `idCustomerPayment` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerPaymentAmount` DOUBLE UNSIGNED NOT NULL,
  `idCustomerBooking` INT(10) UNSIGNED NOT NULL,
  `CustomerPaymentMethod` VARCHAR(255) NOT NULL,
  `CustomerPaymentResult` VARCHAR(255) NOT NULL,
  `CustomerPaymentExternalID` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCustomerPayment`),
  INDEX `fk_CustomerPayment_CustomerBooking1_idx` (`idCustomerBooking` ASC),
  CONSTRAINT `fk_CustomerPayment_CustomerBooking1`
    FOREIGN KEY (`idCustomerBooking`)
    REFERENCES `MockTestCompanyMonthly`.`CustomerBooking` (`idCustomerBooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MockTestCompanyMonthly`.`CustomerTestPartResult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompanyMonthly`.`CustomerTestPartResult` ;

CREATE TABLE IF NOT EXISTS `MockTestCompanyMonthly`.`CustomerTestPartResult` (
  `idCustomerTestPartResult` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCustomerVisit` INT UNSIGNED NOT NULL,
  `CustomerTestPartResultOutcome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCustomerTestPartResult`),
  INDEX `custvisit_idx` (`idCustomerVisit` ASC),
  CONSTRAINT `custvisit`
    FOREIGN KEY (`idCustomerVisit`)
    REFERENCES `MockTestCompanyMonthly`.`CustomerVisit` (`idCustomerVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
