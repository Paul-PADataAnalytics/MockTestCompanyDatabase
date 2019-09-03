-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MockTestCompany1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MockTestCompany1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MockTestCompany1` DEFAULT CHARACTER SET latin1 ;
USE `MockTestCompany1` ;

-- -----------------------------------------------------
-- Table `MockTestCompany1`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`Customer` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`Customer` (
  `idCustomer` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerAddress` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerCity` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerPostCode` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerEmailAddress` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  `CustomerCountry` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = Innodb
DEFAULT CHARACTER SET = latin1
COMMENT = 'The people who take the tests at the test centres';


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`TestCentre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`TestCentre` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`TestCentre` (
  `idTestCentre` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestCentreName` VARCHAR(255) NOT NULL,
  `TestCentreAddress` VARCHAR(255) NULL,
  `TestCentreCity` VARCHAR(255) NOT NULL,
  `TestCentrePostCode` VARCHAR(255) NULL,
  `TestCentreCountry` VARCHAR(255) NOT NULL,
  `TestCentreCompany` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idTestCentre`))
ENGINE = Innodb
DEFAULT CHARACTER SET = latin1
COMMENT = 'Represents the Place that at test takes place.';


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`TestMandate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`TestMandate` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`TestMandate` (
  `idTestMandate` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestMandateName` VARCHAR(255) NOT NULL,
  `TestMandateProfessionalBody` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTestMandate`))
ENGINE = Innodb
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`TestCertification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`TestCertification` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`TestCertification` (
  `idTestCertification` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TestCertifcationName` VARCHAR(255) NOT NULL,
  `TestCertifcationPrice` DOUBLE NOT NULL,
  `idTestMandate` INT(10) UNSIGNED NULL DEFAULT NULL,
  `TestCertificationRequiredCertification` INT UNSIGNED NULL,
  PRIMARY KEY (`idTestCertification`),
  INDEX `abc` (`idTestMandate` ASC),
  CONSTRAINT `abc`
    FOREIGN KEY (`idTestMandate`)
    REFERENCES `MockTestCompany1`.`TestMandate` (`idTestMandate`))
ENGINE = Innodb
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`TestCertificationPart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`TestCertificationPart` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`TestCertificationPart` (
  `idTestCertificationPart` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idTestCertification` INT(10) UNSIGNED NULL DEFAULT NULL,
  `TestCertificationPartName` VARCHAR(255) NULL DEFAULT NULL,
  `TestCertificationRetestPrice` FLOAT UNSIGNED NOT NULL,
  `TestCertificationPartSequenceNumber` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idTestCertificationPart`),
  INDEX `Certification` (`idTestCertification` ASC),
  CONSTRAINT `cert`
    FOREIGN KEY (`idTestCertification`)
    REFERENCES `MockTestCompany1`.`TestCertification` (`idTestCertification`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Innodb
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`CustomerBooking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`CustomerBooking` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`CustomerBooking` (
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
    REFERENCES `MockTestCompany1`.`TestCentre` (`idTestCentre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fktestCertPart`
    FOREIGN KEY (`idTestCertificationPart`)
    REFERENCES `MockTestCompany1`.`TestCertificationPart` (`idTestCertificationPart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkcust`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `MockTestCompany1`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Innodb;


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`CustomerVisit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`CustomerVisit` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`CustomerVisit` (
  `idCustomerVisit` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerVisitArrivalTime` DATETIME NOT NULL,
  `idCustomerBooking` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCustomerVisit`),
  INDEX `booking` (`idCustomerBooking` ASC),
  CONSTRAINT `booking`
    FOREIGN KEY (`idCustomerBooking`)
    REFERENCES `MockTestCompany1`.`CustomerBooking` (`idCustomerBooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Innodb;


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`PresentedIdentification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`PresentedIdentification` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`PresentedIdentification` (
  `idPresentedIdentification` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PresentedIdentificationType` VARCHAR(255) NOT NULL,
  `PresentedIdentificationValid` VARCHAR(255) NOT NULL,
  `PresentedIdentificationComments` VARCHAR(4000) NULL,
  `idCustomerVisit` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPresentedIdentification`),
  INDEX `visit_idx` (`idCustomerVisit` ASC),
  CONSTRAINT `visit`
    FOREIGN KEY (`idCustomerVisit`)
    REFERENCES `MockTestCompany1`.`CustomerVisit` (`idCustomerVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Innodb;


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`CustomerPayment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`CustomerPayment` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`CustomerPayment` (
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
    REFERENCES `MockTestCompany1`.`CustomerBooking` (`idCustomerBooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Innodb;


-- -----------------------------------------------------
-- Table `MockTestCompany1`.`CustomerTestPartResult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MockTestCompany1`.`CustomerTestPartResult` ;

CREATE TABLE IF NOT EXISTS `MockTestCompany1`.`CustomerTestPartResult` (
  `idCustomerTestPartResult` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCustomerVisit` INT UNSIGNED NOT NULL,
  `CustomerTestPartResultOutcome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCustomerTestPartResult`),
  INDEX `custvisit_idx` (`idCustomerVisit` ASC),
  CONSTRAINT `custvisit`
    FOREIGN KEY (`idCustomerVisit`)
    REFERENCES `MockTestCompany1`.`CustomerVisit` (`idCustomerVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = Innodb;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
