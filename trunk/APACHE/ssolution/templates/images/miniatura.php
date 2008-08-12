<?
include('configs.php');

$x_final = 180;
$y_final = 240;
$id = $_GET['id'];

if(is_numeric($id) && $id>0)
{
	$res = bdSelect(
		"imagem",
		"modelos",
		"id=" . $id,
		"imagem<>'' LIMIT 1",
		$conexao
	);
	
	if(bdNumReg($res))
	{
		$arquivo = mysql_result($res,0,'imagem');
		$extensao = strtolower(strrchr($arquivo,'.'));
		$path = $uppdir . "modelos/";
		
		$size = getimagesize($path.$arquivo);
		$x_inicial = $size[0];
		$y_inicial = $size[1];
		
		$wm = ImageCreateFromGIF("templates/images/estrela.gif");
		$wm_size = getimagesize("templates/images/estrela.gif");
		
		$dest_x = $x_final - $wm_size[0] - 5;  
		$dest_y = $y_final - $wm_size[1] - 5;
				
		switch($extensao)
		{
			case '.jpg':
				$img = ImageCreateFromJPEG($path.$arquivo);
				
				$min = ImageCreateTrueColor($x_final,$y_final);
				$cor_cinza = imagecolorallocate($min, 204, 204, 204);
				imagecopyresampled($min, $img, 0, 0, 0, 0, $x_final, $y_final, $x_inicial, $y_inicial);
				imagerectangle($min,0,0,$x_final-1,$y_final-1,$cor_cinza);
				
				header("Content-type: {$size['mime']}");
				imagecopymerge($min, $wm, $dest_x, $dest_y, 0, 0, $wm_size[0], $wm_size[1], 100);
				
				ImageJPEG($min);
				break;
			case '.gif':
				$img = ImageCreateFromGIF($path.$arquivo);
				
				$min = ImageCreateTrueColor($x_final,$y_final);
				$cor_cinza = imagecolorallocate($min, 204, 204, 204);
				imagecopyresampled($min, $img, 0, 0, 0, 0, $x_final, $y_final, $x_inicial, $y_inicial);
				imagerectangle($min,0,0,$x_final-1,$y_final-1,$cor_cinza);
				
				header("Content-type: {$size['mime']}");
				ImageGIF($min);
				break;
			case '.png':
				$img = ImageCreateFromPNG($path.$arquivo);
				
				$min = ImageCreateTrueColor($x_final,$y_final);
				$cor_cinza = imagecolorallocate($min, 204, 204, 204);
				imagecopyresampled($min, $img, 0, 0, 0, 0, $x_final, $y_final, $x_inicial, $y_inicial);
				imagerectangle($min,0,0,$x_final-1,$y_final-1,$cor_cinza);
				
				header("Content-type: {$size['mime']}");
				ImagePNG($min);
				break;
			default:
				die("imagem nao criada");
		}
		imagedestroy($img);
	}
}

/*$extensao = strtolower(strrchr($nome,'.'));

if(file_exists($arquivo))
{
	$img = ImageCreateFromJPEG($arquivo);
	$header = "Content-type: image/JPEG";
	$x_inicial = ImagesX($img);
	$y_inicial = ImagesY($img);
	
	$min = ImageCreateTrueColor($x_final,$y_final);
	$cor_cinza = imagecolorallocate($min, 204, 204, 204);
	imagecopyresampled($min, $img, 0, 0, 0, 0, $x_final, $y_final, $x_inicial, $y_inicial);
	imagerectangle($min,0,0,$x_final-1,$y_final-1,$cor_cinza);
	header($header);
	
	ImageJPEG($min);
	imagedestroy($min);
	imagedestroy($img);
}
*/
?>