forward
global type w_crear_cuponeras from window
end type
type dw_cupones_vigentes from datawindow within w_crear_cuponeras
end type
type st_11 from statictext within w_crear_cuponeras
end type
type ddlb_1 from dropdownlistbox within w_crear_cuponeras
end type
type cb_limpiar from commandbutton within w_crear_cuponeras
end type
type st_0 from statictext within w_crear_cuponeras
end type
type cb_total from commandbutton within w_crear_cuponeras
end type
type st_10 from statictext within w_crear_cuponeras
end type
type cb_ejecuta from commandbutton within w_crear_cuponeras
end type
type cb_elimina from commandbutton within w_crear_cuponeras
end type
type cb_carga from commandbutton within w_crear_cuponeras
end type
type dw_1 from datawindow within w_crear_cuponeras
end type
type st_9 from statictext within w_crear_cuponeras
end type
type sle_base1 from singlelineedit within w_crear_cuponeras
end type
type sle_base2 from singlelineedit within w_crear_cuponeras
end type
type sle_base3 from singlelineedit within w_crear_cuponeras
end type
type sle_base4 from singlelineedit within w_crear_cuponeras
end type
type sle_base5 from singlelineedit within w_crear_cuponeras
end type
type st_estado from statictext within w_crear_cuponeras
end type
type st_8 from statictext within w_crear_cuponeras
end type
type st_7 from statictext within w_crear_cuponeras
end type
type st_6 from statictext within w_crear_cuponeras
end type
type st_5 from statictext within w_crear_cuponeras
end type
type st_4 from statictext within w_crear_cuponeras
end type
type sle_numero5 from singlelineedit within w_crear_cuponeras
end type
type sle_numero4 from singlelineedit within w_crear_cuponeras
end type
type sle_numero3 from singlelineedit within w_crear_cuponeras
end type
type sle_numero2 from singlelineedit within w_crear_cuponeras
end type
type sle_numero1 from singlelineedit within w_crear_cuponeras
end type
type sle_serie5 from singlelineedit within w_crear_cuponeras
end type
type sle_serie4 from singlelineedit within w_crear_cuponeras
end type
type sle_serie3 from singlelineedit within w_crear_cuponeras
end type
type sle_serie2 from singlelineedit within w_crear_cuponeras
end type
type sle_serie1 from singlelineedit within w_crear_cuponeras
end type
type st_3 from statictext within w_crear_cuponeras
end type
type st_2 from statictext within w_crear_cuponeras
end type
type cb_cerrar from commandbutton within w_crear_cuponeras
end type
type cb_crear from commandbutton within w_crear_cuponeras
end type
type st_1 from statictext within w_crear_cuponeras
end type
type gb_1 from groupbox within w_crear_cuponeras
end type
end forward

global type w_crear_cuponeras from window
integer x = 923
integer y = 564
integer width = 2917
integer height = 1488
boolean titlebar = true
string title = " Impresión de Cuponeras"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
dw_cupones_vigentes dw_cupones_vigentes
st_11 st_11
ddlb_1 ddlb_1
cb_limpiar cb_limpiar
st_0 st_0
cb_total cb_total
st_10 st_10
cb_ejecuta cb_ejecuta
cb_elimina cb_elimina
cb_carga cb_carga
dw_1 dw_1
st_9 st_9
sle_base1 sle_base1
sle_base2 sle_base2
sle_base3 sle_base3
sle_base4 sle_base4
sle_base5 sle_base5
st_estado st_estado
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
sle_numero5 sle_numero5
sle_numero4 sle_numero4
sle_numero3 sle_numero3
sle_numero2 sle_numero2
sle_numero1 sle_numero1
sle_serie5 sle_serie5
sle_serie4 sle_serie4
sle_serie3 sle_serie3
sle_serie2 sle_serie2
sle_serie1 sle_serie1
st_3 st_3
st_2 st_2
cb_cerrar cb_cerrar
cb_crear cb_crear
st_1 st_1
gb_1 gb_1
end type
global w_crear_cuponeras w_crear_cuponeras

type variables
long il_registro = 0
end variables

forward prototypes
public subroutine wf_grabar_cupones (string as_base, string as_serie, double al_numero)
end prototypes

public subroutine wf_grabar_cupones (string as_base, string as_serie, double al_numero);//
end subroutine

on w_crear_cuponeras.create
this.dw_cupones_vigentes=create dw_cupones_vigentes
this.st_11=create st_11
this.ddlb_1=create ddlb_1
this.cb_limpiar=create cb_limpiar
this.st_0=create st_0
this.cb_total=create cb_total
this.st_10=create st_10
this.cb_ejecuta=create cb_ejecuta
this.cb_elimina=create cb_elimina
this.cb_carga=create cb_carga
this.dw_1=create dw_1
this.st_9=create st_9
this.sle_base1=create sle_base1
this.sle_base2=create sle_base2
this.sle_base3=create sle_base3
this.sle_base4=create sle_base4
this.sle_base5=create sle_base5
this.st_estado=create st_estado
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.sle_numero5=create sle_numero5
this.sle_numero4=create sle_numero4
this.sle_numero3=create sle_numero3
this.sle_numero2=create sle_numero2
this.sle_numero1=create sle_numero1
this.sle_serie5=create sle_serie5
this.sle_serie4=create sle_serie4
this.sle_serie3=create sle_serie3
this.sle_serie2=create sle_serie2
this.sle_serie1=create sle_serie1
this.st_3=create st_3
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.cb_crear=create cb_crear
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.dw_cupones_vigentes,&
this.st_11,&
this.ddlb_1,&
this.cb_limpiar,&
this.st_0,&
this.cb_total,&
this.st_10,&
this.cb_ejecuta,&
this.cb_elimina,&
this.cb_carga,&
this.dw_1,&
this.st_9,&
this.sle_base1,&
this.sle_base2,&
this.sle_base3,&
this.sle_base4,&
this.sle_base5,&
this.st_estado,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.sle_numero5,&
this.sle_numero4,&
this.sle_numero3,&
this.sle_numero2,&
this.sle_numero1,&
this.sle_serie5,&
this.sle_serie4,&
this.sle_serie3,&
this.sle_serie2,&
this.sle_serie1,&
this.st_3,&
this.st_2,&
this.cb_cerrar,&
this.cb_crear,&
this.st_1,&
this.gb_1}
end on

on w_crear_cuponeras.destroy
destroy(this.dw_cupones_vigentes)
destroy(this.st_11)
destroy(this.ddlb_1)
destroy(this.cb_limpiar)
destroy(this.st_0)
destroy(this.cb_total)
destroy(this.st_10)
destroy(this.cb_ejecuta)
destroy(this.cb_elimina)
destroy(this.cb_carga)
destroy(this.dw_1)
destroy(this.st_9)
destroy(this.sle_base1)
destroy(this.sle_base2)
destroy(this.sle_base3)
destroy(this.sle_base4)
destroy(this.sle_base5)
destroy(this.st_estado)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_numero5)
destroy(this.sle_numero4)
destroy(this.sle_numero3)
destroy(this.sle_numero2)
destroy(this.sle_numero1)
destroy(this.sle_serie5)
destroy(this.sle_serie4)
destroy(this.sle_serie3)
destroy(this.sle_serie2)
destroy(this.sle_serie1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.cb_crear)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;gf_centrar(w_crear_cuponeras)
gs_ventana		= 'w_crear_cuponeras'
f_valida_objeto()
ddlb_1.SelectItem('Cuponera',1)
if ddlb_1.text = 'Cuponera' then
	gs_cuponera_aviso = '0'
else
	gs_cuponera_aviso = '1'
end if

end event

type dw_cupones_vigentes from datawindow within w_crear_cuponeras
integer x = 288
integer y = 1508
integer width = 1312
integer height = 432
integer taborder = 190
string title = "none"
string dataobject = "dw_detalle_cupones_vigentes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_crear_cuponeras
integer x = 41
integer y = 1240
integer width = 2811
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 32896
long backcolor = 67108864
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_crear_cuponeras
integer x = 1344
integer y = 1080
integer width = 1024
integer height = 400
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
boolean sorted = false
string item[] = {"Cuponera","Avisos de Mantención"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if text = 'Cuponera' then
	gs_cuponera_aviso = '0'
	st_11.text = 'La Cuponera debe ser impresa en "Papel Oficio" con prepicado Vertical.'
else
	gs_cuponera_aviso = '1'
	st_11.text = 'El Aviso de Mantención debe ser impreso en "Papel Carta" con prepicado Horizontal'
	if MessageBox("Avisos de Mantención", 'Desea Crear y Exportar Archivo para Avisos de Mantenciones', Exclamation!, OKCancel!, 2) = 1 then
		open(w_archivo_mantencion)
	else
	end if
end if
end event

type cb_limpiar from commandbutton within w_crear_cuponeras
integer x = 457
integer y = 1076
integer width = 334
integer height = 108
integer taborder = 230
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;sle_base1.text		= ''
sle_serie1.text	= ''
sle_numero1.text	= ''

sle_base2.text		= ''
sle_serie2.text	= ''
sle_numero2.text	= ''

sle_base3.text		= ''
sle_serie3.text	= ''
sle_numero3.text	= ''

sle_base4.text		= ''
sle_serie4.text	= ''
sle_numero4.text	= ''

sle_base5.text		= ''
sle_serie5.text	= ''
sle_numero5.text	= ''

dw_1.reset()

sle_base1.setfocus()
end event

type st_0 from statictext within w_crear_cuponeras
integer x = 41
integer y = 228
integer width = 78
integer height = 88
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_total from commandbutton within w_crear_cuponeras
integer x = 2423
integer y = 616
integer width = 370
integer height = 108
integer taborder = 210
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Eje.Total"
end type

event clicked;//long ll_count,ll_proceso,i
//
//ll_count = dw_1.rowcount()
//
//if mod(ll_count,5) > 0 then
//	ll_proceso = round(ll_count/5,0)
//else
//	ll_proceso = round(ll_count/5,0)
//end if
//for i = 1 to ll_proceso 
//	cb_ejecuta.triggerevent (clicked!)
//	cb_crear.triggerevent (clicked!)
//	if isvalid(w_vista_previa) then
//		w_vista_previa.cb_imprimir.triggerevent (clicked!)
//		close(w_vista_previa)
//	end if
//next
end event

type st_10 from statictext within w_crear_cuponeras
integer x = 2423
integer y = 732
integer width = 370
integer height = 108
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_ejecuta from commandbutton within w_crear_cuponeras
integer x = 2423
integer y = 504
integer width = 370
integer height = 108
integer taborder = 200
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Eje.Parcial"
end type

event clicked;long i
if dw_1.rowcount() > 0 then
	if (il_registro + 1) <= dw_1.rowcount() then 
		il_registro ++
		if il_registro <= dw_1.rowcount() then 
			sle_base1.text 	= dw_1.getitemstring(il_registro,'base')
			sle_serie1.text 	= dw_1.getitemstring(il_registro,'serie')
			sle_numero1.text 	= string(dw_1.getitemnumber(il_registro,'numero'))
		else
			sle_base1.text 	= ''
			sle_serie1.text 	= ''
			sle_numero1.text 	= ''
		end if
		il_registro ++
		if il_registro <= dw_1.rowcount() then 
			sle_base2.text 	= dw_1.getitemstring(il_registro,'base')
			sle_serie2.text 	= dw_1.getitemstring(il_registro,'serie')
			sle_numero2.text 	= string(dw_1.getitemnumber(il_registro,'numero'))
		else
			sle_base2.text 	= ''
			sle_serie2.text 	= ''
			sle_numero2.text 	= ''
		end if
		il_registro ++
		if il_registro <= dw_1.rowcount() then 
			sle_base3.text 	= dw_1.getitemstring(il_registro,'base')
			sle_serie3.text 	= dw_1.getitemstring(il_registro,'serie')
			sle_numero3.text 	= string(dw_1.getitemnumber(il_registro,'numero'))
		else
			sle_base3.text 	= ''
			sle_serie3.text 	= ''
			sle_numero3.text 	= ''			
		end if
		il_registro ++
		if il_registro <= dw_1.rowcount() then 
			sle_base4.text 	= dw_1.getitemstring(il_registro,'base')
			sle_serie4.text 	= dw_1.getitemstring(il_registro,'serie')
			sle_numero4.text 	= string(dw_1.getitemnumber(il_registro,'numero'))
		else
			sle_base4.text 	= ''
			sle_serie4.text 	= ''
			sle_numero4.text 	= ''
		end if
		il_registro ++
		if il_registro <= dw_1.rowcount() then 
			sle_base5.text 	= dw_1.getitemstring(il_registro,'base')
			sle_serie5.text 	= dw_1.getitemstring(il_registro,'serie')
			sle_numero5.text 	= string(dw_1.getitemnumber(il_registro,'numero'))
		else
			sle_base5.text 	= ''
			sle_serie5.text 	= ''
			sle_numero5.text 	= ''
		end if
	else
		messagebox('Fin de los Registros','No Existen más Registros',information!)
	end if
end if
end event

type cb_elimina from commandbutton within w_crear_cuponeras
integer x = 2423
integer y = 392
integer width = 370
integer height = 108
integer taborder = 190
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Eliminar"
end type

event clicked;integer i
if dw_1.rowcount() > 0 then
	DO WHILE dw_1.rowcount() > 0
		dw_1.deleterow(0)
	LOOP
	cb_elimina.enabled	= false
	cb_carga.enabled 		= true
	cb_ejecuta.enabled 	= false
	cb_total.enabled 		= false
	sle_base1.text 		= ''
	sle_serie1.text 		= ''
	sle_numero1.text 		= ''
	sle_base2.text 		= ''
	sle_serie2.text 		= ''
	sle_numero2.text 		= ''
	sle_base3.text 		= ''
	sle_serie3.text 		= ''
	sle_numero3.text 		= ''	
	sle_base4.text 		= ''
	sle_serie4.text 		= ''
	sle_numero4.text 		= ''
	sle_base5.text 		= ''
	sle_serie5.text 		= ''
	sle_numero5.text 		= ''
	il_registro 			= 0
	gs_ventana				= 'w_principal'
	f_valida_objeto()
else
	messagebox('No hay Datos','No existen datos a eliminar',stopsign!)
end if 
end event

type cb_carga from commandbutton within w_crear_cuponeras
integer x = 2423
integer y = 280
integer width = 370
integer height = 108
integer taborder = 160
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cargar"
end type

event clicked;string null_str

SetNull(null_str)
dw_1.ImportFile(null_str)
dw_1.accepttext ()
st_10.text 					= string(dw_1.rowcount(),'###,###,###,###')+' Reg.'
if dw_1.rowcount() > 0 then
	cb_elimina.enabled 	= true
	this.enabled 			= false
	cb_ejecuta.enabled 	= true
	cb_total.enabled 		= true
	gs_ventana				= 'w_crear_cuponeras'
	f_valida_objeto()
end if
end event

type dw_1 from datawindow within w_crear_cuponeras
integer x = 1344
integer y = 276
integer width = 1024
integer height = 780
integer taborder = 170
string dataobject = "dw_archivo_cuponera"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_crear_cuponeras
integer x = 123
integer y = 228
integer width = 242
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "BASE"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type sle_base1 from singlelineedit within w_crear_cuponeras
integer x = 119
integer y = 320
integer width = 242
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

event modified;if Text <> "O" AND Text <> "L" AND Text <> "P" AND Text <> "D" AND Text <> "A" AND Text <> "R" AND Text <> "C"then
	Text = ""
	this.setfocus()
end if
end event

type sle_base2 from singlelineedit within w_crear_cuponeras
integer x = 119
integer y = 428
integer width = 242
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

event modified;if Text <> "O" AND Text <> "L" AND Text <> "P" AND Text <> "D" AND Text <> "A" AND Text <> "R" AND Text <> "C"then
	Text = ""
	this.setfocus()
end if
end event

type sle_base3 from singlelineedit within w_crear_cuponeras
integer x = 119
integer y = 536
integer width = 242
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

event modified;if Text <> "O" AND Text <> "L" AND Text <> "P" AND Text <> "D" AND Text <> "A" AND Text <> "R" AND Text <> "C"then
	Text = ""
	this.setfocus()
end if
end event

type sle_base4 from singlelineedit within w_crear_cuponeras
integer x = 119
integer y = 644
integer width = 242
integer height = 104
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

event modified;if Text <> "O" AND Text <> "L" AND Text <> "P" AND Text <> "D" AND Text <> "A" AND Text <> "R" AND Text <> "C"then
	Text = ""
	this.setfocus()
end if
end event

type sle_base5 from singlelineedit within w_crear_cuponeras
integer x = 119
integer y = 752
integer width = 242
integer height = 104
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

event modified;if Text <> "O" AND Text <> "L" AND Text <> "P" AND Text <> "D" AND Text <> "A" AND Text <> "R" AND Text <> "C"then
	Text = ""
	this.setfocus()
end if
end event

type st_estado from statictext within w_crear_cuponeras
integer x = 41
integer y = 868
integer width = 1170
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421376
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_crear_cuponeras
integer x = 41
integer y = 752
integer width = 78
integer height = 104
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "5"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_7 from statictext within w_crear_cuponeras
integer x = 41
integer y = 644
integer width = 78
integer height = 104
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "4"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_6 from statictext within w_crear_cuponeras
integer x = 41
integer y = 536
integer width = 78
integer height = 104
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "3"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within w_crear_cuponeras
integer x = 41
integer y = 428
integer width = 78
integer height = 104
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "2"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_4 from statictext within w_crear_cuponeras
integer x = 41
integer y = 320
integer width = 78
integer height = 104
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "1"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type sle_numero5 from singlelineedit within w_crear_cuponeras
integer x = 613
integer y = 752
integer width = 599
integer height = 104
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_numero4 from singlelineedit within w_crear_cuponeras
integer x = 613
integer y = 644
integer width = 599
integer height = 104
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_numero3 from singlelineedit within w_crear_cuponeras
integer x = 613
integer y = 536
integer width = 599
integer height = 104
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_numero2 from singlelineedit within w_crear_cuponeras
integer x = 613
integer y = 428
integer width = 599
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_numero1 from singlelineedit within w_crear_cuponeras
integer x = 613
integer y = 320
integer width = 599
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_serie5 from singlelineedit within w_crear_cuponeras
integer x = 366
integer y = 752
integer width = 242
integer height = 104
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type sle_serie4 from singlelineedit within w_crear_cuponeras
integer x = 366
integer y = 644
integer width = 242
integer height = 104
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type sle_serie3 from singlelineedit within w_crear_cuponeras
integer x = 366
integer y = 536
integer width = 242
integer height = 104
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type sle_serie2 from singlelineedit within w_crear_cuponeras
integer x = 366
integer y = 428
integer width = 242
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type sle_serie1 from singlelineedit within w_crear_cuponeras
integer x = 366
integer y = 320
integer width = 242
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_crear_cuponeras
integer x = 617
integer y = 228
integer width = 599
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "NUMERO"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_2 from statictext within w_crear_cuponeras
integer x = 370
integer y = 228
integer width = 242
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "SERIE"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_crear_cuponeras
integer x = 878
integer y = 1076
integer width = 334
integer height = 108
integer taborder = 240
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;il_registro = 0
Close(w_crear_cuponeras)
end event

type cb_crear from commandbutton within w_crear_cuponeras
integer x = 41
integer y = 1076
integer width = 334
integer height = 108
integer taborder = 220
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&rear"
end type

event clicked;//long 		ret,ll_fila,bloquea_cupones,ll_numero
//String	ls_estado_cuponera,ls_base,ls_serie,ls_descrip
//
//Open(w_espera)
//gf_buscar_ultimo_cupon(gl_ultimo_cupon)
//dw_1.accepttext()
//ret 							= dw_1.rowcount()
//if ret = 0 then
//	if len(sle_numero1.text) > 0 and len(sle_numero2.text) > 0 and &
//		len(sle_numero3.text) > 0 and len(sle_numero4.text) > 0 and &
//		len(sle_numero5.text) > 0 then
//		
//		bloquea_cupones 	= ( gi_cant_cup * 5 ) + gl_ultimo_cupon
//	elseif len(sle_numero1.text) > 0 and len(sle_numero2.text) > 0 and &
//		len(sle_numero3.text) > 0 and len(sle_numero4.text) > 0 then
//		
//		bloquea_cupones 	= ( gi_cant_cup * 4 ) + gl_ultimo_cupon
//	elseif len(sle_numero1.text) > 0 and len(sle_numero2.text) > 0 and &
//		len(sle_numero3.text) > 0 then
//		
//		bloquea_cupones 	= ( gi_cant_cup * 3 ) + gl_ultimo_cupon
//	elseif len(sle_numero1.text) > 0 and len(sle_numero2.text) > 0 then
//		bloquea_cupones 	= ( gi_cant_cup * 2 ) + gl_ultimo_cupon
//	elseif len(sle_numero1.text) > 0 then
//		bloquea_cupones 	= gi_cant_cup + gl_ultimo_cupon
//	end if
//else
//	ll_fila	= 0
//	if long(sle_numero1.text)>0 then
//		ll_fila	= ll_fila + 1
//	end if
//	if long(sle_numero2.text)>0 then
//		ll_fila	= ll_fila + 1
//	end if
//	if long(sle_numero3.text)>0 then
//		ll_fila	= ll_fila + 1
//	end if
//	if long(sle_numero4.text)>0 then
//		ll_fila	= ll_fila + 1
//	end if
//	if long(sle_numero5.text)>0 then
//		ll_fila	= ll_fila + 1
//	end if
//	if gs_cuponera_aviso = '0' then
//		bloquea_cupones 		= ( gi_cant_cup * ll_fila ) + gl_ultimo_cupon
//	else
//		bloquea_cupones 		= (ret + 1) + gl_ultimo_cupon
//	end if
//end if
//gl_ultimo_cupon 				= bloquea_cupones
//ls_base							= Trim(sle_base1.text)
//ls_serie							= Trim(sle_serie1.text)
//ll_numero						= LONG(sle_numero1.text)
//IF ls_serie <> "" and not isnull(ls_serie) THEN
//	IF NOT(gf_validar(ls_base, ls_serie,ll_numero)) THEN
//		Close(w_espera)
//		MessageBox("Cuponeras", "No Existe Nº Contrato o Estado No Corresponde")
//		RETURN 0
//	ELSE
//		SELECT	"CUPONERAS"."ESTADO_CUPONERA"  
//		INTO 		:ls_estado_cuponera  
//		FROM 		"CUPONERAS"  
//		WHERE  ( "CUPONERAS"."BASE" = :ls_base ) AND  
//				 ( "CUPONERAS"."SERIE" = :ls_serie ) AND  
//				 ( "CUPONERAS"."NUMERO" = :ll_numero ) AND
//				 ( "CUPONERAS"."ESTADO_CUPONERA" = 'V' )
//		USING		sqlca;
//		if sqlca.sqlcode=0 then
//			
//			messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero)+" No es posible Generar Cuponera por estar en Estado: V-Vigente")
//		elseif sqlca.sqlcode = 100 then
//			gf_insertar_cuponera(1, ls_base, ls_serie, ll_numero,1)
//		elseif sqlca.sqlcode = -1 then
//			messagebox("Error Cuponera","Error al Generar Cuponera Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero)+" SQL: "+sqlca.sqlerrtext)
//		end if
//	END IF
//ELSE
//	gf_insertar_cuponera(1,"","", 0,1)
//END IF
//if sle_serie1.text <> "" and (sle_serie2.text = "" and sle_serie3.text = "" and sle_serie4.text = "" and sle_serie5.text = "" ) then
//	close(w_espera)
//	gf_actualizar_datos()
//	open(w_vista_previa)
//	return
//end if
//IF sle_serie2.text <> "" THEN
//	IF NOT(gf_validar(sle_base2.text, sle_serie2.text, LONG(sle_numero2.text))) THEN
//		Close(w_espera)
//		MessageBox("Cuponeras", "No se encontró la información del dato 2 !")
//		RETURN 0
//	ELSE
//		// Ingresar Oferta 2
//		gf_insertar_cuponera(2, sle_base2.text, sle_serie2.text, LONG(sle_numero2.text),2)
//	END IF
//ELSE
//	gf_insertar_cuponera(2,"","", 0,2)
//END IF
//IF sle_serie3.text <> "" THEN
//	IF NOT(gf_validar(sle_base3.text, sle_serie3.text, LONG(sle_numero3.text))) THEN
//		Close(w_espera)
//		MessageBox("Cuponeras", "No se encontró la información del dato 3 !")
//		RETURN 0
//	ELSE
//		// Ingresar Oferta 3
//		gf_insertar_cuponera(3, sle_base3.text, sle_serie3.text, LONG(sle_numero3.text),3)
//	END IF
//ELSE
//	gf_insertar_cuponera(3,"","",0,3)
//END IF
//IF sle_serie4.text <> "" THEN
//	IF NOT(gf_validar(sle_base4.text, sle_serie4.text, LONG(sle_numero4.text))) THEN
//		Close(w_espera)
//		MessageBox("Cuponeras", "No se encontró la información del dato 4 !")
//		RETURN 0
//	ELSE
//		// Ingresar Oferta 4
//		gf_insertar_cuponera(4, sle_base4.text, sle_serie4.text, LONG(sle_numero4.text),4)
//	END IF
//ELSE
//	gf_insertar_cuponera(4,"","",0,4)
//END IF
//IF sle_serie5.text <> "" THEN
//	IF NOT(gf_validar(sle_base5.text, sle_serie5.text, LONG(sle_numero5.text))) THEN
//		Close(w_espera)
//		MessageBox("Cuponeras", "No se encontró la información del dato 5 !")
//		RETURN 0
//	ELSE
//		// Ingresar Oferta 5
//		gf_insertar_cuponera(5,sle_base5.text, sle_serie5.text, LONG(sle_numero5.text),5)
//	END IF
//ELSE
//	gf_insertar_cuponera(5,"","",0,5)
//END IF
//
//IF sle_serie1.text <> "" OR sle_serie2.text <> "" OR sle_serie3.text <> "" OR sle_serie4.text <> "" OR sle_serie5.text <> "" THEN
//	Close(w_espera)
//	gf_actualizar_datos()
//	Open(w_vista_previa)
//END IF
//Close(w_espera)
end event

type st_1 from statictext within w_crear_cuponeras
integer x = 389
integer y = 52
integer width = 2098
integer height = 100
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long backcolor = 67108864
boolean enabled = false
string text = "Crear Cuponeras de Pago y/o Aviso de Mantención"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_crear_cuponeras
integer x = 1289
integer y = 188
integer width = 1554
integer height = 1028
integer textsize = -13
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Cargar Archivo"
end type

