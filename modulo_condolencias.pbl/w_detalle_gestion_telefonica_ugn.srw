forward
global type w_detalle_gestion_telefonica_ugn from window
end type
type cb_ordenar from commandbutton within w_detalle_gestion_telefonica_ugn
end type
type cb_filtrar from commandbutton within w_detalle_gestion_telefonica_ugn
end type
type cb_exportar from commandbutton within w_detalle_gestion_telefonica_ugn
end type
type cb_imprimir from commandbutton within w_detalle_gestion_telefonica_ugn
end type
type dw_lista from datawindow within w_detalle_gestion_telefonica_ugn
end type
type cb_cerrar from commandbutton within w_detalle_gestion_telefonica_ugn
end type
type gb_1 from groupbox within w_detalle_gestion_telefonica_ugn
end type
end forward

global type w_detalle_gestion_telefonica_ugn from window
integer width = 3584
integer height = 2324
boolean titlebar = true
string title = "Detalle Cobranza por Fecha"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
dw_lista dw_lista
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_detalle_gestion_telefonica_ugn w_detalle_gestion_telefonica_ugn

type variables
Long	il_row,il_parque
end variables

on w_detalle_gestion_telefonica_ugn.create
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.dw_lista,&
this.cb_cerrar,&
this.gb_1}
end on

on w_detalle_gestion_telefonica_ugn.destroy
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;Datetime	ld_fecha_ini,ld_fecha_fin
String	ls_opcion,ls_ejec

SetPointer(HourGlass!)
gf_centrar(w_detalle_gestion_telefonica_ugn)
ld_fecha_ini 	= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
ld_fecha_fin 	= datetime(date(substr(1,2,Message.StringParm)),time('23:59:59'))
ls_opcion		= substr(1,3,Message.StringParm)
CHOOSE CASE ls_opcion
	CASE 'PS'
		dw_lista.dataobject	= 'dw_informe_detalle_ugn_parque_venta'
		this.title				= 'Informe Gestión Venta por Parque'
	CASE 'AS'
		dw_lista.dataobject	= 'dw_informe_detalle_ugn_ejecutivo_venta'
		this.title				= 'Informe Gestión Venta por Agente / Supervisor'
	CASE 'PU'
		dw_lista.dataobject	= 'dw_informe_detalle_ugn_parque'
		this.title				= 'Informe Gestión UGN por Parque'
	CASE 'AU'
		dw_lista.dataobject	= 'dw_informe_detalle_ugn_ejecutivo_ugn'
		this.title				= 'Informe Gestión UGN por Ejecutivo'
END CHOOSE
dw_lista.settransobject(sqlca)
if ls_opcion='PS' or ls_opcion='PU' then
	il_parque					= w_informes_ugn_general.dw_parque.getitemnumber(1,'cod_parque')
	dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,il_parque)
elseif ls_opcion='AS' or ls_opcion='AU' then
	if w_informes_ugn_general.cbx_todo.checked=true then 
		ls_ejec					= '%'
	else
		ls_ejec					= w_informes_ugn_general.dw_agente.getitemstring(1,'ejecutivo')
		if isnull(ls_ejec) or ls_ejec = '' then
			ls_ejec 				= gs_user
		end if	
	end if
	dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,ls_ejec)
end if
SetPointer(Arrow!)
if dw_lista.rowcount() = 0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_detalle_gestion_telefonica_ugn)
end if
end event

type cb_ordenar from commandbutton within w_detalle_gestion_telefonica_ugn
event ue_mousemove pbm_mousemove
integer x = 55
integer y = 2056
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

type cb_filtrar from commandbutton within w_detalle_gestion_telefonica_ugn
event ue_mousemove pbm_mousemove
integer x = 306
integer y = 2056
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_detalle_gestion_telefonica_ugn
event ue_mousemove pbm_mousemove
integer x = 558
integer y = 2056
integer width = 247
integer height = 92
integer taborder = 40
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

type cb_imprimir from commandbutton within w_detalle_gestion_telefonica_ugn
event ue_mousemove pbm_mousemove
integer x = 850
integer y = 2056
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_detalle_gestion_telefonica_ugn
integer x = 32
integer y = 32
integer width = 3506
integer height = 1968
integer taborder = 10
string title = "none"
string dataobject = "dw_informe_detalle_ugn_ejecutivo_ugn"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_cerrar from commandbutton within w_detalle_gestion_telefonica_ugn
integer x = 3223
integer y = 2056
integer width = 315
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_gestion_telefonica_ugn)
end event

type gb_1 from groupbox within w_detalle_gestion_telefonica_ugn
event ue_mousemove pbm_mousemove
integer x = 32
integer y = 2008
integer width = 1093
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

