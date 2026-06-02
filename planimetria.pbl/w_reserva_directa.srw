forward
global type w_reserva_directa from window
end type
type em_1 from editmask within w_reserva_directa
end type
type dw_2 from datawindow within w_reserva_directa
end type
type dw_1 from datawindow within w_reserva_directa
end type
type pb_1 from picturebutton within w_reserva_directa
end type
type cb_2 from commandbutton within w_reserva_directa
end type
type gb_1 from groupbox within w_reserva_directa
end type
type gb_2 from groupbox within w_reserva_directa
end type
end forward

global type w_reserva_directa from window
integer width = 2336
integer height = 1276
boolean titlebar = true
string title = "Reserva Directa"
long backcolor = 81324524
em_1 em_1
dw_2 dw_2
dw_1 dw_1
pb_1 pb_1
cb_2 cb_2
gb_1 gb_1
gb_2 gb_2
end type
global w_reserva_directa w_reserva_directa

type variables
integer id_parque
end variables

on w_reserva_directa.create
this.em_1=create em_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.pb_1=create pb_1
this.cb_2=create cb_2
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.em_1,&
this.dw_2,&
this.dw_1,&
this.pb_1,&
this.cb_2,&
this.gb_1,&
this.gb_2}
end on

on w_reserva_directa.destroy
destroy(this.em_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.cb_2)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;gf_centrar(w_reserva_directa)
dw_1.settransobject(sqlca)
id_parque = w_plano_sector_parque.id_parque
end event

type em_1 from editmask within w_reserva_directa
integer x = 201
integer y = 128
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###,###"
string minmax = "~~6"
end type

type dw_2 from datawindow within w_reserva_directa
integer x = 1266
integer y = 128
integer width = 919
integer height = 744
integer taborder = 30
string title = "none"
string dataobject = "dw_seleccion_reserva_directa_listar"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Double	numero
This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)
if rowcount() > 0 then
	numero       	= getitemnumber(row,'numero')
	gs_sector    		= getitemstring(row,'sector')
	gs_sepultura 	= getitemstring(row,'sepultura')
	if numero >= 10000000 then
		open(w_sepul_const_m12)
	elseif numero = 0 then
		open(w_solicitud_reserva)
	else
		messagebox('Tiene Asignacion','Esta Sepultura tiene asignación',stopsign!)
	end if
else
	
end if
end event

type dw_1 from datawindow within w_reserva_directa
integer x = 137
integer y = 320
integer width = 969
integer height = 508
string title = "none"
string dataobject = "dw_seleccion_reserva_directa_promesa"
boolean border = false
boolean livescroll = true
end type

type pb_1 from picturebutton within w_reserva_directa
integer x = 663
integer y = 104
integer width = 174
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
boolean default = true
string picturename = "buscar.bmp"
alignment htextalign = left!
end type

event clicked;dw_2.settransobject(sqlca)
if isnumber(em_1.text) then
	OpenWithParm(w_seleccion_reserva_directa, em_1.text)
	if Message.StringParm = 'no'  or isnull(Message.StringParm) then
		setnull(gs_base)
		setnull(gs_serie)
		setnull(gi_numero)
		dw_1.reset()
		dw_2.reset()
		em_1.text = ''
		em_1.setfocus()
	else
		if gs_base = 'C' then
			dw_1.dataobject = 'dw_seleccion_reserva_directa_contrato'
		elseif gs_base = 'O' or gs_base='U' then
			dw_1.dataobject = 'dw_seleccion_reserva_directa_promesa'
		else
			dw_1.reset()
			dw_2.reset()
		end if
		dw_1.settransobject(sqlca)
		if dw_1.retrieve(gs_serie,gi_numero) = 0 then
			dw_1.reset()
			dw_2.reset()
		else
			if gs_base = 'C' then
				if isnull(dw_1.getitemstring(1,'sepultura')) or dw_1.getitemstring(1,'sepultura') = '0' then
					gs_area 		= dw_1.getitemstring(1,'zona')
					gs_sector 	= dw_1.getitemstring(1,'sector')
					gi_rut    		= dw_1.getitemnumber(1,'rut')
					dw_2.retrieve(gs_sector,id_parque)
					gb_1.text 	= 'Sep.Disponibles Sector: '+gs_sector
				else
					messagebox('Tiene Asignación','Este Contrato Tiene Asignación de Sepultura',stopsign!)
					dw_1.reset()
					dw_2.reset()
					em_1.text = ''
					em_1.setfocus()
				end if
			elseif gs_base = 'O' or gs_base='U' then
				if isnull(dw_1.getitemstring(1,'pago_oferta_sepultura')) or dw_1.getitemstring(1,'pago_oferta_sepultura') = '0' then
					gs_area 		= dw_1.getitemstring(1,'pago_oferta_area')
					gs_sector 	= dw_1.getitemstring(1,'pago_oferta_sector')
					gi_rut 		= dw_1.getitemnumber(1,'oferta_v_rut')
					dw_2.retrieve(gs_sector,id_parque)
					gb_1.text 	= 'Sep.Disponibles Sector: '+gs_sector
				else
					messagebox('Tiene Asignación','Esta Promesa Tiene Asignación de Sepultura',stopsign!)
					dw_1.reset()
					dw_2.reset()
					em_1.text = ''
					em_1.setfocus()
				end if
			end if
		end if
	end if
else
	messagebox('Numeros','Debe digitar caracteres numericos',stopsign!)
end if
end event

type cb_2 from commandbutton within w_reserva_directa
integer x = 1861
integer y = 984
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_reserva_directa)
end event

type gb_1 from groupbox within w_reserva_directa
integer x = 1207
integer y = 40
integer width = 1056
integer height = 880
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 81324524
string text = "Sep.Disponibles Sector:"
end type

type gb_2 from groupbox within w_reserva_directa
integer x = 41
integer y = 40
integer width = 1120
integer height = 880
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 81324524
string text = "Buscar Promesa:"
end type

