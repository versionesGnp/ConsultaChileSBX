forward
global type w_detalle_totales_individual from window
end type
type cb_4 from commandbutton within w_detalle_totales_individual
end type
type cb_consulta from commandbutton within w_detalle_totales_individual
end type
type cb_3 from commandbutton within w_detalle_totales_individual
end type
type cb_2 from commandbutton within w_detalle_totales_individual
end type
type cb_filtrar from commandbutton within w_detalle_totales_individual
end type
type dw_lista from datawindow within w_detalle_totales_individual
end type
type cb_1 from commandbutton within w_detalle_totales_individual
end type
end forward

global type w_detalle_totales_individual from window
integer x = 73
integer y = 148
integer width = 3520
integer height = 2124
boolean titlebar = true
string title = "Informe Detallado"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_4 cb_4
cb_consulta cb_consulta
cb_3 cb_3
cb_2 cb_2
cb_filtrar cb_filtrar
dw_lista dw_lista
cb_1 cb_1
end type
global w_detalle_totales_individual w_detalle_totales_individual

type variables
long il_row
end variables

forward prototypes
public subroutine wf_error ()
end prototypes

public subroutine wf_error ();messagebox("Advertencia","No registra dato")
close(w_detalle_totales_individual)
end subroutine

on w_detalle_totales_individual.create
this.cb_4=create cb_4
this.cb_consulta=create cb_consulta
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_filtrar=create cb_filtrar
this.dw_lista=create dw_lista
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_consulta,&
this.cb_3,&
this.cb_2,&
this.cb_filtrar,&
this.dw_lista,&
this.cb_1}
end on

on w_detalle_totales_individual.destroy
destroy(this.cb_4)
destroy(this.cb_consulta)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_filtrar)
destroy(this.dw_lista)
destroy(this.cb_1)
end on

event open;string 	ls_string, ls_codigo, ls_tipo_cargo, ls_tipo_total
long		il_empresa
datetime	ld_fec_ini, ld_fec_fin
gf_centrar(w_detalle_totales_individual)
ls_string		= message.stringparm
ls_tipo_cargo	= mid(ls_string,1,1)
ls_codigo		= trim(mid(ls_string,2,5))
ld_fec_ini		= datetime(date(mid(ls_string,6,11)),time("00:00:00"))
ld_fec_fin		= datetime(date(mid(ls_string,17,10)),time("00:00:00"))
ls_tipo_total	= mid(ls_string,27,1)
gs_ventana		= 'w_detalle_totales_individual'
f_valida_objeto_1()
if gs_conexion = "Parque El Prado" then
	il_empresa = 1
elseif gs_conexion = "Parque La Foresta" then
	il_empresa = 2
elseif gs_conexion = "Parque Concepción" then
	il_empresa = 3
end if
CHOOSE CASE ls_tipo_cargo
	CASE '1'
		this.title	= 'Detalle Informe Gestion por Jefe de Venta'
		dw_lista.dataobject	= 'dw_lista_detalle_gestion_jefe_ind'
		dw_lista.settransobject(sqlca)
		
	CASE '2'
		this.title	= 'Detalle Informe Gestion por Supervisor'
		dw_lista.dataobject	= 'dw_lista_detalle_gestion_supervisor_ind'
		dw_lista.settransobject(sqlca)

	CASE '3'
		this.title	= 'Detalle Informe Gestion por Agente'
		dw_lista.dataobject	= 'dw_lista_detalle_gestion_agente_ind'
		dw_lista.settransobject(sqlca)

END CHOOSE
CHOOSE CASE ls_tipo_total
	CASE '%'
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo,il_empresa,'%') = 0 then//%
			wf_error()
		else
			dw_lista.object.c_titulo.text = '( Total Promesas )'
		end if
	CASE 'N'
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo,il_empresa,'N')= 0 then
			wf_error()
		else
			dw_lista.object.c_titulo.text = '( Total Rescilados )'
			dw_lista.object.usuario.text = gs_user
		end if
	CASE 'R'
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo,il_empresa,'R')=0 then
			wf_error()
		else
			dw_lista.object.c_titulo.text = '( Total Resueltas )'
			dw_lista.object.usuario.text = gs_user
		end if
	CASE 'P'
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo,il_empresa,'P')=0 then
			wf_error()
		else
			dw_lista.object.c_titulo.text = '( Total Resciliadas por Reprog. )'
			dw_lista.object.usuario.text = gs_user
		end if
	CASE 'C'
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo,il_empresa,'C')=0 then
			wf_error()
		else
			dw_lista.object.c_titulo.text = '( Total Canceladas )'
			dw_lista.object.usuario.text = gs_user
		end if
	CASE 'V'
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo,il_empresa,'V')=0 then
			wf_error()
		else
			dw_lista.object.c_titulo.text = '( Total Vigentes )'
			dw_lista.object.usuario.text = gs_user
		end if
	CASE 'A'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo,il_empresa,'%')//%
		dw_lista.setfilter("cadena_estado='"+'V'+"' and funcion_mora=0")
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			wf_error()
		else
			dw_lista.object.c_titulo.text = '( Total Vigentes al día )'
			dw_lista.object.usuario.text = gs_user
		end if
	CASE 'M'
		dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_codigo,il_empresa,'%')//%
		dw_lista.setfilter("cadena_estado='"+'V'+"' and funcion_mora>0")
		dw_lista.filter()
		if dw_lista.rowcount()= 0 then
			wf_error()
		else
			dw_lista.object.c_titulo.text = '( Total Vigentes en Mora )'
			dw_lista.object.usuario.text = gs_user
		end if
END CHOOSE

end event

type cb_4 from commandbutton within w_detalle_totales_individual
integer x = 1627
integer y = 1880
integer width = 421
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consulta Cta.Cte."
end type

event clicked;string tipo
string esta
gi_numero = dw_lista.getitemnumber(dw_lista.getrow(),'oferta_v_nro_oferta')
gi_tipo_busqueda = 8
Open(w_listado_contratos)
end event

type cb_consulta from commandbutton within w_detalle_totales_individual
integer x = 1321
integer y = 1880
integer width = 302
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Histórico"
end type

event clicked;string ls_age, ls_sup, ls_string
ls_sup	= dw_lista.getitemstring(dw_lista.getrow(),'oferta_v_cod_sup')
ls_age	= dw_lista.getitemstring(dw_lista.getrow(),'oferta_v_cod_age')
ls_string	= ls_age+'~t'+ls_sup
openwithparm(w_agente_info,ls_string)

end event

type cb_3 from commandbutton within w_detalle_totales_individual
integer x = 654
integer y = 1876
integer width = 302
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type cb_2 from commandbutton within w_detalle_totales_individual
integer x = 347
integer y = 1876
integer width = 302
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type cb_filtrar from commandbutton within w_detalle_totales_individual
event clicked pbm_bnclicked
integer x = 41
integer y = 1876
integer width = 302
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type dw_lista from datawindow within w_detalle_totales_individual
integer x = 41
integer y = 28
integer width = 3406
integer height = 1804
integer taborder = 10
string dataobject = "dw_lista_detalle_gestion_supervisor_ind"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_1 from commandbutton within w_detalle_totales_individual
integer x = 3145
integer y = 1876
integer width = 302
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

