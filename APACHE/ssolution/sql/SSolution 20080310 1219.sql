-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51a


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ssolution
--

CREATE DATABASE IF NOT EXISTS ssolution;
USE ssolution;

--
-- Definition of table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(200) default '',
  `senha` varchar(200) NOT NULL default '',
  `nome` varchar(150) NOT NULL default '',
  `ativo` tinyint(1) NOT NULL default '1',
  `data` datetime NOT NULL default '0000-00-00 00:00:00',
  `ultacesso` datetime NOT NULL default '0000-00-00 00:00:00',
  `ultacesso_ip` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--
INSERT INTO `admins` (`id`,`login`,`senha`,`nome`,`ativo`,`data`,`ultacesso`,`ultacesso_ip`) VALUES 
 (1,'smart','550237b8fbcdf3741bb1127d0fc7f6bf','Smart Solution TI',1,'2006-06-02 23:29:00','2008-01-31 17:25:38','10.12.7.13'),
 (2,'antonio','ae0ca2c9525396001d68bb366db5b1ad','Antonio Gustavo Sampaio de Oliveira',1,'2007-11-05 11:31:34','2008-03-07 11:30:12','10.12.7.8'),
 (3,'sergio','912318713265d527f3f5f640a550feb9','Sergio Henrique Costa',1,'2008-01-29 11:01:14','2008-03-10 10:55:14','10.12.7.13'),
 (4,'rebeca','708a65c007259f302db570f607cfa897','Rebeca Schmeiske Fausto',1,'2008-01-29 11:05:54','2008-02-01 23:52:46','10.12.7.7');

--
-- Definition of table `chamados`
--

DROP TABLE IF EXISTS `chamados`;
CREATE TABLE `chamados` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tipo_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `problema` text collate latin1_general_ci NOT NULL,
  `solucao` text collate latin1_general_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `data_abertura` date NOT NULL,
  `data_fechamento` date NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `chamados`
--
INSERT INTO `chamados` (`id`,`tipo_id`,`cliente_id`,`admin_id`,`problema`,`solucao`,`status_id`,`data_abertura`,`data_fechamento`,`observacoes`) VALUES 
 (3,1,56,1,'a','b',3,'2008-02-02','2003-02-01','c1\r\n');

--
-- Definition of table `chamados_status`
--

DROP TABLE IF EXISTS `chamados_status`;
CREATE TABLE `chamados_status` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `chamados_status`
--
INSERT INTO `chamados_status` (`id`,`nome`) VALUES 
 (1,'Aberto'),
 (2,'Encerrado'),
 (3,'Em análise');

--
-- Definition of table `chamados_tipos`
--

DROP TABLE IF EXISTS `chamados_tipos`;
CREATE TABLE `chamados_tipos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `chamados_tipos`
--
INSERT INTO `chamados_tipos` (`id`,`nome`) VALUES 
 (1,'Financeiro'),
 (2,'Comercial'),
 (3,'Manutenção'),
 (4,'Outros');

--
-- Definition of table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `codigo` varchar(100) NOT NULL,
  `nome` varchar(200) NOT NULL default '',
  `nascimento` date NOT NULL default '0000-00-00',
  `rg` varchar(20) NOT NULL,
  `cpf` varchar(30) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `grupo_id` int(11) default NULL,
  `endereco` varchar(300) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `bloco` varchar(10) NOT NULL,
  `complemento_tipo` varchar(5) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `tel_residencial` varchar(50) NOT NULL,
  `tel_comercial` varchar(50) NOT NULL,
  `tel_celular1` varchar(50) NOT NULL,
  `tel_celular2` varchar(20) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `site` varchar(200) NOT NULL,
  `email1` varchar(300) NOT NULL,
  `email2` varchar(200) NOT NULL,
  `email3` varchar(200) NOT NULL,
  `observacoes` text NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
--
INSERT INTO `clientes` (`id`,`codigo`,`nome`,`nascimento`,`rg`,`cpf`,`sexo`,`grupo_id`,`endereco`,`numero`,`bloco`,`complemento_tipo`,`complemento`,`cep`,`bairro`,`cidade`,`uf`,`tel_residencial`,`tel_comercial`,`tel_celular1`,`tel_celular2`,`fax`,`site`,`email1`,`email2`,`email3`,`observacoes`,`datacadastro`) VALUES 
 (7,'08001','Tulio Hofmann Filho','2008-03-05','','','M',3,'R. Alferes Poli','294','','Ap.','101','80230-090','Centro','Curitiba','PR','','','','','','','','','','','2007-11-23 12:22:09'),
 (8,'08002','Daniel Hiroshi Nielsen Yabu','2008-03-05','','034.753.719-79','M',3,'Rua Alferes Poli','294','','Ap.','1603','80.230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:09:00'),
 (9,'08003','Robson Lara Moreira','2008-03-05','','','M',3,'Rua Alferes Poli','294','','Ap.','202','80230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:09:37'),
 (10,'08004','Felipe Augusto Kubis','2008-03-05','','054.165.369-50','M',3,'Rua Alferes Poli','294','','Ap.','301','80230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:10:30'),
 (11,'08005','Mayara Cristina Garcia Machuca ','2008-03-05','','369.742.538-26','F',3,'Rua Alferes Poli','294','','Ap.','303','80.230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:11:33'),
 (12,'08006','Graciele Razera','2008-03-05','','644.489.400-04','F',3,'Rua Alferes Poli','294','','Ap.','902','80.230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:12:41'),
 (13,'08008','Lucas Nunes da Silveira','2008-03-05','','038.062.189-43','M',3,'Rua Alferes Poli','294','','Ap.','903','80.230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:13:34'),
 (14,'08007','Simone Vivan','2008-03-05','','029.500.199-27','F',3,'Rua Alferes Poli','294','','Ap.','1001','80.230-090','Centro','Curitiba','PR','','','4199151267','','','','','','','','2008-01-14 12:14:13'),
 (15,'08009','Rebeca Garcia Martins','2008-03-05','','046.373.099-21','F',3,'Rua Alferes Poli','294','','Ap.','1402','80.230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:14:47'),
 (16,'08010','Juliana Horta','2008-03-05','','','F',3,'Rua Alferes Poli','294','','Ap.','1403','80.230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:15:20'),
 (17,'8011','Robson Garcia Barbosa','1980-08-21','8021556-8 PR','032060729-13','M',3,'R. Alferes Poli','294','','','1502','80230-090','Centro','Curitiba','PR','4132031848','','4188540611','','','','robson.cwb@gmail.com','','','','2008-01-14 12:16:12'),
 (18,'99001','Oscar Ricardo Macedo Schmeiske','0000-00-00','','63525160925','M',9,'Avenida Sete de Setembro','6830','','','AP 1531','80240001','Seminário','Curitiba','PR','4132436467','4132501355','4199776984','','','','oscar@ippuc.org.br','oscarschmeiske@gmail.com','','Cliente avulso em serviços de manutenção e suporte.','2008-01-29 17:17:35'),
 (19,'99002','Rinaldo da Silva Rocha','0000-00-00','','69705658900','M',9,'Rua Maria Ludwig Muller','277','','','','83409540','Jardim Eucalipto','Colombo','PR','','','','','','','','','','Parceiro de negocios - Manutenção em monitores, impressoras e micromputadores.','2008-01-29 17:26:55'),
 (20,'03001','Clelia Alice Marson','1971-03-19','60871990','96329858934','F',6,'R. Brasílio Itiberê','2433','','Ap.','25 B','80230-050','Rebouças','Curitiba','PR','4133334941','','4184253353','','','','','','','','2008-01-29 17:31:24'),
 (21,'06001','Iolanda Reis','2008-03-05','','39409538904','F',4,'Avenida. Sete de Setembro','3293','','Ap.','1301','80230-010','Centro','Curitiba','PR','4130194881','','','','','','','','','Cunhada da Zeladora do Edificio Roma, dados para operaçõs financeiras.','2008-01-29 17:38:20'),
 (22,'00002','IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba','2008-03-05','','76.582.337/0001-16','',10,'Rua Bom Jesus','669','','','','80035010','Juveve','Curitiba','PR','','41 3250-1300','','','','','','','','Cliente de Vendas de equipamentos e de Serviços de suporte e manutenção em servidores.','2008-01-29 18:01:02'),
 (23,'99003','Luis Sergio Rolim de Moura','0000-00-00','','64101835934','M',9,'Rua Irmãs Paulina','5146','','','','81020230','Novo mundo','Curitiba','PR','','','4192139239','4191823402','','','','','','Luis que trabalha com o Paulo Databull.','2008-01-29 18:09:07'),
 (24,'99004','Rauf Alencar de Oliveira','1986-04-09','','05889025945','M',9,'Rua João Gomes ','100','','','Bloco J  AP 32','80020030','Novo mundo','Curitiba','PR','','4133980456','41','','','','rauf@mjtelefonia.com.br','rauf.sk8@gmail.com','','','2008-01-29 18:13:39'),
 (25,'02001','Rose Mari Martins Arruda','2008-03-05','','317.955.799-00','F',7,'Rua Lourenço Pinto','260','','Ap.','103A','80010160','Centro','Curitiba','PR','4132224102','4130146906','4194280387','','','','','','','Sindica do condominio','2008-01-30 11:49:16'),
 (26,'2002','Jackson M. Nizer','0000-00-00','','032.173.759-80','M',7,'Rua Lourenço Pinto','260','','','201','80010160','Centro','Curitiba','PR','','','','','','','','','','Irmão da Jacqueline Nizer funcionária da Huczok','2008-01-30 11:50:59'),
 (27,'02003','Jorge Gonçalves dos Santos','2008-03-05','','157.097.799-20','M',7,'Rua Lourenço Pinto','260','','Ap.','202','80010160','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 11:53:31'),
 (28,'02004','Sergio Vivan','2008-03-05','','460.707.379-20','',7,'Rua Lourenço Pinto','260','','Ap.','303','80010160','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 11:55:04'),
 (29,'2005','Jhony Maciel Oliveira','0000-00-00','','064.214.299-80','M',7,'Rua Lourenço Pinto','260','','','103B ','80010160','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 11:58:47'),
 (30,'2006','Daisy Mary Reichel','0000-00-00','','008933740-91','F',7,'Rua Lourenço Pinto','260','','','302','80010160','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:04:12'),
 (31,'03002','Luciana Osorio Cavalli','2008-03-05','','043.933.609-07','F',6,'Rua Brasílio Itiberê','2455','','Ap.','23 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:06:50'),
 (32,'03003','Zenildo Costa','2008-03-05','','539.938.029-34','M',6,'Rua Brasílio Itiberê','2455','','Ap.','25 B','80230-050','Rebouças','Curitiba','PR','4133334941','4133334941','4184122072','','4133334941','','','','','','2008-01-30 12:08:29'),
 (33,'03004','Bernhard Zanker Junior','2008-03-05','','025.833.599-83','M',6,'Rua Brasílio Itiberê','2455','','Ap.','31 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:12:22'),
 (34,'03005','Edison Carlos dos Santos','2008-03-05','','681.977.569-53','',6,'Rua Brasílio Itiberê','2455','','Ap.','43 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:13:16'),
 (35,'03006','Ana Elisa Macagnan','2008-03-05','','897.755.200-10','',6,'Rua Brasílio Itiberê','2455','','Ap.','22 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:14:10'),
 (36,'03007','Fernando Henrique Tremel Bueno','2008-03-05','','050.193.579-79','',6,'Rua Brasílio Itiberê','2455','','Ap.','24 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:15:05'),
 (37,'03008','Adriano Noedinger da Silva','2008-03-05','','030.070.919-69','M',6,'Rua Brasílio Itiberê','2455','B','Ap.','43 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','Cunhado do Edison Pudim','2008-01-30 12:16:22'),
 (38,'03009','Eugenio Antonio Guerra','2008-03-05','','553.679.686-00','',6,'Rua Brasílio Itiberê','2455','','Ap.','44 B','80230-050','Rebouças','Curitiba','PR','4133336862','','4199754454','','','','egf.madeiras@netctba.com.br','geninhoemarias@netctba.com.br','','','2008-01-30 12:17:19'),
 (39,'03010','Waldenira Pistori','2008-03-05','','205.384.649-68','F',6,'Rua Brasílio Itiberê','2455','','Ap.','21 BII','80230-050','Rebouças','Curitiba','PR','','4130261627','','','','','','','','','2008-01-30 12:18:23'),
 (40,'03011','Clayton Cezar Upitis Marloch','2008-03-05','','651.454.109-72','M',6,'Rua Brasílio Itiberê','2455','','Ap.','42 BII','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:19:28'),
 (41,'04001','Vanildo','2008-03-05','','','M',5,'R. 24 de Maio','262','','Cj.','301','80230-080','Centro','Curitiba','PR','','','','','','','','','','Zelador do condominio possue uma sala comercial','2008-01-30 12:33:04'),
 (42,'04002','ACC Aduditoria Contabil S/C Ltda.','2008-03-05','','01.625.401/0001-08','',5,'R. 24 de Maio','262','','Cj.','1103','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:35:17'),
 (43,'04003','Francisco C. T. Costa e Silva','2008-03-05','','320.945.319-53','M',5,'R. 24 de Maio','262','','Cj.','505 /  506','80230-080','Centro','Curitiba','PR','','4132336584','','','','','','','','','2008-01-30 12:36:52'),
 (44,'04004','Sonia Maria Bressan ','2008-03-05','','237.300.300-78','F',5,'R. 24 de Maio','262','','Cj.','803','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:38:03'),
 (45,'04005','Carlos Eduardo','2008-03-05','','','M',5,'R. 24 de Maio','262','','','806','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:38:56'),
 (46,'04006','Saulo Souza e Silva','2008-03-05','','322.416.669-04','M',5,'R. 24 de Maio','262','','Cj.','402','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:41:27'),
 (47,'04007','Ursula','2008-03-05','','','',5,'R. 24 de Maio','262','','Cj.','402','80230-080','Centro','Curitiba','PR','','','','','','','','','','Atendente do consultório do Saulo.','2008-01-30 12:42:22'),
 (48,'04008','R. Huczok Consulting Ltda.','2008-03-05','','00.058.094/0001-50','',5,'R. 24 de Maio','262','','Cj.','1001 /  1002','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:44:30'),
 (49,'04009','DIVALPAR Participação Societária Ltda.','2008-03-05','','76.641.265/0001-30','',5,'Rua 24 de Maio','262','','Cj.','1104','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:58:07'),
 (50,'04010','Rogoski & Soares C. A. Elet. Ltda.','2008-03-05','','08.182.364/0001-41','',5,'Rua 24 de Maio','262','','Cj.','1201','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 13:12:50'),
 (51,'04011','Olimpus Agência de Viagem e Turismo Ltda.','2008-03-05','','01.134.309/0001-37','',5,'Rua 24 de Maio','262','','Cj.','1202','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 13:17:03'),
 (52,'04012','EPRON Serviço de Informática S/C Ltda.','2008-03-05','','01.766.736/0001-38','',5,'Rua 24 de Maio','262','','Cj.','605','80230-080','Centro','Curitiba','PR','','','','','','','','','','Ivan desenvolvedor de software para a Huczok.','2008-01-30 14:40:51'),
 (53,'05001','Marisa Helena da Costa Serafin','2008-03-05','','471.972.509-00','',1,'Av. Sete de Setembro','3272','','Ap.','01','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 14:42:51'),
 (54,'05002','Marisângela Pacheco Brittes','2008-03-05','','906.561.219-04','F',1,'Av. Sete de Setembro','3272','','Ap.','03','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 14:46:08'),
 (55,'05003','COMPOR Arquitetura e Construção Ltda.','2008-03-05','','79.110.086/0001-65','',1,'Av. Sete de Setembro','3272','','Cj.','04','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 19:31:18'),
 (56,'05004','Eliana Nascimento','2008-03-05','','872.560.296-91','',1,'Av. Sete de Setembro','3272','','Ap.','06','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 19:33:38'),
 (57,'05005','Djalma Jacinto da Silva Filho','2008-03-05','','738.669.389-34','M',1,'Av. Sete de Setembro','3272','','Ap.','08','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 19:37:09'),
 (58,'05006','Isabel Jacomel','2008-03-05','','583.674.629-04','F',1,'Av. Sete de Setembro','3272','','Ap.','10','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 19:42:46'),
 (59,'05007','Celso Amaral Poletti','2008-03-05','','008.436.739-31','M',1,'Av. Sete de Setembro','3272','','Ap.','12','80230-010','Centro','Curitiba','PR','','','','','','','','','','Beatriz > 8805-3575','2008-01-30 19:45:36'),
 (60,'05008','Claiton Estacionamento','2008-03-08','','','M',1,'Av. Sete de Setembro','3272','','','Estacionamento','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 19:46:11'),
 (61,'06002','Matilde Alves da Cunha Silva','2008-03-05','','153.857.058-02','F',4,'Av. Sete de Setembro','3293','','Ap.','103','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 13:52:24'),
 (62,'06003','Wallace Mendes Cordeiro','2008-03-05','','020.916.769-69','M',4,'Av. Sete de Setembro','3293','','Ap.','104','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 13:54:27'),
 (63,'06004','Rubia Souza Pimenta de Padua','1981-04-25','7211934-7 / PR','03703663952','F',4,'Av. Sete de Setembro','3293','','Ap.','108','80.230-010','Centro','Curitiba','PR','','4136425555','4199570561','','','','','','','','2008-01-31 13:56:28'),
 (64,'06005','Robson Roberto da Silva','2008-03-05','','048.468.029-30','M',4,'Av. Sete de Setembro','3293','','Ap.','208','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 13:57:38'),
 (65,'6006','Bruna Amaral Monteiro','0000-00-00','384.625-0 / PR','048.863.769-40','F',4,'Av. Sete de Setembro','3293','','','307','80.230-010','Centro','Curitiba','PR','','','4196654014','','','','','','','celular antigo > 4199653379','2008-01-31 13:58:30'),
 (66,'06007','Luana Aparecida Dias Mota','2008-03-05','','342.496.088-83','F',4,'Av. Sete de Setembro','3293','','Ap.','405','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:00:04'),
 (67,'6008','Katia Cristina Zardo','0000-00-00','','','F',4,'Av. Sete de Setembro','3293','','','602','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:00:52'),
 (68,'6009','Rose Cristina Neves','0000-00-00','','','F',4,'Av. Sete de Setembro','3293','','','603','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:03:06'),
 (69,'06010','George Galli','2008-03-05','','054.504.359-08','M',4,'Av. Sete de Setembro','3293','','Ap.','606','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:04:15'),
 (70,'06011','Leonardo Raupp Matta','2008-03-05','','368.638.378-03','M',4,'Av. Sete de Setembro','3293','','Ap.','904','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:05:36'),
 (71,'06012','Rita Helena Zimmermann','2008-03-05','','312.534.319-49','F',4,'Av. Sete de Setembro','3293','','Ap.','905','80.230-010','Centro','Curitiba','PR','4132336720','','','','','','','','','','2008-01-31 14:06:53'),
 (72,'06013','Mellina Franco Oliveira Canto','2008-03-05','','368.851.968-00','F',4,'Av. Sete de Setembro','3293','','Ap.','908','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:09:21'),
 (73,'06014','Felipe Lukacievick Barbosa','2008-03-05','','040.494.399-30','M',4,'Av. Sete de Setembro','3293','1004','Ap.','1004','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:17:05'),
 (74,'06015','Fernando Cesar Alves da Silva','2008-03-05','','','M',4,'Av. Sete de Setembro','3293','','Ap.','1106','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:18:08'),
 (75,'6016','Amanda Tieppo','0000-00-00','','055.717.089-30','F',4,'Av. Sete de Setembro','3293','','','1108','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:19:24'),
 (76,'06017','Thiago Carli','2008-03-05','','039.701.069-90','M',4,'Av. Sete de Setembro','3293','','Ap.','1205','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:20:34'),
 (77,'6018','Fabiana Reis','0000-00-00','','','F',4,'Av. Sete de Setembro','3293','','','1301','80.230-010','Centro','Curitiba','PR','','','','','','','','','','Filha da D. Lourdes zeladora do predio.','2008-01-31 14:22:04'),
 (78,'09001','Katia Regina Schmeiske','2008-03-05','','','F',8,'Av. Sete de Setembro','6830','','Ap.','1531','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 14:37:16'),
 (79,'09002','Henderson Ezequiel Rudiniski','2008-03-05','','022.198.909-96','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','232','80.440-000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 14:49:04'),
 (80,'09003','Morgana Biron','2008-03-05','7.859.158-7 / PR','053.419.179-79','F',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','241','80440000','Seminário','Curitiba','PR','','','','','','','','','','Ponto adicional habilitado em 19/02/08:\r\nIP: 10.1.3.2 ; MAC-ADDR: 00:C0:DF:E9:B4:88','2008-01-31 14:50:06'),
 (81,'09004','Thais Cristina Sentone Mota','2008-03-05','','035.978.319-82','F',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','522','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 14:52:03'),
 (82,'09005','João Arnaldo de Oliveira','2008-03-05','','028.053.679-87','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','722','80.440-000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 14:53:43'),
 (83,'09006','Carlos Roberto dos Santos Fernandes','2008-03-05','2088917-9 SPP/PR','402.430.1529-87','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','811','80440000','Seminário','Curitiba','PR','','','4196447773','','','','carlaovs41@hotmail.com','','','','2008-01-31 15:10:05'),
 (84,'09007','Sonia Aparecida Estevan Costa ','2008-03-05','','','F',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','922','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:14:16'),
 (85,'09008','José Carlos de Lima','2008-03-05','','337.841.169-49','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','932','80440000','Seminário','Curitiba','PR','4133432571','','','','','','','','','durante o dia contatos com a esposa Jucimara','2008-01-31 15:15:13'),
 (86,'09009','Ivana Rubio Colin','2008-03-05','','055.924.239-50','F',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','942','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:16:29'),
 (87,'09010','José Carvalho Filho','2008-03-05','','396.640.319-68','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1122','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:17:36'),
 (88,'09011','Anderson Augusto Fillus','2008-03-05','','049.129.829-38','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1511','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:18:32'),
 (89,'09012','Jefferson Olinger de Souza','2008-03-05','','040.739.369-21','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1512','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:19:38'),
 (90,'09013','José Carlos','2008-03-05','','','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1512','80440000','Seminário','Curitiba','PR','','','','','','','','','','Pai do Jefferson plano individual do próprio.','2008-01-31 15:22:00'),
 (91,'09014','Adriano ','2008-03-05','','','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1521','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:22:31'),
 (93,'101001','Everson Edson do Prado','1979-11-08','89821258','02692342925','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','71','81150060','Pinheirinho','Curitiba','PR','32466809','','88072142','','','','eversonet@hotmail.com','','','Instalaçao 02/02/2008 - dia todo, ligar p confirmar horario.','2008-02-01 16:08:54'),
 (94,'101015','Valdemir Antonio Rovares','2008-03-06','19272090','10806149825','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','103','81150060','Pinheirinho','Curitiba','PR','3246-1186','','','','','','alexandrarovares@hotmail.com','','','Esposo da Sindica ','2008-02-01 16:16:44'),
 (95,'101002','Nilo Navarri','2008-03-06','19772535','40534430910','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','22','81150060','Pinheirinho','Curitiba','PR','','','99613435','','','','nilonavarri@hotmail.com','','','','2008-02-01 16:19:17'),
 (96,'101003','Dievert Fernando de Campos','2008-03-06','77872906','04589454980','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','63','81150060','Pinheirinho','Curitiba','PR','33272329','','','','','','cheve_tt_ee@hotmail.com','','','','2008-02-01 16:22:44'),
 (97,'101004','Luiz Eduardo Lasszck','2008-03-06','62449284','87587610987','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','92','81150060','Pinheirinho','Curitiba','PR','3304-9098','','9936-6803','','','','eduardo@prt9.mpt.gov.br','','','','2008-02-01 16:24:29'),
 (98,'101005','Adenir Farias','0000-00-00','60208018','01755436904','M',12,'R Marechal Otávio Saldanha Mazza','7777','','','101','81150060','Pinheirinho','Curitiba','PR','3567-9184 ','','8405-5327','','','','','','','','2008-02-01 16:26:51'),
 (99,'101006','Valdir Modest de Oliveira','2008-03-06','41744367','55588930959','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','112','81150060','Pinheirinho','Curitiba','PR','','','9682-0731','','','','valdirdeoliveira1@hotmail.com','','','','2008-02-01 16:28:36'),
 (100,'101007','Antonio dos Santos Bicalho','2008-03-06','34219095','49109243968','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','143','81150060','Pinheirinho','Curitiba','PR','3346-1714','','9916-3562','','','','','','','','2008-02-01 16:30:06'),
 (101,'101008','Sueli Costa Luvison','2008-03-06','67199162','02171579986','F',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','114','81150060','Pinheirinho','Curitiba','PR','3268-9163','','','','','','s_ueli_costa@hotmail.com','','','','2008-02-01 16:31:55'),
 (102,'101009','Dieick Denner Gonçalves','2008-03-06','74123333','00695822977','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','151','81150060','Pinheirinho','Curitiba','PR','3022-8903','','9677-8533','','','','dieick@yahoo.com.br','','','','2008-02-01 16:33:44'),
 (103,'101010','Vanderlei Souza','2008-03-06','299305661','','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','153','81150060','Pinheirinho','Curitiba','PR','','','8848-2141','','','','','','','nao tem seviço.','2008-02-01 16:36:46'),
 (104,'101011','Shirley Cristiane M. de Souza','2008-03-06','7.324.135-9','024425299-80','F',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','53','81150060','Pinheirinho','Curitiba','PR','','','8818-4709','','','','criskatana@hotmail.com','','','','2008-02-01 16:38:10'),
 (105,'101012','Silvia Aparecida Pereira','2008-03-06','60820724','87363755949','F',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','123','81150060','Pinheirinho','Curitiba','PR','3247-5528','','9963-7739','','','','valter.costa@cnh.com','','','Esposa do Valter','2008-02-01 16:40:03'),
 (106,'101013','Rosina Helena dos Santos','2008-03-06','2098664 / PR','68846649915','F',12,'R Marechal Otávio Saldanha Mazza','777','','Ap.','33','81150060','Pinheirinho','Curitiba','PR','4132483312','','4188039777','','','','','','','Raphaela de Oliveira\r\nRG 79419982\r\nCPF 07511603939\r\n','2008-02-01 16:42:41'),
 (107,'101014','Robson Sandro Santos','2008-03-06','74006884','02842147952','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','141','81150060','Pinheirinho','Curitiba','PR','','','8437-7480','','','','','','','','2008-02-01 16:44:23'),
 (125,'09016','Sidnei Scaravonatti','0000-00-00','4220679-2','589510409-68','M',8,'Avenida Nossa Senhora Aparecida','501','11','Ap.','1111','80440000','Seminário','Curitiba','PR','4132435937','','4599772199','','','','ssidnei@hotmail.com','','','','2008-03-07 11:33:32'),
 (109,'00003','GE Money','2008-03-05','','','',10,'Rua Monsenhor Celso','23','','','','80010-150','Centro','Curitiba','PR','','41 3224-0177','','','41 3224-7119','','','','','Contato: Ediely Bilo\r\nSite: www.gemoney.com.br','2008-02-20 10:56:20'),
 (110,'99005','Ricardo - PRT','0000-00-00','','','',9,'','','','','','','','','PR','','','','','','','','','','Dados bancários usados para pagar a SCM:\r\nBanco do Brasil\r\nAG: 1443-5\r\nCC: 19.150-7\r\nValor: R$ 1340,80','2008-02-20 11:00:31'),
 (111,'4','Mercador Fomento Mercantil LTDA.','0000-00-00','','04.543.073/0001-80','M',10,'','','','','','','','','PR','','','','','','','','','','Dados Bancários:\r\nHSBC\r\nAG: 0054\r\nCC: 28487-75','2008-02-20 11:03:31'),
 (112,'5','Fontoura e Silva Com. de Informática','0000-00-00','','','',10,'','','','','','','','','PR','','','','','','','','','','Dados Bancários:\r\nItaú\r\nAG: 3761\r\nCC: 09324-8','2008-02-20 11:21:55'),
 (113,'00006','Paraná Despachante','2008-03-05','','','',10,'','','','','','','','','PR','','41 3015-5501','','','','','','','','','2008-02-20 11:25:23'),
 (114,'09015','Ivan de Oliveira Mota','2008-03-05','340.196-0 / PR','111.061.589-20','M',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','522','80440000','Seminário','Curitiba','PR','4133432466','','','','','','ivan.o.mota@hotmail.com','ivan.o.mota@gmail.com','','Substituiu o titulat do contrato (Thais).\r\nRenegociado valores atrasados:\r\nde 10/03 a 10/08 parcelas de R$ 80,00\r\na partir de 10/09 normal\r\n','2008-02-20 12:13:22'),
 (115,'7','Federação Paranaense de Ginástica','0000-00-00','','00.417.081/0001-20','',10,'Rua Profª Antonia Reginatto Viana','921','','','','','','Curitiba','PR','','','','','','','','','','','2008-02-20 12:58:41'),
 (116,'6019','Jonas','0000-00-00','','','M',4,'Av. Sete de Setembro','3293','','','206','80.230-010','Centro','Curitiba','PR','','','9944-2176','','','','','','','Não mora mais no Roma, solicitou cancelamento em 21/11/08 às 12:28, quem atendeu foi o Valteir','2008-02-20 13:13:58'),
 (117,'00008','BV Financeira - Daniel Moreira','2008-03-05','','','',10,'Avenida Mal. Deodoro','261','','','Térreo','','','','PR','','41 3596-3900','41 8808-1787','','','','daniel.moreira@cppromotora.com.br','','','','2008-02-01 13:16:27'),
 (118,'00009','B2 Informática','2008-03-05','','','M',10,'','','','','','','','','PR','','41 3029-9404','','','','www.infob2.com.br','vendas@infob2.com.br','','','Contato: Renato','2008-02-01 13:17:54'),
 (119,'51001','Antonia - Síndica','0000-00-00','','','',11,'','','','','','','Jardim Botânico','Curitiba','PR','3013-0751','',' 9198-8823','','','','','','','','2008-02-01 13:19:33'),
 (120,'99006','Elenara Beatriz Fontana','0000-00-00','','','F',9,'','','','','','','','','PR','3324-1243','3223-7758','9971-6264','','','','elenaraf@gmail.com','elenara.fontana@pucpr.br','','Cirurgiã Dentista\r\nFinanceamento carro com BV Financeira','2008-02-01 13:25:11'),
 (121,'06020','Jeane Margarete Rucinski','1973-04-13','60213070 / PR','81348053968','F',4,'Av. Sete de Setembro','3293','','Ap.','503','80.230-010','Centro','Curitiba','PR','4141013797','','4141013797','','','','jeanemargareterucinski@bol.com.br','','','Plano smartconnect150','2008-02-28 09:01:13'),
 (123,'101017','Marcelo Luiz Velter','1971-09-08','219.7845 / SC','652.603.259-15','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','52','81150060','Pinheirinho','Curitiba','PR','4130130386','','4788050784','','','','','','','','2008-03-06 13:29:14'),
 (124,'101018','José Carlos Cardoso Ajala','1965-08-26','036.803.893-1','419.537.030-20','M',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','42','81150060','Pinheirinho','Curitiba','PR','4130295633','','4184021972','','','','carlosajala@hotmail.com','','','','2008-03-06 13:31:20');

--
-- Definition of table `clientes_bkp`
--

DROP TABLE IF EXISTS `clientes_bkp`;
CREATE TABLE `clientes_bkp` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `codigo` int(20) NOT NULL,
  `nome` varchar(200) NOT NULL default '',
  `nascimento` timestamp NOT NULL default '0000-00-00 00:00:00',
  `rg` varchar(20) NOT NULL,
  `cpf` varchar(30) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `grupo_id` int(11) default NULL,
  `endereco` varchar(300) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `tel_residencial` varchar(50) NOT NULL,
  `tel_comercial` varchar(50) NOT NULL,
  `tel_celular1` varchar(50) NOT NULL,
  `tel_celular2` varchar(20) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email1` varchar(300) NOT NULL,
  `email2` varchar(200) NOT NULL,
  `email3` varchar(200) NOT NULL,
  `observacoes` text NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes_bkp`
--
INSERT INTO `clientes_bkp` (`id`,`codigo`,`nome`,`nascimento`,`rg`,`cpf`,`sexo`,`grupo_id`,`endereco`,`numero`,`complemento`,`cep`,`bairro`,`cidade`,`uf`,`tel_residencial`,`tel_comercial`,`tel_celular1`,`tel_celular2`,`fax`,`email1`,`email2`,`email3`,`observacoes`,`datacadastro`) VALUES 
 (7,8001,'Tulio Hofmann Filho','0000-00-00 00:00:00','','','M',3,'R. Alferes Poli','294','Ap. 101','80230-090','Centro','Curitiba','PR','','','','','','','','','','2007-11-23 12:22:09'),
 (8,8002,'Daniel Hiroshi Nielsen Yabu','0000-00-00 00:00:00','','034.753.719-79','M',3,'Rua Alferes Poli','294','AP 1603','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:09:00'),
 (9,8003,'Robson Lara Moreira','0000-00-00 00:00:00','','','M',3,'Rua Alferes Poli','294','AP 202','80230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:09:37'),
 (10,8004,'Felipe Augusto Kubis','0000-00-00 00:00:00','','054.165.369-50','M',3,'Rua Alferes Poli','294','AP 301','80230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:10:30'),
 (11,8005,'Mayara Cristina Garcia Machuca ','0000-00-00 00:00:00','','369.742.538-26','F',3,'Rua Alferes Poli','294','Ap. 303','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:11:33'),
 (12,8006,'Graciele Razera','0000-00-00 00:00:00','','644.489.400-04','F',3,'Rua Alferes Poli','294','AP 902','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:12:41'),
 (13,8008,'Lucas Nunes da Silveira','0000-00-00 00:00:00','','038.062.189-43','M',3,'Rua Alferes Poli','294','AP 903','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:13:34'),
 (14,8007,'Simone Vivan','0000-00-00 00:00:00','','029.500.199-27','F',3,'Rua Alferes Poli','294','AP 1001','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:14:13'),
 (15,8009,'Rebeca Garcia Martins','0000-00-00 00:00:00','','046.373.099-21','F',3,'Rua Alferes Poli','294','AP 1402','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:14:47'),
 (16,8010,'Juliana Horta','0000-00-00 00:00:00','','','F',3,'Rua Alferes Poli','294','AP 1403','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:15:20'),
 (17,8011,'Robson G. Barbosa','0000-00-00 00:00:00','','','M',3,'R. Alferes Poli','294','Ap. 1502','80230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:16:12'),
 (18,99001,'Oscar Ricardo Macedo Schmeiske','0000-00-00 00:00:00','','63525160925','M',9,'Avenida Sete de Setembro','6830','AP 1531','80240001','Seminário','Curitiba','PR','4132436467','4132501355','4199776984','','','oscar@ippuc.org.br','oscarschmeiske@gmail.com','','Cliente avulso em serviços de manutenção e suporte.','2008-01-29 17:17:35'),
 (19,99002,'Rinaldo da Silva Rocha','0000-00-00 00:00:00','','69705658900','M',9,'Rua Maria Ludwig Muller','277','','83409540','Jardim Eucalipto','Colombo','PR','','','','','','','','','Parceiro de negocios - Manutenção em monitores, impressoras e micromputadores.','2008-01-29 17:26:55'),
 (20,3001,'Clelia Alice Marson','1971-03-19 00:00:00','60871990','96329858934','F',6,'R. Brasílio Itiberê','2455','AP B25','80230-050','Rebouças','Curitiba','PR','4133334941','','4184253353','','','','','','','2008-01-29 17:31:24'),
 (21,6001,'Iolanda Reis','0000-00-00 00:00:00','','39409538904','F',4,'Avenida. Sete de Setembro','3293','AP 1301','80230-010','Centro','Curitiba','PR','4130194881','','','','','','','','Cunhada da Zeladora do Edificio Roma, dados para operaçõs financeiras.','2008-01-29 17:38:20'),
 (22,2,'IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba','0000-00-00 00:00:00','','76.582.337/0001-16','',10,'Rua Bom Jesus','669','','80035010','Juveve','Curitiba','PR','','4132501300','','','','','','','Cliente de Vendas de equipamentos e de Serviços de suporte e manutenção em servidores.','2008-01-29 18:01:02'),
 (23,99003,'Luis Sergio Rolim de Moura','0000-00-00 00:00:00','','64101835934','M',9,'Rua Irmãs Paulina','5146','','81020230','Novo mundo','Curitiba','PR','','','4192139239','4191823402','','','','','Luis que trabalha com o Paulo Databull.','2008-01-29 18:09:07'),
 (24,99004,'Rauf Alencar de Oliveira','1986-04-09 00:00:00','','05889025945','M',9,'Rua João Gomes ','100','Bloco J  AP 32','80020030','Novo mundo','Curitiba','PR','','4133980456','41','','','rauf@mjtelefonia.com.br','rauf.sk8@gmail.com','','','2008-01-29 18:13:39'),
 (25,2001,'Rose Mari Martins Arruda','0000-00-00 00:00:00','','317.955.799-00','F',7,'Rua Lourenço Pinto','260','AP 103','80010160','Centro','Curitiba','PR','4132224102','4130146906','4194280387','','','','','','Sindica do condominio','2008-01-30 11:49:16'),
 (26,2002,'Jackson M. Nizer','0000-00-00 00:00:00','','032.173.759-80','M',7,'Rua Lourenço Pinto','260','AP 201','80010160','Centro','Curitiba','PR','','','','','','','','','Irmão da Jacqueline Nizer funcionária da Huczok','2008-01-30 11:50:59'),
 (27,2003,'Jorge Gonçalves dos Santos','0000-00-00 00:00:00','','157.097.799-20','M',7,'Rua Lourenço Pinto','260','','80010160','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 11:53:31'),
 (28,2004,'Sergio Vivan','0000-00-00 00:00:00','','460.707.379-20','',7,'Rua Lourenço Pinto','260','AP 303','80010160','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 11:55:04'),
 (29,2005,'Jhony Maciel Oliveira','0000-00-00 00:00:00','','064.214.299-80','M',7,'Rua Lourenço Pinto','260','AP 103B ','80010160','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 11:58:47'),
 (30,2006,'Daisy Mary Reichel','0000-00-00 00:00:00','','008933740-91','F',7,'Rua Lourenço Pinto','260','AP 302','80010160','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:04:12'),
 (31,3002,'Luciana Osorio Cavalli','0000-00-00 00:00:00','','043.933.609-07','F',6,'Rua Brasílio Itiberê','2455','AP 23B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:06:50'),
 (32,3003,'Zenildo Costa','0000-00-00 00:00:00','','539.938.029-34','M',6,'Rua Brasílio Itiberê','2455','AP 25B','80230-050','Rebouças','Curitiba','PR','4133334941','4133334941','4184122072','','4133334941','','','','','2008-01-30 12:08:29'),
 (33,3004,'Bernhard Zanker Junior','0000-00-00 00:00:00','','025.833.599-83','M',6,'Rua Brasílio Itiberê','2455','AP 31 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:12:22'),
 (34,3005,'Edison Carlos dos Santos','0000-00-00 00:00:00','','681.977.569-53','',6,'Rua Brasílio Itiberê','2455','AP 43 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:13:16'),
 (35,3006,'Ana Elisa Macagnan','0000-00-00 00:00:00','','897.755.200-10','',6,'Rua Brasílio Itiberê','2455','AP 22 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:14:10'),
 (36,3007,'Fernando Henrique Tremel Bueno','0000-00-00 00:00:00','','050.193.579-79','',6,'Rua Brasílio Itiberê','2455','AP 24 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:15:05'),
 (37,3008,'Adriano Noedinger da Silva','0000-00-00 00:00:00','','030.070.919-69','M',6,'Rua Brasílio Itiberê','2455','AP 43 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','Cunhado do Edison Pudim','2008-01-30 12:16:22'),
 (38,3009,'Eugenio Antonio Guerra','0000-00-00 00:00:00','','553.679.686-00','',6,'Rua Brasílio Itiberê','2455','AP 44 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:17:19'),
 (39,3010,'Waldenira Pistori','0000-00-00 00:00:00','','205.384.649-68','F',6,'Rua Brasílio Itiberê','2455','AP 21 BII','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:18:23'),
 (40,3011,'Clayton Cezar Upitis Marloch','0000-00-00 00:00:00','','651.454.109-72','M',6,'Rua Brasílio Itiberê','2455','AP 42 BII','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:19:28'),
 (41,4001,'Vanildo','0000-00-00 00:00:00','','','M',5,'R. 24 de Maio','262','CJ 301','80230-080','Centro','Curitiba','PR','','','','','','','','','Zelador do condominio possue uma sala comercial','2008-01-30 12:33:04'),
 (42,4002,'ACC Aduditoria Contabil S/C Ltda.','0000-00-00 00:00:00','','01.625.401/0001-08','',5,'R. 24 de Maio','262','CJ 1103','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:35:17'),
 (43,4003,'Francisco C. T. Costa e Silva','0000-00-00 00:00:00','','320.945.319-53','M',5,'R. 24 de Maio','262','CJ 505 / 506','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:36:52'),
 (44,4004,'Sonia Maria Bressan ','0000-00-00 00:00:00','','237.300.300-78','F',5,'R. 24 de Maio','262','CJ 803','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:38:03'),
 (45,4005,'Carlos Eduardo','0000-00-00 00:00:00','','','M',5,'R. 24 de Maio','262','CJ 806','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:38:56'),
 (46,4006,'Saulo Souza e Silva','0000-00-00 00:00:00','','322.416.669-04','M',5,'R. 24 de Maio','262','CJ 402','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:41:27'),
 (47,4007,'Ursula','0000-00-00 00:00:00','','','',5,'R. 24 de Maio','262','CJ 402','80230-080','Centro','Curitiba','PR','','','','','','','','','Atendente do consultório do Saulo.','2008-01-30 12:42:22'),
 (48,4008,'R. Huczok Consulting Ltda.','0000-00-00 00:00:00','','00.058.094/0001-50','',5,'R. 24 de Maio','262','CJ 1001 / 1002','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:44:30'),
 (49,4009,'DIVALPAR Participação Societária Ltda.','0000-00-00 00:00:00','','76.641.265/0001-30','',5,'Rua 24 de Maio','262','CJ 1104','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:58:07'),
 (50,4010,'Rogoski & Soares C. A. Elet. Ltda.','0000-00-00 00:00:00','','08.182.364/0001-41','',5,'Rua 24 de Maio','262','CJ 1201','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 13:12:50'),
 (51,4011,'Olimpus Agência de Viagem e Turismo Ltda.','0000-00-00 00:00:00','','01.134.309/0001-37','',5,'Rua 24 de Maio','262','CJ 1202','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 13:17:03'),
 (52,4012,'EPRON Serviço de Informática S/C Ltda.','0000-00-00 00:00:00','','01.766.736/0001-38','',5,'Rua 24 de Maio','262','CJ 605','80230-080','Centro','Curitiba','PR','','','','','','','','','Ivan desenvolvedor de software para a Huczok.','2008-01-30 14:40:51'),
 (53,5001,'Marisa Helena da Costa Serafin','0000-00-00 00:00:00','','471.972.509-00','',1,'Av. Sete de Setembro','3272','AP 01','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 14:42:51'),
 (54,5002,'Marisângela Pacheco Brittes','0000-00-00 00:00:00','','906.561.219-04','F',1,'Av. Sete de Setembro','3272','AP 03','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 14:46:08'),
 (55,5003,'COMPOR Arquitetura e Construção Ltda.','0000-00-00 00:00:00','','79.110.086/0001-65','',1,'Av. Sete de Setembro','3272','CJ 04','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:31:18'),
 (56,5004,'Eliana Nascimento','0000-00-00 00:00:00','','872.560.296-91','',1,'Av. Sete de Setembro','3272','AP 06','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:33:38'),
 (57,5005,'Djalma Jacinto da Silva Filho','0000-00-00 00:00:00','','738.669.389-34','M',1,'Av. Sete de Setembro','3272','AP 08','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:37:09'),
 (58,5006,'Isabel Jacomel','0000-00-00 00:00:00','','583.674.629-04','F',1,'Av. Sete de Setembro','3272','AP 10','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:42:46'),
 (59,5007,'Celso Amaral Poletti','0000-00-00 00:00:00','','008.436.739-31','M',1,'Av. Sete de Setembro','3272','AP 12','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:45:36'),
 (60,5008,'Claiton Estacionamento','0000-00-00 00:00:00','','','M',1,'Av. Sete de Setembro','3272','Estacionamento','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:46:11'),
 (61,6002,'Matilde Alves da Cunha Silva','0000-00-00 00:00:00','','153.857.058-02','F',4,'Av. Sete de Setembro','3293','AP 103','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:52:24'),
 (62,6003,'Wallace Mendes Cordeiro','0000-00-00 00:00:00','','020.916.769-69','M',4,'Av. Sete de Setembro','3293','AP 104','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:54:27'),
 (63,6004,'Natalia','0000-00-00 00:00:00','','','F',4,'Av. Sete de Setembro','3293','AP 108','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:56:28'),
 (64,6005,'Robson Roberto da Silva','0000-00-00 00:00:00','','048.468.029-30','M',4,'Av. Sete de Setembro','3293','AP 208','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:57:38'),
 (65,6006,'Bruna Amaral Monteiro','0000-00-00 00:00:00','','','F',4,'Av. Sete de Setembro','3293','AP 307','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:58:30'),
 (66,6007,'Luana Aparecida Dias Mota','0000-00-00 00:00:00','','342.496.088-83','F',4,'Av. Sete de Setembro','3293','AP 405','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 14:00:04'),
 (67,6008,'Katia Cristina Zardo','0000-00-00 00:00:00','','','F',4,'Av. Sete de Setembro','3293','AP 602','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 14:00:52');

--
-- Definition of table `contatos`
--

DROP TABLE IF EXISTS `contatos`;
CREATE TABLE `contatos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(300) collate latin1_general_ci NOT NULL,
  `empresa` varchar(300) collate latin1_general_ci NOT NULL,
  `tipo` varchar(300) collate latin1_general_ci NOT NULL,
  `edificio` varchar(300) collate latin1_general_ci NOT NULL,
  `endereco` varchar(300) collate latin1_general_ci NOT NULL,
  `numero` varchar(300) collate latin1_general_ci NOT NULL,
  `complemento` varchar(300) collate latin1_general_ci NOT NULL,
  `bairro` varchar(300) collate latin1_general_ci NOT NULL,
  `cep` varchar(300) collate latin1_general_ci NOT NULL,
  `cidade` varchar(300) collate latin1_general_ci NOT NULL,
  `uf` varchar(300) collate latin1_general_ci NOT NULL,
  `telefone1` varchar(300) collate latin1_general_ci NOT NULL,
  `telefone2` varchar(300) collate latin1_general_ci NOT NULL,
  `celular1` varchar(300) collate latin1_general_ci NOT NULL,
  `celular2` varchar(300) collate latin1_general_ci NOT NULL,
  `email1` varchar(300) collate latin1_general_ci NOT NULL,
  `email2` varchar(300) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `contatos`
--
INSERT INTO `contatos` (`id`,`nome`,`empresa`,`tipo`,`edificio`,`endereco`,`numero`,`complemento`,`bairro`,`cep`,`cidade`,`uf`,`telefone1`,`telefone2`,`celular1`,`celular2`,`email1`,`email2`,`observacoes`,`datacadastro`) VALUES 
 (1,'Ederson','Tenda Equipamentos Wireless','Contato comercial','','','','','','','','PR','','','9987-0696','','','','28/01/2008 14:37 - Retornar ligação para agendar horário p/ reunião','0000-00-00 00:00:00'),
 (2,'Marco Henrique','','Possível cliente','','','','','Portão','','Curitiba','PR','','','8407-3966','','','','Possivel cliente no portão; Prédio com aproximadamente 100 apartamentos. Vai falar com a síndica e com vizinhos e mostrar nosso panfleto.','0000-00-00 00:00:00'),
 (3,'Paula','Nextel','Contato Comercial','','','','','','','','PR','0800 900 901','','','','','','Plano Radio Ilimitado + Telefonia Ilimitada\r\n- Radio ilimitado\r\n- R$ 0,60 por minuto\r\n- Mensalidade: R$ 82,00\r\n\r\nPlano Radio Ilimitado + Telefonia Bloqueada\r\n- Radio Ilimitado\r\n- Compra de créditos para fazer ligações\r\n- Mensalidade: R$ 92,00\r\n\r\nAparelhos:\r\n- Alugado: o mais simples, Motorola i290, custa 4x de R$ 46,00 de adesão e mensalidade de R$ 13,00\r\n- À parte: Precisa comprar o chip por R$ 39,90\r\n\r\nDá pra entrar em contato via 0800 e marcar visita de um consultor.','2008-01-29 17:44:08'),
 (4,'Liziane','','contato','Edificio Royal','Av Silva Jardim','624','','','','','PR','4130132696','','','','','','','2008-02-20 11:22:52'),
 (5,'Zanoni','','Sindico','Edificio Residencial Vera Cruz','Rua VX de Novembro','1070','AP 22','Centro','','São José dos Pinhais','PR','4132822659','','','','','','Primeira visita efetuada - reuniao com o Sr. Zanoni\r\nCliente indicado pela Rita da DIVALPAR.\r\n','2008-02-20 11:24:50'),
 (6,'Mercador Fomento Mercantil','','parceiro financeiro','','Rua NUnes Machado','','CJ 803','Centro','','','PR','','','','','','','Dados de conta bancaria:\r\nCNPJ: 04.543.073/0001-80\r\nBanco: HSBC\r\nAgencia: 0054\r\nConta Corrente: 28.487-75\r\n\r\n','2008-02-20 11:45:29'),
 (7,'Bruna','','possivel cliente','Itaperussuna','','','','','','','PR','3603-2092','','','','','','','2008-02-20 13:04:48'),
 (8,'Carlos ou Simone','','possivel cliente','Parresh','','','AP. 201','','','','PR','3222-9077','','8806-7961','8847-4266','','','','2008-02-01 13:21:40'),
 (9,'Bruno Loxaki moracani','','contato','Ed Napoli','silva jardim','','','','','','PR','4133248123','','','','','','','2008-02-01 14:13:34'),
 (10,'Andreia - ed aries ','','cliente','ed aries','','','ap 1201','','','','PR','4132436852','','','','','','','2008-03-01 17:51:12'),
 (11,'Odir Alves','','cliente','Edf Bassa','Rua Santana','590','AP 5','Jardim Botanico','','','PR','4132633856','','','','','','Sindico = AP 2 = ','2008-03-04 19:09:53');

--
-- Definition of table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
CREATE TABLE `contratos` (
  `id` int(11) NOT NULL auto_increment,
  `ativo` int(11) NOT NULL,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `provedor_id` int(11) NOT NULL,
  `plano_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `descricao` text collate latin1_general_ci NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `periodo_id` int(11) NOT NULL,
  `vencimento_padrao` int(11) NOT NULL default '10',
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `contratos`
--
INSERT INTO `contratos` (`id`,`ativo`,`codigo`,`provedor_id`,`plano_id`,`cliente_id`,`grupo_id`,`descricao`,`data_inicio`,`data_termino`,`periodo_id`,`vencimento_padrao`,`observacoes`,`datacadastro`) VALUES 
 (5,1,'',5,1,7,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-14 12:24:46'),
 (6,1,'',5,1,8,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-14 13:31:58'),
 (7,1,'',5,1,9,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-14 13:35:10'),
 (8,1,'',5,1,10,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-14 13:35:36'),
 (9,1,'',5,1,11,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-15 12:12:42'),
 (10,1,'',5,6,12,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-15 12:14:09'),
 (11,1,'',5,1,16,3,'','2008-02-20','0000-00-00',0,10,'','2008-02-01 17:07:47'),
 (12,1,'',5,1,14,3,'','2008-02-20','0000-00-00',0,10,'','2008-02-01 17:08:20'),
 (13,1,'',5,1,17,3,'','2008-02-01','0000-00-00',0,10,'','2008-02-01 17:27:37'),
 (14,1,'',5,1,13,3,'','2008-02-01','0000-00-00',0,10,'','2008-02-01 17:28:49'),
 (15,1,'',5,1,15,3,'','2008-02-01','0000-00-00',0,10,'','2008-02-01 17:29:33');

--
-- Definition of table `estacoes`
--

DROP TABLE IF EXISTS `estacoes`;
CREATE TABLE `estacoes` (
  `id` int(11) NOT NULL auto_increment,
  `contrato_id` int(11) NOT NULL,
  `hostname` varchar(200) collate latin1_general_ci NOT NULL,
  `ip` varchar(11) collate latin1_general_ci NOT NULL,
  `mac_address` varchar(17) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `estacoes`
--

--
-- Definition of table `funcoes`
--

DROP TABLE IF EXISTS `funcoes`;
CREATE TABLE `funcoes` (
  `id` int(11) NOT NULL auto_increment,
  `pai` int(11) NOT NULL default '0',
  `posicao` int(11) NOT NULL default '0',
  `nome` varchar(100) NOT NULL default '',
  `ativo` tinyint(1) NOT NULL default '0',
  `restrito` tinyint(1) NOT NULL default '0',
  `link` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funcoes`
--
INSERT INTO `funcoes` (`id`,`pai`,`posicao`,`nome`,`ativo`,`restrito`,`link`) VALUES 
 (1,0,-10,'Admins',1,0,'javascript:;'),
 (6,0,1,'Provedores',1,0,'javascript:;'),
 (20,0,2,'Contatos',1,0,'javascript:;'),
 (4,0,3,'Clientes',1,0,'javascript:;'),
 (10,0,4,'Grupos',1,0,'javascript:;'),
 (13,0,5,'Planos',1,0,'javascript:;'),
 (16,0,6,'Contratos',1,0,'javascript:;'),
 (19,0,7,'Estações',0,0,'javascript:;'),
 (24,0,15,'Chamados',1,0,'javascript:;'),
 (27,0,7,'Títulos',1,0,'cobrancas.php'),
 (2,1,1,'Cadastro',1,1,'administradores.php?modo=cad'),
 (3,1,2,'Manutenção',1,0,'administradores.php'),
 (5,4,1,'Cadastro',1,0,'clientes.php?modo=cad'),
 (9,4,2,'Manutenção',1,0,'clientes.php?modo=lst'),
 (7,6,1,'Cadastro',1,0,'provedores.php?modo=cad'),
 (8,6,2,'Manutenção',1,0,'provedores.php?modo=lst'),
 (11,10,1,'Cadastro',1,0,'grupos.php?modo=cad'),
 (12,10,2,'Manutenção',1,0,'grupos.php?modo=lst'),
 (14,13,1,'Cadastro',1,0,'planos.php?modo=cad'),
 (15,13,2,'Manutenção',1,0,'planos.php?modo=lst'),
 (17,16,1,'Cadastro',1,0,'contratos.php?modo=cad'),
 (18,16,2,'Manutenção',1,0,'contratos.php?modo=lst'),
 (21,20,1,'Cadastro',1,0,'contatos.php?modo=cad'),
 (22,20,2,'Manutenção',1,0,'contatos.php?modo=lst'),
 (25,24,1,'Abrir Chamado',1,0,'chamados.php?modo=cad'),
 (26,24,2,'Manutenção',0,0,'chamados.php?modo=lst'),
 (28,27,1,'Cadastrar',1,0,'cobrancas.php?modo=cad'),
 (29,27,10,'Períodos - Cadastrar',1,0,'periodos.php?modo=cad'),
 (30,27,11,'Períodos - Manutenção',1,0,'periodos.php?modo=lst');

--
-- Definition of table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL auto_increment,
  `nome_padrao` varchar(100) collate latin1_general_ci NOT NULL,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `nome` varchar(200) collate latin1_general_ci NOT NULL,
  `endereco` varchar(300) collate latin1_general_ci NOT NULL,
  `numero` varchar(100) collate latin1_general_ci NOT NULL,
  `bairro` varchar(300) collate latin1_general_ci NOT NULL,
  `cep` varchar(300) collate latin1_general_ci NOT NULL,
  `cidade` varchar(300) collate latin1_general_ci NOT NULL,
  `uf` varchar(2) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `grupos`
--
INSERT INTO `grupos` (`id`,`nome_padrao`,`codigo`,`tipo`,`nome`,`endereco`,`numero`,`bairro`,`cep`,`cidade`,`uf`,`observacoes`,`datacadastro`) VALUES 
 (1,'EdOdoni','05',1,'Edifício Odoni','Av. Sete de Setembro','3272','Centro','80230-010','Curitiba','PR','','2007-11-19 10:20:51'),
 (3,'EdMarajo','08',1,'Edifício Residencial Marajó','Rua Alferes Poli','294','Centro','80.230-090','Curitiba','PR','','2007-11-19 11:26:41'),
 (4,'EdRoma','06',1,'Edifício Roma','Av. Sete de Setembro','3293','Centro','80.230-010','Curitiba','PR','','2008-01-28 19:35:15'),
 (5,'EdWashington','04',1,'Edifício Comercial Washington','R. 24 de Maio','262','Centro','80230-080','Curitiba','PR','','2008-01-29 12:12:59'),
 (6,'EdBItibere','03',1,'Condominio Residencial Brasilio Itiberê','Rua Brasílio Itiberê','2455','Rebouças','80230-050','Curitiba','PR','','2008-01-29 12:15:14'),
 (7,'EdLPinto','02',1,'Edificio Residencial Lourenço Pinto','Rua Lourenço Pinto','260','Centro','80010160','Curitiba','PR','','2008-01-29 17:06:58'),
 (8,'EdAries','09',1,'Condominio Residencial Aries','Avenida Nossa Senhora Aparecida','501','Seminário','80440000','Curitiba','PR','','2008-01-29 17:10:06'),
 (9,'Outros','99',99,'Clientes Avulsos','','','','','','PR','','2008-01-29 17:14:17'),
 (10,'Empresas','00',2,'Clientes Empresarial','','','','','','PR','Grupo de clientes empresarial.','2008-01-29 17:40:31'),
 (11,'EdBCapanema','51',1,'Condominio Residencial Barão de Capanema','','','Jardim Botânico','','Curitiba','PR','','2008-01-31 15:25:45'),
 (12,'EdOrionis','101',1,'Edifício Residencial Orionis','R Marechal Otávio Saldanha Mazza','7777','Pinheirinho','81150060','Curitiba','PR','Tel portaria 3247-0879\r\n\r\nSindica Alexandra _tel esposo _ 9187 9082_','2008-02-01 16:02:46');

--
-- Definition of table `grupos_tipos`
--

DROP TABLE IF EXISTS `grupos_tipos`;
CREATE TABLE `grupos_tipos` (
  `id` int(11) NOT NULL auto_increment,
  `tipo` varchar(200) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `grupos_tipos`
--
INSERT INTO `grupos_tipos` (`id`,`tipo`) VALUES 
 (1,'Condomínio'),
 (2,'Empresa'),
 (99,'Outros');

--
-- Definition of table `logs_admin`
--

DROP TABLE IF EXISTS `logs_admin`;
CREATE TABLE `logs_admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `login` varchar(20) collate latin1_general_ci NOT NULL,
  `mensagem` text collate latin1_general_ci NOT NULL,
  `query` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `logs_admin`
--
INSERT INTO `logs_admin` (`id`,`login`,`mensagem`,`query`,`datacadastro`) VALUES 
 (1,'sergio','Login','','2008-02-20 09:08:25'),
 (2,'sergio','Login','','2008-02-20 10:00:43'),
 (3,'sergio','Cadastro Cliente ID=108 Nome=Marcelo','','2008-02-20 10:04:01'),
 (4,'sergio','Alterado Cliente ID=80 Nome=Morgana','','2008-02-20 10:06:39'),
 (5,'sergio','Login','','2008-02-20 10:53:50'),
 (6,'sergio','Cadastro Cliente ID=109 Nome=GE Money','','2008-02-20 10:56:20'),
 (7,'sergio','Alterado Cliente ID=14 Nome=Simone Vivan','','2008-02-20 10:56:58'),
 (8,'sergio','Cadastro Cliente ID=110 Nome=Ricardo - PRT','','2008-02-20 11:00:31'),
 (9,'sergio','Cadastro Cliente ID=111 Nome=Mercador Fomento Mercantil LTDA.','','2008-02-20 11:03:31'),
 (10,'sergio','Alterado Cliente ID=43 Nome=Francisco C. T. Costa e Silva','','2008-02-20 11:04:51'),
 (11,'antonio','Login','','2008-02-20 11:21:12'),
 (12,'sergio','Cadastro Cliente ID=112 Nome=Fontoura e Silva Com. de Informática','','2008-02-20 11:21:55'),
 (13,'sergio','Cadastro Cliente ID=113 Nome=Paraná Despachante','','2008-02-20 11:25:23'),
 (14,'antonio','Logout','','2008-02-20 12:08:47'),
 (15,'antonio','Login','','2008-02-20 12:08:58'),
 (16,'antonio','Cadastro Cliente ID=114 Nome=Ivan de Oliveira Mota','','2008-02-20 12:13:22'),
 (17,'antonio','Alterado Cliente ID=85 Nome=José Carlos de Lima','','2008-02-20 12:17:34'),
 (18,'antonio','Alterado Cliente ID=14 Nome=Simone Vivan','','2008-02-20 12:18:25'),
 (19,'sergio','Cadastro Cliente ID=115 Nome=Federação Paranaense de Ginástica','','2008-02-20 12:58:41'),
 (20,'sergio','Alterado Cliente ID=105 Nome=Silvia Aparecida Pereira','','2008-02-20 13:00:26'),
 (21,'sergio','Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes','','2008-02-20 13:08:38'),
 (22,'sergio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-02-20 13:09:54'),
 (23,'sergio','Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes','','2008-02-20 13:10:59'),
 (24,'sergio','Cadastro Cliente ID=116 Nome=Jonas','','2008-02-20 13:13:58'),
 (25,'sergio','Cadastro Cliente ID=117 Nome=BV Financeira - Daniel Moreira','','2008-02-01 13:16:27'),
 (26,'sergio','Cadastro Cliente ID=118 Nome=B2 Informática','','2008-02-01 13:17:54'),
 (27,'sergio','Cadastro Cliente ID=119 Nome=Antonia - Síndica','','2008-02-01 13:19:33'),
 (28,'sergio','Cadastro Cliente ID=120 Nome=Elenara Beatriz Fontana','','2008-02-01 13:25:11'),
 (29,'sergio','Login','','2008-02-01 17:25:28'),
 (30,'sergio','Login','','2008-02-23 11:47:28'),
 (31,'sergio','Login','','2008-02-27 11:16:27'),
 (32,'sergio','Login','','2008-02-27 11:40:22'),
 (33,'antonio','Login','','2008-02-27 11:59:38'),
 (34,'antonio','Alterado Cliente ID=106 Nome=Raphaela de Oliveira','','2008-02-27 15:36:09'),
 (35,'antonio','Logout','','2008-02-27 15:45:35'),
 (36,'antonio','Login','','2008-02-28 08:54:25'),
 (37,'antonio','Alterado Cliente ID=106 Nome=Rosina Helena dos Santos','','2008-02-28 08:58:13'),
 (38,'antonio','Alterado Cliente ID=106 Nome=Rosina Helena dos Santos','','2008-02-28 08:58:37'),
 (39,'antonio','Cadastro Cliente ID=121 Nome=Jeane Margarete Rucinski','','2008-02-28 09:01:13'),
 (40,'antonio','Alterado Cliente ID=106 Nome=Rosina Helena dos Santos','','2008-02-28 10:10:22'),
 (41,'antonio','Logout','','2008-02-28 10:19:59'),
 (42,'sergio','Login','','2008-03-01 17:03:31'),
 (43,'sergio','Alterado Cliente ID=93 Nome=Everson Edson do Prado','','2008-03-01 17:34:15'),
 (44,'sergio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-01 17:35:47'),
 (45,'sergio','Alterado Cliente ID=39 Nome=Waldenira Pistori','','2008-03-01 17:37:21'),
 (46,'sergio','Alterado Cliente ID=20 Nome=Clelia Alice Marson','','2008-03-01 17:41:44'),
 (47,'sergio','Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra','','2008-03-01 17:43:54'),
 (48,'sergio','Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra','','2008-03-01 17:44:44'),
 (49,'sergio','Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes','','2008-03-01 17:46:22'),
 (50,'sergio','Alterado Cliente ID=116 Nome=Jonas','','2008-03-01 20:33:00'),
 (51,'sergio','Alterado Cliente ID=67 Nome=Katia Cristina Zardo','','2008-03-01 20:33:17'),
 (52,'sergio','Alterado Cliente ID=98 Nome=Adenir Farias','','2008-03-01 20:37:00'),
 (53,'sergio','Alterado Cliente ID=30 Nome=Daisy Mary Reichel','','2008-03-01 20:37:10'),
 (54,'sergio','Alterado Cliente ID=26 Nome=Jackson M. Nizer','','2008-03-01 20:37:18'),
 (55,'sergio','Alterado Cliente ID=29 Nome=Jhony Maciel Oliveira','','2008-03-01 20:37:29'),
 (56,'sergio','Alterado Cliente ID=75 Nome=Amanda Tieppo','','2008-03-01 20:38:08'),
 (57,'sergio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-01 20:38:31'),
 (58,'sergio','Alterado Cliente ID=77 Nome=Fabiana Reis','','2008-03-01 20:38:39'),
 (59,'sergio','Cadastro Cliente ID=122 Nome=teste','','2008-03-01 20:45:09'),
 (60,'antonio','Login','','2008-03-03 09:50:21'),
 (61,'antonio','Login','','2008-03-04 00:34:03'),
 (62,'antonio','Logout','','2008-03-04 01:00:38'),
 (63,'antonio','Login','','2008-03-04 08:47:34'),
 (64,'sergio','Login','','2008-03-04 09:00:49'),
 (65,'antonio','Alterado Cliente ID=17 Nome=Robson Garcia Barbosa','','2008-03-04 10:43:49'),
 (66,'antonio','Alterado Cliente ID=71 Nome=Rita Helena Zimmermann','','2008-03-04 10:49:41'),
 (67,'antonio','Alterado Cliente ID=68 Nome=Rose Cristina Neves','','2008-03-04 11:10:17'),
 (68,'antonio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-04 11:58:55'),
 (69,'antonio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-04 12:13:26'),
 (70,'antonio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-04 12:13:56'),
 (71,'antonio','Logout','','2008-03-05 00:28:43'),
 (72,'sergio','Login','','2008-03-05 08:34:28'),
 (73,'sergio','Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa','','2008-03-05 09:02:41'),
 (74,'sergio','Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa','','2008-03-05 09:06:22'),
 (75,'sergio','Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa','','2008-03-05 09:17:17'),
 (76,'sergio','Alterado Cliente ID=70 Nome=Leonardo Raupp Matta','','2008-03-05 09:22:19'),
 (77,'sergio','Alterado Cliente ID=59 Nome=Celso Amaral Poletti','','2008-03-05 09:37:18'),
 (78,'sergio','Alterado Cliente ID=66 Nome=Luana Aparecida Dias Mota','','2008-03-05 09:38:46'),
 (79,'sergio','Alterado Cliente ID=61 Nome=Matilde Alves da Cunha Silva','','2008-03-05 09:39:07'),
 (80,'sergio','Alterado Cliente ID=72 Nome=Mellina Franco Oliveira Canto','','2008-03-05 09:39:23'),
 (81,'sergio','Alterado Cliente ID=63 Nome=Natalia','','2008-03-05 09:39:36'),
 (82,'sergio','Alterado Cliente ID=63 Nome=Natalia','','2008-03-05 09:39:49'),
 (83,'sergio','Alterado Cliente ID=71 Nome=Rita Helena Zimmermann','','2008-03-05 09:40:20'),
 (84,'sergio','Alterado Cliente ID=64 Nome=Robson Roberto da Silva','','2008-03-05 09:40:49'),
 (85,'sergio','Alterado Cliente ID=76 Nome=Thiago Carli','','2008-03-05 09:41:05'),
 (86,'sergio','Alterado Cliente ID=62 Nome=Wallace Mendes Cordeiro','','2008-03-05 09:41:20'),
 (87,'sergio','Alterado Cliente ID=121 Nome=Jeane Margarete Rucinski','','2008-03-05 09:41:44'),
 (88,'sergio','Alterado Cliente ID=21 Nome=Iolanda Reis','','2008-03-05 09:42:07'),
 (89,'sergio','Alterado Cliente ID=69 Nome=George Galli','','2008-03-05 09:42:28'),
 (90,'sergio','Alterado Cliente ID=74 Nome=Fernando Cesar Alves da Silva','','2008-03-05 09:42:41'),
 (91,'sergio','Alterado Cliente ID=22 Nome=IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba','','2008-03-05 09:44:27'),
 (92,'sergio','Alterado Cliente ID=109 Nome=GE Money','','2008-03-05 09:44:53'),
 (93,'sergio','Alterado Cliente ID=113 Nome=Paraná Despachante','','2008-03-05 09:45:07'),
 (94,'sergio','Alterado Cliente ID=117 Nome=BV Financeira - Daniel Moreira','','2008-03-05 09:46:46'),
 (95,'sergio','Alterado Cliente ID=118 Nome=B2 Informática','','2008-03-05 09:51:53'),
 (96,'sergio','Alterado Cliente ID=15 Nome=Rebeca Garcia Martins','','2008-03-05 09:58:09'),
 (97,'sergio','Alterado Cliente ID=11 Nome=Mayara Cristina Garcia Machuca ','','2008-03-05 09:58:22'),
 (98,'antonio','Login','','2008-03-05 14:13:00'),
 (99,'antonio','Alterado Cliente ID=59 Nome=Celso Amaral Poletti','','2008-03-05 14:13:33'),
 (100,'antonio','Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda','','2008-03-05 14:14:30'),
 (101,'antonio','Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda','','2008-03-05 14:14:49'),
 (102,'antonio','Alterado Cliente ID=91 Nome=Adriano ','','2008-03-05 15:28:20'),
 (103,'antonio','Alterado Cliente ID=88 Nome=Anderson Augusto Fillus','','2008-03-05 15:28:30'),
 (104,'antonio','Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes','','2008-03-05 15:28:39'),
 (105,'antonio','Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski','','2008-03-05 15:28:48'),
 (106,'antonio','Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski','','2008-03-05 15:28:53'),
 (107,'antonio','Alterado Cliente ID=114 Nome=Ivan de Oliveira Mota','','2008-03-05 15:29:13'),
 (108,'antonio','Alterado Cliente ID=86 Nome=Ivana Rubio Colin','','2008-03-05 15:29:26'),
 (109,'antonio','Alterado Cliente ID=89 Nome=Jefferson Olinger de Souza','','2008-03-05 15:29:35'),
 (110,'antonio','Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua','','2008-03-05 15:59:16'),
 (111,'antonio','Alterado Cliente ID=55 Nome=COMPOR Arquitetura e Construção Ltda.','','2008-03-05 18:49:41'),
 (112,'antonio','Alterado Cliente ID=57 Nome=Djalma Jacinto da Silva Filho','','2008-03-05 18:49:52'),
 (113,'antonio','Alterado Cliente ID=56 Nome=Eliana Nascimento','','2008-03-05 18:50:03'),
 (114,'antonio','Alterado Cliente ID=58 Nome=Isabel Jacomel','','2008-03-05 18:50:12'),
 (115,'antonio','Alterado Cliente ID=53 Nome=Marisa Helena da Costa Serafin','','2008-03-05 18:50:20'),
 (116,'antonio','Alterado Cliente ID=54 Nome=Marisângela Pacheco Brittes','','2008-03-05 18:50:29'),
 (117,'antonio','Alterado Cliente ID=8 Nome=Daniel Hiroshi Nielsen Yabu','','2008-03-05 18:50:44'),
 (118,'antonio','Alterado Cliente ID=10 Nome=Felipe Augusto Kubis','','2008-03-05 18:50:54'),
 (119,'antonio','Alterado Cliente ID=12 Nome=Graciele Razera','','2008-03-05 18:51:02'),
 (120,'antonio','Alterado Cliente ID=16 Nome=Juliana Horta','','2008-03-05 18:51:10'),
 (121,'antonio','Alterado Cliente ID=13 Nome=Lucas Nunes da Silveira','','2008-03-05 18:51:18'),
 (122,'antonio','Alterado Cliente ID=9 Nome=Robson Lara Moreira','','2008-03-05 18:51:28'),
 (123,'antonio','Alterado Cliente ID=14 Nome=Simone Vivan','','2008-03-05 18:51:36'),
 (124,'antonio','Alterado Cliente ID=7 Nome=Tulio Hofmann Filho','','2008-03-05 18:51:44'),
 (125,'antonio','Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua','','2008-03-05 18:52:09'),
 (126,'antonio','Alterado Cliente ID=42 Nome=ACC Aduditoria Contabil S/C Ltda.','','2008-03-05 18:53:01'),
 (127,'antonio','Alterado Cliente ID=45 Nome=Carlos Eduardo','','2008-03-05 18:53:11'),
 (128,'antonio','Alterado Cliente ID=49 Nome=DIVALPAR Participação Societária Ltda.','','2008-03-05 18:53:20'),
 (129,'antonio','Alterado Cliente ID=52 Nome=EPRON Serviço de Informática S/C Ltda.','','2008-03-05 18:53:29'),
 (130,'antonio','Alterado Cliente ID=43 Nome=Francisco C. T. Costa e Silva','','2008-03-05 18:53:45'),
 (131,'antonio','Alterado Cliente ID=51 Nome=Olimpus Agência de Viagem e Turismo Ltda.','','2008-03-05 18:53:54'),
 (132,'antonio','Alterado Cliente ID=48 Nome=R. Huczok Consulting Ltda.','','2008-03-05 18:54:14'),
 (133,'antonio','Alterado Cliente ID=50 Nome=Rogoski & Soares C. A. Elet. Ltda.','','2008-03-05 18:54:25'),
 (134,'antonio','Alterado Cliente ID=46 Nome=Saulo Souza e Silva','','2008-03-05 18:54:32'),
 (135,'antonio','Alterado Cliente ID=44 Nome=Sonia Maria Bressan ','','2008-03-05 18:54:40'),
 (136,'antonio','Alterado Cliente ID=47 Nome=Ursula','','2008-03-05 18:54:49'),
 (137,'antonio','Alterado Cliente ID=41 Nome=Vanildo','','2008-03-05 18:54:57'),
 (138,'antonio','Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva','','2008-03-05 18:55:14'),
 (139,'antonio','Alterado Cliente ID=35 Nome=Ana Elisa Macagnan','','2008-03-05 18:55:23'),
 (140,'antonio','Alterado Cliente ID=33 Nome=Bernhard Zanker Junior','','2008-03-05 18:55:32'),
 (141,'antonio','Alterado Cliente ID=40 Nome=Clayton Cezar Upitis Marloch','','2008-03-05 18:55:40'),
 (142,'antonio','Alterado Cliente ID=20 Nome=Clelia Alice Marson','','2008-03-05 18:55:53'),
 (143,'antonio','Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva','','2008-03-05 18:56:29'),
 (144,'antonio','Alterado Cliente ID=34 Nome=Edison Carlos dos Santos','','2008-03-05 18:56:43'),
 (145,'antonio','Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra','','2008-03-05 18:56:52'),
 (146,'antonio','Alterado Cliente ID=36 Nome=Fernando Henrique Tremel Bueno','','2008-03-05 18:57:03'),
 (147,'antonio','Alterado Cliente ID=31 Nome=Luciana Osorio Cavalli','','2008-03-05 18:57:14'),
 (148,'antonio','Alterado Cliente ID=39 Nome=Waldenira Pistori','','2008-03-05 18:57:23'),
 (149,'antonio','Alterado Cliente ID=32 Nome=Zenildo Costa','','2008-03-05 18:57:34'),
 (150,'antonio','Alterado Cliente ID=28 Nome=Sergio Vivan','','2008-03-05 18:58:02'),
 (151,'antonio','Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda','','2008-03-05 18:58:12'),
 (152,'antonio','Alterado Cliente ID=27 Nome=Jorge Gonçalves dos Santos','','2008-03-05 18:58:26'),
 (153,'antonio','Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda','','2008-03-05 18:58:38'),
 (154,'antonio','Alterado Cliente ID=114 Nome=Ivan de Oliveira Mota','','2008-03-05 18:59:07'),
 (155,'antonio','Alterado Cliente ID=82 Nome=João Arnaldo de Oliveira','','2008-03-05 18:59:22'),
 (156,'antonio','Alterado Cliente ID=90 Nome=José Carlos','','2008-03-05 18:59:31'),
 (157,'antonio','Alterado Cliente ID=85 Nome=José Carlos de Lima','','2008-03-05 18:59:40'),
 (158,'antonio','Alterado Cliente ID=87 Nome=José Carvalho Filho','','2008-03-05 18:59:50'),
 (159,'antonio','Alterado Cliente ID=78 Nome=Katia Regina Schmeiske','','2008-03-05 18:59:59'),
 (160,'antonio','Alterado Cliente ID=80 Nome=Morgana','','2008-03-05 19:00:08'),
 (161,'antonio','Alterado Cliente ID=84 Nome=Sonia Aparecida Estevan Costa ','','2008-03-05 19:00:15'),
 (162,'antonio','Alterado Cliente ID=81 Nome=Thais Cristina Sentone Mota','','2008-03-05 19:00:23'),
 (163,'antonio','Alterado Cliente ID=80 Nome=Morgana','','2008-03-05 19:03:15'),
 (164,'antonio','Logout','','2008-03-05 20:56:41'),
 (165,'antonio','Login','','2008-03-06 13:13:24'),
 (166,'antonio','Alterado Cliente ID=80 Nome=Morgana Biron','','2008-03-06 13:15:07'),
 (167,'antonio','Alterado Cliente ID=100 Nome=Antonio dos Santos Bicalho','','2008-03-06 13:25:08'),
 (168,'antonio','Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves','','2008-03-06 13:25:16'),
 (169,'antonio','Alterado Cliente ID=96 Nome=Dievert Fernando de Campos','','2008-03-06 13:25:24'),
 (170,'antonio','Alterado Cliente ID=93 Nome=Everson Edson do Prado','','2008-03-06 13:25:34'),
 (171,'antonio','Alterado Cliente ID=97 Nome=Luiz Eduardo Lasszck','','2008-03-06 13:25:47'),
 (172,'antonio','Alterado Cliente ID=108 Nome=Marcelo','','2008-03-06 13:25:56'),
 (173,'antonio','Alterado Cliente ID=95 Nome=Nilo Navarri','','2008-03-06 13:26:04'),
 (174,'antonio','Alterado Cliente ID=107 Nome=Robson Sandro Santos','','2008-03-06 13:26:15'),
 (175,'antonio','Alterado Cliente ID=106 Nome=Rosina Helena dos Santos','','2008-03-06 13:26:26'),
 (176,'antonio','Alterado Cliente ID=104 Nome=Shirley Cristiane M. de Souza','','2008-03-06 13:26:35'),
 (177,'antonio','Alterado Cliente ID=105 Nome=Silvia Aparecida Pereira','','2008-03-06 13:26:44'),
 (178,'antonio','Alterado Cliente ID=101 Nome=Sueli Costa Luvison','','2008-03-06 13:26:51'),
 (179,'antonio','Alterado Cliente ID=94 Nome=Valdemir Antonio Rovares','','2008-03-06 13:26:59'),
 (180,'antonio','Alterado Cliente ID=99 Nome=Valdir Modest de Oliveira','','2008-03-06 13:27:08'),
 (181,'antonio','Alterado Cliente ID=103 Nome=Vanderlei Souza','','2008-03-06 13:27:16'),
 (182,'antonio','Cadastro Cliente ID=123 Nome=Marcelo Luiz Velter','','2008-03-06 13:29:14'),
 (183,'antonio','Cadastro Cliente ID=124 Nome=José Carlos Cardoso Ajala','','2008-03-06 13:31:20'),
 (184,'antonio','Alterado Cliente ID=108 Nome=Marcelo','','2008-03-06 13:32:02'),
 (185,'antonio','Logout','','2008-03-06 17:02:58'),
 (186,'sergio','Login','','2008-03-07 09:15:42'),
 (187,'antonio','Login','','2008-03-07 11:10:03'),
 (188,'sergio','Login','','2008-03-07 11:17:47'),
 (189,'antonio','Login','','2008-03-07 11:30:12'),
 (190,'antonio','Cadastro Cliente ID=125 Nome=Sidnei Scaravonatti','','2008-03-07 11:33:32'),
 (191,'sergio','Login','','2008-03-08 10:20:55'),
 (192,'sergio','Login','','2008-03-08 15:38:25'),
 (193,'sergio','Alterado Cliente ID=60 Nome=Claiton Estacionamento','','2008-03-08 17:50:28'),
 (194,'sergio','Login','','2008-03-10 10:40:11'),
 (195,'sergio','Login','','2008-03-10 10:55:14');

--
-- Definition of table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
CREATE TABLE `periodos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(250) collate latin1_general_ci NOT NULL,
  `dia_inicio` int(11) NOT NULL,
  `dia_termino` int(11) NOT NULL,
  `dia_termino_mescorrente` int(11) NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `periodos`
--
INSERT INTO `periodos` (`id`,`nome`,`dia_inicio`,`dia_termino`,`dia_termino_mescorrente`,`datacadastro`) VALUES 
 (6,'Dia 01 mês corrente a 31 mês corrente',1,31,1,'2008-03-10 11:06:09'),
 (7,'Dia 10 mês corrente a 09 mês seguinte',10,9,0,'2008-03-10 11:10:57');

--
-- Definition of table `planos`
--

DROP TABLE IF EXISTS `planos`;
CREATE TABLE `planos` (
  `id` int(11) NOT NULL auto_increment,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `nome` varchar(200) collate latin1_general_ci NOT NULL,
  `descricao` text collate latin1_general_ci NOT NULL,
  `vel_download` varchar(200) collate latin1_general_ci NOT NULL,
  `vel_upload` varchar(200) collate latin1_general_ci NOT NULL,
  `valor_base` decimal(10,2) NOT NULL,
  `valor_pontoadicional` decimal(10,2) NOT NULL,
  `fidelidade` int(11) NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `planos`
--
INSERT INTO `planos` (`id`,`codigo`,`nome`,`descricao`,`vel_download`,`vel_upload`,`valor_base`,`valor_pontoadicional`,`fidelidade`,`observacoes`,`datacadastro`) VALUES 
 (1,'sc300','SmartConnect300','','300','150','45.00','10.00',1,'','2007-11-20 09:38:33'),
 (4,'sc400','SmartConnect400','Bla bla bla','400','200','80.00','10.00',0,'','2007-11-21 10:15:59'),
 (9,'sc350','SmartConnect350','Bla bla bla','350','175','70.00','10.00',0,'','2007-11-22 10:34:23'),
 (7,'sc200','SmartConnect200','','200','100','40.00','10.00',0,'','2007-11-22 09:53:17'),
 (6,'sc150','SmartConnect150','','150','75','30.00','10.00',0,'','2007-11-22 09:52:38'),
 (8,'sc250','SmartConnect250','','250','125','50.00','10.00',0,'','2007-11-22 10:31:04');

--
-- Definition of table `provedores`
--

DROP TABLE IF EXISTS `provedores`;
CREATE TABLE `provedores` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `razaosocial` varchar(200) collate latin1_general_ci NOT NULL,
  `nomefantasia` varchar(200) collate latin1_general_ci NOT NULL,
  `cnpj` varchar(50) collate latin1_general_ci NOT NULL,
  `inscestadual` varchar(30) collate latin1_general_ci NOT NULL,
  `inscmunicipal` varchar(30) collate latin1_general_ci NOT NULL,
  `responsavel` varchar(200) collate latin1_general_ci NOT NULL,
  `endereco` varchar(200) collate latin1_general_ci NOT NULL,
  `numero` varchar(200) collate latin1_general_ci NOT NULL,
  `complemento` varchar(200) collate latin1_general_ci NOT NULL,
  `bairro` varchar(200) collate latin1_general_ci NOT NULL,
  `cep` varchar(20) collate latin1_general_ci NOT NULL,
  `cidade` varchar(200) collate latin1_general_ci NOT NULL,
  `uf` varchar(2) collate latin1_general_ci NOT NULL,
  `tel_principal` varchar(20) collate latin1_general_ci NOT NULL,
  `tel_comercial` varchar(30) collate latin1_general_ci NOT NULL,
  `tel_financeiro` varchar(30) collate latin1_general_ci NOT NULL,
  `tel_suporte` varchar(30) collate latin1_general_ci NOT NULL,
  `celular1` varchar(30) collate latin1_general_ci NOT NULL,
  `celular2` varchar(20) collate latin1_general_ci NOT NULL,
  `celular3` varchar(20) collate latin1_general_ci NOT NULL,
  `fax` varchar(30) collate latin1_general_ci NOT NULL,
  `email_principal` varchar(200) collate latin1_general_ci NOT NULL,
  `email_comercial` varchar(200) collate latin1_general_ci NOT NULL,
  `email_financeiro` varchar(200) collate latin1_general_ci NOT NULL,
  `email_suporte` varchar(200) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `provedores`
--
INSERT INTO `provedores` (`id`,`codigo`,`razaosocial`,`nomefantasia`,`cnpj`,`inscestadual`,`inscmunicipal`,`responsavel`,`endereco`,`numero`,`complemento`,`bairro`,`cep`,`cidade`,`uf`,`tel_principal`,`tel_comercial`,`tel_financeiro`,`tel_suporte`,`celular1`,`celular2`,`celular3`,`fax`,`email_principal`,`email_comercial`,`email_financeiro`,`email_suporte`,`observacoes`,`datacadastro`) VALUES 
 (5,'ssolution','Smart Solution Tecnologia da Informação Ltda.','Smart Solution TI ','05.198.010/0001-05','903.38693-28','6.024.442.076-9','Antonio Gustavo Sampaio de Oliveira ','Avenida Sete de Setembro','3272','Conjunto 11','Centro','80.230-010','Curitiba','PR','(41) 3234-2443','(41) 3234-2443','(41) 3234-2443','(41) 3234-2443','(41) 8416-0817','(41) 9121-2032','','','smart@smartsolution.com.br','comercial@smartsolution.com.br','financeiro@smartsolution.com.br','suporte@smartsolution.com.br','','2007-11-19 12:07:57');

--
-- Definition of table `titulos`
--

DROP TABLE IF EXISTS `titulos`;
CREATE TABLE `titulos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `contrato_id` int(11) NOT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fim` date NOT NULL,
  `numero` bigint(20) NOT NULL,
  `vencimento` date NOT NULL,
  `valor` decimal(2,0) NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `titulos`
--



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
