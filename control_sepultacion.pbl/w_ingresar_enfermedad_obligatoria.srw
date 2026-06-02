forward
global type w_ingresar_enfermedad_obligatoria from window
end type
type cb_limpiar from commandbutton within w_ingresar_enfermedad_obligatoria
end type
type cb_print from commandbutton within w_ingresar_enfermedad_obligatoria
end type
type cb_grabar from commandbutton within w_ingresar_enfermedad_obligatoria
end type
type cb_cerrar from commandbutton within w_ingresar_enfermedad_obligatoria
end type
type dw_ingresar from datawindow within w_ingresar_enfermedad_obligatoria
end type
end forward

global type w_ingresar_enfermedad_obligatoria from window
integer width = 3474
integer height = 2300
boolean titlebar = true
string title = "Ingresar Registro de Fallecidos a Cause de Enfermedades de Declaración Obligatoria"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar cb_limpiar
cb_print cb_print
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_ingresar dw_ingresar
end type
global w_ingresar_enfermedad_obligatoria w_ingresar_enfermedad_obligatoria

on w_ingresar_enfermedad_obligatoria.create
this.cb_limpiar=create cb_limpiar
this.cb_print=create cb_print
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_ingresar=create dw_ingresar
this.Control[]={this.cb_limpiar,&
this.cb_print,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_ingresar}
end on

on w_ingresar_enfermedad_obligatoria.destroy
destroy(this.cb_limpiar)
destroy(this.cb_print)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_ingresar)
end on

event open;long	ll_cod_parque
gf_centrar(w_ingresar_enfermedad_obligatoria)
dw_ingresar.settransobject(sqlca)
if dw_ingresar.retrieve(gl_corr_mensual,gl_corr_anual,gl_cod_parque,gdt_fecha_sepult)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_ingresar_enfermedad_obligatoria)
else
	gs_ventana	= 'w_ingresar_enfermedad_obligatoria'
	f_valida_objeto2()
	
	ll_cod_parque	= dw_ingresar.getitemnumber(1,'cod_parque')
	dw_ingresar.accepttext()
	if ll_cod_parque = 1 then
		dw_ingresar.object.p_prado.visible	= true
		dw_ingresar.object.p_canaan.visible	= false
		dw_ingresar.object.p_manantial.visible	= false
		dw_ingresar.object.p_santiago.visible	= false
		dw_ingresar.object.p_foresta.visible	= false
	elseif ll_cod_parque = 101 then
		dw_ingresar.object.p_prado.visible	= false
		dw_ingresar.object.p_canaan.visible	= true
		dw_ingresar.object.p_manantial.visible	= false
		dw_ingresar.object.p_santiago.visible	= false
		dw_ingresar.object.p_foresta.visible	= false
	elseif ll_cod_parque = 102 then
		dw_ingresar.object.p_prado.visible	= false
		dw_ingresar.object.p_canaan.visible	= false
		dw_ingresar.object.p_manantial.visible	= true
		dw_ingresar.object.p_santiago.visible	= false
		dw_ingresar.object.p_foresta.visible	= false
	elseif ll_cod_parque = 103 then
		dw_ingresar.object.p_prado.visible	= false
		dw_ingresar.object.p_canaan.visible	= false
		dw_ingresar.object.p_manantial.visible	= false
		dw_ingresar.object.p_santiago.visible	= true
		dw_ingresar.object.p_foresta.visible	= false
	elseif ll_cod_parque = 11 then
		dw_ingresar.object.p_prado.visible	= false
		dw_ingresar.object.p_canaan.visible	= false
		dw_ingresar.object.p_manantial.visible	= false
		dw_ingresar.object.p_santiago.visible	= false
		dw_ingresar.object.p_foresta.visible	= true	
	end if	
end if
end event

type cb_limpiar from commandbutton within w_ingresar_enfermedad_obligatoria
integer x = 745
integer y = 2044
integer width = 462
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar Datos"
end type

event clicked;String	ls_nulo
Long		ll_res

Setnull(ls_nulo)
ll_res	= messagebox("Advertencia","Está Seguro Limpiar Datos en Pantalla, recuerde se Eliminara(n) todos los Registro(s)",Exclamation!,YesNo!,2)
if ll_res=1 then
	dw_ingresar.setitem(1,'cod_enfermedad_1',ls_nulo)
	dw_ingresar.setitem(1,'cod_enfermedad_2',ls_nulo)
	dw_ingresar.setitem(1,'cod_enfermedad_3',ls_nulo)
	dw_ingresar.setitem(1,'cod_enfermedad_4',ls_nulo)
	dw_ingresar.setitem(1,'cod_enfermedad_5',ls_nulo)
	if dw_ingresar.update()=1 then
		commit;
		messagebox("Eliminar","Eliminación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Eliminar Enfermedad OBLIGATORIA SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_print from commandbutton within w_ingresar_enfermedad_obligatoria
integer x = 1609
integer y = 2044
integer width = 325
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;String	ls_cod_enf_1,ls_cod_enf_2,ls_cod_enf_3,ls_cod_enf_4,ls_cod_enf_5

ls_cod_enf_1	= dw_ingresar.getitemstring(1,'cod_enfermedad_1')
if isnull(ls_cod_enf_1) or ls_cod_enf_1='' then
	messagebox("Advertencia","Debe Seleccionar Enfermedad Obligatoria")
	dw_ingresar.setfocus()
	dw_ingresar.setcolumn('cod_enfermedad_1')
else
	ls_cod_enf_2	= dw_ingresar.getitemstring(1,'cod_enfermedad_2')
	ls_cod_enf_3	= dw_ingresar.getitemstring(1,'cod_enfermedad_3')
	ls_cod_enf_4	= dw_ingresar.getitemstring(1,'cod_enfermedad_4')
	ls_cod_enf_5	= dw_ingresar.getitemstring(1,'cod_enfermedad_5')
	if dw_ingresar.rowcount() > 0 then 
		if isnull(ls_cod_enf_1) or ls_cod_enf_1='' then
			dw_ingresar.object.cod_enfermedad_1.visible	= false
			dw_ingresar.object.t_uno.visible					= false
		end if
		if isnull(ls_cod_enf_2) or ls_cod_enf_2='' then
			dw_ingresar.object.cod_enfermedad_2.visible	= false
			dw_ingresar.object.t_dos.visible					= false
		end if
		if isnull(ls_cod_enf_3) or ls_cod_enf_3='' then
			dw_ingresar.object.cod_enfermedad_3.visible	= false
			dw_ingresar.object.t_tres.visible				= false
		end if
		if isnull(ls_cod_enf_4) or ls_cod_enf_4='' then
			dw_ingresar.object.cod_enfermedad_4.visible	= false
			dw_ingresar.object.t_cuatro.visible				= false
		end if
		if isnull(ls_cod_enf_5) or ls_cod_enf_5='' then
			dw_ingresar.object.cod_enfermedad_5.visible	= false
			dw_ingresar.object.t_cinco.visible				= false
		end if
		f_Print( dw_ingresar )
		dw_ingresar.object.cod_enfermedad_1.visible		= true
		dw_ingresar.object.t_uno.visible						= true
		dw_ingresar.object.cod_enfermedad_2.visible		= true
		dw_ingresar.object.t_dos.visible						= true
		dw_ingresar.object.cod_enfermedad_3.visible		= true
		dw_ingresar.object.t_tres.visible					= true
		dw_ingresar.object.cod_enfermedad_4.visible		= true
		dw_ingresar.object.t_cuatro.visible					= true
		dw_ingresar.object.cod_enfermedad_5.visible		= true
		dw_ingresar.object.t_cinco.visible					= true
	end if
end if
end event

type cb_grabar from commandbutton within w_ingresar_enfermedad_obligatoria
integer x = 37
integer y = 2044
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_cod_enf_1

ls_cod_enf_1	= dw_ingresar.getitemstring(1,'cod_enfermedad_1')
if isnull(ls_cod_enf_1) then
	messagebox("Advertencia","Debe Ingresar Enfermedad")
	dw_ingresar.setfocus()
	dw_ingresar.setcolumn('cod_enfermedad_1')
else
	if dw_ingresar.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Enfermedad OBLIGATORIA SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_ingresar_enfermedad_obligatoria
integer x = 3099
integer y = 2044
integer width = 306
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingresar_enfermedad_obligatoria)
end event

type dw_ingresar from datawindow within w_ingresar_enfermedad_obligatoria
integer x = 37
integer y = 32
integer width = 3369
integer height = 1964
integer taborder = 10
string title = "none"
string dataobject = "dw_ingresar_enfermedad_obligatoria"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_columna,ls_enf1,ls_enf2,ls_enf3,ls_enf4,ls_enf5,ls_nulo

this.accepttext()
ls_columna	= dwo.name
Setnull(ls_nulo)
if ls_columna='cod_enfermedad_1' then
elseif ls_columna='cod_enfermedad_2' then
	ls_enf1		= this.getitemstring(1,'cod_enfermedad_1')
	ls_enf2		= this.getitemstring(1,'cod_enfermedad_2')
	if ls_enf2=ls_enf1 then
		messagebox("Advertencia","Enfermedad Seleccionada Ya Existe")
		this.setitem(1,'cod_enfermedad_2',ls_nulo)
	end if
elseif ls_columna='cod_enfermedad_3' then
	ls_enf1		= this.getitemstring(1,'cod_enfermedad_1')
	ls_enf2		= this.getitemstring(1,'cod_enfermedad_2')
	ls_enf3		= this.getitemstring(1,'cod_enfermedad_3')
	if ls_enf3=ls_enf2 or ls_enf3=ls_enf1 then
		messagebox("Advertencia","Enfermedad Seleccionada Ya Existe")
		this.setitem(1,'cod_enfermedad_3',ls_nulo)
	end if
elseif ls_columna='cod_enfermedad_4' then
	ls_enf1		= this.getitemstring(1,'cod_enfermedad_1')
	ls_enf2		= this.getitemstring(1,'cod_enfermedad_2')
	ls_enf3		= this.getitemstring(1,'cod_enfermedad_3')
	ls_enf4		= this.getitemstring(1,'cod_enfermedad_4')
	if ls_enf4=ls_enf3 or ls_enf4=ls_enf2 or ls_enf4=ls_enf1 then
		messagebox("Advertencia","Enfermedad Seleccionada Ya Existe")
		this.setitem(1,'cod_enfermedad_4',ls_nulo)
	end if
elseif ls_columna='cod_enfermedad_5' then
	ls_enf1		= this.getitemstring(1,'cod_enfermedad_1')
	ls_enf2		= this.getitemstring(1,'cod_enfermedad_2')
	ls_enf3		= this.getitemstring(1,'cod_enfermedad_3')
	ls_enf4		= this.getitemstring(1,'cod_enfermedad_4')
	ls_enf5		= this.getitemstring(1,'cod_enfermedad_5')
	if ls_enf5=ls_enf4 or ls_enf5=ls_enf3 or ls_enf5=ls_enf5 or ls_enf5=ls_enf1 then
		messagebox("Advertencia","Enfermedad Seleccionada Ya Existe")
		this.setitem(1,'cod_enfermedad_5',ls_nulo)
	end if
end if
end event

event itemfocuschanged;String	ls_columna,ls_enf1,ls_enf2,ls_enf3,ls_enf4,ls_enf5,ls_nulo

ls_columna		= dwo.name
Setnull(ls_nulo)
ls_enf1			= this.getitemstring(1,'cod_enfermedad_1')
ls_enf2			= this.getitemstring(1,'cod_enfermedad_2')
if not isnull(ls_enf1) and ls_enf1<>'' and not isnull(ls_enf2) and ls_enf2<>'' then
	ls_enf3		= this.getitemstring(1,'cod_enfermedad_3')
	ls_enf4		= this.getitemstring(1,'cod_enfermedad_4')
	ls_enf5		= this.getitemstring(1,'cod_enfermedad_5')
	if ls_enf2=ls_enf1 then
		messagebox("Advertencia","Enfermedad Seleccionada Ya Existe")
		this.setitem(1,'cod_enfermedad_2',ls_nulo)
	end if
	if ls_enf3=ls_enf2 or ls_enf3=ls_enf1 then
		this.setitem(1,'cod_enfermedad_3',ls_nulo)
	end if
	if ls_enf4=ls_enf3 or ls_enf4=ls_enf2 or ls_enf4=ls_enf1 then
		this.setitem(1,'cod_enfermedad_4',ls_nulo)
	end if
	if ls_enf5=ls_enf4 or ls_enf5=ls_enf3 or ls_enf5=ls_enf5 or ls_enf5=ls_enf1 then
		this.setitem(1,'cod_enfermedad_5',ls_nulo)
	end if
end if
this.accepttext()
end event

