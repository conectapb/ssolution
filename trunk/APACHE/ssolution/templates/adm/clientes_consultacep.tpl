{if $campos[5]!=0}
<script>
    endereco="{$campos[0]} {$campos[1]}";
    bairro="{$campos[2]}";
    cidade="{$campos[3]}";
    uf="{$campos[4]}";
    cep="{$campos[5]}";
    {literal}
    function transfereEndereco(){
        $('#endereco').val(endereco.toUpperCase());
        $('#bairro').val(bairro.toUpperCase());
        $('#cidade').val(cidade.toUpperCase());
        $('#uf').val(uf);
        $('#cep').val(cep);
    }
    {/literal}
</script>
<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><img src="{$tpl_dir}/images/setaverdeesq.jpg" alt="Copiar p/ formulário" border="0" width="16" height="16" hspace="2" vspace="2"  onmouseover="this.style.cursor='pointer';" onclick="transfereEndereco();" /><img src="{$tpl_dir}/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>
<table id="visualizarTbl" width="500" border="0" cellpadding="2" cellspacing="0">

    <tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">CEP :</td>
		<td>{$campos[5]}</td>
	</tr>

	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Endere&ccedil;o :</td>
		<td>{$campos[0]} {$campos[1]}</td>
	</tr>

    <tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Bairro :</td>
		<td>{$campos[2]}</td>
	</tr>

    <tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Cidade :</td>
		<td>{$campos[3]}</td>
	</tr>

    <tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">UF :</td>
		<td>{$campos[4]}</td>
	</tr>
</table>
{else}
<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><img src="{$tpl_dir}/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>
<table width="600" border="0" cellpadding="2" cellspacing="0">
    <tr>
		<td>
            <strong>CEP inexistente</strong>
            <br>
            Por favor contribua com o projeto CEP Livre, confirmando CEP e Endere&ccedil;o
            e adicionando ao banco de dados clicando <a href="http://ceplivre.pc2consultoria.com/index.php?module=cep&event=formeditacep" target="_blank">aqui</a>
            </td>
    </tr>
</table>
{/if}
