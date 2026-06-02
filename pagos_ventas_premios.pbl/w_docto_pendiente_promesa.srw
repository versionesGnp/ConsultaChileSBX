forward
global type w_docto_pendiente_promesa from window
end type
type cb_imprimir from commandbutton within w_docto_pendiente_promesa
end type
type cb_grabar from commandbutton within w_docto_pendiente_promesa
end type
type cb_cerrar from commandbutton within w_docto_pendiente_promesa
end type
type dw_docto_pendiente from datawindow within w_docto_pendiente_promesa
end type
end forward

global type w_docto_pendiente_promesa from window
integer width = 3593
integer height = 1240
boolean titlebar = true
string title = "Documentos Pendientes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_imprimir cb_imprimir
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_docto_pendiente dw_docto_pendiente
end type
global w_docto_pendiente_promesa w_docto_pendiente_promesa

type variables
Long	il_mes,il_ano,il_row
string	is_nombre_dw
end variables

on w_docto_pendiente_promesa.create
this.cb_imprimir=create cb_imprimir
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_docto_pendiente=create dw_docto_pendiente
this.Control[]={this.cb_imprimir,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_docto_pendiente}
end on

on w_docto_pendiente_promesa.destroy
destroy(this.cb_imprimir)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_docto_pendiente)
end on

event open;string		ls_base,ls_serie,ls_depto,ls_tipo
long		ll_tot_reg,ll_indi
double	ldb_numero
datetime	ldt_fec_docto,ldt_fec_entrega

gf_centrar(w_docto_pendiente_promesa)
if isvalid(w_clasifica_venta) or isvalid(w_docto_pendiente_infor_detalle) then
	cb_grabar.visible											= false
	ls_base														= substr(1,1,Message.StringParm)
	ls_serie														= substr(1,2,Message.StringParm)
	ldb_numero													= double(substr(1,3,Message.StringParm))
	ldt_fec_docto												= datetime(date(substr(1,4,Message.StringParm)),time('23:59:59'))
	dw_docto_pendiente.dataobject 						= 'dw_docto_pendiente_total'			
	dw_docto_pendiente.settransobject(sqlca)
	is_nombre_dw												= 'T'	
	ll_tot_reg													= dw_docto_pendiente.retrieve(ls_base,ls_serie,ldb_numero)
	if ll_tot_reg>0 then
		dw_docto_pendiente.Object.usuario.text 		= gs_user
		for ll_indi=1 to ll_tot_reg
			ldt_fec_entrega										= dw_docto_pendiente.getitemdatetime(ll_indi,'cd_folio_detalle_excepcion_fecha_recepci')
			if ldt_fec_entrega>ldt_fec_docto then
				dw_docto_pendiente.setitem(ll_indi,"marca",1)
			end if
		next
	else
		messagebox("Advertencia","No registra datos")
		close(w_docto_pendiente_promesa)
	end if
else
	if gl_proceso>=4 then
		cb_grabar.enabled										= true
	end if
	ls_tipo														= substr(1,1,Message.StringParm)
	ls_base														= substr(1,2,Message.StringParm)
	ls_serie														= substr(1,3,Message.StringParm)
	ldb_numero													= double(substr(1,4,Message.StringParm))
	ls_depto														= substr(1,5,Message.StringParm)
	if ls_tipo = 'M' then
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie)  and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero >0 then
			dw_docto_pendiente.dataobject 				= 'dw_docto_pendiente_promesa'			
			dw_docto_pendiente.settransobject(sqlca)
			is_nombre_dw										= 'I'	
			ll_tot_reg											= dw_docto_pendiente.retrieve(ls_base,ls_serie,ldb_numero,ls_depto)
			dw_docto_pendiente.Object.usuario.text		= gs_user
			if ll_tot_reg=0 then
				messagebox("Advertencia","No registra datos")
				close(w_docto_pendiente_promesa)
			end if
		end if
	end if
end if
end event

type cb_imprimir from commandbutton within w_docto_pendiente_promesa
event ue_mousemove pbm_mousemove
integer x = 1605
integer y = 996
integer width = 334
integer height = 96
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_docto_pendiente.rowcount()>0 then
	f_Print( dw_docto_pendiente)
end if
end event

type cb_grabar from commandbutton within w_docto_pendiente_promesa
integer x = 37
integer y = 996
integer width = 334
integer height = 96
integer taborder = 140
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
end type

event clicked;
if dw_docto_pendiente.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
	if isvalid(w_docto_pendiente_estructura) then
		w_docto_pendiente_estructura.pb_aceptar.triggerevent(clicked!)
	end if
		if isvalid(w_consultar_documentos_pendientes) then
			w_consultar_documentos_pendientes.pb_ok.triggerevent(clicked!)
		elseif isvalid(w_docto_pendiente_estructura) then
			w_docto_pendiente_estructura.pb_aceptar.triggerevent(clicked!)
		end if
	close(w_docto_pendiente_promesa)
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_cerrar from commandbutton within w_docto_pendiente_promesa
integer x = 3186
integer y = 996
integer width = 334
integer height = 96
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_docto_pendiente_promesa)
end event

type dw_docto_pendiente from datawindow within w_docto_pendiente_promesa
integer x = 37
integer y = 44
integer width = 3483
integer height = 916
integer taborder = 70
string title = "none"
string dataobject = "dw_docto_pendiente_promesa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_columna

if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	ls_columna 					= dwo.name
	if ls_columna = 'estado_entrega' then
		dw_docto_pendiente.setitem(il_row,"fecha_recepcion_documento",gdt_fec_sistema)
		dw_docto_pendiente.accepttext()
	elseif ls_columna = 'cd_folio_detalle_excepcion_estado_entreg' then
		dw_docto_pendiente.setitem(il_row,"cd_folio_detalle_excepcion_fecha_recepci",gdt_fec_sistema)
		dw_docto_pendiente.setitem(il_row,"fecha_recepcion_documento",gdt_fec_sistema)
		dw_docto_pendiente.setitem(il_row,"estado_entrega",'R')
		dw_docto_pendiente.accepttext()	
	end if
	
end if
end event

event doubleclicked;string	ls_base,ls_serie,ls_string
long	ll_tot_reg,ll_excep,ll_mes,ll_ano
datetime	ldt_fec_fin
double	ldb_numero

il_row								= row
if il_row>0 then
	ll_excep						= dw_docto_pendiente.getitemnumber(il_row,'codigo_excepcion')
	if ll_excep=25 then
		ls_base					= dw_docto_pendiente.getitemstring(il_row,'base')
		ls_serie					= dw_docto_pendiente.getitemstring(il_row,'serie')
		ldb_numero				= dw_docto_pendiente.getitemnumber(il_row,'numero')
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
			SELECT	"MES_CIERRE",	"ANO_CIERRE"  
			INTO 		:ll_mes,			:ll_ano  
			FROM 	"CD_FOLIO"  
			WHERE 	( "CD_FOLIO"."BASE" = :ls_base ) AND  
						( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
						( "CD_FOLIO"."NUMERO" = :ldb_numero )
			USING	sqlca;
			if isnull(ll_mes) then ll_mes=0
			if isnull(ll_ano) then ll_ano=0
			if ll_mes>0 and ll_ano>0 then
				ldt_fec_fin			= f_fecha_fin(ll_mes,ll_ano)
				if ldt_fec_fin>=datetime(date(string('30/06/2014')),time('00:00:00')) then
					ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(il_row)
					if isvalid(w_cd_mantenedor_contrato) then close (w_cd_mantenedor_contrato)
					OpenWithparm(w_cd_mantenedor_contrato,ls_string)
				else
					messagebox("Advertencia","Contrato No Registra Detalle Modificación Contrato, Período Ventas "+string(ldt_fec_fin,'dd/mm/yyyy'))
				end if
			end if
		end if
	end if
end if
end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

