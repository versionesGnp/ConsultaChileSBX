forward
global type w_solicitud_no_retiro from window
end type
type st_2 from statictext within w_solicitud_no_retiro
end type
type em_glosa from editmask within w_solicitud_no_retiro
end type
type dw_imprimir from datawindow within w_solicitud_no_retiro
end type
type cb_guardar from commandbutton within w_solicitud_no_retiro
end type
type cb_limpiar from commandbutton within w_solicitud_no_retiro
end type
type st_1 from statictext within w_solicitud_no_retiro
end type
type em_solicitante from editmask within w_solicitud_no_retiro
end type
type rb_cumple from radiobutton within w_solicitud_no_retiro
end type
type rb_sepul from radiobutton within w_solicitud_no_retiro
end type
type rb_falle from radiobutton within w_solicitud_no_retiro
end type
type cb_cerrar from commandbutton within w_solicitud_no_retiro
end type
type dw_lista from datawindow within w_solicitud_no_retiro
end type
type pb_aceptar from picturebutton within w_solicitud_no_retiro
end type
type st_16 from statictext within w_solicitud_no_retiro
end type
type dw_parque from datawindow within w_solicitud_no_retiro
end type
type dw_buscar from datawindow within w_solicitud_no_retiro
end type
type gb_1 from groupbox within w_solicitud_no_retiro
end type
type dw_lista_solicitudes from datawindow within w_solicitud_no_retiro
end type
end forward

global type w_solicitud_no_retiro from window
integer width = 2693
integer height = 2524
boolean titlebar = true
string title = "Solicitud no Retiro"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
st_2 st_2
em_glosa em_glosa
dw_imprimir dw_imprimir
cb_guardar cb_guardar
cb_limpiar cb_limpiar
st_1 st_1
em_solicitante em_solicitante
rb_cumple rb_cumple
rb_sepul rb_sepul
rb_falle rb_falle
cb_cerrar cb_cerrar
dw_lista dw_lista
pb_aceptar pb_aceptar
st_16 st_16
dw_parque dw_parque
dw_buscar dw_buscar
gb_1 gb_1
dw_lista_solicitudes dw_lista_solicitudes
end type
global w_solicitud_no_retiro w_solicitud_no_retiro

type variables
datawindowchild			idw_detalle5,idw_detalle6
end variables

event open;Long	ll_new,ll_parque

gf_centrar(w_solicitud_no_retiro)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
dw_lista_solicitudes.settransobject(sqlca)
dw_lista_solicitudes.insertrow(0)

dw_buscar.settransobject(sqlca)
dw_buscar.getchild('sepultura',idw_detalle5)
idw_detalle5.settransobject(sqlca)
idw_detalle5.insertrow(0)

if gs_conexion	= "Parque El Prado" then
	ll_parque			= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque			= 11
end if

dw_buscar.getchild('sector',idw_detalle6)
idw_detalle6.settransobject(sqlca)
if idw_detalle6.retrieve(ll_parque)=0 then
	idw_detalle6.insertrow(0)
end if
dw_buscar.insertrow(0)
dw_buscar.accepttext()
dw_parque.setfocus()
end event

on w_solicitud_no_retiro.create
this.st_2=create st_2
this.em_glosa=create em_glosa
this.dw_imprimir=create dw_imprimir
this.cb_guardar=create cb_guardar
this.cb_limpiar=create cb_limpiar
this.st_1=create st_1
this.em_solicitante=create em_solicitante
this.rb_cumple=create rb_cumple
this.rb_sepul=create rb_sepul
this.rb_falle=create rb_falle
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.pb_aceptar=create pb_aceptar
this.st_16=create st_16
this.dw_parque=create dw_parque
this.dw_buscar=create dw_buscar
this.gb_1=create gb_1
this.dw_lista_solicitudes=create dw_lista_solicitudes
this.Control[]={this.st_2,&
this.em_glosa,&
this.dw_imprimir,&
this.cb_guardar,&
this.cb_limpiar,&
this.st_1,&
this.em_solicitante,&
this.rb_cumple,&
this.rb_sepul,&
this.rb_falle,&
this.cb_cerrar,&
this.dw_lista,&
this.pb_aceptar,&
this.st_16,&
this.dw_parque,&
this.dw_buscar,&
this.gb_1,&
this.dw_lista_solicitudes}
end on

on w_solicitud_no_retiro.destroy
destroy(this.st_2)
destroy(this.em_glosa)
destroy(this.dw_imprimir)
destroy(this.cb_guardar)
destroy(this.cb_limpiar)
destroy(this.st_1)
destroy(this.em_solicitante)
destroy(this.rb_cumple)
destroy(this.rb_sepul)
destroy(this.rb_falle)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.pb_aceptar)
destroy(this.st_16)
destroy(this.dw_parque)
destroy(this.dw_buscar)
destroy(this.gb_1)
destroy(this.dw_lista_solicitudes)
end on

type st_2 from statictext within w_solicitud_no_retiro
integer x = 55
integer y = 1812
integer width = 329
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Glosa:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_glosa from editmask within w_solicitud_no_retiro
integer x = 416
integer y = 1800
integer width = 2194
integer height = 256
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
boolean autoskip = true
string minmax = "1~~100"
end type

type dw_imprimir from datawindow within w_solicitud_no_retiro
integer x = 2761
integer y = 64
integer width = 1125
integer height = 1288
integer taborder = 30
string title = "none"
string dataobject = "dwe_solicitud_no_retiro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_guardar from commandbutton within w_solicitud_no_retiro
integer x = 32
integer y = 2288
integer width = 293
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Guardar"
end type

event clicked;string		ls_nom_titular,ls_nombre_falle,ls_apat_falle,ls_amat_falle,ls_nombre_titular,ls_apat_titular,ls_amat_titular,ls_titular,ls_fallecido,&
			ls_sector,ls_sepultura,ls_solicitante,ls_texto_motivo,ls_parque,ls_dv_titular,ls_base,ls_serie,ls_print,ls_glosa,ls_nom_usuario,email_de,&
			ls_email_para,ls_res
long		ll_row,ll_largo,ll_parque,ll_dia,ll_mes,ll_anno,ll_corr,ll_rut_titular,ll_tot_reg
double	ldb_numero
date		ld_fecha_motivo,ld_fecha
datetime ldt_fecha_sis

ll_row	= dw_lista.getrow()
if ll_row > 0 then
	ll_parque					= dw_parque.getitemnumber(1,'cod_parque')
	ls_nombre_falle		= dw_lista.getitemstring(ll_row,'fallecidos_nombres')
	ls_apat_falle			= dw_lista.getitemstring(ll_row,'fallecidos_ap_paterno')
	ls_amat_falle			= dw_lista.getitemstring(ll_row,'fallecidos_ap_materno')
	ls_nombre_titular		= dw_lista.getitemstring(ll_row,'cliente_nombre')
	ls_apat_titular			= dw_lista.getitemstring(ll_row,'cliente_a_paterno')
	ls_amat_titular			= dw_lista.getitemstring(ll_row,'cliente_a_materno')
	ll_rut_titular				= dw_lista.getitemnumber(ll_row,'cliente_rut')
	ls_dv_titular				= dw_lista.getitemstring(ll_row,'cliente_dv')
	ls_base					= dw_lista.getitemstring(ll_row,'cadena_codigo')
	ls_serie					= dw_lista.getitemstring(ll_row,'cadena_serie')
	ldb_numero				= dw_lista.getitemnumber(ll_row,'cadena_numero')
	ls_sector					= dw_buscar.getitemstring(1,'sector')
	ls_sepultura				= dw_buscar.getitemstring(1,'sepultura')
	if rb_cumple.checked = true then
		ld_fecha_motivo	= date(dw_lista.getitemdatetime(ll_row,'fallecidos_fec_nac'))
		ls_texto_motivo		= 'Cumpleaños de Fallecido'
	elseif 	rb_sepul.checked = true then
		ld_fecha_motivo	= date(dw_lista.getitemdatetime(ll_row,'fallecidos_fec_sep'))
		ls_texto_motivo		= 'Aniversario de Sepultación'
	elseif 	rb_falle.checked = true then
		ld_fecha_motivo	= date(dw_lista.getitemdatetime(ll_row,'fallecidos_fec_fall'))
		ls_texto_motivo		= 'Aniversario de Fallecido'
	end if	
	ll_dia						= day(ld_fecha_motivo)
	ll_mes					= month(ld_fecha_motivo)
	ll_anno					= year(date(gdt_fec_sistema))
	ld_fecha_motivo		= date(string(ll_dia,'00')+'/'+string(ll_mes,'00')+'/'+string(ll_anno))
	ls_titular					= ls_nombre_titular+' '+ls_apat_titular+' '+ls_amat_titular
	ls_fallecido				= ls_nombre_falle+' '+ls_apat_falle+' '+ls_amat_falle
	ls_solicitante			= trim(em_solicitante.text)
	ls_glosa					= trim(em_glosa.text)
	ld_fecha					= date(gdt_fec_sistema)
	ldt_fecha_sis			= gdt_fec_sistema
	dw_imprimir.insertrow(0)
	
	SELECT 	MAX("SOLICITUD_NO_RETRO"."CORRELATIVO")
	INTO 		:ll_corr  
	FROM 	"SOLICITUD_NO_RETRO"
	USING	sqlca;
	if isnull(ll_corr) then
		ll_corr		= 1
	else	
		ll_corr		= ll_corr+1
	end if
	if not isnull(ls_solicitante) then
		if ll_parque=1 then
			dw_imprimir.object.p_1.filename 	= 'logo_e.bmp'
		elseif ll_parque = 11 then
			dw_imprimir.object.p_1.filename  	= 'logo_e_s.bmp'	
		elseif ll_parque=102 then
			dw_imprimir.object.p_1.filename 	= 'logo_manantial.bmp'
		elseif ll_parque=103 then
			dw_imprimir.object.p_1.filename 	= 'logo_parque_stgo.bmp'
		elseif ll_parque=101 then 
			dw_imprimir.object.p_1.filename 	= 'logo_canaan.bmp'
		else
			dw_imprimir.object.p_1.filename 	= 'logo_e.bmp'
		end if		
		SELECT "COD_PARQ"."NOMBRE"  
		INTO 	   :ls_parque  
		FROM   "COD_PARQ"  
		WHERE "COD_PARQ"."CODIGO" = :ll_parque
		USING   sqlca;
		if (ls_nombre_falle = ls_nombre_titular) and (ls_apat_falle = ls_apat_titular) and (ls_amat_falle = ls_amat_titular) then
			ls_titular			= ls_apat_titular+' '+ls_amat_titular
			dw_imprimir.object.t_4.text	= 'ADEMAS INFORMO QUE FAMILIA:'
		else
			dw_imprimir.object.t_4.text	= 'ADEMAS INFORMO QUE EL TITULAR SR(A):'
		end if	
		dw_imprimir.setitem(1,'nombre_solicitante',ls_solicitante)
		dw_imprimir.setitem(1,'nombre_fallecido',ls_fallecido)
		dw_imprimir.setitem(1,'parque',ls_parque)
		dw_imprimir.setitem(1,'titular',ls_titular)
		dw_imprimir.setitem(1,'sector',ls_sector)
		dw_imprimir.setitem(1,'sepultura',ls_sepultura)
		dw_imprimir.setitem(1,'fecha_motivo',ld_fecha_motivo)
		dw_imprimir.setitem(1,'fecha_solicitud',date(gdt_fec_sistema))		
		dw_imprimir.object.t_motivo.text 				= ls_texto_motivo
		dw_imprimir.accepttext()
		if not isnull(ls_solicitante) and ls_solicitante <> '' then	
			INSERT INTO "SOLICITUD_NO_RETRO"  
						( "CORRELATIVO", "RUT_TITULAR", "DV_TITULAR", "BASE", "SERIE", "NUMERO", "PARQUE", "SECTOR", "SEPULTURA", "FALLECIDO", "MOTIVO_SOLICITUD", "GOLSA_SOLICITUD", "FECHA_SOLICITUD", "FECHA_SISTEMA", "SOLICITANTE","USUARIO" )
			VALUES 	(	:ll_corr, 		:ll_rut_titular,  		:ls_dv_titular,   :ls_base,   :ls_serie,  :ldb_numero,  :ll_parque,  :ls_sector, :ls_sepultura, :ls_fallecido, :ls_texto_motivo,  	:ls_glosa,  			:ld_fecha_motivo,   		:ldt_fecha_sis, :ls_solicitante, :gs_user)
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit;
				//--- nueva grabacion de registro para linkearlo con cuenta corriente
				 INSERT INTO "ATENCION_PARQUE"  
         					( "BASE", 	"SERIE", 		"NUMERO", 		"RUT",  		"FECHA_CREA", "OBSERVACION",   "ESTADO",   "FECHA_ESTADO",  "USUARIO", "AREA",  "SECTOR",  "SEPULTURA" )  
		  		VALUES 	( :ls_base,   :ls_serie,   :ldb_numero,   :ll_rut_titular,  :ldt_fecha_sis,  :ls_glosa,   	'P',   			:ldt_fecha_sis,   :gs_user,   'A',   :ls_sector,  :ls_sepultura)  ;
				if sqlca.sqlcode = 0 then
					commit;
					messagebox('Aviso','Grabación Exitosa')
					ls_print	= 'S'
					
					///--envo email a administradores y encargados
					SELECT	"ENCARGADOS"."NOMBRE"  
					INTO 		:ls_nom_usuario  
					FROM 		"ENCARGADOS"  
					WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;
					
					if not isnull(ls_nom_usuario) and not isnull(ls_sector) and ls_sector<>'' and ls_sector<>'-' and not isnull(ls_sepultura) then
						DECLARE x1 CURSOR FOR  
						SELECT	"ENCARGADOS"."EMAIL"  
						FROM		"ENCARGADOS",   "FICHA_ADMINISTRADORES"  
						WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "FICHA_ADMINISTRADORES"."USUARIO_ADM" ) and  
								 ( "ENCARGADOS"."ESTADO" = "FICHA_ADMINISTRADORES"."ESTADO" ) and  
								 (("FICHA_ADMINISTRADORES"."COD_PARQUE" = :ll_parque ) AND  
								 ( "FICHA_ADMINISTRADORES"."ESTADO" = 'A' )   )   
						USING		sqlca;
						open x1;
						if sqlca.sqlcode=0 then
							String	ls_asunto,ls_texto
							SetNull(ls_texto)
							SELECT	Count("ENCARGADOS"."EMAIL")
							INTO		:ll_tot_reg
							FROM		"ENCARGADOS",   "FICHA_ADMINISTRADORES"  
							WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "FICHA_ADMINISTRADORES"."USUARIO_ADM" ) and  
									 ( "ENCARGADOS"."ESTADO" = "FICHA_ADMINISTRADORES"."ESTADO" ) and  
									 (("FICHA_ADMINISTRADORES"."COD_PARQUE" = :ll_parque ) AND  
									 ( "FICHA_ADMINISTRADORES"."ESTADO" = 'A' )   )   
							USING		sqlca;
							if ll_tot_reg>0 then
								ls_asunto	= 'AVISO DE SOLICITUD NO RETIRO DE FLORES '+STRING(ld_fecha_motivo,"dd/mm/yyyy")+' enviado por: '+ls_nom_usuario+' PARQUE: '+ls_parque
								ls_texto 		= 'Recordamos que se GENERO Solicitud no Retiro de Flores para el día '+string(ld_fecha_motivo,'dd/mm/yyyy')+' por Motivo: '+ls_texto_motivo+', Sector: '+ls_sector+' Nº Sepultura: '+ls_sepultura+', el Nombre del Fallecido es '+ls_fallecido
							end if
							SELECT DISTINCT "ENCARGADOS"."EMAIL"  
							INTO 		:email_de  
							FROM 		"ENCARGADOS"  
							WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
							USING		sqlca;
							if isnull(email_de) or email_de='-' or email_de='' then
								email_de				= 'consulta@nuestrosparques.cl'
							end if
							
							SELECT 	"MEMBRETE_EMPRESA"."MAIL_SEPULTACION"  
							INTO 		:ls_email_para  
							FROM 	"MEMBRETE_EMPRESA"  
							WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_parque
							USING	sqlca;

							select	EnviarMail(:email_de,:ls_email_para,:ls_asunto,:ls_texto) 
							INTO 		:ls_res
							from 		DUAL;
							if ls_res='OK' then
								messagebox("Envio Email","Envio Email Exitoso")
							else
								messagebox("Error Envio Email","Error Envio Email SQL: "+ls_res)
							end if
						end if	
					end if	
					//--fin envio email
				else
					rollback;
					messagebox('Error','Error al Grabar')
					ls_print	= 'N'
				end if	
				//---fin nuevo //
//				messagebox('Aviso','Grabación Exitosa')
//				ls_print	= 'S'
			else
				rollback;
				messagebox('Error','Error al Grabar')
				ls_print	= 'N'
			end if
			if ls_print	= 'S' then
				f_Print( dw_imprimir )
				cb_limpiar.triggerEvent(Clicked!)
			end if	
		else
			messagebox('Aviso','No ha Ingresado Solicitante')
		end if	
	else
		messagebox('Aviso','Falta Ingresar Solicitante')
	end if
end if	
end event

type cb_limpiar from commandbutton within w_solicitud_no_retiro
integer x = 1184
integer y = 2288
integer width = 293
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;Long		ll_parque

dw_lista.reset()
dw_lista.insertrow(0)
dw_parque.reset()
dw_parque.insertrow(0)
dw_lista_solicitudes.reset()
dw_lista_solicitudes.insertrow(0)

dw_buscar.reset()
dw_buscar.getchild('sepultura',idw_detalle5)
idw_detalle5.settransobject(sqlca)
idw_detalle5.insertrow(0)

if gs_conexion	= "Parque El Prado" then
	ll_parque			= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque			= 11
end if
dw_buscar.getchild('sector',idw_detalle6)
idw_detalle6.settransobject(sqlca)
if idw_detalle6.retrieve(ll_parque)=0 then
	idw_detalle6.insertrow(0)
end if
dw_buscar.insertrow(0)
dw_buscar.accepttext()
cb_guardar.enabled		= false
em_solicitante.text			= ''
em_glosa.text				= ''
end event

type st_1 from statictext within w_solicitud_no_retiro
integer x = 55
integer y = 1704
integer width = 329
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Solicitante:"
boolean focusrectangle = false
end type

type em_solicitante from editmask within w_solicitud_no_retiro
integer x = 416
integer y = 1688
integer width = 2194
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
string minmax = "1~~100"
end type

type rb_cumple from radiobutton within w_solicitud_no_retiro
integer x = 1125
integer y = 2088
integer width = 407
integer height = 80
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Cumpleaños"
end type

type rb_sepul from radiobutton within w_solicitud_no_retiro
integer x = 1888
integer y = 2088
integer width = 727
integer height = 80
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Aniversario Sepultación"
end type

type rb_falle from radiobutton within w_solicitud_no_retiro
integer x = 69
integer y = 2088
integer width = 768
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Aniversario Fallecimiento"
boolean checked = true
end type

type cb_cerrar from commandbutton within w_solicitud_no_retiro
integer x = 2336
integer y = 2288
integer width = 293
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_solicitud_no_retiro)
end event

type dw_lista from datawindow within w_solicitud_no_retiro
integer x = 37
integer y = 192
integer width = 2587
integer height = 828
string title = "none"
string dataobject = "dw_lista_fallecidos_sepultura"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type pb_aceptar from picturebutton within w_solicitud_no_retiro
integer x = 2446
integer y = 20
integer width = 169
integer height = 148
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;string ls_sector,ls_sepultura
long	ll_cod_parque

dw_lista.reset()
dw_lista_solicitudes.reset()
//dw_lista.insertrow(0)
ls_sector		= dw_buscar.getitemstring(1,'sector')
ls_sepultura	= dw_buscar.getitemstring(1,'sepultura')
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if not isnull(ls_sector) and not isnull(ls_sepultura) and ll_cod_parque>0 then
	if dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)=0 then
		dw_lista.insertrow(0)
		dw_lista_solicitudes.insertrow(0)
		messagebox("Advertencia","No Registra Dato")
	else
		dw_lista_solicitudes.retrieve(ll_cod_parque,ls_sector,ls_sepultura)
		cb_guardar.enabled	= true
	end if	
end if
end event

type st_16 from statictext within w_solicitud_no_retiro
integer x = 23
integer y = 64
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_solicitud_no_retiro
integer x = 256
integer y = 56
integer width = 594
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque
dw_parque.accepttext()
dw_lista.reset()
//dw_lista.insertrow(0)
ll_cod_parque	= this.getitemnumber(1,'cod_parque')
idw_detalle6.retrieve(ll_cod_parque)
dw_lista.settransobject(sqlca)
//dw_lista.insertrow(0)
dw_buscar.accepttext()


end event

type dw_buscar from datawindow within w_solicitud_no_retiro
integer x = 864
integer y = 52
integer width = 1563
integer height = 108
integer taborder = 20
string title = "none"
string dataobject = "dwe_seleccionar_sector_sepultura"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_sector
Long	ll_cod_parque

this.accepttext()
dw_lista.reset()
dw_lista.insertrow(0)
ls_columna	= dwo.name

dw_buscar.accepttext()
if ls_columna='cod_parque' then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	idw_detalle6.retrieve(ll_cod_parque)
elseif ls_columna='sector' then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	ls_sector		= dw_buscar.getitemstring(1,'sector')
	idw_detalle5.retrieve(ll_cod_parque,ls_sector)
end if
end event

event losefocus;string	ls_sector
long ll_cod_parque

ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
ls_sector		= dw_buscar.getitemstring(1,'sector')
if not isnull(ll_cod_parque) and not isnull(ls_sector) then
	pb_aceptar.triggerEvent(Clicked!)
end if	
end event

type gb_1 from groupbox within w_solicitud_no_retiro
integer x = 32
integer y = 1592
integer width = 2601
integer height = 648
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Nombre y Motivo Solicitud"
end type

type dw_lista_solicitudes from datawindow within w_solicitud_no_retiro
integer x = 32
integer y = 1036
integer width = 2587
integer height = 516
string title = "none"
string dataobject = "dw_lista_solicitudes_no_retiro"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long	ll_nro_solicitud,ll_indi
ll_indi					= getrow()
ll_nro_solicitud		= dw_lista_solicitudes.getitemnumber(ll_indi,'correlativo')
if not isnull(ll_nro_solicitud) or ll_nro_solicitud > 0 then
	openwithparm(w_datos_solicitud_no_retiro,string(ll_nro_solicitud))
end if	
end event

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

