forward
global type w_glosa_excepcion from window
end type
type cb_cerrar from commandbutton within w_glosa_excepcion
end type
type dw_lista from datawindow within w_glosa_excepcion
end type
end forward

global type w_glosa_excepcion from window
integer width = 2290
integer height = 692
boolean titlebar = true
string title = "Glosa Excepciones por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_glosa_excepcion w_glosa_excepcion

type variables
string		is_base,is_serie
long 		il_row,il_grupo,il_codigo
Double	il_numero
end variables

forward prototypes
public subroutine wf_cargar_resto (datetime adt_fecha_ini, datetime adt_fecha_fin, string as_serie, long al_numero)
public subroutine wf_actualizar (string fecha_cierre)
end prototypes

public subroutine wf_cargar_resto (datetime adt_fecha_ini, datetime adt_fecha_fin, string as_serie, long al_numero);
end subroutine

public subroutine wf_actualizar (string fecha_cierre);
end subroutine

on w_glosa_excepcion.create
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.dw_lista}
end on

on w_glosa_excepcion.destroy
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;string	ls_glosa
long	ll_tot_reg,ll_indi

gf_centrar(w_glosa_excepcion)
dw_lista.settransobject(sqlca)
is_base									= substr(1,1,Message.StringParm)
is_serie									= substr(1,2,Message.StringParm)
il_numero								= Double(substr(1,3,Message.StringParm))
il_grupo									= long(substr(1,4,Message.StringParm))
il_codigo									= long(substr(1,5,Message.StringParm))
if not isnull(is_base) and is_base<>'' and not isnull(is_serie) and is_serie<>'' and not isnull(il_numero) and il_numero>0 then
	ll_tot_reg							= dw_lista.retrieve(is_base,is_serie,il_numero,il_grupo,il_codigo)
	if ll_tot_reg>0 then
		for ll_indi=1 to ll_tot_reg
			ls_glosa						= dw_lista.getitemstring(ll_indi,'observacion')
			if isnull(ls_glosa) then ls_glosa=''
			if ls_glosa='' then
				messagebox("Advertencia","Contrato No Registra Glosa")
				close(w_glosa_excepcion)
			end if
		next
	else
		messagebox("Advertencia","Contrato No Registra Glosa")
		close(w_glosa_excepcion)
	end if
end if
end event

type cb_cerrar from commandbutton within w_glosa_excepcion
integer x = 1851
integer y = 448
integer width = 357
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_glosa_excepcion)
end event

type dw_lista from datawindow within w_glosa_excepcion
integer x = 37
integer y = 28
integer width = 2194
integer height = 412
integer taborder = 10
string title = "none"
string dataobject = "dw_glosa_excepcion"
boolean border = false
boolean livescroll = true
end type

