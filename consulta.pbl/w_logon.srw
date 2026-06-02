forward
global type w_logon from window
end type
type dw_ip from datawindow within w_logon
end type
type st_3 from statictext within w_logon
end type
type sle_clave from singlelineedit within w_logon
end type
type sle_usuario from singlelineedit within w_logon
end type
type st_2 from statictext within w_logon
end type
type st_1 from statictext within w_logon
end type
type cb_cancelar from commandbutton within w_logon
end type
type cb_aceptar from commandbutton within w_logon
end type
type p_1 from picture within w_logon
end type
end forward

global type w_logon from window
integer x = 425
integer y = 416
integer width = 1847
integer height = 596
boolean titlebar = true
string title = "Ingreso al Sistema"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
integer animationtime = 50
dw_ip dw_ip
st_3 st_3
sle_clave sle_clave
sle_usuario sle_usuario
st_2 st_2
st_1 st_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
p_1 p_1
end type
global w_logon w_logon

type variables
Long		il_veces_logon,   il_dias_aviso_exp  
end variables

on w_logon.create
this.dw_ip=create dw_ip
this.st_3=create st_3
this.sle_clave=create sle_clave
this.sle_usuario=create sle_usuario
this.st_2=create st_2
this.st_1=create st_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.p_1=create p_1
this.Control[]={this.dw_ip,&
this.st_3,&
this.sle_clave,&
this.sle_usuario,&
this.st_2,&
this.st_1,&
this.cb_cancelar,&
this.cb_aceptar,&
this.p_1}
end on

on w_logon.destroy
destroy(this.dw_ip)
destroy(this.st_3)
destroy(this.sle_clave)
destroy(this.sle_usuario)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.p_1)
end on

event open;gf_centrar(w_logon)
SELECT 	"VALIDAR_LOGON_CLAVE"."VECES_LOGON", 	"VALIDAR_LOGON_CLAVE"."DIAS_AVISO_EXPIRAR"  
INTO 		:il_veces_logon,   										:il_dias_aviso_exp  
FROM 	"VALIDAR_LOGON_CLAVE"  ;

if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 	= 'logo_parque_stgo.bmp'
elseif gl_cod_parque=801 then
	p_1.picturename 	= 'logo_parque_conce.jpg'
end if
p_1.x			= 32
p_1.y			= 32
p_1.width	= 407
p_1.height	= 436
this.title 	= gs_app_name
end event

type dw_ip from datawindow within w_logon
boolean visible = false
integer x = 384
integer y = 676
integer width = 576
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dwe_tcp_ip"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_logon
integer x = 475
integer y = 76
integer width = 1298
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese su nombre de usuario y clave personal"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_clave from singlelineedit within w_logon
integer x = 777
integer y = 356
integer width = 594
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

type sle_usuario from singlelineedit within w_logon
integer x = 777
integer y = 216
integer width = 599
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

type st_2 from statictext within w_logon
integer x = 558
integer y = 356
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
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_logon
integer x = 498
integer y = 216
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Usuario:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_logon
integer x = 1422
integer y = 348
integer width = 361
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;gi_nivel_acceso = 0
Close(w_logon)
end event

type cb_aceptar from commandbutton within w_logon
integer x = 1422
integer y = 208
integer width = 361
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;string 	is_acceso, is_clave, is_usuario,ls_clave,ls_estado,ls_version,email_de,ls_nombre,ls_texto,&
			ls_email_para,ls_asunto,ls_res
Date		ld_fec_ter,ld_fecha_dia
Long		ll_dias,ll_sw,ll_resp
Datetime ldt_fec_sistema,ld_fecha_expira

ll_sw								= 0
is_usuario 						= Upper(sle_usuario.text)
ls_clave							= upper(sle_clave.text)

SELECT DISTINCT "ENCARGADOS"."ESTADO"  
INTO 		:ls_estado  
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario   
USING sqlca;
if sqlca.sqlcode=0 then
	if ls_estado='I' then
		messagebox("Advertencia","usuario Inactivo")
	else
		select 	sys_context('userenv','ip_address') ,	sys_context('userenv','os_user')
		into		:gs_tcp_ip,									:gs_user_maq
		from 		dual;
		//messagebox("",gs_tcp_ip)
		
		
		SELECT	"VERSION_SISTEMA"."VERSION",	sysdate  
		INTO 		:ls_version,						:gdt_fec_sistema
		FROM 	"VERSION_SISTEMA"  
		USING	sqlca;
		
		INSERT INTO "LOG_CONEXION_USUARIO"  
						( "USUARIO", 		"IP", 			"VERSION_NUEVA", 	"VERSION_VIGENTE",		"FECHA_CONEXION" )  
		VALUES 		( :is_usuario, 		:gs_tcp_ip, 	:gs_app_name, 		:ls_version,					:gdt_fec_sistema )  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
			messagebox("Error LOG_CONEXION_USUARIO","Error al Grabar LOG_CONEXION_USUARIO Sql: "+sqlca.sqlerrtext)
		end if
		if ls_version <> gs_app_name then
			messagebox("Advertencia","Versión Sistema Consulta NO Actualizada, Comunicarse Departamento Informática AREA SOPORTE Fono: 380.57.15   Versión Actual es: "+ls_version)
			INSERT INTO	"LOG_VERSION"  
						 ( "VERSION",		"USUARIO",	"IP",			"FECHA_CREA",	"USUARIO_MAQ",	"CONEXION",	"CONEXION_DESTINO",	"ULTIMA_VERSION" )  
			VALUES 	 ( :gs_app_name,	:is_usuario,	:gs_tcp_ip,	:gdt_fec_sistema,	:gs_user_maq,	:gs_conexion,		null,							:ls_version )  
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
				ls_texto				= 'Aviso Problemas de Actualización Versión: '+gs_app_name+' en IP: '+gs_tcp_ip+' Usuario: '+is_usuario+'-'+ls_nombre+' Conexión: '+gs_conexion+'                         Atentamente '+ls_nombre
				ls_email_para		= 'consulta@nuestrosparques.cl'
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
				messagebox("Error LOG_VERSION","Error al Grabar LOG_VERSION Sql: "+sqlca.sqlerrtext)
			end if
		end if
		
		SELECT	"ENCARGADOS"."PASSWORD",   "ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."FECHA_EXPIRACION",	"ENCARGADOS"."ESTADO",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION", 	"ENCARGADOS"."CAJA_MULTIPAGO",	"PROCESO",		"RUT",					sysdate,		"TIPO_COBRANZA_TERRENO"
		INTO 		:is_clave,   					:is_acceso,					:gs_nombre_usuario,		:ld_fecha_expira,						:ls_estado,					:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita,							:gs_multipago,							:gl_proceso,	:gl_rut_encargado,	:fechasys,		:gs_tipo_cob
		FROM 	"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario and
					"ENCARGADOS"."PASSWORD" = :ls_clave
		USING	sqlca;    
		if sqlca.sqlcode=0 then
			ldt_fec_sistema	= fechasys
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
						messagebox("Advertencia","Advertencia Cumplió Fecha de Expiración, debe Cambiar Password")
						gs_user							= sle_usuario.text
						open(w_cambio_clave)
					else
						ld_fec_ter						= RelativeDate(date(ld_fecha_expira), ( il_dias_aviso_exp * -1 ))	
						ll_dias							= DaysAfter(date(ldt_fec_sistema), date(ld_fecha_expira))
						if date(ldt_fec_sistema) >= ld_fec_ter then //and date(ldt_fec_sistema) <= date(ld_fecha_expira) then
							ll_resp						= messagebox("Advertencia Falta(n) "+string(ll_dias)+" día(s) para Caducar su PassWord","Recuerde que falta(n)  <<  "+string(ll_dias)+"  >>  día(s) para Caducar su PassWord, desea Cambiar Ahora",Exclamation!,YesNo!,1)
						else
							if date(ldt_fec_sistema) > date(ld_fecha_expira) then
								messagebox("Advertencia","Password Caducada Comunicarse con Departamento Informática")
								ll_sw						= 1
							end if
						end if
						if ll_sw=0 then
							gs_user   					= Upper(sle_usuario.text)
							gs_nom_comp_usuario	= gs_nombre_usuario
							gs_us     						= gs_nombre_usuario
							gs_acceso 					= is_acceso
							gs_clave  					= is_clave
							gdt_fec_sistema			= fechasys
							IF is_clave = Upper(sle_clave.text) and sle_clave.text<>'' THEN
								gi_nivel_acceso 		= 1
								gs_acceso 				= is_acceso
								gs_nombre				= gs_nombre_usuario
								gs_codigo_usuario		= is_usuario
								ld_fecha_dia			= date(ldt_fec_sistema)
								SELECT	"TAB_UF"."VALOR_UF"  
								INTO 		:gd_uf_dia  
								FROM 	"TAB_UF"  
								WHERE 	"TAB_UF"."FECHA_UF" = :ld_fecha_dia   ;
								
								if isnull(gs_tcp_ip) then gs_tcp_ip=''
								if isnull(gs_user_maq) then gs_user_maq=''
								SELECT	"TCP_IP_CAJA"."PROM_FOLIO_DIARIO" ,	"TCP_IP_CAJA"."VECES_FOLIO_DIARIO" 
								INTO 		:gl_folio_diario,									:gl_veces_diario
								FROM 	"TCP_IP_CAJA"
								WHERE 	"TCP_IP_CAJA"."TCP_IP" = :gs_tcp_ip and
											"TCP_IP_CAJA"."CONEXION" = :gs_empresa
								USING		sqlca;
								if sqlca.sqlcode=0 then 
		//							gs_caja		= trim(gs_caja)
								else
									SELECT	"TCP_IP_CAJA"."PROM_FOLIO_DIARIO" ,	"TCP_IP_CAJA"."VECES_FOLIO_DIARIO" ,	"TCP_IP_CAJA"."TCP_IP"
									INTO 		:gl_folio_diario,									:gl_veces_diario,									:gs_tcp_ip
									FROM 	"TCP_IP_CAJA"
									WHERE 	"TCP_IP_CAJA"."USUARIO" = :gs_user and
												"TCP_IP_CAJA"."CONEXION" = :gs_empresa
									USING		sqlca;
									if sqlca.sqlcode=0 then 
		//								gs_caja	= trim(gs_caja)
									else
		//								setnull(gs_caja)
									end if
								end if
								if isnull(gd_uf_dia) or gd_uf_dia=0 then
									messagebox("Advertencia","No Registra Valor U.F. del día, comunicarse con Encargado")
									if gs_depto<>'T' and gs_depto<>'I' then gi_nivel_acceso = 0
									if gs_depto='I' then
										if isvalid(w_mantenedor_uf) then close(w_mantenedor_uf)
										Open(w_mantenedor_uf)
									end if
									Close(w_logon)
								else
									SELECT DISTINCT	"TCP_IP_PARQUE"."COD_PARQUE"  
									INTO 		:gl_cod_parque
									FROM 	"TCP_IP_PARQUE"  
									WHERE 	"TCP_IP_PARQUE"."TCP_IP" = :gs_tcp_ip 
									USING	sqlca;
									if sqlca.sqlcode=0 then
										gl_cod_parque_cta			= gl_cod_parque
										SELECT	"COD_PARQ"."NOMBRE"
										INTO 		:gs_nom_cod_parque
										FROM 	"COD_PARQ"
										WHERE 	"COD_PARQ"."CODIGO" = :gl_cod_parque;
										if ll_resp=1 then open(w_cambio_clave)
										Close(w_logon)
									else
										SELECT DISTINCT	"TCP_IP_PARQUE"."COD_PARQUE"  
										INTO 		:gl_cod_parque
										FROM 	"TCP_IP_PARQUE"  
										WHERE 	"TCP_IP_PARQUE"."USUARIO" = :gs_user
										USING	sqlca;
										if sqlca.sqlcode=0 then
											gl_cod_parque_cta			= gl_cod_parque
											SELECT	"COD_PARQ"."NOMBRE"
											INTO 		:gs_nom_cod_parque
											FROM 	"COD_PARQ"
											WHERE 	"COD_PARQ"."CODIGO" = :gl_cod_parque;
											if ll_resp=1 then open(w_cambio_clave)
											Close(w_logon)
										else
											gl_val_1		= 0			// messagebox("Advertencia","Error TCP_IP No está asignada a Ningún Parque (Comuníquese a Departamento Informática)",Exclamation!,OK!,1)
										end if
									end if
								end if
							END IF
						end if
					end if
				end if
			end if
		else
			sle_clave.text 				= ""
			sle_clave.SetFocus( )
			gl_contar_logon ++
			if gl_contar_logon > ( il_veces_logon + 1 ) then
				messagebox("Advertencia","No es posible Ingresar, máximo de Intentos Realizados...  Intente minutos más Tarde")
				Close(w_logon)
				close(w_conexion)
				halt close
			else
				MessageBox(gs_app_name, "El Usuario NO se encuentra o su Clave es Incorrecta.")
			end if
		end if
	end if
else
	messagebox("Advertencia","Usuario Inexistente")
end if
end event

type p_1 from picture within w_logon
integer x = 32
integer y = 32
integer width = 407
integer height = 436
string picturename = "logo_parque_conce.jpg"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

