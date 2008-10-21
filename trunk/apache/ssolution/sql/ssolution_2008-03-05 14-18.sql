SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `ssolution`;

CREATE DATABASE `ssolution`
  CHARACTER SET `latin1`
  COLLATE `latin1_general_ci`;

USE `ssolution`;

/* Tables */
DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id`            int AUTO_INCREMENT NOT NULL,
  `login`         varchar(200),
  `senha`         varchar(200) NOT NULL,
  `nome`          varchar(150) NOT NULL,
  `ativo`         tinyint(1) NOT NULL DEFAULT '1',
  `data`          datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ultacesso`     datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ultacesso_ip`  varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM
  COLLATE `latin1_swedish_ci`;

DROP TABLE IF EXISTS `chamados`;

CREATE TABLE `chamados` (
  `id`               int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `tipo_id`          int NOT NULL,
  `cliente_id`       int NOT NULL,
  `admin_id`         int NOT NULL,
  `problema`         text NOT NULL,
  `solucao`          text NOT NULL,
  `status_id`        int NOT NULL,
  `data_abertura`    date NOT NULL,
  `data_fechamento`  date NOT NULL,
  `observacoes`      text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `chamados_status`;

CREATE TABLE `chamados_status` (
  `id`    int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nome`  varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `chamados_tipos`;

CREATE TABLE `chamados_tipos` (
  `id`    int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nome`  varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id`                int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `codigo`            varchar(100) NOT NULL,
  `nome`              varchar(200) NOT NULL,
  `nascimento`        date NOT NULL DEFAULT '0000-00-00',
  `rg`                varchar(20) NOT NULL,
  `cpf`               varchar(30) NOT NULL,
  `sexo`              varchar(1) NOT NULL,
  `grupo_id`          int,
  `endereco`          varchar(300) NOT NULL,
  `numero`            varchar(50) NOT NULL,
  `bloco`             varchar(10) NOT NULL,
  `complemento_tipo`  varchar(5) NOT NULL,
  `complemento`       varchar(50) NOT NULL,
  `cep`               varchar(20) NOT NULL,
  `bairro`            varchar(100) NOT NULL,
  `cidade`            varchar(100) NOT NULL,
  `uf`                varchar(2) NOT NULL,
  `tel_residencial`   varchar(50) NOT NULL,
  `tel_comercial`     varchar(50) NOT NULL,
  `tel_celular1`      varchar(50) NOT NULL,
  `tel_celular2`      varchar(20) NOT NULL,
  `fax`               varchar(50) NOT NULL,
  `site`              varchar(200) NOT NULL,
  `email1`            varchar(300) NOT NULL,
  `email2`            varchar(200) NOT NULL,
  `email3`            varchar(200) NOT NULL,
  `observacoes`       text NOT NULL,
  `datacadastro`      timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM
  COLLATE `latin1_swedish_ci`;

DROP TABLE IF EXISTS `clientes_bkp`;

CREATE TABLE `clientes_bkp` (
  `id`               int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `codigo`           int(20) NOT NULL,
  `nome`             varchar(200) NOT NULL,
  `nascimento`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rg`               varchar(20) NOT NULL,
  `cpf`              varchar(30) NOT NULL,
  `sexo`             varchar(1) NOT NULL,
  `grupo_id`         int,
  `endereco`         varchar(300) NOT NULL,
  `numero`           varchar(50) NOT NULL,
  `complemento`      varchar(50) NOT NULL,
  `cep`              varchar(20) NOT NULL,
  `bairro`           varchar(100) NOT NULL,
  `cidade`           varchar(100) NOT NULL,
  `uf`               varchar(2) NOT NULL,
  `tel_residencial`  varchar(50) NOT NULL,
  `tel_comercial`    varchar(50) NOT NULL,
  `tel_celular1`     varchar(50) NOT NULL,
  `tel_celular2`     varchar(20) NOT NULL,
  `fax`              varchar(50) NOT NULL,
  `email1`           varchar(300) NOT NULL,
  `email2`           varchar(200) NOT NULL,
  `email3`           varchar(200) NOT NULL,
  `observacoes`      text NOT NULL,
  `datacadastro`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM
  COLLATE `latin1_swedish_ci`;

DROP TABLE IF EXISTS `contatos`;

CREATE TABLE `contatos` (
  `id`            int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nome`          varchar(300) NOT NULL,
  `empresa`       varchar(300) NOT NULL,
  `tipo`          varchar(300) NOT NULL,
  `edificio`      varchar(300) NOT NULL,
  `endereco`      varchar(300) NOT NULL,
  `numero`        varchar(300) NOT NULL,
  `complemento`   varchar(300) NOT NULL,
  `bairro`        varchar(300) NOT NULL,
  `cep`           varchar(300) NOT NULL,
  `cidade`        varchar(300) NOT NULL,
  `uf`            varchar(300) NOT NULL,
  `telefone1`     varchar(300) NOT NULL,
  `telefone2`     varchar(300) NOT NULL,
  `celular1`      varchar(300) NOT NULL,
  `celular2`      varchar(300) NOT NULL,
  `email1`        varchar(300) NOT NULL,
  `email2`        varchar(300) NOT NULL,
  `observacoes`   text NOT NULL,
  `datacadastro`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `contratos`;

CREATE TABLE `contratos` (
  `id`                 int AUTO_INCREMENT NOT NULL,
  `ativo`              int NOT NULL,
  `codigo`             varchar(200) NOT NULL,
  `provedor_id`        int NOT NULL,
  `plano_id`           int NOT NULL,
  `cliente_id`         int NOT NULL,
  `grupo_id`           int NOT NULL,
  `descricao`          text NOT NULL,
  `data_inicio`        date NOT NULL,
  `data_termino`       date NOT NULL,
  `vencimento_padrao`  int NOT NULL DEFAULT '10',
  `observacoes`        text NOT NULL,
  `datacadastro`       timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `estacoes`;

CREATE TABLE `estacoes` (
  `id`           int AUTO_INCREMENT NOT NULL,
  `contrato_id`  int NOT NULL,
  `hostname`     varchar(200) NOT NULL,
  `ip`           varchar(11) NOT NULL,
  `mac_address`  varchar(17) NOT NULL,
  `observacoes`  text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `funcoes`;

CREATE TABLE `funcoes` (
  `id`        int AUTO_INCREMENT NOT NULL,
  `pai`       int NOT NULL DEFAULT '0',
  `posicao`   int NOT NULL DEFAULT '0',
  `nome`      varchar(100) NOT NULL,
  `ativo`     tinyint(1) NOT NULL DEFAULT '0',
  `restrito`  tinyint(1) NOT NULL DEFAULT '0',
  `link`      varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM
  COLLATE `latin1_swedish_ci`;

DROP TABLE IF EXISTS `grupos`;

CREATE TABLE `grupos` (
  `id`            int AUTO_INCREMENT NOT NULL,
  `nome_padrao`   varchar(100) NOT NULL,
  `codigo`        varchar(200) NOT NULL,
  `tipo`          int NOT NULL,
  `nome`          varchar(200) NOT NULL,
  `endereco`      varchar(300) NOT NULL,
  `numero`        varchar(100) NOT NULL,
  `bairro`        varchar(300) NOT NULL,
  `cep`           varchar(300) NOT NULL,
  `cidade`        varchar(300) NOT NULL,
  `uf`            varchar(2) NOT NULL,
  `observacoes`   text NOT NULL,
  `datacadastro`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `grupos_tipos`;

CREATE TABLE `grupos_tipos` (
  `id`    int AUTO_INCREMENT NOT NULL,
  `tipo`  varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `logs_admin`;

CREATE TABLE `logs_admin` (
  `id`            int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `login`         varchar(20) NOT NULL,
  `mensagem`      text NOT NULL,
  `query`         text NOT NULL,
  `datacadastro`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `planos`;

CREATE TABLE `planos` (
  `id`                    int AUTO_INCREMENT NOT NULL,
  `codigo`                varchar(200) NOT NULL,
  `nome`                  varchar(200) NOT NULL,
  `descricao`             text NOT NULL,
  `vel_download`          varchar(200) NOT NULL,
  `vel_upload`            varchar(200) NOT NULL,
  `valor_base`            decimal(10,2) NOT NULL,
  `valor_pontoadicional`  decimal(10,2) NOT NULL,
  `fidelidade`            int NOT NULL,
  `observacoes`           text NOT NULL,
  `datacadastro`          timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `provedores`;

CREATE TABLE `provedores` (
  `id`                int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `codigo`            varchar(200) NOT NULL,
  `razaosocial`       varchar(200) NOT NULL,
  `nomefantasia`      varchar(200) NOT NULL,
  `cnpj`              varchar(50) NOT NULL,
  `inscestadual`      varchar(30) NOT NULL,
  `inscmunicipal`     varchar(30) NOT NULL,
  `responsavel`       varchar(200) NOT NULL,
  `endereco`          varchar(200) NOT NULL,
  `numero`            varchar(200) NOT NULL,
  `complemento`       varchar(200) NOT NULL,
  `bairro`            varchar(200) NOT NULL,
  `cep`               varchar(20) NOT NULL,
  `cidade`            varchar(200) NOT NULL,
  `uf`                varchar(2) NOT NULL,
  `tel_principal`     varchar(20) NOT NULL,
  `tel_comercial`     varchar(30) NOT NULL,
  `tel_financeiro`    varchar(30) NOT NULL,
  `tel_suporte`       varchar(30) NOT NULL,
  `celular1`          varchar(30) NOT NULL,
  `celular2`          varchar(20) NOT NULL,
  `celular3`          varchar(20) NOT NULL,
  `fax`               varchar(30) NOT NULL,
  `email_principal`   varchar(200) NOT NULL,
  `email_comercial`   varchar(200) NOT NULL,
  `email_financeiro`  varchar(200) NOT NULL,
  `email_suporte`     varchar(200) NOT NULL,
  `observacoes`       text NOT NULL,
  `datacadastro`      timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

DROP TABLE IF EXISTS `titulos`;

CREATE TABLE `titulos` (
  `id`               int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `contrato_id`      int NOT NULL,
  `data_vencimento`  date NOT NULL,
  `valor`            decimal(2) NOT NULL,
  `observacoes`      text NOT NULL,
  `datacadastro`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM;

/* Data */
INSERT INTO `admins` (`id`, `login`, `senha`, `nome`, `ativo`, `data`, `ultacesso`, `ultacesso_ip`) VALUES (1, 'smart', '550237b8fbcdf3741bb1127d0fc7f6bf', 'Smart Solution TI', 1, '2006-06-02 23:29:00', '2008-01-31 17:25:38', '10.12.7.13');
INSERT INTO `admins` (`id`, `login`, `senha`, `nome`, `ativo`, `data`, `ultacesso`, `ultacesso_ip`) VALUES (2, 'antonio', 'ae0ca2c9525396001d68bb366db5b1ad', 'Antonio Gustavo Sampaio de Oliveira', 1, '2007-11-05 11:31:34', '2008-03-05 14:13:00', '10.12.7.8');
INSERT INTO `admins` (`id`, `login`, `senha`, `nome`, `ativo`, `data`, `ultacesso`, `ultacesso_ip`) VALUES (3, 'sergio', '912318713265d527f3f5f640a550feb9', 'Sergio Henrique Costa', 1, '2008-01-29 11:01:14', '2008-03-05 08:34:28', '10.12.7.13');
INSERT INTO `admins` (`id`, `login`, `senha`, `nome`, `ativo`, `data`, `ultacesso`, `ultacesso_ip`) VALUES (4, 'rebeca', '708a65c007259f302db570f607cfa897', 'Rebeca Schmeiske Fausto', 1, '2008-01-29 11:05:54', '2008-02-01 23:52:46', '10.12.7.7');
COMMIT;

INSERT INTO `chamados` (`id`, `tipo_id`, `cliente_id`, `admin_id`, `status_id`, `data_abertura`, `data_fechamento`) VALUES (3, 1, 56, 1, 3, '2008-02-02', '2003-02-01');
COMMIT;

INSERT INTO `chamados_status` (`id`, `nome`) VALUES (1, 'Aberto');
INSERT INTO `chamados_status` (`id`, `nome`) VALUES (2, 'Encerrado');
INSERT INTO `chamados_status` (`id`, `nome`) VALUES (3, 'Em análise');
COMMIT;

INSERT INTO `chamados_tipos` (`id`, `nome`) VALUES (1, 'Financeiro');
INSERT INTO `chamados_tipos` (`id`, `nome`) VALUES (2, 'Comercial');
INSERT INTO `chamados_tipos` (`id`, `nome`) VALUES (3, 'Manutenção');
INSERT INTO `chamados_tipos` (`id`, `nome`) VALUES (4, 'Outros');
COMMIT;

INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (7, '8001', 'Tulio Hofmann Filho', NULL, '', '', 'M', 3, 'R. Alferes Poli', '294', '', '', 'Ap. 101', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2007-11-23 12:22:09');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (8, '8002', 'Daniel Hiroshi Nielsen Yabu', NULL, '', '034.753.719-79', 'M', 3, 'Rua Alferes Poli', '294', '', '', 'AP 1603', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:09:00');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (9, '8003', 'Robson Lara Moreira', NULL, '', '', 'M', 3, 'Rua Alferes Poli', '294', '', '', 'AP 202', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:09:37');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (10, '8004', 'Felipe Augusto Kubis', NULL, '', '054.165.369-50', 'M', 3, 'Rua Alferes Poli', '294', '', '', 'AP 301', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:10:30');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (11, '08005', 'Mayara Cristina Garcia Machuca ', '2008-03-05', '', '369.742.538-26', 'F', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '303', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:11:33');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (12, '8006', 'Graciele Razera', NULL, '', '644.489.400-04', 'F', 3, 'Rua Alferes Poli', '294', '', '', 'AP 902', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:12:41');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (13, '8008', 'Lucas Nunes da Silveira', NULL, '', '038.062.189-43', 'M', 3, 'Rua Alferes Poli', '294', '', '', 'AP 903', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:13:34');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (14, '8007', 'Simone Vivan', NULL, '', '029.500.199-27', 'F', 3, 'Rua Alferes Poli', '294', '', '', 'AP 1001', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '4199151267', '', '', '', '', '', '', '2008-01-14 12:14:13');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (15, '08009', 'Rebeca Garcia Martins', '2008-03-05', '', '046.373.099-21', 'F', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '1402', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:14:47');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (16, '8010', 'Juliana Horta', NULL, '', '', 'F', 3, 'Rua Alferes Poli', '294', '', '', 'AP 1403', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:15:20');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (17, '8011', 'Robson Garcia Barbosa', '1980-08-21', '8021556-8 PR', '032060729-13', 'M', 3, 'R. Alferes Poli', '294', '', '', '1502', '80230-090', 'Centro', 'Curitiba', 'PR', '4132031848', '', '4188540611', '', '', '', 'robson.cwb@gmail.com', '', '', '2008-01-14 12:16:12');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (18, '99001', 'Oscar Ricardo Macedo Schmeiske', NULL, '', '63525160925', 'M', 9, 'Avenida Sete de Setembro', '6830', '', '', 'AP 1531', '80240001', 'Seminário', 'Curitiba', 'PR', '4132436467', '4132501355', '4199776984', '', '', '', 'oscar@ippuc.org.br', 'oscarschmeiske@gmail.com', '', '2008-01-29 17:17:35');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (19, '99002', 'Rinaldo da Silva Rocha', NULL, '', '69705658900', 'M', 9, 'Rua Maria Ludwig Muller', '277', '', '', '', '83409540', 'Jardim Eucalipto', 'Colombo', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-29 17:26:55');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (20, '3001', 'Clelia Alice Marson', '1971-03-19', '60871990', '96329858934', 'F', 6, 'R. Brasílio Itiberê', '2433', '', '', 'AP B25', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133334941', '', '4184253353', '', '', '', '', '', '', '2008-01-29 17:31:24');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (21, '06001', 'Iolanda Reis', '2008-03-05', '', '39409538904', 'F', 4, 'Avenida. Sete de Setembro', '3293', '', 'Ap.', '1301', '80230-010', 'Centro', 'Curitiba', 'PR', '4130194881', '', '', '', '', '', '', '', '', '2008-01-29 17:38:20');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (22, '00002', 'IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba', '2008-03-05', '', '76.582.337/0001-16', '', 10, 'Rua Bom Jesus', '669', '', '', '', '80035010', 'Juveve', 'Curitiba', 'PR', '', '41 3250-1300', '', '', '', '', '', '', '', '2008-01-29 18:01:02');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (23, '99003', 'Luis Sergio Rolim de Moura', NULL, '', '64101835934', 'M', 9, 'Rua Irmãs Paulina', '5146', '', '', '', '81020230', 'Novo mundo', 'Curitiba', 'PR', '', '', '4192139239', '4191823402', '', '', '', '', '', '2008-01-29 18:09:07');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (24, '99004', 'Rauf Alencar de Oliveira', '1986-04-09', '', '05889025945', 'M', 9, 'Rua João Gomes ', '100', '', '', 'Bloco J  AP 32', '80020030', 'Novo mundo', 'Curitiba', 'PR', '', '4133980456', '41', '', '', '', 'rauf@mjtelefonia.com.br', 'rauf.sk8@gmail.com', '', '2008-01-29 18:13:39');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (25, '02001', 'Rose Mari Martins Arruda', '2008-03-05', '', '317.955.799-00', 'F', 7, 'Rua Lourenço Pinto', '260', '', 'Ap.', '103', '80010160', 'Centro', 'Curitiba', 'PR', '41 32224102', '41 30146906', '41 94280387', '', '', '', '', '', '', '2008-01-30 11:49:16');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (26, '2002', 'Jackson M. Nizer', NULL, '', '032.173.759-80', 'M', 7, 'Rua Lourenço Pinto', '260', '', '', '201', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 11:50:59');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (27, '2003', 'Jorge Gonçalves dos Santos', NULL, '', '157.097.799-20', 'M', 7, 'Rua Lourenço Pinto', '260', '', '', '', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 11:53:31');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (28, '2004', 'Sergio Vivan', NULL, '', '460.707.379-20', '', 7, 'Rua Lourenço Pinto', '260', '', '', 'AP 303', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 11:55:04');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (29, '2005', 'Jhony Maciel Oliveira', NULL, '', '064.214.299-80', 'M', 7, 'Rua Lourenço Pinto', '260', '', '', '103B ', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 11:58:47');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (30, '2006', 'Daisy Mary Reichel', NULL, '', '008933740-91', 'F', 7, 'Rua Lourenço Pinto', '260', '', '', '302', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:04:12');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (31, '3002', 'Luciana Osorio Cavalli', NULL, '', '043.933.609-07', 'F', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 23B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:06:50');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (32, '3003', 'Zenildo Costa', NULL, '', '539.938.029-34', 'M', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 25B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133334941', '4133334941', '4184122072', '', '4133334941', '', '', '', '', '2008-01-30 12:08:29');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (33, '3004', 'Bernhard Zanker Junior', NULL, '', '025.833.599-83', 'M', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 31 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:12:22');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (34, '3005', 'Edison Carlos dos Santos', NULL, '', '681.977.569-53', '', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 43 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:13:16');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (35, '3006', 'Ana Elisa Macagnan', NULL, '', '897.755.200-10', '', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 22 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:14:10');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (36, '3007', 'Fernando Henrique Tremel Bueno', NULL, '', '050.193.579-79', '', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 24 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:15:05');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (37, '3008', 'Adriano Noedinger da Silva', NULL, '', '030.070.919-69', 'M', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 43 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:16:22');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (38, '3009', 'Eugenio Antonio Guerra', NULL, '', '553.679.686-00', '', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 44 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133336862', '', '4199754454', '', '', '', 'egf.madeiras@netctba.com.br', 'geninhoemarias@netctba.com.br', '', '2008-01-30 12:17:19');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (39, '3010', 'Waldenira Pistori', NULL, '', '205.384.649-68', 'F', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 21 BII', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '4130261627', '', '', '', '', '', '', '', '2008-01-30 12:18:23');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (40, '3011', 'Clayton Cezar Upitis Marloch', NULL, '', '651.454.109-72', 'M', 6, 'Rua Brasílio Itiberê', '2455', '', '', 'AP 42 BII', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:19:28');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (41, '4001', 'Vanildo', NULL, '', '', 'M', 5, 'R. 24 de Maio', '262', '', '', 'CJ 301', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:33:04');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (42, '4002', 'ACC Aduditoria Contabil S/C Ltda.', NULL, '', '01.625.401/0001-08', '', 5, 'R. 24 de Maio', '262', '', '', 'CJ 1103', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:35:17');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (43, '4003', 'Francisco C. T. Costa e Silva', NULL, '', '320.945.319-53', 'M', 5, 'R. 24 de Maio', '262', '', '', 'CJ 505 / 506', '80230-080', 'Centro', 'Curitiba', 'PR', '', '3233-6584', '', '', '', '', '', '', '', '2008-01-30 12:36:52');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (44, '4004', 'Sonia Maria Bressan ', NULL, '', '237.300.300-78', 'F', 5, 'R. 24 de Maio', '262', '', '', 'CJ 803', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:38:03');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (45, '4005', 'Carlos Eduardo', NULL, '', '', 'M', 5, 'R. 24 de Maio', '262', '', '', 'CJ 806', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:38:56');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (46, '4006', 'Saulo Souza e Silva', NULL, '', '322.416.669-04', 'M', 5, 'R. 24 de Maio', '262', '', '', 'CJ 402', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:41:27');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (47, '4007', 'Ursula', NULL, '', '', '', 5, 'R. 24 de Maio', '262', '', '', 'CJ 402', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:42:22');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (48, '4008', 'R. Huczok Consulting Ltda.', NULL, '', '00.058.094/0001-50', '', 5, 'R. 24 de Maio', '262', '', '', 'CJ 1001 / 1002', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:44:30');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (49, '4009', 'DIVALPAR Participação Societária Ltda.', NULL, '', '76.641.265/0001-30', '', 5, 'Rua 24 de Maio', '262', '', '', 'CJ 1104', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:58:07');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (50, '4010', 'Rogoski & Soares C. A. Elet. Ltda.', NULL, '', '08.182.364/0001-41', '', 5, 'Rua 24 de Maio', '262', '', '', 'CJ 1201', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 13:12:50');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (51, '4011', 'Olimpus Agência de Viagem e Turismo Ltda.', NULL, '', '01.134.309/0001-37', '', 5, 'Rua 24 de Maio', '262', '', '', 'CJ 1202', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 13:17:03');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (52, '4012', 'EPRON Serviço de Informática S/C Ltda.', NULL, '', '01.766.736/0001-38', '', 5, 'Rua 24 de Maio', '262', '', '', 'CJ 605', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 14:40:51');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (53, '5001', 'Marisa Helena da Costa Serafin', NULL, '', '471.972.509-00', '', 1, 'Av. Sete de Setembro', '3272', '', '', 'AP 01', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 14:42:51');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (54, '5002', 'Marisângela Pacheco Brittes', NULL, '', '906.561.219-04', 'F', 1, 'Av. Sete de Setembro', '3272', '', '', 'AP 03', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 14:46:08');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (55, '5003', 'COMPOR Arquitetura e Construção Ltda.', NULL, '', '79.110.086/0001-65', '', 1, 'Av. Sete de Setembro', '3272', '', '', 'CJ 04', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:31:18');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (56, '5004', 'Eliana Nascimento', NULL, '', '872.560.296-91', '', 1, 'Av. Sete de Setembro', '3272', '', '', 'AP 06', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:33:38');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (57, '5005', 'Djalma Jacinto da Silva Filho', NULL, '', '738.669.389-34', 'M', 1, 'Av. Sete de Setembro', '3272', '', '', 'AP 08', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:37:09');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (58, '5006', 'Isabel Jacomel', NULL, '', '583.674.629-04', 'F', 1, 'Av. Sete de Setembro', '3272', '', '', 'AP 10', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:42:46');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (59, '05007', 'Celso Amaral Poletti', '2008-03-05', '', '008.436.739-31', 'M', 1, 'Av. Sete de Setembro', '3272', '', 'Ap.', '12', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:45:36');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (60, '5008', 'Claiton Estacionamento', NULL, '', '', 'M', 1, 'Av. Sete de Setembro', '3272', '', '', 'Estacionamento', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:46:11');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (61, '06002', 'Matilde Alves da Cunha Silva', '2008-03-05', '', '153.857.058-02', 'F', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '103', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:52:24');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (62, '06003', 'Wallace Mendes Cordeiro', '2008-03-05', '', '020.916.769-69', 'M', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '104', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:54:27');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (63, '06004', 'Natalia', '2008-03-05', '', '', 'F', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '108', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:56:28');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (64, '06005', 'Robson Roberto da Silva', '2008-03-05', '', '048.468.029-30', 'M', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '208', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:57:38');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (65, '6006', 'Bruna Amaral Monteiro', NULL, '384.625-0 / PR', '048.863.769-40', 'F', 4, 'Av. Sete de Setembro', '3293', '', '', '307', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '4196654014', '', '', '', '', '', '', '2008-01-31 13:58:30');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (66, '06007', 'Luana Aparecida Dias Mota', '2008-03-05', '', '342.496.088-83', 'F', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '405', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:00:04');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (67, '6008', 'Katia Cristina Zardo', NULL, '', '', 'F', 4, 'Av. Sete de Setembro', '3293', '', '', '602', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:00:52');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (68, '6009', 'Rose Cristina Neves', NULL, '', '', 'F', 4, 'Av. Sete de Setembro', '3293', '', '', '603', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:03:06');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (69, '06010', 'George Galli', '2008-03-05', '', '054.504.359-08', 'M', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '606', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:04:15');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (70, '06011', 'Leonardo Raupp Matta', '2008-03-05', '', '368.638.378-03', 'M', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '904', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:05:36');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (71, '06012', 'Rita Helena Zimmermann', '2008-03-05', '', '312.534.319-49', 'F', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '905', '80.230-010', 'Centro', 'Curitiba', 'PR', '4132336720', '', '', '', '', '', '', '', '', '2008-01-31 14:06:53');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (72, '06013', 'Mellina Franco Oliveira Canto', '2008-03-05', '', '368.851.968-00', 'F', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '908', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:09:21');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (73, '06014', 'Felipe Lukacievick Barbosa', '2008-03-05', '', '040.494.399-30', 'M', 4, 'Av. Sete de Setembro', '3293', '1004', 'Ap.', '1004', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:17:05');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (74, '06015', 'Fernando Cesar Alves da Silva', '2008-03-05', '', '', 'M', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '1106', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:18:08');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (75, '6016', 'Amanda Tieppo', NULL, '', '055.717.089-30', 'F', 4, 'Av. Sete de Setembro', '3293', '', '', '1108', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:19:24');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (76, '06017', 'Thiago Carli', '2008-03-05', '', '039.701.069-90', 'M', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '1205', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:20:34');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (77, '6018', 'Fabiana Reis', NULL, '', '', 'F', 4, 'Av. Sete de Setembro', '3293', '', '', '1301', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:22:04');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (78, '9001', 'Katia Regina Schmeiske', NULL, '', '', 'F', 8, 'Av. Sete de Setembro', '6830', '', '', 'AP 1531', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:37:16');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (79, '9002', 'Henderson Ezequiel Rudiniski', NULL, '', '022.198.909-96', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 232', '80.440-000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:49:04');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (80, '9003', 'Morgana', NULL, '', '', 'F', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 241', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:50:06');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (81, '9004', 'Thais Cristina Sentone Mota', NULL, '', '035.978.319-82', 'F', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 522', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:52:03');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (82, '9005', 'João Arnaldo de Oliveira', NULL, '', '028.053.679-87', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 722', '80.440-000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:53:43');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (83, '9006', 'Carlos Roberto dos Santos Fernandes', NULL, '2088917-9 SPP/PR', '402.430.1529-87', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 811', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '4196447773', '', '', '', 'carlaovs41@hotmail.com', '', '', '2008-01-31 15:10:05');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (84, '9007', 'Sonia Aparecida Estevan Costa ', NULL, '', '', 'F', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 922', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 15:14:16');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (85, '9008', 'José Carlos de Lima', NULL, '', '337.841.169-49', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 932', '80440000', 'Seminário', 'Curitiba', 'PR', '4133432571', '', '', '', '', '', '', '', '', '2008-01-31 15:15:13');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (86, '9009', 'Ivana Rubio Colin', NULL, '', '055.924.239-50', 'F', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 942', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 15:16:29');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (87, '9010', 'José Carvalho Filho', NULL, '', '396.640.319-68', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 1122', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 15:17:36');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (88, '9011', 'Anderson Augusto Fillus', NULL, '', '049.129.829-38', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 1511', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 15:18:32');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (89, '9012', 'Jefferson Olinger de Souza', NULL, '', '040.739.369-21', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 1512', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 15:19:38');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (90, '9013', 'José Carlos', NULL, '', '', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 1512', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 15:22:00');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (91, '9014', 'Adriano ', NULL, '', '', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 1521', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 15:22:31');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (93, '101001', 'Everson Edson do Prado', '1979-11-08', '89821258', '02692342925', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'Ap 71', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '32466809', '', '88072142', '', '', '', 'eversonet@hotmail.com', '', '', '2008-02-01 16:08:54');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (94, '101015', 'Valdemir Antonio Rovares', NULL, '19272090', '10806149825', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'AP 103', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3246-1186', '', '', '', '', '', 'alexandrarovares@hotmail.com', '', '', '2008-02-01 16:16:44');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (95, '101002', 'Nilo Navarri', NULL, '19772535', '40534430910', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'AP 22', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '99613435', '', '', '', 'nilonavarri@hotmail.com', '', '', '2008-02-01 16:19:17');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (96, '101003', 'Dievert Fernando de Campos', NULL, '77872906', '04589454980', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'AP 63', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '33272329', '', '', '', '', '', 'cheve_tt_ee@hotmail.com', '', '', '2008-02-01 16:22:44');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (97, '101004', 'Luiz Eduardo Lasszck', NULL, '62449284', '87587610987', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'AP 92', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3304-9098', '', '9936-6803', '', '', '', 'eduardo@prt9.mpt.gov.br', '', '', '2008-02-01 16:24:29');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (98, '101005', 'Adenir Farias', NULL, '60208018', '01755436904', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', '101', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3567-9184 ', '', '8405-5327', '', '', '', '', '', '', '2008-02-01 16:26:51');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (99, '101006', 'Valdir Modest de Oliveira', NULL, '41744367', '55588930959', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'ap 112', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '9682-0731', '', '', '', 'valdirdeoliveira1@hotmail.com', '', '', '2008-02-01 16:28:36');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (100, '101007', 'Antonio dos Santos Bicalho', NULL, '34219095', '49109243968', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'ap 143', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3346-1714', '', '9916-3562', '', '', '', '', '', '', '2008-02-01 16:30:06');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (101, '101008', 'Sueli Costa Luvison', NULL, '67199162', '02171579986', 'F', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'ap 114', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3268-9163', '', '', '', '', '', 's_ueli_costa@hotmail.com', '', '', '2008-02-01 16:31:55');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (102, '101009', 'Dieick Denner Gonçalves', NULL, '74123333', '00695822977', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'ap 151', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3022-8903', '', '9677-8533', '', '', '', 'dieick@yahoo.com.br', '', '', '2008-02-01 16:33:44');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (103, '101010', 'Vanderlei Souza', NULL, '299305661', '', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'ap 153', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '8848-2141', '', '', '', '', '', '', '2008-02-01 16:36:46');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (104, '101011', 'Shirley Cristiane M. de Souza', NULL, '7.324.135-9', '024425299-80', 'F', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'ap 53', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '8818-4709', '', '', '', 'criskatana@hotmail.com', '', '', '2008-02-01 16:38:10');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (105, '101012', 'Silvia Aparecida Pereira', NULL, '60820724', '87363755949', 'F', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'ap 123', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3247-5528', '', '9963-7739', '', '', '', 'valter.costa@cnh.com', '', '', '2008-02-01 16:40:03');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (106, '101013', 'Rosina Helena dos Santos', NULL, '2098664 / PR', '68846649915', 'F', 12, 'R Marechal Otávio Saldanha Mazza', '777', '', '', 'AP 33', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '4132483312', '', '4188039777', '', '', '', '', '', '', '2008-02-01 16:42:41');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (107, '101014', 'Robson Sandro Santos', NULL, '74006884', '02842147952', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'ap 141', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '8437-7480', '', '', '', '', '', '', '2008-02-01 16:44:23');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (108, '101016', 'Marcelo', NULL, '', '', 'M', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', '', 'Ap. 52', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3013-0386', '', '(47) 8803-0784', '', '', '', '', '', '', '2008-02-20 10:04:01');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (109, '00003', 'GE Money', '2008-03-05', '', '', '', 10, 'Rua Monsenhor Celso', '23', '', '', '', '80010-150', 'Centro', 'Curitiba', 'PR', '', '41 3224-0177', '', '', '41 3224-7119', '', '', '', '', '2008-02-20 10:56:20');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (110, '99005', 'Ricardo - PRT', NULL, '', '', '', 9, '', '', '', '', '', '', '', '', 'PR', '', '', '', '', '', '', '', '', '', '2008-02-20 11:00:31');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (111, '4', 'Mercador Fomento Mercantil LTDA.', NULL, '', '04.543.073/0001-80', 'M', 10, '', '', '', '', '', '', '', '', 'PR', '', '', '', '', '', '', '', '', '', '2008-02-20 11:03:31');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (112, '5', 'Fontoura e Silva Com. de Informática', NULL, '', '', '', 10, '', '', '', '', '', '', '', '', 'PR', '', '', '', '', '', '', '', '', '', '2008-02-20 11:21:55');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (113, '00006', 'Paraná Despachante', '2008-03-05', '', '', '', 10, '', '', '', '', '', '', '', '', 'PR', '', '41 3015-5501', '', '', '', '', '', '', '', '2008-02-20 11:25:23');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (114, '9015', 'Ivan de Oliveira Mota', NULL, '340.196-0 / PR', '111.061.589-20', 'M', 8, 'Avenida Nossa Senhora Aparecida', '501', '', '', 'AP 522', '80440000', 'Seminário', 'Curitiba', 'PR', '4133432466', '', '', '', '', '', 'ivan.o.mota@hotmail.com', 'ivan.o.mota@gmail.com', '', '2008-02-20 12:13:22');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (115, '7', 'Federação Paranaense de Ginástica', NULL, '', '00.417.081/0001-20', '', 10, 'Rua Profª Antonia Reginatto Viana', '921', '', '', '', '', '', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-02-20 12:58:41');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (116, '6019', 'Jonas', NULL, '', '', 'M', 4, 'Av. Sete de Setembro', '3293', '', '', '206', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '9944-2176', '', '', '', '', '', '', '2008-02-20 13:13:58');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (117, '00008', 'BV Financeira - Daniel Moreira', '2008-03-05', '', '', '', 10, 'Avenida Mal. Deodoro', '261', '', '', 'Térreo', '', '', '', 'PR', '', '41 3596-3900', '41 8808-1787', '', '', '', 'daniel.moreira@cppromotora.com.br', '', '', '2008-02-01 13:16:27');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (118, '00009', 'B2 Informática', '2008-03-05', '', '', 'M', 10, '', '', '', '', '', '', '', '', 'PR', '', '41 3029-9404', '', '', '', 'www.infob2.com.br', 'vendas@infob2.com.br', '', '', '2008-02-01 13:17:54');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (119, '51001', 'Antonia - Síndica', NULL, '', '', '', 11, '', '', '', '', '', '', 'Jardim Botânico', 'Curitiba', 'PR', '3013-0751', '', ' 9198-8823', '', '', '', '', '', '', '2008-02-01 13:19:33');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (120, '99006', 'Elenara Beatriz Fontana', NULL, '', '', 'F', 9, '', '', '', '', '', '', '', '', 'PR', '3324-1243', '3223-7758', '9971-6264', '', '', '', 'elenaraf@gmail.com', 'elenara.fontana@pucpr.br', '', '2008-02-01 13:25:11');
INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (121, '06020', 'Jeane Margarete Rucinski', '1973-04-13', '60213070 / PR', '81348053968', 'F', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '503', '80.230-010', 'Centro', 'Curitiba', 'PR', '4141013797', '', '4141013797', '', '', '', 'jeanemargareterucinski@bol.com.br', '', '', '2008-02-28 09:01:13');
COMMIT;

INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (7, 8001, 'Tulio Hofmann Filho', NULL, '', '', 'M', 3, 'R. Alferes Poli', '294', 'Ap. 101', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2007-11-23 12:22:09');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (8, 8002, 'Daniel Hiroshi Nielsen Yabu', NULL, '', '034.753.719-79', 'M', 3, 'Rua Alferes Poli', '294', 'AP 1603', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:09:00');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (9, 8003, 'Robson Lara Moreira', NULL, '', '', 'M', 3, 'Rua Alferes Poli', '294', 'AP 202', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:09:37');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (10, 8004, 'Felipe Augusto Kubis', NULL, '', '054.165.369-50', 'M', 3, 'Rua Alferes Poli', '294', 'AP 301', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:10:30');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (11, 8005, 'Mayara Cristina Garcia Machuca ', NULL, '', '369.742.538-26', 'F', 3, 'Rua Alferes Poli', '294', 'Ap. 303', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:11:33');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (12, 8006, 'Graciele Razera', NULL, '', '644.489.400-04', 'F', 3, 'Rua Alferes Poli', '294', 'AP 902', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:12:41');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (13, 8008, 'Lucas Nunes da Silveira', NULL, '', '038.062.189-43', 'M', 3, 'Rua Alferes Poli', '294', 'AP 903', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:13:34');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (14, 8007, 'Simone Vivan', NULL, '', '029.500.199-27', 'F', 3, 'Rua Alferes Poli', '294', 'AP 1001', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:14:13');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (15, 8009, 'Rebeca Garcia Martins', NULL, '', '046.373.099-21', 'F', 3, 'Rua Alferes Poli', '294', 'AP 1402', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:14:47');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (16, 8010, 'Juliana Horta', NULL, '', '', 'F', 3, 'Rua Alferes Poli', '294', 'AP 1403', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:15:20');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (17, 8011, 'Robson G. Barbosa', NULL, '', '', 'M', 3, 'R. Alferes Poli', '294', 'Ap. 1502', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-14 12:16:12');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (18, 99001, 'Oscar Ricardo Macedo Schmeiske', NULL, '', '63525160925', 'M', 9, 'Avenida Sete de Setembro', '6830', 'AP 1531', '80240001', 'Seminário', 'Curitiba', 'PR', '4132436467', '4132501355', '4199776984', '', '', 'oscar@ippuc.org.br', 'oscarschmeiske@gmail.com', '', '2008-01-29 17:17:35');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (19, 99002, 'Rinaldo da Silva Rocha', NULL, '', '69705658900', 'M', 9, 'Rua Maria Ludwig Muller', '277', '', '83409540', 'Jardim Eucalipto', 'Colombo', 'PR', '', '', '', '', '', '', '', '', '2008-01-29 17:26:55');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (20, 3001, 'Clelia Alice Marson', '1971-03-19 00:00:00', '60871990', '96329858934', 'F', 6, 'R. Brasílio Itiberê', '2455', 'AP B25', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133334941', '', '4184253353', '', '', '', '', '', '2008-01-29 17:31:24');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (21, 6001, 'Iolanda Reis', NULL, '', '39409538904', 'F', 4, 'Avenida. Sete de Setembro', '3293', 'AP 1301', '80230-010', 'Centro', 'Curitiba', 'PR', '4130194881', '', '', '', '', '', '', '', '2008-01-29 17:38:20');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (22, 2, 'IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba', NULL, '', '76.582.337/0001-16', '', 10, 'Rua Bom Jesus', '669', '', '80035010', 'Juveve', 'Curitiba', 'PR', '', '4132501300', '', '', '', '', '', '', '2008-01-29 18:01:02');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (23, 99003, 'Luis Sergio Rolim de Moura', NULL, '', '64101835934', 'M', 9, 'Rua Irmãs Paulina', '5146', '', '81020230', 'Novo mundo', 'Curitiba', 'PR', '', '', '4192139239', '4191823402', '', '', '', '', '2008-01-29 18:09:07');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (24, 99004, 'Rauf Alencar de Oliveira', '1986-04-09 00:00:00', '', '05889025945', 'M', 9, 'Rua João Gomes ', '100', 'Bloco J  AP 32', '80020030', 'Novo mundo', 'Curitiba', 'PR', '', '4133980456', '41', '', '', 'rauf@mjtelefonia.com.br', 'rauf.sk8@gmail.com', '', '2008-01-29 18:13:39');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (25, 2001, 'Rose Mari Martins Arruda', NULL, '', '317.955.799-00', 'F', 7, 'Rua Lourenço Pinto', '260', 'AP 103', '80010160', 'Centro', 'Curitiba', 'PR', '4132224102', '4130146906', '4194280387', '', '', '', '', '', '2008-01-30 11:49:16');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (26, 2002, 'Jackson M. Nizer', NULL, '', '032.173.759-80', 'M', 7, 'Rua Lourenço Pinto', '260', 'AP 201', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 11:50:59');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (27, 2003, 'Jorge Gonçalves dos Santos', NULL, '', '157.097.799-20', 'M', 7, 'Rua Lourenço Pinto', '260', '', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 11:53:31');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (28, 2004, 'Sergio Vivan', NULL, '', '460.707.379-20', '', 7, 'Rua Lourenço Pinto', '260', 'AP 303', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 11:55:04');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (29, 2005, 'Jhony Maciel Oliveira', NULL, '', '064.214.299-80', 'M', 7, 'Rua Lourenço Pinto', '260', 'AP 103B ', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 11:58:47');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (30, 2006, 'Daisy Mary Reichel', NULL, '', '008933740-91', 'F', 7, 'Rua Lourenço Pinto', '260', 'AP 302', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:04:12');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (31, 3002, 'Luciana Osorio Cavalli', NULL, '', '043.933.609-07', 'F', 6, 'Rua Brasílio Itiberê', '2455', 'AP 23B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:06:50');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (32, 3003, 'Zenildo Costa', NULL, '', '539.938.029-34', 'M', 6, 'Rua Brasílio Itiberê', '2455', 'AP 25B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133334941', '4133334941', '4184122072', '', '4133334941', '', '', '', '2008-01-30 12:08:29');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (33, 3004, 'Bernhard Zanker Junior', NULL, '', '025.833.599-83', 'M', 6, 'Rua Brasílio Itiberê', '2455', 'AP 31 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:12:22');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (34, 3005, 'Edison Carlos dos Santos', NULL, '', '681.977.569-53', '', 6, 'Rua Brasílio Itiberê', '2455', 'AP 43 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:13:16');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (35, 3006, 'Ana Elisa Macagnan', NULL, '', '897.755.200-10', '', 6, 'Rua Brasílio Itiberê', '2455', 'AP 22 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:14:10');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (36, 3007, 'Fernando Henrique Tremel Bueno', NULL, '', '050.193.579-79', '', 6, 'Rua Brasílio Itiberê', '2455', 'AP 24 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:15:05');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (37, 3008, 'Adriano Noedinger da Silva', NULL, '', '030.070.919-69', 'M', 6, 'Rua Brasílio Itiberê', '2455', 'AP 43 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:16:22');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (38, 3009, 'Eugenio Antonio Guerra', NULL, '', '553.679.686-00', '', 6, 'Rua Brasílio Itiberê', '2455', 'AP 44 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:17:19');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (39, 3010, 'Waldenira Pistori', NULL, '', '205.384.649-68', 'F', 6, 'Rua Brasílio Itiberê', '2455', 'AP 21 BII', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:18:23');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (40, 3011, 'Clayton Cezar Upitis Marloch', NULL, '', '651.454.109-72', 'M', 6, 'Rua Brasílio Itiberê', '2455', 'AP 42 BII', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:19:28');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (41, 4001, 'Vanildo', NULL, '', '', 'M', 5, 'R. 24 de Maio', '262', 'CJ 301', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:33:04');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (42, 4002, 'ACC Aduditoria Contabil S/C Ltda.', NULL, '', '01.625.401/0001-08', '', 5, 'R. 24 de Maio', '262', 'CJ 1103', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:35:17');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (43, 4003, 'Francisco C. T. Costa e Silva', NULL, '', '320.945.319-53', 'M', 5, 'R. 24 de Maio', '262', 'CJ 505 / 506', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:36:52');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (44, 4004, 'Sonia Maria Bressan ', NULL, '', '237.300.300-78', 'F', 5, 'R. 24 de Maio', '262', 'CJ 803', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:38:03');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (45, 4005, 'Carlos Eduardo', NULL, '', '', 'M', 5, 'R. 24 de Maio', '262', 'CJ 806', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:38:56');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (46, 4006, 'Saulo Souza e Silva', NULL, '', '322.416.669-04', 'M', 5, 'R. 24 de Maio', '262', 'CJ 402', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:41:27');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (47, 4007, 'Ursula', NULL, '', '', '', 5, 'R. 24 de Maio', '262', 'CJ 402', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:42:22');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (48, 4008, 'R. Huczok Consulting Ltda.', NULL, '', '00.058.094/0001-50', '', 5, 'R. 24 de Maio', '262', 'CJ 1001 / 1002', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:44:30');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (49, 4009, 'DIVALPAR Participação Societária Ltda.', NULL, '', '76.641.265/0001-30', '', 5, 'Rua 24 de Maio', '262', 'CJ 1104', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 12:58:07');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (50, 4010, 'Rogoski & Soares C. A. Elet. Ltda.', NULL, '', '08.182.364/0001-41', '', 5, 'Rua 24 de Maio', '262', 'CJ 1201', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 13:12:50');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (51, 4011, 'Olimpus Agência de Viagem e Turismo Ltda.', NULL, '', '01.134.309/0001-37', '', 5, 'Rua 24 de Maio', '262', 'CJ 1202', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 13:17:03');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (52, 4012, 'EPRON Serviço de Informática S/C Ltda.', NULL, '', '01.766.736/0001-38', '', 5, 'Rua 24 de Maio', '262', 'CJ 605', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 14:40:51');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (53, 5001, 'Marisa Helena da Costa Serafin', NULL, '', '471.972.509-00', '', 1, 'Av. Sete de Setembro', '3272', 'AP 01', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 14:42:51');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (54, 5002, 'Marisângela Pacheco Brittes', NULL, '', '906.561.219-04', 'F', 1, 'Av. Sete de Setembro', '3272', 'AP 03', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 14:46:08');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (55, 5003, 'COMPOR Arquitetura e Construção Ltda.', NULL, '', '79.110.086/0001-65', '', 1, 'Av. Sete de Setembro', '3272', 'CJ 04', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 19:31:18');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (56, 5004, 'Eliana Nascimento', NULL, '', '872.560.296-91', '', 1, 'Av. Sete de Setembro', '3272', 'AP 06', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 19:33:38');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (57, 5005, 'Djalma Jacinto da Silva Filho', NULL, '', '738.669.389-34', 'M', 1, 'Av. Sete de Setembro', '3272', 'AP 08', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 19:37:09');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (58, 5006, 'Isabel Jacomel', NULL, '', '583.674.629-04', 'F', 1, 'Av. Sete de Setembro', '3272', 'AP 10', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 19:42:46');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (59, 5007, 'Celso Amaral Poletti', NULL, '', '008.436.739-31', 'M', 1, 'Av. Sete de Setembro', '3272', 'AP 12', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 19:45:36');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (60, 5008, 'Claiton Estacionamento', NULL, '', '', 'M', 1, 'Av. Sete de Setembro', '3272', 'Estacionamento', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-30 19:46:11');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (61, 6002, 'Matilde Alves da Cunha Silva', NULL, '', '153.857.058-02', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 103', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-31 13:52:24');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (62, 6003, 'Wallace Mendes Cordeiro', NULL, '', '020.916.769-69', 'M', 4, 'Av. Sete de Setembro', '3293', 'AP 104', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-31 13:54:27');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (63, 6004, 'Natalia', NULL, '', '', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 108', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-31 13:56:28');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (64, 6005, 'Robson Roberto da Silva', NULL, '', '048.468.029-30', 'M', 4, 'Av. Sete de Setembro', '3293', 'AP 208', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-31 13:57:38');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (65, 6006, 'Bruna Amaral Monteiro', NULL, '', '', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 307', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-31 13:58:30');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (66, 6007, 'Luana Aparecida Dias Mota', NULL, '', '342.496.088-83', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 405', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-31 14:00:04');
INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `datacadastro`) VALUES (67, 6008, 'Katia Cristina Zardo', NULL, '', '', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 602', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '2008-01-31 14:00:52');
COMMIT;

INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (1, 'Ederson', 'Tenda Equipamentos Wireless', 'Contato comercial', '', '', '', '', '', '', '', 'PR', '', '', '9987-0696', '', '', '', NULL);
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (2, 'Marco Henrique', '', 'Possível cliente', '', '', '', '', 'Portão', '', 'Curitiba', 'PR', '', '', '8407-3966', '', '', '', NULL);
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (3, 'Paula', 'Nextel', 'Contato Comercial', '', '', '', '', '', '', '', 'PR', '0800 900 901', '', '', '', '', '', '2008-01-29 17:44:08');
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (4, 'Liziane', '', 'contato', 'Edificio Royal', 'Av Silva Jardim', '624', '', '', '', '', 'PR', '4130132696', '', '', '', '', '', '2008-02-20 11:22:52');
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (5, 'Zanoni', '', 'Sindico', 'Edificio Residencial Vera Cruz', 'Rua VX de Novembro', '1070', 'AP 22', 'Centro', '', 'São José dos Pinhais', 'PR', '4132822659', '', '', '', '', '', '2008-02-20 11:24:50');
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (6, 'Mercador Fomento Mercantil', '', 'parceiro financeiro', '', 'Rua NUnes Machado', '', 'CJ 803', 'Centro', '', '', 'PR', '', '', '', '', '', '', '2008-02-20 11:45:29');
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (7, 'Bruna', '', 'possivel cliente', 'Itaperussuna', '', '', '', '', '', '', 'PR', '3603-2092', '', '', '', '', '', '2008-02-20 13:04:48');
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (8, 'Carlos ou Simone', '', 'possivel cliente', 'Parresh', '', '', 'AP. 201', '', '', '', 'PR', '3222-9077', '', '8806-7961', '8847-4266', '', '', '2008-02-01 13:21:40');
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (9, 'Bruno Loxaki moracani', '', 'contato', 'Ed Napoli', 'silva jardim', '', '', '', '', '', 'PR', '4133248123', '', '', '', '', '', '2008-02-01 14:13:34');
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (10, 'Andreia - ed aries ', '', 'cliente', 'ed aries', '', '', 'ap 1201', '', '', '', 'PR', '4132436852', '', '', '', '', '', '2008-03-01 17:51:12');
INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `datacadastro`) VALUES (11, 'Odir Alves', '', 'cliente', 'Edf Bassa', 'Rua Santana', '590', 'AP 5', 'Jardim Botanico', '', '', 'PR', '4132633856', '', '', '', '', '', '2008-03-04 19:09:53');
COMMIT;

INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (5, 1, '-', 5, 1, 7, 3, '2008-01-14', '2009-01-14', 10, '2008-01-14 12:24:46');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (6, 1, '', 5, 1, 8, 3, '2008-01-14', '2009-01-14', 10, '2008-01-14 13:31:58');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (7, 1, '', 5, 1, 9, 3, '2008-01-14', '2009-01-14', 10, '2008-01-14 13:35:10');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (8, 1, '', 5, 1, 10, 3, '2008-01-14', '2009-01-14', 10, '2008-01-14 13:35:36');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (9, 1, '', 5, 1, 11, 3, '2008-01-14', '2009-01-14', 10, '2008-01-15 12:12:42');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (10, 1, '', 5, 6, 12, 3, '2008-01-14', '2009-01-14', 10, '2008-01-15 12:14:09');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (11, 1, '', 5, 1, 16, 3, '2008-02-20', NULL, 10, '2008-02-01 17:07:47');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (12, 1, '', 5, 1, 14, 3, '2008-02-20', NULL, 10, '2008-02-01 17:08:20');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (13, 1, '', 5, 1, 17, 3, '2008-02-01', NULL, 10, '2008-02-01 17:27:37');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (14, 1, '', 5, 1, 13, 3, '2008-02-01', NULL, 10, '2008-02-01 17:28:49');
INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `data_inicio`, `data_termino`, `vencimento_padrao`, `datacadastro`) VALUES (15, 1, '', 5, 1, 15, 3, '2008-02-01', NULL, 10, '2008-02-01 17:29:33');
COMMIT;

INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (1, 0, -10, 'Admins', 1, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (6, 0, 1, 'Provedores', 1, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (20, 0, 2, 'Contatos', 1, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (4, 0, 3, 'Clientes', 1, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (10, 0, 4, 'Grupos', 1, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (13, 0, 5, 'Planos', 1, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (16, 0, 6, 'Contratos', 1, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (19, 0, 7, 'Estações', 0, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (24, 0, 15, 'Chamados', 1, 0, 'javascript:;');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (27, 0, 7, 'Títulos', 1, 0, 'cobrancas.php');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (2, 1, 1, 'Cadastro', 1, 1, 'administradores.php?modo=cad');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (3, 1, 2, 'Manutenção', 1, 0, 'administradores.php');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (5, 4, 1, 'Cadastro', 1, 0, 'clientes.php?modo=cad');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (9, 4, 2, 'Manutenção', 1, 0, 'clientes.php?modo=lst');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (7, 6, 1, 'Cadastro', 1, 0, 'provedores.php?modo=cad');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (8, 6, 2, 'Manutenção', 1, 0, 'provedores.php?modo=lst');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (11, 10, 1, 'Cadastro', 1, 0, 'grupos.php?modo=cad');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (12, 10, 2, 'Manutenção', 1, 0, 'grupos.php?modo=lst');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (14, 13, 1, 'Cadastro', 1, 0, 'planos.php?modo=cad');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (15, 13, 2, 'Manutenção', 1, 0, 'planos.php?modo=lst');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (17, 16, 1, 'Cadastro', 1, 0, 'contratos.php?modo=cad');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (18, 16, 2, 'Manutenção', 1, 0, 'contratos.php?modo=lst');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (21, 20, 1, 'Cadastro', 1, 0, 'contatos.php?modo=cad');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (22, 20, 2, 'Manutenção', 1, 0, 'contatos.php?modo=lst');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (25, 24, 1, 'Abrir Chamado', 1, 0, 'chamados.php?modo=cad');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (26, 24, 2, 'Manutenção', 0, 0, 'chamados.php?modo=lst');
INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (28, 27, 1, 'Cadastrar', 1, 0, 'cobrancas.php?modo=cad');
COMMIT;

INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (1, 'EdOdoni', '05', 1, 'Edifício Odoni', 'Av. Sete de Setembro', '3272', 'Centro', '80230-010', 'Curitiba', 'PR', '2007-11-19 10:20:51');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (3, 'EdMarajo', '08', 1, 'Edifício Residencial Marajó', 'Rua Alferes Poli', '294', 'Centro', '80.230-090', 'Curitiba', 'PR', '2007-11-19 11:26:41');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (4, 'EdRoma', '06', 1, 'Edifício Roma', 'Av. Sete de Setembro', '3293', 'Centro', '80.230-010', 'Curitiba', 'PR', '2008-01-28 19:35:15');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (5, 'EdWashington', '04', 1, 'Edifício Comercial Washington', 'R. 24 de Maio', '262', 'Centro', '80230-080', 'Curitiba', 'PR', '2008-01-29 12:12:59');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (6, 'EdBItibere', '03', 1, 'Condominio Residencial Brasilio Itiberê', 'Rua Brasílio Itiberê', '2455', 'Rebouças', '80230-050', 'Curitiba', 'PR', '2008-01-29 12:15:14');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (7, 'EdLPinto', '02', 1, 'Edificio Residencial Lourenço Pinto', 'Rua Lourenço Pinto', '260', 'Centro', '80010160', 'Curitiba', 'PR', '2008-01-29 17:06:58');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (8, 'EdAries', '09', 1, 'Condominio Residencial Aries', 'Avenida Nossa Senhora Aparecida', '501', 'Seminário', '80440000', 'Curitiba', 'PR', '2008-01-29 17:10:06');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (9, 'Outros', '99', 99, 'Clientes Avulsos', '', '', '', '', '', 'PR', '2008-01-29 17:14:17');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (10, 'Empresas', '00', 2, 'Clientes Empresarial', '', '', '', '', '', 'PR', '2008-01-29 17:40:31');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (11, 'EdBCapanema', '51', 1, 'Condominio Residencial Barão de Capanema', '', '', 'Jardim Botânico', '', 'Curitiba', 'PR', '2008-01-31 15:25:45');
INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `datacadastro`) VALUES (12, 'EdOrionis', '101', 1, 'Edifício Residencial Orionis', 'R Marechal Otávio Saldanha Mazza', '7777', 'Pinheirinho', '81150060', 'Curitiba', 'PR', '2008-02-01 16:02:46');
COMMIT;

INSERT INTO `grupos_tipos` (`id`, `tipo`) VALUES (1, 'Condomínio');
INSERT INTO `grupos_tipos` (`id`, `tipo`) VALUES (2, 'Empresa');
INSERT INTO `grupos_tipos` (`id`, `tipo`) VALUES (99, 'Outros');
COMMIT;

INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (1, 'sergio', '2008-02-20 09:08:25');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (2, 'sergio', '2008-02-20 10:00:43');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (3, 'sergio', '2008-02-20 10:04:01');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (4, 'sergio', '2008-02-20 10:06:39');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (5, 'sergio', '2008-02-20 10:53:50');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (6, 'sergio', '2008-02-20 10:56:20');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (7, 'sergio', '2008-02-20 10:56:58');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (8, 'sergio', '2008-02-20 11:00:31');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (9, 'sergio', '2008-02-20 11:03:31');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (10, 'sergio', '2008-02-20 11:04:51');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (11, 'antonio', '2008-02-20 11:21:12');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (12, 'sergio', '2008-02-20 11:21:55');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (13, 'sergio', '2008-02-20 11:25:23');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (14, 'antonio', '2008-02-20 12:08:47');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (15, 'antonio', '2008-02-20 12:08:58');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (16, 'antonio', '2008-02-20 12:13:22');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (17, 'antonio', '2008-02-20 12:17:34');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (18, 'antonio', '2008-02-20 12:18:25');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (19, 'sergio', '2008-02-20 12:58:41');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (20, 'sergio', '2008-02-20 13:00:26');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (21, 'sergio', '2008-02-20 13:08:38');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (22, 'sergio', '2008-02-20 13:09:54');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (23, 'sergio', '2008-02-20 13:10:59');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (24, 'sergio', '2008-02-20 13:13:58');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (25, 'sergio', '2008-02-01 13:16:27');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (26, 'sergio', '2008-02-01 13:17:54');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (27, 'sergio', '2008-02-01 13:19:33');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (28, 'sergio', '2008-02-01 13:25:11');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (29, 'sergio', '2008-02-01 17:25:28');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (30, 'sergio', '2008-02-23 11:47:28');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (31, 'sergio', '2008-02-27 11:16:27');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (32, 'sergio', '2008-02-27 11:40:22');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (33, 'antonio', '2008-02-27 11:59:38');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (34, 'antonio', '2008-02-27 15:36:09');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (35, 'antonio', '2008-02-27 15:45:35');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (36, 'antonio', '2008-02-28 08:54:25');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (37, 'antonio', '2008-02-28 08:58:13');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (38, 'antonio', '2008-02-28 08:58:37');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (39, 'antonio', '2008-02-28 09:01:13');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (40, 'antonio', '2008-02-28 10:10:22');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (41, 'antonio', '2008-02-28 10:19:59');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (42, 'sergio', '2008-03-01 17:03:31');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (43, 'sergio', '2008-03-01 17:34:15');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (44, 'sergio', '2008-03-01 17:35:47');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (45, 'sergio', '2008-03-01 17:37:21');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (46, 'sergio', '2008-03-01 17:41:44');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (47, 'sergio', '2008-03-01 17:43:54');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (48, 'sergio', '2008-03-01 17:44:44');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (49, 'sergio', '2008-03-01 17:46:22');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (50, 'sergio', '2008-03-01 20:33:00');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (51, 'sergio', '2008-03-01 20:33:17');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (52, 'sergio', '2008-03-01 20:37:00');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (53, 'sergio', '2008-03-01 20:37:10');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (54, 'sergio', '2008-03-01 20:37:18');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (55, 'sergio', '2008-03-01 20:37:29');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (56, 'sergio', '2008-03-01 20:38:08');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (57, 'sergio', '2008-03-01 20:38:31');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (58, 'sergio', '2008-03-01 20:38:39');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (59, 'sergio', '2008-03-01 20:45:09');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (60, 'antonio', '2008-03-03 09:50:21');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (61, 'antonio', '2008-03-04 00:34:03');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (62, 'antonio', '2008-03-04 01:00:38');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (63, 'antonio', '2008-03-04 08:47:34');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (64, 'sergio', '2008-03-04 09:00:49');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (65, 'antonio', '2008-03-04 10:43:49');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (66, 'antonio', '2008-03-04 10:49:41');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (67, 'antonio', '2008-03-04 11:10:17');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (68, 'antonio', '2008-03-04 11:58:55');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (69, 'antonio', '2008-03-04 12:13:26');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (70, 'antonio', '2008-03-04 12:13:56');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (71, 'antonio', '2008-03-05 00:28:43');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (72, 'sergio', '2008-03-05 08:34:28');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (73, 'sergio', '2008-03-05 09:02:41');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (74, 'sergio', '2008-03-05 09:06:22');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (75, 'sergio', '2008-03-05 09:17:17');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (76, 'sergio', '2008-03-05 09:22:19');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (77, 'sergio', '2008-03-05 09:37:18');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (78, 'sergio', '2008-03-05 09:38:46');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (79, 'sergio', '2008-03-05 09:39:07');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (80, 'sergio', '2008-03-05 09:39:23');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (81, 'sergio', '2008-03-05 09:39:36');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (82, 'sergio', '2008-03-05 09:39:49');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (83, 'sergio', '2008-03-05 09:40:20');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (84, 'sergio', '2008-03-05 09:40:49');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (85, 'sergio', '2008-03-05 09:41:05');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (86, 'sergio', '2008-03-05 09:41:20');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (87, 'sergio', '2008-03-05 09:41:44');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (88, 'sergio', '2008-03-05 09:42:07');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (89, 'sergio', '2008-03-05 09:42:28');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (90, 'sergio', '2008-03-05 09:42:41');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (91, 'sergio', '2008-03-05 09:44:27');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (92, 'sergio', '2008-03-05 09:44:53');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (93, 'sergio', '2008-03-05 09:45:07');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (94, 'sergio', '2008-03-05 09:46:46');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (95, 'sergio', '2008-03-05 09:51:53');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (96, 'sergio', '2008-03-05 09:58:09');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (97, 'sergio', '2008-03-05 09:58:22');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (98, 'antonio', '2008-03-05 14:13:00');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (99, 'antonio', '2008-03-05 14:13:33');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (100, 'antonio', '2008-03-05 14:14:30');
INSERT INTO `logs_admin` (`id`, `login`, `datacadastro`) VALUES (101, 'antonio', '2008-03-05 14:14:49');
COMMIT;

INSERT INTO `planos` (`id`, `codigo`, `nome`, `vel_download`, `vel_upload`, `valor_base`, `valor_pontoadicional`, `fidelidade`, `datacadastro`) VALUES (1, 'sc300', 'SmartConnect300', '300', '150', 45, 10, 1, '2007-11-20 09:38:33');
INSERT INTO `planos` (`id`, `codigo`, `nome`, `vel_download`, `vel_upload`, `valor_base`, `valor_pontoadicional`, `fidelidade`, `datacadastro`) VALUES (4, 'sc400', 'SmartConnect400', '400', '200', 80, 10, 0, '2007-11-21 10:15:59');
INSERT INTO `planos` (`id`, `codigo`, `nome`, `vel_download`, `vel_upload`, `valor_base`, `valor_pontoadicional`, `fidelidade`, `datacadastro`) VALUES (9, 'sc350', 'SmartConnect350', '350', '175', 70, 10, 0, '2007-11-22 10:34:23');
INSERT INTO `planos` (`id`, `codigo`, `nome`, `vel_download`, `vel_upload`, `valor_base`, `valor_pontoadicional`, `fidelidade`, `datacadastro`) VALUES (7, 'sc200', 'SmartConnect200', '200', '100', 40, 10, 0, '2007-11-22 09:53:17');
INSERT INTO `planos` (`id`, `codigo`, `nome`, `vel_download`, `vel_upload`, `valor_base`, `valor_pontoadicional`, `fidelidade`, `datacadastro`) VALUES (6, 'sc150', 'SmartConnect150', '150', '75', 30, 10, 0, '2007-11-22 09:52:38');
INSERT INTO `planos` (`id`, `codigo`, `nome`, `vel_download`, `vel_upload`, `valor_base`, `valor_pontoadicional`, `fidelidade`, `datacadastro`) VALUES (8, 'sc250', 'SmartConnect250', '250', '125', 50, 10, 0, '2007-11-22 10:31:04');
COMMIT;

INSERT INTO `provedores` (`id`, `codigo`, `razaosocial`, `nomefantasia`, `cnpj`, `inscestadual`, `inscmunicipal`, `responsavel`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `tel_principal`, `tel_comercial`, `tel_financeiro`, `tel_suporte`, `celular1`, `celular2`, `celular3`, `fax`, `email_principal`, `email_comercial`, `email_financeiro`, `email_suporte`, `datacadastro`) VALUES (5, 'ssolution', 'Smart Solution Tecnologia da Informação Ltda.', 'Smart Solution TI ', '05.198.010/0001-05', '903.38693-28', '6.024.442.076-9', 'Antonio Gustavo Sampaio de Oliveira ', 'Avenida Sete de Setembro', '3272', 'Conjunto 11', 'Centro', '80.230-010', 'Curitiba', 'PR', '(41) 3234-2443', '(41) 3234-2443', '(41) 3234-2443', '(41) 3234-2443', '(41) 8416-0817', '(41) 9121-2032', '', '', 'smart@smartsolution.com.br', 'comercial@smartsolution.com.br', 'financeiro@smartsolution.com.br', 'suporte@smartsolution.com.br', '2007-11-19 12:07:57');
COMMIT;

/* Indexes */
CREATE UNIQUE INDEX `login`
  ON `admins`
  (`login`);

CREATE UNIQUE INDEX `codigo`
  ON `clientes`
  (`codigo`);

CREATE UNIQUE INDEX `codigo`
  ON `clientes_bkp`
  (`codigo`);
