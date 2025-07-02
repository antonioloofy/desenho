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
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NULL,
  `idade` DECIMAL(10,2) NULL,
  `data_de_nacimento` DATE NULL,
  `endereço` TEXT(250) NULL,
  `clientecol` VARCHAR(45) NULL,
  `cpf` VARCHAR(350) NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`planos` (
  `idplanos` INT NOT NULL,
  `planos` VARCHAR(45) NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idplanos`),
  INDEX `fk_planos_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_planos_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionarios` (
  `idfuncionarios` INT NOT NULL,
  `gerente` VARCHAR(45) NOT NULL,
  `professor` VARCHAR(45) NOT NULL,
  `nutricionista` VARCHAR(45) NOT NULL,
  `funcionario_comum` VARCHAR(45) NULL,
  PRIMARY KEY (`idfuncionarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produtos` (
  `idprodutos` INT NOT NULL,
  `produtos` VARCHAR(45) NULL,
  PRIMARY KEY (`idprodutos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cobrança`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cobrança` (
  `planos_idplanos` INT NOT NULL,
  `produtos_idprodutos` INT NOT NULL,
  `planos` VARCHAR(45) NULL,
  `produtos` VARCHAR(45) NULL,
  PRIMARY KEY (`planos_idplanos`, `produtos_idprodutos`),
  INDEX `fk_planos_has_produtos_produtos1_idx` (`produtos_idprodutos` ASC) VISIBLE,
  INDEX `fk_planos_has_produtos_planos_idx` (`planos_idplanos` ASC) VISIBLE,
  CONSTRAINT `fk_planos_has_produtos_planos`
    FOREIGN KEY (`planos_idplanos`)
    REFERENCES `mydb`.`planos` (`idplanos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_planos_has_produtos_produtos1`
    FOREIGN KEY (`produtos_idprodutos`)
    REFERENCES `mydb`.`produtos` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pagamento` (
  `cliente_idcliente` INT NOT NULL,
  `cobrança_planos_idplanos` INT NOT NULL,
  `cobrança_produtos_idprodutos` INT NOT NULL,
  `produtos-valor` DECIMAL(250) NOT NULL,
  `planos-valor` DECIMAL(250) NOT NULL,
  PRIMARY KEY (`cliente_idcliente`, `cobrança_planos_idplanos`, `cobrança_produtos_idprodutos`),
  INDEX `fk_cliente_has_cobrança_cobrança1_idx` (`cobrança_planos_idplanos` ASC, `cobrança_produtos_idprodutos` ASC) VISIBLE,
  INDEX `fk_cliente_has_cobrança_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_cobrança_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_cobrança_cobrança1`
    FOREIGN KEY (`cobrança_planos_idplanos` , `cobrança_produtos_idprodutos`)
    REFERENCES `mydb`.`cobrança` (`planos_idplanos` , `produtos_idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
