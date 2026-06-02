forward
global type w_detalle_gestion_por_contrato from window
end type
type dw_por_ctto from datawindow within w_detalle_gestion_por_contrato
end type
type st_soli from statictext within w_detalle_gestion_por_contrato
end type
type cb_mostrar from commandbutton within w_detalle_gestion_por_contrato
end type
type dw_estado from datawindow within w_detalle_gestion_por_contrato
end type
type cb_imprimir from commandbutton within w_detalle_gestion_por_contrato
end type
type dw_detalle from datawindow within w_detalle_gestion_por_contrato
end type
type dw_lista from datawindow within w_detalle_gestion_por_contrato
end type
type cb_cerrar from commandbutton within w_detalle_gestion_por_contrato
end type
end forward

global type w_detalle_gestion_por_contrato from window
integer width = 3566
integer height = 2272
boolean titlebar = true
string title = "Detalle Solicitud Requerimientos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
dw_por_ctto dw_por_ctto
st_soli st_soli
cb_mostrar cb_mostrar
dw_estado dw_estado
cb_imprimir cb_imprimir
dw_detalle dw_detalle
dw_lista dw_lista
cb_cerrar cb_cerrar
end type
global w_detalle_gestion_por_contrato w_detalle_gestion_por_contrato

type variables
Long		il_row
end variables

on w_detalle_gestion_por_contrato.create
this.dw_por_ctto=create dw_por_ctto
this.st_soli=create st_soli
this.cb_mostrar=create cb_mostrar
this.dw_estado=create dw_estado
this.cb_imprimir=create cb_imprimir
this.dw_detalle=create dw_detalle
this.dw_lista=create dw_lista
this.cb_cerrar=create cb_cerrar
this.Control[]={this.dw_por_ctto,&
this.st_soli,&
this.cb_mostrar,&
this.dw_estado,&
this.cb_imprimir,&
this.dw_detalle,&
this.dw_lista,&
this.cb_cerrar}
end on

on w_detalle_gestion_por_contrato.destroy
destroy(this.dw_por_ctto)
destroy(this.st_soli)
destroy(this.cb_mostrar)
destroy(this.dw_estado)
destroy(this.cb_imprimir)
destroy(this.dw_detalle)
destroy(this.dw_lista)
destroy(this.cb_cerrar)
end on

event open;string		ls_depto,ls_cod_solic,ls_base,ls_serie,ls_sector,ls_sepultura
long		ll_num_reclamo,ll_tot_reg,ll_count,ll_cod_parque
Double	ll_numero
w_detalle_gestion_por_contrato.width	= 3579
gf_centrar(w_detalle_gestion_por_contrato)
ls_base								= substr(1,1,Message.StringParm)
ls_serie								= substr(1,2,Message.StringParm)
ll_numero							= Double(substr(1,3,Message.StringParm))
dw_por_ctto.settransobject(sqlca)
dw_detalle.dataobject 			= 'dw_detalle_gestion_detalle_2'
dw_detalle.settransobject(sqlca)
dw_lista.dataobject 				= 'dw_detalle_gestion_lista_por_ctto'
dw_lista.settransobject(sqlca)
dw_estado.settransobject(sqlca)
if dw_por_ctto.retrieve(ls_base,ls_serie,ll_numero)=0 then
	messagebox("Advertencia","No Registra Requerimiento Asociado Contrato N° "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0'))
	close(w_detalle_gestion_por_contrato)
else
	this.title								= 'Detalle Solicitud                           Cantidad Requerimientos asociados a Contrato '+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0')+'  TOTAL ( '+string(dw_por_ctto.rowcount(),'###,###,###,##0')+' )'
	dw_estado.retrieve()
	if not isnull(ll_num_reclamo) and ll_num_reclamo>0 and not isnull(ls_cod_solic) and ls_cod_solic<>'' then
		
		ll_tot_reg						= dw_lista.retrieve(ll_num_reclamo)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos")
		else
			ls_base						= dw_lista.getitemstring(1,'reclamo_solicitud_base')
			ls_serie						= dw_lista.getitemstring(1,'reclamo_solicitud_serie')
			ll_numero					= dw_lista.getitemnumber(1,'reclamo_solicitud_numero')
			ll_cod_parque				= dw_lista.getitemnumber(1,'reclamo_solicitud_cod_parque')
			ls_sector						= dw_lista.getitemstring(1,'reclamo_solicitud_sector')
			ls_sepultura					= dw_lista.getitemstring(1,'reclamo_solicitud_sepultura')
			
			if ll_numero > 0 then
				SELECT	Count("RECLAMO_SOLICITUD"."NUMERO_RECLAMO" )
				INTO		:ll_count  
				FROM 	"RECLAMO_SOLICITUD"  
				WHERE ( "RECLAMO_SOLICITUD"."BASE" = :ls_base ) AND  
						  ( "RECLAMO_SOLICITUD"."SERIE" = :ls_serie ) AND  
						  ( "RECLAMO_SOLICITUD"."NUMERO" = :ll_numero )   
				USING	sqlca;
				if ll_count > 0 then
					w_detalle_gestion.title		= 'Detalle Solicitud Requerimientos                                   Total Solicitud Generada(s) a Contrato '+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,##0')+' ( '+string(ll_count,'###,###,###,##0')+' )'
				else
					w_detalle_gestion.title		= 'Detalle Solicitud Requerimientos'
				end if
			end if
			
			if not isnull(ls_sepultura) then
				SELECT	Count("RECLAMO_SOLICITUD"."NUMERO_RECLAMO" )
				INTO		:ll_count  
				FROM 	"RECLAMO_SOLICITUD"  
				WHERE ( "RECLAMO_SOLICITUD"."COD_PARQUE" = :ll_cod_parque ) AND  
						  ( "RECLAMO_SOLICITUD"."SECTOR" = :ls_sector ) AND  
						  ( "RECLAMO_SOLICITUD"."SEPULTURA" = :ls_sepultura )   
				USING	sqlca;
				if ll_count > 0 then
					st_soli.text						= 'Total Solicitud Generada(s) a Sepultura '+ls_sector+'-'+ls_sepultura+' ( '+string(ll_count,'###,###,###,##0')+' )'
				else
					st_soli.text						= ''
				end if
			end if
		end if
	end if
end if
end event

type dw_por_ctto from datawindow within w_detalle_gestion_por_contrato
integer x = 46
integer y = 84
integer width = 3479
integer height = 588
integer taborder = 30
string title = "none"
string dataobject = "dw_retrieve_reclamos_por_ctto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_reclamo

if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
	ll_reclamo		= dw_por_ctto.getitemnumber(row,'reclamo_solicitud_numero_reclamo')
	dw_lista.retrieve(ll_reclamo)
end if

end event

event rowfocuschanged;Long		ll_reclamo

if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
	ll_reclamo		= dw_por_ctto.getitemnumber(getrow(),'reclamo_solicitud_numero_reclamo')
	dw_lista.retrieve(ll_reclamo)
end if
end event

type st_soli from statictext within w_detalle_gestion_por_contrato
integer x = 1248
integer y = 12
integer width = 2272
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_mostrar from commandbutton within w_detalle_gestion_por_contrato
integer x = 1481
integer y = 2032
integer width = 530
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mostrar Estados"
end type

event clicked;if cb_mostrar.text = 'Mostrar Estados' then
	w_detalle_gestion_por_contrato.width	= 4549
	cb_mostrar.text 	= 'No Mostrar Estados'
else
	w_detalle_gestion_por_contrato.width	= 3579
	cb_mostrar.text 	= 'Mostrar Estados'
end if
gf_centrar(w_detalle_gestion_por_contrato)
end event

type dw_estado from datawindow within w_detalle_gestion_por_contrato
integer x = 3579
integer y = 32
integer width = 933
integer height = 1924
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_tabla_codigo_recla"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_detalle_gestion_por_contrato
integer x = 59
integer y = 2032
integer width = 329
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
	dw_detalle.print()
end if

end event

type dw_detalle from datawindow within w_detalle_gestion_por_contrato
integer x = 59
integer y = 1312
integer width = 3474
integer height = 700
integer taborder = 30
string title = "none"
string dataobject = "dw_detalle_gestion_detalle_2"
boolean border = false
boolean livescroll = true
end type

type dw_lista from datawindow within w_detalle_gestion_por_contrato
integer x = 46
integer y = 696
integer width = 3479
integer height = 588
integer taborder = 10
string title = "none"
string dataobject = "dw_detalle_gestion_lista_por_ctto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long		ll_tot_reg,ll_num_reclamo,ll_cod_gestion
datetime	ldt_fec_gestion

if row>0 then
	il_row								= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_num_reclamo				= dw_lista.getitemnumber(il_row,'reclamo_solicitud_detalle_numero_reclamo')
	ll_cod_gestion					= dw_lista.getitemnumber(il_row,'reclamo_solicitud_detalle_codigo_gestion')
	ldt_fec_gestion					= dw_lista.getitemdatetime(il_row,'fecha_gestion')
	if not isnull(ll_num_reclamo) and ll_num_reclamo>0 then
		ll_tot_reg					= dw_detalle.retrieve(ll_num_reclamo,ll_cod_gestion,ldt_fec_gestion)
		if  ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos")
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar Registro")
end if
end event

event rowfocuschanged;long		ll_tot_reg,ll_num_reclamo,ll_cod_gestion
datetime	ldt_fec_gestion

if getrow()>0 then
	il_row								= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_num_reclamo				= dw_lista.getitemnumber(il_row,'reclamo_solicitud_detalle_numero_reclamo')
	ll_cod_gestion					= dw_lista.getitemnumber(il_row,'reclamo_solicitud_detalle_codigo_gestion')
	ldt_fec_gestion					= dw_lista.getitemdatetime(il_row,'fecha_gestion')
	if not isnull(ll_num_reclamo) and ll_num_reclamo>0 then
		ll_tot_reg					= dw_detalle.retrieve(ll_num_reclamo,ll_cod_gestion,ldt_fec_gestion)
		if  ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Datos")
		end if
	end if
else
//	messagebox("Advertencia","Debe Seleccionar Registro")
end if
end event

type cb_cerrar from commandbutton within w_detalle_gestion_por_contrato
integer x = 3168
integer y = 2032
integer width = 329
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_gestion_por_contrato)
end event

