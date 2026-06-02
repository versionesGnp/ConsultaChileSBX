forward
global type w_repactar_pagos from window
end type
type st_6 from statictext within w_repactar_pagos
end type
type st_5 from statictext within w_repactar_pagos
end type
type st_tot_pagado from statictext within w_repactar_pagos
end type
type st_ctas_pag from statictext within w_repactar_pagos
end type
type st_4 from statictext within w_repactar_pagos
end type
type cb_actualizar from commandbutton within w_repactar_pagos
end type
type cb_salir from commandbutton within w_repactar_pagos
end type
type dw_listado_pagos from datawindow within w_repactar_pagos
end type
type st_3 from statictext within w_repactar_pagos
end type
type em_fecha from editmask within w_repactar_pagos
end type
type dw_nuevos_valores from datawindow within w_repactar_pagos
end type
type dw_datos_oferta from datawindow within w_repactar_pagos
end type
type sle_numero from singlelineedit within w_repactar_pagos
end type
type sle_serie from singlelineedit within w_repactar_pagos
end type
type st_2 from statictext within w_repactar_pagos
end type
type st_1 from statictext within w_repactar_pagos
end type
type p_1 from picture within w_repactar_pagos
end type
end forward

global type w_repactar_pagos from window
integer x = 832
integer y = 360
integer width = 3282
integer height = 1552
boolean titlebar = true
string title = "Repactar Comprobantes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
st_6 st_6
st_5 st_5
st_tot_pagado st_tot_pagado
st_ctas_pag st_ctas_pag
st_4 st_4
cb_actualizar cb_actualizar
cb_salir cb_salir
dw_listado_pagos dw_listado_pagos
st_3 st_3
em_fecha em_fecha
dw_nuevos_valores dw_nuevos_valores
dw_datos_oferta dw_datos_oferta
sle_numero sle_numero
sle_serie sle_serie
st_2 st_2
st_1 st_1
p_1 p_1
end type
global w_repactar_pagos w_repactar_pagos

on w_repactar_pagos.create
this.st_6=create st_6
this.st_5=create st_5
this.st_tot_pagado=create st_tot_pagado
this.st_ctas_pag=create st_ctas_pag
this.st_4=create st_4
this.cb_actualizar=create cb_actualizar
this.cb_salir=create cb_salir
this.dw_listado_pagos=create dw_listado_pagos
this.st_3=create st_3
this.em_fecha=create em_fecha
this.dw_nuevos_valores=create dw_nuevos_valores
this.dw_datos_oferta=create dw_datos_oferta
this.sle_numero=create sle_numero
this.sle_serie=create sle_serie
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.st_6,&
this.st_5,&
this.st_tot_pagado,&
this.st_ctas_pag,&
this.st_4,&
this.cb_actualizar,&
this.cb_salir,&
this.dw_listado_pagos,&
this.st_3,&
this.em_fecha,&
this.dw_nuevos_valores,&
this.dw_datos_oferta,&
this.sle_numero,&
this.sle_serie,&
this.st_2,&
this.st_1,&
this.p_1}
end on

on w_repactar_pagos.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_tot_pagado)
destroy(this.st_ctas_pag)
destroy(this.st_4)
destroy(this.cb_actualizar)
destroy(this.cb_salir)
destroy(this.dw_listado_pagos)
destroy(this.st_3)
destroy(this.em_fecha)
destroy(this.dw_nuevos_valores)
destroy(this.dw_datos_oferta)
destroy(this.sle_numero)
destroy(this.sle_serie)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
end on

event open;
gf_centrar(w_repactar_pagos)


dw_datos_oferta.SetTransObject(SQLCA)

dw_listado_pagos.SetTransObject(SQLCA)

dw_nuevos_valores.SetTransObject(SQLCA)

em_fecha.text = "00/00/0000"
end event

type st_6 from statictext within w_repactar_pagos
integer x = 1189
integer y = 1324
integer width = 352
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Tot Pagado:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_repactar_pagos
integer x = 553
integer y = 1320
integer width = 306
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Cta Pag S:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_tot_pagado from statictext within w_repactar_pagos
integer x = 1545
integer y = 1316
integer width = 562
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_ctas_pag from statictext within w_repactar_pagos
integer x = 869
integer y = 1312
integer width = 293
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_repactar_pagos
integer x = 864
integer y = 564
integer width = 635
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Selección a Repactar"
boolean focusrectangle = false
end type

type cb_actualizar from commandbutton within w_repactar_pagos
integer x = 2304
integer y = 1320
integer width = 439
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Actualizar"
end type

event clicked;integer ret1, ret2, i

IF MessageBox("Repactar Pagos", "¿Desea repactar estos pagos?", Question!, YesNo!) = 1 THEN
	ret1 = dw_nuevos_valores.Update()
	FOR i=1 to dw_listado_pagos.RowCount()
		dw_listado_pagos.SetItem(i , "pago_hist", "R")
	NEXT
	ret2 = dw_listado_pagos.Update()
	IF ret1 = 1 AND ret2 = 1 THEN
		Commit USING SQLCA;
		Close(w_repactar_pagos)
	ELSE
		Rollback USING SQLCA;
		MessageBox("Error", "Error, no pudo grabar los datos")
	END IF
END IF

end event

type cb_salir from commandbutton within w_repactar_pagos
integer x = 2779
integer y = 1320
integer width = 439
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
Close(w_repactar_pagos)

end event

type dw_listado_pagos from datawindow within w_repactar_pagos
integer x = 859
integer y = 644
integer width = 2373
integer height = 636
integer taborder = 40
string dataobject = "d_rpagos_listado_pagos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_repactar_pagos
integer x = 41
integer y = 1088
integer width = 773
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Desde que fecha Repacta"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fecha from editmask within w_repactar_pagos
integer x = 416
integer y = 1180
integer width = 393
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "~r"
end type

event modified;long ll_tot_cuotas, ll_tot_pagado
Double	ll_contrato
date ld_fecha_pago
string ls_serie

dw_listado_pagos.Retrieve(sle_serie.text, Long(sle_numero.text), Date(em_fecha.text),"O")
ld_fecha_pago = Date(em_fecha.text)
ls_serie = sle_serie.text
ll_contrato = Double(sle_numero.text)
st_ctas_pag.text = "..."
st_tot_pagado.text = "Calculando..."

SELECT SUM("INGRESO"."MONTO") , SUM("INGRESO"."CUOTAS_PAG")
INTO :ll_tot_pagado, :ll_tot_cuotas
FROM "INGRESO" 
WHERE ("INGRESO"."SERIE" = :ls_serie   &
   AND "INGRESO"."CONTRATO" = :ll_contrato  &
	AND "INGRESO"."BASE" = 'O'  &
	AND "INGRESO"."FECHA_PAGO" > :ld_fecha_pago &
	AND ("INGRESO"."TIPO_COB" = 'CI' OR "INGRESO"."TIPO_COB" = 'C0' OR "INGRESO"."TIPO_COB" = 'CU' OR "INGRESO"."TIPO_COB" = 'CC'));

st_tot_pagado.text = String(ll_tot_pagado, "###,###,##0")
st_ctas_pag.text = String(ll_tot_cuotas, "###,###,##0")

end event

type dw_nuevos_valores from datawindow within w_repactar_pagos
integer x = 37
integer y = 476
integer width = 777
integer height = 580
integer taborder = 30
string dataobject = "d_rpagos_nuevos_val"
boolean border = false
boolean livescroll = true
end type

type dw_datos_oferta from datawindow within w_repactar_pagos
integer x = 1509
integer y = 36
integer width = 1719
integer height = 544
string dataobject = "d_rpagos_datos_oferta"
boolean border = false
boolean livescroll = true
end type

type sle_numero from singlelineedit within w_repactar_pagos
integer x = 997
integer y = 304
integer width = 411
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 12
borderstyle borderstyle = stylelowered!
end type

event modified;INTEGER ret

IF sle_numero.text <> "" then
	ret = dw_datos_oferta.Retrieve(sle_serie.text, Long(sle_numero.text))
	IF ret > 0 THEN
		IF dw_datos_oferta.GetItemNumber(1, "oferta_v_ult_folio") <> 0 THEN
			dw_nuevos_valores.Retrieve(sle_serie.text, Long(sle_numero.text))
			dw_listado_pagos.Retrieve(sle_serie.text, Long(sle_numero.text), Date(String(today(),"dd/mm/yyyy")),"O")
			cb_actualizar.Enabled = True
		ELSE
			MessageBox("Repactar Pago", "Esta Oferta no posee repactación !")
			dw_datos_oferta.Reset()
			dw_listado_pagos.Reset()
			cb_actualizar.Enabled = False
		END IF
	END IF
END IF
end event

type sle_serie from singlelineedit within w_repactar_pagos
integer x = 827
integer y = 304
integer width = 155
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_repactar_pagos
integer x = 498
integer y = 312
integer width = 306
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Promesa"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_repactar_pagos
integer x = 466
integer y = 56
integer width = 937
integer height = 116
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 79741120
boolean enabled = false
string text = "Repacta Pagos"
boolean focusrectangle = false
end type

type p_1 from picture within w_repactar_pagos
integer x = 37
integer y = 32
integer width = 389
integer height = 416
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

