<?
// Biblioteca de envio de emails via SMTP
require("phpmailer/class.phpmailer.php");

# lista de emails que vao receber os dados enviados, separados por virgula
$emails_internos = "smart@smartsolution.com.br";

# campos do formulario
$campos = explode(",","nome,email,fone_residencial_ddd,fone_residencial,fone_comercial_ddd,fone_comercial,fone_celular_ddd,fone_celular,logradouro,logradouro_numero,complemento,cep,tipo_imovel,nome_condominio,nome_sindico,seu_bloco,seu_apto,assunto,mensagem");

# data corrente
$data = date("d/m/Y H:i");

# arquivo com o formato do email interno
$formato = implode ('', file ('email.html'));

// leitura dos campos e adicao da data
foreach($campos as $campo)
{
	$valores[$campo] = $_REQUEST[$campo];
	$formato = str_replace("<#" . $campo . "#>",$valores[$campo],$formato);
}
$formato = str_replace("<#data#>",$data,$formato);

// configuracoes de envio
$mail = new PHPMailer();
$mail->IsSMTP();
$mail->Host     = "mail.smartsolution.com.br";
$mail->SMTPAuth = true;
$mail->IsHTML(true);
$mail->Username = "contato@smartsolution.com.br";
$mail->Password = "iguarassu";
$mail->From     = "contato@smartsolution.com.br";
$mail->FromName = "Smart Solution TI";
$mail->Subject  =  "Novo contato pelo site www.smartsolution.com.br";
$mail->Body     =  $formato;
$mail->AddReplyTo($valores['email'] ,$valores['nome'] );

// leitura dos emails de destino
$destinos = explode(",",$emails_internos);
foreach($destinos as $destino)
	$mail->AddAddress($destino,""); 

// envio propriamente dito, com tratamento de erro	
if(!$mail->Send())
{
   echo "Message was not sent <p>";
   echo "Mailer Error: " . $mail->ErrorInfo;
   exit;
}

// se formulario foi preenchido com email, envia retorno ao cliente
if ($valores['email']!="" && false)
{
	// arquivo com o formato do email ao cliente
	$formato = implode ('', file ('resposta.html'));
	$mail->ClearAllRecipients();
	$mail->AddAddress($valores['email'] ,$valores['nome'] );
	$mail->Subject  =  "Informações recebidas com sucesso";	
	$mail->Body     =  $formato;
	$mail->AddReplyTo("smart@smartsolution.com.br" , "Smart Solution TI" );
	$mail->Send();
}

header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
	
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
	
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
	
header("Pragma: no-cache");
header('Location: obrigado.html');

?>