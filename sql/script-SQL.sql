-- MySQL Script generated by MySQL Workbench
-- Mon Jul  6 21:27:54 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

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
-- Table `mydb`.`GoogleMaps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GoogleMaps` (
  `idGoogleMaps` INT NOT NULL,
  `coordenadasGeo` INT(10) NOT NULL,
  PRIMARY KEY (`idGoogleMaps`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `datanasc` DATE NOT NULL,
  `endereco` VARCHAR(70) NOT NULL,
  `GoogleMaps_idGoogleMaps` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_GoogleMaps1_idx` (`GoogleMaps_idGoogleMaps` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_GoogleMaps1`
    FOREIGN KEY (`GoogleMaps_idGoogleMaps`)
    REFERENCES `mydb`.`GoogleMaps` (`idGoogleMaps`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bicicleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bicicleta` (
  `idBicicleta` INT NOT NULL,
  `documento` INT(25) NOT NULL,
  `ano` DATE NOT NULL,
  `modelo` VARCHAR(10) NOT NULL,
  `marca` VARCHAR(20) NOT NULL,
  `GoogleMaps_idGoogleMaps` INT NOT NULL,
  PRIMARY KEY (`idBicicleta`),
  INDEX `fk_Bicicleta_GoogleMaps1_idx` (`GoogleMaps_idGoogleMaps` ASC) VISIBLE,
  CONSTRAINT `fk_Bicicleta_GoogleMaps1`
    FOREIGN KEY (`GoogleMaps_idGoogleMaps`)
    REFERENCES `mydb`.`GoogleMaps` (`idGoogleMaps`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Emprestimo` (
  `idEmprestimo` INT NOT NULL,
  `Bicicleta_idBicicleta` INT NOT NULL,
  PRIMARY KEY (`idEmprestimo`),
  INDEX `fk_Emprestimo_Bicicleta1_idx` (`Bicicleta_idBicicleta` ASC) VISIBLE,
  CONSTRAINT `fk_Emprestimo_Bicicleta1`
    FOREIGN KEY (`Bicicleta_idBicicleta`)
    REFERENCES `mydb`.`Bicicleta` (`idBicicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PicPay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PicPay` (
  `idPicPay` INT NOT NULL,
  `pagamento_recebimento` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPicPay`),
  INDEX `fk_PicPay_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_PicPay_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gerenciador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gerenciador` (
  `idGer` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Bicicleta_idBicicleta` INT NOT NULL,
  `Emprestimo_idEmprestimo` INT NOT NULL,
  `PicPay_idPicPay` INT NOT NULL,
  PRIMARY KEY (`idGer`),
  INDEX `fk_Gerenciador_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Gerenciador_Bicicleta1_idx` (`Bicicleta_idBicicleta` ASC) VISIBLE,
  INDEX `fk_Gerenciador_Emprestimo1_idx` (`Emprestimo_idEmprestimo` ASC) VISIBLE,
  INDEX `fk_Gerenciador_PicPay1_idx` (`PicPay_idPicPay` ASC) VISIBLE,
  CONSTRAINT `fk_Gerenciador_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gerenciador_Bicicleta1`
    FOREIGN KEY (`Bicicleta_idBicicleta`)
    REFERENCES `mydb`.`Bicicleta` (`idBicicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gerenciador_Emprestimo1`
    FOREIGN KEY (`Emprestimo_idEmprestimo`)
    REFERENCES `mydb`.`Emprestimo` (`idEmprestimo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gerenciador_PicPay1`
    FOREIGN KEY (`PicPay_idPicPay`)
    REFERENCES `mydb`.`PicPay` (`idPicPay`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
