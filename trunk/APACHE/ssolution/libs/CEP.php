<?php
class CEP {
	private $status;
	private $tipoLogradouroId;
	private $tipoLogradouroDesc;
	private $logradouro;
	private $bairrro;
	private $cidade;
	private $uf;
	private $ufSigla;
	private $ufId;
	private $cep;
	
	function __construct($status, $tipoLogradouroDesc, $tipoLogradouroId, $logradouro, $bairro, $cidade, $uf, $ufSigla, $ufId, $cep) {
		$this->status = $status;
		$this->tipoLogradouroId = $tipoLogradouroId;
		$this->tipoLogradouroDesc = $tipoLogradouroDesc;
		$this->logradouro = $logradouro;
		$this->bairro = $bairro;
		$this->cidade = $cidade;
		$this->uf = $uf;
		$this->ufSigla = $ufSigla;
		$this->ufId = $ufId;
		$this->cep = $cep;
	}
	
	public function getStatus() {
		return $this->status;
	}
	
	public function getTipoLogradouroId() {
		return $this->tipoLogradouroId;
	}
	
	public function getTipoLogradouroDesc() {
		return $this->tipoLogradouroDesc;
	}
	
	public function getLogradouro() {
		return $this->logradouro;
	}
	
	public function getBairro() {
		return $this->bairro;
	}
	
	public function getCidade() {
		return $this->cidade;
	}
	
	public function getUf() {
		return $this->uf;
	}
	
	public function getUfSigla() {
		return $this->ufSigla;
	}
	
	public function getUfId() {
		return $this->ufId;
	}
	
	public function getCep() {
		return $this->cep;
	}
	
}
?>