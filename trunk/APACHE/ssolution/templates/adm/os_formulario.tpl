{include file=$tpl_adm_topo}
{debug}

<script language="javascript" src="{$tpl_dir}/js/scw.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.form.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.field.js"></script>

<script>
    var campos = new Array();
    var inc_ano = 0;
    var ultimo_codigo="{$ultimo_codigo}";
    var modo="{$modo}";

    {literal}
    
    $(document).ready(function() {
        
    });
    
    {/literal}
</script>

<table>
    <tr>
        <td>OS-I N�</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Emiss�o</td>
        <td>campo</td>
    </tr>
    
    <tr>
        <td colspan="2">Dados do cliente</td>
    </tr>

    <tr>
        <td colspan="2">Dados do Contrato</td>
    </tr>

    <tr>
        <td>Solicita��o</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Observa��es</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Agendamento</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Observa��es</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Execu��o</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Observa��es</td>
        <td>campo</td>
    </tr>

    <tr>
        <td colspan="2">Servi�os efetuados / Hardwares instalados</td>
    </tr>

    <tr>
        <td colspan="2">
            <table>
                <thead>
                    <tr>
                        <th>Qtde</th>
                        <th>Unid</th>
                        <th>Descri��o</th>
                        <th>R$</th>
                        <th>Custo</th>
                        <th>Observa��o</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                    </tr>
                    <tr>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                    </tr>
                    <tr>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                    </tr>
                    <tr>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                    </tr>
                    <tr>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                        <td>campo</td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>

    <tr>
        <td colspan="2">Listas de Verifica��es, Fechamento e Aceite da execu��o da Ordem de Servi�o</td>
    </tr>

</table>

{include file=$tpl_adm_rodape}