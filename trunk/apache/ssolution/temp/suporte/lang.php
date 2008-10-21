<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License

	------------------------------------------------------------

	This file holds the language/regional data for eTicket

	If the phrase or word you are looking for is not in here, its either:
	not editable, part of a theme or I missed one.

	I may add this into the database once the next stages are complete
*/

/*

Notice for alternative language users:

If you have a language file, include it at the top here, eg:

	include_once('lang.es.php');

Because a define cannot be "re-defined" (unless unset first), this is the ideal solution.
Therefore it must appear above the default language defines below.

This way we ensure that your language details are defined, and not over-written,
 plus any newly defined ones will appear in english.

*/
//include_once('lang.pt_BR.php');
define('LANG_VERSION','1.5.6'); // created for this version of eTicket
define('LANG_COUNTRY','GB'); // ISO_3166-1 alpha-2 country code
define('LANG_CODE','en'); // ISO_639-1 language code
define('LANG_FATAL_ERROR','Erro Fatal');
define('LANG_ERROR','Erro');
define('LANG_WELCOME','Bem-vindo');
define('LANG_REMOVE_FOR_SECURITY_REASONS','Deve ser removido por raz�es de seguran�a.');
define('LANG_INC_DIR_NOT_EXIST','Diret�rio de Includes n�o existe.');
define('LANG_DB_COULD_NOT_CONNECT','N�o foi poss�vel conectar � base de dados.');
define('LANG_COULD_NOT_GET_CONF','N�o foi poss�vel recuperar informa��es da base de dados.');
define('LANG_FIX_ABOVE_ERRORS','Por favor corriga os erros acima.');
define('LANG_ERROR_ATTACHMENTS_DIR','Diret�rio de anexos faltando ou n�o-grav�vel');
define('LANG_ERROR_BAD_FILETYPE','� um tipo de arquivo n�o suportado.');
define('LANG_ERROR_NOT_POSTED','N�o foi poss�vel submeter sua mensagem.');
define('LANG_ERROR_MISSING_FIELDS','H� campos requeridos faltando.');
define('LANG_ERROR_INVALID_PASS','Senha inv�lida.');
define('LANG_ERROR_USER_EXISTS','Usu�rio j� existe.');
define('LANG_ERROR_PASSWORD_NOMATCH','Senha n�o confere.');
define('LANG_ERROR_ATTACHMENT_DIR','Diret�rio de anexos n�o encontrado.');
define('LANG_ERROR_CAT_EXISTS','Categoria j� existe.');
define('LANG_ERROR_GROUP_EXISTS','Grupo de Usu�rios j� existe.');
define('LANG_ERROR_ONE_REP','Deve ter pelo menos um Representante.');
define('LANG_ERROR_NAME_EXISTS','Nome j� existe.');
define('LANG_ERROR_REP_USER_EXISTS','Usu�rio do Representante j� existe.');
define('LANG_ERROR_ADMIN_GROUP_NOMOD','Grupo Administrador n�o pode ser alterado.');
define('LANG_ERROR_ADMIN_GROUP_NODEL','Grupo Administrador n�o pode ser exclu�do.');
define('LANG_ERROR_GROUP_INUSE','Grupo n�o pode ser exclu�do por ainda estar em uso.');
define('LANG_FAILED','Falhou');
define('LANG_TRANS_FROM','Transferido de');
define('LANG_TRANS_NOTE','Nota de transfer�ncia');
define('LANG_TRANSFER','Transfer�ncia');
define('LANG_SEND_ALERT','Enviar Aviso?');
define('LANG_OPT_MSG','Mensagem Opcional');
define('LANG_ATTACHMENT','Anexo');
define('LANG_HEADERS','Cabe�alhos');
define('LANG_CAT','Categoria');
define('LANG_ERROR_IMAP','PHP parece no estar compilado com as <a href="http://www.php.net/imap"> fun��es de imap</a>, usadas para POP3.');
define('LANG_ERROR_UNABLE_TO_OPEN_MAILBOX','Incapaz de abrir a caixa de e-mails para a categoria');
define('LANG_LOGIN_TIP','Se esta � sua primeira vez solicitando suporte, por favor utilize o formul�rio "Abrir Ticket" abaixo para iniciar uma nova solicita��o de suporte. Caso contr�rio, se desejar visualizar a situa��o de uma solicita��o existente, preencha o formul�rio "Ver Status"');
define('LANG_OPENED_TICKET_SUBJECT','Novo Ticket Aberto');
define('LANG_OPENED_TICKET_MSG',"Um Ticket de suporte foi criado. Em breve, um de nossos representantes estrar em contato. Um e-mail contendo o ID do ticket rec�m-aberto foi enviado. Voc� precisa deste ID, juntamente com seu e-mail, para visualizar o status de seu ticket .\n\nNOTA: Se voc� desejar enviar informa��es adicionais a respeito deste ticket, por favor n�o abra outro ticket. Ao inv�s disso, envie as informa��es adicionais respondendo ao e-mail que lhe foi enviado.<br>\n\n- A Equipe de Suporte");
define('LANG_VIEW_STATUS','Ver Status');
define('LANG_EMAIL','E-mail');
define('LANG_YOUR_EMAIL','Seu e-mail');
define('LANG_TICKET_ID','Ticket ID');
define('LANG_STATUS','Status');
define('LANG_SUBJECT','Assunto');
define('LANG_NAME','Nome');
define('LANG_IP','IP');
define('LANG_PHONE','Telefone');
define('LANG_PRIORITY','Prioridade');
define('LANG_QUERY','Consulta');
define('LANG_SORT_BY','Ordenar por');
define('LANG_DATE','Data');
define('LANG_ASC','Ascendente');
define('LANG_DES','Descendente');
define('LANG_SEARCH','Busca');
define('LANG_BASIC','B�sico');
define('LANG_ADVANCED','Avan�ado');
define('LANG_RESULTS_PP','Resultados por p�gina');
define('LANG_TICKETS_PP','Tickets por p�gina');
define('LANG_SEARCH_TICKETS','Buscar Tickets');
define('LANG_TICKETS_FOUND','Ticket(s) Encontrados');
define('LANG_ERROR_NO_SUBJECT','Por favor especifique um assunto.');
define('LANG_ERROR_NO_NAME','Por favor informe seu nome.');
define('LANG_ERROR_NO_MSG','Por favor preencha a mensagem.');
define('LANG_ERROR_INVALID_EMAIL','Por favor informe um e-mail v�lido.');
define('LANG_WARN_ATTACH_REM','Anexo removido');
define('LANG_ERROR_UPLOAD_SECURITY','erro de segurana de upload');
define('LANG_ERROR_NO_ATTACH','Anexos est�o desabilitados');
define('LANG_ATTACHMENTS','Anexos');
define('LANG_ERROR_LOGIN','Voc� informou dados de login inv�lidos. Por favor tente novamente..');
define('LANG_LOGIN_PLEASE','Por favor, acesse');
define('LANG_USER','Usu�rio');
define('LANG_PASS','Senha');
define('LANG_NPASS','Nova Senha');
define('LANG_VPASS','Verifique Senha');
define('LANG_LOGIN','Acesse');
define('LANG_ADD','Adicionar');
define('LANG_REPLY_TO_MSG','Responder mensagem');
define('LANG_PRIV_MSG','Mensagem Privada');
define('LANG_REPLY_AND_CLOSE','Responder e fechar');
define('LANG_PRIV_MSGS','Mensagens Privadas');
define('LANG_GROUP','Grupo');
define('LANG_SIGNATURE','Assinatura');
define('LANG_ERROR_DENIED','Erro 403: Acesso negado.');
define('LANG_ERROR_NOTFOUND','Erro 404: N�o encontrado.');
define('LANG_BACK_TO_MAIN','Voltar � principal');
define('LANG_BACK_TO_LIST','Voltar � lista');
define('LANG_EDIT','Editar');
define('LANG_COPY','Copiar');
define('LANG_EDIT_BANNED','Editar banido');
define('LANG_CONFIRM_DELETE','Confirmar exclus�o');
define('LANG_DELETE','Exclus�o');
define('LANG_DELETE_BANNED','Deletar banido');
define('LANG_ADD_COPY_BANNED','Adicionar/copiar banido');
define('LANG_CREATE_REP','Criar Representante');
define('LANG_SAVE_CHANGES','Salvar altera��es');
define('LANG_CREATE_CAT','Criar Categoria');
define('LANG_VIEW','Visualizar');
define('LANG_OPEN','Abrir');
define('LANG_OPEN_TICKET','Abrir Ticket');
define('LANG_RESET','Ressetar');
define('LANG_ADD_NEW','Adicionar Novo');
define('LANG_TICKETS','Tickets');
define('LANG_TICKET','Ticket');
define('LANG_FROM','De');
define('LANG_TO','Para');
define('LANG_HOST','Host');
define('LANG_HIDDEN','Oculto');
define('LANG_UM','UM');
define('LANG_DEPT','Departamento');
define('LANG_LOW','Baixo');
define('LANG_NORMAL','Normal');
define('LANG_HIGH','Alto');
define('LANG_ENABLE','Ativo');
define('LANG_ANS_TICKETS','Tickets Respondidos');
define('LANG_NEW_TICKET_REPLY','Nova Resposta a Ticket');
define('LANG_NEW_TICKET_REPLY_INFO','Voc� pode definir a mensagem que ser exibida toda vez que um ticket � aberto.');
define('LANG_MSG','Mensagem');
define('LANG_VARS','Vari�veis');
define('LANG_VAR_EMAIL',"E-mail do Usu�rio");
define('LANG_VAR_SUBJECT','Assunto do e-mail');
define('LANG_VAR_MESSAGE','Mensagem Recebida');
define('LANG_VAR_NAME','Nome do usu�rio');
define('LANG_VAR_DATETIME','Data e Hora no momento do envio');
define('LANG_ROOT_URL','URL Raiz');
define('LANG_NEW_MSG_REPLY','Nova Resposta � Mensagem');
define('LANG_NEW_MSG_REPLY_INFO','Voc� pode definir a mensagem que ser exibida sempre que uma resposta for feita a um ticket.');
define('LANG_TICKET_LIMIT_REPLY','Limite de Resposta a Ticket');
define('LANG_TICKET_LIMIT_REPLY_INFO','Esta mensagem ser exibida quando um usu�rio alcanar o m�ximo de tickets abertos, definido nas prefer�ncias.');
define('LANG_TICKET_MAX_VAR','M�ximo de tickets abertos que um usu�rio pode ter (veja prefer�ncias).');
define('LANG_CAT_TRANS_NOTICE','Notifica��o de Transfer�ncia de Categoria');
define('LANG_CAT_TRANS_NOTICE_INFO','Esta mensagem ser exibida quando uma mensagem for transferida para uma categoria diferente.');
define('LANG_CAT_NAME_VAR','Nome da categoria transferido para');
define('LANG_TRANS_MSG_VAR','Nota de Transfer�ncia de Representante.');
define('LANG_EMAIL_ALERT','Aviso de E-mail');
define('LANG_EMAIL_ALERT_INFO','Esta mensagem ser� exibida somente ao Admin quando o sistema tiver recebido uma nova mensagem.');
define('LANG_ADDR_TO_EMAIL','Endere�os para E-mail');
define('LANG_FROM_EMAIL','De E-mail');
define('LANG_MSG_VAR','Conte�do da requisi��o do ticket.');
define('LANG_WARNING','ALERTA');
define('LANG_ACC_ATTACH','Aceitar arquivos anexos');
define('LANG_ACC_ATTACH_TIP','Antes de habilitar este recurso voc� precisa configurar o diret�rio de anexos e estar ciente dos riscos que este recurso representa.');
define('LANG_MAX_FILE_SIZE','Tamanho M�ximo do Arquivo (bytes)');
define('LANG_ATTACH_URL_PATH','URL do Anexo');
define('LANG_ATTACH_DIR','Diretrio de Anexos');
define('LANG_ATTACH_DIR_TIP','Este diret�rio PRECISA existir e PRECISA ser grav�vel (chmod 777) antes dos anexos serem habilitados. (Nota:  deve ter uma / no final)');
define('LANG_ACC_FILE_TYPES','Tipos de Arquivo Aceitos');
define('LANG_REM_TYPE','Remover Tipo');
define('LANG_MAIL','Mail');
define('LANG_ANS_METHOD','M�todo de Resposta');
define('LANG_SAVE_EMAIL_HEADERS','Salvar Cabe�alhos de E-mails');
define('LANG_MIN_EMAIL_INT','Intervalo M�nimo E-mails (segundos)');
define('LANG_MAX_OPEN_TICKETS','M�ximo de Tickets Abertos');
define('LANG_REM_ORIGINAL_EMAIL','Remover E-mail Original');
define('LANG_REM_TAG','Remo��o de TAG');
define('LANG_MISC','Diversos');
define('LANG_SEARCH_ON_MAIN','Busca na P�gina Principal');
define('LANG_PREF_TIMEZONE','Timezone preferida');
define('LANG_NO_ANS_MSGS','Quantidade de Ultimas Respondidas para exibir');
define('LANG_TIME_FORMAT','Formato do tempo');
define('LANG_ANSWERED','Respondido');
define('LANG_CLOSED','Fechado');
define('LANG_CLOSE','Fechar');
define('LANG_IN_PROGRESS','Em processamento...');
define('LANG_VIEW_OPEN','Ver aberto');
define('LANG_VIEW_ANSWERED','Ver respondido');
define('LANG_VIEW_CLOSED','Ver fechado');
define('LANG_REOPEN','Reabrir');
define('LANG_REFRESH','Recarregar');
define('LANG_GROUP_ACCESS','Acesso de Grupo');
define('LANG_REP','Representante');
define('LANG_CREATE_USER_GROUP','Criar grupo de usu�rios');
define('LANG_QUICK_SEARCH','Busca Rpida');
define('LANG_SHOW_ALL','Exibir todos (Reset)');
define('LANG_EXACT_PHRASE','Frase exata');
define('LANG_ALL_WORDS','Todas as palavras');
define('LANG_ANY_WORD','Qualquer palavra');
define('LANG_DEL_SEL','Excluir Selecionados');
define('LANG_SELECT','Selecionar');
define('LANG_SELECT_ALL','Selecionar Todos');
define('LANG_UNSELECT','Deselecionar');
define('LANG_PREV','Anterior');
define('LANG_NEXT','Prximo');
define('LANG_INVALID_RECORD','Registro inv�lido! Chave  nula.');
define('LANG_ADD_TO_BANLIST','Adicionar para a Ban List');
define('LANG_NO_RECORDS_FOUND','Nenhum registro encontrado');
define('LANG_TITLE_MY','Minha Conta');
define('LANG_TITLE_CAT','Categorias');
define('LANG_TITLE_REP','Representantes');
define('LANG_TITLE_GROUPS','Grupos de Usu�rios');
define('LANG_TITLE_PREF','Prefer�ncias');
define('LANG_TITLE_MAIL','Respostas Mail');
define('LANG_TITLE_BANLIST','Ban List');
define('LANG_TITLE_VIEWTICKET','Ver Ticket');
define('LANG_TITLE_ADMIN_LOGIN','Login Administrador');
define('LANG_TITLE_USER_LOGIN','Login');
define('LANG_LAST','ltimo');
define('LANG_PAGE','P�gina');
define('LANG_ERROR_MUST_BE_LOGGED_IN','Voc� precisa estar logado para usar este recurso');
define('LANG_HELP','Ajuda');
define('LANG_HELP_BODY','<p>Posicione e mantenha seu mouse sobre os cabealhos da tabela, uma dica aparecer<br><small>* indica que h uma mensagem privada.</small></p>');
define('LANG_TIP_TICKET','o id do ticket, gerado automaticamente');
define('LANG_TIP_DATE','quando o ticket foi iniciciado');
define('LANG_TIP_SUBJECT','assunto do ticket');
define('LANG_TIP_CAT','categoria a qual o ticked foi atribudo');
define('LANG_TIP_PRIORITY','quo importante o ticket  para o usu�rio');
define('LANG_TIP_FROM','quem iniciou o ticket');
define('LANG_TIP_UM','nmero de mensagens no respondidas');
define('LANG_TIP_CLOSE','fecha um ticket selecionado');
define('LANG_TIP_VIEW_ANSWERED','ver tickets respondidos por servio ao cliente');
define('LANG_TIP_VIEW_OPEN','ver tickets abertos');
define('LANG_TIP_VIEW_CLOSED','ver tickets fechados');
define('LANG_TIP_REOPEN','re-abre um ticket aberto');
define('LANG_TIP_REFRESH','recarrega p�gina');
define('LANG_TIP_DELETE','deleta os tickets selecionados');
define('LANG_DELETE_CONFIRM','Voc� tem certeza que deseja excluir?');
define('LANG_CAPTCHA_TITLE','Cdigo de Segurana');
define('LANG_ERROR_CAPTCHA','Voc� informou um cdigo de segurana inv�lido');
define('LANG_SUBMIT','Enviar');
define('LANG_ERROR_VALUE_EMPTY','Valor no pode ser vazio, por favor insira texto');
define('LANG_BANLIST_RECORD_TOTAL','Registros %start a %stop de %total');
define('LANG_ALL','Todos');
define('LANG_DAYS','Dias');
define('LANG_PAGES','P�ginas');
define('LANG_WITHIN_LAST','Dentro Do �ltimo');
define('LANG_NO_TICKETS','No h� tickets para exibir');
define('LANG_PREDEFINED','Pr�-definido');
define('LANG_OPEN_TICKETS','Tickets Abertos');
define('LANG_ANSWERED_TICKETS','Tickets Respondidos');
define('LANG_CLOSED_TICKETS','Tickets Fechados');
define('LANG_ADVANCED_SEARCH','Busca Avanada');
define('LANG_BASIC_SEARCH','Busca Bsica');
define('LANG_USE_DATES','Usar Datas');
define('LANG_BETWEEN','Entre');
define('LANG_NEWTICKET','Este ticket foi criado para voc� por um representante.');
define('LANG_BIGGER','Maior');
define('LANG_SMALLER','Menor');
define('LANG_UP_ERR_NODATA','Arquivo n�o enviado');
define('LANG_UP_ERR_EMPTY','Arquivo vazio enviado');
define('LANG_UP_ERR_TOOLONG','Nome do arquivo muito longo');
define('LANG_UP_ERR_INVALIDPATH','Caminho de Upload inv�lido');
define('LANG_UP_ERR_WRITEPATH','Caminho de Upload N�O grav�vel');
define('LANG_UP_ERR_NOFILE','N�o � um aquivo enviado');
define('LANG_UP_ERR_INVALIDTYPE','Tipo de arquivo inv�lido');
define('LANG_UP_ERR_TOOBIG','Arquivo � muito grande');
define('LANG_UP_ERR_TOOSMALL','Arquivo � muito pequeno');
define('LANG_UP_ERR_EXISTS','Arquivo j� existe');
define('LANG_UP_ERR_FAILED','Upload falhou');
define('LANG_ANSWER','Resposta');
define('LANG_OPTIONAL','Opcional');
define('LANG_SYSTEM_TIMEZONE','Timezone do sistema');
define('LANG_LOCKED','Bloqueado');
define('LANG_EMAIL_CONFIRM','Confirmar E-mail');
define('LANG_ERROR_EMAIL_NOMATCH','Endere�os de E-mail no conferem.');
define('LANG_TIP_REP','representante ao qual o ticket foi designado');
define('LANG_REP_TRANS_NOTICE','Notifi��o de Transfer�ncia de Representante');
define('LANG_REP_TRANS_NOTICE_INFO','Esta mensagem ser exibida quando uma mensagem for transferida para outro representante.');
define('LANG_REP_NAME_VAR','Nome do representante transferido para.');
define('LANG_SETTINGS','Configura��es');
define('LANG_THEME','Tema');
define('LANG_SHORT_DATE_FORMAT','Formato curto de data');
define('LANG_CHARSET','Codifi��o de caracteres (charset)');
define('LANG_PRESIG','Separador de assinatura (pode ser vazia)');
define('LANG_SITE_TITLE','T�tulo do Site');
define('LANG_NO_SUBJECT','Sem Assunto');
define('LANG_TICKET_FORMAT','Formato do Ticket');
define('LANG_SUBJECT_RE','Prefixo do Assunto de Resposta');
define('LANG_SPAM_WORD','Spam Word (no assunto)');
define('LANG_FLOOD_MSG_RATE','Taxa de Mensagens Flood');
define('LANG_REM','Remover');
define('LANG_LOAD','Carregar');
define('LANG_SAVE','Salvar');
define('LANG_ANTISPAM','Antispam (somente pipe para o automail em perl, usando a Ban List)');
define('LANG_ANTISPAM_INFO',"Se um usu�rio  identificado como spam pela banlist, ele pode sobrepor a banlist respondendo com a MAGIC WORD no corpo do e-mail.<br>\n(N�o tire a tag {MAGICWORD} da mensagem, ela ser� substitu�da automaticamente)<br>\n(Recomenda-se que seja usado um e-mail inexistente no seu dom�nio)");
define('LANG_ANTISPAM_MAGICWORD','Antispam Magic Word (sem espa�os em branco)');
define('LANG_ANSWER_MSG','Responder mensagem');
define('LANG_ANSWER_MSG_INFO','Este � o modelo usado ao responder um ticket, alter�-lo n�o � recomendado.');
define('LANG_SPAMASSASSIN_ENABLE','Ativar Spam Assassin (somente em pipe para automail em perl)');
define('LANG_UNASSIGNED_TICKET','Este ticket n�o est� atribu�do.');
define('LANG_CLAIM_TEXT',  'Voc� deseja reivindicar este ticket?');
define('LANG_CLAIM_IT', 'Reivindicar');
define('LANG_NEW_TICKET','Novo Ticket');
define('LANG_MAIN','Principal');
//define('LANG_','');
?>