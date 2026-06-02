forward
global type w_cambiar_datos_documento from window
end type
type cb_limpiar from commandbutton within w_cambiar_datos_documento
end type
type pb_ok from picturebutton within w_cambiar_datos_documento
end type
type em_actual from editmask within w_cambiar_datos_documento
end type
type ddlb_tipo_cob from dropdownlistbox within w_cambiar_datos_documento
end type
type st_1 from statictext within w_cambiar_datos_documento
end type
type cb_grabar from commandbutton within w_cambiar_datos_documento
end type
type cb_cerrar from commandbutton within w_cambiar_datos_documento
end type
type dw_lista from datawindow within w_cambiar_datos_documento
end type
end forward

global type w_cambiar_datos_documento from window
integer width = 3470
integer height = 1908
boolean titlebar = true
string title = "Cambiar Datos a Documento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_limpiar cb_limpiar
pb_ok pb_ok
em_actual em_actual
ddlb_tipo_cob ddlb_tipo_cob
st_1 st_1
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_cambiar_datos_documento w_cambiar_datos_documento

on w_cambiar_datos_documento.create
this.cb_limpiar=create cb_limpiar
this.pb_ok=create pb_ok
this.em_actual=create em_actual
this.ddlb_tipo_cob=create ddlb_tipo_cob
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_limpiar,&
this.pb_ok,&
this.em_actual,&
this.ddlb_tipo_cob,&
this.st_1,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_cambiar_datos_documento.destroy
destroy(this.cb_limpiar)
destroy(this.pb_ok)
destroy(this.em_actual)
destroy(this.ddlb_tipo_cob)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String	ls_tipo_cob
gf_centrar(w_cambiar_datos_documento)
dw_lista.settransobject(sqlca)
ddlb_tipo_cob.reset()
DECLARE	x1 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) then
			ddlb_tipo_cob.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
end if
close x1;
end event

type cb_limpiar from commandbutton within w_cambiar_datos_documento
integer x = 1568
integer y = 1688
integer width = 320
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_tipo_cob

dw_lista.reset()
ddlb_tipo_cob.reset()
em_actual.text	= ''
DECLARE	x1 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) then
			ddlb_tipo_cob.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
end if
close x1;
ddlb_tipo_cob.setfocus()
end event

type pb_ok from picturebutton within w_cambiar_datos_documento
integer x = 1193
integer y = 28
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;String	ls_tipo_cob
Long		ll_folio
dw_lista.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	if dw_lista.retrieve(ls_tipo_cob,ll_folio)=0 then
		messagebox("Advertencia","No Registra dato")
	end if
end if
end event

type em_actual from editmask within w_cambiar_datos_documento
integer x = 727
integer y = 56
integer width = 416
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

event modified;String	ls_tipo_cob
Long		ll_folio
dw_lista.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then pb_ok.triggerevent(clicked!)

end event

type ddlb_tipo_cob from dropdownlistbox within w_cambiar_datos_documento
integer x = 411
integer y = 56
integer width = 293
integer height = 376
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_tipo_cob
Long		ll_folio
dw_lista.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then pb_ok.triggerevent(clicked!)

end event

type st_1 from statictext within w_cambiar_datos_documento
integer x = 27
integer y = 68
integer width = 366
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comprobante"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_cambiar_datos_documento
integer x = 46
integer y = 1688
integer width = 320
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_tipo_cob,ls_cod_pago,ls_rezago,ls_cod_caja,ls_cod_autorizacion_credito,&
			ls_cod_autorizacion_debito,ls_traspaso_pago,ls_tarjeta_empresa,ls_tipo_cob_aux
Long		ll_tot_reg,ll_indi,ll_folio,ll_n_cheque,ll_cod_banco,ll_monto,ll_num_cheques,&
			ll_cod_tarjeta_credito,ll_nro_cuotas_credito,ll_tipo_tarjeta_credito,ll_cod_tarjeta_debito,&
			ll_cod_banco_debito,ll_tipo_pago_tarjeta_credito,ll_hora_pago,ll_minuto_pago,&
			ll_filas_graba
Datetime	ldt_fecha_venc,ldt_fecha_pago

ls_tipo_cob	= trim(ddlb_tipo_cob.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	if dw_lista.rowcount()>0 then
		if dw_lista.update()=1 then
			commit;
			DELETE FROM "DOC_COB"  
			WHERE	( "DOC_COB"."TIPO_COB" = :ls_tipo_cob ) AND  
					( "DOC_COB"."FOLIO" = :ll_folio )   
			USING		sqlca;
			if sqlca.sqlcode=0 or sqlca.sqlcode=100 then
				commit;
				ll_tot_reg								= dw_lista.rowcount()
				ll_filas_graba							= 0
				for ll_indi=1 to ll_tot_reg
					ll_folio								= dw_lista.getitemnumber(ll_indi,'folio')
					ls_tipo_cob							= dw_lista.getitemstring(ll_indi,'tipo_cob')
					ll_n_cheque							= dw_lista.getitemnumber(ll_indi,'n_cheque')
					ll_cod_banco						= dw_lista.getitemnumber(ll_indi,'cod_banco')
					ll_monto								= dw_lista.getitemnumber(ll_indi,'monto')
					ldt_fecha_venc						= dw_lista.getitemdatetime(ll_indi,'fecha_venc')
					ls_cod_pago							= dw_lista.getitemstring(ll_indi,'cod_pago')
					ll_num_cheques						= dw_lista.getitemnumber(ll_indi,'num_cheques')
					ls_rezago							= dw_lista.getitemstring(ll_indi,'rezago')
					ldt_fecha_pago						= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
					ls_cod_caja							= dw_lista.getitemstring(ll_indi,'cod_caja')
					ll_cod_tarjeta_credito			= dw_lista.getitemnumber(ll_indi,'cod_tarjeta_credito')
					ll_nro_cuotas_credito			= dw_lista.getitemnumber(ll_indi,'nro_cuotas_credito')
					ls_cod_autorizacion_credito	= dw_lista.getitemstring(ll_indi,'cod_autorizacion_credito')
					ll_tipo_tarjeta_credito			= dw_lista.getitemnumber(ll_indi,'tipo_tarjeta_credito')
					ll_cod_tarjeta_debito			= dw_lista.getitemnumber(ll_indi,'cod_tarjeta_debito')
					ls_cod_autorizacion_debito		= dw_lista.getitemstring(ll_indi,'cod_autorizacion_debito')
					ll_cod_banco_debito				= dw_lista.getitemnumber(ll_indi,'cod_banco_debito')
					ls_traspaso_pago					= dw_lista.getitemstring(ll_indi,'traspado_pago')
					ll_tipo_pago_tarjeta_credito	= dw_lista.getitemnumber(ll_indi,'tipo_pago_tarjeta_credito')
					ll_hora_pago						= dw_lista.getitemnumber(ll_indi,'hora_pago')
					ll_minuto_pago						= dw_lista.getitemnumber(ll_indi,'minuto_pago')
					ls_tarjeta_empresa				= dw_lista.getitemstring(ll_indi,'tarjeta_empresa')
					ls_tipo_cob_aux					= dw_lista.getitemstring(ll_indi,'tipo_cob_aux')
					INSERT INTO "DOC_COB"  
								( "FOLIO",		"TIPO_COB",		"N_CHEQUE",		"COD_BANCO",	"MONTO",		"FECHA_VENC",		"COD_PAGO",		"NUM_CHEQUES",		"REZAGO",	"FECHA_PAGO",		"COD_CAJA",		"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",		"COD_BANCO_DEBITO",		"TRASPASO_PAGO",		"TIPO_PAGO_TARJETA_CREDITO",		"HORA_PAGO",	"MINUTO_PAGO",		"TARJETA_EMPRESA",	"TIPO_COB_AUX" )
					VALUES 	( :ll_folio,	:ls_tipo_cob,	:ll_n_cheque,	:ll_cod_banco,	:ll_monto,	:ldt_fecha_venc,	:ls_cod_pago,	:ll_num_cheques,	:ls_rezago,	:ldt_fecha_pago,	:ls_cod_caja,	:ll_cod_tarjeta_credito,	:ll_nro_cuotas_credito,	:ls_cod_autorizacion_credito,	:ll_tipo_tarjeta_credito,	:ll_cod_tarjeta_debito,	:ls_cod_autorizacion_debito,	:ll_cod_banco_debito,	:ls_traspaso_pago,	:ll_tipo_pago_tarjeta_credito,	:ll_hora_pago,	:ll_minuto_pago,	:ls_tarjeta_empresa,	:ls_tipo_cob_aux)  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_filas_graba ++
					end if
				next
				if ll_filas_graba=ll_tot_reg then
					commit using sqlca;
					messagebox("Grabar","Grabación Exitosa")
					cb_limpiar.triggerevent(clicked!)
				else
					rollback using sqlca;
					messagebox("Error Grabar","Error al Insertar en Tabla Doc_Cob SQL:  "+sqlca.sqlerrtext)
				end if
			else
				rollback;
				messagebox("Error Eliminar Doc_Cob","Error al Eliminar Registros en Tabla Doc_Cob SQL:  "+sqlca.sqlerrtext)
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Documentos SQL:  "+sqlca.sqlerrtext)
		end if
	else
		messagebox("Advertencia","Comprobante Nº "+ls_tipo_cob+'-'+string(ll_folio,"###,###,###,###,###,###")+' NO tiene Pago Asociado')
		ddlb_tipo_cob.setfocus()
	end if
else
	messagebox("Advertencia","Debe Ingresar Comprobante")
	ddlb_tipo_cob.setfocus()
end if
end event

type cb_cerrar from commandbutton within w_cambiar_datos_documento
integer x = 3072
integer y = 1688
integer width = 338
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cambiar_datos_documento)
end event

type dw_lista from datawindow within w_cambiar_datos_documento
integer x = 46
integer y = 208
integer width = 3365
integer height = 1444
integer taborder = 40
string dataobject = "dw_cambiar_datos_documento"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

