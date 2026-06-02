forward
global type w_repactacion from window
end type
type sle_nro_repac from singlelineedit within w_repactacion
end type
type st_9 from statictext within w_repactacion
end type
type st_2 from statictext within w_repactacion
end type
type st_ult_folio from statictext within w_repactacion
end type
type em_hoy from editmask within w_repactacion
end type
type st_8 from statictext within w_repactacion
end type
type st_7 from statictext within w_repactacion
end type
type sle_numero from singlelineedit within w_repactacion
end type
type ddlb_serie from dropdownlistbox within w_repactacion
end type
type st_6 from statictext within w_repactacion
end type
type st_5 from statictext within w_repactacion
end type
type dw_oferta_v_nuevo from datawindow within w_repactacion
end type
type dw_pago_oferta_nuevo from datawindow within w_repactacion
end type
type st_4 from statictext within w_repactacion
end type
type st_3 from statictext within w_repactacion
end type
type st_cliente from statictext within w_repactacion
end type
type dw_oferta_v_anterior from datawindow within w_repactacion
end type
type dw_pago_oferta_anterior from datawindow within w_repactacion
end type
type st_1 from statictext within w_repactacion
end type
type p_1 from picture within w_repactacion
end type
type cb_cerrar from commandbutton within w_repactacion
end type
type cb_actualizar from commandbutton within w_repactacion
end type
end forward

global type w_repactacion from window
integer x = 110
integer y = 48
integer width = 3305
integer height = 2172
boolean titlebar = true
string title = "Repactación de Oferta"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
sle_nro_repac sle_nro_repac
st_9 st_9
st_2 st_2
st_ult_folio st_ult_folio
em_hoy em_hoy
st_8 st_8
st_7 st_7
sle_numero sle_numero
ddlb_serie ddlb_serie
st_6 st_6
st_5 st_5
dw_oferta_v_nuevo dw_oferta_v_nuevo
dw_pago_oferta_nuevo dw_pago_oferta_nuevo
st_4 st_4
st_3 st_3
st_cliente st_cliente
dw_oferta_v_anterior dw_oferta_v_anterior
dw_pago_oferta_anterior dw_pago_oferta_anterior
st_1 st_1
p_1 p_1
cb_cerrar cb_cerrar
cb_actualizar cb_actualizar
end type
global w_repactacion w_repactacion

forward prototypes
public function boolean f_validar ()
end prototypes

public function boolean f_validar ();
IF dw_pago_oferta_nuevo.GetItemNumber(1, "precio") = 0 THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar precio")
	RETURN FALSE
END IF
IF dw_pago_oferta_nuevo.GetItemNumber(1, "tasa") = 0 THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar interés o tasa")
	RETURN FALSE
END IF
IF (dw_pago_oferta_nuevo.GetItemNumber(1, "capacidad")) = 0 THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar la capacidad")
	RETURN FALSE
END IF
IF dw_pago_oferta_nuevo.GetItemNumber(1, "valor_cuota") = 0 THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar valor de la cuota")
	RETURN FALSE
END IF
IF dw_pago_oferta_nuevo.GetItemNumber(1, "nro_cuotas") = 0 THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar el número de cuotas")
	RETURN FALSE
END IF
//IF dw_pago_oferta_nuevo.GetItemNumber(1, "des_esp") = 0 THEN
//	Beep(1)
//	MessageBox("Error", "Debe ingresar derecho especial")
//	RETURN FALSE
//END IF
//
IF IsNull(dw_pago_oferta_nuevo.GetItemString(1, "moneda")) THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar el tipo de moneda")
	RETURN FALSE
END IF

IF IsNull(dw_pago_oferta_nuevo.GetItemDateTime(1, "fecha_prim")) THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar la fecha del primer vencimiento")
	RETURN FALSE
END IF
IF IsNull(dw_pago_oferta_nuevo.GetItemDateTime(1, "fecha_ult")) THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar la fecha del último vencimiento")
	RETURN FALSE
END IF
IF IsNull(dw_pago_oferta_nuevo.GetItemDateTime(1, "fecha_entre")) THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar la fecha de entrega")
	RETURN FALSE
END IF
IF IsNull(dw_pago_oferta_nuevo.GetItemString(1, "area")) THEN
	Beep(1)
	MessageBox("Error", "Debe ingresar el sector")
	RETURN FALSE
END IF

RETURN TRUE
end function

on w_repactacion.create
this.sle_nro_repac=create sle_nro_repac
this.st_9=create st_9
this.st_2=create st_2
this.st_ult_folio=create st_ult_folio
this.em_hoy=create em_hoy
this.st_8=create st_8
this.st_7=create st_7
this.sle_numero=create sle_numero
this.ddlb_serie=create ddlb_serie
this.st_6=create st_6
this.st_5=create st_5
this.dw_oferta_v_nuevo=create dw_oferta_v_nuevo
this.dw_pago_oferta_nuevo=create dw_pago_oferta_nuevo
this.st_4=create st_4
this.st_3=create st_3
this.st_cliente=create st_cliente
this.dw_oferta_v_anterior=create dw_oferta_v_anterior
this.dw_pago_oferta_anterior=create dw_pago_oferta_anterior
this.st_1=create st_1
this.p_1=create p_1
this.cb_cerrar=create cb_cerrar
this.cb_actualizar=create cb_actualizar
this.Control[]={this.sle_nro_repac,&
this.st_9,&
this.st_2,&
this.st_ult_folio,&
this.em_hoy,&
this.st_8,&
this.st_7,&
this.sle_numero,&
this.ddlb_serie,&
this.st_6,&
this.st_5,&
this.dw_oferta_v_nuevo,&
this.dw_pago_oferta_nuevo,&
this.st_4,&
this.st_3,&
this.st_cliente,&
this.dw_oferta_v_anterior,&
this.dw_pago_oferta_anterior,&
this.st_1,&
this.p_1,&
this.cb_cerrar,&
this.cb_actualizar}
end on

on w_repactacion.destroy
destroy(this.sle_nro_repac)
destroy(this.st_9)
destroy(this.st_2)
destroy(this.st_ult_folio)
destroy(this.em_hoy)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.sle_numero)
destroy(this.ddlb_serie)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.dw_oferta_v_nuevo)
destroy(this.dw_pago_oferta_nuevo)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_cliente)
destroy(this.dw_oferta_v_anterior)
destroy(this.dw_pago_oferta_anterior)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.cb_cerrar)
destroy(this.cb_actualizar)
end on

event open;
gf_centrar(w_repactacion)

dw_oferta_v_anterior.SetTransObject(SQLCA)
dw_oferta_v_nuevo.SetTransObject(SQLCA)
dw_pago_oferta_anterior.SetTransObject(SQLCA)
dw_pago_oferta_nuevo.SetTransObject(SQLCA)

em_hoy.text = String(today(), "dd/mm/yyyy")
end event

type sle_nro_repac from singlelineedit within w_repactacion
integer x = 2034
integer y = 44
integer width = 402
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;date id_fecha, ld_fecha, ld_null
string ls_null
double ld_valor_uf
long ret

IF Double(sle_nro_repac.text) > 0 AND dw_pago_oferta_anterior.RowCount() > 0 THEN
	dw_oferta_v_nuevo.Reset()
	dw_pago_oferta_nuevo.Reset()
	
	dw_oferta_v_nuevo.Retrieve(ddlb_serie.text, long(sle_numero.text), 0)
	ret = dw_pago_oferta_nuevo.Retrieve(ddlb_serie.text, long(sle_numero.text), Long(sle_nro_repac.text), 0)
	
	IF ret = 0 THEN
		cb_actualizar.text = "&Insertar"
		dw_pago_oferta_nuevo.InsertRow(0)
		dw_pago_oferta_nuevo.SetItem(1, "modificado", mid(gs_nombre_usuario,1,4))
		dw_pago_oferta_nuevo.SetItem(1, "fecha_mod", ld_fecha)
	
		dw_pago_oferta_nuevo.SetItem(1, "precio", dw_pago_oferta_anterior.GetItemNumber(1, "precio"))
		dw_pago_oferta_nuevo.SetItem(1, "pie", dw_pago_oferta_anterior.GetItemNumber(1, "pie"))
		dw_pago_oferta_nuevo.SetItem(1, "tasa", dw_pago_oferta_anterior.GetItemNumber(1, "tasa"))
		dw_pago_oferta_nuevo.SetItem(1, "capacidad", dw_pago_oferta_anterior.GetItemNumber(1, "capacidad"))
		dw_pago_oferta_nuevo.SetItem(1, "valor_cuota", dw_pago_oferta_anterior.GetItemNumber(1, "valor_cuota"))
		dw_pago_oferta_nuevo.SetItem(1, "des_esp", dw_pago_oferta_anterior.GetItemNumber(1, "des_esp"))
		dw_pago_oferta_nuevo.SetItem(1, "nro_cuotas", dw_pago_oferta_anterior.GetItemNumber(1, "nro_cuotas"))
		dw_pago_oferta_nuevo.SetItem(1, "moneda", dw_pago_oferta_anterior.GetItemString(1, "moneda"))
		dw_pago_oferta_nuevo.SetItem(1, "fecha_prim", dw_pago_oferta_anterior.GetItemDateTime(1, "fecha_prim"))
		dw_pago_oferta_nuevo.SetItem(1, "fecha_ult", dw_pago_oferta_anterior.GetItemDateTime(1, "fecha_ult"))
		dw_pago_oferta_nuevo.SetItem(1, "fecha_entre", dw_pago_oferta_anterior.GetItemDateTime(1, "fecha_entre"))
		dw_pago_oferta_nuevo.SetItem(1, "fecha_pie", dw_pago_oferta_anterior.GetItemDateTime(1, "fecha_pie"))
		dw_pago_oferta_nuevo.SetItem(1, "area", dw_pago_oferta_anterior.GetItemString(1, "area"))
		
		dw_pago_oferta_nuevo.SetItem(1, "n_reduccion", dw_pago_oferta_anterior.GetItemString(1, "n_reduccion"))
		dw_pago_oferta_nuevo.SetItem(1, "uf_dia", dw_pago_oferta_anterior.GetItemNumber(1, "uf_dia"))
		dw_pago_oferta_nuevo.SetItem(1, "parque", dw_pago_oferta_anterior.GetItemNumber(1, "parque"))
		dw_pago_oferta_nuevo.SetItem(1, "sector", dw_pago_oferta_anterior.GetItemString(1, "Sector"))
		dw_pago_oferta_nuevo.SetItem(1, "sepultura", dw_pago_oferta_anterior.GetItemString(1, "sepultura"))
		dw_pago_oferta_nuevo.SetItem(1, "derecho_lib", dw_pago_oferta_anterior.GetItemNumber(1, "derecho_lib"))
		dw_pago_oferta_nuevo.SetItem(1, "gastos_adm", dw_pago_oferta_anterior.GetItemNumber(1, "gastos_adm"))
		dw_pago_oferta_nuevo.SetItem(1, "factura", dw_pago_oferta_anterior.GetItemNumber(1, "factura"))
		dw_pago_oferta_nuevo.SetItem(1, "fecha_fact", dw_pago_oferta_anterior.GetItemDateTime(1, "fecha_fact"))
		dw_pago_oferta_nuevo.SetItem(1, "total_fact", dw_pago_oferta_anterior.GetItemNumber(1, "total_fact"))
		dw_pago_oferta_nuevo.SetItem(1, "carta_bienv", dw_pago_oferta_anterior.GetItemString(1, "carta_bienv"))
		dw_pago_oferta_nuevo.SetItem(1, "pie_pagado", dw_pago_oferta_anterior.GetItemNumber(1, "pie_pagado"))
	ELSE
		cb_actualizar.text = "&Modificar"
	END IF	
END IF
end event

type st_9 from statictext within w_repactacion
integer x = 1595
integer y = 48
integer width = 425
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Nº Repactación"
boolean focusrectangle = false
end type

type st_2 from statictext within w_repactacion
integer x = 2555
integer y = 176
integer width = 315
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Repac. ant."
alignment alignment = right!
boolean focusrectangle = false
end type

type st_ult_folio from statictext within w_repactacion
integer x = 2885
integer y = 168
integer width = 370
integer height = 88
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_hoy from editmask within w_repactacion
integer x = 2889
integer y = 44
integer width = 370
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
string displaydata = "~b"
end type

type st_8 from statictext within w_repactacion
integer x = 1646
integer y = 280
integer width = 1614
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "REPACTACION"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_repactacion
integer x = 27
integer y = 280
integer width = 1614
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "OFERTA A REPACTAR"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_numero from singlelineedit within w_repactacion
integer x = 731
integer y = 164
integer width = 311
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;long  ret

ret = dw_oferta_v_anterior.Retrieve(ddlb_serie.text, long(sle_numero.text), 1)
IF ret > 0 THEN
	gl_folio = dw_oferta_v_anterior.GetItemNumber(1, "ult_folio")
	st_ult_folio.text = String(gl_folio)
	st_cliente.Text = dw_oferta_v_anterior.GetItemString(1, "c_nombre")
	dw_pago_oferta_anterior.Retrieve(ddlb_serie.text, long(sle_numero.text), gl_folio, 1)
ELSE
	MessageBox("Error", "No se encontró el contrato")
	dw_oferta_v_nuevo.Reset()
	dw_pago_oferta_nuevo.Reset()
	
	dw_oferta_v_anterior.Reset()
	dw_pago_oferta_anterior.Reset()

	st_ult_folio.text = ""
	st_cliente.Text = ""

END IF
end event

type ddlb_serie from dropdownlistbox within w_repactacion
integer x = 549
integer y = 164
integer width = 174
integer height = 392
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"M","I","S","R"}
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_repactacion
integer x = 2487
integer y = 52
integer width = 384
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha de Hoy"
boolean focusrectangle = false
end type

type st_5 from statictext within w_repactacion
integer x = 288
integer y = 172
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Promesa"
boolean focusrectangle = false
end type

type dw_oferta_v_nuevo from datawindow within w_repactacion
integer x = 1641
integer y = 1720
integer width = 1618
integer height = 196
integer taborder = 60
string dataobject = "d_repactar_oferta_v"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pago_oferta_nuevo from datawindow within w_repactacion
integer x = 1641
integer y = 356
integer width = 1618
integer height = 1364
integer taborder = 50
string dataobject = "d_repactar_pago_oferta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_repactacion
integer x = 1065
integer y = 176
integer width = 215
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Cliente"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_repactacion
integer x = 37
integer y = 1948
integer width = 1198
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
boolean enabled = false
string text = "Falta dejas cuotas y total pagado en cero."
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_cliente from statictext within w_repactacion
integer x = 1312
integer y = 168
integer width = 1161
integer height = 88
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_oferta_v_anterior from datawindow within w_repactacion
integer x = 23
integer y = 1720
integer width = 1618
integer height = 196
string dataobject = "d_repactar_oferta_v"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pago_oferta_anterior from datawindow within w_repactacion
integer x = 23
integer y = 356
integer width = 1618
integer height = 1364
string dataobject = "d_repactar_pago_oferta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_repactacion
integer x = 297
integer y = 24
integer width = 960
integer height = 100
integer textsize = -14
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Repactación de Oferta"
boolean focusrectangle = false
end type

type p_1 from picture within w_repactacion
integer x = 32
integer y = 28
integer width = 229
integer height = 224
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_repactacion
integer x = 2830
integer y = 1940
integer width = 421
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
Close(w_repactacion)
end event

type cb_actualizar from commandbutton within w_repactacion
integer x = 2386
integer y = 1940
integer width = 421
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;integer ret1, ret2

IF Double(sle_nro_repac.text) > 0 AND dw_pago_oferta_anterior.RowCount() > 0 AND f_validar() THEN
	IF MessageBox("Repactar Oferta", "Desea repactar la Oferta " + ddlb_serie.text + sle_numero.text +" ?", Question!, YesNo!) = 1 THEN
		dw_oferta_v_nuevo.SetItem(1, "ult_folio", Double(sle_nro_repac.text))
		ret1 = dw_oferta_v_nuevo.Update()
		
		dw_pago_oferta_nuevo.SetItem(1, "serie", ddlb_serie.text)
		dw_pago_oferta_nuevo.SetItem(1, "nro_oferta", Double(sle_numero.text))
		dw_pago_oferta_nuevo.SetItem(1, "folio", Double(sle_nro_repac.text))
		dw_pago_oferta_nuevo.SetItem(1, "fecha", DateTime(DATE(em_hoy.text)))
		
		ret2 = dw_pago_oferta_nuevo.Update()
		
		IF ret1 = 1 AND ret2 = 1 THEN
			Commit;
			Close(w_repactacion)
		ELSE
			Rollback;
		END IF
	END IF
END IF
end event

