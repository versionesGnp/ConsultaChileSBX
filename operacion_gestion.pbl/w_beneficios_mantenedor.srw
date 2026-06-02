forward
global type w_beneficios_mantenedor from window
end type
type cb_imprimir from commandbutton within w_beneficios_mantenedor
end type
type cb_borrar_linea from commandbutton within w_beneficios_mantenedor
end type
type sle_pie from statictext within w_beneficios_mantenedor
end type
type sle_moneda from statictext within w_beneficios_mantenedor
end type
type sle_numero from statictext within w_beneficios_mantenedor
end type
type sle_serie from statictext within w_beneficios_mantenedor
end type
type sle_base from statictext within w_beneficios_mantenedor
end type
type cb_agregar from commandbutton within w_beneficios_mantenedor
end type
type dw_ingreso from datawindow within w_beneficios_mantenedor
end type
type st_pie from statictext within w_beneficios_mantenedor
end type
type st_2 from statictext within w_beneficios_mantenedor
end type
type st_1 from statictext within w_beneficios_mantenedor
end type
type cb_grabar from commandbutton within w_beneficios_mantenedor
end type
type cb_cerrar from commandbutton within w_beneficios_mantenedor
end type
type st_6 from statictext within w_beneficios_mantenedor
end type
type gb_1 from groupbox within w_beneficios_mantenedor
end type
end forward

global type w_beneficios_mantenedor from window
integer width = 4343
integer height = 1828
boolean titlebar = true
string title = "Mantenedor Beneficios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
cb_borrar_linea cb_borrar_linea
sle_pie sle_pie
sle_moneda sle_moneda
sle_numero sle_numero
sle_serie sle_serie
sle_base sle_base
cb_agregar cb_agregar
dw_ingreso dw_ingreso
st_pie st_pie
st_2 st_2
st_1 st_1
cb_grabar cb_grabar
cb_cerrar cb_cerrar
st_6 st_6
gb_1 gb_1
end type
global w_beneficios_mantenedor w_beneficios_mantenedor

type variables
string		is_base,is_serie
long		il_corr_ini,il_count=0
Real		il_pie
Double	il_numero
end variables

on w_beneficios_mantenedor.create
this.cb_imprimir=create cb_imprimir
this.cb_borrar_linea=create cb_borrar_linea
this.sle_pie=create sle_pie
this.sle_moneda=create sle_moneda
this.sle_numero=create sle_numero
this.sle_serie=create sle_serie
this.sle_base=create sle_base
this.cb_agregar=create cb_agregar
this.dw_ingreso=create dw_ingreso
this.st_pie=create st_pie
this.st_2=create st_2
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.st_6=create st_6
this.gb_1=create gb_1
this.Control[]={this.cb_imprimir,&
this.cb_borrar_linea,&
this.sle_pie,&
this.sle_moneda,&
this.sle_numero,&
this.sle_serie,&
this.sle_base,&
this.cb_agregar,&
this.dw_ingreso,&
this.st_pie,&
this.st_2,&
this.st_1,&
this.cb_grabar,&
this.cb_cerrar,&
this.st_6,&
this.gb_1}
end on

on w_beneficios_mantenedor.destroy
destroy(this.cb_imprimir)
destroy(this.cb_borrar_linea)
destroy(this.sle_pie)
destroy(this.sle_moneda)
destroy(this.sle_numero)
destroy(this.sle_serie)
destroy(this.sle_base)
destroy(this.cb_agregar)
destroy(this.dw_ingreso)
destroy(this.st_pie)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.st_6)
destroy(this.gb_1)
end on

event open;string		ls_usuario,ls_estado,ls_moneda,ls_texto
long		ll_rut,ll_indi,ll_tot_reg,ll_cod,ll_cod_det,ll_fila,ll_codigo
date		ld_fecha

gf_centrar(w_beneficios_mantenedor)
dw_ingreso.getchild('cod_beneficio',idw_detalle)			
idw_detalle.settransobject(sqlca)

SELECT DISTINCT "TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO"
INTO		:ll_codigo
FROM 	"TIPO_PROMOCION_ASOCIADOS"  
WHERE 	"TIPO_PROMOCION_ASOCIADOS"."BASE" = :gs_base AND  
			"TIPO_PROMOCION_ASOCIADOS"."SERIE" = :gs_serie AND  
			"TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :gi_numero   
USING	sqlca;

SELECT 	"CADENA"."COD_PARQUE"  
INTO 		:gl_cod_parque  
FROM 	"CADENA"  
WHERE 	( "CADENA"."CODIGO" = :gs_base ) AND  
			( "CADENA"."SERIE" = :gs_serie ) AND  
			( "CADENA"."NUMERO" = :gi_numero )   ;
			
//if idw_detalle.retrieve(ll_codigo,gl_cod_parque)=0 then
if idw_detalle.retrieve(gl_cod_parque)=0 then
	idw_detalle.insertrow(0)
end if
if gs_depto='O' or gs_depto='I' or gs_depto='P' then
	cb_borrar_linea.enabled		= true
else
	cb_borrar_linea.enabled		= false
end if


dw_ingreso.getchild('cod_benef_detalle',idw_detalle2)			
idw_detalle2.settransobject(sqlca)			
if idw_detalle2.retrieve(ll_codigo)=0 then			
	idw_detalle2.insertrow(0)		
end if		
dw_ingreso.settransobject(sqlca)
dw_ingreso.retrieve(gs_base,gs_serie,gi_numero,gs_depto)
if isvalid(w_cuenta_corriente_oferta) then
	ls_moneda			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1, 'pago_oferta_moneda')
	il_pie					= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1, 'pago_oferta_pie')
	is_serie				= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemstring(1,'oferta_v_serie')
	il_numero			= w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.getitemnumber(1,'oferta_v_nro_oferta')
	dw_ingreso.object.t_usuario.text = gs_user
	SELECT	MAX("CORRELATIVO" )
	INTO 		:il_corr_ini  
	FROM 	"TIPO_PROMOCION_ASOCIADOS"
	WHERE	"TIPO_PROMOCION_ASOCIADOS"."BASE" = 'O' AND  
				"TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie AND  
				"TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero
	USING 	sqlca;
	if isnull(il_corr_ini)  then
		il_corr_ini = 0 
	end if	
end if
if ls_moneda='1' then
	sle_moneda.text	= '$'
elseif ls_moneda='2' then
	sle_moneda.text	= 'UF'
end if
cb_grabar.enabled	= false
sle_base.text		= gs_base
sle_serie.text		= gs_serie
sle_numero.text	= string(gi_numero,'###,###,###,##0')
sle_pie.text			= string(il_pie,'###,###,###,##0.0###')
end event

type cb_imprimir from commandbutton within w_beneficios_mantenedor
integer x = 1819
integer y = 1620
integer width = 288
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_ingreso.rowcount()>0 then
	f_Print( dw_ingreso )
end if
end event

type cb_borrar_linea from commandbutton within w_beneficios_mantenedor
integer x = 736
integer y = 1620
integer width = 288
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;long 		ll_tot_reg,ll_fila,ll_indi,ll_corr,ll_cod_beneficio,ll_cod_det
Double	ll_numero
String		ls_pasa='S',ls_descrip,ls_base,ls_serie,ls_estado,ls_user_modif,ls_user_crea
datetime	ldt_fec_modif,ldt_fec_sistema

setnull(ll_fila)
ll_tot_reg		= dw_ingreso.rowcount()
if ll_tot_reg > 0 then
	ll_fila			=dw_ingreso.getrow()
	if ll_fila > 0 then
		il_count 						= il_count -1
		dw_ingreso.deleterow(ll_fila)
		ll_tot_reg					= dw_ingreso.rowcount()
		il_count++			
		if ll_tot_reg > 0 then
			for ll_indi=1 to ll_tot_reg
				ll_corr				= dw_ingreso.getitemnumber(ll_indi,'correlativo')
				ll_cod_beneficio	= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
				ll_cod_det			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
				ls_descrip			= dw_ingreso.getitemstring(ll_indi,'beneficios_complementario_det_descripcion')
				ls_base				= dw_ingreso.getitemstring(ll_indi,'base')
				ls_serie				= dw_ingreso.getitemstring(ll_indi,'serie')
				ll_numero			= dw_ingreso.getitemnumber(ll_indi,'numero')
				ls_estado			= dw_ingreso.getitemstring(ll_indi,'estado')
				ls_user_modif		= dw_ingreso.getitemstring(ll_indi,'tipo_promocion_asociados_usuario_modifica')
				ldt_fec_modif		= dw_ingreso.getitemdatetime(ll_indi,'tipo_promocion_asociados_fecha_modifica')
				ls_user_crea		= dw_ingreso.getitemstring(ll_indi,'usuario')
				ldt_fec_sistema		= dw_ingreso.getitemdatetime(ll_indi,'fecha_creacion')
				if isnull(ll_corr) then
					messagebox("Advertencia","Debe Ingresar Correlativo en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ll_cod_beneficio) then
					messagebox("Advertencia","Debe Ingresar Codigo Beneficio en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ll_cod_det) then
					messagebox("Advertencia","Debe Ingresar Codigo Beneficio Detalle en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_descrip) then
					messagebox("Advertencia","Debe Ingresar Descripción Beneficio en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_base) then
					messagebox("Advertencia","Debe Ingresar Base en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_serie) then
					messagebox("Advertencia","Debe Ingresar Serie en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ll_numero) then
					messagebox("Advertencia","Debe Ingresar Número en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_estado) then
					messagebox("Advertencia","Debe Ingresar Estado en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ls_user_crea) then
					messagebox("Advertencia","Debe Ingresar Usuario Crea en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				elseif isnull(ldt_fec_sistema) then
					messagebox("Advertencia","Debe Ingresar Fecha Crea en Fila "+string(ll_indi))
					ls_pasa			= 'N'
					exit
				end if
			next
			if ls_pasa='S' then	
				cb_grabar.enabled		= true
			end if
		end if
	else
		messagebox('Advertencia','No ha Seleccionado Fila')
	end if	
else
	cb_grabar.enabled		= false
end if
end event

type sle_pie from statictext within w_beneficios_mantenedor
integer x = 2350
integer y = 60
integer width = 453
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_moneda from statictext within w_beneficios_mantenedor
integer x = 2226
integer y = 60
integer width = 114
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_numero from statictext within w_beneficios_mantenedor
integer x = 1134
integer y = 60
integer width = 466
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_serie from statictext within w_beneficios_mantenedor
integer x = 645
integer y = 60
integer width = 133
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_base from statictext within w_beneficios_mantenedor
integer x = 251
integer y = 60
integer width = 133
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_agregar from commandbutton within w_beneficios_mantenedor
integer x = 389
integer y = 1620
integer width = 288
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Agregar"
end type

event clicked;string 		ls_estado,ls_base,ls_serie,ls_user_modif,ls_user_crea,ls_pasa,ls_descrip
long			ll_cod_beneficio,ll_cod_beneficio_d,ll_tot_reg,ll_row,ll_corr,ll_indi,ll_cod_det
datetime		ldt_fec_modif,ldt_fec_sistema
Double		ll_numero
ll_tot_reg		= dw_ingreso.rowcount()
il_count++
ls_pasa='S'
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_corr				= dw_ingreso.getitemnumber(ll_indi,'correlativo')
		ll_cod_beneficio	= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
		ll_cod_det			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
		ls_descrip			= dw_ingreso.getitemstring(ll_indi,'beneficios_complementario_det_descripcion')
		ls_base				= dw_ingreso.getitemstring(ll_indi,'base')
		ls_serie				= dw_ingreso.getitemstring(ll_indi,'serie')
		ll_numero			= dw_ingreso.getitemnumber(ll_indi,'numero')
		ls_estado			= dw_ingreso.getitemstring(ll_indi,'estado')
		ls_user_modif		= dw_ingreso.getitemstring(ll_indi,'tipo_promocion_asociados_usuario_modifica')
		ldt_fec_modif		= dw_ingreso.getitemdatetime(ll_indi,'tipo_promocion_asociados_fecha_modifica')
		ls_user_crea		= dw_ingreso.getitemstring(ll_indi,'usuario')
		ldt_fec_sistema		= dw_ingreso.getitemdatetime(ll_indi,'fecha_creacion')	
		if isnull(ll_corr) then
			messagebox("Advertencia","Debe Ingresar Correlativo en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ll_cod_beneficio) then
			messagebox("Advertencia","Debe Ingresar Codigo Beneficio en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ll_cod_det) then
			messagebox("Advertencia","Debe Ingresar Codigo Beneficio Detalle en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_descrip) then
			messagebox("Advertencia","Debe Ingresar Descripción Beneficio en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_base) then
			messagebox("Advertencia","Debe Ingresar Base en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_serie) then
			messagebox("Advertencia","Debe Ingresar Serie en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ll_numero) then
			messagebox("Advertencia","Debe Ingresar Número en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_estado) then
			messagebox("Advertencia","Debe Ingresar Estado en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ls_user_crea) then
			messagebox("Advertencia","Debe Ingresar Usuario Creador en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		elseif isnull(ldt_fec_sistema) then
			messagebox("Advertencia","Debe Ingresar Fecha Creador en Fila "+string(ll_indi))
			ls_pasa			= 'N'
			exit
		end if
	next
	if ls_pasa='S' then	
		SELECT 	"OFERTA_V"."BENEFICIO_COMPLEMENTARIO"  
		INTO 		:ll_cod_beneficio
		FROM 	"OFERTA_V"
		WHERE 	( "OFERTA_V"."SERIE" = :is_serie ) AND  
					( "OFERTA_V"."NRO_OFERTA" = :il_numero ) 
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			dw_ingreso.insertrow(0)
			if ll_cod_beneficio > 0 then
				ll_row					= ll_tot_reg +1
				ll_corr				= il_corr_ini + il_count
				dw_ingreso.setitem(ll_row,'correlativo',ll_corr)
				dw_ingreso.setitem(ll_row,'cod_beneficio',ll_cod_beneficio)
				dw_ingreso.setitem(ll_row,'base','O')
				dw_ingreso.setitem(ll_row,'serie',is_serie)
				dw_ingreso.setitem(ll_row,'numero',il_numero)
				dw_ingreso.setitem(ll_row,'estado','P')
				dw_ingreso.setitem(ll_row,'tipo_promocion_asociados_usuario_modifica',gs_user)
				dw_ingreso.setitem(ll_row,'tipo_promocion_asociados_fecha_modifica',gdt_fec_sistema)
				dw_ingreso.setitem(ll_row,'usuario',gs_user)
				dw_ingreso.setitem(ll_row,'fecha_creacion',gdt_fec_sistema)
				dw_ingreso.accepttext()
			else
				messagebox('Advertencia','No Hay Beneficio Asignado')
			end if	
		end if	
	end if
end if
end event

type dw_ingreso from datawindow within w_beneficios_mantenedor
integer x = 64
integer y = 256
integer width = 4183
integer height = 1300
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_beneficios_asociados_cambio_estado"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event itemchanged;string	ls_columna,ls_nulo,ls_descrip,ls_pasa
long	ll_cod,ll_cod_det,ll_cod_benef,ll_cod_benef_d,ll_nulo,ll_indi,ll_tot_reg,ll_count=0,ll_fila=0,ll_cant=0

Setnull(ll_nulo)
dw_ingreso.accepttext()
ll_fila						= getrow()
if ll_fila > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
	dw_ingreso.setitem(ll_fila,'tipo_promocion_asociados_usuario_modifica',gs_user)
	dw_ingreso.setitem(ll_fila,'tipo_promocion_asociados_fecha_modifica',gdt_fec_sistema)
	Setnull(ls_nulo)
	ls_columna			= dwo.name
	CHOOSE CASE ls_columna
		CASE 'cod_beneficio'
			ll_cod			= dw_ingreso.getitemnumber(ll_fila,'cod_beneficio')
			if not isnull(ll_cod) then
				dw_ingreso.setitem(ll_fila,'cod_benef_detalle',ll_nulo)
				dw_ingreso.accepttext()
				idw_detalle2.retrieve(ll_cod)
			end if
	END CHOOSE
	ll_cod						= dw_ingreso.getitemnumber(ll_fila,'cod_beneficio')
	ll_cod_det				= dw_ingreso.getitemnumber(ll_fila,'cod_benef_detalle')
	ll_tot_reg				= dw_ingreso.rowcount()
	if ll_cod = 4 and ll_cod_det = 1 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=1 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 2 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=2 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 3 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=3 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 4 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=4 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 5 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=5 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod = 4 and ll_cod_det = 6 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=6 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if		
	end if
	if ll_cod=4 and ll_cod_det=7 then
		for ll_indi = 1 to ll_tot_reg
			ll_cod_benef			= dw_ingreso.getitemnumber(ll_indi,'cod_beneficio')
			ll_cod_benef_d			= dw_ingreso.getitemnumber(ll_indi,'cod_benef_detalle')
			if ll_cod_benef = 4 and ll_cod_benef_d=7 then
				ll_cant++
			end if	
		next
		if ll_cant >= 2 then 
			messagebox('Advertencia','Este Beneficio No se Puede Ingresar más Veces')
			ls_pasa = 'N'
		else
			ls_pasa = 'S'
		end if
	else
		if ll_tot_reg > 0 then
			ls_pasa = 'S'
		end if	
	end if
	if ls_pasa = 'S' then
		SELECT	"BENEFICIOS_COMPLEMENTARIO_DET"."DESCRIPCION"  
		INTO		:ls_descrip  
		FROM		"BENEFICIOS_COMPLEMENTARIO_DET"  
		WHERE 	"BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" = :ll_cod AND  
					"BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" = :ll_cod_det
		USING	sqlca;
		dw_ingreso.setitem(getrow(),'beneficios_complementario_det_descripcion',ls_descrip)
		if gs_depto='O' or gs_depto='I' or gs_depto='P' then
			cb_grabar.enabled		= true
		else
			cb_grabar.enabled		= false
		end if
	elseif ls_pasa = 'N' then
		cb_grabar.enabled			= false
	end if
end if
end event

type st_pie from statictext within w_beneficios_mantenedor
integer x = 2075
integer y = 64
integer width = 137
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pie:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_beneficios_mantenedor
integer x = 448
integer y = 64
integer width = 187
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_beneficios_mantenedor
integer x = 69
integer y = 64
integer width = 187
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base:"
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_beneficios_mantenedor
integer x = 41
integer y = 1620
integer width = 288
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
end type

event clicked;Long		ll_res,ll_tot_reg

SELECT sysdate    INTO :gdt_fec_sistema   FROM "TASA"   WHERE "TASA"."LOOK" = 1   ;
ll_tot_reg		= dw_ingreso.rowcount()
if ll_tot_reg >0 then
	ll_res					= messagebox("Grabar","Está seguro Grabar Promoción",Exclamation!,YesNo!,2)
	if ll_res=1 then
		if dw_ingreso.update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback;
			messagebox("Error Grabar","Error Grabar Promociones SQL: "+sqlca.sqlerrtext)
		end if
	end if
else
	messagebox('Error Grabar','No Hay Datos')
end if	
end event

type cb_cerrar from commandbutton within w_beneficios_mantenedor
integer x = 3945
integer y = 1620
integer width = 338
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_beneficios_mantenedor)
end event

type st_6 from statictext within w_beneficios_mantenedor
integer x = 855
integer y = 64
integer width = 261
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Numero:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_beneficios_mantenedor
integer x = 32
integer y = 180
integer width = 4251
integer height = 1408
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Mantenedor de Beneficios"
end type

