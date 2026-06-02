forward
global type w_ubicacion_plano from window
end type
type st_5 from statictext within w_ubicacion_plano
end type
type st_4 from statictext within w_ubicacion_plano
end type
type pb_4 from picturebutton within w_ubicacion_plano
end type
type pb_3 from picturebutton within w_ubicacion_plano
end type
type pb_2 from picturebutton within w_ubicacion_plano
end type
type pb_1 from picturebutton within w_ubicacion_plano
end type
type st_3 from statictext within w_ubicacion_plano
end type
type st_2 from statictext within w_ubicacion_plano
end type
type st_1 from statictext within w_ubicacion_plano
end type
type dw_1 from datawindow within w_ubicacion_plano
end type
type gb_1 from groupbox within w_ubicacion_plano
end type
type gb_2 from groupbox within w_ubicacion_plano
end type
end forward

global type w_ubicacion_plano from window
integer width = 2414
integer height = 1912
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 67108864
st_5 st_5
st_4 st_4
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_ubicacion_plano w_ubicacion_plano

on w_ubicacion_plano.create
this.st_5=create st_5
this.st_4=create st_4
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_5,&
this.st_4,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_ubicacion_plano.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;long 		a,ll_cod_parque
String		ls_dw,ls_imagen,ls_parque

ll_cod_parque	= w_plano_sector_parque.id_parque
gf_centrar(w_ubicacion_plano)
dw_1.dataobject = 'dw_ubicacion_plano'
SELECT	"MEMBRETE_EMPRESA"."DW_PLANIMETRIA",   
			"MEMBRETE_EMPRESA"."NOMBRE_IMAGEN_PLANIMETRIA",
			"MEMBRETE_EMPRESA"."PARQUE"
INTO 		:ls_dw,   
			:ls_imagen,
			:ls_parque
FROM 	"MEMBRETE_EMPRESA"  
WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
dw_1.dataobject 				= ls_dw
dw_1.Object.p_1.Filename 	= ls_imagen
title = 'Posicionamiento Global del Sector: '+gs_sector+' ( '+ls_parque+' )'

//if gs_empresa = 'El Prado' then
//	if w_plano_sector_parque.id_parque = 1 then
//		dw_1.dataobject = 'dw_prueba_dibujo'
//		dw_1.Object.p_1.Filename = "prado_prueba_1.bmp"
//		title = 'Posicionamiento Global del Sector: '+gs_sector+' ( El Prado )'
//	elseif w_plano_sector_parque.id_parque = 102 then
//		dw_1.dataobject = 'dw_prueba_dibujo_manantial'
//		dw_1.Object.p_1.Filename = "parque_manantial_2.bmp"
//		title = 'Posicionamiento Global del Sector: '+gs_sector+' ( El Manantial )'
//	end if
//elseif gs_empresa = 'La Foresta' then
//	dw_1.dataobject = 'dw_prueba_dibujo_serena'
//	dw_1.Object.p_1.Filename = "plano_serena.bmp"
//		title = 'Posicionamiento Global del Sector: '+gs_sector+' ( La Foresta )'	
//elseif gs_empresa = 'Concepcion' then
//	dw_1.dataobject = 'dw_prueba_dibujo_conce'
//	dw_1.Object.p_1.Filename = "plano_conce.jpg"
//		title = 'Posicionamiento Global del Sector: '+gs_sector+' ( Concepción )'	
//end if
dw_1.insertrow(0)
dw_1.object.rr_2.x = long(dw_1.describe('a'+gs_sector+'.x')) - 180
dw_1.object.rr_2.y = long(dw_1.describe('a'+gs_sector+'.y')) - 160

dw_1.Modify("DataWindow.verticalScrollPosition = " + string(long(dw_1.describe('a'+gs_sector+'.y')) - 500))
dw_1.Modify("DataWindow.HorizontalScrollPosition = " + string(long(dw_1.describe('a'+gs_sector+'.x')) - 700))
st_3.text = 'Rectangulo: x = '+dw_1.object.rr_2.x+', y = '+dw_1.object.rr_2.y
dw_1.object.rr_2.visible = true
st_4.text = '100%'
end event

event mousemove;st_5.visible = false
end event

type st_5 from statictext within w_ubicacion_plano
integer x = 2784
integer y = 480
integer width = 439
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 30867188
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_4 from statictext within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 2135
integer y = 824
integer width = 178
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event mousemove;st_5.visible = false
end event

type pb_4 from picturebutton within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 2135
integer y = 644
integer width = 178
integer height = 152
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "menos.bmp"
alignment htextalign = left!
end type

event mousemove;st_5.visible = true
st_5.text = 'Zoom (-)'
st_5.x = 1659
st_5.y = 680
end event

event clicked;if long(dw_1.Describe("DataWindow.Zoom"))  > 70 then
	dw_1.Object.DataWindow.Zoom = long(dw_1.Describe("DataWindow.Zoom")) - 10
	st_4.text = dw_1.Describe("DataWindow.Zoom")+'%'
end if
end event

type pb_3 from picturebutton within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 2135
integer y = 472
integer width = 178
integer height = 152
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "mas.bmp"
alignment htextalign = left!
end type

event mousemove;st_5.visible = true
st_5.text = 'Zoom (+)'
st_5.x = 1659
st_5.y = 512
end event

event clicked;if long(dw_1.Describe("DataWindow.Zoom"))  < 200 then
	dw_1.Object.DataWindow.Zoom = long(dw_1.Describe("DataWindow.Zoom")) + 10
	st_4.text = dw_1.Describe("DataWindow.Zoom")+'%'
end if
end event

type pb_2 from picturebutton within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 2135
integer y = 224
integer width = 178
integer height = 152
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar.bmp"
alignment htextalign = left!
end type

event mousemove;st_5.visible = true
st_5.text = 'Centrar Sector'
st_5.x = 1659
st_5.y = 248
end event

event clicked;w_ubicacion_plano.triggerevent (open!)
end event

type pb_1 from picturebutton within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 2135
integer y = 1604
integer width = 178
integer height = 152
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
end type

event mousemove;st_5.visible = true
st_5.text = 'Cerrar'
st_5.x = 1659
st_5.y = 1632
end event

event clicked;close(w_ubicacion_plano)
end event

type st_3 from statictext within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 1102
integer y = 1692
integer width = 969
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

event mousemove;st_5.visible = false
end event

type st_2 from statictext within w_ubicacion_plano
integer x = 2107
integer y = 56
integer width = 215
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within w_ubicacion_plano
integer x = 46
integer y = 1692
integer width = 270
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 46
integer y = 56
integer width = 2025
integer height = 1612
integer taborder = 10
string title = "none"
string dataobject = "dw_prueba_dibujo"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;st_3.text = 'Rectangulo: x = '+dw_1.object.rr_2.x+', y = '+dw_1.object.rr_2.y
st_5.visible = false
end event

event scrollhorizontal;st_1.text = 'x = '+string(scrollpos)
end event

event scrollvertical;st_2.text = 'y = '+ string(scrollpos)
end event

type gb_1 from groupbox within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 2098
integer y = 416
integer width = 247
integer height = 512
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zoom"
end type

event mousemove;st_5.visible = false
end event

type gb_2 from groupbox within w_ubicacion_plano
event mousemove pbm_mousemove
integer x = 2098
integer y = 164
integer width = 247
integer height = 240
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pos x,y"
end type

event mousemove;st_5.visible = false
end event

