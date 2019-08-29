-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MockTestCompany
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MockTestCompany
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MockTestCompany` DEFAULT CHARACTER SET latin1 ;
USE `MockTestCompany` ;

-- -----------------------------------------------------
-- Table `MockTestCompany`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`Customer` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`Customer` (
  `idCustomer` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerAddress` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerCity` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerPostCode` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerEmailAddress` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerCountry` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = Memory
DEFAULT CHARACTER SET = latin1
COMMENT = 'The people who take the tests at the test centres';


-- -----------------------------------------------------
-- Table `MockTestCompany`.`TestCentre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`TestCentre` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`TestCentre` (
  `idTestCentre` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestCentreName` VARCHAR(255) NOT NULL,
  `TestCentreAddress` VARCHAR(255) NULL,
  `TestCentreCity` VARCHAR(255) NOT NULL,
  `TestCentrePostCode` VARCHAR(255) NULL,
  `TestCentreCountry` VARCHAR(255) NOT NULL,
  `TestCentreCompany` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idTestCentre`))
ENGINE = Memory
DEFAULT CHARACTER SET = latin1
COMMENT = 'Represents the Place that at test takes place.';


-- -----------------------------------------------------
-- Table `MockTestCompany`.`TestMandate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`TestMandate` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`TestMandate` (
  `idTestMandate` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestMandateName` VARCHAR(255) NOT NULL,
  `TestMandateProfessionalBody` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTestMandate`))
ENGINE = Memory
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompany`.`TestCertification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`TestCertification` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`TestCertification` (
  `idTestCertification` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestCertifcationName` VARCHAR(255) NOT NULL,
  `TestCertifcationPrice` DOUBLE NOT NULL,
  `idTestMandate` INT(10) UNSIGNED NULL DEFAULT NULL,
  `TestCertificationRequiredCertification` INT UNSIGNED NULL,
  PRIMARY KEY (`idTestCertification`),
  INDEX `abc` (`idTestMandate` ASC),
  CONSTRAINT `abc`
    FOREIGN KEY (`idTestMandate`)
    REFERENCES `MockTestCompany`.`TestMandate` (`idTestMandate`))
ENGINE = Memory
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompany`.`TestCertificationPart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`TestCertificationPart` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`TestCertificationPart` (
  `idTestCertificationPart` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idTestCertification` INT(10) UNSIGNED NULL DEFAULT NULL,
  `TestCertificationPartName` VARCHAR(255) NULL DEFAULT NULL,
  `TestCertificationRetestPrice` FLOAT UNSIGNED NOT NULL,
  `TestCertificationPartSequenceNumber` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idTestCertificationPart`),
  INDEX `Certification` (`idTestCertification` ASC),
  CONSTRAINT `cert`
    FOREIGN KEY (`idTestCertification`)
    REFERENCES `MockTestCompany`.`TestCertification` (`idTestCertification`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Memory
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompany`.`CustomerBooking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`CustomerBooking` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`CustomerBooking` (
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
    REFERENCES `MockTestCompany`.`TestCentre` (`idTestCentre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fktestCertPart`
    FOREIGN KEY (`idTestCertificationPart`)
    REFERENCES `MockTestCompany`.`TestCertificationPart` (`idTestCertificationPart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkcust`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `MockTestCompany`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Memory;


-- -----------------------------------------------------
-- Table `MockTestCompany`.`CustomerVisit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`CustomerVisit` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`CustomerVisit` (
  `idCustomerVisit` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerVisitArrivalTime` DATETIME NOT NULL,
  `idCustomerBooking` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCustomerVisit`),
  INDEX `booking` (`idCustomerBooking` ASC),
  CONSTRAINT `booking`
    FOREIGN KEY (`idCustomerBooking`)
    REFERENCES `MockTestCompany`.`CustomerBooking` (`idCustomerBooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Memory;


-- -----------------------------------------------------
-- Table `MockTestCompany`.`PresentedIdentification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`PresentedIdentification` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`PresentedIdentification` (
  `idPresentedIdentification` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PresentedIdentificationType` VARCHAR(255) NOT NULL,
  `PresentedIdentificationValid` VARCHAR(255) NOT NULL,
  `PresentedIdentificationComments` VARCHAR(4000) NULL,
  `idCustomerVisit` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPresentedIdentification`),
  INDEX `visit_idx` (`idCustomerVisit` ASC),
  CONSTRAINT `visit`
    FOREIGN KEY (`idCustomerVisit`)
    REFERENCES `MockTestCompany`.`CustomerVisit` (`idCustomerVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Memory;


-- -----------------------------------------------------
-- Table `MockTestCompany`.`CustomerPayment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`CustomerPayment` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`CustomerPayment` (
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
    REFERENCES `MockTestCompany`.`CustomerBooking` (`idCustomerBooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Memory;


-- -----------------------------------------------------
-- Table `MockTestCompany`.`CustomerTestPartResult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany`.`CustomerTestPartResult` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany`.`CustomerTestPartResult` (
  `idCustomerTestPartResult` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCustomerVisit` INT UNSIGNED NOT NULL,
  `CustomerTestPartResultOutcome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCustomerTestPartResult`),
  INDEX `custvisit_idx` (`idCustomerVisit` ASC),
  CONSTRAINT `custvisit`
    FOREIGN KEY (`idCustomerVisit`)
    REFERENCES `MockTestCompany`.`CustomerVisit` (`idCustomerVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Memory;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
