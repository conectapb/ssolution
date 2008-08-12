-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Jul 19, 2008 as 08:24 PM
-- Versão do Servidor: 5.0.51
-- Versão do PHP: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Banco de Dados: `ssolution`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
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
(1, 'smart', '550237b8fbcdf3741bb1127d0fc7f6bf', 'Smart Solution TI', 1, '2006-06-02 23:29:00', '2008-07-17 20:53:12', '10.10.11.9'),
(2, 'antonio', '4a181673429f0b6abbfd452f0f3b5950', 'Antonio Gustavo Sampaio de Oliveira', 1, '2007-11-05 11:31:34', '2008-05-27 09:39:49', '10.10.11.12'),
(3, 'sergio', '912318713265d527f3f5f640a550feb9', 'Sergio Henrique Costa', 1, '2008-01-29 11:01:14', '2008-07-18 09:05:00', '10.10.11.8'),
(4, 'rebeca', '708a65c007259f302db570f607cfa897', 'Rebeca Schmeiske Fausto', 1, '2008-01-29 11:05:54', '2008-02-01 23:52:46', '10.12.7.7');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chamados`
--

CREATE TABLE IF NOT EXISTS `chamados` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `chamados`
--

INSERT INTO `chamados` (`id`, `tipo_id`, `cliente_id`, `admin_id`, `problema`, `solucao`, `status_id`, `data_abertura`, `data_fechamento`, `observacoes`) VALUES
(3, 1, 56, 1, 'a', 'b', 3, '2008-02-02', '2003-02-01', 'c1\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chamados_status`
--

CREATE TABLE IF NOT EXISTS `chamados_status` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `chamados_status`
--

INSERT INTO `chamados_status` (`id`, `nome`) VALUES
(1, 'Aberto'),
(2, 'Encerrado'),
(3, 'Em análise');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chamados_tipos`
--

CREATE TABLE IF NOT EXISTS `chamados_tipos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `chamados_tipos`
--

INSERT INTO `chamados_tipos` (`id`, `nome`) VALUES
(1, 'Financeiro'),
(2, 'Comercial'),
(3, 'Manutenção'),
(4, 'Outros');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `codigo` varchar(100) NOT NULL,
  `tipo` enum('Pessoa física','Pessoa jurídica') NOT NULL,
  `nome` varchar(200) NOT NULL default '',
  `nascimento` date NOT NULL default '0000-00-00',
  `rg` varchar(20) NOT NULL,
  `cpf` varchar(30) NOT NULL,
  `sexo` enum('Masculino','Feminino') NOT NULL,
  `razao_social` varchar(200) NOT NULL,
  `nome_fantasia` varchar(200) NOT NULL,
  `cnpj` varchar(200) NOT NULL,
  `inscr_municipal` varchar(200) NOT NULL,
  `inscr_estadual` varchar(200) NOT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=137 ;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `codigo`, `tipo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `razao_social`, `nome_fantasia`, `cnpj`, `inscr_municipal`, `inscr_estadual`, `grupo_id`, `endereco`, `numero`, `bloco`, `complemento_tipo`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `site`, `email1`, `email2`, `email3`, `observacoes`, `datacadastro`) VALUES
(7, '08001', 'Pessoa física', 'Tulio Hofmann Filho', '1911-11-11', '', '', 'Masculino', '', '', '', '', '', 3, 'R. Alferes Poli', '294', '', 'Ap.', '101', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', 'tulinho_hofmann@hotmail.com', '', '', 'xxxx', '2007-11-23 12:22:09'),
(8, '08002', 'Pessoa física', 'Daniel Hiroshi Nielsen Yabu', '0000-00-00', '1111111111', '034.753.719-79', 'Masculino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '1603', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '4184438229', '', '', '', '', '', '', '', '2008-01-14 12:09:00'),
(9, '08003', 'Pessoa física', 'Robson Lara Moreira', '1911-11-11', '11111111', '226.520.818-37', 'Masculino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '202', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '4188779103', '', '', 'robson_lara@hotmail.com', '', '', '', '2008-01-14 12:09:37'),
(10, '08004', 'Pessoa física', 'Felipe Augusto Kubis', '0000-00-00', '', '054.165.369-50', 'Masculino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '301', '80230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-14 12:10:30'),
(11, '08005', 'Pessoa física', 'Mayara Cristina Garcia Machuca ', '0000-00-00', '', '369.742.538-26', 'Feminino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '303', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-14 12:11:33'),
(12, '08006', 'Pessoa física', 'Graciele Razera', '0000-00-00', '11111111', '644.489.400-04', 'Feminino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '902', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '4196047400', '', '', '', 'gracirazera@hotmail.com', '', '', '', '2008-01-14 12:12:41'),
(13, '08008', 'Pessoa física', 'Lucas Nunes da Silveira', '1111-11-11', '1111111111', '038.062.189-43', 'Masculino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '903', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '4196470837', '', '', '', 'lucasn_silveira@hotmail.com', '', '', '', '2008-01-14 12:13:34'),
(14, '08007', 'Pessoa física', 'Simone Vivan', '0000-00-00', '', '029.500.199-27', 'Feminino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '1001', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '4199151267', '', '', '', '', '', '', '', '2008-01-14 12:14:13'),
(15, '08009', 'Pessoa física', 'Rebeca Garcia Martins', '0000-00-00', '86702789 PR', '046.373.099-21', 'Feminino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '1402', '80.230-090', 'Centro', 'Curitiba', 'PR', '4132336364', '', '', '', '', '', 'bekinha_28@hotmail.com', '', '', '', '2008-01-14 12:14:47'),
(16, '08010', 'Pessoa física', 'Juliana Horta', '0000-00-00', '', '', 'Feminino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '1403', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '4136662411', '4199089783', '', '', '', 'hortajuli@hotmail.com', '', '', '', '2008-01-14 12:15:20'),
(17, '08011', 'Pessoa física', 'Robson Garcia Barbosa', '1980-08-21', '8021556-8 PR', '032.060.729-13', 'Masculino', '', '', '', '', '', 3, 'R. Alferes Poli', '294', '', 'Ap.', '1502', '80230-090', 'Centro', 'Curitiba', 'PR', '4132031848', '', '4188540611', '', '', '', 'robson.cwb@gmail.com', '', '', '', '2008-01-14 12:16:12'),
(18, '99001', 'Pessoa física', 'Oscar Ricardo Macedo Schmeiske', '0000-00-00', '', '635.251.609-25', 'Masculino', '', '', '', '', '', 9, 'Avenida Sete de Setembro', '6830', '', '', 'AP 1531', '80240001', 'Seminário', 'Curitiba', 'PR', '4132436467', '4132501355', '4199776984', '', '', '', 'oscar@ippuc.org.br', 'oscarschmeiske@gmail.com', '', 'Cliente avulso em serviços de manutenção e suporte.', '2008-01-29 17:17:35'),
(19, '99002', 'Pessoa física', 'Rinaldo da Silva Rocha', '0000-00-00', '', '69705658900', 'Masculino', '', '', '', '', '', 9, 'Rua Maria Ludwig Muller', '277', '', '', '', '83409540', 'Jardim Eucalipto', 'Colombo', 'PR', '', '', '', '', '', '', '', '', '', 'Parceiro de negocios - Manutenção em monitores, impressoras e micromputadores.', '2008-01-29 17:26:55'),
(20, '03001', 'Pessoa física', 'Clelia Alice Marson', '1971-03-19', '60871990', '963.298.589-34', 'Feminino', '', '', '', '', '', 6, 'R. Brasílio Itiberê', '2433', 'B', 'Ap.', '25', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133334941', '', '4184253353', '', '', '', '', '', '', '', '2008-01-29 17:31:24'),
(21, '06001', 'Pessoa física', 'Iolanda Reis', '0000-00-00', '', '39409538904', 'Feminino', '', '', '', '', '', 4, 'Avenida. Sete de Setembro', '3293', '', 'Ap.', '1301', '80230-010', 'Centro', 'Curitiba', 'PR', '4130194881', '', '', '', '', '', '', '', '', 'Cunhada da Zeladora do Edificio Roma, dados para operaçõs financeiras.', '2008-01-29 17:38:20'),
(22, '00002', 'Pessoa jurídica', '', '0000-00-00', '', '765.823.370-00', '', 'IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba', 'IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba', '', '', '', 10, 'Rua Bom Jesus', '669', '', '', '', '80035010', 'Juveve', 'Curitiba', 'PR', '', '41 3250-1300', '', '', '', '', '', '', '', 'Cliente de Vendas de equipamentos e de Serviços de suporte e manutenção em servidores.', '2008-01-29 18:01:02'),
(23, '99003', 'Pessoa física', 'Luis Sergio Rolim de Moura', '0000-00-00', '', '64101835934', 'Masculino', '', '', '', '', '', 9, 'Rua Irmãs Paulina', '5146', '', '', '', '81020230', 'Novo mundo', 'Curitiba', 'PR', '', '', '4192139239', '4191823402', '', '', '', '', '', 'Luis que trabalha com o Paulo Databull.', '2008-01-29 18:09:07'),
(24, '99004', 'Pessoa física', 'Rauf Alencar de Oliveira', '1986-04-09', '', '058.890.259-45', 'Masculino', '', '', '', '', '', 9, 'Rua João Gomes ', '100', 'J', 'Ap.', '32 ', '80020030', 'Novo mundo', 'Curitiba', 'PR', '', '4133980456', '41', '', '', '', 'rauf@mjtelefonia.com.br', 'rauf.sk8@gmail.com', '', '', '2008-01-29 18:13:39'),
(25, '02001', 'Pessoa física', 'Rose Mari Martins Arruda', '1910-10-10', '', '317.955.799-00', 'Masculino', '', '', '', '', '', 7, 'Rua LourenÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§o Pinto', '260', '', 'Ap.', '103A', '80010160', 'Centro', 'Curitiba', 'PR', '4132224102', '4130146906', '4194280387', '', '', '', '', '', '', 'Sindica do condominio', '2008-01-30 11:49:16'),
(26, '02002', 'Pessoa física', 'Jackson M. Nizer', '0000-00-00', '', '032.173.759-80', 'Masculino', '', '', '', '', '', 7, 'Rua Lourenço Pinto', '260', '', 'Ap.', '201', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'Irmão da Jacqueline Nizer funcionária da Huczok', '2008-01-30 11:50:59'),
(27, '02003', 'Pessoa física', 'Jorge Gonçalves dos Santos', '0000-00-00', '', '157.097.799-20', 'Masculino', '', '', '', '', '', 7, 'Rua Lourenço Pinto', '260', '', 'Ap.', '202', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 11:53:31'),
(28, '02004', 'Pessoa física', 'Sergio Vivan', '0000-00-00', '', '460.707.379-20', 'Masculino', '', '', '', '', '', 7, 'Rua Lourenço Pinto', '260', '', 'Ap.', '303', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 11:55:04'),
(29, '02005', 'Pessoa física', 'Jhony Maciel Oliveira', '0000-00-00', '', '064.214.299-80', 'Masculino', '', '', '', '', '', 7, 'Rua Lourenço Pinto', '260', '', 'Ap.', '103B ', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 11:58:47'),
(30, '02006', 'Pessoa física', 'Daisy Mary Reichel', '0000-00-00', '', '008.933.740-91', 'Masculino', '', '', '', '', '', 7, 'Rua Lourenço Pinto', '260', '', 'Ap.', '302', '80010160', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 12:04:12'),
(31, '03002', 'Pessoa física', 'Luciana Osorio Cavalli', '0000-00-00', '000000000', '043.933.609-07', 'Feminino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'B', 'Ap.', '23', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4135273870', '', '4199389656', '', '', '', 'lucianacavalli@yahoo.com.br', '', '', 'cancelamneto > 23/01/08\r\n', '2008-01-30 12:06:50'),
(32, '03003', 'Pessoa física', 'Zenildo Costa', '0000-00-00', '', '539.938.029-34', 'Masculino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'B', 'Ap.', '25', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133334941', '4133334941', '4184122072', '', '4133334941', '', '', '', '', '', '2008-01-30 12:08:29'),
(33, '03004', 'Pessoa física', 'Bernhard Zanker Junior', '0000-00-00', '', '025.833.599-83', 'Masculino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'B', 'Ap.', '31', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 12:12:22'),
(34, '03005', 'Pessoa física', 'Edison Carlos dos Santos', '0000-00-00', '', '681.977.569-53', 'Masculino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'B', 'Ap.', '43', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 12:13:16'),
(35, '03006', 'Pessoa física', 'Ana Elisa Macagnan', '0000-00-00', '', '897.755.200-10', 'Feminino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'B', 'Ap.', '22', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', 'ana.elisa.pm@hotmail.com', '', '', '', '2008-01-30 12:14:10'),
(36, '03007', 'Pessoa física', 'Fernando Henrique Tremel Bueno', '0000-00-00', '', '050.193.579-79', 'Masculino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'B', 'Ap.', '24', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 12:15:05'),
(37, '03008', 'Pessoa física', 'Adriano Noedinger da Silva', '0000-00-00', '', '030.070.919-69', 'Masculino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'B', 'Ap.', '43', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'Cunhado do Edison Pudim', '2008-01-30 12:16:22'),
(38, '03009', 'Pessoa física', 'Eugenio Antonio Guerra', '0000-00-00', '', '553.679.686-00', 'Masculino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'B', 'Ap.', '44', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4133336862', '', '4199754454', '', '', '', 'egf.madeiras@netctba.com.br', 'geninhoemarias@netctba.com.br', '', 'Contato com Maria Claudia - Esposa', '2008-01-30 12:17:19'),
(39, '03010', 'Pessoa física', 'Waldenira Pistori', '0000-00-00', '1111111111111111', '205.384.649-68', 'Feminino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'BII', 'Ap.', '21', '80230-050', 'Rebouças', 'Curitiba', 'PR', '4130158715', '4130261627', '4184431057', '', '', '', 'luis_pisttori@hotmail.com', '', '', '', '2008-01-30 12:18:23'),
(40, '03011', 'Pessoa física', 'Clayton Cezar Upitis Marloch', '0000-00-00', '', '651.454.109-72', 'Masculino', '', '', '', '', '', 6, 'Rua Brasílio Itiberê', '2455', 'BII', 'Ap.', '42', '80230-050', 'Rebouças', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 12:19:28'),
(41, '04001', 'Pessoa física', 'Vanildo', '0000-00-00', '', '', 'Masculino', '', '', '', '', '', 5, 'R. 24 de Maio', '262', '', 'Cj.', '301', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'Zelador do condominio possue uma sala comercial', '2008-01-30 12:33:04'),
(42, '04002', 'Pessoa jurídica', '', '0000-00-00', '', '016.254.010-00', '', 'ACC Aduditoria Contabil S/C Ltda.', 'ACC Aduditoria Contabil S/C Ltda.', '', '', '', 5, 'R. 24 de Maio', '262', '', 'Cj.', '1103', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 12:35:17'),
(43, '04003', 'Pessoa física', 'Francisco C. T. Costa e Silva', '0000-00-00', '', '320.945.319-53', 'Masculino', '', '', '', '', '', 5, 'R. 24 de Maio', '262', '', 'Cj.', '505 /  506', '80230-080', 'Centro', 'Curitiba', 'PR', '', '4132336584', '', '', '', '', '', '', '', '', '2008-01-30 12:36:52'),
(44, '04004', 'Pessoa física', 'Sonia Maria Bressan ', '0000-00-00', '', '237.300.300-78', 'Feminino', '', '', '', '', '', 5, 'R. 24 de Maio', '262', '', 'Cj.', '803', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 12:38:03'),
(45, '04005', 'Pessoa física', 'Carlos Eduardo', '1911-11-11', '1237614', '374.755.339-72', 'Masculino', '', '', '', '', '', 5, 'R. 24 de Maio', '262', '', 'Cj.', '806', '80230-080', 'Centro', 'Curitiba', 'PR', '', '41 3323-1863', '4184355587', '', '', '', 'drcarloseduardo@uol.com.br', '', '', 'solicitado desligamento em 13/05/08', '2008-01-30 12:38:56'),
(46, '04006', 'Pessoa física', 'Saulo Souza e Silva', '0000-00-00', '', '322.416.669-04', 'Masculino', '', '', '', '', '', 5, 'R. 24 de Maio', '262', '', 'Cj.', '402', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'senha windows ALG9812', '2008-01-30 12:41:27'),
(47, '04007', 'Pessoa física', 'Ursula', '0000-00-00', '', '', 'Feminino', '', '', '', '', '', 5, 'R. 24 de Maio', '262', '', 'Cj.', '402', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'Atendente do consultório do Saulo.', '2008-01-30 12:42:22'),
(48, '04008', 'Pessoa jurídica', '', '0000-00-00', '', '000.580.940-00', '', 'R. Huczok Consulting Ltda.', 'R. Huczok Consulting Ltda.', '', '', '', 5, 'R. 24 de Maio', '262', '', 'Cj.', '1001 /  1002', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 12:44:30'),
(49, '04009', 'Pessoa jurídica', '', '0000-00-00', '999999', '766.412.650-00', '', 'DIVALPAR Participação Societária Ltda.', 'DIVALPAR Participação Societária Ltda.', '', '', '', 5, 'Rua 24 de Maio', '262', '', 'Cj.', '1104', '80230-080', 'Centro', 'Curitiba', 'PR', '4133223410', '', '', '', '', '', '', '', '', '', '2008-01-30 12:58:07'),
(50, '04010', 'Pessoa jurídica', '', '0000-00-00', '', '081.823.640-00', '', 'Rogoski & Soares C. A. Elet. Ltda.', 'Rogoski & Soares C. A. Elet. Ltda.', '', '', '', 5, 'Rua 24 de Maio', '262', '', 'Cj.', '1201', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 13:12:50'),
(51, '04011', 'Pessoa jurídica', '', '0000-00-00', '', '011.343.090-00', '', 'Olimpus Agência de Viagem e Turismo Ltda.', 'Olimpus Agência de Viagem e Turismo Ltda.', '', '', '', 5, 'Rua 24 de Maio', '262', '', 'Cj.', '1202', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 13:17:03'),
(52, '04012', 'Pessoa jurídica', '', '0000-00-00', '', '017.667.360-00', '', 'EPRON Serviço de Informática S/C Ltda.', 'EPRON Serviço de Informática S/C Ltda.', '', '', '', 5, 'Rua 24 de Maio', '262', '', 'Cj.', '605', '80230-080', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'Ivan desenvolvedor de software para a Huczok.', '2008-01-30 14:40:51'),
(53, '05001', 'Pessoa física', 'Marisa Helena da Costa Serafin', '0000-00-00', '', '471.972.509-00', 'Feminino', '', '', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', 'Ap.', '01', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 14:42:51'),
(54, '05002', 'Pessoa física', 'Marisângela Pacheco Brittes', '1911-11-11', '1111111111', '906.561.219-04', 'Feminino', '', '', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', 'Ap.', '03', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '02/05/08=Alterou config individual para Router wireless\r\nDlink WBR1310 = 00:1C:F0:FE:B9:7D\r\nMari- NB - LAN  > 00:16:D3:11:86:3D\r\n         - WLAN > 00:18:DE:7F:44:10\r\n', '2008-01-30 14:46:08'),
(55, '05003', 'Pessoa jurídica', '', '0000-00-00', '', '791.100.860-00', '', 'COMPOR Arquitetura e Construção Ltda.', 'COMPOR Arquitetura e Construção Ltda.', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', 'Cj.', '04', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 19:31:18'),
(56, '05004', 'Pessoa física', 'Eliana Nascimento', '0000-00-00', '', '872.560.296-91', 'Feminino', '', '', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', 'Ap.', '06', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', 'lia_nascimento1@hotmail.com', '', '', '', '2008-01-30 19:33:38'),
(57, '05005', 'Pessoa física', 'Djalma Jacinto da Silva Filho', '0000-00-00', '', '738.669.389-34', 'Masculino', '', '', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', 'Ap.', '08', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 19:37:09'),
(58, '05006', 'Pessoa física', 'Isabel Jacomel', '0000-00-00', '', '583.674.629-04', 'Feminino', '', '', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', 'Ap.', '10', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-30 19:42:46'),
(59, '05007', 'Pessoa física', 'Celso Amaral Poletti', '0000-00-00', '', '008.436.739-31', 'Masculino', '', '', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', 'Ap.', '12', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', 'askywalker_starwars@hotmail.com', '', '', 'Beatriz > 8805-3575', '2008-01-30 19:45:36'),
(60, '05008', 'Pessoa física', 'Claiton Estacionamento', '0000-00-00', '', '', 'Masculino', '', '', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', '', 'Estacionamento', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', 'claytongarcia473@hotmail.com', '', '', '', '2008-01-30 19:46:11'),
(61, '06002', 'Pessoa física', 'Matilde Alves da Cunha Silva', '0000-00-00', '', '153.857.058-02', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '103', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 13:52:24'),
(62, '06003', 'Pessoa física', 'Wallace Mendes Cordeiro', '0000-00-00', '', '020.916.769-69', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '104', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 13:54:27'),
(63, '06004', 'Pessoa física', 'Rubia Souza Pimenta de Padua', '0000-00-00', '7211934-7 / PR', '037.036.639-52', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '108', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '4136425555', '4199570561', '', '', '', 'rupimenta@gmail.com', '', '', 're-ativado em 11/04/08 para ser cobrado a partir de 10/05/08', '2008-01-31 13:56:28'),
(64, '06005', 'Pessoa física', 'Robson Roberto da Silva', '0000-00-00', '', '048.468.029-30', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '208', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 13:57:38'),
(65, '06006', 'Pessoa física', 'Bruna Amaral Monteiro', '0000-00-00', '384.625-0 / PR', '048.863.769-40', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '307', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '4196654014', '', '', '', '', '', '', 'celular antigo > 4199653379', '2008-01-31 13:58:30'),
(66, '06007', 'Pessoa física', 'Luana Aparecida Dias Mota', '0000-00-00', '', '342.496.088-83', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '405', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 14:00:04'),
(67, '06008', 'Pessoa física', 'Katia Cristina Zardo', '0000-00-00', '6012334-9 PR', '929.051.619-49', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '602', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '4130242408', '4191118397', '', '', '', 'katia.zardo@hotmail.com', '', '', '', '2008-01-31 14:00:52'),
(68, '06009', 'Pessoa física', 'Rose Cristina Neves', '0000-00-00', '', '', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '603', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 14:03:06'),
(69, '06010', 'Pessoa física', 'George Galli', '0000-00-00', '', '054.504.359-08', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '606', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 14:04:15'),
(70, '06011', 'Pessoa física', 'Leonardo Raupp Matta', '0000-00-00', '', '368.638.378-03', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '904', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '4191456911', '', '', '', 'leonardo_raupp@hotmail.com', '', '', '', '2008-01-31 14:05:36'),
(71, '06012', 'Pessoa física', 'Rita Helena Zimmermann', '1957-06-15', '4056361-0 PR', '312.534.319-49', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '905', '80.230-010', 'Centro', 'Curitiba', 'PR', '4132336720', '', '4196326011', '', '', '', 'ritahzim@yahoo.com.br', '', '', '', '2008-01-31 14:06:53'),
(72, '06013', 'Pessoa física', 'Mellina Franco Oliveira Canto', '0000-00-00', '', '368.851.968-00', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '908', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '4196227515', '', '', '', 'mel_canto@hotmail.com', '', '', '', '2008-01-31 14:09:21'),
(73, '06014', 'Pessoa física', 'Felipe Lukacievick Barbosa', '0000-00-00', '', '040.494.399-30', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '1004', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 14:17:05'),
(74, '06015', 'Pessoa física', 'Fernando Cesar Alves da Silva', '0000-00-00', '', '', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '1106', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 14:18:08'),
(75, '06016', 'Pessoa física', 'Amanda Tieppo', '1911-11-11', '1111111111', '055.717.089-30', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '1108', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', 'amandatieppo@gmail.com', 'amandatieppo@hotmail.com', '', '', '2008-01-31 14:19:24'),
(76, '06017', 'Pessoa física', 'Thiago Carli', '0000-00-00', '', '039.701.069-90', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '1205', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 14:20:34'),
(77, '06018', 'Pessoa física', 'Fabiana Reis', '0000-00-00', '', '', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '1301', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'Filha da D. Lourdes zeladora do predio.', '2008-01-31 14:22:04'),
(78, '09001', 'Pessoa física', 'Katia Regina Schmeiske', '0000-00-00', '', '', 'Feminino', '', '', '', '', '', 8, 'Av. Sete de Setembro', '6830', '', 'Ap.', '1531', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 14:37:16'),
(79, '09002', 'Pessoa física', 'Henderson Ezequiel Rudiniski', '1977-05-06', '64618822 / PR', '022.198.909-96', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '232', '80.440-000', 'Seminário', 'Curitiba', 'PR', '', '4133217600', '4191111860', '', '', '', 'r_hender@hotmail.com', '', '', '', '2008-01-31 14:49:04'),
(80, '09003', 'Pessoa física', 'Morgana Biron', '0000-00-00', '7.859.158-7 / PR', '053.419.179-79', 'Feminino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '241', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'Ponto adicional habilitado em 19/02/08:\r\nIP: 10.1.3.2 ; MAC-ADDR: 00:C0:DF:E9:B4:88', '2008-01-31 14:50:06'),
(81, '09004', 'Pessoa física', 'Thais Cristina Sentone Mota', '0000-00-00', '', '035.978.319-82', 'Feminino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '522', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 14:52:03'),
(82, '09005', 'Pessoa física', 'João Arnaldo de Oliveira', '1911-11-11', '11111111', '028.053.679-87', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '722', '80.440-000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', 'solicitado cancelamento em 28/05/08.\r\n', '2008-01-31 14:53:43'),
(83, '09006', 'Pessoa física', 'Carlos Roberto dos Santos Fernandes', '0000-00-00', '2088917-9 SPP/PR', '402.430.529-87', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '811', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '4196447773', '', '', '', 'carlaovs41@hotmail.com', '', '', '', '2008-01-31 15:10:05'),
(84, '09007', 'Pessoa física', 'Sonia Aparecida Estevan Costa ', '0000-00-00', '4675667-3 PR', '858.810.589-68', 'Feminino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '922', '80440000', 'Seminário', 'Curitiba', 'PR', '4132431906', '41', '4199954112', '', '', '', '', '', '', 'DN:25/02/63', '2008-01-31 15:14:16'),
(85, '09008', 'Pessoa física', 'José Carlos de Lima', '1958-03-10', '2166535 / PR', '337.841.169-49', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '932', '80440000', 'Seminário', 'Curitiba', 'PR', '4133432571', '4136768213', '4196535867', '', '', '', 'zekinhahsbc@hotmail.com', '', '', 'durante o dia contatos com a esposa Jucimara', '2008-01-31 15:15:13'),
(86, '09009', 'Pessoa física', 'Ivana Rubio Colin', '0000-00-00', '', '055.924.239-50', 'Feminino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '942', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 15:16:29'),
(87, '09010', 'Pessoa física', 'José Carvalho Filho', '0000-00-00', '', '396.640.319-68', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '1122', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 15:17:36'),
(88, '09011', 'Pessoa física', 'Anderson Augusto Fillus', '1911-11-11', '11111111', '049.129.829-38', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '1511', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', 'andersonfillus@hotmail.com', '', '', '', '2008-01-31 15:18:32'),
(89, '09012', 'Pessoa física', 'Jefferson Olinger de Souza', '0000-00-00', '', '040.739.369-21', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '1512', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '', '2008-01-31 15:19:38'),
(90, '09013', 'Pessoa física', 'José Carlos', '0000-00-00', '831045-9 / PR', '183.674.379-34', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '1512', '80440000', 'Seminário', 'Curitiba', 'PR', '4130277039', '', '', '', '', '', 'jcsouza0709@gmail.com', 'jcsouza@hotmail.com', '', 'Pai do Jefferson plano individual do próprio.', '2008-01-31 15:22:00'),
(91, '09014', 'Pessoa física', 'Adriano de Araujo Schampovski', '0000-00-00', '5903776-5 / PR', '873.899.329-53', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '1521', '80440000', 'Seminário', 'Curitiba', 'PR', '', '', '4188042413', '', '', '', 'adriano@hoteisesolucoes.com', '', '', '', '2008-01-31 15:22:31'),
(93, '101001', 'Pessoa física', 'Everson Edson do Prado', '1979-11-08', '89821258', '026.923.429-25', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '71', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '32466809', '', '88072142', '', '', '', 'eversonet@hotmail.com', '', '', 'Instalaçao 02/02/2008 - dia todo, ligar p confirmar horario.', '2008-02-01 16:08:54'),
(94, '101015', 'Pessoa física', 'Valdemir Antonio Rovares', '0000-00-00', '19272090', '108.061.498-25', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '103', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '4132461186', '', '', '', '', '', 'alexandrarovares@hotmail.com', '', '', 'Esposo da Sindica ', '2008-02-01 16:16:44'),
(95, '101002', 'Pessoa física', 'Nilo Ravazzi', '1959-09-10', '19772535 / PR', '405.344.309-10', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '22', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '4131248855', '4199613435', '', '', '', 'niloravazzi@yahoo.com.br', '', '', '', '2008-02-01 16:19:17'),
(96, '101003', 'Pessoa física', 'Dievert Fernando de Campos', '0000-00-00', '77872906', '045.894.549-80', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '63', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '33272329', '', '', '', '', '', 'cheve_tt_ee@hotmail.com', '', '', '', '2008-02-01 16:22:44'),
(97, '101004', 'Pessoa física', 'Luiz Eduardo Lasszck', '0000-00-00', '62449284', '875.876.109-87', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '92', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '4133049098', '', '4199366803', '', '', '', 'eduardo@prt9.mpt.gov.br', '', '', '', '2008-02-01 16:24:29'),
(98, '101005', 'Pessoa física', 'Adenir Farias', '0000-00-00', '60208018', '017.554.369-04', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '101', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3567-9184 ', '', '8405-5327', '', '', '', '', '', '', '', '2008-02-01 16:26:51'),
(99, '101006', 'Pessoa física', 'Valdir Modest de Oliveira', '0000-00-00', '41744367', '555.889.309-59', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '112', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '9682-0731', '', '', '', 'valdirdeoliveira1@hotmail.com', '', '', '', '2008-02-01 16:28:36'),
(100, '101007', 'Pessoa física', 'Antonio dos Santos Bicalho', '0000-00-00', '34219095', '491.092.439-68', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '143', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3346-1714', '', '9916-3562', '', '', '', '', '', '', '', '2008-02-01 16:30:06'),
(101, '101008', 'Pessoa física', 'Sueli Costa Luvison', '0000-00-00', '67199162', '021.715.799-86', 'Feminino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '114', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3268-9163', '', '', '', '', '', 's_ueli_costa@hotmail.com', '', '', '', '2008-02-01 16:31:55'),
(102, '101009', 'Pessoa física', 'Dieick Denner Gonçalves', '0000-00-00', '74123333', '006.958.229-77', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '151', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '41 3022-8903', '', '41 8859-4241', '41 9677-8533', '', '', 'dieick@yahoo.com.br', '', '', '', '2008-02-01 16:33:44'),
(103, '101010', 'Pessoa física', 'Vanderlei Souza', '0000-00-00', '299305661', '', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '153', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '8848-2141', '', '', '', '', '', '', 'nao tem seviço.', '2008-02-01 16:36:46'),
(104, '101011', 'Pessoa física', 'Shirley Cristiane M. de Souza', '0000-00-00', '7.324.135-9', '024.425.299-80', 'Feminino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '53', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '4188184709', '', '', '', 'criskatana@hotmail.com', '', '', '', '2008-02-01 16:38:10'),
(105, '101012', 'Pessoa física', 'Silvia Aparecida Pereira', '0000-00-00', '60820724', '873.637.559-49', 'Feminino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '123', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '3247-5528', '', '9963-7739', '', '', '', 'valter.costa@cnh.com', '', '', 'Esposa do Valter', '2008-02-01 16:40:03'),
(106, '101013', 'Pessoa física', 'Rosina Helena dos Santos', '0000-00-00', '2098664 / PR', '688.466.499-15', 'Feminino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '777', '', 'Ap.', '33', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '4132483312', '', '4188039777', '', '', '', '', '', '', 'Raphaela de Oliveira\r\nRG 79419982\r\nCPF 07511603939\r\n', '2008-02-01 16:42:41'),
(107, '101014', 'Pessoa física', 'Robson Sandro Santos', '0000-00-00', '74006884', '028.421.479-52', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '141', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '', '', '4184377480', '', '', '', '', '', '', '', '2008-02-01 16:44:23'),
(125, '09016', 'Pessoa física', 'Sidnei Scaravonatti', '0000-00-00', '4220679-2', '589.510.409-68', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '11', 'Ap.', '1111', '80440000', 'Seminário', 'Curitiba', 'PR', '4132435937', '4133145519', '', '4599772199', '', '', 'ssidnei@hotmail.com', '', '', '', '2008-03-07 11:33:32'),
(109, '00003', 'Pessoa jurídica', '', '0000-00-00', '', '', '', 'GE Money', 'GE Money', '', '', '', 10, 'Rua Monsenhor Celso', '23', '', '', '', '80010-150', 'Centro', 'Curitiba', 'PR', '', '41 3224-0177', '', '', '41 3224-7119', 'www.gemoney.com.br', '', '', '', 'Contato: Ediely Bilo', '2008-02-20 10:56:20'),
(110, '99005', 'Pessoa física', 'Ricardo - PRT', '0000-00-00', '', '', 'Masculino', '', '', '', '', '', 9, '', '', '', '', '', '', '', '', 'PR', '', '', '', '', '', '', '', '', '', 'Dados bancários usados para pagar a SCM:\r\nBanco do Brasil\r\nAG: 1443-5\r\nCC: 19.150-7\r\nValor: R$ 1340,80', '2008-02-20 11:00:31'),
(111, '00004', 'Pessoa jurídica', '', '0000-00-00', '', '045.430.730-00', '', 'Mercador Fomento Mercantil LTDA.', 'Mercador Fomento Mercantil LTDA.', '', 'x', 'x', 10, '', '', '', '', '', '', '', '', 'PR', '', '', '', '', '', '', '', '', '', 'Dados Bancários:\r\nHSBC\r\nAG: 0054\r\nCC: 28487-75', '2008-02-20 11:03:31'),
(112, '00005', 'Pessoa jurídica', '', '0000-00-00', '', '', '', 'Fontoura e Silva Com. de Informática', 'Fontoura e Silva Com. de Informática', '', 'x', 'x', 10, '', '', '', '', '', '', '', '', 'PR', '', '', '', '', '', '', '', '', '', 'Dados Bancários:\r\nItaú\r\nAG: 3761\r\nCC: 09324-8', '2008-02-20 11:21:55'),
(113, '00006', 'Pessoa jurídica', '', '0000-00-00', '', '', '', 'Paraná Despachante', 'Paraná Despachante', '', '', '', 10, '', '', '', '', '', '', '', '', 'PR', '', '41 3015-5501', '', '', '', '', '', '', '', '', '2008-02-20 11:25:23'),
(114, '09015', 'Pessoa física', 'Ivan de Oliveira Mota', '0000-00-00', '340.196-0 / PR', '111.061.589-20', 'Masculino', '', '', '', '', '', 8, 'Avenida Nossa Senhora Aparecida', '501', '', 'Ap.', '522', '80440000', 'Seminário', 'Curitiba', 'PR', '4133432466', '', '', '', '', '', 'ivan.o.mota@hotmail.com', 'ivan.o.mota@gmail.com', '', 'Substituiu o titulat do contrato (Thais).\r\nRenegociado valores atrasados:\r\nde 10/03 a 10/08 parcelas de R$ 80,00\r\na partir de 10/09 normal\r\n', '2008-02-20 12:13:22'),
(115, '00007', 'Pessoa jurídica', '', '0000-00-00', '', '004.170.810-00', '', 'Federação Paranaense de Ginástica', 'Federação Paranaense de Ginástica', '', '', '', 10, 'Rua Profª Antonia Reginatto Viana', '921', '', '', '', '', '', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '004.170.810-00', '2008-02-20 12:58:41'),
(116, '06019', 'Pessoa física', 'Jonas', '0000-00-00', '', '', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '206', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '9944-2176', '', '', '', '', '', '', 'Não mora mais no Roma, solicitou cancelamento em 21/11/08 às 12:28, quem atendeu foi o Valteir', '2008-02-20 13:13:58'),
(117, '00008', 'Pessoa jurídica', '', '0000-00-00', '', '', '', 'BV Financeira - Daniel Moreira', 'BV Financeira - Daniel Moreira', '', '', '', 10, 'Avenida Mal. Deodoro', '261', '', 'Lj.', 'Térreo', '', '', '', 'PR', '', '41 3596-3900', '41 8808-1787', '', '', '', 'daniel.moreira@cppromotora.com.br', '', '', '', '2008-02-01 13:16:27'),
(118, '00009', 'Pessoa jurídica', '', '0000-00-00', '', '', '', 'B2 Informática', 'B2 Informática', '', 'x', 'x', 10, '', '', '', '', '', '', '', '', 'PR', '', '41 3029-9404', '', '', '', 'www.infob2.com.br', 'vendas@infob2.com.br', '', '', 'Contato: Renato', '2008-02-01 13:17:54'),
(119, '51001', 'Pessoa física', 'Antonia - Síndica', '0000-00-00', '', '', 'Feminino', '', '', '', '', '', 11, '', '', '', '', '', '', 'Jardim Botânico', 'Curitiba', 'PR', '3013-0751', '', ' 9198-8823', '', '', '', '', '', '', '', '2008-02-01 13:19:33'),
(120, '99006', 'Pessoa física', 'Elenara Beatriz Fontana', '0000-00-00', '', '', 'Feminino', '', '', '', '', '', 9, '', '', '', '', '', '', '', '', 'PR', '3324-1243', '3223-7758', '9971-6264', '', '', '', 'elenaraf@gmail.com', 'elenara.fontana@pucpr.br', '', 'Cirurgiã Dentista\r\nFinanceamento carro com BV Financeira', '2008-02-01 13:25:11'),
(121, '06020', 'Pessoa física', 'Jeane Margarete Rucinski', '1973-04-13', '60213070 / PR', '813.480.539-68', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '503', '80.230-010', 'Centro', 'Curitiba', 'PR', '4141013797', '', '4141013797', '', '', '', 'jeanemargareterucinski@bol.com.br', '', '', 'Plano smartconnect150', '2008-02-28 09:01:13'),
(123, '101017', 'Pessoa física', 'Marcelo Luiz Velter', '1971-09-08', '219.7845 / SC', '652.603.259-15', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '52', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '4130130386', '', '4788050784', '', '', '', '', '', '', '', '2008-03-06 13:29:14'),
(124, '101018', 'Pessoa física', 'José Carlos Cardoso Ajala', '1965-08-26', '036.803.893-1', '419.537.030-20', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otávio Saldanha Mazza', '7777', '', 'Ap.', '42', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '4130295633', '', '4184021972', '', '', '', 'carlosajala@hotmail.com', '', '', '', '2008-03-06 13:31:20'),
(126, '05009', 'Pessoa física', 'João Marcos Ferreira Damaceno', '0000-00-00', '6078341-1/PR', '025.178.319-71', 'Masculino', '', '', '', '', '', 1, 'Av. Sete de Setembro', '3272', '', 'Ap.', '07', '80230-010', 'Centro', 'Curitiba', 'PR', '4130263584', '', '', '', '', '', 'joaodamaceno@yahoo.com.br', '', '', '', '2008-03-11 13:55:45'),
(127, '08012', 'Pessoa física', 'Juliana Aparecida Rosty de Anhaia Cesar', '1983-11-21', '8742839-7 / PR', '039.415.579-39', 'Feminino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '1201', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '4199830771', '4196877877', '', '', 'jucesar@hotmail.com', 'alexju21@hotmail.com', '', '', '2008-03-12 13:13:48'),
(128, '06021', 'Pessoa física', 'Caio Ruocco de Arruda', '1982-02-11', '104926606 PR', '312.158.778-11', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '603', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '4130214714', '4191456848', '', '', '', 'caioruocco_@hotmail.com', '', '', 'substitui contrato ap603 - Rose Cristina', '2008-03-15 10:37:44'),
(129, '06022', 'Pessoa física', 'Ines Eline Lopes Martins', '0000-00-00', '2375324 PR', '050.172.588-17', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '301', '80.230-010', 'Centro', 'Curitiba', 'PR', '4132324981', '', '4188523696', '', '', '', 'mlmartins@yahoo.com.br', '', '', 'dois pontos por R$ 60,00\r\n1 - instalado desktop em 15/02/08\r\n2 - instalado notebook em 15/03/08 (ponto adicional sri)\r\n\r\nTatiana - 88523696', '2008-03-15 13:06:53'),
(130, '06023', 'Pessoa física', 'Darlan Schneider', '1989-10-31', '4988231 SC', '072.830.569-04', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '606', '80230010', 'Centro', 'Curitiba', 'PR', '', '', '4196968018', '', '', '', '', '', '', 'Instalação em 08/05/08 - Plano SmartConnect 150\r\nmac address = 0013d4939163 <> IP = 10.13.8.1\r\n', '2008-05-08 14:05:41'),
(131, '101019', 'Pessoa física', 'ELDER SHIGUEMATSU', '1985-03-16', '7.750.715-9 PR', '058.673.579-88', 'Masculino', '', '', '', '', '', 12, 'R Marechal Otï¿½vio Saldanha Mazza', '7777', '', 'Ap.', '44', '81150060', 'Pinheirinho', 'Curitiba', 'PR', '4130158836', '', '', '', '', '', '', '', '', 'Instalação em 15/05/08', '2008-05-15 09:24:07'),
(133, '08013', 'Pessoa física', 'Conrado Souza de Chiaro', '0000-00-00', '607442416-3 / RS', '011.451.240-03', 'Masculino', '', '', '', '', '', 3, 'Rua Alferes Poli', '294', '', 'Ap.', '403', '80.230-090', 'Centro', 'Curitiba', 'PR', '', '', '8827-9967', '', '', '', '', '', '', 'MAC-ADDRESS Notebook Ethernet: 00:1E:68:28:53:18', '2008-06-21 11:15:24'),
(134, '06024', 'Pessoa física', 'Rafaela Polli', '1981-07-15', '7663070-4 PR', '041.572.879-75', 'Feminino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '601', '80.230-010', 'Centro', 'Curitiba', 'PR', '4133234283', '', '4199170396', '', '', '', 'rafaelapolli@yahoo.com.br', '', '', 're-instalada em 01/07/08 para uso ateh dia 16/07/08\r\na mesma possue pendencias anteriores\r\nmac address = 00:11:2f:1e:b6:4e ', '2008-07-01 12:34:26'),
(135, '06025', 'Pessoa física', 'Renato Alves Ribeiro', '0000-00-00', '', '', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '608', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '9186 1648', '', '', '', '', '', '', 'Possivel futuro cliente, entrou em contato 18/07/08', '2008-07-18 09:18:37'),
(136, '06026', 'Pessoa física', 'Raphael de Andrade', '1992-03-05', '97099472', '053.494.669-09', 'Masculino', '', '', '', '', '', 4, 'Av. Sete de Setembro', '3293', '', 'Ap.', '701', '80.230-010', 'Centro', 'Curitiba', 'PR', '33248643', '', '88887230', '', '', '', 'raphaelde.andrade@yahoo.com.br', '', '', 'Taxa de habilitação de sinal: R$ 30,00\r\nPlano escolhido: 200x400\r\n', '2008-07-18 10:17:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes_bkp`
--

CREATE TABLE IF NOT EXISTS `clientes_bkp` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Extraindo dados da tabela `clientes_bkp`
--

INSERT INTO `clientes_bkp` (`id`, `codigo`, `nome`, `nascimento`, `rg`, `cpf`, `sexo`, `grupo_id`, `endereco`, `numero`, `complemento`, `cep`, `bairro`, `cidade`, `uf`, `tel_residencial`, `tel_comercial`, `tel_celular1`, `tel_celular2`, `fax`, `email1`, `email2`, `email3`, `observacoes`, `datacadastro`) VALUES
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
(60, 5008, 'Claiton Estacionamento', '0000-00-00 00:00:00', '', '', 'M', 1, 'Av. Sete de Setembro', '3272', 'Estacionamento', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-30 19:46:11'),
(61, 6002, 'Matilde Alves da Cunha Silva', '0000-00-00 00:00:00', '', '153.857.058-02', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 103', '80230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:52:24'),
(62, 6003, 'Wallace Mendes Cordeiro', '0000-00-00 00:00:00', '', '020.916.769-69', 'M', 4, 'Av. Sete de Setembro', '3293', 'AP 104', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:54:27'),
(63, 6004, 'Natalia', '0000-00-00 00:00:00', '', '', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 108', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:56:28'),
(64, 6005, 'Robson Roberto da Silva', '0000-00-00 00:00:00', '', '048.468.029-30', 'M', 4, 'Av. Sete de Setembro', '3293', 'AP 208', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:57:38'),
(65, 6006, 'Bruna Amaral Monteiro', '0000-00-00 00:00:00', '', '', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 307', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 13:58:30'),
(66, 6007, 'Luana Aparecida Dias Mota', '0000-00-00 00:00:00', '', '342.496.088-83', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 405', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:00:04'),
(67, 6008, 'Katia Cristina Zardo', '0000-00-00 00:00:00', '', '', 'F', 4, 'Av. Sete de Setembro', '3293', 'AP 602', '80.230-010', 'Centro', 'Curitiba', 'PR', '', '', '', '', '', '', '', '', '', '2008-01-31 14:00:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE IF NOT EXISTS `contatos` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `contatos`
--

INSERT INTO `contatos` (`id`, `nome`, `empresa`, `tipo`, `edificio`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `uf`, `telefone1`, `telefone2`, `celular1`, `celular2`, `email1`, `email2`, `observacoes`, `datacadastro`) VALUES
(1, 'Ederson', 'Tenda Equipamentos Wireless', 'Contato comercial', '', '', '', '', '', '', '', 'PR', '', '', '9987-0696', '', '', '', '28/01/2008 14:37 - Retornar ligação para agendar horário p/ reunião', '0000-00-00 00:00:00'),
(2, 'Marco Henrique', '', 'Possível cliente', '', '', '', '', 'Portão', '', 'Curitiba', 'PR', '', '', '8407-3966', '', '', '', 'Possivel cliente no portão; Prédio com aproximadamente 100 apartamentos. Vai falar com a síndica e com vizinhos e mostrar nosso panfleto.', '0000-00-00 00:00:00'),
(3, 'Paula', 'Nextel', 'Contato Comercial', '', '', '', '', '', '', '', 'PR', '0800 900 901', '', '', '', '', '', 'Plano Radio Ilimitado + Telefonia Ilimitada\r\n- Radio ilimitado\r\n- R$ 0,60 por minuto\r\n- Mensalidade: R$ 82,00\r\n\r\nPlano Radio Ilimitado + Telefonia Bloqueada\r\n- Radio Ilimitado\r\n- Compra de créditos para fazer ligações\r\n- Mensalidade: R$ 92,00\r\n\r\nAparelhos:\r\n- Alugado: o mais simples, Motorola i290, custa 4x de R$ 46,00 de adesão e mensalidade de R$ 13,00\r\n- À parte: Precisa comprar o chip por R$ 39,90\r\n\r\nDá pra entrar em contato via 0800 e marcar visita de um consultor.', '2008-01-29 17:44:08'),
(4, 'Liziane', '', 'contato', 'Edificio Royal', 'Av Silva Jardim', '624', '', '', '', '', 'PR', '4130132696', '', '', '', '', '', '', '2008-02-20 11:22:52'),
(5, 'Zanoni', '', 'Sindico', 'Edificio Residencial Vera Cruz', 'Rua VX de Novembro', '1070', 'AP 22', 'Centro', '', 'São José dos Pinhais', 'PR', '4132822659', '', '', '', '', '', 'Primeira visita efetuada - reuniao com o Sr. Zanoni\r\nCliente indicado pela Rita da DIVALPAR.\r\n', '2008-02-20 11:24:50'),
(6, 'Mercador Fomento Mercantil', '', 'parceiro financeiro', '', 'Rua NUnes Machado', '', 'CJ 803', 'Centro', '', '', 'PR', '', '', '', '', '', '', 'Dados de conta bancaria:\r\nCNPJ: 04.543.073/0001-80\r\nBanco: HSBC\r\nAgencia: 0054\r\nConta Corrente: 28.487-75\r\n\r\n', '2008-02-20 11:45:29'),
(7, 'Bruna', '', 'possivel cliente', 'Itaperussuna', '', '', '', '', '', '', 'PR', '3603-2092', '', '', '', '', '', '', '2008-02-20 13:04:48'),
(8, 'Carlos ou Simone', '', 'possivel cliente', 'Parresh', '', '', 'AP. 201', '', '', '', 'PR', '3222-9077', '', '8806-7961', '8847-4266', '', '', '', '2008-02-01 13:21:40'),
(9, 'Bruno Loxaki moracani', '', 'contato', 'Ed Napoli', 'silva jardim', '', '', '', '', '', 'PR', '4133248123', '', '', '', '', '', '', '2008-02-01 14:13:34'),
(10, 'Andreia - ed aries ', '', 'cliente', 'ed aries', '', '', 'ap 1201', '', '', '', 'PR', '4132436852', '', '', '', '', '', '', '2008-03-01 17:51:12'),
(11, 'Odir Alves', '', 'cliente', 'Edf Bassa', 'Rua Santana', '590', 'AP 5', 'Jardim Botanico', '', '', 'PR', '4132633856', '', '', '', '', '', 'Sindico = AP 2 = ', '2008-03-04 19:09:53'),
(12, 'Basso Antenas', 'Empresa', 'distribuidor de antenas aquario', '', '', '', '', '', '', '', 'PR', '4133691133', '', '', '', '', '', '', '2008-04-09 11:36:28'),
(13, 'Arão', '', 'sindico', 'Edificio Ibiza', 'Rua Itatiaia', '1560', 'AP 103', 'Portão', '81070100', 'Curitiba', 'PR', '4130390123', '', '', '', '', '', 'condominio em que o Rogerio mora', '2008-05-28 11:21:25'),
(14, 'Cintia', '', 'cliente', '', '', '', '', '', '', '', 'PR', '32457479', '', '88581630', '', '', '', '', '2008-06-12 20:48:11'),
(15, 'Francisco Mike Ramos', '', 'f', '', 'Rodolfo Teixeira de Souza', '308', 'Panificadora Sao Lucas', 'Pinheirinho', '', 'Curitiba', 'PR', '33469382', '84233890', '', '', '', '', 'verificar cobertura', '2008-06-14 13:52:34');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contratos`
--

CREATE TABLE IF NOT EXISTS `contratos` (
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
  `valor_padrao` decimal(10,2) NOT NULL default '0.00',
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=26 ;

--
-- Extraindo dados da tabela `contratos`
--

INSERT INTO `contratos` (`id`, `ativo`, `codigo`, `provedor_id`, `plano_id`, `cliente_id`, `grupo_id`, `descricao`, `data_inicio`, `data_termino`, `periodo_id`, `vencimento_padrao`, `valor_padrao`, `observacoes`, `datacadastro`) VALUES
(5, 1, '', 5, 1, 7, 3, '', '2008-01-14', '2009-01-14', 8, 20, 45.00, '', '2008-01-14 12:24:46'),
(25, 1, '', 5, 4, 136, 4, '', '2008-07-18', '0000-00-00', 7, 10, 60.00, '', '2008-07-18 10:29:51'),
(7, 1, '', 5, 1, 9, 3, '', '2008-01-14', '2009-01-14', 7, 10, 45.00, '', '2008-01-14 13:35:10'),
(8, 1, '', 5, 1, 10, 3, '', '2008-01-14', '2009-01-14', 7, 10, 45.00, '', '2008-01-14 13:35:36'),
(9, 1, '', 5, 1, 11, 3, '', '2008-01-14', '2009-01-14', 7, 10, 45.00, '', '2008-01-15 12:12:42'),
(10, 1, '', 5, 1, 12, 3, '', '2008-01-14', '2009-01-14', 7, 10, 45.00, '', '2008-01-15 12:14:09'),
(11, 1, '', 5, 1, 16, 3, '', '2008-02-20', '0000-00-00', 7, 10, 45.00, '', '2008-02-01 17:07:47'),
(12, 1, '', 5, 1, 14, 3, '', '2008-02-20', '0000-00-00', 7, 10, 45.00, '', '2008-02-01 17:08:20'),
(13, 1, '', 5, 1, 17, 3, '', '2008-02-01', '0000-00-00', 7, 10, 45.00, '', '2008-02-01 17:27:37'),
(14, 1, '', 5, 1, 13, 3, '', '2008-02-01', '0000-00-00', 7, 10, 45.00, '', '2008-02-01 17:28:49'),
(15, 1, '', 5, 1, 15, 3, '', '2008-02-01', '0000-00-00', 7, 10, 45.00, '', '2008-02-01 17:29:33'),
(16, 1, '', 5, 1, 33, 6, 'Serviço de Comunicação e Multimídia - Internet', '2008-04-06', '2009-04-06', 7, 10, 45.00, '', '2008-04-06 15:23:55'),
(17, 1, '', 5, 1, 35, 6, '', '2008-04-06', '2009-04-06', 7, 10, 45.00, '', '2008-04-06 15:37:42'),
(18, 1, '', 5, 1, 36, 6, '', '2008-04-06', '2009-04-06', 7, 10, 45.00, '', '2008-04-06 15:38:38'),
(19, 1, '', 5, 1, 37, 6, '', '2008-04-06', '2009-04-06', 7, 10, 45.00, '', '2008-04-06 15:39:27'),
(20, 1, '', 5, 1, 38, 6, '', '2008-04-06', '2009-04-06', 7, 10, 45.00, '', '2008-04-06 15:40:02'),
(21, 1, '', 5, 1, 39, 6, '', '2008-04-06', '2009-04-06', 7, 10, 45.00, '', '2008-04-06 15:40:53'),
(22, 1, '', 5, 1, 40, 6, '', '2008-04-06', '2009-04-06', 7, 10, 45.00, '', '2008-04-06 15:41:31'),
(23, 1, '', 5, 1, 31, 6, '', '2007-04-06', '2008-01-23', 7, 10, 45.00, '', '2008-04-06 15:42:34'),
(24, 1, '', 5, 1, 8, 3, '', '2008-02-01', '2009-01-14', 7, 10, 45.00, '', '2008-06-06 08:50:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estacoes`
--

CREATE TABLE IF NOT EXISTS `estacoes` (
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

CREATE TABLE IF NOT EXISTS `funcoes` (
  `id` int(11) NOT NULL auto_increment,
  `pai` int(11) NOT NULL default '0',
  `posicao` int(11) NOT NULL default '0',
  `nome` varchar(100) NOT NULL default '',
  `ativo` tinyint(1) NOT NULL default '0',
  `restrito` tinyint(1) NOT NULL default '0',
  `link` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Extraindo dados da tabela `funcoes`
--

INSERT INTO `funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES
(1, 0, -10, 'Admins', 1, 0, 'javascript:;'),
(6, 0, 1, 'Provedores', 1, 0, 'javascript:;'),
(20, 0, 2, 'Contatos', 1, 0, 'javascript:;'),
(4, 0, 3, 'Clientes', 1, 0, 'javascript:;'),
(10, 0, 4, 'Grupos', 1, 0, 'javascript:;'),
(13, 0, 5, 'Planos', 1, 0, 'javascript:;'),
(16, 0, 6, 'Contratos', 1, 0, 'javascript:;'),
(19, 0, 7, 'Estações', 0, 0, 'javascript:;'),
(24, 0, 15, 'Chamados', 1, 0, 'javascript:;'),
(27, 0, 7, 'Títulos', 1, 0, 'cobrancas.php'),
(2, 1, 1, 'Cadastro', 1, 1, 'administradores.php?modo=cad'),
(3, 1, 2, 'Manutenção', 1, 0, 'administradores.php'),
(5, 4, 1, 'Cadastro', 1, 0, 'clientes.php?modo=cad'),
(9, 4, 2, 'Manutenção', 1, 0, 'clientes.php?modo=lst'),
(7, 6, 1, 'Cadastro', 1, 0, 'provedores.php?modo=cad'),
(8, 6, 2, 'Manutenção', 1, 0, 'provedores.php?modo=lst'),
(11, 10, 1, 'Cadastro', 1, 0, 'grupos.php?modo=cad'),
(12, 10, 2, 'Manutenção', 1, 0, 'grupos.php?modo=lst'),
(14, 13, 1, 'Cadastro', 1, 0, 'planos.php?modo=cad'),
(15, 13, 2, 'Manutenção', 1, 0, 'planos.php?modo=lst'),
(17, 16, 1, 'Cadastro', 1, 0, 'contratos.php?modo=cad'),
(18, 16, 2, 'Manutenção', 1, 0, 'contratos.php?modo=lst'),
(21, 20, 1, 'Cadastro', 1, 0, 'contatos.php?modo=cad'),
(22, 20, 2, 'Manutenção', 1, 0, 'contatos.php?modo=lst'),
(25, 24, 1, 'Abrir Chamado', 1, 0, 'chamados.php?modo=cad'),
(26, 24, 2, 'Manutenção', 0, 0, 'chamados.php?modo=lst'),
(28, 27, 1, 'Cadastrar', 1, 0, 'cobrancas.php?modo=cad'),
(29, 27, 10, 'Períodos - Cadastrar', 1, 0, 'periodos.php?modo=cad'),
(30, 27, 11, 'Períodos - Manutenção', 1, 0, 'periodos.php?modo=lst'),
(31, 0, 1000, 'Logs', 1, 0, 'javascript:;'),
(32, 31, 1, 'SQL`s', 1, 0, 'logs.php?modo=sql'),
(33, 31, 2, 'Administrativo', 1, 0, 'logs.php?modo=admin'),
(34, 27, 2, 'Manutenção', 1, 0, 'cobrancas.php?modo=lst'),
(35, 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='grupos' AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `grupos`
--

INSERT INTO `grupos` (`id`, `nome_padrao`, `codigo`, `tipo`, `nome`, `endereco`, `numero`, `bairro`, `cep`, `cidade`, `uf`, `observacoes`, `datacadastro`) VALUES
(1, 'EdOdoni', '05', 1, 'Edifício Odoni', 'Av. Sete de Setembro', '3272', 'Centro', '80230-010', 'Curitiba', 'PR', '', '2007-11-19 10:20:51'),
(3, 'EdMarajo', '08', 1, 'Edifício Residencial Marajó', 'Rua Alferes Poli', '294', 'Centro', '80.230-090', 'Curitiba', 'PR', '', '2007-11-19 11:26:41'),
(4, 'EdRoma', '06', 1, 'Edifício Roma', 'Av. Sete de Setembro', '3293', 'Centro', '80.230-010', 'Curitiba', 'PR', '', '2008-01-28 19:35:15'),
(5, 'EdWashington', '04', 1, 'Edifício Comercial Washington', 'R. 24 de Maio', '262', 'Centro', '80230-080', 'Curitiba', 'PR', '', '2008-01-29 12:12:59'),
(6, 'EdBItibere', '03', 1, 'Condominio Residencial Brasilio Itiberê', 'Rua Brasílio Itiberê', '2455', 'Rebouças', '80230-050', 'Curitiba', 'PR', '', '2008-01-29 12:15:14'),
(7, 'EdLPinto', '02', 1, 'Edificio Residencial Lourenço Pinto', 'Rua Lourenço Pinto', '260', 'Centro', '80010160', 'Curitiba', 'PR', '', '2008-01-29 17:06:58'),
(8, 'EdAries', '09', 1, 'Condominio Residencial Aries', 'Avenida Nossa Senhora Aparecida', '501', 'Seminário', '80440000', 'Curitiba', 'PR', '', '2008-01-29 17:10:06'),
(9, 'Outros', '99', 99, 'Clientes Avulsos', '', '', '', '', '', 'PR', '', '2008-01-29 17:14:17'),
(10, 'Empresas', '00', 2, 'Clientes Empresarial', '', '', '', '', '', 'PR', 'Grupo de clientes empresarial.', '2008-01-29 17:40:31'),
(11, 'EdBCapanema', '51', 1, 'Condominio Residencial Barão de Capanema', '', '', 'Jardim Botânico', '', 'Curitiba', 'PR', '', '2008-01-31 15:25:45'),
(12, 'EdOrionis', '101', 1, 'Edifí­cio Residencial Orionis', 'R Marechal Otávio Saldanha Mazza', '7777', 'Pinheirinho', '81150060', 'Curitiba', 'PR', 'Tel portaria 3247-0879\r\n\r\nSindica Alexandra _tel esposo _ 9187 9082_', '2008-02-01 16:02:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos_tipos`
--

CREATE TABLE IF NOT EXISTS `grupos_tipos` (
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
-- Estrutura da tabela `logs_admin`
--

CREATE TABLE IF NOT EXISTS `logs_admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `login` varchar(20) collate latin1_general_ci NOT NULL,
  `mensagem` text collate latin1_general_ci NOT NULL,
  `query` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=630 ;

--
-- Extraindo dados da tabela `logs_admin`
--

INSERT INTO `logs_admin` (`id`, `login`, `mensagem`, `query`, `datacadastro`) VALUES
(1, 'sergio', 'Login', '', '2008-02-20 09:08:25'),
(2, 'sergio', 'Login', '', '2008-02-20 10:00:43'),
(3, 'sergio', 'Cadastro Cliente ID=108 Nome=Marcelo', '', '2008-02-20 10:04:01'),
(4, 'sergio', 'Alterado Cliente ID=80 Nome=Morgana', '', '2008-02-20 10:06:39'),
(5, 'sergio', 'Login', '', '2008-02-20 10:53:50'),
(6, 'sergio', 'Cadastro Cliente ID=109 Nome=GE Money', '', '2008-02-20 10:56:20'),
(7, 'sergio', 'Alterado Cliente ID=14 Nome=Simone Vivan', '', '2008-02-20 10:56:58'),
(8, 'sergio', 'Cadastro Cliente ID=110 Nome=Ricardo - PRT', '', '2008-02-20 11:00:31'),
(9, 'sergio', 'Cadastro Cliente ID=111 Nome=Mercador Fomento Mercantil LTDA.', '', '2008-02-20 11:03:31'),
(10, 'sergio', 'Alterado Cliente ID=43 Nome=Francisco C. T. Costa e Silva', '', '2008-02-20 11:04:51'),
(11, 'antonio', 'Login', '', '2008-02-20 11:21:12'),
(12, 'sergio', 'Cadastro Cliente ID=112 Nome=Fontoura e Silva Com. de Informática', '', '2008-02-20 11:21:55'),
(13, 'sergio', 'Cadastro Cliente ID=113 Nome=Paraná Despachante', '', '2008-02-20 11:25:23'),
(14, 'antonio', 'Logout', '', '2008-02-20 12:08:47'),
(15, 'antonio', 'Login', '', '2008-02-20 12:08:58'),
(16, 'antonio', 'Cadastro Cliente ID=114 Nome=Ivan de Oliveira Mota', '', '2008-02-20 12:13:22'),
(17, 'antonio', 'Alterado Cliente ID=85 Nome=José Carlos de Lima', '', '2008-02-20 12:17:34'),
(18, 'antonio', 'Alterado Cliente ID=14 Nome=Simone Vivan', '', '2008-02-20 12:18:25'),
(19, 'sergio', 'Cadastro Cliente ID=115 Nome=Federação Paranaense de Ginástica', '', '2008-02-20 12:58:41'),
(20, 'sergio', 'Alterado Cliente ID=105 Nome=Silvia Aparecida Pereira', '', '2008-02-20 13:00:26'),
(21, 'sergio', 'Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes', '', '2008-02-20 13:08:38'),
(22, 'sergio', 'Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro', '', '2008-02-20 13:09:54'),
(23, 'sergio', 'Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes', '', '2008-02-20 13:10:59'),
(24, 'sergio', 'Cadastro Cliente ID=116 Nome=Jonas', '', '2008-02-20 13:13:58'),
(25, 'sergio', 'Cadastro Cliente ID=117 Nome=BV Financeira - Daniel Moreira', '', '2008-02-01 13:16:27'),
(26, 'sergio', 'Cadastro Cliente ID=118 Nome=B2 Informática', '', '2008-02-01 13:17:54'),
(27, 'sergio', 'Cadastro Cliente ID=119 Nome=Antonia - Síndica', '', '2008-02-01 13:19:33'),
(28, 'sergio', 'Cadastro Cliente ID=120 Nome=Elenara Beatriz Fontana', '', '2008-02-01 13:25:11'),
(29, 'sergio', 'Login', '', '2008-02-01 17:25:28'),
(30, 'sergio', 'Login', '', '2008-02-23 11:47:28'),
(31, 'sergio', 'Login', '', '2008-02-27 11:16:27'),
(32, 'sergio', 'Login', '', '2008-02-27 11:40:22'),
(33, 'antonio', 'Login', '', '2008-02-27 11:59:38'),
(34, 'antonio', 'Alterado Cliente ID=106 Nome=Raphaela de Oliveira', '', '2008-02-27 15:36:09'),
(35, 'antonio', 'Logout', '', '2008-02-27 15:45:35'),
(36, 'antonio', 'Login', '', '2008-02-28 08:54:25'),
(37, 'antonio', 'Alterado Cliente ID=106 Nome=Rosina Helena dos Santos', '', '2008-02-28 08:58:13'),
(38, 'antonio', 'Alterado Cliente ID=106 Nome=Rosina Helena dos Santos', '', '2008-02-28 08:58:37'),
(39, 'antonio', 'Cadastro Cliente ID=121 Nome=Jeane Margarete Rucinski', '', '2008-02-28 09:01:13'),
(40, 'antonio', 'Alterado Cliente ID=106 Nome=Rosina Helena dos Santos', '', '2008-02-28 10:10:22'),
(41, 'antonio', 'Logout', '', '2008-02-28 10:19:59'),
(42, 'sergio', 'Login', '', '2008-03-01 17:03:31'),
(43, 'sergio', 'Alterado Cliente ID=93 Nome=Everson Edson do Prado', '', '2008-03-01 17:34:15'),
(44, 'sergio', 'Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro', '', '2008-03-01 17:35:47'),
(45, 'sergio', 'Alterado Cliente ID=39 Nome=Waldenira Pistori', '', '2008-03-01 17:37:21'),
(46, 'sergio', 'Alterado Cliente ID=20 Nome=Clelia Alice Marson', '', '2008-03-01 17:41:44'),
(47, 'sergio', 'Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra', '', '2008-03-01 17:43:54'),
(48, 'sergio', 'Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra', '', '2008-03-01 17:44:44'),
(49, 'sergio', 'Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes', '', '2008-03-01 17:46:22'),
(50, 'sergio', 'Alterado Cliente ID=116 Nome=Jonas', '', '2008-03-01 20:33:00'),
(51, 'sergio', 'Alterado Cliente ID=67 Nome=Katia Cristina Zardo', '', '2008-03-01 20:33:17'),
(52, 'sergio', 'Alterado Cliente ID=98 Nome=Adenir Farias', '', '2008-03-01 20:37:00'),
(53, 'sergio', 'Alterado Cliente ID=30 Nome=Daisy Mary Reichel', '', '2008-03-01 20:37:10'),
(54, 'sergio', 'Alterado Cliente ID=26 Nome=Jackson M. Nizer', '', '2008-03-01 20:37:18'),
(55, 'sergio', 'Alterado Cliente ID=29 Nome=Jhony Maciel Oliveira', '', '2008-03-01 20:37:29'),
(56, 'sergio', 'Alterado Cliente ID=75 Nome=Amanda Tieppo', '', '2008-03-01 20:38:08'),
(57, 'sergio', 'Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro', '', '2008-03-01 20:38:31'),
(58, 'sergio', 'Alterado Cliente ID=77 Nome=Fabiana Reis', '', '2008-03-01 20:38:39'),
(59, 'sergio', 'Cadastro Cliente ID=122 Nome=teste', '', '2008-03-01 20:45:09'),
(60, 'antonio', 'Login', '', '2008-03-03 09:50:21'),
(61, 'antonio', 'Login', '', '2008-03-04 00:34:03'),
(62, 'antonio', 'Logout', '', '2008-03-04 01:00:38'),
(63, 'antonio', 'Login', '', '2008-03-04 08:47:34'),
(64, 'sergio', 'Login', '', '2008-03-04 09:00:49'),
(65, 'antonio', 'Alterado Cliente ID=17 Nome=Robson Garcia Barbosa', '', '2008-03-04 10:43:49'),
(66, 'antonio', 'Alterado Cliente ID=71 Nome=Rita Helena Zimmermann', '', '2008-03-04 10:49:41'),
(67, 'antonio', 'Alterado Cliente ID=68 Nome=Rose Cristina Neves', '', '2008-03-04 11:10:17'),
(68, 'antonio', 'Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro', '', '2008-03-04 11:58:55'),
(69, 'antonio', 'Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro', '', '2008-03-04 12:13:26'),
(70, 'antonio', 'Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro', '', '2008-03-04 12:13:56'),
(71, 'antonio', 'Logout', '', '2008-03-05 00:28:43'),
(72, 'sergio', 'Login', '', '2008-03-05 08:34:28'),
(73, 'sergio', 'Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa', '', '2008-03-05 09:02:41'),
(74, 'sergio', 'Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa', '', '2008-03-05 09:06:22'),
(75, 'sergio', 'Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa', '', '2008-03-05 09:17:17'),
(76, 'sergio', 'Alterado Cliente ID=70 Nome=Leonardo Raupp Matta', '', '2008-03-05 09:22:19'),
(77, 'sergio', 'Alterado Cliente ID=59 Nome=Celso Amaral Poletti', '', '2008-03-05 09:37:18'),
(78, 'sergio', 'Alterado Cliente ID=66 Nome=Luana Aparecida Dias Mota', '', '2008-03-05 09:38:46'),
(79, 'sergio', 'Alterado Cliente ID=61 Nome=Matilde Alves da Cunha Silva', '', '2008-03-05 09:39:07'),
(80, 'sergio', 'Alterado Cliente ID=72 Nome=Mellina Franco Oliveira Canto', '', '2008-03-05 09:39:23'),
(81, 'sergio', 'Alterado Cliente ID=63 Nome=Natalia', '', '2008-03-05 09:39:36'),
(82, 'sergio', 'Alterado Cliente ID=63 Nome=Natalia', '', '2008-03-05 09:39:49'),
(83, 'sergio', 'Alterado Cliente ID=71 Nome=Rita Helena Zimmermann', '', '2008-03-05 09:40:20'),
(84, 'sergio', 'Alterado Cliente ID=64 Nome=Robson Roberto da Silva', '', '2008-03-05 09:40:49'),
(85, 'sergio', 'Alterado Cliente ID=76 Nome=Thiago Carli', '', '2008-03-05 09:41:05'),
(86, 'sergio', 'Alterado Cliente ID=62 Nome=Wallace Mendes Cordeiro', '', '2008-03-05 09:41:20'),
(87, 'sergio', 'Alterado Cliente ID=121 Nome=Jeane Margarete Rucinski', '', '2008-03-05 09:41:44'),
(88, 'sergio', 'Alterado Cliente ID=21 Nome=Iolanda Reis', '', '2008-03-05 09:42:07'),
(89, 'sergio', 'Alterado Cliente ID=69 Nome=George Galli', '', '2008-03-05 09:42:28'),
(90, 'sergio', 'Alterado Cliente ID=74 Nome=Fernando Cesar Alves da Silva', '', '2008-03-05 09:42:41'),
(91, 'sergio', 'Alterado Cliente ID=22 Nome=IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba', '', '2008-03-05 09:44:27'),
(92, 'sergio', 'Alterado Cliente ID=109 Nome=GE Money', '', '2008-03-05 09:44:53'),
(93, 'sergio', 'Alterado Cliente ID=113 Nome=Paraná Despachante', '', '2008-03-05 09:45:07'),
(94, 'sergio', 'Alterado Cliente ID=117 Nome=BV Financeira - Daniel Moreira', '', '2008-03-05 09:46:46'),
(95, 'sergio', 'Alterado Cliente ID=118 Nome=B2 Informática', '', '2008-03-05 09:51:53'),
(96, 'sergio', 'Alterado Cliente ID=15 Nome=Rebeca Garcia Martins', '', '2008-03-05 09:58:09'),
(97, 'sergio', 'Alterado Cliente ID=11 Nome=Mayara Cristina Garcia Machuca ', '', '2008-03-05 09:58:22'),
(98, 'antonio', 'Login', '', '2008-03-05 14:13:00'),
(99, 'antonio', 'Alterado Cliente ID=59 Nome=Celso Amaral Poletti', '', '2008-03-05 14:13:33'),
(100, 'antonio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-03-05 14:14:30'),
(101, 'antonio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-03-05 14:14:49'),
(102, 'antonio', 'Alterado Cliente ID=91 Nome=Adriano ', '', '2008-03-05 15:28:20'),
(103, 'antonio', 'Alterado Cliente ID=88 Nome=Anderson Augusto Fillus', '', '2008-03-05 15:28:30'),
(104, 'antonio', 'Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes', '', '2008-03-05 15:28:39'),
(105, 'antonio', 'Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski', '', '2008-03-05 15:28:48'),
(106, 'antonio', 'Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski', '', '2008-03-05 15:28:53'),
(107, 'antonio', 'Alterado Cliente ID=114 Nome=Ivan de Oliveira Mota', '', '2008-03-05 15:29:13'),
(108, 'antonio', 'Alterado Cliente ID=86 Nome=Ivana Rubio Colin', '', '2008-03-05 15:29:26'),
(109, 'antonio', 'Alterado Cliente ID=89 Nome=Jefferson Olinger de Souza', '', '2008-03-05 15:29:35'),
(110, 'antonio', 'Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua', '', '2008-03-05 15:59:16'),
(111, 'antonio', 'Alterado Cliente ID=55 Nome=COMPOR Arquitetura e Construção Ltda.', '', '2008-03-05 18:49:41'),
(112, 'antonio', 'Alterado Cliente ID=57 Nome=Djalma Jacinto da Silva Filho', '', '2008-03-05 18:49:52'),
(113, 'antonio', 'Alterado Cliente ID=56 Nome=Eliana Nascimento', '', '2008-03-05 18:50:03'),
(114, 'antonio', 'Alterado Cliente ID=58 Nome=Isabel Jacomel', '', '2008-03-05 18:50:12'),
(115, 'antonio', 'Alterado Cliente ID=53 Nome=Marisa Helena da Costa Serafin', '', '2008-03-05 18:50:20'),
(116, 'antonio', 'Alterado Cliente ID=54 Nome=Marisângela Pacheco Brittes', '', '2008-03-05 18:50:29'),
(117, 'antonio', 'Alterado Cliente ID=8 Nome=Daniel Hiroshi Nielsen Yabu', '', '2008-03-05 18:50:44'),
(118, 'antonio', 'Alterado Cliente ID=10 Nome=Felipe Augusto Kubis', '', '2008-03-05 18:50:54'),
(119, 'antonio', 'Alterado Cliente ID=12 Nome=Graciele Razera', '', '2008-03-05 18:51:02'),
(120, 'antonio', 'Alterado Cliente ID=16 Nome=Juliana Horta', '', '2008-03-05 18:51:10'),
(121, 'antonio', 'Alterado Cliente ID=13 Nome=Lucas Nunes da Silveira', '', '2008-03-05 18:51:18'),
(122, 'antonio', 'Alterado Cliente ID=9 Nome=Robson Lara Moreira', '', '2008-03-05 18:51:28'),
(123, 'antonio', 'Alterado Cliente ID=14 Nome=Simone Vivan', '', '2008-03-05 18:51:36'),
(124, 'antonio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-03-05 18:51:44'),
(125, 'antonio', 'Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua', '', '2008-03-05 18:52:09'),
(126, 'antonio', 'Alterado Cliente ID=42 Nome=ACC Aduditoria Contabil S/C Ltda.', '', '2008-03-05 18:53:01'),
(127, 'antonio', 'Alterado Cliente ID=45 Nome=Carlos Eduardo', '', '2008-03-05 18:53:11'),
(128, 'antonio', 'Alterado Cliente ID=49 Nome=DIVALPAR Participação Societária Ltda.', '', '2008-03-05 18:53:20'),
(129, 'antonio', 'Alterado Cliente ID=52 Nome=EPRON Serviço de Informática S/C Ltda.', '', '2008-03-05 18:53:29'),
(130, 'antonio', 'Alterado Cliente ID=43 Nome=Francisco C. T. Costa e Silva', '', '2008-03-05 18:53:45'),
(131, 'antonio', 'Alterado Cliente ID=51 Nome=Olimpus Agência de Viagem e Turismo Ltda.', '', '2008-03-05 18:53:54'),
(132, 'antonio', 'Alterado Cliente ID=48 Nome=R. Huczok Consulting Ltda.', '', '2008-03-05 18:54:14'),
(133, 'antonio', 'Alterado Cliente ID=50 Nome=Rogoski & Soares C. A. Elet. Ltda.', '', '2008-03-05 18:54:25'),
(134, 'antonio', 'Alterado Cliente ID=46 Nome=Saulo Souza e Silva', '', '2008-03-05 18:54:32'),
(135, 'antonio', 'Alterado Cliente ID=44 Nome=Sonia Maria Bressan ', '', '2008-03-05 18:54:40'),
(136, 'antonio', 'Alterado Cliente ID=47 Nome=Ursula', '', '2008-03-05 18:54:49'),
(137, 'antonio', 'Alterado Cliente ID=41 Nome=Vanildo', '', '2008-03-05 18:54:57'),
(138, 'antonio', 'Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva', '', '2008-03-05 18:55:14'),
(139, 'antonio', 'Alterado Cliente ID=35 Nome=Ana Elisa Macagnan', '', '2008-03-05 18:55:23'),
(140, 'antonio', 'Alterado Cliente ID=33 Nome=Bernhard Zanker Junior', '', '2008-03-05 18:55:32'),
(141, 'antonio', 'Alterado Cliente ID=40 Nome=Clayton Cezar Upitis Marloch', '', '2008-03-05 18:55:40'),
(142, 'antonio', 'Alterado Cliente ID=20 Nome=Clelia Alice Marson', '', '2008-03-05 18:55:53'),
(143, 'antonio', 'Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva', '', '2008-03-05 18:56:29'),
(144, 'antonio', 'Alterado Cliente ID=34 Nome=Edison Carlos dos Santos', '', '2008-03-05 18:56:43'),
(145, 'antonio', 'Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra', '', '2008-03-05 18:56:52'),
(146, 'antonio', 'Alterado Cliente ID=36 Nome=Fernando Henrique Tremel Bueno', '', '2008-03-05 18:57:03'),
(147, 'antonio', 'Alterado Cliente ID=31 Nome=Luciana Osorio Cavalli', '', '2008-03-05 18:57:14'),
(148, 'antonio', 'Alterado Cliente ID=39 Nome=Waldenira Pistori', '', '2008-03-05 18:57:23'),
(149, 'antonio', 'Alterado Cliente ID=32 Nome=Zenildo Costa', '', '2008-03-05 18:57:34'),
(150, 'antonio', 'Alterado Cliente ID=28 Nome=Sergio Vivan', '', '2008-03-05 18:58:02'),
(151, 'antonio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-03-05 18:58:12'),
(152, 'antonio', 'Alterado Cliente ID=27 Nome=Jorge Gonçalves dos Santos', '', '2008-03-05 18:58:26'),
(153, 'antonio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-03-05 18:58:38'),
(154, 'antonio', 'Alterado Cliente ID=114 Nome=Ivan de Oliveira Mota', '', '2008-03-05 18:59:07'),
(155, 'antonio', 'Alterado Cliente ID=82 Nome=João Arnaldo de Oliveira', '', '2008-03-05 18:59:22'),
(156, 'antonio', 'Alterado Cliente ID=90 Nome=José Carlos', '', '2008-03-05 18:59:31'),
(157, 'antonio', 'Alterado Cliente ID=85 Nome=José Carlos de Lima', '', '2008-03-05 18:59:40'),
(158, 'antonio', 'Alterado Cliente ID=87 Nome=José Carvalho Filho', '', '2008-03-05 18:59:50'),
(159, 'antonio', 'Alterado Cliente ID=78 Nome=Katia Regina Schmeiske', '', '2008-03-05 18:59:59'),
(160, 'antonio', 'Alterado Cliente ID=80 Nome=Morgana', '', '2008-03-05 19:00:08'),
(161, 'antonio', 'Alterado Cliente ID=84 Nome=Sonia Aparecida Estevan Costa ', '', '2008-03-05 19:00:15'),
(162, 'antonio', 'Alterado Cliente ID=81 Nome=Thais Cristina Sentone Mota', '', '2008-03-05 19:00:23'),
(163, 'antonio', 'Alterado Cliente ID=80 Nome=Morgana', '', '2008-03-05 19:03:15'),
(164, 'antonio', 'Logout', '', '2008-03-05 20:56:41'),
(165, 'antonio', 'Login', '', '2008-03-06 13:13:24'),
(166, 'antonio', 'Alterado Cliente ID=80 Nome=Morgana Biron', '', '2008-03-06 13:15:07'),
(167, 'antonio', 'Alterado Cliente ID=100 Nome=Antonio dos Santos Bicalho', '', '2008-03-06 13:25:08'),
(168, 'antonio', 'Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves', '', '2008-03-06 13:25:16'),
(169, 'antonio', 'Alterado Cliente ID=96 Nome=Dievert Fernando de Campos', '', '2008-03-06 13:25:24'),
(170, 'antonio', 'Alterado Cliente ID=93 Nome=Everson Edson do Prado', '', '2008-03-06 13:25:34'),
(171, 'antonio', 'Alterado Cliente ID=97 Nome=Luiz Eduardo Lasszck', '', '2008-03-06 13:25:47'),
(172, 'antonio', 'Alterado Cliente ID=108 Nome=Marcelo', '', '2008-03-06 13:25:56'),
(173, 'antonio', 'Alterado Cliente ID=95 Nome=Nilo Navarri', '', '2008-03-06 13:26:04'),
(174, 'antonio', 'Alterado Cliente ID=107 Nome=Robson Sandro Santos', '', '2008-03-06 13:26:15'),
(175, 'antonio', 'Alterado Cliente ID=106 Nome=Rosina Helena dos Santos', '', '2008-03-06 13:26:26'),
(176, 'antonio', 'Alterado Cliente ID=104 Nome=Shirley Cristiane M. de Souza', '', '2008-03-06 13:26:35'),
(177, 'antonio', 'Alterado Cliente ID=105 Nome=Silvia Aparecida Pereira', '', '2008-03-06 13:26:44'),
(178, 'antonio', 'Alterado Cliente ID=101 Nome=Sueli Costa Luvison', '', '2008-03-06 13:26:51'),
(179, 'antonio', 'Alterado Cliente ID=94 Nome=Valdemir Antonio Rovares', '', '2008-03-06 13:26:59'),
(180, 'antonio', 'Alterado Cliente ID=99 Nome=Valdir Modest de Oliveira', '', '2008-03-06 13:27:08'),
(181, 'antonio', 'Alterado Cliente ID=103 Nome=Vanderlei Souza', '', '2008-03-06 13:27:16'),
(182, 'antonio', 'Cadastro Cliente ID=123 Nome=Marcelo Luiz Velter', '', '2008-03-06 13:29:14'),
(183, 'antonio', 'Cadastro Cliente ID=124 Nome=José Carlos Cardoso Ajala', '', '2008-03-06 13:31:20'),
(184, 'antonio', 'Alterado Cliente ID=108 Nome=Marcelo', '', '2008-03-06 13:32:02'),
(185, 'antonio', 'Logout', '', '2008-03-06 17:02:58'),
(186, 'sergio', 'Login', '', '2008-03-07 09:15:42'),
(187, 'antonio', 'Login', '', '2008-03-07 11:10:03'),
(188, 'sergio', 'Login', '', '2008-03-07 11:17:47'),
(189, 'antonio', 'Login', '', '2008-03-07 11:30:12'),
(190, 'antonio', 'Cadastro Cliente ID=125 Nome=Sidnei Scaravonatti', '', '2008-03-07 11:33:32'),
(191, 'sergio', 'Login', '', '2008-03-08 10:20:55'),
(192, 'sergio', 'Login', '', '2008-03-08 15:38:25'),
(193, 'sergio', 'Alterado Cliente ID=60 Nome=Claiton Estacionamento', '', '2008-03-08 17:50:28'),
(194, 'sergio', 'Login', '', '2008-03-10 10:40:11'),
(195, 'sergio', 'Login', '', '2008-03-10 10:55:14'),
(196, 'antonio', 'Login', '', '2008-03-10 13:54:52'),
(197, 'sergio', 'Login', '', '2008-03-11 09:35:35'),
(198, 'antonio', 'Login', '', '2008-03-11 13:33:45'),
(199, 'antonio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-03-11 13:34:31'),
(200, 'antonio', 'Alterado Cliente ID=56 Nome=Eliana Nascimento', '', '2008-03-11 13:46:53'),
(201, 'antonio', 'Cadastro Cliente ID=126 Nome=João Marcos Ferreira Damaceno', '', '2008-03-11 13:55:45'),
(202, 'antonio', 'Alterado Cliente ID=59 Nome=Celso Amaral Poletti', '', '2008-03-11 13:58:30'),
(203, 'antonio', 'Alterado Cliente ID=60 Nome=Claiton Estacionamento', '', '2008-03-11 14:00:55'),
(204, 'antonio', 'Alterado Cliente ID=9 Nome=Robson Lara Moreira', '', '2008-03-11 14:04:28'),
(205, 'antonio', 'Alterado Cliente ID=12 Nome=Graciele Razera', '', '2008-03-11 14:07:34'),
(206, 'antonio', 'Alterado Cliente ID=13 Nome=Lucas Nunes da Silveira', '', '2008-03-11 14:10:09'),
(207, 'antonio', 'Alterado Cliente ID=16 Nome=Juliana Horta', '', '2008-03-11 14:13:02'),
(208, 'antonio', 'Alterado Cliente ID=17 Nome=Robson Garcia Barbosa', '', '2008-03-11 14:21:06'),
(209, 'antonio', 'Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua', '', '2008-03-11 14:26:54'),
(210, 'antonio', 'Alterado Cliente ID=70 Nome=Leonardo Raupp Matta', '', '2008-03-11 14:36:02'),
(211, 'antonio', 'Alterado Cliente ID=72 Nome=Mellina Franco Oliveira Canto', '', '2008-03-11 14:39:00'),
(212, 'antonio', 'Alterado Cliente ID=35 Nome=Ana Elisa Macagnan', '', '2008-03-11 14:44:44'),
(213, 'antonio', 'Alterado Cliente ID=39 Nome=Waldenira Pistori', '', '2008-03-11 14:50:11'),
(214, 'antonio', 'Alterado Cliente ID=95 Nome=Nilo Navarri', '', '2008-03-11 15:07:46'),
(215, 'antonio', 'Alterado Cliente ID=94 Nome=Valdemir Antonio Rovares', '', '2008-03-11 15:09:06'),
(216, 'antonio', 'Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski', '', '2008-03-11 15:44:32'),
(217, 'antonio', 'Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski', '', '2008-03-11 15:45:06'),
(218, 'antonio', 'Alterado Cliente ID=85 Nome=José Carlos de Lima', '', '2008-03-11 15:50:58'),
(219, 'antonio', 'Alterado Cliente ID=85 Nome=José Carlos de Lima', '', '2008-03-11 15:51:39'),
(220, 'antonio', 'Alterado Cliente ID=90 Nome=José Carlos', '', '2008-03-11 16:03:56'),
(221, 'antonio', 'Alterado Cliente ID=91 Nome=Adriano de Araujo Schampovski', '', '2008-03-11 16:17:10'),
(222, 'antonio', 'Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski', '', '2008-03-11 16:29:31'),
(223, 'antonio', 'Alterado Cliente ID=95 Nome=Nilo Ravazzi', '', '2008-03-11 16:38:50'),
(224, 'antonio', 'Logout', '', '2008-03-11 23:52:21'),
(225, 'antonio', 'Login', '', '2008-03-11 23:52:29'),
(226, 'antonio', 'Logout', '', '2008-03-11 23:53:44'),
(227, 'antonio', 'Login', '', '2008-03-12 13:10:11'),
(228, 'antonio', 'Cadastro Cliente ID=127 Nome=Juliana Aparecida Rosty de Anhaia Cesar', '', '2008-03-12 13:13:48'),
(229, 'antonio', 'Logout', '', '2008-03-12 15:36:31'),
(230, 'antonio', 'Login', '', '2008-03-12 15:38:23'),
(231, 'antonio', 'Logout', '', '2008-03-12 15:52:16'),
(232, 'antonio', 'Login', '', '2008-03-12 18:30:48'),
(233, 'sergio', 'Login', '', '2008-03-13 08:40:06'),
(234, 'sergio', 'Login', '', '2008-03-13 08:56:10'),
(235, 'sergio', 'Alterado Cliente ID=59 Nome=Celso Amaral Poletti', '', '2008-03-13 10:49:43'),
(236, 'sergio', 'Alterado Cliente ID=115 Nome=Federação Paranaense de Ginástica', '', '2008-03-13 10:52:51'),
(237, 'antonio', 'Login', '', '2008-03-13 12:49:39'),
(238, 'antonio', 'Logout', '', '2008-03-13 13:34:54'),
(239, 'antonio', 'Login', '', '2008-03-13 18:01:14'),
(240, 'antonio', 'Logout', '', '2008-03-13 18:22:14'),
(241, 'antonio', 'Login', '', '2008-03-13 18:29:26'),
(242, 'antonio', 'Logout', '', '2008-03-13 18:30:54'),
(243, 'antonio', 'Login', '', '2008-03-13 19:44:17'),
(244, 'antonio', 'Alterado Cliente ID=15 Nome=Rebeca Garcia Martins', '', '2008-03-13 19:45:53'),
(245, 'antonio', 'Logout', '', '2008-03-13 23:33:59'),
(246, 'antonio', 'Login', '', '2008-03-14 08:48:38'),
(247, 'antonio', 'Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves', '', '2008-03-14 09:08:42'),
(248, 'antonio', 'Alterado Cliente ID=104 Nome=Shirley Cristiane M. de Souza', '', '2008-03-14 09:17:56'),
(249, 'antonio', 'Alterado Cliente ID=97 Nome=Luiz Eduardo Lasszck', '', '2008-03-14 09:23:36'),
(250, 'sergio', 'Login', '', '2008-03-14 09:24:24'),
(251, 'sergio', 'Login', '', '2008-03-14 11:22:27'),
(252, 'sergio', 'Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra', '', '2008-03-14 11:23:47'),
(253, 'sergio', 'Alterado Cliente ID=45 Nome=Carlos Eduardo', '', '2008-03-14 11:37:35'),
(254, 'antonio', 'Login', '', '2008-03-15 10:33:20'),
(255, 'sergio', 'Login', '', '2008-03-15 10:36:31'),
(256, 'antonio', 'Cadastro Cliente ID=128 Nome=Caio Ruocco de Arruda', '', '2008-03-15 10:37:44'),
(257, 'sergio', 'Login', '', '2008-03-15 10:59:08'),
(258, 'antonio', 'Alterado Cliente ID=128 Nome=Caio Ruocco de Arruda', '', '2008-03-15 11:07:33'),
(259, 'sergio', 'Alterado Cliente ID=18 Nome=Oscar Ricardo Macedo Schmeiske', '', '2008-03-15 11:43:27'),
(260, 'antonio', 'Login', '', '2008-03-15 12:55:18'),
(261, 'sergio', 'Login', '', '2008-03-15 12:59:34'),
(262, 'antonio', 'Cadastro Cliente ID=129 Nome=Ines Eline Lopes Martins', '', '2008-03-15 13:06:53'),
(263, 'antonio', 'Alterado Cliente ID=129 Nome=Ines Eline Lopes Martins', '', '2008-03-15 13:07:47'),
(264, 'antonio', 'Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves', '', '2008-03-15 17:07:09'),
(265, 'antonio', 'Alterado Cliente ID=125 Nome=Sidnei Scaravonatti', '', '2008-03-15 17:40:54'),
(266, 'sergio', 'Alterado Cliente ID=118 Nome=', '', '2008-03-15 17:42:13'),
(267, 'sergio', 'Alterado Cliente ID=117 Nome=', '', '2008-03-15 17:46:35'),
(268, 'sergio', 'Alterado Cliente ID=111 Nome=', '', '2008-03-15 17:57:46'),
(269, 'sergio', 'Alterado Cliente ID=112 Nome=', '', '2008-03-15 17:58:24'),
(270, 'antonio', 'Login', '', '2008-03-17 10:36:37'),
(271, 'sergio', 'Login', '', '2008-03-17 10:38:57'),
(272, 'antonio', 'Login', '', '2008-03-18 09:08:59'),
(273, 'antonio', 'Logout', '', '2008-03-18 19:16:40'),
(274, 'antonio', 'Login', '', '2008-03-19 10:41:03'),
(275, 'antonio', 'Logout', '', '2008-03-19 17:57:24'),
(276, 'sergio', 'Login', '', '2008-03-20 11:47:46'),
(277, 'antonio', 'Login', '', '2008-03-24 12:19:45'),
(278, 'sergio', 'Login', '', '2008-03-25 12:00:58'),
(279, 'antonio', 'Login', '', '2008-03-25 15:24:07'),
(280, 'antonio', 'Login', '', '2008-03-26 15:16:44'),
(281, 'antonio', 'Alterado Cliente ID=88 Nome=Anderson Augusto Fillus', '', '2008-03-26 15:39:49'),
(282, 'antonio', 'Alterado Cliente ID=12 Nome=Graciele Razera', '', '2008-03-26 16:48:51'),
(283, 'antonio', 'Login', '', '2008-03-28 11:16:11'),
(284, 'antonio', 'Alterado Cliente ID=31 Nome=Luciana Osorio Cavalli', '', '2008-03-28 11:18:47'),
(285, 'antonio', 'Alterado Cliente ID=31 Nome=Luciana Osorio Cavalli', '', '2008-03-28 11:20:06'),
(286, 'antonio', 'Alterado Cliente ID=31 Nome=Luciana Osorio Cavalli', '', '2008-03-28 11:25:24'),
(287, 'sergio', 'Login', '', '2008-03-29 12:11:54'),
(288, 'antonio', 'Login', '', '2008-03-31 15:00:31'),
(289, 'antonio', 'Login', '', '2008-04-01 15:06:46'),
(290, 'antonio', 'Login', '', '2008-04-02 12:17:52'),
(291, 'antonio', 'Logout', '', '2008-04-02 18:35:52'),
(292, 'antonio', 'Login', '', '2008-04-03 15:41:51'),
(293, 'antonio', 'Logout', '', '2008-04-03 15:41:54'),
(294, 'antonio', 'Login', '', '2008-04-05 16:40:12'),
(295, 'antonio', 'Login', '', '2008-04-06 14:58:02'),
(296, 'sergio', 'Login', '', '2008-04-06 15:13:39'),
(297, 'antonio', 'Login', '', '2008-04-06 15:57:59'),
(298, 'antonio', 'Login', '', '2008-04-07 10:10:02'),
(299, 'antonio', 'Alterado Cliente ID=49 Nome=DIVALPAR Participação Societária Ltda.', '', '2008-04-07 10:11:40'),
(300, 'antonio', 'Login', '', '2008-04-07 14:29:42'),
(301, 'antonio', 'Alterado Cliente ID=107 Nome=Robson Sandro Santos', '', '2008-04-07 18:12:20'),
(302, 'antonio', 'Alterado Cliente ID=45 Nome=Carlos Eduardo', '', '2008-04-07 18:14:53'),
(303, 'sergio', 'Login', '', '2008-04-08 11:18:10'),
(304, 'sergio', 'Login', '', '2008-04-08 12:16:24'),
(305, 'sergio', 'Login', '', '2008-04-09 09:04:25'),
(306, 'antonio', 'Login', '', '2008-04-09 11:34:22'),
(307, 'antonio', 'Login', '', '2008-04-11 09:46:10'),
(308, 'antonio', 'Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua', '', '2008-04-11 11:16:21'),
(309, 'antonio', 'Login', '', '2008-04-15 12:09:21'),
(310, 'antonio', 'Alterado Cliente ID=15 Nome=Rebeca Garcia Martins', '', '2008-04-15 12:27:23'),
(311, 'antonio', 'Alterado Cliente ID=67 Nome=Katia Cristina Zardo', '', '2008-04-15 13:08:13'),
(312, 'antonio', 'Alterado Cliente ID=67 Nome=Katia Cristina Zardo', '', '2008-04-15 13:09:58'),
(313, 'antonio', 'Alterado Cliente ID=67 Nome=Katia Cristina Zardo', '', '2008-04-15 13:18:29'),
(314, 'antonio', 'Alterado Cliente ID=71 Nome=Rita Helena Zimmermann', '', '2008-04-15 13:54:40'),
(315, 'antonio', 'Alterado Cliente ID=71 Nome=Rita Helena Zimmermann', '', '2008-04-15 14:03:05'),
(316, 'antonio', 'Alterado Cliente ID=39 Nome=Waldenira Pistori', '', '2008-04-15 14:20:08'),
(317, 'antonio', 'Alterado Cliente ID=39 Nome=Waldenira Pistori', '', '2008-04-15 14:29:36'),
(318, 'antonio', 'Alterado Cliente ID=84 Nome=Sonia Aparecida Estevan Costa ', '', '2008-04-15 15:06:53'),
(319, 'antonio', 'Alterado Cliente ID=84 Nome=Sonia Aparecida Estevan Costa ', '', '2008-04-15 15:11:02'),
(320, 'antonio', 'Logout', '', '2008-04-15 15:55:26'),
(321, 'antonio', 'Login', '', '2008-04-16 20:32:22'),
(322, 'antonio', 'Login', '', '2008-04-17 12:09:24'),
(323, 'antonio', 'Login', '', '2008-04-18 12:05:58'),
(324, 'sergio', 'Login', '', '2008-04-29 08:48:02'),
(325, 'sergio', 'Login', '', '2008-04-30 09:11:35'),
(326, 'antonio', 'Login', '', '2008-04-30 12:42:56'),
(327, 'antonio', 'Logout', '', '2008-04-30 18:22:05'),
(328, 'sergio', 'Login', '', '2008-05-02 09:19:50'),
(329, 'sergio', 'Login', '', '2008-05-02 15:04:20'),
(330, 'antonio', 'Login', '', '2008-05-02 15:20:45'),
(331, 'antonio', 'Alterado Cliente ID=54 Nome=Marisï¿½ngela Pacheco Brittes', '', '2008-05-02 16:54:10'),
(332, 'antonio', 'Login', '', '2008-05-03 16:33:50'),
(333, 'antonio', 'Login', '', '2008-05-04 13:01:18'),
(334, 'antonio', 'Alterado Cliente ID=8 Nome=Daniel Hiroshi Nielsen Yabu', '', '2008-05-04 13:03:14'),
(335, 'antonio', 'Alterado Cliente ID=12 Nome=Graciele Razera', '', '2008-05-04 13:05:16'),
(336, 'sergio', 'Login', '', '2008-05-05 09:28:52'),
(337, 'antonio', 'Login', '', '2008-05-05 10:22:18'),
(338, 'sergio', 'Login', '', '2008-05-05 10:38:46'),
(339, 'sergio', 'Login', '', '2008-05-05 11:41:29'),
(340, 'sergio', 'Login', '', '2008-05-06 10:30:19'),
(341, 'sergio', 'Login', '', '2008-05-07 09:33:21'),
(342, 'antonio', 'Login', '', '2008-05-08 14:03:40'),
(343, 'antonio', 'Cadastro Cliente ID=130 Nome=Darlan Schneider', '', '2008-05-08 14:05:41'),
(344, 'antonio', 'Alterado Cliente ID=130 Nome=Darlan Schneider', '', '2008-05-08 14:06:32'),
(345, 'antonio', 'Alterado Cliente ID=130 Nome=Darlan Schneider', '', '2008-05-08 16:05:54'),
(346, 'sergio', 'Login', '', '2008-05-12 10:45:06'),
(347, 'sergio', 'Login', '', '2008-05-13 09:18:05'),
(348, 'antonio', 'Login', '', '2008-05-15 09:21:17'),
(349, 'antonio', 'Cadastro Cliente ID=131 Nome=ELDER SHIGUEMATSU', '', '2008-05-15 09:24:07'),
(350, 'antonio', 'Login', '', '2008-05-15 10:26:24'),
(351, 'antonio', 'Alterado Cliente ID=13 Nome=Lucas Nunes da Silveira', '', '2008-05-15 17:26:35'),
(352, 'antonio', 'Login', '', '2008-05-17 16:25:17'),
(353, 'antonio', 'Login', '', '2008-05-20 09:22:41'),
(354, 'antonio', 'Alterado Cliente ID=75 Nome=Amanda Tieppo', '', '2008-05-20 09:41:38'),
(355, 'antonio', 'Alterado Cliente ID=88 Nome=Anderson Augusto Fillus', '', '2008-05-20 09:46:18'),
(356, 'antonio', 'Alterado Cliente ID=88 Nome=Anderson Augusto Fillus', '', '2008-05-20 09:51:17'),
(357, 'antonio', 'Alterado Cliente ID=95 Nome=Nilo Ravazzi', '', '2008-05-20 10:11:50'),
(358, 'antonio', 'Logout', '', '2008-05-20 10:14:12'),
(359, 'antonio', 'Login', '', '2008-05-23 10:23:32'),
(360, 'antonio', 'Alterado Cliente ID=54 Nome=Marisï¿½ngela Pacheco Brittes', '', '2008-05-23 10:27:20'),
(361, 'antonio', 'Alterado Cliente ID=54 Nome=Marisï¿½ngela Pacheco Brittes', '', '2008-05-23 10:29:55'),
(362, 'antonio', 'Logout', '', '2008-05-23 10:31:46'),
(363, 'antonio', 'Login', '', '2008-05-24 12:13:16'),
(364, 'antonio', 'Alterado Cliente ID=45 Nome=Carlos Eduardo', '', '2008-05-24 12:22:51'),
(365, 'smart', 'Login', '', '2008-05-26 20:53:08'),
(366, 'smart', 'Logout', '', '2008-05-26 20:56:50'),
(367, 'smart', 'Login', '', '2008-05-27 09:39:15'),
(368, 'smart', 'Logout', '', '2008-05-27 09:39:41'),
(369, 'antonio', 'Login', '', '2008-05-27 09:39:49'),
(370, 'sergio', 'Login', '', '2008-05-29 10:27:37'),
(371, 'smart', 'Login', '', '2008-05-29 19:06:24'),
(372, 'smart', 'Alterado Cliente ID=9 Nome=Robson Lara Moreira', '', '2008-05-29 19:41:10'),
(373, 'smart', 'Logout', '', '2008-05-29 19:42:06'),
(374, 'smart', 'Login', '', '2008-05-31 19:23:53'),
(375, 'smart', 'Logout', '', '2008-05-31 19:37:10'),
(376, 'smart', 'Login', '', '2008-05-31 19:52:19'),
(377, 'smart', 'Login', '', '2008-05-31 20:51:45'),
(378, 'smart', 'Alterado Cliente ID=82 Nome=João Arnaldo de Oliveira', '', '2008-05-31 20:53:29'),
(379, 'smart', 'Login', '', '2008-06-01 13:32:11'),
(380, 'smart', 'Alterado Cliente ID=131 Nome=ELDER SHIGUEMATSU', '', '2008-06-01 13:33:21'),
(381, 'sergio', 'Login', '', '2008-06-03 09:04:14'),
(382, 'sergio', 'Login', '', '2008-06-03 18:15:46'),
(383, 'sergio', 'Login', '', '2008-06-03 18:21:32'),
(384, 'sergio', 'Login', '', '2008-06-05 08:19:52'),
(385, 'sergio', 'Login', '', '2008-06-05 10:06:43'),
(386, 'sergio', 'Login', '', '2008-06-06 08:47:41'),
(387, 'sergio', 'Logout', '', '2008-06-06 09:51:39'),
(388, 'sergio', 'Login', '', '2008-06-06 09:51:45'),
(389, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 11:57:36'),
(390, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 12:00:49'),
(391, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 12:01:21'),
(392, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 12:01:40'),
(393, 'sergio', 'Login', '', '2008-06-06 16:26:14'),
(394, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:02:27'),
(395, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:10:19'),
(396, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:10:35'),
(397, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:11:56'),
(398, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:12:17'),
(399, 'sergio', 'Cadastro Cliente ID=132 Nome=1 teste qualquer', '', '2008-06-06 17:14:21'),
(400, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:31:12'),
(401, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:31:46'),
(402, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:32:57'),
(403, 'sergio', 'Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda', '', '2008-06-06 17:42:14'),
(404, 'sergio', 'Alterado Cliente ID=132 Nome=1 teste qualquer', '', '2008-06-06 17:44:33'),
(405, 'sergio', 'Alterado Cliente ID=132 Nome=1 teste qualquer', '', '2008-06-06 17:45:49'),
(406, 'sergio', 'Alterado Cliente ID=132 Nome=1 teste qualquer qualquer mesmo', '', '2008-06-06 17:46:10'),
(407, 'sergio', 'Alterado Cliente ID=132 Nome=1 teste qualquer qualquer mesmo', '', '2008-06-06 17:47:55'),
(408, 'sergio', 'Alterado Cliente ID=132 Nome=1 teste qualquer qualquer mesmo', '', '2008-06-06 17:50:23'),
(409, 'sergio', 'Alterado Cliente ID=132 Nome=1 teste qualquer qualquer mesmo', '', '2008-06-06 17:50:41'),
(410, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:13:25'),
(411, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:14:00'),
(412, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:16:28'),
(413, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:18:48'),
(414, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:20:22'),
(415, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:20:32'),
(416, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:22:08'),
(417, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:22:15'),
(418, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:26:29'),
(419, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:27:10'),
(420, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:27:42'),
(421, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:28:53'),
(422, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:30:16'),
(423, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:30:38'),
(424, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:32:55'),
(425, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:34:28'),
(426, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:34:58'),
(427, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:37:10'),
(428, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:37:35'),
(429, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:38:34'),
(430, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:39:38'),
(431, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:39:49'),
(432, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:40:08'),
(433, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:41:09'),
(434, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:43:27'),
(435, 'smart', 'Login', '', '2008-06-06 18:44:11'),
(436, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:47:37'),
(437, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:48:21'),
(438, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:48:34'),
(439, 'sergio', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:48:43'),
(440, 'smart', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:49:43'),
(441, 'smart', 'Alterado Cliente ID=7 Nome=Tulio Hofmann Filho', '', '2008-06-06 18:49:56'),
(442, 'sergio', 'Login', '', '2008-06-09 09:42:18'),
(443, 'sergio', 'Alterado Cliente ID=111 Nome=', '', '2008-06-09 09:47:27'),
(444, 'sergio', 'Alterado Cliente ID=111 Nome=', '', '2008-06-09 09:49:13'),
(445, 'sergio', 'Alterado Cliente ID=111 Nome=', '', '2008-06-09 09:49:18'),
(446, 'sergio', 'Alterado Cliente ID=111 Nome=', '', '2008-06-09 09:49:52'),
(447, 'sergio', 'Alterado Cliente ID=112 Nome=', '', '2008-06-09 09:50:28'),
(448, 'sergio', 'Alterado Cliente ID=117 Nome=', '', '2008-06-09 09:50:42'),
(449, 'sergio', 'Alterado Cliente ID=118 Nome=', '', '2008-06-09 09:50:57'),
(450, 'sergio', 'Alterado Cliente ID=115 Nome=', '', '2008-06-09 09:52:12'),
(451, 'sergio', 'Alterado Cliente ID=109 Nome=', '', '2008-06-09 09:52:37'),
(452, 'sergio', 'Alterado Cliente ID=109 Nome=', '', '2008-06-09 09:52:47'),
(453, 'sergio', 'Alterado Cliente ID=22 Nome=', '', '2008-06-09 09:53:19'),
(454, 'sergio', 'Alterado Cliente ID=113 Nome=', '', '2008-06-09 09:53:33'),
(455, 'sergio', 'Alterado Cliente ID=48 Nome=', '', '2008-06-09 10:01:31'),
(456, 'sergio', 'Login', '', '2008-06-09 10:34:14'),
(457, 'sergio', 'Alterado Cliente ID=49 Nome=', '', '2008-06-09 10:40:40'),
(458, 'sergio', 'Alterado Cliente ID=42 Nome=', '', '2008-06-09 10:41:48'),
(459, 'sergio', 'Alterado Cliente ID=52 Nome=', '', '2008-06-09 10:42:04'),
(460, 'sergio', 'Alterado Cliente ID=51 Nome=', '', '2008-06-09 10:42:13'),
(461, 'sergio', 'Alterado Cliente ID=50 Nome=', '', '2008-06-09 10:42:27'),
(462, 'smart', 'Login', '', '2008-06-09 13:14:20'),
(463, 'sergio', 'Login', '', '2008-06-10 09:32:08'),
(464, 'sergio', 'Alterado Cliente ID=29 Nome=Jhony Maciel Oliveira', '', '2008-06-10 10:18:09'),
(465, 'sergio', 'Alterado Cliente ID=30 Nome=Daisy Mary Reichel', '', '2008-06-10 10:18:42'),
(466, 'sergio', 'Alterado Cliente ID=26 Nome=Jackson M. Nizer', '', '2008-06-10 10:19:03'),
(467, 'sergio', 'Alterado Cliente ID=45 Nome=Carlos Eduardo', '', '2008-06-10 10:20:01'),
(468, 'sergio', 'Alterado Cliente ID=45 Nome=Carlos Eduardo', '', '2008-06-10 10:20:23'),
(469, 'sergio', 'Alterado Cliente ID=75 Nome=Amanda Tieppo', '', '2008-06-10 10:21:01'),
(470, 'sergio', 'Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro', '', '2008-06-10 10:22:27'),
(471, 'sergio', 'Alterado Cliente ID=116 Nome=Jonas', '', '2008-06-10 10:23:13'),
(472, 'sergio', 'Alterado Cliente ID=98 Nome=Adenir Farias', '', '2008-06-10 10:23:49'),
(473, 'sergio', 'Alterado Cliente ID=17 Nome=Robson Garcia Barbosa', '', '2008-06-10 10:24:14'),
(474, 'sergio', 'Alterado Cliente ID=24 Nome=Rauf Alencar de Oliveira', '', '2008-06-10 10:25:04'),
(475, 'sergio', 'Alterado Cliente ID=24 Nome=Rauf Alencar de Oliveira', '', '2008-06-10 10:26:39'),
(476, 'sergio', 'Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa', '', '2008-06-10 10:27:58'),
(477, 'sergio', 'Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra', '', '2008-06-10 10:29:54'),
(478, 'sergio', 'Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva', '', '2008-06-10 10:42:20'),
(479, 'sergio', 'Alterado Cliente ID=35 Nome=Ana Elisa Macagnan', '', '2008-06-10 10:42:31'),
(480, 'sergio', 'Alterado Cliente ID=33 Nome=Bernhard Zanker Junior', '', '2008-06-10 10:42:44'),
(481, 'sergio', 'Alterado Cliente ID=40 Nome=Clayton Cezar Upitis Marloch', '', '2008-06-10 10:42:54'),
(482, 'sergio', 'Alterado Cliente ID=34 Nome=Edison Carlos dos Santos', '', '2008-06-10 10:43:01'),
(483, 'sergio', 'Alterado Cliente ID=36 Nome=Fernando Henrique Tremel Bueno', '', '2008-06-10 10:43:22'),
(484, 'sergio', 'Alterado Cliente ID=31 Nome=Luciana Osorio Cavalli', '', '2008-06-10 10:43:30'),
(485, 'sergio', 'Alterado Cliente ID=39 Nome=Waldenira Pistori', '', '2008-06-10 10:43:37'),
(486, 'sergio', 'Alterado Cliente ID=32 Nome=Zenildo Costa', '', '2008-06-10 10:43:47'),
(487, 'sergio', 'Alterado Cliente ID=43 Nome=Francisco C. T. Costa e Silva', '', '2008-06-10 10:46:01'),
(488, 'sergio', 'Alterado Cliente ID=46 Nome=Saulo Souza e Silva', '', '2008-06-10 10:46:15'),
(489, 'sergio', 'Alterado Cliente ID=44 Nome=Sonia Maria Bressan ', '', '2008-06-10 10:46:29'),
(490, 'sergio', 'Alterado Cliente ID=47 Nome=Ursula', '', '2008-06-10 10:46:40'),
(491, 'sergio', 'Alterado Cliente ID=41 Nome=Vanildo', '', '2008-06-10 10:46:52'),
(492, 'sergio', 'Alterado Cliente ID=59 Nome=Celso Amaral Poletti', '', '2008-06-10 10:46:58'),
(493, 'sergio', 'Alterado Cliente ID=60 Nome=Claiton Estacionamento', '', '2008-06-10 10:47:06'),
(494, 'sergio', 'Alterado Cliente ID=55 Nome=', '', '2008-06-10 10:47:37'),
(495, 'sergio', 'Alterado Cliente ID=57 Nome=Djalma Jacinto da Silva Filho', '', '2008-06-10 10:47:49'),
(496, 'sergio', 'Alterado Cliente ID=56 Nome=Eliana Nascimento', '', '2008-06-10 10:47:58'),
(497, 'sergio', 'Alterado Cliente ID=58 Nome=Isabel Jacomel', '', '2008-06-10 10:48:06'),
(498, 'sergio', 'Alterado Cliente ID=126 Nome=João Marcos Ferreira Damaceno', '', '2008-06-10 10:48:18'),
(499, 'sergio', 'Alterado Cliente ID=53 Nome=Marisa Helena da Costa Serafin', '', '2008-06-10 10:48:33'),
(500, 'sergio', 'Alterado Cliente ID=54 Nome=Marisângela Pacheco Brittes', '', '2008-06-10 10:48:59'),
(501, 'sergio', 'Alterado Cliente ID=128 Nome=Caio Ruocco de Arruda', '', '2008-06-10 10:49:17'),
(502, 'sergio', 'Alterado Cliente ID=130 Nome=Darlan Schneider', '', '2008-06-10 10:49:25'),
(503, 'sergio', 'Alterado Cliente ID=77 Nome=Fabiana Reis', '', '2008-06-10 10:49:33'),
(504, 'sergio', 'Alterado Cliente ID=74 Nome=Fernando Cesar Alves da Silva', '', '2008-06-10 10:49:41'),
(505, 'sergio', 'Alterado Cliente ID=67 Nome=Katia Cristina Zardo', '', '2008-06-10 10:51:43'),
(506, 'sergio', 'Alterado Cliente ID=70 Nome=Leonardo Raupp Matta', '', '2008-06-10 10:51:47'),
(507, 'sergio', 'Alterado Cliente ID=66 Nome=Luana Aparecida Dias Mota', '', '2008-06-10 10:51:51'),
(508, 'sergio', 'Alterado Cliente ID=61 Nome=Matilde Alves da Cunha Silva', '', '2008-06-10 10:51:55'),
(509, 'sergio', 'Alterado Cliente ID=72 Nome=Mellina Franco Oliveira Canto', '', '2008-06-10 10:51:58'),
(510, 'sergio', 'Alterado Cliente ID=71 Nome=Rita Helena Zimmermann', '', '2008-06-10 10:52:02'),
(511, 'sergio', 'Alterado Cliente ID=64 Nome=Robson Roberto da Silva', '', '2008-06-10 10:52:06'),
(512, 'sergio', 'Alterado Cliente ID=68 Nome=Rose Cristina Neves', '', '2008-06-10 10:52:16'),
(513, 'sergio', 'Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua', '', '2008-06-10 10:52:21'),
(514, 'sergio', 'Alterado Cliente ID=76 Nome=Thiago Carli', '', '2008-06-10 10:52:26'),
(515, 'sergio', 'Alterado Cliente ID=62 Nome=Wallace Mendes Cordeiro', '', '2008-06-10 10:52:30'),
(516, 'sergio', 'Alterado Cliente ID=127 Nome=Juliana Aparecida Rosty de Anhaia Cesar', '', '2008-06-10 10:52:33'),
(517, 'sergio', 'Alterado Cliente ID=91 Nome=Adriano de Araujo Schampovski', '', '2008-06-10 10:52:37'),
(518, 'sergio', 'Alterado Cliente ID=88 Nome=Anderson Augusto Fillus', '', '2008-06-10 10:52:40'),
(519, 'sergio', 'Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski', '', '2008-06-10 10:53:22'),
(520, 'sergio', 'Alterado Cliente ID=114 Nome=Ivan de Oliveira Mota', '', '2008-06-10 10:53:44'),
(521, 'sergio', 'Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes', '', '2008-06-10 10:55:30'),
(522, 'sergio', 'Alterado Cliente ID=104 Nome=Shirley Cristiane M. de Souza', '', '2008-06-10 10:57:00'),
(523, 'sergio', 'Alterado Cliente ID=69 Nome=George Galli', '', '2008-06-10 10:57:53'),
(524, 'sergio', 'Alterado Cliente ID=129 Nome=Ines Eline Lopes Martins', '', '2008-06-10 10:57:57'),
(525, 'sergio', 'Alterado Cliente ID=121 Nome=Jeane Margarete Rucinski', '', '2008-06-10 10:58:00'),
(526, 'sergio', 'Alterado Cliente ID=86 Nome=Ivana Rubio Colin', '', '2008-06-10 10:58:03'),
(527, 'sergio', 'Alterado Cliente ID=89 Nome=Jefferson Olinger de Souza', '', '2008-06-10 10:58:08'),
(528, 'sergio', 'Alterado Cliente ID=82 Nome=João Arnaldo de Oliveira', '', '2008-06-10 10:58:11'),
(529, 'sergio', 'Alterado Cliente ID=90 Nome=José Carlos', '', '2008-06-10 10:58:16'),
(530, 'sergio', 'Alterado Cliente ID=85 Nome=José Carlos de Lima', '', '2008-06-10 10:58:21'),
(531, 'sergio', 'Alterado Cliente ID=87 Nome=José Carvalho Filho', '', '2008-06-10 10:58:27'),
(532, 'sergio', 'Alterado Cliente ID=78 Nome=Katia Regina Schmeiske', '', '2008-06-10 10:58:40'),
(533, 'sergio', 'Alterado Cliente ID=80 Nome=Morgana Biron', '', '2008-06-10 10:58:52'),
(534, 'sergio', 'Alterado Cliente ID=125 Nome=Sidnei Scaravonatti', '', '2008-06-10 10:58:56'),
(535, 'sergio', 'Alterado Cliente ID=84 Nome=Sonia Aparecida Estevan Costa ', '', '2008-06-10 10:59:01'),
(536, 'sergio', 'Alterado Cliente ID=81 Nome=Thais Cristina Sentone Mota', '', '2008-06-10 10:59:04'),
(537, 'sergio', 'Alterado Cliente ID=100 Nome=Antonio dos Santos Bicalho', '', '2008-06-10 10:59:08'),
(538, 'sergio', 'Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves', '', '2008-06-10 10:59:12'),
(539, 'sergio', 'Alterado Cliente ID=96 Nome=Dievert Fernando de Campos', '', '2008-06-10 10:59:21'),
(540, 'sergio', 'Alterado Cliente ID=131 Nome=ELDER SHIGUEMATSU', '', '2008-06-10 10:59:25'),
(541, 'sergio', 'Alterado Cliente ID=93 Nome=Everson Edson do Prado', '', '2008-06-10 10:59:28'),
(542, 'sergio', 'Alterado Cliente ID=124 Nome=José Carlos Cardoso Ajala', '', '2008-06-10 10:59:32'),
(543, 'sergio', 'Alterado Cliente ID=97 Nome=Luiz Eduardo Lasszck', '', '2008-06-10 10:59:38'),
(544, 'sergio', 'Alterado Cliente ID=123 Nome=Marcelo Luiz Velter', '', '2008-06-10 10:59:42'),
(545, 'sergio', 'Alterado Cliente ID=95 Nome=Nilo Ravazzi', '', '2008-06-10 10:59:47'),
(546, 'sergio', 'Alterado Cliente ID=107 Nome=Robson Sandro Santos', '', '2008-06-10 10:59:52'),
(547, 'sergio', 'Alterado Cliente ID=106 Nome=Rosina Helena dos Santos', '', '2008-06-10 10:59:56'),
(548, 'sergio', 'Alterado Cliente ID=105 Nome=Silvia Aparecida Pereira', '', '2008-06-10 11:00:54'),
(549, 'sergio', 'Alterado Cliente ID=101 Nome=Sueli Costa Luvison', '', '2008-06-10 11:00:58'),
(550, 'sergio', 'Alterado Cliente ID=94 Nome=Valdemir Antonio Rovares', '', '2008-06-10 11:01:02'),
(551, 'sergio', 'Alterado Cliente ID=99 Nome=Valdir Modest de Oliveira', '', '2008-06-10 11:01:05'),
(552, 'sergio', 'Alterado Cliente ID=103 Nome=Vanderlei Souza', '', '2008-06-10 11:01:08'),
(553, 'sergio', 'Alterado Cliente ID=119 Nome=Antonia - Síndica', '', '2008-06-10 11:01:15'),
(554, 'sergio', 'Alterado Cliente ID=120 Nome=Elenara Beatriz Fontana', '', '2008-06-10 11:01:19'),
(555, 'sergio', 'Alterado Cliente ID=110 Nome=Ricardo - PRT', '', '2008-06-10 11:01:22'),
(556, 'sergio', 'Login', '', '2008-06-12 10:38:21'),
(557, 'sergio', 'Login', '', '2008-06-12 11:05:38'),
(558, 'smart', 'Login', '', '2008-06-12 20:30:08'),
(559, 'sergio', 'Login', '', '2008-06-13 08:53:04'),
(560, 'sergio', 'Login', '', '2008-06-13 18:43:32'),
(561, 'sergio', 'Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves', '', '2008-06-13 18:45:29'),
(562, 'smart', 'Login', '', '2008-06-14 13:49:37'),
(563, 'sergio', 'Login', '', '2008-06-14 19:51:59'),
(564, 'sergio', 'Login', '', '2008-06-16 10:07:31'),
(565, 'sergio', 'Login', '', '2008-06-17 10:25:30'),
(566, 'smart', 'Login', '', '2008-06-17 11:00:48'),
(567, 'smart', 'Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva', '', '2008-06-17 11:01:44'),
(568, 'smart', 'Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva', '', '2008-06-17 11:01:59'),
(569, 'sergio', 'Login', '', '2008-06-18 09:05:31'),
(570, 'sergio', 'Login', '', '2008-06-19 09:14:20'),
(571, 'smart', 'Login', '', '2008-06-20 12:55:41'),
(572, 'sergio', 'Login', '', '2008-06-21 11:11:29'),
(573, 'sergio', 'Cadastro Cliente ID=133 Nome=Conrado Souza de Chiaro', '', '2008-06-21 11:15:24'),
(574, 'sergio', 'Alterado Cliente ID=133 Nome=Conrado Souza de Chiaro', '', '2008-06-21 13:00:43'),
(575, 'sergio', 'Login', '', '2008-06-21 15:34:56'),
(576, 'sergio', 'Login', '', '2008-06-24 10:59:21'),
(577, 'sergio', 'Alterado Cliente ID=26 Nome=Jackson M. Nizer', '', '2008-06-24 11:03:41'),
(578, 'sergio', 'Alterado Cliente ID=28 Nome=Sergio Vivan', '', '2008-06-24 11:04:41'),
(579, 'sergio', 'Login', '', '2008-06-26 08:53:49'),
(580, 'smart', 'Login', '', '2008-07-01 12:28:36'),
(581, 'smart', 'Cadastro Cliente ID=134 Nome=Rafaela Polli', '', '2008-07-01 12:34:26'),
(582, 'smart', 'Alterado Cliente ID=134 Nome=Rafaela Polli', '', '2008-07-01 12:40:57'),
(583, 'smart', 'Alterado Cliente ID=75 Nome=Amanda Tieppo', '', '2008-07-01 12:41:27'),
(584, 'smart', 'Alterado Cliente ID=75 Nome=Amanda Tieppo', '', '2008-07-01 12:41:50'),
(585, 'smart', 'Login', '', '2008-07-03 15:08:00'),
(586, 'smart', 'Logout', '', '2008-07-03 15:09:01'),
(587, 'smart', 'Login', '', '2008-07-03 15:11:25'),
(588, 'sergio', 'Login', '', '2008-07-08 09:49:23'),
(589, 'sergio', 'Login', '', '2008-07-09 09:07:25'),
(590, 'sergio', 'Alterado Cliente ID=133 Nome=Conrado Souza de Chiaro', '', '2008-07-09 09:24:57'),
(591, 'sergio', 'Alterado Cliente ID=133 Nome=Conrado Souza de Chiaro', '', '2008-07-09 09:25:24'),
(592, 'sergio', 'Login', '', '2008-07-09 09:47:53'),
(593, 'sergio', 'Alterado Cliente ID=40 Nome=Clayton Cezar Upitis Marloch', '', '2008-07-09 09:57:50'),
(594, 'sergio', 'Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva', '', '2008-07-09 09:59:16'),
(595, 'sergio', 'Alterado Cliente ID=35 Nome=Ana Elisa Macagnan', '', '2008-07-09 09:59:46'),
(596, 'sergio', 'Alterado Cliente ID=33 Nome=Bernhard Zanker Junior', '', '2008-07-09 10:00:04'),
(597, 'sergio', 'Alterado Cliente ID=20 Nome=Clelia Alice Marson', '', '2008-07-09 10:00:33'),
(598, 'sergio', 'Alterado Cliente ID=34 Nome=Edison Carlos dos Santos', '', '2008-07-09 10:00:53'),
(599, 'sergio', 'Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra', '', '2008-07-09 10:01:04'),
(600, 'sergio', 'Alterado Cliente ID=36 Nome=Fernando Henrique Tremel Bueno', '', '2008-07-09 10:01:15'),
(601, 'sergio', 'Alterado Cliente ID=31 Nome=Luciana Osorio Cavalli', '', '2008-07-09 10:01:35'),
(602, 'sergio', 'Alterado Cliente ID=39 Nome=Waldenira Pistori', '', '2008-07-09 10:01:48'),
(603, 'sergio', 'Alterado Cliente ID=32 Nome=Zenildo Costa', '', '2008-07-09 10:02:09'),
(604, 'smart', 'Login', '', '2008-07-12 19:16:17'),
(605, 'sergio', 'Login', '', '2008-07-14 09:19:57'),
(606, 'smart', 'Login', '', '2008-07-14 16:10:38'),
(607, 'smart', 'Alterado Cliente ID=46 Nome=Saulo Souza e Silva', '', '2008-07-14 16:11:10'),
(608, 'smart', 'Login', '', '2008-07-14 17:42:40'),
(609, 'sergio', 'Login', '', '2008-07-14 19:20:52'),
(610, 'sergio', 'Cadastro Titulo ID=1 Codigo=243524', '', '2008-07-14 20:25:16');
INSERT INTO `logs_admin` (`id`, `login`, `mensagem`, `query`, `datacadastro`) VALUES
(611, 'sergio', 'Cadastro Titulo ID=2 Codigo=215465', '', '2008-07-14 20:29:48'),
(612, 'sergio', 'Login', '', '2008-07-15 08:47:52'),
(613, 'sergio', 'Login', '', '2008-07-15 09:22:42'),
(614, 'sergio', 'Login', '', '2008-07-16 16:26:56'),
(615, 'sergio', 'Cadastro Titulo ID=3 Codigo=243525', '', '2008-07-16 16:34:45'),
(616, 'sergio', 'Cadastro Titulo ID=4 Codigo=243526', '', '2008-07-16 16:36:43'),
(617, 'sergio', 'Cadastro Titulo ID=5 Codigo=243527', '', '2008-07-16 16:42:03'),
(618, 'sergio', 'Login', '', '2008-07-17 09:18:35'),
(619, 'smart', 'Login', '', '2008-07-17 20:53:12'),
(620, 'sergio', 'Login', '', '2008-07-18 09:05:00'),
(621, 'sergio', 'Cadastro Cliente ID=135 Nome=Renato Alves Ribeiro', '', '2008-07-18 09:18:37'),
(622, 'sergio', 'Alterado Cliente ID=68 Nome=Rose Cristina Neves', '', '2008-07-18 09:23:26'),
(623, 'sergio', 'Alterado Cliente ID=77 Nome=Fabiana Reis', '', '2008-07-18 09:24:24'),
(624, 'sergio', 'Alterado Cliente ID=67 Nome=Katia Cristina Zardo', '', '2008-07-18 09:24:54'),
(625, 'sergio', 'Cadastro Titulo ID=6 Codigo=243528', '', '2008-07-18 09:38:36'),
(626, 'sergio', 'Cadastro Titulo ID=7 Codigo=243529', '', '2008-07-18 09:49:05'),
(627, 'sergio', 'Cadastro Titulo ID=8 Codigo=243530', '', '2008-07-18 09:51:12'),
(628, 'sergio', 'Cadastro Cliente ID=136 Nome=Raphael de Andrade', '', '2008-07-18 10:17:12'),
(629, 'sergio', 'Alterado Cliente ID=136 Nome=Raphael de Andrade', '', '2008-07-18 10:18:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodos`
--

CREATE TABLE IF NOT EXISTS `periodos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(250) collate latin1_general_ci NOT NULL,
  `dia_inicio` int(11) NOT NULL,
  `dia_termino` int(11) NOT NULL,
  `dia_termino_mescorrente` int(11) NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `periodos`
--

INSERT INTO `periodos` (`id`, `nome`, `dia_inicio`, `dia_termino`, `dia_termino_mescorrente`, `datacadastro`) VALUES
(6, 'Dia 01 mês corrente a 31 mês corrente', 1, 31, 1, '2008-03-10 11:06:09'),
(7, 'Dia 10 mês corrente a 09 mês seguinte', 10, 9, 0, '2008-03-10 11:10:57'),
(8, 'Dia 20 mês corrente a 19 mês seguinte', 20, 19, 0, '2008-05-05 10:59:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `planos`
--

CREATE TABLE IF NOT EXISTS `planos` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `planos`
--

INSERT INTO `planos` (`id`, `codigo`, `nome`, `descricao`, `vel_download`, `vel_upload`, `valor_base`, `valor_pontoadicional`, `fidelidade`, `observacoes`, `datacadastro`) VALUES
(1, 'sc300', 'SmartConnect300', '', '300', '150', 45.00, 10.00, 1, '', '2007-11-20 09:38:33'),
(4, 'sc400', 'SmartConnect400', 'Bla bla bla', '400', '200', 60.00, 10.00, 0, '', '2007-11-21 10:15:59'),
(7, 'sc200', 'SmartConnect200', '', '200', '100', 30.00, 10.00, 0, '', '2007-11-22 09:53:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `provedores`
--

CREATE TABLE IF NOT EXISTS `provedores` (
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

-- --------------------------------------------------------

--
-- Estrutura stand-in para visualizar `teste`
--
CREATE TABLE IF NOT EXISTS `teste` (
`id` int(11)
,`ativo` int(11)
,`codigo` varchar(200)
,`provedor_id` int(11)
,`plano_id` int(11)
,`cliente_id` int(11)
,`grupo_id` int(11)
,`descricao` text
,`data_inicio` date
,`data_termino` date
,`periodo_id` int(11)
,`vencimento_padrao` int(11)
,`valor_padrao` decimal(10,2)
,`observacoes` text
,`datacadastro` timestamp
,`plano` varchar(200)
,`valor_base` decimal(10,2)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `titulos`
--

CREATE TABLE IF NOT EXISTS `titulos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cliente_id` int(11) NOT NULL,
  `contrato_id` int(11) NOT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fim` date NOT NULL,
  `referencia_mes` int(11) NOT NULL,
  `referencia_ano` int(11) NOT NULL,
  `vencimento` date NOT NULL,
  `codigo` int(10) unsigned NOT NULL,
  `valor` decimal(2,0) NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `titulos`
--

INSERT INTO `titulos` (`id`, `cliente_id`, `contrato_id`, `periodo_inicio`, `periodo_fim`, `referencia_mes`, `referencia_ano`, `vencimento`, `codigo`, `valor`, `observacoes`, `datacadastro`) VALUES
(1, 8, 24, '2008-07-10', '2008-08-09', 7, 2008, '2008-08-10', 243524, 45, 'bfd fnb fdg df hfd  hgf', '2008-07-14 20:25:16'),
(2, 8, 24, '2008-07-10', '2008-08-09', 7, 2008, '2008-08-10', 215465, 45, '2432wdcadfa ds f', '2008-07-14 20:29:48'),
(3, 8, 24, '2008-07-10', '2008-08-09', 7, 2008, '2008-08-10', 243525, 45, '456gfd', '2008-07-16 16:34:45'),
(4, 10, 8, '2008-07-10', '2008-08-09', 7, 2008, '2008-08-10', 243526, 45, 'fsfdsdfwr wf s f wfef ', '2008-07-16 16:36:43'),
(5, 13, 14, '2008-07-10', '2008-08-09', 7, 2008, '2008-08-10', 243527, 45, 'trfrgh rht fgb fgh ', '2008-07-16 16:42:03'),
(6, 16, 11, '2008-07-10', '2008-08-09', 7, 2008, '2008-08-10', 243528, 45, 'sasdf a fvafgradfgdsfgdsf ds fg', '2008-07-18 09:38:36'),
(7, 35, 17, '2008-07-10', '2008-08-09', 7, 2008, '2008-08-10', 243529, 45, 'kfdmn jfdhjnvdslkjnlkdj nl', '2008-07-18 09:49:05'),
(8, 10, 8, '2008-07-10', '2008-08-09', 7, 2008, '2008-08-10', 243530, 45, '', '2008-07-18 09:51:12');

-- --------------------------------------------------------

--
-- Estrutura para visualizar `teste`
--
DROP TABLE IF EXISTS `teste`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `ssolution`.`teste` AS select `ctr`.`id` AS `id`,`ctr`.`ativo` AS `ativo`,`ctr`.`codigo` AS `codigo`,`ctr`.`provedor_id` AS `provedor_id`,`ctr`.`plano_id` AS `plano_id`,`ctr`.`cliente_id` AS `cliente_id`,`ctr`.`grupo_id` AS `grupo_id`,`ctr`.`descricao` AS `descricao`,`ctr`.`data_inicio` AS `data_inicio`,`ctr`.`data_termino` AS `data_termino`,`ctr`.`periodo_id` AS `periodo_id`,`ctr`.`vencimento_padrao` AS `vencimento_padrao`,`ctr`.`valor_padrao` AS `valor_padrao`,`ctr`.`observacoes` AS `observacoes`,`ctr`.`datacadastro` AS `datacadastro`,`pla`.`nome` AS `plano`,`pla`.`valor_base` AS `valor_base` from (`ssolution`.`contratos` `CTR` join `ssolution`.`planos` `PLA` on((`ctr`.`plano_id` = `pla`.`id`)));
