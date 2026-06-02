forward
global type w_cambio_clave from window
end type
type st_10 from statictext within w_cambio_clave
end type
type st_9 from statictext within w_cambio_clave
end type
type st_4 from statictext within w_cambio_clave
end type
type p_1 from picture within w_cambio_clave
end type
type st_3 from statictext within w_cambio_clave
end type
type st_fecha_comp from statictext within w_cambio_clave
end type
type cb_grabar from commandbutton within w_cambio_clave
end type
type st_nom_dia from statictext within w_cambio_clave
end type
type st_2 from statictext within w_cambio_clave
end type
type sle_clave_antigua from singlelineedit within w_cambio_clave
end type
type st_8 from statictext within w_cambio_clave
end type
type st_nombre_usuario from statictext within w_cambio_clave
end type
type st_7 from statictext within w_cambio_clave
end type
type st_6 from statictext within w_cambio_clave
end type
type st_5 from statictext within w_cambio_clave
end type
type sle_confirma_clave from singlelineedit within w_cambio_clave
end type
type st_fecha_termino from statictext within w_cambio_clave
end type
type em_nueva_fecha from editmask within w_cambio_clave
end type
type sle_clave from singlelineedit within w_cambio_clave
end type
type sle_usuario from singlelineedit within w_cambio_clave
end type
type st_clave from statictext within w_cambio_clave
end type
type st_1 from statictext within w_cambio_clave
end type
type cb_cancelar from commandbutton within w_cambio_clave
end type
type cb_aceptar from commandbutton within w_cambio_clave
end type
end forward

global type w_cambio_clave from window
integer x = 425
integer y = 416
integer width = 2199
integer height = 1712
boolean titlebar = true
string title = "Cambio de Clave"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
st_10 st_10
st_9 st_9
st_4 st_4
p_1 p_1
st_3 st_3
st_fecha_comp st_fecha_comp
cb_grabar cb_grabar
st_nom_dia st_nom_dia
st_2 st_2
sle_clave_antigua sle_clave_antigua
st_8 st_8
st_nombre_usuario st_nombre_usuario
st_7 st_7
st_6 st_6
st_5 st_5
sle_confirma_clave sle_confirma_clave
st_fecha_termino st_fecha_termino
em_nueva_fecha em_nueva_fecha
sle_clave sle_clave
sle_usuario sle_usuario
st_clave st_clave
st_1 st_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
end type
global w_cambio_clave w_cambio_clave

type variables
string 	is_codigo,is_pass,is_nombre,is_depto,is_company,is_acceso
datetime idt_fecha
string 	is_dbms, is_logpass, is_servername, is_logid, is_dbparam
Long		il_dias_fecha_exp,  il_veces_no_coincidir
end variables

on w_cambio_clave.create
this.st_10=create st_10
this.st_9=create st_9
this.st_4=create st_4
this.p_1=create p_1
this.st_3=create st_3
this.st_fecha_comp=create st_fecha_comp
this.cb_grabar=create cb_grabar
this.st_nom_dia=create st_nom_dia
this.st_2=create st_2
this.sle_clave_antigua=create sle_clave_antigua
this.st_8=create st_8
this.st_nombre_usuario=create st_nombre_usuario
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.sle_confirma_clave=create sle_confirma_clave
this.st_fecha_termino=create st_fecha_termino
this.em_nueva_fecha=create em_nueva_fecha
this.sle_clave=create sle_clave
this.sle_usuario=create sle_usuario
this.st_clave=create st_clave
this.st_1=create st_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.Control[]={this.st_10,&
this.st_9,&
this.st_4,&
this.p_1,&
this.st_3,&
this.st_fecha_comp,&
this.cb_grabar,&
this.st_nom_dia,&
this.st_2,&
this.sle_clave_antigua,&
this.st_8,&
this.st_nombre_usuario,&
this.st_7,&
this.st_6,&
this.st_5,&
this.sle_confirma_clave,&
this.st_fecha_termino,&
this.em_nueva_fecha,&
this.sle_clave,&
this.sle_usuario,&
this.st_clave,&
this.st_1,&
this.cb_cancelar,&
this.cb_aceptar}
end on

on w_cambio_clave.destroy
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_4)
destroy(this.p_1)
destroy(this.st_3)
destroy(this.st_fecha_comp)
destroy(this.cb_grabar)
destroy(this.st_nom_dia)
destroy(this.st_2)
destroy(this.sle_clave_antigua)
destroy(this.st_8)
destroy(this.st_nombre_usuario)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.sle_confirma_clave)
destroy(this.st_fecha_termino)
destroy(this.em_nueva_fecha)
destroy(this.sle_clave)
destroy(this.sle_usuario)
destroy(this.st_clave)
destroy(this.st_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
end on

event open;Date		ld_fec_prox
string	ls_dia_nom,ls_dia_fer
long		ll_mes_fec,ll_fin_dia,ll_dia_fec
w_cambio_clave.title		= 'Cambio de Clave                             Parque:  '+gs_nom_cod_parque
gf_centrar(w_cambio_clave)
if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 	= 'logo_parque_stgo.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.jpg'
end if
st_nom_dia.text				= ''
SELECT	"VALIDAR_LOGON_CLAVE"."DIAS_FECHA_EXPIRAR", 		"VALIDAR_LOGON_CLAVE"."VECES_NO_COINCIDIR_CLAVE"  
INTO 		:il_dias_fecha_exp,   												:il_veces_no_coincidir  
FROM 	"VALIDAR_LOGON_CLAVE"  ;

SELECT 	CODIGO_USUARIO,	PASSWORD,	NOMBRE    ,		ACCESO    ,	DEPTO    ,	COMPANY    ,	FECHA_EXPIRACION
INTO 		:is_codigo    ,			:is_pass,			:is_nombre,		:is_acceso,	:is_depto,	:is_company,	:idt_fecha
FROM 		ENCARGADOS  
WHERE  ( CODIGO_USUARIO = :gs_user )
USING		sqlca;
if sqlca.sqlcode=0 then
	st_fecha_termino.text	= string(date(idt_fecha),"dd/mm/yyyy")
	sle_usuario.text			= gs_user
	st_nombre_usuario.text	= is_nombre
end if
end event

type st_10 from statictext within w_cambio_clave
integer x = 1714
integer y = 472
integer width = 334
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 27304096
long backcolor = 67108864
string text = "Caracteres"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_cambio_clave
integer x = 1714
integer y = 404
integer width = 334
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 27304096
long backcolor = 67108864
string text = "6"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_cambio_clave
integer x = 1714
integer y = 344
integer width = 334
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 27304096
long backcolor = 67108864
string text = "Máximo"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within w_cambio_clave
integer x = 37
integer y = 32
integer width = 370
integer height = 372
string picturename = "logo_e.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_cambio_clave
integer x = 37
integer y = 1460
integer width = 2107
integer height = 124
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
string text = "Recuerde al Grabar el Sistema Cerrará Automáticamente, Ud. No debe Tener Pantallas Abiertas."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_fecha_comp from statictext within w_cambio_clave
integer x = 169
integer y = 976
integer width = 1957
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_cambio_clave
integer x = 37
integer y = 1324
integer width = 343
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_resp,ll_count
String	ls_clave
Datetime	ld_fec_new

if trim(sle_clave_antigua.text)<>'' and trim(sle_clave.text)<>'' and trim(sle_confirma_clave.text)<>'' and &
	not isnull(sle_clave_antigua.text) and not isnull(sle_clave.text) and not isnull(sle_confirma_clave.text) and &
	trim(sle_clave.text)=trim(sle_confirma_clave.text) and trim(sle_clave_antigua.text)<>trim(sle_clave.text) then
	ll_resp 									= MessageBox("Advertencia", "Está seguro de Cambiar su Clave", Exclamation!, YesNo!, 2)
	IF ll_resp = 1 THEN
		ls_clave								= trim(sle_clave.text)
		ld_fec_new							= datetime(date(em_nueva_fecha.text))
		SELECT	count("LOG_ENCARGADOS"."PASSWORD"), sysdate
		INTO 		:ll_count,   						:gdt_fec_sistema
		FROM 	"LOG_ENCARGADOS"  
		WHERE 	"LOG_ENCARGADOS"."CODIGO_USUARIO" = :gs_user
		USING	sqlca;  
		if isnull(ll_count) then ll_count=0
		UPDATE	"ENCARGADOS"  
		SET 		"PASSWORD" = :ls_clave,   
					"FECHA_EXPIRACION" = :ld_fec_new  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
		USING	sqlca ;
		if sqlca.sqlcode=0 then
			commit using sqlca;
			ll_count ++
			INSERT INTO	"LOG_ENCARGADOS"  
						( "CODIGO_USUARIO",	"FECHA",				"CORRELATIVO",		"PASSWORD",		"CODIGO_APLICACION" )  
			VALUES 	( :gs_user,   				:gdt_fec_sistema, :ll_count,   				:ls_clave,   			:gl_aplicacion )  
			Using		sqlca;
			if sqlca.sqlcode=0 then
				commit using sqlca;
			end if
			gi_nivel_acceso		= 0
			gs_clave 				= trim(sle_clave.text)
			if is_depto<>'K' and is_depto<>'R' and is_depto<>'B' then
				disconnect using sqlca;
				if gs_empresa = 'El Prado' then
		//			Conexion Serena
					is_dbms 				= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
					is_logpass 			= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
					is_servername 		= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_sandbox_qa")
					is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
					is_dbparam 			= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
					sqlca.DBMS 			= is_dbms
					sqlca.LogPass 		= is_logpass
					sqlca.ServerName	= is_servername
					sqlca.LogId 			= is_logid
					sqlca.dbParm 		= is_dbparam
					connect using sqlca;
					UPDATE	"ENCARGADOS"  
					SET 		"PASSWORD" = :ls_clave,   
								"FECHA_EXPIRACION" = :ld_fec_new  
					WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
					USING		sqlca ;
					if sqlca.sqlcode=0 then
						commit using sqlca;
						INSERT INTO	"LOG_ENCARGADOS"  
									( "CODIGO_USUARIO",	"FECHA",				"CORRELATIVO",		"PASSWORD",		"CODIGO_APLICACION" )  
						VALUES 	( :gs_user,   			:gdt_fec_sistema, :ll_count,   		:ls_clave,   	:gl_aplicacion )  
						Using		sqlca;
						if sqlca.sqlcode=0 then
							commit using sqlca;
						end if
					else
						rollback using sqlca;
					end if
					
					disconnect using sqlca;
					
				elseif gs_empresa	= 'La Foresta' then
		//			Conexion Santiago
					is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
					is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
					is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","prado_sandbox_qa")
					is_logid 					= profilestring("INMOB.INI", "Conexión", "LogId","prado")
					is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
					SQLCA.DBMS 			= is_dbms
					SQLCA.LogPass 		= is_logpass
					SQLCA.ServerName 	= is_servername
					SQLCA.LogId 			= is_logid
					SQLCA.dbParm 		= is_dbparam
					connect using sqlca;
					UPDATE	"ENCARGADOS"  
					SET 		"PASSWORD" = :ls_clave,   
								"FECHA_EXPIRACION" = :ld_fec_new  
					WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
					USING	sqlca ;
					if sqlca.sqlcode=0 then
						commit using sqlca;
						INSERT INTO	"LOG_ENCARGADOS"  
									( "CODIGO_USUARIO",	"FECHA",				"CORRELATIVO",		"PASSWORD",		"CODIGO_APLICACION" )  
						VALUES 	( :gs_user,   				:gdt_fec_sistema, :ll_count,   				:ls_clave,   			:gl_aplicacion )  
						Using		sqlca;
						if sqlca.sqlcode=0 then
							commit using sqlca;
						end if
					else
						rollback using sqlca;
					end if
					
					disconnect using sqlca;
					
				
				end if
				
				disconnect using sqlca;
				if gs_empresa = 'El Prado' then
					is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
					is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
					is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","prado_sandbox_qa")
					is_logid 					= profilestring("INMOB.INI", "Conexión", "LogId","prado")
					is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
					SQLCA.DBMS 			= is_dbms
					SQLCA.LogPass 		= is_logpass
					SQLCA.ServerName 	= is_servername
					SQLCA.LogId 			= is_logid
					SQLCA.dbParm 		= is_dbparam
					connect using sqlca;
				elseif gs_empresa = 'La Foresta' then
					is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
					is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
					is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_sandbox_qa")
					is_logid 					= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
					is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
					sqlca.DBMS 				= is_dbms
					sqlca.LogPass 			= is_logpass
					sqlca.ServerName		= is_servername
					sqlca.LogId 				= is_logid
					sqlca.dbParm 			= is_dbparam
					connect using sqlca;				
				
				end if
			end if
			SetPointer(Arrow!)
			gs_clave							= trim(UPPER(sle_clave.text))
			messagebox("Grabar","Grabación Exitosa")
			connect using sqlca;		
			close(w_cambio_clave)
			halt close
		else
			rollback;
			messagebox("Advertencia","Error al Grabar: "+sqlca.sqlerrtext)
		end if
	END IF
else
	if trim(sle_clave_antigua.text)<>'' and not isnull(sle_clave_antigua.text) then
		messagebox("Advertencia","Falta Ingresar Clave")
		sle_clave_antigua.setfocus()
	elseif trim(sle_clave.text)<>'' and not isnull(sle_clave.text) then
		messagebox("Advertencia","Falta Ingresar Nueva Clave")
		sle_clave.setfocus()
	elseif trim(sle_confirma_clave.text)<>'' and not isnull(sle_confirma_clave.text) then
		messagebox("Advertencia","Falta Ingresar Confirmación Nueva Clave")
		sle_confirma_clave.setfocus()
	elseif trim(sle_clave.text)<>trim(sle_confirma_clave.text) then
		messagebox("Advertencia","Error en Confirmación de Clave, No es Igual a Nueva Clave")
		sle_confirma_clave.setfocus()
	elseif trim(sle_clave_antigua.text)=trim(sle_clave.text) then	
		messagebox("Advertencia","Error Clave Nueva Inválida, No debe ser Igual a Clave Actual")
		sle_clave.setfocus()
	end if
end if
end event

type st_nom_dia from statictext within w_cambio_clave
integer x = 1737
integer y = 868
integer width = 389
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_cambio_clave
integer x = 731
integer y = 152
integer width = 466
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Clave Actual"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_clave_antigua from singlelineedit within w_cambio_clave
event keydown pbm_keydown
integer x = 1230
integer y = 144
integer width = 475
integer height = 92
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
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

event modified;string acceso, clave, ls_usuario,ls_usuario_aux,ls_pass,ls_clave

ls_usuario									= trim(Upper(sle_usuario.text))
ls_clave										= trim(Upper(sle_clave_antigua.text))
CONNECT USING SQLCA;
SELECT	"ENCARGADOS"."CODIGO_USUARIO"   
INTO 		:ls_usuario_aux   
FROM 	"ENCARGADOS"  
WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario AND	
			"ENCARGADOS"."PASSWORD" = :ls_clave) 
USING		sqlca; 
if NOT ISNULL(ls_usuario_aux) and ls_usuario_aux<>'' then
//	IF ls_clave = TRIM(ls_pass) THEN
		cb_aceptar.enabled        		= true
		sle_confirma_clave.enabled 	= true
		sle_clave.enabled          			= true
		st_fecha_termino.BackColor 	= rgb(255,255,255)
		st_fecha_termino.textcolor 		= rgb(255,0,0)
		st_nombre_usuario.textcolor 	= rgb(0,0,255)
		st_clave.textcolor         			= rgb(0,0,0)
		st_5.textcolor             			= rgb(0,0,0)
		st_6.textcolor             			= rgb(0,0,0)
		st_7.textcolor             			= rgb(0,0,0)
		st_8.textcolor             			= rgb(0,0,0)
		sle_clave.setfocus()	
//	else
//		messagebox("Advertencia","Password Incorrecta")
//		sle_clave_antigua.text			= ''
//		cb_aceptar.enabled        		= false
//		sle_confirma_clave.enabled 	= false
//		sle_clave.enabled          			= false
//		this.setfocus()
//	end if
else
	messagebox("Advertencia","Password Incorrecta")
	cb_aceptar.enabled        		= false
	sle_confirma_clave.text 			= ''
	sle_clave.text          				= ''
	sle_clave_antigua.text          	= ''
	sle_confirma_clave.enabled 	= false
	sle_clave.enabled          			= false
	this.setfocus()
end if
end event

type st_8 from statictext within w_cambio_clave
integer x = 37
integer y = 1080
integer width = 736
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Nombre Usuario:"
boolean focusrectangle = false
end type

type st_nombre_usuario from statictext within w_cambio_clave
integer x = 37
integer y = 1168
integer width = 2121
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
boolean focusrectangle = false
end type

type st_7 from statictext within w_cambio_clave
integer x = 489
integer y = 868
integer width = 709
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Nueva Fecha a Expirar:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_cambio_clave
integer x = 494
integer y = 664
integer width = 704
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Fecha Actual a Expirar:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_cambio_clave
integer x = 475
integer y = 460
integer width = 722
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Confirmar Nueva Clave:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_confirma_clave from singlelineedit within w_cambio_clave
integer x = 1230
integer y = 452
integer width = 475
integer height = 92
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;if not isnull(trim(sle_clave.text)) and not isnull(trim(sle_confirma_clave.text)) then 
	if trim(sle_clave.text) <> trim(sle_confirma_clave.text) then
		messagebox("Advertencia","Error en Confirmación, debe ser igual a Clave Nueva")
		this.text	= ''
		this.setfocus()
	else
		cb_aceptar.triggerevent(clicked!)
	end if
end if
end event

type st_fecha_termino from statictext within w_cambio_clave
integer x = 1230
integer y = 656
integer width = 475
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 10789024
long backcolor = 80269524
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_nueva_fecha from editmask within w_cambio_clave
integer x = 1230
integer y = 860
integer width = 475
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;//this.text = string(RelativeDate(today(),60),gs_formato_fecha)
end event

type sle_clave from singlelineedit within w_cambio_clave
integer x = 1230
integer y = 340
integer width = 475
integer height = 92
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

event modified;Long		ll_count,ll_corr_consultar
String	ls_password,ls_clave

ls_clave						= trim(this.text)
if not isnull(trim(sle_clave.text)) then 
	SELECT	count("LOG_ENCARGADOS"."PASSWORD"), sysdate
	INTO 		:ll_count,   											:gdt_fec_sistema
	FROM 	"LOG_ENCARGADOS"  
	WHERE 	"LOG_ENCARGADOS"."CODIGO_USUARIO" = :gs_user
	USING	sqlca;  
	if isnull(ll_count) then ll_count=0
	if ll_count >= ( il_veces_no_coincidir - 1 ) then	//2
		ll_corr_consultar	= ll_count - 1
		SELECT	"LOG_ENCARGADOS"."PASSWORD"  
		INTO 		:ls_password  
		FROM 	"LOG_ENCARGADOS"  
		WHERE  ( "LOG_ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) AND  
				 ( "LOG_ENCARGADOS"."CORRELATIVO" = :ll_corr_consultar )   
		USING	sqlca;
		if ls_password = ls_clave then
			messagebox("Advertencia","Ya fue Registrada Anteriormente, recuerde no debe coincidir con las 3 Ultimas Claves ingresadas")
			this.text			= ''
			this.setfocus()
		else
			if trim(sle_clave.text) = trim(sle_clave_antigua.text) then
				messagebox("Advertencia","Clave Ingresada debe ser distinta a la Clave Actual")
				this.text		= ''
				this.setfocus()
			else
				cb_aceptar.triggerevent(clicked!)
				sle_confirma_clave.setfocus()
			end if
		end if
	else
		if trim(sle_clave.text) = trim(sle_clave_antigua.text) then
			messagebox("Advertencia","Clave Ingresada debe ser distinta a la Clave Actual")
			this.text			= ''
			this.setfocus()
		else
			cb_aceptar.triggerevent(clicked!)
			sle_confirma_clave.setfocus()
		end if
	end if
end if

end event

type sle_usuario from singlelineedit within w_cambio_clave
integer x = 1230
integer y = 32
integer width = 475
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_clave from statictext within w_cambio_clave
integer x = 535
integer y = 348
integer width = 663
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese Nueva Clave:"
alignment alignment = right!
long bordercolor = 255
boolean focusrectangle = false
end type

type st_1 from statictext within w_cambio_clave
integer x = 837
integer y = 40
integer width = 361
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Usuario"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_cambio_clave
integer x = 1801
integer y = 1324
integer width = 343
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;//gi_nivel_acceso	= 0
//gs_clave 			= sle_clave.text
Close(w_cambio_clave)
end event

type cb_aceptar from commandbutton within w_cambio_clave
boolean visible = false
integer x = 919
integer y = 1324
integer width = 375
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Aceptar"
end type

event clicked;date 		fecha_nueva,fecha_termino,fecha,fecha1,ld_fec_prox,ld_fec_new,ldt_fecha_nueva,ldt_fecha_actual
Long		ll_mes_fec,dias,ret,ll_dia_fec,ll_resp,ll_anno_fec,ll_dias_dif
String	ls_sw='S',ls_dia_nom,ls_descrip,ls_dia_fer,ls_clave,ls_fec_comp

st_nom_dia.text					= ''
SetPointer(HourGlass!)
if trim(sle_clave_antigua.text)<>'' and trim(sle_clave.text)<>'' and trim(sle_confirma_clave.text)<>'' then
	if upper(sle_clave.text) = upper(sle_clave_antigua.text) then
		messagebox(gs_app_name,'La Nueva Clave debe ser Distinta a la Actual',information!)
		sle_clave.text 				= ''
		sle_confirma_clave.text 	= ''
		sle_clave.setfocus()
		return
	end if
	if sle_clave.text = '' then
		messagebox(gs_app_name,'Debe Ingresar la Nueva Clave',information!)
		sle_clave.setfocus()
		return
	end if
	if sle_confirma_clave.text = '' then
		messagebox(gs_app_name,'Debe Ingresar la Confirmación de la Nueva Clave',information!)
		sle_confirma_clave.setfocus()
		return
	end if
	if upper(sle_clave.text) <> upper(sle_confirma_clave.text) then
		messagebox(gs_app_name,'La Confirmación de la Nueva Clave debe ser Igual a la Nueva Clave',information!)
		sle_confirma_clave.text	= ''
		sle_clave.text 				= ''
		sle_clave.setfocus()
		return
	end if
	st_fecha_termino.text			= string(date(idt_fecha),"dd/mm/yyyy")
	sle_usuario.text				= is_codigo
	st_nombre_usuario.text		= is_nombre
	ld_fec_prox						= RelativeDate(date(gdt_fec_sistema),il_dias_fecha_exp) //45
	ls_dia_nom						= UPPER(DayName(ld_fec_prox))
	if ls_dia_nom='SABADO' or ls_dia_nom='SATURDAY' then
		ld_fec_prox					= RelativeDate(ld_fec_prox,2)
	elseif ls_dia_nom='DOMINGO' or ls_dia_nom='SUNDAY' then
		ld_fec_prox					= RelativeDate(ld_fec_prox,1)
	end if
	DO WHILE ls_sw='S'
		ll_mes_fec					= Month(ld_fec_prox)
		ll_dia_fec					= day(ld_fec_prox)
		ll_anno_fec					= Year(ld_fec_prox)
		ls_dia_fer					= string(ll_dia_fec,"00")+string(ll_mes_fec,"00")
		SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 		"PER_DIAS_FESTIVOS"  
		WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_dia_fer   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ld_fec_prox				= RelativeDate(ld_fec_prox,1)
			ls_dia_nom				= UPPER(DayName(ld_fec_prox))
			if ls_dia_nom = 'SABADO' or ls_dia_nom = 'SATURDAY' then
				ld_fec_prox			= RelativeDate(ld_fec_prox,2)
			elseif ls_dia_nom = 'DOMINGO' or ls_dia_nom = 'SUNDAY' then
				ld_fec_prox			= RelativeDate(ld_fec_prox,1)
			end if
		else
			ls_sw						= 'N'
		end if
	LOOP
	em_nueva_fecha.text			= string(ld_fec_prox,"dd/mm/yyyy")
	CHOOSE CASE UPPER(DayName(ld_fec_prox))
		CASE 'LUNES','MONDAY'
			st_nom_dia.text		= 'Lunes'
		CASE 'MARTES','TUESDAY'
			st_nom_dia.text		= 'Martes'
		CASE 'MIERCOLES','WEDNESDAY'
			st_nom_dia.text		= 'Miércoles'
		CASE 'JUEVES','THURSDAY'
			st_nom_dia.text		= 'Jueves'
		CASE 'VIERNES','FRIDAY'
			st_nom_dia.text		= 'Viernes'
		CASE 'SABADO','SATURDAY'
			st_nom_dia.text		= 'Sábado'
		CASE 'DOMINGO','SUNDAY'
			st_nom_dia.text		= 'Domingo'
	END CHOOSE
	ls_fec_comp						= trim(st_nom_dia.text)
	
	if ll_mes_fec=1 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Enero de '+string(ll_anno_fec)
	elseif ll_mes_fec=2 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Febrero de '+string(ll_anno_fec)
	elseif ll_mes_fec=3 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Marzo de '+string(ll_anno_fec)
	elseif ll_mes_fec=4 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Abril de '+string(ll_anno_fec)
	elseif ll_mes_fec=5 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Mayo de '+string(ll_anno_fec)
	elseif ll_mes_fec=6 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Junio de '+string(ll_anno_fec)
	elseif ll_mes_fec=7 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Julio de '+string(ll_anno_fec)
	elseif ll_mes_fec=8 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Agosto de '+string(ll_anno_fec)
	elseif ll_mes_fec=9 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Septiembre de '+string(ll_anno_fec)
	elseif ll_mes_fec=10 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Octubre de '+string(ll_anno_fec)
	elseif ll_mes_fec=11 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Noviembre de '+string(ll_anno_fec)
	elseif ll_mes_fec=12 then
		st_fecha_comp.text		= ls_fec_comp+' '+string(ll_dia_fec)+' de Diciembre de '+string(ll_anno_fec)
	end if
	
	ldt_fecha_nueva				= date(em_nueva_fecha.text)
	ldt_fecha_actual				= date(st_fecha_termino.text)
	
	ll_dias_dif						= DaysAfter ( ldt_fecha_actual, ldt_fecha_nueva)
	st_fecha_comp.text			= '( '+string(ll_dias_dif,'###,###,##0')+' días a Expirar ) - '+st_fecha_comp.text
	
else
	sle_clave.setfocus()
end if
SetPointer(Arrow!)
end event

