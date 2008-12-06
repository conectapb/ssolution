<?
require('configs.php');

define('S_ATIVA',1);
define('S_IP',2);
define('S_DHCP',3);
define('S_FW',4);
define('S_MAC',5);
define('S_QOS',6);
define('S_QOS_DR',7);
define('S_QOS_DC',8);
define('S_QOS_UR',9);
define('S_QOS_UC',10);
define('S_CLIMIT',11);
define('S_IPTRAF',12);
define('S_EC_STATUS',13);
define('S_EC_LOGIN',14);

function validateIpAddress($ip_addr)
{
  //first of all the format of the ip address is matched
  if(preg_match("/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/",$ip_addr))
  {
    //now all the intger values are separated
    $parts=explode(".",$ip_addr);
    //now we need to check each part can range from 0-255
    foreach($parts as $ip_parts)
    {
      if(intval($ip_parts)>255 || intval($ip_parts)<0)
      return false; //if number is not within range of 0-255
    }
    return true;
  }
  else
    return false; //if format of ip address doesn't matches
}

function validateMacAddress($mac_addr)
{
  return preg_match("/^\$/",$mac_addr);
}

$arquivo = file ('clientes.cfg');
//print_a($formato);

foreach($arquivo as $linha)
{
	$erros=0;
	$boom = explode(" ",$linha);
	switch($boom[0])
	{
		case "grupo_inicia" :
			# grupo_inicia EdMarajo 10.11.Y.Z radio_mkt
			echobr($linha);
			$total_grupos++;
			break;
		case "cliente" :
			# cliente # AP10 # Isabel 
			echobr($linha);
			$total_clientes++;
			break;
		case "station" :
			# station ATIVA_SIM 10.12.7.1 DHCP_SIM FW_SIM 00:1D:7D:FE:4F:75 QOS_SIM 320 320 160 160 16 IPTRAF_SIM NAUT_LIB Diogo
			//list(,$ativa,$ip,$dhcp,$fw,$macaddr,$qos,$qos_dr,$qos_dc,$qos_ur,$qos_uc,$connlimit,$iptraf,$ec_status,$ec_login) = explode(" ",$linha);
			$station = explode(" ",$linha);
			print_a($station);
			
			if($station[S_ATIVA]!="ATIVA_SIM" && $station[S_ATIVA]!="ATIVA_NAO")
			{
				$erros++;
				echo "Erro em S_ATIVA!!";
			}

			if(!validateIpAddress($station[S_IP]))
			{
				$erros++;
				echo "Erro em S_IP!!";
			}
			
			if($station[S_DHCP]!="DHCP_SIM" && $station[S_DHCP]!="DHCP_NAO")
			{
				$erros++;
				echo "Erro em S_DHCP!!";
			}
			
			if(validateMacAddress($station[S_MAC]))
			{
				$erros++;
				echo "Erro em S_MAC!!";
			}
						
			$total_stations++;
			break;
	}
}
?>