forward
global type w_detalle_asegurados_fallecimiento from window
end type
type cb_aceptar from commandbutton within w_detalle_asegurados_fallecimiento
end type
type cb_cerrar from commandbutton within w_detalle_asegurados_fallecimiento
end type
type dw_lista from datawindow within w_detalle_asegurados_fallecimiento
end type
end forward

global type w_detalle_asegurados_fallecimiento from window
integer width = 3355
integer height = 1396
boolean titlebar = true
string title = "Detalle Asegurados Plan Asistencia Familiar"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_detalle_asegurados_fallecimiento w_detalle_asegurados_fallecimiento

type variables
String		is_base,is_serie
Long		il_row
Double	il_numero
end variables

on w_detalle_asegurados_fallecimiento.create
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_aceptar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_detalle_asegurados_fallecimiento.destroy
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_detalle_asegurados_fallecimiento)
dw_lista.settransobject(sqlca)
is_base 			= trim(substr(1,1,Message.StringParm))
is_serie			= trim(substr(1,2,Message.StringParm))
il_numero		= Double(trim(substr(1,3,Message.StringParm)))
if il_numero > 0 then
	if dw_lista.retrieve(is_base,is_serie,il_numero)=0 then
		messagebox("Advertencia","No registra Dato")
		close(w_detalle_asegurados_fallecimiento)
	end if
else
	messagebox("Advertencia","Nº Contrato Inválido")
	close(w_detalle_asegurados_fallecimiento)
end if
end event

type cb_aceptar from commandbutton within w_detalle_asegurados_fallecimiento
integer x = 41
integer y = 1100
integer width = 274
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String	ls_dv,ls_nom,ls_ap_p,ls_ap_m,ls_paren
Long		ll_rut,ll_count
Datetime	ldt_fecnac

if il_row > 0 then
	ll_rut		= dw_lista.getitemnumber(il_row,'rut')
	ls_dv			= dw_lista.getitemstring(il_row,'dv')
	ls_nom		= dw_lista.getitemstring(il_row,'nombres')
	ls_ap_p		= dw_lista.getitemstring(il_row,'ap_paterno')
	ls_ap_m		= dw_lista.getitemstring(il_row,'ap_materno')
	ls_paren		= dw_lista.getitemstring(il_row,'codigo_parentesco')
	ldt_fecnac	= dw_lista.getitemdatetime(il_row,'fecha_nacimiento')
	if ll_rut > 0 and not isnull(ls_dv) then
		SELECT	Count("SOL_SEGURO_FALLECE"."BASE")
		INTO 		:ll_count  
		FROM 		"SOL_SEGURO_FALLECE",   
					"SOL_ESTATUS"  
		WHERE  ( "SOL_SEGURO_FALLECE"."BASE" = "SOL_ESTATUS"."BASE" ) and  
				 ( "SOL_SEGURO_FALLECE"."SERIE" = "SOL_ESTATUS"."SERIE" ) and  
				 ( "SOL_SEGURO_FALLECE"."NUMERO" = "SOL_ESTATUS"."NUMERO" ) and  
				 ( "SOL_SEGURO_FALLECE"."CORRELATIVO" = "SOL_ESTATUS"."CORRELATIVO" ) and  
				 (("SOL_ESTATUS"."CODIGO_SOLICITUD" = '22' ) AND  
				 ( "SOL_ESTATUS"."ESTADO_REG" = 'A' ) AND  
				 ( "SOL_SEGURO_FALLECE"."BASE" = :is_base ) AND  
				 ( "SOL_SEGURO_FALLECE"."SERIE" = :is_serie ) AND  
				 ( "SOL_SEGURO_FALLECE"."NUMERO" = :il_numero ) AND  
				 ( "SOL_SEGURO_FALLECE"."RUT_BENEF" = :ll_rut ) AND  
				 ( "SOL_SEGURO_FALLECE"."DV_BENEF" = :ls_dv ) )   
		USING		sqlca;
		if ll_count > 0 then
			messagebox("Advertencia","Asegurado Seleccionado Tiene Solicitud VIGENTE")
		else
			if isvalid(w_mantencion_fromulario_solicitudes) then
				
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fallece_rut_benef',ll_rut)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fallece_dv_benef',ls_dv)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fallece_nombre_benef',ls_nom)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fallece_ap_paterno_benef',ls_ap_p)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fallece_ap_materno_benef',ls_ap_m)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fallece_cod_parentesco',ls_paren)
				w_mantencion_fromulario_solicitudes.dw_reporte.setitem(1,'sol_seguro_fallece_fecha_nac_benef',ldt_fecnac)
				w_mantencion_fromulario_solicitudes.dw_reporte.accepttext()
				w_mantencion_fromulario_solicitudes.dw_reporte.setfocus()
				close(w_detalle_asegurados_fallecimiento)
				
			end if
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_detalle_asegurados_fallecimiento
integer x = 3017
integer y = 1100
integer width = 274
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_asegurados_fallecimiento)
end event

type dw_lista from datawindow within w_detalle_asegurados_fallecimiento
integer x = 41
integer y = 40
integer width = 3250
integer height = 1008
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_asegurados_fallecimiento"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row > 0 then
	cb_aceptar.triggerevent(clicked!)
end if
end event

