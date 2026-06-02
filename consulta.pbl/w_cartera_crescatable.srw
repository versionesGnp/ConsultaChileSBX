forward
global type w_cartera_crescatable from window
end type
type dw_detalle from datawindow within w_cartera_crescatable
end type
type cb_cerrar from commandbutton within w_cartera_crescatable
end type
type dw_cartera from datawindow within w_cartera_crescatable
end type
end forward

global type w_cartera_crescatable from window
integer width = 2679
integer height = 1480
boolean titlebar = true
string title = "Cartera Rescatable"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_detalle dw_detalle
cb_cerrar cb_cerrar
dw_cartera dw_cartera
end type
global w_cartera_crescatable w_cartera_crescatable

on w_cartera_crescatable.create
this.dw_detalle=create dw_detalle
this.cb_cerrar=create cb_cerrar
this.dw_cartera=create dw_cartera
this.Control[]={this.dw_detalle,&
this.cb_cerrar,&
this.dw_cartera}
end on

on w_cartera_crescatable.destroy
destroy(this.dw_detalle)
destroy(this.cb_cerrar)
destroy(this.dw_cartera)
end on

event open;String	ls_base, ls_age,ls_nom_age,ls_pat_age,ls_mat_age,ls_est_age,ls_cod_sup,ls_nom_sup,ls_pat_sup, &
			ls_mat_sup,ls_est_sup,ls_cod_jefe,ls_nom_jefe,ls_pat_jefe,ls_mat_jefe,ls_est_jefe  
Long		ll_folio
gf_centrar(w_cartera_crescatable)
dw_cartera.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
if dw_cartera.retrieve(gs_base,gs_serie,gi_numero)=0 then
	messagebox("Advertencia","No Registra Dato")
	close(w_cartera_crescatable)
else
	ls_base	= dw_cartera.getitemstring(1,'geo_prado_crescatable_base')
	ll_folio	= dw_cartera.getitemnumber(1,'geo_prado_crescatable_folio')
	ls_age	= dw_cartera.getitemstring(1,'cod_age')
	dw_detalle.retrieve(ls_base,ll_folio)
	SELECT	"AGENTES"."NOMBRE",   
				"AGENTES"."A_PATERNO",   
				"AGENTES"."A_MATERNO",   
				"AGENTES"."ESTADO",   
				"SUPERVISOR"."COD_SUP",   
				"SUPERVISOR"."NOMBRE",   
				"SUPERVISOR"."A_PATERNO",   
				"SUPERVISOR"."A_MATERNO",   
				"SUPERVISOR"."ESTADO",   
				"JEFE_VENTAS"."JEFE_VENTAS",   
				"JEFE_VENTAS"."NOMBRE",   
				"JEFE_VENTAS"."A_PATERNO",   
				"JEFE_VENTAS"."A_MATERNO",   
				"JEFE_VENTAS"."ESTADO"  
	INTO 		:ls_nom_age,   
				:ls_pat_age,   
				:ls_mat_age,   
				:ls_est_age,   
				:ls_cod_sup,   
				:ls_nom_sup,   
				:ls_pat_sup,   
				:ls_mat_sup,   
				:ls_est_sup,   
				:ls_cod_jefe,   
				:ls_nom_jefe,   
				:ls_pat_jefe,   
				:ls_mat_jefe,   
				:ls_est_jefe  
	FROM 		"AGENTES",   
				"JEFE_VENTAS",   
				"SUPERVISOR"  
	WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
			 ( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
			 (("AGENTES"."COD_AGE" = :ls_age ) )   ;

	if TRIM(ls_est_age)='A' then
		ls_est_age	= 'Activo'
	elseif TRIM(ls_est_age)='I' then
		ls_est_age	= 'Inactivo'
	else
		ls_est_age	= '-'
	end if
	dw_cartera.object.t_agente.text			= ls_nom_age+ ' '+ls_pat_age+' '+ls_mat_age
	dw_cartera.object.t_estado_agente.text	= ls_est_age
	if TRIM(ls_est_sup)='A' then
		ls_est_sup	= 'Activo'
	elseif TRIM(ls_est_sup)='I' then
		ls_est_sup	= 'Inactivo'
	else
		ls_est_sup	= '-'
	end if
	dw_cartera.object.t_supervisor.text				= ls_nom_sup+ ' '+ls_pat_sup+' '+ls_mat_sup
	dw_cartera.object.t_estado_supervisor.text	= ls_est_sup
	if TRIM(ls_est_jefe)='A' then
		ls_est_jefe	= 'Activo'
	elseif TRIM(ls_est_jefe)='I' then
		ls_est_jefe	= 'Inactivo'
	else
		ls_est_jefe	= '-'
	end if
	dw_cartera.object.t_cod_jefe.text		= ls_cod_jefe
	dw_cartera.object.t_jefe.text				= ls_nom_jefe+ ' '+ls_pat_jefe+' '+ls_mat_jefe
	dw_cartera.object.t_estado_jefe.text	= ls_est_jefe
end if
end event

type dw_detalle from datawindow within w_cartera_crescatable
integer x = 41
integer y = 780
integer width = 2171
integer height = 564
integer taborder = 10
boolean titlebar = true
string title = "Detalle "
string dataobject = "dw_lista_detalle_cartera_rescatable"
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_cerrar from commandbutton within w_cartera_crescatable
integer x = 2299
integer y = 1236
integer width = 311
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cartera_crescatable)
end event

type dw_cartera from datawindow within w_cartera_crescatable
integer x = 41
integer y = 36
integer width = 2601
integer height = 720
string title = "none"
string dataobject = "dw_cartera_rescatable"
boolean border = false
boolean livescroll = true
end type

