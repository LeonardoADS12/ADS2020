SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `datanasc` DATE NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bicileta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bicileta` (
  `idBicileta` INT NOT NULL,
  `idDocumento` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(10) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idBicileta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LocAdmin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LocAdmin` (
  `idLocAdmin` INT NOT NULL,
  `coordenadasGeo` VARCHAR(14) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Bicileta_idBicileta` INT NOT NULL,
  PRIMARY KEY (`idLocAdmin`),
  INDEX `fk_LocAdmin_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_LocAdmin_Bicileta1_idx` (`Bicileta_idBicileta` ASC) VISIBLE,
  CONSTRAINT `fk_LocAdmin_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LocAdmin_Bicileta1`
    FOREIGN KEY (`Bicileta_idBicileta`)
    REFERENCES `mydb`.`Bicileta` (`idBicileta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `idAdmin` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Bicileta_idBicileta` INT NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `datanasc` DATE NOT NULL,
  `LocAdmin_idLocAdmin` INT NOT NULL,
  PRIMARY KEY (`idAdmin`, `LocAdmin_idLocAdmin`),
  INDEX `fk_Administrador_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Administrador_Bicileta1_idx` (`Bicileta_idBicileta` ASC) VISIBLE,
  INDEX `fk_Administrador_LocAdmin1_idx` (`LocAdmin_idLocAdmin` ASC) VISIBLE,
  CONSTRAINT `fk_Administrador_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrador_Bicileta1`
    FOREIGN KEY (`Bicileta_idBicileta`)
    REFERENCES `mydb`.`Bicileta` (`idBicileta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrador_LocAdmin1`
    FOREIGN KEY (`LocAdmin_idLocAdmin`)
    REFERENCES `mydb`.`LocAdmin` (`idLocAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrgFinanceira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrgFinanceira` (
  `idOrgFinanceira` INT NOT NULL,
  `razaosocial` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  PRIMARY KEY (`idOrgFinanceira`),
  INDEX `fk_OrgFinanceira_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_OrgFinanceira_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_OrgFinanceira_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrgFinanceira_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `mydb`.`Administrador` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
