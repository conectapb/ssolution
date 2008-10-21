<?
include("../libs/debuglib.php");
# arquivo com o formato do email interno
$arq = file ('W:\SUPORTE\NetCTBA\pop_centro\servidor_central\bfw_2.30.1\backups\servidor marajo\2008 - 02 - 13\partition\clientes\clientes.cfg');
$estacoes = array();
$macs = array();
$ips = array();
$logins = array();
for($i=0;$i<sizeof($arq);$i++)
{
	if($arq[$i][0]!="#")
	{
		if(preg_match("/station\ */", $arq[$i]))
		{
			$station = explode(" ",$arq[$i]);
			if($station[1]=="ATIVA_SIM")
			{
				$estacoes[] = $station;

				$busca_mac = array_search($station[5],$estacoes);
				if($busca_mac) { echo "MAC REPETIDO!! MAIS INFORMAÇOES DA ESTACAO CONFLITANTE:<BR>"; print_a($station); exit();}
				$macs[]=$station[5];
				
				$busca_ip = array_search($station[2],$estacoes);
				if($busca_ip) { echo "IP REPETIDO!! MAIS INFORMAÇOES DA ESTACAO CONFLITANTE:<BR>"; print_a($station); exit();}
				$ips[]=$station[5];
				
				if($station[13]=="" || $station[13]=="")
				{
					echo "PROBLEMAS COM O STATUS DO EC!! MAIS INFORMACOES DA ESTACAO COM PROBLEMA:<BR>";
					print_a($station); exit();
				}
				
				if(trim($station[13])!="OFF")
				{
					if($station[14]=="")
					{
						echo "LOGIN ESTA VAZIO E NAO DEVERIA!! MAIS INFORMAÇOES DA ESTACAO CONFLITANTE:<BR>";
						print_a($station); exit();
					}
					
					$busca_login = array_search($station[14],$estacoes);
					if($busca_login) { echo "PROBLEMAS COM LOGIN!! MAIS INFORMAÇOES DA ESTACAO CONFLITANTE:<BR>"; print_a($station); exit();}
					$logins[]=$station[14];
				}
				else $not_ec_off++;
			}
		}
	}
}
echo(sizeof($macs)."<br>");
echo(sizeof($ips)."<br>");
echo(sizeof($logins)."<br>");
echo($not_ec_off."<br>");
echo(sizeof($estacoes)."<br>");
print_a($logins);
?>