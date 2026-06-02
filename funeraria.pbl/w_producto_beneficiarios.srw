forward
global type w_producto_beneficiarios from window
end type
type cbx_serv from checkbox within w_producto_beneficiarios
end type
type dw_orden from datawindow within w_producto_beneficiarios
end type
type cb_imprimir from commandbutton within w_producto_beneficiarios
end type
type pb_2 from picturebutton within w_producto_beneficiarios
end type
type pb_3 from picturebutton within w_producto_beneficiarios
end type
type pb_4 from picturebutton within w_producto_beneficiarios
end type
type pb_5 from picturebutton within w_producto_beneficiarios
end type
type cb_grabar from commandbutton within w_producto_beneficiarios
end type
type cb_eliminar from commandbutton within w_producto_beneficiarios
end type
type cb_ingresar from commandbutton within w_producto_beneficiarios
end type
type cb_cerrar from commandbutton within w_producto_beneficiarios
end type
type gb_2 from groupbox within w_producto_beneficiarios
end type
type dw_lista from datawindow within w_producto_beneficiarios
end type
end forward

global type w_producto_beneficiarios from window
integer width = 2848
integer height = 2364
boolean titlebar = true
string title = "Ingreso Beneficiarios Servicio Funerario"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cbx_serv cbx_serv
dw_orden dw_orden
cb_imprimir cb_imprimir
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
cb_grabar cb_grabar
cb_eliminar cb_eliminar
cb_ingresar cb_ingresar
cb_cerrar cb_cerrar
gb_2 gb_2
dw_lista dw_lista
end type
global w_producto_beneficiarios w_producto_beneficiarios

type variables
String		is_base,is_serie,is_tipo_via,is_direccion,is_nro_part,is_depto_part,&
			is_block_part,is_comuna,is_ciudad,is_pob,is_sector,is_fono,is_limpiar,is_dw
Long		il_tipo_benef,il_row_eli,il_cod_parque,il_cantidad
date		idt_fecha_hoy
Double	il_numero
end variables

event open;long	ll_tot_reg,ll_indi,ll_res,ll_estado_activa

dw_lista.dataobject					= 'dw_mantenedor_producto_benef'
dw_lista.settransobject(sqlca)
if gs_user = 'MARCOS' then dw_lista.object.version.visible = true
il_tipo_benef							= long(substr(1,1,message.stringparm))
il_cod_parque							= long(substr(1,2,message.stringparm))
is_base									= substr(1,3,message.stringparm)
is_serie									= substr(1,4,message.stringparm)
il_numero								= Double(substr(1,5,message.stringparm))
il_cantidad								= long(substr(1,6,message.stringparm))
idt_fecha_hoy							= date(gdt_fec_sistema)
is_limpiar								= 'N'
w_producto_beneficiarios.width	= 2890
cbx_serv.checked						= false
gf_centrar(w_producto_beneficiarios)

if gs_depto='R' or gs_depto='B' then
	close(w_producto_beneficiarios)
else
	dw_lista.settransobject(sqlca)
	dw_lista.getchild('comuna',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.rowcount()=0 then
		idw_detalle.insertrow(0)
	end if
	
	dw_lista.settransobject(sqlca)
	dw_lista.getchild('comuna_velatorio',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.rowcount()=0 then
		idw_detalle2.insertrow(0)
	end if
	
	dw_lista.settransobject(sqlca)
	dw_lista.getchild('comuna_retiro',idw_detalle3)
	idw_detalle3.settransobject(sqlca)
	if idw_detalle3.rowcount()=0 then
		idw_detalle3.insertrow(0)
	end if
	
	dw_lista.object.t_titulo.text	= 'Ingreso Beneficiarios'
	SELECT	"TIPO_VIA",	"DIRECCION_P",	"NUMERO_PARTICULAR",	"DEPTO_PARTICULAR",	"BLOCK_PARTICULAR",	"COMUNA",	"CIUDAD",	"POBLACION",	"SECTOR",	"FONO_P"  
	INTO 		:is_tipo_via,	:is_direccion,		:is_nro_part,					:is_depto_part,				:is_block_part,				:is_comuna,	:is_ciudad,	:is_pob,			:is_sector,	:is_fono  
	FROM 	"CLIENTE"  
	WHERE 	"CLIENTE"."RUT" = :gi_rut   
	USING	sqlca;
	ll_tot_reg								= dw_lista.retrieve(is_base,is_serie,il_numero)
	if ll_tot_reg>0 then
		
		SELECT	"REVISION_CONTRATOS"."SW_ACTIVA_SERVICIO"
		INTO		:ll_estado_activa
		FROM		"REVISION_CONTRATOS"  
		WHERE	"REVISION_CONTRATOS"."BASE" = :is_base AND  
					"REVISION_CONTRATOS"."SERIE" = :is_serie AND  
					"REVISION_CONTRATOS"."NUMERO" = :il_numero 
		USING	sqlca;
		if isnull(ll_estado_activa) then ll_estado_activa=1
		
		
		if gs_depto='O' or gs_depto='V' or gs_depto='I' or gs_depto='N' or gs_depto='H' then
			if ll_estado_activa=0 and gl_proceso=1 then
				cb_grabar.enabled			= false
			else
				cb_grabar.enabled			= true
			end if
			cb_ingresar.enabled			= true
			cb_eliminar.enabled			= true
			dw_lista.enabled				= true
			is_dw								= 'S'
		else
			cb_grabar.enabled				= false
			cb_ingresar.enabled			= false
			cb_eliminar.enabled			= false
			dw_lista.enabled				= false
			is_dw								= 'N'
		end if
	else
		if gs_depto='O' or  gs_depto='V' or gs_depto='I' or gs_depto='N' or gs_depto='H' then
			cb_grabar.enabled				= true
			cb_ingresar.enabled			= false
			cb_eliminar.enabled			= true
			dw_lista.enabled				= true
			is_dw								= 'S'
			if isvalid(w_validar_promesa_operaciones) then
				ll_res							= 1
			else
				ll_res							= MessageBox("Advertencia", 'Desea Ingresar Beneficiarios Servicio Funerario', Exclamation!, YesNo!, 2)
			end if
			if ll_res=1 then
				cb_ingresar.triggerevent(Clicked!)
			else
				close(w_producto_beneficiarios)
			end if
		else
			MessageBox("Advertencia", 'Usuario No Autorizado Ingresar Beneficiarios Servicio Funerario')
			close(w_producto_beneficiarios)
		end if
	end if
end if
end event

on w_producto_beneficiarios.create
this.cbx_serv=create cbx_serv
this.dw_orden=create dw_orden
this.cb_imprimir=create cb_imprimir
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.cb_grabar=create cb_grabar
this.cb_eliminar=create cb_eliminar
this.cb_ingresar=create cb_ingresar
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.dw_lista=create dw_lista
this.Control[]={this.cbx_serv,&
this.dw_orden,&
this.cb_imprimir,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.pb_5,&
this.cb_grabar,&
this.cb_eliminar,&
this.cb_ingresar,&
this.cb_cerrar,&
this.gb_2,&
this.dw_lista}
end on

on w_producto_beneficiarios.destroy
destroy(this.cbx_serv)
destroy(this.dw_orden)
destroy(this.cb_imprimir)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.cb_grabar)
destroy(this.cb_eliminar)
destroy(this.cb_ingresar)
destroy(this.cb_cerrar)
destroy(this.gb_2)
destroy(this.dw_lista)
end on

type cbx_serv from checkbox within w_producto_beneficiarios
integer x = 1993
integer y = 2140
integer width = 485
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Detalle Servicio"
end type

event clicked;long	ll_tot_reg

if cbx_serv.checked = true then
	w_producto_beneficiarios.width		= 4200
elseif cbx_serv.checked = false then
	w_producto_beneficiarios.width		= 2890
end if
gf_centrar(w_producto_beneficiarios)
end event

type dw_orden from datawindow within w_producto_beneficiarios
integer x = 992
integer y = 2360
integer width = 686
integer height = 176
string title = "none"
string dataobject = "dwe_imprimir_orden_servicio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_producto_beneficiarios
integer x = 343
integer y = 2128
integer width = 485
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprmir Orden Serv."
end type

event clicked;string	ls_base,ls_serie
long	ll_row,ll_rut,ll_tot_reg
double ldb_numero

dw_lista.accepttext()
dw_orden.settransobject(sqlca)
if dw_lista.getrow()>0 then
	ll_row				= dw_lista.getrow()
	ls_base			= dw_lista.getitemstring(ll_row,'base')
	ls_serie			= dw_lista.getitemstring(ll_row,'serie')
	ldb_numero		= dw_lista.getitemnumber(ll_row,'numero')
	ll_rut				= dw_lista.getitemnumber(ll_row,'rut')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
		ll_tot_reg		= dw_orden.retrieve(ls_base,ls_serie,ldb_numero,ll_rut)
		if ll_tot_reg>0 then
			dw_orden.object.usuario.text							= gs_user
			f_Print( dw_orden )
		end if
	end if
end if
end event

type pb_2 from picturebutton within w_producto_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 1449
integer y = 2132
integer width = 119
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
end event

type pb_3 from picturebutton within w_producto_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 1568
integer y = 2132
integer width = 119
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila
ll_fila				= dw_lista.getrow() - 1
if ll_fila<1 then ll_fila=1
dw_lista.Scrolltorow(ll_fila)
end event

type pb_4 from picturebutton within w_producto_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 1687
integer y = 2132
integer width = 119
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila,ll_tot_reg
ll_tot_reg			= dw_lista.rowcount()
ll_fila					= dw_lista.getrow() + 1
if ll_fila>ll_tot_reg then ll_fila=ll_tot_reg
dw_lista.Scrolltorow(ll_fila)
end event

type pb_5 from picturebutton within w_producto_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 1806
integer y = 2132
integer width = 119
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_tot_reg
ll_tot_reg			= dw_lista.rowcount()
dw_lista.ScrollToRow(ll_tot_reg)
end event

type cb_grabar from commandbutton within w_producto_beneficiarios
integer x = 46
integer y = 2128
integer width = 274
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_pasa,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_parent,ls_direc,ls_nro_part,ls_ciudad,ls_comuna,ls_sexo,ls_fono,ls_depto_p,ls_block_p,ls_poblac,ls_contacto,ls_celular,&
			ls_moneda_cta_mortuoria
long		ll_tot_reg,ll_indi,ll_rut,ll_existe,ll_estado_activa,ll_count_serv,ll_cod_serv,ll_count_pago_benef
Double	ldb_valor_cta_mortuoria,ll_total
datetime	ldt_fec_nac

dw_lista.accepttext()
ll_tot_reg							= dw_lista.rowcount()
ls_pasa								= 'N'
if ll_tot_reg>0 then
	SELECT 	Count("PRODUCTO_GESTION_SERVICIO"."BASE")
	INTO 		:ll_count_serv  
	FROM 	"PRODUCTO_GESTION_SERVICIO"  
	WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :is_base ) AND  
				( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :is_serie ) AND  
				( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :il_numero ) AND  
				( "PRODUCTO_GESTION_SERVICIO"."ESTADO_REGISTRO" = 'A' )   ;
	if isnull(ll_count_serv) then ll_count_serv=0
	if ll_tot_reg<=il_cantidad then
		ls_pasa						= 'S'
	else
		ls_pasa						= 'N'
	end if
	if ls_pasa='S' then
		for ll_indi=1 to ll_tot_reg
			ll_rut						= dw_lista.getitemnumber(ll_indi,'rut')
			ls_dv						= dw_lista.getitemstring(ll_indi,'dv')
			ls_nombre				= dw_lista.getitemstring(ll_indi,'nombre')
			ls_ap_pat				= dw_lista.getitemstring(ll_indi,'a_paterno')
			ls_ap_mat				= dw_lista.getitemstring(ll_indi,'a_materno')
			ls_parent					= dw_lista.getitemstring(ll_indi,'parentesco')
			ldt_fec_nac				= dw_lista.getitemdatetime(ll_indi,'fecha_nac')
			ls_tipo_via				= dw_lista.getitemstring(ll_indi,'tipo_via')
			ls_direc					= dw_lista.getitemstring(ll_indi,'direccion_p')
			ls_nro_part				= dw_lista.getitemstring(ll_indi,'numero_p')
			ls_depto_p				= dw_lista.getitemstring(ll_indi,'depto_p')
			ls_block_p				= dw_lista.getitemstring(ll_indi,'block_p')
			ls_ciudad					= dw_lista.getitemstring(ll_indi,'ciudad')
			ls_comuna				= dw_lista.getitemstring(ll_indi,'comuna')
			ls_poblac					= dw_lista.getitemstring(ll_indi,'poblacion')
			ls_sexo					= dw_lista.getitemstring(ll_indi,'sexo')
			
			ls_contacto				= dw_lista.getitemstring(ll_indi,'contacto_nombre')
			ls_fono					= dw_lista.getitemstring(ll_indi,'fono_p')
			ls_celular				= dw_lista.getitemstring(ll_indi,'contacto_fono_celular')
			
			if isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar Rut Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('rut')
				exit
			elseif isnull(ls_dv) or ls_dv='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('dv')
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre Beneficiario Fila   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('nombre')
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('a_paterno')
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('a_materno')
				exit
			elseif isnull(il_tipo_benef) or il_tipo_benef=0 then
				messagebox("Advertencia","Debe Ingresar Tipo Seguro del Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('tipo_beneficiario')
				exit
			elseif isnull(ls_parent) or ls_parent='' then
				messagebox("Advertencia","Debe Ingresar Parentesco Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('parentesco')
				exit	
			elseif isnull(ldt_fec_nac) then
				messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('fecha_nac')
				exit	
			elseif isnull(ls_sexo) or ls_sexo='' then
				messagebox("Advertencia","Debe Ingresar Sexo   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('sexo')
				exit
			elseif isnull(ls_tipo_via) or ls_tipo_via='' then
				messagebox("Advertencia","Debe Ingresar Tipo Via   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('tipo_via')
				exit
			elseif isnull(ls_direc) or ls_direc='' then
				messagebox("Advertencia","Debe Ingresar Dirección   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('direccion_p')
				exit
			elseif isnull(ls_nro_part) or ls_nro_part='' then
				messagebox("Advertencia","Debe Ingresar Número Dirección   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('numero_p')
				exit
			elseif isnull(ls_comuna) or ls_comuna='' then
				messagebox("Advertencia","Debe Ingresar Comuna   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('comuna')
				exit
			elseif isnull(ls_ciudad) or ls_ciudad='' then
				messagebox("Advertencia","Debe Ingresar Ciudad   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ciudad')
				exit
			elseif isnull(ls_depto_p) or ls_depto_p='' then
				dw_lista.setitem(ll_indi,'depto_p','-')
			elseif isnull(ls_block_p) or ls_block_p='' then
				dw_lista.setitem(ll_indi,'block_p','-')
			elseif isnull(ls_poblac) or ls_poblac='' then
				dw_lista.setitem(ll_indi,'poblacion','-')
			
			ls_contacto				= dw_lista.getitemstring(ll_indi,'contacto_nombre')
			ls_fono					= dw_lista.getitemstring(ll_indi,'fono_p')
			ls_celular				= dw_lista.getitemstring(ll_indi,'contacto_fono_celular')
		
			elseif isnull(ls_contacto) or ls_contacto='' then
				messagebox("Advertencia","Debe Ingresar Nombre Encargado Servicio   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('contacto_nombre')
				exit	
			elseif isnull(ls_fono) or ls_fono='' then
				messagebox("Advertencia","Debe Ingresar Fono Particular   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('fono_p')
				exit	
			elseif isnull(ls_celular) or ls_celular='' then
				messagebox("Advertencia","Debe Ingresar Fono Particular   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('contacto_fono_celular')
				exit	
			end if
			dw_lista.accepttext()
		next
		
		if ls_pasa='S' then
			if dw_lista.update()=1 then
				commit;
				
				SELECT DISTINCT	"REVISION_CONTRATOS"."CODIGO_SERVICIO",   	"PRODUCTO_TIPO_SERVICIO"."VALOR_CTA_MORTUORIA" ,   	"PRODUCTO_TIPO_SERVICIO"."MONEDA_CTA_MORTUORIA"   
				INTO 		:ll_cod_serv,   												:ldb_valor_cta_mortuoria,												:ls_moneda_cta_mortuoria
				FROM 	"REVISION_CONTRATOS",   	"PRODUCTO_TIPO_SERVICIO"  
				WHERE 	( "REVISION_CONTRATOS"."COD_PARQUE" = "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" ) and  
							( "REVISION_CONTRATOS"."CODIGO_SERVICIO" = "PRODUCTO_TIPO_SERVICIO"."CODIGO_SERVICIO" ) and  
							( "REVISION_CONTRATOS"."SERIE" = "PRODUCTO_TIPO_SERVICIO"."SERIE" ) and  
							( "REVISION_CONTRATOS"."COD_PARQUE" = "PRODUCTO_TIPO_SERVICIO"."COD_PARQUE" ) and  
							( ( "REVISION_CONTRATOS"."BASE" = :is_base ) AND  
							( "REVISION_CONTRATOS"."SERIE" = :is_serie ) AND  
							( "REVISION_CONTRATOS"."NUMERO" = :il_numero ) )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if ls_moneda_cta_mortuoria='1' then
						ll_total						= ldb_valor_cta_mortuoria
					elseif ls_moneda_cta_mortuoria='2' then
						ll_total						= round(ldb_valor_cta_mortuoria * gd_uf_dia,0)
					end if
							
					if is_base='F' and ll_cod_serv >= 670 and ll_cod_serv <= 674 then
						for ll_indi=1 to ll_tot_reg
							ll_rut						= dw_lista.getitemnumber(ll_indi,'rut')
							ls_dv						= dw_lista.getitemstring(ll_indi,'dv')
							ls_nombre				= dw_lista.getitemstring(ll_indi,'nombre')
							ls_ap_pat				= dw_lista.getitemstring(ll_indi,'a_paterno')
							ls_ap_mat				= dw_lista.getitemstring(ll_indi,'a_materno')
						
							UPDATE	"PRODUCTO_BENEFICIARIO"  
							SET 		"USUARIO_MODIF" = :gs_user,   
										"FECHA_MODIF" = :gdt_fec_sistema  
							WHERE	( "PRODUCTO_BENEFICIARIO"."BASE" = :is_base ) AND  
										( "PRODUCTO_BENEFICIARIO"."SERIE" = :is_serie ) AND  
										( "PRODUCTO_BENEFICIARIO"."NUMERO" = :il_numero ) AND  
										( "PRODUCTO_BENEFICIARIO"."RUT" = :ll_rut )
							USING	sqlca;
							if sqlca.sqlcode = 0 then
								commit using sqlca;
							else
								rollback using sqlca;
							end if
							if ll_count_serv > 0 then
								UPDATE 	"PRODUCTO_GESTION_SERVICIO"  
								SET 		"RUT_BENEFICIARIO" = :ll_rut,   
											"DV_BENEFICIARIO" = :ls_dv,
											"SW_ACTIVACION" = 2
								WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :is_base ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :is_serie ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :il_numero ) AND  
											( "PRODUCTO_GESTION_SERVICIO"."CORRELATIVO" = :ll_indi )  
								USING	sqlca;
								if sqlca.sqlcode = 0 then
									commit using sqlca;
//									SELECT 	COUNT("PRODUCTO_INGRESO"."BASE") 
//									INTO 		:ll_count_pago_benef  
//									FROM 	"PRODUCTO_INGRESO"  
//									WHERE 	( "PRODUCTO_INGRESO"."BASE" = :is_base ) AND  
//												( "PRODUCTO_INGRESO"."SERIE" = :is_serie ) AND  
//												( "PRODUCTO_INGRESO"."NUMERO" = :il_numero ) AND  
//												( "PRODUCTO_INGRESO"."RUT_BENEFICIARIO" = :ll_rut )   ;
//									if isnull(ll_count_pago_benef) then ll_count_pago_benef=0
//									if ll_count_pago_benef=0 then
//										INSERT INTO "PRODUCTO_INGRESO"  
//													( "BASE", 	"SERIE", 		"NUMERO", 		"TIPO_COB", 	"FOLIO", 		"FECHA_PAGO", 	"PAGO_HIST",	"MONTO",	"CAJA",		"USUARIO",	"RUT_BENEFICIARIO",	"VALOR_CTA_MORTUORIA",	"MONEDA_CTA_MORTUORIA",	"UF_CTA_MORTUORIA" )  
//										VALUES 	( :is_base,	:is_serie,   	:il_numero,   	'FA',   			:ll_rut,   		:gd_hoy,   			'A',				:ll_total,		:gs_caja,		:gs_user,	:ll_rut,						:ldb_valor_cta_mortuoria,		:ls_moneda_cta_mortuoria,		:gd_uf_dia)  
//										USING	sqlca;
//										if sqlca.sqlcode = 0 then
//											commit using sqlca;
//										else
//											rollback using sqlca;
//										end if
//									end if
								else
									rollback using sqlca;
								end if
							end if
						next
						if ll_count_serv > ll_tot_reg and ll_count_serv > 0 then
							UPDATE 	"PRODUCTO_GESTION_SERVICIO"  
							SET 		"RUT_BENEFICIARIO" = null,   
										"DV_BENEFICIARIO" = null,
										"SW_ACTIVACION" = 1,
										"FECHA_ACTIVACION" = null,
										"USUARIO_ACTIVACION" = null
							WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :is_base ) AND  
										( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :is_serie ) AND  
										( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :il_numero ) AND  
										( "PRODUCTO_GESTION_SERVICIO"."CORRELATIVO" > :ll_tot_reg )  
							USING	sqlca;
							if sqlca.sqlcode = 0 then
								commit using sqlca;
							else
								rollback using sqlca;
							end if
						end if 
					end if
				end if
				messagebox("Grabar","Grabación Exitosa")
				
				if isvalid(w_ingresar_funeraria) or isvalid(w_validar_promesa_operaciones)  then
					//w_ingresar_funeraria.dw_anexo_funeraria.object.t_seguro.font.italic = 1
					cb_cerrar.triggerevent(clicked!)
				end if
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		end if
	else
		messagebox("Advertencia","No puede Ingresar más de "+string(il_cantidad)+' Beneficiarios')
	end if
end if
end event

type cb_eliminar from commandbutton within w_producto_beneficiarios
integer x = 1134
integer y = 2128
integer width = 247
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;long	ll_resp,ll_tot_reg,ll_indi,ll_folio
string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_nom_comp

dw_lista.accepttext()
if il_row_eli > 0 and dw_lista.rowcount()>0 then
	ls_nombre						= dw_lista.getitemstring(il_row_eli,'nombre')
	ls_ap_pat						= dw_lista.getitemstring(il_row_eli,'a_paterno')
	ls_ap_mat						= dw_lista.getitemstring(il_row_eli,'a_materno')
	ls_nom_comp					= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
	ll_resp							= MessageBox("Eliminar", "Está Seguro Eliminar Beneficiario Nº "+string(il_row_eli)+ ' ' +ls_nom_comp+", recuerde Grabar antes de Cerrar Ventana", Exclamation!, YesNo!, 2)
	if ll_resp = 1 then
		dw_lista.setitem(il_row_eli,'estado_reg','A')
		dw_lista.setitem(il_row_eli,'fec_elimina',gdt_fec_sistema)
		dw_lista.setitem(il_row_eli,'usuario_elimina',gs_user)
		dw_lista.accepttext()
		if dw_lista.update()=1 then
			commit;
			ll_tot_reg				= dw_lista.retrieve(is_base,is_serie,il_numero)
			for ll_indi=1 to ll_tot_reg
				ll_folio				= dw_lista.getitemnumber(ll_indi,'folio')
				dw_lista.setitem(ll_indi,'folio',ll_indi)
				dw_lista.accepttext()
			next
			if dw_lista.update()=1 then
				commit;
				messagebox("Eliminar","Registro Eliminado")
			else
				rollback;
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_ingresar from commandbutton within w_producto_beneficiarios
integer x = 891
integer y = 2128
integer width = 247
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ingresar"
end type

event clicked;string		ls_pasa='N',ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_parent,ls_direc,&
			ls_nro_part,ls_ciudad,ls_comuna,ls_sexo,ls_fono,ls_depto_p,ls_block_p,ls_poblac,ls_nulo
long		ll_tot_reg,ll_indi,ll_rut,ll_new,ll_nulo,ll_folio
datetime	ldt_fec_nac,ldt_nulo

setnull(ls_nulo);setnull(ll_nulo);setnull(ldt_nulo)
dw_lista.accepttext()
ll_tot_reg						= dw_lista.rowcount()
if ll_tot_reg=0 then
	ll_folio						= 1	
	ll_new						= dw_lista.insertrow(0)
	dw_lista.scrolltorow(ll_new)
	dw_lista.setitem(ll_new,'folio',ll_folio)
	dw_lista.setitem(ll_new,'base',is_base)
	dw_lista.setitem(ll_new,'serie',is_serie)
	dw_lista.setitem(ll_new,'numero',il_numero)
	dw_lista.setitem(ll_new,'tipo_beneficiario',il_tipo_benef)
	dw_lista.setitem(ll_new,'fono_p',is_fono)
	dw_lista.setitem(ll_new,'tipo_via',is_tipo_via)
	dw_lista.setitem(ll_new,'direccion_p',is_direccion)
	dw_lista.setitem(ll_new,'numero_p',is_nro_part)
	dw_lista.setitem(ll_new,'depto_p',is_depto_part)
	dw_lista.setitem(ll_new,'block_p',is_block_part)
	dw_lista.setitem(ll_new,'ciudad',is_ciudad)
	idw_detalle.retrieve(is_ciudad)
	dw_lista.setitem(ll_new,'comuna',is_comuna)
	dw_lista.setitem(ll_new,'poblacion',is_pob)
	dw_lista.setitem(ll_new,'estado_reg','V')
	dw_lista.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
	dw_lista.setitem(ll_new,'usuario_crea',gs_user)
	
	dw_lista.setitem(ll_new,'rut',ll_nulo)
	dw_lista.setitem(ll_new,'dv',ls_nulo)
	dw_lista.setitem(ll_new,'nombre',ls_nulo)
	dw_lista.setitem(ll_new,'a_paterno',ls_nulo)
	dw_lista.setitem(ll_new,'a_materno',ls_nulo)
	dw_lista.setitem(ll_new,'parentesco',ls_nulo)
	dw_lista.setitem(ll_new,'fecha_nac',ldt_nulo)
	dw_lista.setitem(ll_new,'sexo',ls_nulo)
	dw_lista.setfocus()
	dw_lista.setcolumn('rut')
else
	if ll_tot_reg < il_cantidad then
		ls_pasa						='S'
		for ll_indi=1 to ll_tot_reg
			ll_folio					= dw_lista.getitemnumber(ll_indi,'folio')
			ll_rut						= dw_lista.getitemnumber(ll_indi,'rut')
			ls_dv						= dw_lista.getitemstring(ll_indi,'dv')
			ls_nombre				= dw_lista.getitemstring(ll_indi,'nombre')
			ls_ap_pat				= dw_lista.getitemstring(ll_indi,'a_paterno')
			ls_ap_mat				= dw_lista.getitemstring(ll_indi,'a_materno')
			ls_parent					= dw_lista.getitemstring(ll_indi,'parentesco')
			ldt_fec_nac				= dw_lista.getitemdatetime(ll_indi,'fecha_nac')
			ls_fono					= dw_lista.getitemstring(ll_indi,'fono_p')
			ls_tipo_via				= dw_lista.getitemstring(ll_indi,'tipo_via')
			ls_direc					= dw_lista.getitemstring(ll_indi,'direccion_p')
			ls_nro_part				= dw_lista.getitemstring(ll_indi,'numero_p')
			ls_depto_p				= dw_lista.getitemstring(ll_indi,'depto_p')
			ls_block_p				= dw_lista.getitemstring(ll_indi,'block_p')
			ls_ciudad					= dw_lista.getitemstring(ll_indi,'ciudad')
			ls_comuna				= dw_lista.getitemstring(ll_indi,'comuna')
			ls_poblac					= dw_lista.getitemstring(ll_indi,'poblacion')
			ls_sexo					= dw_lista.getitemstring(ll_indi,'sexo')
			if isnull(ll_rut) or ll_rut=0 then
				messagebox("Advertencia","Debe Ingresar Rut Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('rut')
				exit
			elseif isnull(ls_dv) or ls_dv='' then
				messagebox("Advertencia","Debe Ingresar Digito Verificador Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('dv')
				exit
			elseif isnull(ls_nombre) or ls_nombre='' then
				messagebox("Advertencia","Debe Ingresar Nombre Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('nombre')
				exit
			elseif isnull(ls_ap_pat) or ls_ap_pat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Paterno Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('a_paterno')
				exit
			elseif isnull(ls_ap_mat) or ls_ap_mat='' then
				messagebox("Advertencia","Debe Ingresar Apellido Materno Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('a_materno')
				exit
			elseif isnull(il_tipo_benef) or il_tipo_benef=0 then
				messagebox("Advertencia","Debe Ingresar Tipo Seguro del Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('tipo_beneficiario')
				exit
			elseif isnull(ls_parent) or ls_parent='' then
				messagebox("Advertencia","Debe Ingresar Parentesco Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('parentesco')
				exit	
			elseif isnull(ldt_fec_nac) then
				messagebox("Advertencia","Debe Ingresar Fecha Nacimiento Beneficiario   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('fecha_nac')
				exit	
			elseif isnull(ls_fono) or ls_fono='' then
				messagebox("Advertencia","Debe Ingresar Fono Particular   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('fono_p')
				exit	
			elseif isnull(ls_tipo_via) or ls_tipo_via='' then
				messagebox("Advertencia","Debe Ingresar Tipo Via   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('tipo_via')
				exit
			elseif isnull(ls_direc) or ls_direc='' then
				messagebox("Advertencia","Debe Ingresar Dirección   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('direccion_p')
				exit
			elseif isnull(ls_nro_part) or ls_nro_part='' then
				messagebox("Advertencia","Debe Ingresar Número Dirección   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('numero_p')
				exit
			elseif isnull(ls_depto_p) or ls_depto_p='' then
				messagebox("Advertencia","Debe Ingresar Departamento   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('depto_p')
				exit	
			elseif isnull(ls_block_p) or ls_block_p='' then
				messagebox("Advertencia","Debe Ingresar Block   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('block_p')
				exit	
			elseif isnull(ls_ciudad) or ls_ciudad='' then
				messagebox("Advertencia","Debe Ingresar Ciudad   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('ciudad')
				exit
			elseif isnull(ls_comuna) or ls_comuna='' then
				messagebox("Advertencia","Debe Ingresar Comuna   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('comuna')
				exit
			elseif isnull(ls_poblac) or ls_poblac='' then
				messagebox("Advertencia","Debe Ingresar Villa o Población   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('poblacion')
				exit	
			elseif isnull(ls_sexo) or ls_sexo='' then
				messagebox("Advertencia","Debe Ingresar Sexo   Reg Nº: "+string(ll_indi))
				ls_pasa				= 'N'
				dw_lista.setfocus()
				dw_lista.scrolltorow(ll_indi)
				dw_lista.setcolumn('sexo')
				exit
			end if
		next
		
		if ls_pasa='S' then
//			SELECT	max("FOLIO")  
//    			INTO		:ll_folio  
//    			FROM		"PRODUCTO_BENEFICIARIO"  
//  			WHERE 	( "PRODUCTO_BENEFICIARIO"."BASE" = :is_base ) AND  
//         				( "PRODUCTO_BENEFICIARIO"."SERIE" = :is_serie ) AND  
//         				( "PRODUCTO_BENEFICIARIO"."NUMERO" = :il_numero ) AND  
//         				( "PRODUCTO_BENEFICIARIO"."ESTADO_REG" = 'V' )
//			USING	sqlca;
//			if isnull(ll_folio) or ll_folio=0 then ll_folio=0
			ll_folio					= ll_folio + 1	
			ll_new					= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
			dw_lista.setitem(ll_new,'folio',ll_folio)
			dw_lista.setitem(ll_new,'base',is_base)
			dw_lista.setitem(ll_new,'serie',is_serie)
			dw_lista.setitem(ll_new,'numero',il_numero)
			dw_lista.setitem(ll_new,'tipo_beneficiario',il_tipo_benef)
			dw_lista.setitem(ll_new,'fono_p',is_fono)
			dw_lista.setitem(ll_new,'tipo_via',is_tipo_via)
			dw_lista.setitem(ll_new,'direccion_p',is_direccion)
			dw_lista.setitem(ll_new,'numero_p',is_nro_part)
			dw_lista.setitem(ll_new,'depto_p',is_depto_part)
			dw_lista.setitem(ll_new,'block_p',is_block_part)
			dw_lista.setitem(ll_new,'ciudad',is_ciudad)
			idw_detalle.retrieve(is_ciudad)
			dw_lista.setitem(ll_new,'comuna',is_comuna)
			dw_lista.setitem(ll_new,'poblacion',is_pob)
			dw_lista.setitem(ll_new,'estado_reg','V')
			dw_lista.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
			dw_lista.setitem(ll_new,'usuario_crea',gs_user)
			
			dw_lista.setitem(ll_new,'rut',ll_nulo)
			dw_lista.setitem(ll_new,'dv',ls_nulo)
			dw_lista.setitem(ll_new,'nombre',ls_nulo)
			dw_lista.setitem(ll_new,'a_paterno',ls_nulo)
			dw_lista.setitem(ll_new,'a_materno',ls_nulo)
			dw_lista.setitem(ll_new,'parentesco',ls_nulo)
			dw_lista.setitem(ll_new,'fecha_nac',ldt_nulo)
			dw_lista.setitem(ll_new,'sexo',ls_nulo)
			dw_lista.setfocus()
			dw_lista.setcolumn('rut')
		end if
	else
		messagebox("Advertencia","No puede Ingresar más de "+string(il_cantidad)+' Beneficiarios')
	end if
end if
end event

type cb_cerrar from commandbutton within w_producto_beneficiarios
integer x = 2496
integer y = 2128
integer width = 293
integer height = 96
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_producto_beneficiarios)
end event

type gb_2 from groupbox within w_producto_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 1426
integer y = 2084
integer width = 521
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217750
long backcolor = 67108864
end type

type dw_lista from datawindow within w_producto_beneficiarios
integer x = 46
integer y = 16
integer width = 4087
integer height = 2092
integer taborder = 10
string title = "none"
string dataobject = "dw_mantenedor_producto_benef"
boolean maxbox = true
boolean border = false
end type

event itemchanged;string	ls_dv,ls_ciudad,ls_nulo,ls_columna,ls_ciudad_vel,ls_ciudad_ret,ls_dw
long	ll_rut,ll_cta_rut,ll_nulo
ls_dw													= 		is_dw

setnull(ls_nulo);setnull(ll_nulo)
this.accepttext()

if row>0 then
	il_row_eli										= row
	ls_columna										= dwo.name
	if ls_columna = 'rut' or ls_columna = 'dv' then
		ll_rut											= dw_lista.getitemnumber(row,'rut')
		ls_dv											= dw_lista.getitemstring(row,'dv')
		if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es Válido',stopsign!)
				dw_lista.setitem(row,'rut',ll_rut)
				cb_grabar.enabled					= false
				dw_lista.setitem(row,"estado_rut",0)
				dw_lista.setitem(row,'dv',ls_nulo)
				dw_lista.setfocus()
				dw_lista.setcolumn('dv')
			else
				cb_grabar.enabled					= true
				dw_lista.setitem(row,"estado_rut",1)
				dw_lista.setfocus()
				dw_lista.setcolumn('nombre')	
			end if 
		end if
		SELECT	count("RUT")  
		INTO 		:ll_cta_rut  
		FROM 	"PRODUCTO_BENEFICIARIO"  
		WHERE	"PRODUCTO_BENEFICIARIO"."BASE" = :is_base AND
					"PRODUCTO_BENEFICIARIO"."SERIE" = :is_serie AND
					"PRODUCTO_BENEFICIARIO"."NUMERO" = :il_numero AND
					"PRODUCTO_BENEFICIARIO"."RUT" = :ll_rut AND
					"PRODUCTO_BENEFICIARIO"."ESTADO_REG" = 'V'
		USING	sqlca;
		if isnull(ll_cta_rut) or ll_cta_rut=0 then ll_cta_rut=0
		if ll_cta_rut>0 then
			messagebox("Advertencia","Existe Beneficiario Vigente RUT: "+string(ll_rut,'###,###,###')+" Asociado al Contrato: "+is_base+"-"+is_serie+"-"+string(il_numero,'###,###,###'))
			cb_grabar.enabled						= false
			dw_lista.setitem(row,"estado_rut",0)
			is_limpiar								= 'S'
			dw_lista.setitem(row,"rut",ll_nulo)
			dw_lista.setitem(row,'dv',ls_nulo)
			dw_lista.setfocus()
			dw_lista.setcolumn('rut')
		end if
	elseif ls_columna='ciudad' then
		ls_ciudad								= dw_lista.getitemstring(row,'ciudad')
		if not isnull(ls_ciudad) and ls_ciudad<>'' then
			idw_detalle.retrieve(ls_ciudad)
		end if
		if ls_ciudad='999' then
			dw_lista.setitem(row,'comuna','999')
		end if
		if ls_ciudad='0' then
			dw_lista.setitem(row,'comuna','0')
		end if
	elseif ls_columna='ciudad_velatorio' then
		ls_ciudad_vel						= dw_lista.getitemstring(row,'ciudad_velatorio')
		if not isnull(ls_ciudad_vel) and ls_ciudad_vel<>'' then
			idw_detalle2.retrieve(ls_ciudad_vel)
		end if
		if ls_ciudad_vel='999' then
			dw_lista.setitem(row,'comuna_velatorio','999')
		end if
		if ls_ciudad_vel='0' then
			dw_lista.setitem(row,'comuna_velatorio','0')
		end if
		
	elseif ls_columna='ciudad_retiro' then
		ls_ciudad_ret					= dw_lista.getitemstring(row,'ciudad_retiro')
		if not isnull(ls_ciudad_ret) and ls_ciudad_ret<>'' then
			idw_detalle3.retrieve(ls_ciudad_ret)
		end if
		if ls_ciudad_ret='999' then
			dw_lista.setitem(row,'comuna_retiro','999')
		end if
		if ls_ciudad_ret='0' then
			dw_lista.setitem(row,'comuna_retiro','0')
		end if
	end if
end if
dw_lista.accepttext()
end event

event clicked;string		ls_columna,ls_fecha,ls_parent,ls_dw
long		ll_opc_01,ll_opc_02
datetime	ldt_nulo
ls_dw										= is_dw

this.accepttext()
setnull(ldt_nulo)

if row>0 then il_row_eli = row

ls_columna								= dwo.name
if ls_columna='p_fec_nac' then
	ls_fecha								= string(date(dw_lista.getitemdatetime(row,'fecha_nac')))
	if isnull(ls_fecha) then ls_fecha = string(idt_fecha_hoy,"dd/mm/yyyy")
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_lista.setitem(row,'fecha_nac',datetime(string(idt_fecha_hoy,gs_formato_fecha)))
		return
	end if
	OpenWithParm(w_calendar,ls_fecha)
	if not isnull(Message.StringParm) THEN
		ls_fecha					= trim(Message.StringParm)
		dw_lista.setitem(row,'fecha_nac',date(ls_fecha))
	end if
	dw_lista.setcolumn('fecha_nac')
end if
dw_lista.accepttext()
end event

event rowfocuschanged;string	ls_ciudad,ls_ciudad_vel,ls_ciudad_ret,ls_dw
long	ll_opc_01
ls_dw												= 		is_dw

this.accepttext()
if getrow()>0 then
	il_row_eli			=  getrow()
	ls_ciudad				= dw_lista.getitemstring(il_row_eli,'ciudad')
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		idw_detalle.retrieve(ls_ciudad)
	end if
	if ls_ciudad='999' then
		dw_lista.setitem(il_row_eli,'comuna','999')
	end if
	if ls_ciudad='0' then
		dw_lista.setitem(il_row_eli,'comuna','0')
	end if
	
	ls_ciudad_vel			= dw_lista.getitemstring(il_row_eli,'ciudad_velatorio')
	if not isnull(ls_ciudad_vel) and ls_ciudad_vel<>'' then
		idw_detalle2.retrieve(ls_ciudad_vel)
	end if
	if ls_ciudad_vel='999' then
		dw_lista.setitem(il_row_eli,'comuna_velatorio','999')
	end if
	if ls_ciudad_vel='0' then
		dw_lista.setitem(il_row_eli,'comuna_velatorio','0')
	end if
	
	ls_ciudad_ret					= dw_lista.getitemstring(il_row_eli,'ciudad_retiro')
	if not isnull(ls_ciudad_ret) and ls_ciudad_ret<>'' then
		idw_detalle3.retrieve(ls_ciudad_ret)
	end if
	if ls_ciudad_ret='999' then
		dw_lista.setitem(il_row_eli,'comuna_retiro','999')
	end if
	if ls_ciudad_ret='0' then
		dw_lista.setitem(il_row_eli,'comuna_retiro','0')
	end if
end if
end event

event itemfocuschanged;string	ls_ciudad,ls_nulo,ls_dv,ls_columna,ls_dw
long	ll_nulo,ll_rut,ll_cta_rut,ll_opc_01
ls_dw												= 		is_dw


setnull(ls_nulo);setnull(ll_nulo)
this.accepttext()
ls_columna										= dwo.name
//if is_limpiar='S' then
//	if ls_columna = 'rut' or ls_columna = 'dv' then
		ll_rut										= dw_lista.getitemnumber(row,'rut')
		ls_dv										= dw_lista.getitemstring(row,'dv')
		if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				dw_lista.setitem(row,'rut',ll_rut)
				cb_grabar.enabled					= false
				dw_lista.setitem(row,"estado_rut",0)
				dw_lista.setitem(row,'dv',ls_nulo)
				dw_lista.setfocus()
				dw_lista.setcolumn('dv')
			else
				cb_grabar.enabled					= true
				dw_lista.setitem(row,"estado_rut",1)
				dw_lista.setfocus()
//				dw_lista.setcolumn('nombre')	
			end if 
		
			SELECT	count("RUT")  
			INTO 		:ll_cta_rut  
			FROM 	"PRODUCTO_BENEFICIARIO"  
			WHERE	"PRODUCTO_BENEFICIARIO"."RUT" = :ll_rut AND
						"PRODUCTO_BENEFICIARIO"."BASE" = :is_base AND
						"PRODUCTO_BENEFICIARIO"."SERIE" = :is_serie AND	
						"PRODUCTO_BENEFICIARIO"."NUMERO" = :il_numero AND		
						"PRODUCTO_BENEFICIARIO"."ESTADO_REG" = 'V'
			USING	sqlca;
			if isnull(ll_cta_rut) or ll_cta_rut=0 then ll_cta_rut=0
			if ll_cta_rut>0 then
				cb_grabar.enabled						= false
				dw_lista.setitem(row,"estado_rut",0)
//				dw_lista.setitem(row,"rut",ll_nulo)
//				dw_lista.setitem(row,'dv',ls_nulo)
				dw_lista.setfocus()
				dw_lista.setcolumn('rut')
			end if
		end if
//	end if
//end if
end event

