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
        <td>OS-I Nº</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Emissão</td>
        <td>campo</td>
    </tr>
    
    <tr>
        <td colspan="2">Dados do cliente</td>
    </tr>

    <tr>
        <td colspan="2">Dados do Contrato</td>
    </tr>

    <tr>
        <td>Solicitação</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Observações</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Agendamento</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Observações</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Execução</td>
        <td>campo</td>
    </tr>

    <tr>
        <td>Observações</td>
        <td>campo</td>
    </tr>

    <tr>
        <td colspan="2">Serviços efetuados / Hardwares instalados</td>
    </tr>

    <tr>
        <td colspan="2">
            <table>
                <thead>
                    <tr>
                        <th>Qtde</th>
                        <th>Unid</th>
                        <th>Descrição</th>
                        <th>R$</th>
                        <th>Custo</th>
                        <th>Observação</th>
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
        <td colspan="2">Listas de Verificações, Fechamento e Aceite da execução da Ordem de Serviço</td>
    </tr>

</table>

{include file=$tpl_adm_rodape}