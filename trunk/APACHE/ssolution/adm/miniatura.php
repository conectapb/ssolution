<?
$arquivo = $_REQUEST['imagem'];
$x_final = 150;
$y_final = 200;

if(file_exists($arquivo))
{
	$img = ImageCreateFromJPEG($arquivo);
	$header = "Conten 	t-type: image/JPEG";
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
?>