forward
global type w_imprimir_documentos_parques from window
end type
type dw_tipo_servicio from datawindow within w_imprimir_documentos_parques
end type
type st_1 from statictext within w_imprimir_documentos_parques
end type
type dw_impirmir from datawindow within w_imprimir_documentos_parques
end type
type st_2 from statictext within w_imprimir_documentos_parques
end type
type em_boleta from editmask within w_imprimir_documentos_parques
end type
type cb_imprimir from commandbutton within w_imprimir_documentos_parques
end type
type cb_limpiar from commandbutton within w_imprimir_documentos_parques
end type
type pb_aceptar from picturebutton within w_imprimir_documentos_parques
end type
type rb_imple from radiobutton within w_imprimir_documentos_parques
end type
type rb_capilla from radiobutton within w_imprimir_documentos_parques
end type
type cb_cerrar from commandbutton within w_imprimir_documentos_parques
end type
type dw_lista from datawindow within w_imprimir_documentos_parques
end type
type gb_1 from groupbox within w_imprimir_documentos_parques
end type
type ddlb_tipo_cob from dropdownlistbox within w_imprimir_documentos_parques
end type
type gb_2 from groupbox within w_imprimir_documentos_parques
end type
end forward

global type w_imprimir_documentos_parques from window
integer width = 2153
integer height = 1256
boolean border = false
long backcolor = 67108864
string icon = "AppIcon!"
dw_tipo_servicio dw_tipo_servicio
st_1 st_1
dw_impirmir dw_impirmir
st_2 st_2
em_boleta em_boleta
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
rb_imple rb_imple
rb_capilla rb_capilla
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
ddlb_tipo_cob ddlb_tipo_cob
gb_2 gb_2
end type
global w_imprimir_documentos_parques w_imprimir_documentos_parques

type variables
long il_rut
string is_dv

end variables

on w_imprimir_documentos_parques.create
this.dw_tipo_servicio=create dw_tipo_servicio
this.st_1=create st_1
this.dw_impirmir=create dw_impirmir
this.st_2=create st_2
this.em_boleta=create em_boleta
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.rb_imple=create rb_imple
this.rb_capilla=create rb_capilla
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.ddlb_tipo_cob=create ddlb_tipo_cob
this.gb_2=create gb_2
this.Control[]={this.dw_tipo_servicio,&
this.st_1,&
this.dw_impirmir,&
this.st_2,&
this.em_boleta,&
this.cb_imprimir,&
this.cb_limpiar,&
this.pb_aceptar,&
this.rb_imple,&
this.rb_capilla,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.ddlb_tipo_cob,&
this.gb_2}
end on

on w_imprimir_documentos_parques.destroy
destroy(this.dw_tipo_servicio)
destroy(this.st_1)
destroy(this.dw_impirmir)
destroy(this.st_2)
destroy(this.em_boleta)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.rb_imple)
destroy(this.rb_capilla)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.ddlb_tipo_cob)
destroy(this.gb_2)
end on

event open;string ls_tipo_cob,ls_descrip,ls_string

gf_centrar(w_imprimir_documentos_parques)

dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
dw_impirmir.settransobject(sqlca)
dw_tipo_servicio.settransobject(sqlca)
dw_tipo_servicio.insertrow(0)
dw_impirmir.dataobject = 'dwe_imprimir_tipo_doc_parque'
w_imprimir_documentos_parques.title = 'Implememtación/Uso Capilla'

ddlb_tipo_cob.reset()
DECLARE x1 CURSOR FOR  
SELECT	"COD_PAGO"."TIPO_COB",   
			"COD_PAGO"."DESCRIPCION"  
FROM 		"COD_PAGO"
ORDER BY "COD_PAGO"."TIPO_COB" ASC  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob, :ls_descrip;
		if not isnull(ls_tipo_cob) then
			ls_string	= trim(ls_tipo_cob)+' - '+trim(ls_descrip)
			ddlb_tipo_cob.AddItem(ls_string)
		end if
		Setnull(ls_string);Setnull(ls_tipo_cob)
	LOOP
end if
close x1;
em_boleta.text			= ''
end event

type dw_tipo_servicio from datawindow within w_imprimir_documentos_parques
integer x = 1376
integer y = 116
integer width = 494
integer height = 100
integer taborder = 30
string dataobject = "dwe_tipo_servicio_comp"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_tipo_servicio
dw_tipo_servicio.accepttext()
dw_lista.reset()
dw_lista.insertrow(0)
end event

type st_1 from statictext within w_imprimir_documentos_parques
integer x = 32
integer y = 128
integer width = 247
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Cobro"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_impirmir from datawindow within w_imprimir_documentos_parques
integer x = 2167
integer y = 408
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dwe_imprimir_tipo_doc_parque"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_imprimir_documentos_parques
integer x = 837
integer y = 124
integer width = 146
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folio"
boolean focusrectangle = false
end type

type em_boleta from editmask within w_imprimir_documentos_parques
integer x = 983
integer y = 112
integer width = 338
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;dw_lista.reset()
dw_lista.insertrow(0)
//em_monto.text = ''
end event

type cb_imprimir from commandbutton within w_imprimir_documentos_parques
integer x = 14
integer y = 1008
integer width = 261
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;string	ls_nombre, ls_ap_pat,ls_ap_mat,ls_fono,ls_celular,ls_sector,ls_sepul,ls_pasa='S',ls_nom_comp,ls_telefonos,ls_nom_fallecido,&
		ls_observacion,ls_uso,ls_tipo_cob,ls_servicio
long  ll_monto,ll_nro_boleta,ll_hora_sepul,ll_parque,ll_corr,ll_pos
date	ld_fecha_sepul

ls_servicio				= dw_tipo_servicio.getitemstring(1,'tipo_servicio')

SELECT 	"COMPROBANTE_SERVICIO_ESTADO"."DESCRIPCION"  
INTO 		:ls_observacion  
FROM 	"COMPROBANTE_SERVICIO_ESTADO"  
WHERE 	"COMPROBANTE_SERVICIO_ESTADO"."COD_SERVICIO" = :ls_servicio
USING	 sqlca;
ls_uso									= ls_servicio
dw_impirmir.object.t_titulo.text 	= ls_observacion

ll_parque					= dw_lista.getitemnumber(1,'ficha_sepultacion_cod_parque')
ls_nombre				= dw_lista.getitemstring(1,'cliente_nombre')
ls_ap_pat				= dw_lista.getitemstring(1,'cliente_a_paterno')
ls_ap_mat				= dw_lista.getitemstring(1,'cliente_a_materno')
il_rut						= dw_lista.getitemnumber(1,'cliente_rut')
is_dv						= dw_lista.getitemstring(1,'cliente_dv')
ls_sector					= dw_lista.getitemstring(1,'ficha_sepultacion_sector')
ls_sepul					= dw_lista.getitemstring(1,'ficha_sepultacion_sepultura')
ls_nom_fallecido		= dw_lista.getitemstring(1,'c_nombre_fallecido')
ls_fono					= dw_lista.getitemstring(1,'cliente_fono_p')
ls_celular				= dw_lista.getitemstring(1,'cliente_celular')
ld_fecha_sepul			= date(dw_lista.getitemdatetime(1,'ficha_sepultacion_fecha_sepultacion'))
ll_hora_sepul			= dw_lista.getitemnumber(1,'ficha_sepultacion_hora')
ll_nro_boleta			= long(em_boleta.text)
ll_monto					= dw_lista.getitemnumber(1,'ingreso_monto')
ll_pos						= Pos(trim(ddlb_tipo_cob.text), "-")
ls_tipo_cob				= trim(mid(ddlb_tipo_cob.text,1,(ll_pos - 1)))


if isnull(ll_nro_boleta) or ll_nro_boleta <= 0 then
	messagebox('Advertencia','Falta Ingresar Boleta')
	em_boleta.setfocus()
	ls_pasa= 'N'
end if	
if isnull(ll_monto) or ll_monto <= 0 then
	messagebox('Advertencia','Falta Ingresar Monto')
	em_boleta.setfocus()
	ls_pasa= 'N'
end if	
if ls_pasa = 'S'then
	dw_impirmir.insertrow(0)
	ls_nom_comp		= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat		
	if not isnull(ls_fono) then 
		ls_telefonos = ls_fono
		if not isnull(ls_celular) then 
			ls_telefonos = ls_telefonos+ ' / '+ls_celular
		end if	
	else
		if not isnull(ls_celular) then 
			ls_telefonos = ls_celular
		else
			ls_telefonos	= ''
		end if
	end if
	dw_impirmir.setitem(1,'c_uso',ls_uso)
	dw_impirmir.setitem(1,'receptor',gs_user)
	dw_impirmir.setitem(1,'fecha',date(gdt_fec_sistema))
	dw_impirmir.setitem(1,'fecha_responso',ld_fecha_sepul)
	dw_impirmir.setitem(1,'hora',(string(ll_hora_sepul)+':00'))
	dw_impirmir.setitem(1,'nombre_titular',ls_nom_comp)
	dw_impirmir.setitem(1,'fallecido',ls_nom_fallecido)
	dw_impirmir.setitem(1,'rut_titular',il_rut)
	dw_impirmir.setitem(1,'dv_titular',is_dv)
	dw_impirmir.setitem(1,'fono',ls_telefonos)
	dw_impirmir.setitem(1,'sector',ls_sector)
	dw_impirmir.setitem(1,'sepultura',ls_sepul)
	dw_impirmir.setitem(1,'observacion',ls_observacion)
	dw_impirmir.setitem(1,'boleta',string(ll_nro_boleta))
	dw_impirmir.setitem(1,'monto',ll_monto)
	if ll_parque=1 then
			dw_impirmir.object.p_1.filename 	= 'logo_e.bmp'
		elseif ll_parque = 11 then
			dw_impirmir.object.p_1.filename  	= 'logo_e_s.bmp'	
		elseif ll_parque=102 then
			dw_impirmir.object.p_1.filename 	= 'logo_manantial.bmp'
		elseif ll_parque=103 then
			dw_impirmir.object.p_1.filename 	= 'logo_parque_stgo.bmp'
		elseif ll_parque=101 then
			dw_impirmir.object.p_1.filename 	= 'logo_canaan.jpg'
		else
			dw_impirmir.object.p_1.filename 	= 'logo_e.bmp'
		end if
	dw_impirmir.accepttext()
	SELECT 	MAX("LOG_COMPROBANTE_SERV_PRINT"."CORRELATIVO")
	INTO 		:ll_corr
	FROM 	"LOG_COMPROBANTE_SERV_PRINT"
	USING sqlca;
	if sqlca.sqlcode = 0 then
		if isnull(ll_corr) then
			ll_corr = 1
		else
			ll_corr = ll_corr+1
		end if
		INSERT INTO "LOG_COMPROBANTE_SERV_PRINT"  
					( "CORRELATIVO", "TIPO_COB", "FOLIO",  "MONTO",  "SERVICIO", "RUT_TITULAR", "DV_TITULAR", "NOMBRE_CLIENTE", "SECTOR", "SEPULTURA", "PARQUE", "NOMBRE_FALLECIDO", "FECHA_SEPULTACION", "HORA_SEPULTACION" )  
		VALUES 	( :ll_corr,    :ls_tipo_cob, :ll_nro_boleta, :ll_monto, :ls_servicio, :il_rut,  :is_dv, :ls_nom_comp, :ls_sector, :ls_sepul, :ll_parque, :ls_nom_fallecido, :ld_fecha_sepul, :ll_hora_sepul )
		USING	sqlca;	
		if sqlca.sqlcode = 0 then
			messagebox('Aviso','Grabación Exitosa')
			f_Print( dw_impirmir )
		else
			messagebox('Error','Error al Grabar')
		end if	
	else
		messagebox('Error','Error Al generar Correlativo')
	end if	
end if	
end event

type cb_limpiar from commandbutton within w_imprimir_documentos_parques
integer x = 914
integer y = 1008
integer width = 261
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_lista.reset()
dw_tipo_servicio.reset()
//dw_lista.insertrow(0)
w_imprimir_documentos_parques.triggerevent(open!)


end event

type pb_aceptar from picturebutton within w_imprimir_documentos_parques
integer x = 1906
integer y = 64
integer width = 174
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string ls_tipo_cob,ls_base,ls_serie,ls_servicio
long	ll_nro_boleta,ll_rut,ll_monto,ll_pos
datetime ldt_fecha_sepul
double ll_numero

Setnull(ll_monto);
ll_nro_boleta		= long(em_boleta.text)
ll_pos					= Pos(trim(ddlb_tipo_cob.text), "-")
ls_tipo_cob			= trim(mid(ddlb_tipo_cob.text,1,(ll_pos - 1)))
ls_servicio			= dw_tipo_servicio.getitemstring(1,'tipo_servicio')

if not isnull(ls_servicio) then
	if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_nro_boleta>0 then
		SELECT 	"INGRESO"."RUT","INGRESO"."MONTO","INGRESO"."BASE","INGRESO"."SERIE","INGRESO"."CONTRATO"    
		INTO 		:ll_rut,:ll_monto,:ls_base,:ls_serie,:ll_numero
		FROM 	"INGRESO"  
		WHERE 	"INGRESO"."TIPO_MOV" = 'L' AND   
					"INGRESO"."TIPO_COB" = :ls_tipo_cob AND  
					"INGRESO"."FOLIO" = :ll_nro_boleta
		USING sqlca;
	end if
	if not isnull(ll_monto) then
		SELECT MAX("FICHA_SEPULTACION"."FECHA_SEPULTACION")
		INTO	:ldt_fecha_sepul
		FROM "FICHA_SEPULTACION"  
		WHERE ( "FICHA_SEPULTACION"."BASE" = :ls_base ) AND  
			( "FICHA_SEPULTACION"."SERIE" = :ls_serie ) AND  
			( "FICHA_SEPULTACION"."NUMERO" = :ll_numero )
		USING sqlca;		
		if not isnull (ll_rut) then
			if dw_lista.retrieve(ll_rut,ldt_fecha_sepul,ls_tipo_cob,ll_nro_boleta) > 0 then
			else
				messagebox('Aviso','Sin Fecha Sepultacion asociada al Contrato ' +ls_base+' '+ls_serie+' '+string(ll_numero))
			end if	
		end if
	else
		messagebox('Aviso','Sin Otros Pagos Asociado a Boleta Nº ' +string(ll_nro_boleta))
		dw_lista.reset()
		dw_lista.insertrow(0)
	end if	
else
	messagebox('Aviso','Falta Ingresar Tipo Servicio')
end if	
end event

type rb_imple from radiobutton within w_imprimir_documentos_parques
integer x = 2647
integer y = 196
integer width = 489
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Implementación"
end type

event clicked;dw_lista.reset()
dw_lista.insertrow(0)
//em_monto.text = ''
end event

type rb_capilla from radiobutton within w_imprimir_documentos_parques
integer x = 2647
integer y = 128
integer width = 366
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Uso Capilla"
boolean checked = true
end type

event clicked;dw_lista.reset()
dw_lista.insertrow(0)
//em_monto.text = ''
end event

type cb_cerrar from commandbutton within w_imprimir_documentos_parques
integer x = 1815
integer y = 1008
integer width = 261
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_imprimir_documentos_parques)
end event

type dw_lista from datawindow within w_imprimir_documentos_parques
integer x = 14
integer y = 264
integer width = 2062
integer height = 728
string title = "none"
string dataobject = "dw_datos_implementacion_capilla"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_imprimir_documentos_parques
integer x = 1362
integer y = 32
integer width = 526
integer height = 224
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo"
end type

type ddlb_tipo_cob from dropdownlistbox within w_imprimir_documentos_parques
integer x = 293
integer y = 116
integer width = 526
integer height = 400
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
dw_lista.insertrow(0)
//dw_destino.reset()
//em_folio.setfocus()
end event

type gb_2 from groupbox within w_imprimir_documentos_parques
integer x = 23
integer y = 32
integer width = 1339
integer height = 224
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingreso Folio"
end type

