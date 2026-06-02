forward
global type w_ingreso_covid from window
end type
type cb_cerrar_encargado from commandbutton within w_ingreso_covid
end type
type tab_1 from tab within w_ingreso_covid
end type
type tabpage_1 from userobject within tab_1
end type
type cb_lista_encargados from commandbutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type cb_limpiar_encargado from commandbutton within tabpage_1
end type
type em_rut from editmask within tabpage_1
end type
type pb_1 from picturebutton within tabpage_1
end type
type cb_grabar_encargado from commandbutton within tabpage_1
end type
type dw_encargados from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_lista_encargados cb_lista_encargados
st_1 st_1
cb_limpiar_encargado cb_limpiar_encargado
em_rut em_rut
pb_1 pb_1
cb_grabar_encargado cb_grabar_encargado
dw_encargados dw_encargados
end type
type tabpage_2 from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_2
end type
type st_2 from statictext within tabpage_2
end type
type cb_limpiar from commandbutton within tabpage_2
end type
type cb_grabar_agente from commandbutton within tabpage_2
end type
type pb_2 from picturebutton within tabpage_2
end type
type em_rut_agente from editmask within tabpage_2
end type
type dw_agentes from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_1 cb_1
st_2 st_2
cb_limpiar cb_limpiar
cb_grabar_agente cb_grabar_agente
pb_2 pb_2
em_rut_agente em_rut_agente
dw_agentes dw_agentes
end type
type tab_1 from tab within w_ingreso_covid
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_ingreso_covid from window
integer width = 2437
integer height = 1468
boolean titlebar = true
string title = "Ingreso Registro Covid"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cerrar_encargado cb_cerrar_encargado
tab_1 tab_1
end type
global w_ingreso_covid w_ingreso_covid

on w_ingreso_covid.create
this.cb_cerrar_encargado=create cb_cerrar_encargado
this.tab_1=create tab_1
this.Control[]={this.cb_cerrar_encargado,&
this.tab_1}
end on

on w_ingreso_covid.destroy
destroy(this.cb_cerrar_encargado)
destroy(this.tab_1)
end on

event open;
gf_centrar(w_ingreso_covid)
tab_1.tabpage_1.dw_encargados.settransobject(sqlca)
tab_1.tabpage_1.dw_encargados.insertrow(0)
tab_1.tabpage_2.dw_agentes.settransobject(sqlca)
tab_1.tabpage_2.dw_agentes.insertrow(0)
end event

type cb_cerrar_encargado from commandbutton within w_ingreso_covid
integer x = 2021
integer y = 1188
integer width = 311
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ingreso_covid)
end event

type tab_1 from tab within w_ingreso_covid
integer x = 37
integer y = 40
integer width = 2331
integer height = 1284
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2295
integer height = 1156
long backcolor = 67108864
string text = "Administrativos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_lista_encargados cb_lista_encargados
st_1 st_1
cb_limpiar_encargado cb_limpiar_encargado
em_rut em_rut
pb_1 pb_1
cb_grabar_encargado cb_grabar_encargado
dw_encargados dw_encargados
end type

on tabpage_1.create
this.cb_lista_encargados=create cb_lista_encargados
this.st_1=create st_1
this.cb_limpiar_encargado=create cb_limpiar_encargado
this.em_rut=create em_rut
this.pb_1=create pb_1
this.cb_grabar_encargado=create cb_grabar_encargado
this.dw_encargados=create dw_encargados
this.Control[]={this.cb_lista_encargados,&
this.st_1,&
this.cb_limpiar_encargado,&
this.em_rut,&
this.pb_1,&
this.cb_grabar_encargado,&
this.dw_encargados}
end on

on tabpage_1.destroy
destroy(this.cb_lista_encargados)
destroy(this.st_1)
destroy(this.cb_limpiar_encargado)
destroy(this.em_rut)
destroy(this.pb_1)
destroy(this.cb_grabar_encargado)
destroy(this.dw_encargados)
end on

type cb_lista_encargados from commandbutton within tabpage_1
integer x = 407
integer y = 1036
integer width = 311
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Listado"
end type

event clicked;long ll_tot_row

ll_tot_row	= dw_encargados.rowcount()
if ll_tot_row > 0 then
	if isvalid(w_listado_covid_19_enc) then close(w_listado_covid_19_enc)
	open(w_listado_covid_19_enc)
end if	
end event

type st_1 from statictext within tabpage_1
integer x = 5
integer y = 48
integer width = 119
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_limpiar_encargado from commandbutton within tabpage_1
integer x = 997
integer y = 1036
integer width = 311
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;string ls_nulo
setnull(ls_nulo);
em_rut.text = ls_nulo
tab_1.tabpage_1.dw_encargados.reset()
tab_1.tabpage_1.dw_encargados.insertrow(0)
end event

type em_rut from editmask within tabpage_1
event ue_mousemove pbm_mousemove
integer x = 133
integer y = 36
integer width = 439
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;long 		ll_rut

ll_rut 	= Double(em_rut.text)
if not isnull(ll_rut) then
	pb_1.triggerEvent(Clicked!)
	dw_encargados.accepttext()
else
	messagebox('Advertencia','Favor de ingresar Rut')
end if	
end event

type pb_1 from picturebutton within tabpage_1
integer x = 581
integer y = 20
integer width = 133
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long 		ll_rut

ll_rut 	= Double(em_rut.text)
if not isnull(ll_rut) then
	if dw_encargados.retrieve(ll_rut) <> 0 then
	else
		messagebox('Advertencia','Rut no Corresponde a Usuario Activo')
		tab_1.tabpage_1.dw_encargados.reset()
		tab_1.tabpage_1.dw_encargados.insertrow(0)
	end if	
else
	messagebox('Advertencia','Favor de ingresar Rut')
	tab_1.tabpage_1.dw_encargados.reset()
	tab_1.tabpage_1.dw_encargados.insertrow(0)
end if	
end event

type cb_grabar_encargado from commandbutton within tabpage_1
integer x = 14
integer y = 1036
integer width = 311
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;long ll_tot_reg,ll_rut

dw_encargados.accepttext()
ll_tot_reg			= dw_encargados.rowcount()
if ll_tot_reg > 0 then
	ll_rut				= dw_encargados.getitemnumber(dw_encargados.getrow(),'rut')
	if ll_rut > 0 then
		dw_encargados.update()
		messagebox('Aviso','Grabación Exitosa')
		cb_limpiar_encargado.triggerEvent(Clicked!)
	end if
end if	
end event

type dw_encargados from datawindow within tabpage_1
integer x = 9
integer y = 140
integer width = 2272
integer height = 876
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_covid_encargados"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_columna,ls_fecha

ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_1'
		if dw_encargados.getitemnumber(dw_encargados.getrow(),'rut') > 0 then
			ls_fecha	= string(date(dw_encargados.getitemdatetime(dw_encargados.getrow(),'vacuna_primera_fecha')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_encargados.setitem(dw_encargados.getrow(),'vacuna_primera_fecha',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				if date(ls_fecha) <= date(gdt_fec_sistema) then
					dw_encargados.setitem(dw_encargados.getrow(),'vacuna_primera_fecha',date(ls_fecha))
				else
					messagebox('Advertencia','Fecha Ingresada es Mayor a la Fecha Actual')
				end if	
			End if
		end if
			
	CASE 'p_2'
		if dw_encargados.getitemnumber(dw_encargados.getrow(),'rut') > 0 then
			ls_fecha	= string(date(dw_encargados.getitemdatetime(dw_encargados.getrow(),'vacuna_segunda_fecha')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_encargados.setitem(dw_encargados.getrow(),'vacuna_segunda_fecha',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
		//		if date(ls_fecha) <= date(gdt_fec_sistema) then
					dw_encargados.setitem(dw_encargados.getrow(),'vacuna_segunda_fecha',date(ls_fecha))
		//		else
		//			messagebox('Advertencia','Fecha Ingresada es Mayor a la Fecha Actual')
		//		end if
			End if
		end if
		
	CASE 'p_3'
		if dw_encargados.getitemnumber(dw_encargados.getrow(),'rut') > 0 then
			ls_fecha	= string(date(dw_encargados.getitemdatetime(dw_encargados.getrow(),'contagio_fecha')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_encargados.setitem(dw_encargados.getrow(),'contagio_fecha',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				if date(ls_fecha) <= date(gdt_fec_sistema) then
					dw_encargados.setitem(dw_encargados.getrow(),'contagio_fecha',date(ls_fecha))
				else
					messagebox('Advertencia','Fecha Ingresada es Mayor a la Fecha Actual')
				end if	
			End if
		end if
		
END CHOOSE
dw_encargados.accepttext()
end event

event itemfocuschanged;//
end event

type tabpage_2 from userobject within tab_1
string tag = "Agentes"
integer x = 18
integer y = 112
integer width = 2295
integer height = 1156
long backcolor = 67108864
string text = "Agentes"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
st_2 st_2
cb_limpiar cb_limpiar
cb_grabar_agente cb_grabar_agente
pb_2 pb_2
em_rut_agente em_rut_agente
dw_agentes dw_agentes
end type

on tabpage_2.create
this.cb_1=create cb_1
this.st_2=create st_2
this.cb_limpiar=create cb_limpiar
this.cb_grabar_agente=create cb_grabar_agente
this.pb_2=create pb_2
this.em_rut_agente=create em_rut_agente
this.dw_agentes=create dw_agentes
this.Control[]={this.cb_1,&
this.st_2,&
this.cb_limpiar,&
this.cb_grabar_agente,&
this.pb_2,&
this.em_rut_agente,&
this.dw_agentes}
end on

on tabpage_2.destroy
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.cb_limpiar)
destroy(this.cb_grabar_agente)
destroy(this.pb_2)
destroy(this.em_rut_agente)
destroy(this.dw_agentes)
end on

type cb_1 from commandbutton within tabpage_2
integer x = 407
integer y = 1036
integer width = 311
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Listado"
end type

event clicked;long ll_tot_row

ll_tot_row	= dw_agentes.rowcount()
if ll_tot_row > 0 then
	if isvalid(w_listado_covid_19_age) then close(w_listado_covid_19_age)
	open(w_listado_covid_19_age)
end if	
end event

type st_2 from statictext within tabpage_2
integer y = 44
integer width = 119
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within tabpage_2
integer x = 987
integer y = 1036
integer width = 311
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;string ls_nulo
setnull(ls_nulo);
em_rut_agente.text = ls_nulo
tab_1.tabpage_2.dw_agentes.reset()
tab_1.tabpage_2.dw_agentes.insertrow(0)
end event

type cb_grabar_agente from commandbutton within tabpage_2
integer x = 14
integer y = 1036
integer width = 311
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;long ll_tot_reg,ll_rut

dw_agentes.accepttext()
ll_tot_reg			= dw_agentes.rowcount()
if ll_tot_reg > 0 then
	ll_rut				= dw_agentes.getitemnumber(dw_agentes.getrow(),'rut')
	if ll_rut > 0 then
		dw_agentes.update()
		messagebox('Aviso','Grabación Exitosa')
		cb_limpiar.triggerEvent(Clicked!)
	end if
end if	
end event

type pb_2 from picturebutton within tabpage_2
integer x = 581
integer y = 20
integer width = 133
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long 		ll_rut

ll_rut 	= Double(em_rut_agente.text)
if not isnull(ll_rut) then
	if dw_agentes.retrieve(ll_rut) <> 0 then
	else
		messagebox('Advertencia','Rut no Corresponde a Agente Activo')
		tab_1.tabpage_2.dw_agentes.reset()
		tab_1.tabpage_2.dw_agentes.insertrow(0)
	end if	
else
	messagebox('Advertencia','Favor de ingresar Rut')
	tab_1.tabpage_2.dw_agentes.reset()
		tab_1.tabpage_2.dw_agentes.insertrow(0)
end if	
end event

type em_rut_agente from editmask within tabpage_2
event ue_mousemove pbm_mousemove
integer x = 128
integer y = 36
integer width = 439
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;long 		ll_rut

ll_rut 	= Double(em_rut_agente.text)
if not isnull(ll_rut) then
	pb_2.triggerEvent(Clicked!)
	dw_agentes.accepttext()
else
	messagebox('Advertencia','Favor de ingresar Rut')
end if	
end event

type dw_agentes from datawindow within tabpage_2
integer x = 9
integer y = 140
integer width = 2272
integer height = 872
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_covid_agentes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_columna,ls_fecha

ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_1'
		if dw_agentes.getitemnumber(dw_agentes.getrow(),'rut') > 0 then
			ls_fecha	= string(date(dw_agentes.getitemdatetime(dw_agentes.getrow(),'vacuna_primera_fecha')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_agentes.setitem(dw_agentes.getrow(),'vacuna_primera_fecha',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				if date(ls_fecha) <= date(gdt_fec_sistema) then
					dw_agentes.setitem(dw_agentes.getrow(),'vacuna_primera_fecha',date(ls_fecha))
				else
					messagebox('Advertencia','Fecha Ingresada es Mayor a la Fecha Actual')
				end if	
			End if
		end if
			
	CASE 'p_2'
		if dw_agentes.getitemnumber(dw_agentes.getrow(),'rut') > 0 then
			ls_fecha	= string(date(dw_agentes.getitemdatetime(dw_agentes.getrow(),'vacuna_segunda_fecha')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_agentes.setitem(dw_agentes.getrow(),'vacuna_segunda_fecha',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
			//	if date(ls_fecha) <= date(gdt_fec_sistema) then
					dw_agentes.setitem(dw_agentes.getrow(),'vacuna_segunda_fecha',date(ls_fecha))
//				else
//					messagebox('Advertencia','Fecha Ingresada es Mayor a la Fecha Actual')
//				end if	
			End if
		end if
		
	CASE 'p_3'
		if dw_agentes.getitemnumber(dw_agentes.getrow(),'rut') > 0 then
			ls_fecha	= string(date(dw_agentes.getitemdatetime(dw_agentes.getrow(),'contagio_fecha')))
			if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_agentes.setitem(dw_agentes.getrow(),'contagio_fecha',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				if date(ls_fecha) <= date(gdt_fec_sistema) then
					dw_agentes.setitem(dw_agentes.getrow(),'contagio_fecha',date(ls_fecha))
				else
					messagebox('Advertencia','Fecha Ingresada es Mayor a la Fecha Actual')
				end if		
			End if
		end if	
END CHOOSE
dw_agentes.accepttext()
end event

