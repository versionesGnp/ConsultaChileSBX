forward
global type w_servicios_maestros_ceremonias from window
end type
type cb_imprimir from commandbutton within w_servicios_maestros_ceremonias
end type
type cb_2 from commandbutton within w_servicios_maestros_ceremonias
end type
type cb_filtrar from commandbutton within w_servicios_maestros_ceremonias
end type
type cb_exportar from commandbutton within w_servicios_maestros_ceremonias
end type
type cb_ordenar from commandbutton within w_servicios_maestros_ceremonias
end type
type pb_1 from picturebutton within w_servicios_maestros_ceremonias
end type
type cb_1 from commandbutton within w_servicios_maestros_ceremonias
end type
type st_1 from statictext within w_servicios_maestros_ceremonias
end type
type fec_fin_ugn_falle from editmask within w_servicios_maestros_ceremonias
end type
type p_2 from picture within w_servicios_maestros_ceremonias
end type
type st_2 from statictext within w_servicios_maestros_ceremonias
end type
type fec_ini_ugn_falle from editmask within w_servicios_maestros_ceremonias
end type
type p_1 from picture within w_servicios_maestros_ceremonias
end type
type dw_lista from datawindow within w_servicios_maestros_ceremonias
end type
type gb_5 from groupbox within w_servicios_maestros_ceremonias
end type
type gb_1 from groupbox within w_servicios_maestros_ceremonias
end type
end forward

global type w_servicios_maestros_ceremonias from window
integer width = 2958
integer height = 2348
boolean titlebar = true
string title = "Servicios Maestro Condolencias"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
cb_2 cb_2
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_ordenar cb_ordenar
pb_1 pb_1
cb_1 cb_1
st_1 st_1
fec_fin_ugn_falle fec_fin_ugn_falle
p_2 p_2
st_2 st_2
fec_ini_ugn_falle fec_ini_ugn_falle
p_1 p_1
dw_lista dw_lista
gb_5 gb_5
gb_1 gb_1
end type
global w_servicios_maestros_ceremonias w_servicios_maestros_ceremonias

on w_servicios_maestros_ceremonias.create
this.cb_imprimir=create cb_imprimir
this.cb_2=create cb_2
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.pb_1=create pb_1
this.cb_1=create cb_1
this.st_1=create st_1
this.fec_fin_ugn_falle=create fec_fin_ugn_falle
this.p_2=create p_2
this.st_2=create st_2
this.fec_ini_ugn_falle=create fec_ini_ugn_falle
this.p_1=create p_1
this.dw_lista=create dw_lista
this.gb_5=create gb_5
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_2,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_ordenar,&
this.pb_1,&
this.cb_1,&
this.st_1,&
this.fec_fin_ugn_falle,&
this.p_2,&
this.st_2,&
this.fec_ini_ugn_falle,&
this.p_1,&
this.dw_lista,&
this.gb_5,&
this.gb_1}
end on

on w_servicios_maestros_ceremonias.destroy
destroy(this.cb_imprimir)
destroy(this.cb_2)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.pb_1)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.fec_fin_ugn_falle)
destroy(this.p_2)
destroy(this.st_2)
destroy(this.fec_ini_ugn_falle)
destroy(this.p_1)
destroy(this.dw_lista)
destroy(this.gb_5)
destroy(this.gb_1)
end on

event open;gf_centrar(w_servicios_maestros_ceremonias)

dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)

fec_ini_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
fec_fin_ugn_falle.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type cb_imprimir from commandbutton within w_servicios_maestros_ceremonias
integer x = 1349
integer y = 2092
integer width = 247
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 100
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type cb_2 from commandbutton within w_servicios_maestros_ceremonias
integer x = 869
integer y = 2092
integer width = 247
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;fec_ini_ugn_falle.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')
fec_fin_ugn_falle.text			= string(gdt_fec_sistema, 'dd/mm/yyyy')

dw_lista.reset()

end event

type cb_filtrar from commandbutton within w_servicios_maestros_ceremonias
event ue_mousemove pbm_mousemove
integer x = 311
integer y = 2096
integer width = 247
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_nulo

setnull(ls_nulo)
dw_lista.setfilter(ls_nulo)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_servicios_maestros_ceremonias
event ue_mousemove pbm_mousemove
integer x = 562
integer y = 2096
integer width = 247
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_servicios_maestros_ceremonias
event ue_mousemove pbm_dwnmousemove
integer x = 59
integer y = 2096
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_1 from picturebutton within w_servicios_maestros_ceremonias
integer x = 1285
integer y = 48
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;datetime ldt_fec_ini,ldt_fec_fin

SetPointer(HourGlass!)
dw_lista.reset()
ldt_fec_ini						= datetime(date(fec_ini_ugn_falle.text),time('00:00:00'))
ldt_fec_fin						= datetime(date(fec_fin_ugn_falle.text),time('23:59:59'))

if ldt_fec_ini <= ldt_fec_fin then
	if dw_lista.retrieve(ldt_fec_ini,ldt_fec_fin)=0 then
		messagebox("Advertencia","No Registra Dato")
	else
			dw_lista.setfocus()
		end if
	else
		Messagebox("Advertencia","Fecha Inicial no Puede ser Mayor a la Final")
		fec_ini_ugn_falle.setfocus()
	end if
SetPointer(Arrow!)
end event

type cb_1 from commandbutton within w_servicios_maestros_ceremonias
integer x = 2574
integer y = 2092
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_servicios_maestros_ceremonias)
end event

type st_1 from statictext within w_servicios_maestros_ceremonias
integer x = 59
integer y = 96
integer width = 123
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicio"
alignment alignment = right!
boolean focusrectangle = false
end type

type fec_fin_ugn_falle from editmask within w_servicios_maestros_ceremonias
integer x = 795
integer y = 88
integer width = 325
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type p_2 from picture within w_servicios_maestros_ceremonias
integer x = 1125
integer y = 88
integer width = 78
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(fec_fin_ugn_falle.text)=-1 then 
	fec_fin_ugn_falle.text=string(today(),gs_formato_fecha)
	fec_fin_ugn_falle.setfocus()
	return
end if 
if fec_fin_ugn_falle.text<>'00/00/0000' then
	ls_fecha = fec_fin_ugn_falle.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(fec_fin_ugn_falle.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		fec_fin_ugn_falle.setfocus()
		return
	else 
		fec_fin_ugn_falle.text = Message.StringParm
	end if 
END IF
end event

type st_2 from statictext within w_servicios_maestros_ceremonias
integer x = 626
integer y = 96
integer width = 137
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type fec_ini_ugn_falle from editmask within w_servicios_maestros_ceremonias
integer x = 192
integer y = 88
integer width = 325
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

type p_1 from picture within w_servicios_maestros_ceremonias
integer x = 526
integer y = 88
integer width = 78
integer height = 80
boolean bringtotop = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
long		uf

if f_valida_fecha(fec_ini_ugn_falle.text)=-1 then 
	fec_ini_ugn_falle.text=string(today(),gs_formato_fecha)
	fec_ini_ugn_falle.setfocus()
	return
end if 
if fec_ini_ugn_falle.text<>'00/00/0000' then
	ls_fecha = fec_ini_ugn_falle.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

if Message.StringParm <> ls_fecha THEN
	if DATE(Message.StringParm)>DATE(fec_ini_ugn_falle.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		fec_ini_ugn_falle.setfocus()
		return
	else 
		fec_ini_ugn_falle.text = Message.StringParm
	end if 
end if
end event

type dw_lista from datawindow within w_servicios_maestros_ceremonias
integer x = 32
integer y = 236
integer width = 2880
integer height = 1792
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_funerales_mc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;string	ls_string
long ll_row,ll_rut,ll_grupo

ll_row = dw_lista.getrow()

if ll_row > 0 then
	ll_rut			= dw_lista.getitemnumber(ll_row,"rut_fallecido")
	SELECT 	"UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO"  
	INTO 		:ll_grupo  
	FROM 	"UGN_CLIENTE_ASIGNAR_FALLE"  
	WHERE 	"UGN_CLIENTE_ASIGNAR_FALLE"."RUT_FALLECIDO" = :ll_rut   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		ls_string		= string(ll_grupo)
		if isvalid(w_servcios_mc_detalle_grupo) then close(w_servcios_mc_detalle_grupo)
			openwithparm(w_servcios_mc_detalle_grupo,ls_string)	
	else
		messagebox("Advertencia","No Registra Dato")
	end if
end if	
end event

event itemfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type gb_5 from groupbox within w_servicios_maestros_ceremonias
integer x = 32
integer y = 12
integer width = 1211
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango de Fechas"
end type

type gb_1 from groupbox within w_servicios_maestros_ceremonias
integer x = 37
integer y = 2044
integer width = 1120
integer height = 172
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

