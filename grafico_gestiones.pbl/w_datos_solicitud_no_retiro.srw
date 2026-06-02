forward
global type w_datos_solicitud_no_retiro from window
end type
type dw_imprimir_sol from datawindow within w_datos_solicitud_no_retiro
end type
type cb_2 from commandbutton within w_datos_solicitud_no_retiro
end type
type cb_imprimir from commandbutton within w_datos_solicitud_no_retiro
end type
type dw_datos from datawindow within w_datos_solicitud_no_retiro
end type
end forward

global type w_datos_solicitud_no_retiro from window
integer width = 2775
integer height = 1152
boolean titlebar = true
string title = "Datos Solicitud no Retiro"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_imprimir_sol dw_imprimir_sol
cb_2 cb_2
cb_imprimir cb_imprimir
dw_datos dw_datos
end type
global w_datos_solicitud_no_retiro w_datos_solicitud_no_retiro

on w_datos_solicitud_no_retiro.create
this.dw_imprimir_sol=create dw_imprimir_sol
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_datos=create dw_datos
this.Control[]={this.dw_imprimir_sol,&
this.cb_2,&
this.cb_imprimir,&
this.dw_datos}
end on

on w_datos_solicitud_no_retiro.destroy
destroy(this.dw_imprimir_sol)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_datos)
end on

event open;long	ll_corr

gf_centrar(w_datos_solicitud_no_retiro)
ll_corr									= long(trim(substr(1,1,Message.StringParm)))
dw_datos.settransobject(sqlca)
dw_datos.reset()
dw_datos.insertrow(0)
dw_imprimir_sol.reset()
if dw_datos.retrieve(ll_corr) = 0 then
	messagebox('Advertencia','No se Encontro Datos Asociados Solicitud Nº '+string(ll_corr))
end if
end event

type dw_imprimir_sol from datawindow within w_datos_solicitud_no_retiro
integer x = 2784
integer y = 28
integer width = 686
integer height = 824
integer taborder = 20
string title = "none"
string dataobject = "dwe_solicitud_no_retiro_sol"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_datos_solicitud_no_retiro
integer x = 2350
integer y = 896
integer width = 329
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_datos_solicitud_no_retiro)
end event

type cb_imprimir from commandbutton within w_datos_solicitud_no_retiro
integer x = 27
integer y = 896
integer width = 439
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Solicitud"
end type

event clicked;string	ls_dv,ls_sector,ls_sepultura,ls_solicitante,ls_fallecido,ls_motivo,ls_nom_titular,ls_apat_titular,ls_amat_titular,ls_titular,ls_parque
long	ll_parque,ll_indi,ll_rut
date	ld_fecha,ld_fecha_motivo

ll_indi								= dw_datos.getrow()
dw_imprimir_sol.insertrow(0)
setnull(ls_sepultura)
if not isnull(ll_indi) then
	ll_parque						= dw_datos.getitemnumber(ll_indi,'parque')
	ls_sector						= dw_datos.getitemstring(ll_indi,'sector')
	ls_sepultura					= dw_datos.getitemstring(ll_indi,'sepultura') 
	ll_rut							= dw_datos.getitemnumber(ll_indi,'rut_titular')
	ls_dv							= dw_datos.getitemstring(ll_indi,'dv_titular')
	ls_fallecido					= dw_datos.getitemstring(ll_indi,'fallecido')
	ls_solicitante				= dw_datos.getitemstring(ll_indi,'solicitante')
	ls_motivo					= dw_datos.getitemstring(ll_indi,'motivo_solicitud')
	ld_fecha_motivo			= date(dw_datos.getitemdatetime(ll_indi,'fecha_solicitud'))
	ld_fecha						= date(dw_datos.getitemdatetime(ll_indi,'solicitud_no_retro_fecha_sistema'))
	ls_nom_titular				= dw_datos.getitemstring(ll_indi,'cliente_nombre')
	ls_apat_titular				= dw_datos.getitemstring(ll_indi,'cliente_a_paterno')
	ls_amat_titular				= dw_datos.getitemstring(ll_indi,'cliente_a_materno')
	if not isnull(ls_sector) and not isnull(ls_sepultura) then
		if ll_parque=1 then
			dw_imprimir_sol.object.p_1.filename 	= 'logo_e.bmp'
		elseif ll_parque = 11 then
			dw_imprimir_sol.object.p_1.filename  	= 'logo_e_s.bmp'	
		elseif ll_parque=102 then
			dw_imprimir_sol.object.p_1.filename 	= 'logo_manantial.bmp'
		elseif ll_parque=103 then
			dw_imprimir_sol.object.p_1.filename 	= 'logo_parque_stgo.bmp'
		elseif ll_parque=101 then 
			dw_imprimir_sol.object.p_1.filename 	= 'logo_canaan.bmp'
		else
			dw_imprimir_sol.object.p_1.filename 	= 'logo_e.bmp'
		end if
		SELECT "COD_PARQ"."NOMBRE"  
		INTO 	   :ls_parque  
		FROM   "COD_PARQ"  
		WHERE "COD_PARQ"."CODIGO" = :ll_parque
		USING   sqlca;
		
		ls_titular				= ls_nom_titular+' '+ls_apat_titular+' '+ls_amat_titular
		
		if (ls_fallecido = ls_titular)  then
			ls_titular			= ls_apat_titular+' '+ls_amat_titular
			dw_imprimir_sol.object.t_4.text	= 'ADEMAS INFORMO QUE FAMILIA:'
		else
			dw_imprimir_sol.object.t_4.text	= 'ADEMAS INFORMO QUE EL TITULAR SR(A):'
		end if	
		dw_imprimir_sol.setitem(1,'parque',ls_parque)
		dw_imprimir_sol.setitem(1,'sector',ls_sector)
		dw_imprimir_sol.setitem(1,'sepultura',ls_sepultura)
		dw_imprimir_sol.setitem(1,'nombre_solicitante',ls_solicitante)
		dw_imprimir_sol.setitem(1,'nombre_fallecido',ls_fallecido)
		dw_imprimir_sol.setitem(1,'fecha_solicitud',ld_fecha)
		dw_imprimir_sol.setitem(1,'fecha_motivo',ld_fecha_motivo) //fecha_motivo
		dw_imprimir_sol.setitem(1,'titular',ls_titular)
	
		dw_imprimir_sol.object.t_motivo.text		= ls_motivo
//		dw_imprimir.accepttext()		
//		nombre_solicitante
//		dw_imprimir.setitem(1,'nombre_solicitante',ls_solicitante)
//		dw_imprimir.setitem(1,'nombre_fallecido',ls_fallecido)
//		dw_imprimir.setitem(1,'parque',ls_parque)
//		dw_imprimir.setitem(1,'titular',ls_titular)
//		dw_imprimir.setitem(1,'sector',ls_sector)
//		dw_imprimir.setitem(1,'sepultura',ls_sepultura)
//		dw_imprimir.setitem(1,'fecha_motivo',ld_fecha_motivo)
//		dw_imprimir.setitem(1,'fecha_solicitud',date(gdt_fec_sistema))		
//		dw_imprimir.object.t_motivo.text 				= ls_texto_motivo
		dw_imprimir_sol.accepttext()
		f_Print( dw_imprimir_sol )
	end if	
end if
end event

type dw_datos from datawindow within w_datos_solicitud_no_retiro
integer x = 27
integer y = 24
integer width = 2651
integer height = 836
integer taborder = 10
string title = "none"
string dataobject = "dw_solicitud_no_retiro_datos"
boolean border = false
boolean livescroll = true
end type

