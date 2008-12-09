<?
define('ROOT','../');
include(ROOT . 'configs.php');
include('logado.php');

$modo = $_REQUEST['modo'];
$id = $_REQUEST['id'];
$processa = $_REQUEST['processa'];
$msg = $_REQUEST['msg'];

if ($modo=="cad")
{
	$visual->assign('subtitulo','Cadastro de Modelo');
	$visual->assign('submit','Cadastrar');
	$visual->assign('modo','cad');
}
if ($modo=="alt")
{
	$visual->assign('subtitulo','Altera&ccedil;&atilde;o de Modelo');
	$visual->assign('submit','Alterar');
	$visual->assign('modo','alt');

	if (!is_numeric($id))
	{
		die("ID faltando para alteração");
	}
	
	$res = bdSelect("*","modelos","id=" . $id,"",$conexao);
	
	if (!bdNumReg($res))
	{
		die("Nenhum registro para o ID '" . $id . "'");
	}
	
	$valores = mysql_fetch_assoc($res);
	$visual->assign('valores',$valores);
}

if ($modo=='cad' || $modo=='alt')
{
	$campos = array(
		'exibir' => "Selecione uma opo para o campo 'Exibir no site'",
		'nome' => "Preencha o campo 'Nome' corretamente",
		'sexo' => "Selecione o campo 'Sexo'",
		'nascimento' => "Preencha corretamente a data de nascimento",
		'filiacao' => "Preencha o campo 'Filiação' corretamente",
		'endereco' => "Preencha o campo 'Endereço' corretamente",
		'bairro' => "Preencha o campo 'Bairro' corretamente",
		'cep' => "Preencha o campo 'CEP' corretamente",
		'responsavel' => "Preencha o campo 'Responsável' corretamente",
		'booker' => "Preencha o campo 'Booker' corretamente",
		'telefone' => "Preencha o campo 'Telefone' corretamente",
		'celular' => "Preencha o campo 'Celular' corretamente",
		'email' => "Preencha o campo 'E-mail' corretamente",
		'rg' => "Preencha o campo 'RG' corretamente",
		'cpf' => "Preencha o campo 'CPF' corretamente",
		'tel_recado' => "Preencha o campo 'Telefone Recado' corretamente",
		'msn' => "Preencha o campo 'MSN' corretamente",
		'semcache' => "Selecione uma opção para o campo 'Trabalha sem cache'",
		'cachebaixo' => "Selecione uma opção para o campo 'Trabalha com cache baixo'",
		'cachebaixo_quanto' => "Preencha um valor para o cache",
		'esporte' => "Informe se pratica algum esporte no campo 'Pratica algum esporte'",
		'esporte_qual' => "Informe qual esporte pratica",
		'cavalo' => "Selecione uma opção para o campo 'Monta a cavalo'",
		'skate' => "Selecione uma opção para o campo 'Skate'",
		'patins' => "Selecione uma opção para o campo 'Patins'",
		'instrumento' => "Informe se toca algum insrtumento no campo 'Toca algum instrumento'",
		'instrumento_qual' => "Informe qual instrumento toca",
		'moda' => "Selecione uma opção para o campo 'Moda'",
		'perfil' => "Selecione uma opção para o campo 'Perfil'",
		'canta' => "Selecione uma opção para o campo 'Canta'",
		'danca' => "Selecione uma opção para o campo 'Dança'",
		'danca_oque' => "Selecione uma opção para o campo 'Dança -> O que?'",
		'atua' => "Selecione uma opção para o campo 'Atua'",
		'drt' => "Selecione uma opção para o campo 'Possui DRT'",
		'drt_numero' => "Informe o número da DRT",
		'fotos' => "Selecione uma opção para o campo 'Fotos'",
		'comerciais' => "Selecione uma opção para o campo 'Comerciais'",
		'figuracao' => "Selecione uma opção para o campo 'Figuração'",
		'biquini' => "Selecione uma opção para o campo 'Biquini/Sunga'",
		'lingerie' => "Selecione uma opção para o campo 'Lingerie/Cueca'",
		'seminu' => "Selecione uma opção para o campo 'Semi-nu'",
		'nu' => "Selecione uma opção para o campo 'Nu'",
		'makingoff' => "Selecione uma opção para o campo 'Making-off'",
		'jingles' => "Selecione uma opção para o campo 'Jingles'",
		'videoclip' => "Selecione uma opção para o campo 'Video-clips'",
		'promocao' => "Selecione uma opção para o campo 'Promoção'",
		'feiras' => "Selecione uma opção para o campo 'Feiras'",
		'viagens' => "Selecione uma opção para o campo 'Viagens'",
		'viagens_brasil' => "Selecione a disponibilidade para viagens",
		'viagens_exterior' => "Selecione a disponibilidade para viagens",
		'elencoapoio' => "Selecione a disponibilidade para Elenco de Apoio",
		'recepcao' => "Selecione a disponibilidade para Recepção",
		'sampling' => "Selecione a disponibilidade para Sampling",
		'ingles' => "Selecione uma graduação para o idioma 'Inglês'",
		'frances' => "Selecione uma graduação para o idioma 'Francês'",
		'espanhol' => "Selecione uma graduação para o idioma 'Espanhol'",
		'italiano' => "Selecione uma graduação para o idioma 'Italiano'",
		'alemao' => "Selecione uma graduação para o idioma 'Alemão'",
		'altura' => "Preencha o campo 'Altura' corretamente",
		'peso' => "Preencha o campo 'Peso' corretamente",
		'busto' => "Preencha o campo 'Busto/Torax' corretamente",
		'cintura' => "Preencha o campo 'Cintura' corretamente",
		'quadril' => "Preencha o campo 'Quadril' corretamente",
		'maos' => "Preencha o campo 'Mãos' corretamente",
		'cabelos_tipo' => "Selecione o tipo dos cabelos",
		'cabelos_cor' => "Selecione a cor dos cabelos",
		'olhos' => "Selecione a cor dos olhos",
		'pele' => "Selecione a cor da pele",
		'sapato' => "Preencha o campo 'Sapato' corretamente",
		'pes' => "Preencha o campo 'Pés' corretamente",
		'manequim' => "Preencha o campo 'Manequim' corretamente",
		'piercing' => "Selecione uma opção para o campo 'Piercings'",
		'piercing_quantos' => "Informe o nmero de piercings",
		'piercing_onde' => "Informe a localização do(s) piercing(s)",
		'tatuagem' => "Selecione uma opção para o campo 'Tatuagens'",
		'tatuagem_quantas' => "Informe o nmero de tatuagens",
		'tatuagem_onde' => "Informe a localização das tatuagens",
		'mat_fotog' => "Selecione uma opção para o campo 'Possui material fotográfico'",
		'mat_fotog_book' => "Selecione pelo menos um tipo de material fotográfico",
		'fezcursoagencia' => "Selecione se fez curso na agência ou não",
		'fezworkshop' => "Selecione se fez workshop ou não",
		'observacoes' => "Preencha o campo 'ObservaçÃµes' corretamente"
	);
	
	// se estamos recebendo um form, processar seus dados
	if ($processa=="ok")
	{
		//validacao dos campos
		$valida = true;
		if ($_REQUEST['exibir']=="") { $erro[] .= "exibir"; $valida = false; } else $valores['exibir'] = $_REQUEST['exibir'];
		if ($_REQUEST['nome']=="") { $erro[] .= "nome"; $valida = false; } else $valores['nome'] = $_REQUEST['nome'];
		if ($_REQUEST['sexo']=="") { $erro[] .= "sexo"; $valida = false; } else $valores['sexo'] = $_REQUEST['sexo'];
		if (!isDate($_REQUEST['nascimento'])) { $erro[] .= "nascimento"; $valida = false; } else $valores['nascimento'] = data_server($_REQUEST['nascimento']); 
		if ($_REQUEST['filiacao']=="") { $erro[] .= "filiacao"; $valida = false; } else $valores['filiacao'] = $_REQUEST['filiacao'];
		//if ($_REQUEST['endereco']=="") { $erro[] .= "endereco"; $valida = false; } else $valores['endereco'] = $_REQUEST['endereco'];
		$valores['endereco'] = $_REQUEST['endereco'];
		//if ($_REQUEST['bairro']=="") { $erro[] .= "bairro"; $valida = false; } else $valores['bairro'] = $_REQUEST['bairro'];
		$valores['bairro'] = $_REQUEST['bairro'];
		//if ($_REQUEST['cep']=="") { $erro[] .= "cep"; $valida = false; } else $valores['cep'] = $_REQUEST['cep'];
		$valores['cep'] = $_REQUEST['cep'];
		//if ($_REQUEST['responsavel']=="") { $erro[] .= "responsavel"; $valida = false; } else $valores['responsavel'] = $_REQUEST['responsavel'];
		$valores['responsavel'] = $_REQUEST['responsavel'];
		//if ($_REQUEST['booker']=="") { $erro[] .= "booker"; $valida = false; } else $valores['booker'] = $_REQUEST['booker'];
		$valores['booker'] = $_REQUEST['booker'];
		//if ($_REQUEST['telefone']=="") { $erro[] .= "telefone"; $valida = false; } else $valores['telefone'] = $_REQUEST['telefone'];
		$valores['telefone'] = $_REQUEST['telefone'];
		//if ($_REQUEST['celular']=="") { $erro[] .= "celular"; $valida = false; } else $valores['celular'] = $_REQUEST['celular'];
		$valores['celular'] = $_REQUEST['celular'];
		//if ($_REQUEST['email']=="") { $erro[] .= "email"; $valida = false; } else $valores['email'] = $_REQUEST['email'];
		$valores['email'] = $_REQUEST['email'];
		//if ($_REQUEST['rg']=="") { $erro[] .= "rg"; $valida = false; } else $valores['rg'] = $_REQUEST['rg'];
		$valores['rg'] = $_REQUEST['rg'];
		//if ($_REQUEST['cpf']=="") { $erro[] .= "cpf"; $valida = false; } else $valores['cpf'] = $_REQUEST['cpf'];
		$valores['cpf'] = $_REQUEST['cpf'];
		//if ($_REQUEST['tel_recado']=="") { $erro[] .= "tel_recado"; $valida = false; } else $valores['tel_recado'] = $_REQUEST['tel_recado'];
		$valores['tel_recado'] = $_REQUEST['tel_recado'];
		//if ($_REQUEST['msn']=="") { $erro[] .= "msn"; $valida = false; } else $valores['msn'] = $_REQUEST['msn'];
		$valores['msn'] = $_REQUEST['msn'];
		
		if ($_REQUEST['semcache']=="") { $erro[] .= "semcache"; $valida = false; } else $valores['semcache'] = $_REQUEST['semcache'];
		if ($_REQUEST['cachebaixo']=="0")
		{
			$valores['cachebaixo'] = "0";
			if($_REQUEST['cachebaixo_quanto']=="")
			{
				$erro[] .= "cachebaixo_quanto";
				$valida = false;
			}
			else
			{
				$valores['cachebaixo_quanto'] = $_REQUEST['cachebaixo_quanto'];
			}
		}
		else if ($_REQUEST['cachebaixo']=="1")
		{
			$valores['cachebaixo'] = "1";
			$valores['cachebaixo_quanto'] = "";
		}
		else
		{
			$erro[] .= "cachebaixo";
			$valida = false;
		}
		if ($_REQUEST['esporte']=="1")
		{
			$valores['esporte'] = "1";
			if($_REQUEST['esporte_qual']=="")
			{
				$erro[] .= "esporte_qual";
				$valida = false;
			}
			else
			{
				$valores['esporte_qual'] = $_REQUEST['esporte_qual'];
			}
		}
		else if ($_REQUEST['esporte']=="0")
		{
			$valores['esporte'] = "0";
			$valores['esporte_qual'] = "";
		}
		else
		{
			$erro[] .= "esporte";
			$valida = false;
		}
		if ($_REQUEST['cavalo']=="") { $erro[] .= "cavalo"; $valida = false; } else $valores['cavalo'] = $_REQUEST['cavalo'];
		if ($_REQUEST['skate']=="") { $erro[] .= "skate"; $valida = false; } else $valores['skate'] = $_REQUEST['skate'];
		if ($_REQUEST['patins']=="") { $erro[] .= "patins"; $valida = false; } else $valores['patins'] = $_REQUEST['patins'];
		if ($_REQUEST['instrumento']=="1")
		{
			$valores['instrumento'] = "1";
			if($_REQUEST['instrumento_qual']=="")
			{
				$erro[] .= "instrumento_qual";
				$valida = false;
			}
			else
			{
				$valores['instrumento_qual'] = $_REQUEST['instrumento_qual'];
			}
		}
		else if ($_REQUEST['instrumento']=="0")
		{
			$valores['instrumento'] = "0";
			$valores['instrumento_qual'] = "";
		}
		else
		{
			$erro[] .= "instrumento";
			$valida = false;
		}		
		if ($_REQUEST['moda']=="") { $erro[] .= "moda"; $valida = false; } else $valores['moda'] = $_REQUEST['moda'];
		if ($_REQUEST['perfil']=="") { $erro[] .= "perfil"; $valida = false; } else $valores['perfil'] = $_REQUEST['perfil'];
		if ($_REQUEST['canta']=="") { $erro[] .= "canta"; $valida = false; } else $valores['canta'] = $_REQUEST['canta'];
		if ($_REQUEST['danca']=="1")
		{
			$valores['danca'] = "1";
			if ($_REQUEST['danca_oque']=="")
			{
				$erro[] .= "danca_oque";
				$valida = false;
			}
			else
			{
				$valores['danca_oque'] = $_REQUEST['danca_oque'];
			}
		}
		else if ($_REQUEST['danca']=="0")
		{
			$valores['danca'] = "0";
			$valores['danca_oque'] = "";
		}
		else
		{
			$erro[] .= "danca";
			$valida = false;
		}
		if ($_REQUEST['atua']=="") { $erro[] .= "atua"; $valida = false; } else $valores['atua'] = $_REQUEST['atua'];
		if ($_REQUEST['drt']=="1")
		{
			$valores['drt'] = "1";
			if ($_REQUEST['drt_numero']=="")
			{
				$erro[] .= "drt_numero";
				$valida = false;
			}
			else
			{
				$valores['drt_numero'] = $_REQUEST['drt_numero'];
			}
		}
		else if ($_REQUEST['drt']=="0")
		{
			$valores['drt'] = "0";
			$valores['drt_numero'] = "";
		}
		else
		{
			$erro[] .= "drt";
			$valida = false;
		}
		if ($_REQUEST['fotos']=="") { $erro[] .= "fotos"; $valida = false; } else $valores['fotos'] = $_REQUEST['fotos'];
		if ($_REQUEST['comerciais']=="") { $erro[] .= "comerciais"; $valida = false; } else $valores['comerciais'] = $_REQUEST['comerciais'];
		if ($_REQUEST['figuracao']=="") { $erro[] .= "figuracao"; $valida = false; } else $valores['figuracao'] = $_REQUEST['figuracao'];
		if ($_REQUEST['biquini']=="") { $erro[] .= "biquini"; $valida = false; } else $valores['biquini'] = $_REQUEST['biquini'];
		if ($_REQUEST['lingerie']=="") { $erro[] .= "lingerie"; $valida = false; } else $valores['lingerie'] = $_REQUEST['lingerie'];
		if ($_REQUEST['seminu']=="") { $erro[] .= "seminu"; $valida = false; } else $valores['seminu'] = $_REQUEST['seminu'];
		if ($_REQUEST['nu']=="") { $erro[] .= "nu"; $valida = false; } else $valores['nu'] = $_REQUEST['nu'];
		if ($_REQUEST['makingoff']=="") { $erro[] .= "makingoff"; $valida = false; } else $valores['makingoff'] = $_REQUEST['makingoff'];
		if ($_REQUEST['jingles']=="") { $erro[] .= "jingles"; $valida = false; } else $valores['jingles'] = $_REQUEST['jingles'];
		if ($_REQUEST['videoclip']=="") { $erro[] .= "videoclip"; $valida = false; } else $valores['videoclip'] = $_REQUEST['videoclip'];
		if ($_REQUEST['promocao']=="") { $erro[] .= "promocao"; $valida = false; } else $valores['promocao'] = $_REQUEST['promocao'];
		if ($_REQUEST['feiras']=="") { $erro[] .= "feiras"; $valida = false; } else $valores['feiras'] = $_REQUEST['feiras'];
		if ($_REQUEST['elencoapoio']=="") { $erro[] .= "elencoapoio"; $valida = false; } else $valores['elencoapoio'] = $_REQUEST['elencoapoio'];
		if ($_REQUEST['recepcao']=="") { $erro[] .= "recepcao"; $valida = false; } else $valores['recepcao'] = $_REQUEST['recepcao'];
		if ($_REQUEST['sampling']=="") { $erro[] .= "sampling"; $valida = false; } else $valores['sampling'] = $_REQUEST['sampling'];
		
		if ($_REQUEST['viagens']=="1")
		{
			if ($_REQUEST['viagens_brasil']=="" && $_REQUEST['viagens_exterior']=="")
			{
				$erro[] .= "viagens_brasil";
				$valida = false;
			}
			else
			{
				$valores['viagens'] = "1";
				$valores['viagens_brasil'] = $_REQUEST['viagens_brasil'];
				$valores['viagens_exterior'] = $_REQUEST['viagens_exterior'];
			}
		}
		else if ($_REQUEST['viagens']=="0")
		{
			$valores['viagens'] = "0";
			$valores['viagens_brasil'] = "";
			$valores['viagens_exterior'] = "";
		}
		else
		{
			$erro[] .= "viagens";
			$valida = false;
		}
		if (!is_numeric($_REQUEST['ingles'])) { $erro[] .= "ingles"; $valida = false; } else $valores['ingles'] = $_REQUEST['ingles'];
		if (!is_numeric($_REQUEST['frances'])) { $erro[] .= "frances"; $valida = false; } else $valores['frances'] = $_REQUEST['frances'];
		if (!is_numeric($_REQUEST['espanhol'])) { $erro[] .= "espanhol"; $valida = false; } else $valores['espanhol'] = $_REQUEST['espanhol'];
		if (!is_numeric($_REQUEST['italiano'])) { $erro[] .= "italiano"; $valida = false; } else $valores['italiano'] = $_REQUEST['italiano'];
		if (!is_numeric($_REQUEST['alemao'])) { $erro[] .= "alemao"; $valida = false; } else $valores['alemao'] = $_REQUEST['alemao'];
		if ($_REQUEST['altura']=="") { $erro[] .= "altura"; $valida = false; } else $valores['altura'] = str_replace(',','.',$_REQUEST['altura']);
		if ($_REQUEST['peso']=="") { $erro[] .= "peso"; $valida = false; } else $valores['peso'] = str_replace(',','.',$_REQUEST['peso']);
		if ($_REQUEST['busto']=="") { $erro[] .= "busto"; $valida = false; } else $valores['busto'] = str_replace(',','.',$_REQUEST['busto']);
		if ($_REQUEST['cintura']=="") { $erro[] .= "cintura"; $valida = false; } else $valores['cintura'] = str_replace(',','.',$_REQUEST['cintura']);
		if ($_REQUEST['quadril']=="") { $erro[] .= "quadril"; $valida = false; } else $valores['quadril'] = str_replace(',','.',$_REQUEST['quadril']);
		if ($_REQUEST['maos']=="") { $erro[] .= "maos"; $valida = false; } else $valores['maos'] = $_REQUEST['maos'];
		if ($_REQUEST['cabelos_tipo']=="") { $erro[] .= "cabelos_tipo"; $valida = false; } else $valores['cabelos_tipo'] = $_REQUEST['cabelos_tipo'];
		if ($_REQUEST['cabelos_cor']=="") { $erro[] .= "cabelos_cor"; $valida = false; } else $valores['cabelos_cor'] = $_REQUEST['cabelos_cor'];
		if ($_REQUEST['olhos']=="") { $erro[] .= "olhos"; $valida = false; } else $valores['olhos'] = $_REQUEST['olhos'];
		if ($_REQUEST['pele']=="") { $erro[] .= "pele"; $valida = false; } else $valores['pele'] = $_REQUEST['pele'];
		if ($_REQUEST['sapato']=="") { $erro[] .= "sapato"; $valida = false; } else $valores['sapato'] = $_REQUEST['sapato'];
		if ($_REQUEST['pes']=="") { $erro[] .= "pes"; $valida = false; } else $valores['pes'] = $_REQUEST['pes'];
		if ($_REQUEST['manequim']=="") { $erro[] .= "manequim"; $valida = false; } else $valores['manequim'] = $_REQUEST['manequim'];
		
		if ($_REQUEST['piercing']=="1")
		{
			$valores['piercing'] = "1";
			if ($_REQUEST['piercing_quantos']=="")
			{
				$erro[] .= "piercing_quantos";
				$valida = false;
			}
			else if ($_REQUEST['piercing_onde']=="")
			{
				$erro[] .= "piercing_onde";
				$valida = false;
			}
			else
			{
				$valores['piercing_quantos'] = $_REQUEST['piercing_quantos'];
				$valores['piercing_onde'] = $_REQUEST['piercing_onde'];
			}
		}
		else if ($_REQUEST['piercing']=="0")
		{
			$valores['piercing'] = "0";
			$valores['piercing_quantos'] = "";
			$valores['piercing_onde'] = "";
		}
		else
		{
			$erro[] .= "piercing";
			$valida = false;
		}
		
		if ($_REQUEST['tatuagem']=="1")
		{
			$valores['tatuagem'] = "1";
			if ($_REQUEST['tatuagem_quantas']=="")
			{
				$erro[] .= "tatuagem_quantas";
				$valida = false;
			}
			else if ($_REQUEST['tatuagem_onde']=="")
			{
				$erro[] .= "tatuagem_onde";
				$valida = false;
			}
			else
			{
				$valores['tatuagem_quantas'] = $_REQUEST['tatuagem_quantas'];
				$valores['tatuagem_onde'] = $_REQUEST['tatuagem_onde'];
			}
		}
		else if ($_REQUEST['tatuagem']=="0")
		{
			$valores['tatuagem'] = "0";
			$valores['tatuagem_quantas'] = "";
			$valores['tatuagem_onde'] = "";
		}
		if ($_REQUEST['mat_fotog']=="1")
		{
			if ($_REQUEST['mat_fotog_book']=="" && $_REQUEST['mat_fotog_ensaio']=="" && $_REQUEST['mat_fotog_fotocad']=="" && $_REQUEST['mat_fotog_composite']=="" && $_REQUEST['mat_fotog_videobook']=="" && $_REQUEST['mat_fotog_outros']==""  )
			{
				$erro[] .= "mat_fotog_book";
				$valida = false;
			}
			else
			{
				$valores['mat_fotog'] = "1";
				$valores['mat_fotog_book'] = $_REQUEST['mat_fotog_book'];
				$valores['mat_fotog_ensaio'] = $_REQUEST['mat_fotog_ensaio'];
				$valores['mat_fotog_fotocad'] = $_REQUEST['mat_fotog_fotocad'];
				$valores['mat_fotog_composite'] = $_REQUEST['mat_fotog_composite'];
				$valores['mat_fotog_videobook'] = $_REQUEST['mat_fotog_videobook'];
				$valores['mat_fotog_outros'] = $_REQUEST['mat_fotog_outros'];
			}
		}
		else if ($_REQUEST['mat_fotog']=="0")
		{
			$valores['mat_fotog'] = "0";
				$valores['mat_fotog_book'] = "";
				$valores['mat_fotog_ensaio'] = "";
				$valores['mat_fotog_fotocad'] = "";
				$valores['mat_fotog_composite'] = "";
				$valores['mat_fotog_videobook'] = "";
				$valores['mat_fotog_outros'] = "";
		}
		else
		{
			$erro[] .= "mat_fotog";
			$valida = false;
		}
		
		if ($_REQUEST['fezcursoagencia']=="") { $erro[] .= "fezcursoagencia"; $valida = false; } else $valores['fezcursoagencia'] = $_REQUEST['fezcursoagencia'];
		if ($_REQUEST['fezworkshop']=="") { $erro[] .= "fezworkshop"; $valida = false; } else $valores['fezworkshop'] = $_REQUEST['fezworkshop'];
		
		//if ($_REQUEST['observacoes']=="") { $erro[] .= "observacoes"; $valida = false; } else $valores['observacoes'] = $_REQUEST['observacoes'];
		$valores['observacoes'] = $_REQUEST['observacoes'];
		
		//se dados sao validos, envia para o banco
		if ($valida)
		{
			$str_campos 	= implode(",",array_keys($valores));
			$str_valores 	= "'" . implode("','",$valores) . "'";
			
			if ($modo=="cad")
			{
				$cadastra = bdInsert(
					"modelos",
					$str_campos,
					$str_valores,
					$conexao
				);
					
				//chama tratamento de upload
				if ($_FILES['imagem']['name']!="")
				{
					$upload = upload_form(
						'imagem',
						'modelo_' . $cadastra,
						$uppdir . 'modelos/',
						array('.jpg','.gif','.jpeg','.png'),
						1536000,
						true
					);
					
					if ($upload['status']=='feito')
					{
						bdUpdate(
							"modelos",
							"imagem = '" . $upload['msg'] . "'",
							"id = " . $cadastra ,
							$conexao
						);
						$msg = "Modelo cadastrada com sucesso";
						redir("modelos.php?modo=cad&msg=" . urlencode($msg));
					}
					else if ($upload['status']=='erro')
					{
						$msg  = "Modelo cadastrada com sucesso, porÃ©m houveram erros com o envio da imagem:<br />";
						$msg .= $upload['msg'];
					}
				}
				else
				{
					$msg = "Modelo cadastrada com sucesso";
					redir("modelos.php?modo=cad&msg=" . urlencode($msg));
				}
			}
			else if ($modo=="alt")
			{
				$upl_action = $_REQUEST['imagem_action'];
				if ($upl_action!=0)
				{
					$res = bdSelect(
						'imagem',
						'modelos',
						'id=' . $valores['id'],
						'',
						$conexao
					);
					
					if ($upl_action==1)
					{
					
					//alterar imagem
						if ($_FILES['imagem']['name']!="")
						{
							
							$upload = upload_form(
								'imagem',
								'modelo_' . $valores['id'],
								$uppdir . 'modelos/',
								array('.jpg','.gif','.jpeg','.png'),
								1536000,
								true
							);
							if ($upload['status']=='feito')
							{
								$valores['imagem'] = $upload['msg'];
							}
							else if ($upload['status']=='erro')
							{
								$msg  = "Modelo cadastrada com sucesso, porÃ©m houveram erros com o envio da imagem:<br />";
								$msg .= $upload['msg'];
							}
						}
					}
					else if ($upl_action==2)
					{
					//exclui imagem
						$valores['imagem'] = "";
						$deletar = $uppdir . 'modelos/' .  mysql_result($res,0,'imagem');
						if (is_file($deletar) && file_exists($deletar))
							unlink($deletar);
					}
				}
				
				$chaves =  array_keys($valores);
				$str_valores="";
				
				for ($i=1; $i<sizeof($chaves); $i++)
					$str_valores .= $chaves[$i] . "='" . $valores[$chaves[$i]] . "',";
							
				$str_valores = substr($str_valores,0,strlen($str_valores)-1);
				$whr = "id=" . $valores['id'];

				bdUpdate(
					"modelos",
					$str_valores,
					$whr,
					$conexao
				);
				
				redir("modelos.php?modo=lst&msg=" . urlencode("Alteração efetuada"));
			}
		}
		//caso contrario, associa os erros e volta os dados
		else
		{
			$visual->assign('frase_erro',$campos);
			$visual->assign('erros',$erro);
			$visual->assign('valores',$valores);
		}
	}
	
	//termina exibindo o formulario
	$visual->assign('msg',$msg);
	$visual->display('adm/modelos.tpl');
}

// MODO DE EXCLUSAO
else if ($modo=="exc")
{
	if (!is_numeric($id))
		redir("modelos.php?modo=lst&msg=" . urlencode("Selecione a modelo a ser excluída"));
		
	$res = bdSelect(
		"imagem",
		"modelos",
		"id=" . $id,
		"",
		$conexao
	);
	
	// remove a imagem se existir
	if (mysql_result($res,0,'imagem')!="")
	{
		$deletar = $uppdir . "modelos/" . mysql_result($res,0,'imagem');
		if (is_file($deletar) && file_exists($deletar))
		{
			unlink ($deletar);
		}
	}
	
	// remove a pasta de ensaios, se existir
	$removerdir = $uppdir . "modelos/" . $id;
	removeDir($removedir);
	// remove os registros de ensaios
	bdDelete("ensaios","modelo_id=" . $id,$conexao);
		
	bdDelete("modelos","id=" . $id,$conexao);
	redir("modelos.php?modo=lst&msg=" . urlencode("Exclusão efetuada"));

}

// MODO DE LISTAGEM
else if ($modo=="lst" || $modo=="ens")
{
	$whr="";
	
	if ($_REQUEST['nome']!="")
	{
		$whr[] = "nome LIKE '%" . $_REQUEST['nome'] . "%'";
		$values['nome'] = $_REQUEST['nome'];
	}
	if ($_REQUEST['sexo']!="")
	{
		$whr[] = "sexo=" . $_REQUEST['sexo'];
		$values['sexo'] = $_REQUEST['sexo'];
	}
	
	if ($_REQUEST['idade_min']!="" && $_REQUEST['idade_max']!="" && $_REQUEST['idade_min']==$_REQUEST['idade_max'])
	{
		// quero um registro com idade fixa ...
		$whr[] = "nascimento >= '" . (date("Y") - $_REQUEST['idade_min']) . "-" . date("m") . "-" . date("d") . "' AND nascimento <= '" . (date("Y") - $_REQUEST['idade_min'] + 1) . "-" . date("m") . "-" . date("d") . "'";
	}
	else
	{
		// bom... veremos ...
		if ($_REQUEST['idade_min']!="")
		{
			// quero um registro cuja idade minima seja ...
			$whr[] = "nascimento <= '" . (date("Y") - $_REQUEST['idade_min']) . "-" . date("m") . "-" . date("d") . "'";
			$values['idade_min'] = $_REQUEST['idade_min'];
		}
		if ($_REQUEST['idade_max']!="")
		{
			// quero um registro cuja idade maxima seja ...
			$whr[] = "nascimento >= '" . (date("Y") - $_REQUEST['idade_max']) . "-" . date("m") . "-" . date("d") . "'";
			$values['idade_max'] = $_REQUEST['idade_max'];
		}
	}
	
	if ($_REQUEST['altura_min']!="")
	{
		$whr[] = "altura >= " . str_replace(",",".",$_REQUEST['altura_min']);
		$values['altura_min'] = $_REQUEST['altura_min'];
	}
	if ($_REQUEST['altura_max']!="")
	{
		$whr[] = "altura <= " . str_replace(",",".",$_REQUEST['altura_max']);
		$values['altura_max'] = $_REQUEST['altura_max'];
	}
	if ($_REQUEST['peso_min']!="")
	{
		$whr[] = "peso >= " . str_replace(",",".",$_REQUEST['peso_min']);
		$values['peso_min'] = $_REQUEST['peso_min'];
	}
	if ($_REQUEST['peso_max']!="")
	{
		$whr[] = "peso <= " . str_replace(",",".",$_REQUEST['peso_max']);
		$values['peso_max'] = $_REQUEST['peso_max'];
	}
	if ($_REQUEST['busto_min']!="")
	{
		$whr[] = "busto >= " . str_replace(",",".",$_REQUEST['busto_min']);
		$values['busto_min'] = $_REQUEST['busto_min'];
	}
	if ($_REQUEST['busto_max']!="")
	{
		$whr[] = "busto <= " . str_replace(",",".",$_REQUEST['busto_max']);
		$values['busto_max'] = $_REQUEST['busto_max'];
	}
	if ($_REQUEST['cintura_min']!="")
	{
		$whr[] = "cintura >= " . str_replace(",",".",$_REQUEST['cintura_min']);
		$values['cintura_min'] = $_REQUEST['cintura_min'];
	}
	if ($_REQUEST['cintura_max']!="")
	{
		$whr[] = "cintura <= " . str_replace(",",".",$_REQUEST['cintura_max']);
		$values['cintura_max'] = $_REQUEST['cintura_max'];
	}
	if ($_REQUEST['quadril_min']!="")
	{
		$whr[] = "quadril >= " . str_replace(",",".",$_REQUEST['quadril_min']);
		$values['quadril_min'] = $_REQUEST['quadril_min'];
	}
	if ($_REQUEST['quadril_max']!="")
	{
		$whr[] = "quadril <= " . str_replace(",",".",$_REQUEST['quadril_max']);
		$values['quadril_max'] = $_REQUEST['quadril_max'];
	}
	if ($_REQUEST['cabelos_tipo']!="")
	{
		$whr[] = "cabelos_tipo = " . $_REQUEST['cabelos_tipo'];
		$values['cabelos_tipo'] = $_REQUEST['cabelos_tipo'];
	}
	if ($_REQUEST['cabelos_cor']!="")
	{
		$whr[] = "cabelos_cor = " . $_REQUEST['cabelos_cor'];
		$values['cabelos_cor'] = $_REQUEST['cabelos_cor'];
	}
	if ($_REQUEST['olhos']!="")
	{
		$whr[] = "olhos = " . $_REQUEST['olhos'];
		$values['olhos'] = $_REQUEST['olhos'];
	}
	if ($_REQUEST['pele']!="")
	{
		$whr[] = "pele = " . $_REQUEST['pele'];
		$values['pele'] = $_REQUEST['pele'];
	}
	if ($_REQUEST['semcache']!="")
	{
		$whr[] = "semcache=1";
		$values['semcache'] = 1;
	}
	if ($_REQUEST['cachebaixo']!="")
	{
		$whr[] = "cachebaixo=1";
		$values['cachebaixo'] = 1;
	}
	if ($_REQUEST['esporte']!="")
	{
		$whr[] = "esporte=1";
		$values['esporte'] = 1;
	}
	if ($_REQUEST['cavalo']!="")
	{
		$whr[] = "cavalo=1";
		$values['cavalo'] = 1;
	}
	if ($_REQUEST['skate']!="")
	{
		$whr[] = "skate=1";
		$values['skate'] = 1;
	}
	if ($_REQUEST['patins']!="")
	{
		$whr[] = "patins=1";
		$values['patins'] = 1;
	}
	if ($_REQUEST['canta']!="")
	{
		$whr[] = "canta=1";
		$values['canta'] = 1;
	}
	if ($_REQUEST['danca']!="")
	{
		$whr[] = "danca=1";
		$values['danca'] = 1;
	}
	if ($_REQUEST['atua']!="")
	{
		$whr[] = "atua=1";
		$values['atua'] = 1;
	}
	if ($_REQUEST['drt']!="")
	{
		$whr[] = "drt=1";
		$values['drt'] = 1;
	}
	if ($_REQUEST['fotos']!="")
	{
		$whr[] = "fotos=1";
		$values['fotos'] = 1;
	}
	if ($_REQUEST['comerciais']!="")
	{
		$whr[] = "comerciais=1";
		$values['comerciais'] = 1;
	}
	if ($_REQUEST['figuracao']!="")
	{
		$whr[] = "figuracao=1";
		$values['figuracao'] = 1;
	}
	if ($_REQUEST['biquini']!="")
	{
		$whr[] = "biquini=1";
		$values['biquini'] = 1;
	}
	if ($_REQUEST['lingerie']!="")
	{
		$whr[] = "lingerie=1";
		$values['lingerie'] = 1;
	}
	if ($_REQUEST['seminu']!="")
	{
		$whr[] = "seminu=1";
		$values['seminu'] = 1;
	}
	if ($_REQUEST['nu']!="")
	{
		$whr[] = "nu=1";
		$values['nu'] = 1;
	}
	if ($_REQUEST['makingoff']!="")
	{
		$whr[] = "makingoff=1";
		$values['makingoff'] = 1;
	}
	if ($_REQUEST['jingles']!="")
	{
		$whr[] = "jingles=1";
		$values['jingles'] = 1;
	}
	if ($_REQUEST['videoclip']!="")
	{
		$whr[] = "videoclip=1";
		$values['videoclip'] = 1;
	}
	if ($_REQUEST['promocao']!="")
	{
		$whr[] = "promocao=1";
		$values['promocao'] = 1;
	}
	if ($_REQUEST['feiras']!="")
	{
		$whr[] = "feiras=1";
		$values['feiras'] = 1;
	}
	if ($_REQUEST['viagens_brasil']!="")
	{
		$whr[] = "viagens_brasil=1";
		$values['viagens_brasil'] = 1;
	}
	if ($_REQUEST['viagens_exterior']!="")
	{
		$whr[] = "viagens_exterior=1";
		$values['viagens_exterior'] = 1;
	}
	if ($_REQUEST['piercing']!="")
	{
		$whr[] = "piercing=1";
		$values['piercing'] = 1;
	}
	if ($_REQUEST['tatuagem']!="")
	{
		$whr[] = "tatuagem=1";
		$values['tatuagem'] = 1;
	}
	if ($_REQUEST['imagem']!="")
	{
		$whr[] = "imagem!=''";
		$values['imagem'] = 1;
	}
	
	$whr[] = "pendente=0";
	
	$whr = implode(" AND ",$whr);
		
	$pag = $_GET['pag'];
	if ($pag=="" || $pag==0)
		$pag = 1;
	else
		$pag=intval($_GET['pag']);
		
	if ($_REQUEST['o']=="")
		$ord = "nome ASC";
	else
	{
		$ord = $_REQUEST['o'] . " ASC";
	}
	
	$pgn = paginacao(
		"id,nome,nascimento,imagem,cadastro,exibir",
		"modelos",
		$whr,
		$ord,
		$conexao,
		$pag,
		30
	);
	$res = $pgn['res'];
	if ($_GET['pag']=="") $_GET['pag']=1;
		
	while ($tmp = mysql_fetch_assoc($res))
		$dados[] = $tmp;

	$visual->assign('modo',$modo);
	$visual->assign('paginacao',$pgn['paginas']);
	$visual->assign('pag',$pag);
	$visual->assign('build_geturl',build_geturl());
	$visual->assign('subtitulo','Gerenciar Modelos');
	$visual->assign('dados',$dados);
	$visual->assign('values',$values);
	$visual->assign('msg',$msg);
	$visual->display('adm/modelos_listagem.tpl');
}
else if ($modo=="pen")
{
	if (is_numeric($_REQUEST['id']) && $_REQUEST['id']>0)
	{
		if ($processa=="ace")
		{
			bdUpdate(
				"modelos",
				"pendente=0",
				"id = " . $id ,
				$conexao
			);
			$msg = "Cadastro aceito";
			redir("modelos.php?modo=pen&msg=" . urlencode($msg));
		}
		else if ($processa=="rej")
		{
			$res = bdSelect(
					"imagem",
					"modelos",
					"id=" . $id,
					"",
					$conexao
				);
				
				// remove a imagem se existir
				if (mysql_result($res,0,'imagem')!="")
				{
					$deletar = $uppdir . "modelos/" . mysql_result($res,0,'imagem');
					if (is_file($deletar) && file_exists($deletar))
					{
						unlink ($deletar);
					}
				}
				
				// remove a pasta de ensaios, se existir
				$removerdir = $uppdir . "modelos/" . $id;
				removeDir($removedir);
				// remove os registros de ensaios
				bdDelete("ensaios","modelo_id=" . $id,$conexao);
					
				bdDelete("modelos","id=" . $id,$conexao);
				redir("modelos.php?modo=pen&msg=" . urlencode("Exclusão efetuada"));
		}
		$visual->assign('subtitulo','Cadastros Pendentes');
		$visual->assign('submit','Detalhes do cadastro');
		$visual->assign('modo','pen');

		if (!is_numeric($id))
		{
			die("ID faltando para alteração");
		}
		
		$res = bdSelect("*","modelos","id=" . $id,"",$conexao);
		
		if (!bdNumReg($res))
		{
				die("Nenhum registro para o ID '" . $id . "'");
		}
		
		$valores = mysql_fetch_assoc($res);
		$visual->assign('valores',$valores);
		$visual->display('adm/modelos_pendente.tpl');
	}
	else
	{
		if ($_GET['pag']=="") { $pag=1; $_GET['pag']=1; }
		$pgn = paginacao(
			"id,nome,nascimento,imagem,cadastro,exibir",
			"modelos",
			"pendente=1",
			"nome,cadastro",
			$conexao,
			$pag,
			30
		);
		$res = $pgn['res'];
		
			
		while ($tmp = mysql_fetch_assoc($res))
			$dados[] = $tmp;
	
		$visual->assign('modo',$modo);
		$visual->assign('paginacao',$pgn['paginas']);
		$visual->assign('pag',$pag);
		$visual->assign('build_geturl',build_geturl());
		$visual->assign('subtitulo','Gerenciar Modelos - Cadastros Pendentes');
		$visual->assign('dados',$dados);
		$visual->assign('values',$values);
		$visual->assign('msg',$msg);
		$visual->display('adm/modelos_listagem.tpl');
	}
}
else
{
	echo "Modo de uso:<br />";
	echo "modelos.php?modo=cad&nbsp;&nbsp;&nbsp;=> Formulário de cadastro<br />";
	echo "modelos.php?modo=lst&nbsp;&nbsp;&nbsp;=> Listagem para alteração ou exclusão de dados<br />";
	echo "modelos.php?modo=ens&nbsp;&nbsp;&nbsp;=> Listagem para alteração ou exclusão de imagens nos ensaios<br />";
}
?>
