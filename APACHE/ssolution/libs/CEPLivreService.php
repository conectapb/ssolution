<?php
require("CEP.php");
/*
	Por Christian Benseler
	URL: http://www.chtisb.com.br
	Service para acessar o sistema CEP Livre: consulta de endereço por CEP
	requisiçnao feita por POST com retorno em formato XML
	URL do projeto: http://www.pc2consultoria.com/index.php?option=com_content&task=view&id=298&Itemid=73
	Data do release: 05.02.2009


	This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

class CEPLivreService {
	private $address;
	private $xml;
	private $doc;
	private $serviceUrl = "http://ceplivre.pc2consultoria.com/index.php";
	private $module = "cep";
	private $format = "xml";
	
	function __construct() {
		$this->doc = new DOMDocument();
		//$this->address = new CEP();
	}
	
	function buscaEndereco($cep) {
		$path = $this->serviceUrl . "?module=" . $this->module . "&format=" . $this->format . "&cep=" . $cep;
		$this->doc->load($path);
		$this->readNodes();
		return $this->address;
	}
	
	private function readNodes() {
		$dataset = $this->doc->getElementsByTagName("ceplivre");
		foreach($dataset as $item) {
		
			$status = $item->getElementsByTagName("sucesso")->item(0)->nodeValue;
			if($status==1) {
			$this->address = new CEP(1,
						   $item->getElementsByTagName("tipo_logradouro")->item(0)->nodeValue,
						   $item->getElementsByTagName("tipo_logradouro_id")->item(0)->nodeValue,
						   $item->getElementsByTagName("logradouro")->item(0)->nodeValue,
						   $item->getElementsByTagName("bairro")->item(0)->nodeValue,
						   $item->getElementsByTagName("cidade")->item(0)->nodeValue,
						   /* troquei a posicao para ele acertar estado e estado_sigla */
						   $item->getElementsByTagName("estado")->item(0)->nodeValue,
                           $item->getElementsByTagName("estado_sigla")->item(0)->nodeValue,
						   $item->getElementsByTagName("estado_id")->item(0)->nodeValue,
						   $item->getElementsByTagName("cep")->item(0)->getElementsByTagName("cep")->item(0)->nodeValue);
			} else {
				$this->address = new CEP(0, "", "", "", "", "", "", "", "", $item->getElementsByTagName("cep")->item(0)->getElementsByTagName("cep")->item(0)->nodeValue);
			}				   
		
		}
	}
	
	function hasAddress($cep) {
		$dataset = $this->doc->getElementsByTagName("ceplivre");
		foreach($dataset as $item) {
		
			$status = $item->getElementsByTagName("sucesso")->item(0)->nodeValue;
			if($status==1) {
				return true;
			} else {
				return false;
			}				   
		
		}
	
	}
	
	
}

?>