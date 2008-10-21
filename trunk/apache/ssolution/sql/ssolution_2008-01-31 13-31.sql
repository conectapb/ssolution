-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Jan 31, 2008 as 02:32 PM
-- Versão do Servidor: 5.0.45
-- Versão do PHP: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Banco de Dados: `ssolution`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admins`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `admins`
--

INSERT INTO `admins` (`id`, `login`, `senha`, `nome`, `ativo`, `data`, `ultacesso`, `ultacesso_ip`) VALUES
(1, 'smart', '550237b8fbcdf3741bb1127d0fc7f6bf', 'Smart Solution TI', 1, '2006-06-02 23:29:00', '2008-01-31 09:20:05', '10.12.7.13'),
(2, 'antonio', 'ae0ca2c9525396001d68bb366db5b1ad', 'Antonio Gustavo Sampaio de Oliveira', 1, '2007-11-05 11:31:34', '2008-01-31 11:26:28', '10.12.7.7'),
(3, 'sergio', '912318713265d527f3f5f640a550feb9', 'Sergio Henrique Costa', 1, '2008-01-29 11:01:14', '0000-00-00 00:00:00', ''),
(4, 'rebeca', '708a65c007259f302db570f607cfa897', 'Rebeca Fausto', 1, '2008-01-29 11:05:54', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `boletos`
--

CREATE TABLE `boletos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `contrato_id` int(11) NOT NULL,
  `nosso_numero` varchar(8) collate latin1_general_ci NOT NULL,
  `data_vencimento` date NOT NULL,
  `data_documento` date NOT NULL,
  `data_processamento` date NOT NULL,
  `valor_boleto` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `boletos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
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
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `observacoes`, `datacadastro`) VALUES
(7, 8001, 'Tulio Hofmann Filho', '0000-00-00 00:00:00', '', '', 'M', 3, 'R. Alferes Poli', '294', 'Ap. 101', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2007-11-23 12:22:09'),
(8, 8002, 'Daniel Hiroshi Nielsen Yabu', '0000-00-00 00:00:00', '', '034.753.719-79', 'M', 3, 'Rua Alferes Poli', '294', 'AP 1603', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:09:00'),
(9, 8003, 'Robson Lara Moreira', '0000-00-00 00:00:00', '', '', 'M', 3, 'Rua Alferes Poli', '294', 'AP 202', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:09:37'),
(10, 8004, 'Felipe Augusto Kubis', '0000-00-00 00:00:00', '', '054.165.369-50', 'M', 3, 'Rua Alferes Poli', '294', 'AP 301', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:10:30'),
(11, 8005, 'Mayara Cristina Garcia Machuca ', '0000-00-00 00:00:00', '', '369.742.538-26', 'F', 3, 'Rua Alferes Poli', '294', 'Ap. 303', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:11:33'),
(12, 8006, 'Graciele Razera', '0000-00-00 00:00:00', '', '644.489.400-04', 'F', 3, 'Rua Alferes Poli', '294', 'AP 902', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:12:41'),
(13, 8008, 'Lucas Nunes da Silveira', '0000-00-00 00:00:00', '', '038.062.189-43', 'M', 3, 'Rua Alferes Poli', '294', 'AP 903', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:13:34'),
(14, 8007, 'Simone Vivan', '0000-00-00 00:00:00', '', '029.500.199-27', 'F', 3, 'Rua Alferes Poli', '294', 'AP 1001', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:14:13'),
(15, 8009, 'Rebeca Garcia Martins', '0000-00-00 00:00:00', '', '046.373.099-21', 'F', 3, 'Rua Alferes Poli', '294', 'AP 1402', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:14:47'),
(16, 8010, 'Juliana Horta', '0000-00-00 00:00:00', '', '', 'F', 3, 'Rua Alferes Poli', '294', 'AP 1403', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:15:20'),
(17, 8011, 'Robson G. Barbosa', '0000-00-00 00:00:00', '', '', 'M', 3, 'R. Alferes Poli', '294', 'Ap. 1502', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-14 12:16:12'),
(18, 99001, 'Oscar Ricardo Macedo Schmeiske', '0000-00-00 00:00:00', '', '63525160925', 'M', 9, 'Avenida Sete de Setembro', '6830', 'AP 1531', '80240001', 'Seminário', 'Curitiba', 'PR', '4132436467', '4132501355', '4199776984', '', '', 'oscar@ippuc.org.br', 'oscarschmeiske@gmail.com', '', 'Cliente avulso em serviços de manutenção e suporte.', '2008-01-29 17:17:35'),
(19, 99002, 'Rinaldo da Silva Rocha', '0000-00-00 00:00:00', '', '69705658900', 'M', 9, 'Rua Maria Ludwig Muller', '277', '', '83409540', 'Jardim Eucalipto', 'Colombo', 'PR', '', '', '', '', '', '', '', '', 'Parceiro de negocios - Manutenção em monitores, impressoras e micromputadores.', '2008-01-29 17:26:55'),
(20, 3001, 'Clelia Alice Marson', '1971-03-19 00:00:00', '60871990', '96329858934', 'F', 6, 'R. Brasílio Itiberê', '2455', 'AP B25', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133334941', '', '4184253353', '', '', '', '', '', '', '2008-01-29 17:31:24'),
(21, 6001, 'Iolanda Reis', '0000-00-00 00:00:00', '', '39409538904', 'F', 4, 'Avenida. Sete de Setembro', '3293', 'AP 1301', '80230-010', 'Centro', 'Curitiba', 'PR', '4130194881', '', '', '', '', '', '', '', 'Cunhada da Zeladora do Edificio Roma, dados para operaçõs financeiras.', '2008-01-29 17:38:20'),
(22, 2, 'IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba', '0000-00-00 00:00:00', '', '76.582.337/0001-16', '', 10, 'Rua Bom Jesus', '669', '', '80035010', 'Juveve', 'Curitiba', 'PR', '', '4132501300', '', '', '', '', '', '', 'Cliente de Vendas de equipamentos e de Serviços de suporte e manutenção em servidores.', '2008-01-29 18:01:02'),
(23, 99003, 'Luis Sergio Rolim de Moura', '0000-00-00 00:00:00', '', '64101835934', 'M', 9, 'Rua Irmãs Paulina', '5146', '', '81020230', 'Novo mundo', 'Curitiba', 'PR', '', '', '4192139239', '4191823402', '', '', '', '', 'Luis que trabalha com o Paulo Databull.', '2008-01-29 18:09:07'),
(24, 99004, 'Rauf Alencar de Oliveira', '1986-04-09 00:00:00', '', '05889025945', 'M', 9, 'Rua João Gomes ', '100', 'Bloco J  AP 32', '80020030', 'Novo mundo', 'Curitiba', 'PR', '', '4133980456', '41', '', '', 'rauf@mjtelefonia.com.br', 'rauf.sk8@gmail.com', '', '', '2008-01-29 18:13:39'),
(25, 2001, 'Rose Mari Martins Arruda', '0000-00-00 00:00:00', '', '317.955.799-00', 'F', 7, 'Rua Lourenço Pinto', '260', 'AP 103', '80010160', 'Centro', 'Curitiba', 'PR', '4132224102', '4130146906', '4194280387', '', '', '', '', '', 'Sindica do condominio', '2008-01-30 11:49:16'),
(26, 2002, 'Jackson M. Nizer', '0000-00-00 00:00:00', '', '032.173.759-80', 'M', 7, 'Rua Lourenço Pinto', '260', 'AP 201', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', 'Irmão da Jacqueline Nizer funcionária da Huczok', '2008-01-30 11:50:59'),
(27, 2003, 'Jorge Gonçalves dos Santos', '0000-00-00 00:00:00', '', '157.097.799-20', 'M', 7, 'Rua Lourenço Pinto', '260', '', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 11:53:31'),
(28, 2004, 'Sergio Vivan', '0000-00-00 00:00:00', '', '460.707.379-20', '', 7, 'Rua Lourenço Pinto', '260', 'AP 303', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 11:55:04'),
(29, 2005, 'Jhony Maciel Oliveira', '0000-00-00 00:00:00', '', '064.214.299-80', 'M', 7, 'Rua Lourenço Pinto', '260', 'AP 103B ', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 11:58:47'),
(30, 2006, 'Daisy Mary Reichel', '0000-00-00 00:00:00', '', '008933740-91', 'F', 7, 'Rua Lourenço Pinto', '260', 'AP 302', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:04:12'),
(31, 3002, 'Luciana Osorio Cavalli', '0000-00-00 00:00:00', '', '043.933.609-07', 'F', 6, 'Rua Brasílio Itiberê', '2455', 'AP 23B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:06:50'),
(32, 3003, 'Zenildo Costa', '0000-00-00 00:00:00', '', '539.938.029-34', 'M', 6, 'Rua Brasílio Itiberê', '2455', 'AP 25B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133334941', '4133334941', '4184122072', '', '4133334941', '', '', '', '', '2008-01-30 12:08:29'),
(33, 3004, 'Bernhard Zanker Junior', '0000-00-00 00:00:00', '', '025.833.599-83', 'M', 6, 'Rua Brasílio Itiberê', '2455', 'AP 31 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:12:22'),
(34, 3005, 'Edison Carlos dos Santos', '0000-00-00 00:00:00', '', '681.977.569-53', '', 6, 'Rua Brasílio Itiberê', '2455', 'AP 43 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:13:16'),
(35, 3006, 'Ana Elisa Macagnan', '0000-00-00 00:00:00', '', '897.755.200-10', '', 6, 'Rua Brasílio Itiberê', '2455', 'AP 22 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:14:10'),
(36, 3007, 'Fernando Henrique Tremel Bueno', '0000-00-00 00:00:00', '', '050.193.579-79', '', 6, 'Rua Brasílio Itiberê', '2455', 'AP 24 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:15:05'),
(37, 3008, 'Adriano Noedinger da Silva', '0000-00-00 00:00:00', '', '030.070.919-69', 'M', 6, 'Rua Brasílio Itiberê', '2455', 'AP 43 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', 'Cunhado do Edison Pudim', '2008-01-30 12:16:22'),
(38, 3009, 'Eugenio Antonio Guerra', '0000-00-00 00:00:00', '', '553.679.686-00', '', 6, 'Rua Brasílio Itiberê', '2455', 'AP 44 B', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:17:19'),
(39, 3010, 'Waldenira Pistori', '0000-00-00 00:00:00', '', '205.384.649-68', 'F', 6, 'Rua Brasílio Itiberê', '2455', 'AP 21 BII', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:18:23'),
(40, 3011, 'Clayton Cezar Upitis Marloch', '0000-00-00 00:00:00', '', '651.454.109-72', 'M', 6, 'Rua Brasílio Itiberê', '2455', 'AP 42 BII', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:19:28'),
(41, 4001, 'Vanildo', '0000-00-00 00:00:00', '', '', 'M', 5, 'R. 24 de Maio', '262', 'CJ 301', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', 'Zelador do condominio possue uma sala comercial', '2008-01-30 12:33:04'),
(42, 4002, 'ACC Aduditoria Contabil S/C Ltda.', '0000-00-00 00:00:00', '', '01.625.401/0001-08', '', 5, 'R. 24 de Maio', '262', 'CJ 1103', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:35:17'),
(43, 4003, 'Francisco C. T. Costa e Silva', '0000-00-00 00:00:00', '', '320.945.319-53', 'M', 5, 'R. 24 de Maio', '262', 'CJ 505 / 506', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:36:52'),
(44, 4004, 'Sonia Maria Bressan ', '0000-00-00 00:00:00', '', '237.300.300-78', 'F', 5, 'R. 24 de Maio', '262', 'CJ 803', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:38:03'),
(45, 4005, 'Carlos Eduardo', '0000-00-00 00:00:00', '', '', 'M', 5, 'R. 24 de Maio', '262', 'CJ 806', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:38:56'),
(46, 4006, 'Saulo Souza e Silva', '0000-00-00 00:00:00', '', '322.416.669-04', 'M', 5, 'R. 24 de Maio', '262', 'CJ 402', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:41:27'),
(47, 4007, 'Ursula', '0000-00-00 00:00:00', '', '', '', 5, 'R. 24 de Maio', '262', 'CJ 402', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', 'Atendente do consultório do Saulo.', '2008-01-30 12:42:22'),
(48, 4008, 'R. Huczok Consulting Ltda.', '0000-00-00 00:00:00', '', '00.058.094/0001-50', '', 5, 'R. 24 de Maio', '262', 'CJ 1001 / 1002', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:44:30'),
(49, 4009, 'DIVALPAR Participação Societária Ltda.', '0000-00-00 00:00:00', '', '76.641.265/0001-30', '', 5, 'Rua 24 de Maio', '262', 'CJ 1104', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 12:58:07'),
(50, 4010, 'Rogoski & Soares C. A. Elet. Ltda.', '0000-00-00 00:00:00', '', '08.182.364/0001-41', '', 5, 'Rua 24 de Maio', '262', 'CJ 1201', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 13:12:50'),
(51, 4011, 'Olimpus Agência de Viagem e Turismo Ltda.', '0000-00-00 00:00:00', '', '01.134.309/0001-37', '', 5, 'Rua 24 de Maio', '262', 'CJ 1202', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 13:17:03'),
(52, 4012, 'EPRON Serviço de Informática S/C Ltda.', '0000-00-00 00:00:00', '', '01.766.736/0001-38', '', 5, 'Rua 24 de Maio', '262', 'CJ 605', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', 'Ivan desenvolvedor de software para a Huczok.', '2008-01-30 14:40:51'),
(53, 5001, 'Marisa Helena da Costa Serafin', '0000-00-00 00:00:00', '', '471.972.509-00', '', 1, 'Av. Sete de Setembro', '3272', 'AP 01', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 14:42:51'),
(54, 5002, 'Marisângela Pacheco Brittes', '0000-00-00 00:00:00', '', '906.561.219-04', 'F', 1, 'Av. Sete de Setembro', '3272', 'AP 03', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 14:46:08'),
(55, 5003, 'COMPOR Arquitetura e Construção Ltda.', '0000-00-00 00:00:00', '', '79.110.086/0001-65', '', 1, 'Av. Sete de Setembro', '3272', 'CJ 04', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:31:18'),
(56, 5004, 'Eliana Nascimento', '0000-00-00 00:00:00', '', '872.560.296-91', '', 1, 'Av. Sete de Setembro', '3272', 'AP 06', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:33:38'),
(57, 5005, 'Djalma Jacinto da Silva Filho', '0000-00-00 00:00:00', '', '738.669.389-34', 'M', 1, 'Av. Sete de Setembro', '3272', 'AP 08', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:37:09'),
(58, 5006, 'Isabel Jacomel', '0000-00-00 00:00:00', '', '583.674.629-04', 'F', 1, 'Av. Sete de Setembro', '3272', 'AP 10', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:42:46'),
(59, 5007, 'Celso Amaral Poletti', '0000-00-00 00:00:00', '', '008.436.739-31', 'M', 1, 'Av. Sete de Setembro', '3272', 'AP 12', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:45:36'),
(60, 5008, 'Claiton Estacionamento', '0000-00-00 00:00:00', '', '', 'M', 1, 'Av. Sete de Setembro', '3272', 'Estacionamento', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:46:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `contatos`
--

INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `observacoes`, `datacadastro`) VALUES
(1, 'Ederson', 'Tenda Equipamentos Wireless', 'Contato comercial', '', '', '', '', '', '', '', 'PR', '', '', '9987-0696', '', '', '', '28/01/2008 14:37 - Retornar ligação para agendar horário p/ reunião', '0000-00-00 00:00:00'),
(2, 'Marco Henrique', '', 'Possível cliente', '', '', '', '', 'Portão', '', 'Curitiba', 'PR', '', '', '8407-3966', '', '', '', 'Possivel cliente no portão; Prédio com aproximadamente 100 apartamentos. Vai falar com a síndica e com vizinhos e mostrar nosso panfleto.', '0000-00-00 00:00:00'),
(3, 'Paula', 'Nextel', 'Contato Comercial', '', '', '', '', '', '', '', 'PR', '0800 900 901', '', '', '', '', '', 'Plano Radio Ilimitado + Telefonia Ilimitada\r\n- Radio ilimitado\r\n- R$ 0,60 por minuto\r\n- Mensalidade: R$ 82,00\r\n\r\nPlano Radio Ilimitado + Telefonia Bloqueada\r\n- Radio Ilimitado\r\n- Compra de créditos para fazer ligações\r\n- Mensalidade: R$ 92,00\r\n\r\nAparelhos:\r\n- Alugado: o mais simples, Motorola i290, custa 4x de R$ 46,00 de adesão e mensalidade de R$ 13,00\r\n- À parte: Precisa comprar o chip por R$ 39,90\r\n\r\nDá pra entrar em contato via 0800 e marcar visita de um consultor.', '2008-01-29 17:44:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL auto_increment,
  `ativo` int(11) NOT NULL,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `provedor_id` int(11) NOT NULL,
  `plano_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `descricao` text collate latin1_general_ci NOT NULL,
  `data_inicio` timestamp NOT NULL default '0000-00-00 00:00:00',
  `data_termino` timestamp NOT NULL default '0000-00-00 00:00:00',
  `vencimento_padrao` int(11) NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `contratos`
--

INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `descricao`, `data_inicio`, `data_termino`, `vencimento_padrao`, `observacoes`, `datacadastro`) VALUES
(5, 0, 'contrato01', 5, 1, 7, 3, '', '2008-01-14 00:00:00', '2009-01-14 00:00:00', 10, '', '2008-01-14 12:24:46'),
(6, 0, 'contrato02', 5, 1, 8, 3, '', '2008-01-14 00:00:00', '2009-01-14 00:00:00', 10, '', '2008-01-14 13:31:58'),
(7, 0, 'contrato03', 5, 1, 9, 3, '', '2008-01-14 00:00:00', '2009-01-14 00:00:00', 10, '', '2008-01-14 13:35:10'),
(8, 0, 'contrato04', 5, 1, 10, 3, '', '2008-01-14 00:00:00', '2009-01-14 00:00:00', 10, '', '2008-01-14 13:35:36'),
(9, 1, 'contrato05', 5, 1, 11, 3, '', '2008-01-14 00:00:00', '2009-01-14 00:00:00', 10, '', '2008-01-15 12:12:42'),
(10, 0, 'contrato06', 5, 1, 12, 3, '', '2008-01-14 00:00:00', '2009-01-14 00:00:00', 10, '', '2008-01-15 12:14:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estacoes`
--

CREATE TABLE `estacoes` (
  `id` int(11) NOT NULL auto_increment,
  `contrato_id` int(11) NOT NULL,
  `hostname` varchar(200) collate latin1_general_ci NOT NULL,
  `ip` varchar(11) collate latin1_general_ci NOT NULL,
  `mac_address` varchar(17) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `estacoes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `funcoes`
--

CREATE TABLE `funcoes` (
  `id` int(11) NOT NULL auto_increment,
  `pai` int(11) NOT NULL default '0',
  `posicao` int(11) NOT NULL default '0',
  `nome` varchar(100) NOT NULL default '',
  `ativo` tinyint(1) NOT NULL default '0',
  `restrito` tinyint(1) NOT NULL default '0',
  `link` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Extraindo dados da tabela `funcoes`
--

INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES
(1, 0, -10, 'Admins', 1, 0, 'javascript:;'),
(2, 1, 1, 'Cadastro', 1, 1, 'administradores.php?modo=cad'),
(3, 1, 2, 'Manutenção', 1, 0, 'administradores.php'),
(4, 0, 3, 'Clientes', 1, 0, 'javascript:;'),
(5, 4, 1, 'Cadastro', 1, 0, 'clientes.php?modo=cad'),
(6, 0, 1, 'Provedores', 1, 0, 'javascript:;'),
(7, 6, 1, 'Cadastro', 1, 0, 'provedores.php?modo=cad'),
(8, 6, 2, 'Manutenção', 1, 0, 'provedores.php?modo=lst'),
(9, 4, 2, 'Manutenção', 1, 0, 'clientes.php?modo=lst'),
(10, 0, 4, 'Grupos', 1, 0, 'javascript:;'),
(11, 10, 1, 'Cadastro', 1, 0, 'grupos.php?modo=cad'),
(12, 10, 2, 'Manutenção', 1, 0, 'grupos.php?modo=lst'),
(13, 0, 5, 'Planos', 1, 0, 'javascript:;'),
(14, 13, 1, 'Cadastro', 1, 0, 'planos.php?modo=cad'),
(15, 13, 2, 'Manutenção', 1, 0, 'planos.php?modo=lst'),
(16, 0, 6, 'Contratos', 1, 0, 'javascript:;'),
(17, 16, 1, 'Cadastro', 1, 0, 'contratos.php?modo=cad'),
(18, 16, 2, 'Manutenção', 1, 0, 'contratos.php?modo=lst'),
(19, 0, 7, 'Estações', 0, 0, 'javascript:;'),
(20, 0, 2, 'Contatos', 1, 0, 'javascript:;'),
(21, 20, 1, 'Cadastro', 1, 0, 'contatos.php?modo=cad'),
(22, 20, 2, 'Manutenção', 1, 0, 'contatos.php?modo=lst'),
(24, 0, 15, 'Chamados', 1, 0, 'javascript:;'),
(25, 24, 1, 'Abrir Chamado', 1, 0, 'chamados.php?modo=cad'),
(26, 24, 2, 'Manutenção', 0, 0, 'chamados.php?modo=lst');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `grupos`
--

INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `observacoes`, `datacadastro`) VALUES
(1, 'EdOdoni', '05', 1, 'Edifício Odoni', 'Av. Sete de Setembro', '3272', 'Centro', '80230-010', 'Curitiba', 'PR', '', '2007-11-19 10:20:51'),
(3, 'EdMarajo', '08', 1, 'Edifício Residencial Marajó', 'Rua Alferes Poli', '294', 'Centro', '80.230-090', 'Curitiba', 'PR', '', '2007-11-19 11:26:41'),
(4, 'EdRoma', '06', 1, 'Edifício Roma', 'Av. Sete de Setembro', '3293', 'Centro', '80230-010', 'Curitiba', 'PR', '', '2008-01-28 19:35:15'),
(5, 'EdWashington', '04', 1, 'Edifício Comercial Washington', 'R. 24 de Maio', '262', 'Centro', '80230-080', 'Curitiba', 'PR', '', '2008-01-29 12:12:59'),
(6, 'EdBItibere', '03', 1, 'Condominio Residencial Brasilio Itiberê', 'Rua Brasílio Itiberê', '2455', 'Rebouças', '80230-050', 'Curitiba', 'PR', '', '2008-01-29 12:15:14'),
(7, 'EdLPinto', '02', 1, 'Edificio Residencial Lourenço Pinto', 'Rua Lourenço Pinto', '260', 'Centro', '80010160', 'Curitiba', 'PR', '', '2008-01-29 17:06:58'),
(8, 'EdAries', '09', 1, 'Condominio Residencial Aries', 'Avenida Nossa Senhora Aparecida', '501', 'Seminário', '80440000', 'Curitiba', 'PR', '', '2008-01-29 17:10:06'),
(9, 'Outros', '99', 99, 'Clientes Avulsos', '', '', '', '', '', 'PR', '', '2008-01-29 17:14:17'),
(10, 'Empresas', '00', 2, 'Clientes Empresarial', '', '', '', '', '', 'PR', 'Grupo de clientes empresarial.', '2008-01-29 17:40:31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos_tipos`
--

CREATE TABLE `grupos_tipos` (
  `id` int(11) NOT NULL auto_increment,
  `tipo` varchar(200) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=100 ;

--
-- Extraindo dados da tabela `grupos_tipos`
--

INSERT INTO `grupos_tipos` (`id`, `tipo`) VALUES
(1, 'Condomínio'),
(2, 'Empresa'),
(99, 'Outros');

-- --------------------------------------------------------

--
-- Estrutura da tabela `planos`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `planos`
--

INSERT INTO `planos` (`id`, `codigo`, `nome`, `descricao`, `vel_download`, `vel_upload`, `valor_base`, `valor_pontoadicional`, `fidelidade`, `observacoes`, `datacadastro`) VALUES
(1, 'sc300', 'SmartConnect 300x150', 'Bla bla bla', '300', '150', 60.00, 10.00, 0, 'Observações pertinentes ao plano Smart Connect 300', '2007-11-20 09:38:33'),
(4, 'sc400', 'SmartConnect 400x200', 'Bla bla bla', '400', '200', 80.00, 10.00, 0, '', '2007-11-21 10:15:59'),
(9, 'sc350', 'SmartConnect 350x175', 'Bla bla bla', '350', '175', 70.00, 10.00, 0, '', '2007-11-22 10:34:23'),
(7, 'sc200', 'SmartConnect 200x100', 'bla bla bla', '200', '100', 40.00, 10.00, 0, '', '2007-11-22 09:53:17'),
(6, 'sc150', 'SmartConnect 150x75', 'bla bla bla', '150', '75', 30.00, 10.00, 0, '', '2007-11-22 09:52:38'),
(8, 'sc250', 'SmartConnect 250x125', '', '250', '125', 50.00, 10.00, 0, '', '2007-11-22 10:31:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `provedores`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `provedores`
--

INSERT INTO `provedores` (`id`, `codigo`, `razaosocial`, `nomefantasia`, `cnpj`, `inscestadual`, `inscmunicipal`, `responsavel`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `tel_principal`, `tel_comercial`, `tel_financeiro`, `tel_suporte`, `celular1`, `celular2`, `celular3`, `fax`, `email_principal`, `email_comercial`, `email_financeiro`, `email_suporte`, `observacoes`, `datacadastro`) VALUES
(5, 'ssolution', 'Smart Solution Tecnologia da Informação Ltda.', 'Smart Solution TI ', '05.198.010/0001-05', '903.38693-28', '6.024.442.076-9', 'Antonio Gustavo Sampaio de Oliveira ', 'Avenida Sete de Setembro', '3272', 'Conjunto 11', 'Centro', '80.230-010', 'Curitiba', 'PR', '(41) 3234-2443', '(41) 3234-2443', '(41) 3234-2443', '(41) 3234-2443', '(41) 8416-0817', '(41) 9121-2032', '', '', 'smart@smartsolution.com.br', 'comercial@smartsolution.com.br', 'financeiro@smartsolution.com.br', 'suporte@smartsolution.com.br', '', '2007-11-19 12:07:57');
