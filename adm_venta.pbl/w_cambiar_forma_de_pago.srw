forward
global type w_cambiar_forma_de_pago from window
end type
type cb_imprimir from commandbutton within w_cambiar_forma_de_pago
end type
type st_eliminar from statictext within w_cambiar_forma_de_pago
end type
type st_14 from statictext within w_cambiar_forma_de_pago
end type
type st_13 from statictext within w_cambiar_forma_de_pago
end type
type st_11 from statictext within w_cambiar_forma_de_pago
end type
type st_10 from statictext within w_cambiar_forma_de_pago
end type
type st_9 from statictext within w_cambiar_forma_de_pago
end type
type st_8 from statictext within w_cambiar_forma_de_pago
end type
type st_7 from statictext within w_cambiar_forma_de_pago
end type
type st_6 from statictext within w_cambiar_forma_de_pago
end type
type st_5 from statictext within w_cambiar_forma_de_pago
end type
type cb_limpiar from commandbutton within w_cambiar_forma_de_pago
end type
type ddlb_destino from dropdownlistbox within w_cambiar_forma_de_pago
end type
type ddlb_original from dropdownlistbox within w_cambiar_forma_de_pago
end type
type st_4 from statictext within w_cambiar_forma_de_pago
end type
type st_3 from statictext within w_cambiar_forma_de_pago
end type
type st_2 from statictext within w_cambiar_forma_de_pago
end type
type pb_ok from picturebutton within w_cambiar_forma_de_pago
end type
type cb_actualizar from commandbutton within w_cambiar_forma_de_pago
end type
type st_1 from statictext within w_cambiar_forma_de_pago
end type
type em_actual from editmask within w_cambiar_forma_de_pago
end type
type ddlb_tipo_cob_actual from dropdownlistbox within w_cambiar_forma_de_pago
end type
type cb_grabar from commandbutton within w_cambiar_forma_de_pago
end type
type cb_cerrar from commandbutton within w_cambiar_forma_de_pago
end type
type dw_lista from datawindow within w_cambiar_forma_de_pago
end type
type gb_2 from groupbox within w_cambiar_forma_de_pago
end type
type gb_1 from groupbox within w_cambiar_forma_de_pago
end type
end forward

global type w_cambiar_forma_de_pago from window
integer width = 3063
integer height = 1900
boolean titlebar = true
string title = "Cambiar Forma de Pago"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_imprimir cb_imprimir
st_eliminar st_eliminar
st_14 st_14
st_13 st_13
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
cb_limpiar cb_limpiar
ddlb_destino ddlb_destino
ddlb_original ddlb_original
st_4 st_4
st_3 st_3
st_2 st_2
pb_ok pb_ok
cb_actualizar cb_actualizar
st_1 st_1
em_actual em_actual
ddlb_tipo_cob_actual ddlb_tipo_cob_actual
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_2 gb_2
gb_1 gb_1
end type
global w_cambiar_forma_de_pago w_cambiar_forma_de_pago

event open;String	ls_tipo_cob,ls_cod,ls_descrip,ls_texto

gf_centrar(w_cambiar_forma_de_pago)
dw_lista.settransobject(sqlca)
cb_limpiar.triggerevent(clicked!)
end event

on w_cambiar_forma_de_pago.create
this.cb_imprimir=create cb_imprimir
this.st_eliminar=create st_eliminar
this.st_14=create st_14
this.st_13=create st_13
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.cb_limpiar=create cb_limpiar
this.ddlb_destino=create ddlb_destino
this.ddlb_original=create ddlb_original
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.pb_ok=create pb_ok
this.cb_actualizar=create cb_actualizar
this.st_1=create st_1
this.em_actual=create em_actual
this.ddlb_tipo_cob_actual=create ddlb_tipo_cob_actual
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.st_eliminar,&
this.st_14,&
this.st_13,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.cb_limpiar,&
this.ddlb_destino,&
this.ddlb_original,&
this.st_4,&
this.st_3,&
this.st_2,&
this.pb_ok,&
this.cb_actualizar,&
this.st_1,&
this.em_actual,&
this.ddlb_tipo_cob_actual,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_2,&
this.gb_1}
end on

on w_cambiar_forma_de_pago.destroy
destroy(this.cb_imprimir)
destroy(this.st_eliminar)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cb_limpiar)
destroy(this.ddlb_destino)
destroy(this.ddlb_original)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_ok)
destroy(this.cb_actualizar)
destroy(this.st_1)
destroy(this.em_actual)
destroy(this.ddlb_tipo_cob_actual)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type cb_imprimir from commandbutton within w_cambiar_forma_de_pago
integer x = 887
integer y = 1668
integer width = 375
integer height = 104
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then 
	dw_lista.Object.DataWindow.Zoom = 48
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,w_cambiar_forma_de_pago)
	dw_lista.Object.DataWindow.Zoom = 100
end if
end event

type st_eliminar from statictext within w_cambiar_forma_de_pago
integer x = 2176
integer y = 1488
integer width = 613
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 80269524
string text = "Eliminar Registro"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if dw_lista.getrow()>0 and dw_lista.rowcount()>0 and dw_lista.enabled=true then 
	dw_lista.deleterow(dw_lista.getrow())
	dw_lista.accepttext() 
end if
end event

type st_14 from statictext within w_cambiar_forma_de_pago
integer x = 1531
integer y = 1480
integer width = 128
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16810239
long backcolor = 16810239
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_13 from statictext within w_cambiar_forma_de_pago
integer x = 1682
integer y = 1492
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tarjeta Débito"
boolean focusrectangle = false
end type

type st_11 from statictext within w_cambiar_forma_de_pago
integer x = 1147
integer y = 1492
integer width = 329
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tarjeta Débito"
boolean focusrectangle = false
end type

type st_10 from statictext within w_cambiar_forma_de_pago
integer x = 997
integer y = 1480
integer width = 128
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16711680
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_9 from statictext within w_cambiar_forma_de_pago
integer x = 750
integer y = 1492
integer width = 210
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Cheque"
boolean focusrectangle = false
end type

type st_8 from statictext within w_cambiar_forma_de_pago
integer x = 599
integer y = 1480
integer width = 128
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 255
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_cambiar_forma_de_pago
integer x = 347
integer y = 1492
integer width = 210
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Efectivo"
boolean focusrectangle = false
end type

type st_6 from statictext within w_cambiar_forma_de_pago
integer x = 197
integer y = 1480
integer width = 128
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 28573695
long backcolor = 28573695
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_cambiar_forma_de_pago
integer x = 1166
integer y = 100
integer width = 229
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Folio"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_cambiar_forma_de_pago
integer x = 1728
integer y = 1668
integer width = 375
integer height = 104
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;String	ls_tipo_cob,ls_cod,ls_descrip,ls_texto,ls_filtro
cb_grabar.enabled		= false
ls_filtro				= ''
em_actual.text			= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
dw_lista.reset()
ddlb_original.reset()
ddlb_destino.reset()
ddlb_tipo_cob_actual.reset()
DECLARE	x1 CURSOR FOR  
SELECT 	"COD_PAGO"."TIPO_COB"  
FROM 		"COD_PAGO"  
ORDER BY "COD_PAGO"."TIPO_COB"  
USING		sqlca;
open x1;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_tipo_cob;
		if not isnull(ls_tipo_cob) then
			ddlb_tipo_cob_actual.additem(ls_tipo_cob)
		end if
		setnull(ls_tipo_cob)
	LOOP
end if
close x1;
DECLARE	x2 CURSOR FOR  
SELECT 	"FORMA_PAGO"."CODIGO",   
			"FORMA_PAGO"."DESCRIPCION"  
FROM 		"FORMA_PAGO"  
ORDER BY "FORMA_PAGO"."CODIGO" ASC  
USING		sqlca;
open x2;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ls_cod, :ls_descrip;
		if not isnull(ls_cod) then
			ls_texto	= ls_cod +'-'+ls_descrip
			ddlb_original.additem(ls_texto)
		end if
		setnull(ls_cod)
	LOOP
end if
close x2;
ddlb_original.enabled	= false
ddlb_destino.enabled		= false
dw_lista.enabled			= false
cb_actualizar.enabled	= false
cb_grabar.enabled			= false
ddlb_tipo_cob_actual.setfocus()
end event

type ddlb_destino from dropdownlistbox within w_cambiar_forma_de_pago
integer x = 2162
integer y = 308
integer width = 773
integer height = 376
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_tipo_cob_actual,ls_forma_pago_ori,ls_forma_pago_des
Long		ll_folio
ls_tipo_cob_actual	= trim(ddlb_tipo_cob_actual.text)
ll_folio					= long(em_actual.text)
ls_forma_pago_ori		= trim(ddlb_original.text)
ls_forma_pago_des		= trim(ddlb_destino.text)
if isnull(ls_tipo_cob_actual) or ls_tipo_cob_actual='' or ls_tipo_cob_actual='none' or &
	ll_folio=0 or isnull(ll_folio) or isnull(ls_forma_pago_ori) or ls_forma_pago_ori='' or ls_forma_pago_ori='none' or &
	isnull(ls_forma_pago_des) or ls_forma_pago_des='' or ls_forma_pago_des='none' then
	dw_lista.enabled	= false
else
	dw_lista.enabled	= true
end if
end event

type ddlb_original from dropdownlistbox within w_cambiar_forma_de_pago
integer x = 745
integer y = 308
integer width = 681
integer height = 376
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_cod,ls_texto,ls_descrip,ls_cod_ori,ls_filtro,ls_tipo_cob_actual,&
			ls_forma_pago_ori,ls_forma_pago_des
Long		ll_pos,ll_cont,ll_tot_reg,ll_folio
ls_filtro			= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
ll_tot_reg			= dw_lista.rowcount()
if ll_tot_reg>0 then
	ls_texto			= trim(this.text)
	ll_pos			= Pos(ls_texto, "-")
	ls_cod_ori		= mid(ls_texto,1,(ll_pos - 1))
	ddlb_destino.reset()
	ll_cont			= dw_lista.Find('cod_pago = "'+ls_cod_ori+'"', 1, ll_tot_reg)
	if ll_cont>0 then
		ls_filtro	= 'cod_pago="'+ls_cod_ori+'"'
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		DECLARE	x2 CURSOR FOR  
		SELECT 	"FORMA_PAGO"."CODIGO",   
					"FORMA_PAGO"."DESCRIPCION"  
		FROM 		"FORMA_PAGO"  
		ORDER BY "FORMA_PAGO"."CODIGO" ASC  
		USING		sqlca;
		open x2;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				fetch x2 into :ls_cod, :ls_descrip;
				if not isnull(ls_cod) and ls_cod_ori<>ls_cod then
					ls_texto	= ls_cod +'-'+ls_descrip
					ddlb_destino.additem(ls_texto)
				end if
				setnull(ls_cod)
			LOOP
		end if
		close x2;
		ls_tipo_cob_actual	= trim(ddlb_tipo_cob_actual.text)
		ll_folio					= long(em_actual.text)
		ls_forma_pago_ori		= trim(ddlb_original.text)
		ls_forma_pago_des		= trim(ddlb_destino.text)
		if isnull(ls_tipo_cob_actual) or ls_tipo_cob_actual='' or ls_tipo_cob_actual='none' or &
			ll_folio=0 or isnull(ll_folio) or isnull(ls_forma_pago_ori) or ls_forma_pago_ori='' or ls_forma_pago_ori='none' or &
			isnull(ls_forma_pago_des) or ls_forma_pago_des='' or ls_forma_pago_des='none' then
			dw_lista.enabled	= false
		else
			dw_lista.enabled	= true
		end if
	else
		messagebox("Advertencia","No Registra Forma de Pago "+ls_cod_ori+" en el detalle de Pagos")
		ddlb_destino.reset()
	end if
end if
end event

type st_4 from statictext within w_cambiar_forma_de_pago
integer x = 1477
integer y = 320
integer width = 649
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Forma de Pago Destino"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_cambiar_forma_de_pago
integer x = 78
integer y = 320
integer width = 626
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Forma de Pago Original"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_cambiar_forma_de_pago
integer x = 73
integer y = 464
integer width = 553
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tabla Documentos"
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_cambiar_forma_de_pago
integer x = 2121
integer y = 88
integer width = 119
integer height = 104
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
ls_tipo_cob	= trim(ddlb_tipo_cob_actual.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	if dw_lista.retrieve(ll_folio,ls_tipo_cob)=0 then
		messagebox("Advertencia","No Registra dato")
		ddlb_original.enabled	= false
		ddlb_destino.enabled		= false
		dw_lista.enabled			= false
		cb_actualizar.enabled	= false
		cb_grabar.enabled			= false
	else
		ddlb_original.enabled	= true
		ddlb_destino.enabled		= true
		dw_lista.enabled			= true
		cb_actualizar.enabled	= true
		cb_grabar.enabled			= true
		ddlb_original.setfocus()
	end if
	ddlb_destino.reset()
end if
end event

type cb_actualizar from commandbutton within w_cambiar_forma_de_pago
integer x = 2560
integer y = 88
integer width = 375
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;String	ls_texto,ls_cod_ori,ls_cod_des,ls_cod_autorizacion_credito,ls_nulo,ls_cod_autorizacion_debito
Long		ll_pos,ll_tot_reg,ll_indi,ll_nro_cuotas_credito,ll_tipo_tarjeta_credito,ll_cod_tarjeta_credito,&
			ll_tipo_pago_tarjeta_credito,ll_cod_banco,ll_nulo,ll_cod_banco_debito,ll_cod_tarjeta_debito,&
			ll_n_cheque,ll_num_cheques

Setnull(ls_nulo);setnull(ll_nulo)
ll_tot_reg				= dw_lista.rowcount()
if ll_tot_reg>0 then
	ls_texto				= trim(ddlb_original.text)
	if not isnull(ls_texto) then
		ll_pos			= Pos(ls_texto, "-")
		ls_cod_ori		= mid(ls_texto,1,(ll_pos - 1))
		if not isnull(ls_cod_ori) then
			ls_texto		= trim(ddlb_destino.text)
			ll_pos		= Pos(ls_texto, "-")
			ls_cod_des	= mid(ls_texto,1,(ll_pos - 1))
			for ll_indi=1 to ll_tot_reg
				dw_lista.setitem(ll_indi,'cod_pago',ls_cod_des)
				CHOOSE CASE ls_cod_ori
					CASE 'EF'
						CHOOSE CASE ls_cod_des
							CASE 'CH'
							CASE 'TC'
							CASE 'TD'
						END CHOOSE
					CASE 'CH'
						ll_cod_banco	= dw_lista.getitemnumber(ll_indi,'cod_banco')
						ll_n_cheque		= dw_lista.getitemnumber(ll_indi,'n_cheque')
						ll_num_cheques	= dw_lista.getitemnumber(ll_indi,'num_cheques')
						CHOOSE CASE ls_cod_des
							CASE 'EF'
							CASE 'TC'
							CASE 'TD'
								dw_lista.setitem(ll_indi,'cod_banco_debito',ll_cod_banco)
						END CHOOSE
						dw_lista.setitem(ll_indi,'cod_banco',999)
						dw_lista.setitem(ll_indi,'n_cheque',999)
						dw_lista.setitem(ll_indi,'num_cheques',999)
					CASE 'TC'
						ll_nro_cuotas_credito			= dw_lista.getitemnumber(ll_indi,'nro_cuotas_credito')
						ll_tipo_tarjeta_credito			= dw_lista.getitemnumber(ll_indi,'tipo_tarjeta_credito')
						ll_cod_tarjeta_credito			= dw_lista.getitemnumber(ll_indi,'cod_tarjeta_credito')
						ll_tipo_pago_tarjeta_credito	= dw_lista.getitemnumber(ll_indi,'tipo_pago_tarjeta_credito')
						ls_cod_autorizacion_credito	= dw_lista.getitemstring(ll_indi,'cod_autorizacion_credito')
						ll_cod_banco						= dw_lista.getitemnumber(ll_indi,'cod_banco')
						CHOOSE CASE ls_cod_des
							CASE 'EF'
							CASE 'CH'
							CASE 'TD'
								dw_lista.setitem(ll_indi,'cod_banco_debito',ll_cod_banco)
								dw_lista.setitem(ll_indi,'cod_tarjeta_debito',ll_cod_tarjeta_credito)
								dw_lista.setitem(ll_indi,'cod_autorizacion_debito',ls_cod_autorizacion_credito)
						END CHOOSE
						dw_lista.setitem(ll_indi,'nro_cuotas_credito',ll_nulo)
						dw_lista.setitem(ll_indi,'tipo_tarjeta_credito',ll_nulo)
						dw_lista.setitem(ll_indi,'cod_tarjeta_credito',ll_nulo)
						dw_lista.setitem(ll_indi,'tipo_pago_tarjeta_credito',ll_nulo)
						dw_lista.setitem(ll_indi,'cod_autorizacion_credito',ls_nulo)
						dw_lista.setitem(ll_indi,'cod_banco',ll_nulo)
					CASE 'TD'
						ll_cod_banco_debito			= dw_lista.getitemnumber(ll_indi,'cod_banco_debito')
						ll_cod_tarjeta_debito		= dw_lista.getitemnumber(ll_indi,'cod_tarjeta_debito')
						ls_cod_autorizacion_debito	= dw_lista.getitemstring(ll_indi,'cod_autorizacion_debito')
						CHOOSE CASE ls_cod_des
							CASE 'EF'
							CASE 'CH'
							CASE 'TC'
								dw_lista.setitem(ll_indi,'nro_cuotas_credito',ll_indi)
								dw_lista.setitem(ll_indi,'tipo_tarjeta_credito',ll_nulo)
								dw_lista.setitem(ll_indi,'cod_tarjeta_credito',ll_cod_tarjeta_debito)
								dw_lista.setitem(ll_indi,'tipo_pago_tarjeta_credito',ll_nulo)
								dw_lista.setitem(ll_indi,'cod_autorizacion_credito',ls_cod_autorizacion_debito)
								dw_lista.setitem(ll_indi,'cod_banco',ll_cod_banco_debito)
						END CHOOSE
						dw_lista.setitem(ll_indi,'cod_banco_debito',ll_nulo)
						dw_lista.setitem(ll_indi,'cod_tarjeta_debito',ll_nulo)
						dw_lista.setitem(ll_indi,'cod_autorizacion_debito',ls_nulo)
				END CHOOSE
			next
			ddlb_original.enabled	= false
			ddlb_destino.enabled		= false
		else
			messagebox("Advertencia","Debe Seleccionar Forma de Pago Destino")
			ddlb_destino.setfocus()
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Forma de Pago Original")
		ddlb_original.setfocus()
	end if
else
	messagebox("Advertencia","No Registra Movimientos")
end if
end event

type st_1 from statictext within w_cambiar_forma_de_pago
integer x = 151
integer y = 100
integer width = 553
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Comprobante"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_actual from editmask within w_cambiar_forma_de_pago
integer x = 1426
integer y = 96
integer width = 562
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

event modified;String	ls_tipo_cob,ls_tipo_cob_actual,ls_forma_pago_ori,ls_forma_pago_des
Long		ll_folio
dw_lista.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob_actual.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	pb_ok.triggerevent(clicked!)
	ls_tipo_cob_actual	= trim(ddlb_tipo_cob_actual.text)
	ll_folio					= long(em_actual.text)
	ls_forma_pago_ori		= trim(ddlb_original.text)
	ls_forma_pago_des		= trim(ddlb_destino.text)
	if isnull(ls_tipo_cob_actual) or ls_tipo_cob_actual='' or ls_tipo_cob_actual='none' or &
		ll_folio=0 or isnull(ll_folio) or isnull(ls_forma_pago_ori) or ls_forma_pago_ori='' or ls_forma_pago_ori='none' or &
		isnull(ls_forma_pago_des) or ls_forma_pago_des='' or ls_forma_pago_des='none' then
		dw_lista.enabled	= false
	else
		dw_lista.enabled	= true
	end if
end if
end event

type ddlb_tipo_cob_actual from dropdownlistbox within w_cambiar_forma_de_pago
integer x = 745
integer y = 96
integer width = 393
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

event selectionchanged;String	ls_tipo_cob,ls_tipo_cob_actual,ls_forma_pago_ori,ls_forma_pago_des
Long		ll_folio
dw_lista.reset()
ls_tipo_cob	= trim(ddlb_tipo_cob_actual.text)
ll_folio		= long(em_actual.text)
if not isnull(ls_tipo_cob) and ls_tipo_cob<>'' and ll_folio>0 then
	pb_ok.triggerevent(clicked!)
	ls_tipo_cob_actual	= trim(ddlb_tipo_cob_actual.text)
	ll_folio					= long(em_actual.text)
	ls_forma_pago_ori		= trim(ddlb_original.text)
	ls_forma_pago_des		= trim(ddlb_destino.text)
	if isnull(ls_tipo_cob_actual) or ls_tipo_cob_actual='' or ls_tipo_cob_actual='none' or &
		ll_folio=0 or isnull(ll_folio) or isnull(ls_forma_pago_ori) or ls_forma_pago_ori='' or ls_forma_pago_ori='none' or &
		isnull(ls_forma_pago_des) or ls_forma_pago_des='' or ls_forma_pago_des='none' then
		dw_lista.enabled	= false
	else
		dw_lista.enabled	= true
	end if
end if
end event

type cb_grabar from commandbutton within w_cambiar_forma_de_pago
integer x = 46
integer y = 1668
integer width = 375
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_tipo_cob_actual,ls_forma_pago_ori,ls_forma_pago_des,ls_filtro,ls_cod_pago,ls_cod_autorizacion_credito,&
			ls_cod_autorizacion_debito,ls_pasa='S',ls_tipo_cob,&
			ls_cod_caja,ls_rezago,ls_estado_ch,ls_glosa_ch,ls_traspado_pago,ls_tarjeta_empresa,&
			ls_tipo_cob_aux,ls_traspaso_pago,ls_texto,ls_cod_ori
Long		ll_folio,ll_tot_reg,ll_indi,ll_cod_banco,ll_n_cheque,ll_num_cheques,ll_nro_cuotas_credito,&
			ll_tipo_tarjeta_credito,ll_tipo_pago_tarjeta_credito,ll_cod_tarjeta_credito,ll_cod_banco_debito,&
			ll_cod_tarjeta_debito,ll_monto,ll_hora_pago,ll_minuto_pago,ll_pos,ll_suma_td=0
datetime	ldt_fecha_pago,ldt_fecha_venc,ldt_fecha_estado_ch

ls_filtro				= ''
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
ls_tipo_cob_actual	= trim(ddlb_tipo_cob_actual.text)
ll_folio					= long(em_actual.text)
ls_forma_pago_ori		= trim(ddlb_original.text)
ls_forma_pago_des		= trim(ddlb_destino.text)
ll_tot_reg				= dw_lista.rowcount()
if ll_tot_reg>0 then
	if isnull(ls_tipo_cob_actual) then
		messagebox("Advertencia","Falta Seleccionar Tipo Comprobante")
		ddlb_tipo_cob_actual.setfocus()
	elseif ll_folio=0 or isnull(ll_folio) then
		messagebox("Advertencia","Falta Ingresar Folio")
		em_actual.setfocus()
	elseif isnull(ls_forma_pago_ori) then
		messagebox("Advertencia","Falta Seleccionar Forma de Pago Original")
		ddlb_original.setfocus()
	elseif isnull(ls_forma_pago_des) then
		messagebox("Advertencia","Falta Seleccionar Forma de Pago Destino")
		ddlb_destino.setfocus()
	else
		if trim(ddlb_destino.text)='TD-Tarjeta Débito' then
			for ll_indi=1 to ll_tot_reg
				ls_cod_pago	= dw_lista.getitemstring(ll_indi,'cod_pago')
				if ls_cod_pago='TD' then ll_suma_td ++
				if ll_suma_td>1 then
					messagebox("Advertencia","En Caso de Cambiar a Tarjeta Débito debe existir UN Registro en detalle de Pago, no existe pago en cuotas")
					dw_lista.setfocus()
					exit
				end if
			next
		end if
		if ll_suma_td<=1 then
			for ll_indi=1 to ll_tot_reg
				ls_cod_pago	= dw_lista.getitemstring(ll_indi,'cod_pago')
				if ls_forma_pago_ori=ls_cod_pago or ls_forma_pago_des=ls_cod_pago then
					CHOOSE CASE ls_cod_pago
						CASE 'EF'
							ll_cod_banco	= dw_lista.getitemnumber(ll_indi,'cod_banco')
							ll_n_cheque		= dw_lista.getitemnumber(ll_indi,'n_cheque')
							ll_num_cheques	= dw_lista.getitemnumber(ll_indi,'num_cheques')
							if ll_cod_banco<>999 	then dw_lista.setitem(ll_indi,'cod_banco',999)
							if ll_n_cheque<>999 		then dw_lista.setitem(ll_indi,'n_cheque',999)
							if ll_num_cheques<>999 	then dw_lista.setitem(ll_indi,'num_cheques',999)
						CASE 'CH'
							ll_cod_banco	= dw_lista.getitemnumber(ll_indi,'cod_banco')
							ll_n_cheque		= dw_lista.getitemnumber(ll_indi,'n_cheque')
							ll_num_cheques	= dw_lista.getitemnumber(ll_indi,'num_cheques')
							if isnull(ll_cod_banco)	then
								messagebox("Advertencia","Falta Ingresar Código Banco en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('cod_banco')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ll_n_cheque)	then
								messagebox("Advertencia","Falta Ingresar Serie Cheque en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('n_cheque')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ll_num_cheques) then
								messagebox("Advertencia","Falta Ingresar Cantidad de Cheque(s) en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('num_cheques')
								ls_pasa	= 'N'
								exit
							end if
						CASE 'TC'
							ll_nro_cuotas_credito			= dw_lista.getitemnumber(ll_indi,'nro_cuotas_credito')
							ll_tipo_tarjeta_credito			= dw_lista.getitemnumber(ll_indi,'tipo_tarjeta_credito')
							ll_cod_tarjeta_credito			= dw_lista.getitemnumber(ll_indi,'cod_tarjeta_credito')
							ll_tipo_pago_tarjeta_credito	= dw_lista.getitemnumber(ll_indi,'tipo_pago_tarjeta_credito')
							ls_cod_autorizacion_credito	= dw_lista.getitemstring(ll_indi,'cod_autorizacion_credito')
							ll_cod_banco						= dw_lista.getitemnumber(ll_indi,'cod_banco')
							if isnull(ll_nro_cuotas_credito) then
								messagebox("Advertencia","Falta Ingresar Correlativo Cuota Crédito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('nro_cuotas_credito')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ll_tipo_tarjeta_credito) then
								messagebox("Advertencia","Falta Ingresar Tipo Tarjeta de Crédito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('tipo_tarjeta_credito')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ll_cod_tarjeta_credito) then
								messagebox("Advertencia","Falta Ingresar los 4 Ultimos Número Tarjeta de Crédito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('cod_tarjeta_credito')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ll_tipo_pago_tarjeta_credito) then
								messagebox("Advertencia","Falta Ingresar Forma de Pago Tarjeta de Crédito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('tipo_pago_tarjeta_credito')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ls_cod_autorizacion_credito) then
								messagebox("Advertencia","Falta Ingresar Código Autorización Tarjeta de Crédito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('cod_autorizacion_credito')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ll_cod_banco) then
								messagebox("Advertencia","Falta Ingresar Banco de Tarjeta de Crédito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('cod_banco')
								ls_pasa	= 'N'
								exit
							end if
						CASE 'TD'
							ll_cod_banco_debito			= dw_lista.getitemnumber(ll_indi,'cod_banco_debito')
							ll_cod_tarjeta_debito		= dw_lista.getitemnumber(ll_indi,'cod_tarjeta_debito')
							ls_cod_autorizacion_debito	= dw_lista.getitemstring(ll_indi,'cod_autorizacion_debito')
							if isnull(ll_cod_banco_debito) then
								messagebox("Advertencia","Falta Ingresar Banco de Tarjeta Debito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('cod_banco_debito')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ll_cod_tarjeta_debito) then
								messagebox("Advertencia","Falta Ingresar los 4 Ultimos Número Tarjeta Debito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('cod_tarjeta_debito')
								ls_pasa	= 'N'
								exit
							end if
							if isnull(ls_cod_autorizacion_debito) then
								messagebox("Advertencia","Falta Ingresar Código Autorización Tarjeta Debito en Fila Nº "+string(ll_indi,"###,###,##0"))
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('cod_autorizacion_debito')
								ls_pasa	= 'N'
								exit
							end if
					END CHOOSE
				end if
			next
			if ls_pasa = 'S' then
				if dw_lista.update()=1 then
					commit;
					ll_tot_reg	= dw_lista.rowcount()
					if ll_tot_reg>0 then
						ls_texto			= trim(ddlb_original.text)
						ll_pos			= Pos(ls_texto, "-")
						ls_cod_ori		= mid(ls_texto,1,(ll_pos - 1))
						DELETE FROM "DOC_COB"  
						WHERE 	( "DOC_COB"."TIPO_COB" = :ls_tipo_cob_actual ) AND  
									( "DOC_COB"."FOLIO" = :ll_folio )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
							messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
						end if
						for ll_indi=1 to ll_tot_reg
							ll_folio									= dw_lista.getitemnumber(ll_indi,'folio')
							ls_tipo_cob								= dw_lista.getitemstring(ll_indi,'tipo_cob')
							ll_monto									= dw_lista.getitemnumber(ll_indi,'monto')
							ldt_fecha_pago							= dw_lista.getitemdatetime(ll_indi,'fecha_pago')
							ldt_fecha_venc							= dw_lista.getitemdatetime(ll_indi,'fecha_venc')
							ls_cod_pago								= dw_lista.getitemstring(ll_indi,'cod_pago')
							ll_cod_banco							= dw_lista.getitemnumber(ll_indi,'cod_banco')
							ll_n_cheque								= dw_lista.getitemnumber(ll_indi,'n_cheque')
							ll_num_cheques							= dw_lista.getitemnumber(ll_indi,'num_cheques')
							ll_nro_cuotas_credito				= dw_lista.getitemnumber(ll_indi,'nro_cuotas_credito')
							ll_tipo_pago_tarjeta_credito		= dw_lista.getitemnumber(ll_indi,'tipo_pago_tarjeta_credito')
							ll_tipo_tarjeta_credito				= dw_lista.getitemnumber(ll_indi,'tipo_tarjeta_credito')
							ll_cod_tarjeta_credito				= dw_lista.getitemnumber(ll_indi,'cod_tarjeta_credito')
							ls_cod_autorizacion_credito		= dw_lista.getitemstring(ll_indi,'cod_autorizacion_credito')
							ll_cod_banco_debito					= dw_lista.getitemnumber(ll_indi,'cod_banco_debito')
							ll_cod_tarjeta_debito				= dw_lista.getitemnumber(ll_indi,'cod_tarjeta_debito')
							ls_cod_autorizacion_debito			= dw_lista.getitemstring(ll_indi,'cod_autorizacion_debito')
							ls_cod_caja								= dw_lista.getitemstring(ll_indi,'cod_caja')
							ls_rezago								= dw_lista.getitemstring(ll_indi,'rezago')
							ls_estado_ch							= dw_lista.getitemstring(ll_indi,'estado_ch')
							ls_glosa_ch								= dw_lista.getitemstring(ll_indi,'glosa_ch')
							ldt_fecha_estado_ch					= dw_lista.getitemdatetime(ll_indi,'fecha_estado_ch')
							ls_traspado_pago						= dw_lista.getitemstring(ll_indi,'traspado_pago')
							ls_tarjeta_empresa					= dw_lista.getitemstring(ll_indi,'tarjeta_empresa')
							ls_tipo_cob_aux						= dw_lista.getitemstring(ll_indi,'tipo_cob_aux')
							ll_hora_pago							= dw_lista.getitemnumber(ll_indi,'hora_pago')
							ll_minuto_pago							= dw_lista.getitemnumber(ll_indi,'minuto_pago')
							INSERT INTO "DOC_COB"  
										( "FOLIO",		"TIPO_COB",		"N_CHEQUE",		"COD_BANCO",	"MONTO",		"FECHA_VENC",		"COD_PAGO",		"NUM_CHEQUES",		"REZAGO",	"FECHA_PAGO",		"COD_CAJA",		"COD_TARJETA_CREDITO",		"NRO_CUOTAS_CREDITO",	"COD_AUTORIZACION_CREDITO",	"TIPO_TARJETA_CREDITO",		"COD_TARJETA_DEBITO",	"COD_AUTORIZACION_DEBITO",		"COD_BANCO_DEBITO",		"TRASPASO_PAGO",		"TIPO_PAGO_TARJETA_CREDITO",		"HORA_PAGO",	"MINUTO_PAGO",		"TARJETA_EMPRESA",	"TIPO_COB_AUX" )
							VALUES 	( :ll_folio,	:ls_tipo_cob,	:ll_n_cheque,	:ll_cod_banco,	:ll_monto,	:ldt_fecha_venc,	:ls_cod_pago,	:ll_num_cheques,	:ls_rezago,	:ldt_fecha_pago,	:ls_cod_caja,	:ll_cod_tarjeta_credito,	:ll_nro_cuotas_credito,	:ls_cod_autorizacion_credito,	:ll_tipo_tarjeta_credito,	:ll_cod_tarjeta_debito,	:ls_cod_autorizacion_debito,	:ll_cod_banco_debito,	:ls_traspaso_pago,	:ll_tipo_pago_tarjeta_credito,	:ll_hora_pago,	:ll_minuto_pago,	:ls_tarjeta_empresa,	:ls_tipo_cob_aux )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
								messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
							end if
						next
					end if
					messagebox("Grabar","Grabación Exitosa")
					cb_limpiar.triggerevent(clicked!)
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
				end if
			end if
		end if
	end if
else
	messagebox("Advertencia","No Registra dato Tabla Documentos")
end if
end event

type cb_cerrar from commandbutton within w_cambiar_forma_de_pago
integer x = 2624
integer y = 1668
integer width = 375
integer height = 104
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cambiar_forma_de_pago)
end event

type dw_lista from datawindow within w_cambiar_forma_de_pago
integer x = 46
integer y = 536
integer width = 2953
integer height = 1100
integer taborder = 60
string title = "none"
string dataobject = "dw_tabla_documentos_cambiar_forma_pago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_tipo_cob_actual,ls_forma_pago_ori,ls_forma_pago_des
Long		ll_folio,ll_tot_reg
ls_tipo_cob_actual	= trim(ddlb_tipo_cob_actual.text)
ll_folio					= long(em_actual.text)
ls_forma_pago_ori		= trim(ddlb_original.text)
ls_forma_pago_des		= trim(ddlb_destino.text)
if isnull(ls_tipo_cob_actual) or ls_tipo_cob_actual='' or ls_tipo_cob_actual='none' then
	messagebox("Advertencia","Falta Seleccionar Tipo Comprobante")
	dw_lista.accepttext()
	ddlb_tipo_cob_actual.setfocus()
elseif ll_folio=0 or isnull(ll_folio) then
	messagebox("Advertencia","Falta Ingresar Folio")
	dw_lista.accepttext()
	em_actual.setfocus()
elseif isnull(ls_forma_pago_ori) or ls_forma_pago_ori='' or ls_forma_pago_ori='none' then
	messagebox("Advertencia","Falta Seleccionar Forma de Pago Original")
	dw_lista.accepttext()
	ddlb_original.setfocus()
elseif isnull(ls_forma_pago_des) or ls_forma_pago_des='' or ls_forma_pago_des='none' then
	messagebox("Advertencia","Falta Seleccionar Forma de Pago Destino")
	dw_lista.accepttext()
	ddlb_destino.setfocus()
end if
end event

type gb_2 from groupbox within w_cambiar_forma_de_pago
integer x = 46
integer y = 24
integer width = 2953
integer height = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Comprobante"
end type

type gb_1 from groupbox within w_cambiar_forma_de_pago
integer x = 46
integer y = 236
integer width = 2953
integer height = 208
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
end type

