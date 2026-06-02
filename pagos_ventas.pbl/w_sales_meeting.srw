forward
global type w_sales_meeting from window
end type
type st_porc from statictext within w_sales_meeting
end type
type hpb_1 from hprogressbar within w_sales_meeting
end type
type st_fondo from statictext within w_sales_meeting
end type
type cb_limpiar from commandbutton within w_sales_meeting
end type
type tab_1 from tab within w_sales_meeting
end type
type tabpage_1 from userobject within tab_1
end type
type dw_general from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_general dw_general
end type
type tabpage_2 from userobject within tab_1
end type
type dw_produccion from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_produccion dw_produccion
end type
type tabpage_3 from userobject within tab_1
end type
type dw_dotacion from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_dotacion dw_dotacion
end type
type tabpage_4 from userobject within tab_1
end type
type dw_productividad from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_productividad dw_productividad
end type
type tabpage_5 from userobject within tab_1
end type
type dw_morosidad from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_morosidad dw_morosidad
end type
type tab_1 from tab within w_sales_meeting
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type cb_exportar from commandbutton within w_sales_meeting
end type
type cb_imprimir from commandbutton within w_sales_meeting
end type
type dw_fecha_cierre from datawindow within w_sales_meeting
end type
type st_promesa from statictext within w_sales_meeting
end type
type pb_buscar from picturebutton within w_sales_meeting
end type
type em_agente from editmask within w_sales_meeting
end type
type pb_aceptar from picturebutton within w_sales_meeting
end type
type cb_cerrar from commandbutton within w_sales_meeting
end type
type dw_seleccion from datawindow within w_sales_meeting
end type
end forward

global type w_sales_meeting from window
integer width = 4201
integer height = 2248
boolean titlebar = true
string title = "Sales Meeting"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_porc st_porc
hpb_1 hpb_1
st_fondo st_fondo
cb_limpiar cb_limpiar
tab_1 tab_1
cb_exportar cb_exportar
cb_imprimir cb_imprimir
dw_fecha_cierre dw_fecha_cierre
st_promesa st_promesa
pb_buscar pb_buscar
em_agente em_agente
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_seleccion dw_seleccion
end type
global w_sales_meeting w_sales_meeting

type variables
long il_row
end variables

on w_sales_meeting.create
this.st_porc=create st_porc
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.cb_limpiar=create cb_limpiar
this.tab_1=create tab_1
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.dw_fecha_cierre=create dw_fecha_cierre
this.st_promesa=create st_promesa
this.pb_buscar=create pb_buscar
this.em_agente=create em_agente
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_seleccion=create dw_seleccion
this.Control[]={this.st_porc,&
this.hpb_1,&
this.st_fondo,&
this.cb_limpiar,&
this.tab_1,&
this.cb_exportar,&
this.cb_imprimir,&
this.dw_fecha_cierre,&
this.st_promesa,&
this.pb_buscar,&
this.em_agente,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_seleccion}
end on

on w_sales_meeting.destroy
destroy(this.st_porc)
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.cb_limpiar)
destroy(this.tab_1)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.dw_fecha_cierre)
destroy(this.st_promesa)
destroy(this.pb_buscar)
destroy(this.em_agente)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_seleccion)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_nulo
connect using Trans_1;
connect using Trans_2;

Setnull(ls_nulo);Setnull(ll_nulo)
gf_centrar(w_sales_meeting)
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/01/1997'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)
tab_1.tabpage_1.dw_general.settransobject(sqlca)
tab_1.tabpage_2.dw_produccion.settransobject(sqlca)
tab_1.tabpage_3.dw_dotacion.settransobject(sqlca)
tab_1.tabpage_4.dw_productividad.settransobject(sqlca)
tab_1.tabpage_5.dw_morosidad.settransobject(sqlca)
st_promesa.enabled													= true
em_agente.enabled														= true
pb_buscar.enabled														= true

if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque														= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque														= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque														= 801
	end if
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.getchild('supervisor',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ll_parque,'')=0 then
		idw_detalle2.insertrow(0)
	end if
		dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'parque',ll_nulo)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	
	tab_1.tabpage_1.dw_general.reset()
	tab_1.tabpage_2.dw_produccion.reset()
	tab_1.tabpage_3.dw_dotacion.reset()
	tab_1.tabpage_4.dw_productividad.reset()
	tab_1.tabpage_5.dw_morosidad.reset()
	dw_seleccion.accepttext()
elseif gl_proceso=3 then
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
	INTO 		:ll_parque  
	FROM 		"JEFE_VENTAS"  
	WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect						= 1
		dw_seleccion.object.jefe.protect							= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,gs_user)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
	end if
	tab_1.tabpage_1.dw_general.reset()
	tab_1.tabpage_2.dw_produccion.reset()
	tab_1.tabpage_3.dw_dotacion.reset()
	tab_1.tabpage_4.dw_productividad.reset()
	tab_1.tabpage_5.dw_morosidad.reset()
	dw_seleccion.accepttext()
elseif gl_proceso=2 then
	SELECT	"SUPERVISOR"."COD_PARQUE",	"SUPERVISOR"."COD_JEFE"  
	INTO		:ll_parque,						:ls_jefe  
	FROM 		"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect						= 1
		dw_seleccion.object.jefe.protect							= 1
		dw_seleccion.object.supervisor.protect					= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
	end if
	tab_1.tabpage_1.dw_general.reset()
	tab_1.tabpage_2.dw_produccion.reset()
	tab_1.tabpage_3.dw_dotacion.reset()
	tab_1.tabpage_4.dw_productividad.reset()
	tab_1.tabpage_5.dw_morosidad.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia"," Usuario No autorizado")
	close(w_sales_meeting)
end if
end event

type st_porc from statictext within w_sales_meeting
boolean visible = false
integer x = 2007
integer y = 1132
integer width = 233
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_sales_meeting
boolean visible = false
integer x = 1431
integer y = 1204
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_sales_meeting
boolean visible = false
integer x = 1403
integer y = 1092
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_sales_meeting
integer x = 2158
integer y = 2008
integer width = 302
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;string	ls_nulo

Setnull(ls_nulo)
tab_1.tabpage_1.dw_general.reset()
tab_1.tabpage_2.dw_produccion.reset()
tab_1.tabpage_3.dw_dotacion.reset()
tab_1.tabpage_4.dw_productividad.reset()
tab_1.tabpage_5.dw_morosidad.reset()
dw_fecha_cierre.reset()
dw_fecha_cierre.insertrow(0)
w_sales_meeting.triggerevent(open!)
end event

type tab_1 from tab within w_sales_meeting
event create ( )
event destroy ( )
integer x = 41
integer y = 240
integer width = 4105
integer height = 1728
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

event selectionchanged;em_agente.text						= ''
if tab_1.selectedtab=1 then
	if tab_1.tabpage_1.dw_general.rowcount() > 0 then
		st_promesa.enabled		= true
		em_agente.enabled			= true
		pb_buscar.enabled			= true
	end if

elseif tab_1.selectedtab=2 then
	if tab_1.tabpage_2.dw_produccion.rowcount() > 0 then
		st_promesa.enabled		= true
		em_agente.enabled			= true
		pb_buscar.enabled			= true
	end if

elseif tab_1.selectedtab=3 then
	if tab_1.tabpage_3.dw_dotacion.rowcount() > 0 then 
		st_promesa.enabled		= false
		em_agente.enabled			= false
		pb_buscar.enabled			= false
	end if
elseif tab_1.selectedtab=4 then
	if tab_1.tabpage_4.dw_productividad.rowcount() > 0 then
		st_promesa.enabled		= true
		em_agente.enabled			= true
		pb_buscar.enabled			= true
	end if
elseif tab_1.selectedtab=5 then
	if tab_1.tabpage_5.dw_morosidad.rowcount() > 0 then
		st_promesa.enabled		= true
		em_agente.enabled			= true
		pb_buscar.enabled			= true
	end if
end if

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4069
integer height = 1600
long backcolor = 67108864
string text = "General"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_general dw_general
end type

on tabpage_1.create
this.dw_general=create dw_general
this.Control[]={this.dw_general}
end on

on tabpage_1.destroy
destroy(this.dw_general)
end on

type dw_general from datawindow within tabpage_1
integer y = 4
integer width = 4069
integer height = 1592
integer taborder = 20
string title = "none"
string dataobject = "dwe_sales_meeting"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4069
integer height = 1600
long backcolor = 67108864
string text = "Producción"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_produccion dw_produccion
end type

on tabpage_2.create
this.dw_produccion=create dw_produccion
this.Control[]={this.dw_produccion}
end on

on tabpage_2.destroy
destroy(this.dw_produccion)
end on

type dw_produccion from datawindow within tabpage_2
integer y = 4
integer width = 4069
integer height = 1592
integer taborder = 30
string title = "none"
string dataobject = "dwe_sales_meeting_produccion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4069
integer height = 1600
long backcolor = 67108864
string text = "Dotación"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_dotacion dw_dotacion
end type

on tabpage_3.create
this.dw_dotacion=create dw_dotacion
this.Control[]={this.dw_dotacion}
end on

on tabpage_3.destroy
destroy(this.dw_dotacion)
end on

type dw_dotacion from datawindow within tabpage_3
integer y = 4
integer width = 4069
integer height = 1592
integer taborder = 30
string title = "none"
string dataobject = "dwe_sales_meeting_dotacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if


end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4069
integer height = 1600
long backcolor = 67108864
string text = "Productividad"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_productividad dw_productividad
end type

on tabpage_4.create
this.dw_productividad=create dw_productividad
this.Control[]={this.dw_productividad}
end on

on tabpage_4.destroy
destroy(this.dw_productividad)
end on

type dw_productividad from datawindow within tabpage_4
integer y = 4
integer width = 4069
integer height = 1592
integer taborder = 30
string title = "none"
string dataobject = "dwe_sales_meeting_productividad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4069
integer height = 1600
long backcolor = 67108864
string text = "Morosidad"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_morosidad dw_morosidad
end type

on tabpage_5.create
this.dw_morosidad=create dw_morosidad
this.Control[]={this.dw_morosidad}
end on

on tabpage_5.destroy
destroy(this.dw_morosidad)
end on

type dw_morosidad from datawindow within tabpage_5
integer y = 4
integer width = 4069
integer height = 1592
integer taborder = 20
string title = "none"
string dataobject = "dwe_sales_meeting_morosidad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type cb_exportar from commandbutton within w_sales_meeting
integer x = 1851
integer y = 2008
integer width = 302
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
//if tab_1.selectedtab=1 then
	dw_paso	= tab_1.tabpage_1.dw_general
	if tab_1.tabpage_1.dw_general.rowcount() > 0 then f_DWToExcel( dw_paso )
//elseif tab_1.selectedtab=2 then
//	dw_paso	= tab_1.tabpage_2.dw_produccion
//	if tab_1.tabpage_2.dw_produccion.rowcount() > 0 then f_DWToExcel( dw_paso )
//elseif tab_1.selectedtab=3 then
//	dw_paso	= tab_1.tabpage_3.dw_dotacion
//	if tab_1.tabpage_3.dw_dotacion.rowcount() > 0 then f_DWToExcel( dw_paso )
//elseif tab_1.selectedtab=4 then
//	dw_paso	= tab_1.tabpage_4.dw_productividad
//	if tab_1.tabpage_4.dw_productividad.rowcount() > 0 then f_DWToExcel( dw_paso )
//elseif tab_1.selectedtab=5 then
//	dw_paso	= tab_1.tabpage_5.dw_morosidad
//	if tab_1.tabpage_5.dw_morosidad.rowcount() > 0 then f_DWToExcel( dw_paso )
//end if
end event

type cb_imprimir from commandbutton within w_sales_meeting
integer x = 41
integer y = 2008
integer width = 302
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if tab_1.selectedtab=1 then
	if tab_1.tabpage_1.dw_general.rowcount() > 0 then f_Print( tab_1.tabpage_1.dw_general )
elseif tab_1.selectedtab=2 then
	if tab_1.tabpage_2.dw_produccion.rowcount() > 0 then f_Print(tab_1.tabpage_2.dw_produccion)
elseif tab_1.selectedtab=3 then
	if tab_1.tabpage_3.dw_dotacion.rowcount() > 0 then f_Print(tab_1.tabpage_3.dw_dotacion)
elseif tab_1.selectedtab=4 then
	if tab_1.tabpage_4.dw_productividad.rowcount() > 0 then f_Print(tab_1.tabpage_4.dw_productividad)
elseif tab_1.selectedtab=5 then
	if tab_1.tabpage_5.dw_morosidad.rowcount() > 0 then f_Print(tab_1.tabpage_5.dw_morosidad)
end if
end event

type dw_fecha_cierre from datawindow within w_sales_meeting
integer x = 32
integer y = 124
integer width = 837
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//this.accepttext()
//messagebox("Inicial - final", string(this.getitemdatetime(1,'cierre_ventas_1'),'dd/mm/yyyy')+'  /  '+string(this.getitemdatetime(1,'cierre_ventas'),'dd/mm/yyyy'))
tab_1.tabpage_1.dw_general.reset()
tab_1.tabpage_2.dw_produccion.reset()
tab_1.tabpage_3.dw_dotacion.reset()
tab_1.tabpage_4.dw_productividad.reset()
tab_1.tabpage_5.dw_morosidad.reset()

end event

type st_promesa from statictext within w_sales_meeting
integer x = 2885
integer y = 2012
integer width = 389
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Agente"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_sales_meeting
integer x = 3643
integer y = 2000
integer width = 101
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
string disabledname = "LUPA_no.bmp"
end type

event clicked;long		ll_tot_reg,ll_fila
string	ls_string,ls_age

ls_age						= trim(em_agente.text)
ll_tot_reg					= tab_1.tabpage_1.dw_general.rowcount()


if tab_1.tabpage_1.dw_general.rowcount() > 0 and not isnull(ls_age) then
	ls_string				= "cod_age = '"+ls_age+"'"
	ll_fila 					= tab_1.tabpage_1.dw_general.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		tab_1.tabpage_1.dw_general.scrolltorow(ll_fila)
		tab_1.tabpage_2.dw_produccion.scrolltorow(ll_fila)
		tab_1.tabpage_4.dw_productividad.scrolltorow(ll_fila)
		tab_1.tabpage_5.dw_morosidad.scrolltorow(ll_fila)
		
		tab_1.tabpage_1.dw_general.SelectRow(0, false)
		tab_1.tabpage_2.dw_produccion.SelectRow(0, false)
		tab_1.tabpage_4.dw_productividad.SelectRow(0, false)
		tab_1.tabpage_5.dw_morosidad.SelectRow(0, false)
		
		tab_1.tabpage_1.dw_general.SelectRow(ll_fila, true)
		tab_1.tabpage_2.dw_produccion.SelectRow(ll_fila, true)
		tab_1.tabpage_4.dw_productividad.SelectRow(ll_fila, true)
		tab_1.tabpage_5.dw_morosidad.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","No Existe Agente en la Lista")
		tab_1.tabpage_1.dw_general.scrolltorow(1)
		tab_1.tabpage_2.dw_produccion.scrolltorow(1)
		tab_1.tabpage_4.dw_productividad.scrolltorow(1)
		tab_1.tabpage_5.dw_morosidad.scrolltorow(1)
	end if
end if
end event

type em_agente from editmask within w_sales_meeting
integer x = 3296
integer y = 2000
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;if string(em_agente.text)<>'' then pb_buscar.triggerevent(clicked!)
end event

type pb_aceptar from picturebutton within w_sales_meeting
integer x = 2391
integer y = 96
integer width = 133
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_cod_jefe,ls_cod_superv,ls_cod_age,ls_nombre_agte,ls_a_paterno_agte,ls_a_materno_agte,ls_nombre
long		ll_cod_parque,ll_contra_mes_3,ll_desvin_mes_3,ll_contra_mes_2,ll_desvin_mes_2,ll_contra_mes_1,ll_desvin_mes_1,ll_new,&
			ll_cuenta_prom_mes_3,ll_cuenta_prom_mes_2,ll_cuenta_prom_mes_1,ll_suma_trime_vtas,ll_dota_mes_3,ll_suma_3,ll_lice_3,&
			ll_dias_3,ll_suma_vaca_3,ll_dota_mes_2,ll_suma_2,ll_lice_2,ll_dias_2,ll_suma_vaca_2,ll_dota_mes_1,ll_suma_1,ll_lice_1,&
			ll_dias_1,ll_suma_vaca_1,ll_cuenta_prom_mes,ll_cuenta_mora_3,ll_cuenta_prom_mes_6,ll_cuenta_mora_6,ll_cuenta_prom_mes_12,&
			ll_cuenta_mora_12,ll_tot_porc,ll_tot_porc_aux,ll_cuenta,ll_tot_reg
datetime	ldt_fecha_cierre,ldt_fecha_ini_3,ldt_fecha_fin_3,ldt_fecha_3,ldt_fecha_2,ldt_fecha_ini_2,ldt_fecha_fin_2,ldt_fecha_1,&
			ldt_fecha_ini_1,ldt_fecha_fin_1,ldt_fecha_4,ldt_fecha_ini_4,ldt_fecha_fin_4,ldt_fecha_5,ldt_fecha_ini_5,ldt_fecha_fin_5,&
			ldt_fecha_6,ldt_fecha_ini_6,ldt_fecha_fin_6,ldt_fecha_7,ldt_fecha_ini_7,ldt_fecha_fin_7,ldt_fecha_8,ldt_fecha_ini_8,&
			ldt_fecha_fin_8,ldt_fecha_9,ldt_fecha_ini_9,ldt_fecha_fin_9,ldt_fecha_10,ldt_fecha_ini_10,ldt_fecha_fin_10,ldt_fecha_11,&
			ldt_fecha_ini_11,ldt_fecha_fin_11,ldt_fecha_12,ldt_fecha_ini_12,ldt_fecha_fin_12,ldt_fecha_inicio,ldt_fecha_termino
double	ldb_valor_uf_mes_3,ldb_uf_prom_acu_mes_3,ldb_valor_uf_mes_2,ldb_uf_prom_acu_mes_2,ldb_valor_uf_mes_1,ldb_uf_prom_acu_mes_1,&
			ldb_suma_trime_uf,ldb_porce_mora_3,ldb_porce_mora_6,ldb_porce_mora_12
			
tab_1.tabpage_1.dw_general.reset()
tab_1.tabpage_2.dw_produccion.reset()
tab_1.tabpage_3.dw_dotacion.reset()
tab_1.tabpage_4.dw_productividad.reset()
tab_1.tabpage_5.dw_morosidad.reset()
dw_seleccion.accepttext()
dw_fecha_cierre.accepttext()
ll_cod_parque														= dw_seleccion.getitemnumber(1,'parque')
ls_cod_jefe															= dw_seleccion.getitemstring(1,'jefe')
ls_cod_superv														= dw_seleccion.getitemstring(1,'supervisor')
ldt_fecha_cierre													= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
tab_1.tabpage_1.dw_general.object.usuario.text			= gs_user
tab_1.tabpage_2.dw_produccion.object.usuario.text		= gs_user
tab_1.tabpage_3.dw_dotacion.object.usuario.text			= gs_user
tab_1.tabpage_4.dw_productividad.object.usuario.text	= gs_user
tab_1.tabpage_5.dw_morosidad.object.usuario.text		= gs_user

if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_cod_jefe) and ls_cod_jefe<>'' and not isnull(ls_cod_superv) and ls_cod_superv<>'' and not isnull(ldt_fecha_cierre) then
	SetPointer(HourGlass!)
	st_fondo.visible				= true
	hpb_1.visible 					= true
	st_porc.visible 				= true
	ll_tot_porc						= 0
	ll_tot_porc_aux				= 0			
	hpb_1.Position					= ll_tot_porc
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_3,		:ldt_fecha_fin_3  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ldt_fecha_3																				= ldt_fecha_cierre
		if not isnull(ldt_fecha_fin_3) then
			tab_1.tabpage_1.dw_general.object.mes_3.text							= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.mes_3.text						= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.mes_3.text							= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.mes_3.text					= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.mes_3.text						= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_1.dw_general.object.dotacion_mes_3.text				= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.dotacion_mes_3.text			= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.dotacion_mes_3.text				= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.dotacion_mes_3.text		= string(ldt_fecha_3,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.dotacion_mes_3.text			= string(ldt_fecha_3,'dd/mm/yyyy')
		end if
		SELECT	COUNT("AGENTES"."COD_AGE") 
		INTO		:ll_contra_mes_3  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."FECHA_INI" >= :ldt_fecha_ini_3 ) AND  
					( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin_3 ) AND
					( "AGENTES"."COD_SUP" = :ls_cod_superv)
		USING		Trans_1;
		if Trans_1.sqlcode=0 then
			if not isnull(ll_contra_mes_3) then
				tab_1.tabpage_1.dw_general.object.contrata_mes_3.text			= string(ll_contra_mes_3)
				tab_1.tabpage_2.dw_produccion.object.contrata_mes_3.text		= string(ll_contra_mes_3)
				tab_1.tabpage_3.dw_dotacion.object.contrata_mes_3.text		= string(ll_contra_mes_3)
				tab_1.tabpage_4.dw_productividad.object.contrata_mes_3.text	= string(ll_contra_mes_3)
				tab_1.tabpage_5.dw_morosidad.object.contrata_mes_3.text		= string(ll_contra_mes_3)
			end if
		end if
		SELECT	COUNT("AGENTES"."COD_AGE") 
		INTO		:ll_desvin_mes_3  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini_3 ) AND  
					( "AGENTES"."FECHA_FIN" <= :ldt_fecha_fin_3 ) AND
					( "AGENTES"."COD_SUP" = :ls_cod_superv)
		USING		Trans_1;
		if Trans_1.sqlcode=0 then
			if not isnull(ll_desvin_mes_3) then
				tab_1.tabpage_1.dw_general.object.desvin_mes_3.text			= string(ll_desvin_mes_3)
				tab_1.tabpage_2.dw_produccion.object.desvin_mes_3.text		= string(ll_desvin_mes_3)
				tab_1.tabpage_3.dw_dotacion.object.desvin_mes_3.text			= string(ll_desvin_mes_3)
				tab_1.tabpage_4.dw_productividad.object.desvin_mes_3.text	= string(ll_desvin_mes_3)
				tab_1.tabpage_5.dw_morosidad.object.desvin_mes_3.text			= string(ll_desvin_mes_3)
			end if
		end if
	end if
	ldt_fecha_2																				= datetime(RelativeDate(date(ldt_fecha_ini_3), - 1))
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_2,		:ldt_fecha_fin_2  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_2
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_2) then
			tab_1.tabpage_1.dw_general.object.mes_2.text							= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.mes_2.text						= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.mes_2.text						= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.mes_2.text					= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.mes_2.text						= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_1.dw_general.object.dotacion_mes_2.text				= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.dotacion_mes_2.text			= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.dotacion_mes_2.text			= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.dotacion_mes_2.text		= string(ldt_fecha_2,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.dotacion_mes_2.text			= string(ldt_fecha_2,'dd/mm/yyyy')
		end if
		SELECT	COUNT("AGENTES"."COD_AGE") 
		INTO		:ll_contra_mes_2  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."FECHA_INI" >= :ldt_fecha_ini_2 ) AND  
					( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin_2 ) AND
					( "AGENTES"."COD_SUP" = :ls_cod_superv)
		USING		Trans_1;
		if Trans_1.sqlcode=0 then
			if not isnull(ll_contra_mes_2) then
				tab_1.tabpage_1.dw_general.object.contrata_mes_2.text			= string(ll_contra_mes_2)
				tab_1.tabpage_2.dw_produccion.object.contrata_mes_2.text		= string(ll_contra_mes_2)
				tab_1.tabpage_3.dw_dotacion.object.contrata_mes_2.text		= string(ll_contra_mes_2)
				tab_1.tabpage_4.dw_productividad.object.contrata_mes_2.text	= string(ll_contra_mes_2)
				tab_1.tabpage_5.dw_morosidad.object.contrata_mes_2.text		= string(ll_contra_mes_2)
			end if
		end if
		SELECT	COUNT("AGENTES"."COD_AGE") 
		INTO		:ll_desvin_mes_2  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini_2 ) AND  
					( "AGENTES"."FECHA_FIN" <= :ldt_fecha_fin_2 ) AND
					( "AGENTES"."COD_SUP" = :ls_cod_superv)
		USING		Trans_1;
		if Trans_1.sqlcode=0 then
			if not isnull(ll_desvin_mes_2) then
				tab_1.tabpage_1.dw_general.object.desvin_mes_2.text			= string(ll_desvin_mes_2)
				tab_1.tabpage_2.dw_produccion.object.desvin_mes_2.text		= string(ll_desvin_mes_2)
				tab_1.tabpage_3.dw_dotacion.object.desvin_mes_2.text			= string(ll_desvin_mes_2)
				tab_1.tabpage_4.dw_productividad.object.desvin_mes_2.text	= string(ll_desvin_mes_2)
				tab_1.tabpage_5.dw_morosidad.object.desvin_mes_2.text			= string(ll_desvin_mes_2)
			end if
		end if
	end if
	ldt_fecha_1																				= datetime(RelativeDate(date(ldt_fecha_ini_2), - 1))
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_1,		:ldt_fecha_fin_1  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_1
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_1) then
			tab_1.tabpage_1.dw_general.object.mes_1.text							= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.mes_1.text						= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.mes_1.text						= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.mes_1.text					= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.mes_1.text						= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_1.dw_general.object.dotacion_mes_1.text				= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.dotacion_mes_1.text			= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.dotacion_mes_1.text			= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.dotacion_mes_1.text		= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.dotacion_mes_1.text			= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_1.dw_general.object.mora_1_t.text						= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.mora_1_t.text					= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.mora_1_t.text					= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.mora_1_t.text				= string(ldt_fecha_1,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.mora_1_t.text					= string(ldt_fecha_1,'dd/mm/yyyy')
		end if
		SELECT	COUNT("AGENTES"."COD_AGE")
		INTO		:ll_tot_reg
		FROM		"AGENTES",	"JEFE_VENTAS",	"SUPERVISOR"  
		WHERE		( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
					( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
					( ( "JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe ) AND  
					( "AGENTES"."COD_SUP" = :ls_cod_superv ) AND  
					( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini_1 ) AND  
					( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin_3 ) )
		USING		sqlca ;
		if sqlca.sqlcode=0 then
			if not isnull(ll_tot_reg) then
			end if
		end if
		SELECT	COUNT("AGENTES"."COD_AGE") 
		INTO		:ll_contra_mes_1  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."FECHA_INI" >= :ldt_fecha_ini_1 ) AND  
					( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin_1 ) AND
					( "AGENTES"."COD_SUP" = :ls_cod_superv)
		USING		Trans_1;
		if Trans_1.sqlcode=0 then
			if not isnull(ll_contra_mes_1) then
				tab_1.tabpage_1.dw_general.object.contrata_mes_1.text			= string(ll_contra_mes_1)
				tab_1.tabpage_2.dw_produccion.object.contrata_mes_1.text		= string(ll_contra_mes_1)
				tab_1.tabpage_3.dw_dotacion.object.contrata_mes_1.text		= string(ll_contra_mes_1)
				tab_1.tabpage_4.dw_productividad.object.contrata_mes_1.text	= string(ll_contra_mes_1)
				tab_1.tabpage_5.dw_morosidad.object.contrata_mes_1.text		= string(ll_contra_mes_1)
			end if
		end if
		SELECT	COUNT("AGENTES"."COD_AGE") 
		INTO		:ll_desvin_mes_1  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini_1 ) AND  
					( "AGENTES"."FECHA_FIN" <= :ldt_fecha_fin_1 ) AND
					( "AGENTES"."COD_SUP" = :ls_cod_superv)
		USING		Trans_1;
		if Trans_1.sqlcode=0 then
			if not isnull(ll_desvin_mes_1) then
				tab_1.tabpage_1.dw_general.object.desvin_mes_1.text			= string(ll_desvin_mes_1)
				tab_1.tabpage_2.dw_produccion.object.desvin_mes_1.text		= string(ll_desvin_mes_1)
				tab_1.tabpage_3.dw_dotacion.object.desvin_mes_1.text			= string(ll_desvin_mes_1)
				tab_1.tabpage_4.dw_productividad.object.desvin_mes_1.text	= string(ll_desvin_mes_1)
				tab_1.tabpage_5.dw_morosidad.object.desvin_mes_1.text			= string(ll_desvin_mes_1)
			end if
		end if
	end if
	ldt_fecha_4																				= datetime(RelativeDate(date(ldt_fecha_ini_1), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_4,		:ldt_fecha_fin_4  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_4
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_4) then
		end if
	end if
	ldt_fecha_5																				= datetime(RelativeDate(date(ldt_fecha_ini_4), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_5,		:ldt_fecha_fin_5  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_5
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_5) then
		end if
	end if
	ldt_fecha_6																				= datetime(RelativeDate(date(ldt_fecha_ini_5), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_6,		:ldt_fecha_fin_6  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_6
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_6) then
			tab_1.tabpage_1.dw_general.object.mora_6_t.text						= string(ldt_fecha_6,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.mora_6_t.text					= string(ldt_fecha_6,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.mora_6_t.text					= string(ldt_fecha_6,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.mora_6_t.text				= string(ldt_fecha_6,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.mora_6_t.text					= string(ldt_fecha_6,'dd/mm/yyyy')
		end if
	end if
	ldt_fecha_7																				= datetime(RelativeDate(date(ldt_fecha_ini_6), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_7,		:ldt_fecha_fin_7  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_7
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_7) then
		end if
	end if
	ldt_fecha_8																				= datetime(RelativeDate(date(ldt_fecha_ini_7), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_8,		:ldt_fecha_fin_8  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_8
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_8) then
		end if
	end if
	ldt_fecha_9																				= datetime(RelativeDate(date(ldt_fecha_ini_8), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_9,		:ldt_fecha_fin_9  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_9
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_9) then
		end if
	end if
	ldt_fecha_10																			= datetime(RelativeDate(date(ldt_fecha_ini_9), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_10,	:ldt_fecha_fin_10  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_10
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_10) then
		end if
	end if
	ldt_fecha_11																			= datetime(RelativeDate(date(ldt_fecha_ini_10), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_11,	:ldt_fecha_fin_11  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_11
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_11) then
		end if
	end if
	ldt_fecha_12																			= datetime(RelativeDate(date(ldt_fecha_ini_11), - 1))	
	SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
	INTO		:ldt_fecha_ini_12,	:ldt_fecha_fin_12  
	FROM		"CIERRE_VENTA"  
	WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_12
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha_fin_12) then
			tab_1.tabpage_1.dw_general.object.mora_12_t.text					= string(ldt_fecha_12,'dd/mm/yyyy')
			tab_1.tabpage_2.dw_produccion.object.mora_12_t.text				= string(ldt_fecha_12,'dd/mm/yyyy')
			tab_1.tabpage_3.dw_dotacion.object.mora_12_t.text					= string(ldt_fecha_12,'dd/mm/yyyy')
			tab_1.tabpage_4.dw_productividad.object.mora_12_t.text			= string(ldt_fecha_12,'dd/mm/yyyy')
			tab_1.tabpage_5.dw_morosidad.object.mora_12_t.text					= string(ldt_fecha_12,'dd/mm/yyyy')
		end if
	end if
	DECLARE xage CURSOR FOR
	SELECT	"AGENTES"."COD_AGE",	"AGENTES"."FECHA_INI",	"AGENTES"."FECHA_FIN",	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO"   
	FROM		"AGENTES",	"JEFE_VENTAS",	"SUPERVISOR"  
	WHERE		( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
				( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
				( ( "JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_jefe ) AND  
				( "AGENTES"."COD_SUP" = :ls_cod_superv ) AND  
				( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini_1 ) AND  
				( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin_3 ) )
	USING		sqlca ;
	open xage;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				fetch xage INTO	:ls_cod_age,	:ldt_fecha_inicio,	:ldt_fecha_termino,	:ls_nombre_agte,	:ls_a_paterno_agte,	:ls_a_materno_agte;
					if not isnull(ls_cod_age) and ls_cod_age<>'' then
						ll_new																= tab_1.tabpage_1.dw_general.insertrow(0)
						tab_1.tabpage_1.dw_general.scrolltorow(ll_new)
						tab_1.tabpage_1.dw_general.setitem(ll_new,'cod_age',ls_cod_age)
						tab_1.tabpage_1.dw_general.setitem(ll_new,'cod_sup',ls_cod_superv)
						tab_1.tabpage_1.dw_general.setitem(ll_new,'cod_jefe',ls_cod_jefe)
						tab_1.tabpage_1.dw_general.setitem(ll_new,'cod_parque',ll_cod_parque)
						tab_1.tabpage_1.dw_general.setitem(ll_new,'fecha_ini',ldt_fecha_inicio)
						tab_1.tabpage_1.dw_general.setitem(ll_new,'fecha_fin',ldt_fecha_termino)
						ll_new																= tab_1.tabpage_2.dw_produccion.insertrow(0)
						tab_1.tabpage_2.dw_produccion.scrolltorow(ll_new)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,'cod_age',ls_cod_age)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,'cod_sup',ls_cod_superv)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,'cod_jefe',ls_cod_jefe)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,'cod_parque',ll_cod_parque)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,'fecha_ini',ldt_fecha_inicio)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,'fecha_fin',ldt_fecha_termino)
						ll_new																= tab_1.tabpage_3.dw_dotacion.insertrow(0)
						tab_1.tabpage_3.dw_dotacion.scrolltorow(ll_new)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,'cod_age',ls_cod_age)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,'cod_sup',ls_cod_superv)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,'cod_jefe',ls_cod_jefe)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,'cod_parque',ll_cod_parque)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,'fecha_ini',ldt_fecha_inicio)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,'fecha_fin',ldt_fecha_termino)
						ll_new																= tab_1.tabpage_4.dw_productividad.insertrow(0)
						tab_1.tabpage_4.dw_productividad.scrolltorow(ll_new)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,'cod_age',ls_cod_age)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,'cod_sup',ls_cod_superv)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,'cod_jefe',ls_cod_jefe)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,'cod_parque',ll_cod_parque)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,'fecha_ini',ldt_fecha_inicio)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,'fecha_fin',ldt_fecha_termino)
						ll_new																= tab_1.tabpage_5.dw_morosidad.insertrow(0)
						tab_1.tabpage_5.dw_morosidad.scrolltorow(ll_new)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,'cod_age',ls_cod_age)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,'cod_sup', ls_cod_superv)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,'cod_jefe', ls_cod_jefe)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,'cod_parque', ll_cod_parque)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,'fecha_ini',ldt_fecha_inicio)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,'fecha_fin',ldt_fecha_termino)
						ls_nombre	= ls_nombre_agte+' '+ls_a_paterno_agte+' '+ls_a_materno_agte
						tab_1.tabpage_1.dw_general.setitem(ll_new,'nombre_agte',ls_nombre)
						SELECT	"TAB_UF"."VALOR_UF"  
						INTO 		:ldb_valor_uf_mes_3  
						FROM		"TAB_UF"  
						WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha_3
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ldb_valor_uf_mes_3) or ldb_valor_uf_mes_3>0 then
/*cta_prom*_3*/			ll_cuenta_prom_mes_3	 									= f_cta_promesa_cierre(ls_cod_age,ldt_fecha_3)								
/*producc_3*/				ldb_uf_prom_acu_mes_3 									= f_produc_agte_cierre(ls_cod_age,ldt_fecha_3)									
								tab_1.tabpage_1.dw_general.setitem(ll_new,"ventas_3",ll_cuenta_prom_mes_3)
								tab_1.tabpage_2.dw_produccion.setitem(ll_new,"ventas_3",ll_cuenta_prom_mes_3)
								tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"ventas_3",ll_cuenta_prom_mes_3)
								tab_1.tabpage_4.dw_productividad.setitem(ll_new,"ventas_3",ll_cuenta_prom_mes_3)
								tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"ventas_3",ll_cuenta_prom_mes_3)
								tab_1.tabpage_1.dw_general.setitem(ll_new,"uf_3",ldb_uf_prom_acu_mes_3)
								tab_1.tabpage_2.dw_produccion.setitem(ll_new,"uf_3",ldb_uf_prom_acu_mes_3)
								tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"uf_3",ldb_uf_prom_acu_mes_3)
								tab_1.tabpage_4.dw_productividad.setitem(ll_new,"uf_3",ldb_uf_prom_acu_mes_3)
								tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"uf_3",ldb_uf_prom_acu_mes_3)
							end if
						else
							messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fecha_3,"dd/mm/yyyy"))
						end if
						SELECT	"TAB_UF"."VALOR_UF"  
						INTO 		:ldb_valor_uf_mes_2  
						FROM		"TAB_UF"  
						WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha_2
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ldb_valor_uf_mes_2) or ldb_valor_uf_mes_2>0 then
/*cta_prom*_2*/			ll_cuenta_prom_mes_2	 									= f_cta_promesa_cierre(ls_cod_age,ldt_fecha_2)								
/*producc_2*/				ldb_uf_prom_acu_mes_2 									= f_produc_agte_cierre(ls_cod_age,ldt_fecha_2)	
								tab_1.tabpage_1.dw_general.setitem(ll_new,"ventas_2",ll_cuenta_prom_mes_2)
								tab_1.tabpage_2.dw_produccion.setitem(ll_new,"ventas_2",ll_cuenta_prom_mes_2)
								tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"ventas_2",ll_cuenta_prom_mes_2)
								tab_1.tabpage_4.dw_productividad.setitem(ll_new,"ventas_2",ll_cuenta_prom_mes_2)
								tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"ventas_2",ll_cuenta_prom_mes_2)
								tab_1.tabpage_1.dw_general.setitem(ll_new,"uf_2",ldb_uf_prom_acu_mes_2)
								tab_1.tabpage_2.dw_produccion.setitem(ll_new,"uf_2",ldb_uf_prom_acu_mes_2)
								tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"uf_2",ldb_uf_prom_acu_mes_2)
								tab_1.tabpage_4.dw_productividad.setitem(ll_new,"uf_2",ldb_uf_prom_acu_mes_2)
								tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"uf_2",ldb_uf_prom_acu_mes_2)
							end if
						else
							messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fecha_2,"dd/mm/yyyy"))
						end if
						SELECT	"TAB_UF"."VALOR_UF"  
						INTO 		:ldb_valor_uf_mes_1  
						FROM		"TAB_UF"  
						WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha_1
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ldb_valor_uf_mes_1) or ldb_valor_uf_mes_1>0 then
/*cta_prom*_1*/			ll_cuenta_prom_mes_1	 									= f_cta_promesa_cierre(ls_cod_age,ldt_fecha_1)								
/*producc_1*/				ldb_uf_prom_acu_mes_1 									= f_produc_agte_cierre(ls_cod_age,ldt_fecha_1)	
								tab_1.tabpage_1.dw_general.setitem(ll_new,"ventas_1",ll_cuenta_prom_mes_1)
								tab_1.tabpage_2.dw_produccion.setitem(ll_new,"ventas_1",ll_cuenta_prom_mes_1)
								tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"ventas_1",ll_cuenta_prom_mes_1)
								tab_1.tabpage_4.dw_productividad.setitem(ll_new,"ventas_1",ll_cuenta_prom_mes_1)
								tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"ventas_1",ll_cuenta_prom_mes_1)
								tab_1.tabpage_1.dw_general.setitem(ll_new,"uf_1",ldb_uf_prom_acu_mes_1)
								tab_1.tabpage_2.dw_produccion.setitem(ll_new,"uf_1",ldb_uf_prom_acu_mes_1)
								tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"uf_1",ldb_uf_prom_acu_mes_1)
								tab_1.tabpage_4.dw_productividad.setitem(ll_new,"uf_1",ldb_uf_prom_acu_mes_1)
								tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"uf_1",ldb_uf_prom_acu_mes_1)
							end if
						else
							messagebox("Advertencia","No Existe Valor U.F. del :"+string(ldt_fecha_1,"dd/mm/yyyy"))
						end if
						ll_suma_trime_vtas												= ll_cuenta_prom_mes_1 + ll_cuenta_prom_mes_2 + ll_cuenta_prom_mes_3
						ldb_suma_trime_uf													= round( (ldb_uf_prom_acu_mes_1 + ldb_uf_prom_acu_mes_2 + ldb_uf_prom_acu_mes_3),2)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"total_ventas",ll_suma_trime_vtas)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"total_ventas",ll_suma_trime_vtas)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"total_ventas",ll_suma_trime_vtas)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"total_ventas",ll_suma_trime_vtas)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"total_ventas",ll_suma_trime_vtas)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"total_uf",ldb_suma_trime_uf)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"total_uf",ldb_suma_trime_uf)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"total_uf",ldb_suma_trime_uf)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"total_uf",ldb_suma_trime_uf)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"total_uf",ldb_suma_trime_uf)
						SELECT	"AGENTES"."COD_AGE" 
						INTO		:ll_dota_mes_3  
						FROM		"AGENTES"  
						WHERE 	( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini_3 ) AND  
									( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin_3 ) AND
									( "AGENTES"."COD_AGE" = :ls_cod_age)
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_dota_mes_3) or ll_dota_mes_3>0 then
								ll_dota_mes_3  = 1
							else
								ll_dota_mes_3  = 0
							end if
						else
							ll_dota_mes_3  = 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"dota_mes_3",ll_dota_mes_3)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"dota_mes_3",ll_dota_mes_3)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"dota_mes_3",ll_dota_mes_3)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"dota_mes_3",ll_dota_mes_3)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"dota_mes_3",ll_dota_mes_3)
						SELECT	SUM("LICENCIAS"."NRO_DIAS")
						INTO		:ll_suma_3
						FROM		"AGENTES",	"LICENCIAS"  
						WHERE		( "AGENTES"."RUT" = "LICENCIAS"."RUT_EMPLEADO" ) and  
									( "AGENTES"."COD_AGE" = "LICENCIAS"."CODIGO_EMPLEADO" ) and  
									( ( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
									( "LICENCIAS"."FECHA_INICIO_LICENCIA" >= :ldt_fecha_ini_3 ) AND
									( "LICENCIAS"."FECHA_INICIO_LICENCIA" <= :ldt_fecha_fin_3 ))
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_suma_3) or ll_suma_3>0 then
								ll_lice_3  												= 1
								ll_dias_3  												= ll_suma_3
							else
								ll_lice_3  												= 0
								ll_dias_3  												= 0
							end if
						else
							ll_lice_3  													= 0
							ll_dias_3  													= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"lice_mes_3",ll_lice_3)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"lice_mes_3",ll_lice_3)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"lice_mes_3",ll_lice_3)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"lice_mes_3",ll_lice_3)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"lice_mes_3",ll_lice_3)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"n_dias_3",ll_dias_3)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"n_dias_3",ll_dias_3)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"n_dias_3",ll_dias_3)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"n_dias_3",ll_dias_3)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"n_dias_3",ll_dias_3)
						SELECT	SUM("VACACIONES"."NUMERO_DIAS")
						INTO		:ll_suma_vaca_3
						FROM		"AGENTES",	"VACACIONES"  
						WHERE		( "AGENTES"."RUT" = "VACACIONES"."RUT" ) and  
									( "AGENTES"."COD_AGE" = "VACACIONES"."COD_AGE" ) and  
									( ( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
									( "VACACIONES"."FECHA_INI" >= :ldt_fecha_ini_3 ) AND
									( "VACACIONES"."FECHA_INI" <= :ldt_fecha_fin_3 ) )
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_suma_vaca_3) or ll_suma_vaca_3>0 then
								ll_suma_vaca_3  										= 1
							else
								ll_suma_vaca_3  										= 0
							end if
						else
							ll_suma_vaca_3  											= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"vaca_mes_3",ll_suma_vaca_3)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"vaca_mes_3",ll_suma_vaca_3)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"vaca_mes_3",ll_suma_vaca_3)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"vaca_mes_3",ll_suma_vaca_3)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"vaca_mes_3",ll_suma_vaca_3)
						SELECT	"AGENTES"."COD_AGE" 
						INTO		:ll_dota_mes_2  
						FROM		"AGENTES"  
						WHERE 	( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini_2 ) AND  
									( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin_2 ) AND
									( "AGENTES"."COD_AGE" = :ls_cod_age)
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_dota_mes_2) or ll_dota_mes_2>0 then
								ll_dota_mes_2  										= 1
							else
								ll_dota_mes_2 											= 0
							end if
						else
							ll_dota_mes_2  = 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"dota_mes_2",ll_dota_mes_2)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"dota_mes_2",ll_dota_mes_2)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"dota_mes_2",ll_dota_mes_2)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"dota_mes_2",ll_dota_mes_2)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"dota_mes_2",ll_dota_mes_2)
						SELECT	SUM("LICENCIAS"."NRO_DIAS")
						INTO		:ll_suma_2
						FROM		"AGENTES",	"LICENCIAS"  
						WHERE		( "AGENTES"."RUT" = "LICENCIAS"."RUT_EMPLEADO" ) and  
									( "AGENTES"."COD_AGE" = "LICENCIAS"."CODIGO_EMPLEADO" ) and  
									( ( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
									( "LICENCIAS"."FECHA_INICIO_LICENCIA" >= :ldt_fecha_ini_2 ) AND 
									( "LICENCIAS"."FECHA_INICIO_LICENCIA" <= :ldt_fecha_fin_2 ) )
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_suma_2) or ll_suma_2>0 then
								ll_lice_2  												= 1
								ll_dias_2  												= ll_suma_2
							else
								ll_lice_2  												= 0
								ll_dias_2  												= 0
							end if
						else
							ll_lice_2  													= 0
							ll_dias_2  													= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"lice_mes_2",ll_lice_2)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"lice_mes_2",ll_lice_2)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"lice_mes_2",ll_lice_2)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"lice_mes_2",ll_lice_2)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"lice_mes_2",ll_lice_2)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"n_dias_2",ll_dias_2)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"n_dias_2",ll_dias_2)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"n_dias_2",ll_dias_2)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"n_dias_2",ll_dias_2)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"n_dias_2",ll_dias_2)
						SELECT	SUM("VACACIONES"."NUMERO_DIAS")
						INTO		:ll_suma_vaca_2
						FROM		"AGENTES",	"VACACIONES"  
						WHERE		( "AGENTES"."RUT" = "VACACIONES"."RUT" ) and  
									( "AGENTES"."COD_AGE" = "VACACIONES"."COD_AGE" ) and  
									( ( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
									( "VACACIONES"."FECHA_INI" >= :ldt_fecha_ini_2 ) AND 
									( "VACACIONES"."FECHA_INI" <= :ldt_fecha_fin_2 ))
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_suma_vaca_2) or ll_suma_vaca_2>0 then
								ll_suma_vaca_2  										= 1
							else
								ll_suma_vaca_2  										= 0
							end if
						else
							ll_suma_vaca_2  											= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"vaca_mes_2",ll_suma_vaca_2)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"vaca_mes_2",ll_suma_vaca_2)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"vaca_mes_2",ll_suma_vaca_2)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"vaca_mes_2",ll_suma_vaca_2)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"vaca_mes_2",ll_suma_vaca_2)
						SELECT	"AGENTES"."COD_AGE" 
						INTO		:ll_dota_mes_1  
						FROM		"AGENTES"  
						WHERE 	( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini_1 ) AND  
									( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin_1 ) AND
									( "AGENTES"."COD_AGE" = :ls_cod_age)
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_dota_mes_1) or ll_dota_mes_1>0 then
								ll_dota_mes_1  										= 1
							else
								ll_dota_mes_1  										= 0
							end if
						else
							ll_dota_mes_1  											= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"dota_mes_1",ll_dota_mes_1)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"dota_mes_1",ll_dota_mes_1)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"dota_mes_1",ll_dota_mes_1)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"dota_mes_1",ll_dota_mes_1)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"dota_mes_1",ll_dota_mes_1)
						SELECT	SUM("LICENCIAS"."NRO_DIAS")
						INTO		:ll_suma_1
						FROM		"AGENTES",	"LICENCIAS"  
						WHERE		( "AGENTES"."RUT" = "LICENCIAS"."RUT_EMPLEADO" ) and  
									( "AGENTES"."COD_AGE" = "LICENCIAS"."CODIGO_EMPLEADO" ) and  
									( ( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
									( "LICENCIAS"."FECHA_INICIO_LICENCIA" >= :ldt_fecha_ini_1 ) AND
									( "LICENCIAS"."FECHA_INICIO_LICENCIA" <= :ldt_fecha_fin_1 ))
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_suma_1) or ll_suma_1>0 then
								ll_lice_1  												= 1
								ll_dias_1  												= ll_suma_1
							else
								ll_lice_1  												= 0
								ll_dias_1  												= 0
							end if
						else
							ll_lice_1  													= 0
							ll_dias_1  													= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"lice_mes_1",ll_lice_1)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"lice_mes_1",ll_lice_1)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"lice_mes_1",ll_lice_1)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"lice_mes_1",ll_lice_1)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"lice_mes_1",ll_lice_1)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"n_dias_1",ll_dias_1)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"n_dias_1",ll_dias_1)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"n_dias_1",ll_dias_1)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"n_dias_1",ll_dias_1)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"n_dias_1",ll_dias_1)
						SELECT	SUM("VACACIONES"."NUMERO_DIAS")
						INTO		:ll_suma_vaca_1
						FROM		"AGENTES",	"VACACIONES"  
						WHERE		( "AGENTES"."RUT" = "VACACIONES"."RUT" ) and  
									( "AGENTES"."COD_AGE" = "VACACIONES"."COD_AGE" ) and  
									( ( "AGENTES"."COD_AGE" = :ls_cod_age ) AND  
									( "VACACIONES"."FECHA_INI" >= :ldt_fecha_ini_1 ) AND
									( "VACACIONES"."FECHA_INI" <= :ldt_fecha_fin_1 )) 
						USING		trans_1;
						if trans_1.sqlcode=0 then
							if not isnull(ll_suma_vaca_1) or ll_suma_vaca_1>0 then
								ll_suma_vaca_1  										= 1
							else
								ll_suma_vaca_1  										= 0
							end if
						else
							ll_suma_vaca_1  											= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"vaca_mes_1",ll_suma_vaca_1)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"vaca_mes_1",ll_suma_vaca_1)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"vaca_mes_1",ll_suma_vaca_1)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"vaca_mes_1",ll_suma_vaca_1)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"vaca_mes_1",ll_suma_vaca_1)
/*cta_prom*_3*/	ll_cuenta_prom_mes	 										= f_cta_promesa_desde_cierre(ls_cod_age,ldt_fecha_1)
/*mora*_3*/			ll_cuenta_mora_3	 											= f_cta_promesa_mora(ls_cod_age,ldt_fecha_1)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"producc_3",ll_cuenta_prom_mes)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"producc_3",ll_cuenta_prom_mes)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"producc_3",ll_cuenta_prom_mes)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"producc_3",ll_cuenta_prom_mes)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"producc_3",ll_cuenta_prom_mes)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"mora_3",ll_cuenta_mora_3)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"mora_3",ll_cuenta_mora_3)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"mora_3",ll_cuenta_mora_3)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"mora_3",ll_cuenta_mora_3)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"mora_3",ll_cuenta_mora_3)
						if ll_cuenta_mora_3 > 0 then
							ldb_porce_mora_3  										= round((ll_cuenta_mora_3 / ll_cuenta_prom_mes * 100),2)
						else
							ldb_porce_mora_3  										= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"porce_3",ldb_porce_mora_3)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"porce_3",ldb_porce_mora_3)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"porce_3",ldb_porce_mora_3)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"porce_3",ldb_porce_mora_3)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"porce_3",ldb_porce_mora_3)
/*cta_prom*_6*/	ll_cuenta_prom_mes_6	 										= f_cta_promesa_desde_cierre(ls_cod_age,ldt_fecha_6)
/*mora*_6*/			ll_cuenta_mora_6	 											= f_cta_promesa_mora(ls_cod_age,ldt_fecha_6)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"producc_6",ll_cuenta_prom_mes_6)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"producc_6",ll_cuenta_prom_mes_6)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"producc_6",ll_cuenta_prom_mes_6)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"producc_6",ll_cuenta_prom_mes_6)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"producc_6",ll_cuenta_prom_mes_6)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"mora_6",ll_cuenta_mora_6)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"mora_6",ll_cuenta_mora_6)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"mora_6",ll_cuenta_mora_6)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"mora_6",ll_cuenta_mora_6)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"mora_6",ll_cuenta_mora_6)
						if ll_cuenta_mora_6 > 0 then
							ldb_porce_mora_6 											= round((ll_cuenta_mora_6 / ll_cuenta_prom_mes_6 * 100),2)
						else
							ldb_porce_mora_6  										= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"porce_6",ldb_porce_mora_6)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"porce_6",ldb_porce_mora_6)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"porce_6",ldb_porce_mora_6)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"porce_6",ldb_porce_mora_6)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"porce_6",ldb_porce_mora_6)
/*cta_prom*_12*/	ll_cuenta_prom_mes_12	 									= f_cta_promesa_desde_cierre(ls_cod_age,ldt_fecha_12)
/*mora*_12*/		ll_cuenta_mora_12 											= f_cta_promesa_mora(ls_cod_age,ldt_fecha_12)
						tab_1.tabpage_1.dw_general.setitem(ll_new,"producc_12",ll_cuenta_prom_mes_12)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"producc_12",ll_cuenta_prom_mes_12)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"producc_12",ll_cuenta_prom_mes_12)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"producc_12",ll_cuenta_prom_mes_12)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"producc_12",ll_cuenta_prom_mes_12)

						tab_1.tabpage_1.dw_general.setitem(ll_new,"mora_12",ll_cuenta_mora_12)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"mora_12",ll_cuenta_mora_12)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"mora_12",ll_cuenta_mora_12)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"mora_12",ll_cuenta_mora_12)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"mora_12",ll_cuenta_mora_12)
						if ll_cuenta_mora_12 > 0 then
							ldb_porce_mora_12  										= round((ll_cuenta_mora_12 / ll_cuenta_prom_mes_12 * 100),2)
						else
							ldb_porce_mora_12  										= 0
						end if
						tab_1.tabpage_1.dw_general.setitem(ll_new,"porce_12",ldb_porce_mora_12)
						tab_1.tabpage_2.dw_produccion.setitem(ll_new,"porce_12",ldb_porce_mora_12)
						tab_1.tabpage_3.dw_dotacion.setitem(ll_new,"porce_12",ldb_porce_mora_12)
						tab_1.tabpage_4.dw_productividad.setitem(ll_new,"porce_12",ldb_porce_mora_12)
						tab_1.tabpage_5.dw_morosidad.setitem(ll_new,"porce_12",ldb_porce_mora_12)
				end if
				Setnull(ls_cod_age)
				if ll_tot_porc <> ll_tot_porc_aux then 
					st_porc.text														= string(ll_tot_porc)+" %"
					ll_tot_porc_aux													= ll_tot_porc
				end if
				ll_tot_porc																= (ll_new / ll_tot_reg) * 100
				hpb_1.Position 														= ll_tot_porc
				tab_1.tabpage_1.dw_general.accepttext()
			LOOP
		end if
	close xage;
	st_fondo.visible																	= false
	hpb_1.visible 																		= false
	st_porc.visible 																	= false
	SetPointer(Arrow!)
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('parque')
	elseif isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()	
	elseif isnull(ls_cod_jefe) or ls_cod_jefe='' then
		messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('jefe')
	elseif isnull(ls_cod_superv) or ls_cod_superv='' then
		messagebox("Advertencia", "Debe Ingresar Supervisor de Ventas")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('supervisor')
	end if
end if
end event

type cb_cerrar from commandbutton within w_sales_meeting
integer x = 3835
integer y = 2008
integer width = 302
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_sales_meeting)
end event

type dw_seleccion from datawindow within w_sales_meeting
integer x = 178
integer y = 40
integer width = 2222
integer height = 184
integer taborder = 20
string title = "none"
string dataobject = "dwe_seleccion_opcion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		tab_1.tabpage_1.dw_general.reset()
		tab_1.tabpage_2.dw_produccion.reset()
		tab_1.tabpage_3.dw_dotacion.reset()
		tab_1.tabpage_4.dw_productividad.reset()
		tab_1.tabpage_5.dw_morosidad.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		tab_1.tabpage_1.dw_general.reset()
		tab_1.tabpage_2.dw_produccion.reset()
		tab_1.tabpage_3.dw_dotacion.reset()
		tab_1.tabpage_4.dw_productividad.reset()
		tab_1.tabpage_5.dw_morosidad.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		tab_1.tabpage_1.dw_general.reset()
		tab_1.tabpage_2.dw_produccion.reset()
		tab_1.tabpage_3.dw_dotacion.reset()
		tab_1.tabpage_4.dw_productividad.reset()
		tab_1.tabpage_5.dw_morosidad.reset()
END CHOOSE
end event

event itemfocuschanged;//String	ls_columna,ls_jefe,ls_supervisor,ls_agente
//Long		ll_parque
//
//ls_columna	= dwo.name
//if ls_columna<>'parque' 
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		dw_seleccion.getchild('jefe',idw_detalle)
//		idw_detalle.settransobject(sqlca)
//		if idw_detalle.retrieve(ll_parque)=0 then
//			idw_detalle.insertrow(0)
//		end if
//	CASE 'jefe'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
//		dw_seleccion.getchild('supervisor',idw_detalle2)
//		idw_detalle2.settransobject(sqlca)
//		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
//			idw_detalle2.insertrow(0)
//		end if
//	CASE 'supervisor'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
//		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
//		ls_supervisor			= dw_seleccion.getitemstring(1,'supervisor')
//		dw_seleccion.getchild('agente',idw_detalle3)
//		idw_detalle3.settransobject(sqlca)
//		if idw_detalle3.retrieve(ll_parque,ls_jefe,ls_supervisor)=0 then
//			idw_detalle3.insertrow(0)
//		end if
//	CASE 'agente'
//		dw_seleccion.accepttext()
//		dw_lista.reset()
//
end event

