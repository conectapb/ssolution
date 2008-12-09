{include file=$tpl_adm_topo}

<br />
<strong>Bem-vindo(a), {$admin_nome}</strong>
<br />
{if $admin_ultacesso!=""}
Seu &uacute;ltimo acesso foi em {$admin_ultacesso|date_format:"%d/%m/%Y &agrave;s %H:%M"} pelo IP {$admin_ultacesso_ip}
{/if}

{include file=$tpl_adm_rodape}
