forward
global type w_actualiza_conexion from window
end type
type st_4 from statictext within w_actualiza_conexion
end type
type ddlb_conexion from dropdownlistbox within w_actualiza_conexion
end type
type st_3 from statictext within w_actualiza_conexion
end type
type cb_actualiza from commandbutton within w_actualiza_conexion
end type
type st_2 from statictext within w_actualiza_conexion
end type
type st_1 from statictext within w_actualiza_conexion
end type
type sle_clave from singlelineedit within w_actualiza_conexion
end type
type sle_usuario from singlelineedit within w_actualiza_conexion
end type
type cb_aceptar from commandbutton within w_actualiza_conexion
end type
type cb_cancelar from commandbutton within w_actualiza_conexion
end type
type ln_1 from line within w_actualiza_conexion
end type
type ln_2 from line within w_actualiza_conexion
end type
type gb_1 from groupbox within w_actualiza_conexion
end type
end forward

global type w_actualiza_conexion from window
integer x = 969
integer y = 596
integer width = 1632
integer height = 476
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
st_4 st_4
ddlb_conexion ddlb_conexion
st_3 st_3
cb_actualiza cb_actualiza
st_2 st_2
st_1 st_1
sle_clave sle_clave
sle_usuario sle_usuario
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
ln_1 ln_1
ln_2 ln_2
gb_1 gb_1
end type
global w_actualiza_conexion w_actualiza_conexion

type variables
datetime fecha
String		is_clave_usu,is_usuario
Long		il_veces_logon,	il_dias_aviso_exp  
end variables

forward prototypes
public function integer wf_actualizar (string fecha_cierre, string base, string estado)
end prototypes

public function integer wf_actualizar (string fecha_cierre, string base, string estado);datetime fecha1
long cont

fecha1 = datetime(date(fecha_cierre),time('00:00:00'))
SELECT count("FACTURA_OFERTA"."BASE")  
INTO :cont  
FROM "FACTURA_OFERTA"  
WHERE ( "FACTURA_OFERTA"."BASE" = :base ) AND  
      ( "FACTURA_OFERTA"."ESTADO" = :estado ) AND  
      ( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha1 )   ;
if cont = 0 then
	MessageBox(gs_app_name,"No existen registros.",stopsign!)
	return -1
end if
  DELETE FROM "FACTURA_OFERTA"  
   WHERE ( "FACTURA_OFERTA"."BASE" = :base ) AND  
         ( "FACTURA_OFERTA"."ESTADO" = :estado ) AND  
         ( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha1 )   ;
If sqlca.sqlcode < 0 Then
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_actualiza()")
end if	

return 1
end function

on w_actualiza_conexion.create
this.st_4=create st_4
this.ddlb_conexion=create ddlb_conexion
this.st_3=create st_3
this.cb_actualiza=create cb_actualiza
this.st_2=create st_2
this.st_1=create st_1
this.sle_clave=create sle_clave
this.sle_usuario=create sle_usuario
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.ln_1=create ln_1
this.ln_2=create ln_2
this.gb_1=create gb_1
this.Control[]={this.st_4,&
this.ddlb_conexion,&
this.st_3,&
this.cb_actualiza,&
this.st_2,&
this.st_1,&
this.sle_clave,&
this.sle_usuario,&
this.cb_aceptar,&
this.cb_cancelar,&
this.ln_1,&
this.ln_2,&
this.gb_1}
end on

on w_actualiza_conexion.destroy
destroy(this.st_4)
destroy(this.ddlb_conexion)
destroy(this.st_3)
destroy(this.cb_actualiza)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_clave)
destroy(this.sle_usuario)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.gb_1)
end on

event open;gf_centrar(w_actualiza_conexion)
SELECT 	"VALIDAR_LOGON_CLAVE"."VECES_LOGON", 	"VALIDAR_LOGON_CLAVE"."DIAS_AVISO_EXPIRAR"  
INTO 		:il_veces_logon,   										:il_dias_aviso_exp  
FROM 	"VALIDAR_LOGON_CLAVE"  ;

this.title	= 'Cambia Conexión'
ddlb_conexion.additem('Prado / Manantial / Santiago / Canaán')
ddlb_conexion.additem('Foresta')
//ddlb_conexion.additem('Concepción')
gs_ventana	= 'w_actualiza_conexion'
f_valida_objeto()

end event

type st_4 from statictext within w_actualiza_conexion
integer x = 119
integer y = 888
integer width = 1376
integer height = 108
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_conexion from dropdownlistbox within w_actualiza_conexion
integer x = 224
integer y = 576
integer width = 1166
integer height = 436
integer taborder = 50
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28377087
boolean vscrollbar = true
end type

event selectionchanged;cb_actualiza.enabled = true
end event

type st_3 from statictext within w_actualiza_conexion
integer x = 229
integer y = 36
integer width = 1102
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese su nombre de usuario y clave personal"
boolean focusrectangle = false
end type

type cb_actualiza from commandbutton within w_actualiza_conexion
integer x = 119
integer y = 724
integer width = 1376
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "~'Cambia Conexión~'"
end type

event clicked;Long	 	ret,ll_dias,ll_sw
string 	conexion_dos,ls_clave,is_dbms, is_logpass, is_servername, is_logid,ls_conexion,&
			is_dbparam,is_acceso,ls_estado,ls_depto,ls_opcion_dig,ls_cod_aux,ls_canal,ls_version,&
			email_de,ls_nombre,ls_asunto,ls_texto,ls_email_para,ls_res
Datetime ldt_fec_sistema,ld_fecha_expira
Date		ld_fec_ter


if gs_conexion	= "Parque El Prado" then
	ls_conexion	= '( Prado / Manantial / Santiago / Canaán )'
elseif gs_conexion	= "Parque La Foresta" then
	ls_conexion	= '( Conexión Foresta )'
end if

SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;

DISCONNECT USING sqlca ;
Disconnect using Trans_1;
Disconnect using Trans_2;
Disconnect using Trans_3;
Disconnect using Trans_4;
Disconnect using Trans_5;
Disconnect using Trans_6;
Disconnect using Trans_7;
conexion_dos    				= ddlb_conexion.text
if conexion_dos = '' or isnull( conexion_dos ) then
	messagebox(gs_app_name,'Debe seleccionar la conexion',information!)
	ddlb_conexion.setfocus()
	return
else
	DISCONNECT USING sqlca ;
	Disconnect using Trans_1;
	Disconnect using Trans_2;
	Disconnect using Trans_3;
	Disconnect using Trans_4;
	Disconnect using Trans_5;
	Disconnect using Trans_6;
	Disconnect using Trans_7;
end if	

if ddlb_conexion.text = 'Prado / Manantial / Santiago / Canaán' then
	gs_conexion					= "Parque El Prado"
	gs_nombre_parque 		= "INMOBILIARIA PARQUE LA FLORIDA SpA"
	setpointer(HourGlass!)
	gs_empresa 				= 'El Prado'
	gi_poliza 					= 5733
	is_dbms 						= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
	is_logpass 					= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
//	is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","prado_8g")
	is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","prado_sandbox_qa")
//	is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","desarrollo")
	is_logid 						= profilestring("INMOB.INI", "Conexión", "LogId","prado")
	is_dbparam 					= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	Trans_1						= CREATE transaction
	Trans_2						= CREATE transaction
	Trans_3						= CREATE transaction
	Trans_4						= CREATE transaction
	Trans_5						= CREATE transaction
	Trans_6						= CREATE transaction
	Trans_7						= CREATE transaction
	gs_usuario_1 				= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 				= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 				= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 				= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 				= profilestring("INMOB.INI","Usuario","usuario5","" )
	
	gs_caja 						= profilestring("C:\mod_cp\consulta\INMOB.INI","Caja","Caja","" )
	
	Trans_1.DBMS 				= is_dbms
	Trans_1.LogPass 			= is_logpass
	Trans_1.ServerName 	= is_servername
	Trans_1.LogId 				= is_logid
	Trans_1.dbParm 			= is_dbparam
	Trans_2.DBMS 				= is_dbms
	Trans_2.LogPass 			= is_logpass
	Trans_2.ServerName 	= is_servername
	Trans_2.LogId 				= is_logid
	Trans_2.dbParm 			= is_dbparam
	
	Trans_3.DBMS 				= is_dbms
	Trans_3.LogPass 			= is_logpass
	Trans_3.ServerName 	= is_servername
	Trans_3.LogId 				= is_logid
	Trans_3.dbParm 			= is_dbparam
	
	Trans_4.DBMS 				= is_dbms
	Trans_4.LogPass 			= is_logpass
	Trans_4.ServerName 	= is_servername
	Trans_4.LogId 				= is_logid
	Trans_4.dbParm 			= is_dbparam
	
	Trans_5.DBMS 				= is_dbms
	Trans_5.LogPass 			= is_logpass
	Trans_5.ServerName 	= is_servername
	Trans_5.LogId 				= is_logid
	Trans_5.dbParm 			= is_dbparam
	
	Trans_6.DBMS 				= is_dbms
	Trans_6.LogPass 			= is_logpass
	Trans_6.ServerName 	= is_servername
	Trans_6.LogId 				= is_logid
	Trans_6.dbParm 			= is_dbparam
	
	Trans_7.DBMS 				= is_dbms
	Trans_7.LogPass 			= is_logpass
	Trans_7.ServerName 	= is_servername
	Trans_7.LogId 				= is_logid
	Trans_7.dbParm 			= is_dbparam
	SQLCA.DBMS 				= is_dbms
	SQLCA.LogPass 			= is_logpass
	SQLCA.ServerName 		= is_servername
	SQLCA.LogId 				= is_logid
	SQLCA.dbParm 			= is_dbparam
	st_4.text						= ' Buscando Conexión.'
	connect using sqlca;
	connect using Trans_1;
	connect using Trans_2;
	connect using Trans_3;
	connect using Trans_4;
	connect using Trans_5;
	connect using Trans_6;
	connect using Trans_7;
	
	SELECT	"ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."FECHA_EXPIRACION",	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION",	"ENCARGADOS"."PROCESO", sysdate
	INTO 		:is_acceso,					:gs_nombre_usuario,		:ld_fecha_expira,						:ls_estado,					:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita,						:gl_proceso,				:ldt_fec_sistema
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario and
				"ENCARGADOS"."PASSWORD" = :is_clave_usu
	USING	sqlca;    
	SELECT	"COD_PARQ"."NOMBRE"
	INTO 		:gs_nom_cod_parque
	FROM 	"COD_PARQ"
	WHERE 	"COD_PARQ"."CODIGO" = :gl_cod_parque
	USING	sqlca;
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Prado/Manantial/Santiago/Canaán )'+fill(' ',5)+'Usuario: '+gs_nombre_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
	
elseif ddlb_conexion.text = 'Foresta' then
	setpointer(HourGlass!)
	DISCONNECT USING sqlca ;
	Disconnect using Trans_1;
	Disconnect using Trans_2;
	Disconnect using Trans_3;
	Disconnect using Trans_4;
	Disconnect using Trans_5;
	Disconnect using Trans_6;
	Disconnect using Trans_7;
    gs_conexion					= "Parque La Foresta"
	gs_empresa 				= 'La Foresta'
	gi_poliza 					= 5734
	gs_nombre_parque 		= "INMOBILIARIA PARQUE LA SERENA SpA"
	is_dbms 						= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
	is_logpass 					= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
//	is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_8g")
	is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_sandbox_qa")
//	is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","desarrollo_foresta")
	is_logid 						= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
	is_dbparam 					= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	Trans_1						= CREATE transaction
	Trans_2						= CREATE transaction
	Trans_3						= CREATE transaction
	Trans_4						= CREATE transaction
	Trans_5						= CREATE transaction
	Trans_6						= CREATE transaction
	Trans_7						= CREATE transaction
	gs_usuario_1 				= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 				= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 				= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 				= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 				= profilestring("INMOB.INI","Usuario","usuario5","" )
	
	gs_caja 						= profilestring("C:\mod_cp\consulta\INMOB.INI","Caja","Caja","" )
	
	Trans_1.DBMS 				= is_dbms
	Trans_1.LogPass 			= is_logpass
	Trans_1.ServerName 	= is_servername
	Trans_1.LogId 				= is_logid
	Trans_1.dbParm 			= is_dbparam
	Trans_2.DBMS 				= is_dbms
	Trans_2.LogPass 			= is_logpass
	Trans_2.ServerName 	= is_servername
	Trans_2.LogId 				= is_logid
	Trans_2.dbParm 			= is_dbparam
	
	Trans_3.DBMS 				= is_dbms
	Trans_3.LogPass 			= is_logpass
	Trans_3.ServerName 	= is_servername
	Trans_3.LogId 				= is_logid
	Trans_3.dbParm 			= is_dbparam
	Trans_4.DBMS 				= is_dbms
	Trans_4.LogPass 			= is_logpass
	Trans_4.ServerName 	= is_servername
	Trans_4.LogId 				= is_logid
	Trans_4.dbParm 			= is_dbparam
	
	Trans_5.DBMS 				= is_dbms
	Trans_5.LogPass 			= is_logpass
	Trans_5.ServerName 	= is_servername
	Trans_5.LogId 				= is_logid
	Trans_5.dbParm 			= is_dbparam
	
	Trans_6.DBMS 				= is_dbms
	Trans_6.LogPass 			= is_logpass
	Trans_6.ServerName 	= is_servername
	Trans_6.LogId 				= is_logid
	Trans_6.dbParm 			= is_dbparam
	
	Trans_7.DBMS 				= is_dbms
	Trans_7.LogPass 			= is_logpass
	Trans_7.ServerName 	= is_servername
	Trans_7.LogId 				= is_logid
	Trans_7.dbParm 			= is_dbparam
	sqlca.DBMS 					= is_dbms
	sqlca.LogPass 				= is_logpass
	sqlca.ServerName 		= is_servername
	sqlca.LogId 					= is_logid
	sqlca.dbParm 				= is_dbparam
	st_4.text						= ' Buscando Conexión.'	
	connect using sqlca;
	connect using Trans_1;
	connect using Trans_2;
	connect using Trans_3;
	connect using Trans_4;
	connect using Trans_5;
	connect using Trans_6;
	connect using Trans_7;
	SELECT	"ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."FECHA_EXPIRACION",	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION",	"ENCARGADOS"."PROCESO", sysdate
	INTO 		:is_acceso,					:gs_nombre_usuario,		:ld_fecha_expira,						:ls_estado,					:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita,						:gl_proceso,				:ldt_fec_sistema
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario and
				"ENCARGADOS"."PASSWORD" = :is_clave_usu
	USING	sqlca;    
	SELECT	"COD_PARQ"."NOMBRE"
	INTO 		:gs_nom_cod_parque
	FROM 	"COD_PARQ"
	WHERE 	"COD_PARQ"."CODIGO" = :gl_cod_parque
	USING	sqlca;
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nombre_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
	

end if

SELECT	"ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."FECHA_EXPIRACION",	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION",	"ENCARGADOS"."PROCESO", sysdate
INTO 		:is_acceso,					:gs_nombre_usuario,		:ld_fecha_expira,						:ls_estado,					:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita,						:gl_proceso,				:ldt_fec_sistema
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario and
			"ENCARGADOS"."PASSWORD" = :is_clave_usu
USING		sqlca;    
if sqlca.sqlcode=0 then
	gs_user										= is_usuario
	
	select 	sys_context('userenv','ip_address') ,	sys_context('userenv','os_user')
	into		:gs_tcp_ip,										:gs_user_maq
	from 		dual;
	
	SELECT	"VERSION_SISTEMA"."VERSION",	sysdate  
	INTO 		:ls_version,						:gdt_fec_sistema
	FROM 	"VERSION_SISTEMA"  
	USING	sqlca;
	if ls_version <> gs_app_name then
		messagebox("Advertencia","Versión Sistema Consulta NO Actualizada, Comunicarse Departamento Informática AREA SOPORTE Fono: 380.57.15   Versión Actual es: "+ls_version)
		INSERT INTO	"LOG_VERSION"  
					 ( "VERSION",		"USUARIO",	"IP",			"FECHA_CREA",	"USUARIO_MAQ",	"CONEXION",	"CONEXION_DESTINO",	"ULTIMA_VERSION" )  
		VALUES 	 ( :gs_app_name,	:is_usuario,	:gs_tcp_ip,	:gdt_fec_sistema,	:gs_user_maq,		:ls_conexion,	:ddlb_conexion.text,		:ls_version )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
			SELECT DISTINCT "ENCARGADOS"."EMAIL",	"ENCARGADOS"."NOMBRE"  
			INTO 		:email_de,							:ls_nombre
			FROM 	"ENCARGADOS"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario   
			USING		sqlca;
			if isnull(email_de) or email_de='-' or email_de='' then
				email_de			= 'consulta@nuestrosparques.cl'
			end if
			ls_asunto			= 'Problemas de Actualización: '+gs_app_name+' en IP: '+gs_tcp_ip
			ls_texto				= 'Aviso Problemas de Actualización Versión: '+gs_app_name+' en IP: '+gs_tcp_ip+' Usuario: '+is_usuario+'-'+ls_nombre+' Cambio de Conexión: '+gs_conexion+'                         Atentamente '+ls_nombre
			ls_email_para		= 'ver_sistema@nuestrosparques.cl'
			select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
			INTO 		:ls_res
			from 		DUAL;
			if ls_res='OK' then 
				messagebox("Envio Email","Se Envia Email a Depto. Soporte Solicitando Actualización de Sistema")
			else
				messagebox("Error Envio Email","Error enviar Email a Depto. Soporte para la Actualización de Sistema "+ls_res)
			end if
		else
			rollback;
		end if
	end if
	
	if gd_fec_termino<= ldt_fec_sistema then
		messagebox("Advertencia","Llamar Departamento de Informática, Ud. tiene Problemas con Fecha de Término")
	else
		if ls_estado='I' then
			messagebox("Advertencia","Advertencia Usuario Inactivo")
			sle_usuario.text					= ''
			sle_clave.text						= ''
			sle_usuario.setfocus()
		elseif ls_estado='A' then
			gdt_fec_sistema					= ldt_fec_sistema
			if ld_fecha_expira<=gdt_fec_sistema then
				messagebox("Advertencia","Advertencia Cumplió Fecha de Expiración, comunicarse a Departamento Informática")
			else
				ld_fec_ter						= RelativeDate(date(ld_fecha_expira), ( il_dias_aviso_exp * -1 ))	
//				ld_fec_ter						= RelativeDate(date(ld_fecha_expira), -15)
				ll_dias							= DaysAfter(date(ldt_fec_sistema), date(ld_fecha_expira))
				if date(ldt_fec_sistema) >= ld_fec_ter then //and date(ldt_fec_sistema) <= date(ld_fecha_expira) then
					messagebox("Advertencia","Recuerde que falta(n)  <<  "+string(ll_dias)+"  >>  día(s) para Caducar su PassWord")
				else
					if date(ldt_fec_sistema) > date(ld_fecha_expira) then
						messagebox("Advertencia","Password Caducada Comunicarse con Departamento Informática")
						ll_sw	= 1
					end if
				end if
				if ll_sw=0 then
					SELECT	"TCP_IP_CAJA"."CAJA",	"TCP_IP_CAJA"."PROM_FOLIO_DIARIO" ,	"TCP_IP_CAJA"."VECES_FOLIO_DIARIO" 
					INTO 		:gs_caja,						:gl_folio_diario,									:gl_veces_diario
					FROM 	"TCP_IP_CAJA"
					WHERE 	"TCP_IP_CAJA"."TCP_IP" = :gs_tcp_ip and
								"TCP_IP_CAJA"."CONEXION" = :gs_empresa
					USING	sqlca;
					if sqlca.sqlcode=0 then 
						gs_caja		= trim(gs_caja)
					else
						SELECT	"TCP_IP_CAJA"."CAJA",	"TCP_IP_CAJA"."PROM_FOLIO_DIARIO" ,	"TCP_IP_CAJA"."VECES_FOLIO_DIARIO" ,	"TCP_IP_CAJA"."TCP_IP"
						INTO 		:gs_caja,						:gl_folio_diario,									:gl_veces_diario,									:gs_tcp_ip
						FROM 	"TCP_IP_CAJA"
						WHERE 	"TCP_IP_CAJA"."USUARIO" = :gs_user and
									"TCP_IP_CAJA"."CONEXION" = :gs_empresa
						USING	sqlca;
						if sqlca.sqlcode=0 then 
							gs_caja	= trim(gs_caja)
						else
							setnull(gs_caja)
						end if
					end if

					SELECT	"TCP_IP_PARQUE"."COD_PARQUE"  
					INTO 		:gl_cod_parque
					FROM 	"TCP_IP_PARQUE"  
					WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :gs_tcp_ip   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						SELECT	"ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."FECHA_EXPIRACION",	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION",	"ENCARGADOS"."PROCESO", sysdate
						INTO 		:is_acceso,						:gs_nombre_usuario,			:ld_fecha_expira,								:ls_estado,						:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita,						:gl_proceso,				:ldt_fec_sistema
						FROM 	"ENCARGADOS"  
						WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario and
									"ENCARGADOS"."PASSWORD" = :is_clave_usu
						USING	sqlca;    
						
						SELECT	"COD_PARQ"."NOMBRE"
						INTO 		:gs_nom_cod_parque
						FROM 	"COD_PARQ"
						WHERE 	"COD_PARQ"."CODIGO" = :gl_cod_parque
						USING	sqlca;
						if ddlb_conexion.text = 'Serena' then
							if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nombre_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
						elseif ddlb_conexion.text = 'Prado / Manantial / Santiago' then
							if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Prado/Manantial/Santiago/Canaán )'+fill(' ',5)+'Usuario: '+gs_nombre_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
						end if
					else
						messagebox("Advertencia","Error TCP_IP No está asignada a Ningún Parque (Comuníquese a Departamento Informática)")
					end if
				end if
			end if
		end if
	end if
else
	messagebox("Advertencia","Usuario/Clave Inválida no puede hacer Cambio de Conexión")
	DISCONNECT USING sqlca ;
	Disconnect using Trans_1;
	Disconnect using Trans_2;
	Disconnect using Trans_3;
	Disconnect using Trans_4;
	Disconnect using Trans_5;
	Disconnect using Trans_6;
	Disconnect using Trans_7;
	
	if ls_conexion	= '( Prado / Manantial / Santiago / Canaán )' then
		gs_conexion					= "Parque El Prado"
		gs_nombre_parque 		= "INMOBILIARIA PARQUE LA FLORIDA SpA"
		setpointer(HourGlass!)
		gs_empresa 				= 'El Prado'
		gi_poliza 					= 5733
		is_dbms 						= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
		is_logpass 					= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
//		is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","prado_8g")
		is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","prado_sandbox_qa")
//		is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","desarrollo")
		is_logid 						= profilestring("INMOB.INI", "Conexión", "LogId","prado")
		is_dbparam 					= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
		Trans_1						= CREATE transaction
		Trans_2						= CREATE transaction
		Trans_3						= CREATE transaction
		Trans_4						= CREATE transaction
		Trans_5						= CREATE transaction
		Trans_6						= CREATE transaction
		Trans_7						= CREATE transaction
		gs_usuario_1 				= profilestring("INMOB.INI","Usuario","usuario1","" )
		gs_usuario_2 				= profilestring("INMOB.INI","Usuario","usuario2","" )
		gs_usuario_3 				= profilestring("INMOB.INI","Usuario","usuario3","" )
		gs_usuario_4 				= profilestring("INMOB.INI","Usuario","usuario4","" )
		gs_usuario_5 				= profilestring("INMOB.INI","Usuario","usuario5","" )
		
		gs_caja 						= profilestring("C:\mod_cp\consulta\INMOB.INI","Caja","Caja","" )
		
		Trans_1.DBMS 				= is_dbms
		Trans_1.LogPass 			= is_logpass
		Trans_1.ServerName 	= is_servername
		Trans_1.LogId 				= is_logid
		Trans_1.dbParm 			= is_dbparam
		Trans_2.DBMS 				= is_dbms
		Trans_2.LogPass 			= is_logpass
		Trans_2.ServerName 	= is_servername
		Trans_2.LogId 				= is_logid
		Trans_2.dbParm 			= is_dbparam
		
		Trans_3.DBMS 				= is_dbms
		Trans_3.LogPass 			= is_logpass
		Trans_3.ServerName 	= is_servername
		Trans_3.LogId 				= is_logid
		Trans_3.dbParm 			= is_dbparam
		Trans_4.DBMS 				= is_dbms
		Trans_4.LogPass 			= is_logpass
		Trans_4.ServerName 	= is_servername
		Trans_4.LogId 				= is_logid
		Trans_4.dbParm 			= is_dbparam
		
		Trans_5.DBMS 				= is_dbms
		Trans_5.LogPass 			= is_logpass
		Trans_5.ServerName 	= is_servername
		Trans_5.LogId 				= is_logid
		Trans_5.dbParm 			= is_dbparam
		
		Trans_6.DBMS 				= is_dbms
		Trans_6.LogPass 			= is_logpass
		Trans_6.ServerName 	= is_servername
		Trans_6.LogId 				= is_logid
		Trans_6.dbParm 			= is_dbparam
		
		Trans_7.DBMS 				= is_dbms
		Trans_7.LogPass 			= is_logpass
		Trans_7.ServerName 	= is_servername
		Trans_7.LogId 				= is_logid
		Trans_7.dbParm 			= is_dbparam
		SQLCA.DBMS 				= is_dbms
		SQLCA.LogPass 			= is_logpass
		SQLCA.ServerName 		= is_servername
		SQLCA.LogId 				= is_logid
		SQLCA.dbParm 			= is_dbparam
		st_4.text						= ' Buscando Conexión.'
		connect using sqlca;
		connect using Trans_1;
		connect using Trans_2;
		connect using Trans_3;
		connect using Trans_4;
		connect using Trans_5;
		connect using Trans_6;
		connect using Trans_7;
		SELECT	"ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."FECHA_EXPIRACION",	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION",	"ENCARGADOS"."PROCESO", sysdate
		INTO 		:is_acceso,					:gs_nombre_usuario,		:ld_fecha_expira,						:ls_estado,					:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita,						:gl_proceso,				:ldt_fec_sistema
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario and
					"ENCARGADOS"."PASSWORD" = :is_clave_usu
		USING	sqlca;    
		SELECT	"COD_PARQ"."NOMBRE"
		INTO 		:gs_nom_cod_parque
		FROM 	"COD_PARQ"
		WHERE 	"COD_PARQ"."CODIGO" = :gl_cod_parque
		USING	sqlca;
		if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Prado/Manantial/Santiago/Canaán )'+fill(' ',5)+'Usuario: '+gs_nombre_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")

	elseif ls_conexion = '( Conexión Foresta )' then
		setpointer(HourGlass!)
		DISCONNECT USING sqlca ;
		Disconnect using Trans_1;
		Disconnect using Trans_2;
		Disconnect using Trans_3;
		Disconnect using Trans_4;
		Disconnect using Trans_5;
		Disconnect using Trans_6;
		Disconnect using Trans_7;
		gs_conexion					= "Parque La Foresta"
		gs_empresa 				= 'La Foresta'
		gi_poliza 					= 5734
		gs_nombre_parque 		= "INMOBILIARIA PARQUE LA SERENA SpA"
		is_dbms 						= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
		is_logpass 					= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
//		is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_8g")
		is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_sandbox_qa")
//		is_servername 				= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_desarrollo")
		is_logid 						= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
		is_dbparam 					= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
		Trans_1						= CREATE transaction
		Trans_2						= CREATE transaction
		Trans_3						= CREATE transaction
		Trans_4						= CREATE transaction
		Trans_5						= CREATE transaction
		Trans_6						= CREATE transaction
		Trans_7						= CREATE transaction
		gs_usuario_1 				= profilestring("INMOB.INI","Usuario","usuario1","" )
		gs_usuario_2 				= profilestring("INMOB.INI","Usuario","usuario2","" )
		gs_usuario_3 				= profilestring("INMOB.INI","Usuario","usuario3","" )
		gs_usuario_4 				= profilestring("INMOB.INI","Usuario","usuario4","" )
		gs_usuario_5 				= profilestring("INMOB.INI","Usuario","usuario5","" )
		
		gs_caja 						= profilestring("C:\mod_cp\consulta\INMOB.INI","Caja","Caja","" )
		
		Trans_1.DBMS 				= is_dbms
		Trans_1.LogPass 			= is_logpass
		Trans_1.ServerName 	= is_servername
		Trans_1.LogId 				= is_logid
		Trans_1.dbParm 			= is_dbparam
		Trans_2.DBMS 				= is_dbms
		Trans_2.LogPass 			= is_logpass
		Trans_2.ServerName 	= is_servername
		Trans_2.LogId 				= is_logid
		Trans_2.dbParm 			= is_dbparam
		
		Trans_3.DBMS 				= is_dbms
		Trans_3.LogPass 			= is_logpass
		Trans_3.ServerName 	= is_servername
		Trans_3.LogId 				= is_logid
		Trans_3.dbParm 			= is_dbparam
		Trans_4.DBMS 				= is_dbms
		Trans_4.LogPass 			= is_logpass
		Trans_4.ServerName 	= is_servername
		Trans_4.LogId 				= is_logid
		Trans_4.dbParm 			= is_dbparam
		
		Trans_5.DBMS 				= is_dbms
		Trans_5.LogPass 			= is_logpass
		Trans_5.ServerName 	= is_servername
		Trans_5.LogId 				= is_logid
		Trans_5.dbParm 			= is_dbparam
		
		Trans_6.DBMS 				= is_dbms
		Trans_6.LogPass 			= is_logpass
		Trans_6.ServerName 	= is_servername
		Trans_6.LogId 				= is_logid
		Trans_6.dbParm 			= is_dbparam
		
		Trans_7.DBMS 				= is_dbms
		Trans_7.LogPass 			= is_logpass
		Trans_7.ServerName 	= is_servername
		Trans_7.LogId 				= is_logid
		Trans_7.dbParm 			= is_dbparam
		sqlca.DBMS 					= is_dbms
		sqlca.LogPass 				= is_logpass
		sqlca.ServerName 		= is_servername
		sqlca.LogId 					= is_logid
		sqlca.dbParm 				= is_dbparam
		st_4.text						= ' Buscando Conexión.'	
		connect using sqlca;
		connect using Trans_1;
		connect using Trans_2;
		connect using Trans_3;
		connect using Trans_4;
		SELECT	"ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."FECHA_EXPIRACION",	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION",	"ENCARGADOS"."PROCESO", sysdate
		INTO 		:is_acceso,					:gs_nombre_usuario,		:ld_fecha_expira,						:ls_estado,					:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita,						:gl_proceso,				:ldt_fec_sistema
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario and
					"ENCARGADOS"."PASSWORD" = :is_clave_usu
		USING	sqlca;    
		SELECT	"COD_PARQ"."NOMBRE"
		INTO 		:gs_nom_cod_parque
		FROM 	"COD_PARQ"
		WHERE 	"COD_PARQ"."CODIGO" = :gl_cod_parque
		USING	sqlca;
		if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nombre_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
		
	
	end if
end if
SELECT	"ENCARGADOS"."DIGITACION"  , 	"ENCARGADOS"."DEPTO"
INTO 		:ls_opcion_dig,					:gs_depto
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
USING	sqlca;
gs_ventana	= 'w_principal'
f_valida_objeto_auto()
SELECT	"SUPERVISOR"."CANAL"  
INTO 		:ls_canal  
FROM 	"SUPERVISOR"  
WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
USING	sqlca;
if sqlca.sqlcode=0 then
	if ls_canal='NF' then
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_ni.visible	= false
	elseif ls_canal='NI' then
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_nf.visible	= false
	end if
end if
SELECT	"JEFE_VENTAS"."CANAL"  
INTO 		:ls_canal  
FROM 	"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING	sqlca;
if sqlca.sqlcode=0 then
	if ls_canal='NF' then
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_ni.visible	= false
	elseif ls_canal='NI' then
		m_menu_principal.m_revisióncontrato.m_simulaciónclasificación.m_nf.visible	= false
	end if
end if
if gs_depto='I' or gs_depto='O' or gs_depto='F' or gs_depto='P' then 
	m_menu_principal.m_mensajes.visible														= true
	m_menu_principal.m_mensajes.m_crear.visible											= true
	m_menu_principal.m_mensajes.m_buscar.visible											= true
	if gs_depto='O' or gs_depto='P' or gs_depto='I' then
		m_menu_principal.m_consultas.m_util.m_validarcliente.visible						= true
	end if
else
	m_menu_principal.m_mensajes.visible														= false
	m_menu_principal.m_mensajes.m_crear.visible											= false
	m_menu_principal.m_mensajes.m_buscar.visible											= false
	m_menu_principal.m_consultas.m_util.m_validarcliente.visible							= false
end if
if gs_conexion = "Parque El Prado" then
	m_menu_principal.m_consultas.m_estadosolicitudes.m_titulodedominio0.visible	= true
else
	m_menu_principal.m_consultas.m_estadosolicitudes.m_titulodedominio0.visible	= false
end if
gs_nom_comp_usuario																				= gs_nombre_usuario
gs_us     																									= gs_nombre_usuario
gs_nombre																								= gs_nombre_usuario
close(w_actualiza_conexion)
end event

type st_2 from statictext within w_actualiza_conexion
integer x = 151
integer y = 252
integer width = 192
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Clave:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_actualiza_conexion
integer x = 96
integer y = 148
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type sle_clave from singlelineedit within w_actualiza_conexion
integer x = 384
integer y = 244
integer width = 672
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type sle_usuario from singlelineedit within w_actualiza_conexion
integer x = 384
integer y = 140
integer width = 672
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 15
borderstyle borderstyle = stylelowered!
end type

type cb_aceptar from commandbutton within w_actualiza_conexion
integer x = 1088
integer y = 140
integer width = 398
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;string 	is_acceso, is_clave,ls_estado
Datetime ldt_fec_sistema,ld_fecha_expira
Date		ld_fec_ter
Long		ll_dias,ll_sw

is_usuario 		= Upper(sle_usuario.text)
is_clave_usu	= Upper(sle_clave.text)
SELECT	"ENCARGADOS"."PASSWORD",   "ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."FECHA_EXPIRACION",	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION", 	"ENCARGADOS"."CAJA_MULTIPAGO",	"RUT",					sysdate
INTO 		:is_clave,   					:is_acceso,					:gs_nombre_usuario,		:ld_fecha_expira,						:ls_estado,					:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita,							:gs_multipago,							:gl_rut_encargado,	:fechasys
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario and
			"ENCARGADOS"."PASSWORD" = :is_clave_usu
USING		sqlca;    
if sqlca.sqlcode=0 then
	fechasys		= ldt_fec_sistema
	if gd_fec_termino<= ldt_fec_sistema then
		messagebox("Advertencia","Llamar Departamento de Informática, Ud. tiene Problemas con Fecha de Término")
	else
		if ls_estado='I' then
			messagebox("Advertencia","Advertencia Usuario Inactivo")
			sle_usuario.text					= ''
			sle_clave.text						= ''
			sle_usuario.setfocus()
		elseif ls_estado='A' then
			gdt_fec_sistema					= ldt_fec_sistema
			gs_nom_comp_usuario			= gs_nombre_usuario
			gs_user   							= Upper(sle_usuario.text)
			IF is_clave = Upper(sle_clave.text) and sle_clave.text<>'' THEN
				gi_nivel_acceso 				= 1
				IF LEN(gs_nombre_usuario) > 5 THEN 
					gs_nombre_usuario		= Upper(sle_usuario.text)
				END IF
				w_actualiza_conexion.height 	= 1205
				w_actualiza_conexion.x 			= 974
				w_actualiza_conexion.y 			= 601
				this.enabled 						= false
				sle_clave.enabled 					= false
				sle_usuario.enabled 				= false
				sle_clave.displayonly 				= false
				sle_usuario.displayonly 			= false	
				sle_clave.text 						= ''
				sle_usuario.text 					= ''
				gf_centrar(w_actualiza_conexion)
			ELSE
				MessageBox(gs_app_name, "El usuario no se encuentra o su clave es incorrecta.")
				sle_clave.text = ""
				sle_clave.SetFocus( )
			END IF
		end if
	end if
else
	MessageBox(gs_app_name, "El Usuario NO se encuentra o su Clave es Incorrecta.")
	sle_clave.text 				= ""
	sle_clave.SetFocus( )
end if
end event

type cb_cancelar from commandbutton within w_actualiza_conexion
integer x = 1088
integer y = 248
integer width = 398
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(w_actualiza_conexion)
end event

type ln_1 from line within w_actualiza_conexion
integer linethickness = 5
integer beginx = 64
integer beginy = 420
integer endx = 1541
integer endy = 420
end type

type ln_2 from line within w_actualiza_conexion
long linecolor = 16777215
integer linethickness = 5
integer beginx = 64
integer beginy = 428
integer endx = 1541
integer endy = 428
end type

type gb_1 from groupbox within w_actualiza_conexion
integer x = 55
integer y = 452
integer width = 1495
integer height = 588
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 79741120
string text = "Conexion"
end type

