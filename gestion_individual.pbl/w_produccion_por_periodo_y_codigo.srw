forward
global type w_produccion_por_periodo_y_codigo from window
end type
type cb_1 from commandbutton within w_produccion_por_periodo_y_codigo
end type
type st_fecha_fin from statictext within w_produccion_por_periodo_y_codigo
end type
type st_estado from statictext within w_produccion_por_periodo_y_codigo
end type
type pb_proceso_gral from picturebutton within w_produccion_por_periodo_y_codigo
end type
type dw_detalle from datawindow within w_produccion_por_periodo_y_codigo
end type
type st_nombre from statictext within w_produccion_por_periodo_y_codigo
end type
type pb_buscar from picturebutton within w_produccion_por_periodo_y_codigo
end type
type em_codigo from editmask within w_produccion_por_periodo_y_codigo
end type
type st_3 from statictext within w_produccion_por_periodo_y_codigo
end type
type rb_agente from radiobutton within w_produccion_por_periodo_y_codigo
end type
type rb_supervisor from radiobutton within w_produccion_por_periodo_y_codigo
end type
type rb_jefe from radiobutton within w_produccion_por_periodo_y_codigo
end type
type st_limpiar from statictext within w_produccion_por_periodo_y_codigo
end type
type st_activar from statictext within w_produccion_por_periodo_y_codigo
end type
type st_desactivar from statictext within w_produccion_por_periodo_y_codigo
end type
type pb_proceso from picturebutton within w_produccion_por_periodo_y_codigo
end type
type pb_eliminar from picturebutton within w_produccion_por_periodo_y_codigo
end type
type pb_agregar from picturebutton within w_produccion_por_periodo_y_codigo
end type
type dw_destino from datawindow within w_produccion_por_periodo_y_codigo
end type
type st_mostrar_todo from statictext within w_produccion_por_periodo_y_codigo
end type
type pb_filtrar from picturebutton within w_produccion_por_periodo_y_codigo
end type
type pb_ordenar from picturebutton within w_produccion_por_periodo_y_codigo
end type
type pb_imprimir from picturebutton within w_produccion_por_periodo_y_codigo
end type
type pb_exportar from picturebutton within w_produccion_por_periodo_y_codigo
end type
type pb_aceptar from picturebutton within w_produccion_por_periodo_y_codigo
end type
type st_2 from statictext within w_produccion_por_periodo_y_codigo
end type
type em_fec_fin from editmask within w_produccion_por_periodo_y_codigo
end type
type p_fec_fin from picture within w_produccion_por_periodo_y_codigo
end type
type p_fec_ini from picture within w_produccion_por_periodo_y_codigo
end type
type em_fec_ini from editmask within w_produccion_por_periodo_y_codigo
end type
type st_1 from statictext within w_produccion_por_periodo_y_codigo
end type
type pb_salir from picturebutton within w_produccion_por_periodo_y_codigo
end type
type dw_lista from datawindow within w_produccion_por_periodo_y_codigo
end type
type gb_grupo from groupbox within w_produccion_por_periodo_y_codigo
end type
end forward

global type w_produccion_por_periodo_y_codigo from window
integer width = 3474
integer height = 2104
boolean titlebar = true
string title = "Producción de Ventas por Periodo Cierre Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
st_fecha_fin st_fecha_fin
st_estado st_estado
pb_proceso_gral pb_proceso_gral
dw_detalle dw_detalle
st_nombre st_nombre
pb_buscar pb_buscar
em_codigo em_codigo
st_3 st_3
rb_agente rb_agente
rb_supervisor rb_supervisor
rb_jefe rb_jefe
st_limpiar st_limpiar
st_activar st_activar
st_desactivar st_desactivar
pb_proceso pb_proceso
pb_eliminar pb_eliminar
pb_agregar pb_agregar
dw_destino dw_destino
st_mostrar_todo st_mostrar_todo
pb_filtrar pb_filtrar
pb_ordenar pb_ordenar
pb_imprimir pb_imprimir
pb_exportar pb_exportar
pb_aceptar pb_aceptar
st_2 st_2
em_fec_fin em_fec_fin
p_fec_fin p_fec_fin
p_fec_ini p_fec_ini
em_fec_ini em_fec_ini
st_1 st_1
pb_salir pb_salir
dw_lista dw_lista
gb_grupo gb_grupo
end type
global w_produccion_por_periodo_y_codigo w_produccion_por_periodo_y_codigo

type variables
long	il_row, il_row_origen, il_row_destino, il_tot_filas
DragObject control_dw, control_dw2
String	is_ventana, is_estado
DateTime idt_fecha_fin, idt_fecha_ini
end variables

on w_produccion_por_periodo_y_codigo.create
this.cb_1=create cb_1
this.st_fecha_fin=create st_fecha_fin
this.st_estado=create st_estado
this.pb_proceso_gral=create pb_proceso_gral
this.dw_detalle=create dw_detalle
this.st_nombre=create st_nombre
this.pb_buscar=create pb_buscar
this.em_codigo=create em_codigo
this.st_3=create st_3
this.rb_agente=create rb_agente
this.rb_supervisor=create rb_supervisor
this.rb_jefe=create rb_jefe
this.st_limpiar=create st_limpiar
this.st_activar=create st_activar
this.st_desactivar=create st_desactivar
this.pb_proceso=create pb_proceso
this.pb_eliminar=create pb_eliminar
this.pb_agregar=create pb_agregar
this.dw_destino=create dw_destino
this.st_mostrar_todo=create st_mostrar_todo
this.pb_filtrar=create pb_filtrar
this.pb_ordenar=create pb_ordenar
this.pb_imprimir=create pb_imprimir
this.pb_exportar=create pb_exportar
this.pb_aceptar=create pb_aceptar
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.p_fec_fin=create p_fec_fin
this.p_fec_ini=create p_fec_ini
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.pb_salir=create pb_salir
this.dw_lista=create dw_lista
this.gb_grupo=create gb_grupo
this.Control[]={this.cb_1,&
this.st_fecha_fin,&
this.st_estado,&
this.pb_proceso_gral,&
this.dw_detalle,&
this.st_nombre,&
this.pb_buscar,&
this.em_codigo,&
this.st_3,&
this.rb_agente,&
this.rb_supervisor,&
this.rb_jefe,&
this.st_limpiar,&
this.st_activar,&
this.st_desactivar,&
this.pb_proceso,&
this.pb_eliminar,&
this.pb_agregar,&
this.dw_destino,&
this.st_mostrar_todo,&
this.pb_filtrar,&
this.pb_ordenar,&
this.pb_imprimir,&
this.pb_exportar,&
this.pb_aceptar,&
this.st_2,&
this.em_fec_fin,&
this.p_fec_fin,&
this.p_fec_ini,&
this.em_fec_ini,&
this.st_1,&
this.pb_salir,&
this.dw_lista,&
this.gb_grupo}
end on

on w_produccion_por_periodo_y_codigo.destroy
destroy(this.cb_1)
destroy(this.st_fecha_fin)
destroy(this.st_estado)
destroy(this.pb_proceso_gral)
destroy(this.dw_detalle)
destroy(this.st_nombre)
destroy(this.pb_buscar)
destroy(this.em_codigo)
destroy(this.st_3)
destroy(this.rb_agente)
destroy(this.rb_supervisor)
destroy(this.rb_jefe)
destroy(this.st_limpiar)
destroy(this.st_activar)
destroy(this.st_desactivar)
destroy(this.pb_proceso)
destroy(this.pb_eliminar)
destroy(this.pb_agregar)
destroy(this.dw_destino)
destroy(this.st_mostrar_todo)
destroy(this.pb_filtrar)
destroy(this.pb_ordenar)
destroy(this.pb_imprimir)
destroy(this.pb_exportar)
destroy(this.pb_aceptar)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.p_fec_fin)
destroy(this.p_fec_ini)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.pb_salir)
destroy(this.dw_lista)
destroy(this.gb_grupo)
end on

event open;string ls_estado_aux

gf_centrar(w_produccion_por_periodo_y_codigo)
gs_ventana							= 'w_produccion_por_periodo_y_codigo'
f_valida_objeto_1()
is_ventana							= message.stringparm
CHOOSE CASE is_ventana
	CASE "1"
		rb_jefe.checked 			= true
		rb_supervisor.checked 	= false
		rb_agente.checked 		= false
		SELECT	"SUPERVISOR"."ESTADO"  
		INTO 		:ls_estado_aux  
		FROM 		"SUPERVISOR"  
		WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","No tiene acceso")
			em_codigo.enabled					= false
			rb_jefe.enabled					= false
			rb_supervisor.enabled			= false
			rb_agente.enabled					= false
			pb_buscar.enabled					= false
			pb_aceptar.enabled				= false
			pb_proceso_gral.enabled			= false
			pb_proceso.enabled				= false
		end if
	CASE "2"
		rb_jefe.checked 			= false
		rb_supervisor.checked 	= true
		rb_agente.checked 		= false
	CASE "3"
		rb_jefe.checked 			= false
		rb_supervisor.checked 	= false
		rb_agente.checked 		= true
END CHOOSE

pb_proceso.enabled				= false
em_fec_ini.text					= string(today())
em_fec_fin.text					= string(today())
dw_lista.dataobject				= 'dwe_detalle_cierre_venta_por_trabajador'
dw_lista.settransobject(sqlca)
dw_destino.settransobject(sqlca)
dw_detalle.settransobject(sqlca)

SELECT	"JEFE_VENTAS"."ESTADO"  
INTO 		:ls_estado_aux  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	em_codigo.text				= gs_user
	em_codigo.enabled			= true
	rb_jefe.enabled			= true
	rb_supervisor.enabled	= true
	rb_agente.enabled			= true
	pb_buscar.enabled			= true
	em_codigo.triggerevent(modified!)
else
	SELECT	"SUPERVISOR"."ESTADO"  
	INTO 		:ls_estado_aux  
	FROM 		"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
	USING		sqlca;
	if sqlca.sqlcode=0 and is_ventana <> "1" then
		em_codigo.text			= gs_user
		em_codigo.enabled		= false
		rb_jefe.enabled		= false
		rb_supervisor.enabled= true
		rb_agente.enabled		= true
		pb_buscar.enabled		= true
		em_codigo.triggerevent(modified!)
	else
		SELECT	"AGENTES"."ESTADO"  
		INTO 		:ls_estado_aux  
		FROM 		"AGENTES"  
		WHERE 	"AGENTES"."COD_AGE" = :gs_user   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			em_codigo.text		= gs_user
			em_codigo.enabled	= false
			em_codigo.triggerevent(modified!)
		else
//			em_codigo.enabled	= true
			pb_proceso.enabled = true
		end if
	end if
end if

end event

type cb_1 from commandbutton within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 978
integer y = 1876
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;String	ls_string
Long		ll_mes_ini, ll_year_ini, ll_mes_buscar_ini, ll_year_buscar_ini
Date		ld_fec_cierre_ini, ld_fec_cierre_fin,ld_fecha_aux
Long		ll_mes_fin, ll_year_fin, ll_mes_buscar_fin, ll_year_buscar_fin, ll_tot_promesas
Long		ll_tot_libera
 
Datetime	ldt_fecpaso, ldt_fecpaso2
il_row	= dw_destino.getrow()
if il_row > 0 then
	ll_mes_ini				= dw_destino.getitemnumber(il_row,'mes')
	ll_year_ini				= dw_destino.getitemnumber(il_row,'anno')
	ld_fec_cierre_ini		= date(dw_destino.getitemdatetime(il_row,'fecha_cierre'))
	ll_mes_buscar_ini		= ll_mes_ini
	ll_year_buscar_ini	= ll_year_ini
	
	ll_mes_fin				= dw_destino.getitemnumber(1,'mes')
	ll_year_fin				= dw_destino.getitemnumber(1,'anno')
	ld_fec_cierre_fin		= date(dw_destino.getitemdatetime(1,'fecha_cierre'))
	ll_mes_buscar_fin		= ll_mes_fin
	ll_year_buscar_fin	= ll_year_fin
	
	//Rango Inicial
//	if ll_mes_buscar_ini = 1 then
//		ll_mes_buscar_ini	= 12
//		ll_year_buscar_ini	= ll_year_buscar_ini - 1
//	else
//		ll_mes_buscar_ini	= ll_mes_buscar_ini - 1
//	end if 
	
//	if ll_mes_buscar_ini > 0 and ll_year_buscar_ini > 0 and ll_mes_buscar_fin > 0 and ll_year_buscar_fin > 0 then
//---------Mirko te modifique esto, por que tomaba dos periodos---------------------------		
//		SELECT 	"CIERRE_VENTA"."CIERRE_VENTA" 
//		INTO 		:ldt_fecpaso
//		FROM 		"CIERRE_VENTA"  
//		WHERE 	( "CIERRE_VENTA"."PERIODO" = :ll_mes_buscar_ini ) AND  
//					( "CIERRE_VENTA"."ANNO" = :ll_year_buscar_ini ) 
//		USING		sqlca ;					
//		ld_fec_cierre_ini
//		ld_fecha_aux = date('01'+mid(string(RelativeDate(ld_fec_cierre_ini, - 30),'dd/mm/yyyy'),3))
		
		ld_fecha_aux = date('01/'+string(ll_mes_ini,'00')+'/'+string(ll_year_ini,'0000'))
//		SELECT 	"CIERRE_VENTA"."CIERRE_VENTA" 
//		INTO 		:ldt_fecpaso
//		FROM 		"CIERRE_VENTA"  
//		WHERE 	( "CIERRE_VENTA"."CIERRE_VENTA" < :ld_fec_cierre_ini and 
//					"CIERRE_VENTA"."CIERRE_VENTA" > :ld_fecha_aux ) 
//		USING		sqlca ;
//		if sqlca.sqlcode = 0 then
//			ld_fec_cierre_ini	= relativedate(date(ldt_fecpaso),1)
			ld_fec_cierre_ini	= ld_fecha_aux
			
			if is_estado = 'A' then
				ls_string	= string(ld_fec_cierre_ini,'dd/mm/yyyy')+'~t'+string(ld_fec_cierre_fin,'dd/mm/yyyy')+'~t'+string(ll_mes_ini)+'~t'+string(ll_year_ini)+'~t'+string(ll_mes_fin)+'~t'+string(ll_year_fin)
			else
				ls_string	= string(ld_fec_cierre_ini,'dd/mm/yyyy')+'~t'+string(ld_fec_cierre_fin,'dd/mm/yyyy')+'~t'+string(ll_mes_ini)+'~t'+string(ll_year_ini)+'~t'+string(Month(date(idt_fecha_fin)),'00')+'~t'+string(year(date(idt_fecha_fin)),'####')
//				ls_string	= string(ld_fec_cierre_ini,'dd/mm/yyyy')+'~t'+string(ld_fec_cierre_fin,'dd/mm/yyyy')+'~t'+string(ll_mes_ini)+'~t'+string(ll_year_ini)+'~t'+string(ll_mes_fin)+'~t'+string(ll_year_fin)
			end if
//		else
//			ld_fec_cierre_ini	= RelativeDate(ld_fec_cierre_ini, - 30)
//			if is_estado = 'A' then
//				ls_string	= string(ld_fec_cierre_ini,'dd/mm/yyyy')+'~t'+string(ld_fec_cierre_fin,'dd/mm/yyyy')+'~t'+string(ll_mes_ini)+'~t'+string(ll_year_ini)+'~t'+string(ll_mes_fin)+'~t'+string(ll_year_fin)
//			else
//				ls_string	= string(ld_fec_cierre_ini,'dd/mm/yyyy')+'~t'+string(idt_fecha_fin,'dd/mm/yyyy')+'~t'+string(ll_mes_ini)+'~t'+string(ll_year_ini)+'~t'+string(Month(date(idt_fecha_fin)),'00')+'~t'+string(year(date(idt_fecha_fin)),'####')
//			end if
//		end if
//	end if
	CHOOSE CASE is_ventana
		CASE "1"
			ls_string	= ls_string+'~t'+"1"+'~t'+trim(em_codigo.text)
		CASE "2"
			ls_string	= ls_string+'~t'+"2"+'~t'+trim(em_codigo.text)
		CASE "3"
			ls_string	= ls_string+'~t'+"3"+'~t'+trim(em_codigo.text)
	END CHOOSE
	OpenWithParm(w_detalle_periodo_cierre_de_venta_emp, ls_string)
end if

end event

type st_fecha_fin from statictext within w_produccion_por_periodo_y_codigo
integer x = 1851
integer y = 176
integer width = 1545
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 79741120
boolean focusrectangle = false
end type

type st_estado from statictext within w_produccion_por_periodo_y_codigo
integer x = 1851
integer y = 100
integer width = 1545
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 79741120
boolean focusrectangle = false
end type

type pb_proceso_gral from picturebutton within w_produccion_por_periodo_y_codigo
integer x = 1641
integer y = 72
integer width = 169
integer height = 148
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_codigo, ls_codigo_aux, ls_nombre, ls_a_Pat, ls_a_mat, ls_estado, ls_string
Double	ll_tot_uf_promesas,ll_tot_uf_liberador,ll_tot_uf_aumento
Date		ld_fecha_ing, ld_fecha_cierre, ld_fecha_cierre_aux
long		ll_indi, ll_filas, ll_new, ll_mes, ll_anno, ll_cont_unidad_promesa,ll_cont_unidad_nro_lib,&
			ll_periodo, ll_anno_periodo,ll_row, ll_dia_paso, ll_mes_paso, ll_anno_paso,ll_cont_unidad_nro_aum
Datetime	ldt_fec_cierre_vta//, ldt_fec_fin_paso

dw_destino.reset()
dw_lista.reset()
ls_codigo								= trim(em_codigo.text)
if ls_codigo <> '' or not isnull(ls_codigo) then
	if rb_jefe.checked = true then
		if is_estado = 'A'  then
			dw_detalle.dataobject	= 'dw_informe_gestion_ventas_por_jefe'
			dw_detalle.settransobject(sqlca)
			ll_filas						= dw_detalle.retrieve(ls_codigo)
		elseif is_estado = 'I' then
			dw_detalle.dataobject	= 'dw_informe_gestion_ventas_por_jefe_inact'
			dw_detalle.settransobject(sqlca)
			ll_dia_paso					= 28
			ll_mes_paso					= month(date(idt_fecha_fin))
			ll_anno_paso				= year(date(idt_fecha_fin))
			idt_fecha_fin				= datetime(date(string(ll_dia_paso)+'/'+string(ll_mes_paso)+'/'+string(ll_anno_paso)),Time('00:00:00'))
			ll_filas						= dw_detalle.retrieve(ls_codigo,idt_fecha_fin)
		end if
		if ll_filas=0 then
			messagebox("Advertencia","No registra dato")
			em_codigo.setfocus()
		else
			setnull(ld_fecha_cierre_aux)
//			ld_fecha_cierre_aux	= date(dw_detalle.getitemDatetime(1,'oferta_v_cierre_venta'))
			for ll_indi=1 to ll_filas
				ls_nombre					= dw_detalle.getitemstring(ll_indi,'jefe_ventas_nombre')
				ls_a_pat						= dw_detalle.getitemstring(ll_indi,'jefe_ventas_a_paterno')
				ls_a_mat						= dw_detalle.getitemstring(ll_indi,'jefe_ventas_a_materno')
				ls_codigo					= dw_detalle.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
				ls_estado					= dw_detalle.getitemstring(ll_indi,'jefe_ventas_estado')
				ll_cont_unidad_promesa	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
				ll_cont_unidad_nro_lib	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
				ll_cont_unidad_nro_aum	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_aum')
				ll_tot_uf_promesas		= dw_detalle.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
				ll_tot_uf_liberador		= dw_detalle.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
				ll_tot_uf_aumento			= dw_detalle.getitemNumber(ll_indi,'tot_uf_aumento_jefe')
				ld_fecha_ing				= date(dw_detalle.getitemDatetime(ll_indi,'jefe_ventas_fecha_ing'))
				ld_fecha_cierre			= date(dw_detalle.getitemDatetime(ll_indi,'oferta_v_cierre_venta'))
				ll_mes						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_periodo')
				ll_anno						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_anno')
				if ld_fecha_cierre <> ld_fecha_cierre_aux or isnull(ld_fecha_cierre_aux) then
					if not isnull(ld_fecha_cierre) and ll_mes>0 and ll_anno>0 then
						ll_new	= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,'mes',ll_mes)
						dw_lista.setitem(ll_new,'anno',ll_anno)
						dw_lista.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
						dw_lista.setitem(ll_new,'unidad_promesa',ll_cont_unidad_promesa)
						dw_lista.setitem(ll_new,'uf_promesa',ll_tot_uf_promesas)
						dw_lista.setitem(ll_new,'unidad_liberador',ll_cont_unidad_nro_lib)
						dw_lista.setitem(ll_new,'uf_liberador',ll_tot_uf_liberador)
						dw_lista.setitem(ll_new,'unidad_aumento',ll_cont_unidad_nro_aum)
						dw_lista.setitem(ll_new,'uf_aumento',ll_tot_uf_aumento)
					end if
					ld_fecha_cierre_aux	= ld_fecha_cierre
				end if
			next
		end if
	end if
	if rb_supervisor.checked = true then
		if is_estado = 'A' then
			dw_detalle.dataobject= 'dw_informe_gestion_ventas_por_supervisor'
			dw_detalle.settransobject(sqlca)
			ll_filas	= dw_detalle.retrieve(ls_codigo)
		elseif is_estado = 'I' then
			dw_detalle.dataobject= 'dw_informe_gestion_ventas_por_sup_inact'
			dw_detalle.settransobject(sqlca)
			ll_dia_paso			= 28
			ll_mes_paso			= month(date(idt_fecha_fin))
			ll_anno_paso		= year(date(idt_fecha_fin))
			idt_fecha_fin		= datetime(date(string(ll_dia_paso)+'/'+string(ll_mes_paso)+'/'+string(ll_anno_paso)),Time('00:00:00'))
			ll_filas				= dw_detalle.retrieve(ls_codigo,idt_fecha_fin)
		end if
		if ll_filas=0 then
			messagebox("Advertencia","No registra dato")
			em_codigo.setfocus()
		else
			setnull(ld_fecha_cierre_aux)
//			ld_fecha_cierre_aux	= date(dw_detalle.getitemDatetime(1,'oferta_v_cierre_venta'))
			for ll_indi=1 to ll_filas
				ls_nombre					= dw_detalle.getitemstring(ll_indi,'supervisor_nombre')
				ls_a_pat						= dw_detalle.getitemstring(ll_indi,'supervisor_a_paterno')
				ls_a_mat						= dw_detalle.getitemstring(ll_indi,'supervisor_a_materno')
				ls_codigo					= dw_detalle.getitemstring(ll_indi,'supervisor_cod_sup')
				ls_estado					= dw_detalle.getitemstring(ll_indi,'supervisor_estado')
				ll_cont_unidad_promesa	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
				ll_cont_unidad_nro_lib	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
				ll_cont_unidad_nro_aum	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_aum')
				ll_tot_uf_promesas		= dw_detalle.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
				ll_tot_uf_liberador		= dw_detalle.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
				ll_tot_uf_aumento			= dw_detalle.getitemNumber(ll_indi,'tot_uf_aumento_jefe')
				ld_fecha_ing				= date(dw_detalle.getitemDatetime(ll_indi,'supervisor_fecha_ing'))
				ld_fecha_cierre			= date(dw_detalle.getitemDatetime(ll_indi,'oferta_v_cierre_venta'))
				ll_mes						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_periodo')
				ll_anno						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_anno')
				if ld_fecha_cierre <> ld_fecha_cierre_aux or isnull(ld_fecha_cierre_aux) then
					if not isnull(ld_fecha_cierre) and ll_mes>0 and ll_anno>0 then
						ll_new	= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,'mes',ll_mes)
						dw_lista.setitem(ll_new,'anno',ll_anno)
						dw_lista.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
						dw_lista.setitem(ll_new,'unidad_promesa',ll_cont_unidad_promesa)
						dw_lista.setitem(ll_new,'uf_promesa',ll_tot_uf_promesas)
						dw_lista.setitem(ll_new,'unidad_liberador',ll_cont_unidad_nro_lib)
						dw_lista.setitem(ll_new,'uf_liberador',ll_tot_uf_liberador)
						dw_lista.setitem(ll_new,'unidad_aumento',ll_cont_unidad_nro_aum)
						dw_lista.setitem(ll_new,'uf_aumento',ll_tot_uf_aumento)
					end if
					ld_fecha_cierre_aux	= ld_fecha_cierre
				end if
			next
		end if
	end if
	if rb_agente.checked = true then
		if is_estado = 'A' then
			dw_detalle.dataobject= 'dw_informe_gestion_ventas_por_agente'
			dw_detalle.settransobject(sqlca)
			ll_filas	= dw_detalle.retrieve(ls_codigo)
		elseif is_estado = 'I' then
			dw_detalle.dataobject= 'dw_informe_gestion_ventas_por_agente_ina'
			dw_detalle.settransobject(sqlca)
			ll_dia_paso			= 28
			ll_mes_paso			= month(date(idt_fecha_fin))
			ll_anno_paso		= year(date(idt_fecha_fin))
			idt_fecha_fin		= datetime(date(string(ll_dia_paso)+'/'+string(ll_mes_paso)+'/'+string(ll_anno_paso)),Time('00:00:00'))
			ll_filas				= dw_detalle.retrieve(ls_codigo,idt_fecha_fin)
		end if
		if ll_filas=0 then
			messagebox("Advertencia","No registra dato")
			em_codigo.setfocus()
		else
//			ld_fecha_cierre_aux	= date(dw_detalle.getitemDatetime(1,'oferta_v_cierre_venta'))
			setnull(ld_fecha_cierre_aux)
			for ll_indi=1 to ll_filas
				ls_nombre					= dw_detalle.getitemstring(ll_indi,'agentes_nombre')
				ls_a_pat						= dw_detalle.getitemstring(ll_indi,'agentes_a_paterno')
				ls_a_mat						= dw_detalle.getitemstring(ll_indi,'agentes_a_materno')
				ls_codigo					= dw_detalle.getitemstring(ll_indi,'agentes_cod_age')
				ls_estado					= dw_detalle.getitemstring(ll_indi,'agentes_estado')
				ll_cont_unidad_promesa	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
				ll_cont_unidad_nro_lib	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
				ll_cont_unidad_nro_aum	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_aum')
				ll_tot_uf_promesas		= dw_detalle.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
				ll_tot_uf_liberador		= dw_detalle.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
				ll_tot_uf_aumento			= dw_detalle.getitemNumber(ll_indi,'tot_uf_aumento_jefe')
				ld_fecha_ing				= date(dw_detalle.getitemDatetime(ll_indi,'agentes_fecha_ini'))
				ld_fecha_cierre			= date(dw_detalle.getitemDatetime(ll_indi,'oferta_v_cierre_venta'))
				ll_mes						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_periodo')
				ll_anno						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_anno')
				if ld_fecha_cierre <> ld_fecha_cierre_aux or isnull(ld_fecha_cierre_aux) then
					if not isnull(ld_fecha_cierre) and ll_mes>0 and ll_anno>0 then
						ll_new	= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,'mes',ll_mes)
						dw_lista.setitem(ll_new,'anno',ll_anno)
						dw_lista.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
						dw_lista.setitem(ll_new,'unidad_promesa',ll_cont_unidad_promesa)
						dw_lista.setitem(ll_new,'uf_promesa',ll_tot_uf_promesas)
						dw_lista.setitem(ll_new,'unidad_liberador',ll_cont_unidad_nro_lib)
						dw_lista.setitem(ll_new,'uf_liberador',ll_tot_uf_liberador)
						dw_lista.setitem(ll_new,'unidad_aumento',ll_cont_unidad_nro_aum)
						dw_lista.setitem(ll_new,'uf_aumento',ll_tot_uf_aumento)
					end if
					ld_fecha_cierre_aux	= ld_fecha_cierre
				end if
			next
		end if
	end if
//ld_fecha_ing
	if dw_lista.rowcount()>0 then
		if is_estado = 'I' then
			DECLARE x1 CURSOR FOR  
			SELECT	"CIERRE_VENTA"."PERIODO",   
						"CIERRE_VENTA"."ANNO",   
						"CIERRE_VENTA"."CIERRE_VENTA"  
			FROM 		"CIERRE_VENTA"  
			WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" <= :idt_fecha_fin
			Using		sqlca	;
			open x1;
			if sqlca.sqlcode = 0 then
				DO WHILE sqlca.sqlcode = 0
					fetch x1 into :ll_periodo,:ll_anno_periodo,:ldt_fec_cierre_vta;
					ls_string	= "mes="+string(ll_periodo)+" and anno="+string(ll_anno_periodo)
					ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
					IF ll_row = 0 THEN
						ll_new	= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,'mes',ll_periodo)
						dw_lista.setitem(ll_new,'anno',ll_anno_periodo)
						dw_lista.setitem(ll_new,'fecha_cierre',ldt_fec_cierre_vta)
						dw_lista.setitem(ll_new,'unidad_promesa',0)
						dw_lista.setitem(ll_new,'uf_promesa',0)
						dw_lista.setitem(ll_new,'unidad_liberador',0)
						dw_lista.setitem(ll_new,'uf_liberador',0)
						dw_lista.setitem(ll_new,'unidad_aumento',0)
						dw_lista.setitem(ll_new,'uf_aumento',0)
					end if
				LOOP
			end if
			close x1;
		end if
		if is_estado = 'A' then
			DECLARE x2 CURSOR FOR  
			SELECT	"CIERRE_VENTA"."PERIODO",   
						"CIERRE_VENTA"."ANNO",   
						"CIERRE_VENTA"."CIERRE_VENTA"  
			FROM 		"CIERRE_VENTA"  
			Using		sqlca	;
			open x2;
			if sqlca.sqlcode = 0 then
				DO WHILE sqlca.sqlcode = 0
					fetch x2 into :ll_periodo,:ll_anno_periodo,:ldt_fec_cierre_vta;
					ls_string	= "mes="+string(ll_periodo)+" and anno="+string(ll_anno_periodo)
					ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount())
					IF ll_row = 0 THEN
						ll_new	= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,'mes',ll_periodo)
						dw_lista.setitem(ll_new,'anno',ll_anno_periodo)
						dw_lista.setitem(ll_new,'fecha_cierre',ldt_fec_cierre_vta)
						dw_lista.setitem(ll_new,'unidad_promesa',0)
						dw_lista.setitem(ll_new,'uf_promesa',0)
						dw_lista.setitem(ll_new,'unidad_liberador',0)
						dw_lista.setitem(ll_new,'uf_liberador',0)
						dw_lista.setitem(ll_new,'unidad_aumento',0)
						dw_lista.setitem(ll_new,'uf_aumento',0)
					end if
				LOOP
			end if
			close x2;
		end if
		dw_lista.Sort( )
	end if
else
	messagebox("Advertencia","Debe ingresar Código a Consultar")
end if
end event

type dw_detalle from datawindow within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 2171
integer y = 1888
integer width = 594
integer height = 432
integer taborder = 60
string title = "none"
string dataobject = "dw_informe_gestion_ventas_por_jefe"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_nombre from statictext within w_produccion_por_periodo_y_codigo
integer x = 1851
integer y = 24
integer width = 1518
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 79741120
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_produccion_por_periodo_y_codigo
integer x = 1463
integer y = 120
integer width = 119
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lupa.bmp"
string disabledname = "Lupa_no.bmp"
end type

event clicked;openwithparm(w_lista_codigos,is_ventana)
em_codigo.triggerevent(modified!)
//dw_lista.reset()
//em_codigo.text = ''
end event

type em_codigo from editmask within w_produccion_por_periodo_y_codigo
integer x = 1152
integer y = 124
integer width = 293
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
end type

event modified;string	ls_codigo, ls_codigo_aux, ls_nombre, ls_a_Pat, ls_a_mat
long		ll_indi, ll_filas, ll_new, ll_mes, ll_anno, ll_cont_unidad_promesa, ll_tot_uf_promesas
Long		ll_cont_unidad_nro_lib, ll_tot_uf_liberador
Date		ld_fecha_ing, ld_fecha_cierre, ld_fecha_cierre_aux

ls_codigo			= trim(em_codigo.text)
st_nombre.text		= ''
st_estado.text		= ''
st_fecha_fin.text	= ''
dw_lista.reset()
dw_destino.reset()
if ls_codigo <> '' and not isnull(ls_codigo) then
	 
	if rb_jefe.checked = true then
		SELECT 	"JEFE_VENTAS"."NOMBRE",   
					"JEFE_VENTAS"."A_PATERNO",   
					"JEFE_VENTAS"."A_MATERNO",
					"JEFE_VENTAS"."ESTADO", 
					"JEFE_VENTAS"."FECHA_ING",
					"JEFE_VENTAS"."FECHA_FIN"
		INTO 		:ls_nombre,   
					:ls_a_pat,   
					:ls_a_mat,
					:is_estado, 
					:idt_fecha_ini, 
					:idt_fecha_fin
		FROM 		"JEFE_VENTAS"  
		WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo   
		Using		sqlca  ;
	end if
	if rb_supervisor.checked = true then
		SELECT	"SUPERVISOR"."NOMBRE",   
					"SUPERVISOR"."A_PATERNO",   
					"SUPERVISOR"."A_MATERNO",  
					"SUPERVISOR"."ESTADO",  
					"SUPERVISOR"."FECHA_ING",  
					"SUPERVISOR"."FECHA_FIN"  
		INTO 		:ls_nombre,   
					:ls_a_pat,   
					:ls_a_mat,
					:is_estado, 
					:idt_fecha_ini,
					:idt_fecha_fin
		FROM 		"SUPERVISOR"  
		WHERE 	"SUPERVISOR"."COD_SUP" = :ls_codigo   
		USING		SQLCA ;
	end if
	if rb_agente.checked = true then
		SELECT 	"AGENTES"."NOMBRE",   
					"AGENTES"."A_PATERNO",   
					"AGENTES"."A_MATERNO",  
					"AGENTES"."ESTADO",  
					"AGENTES"."FECHA_INI",  
					"AGENTES"."FECHA_FIN"  
		INTO 		:ls_nombre,   
					:ls_a_pat,   
					:ls_a_mat,  
					:is_estado, 
					:idt_fecha_ini, 
					:idt_fecha_fin 
		FROM 		"AGENTES"  
		WHERE 	"AGENTES"."COD_AGE" = :ls_codigo   
		USING  	sqlca;
	end if
	if sqlca.sqlcode = 0 then
		st_nombre.text	= trim(ls_nombre)+' '+trim(ls_a_Pat)+' '+trim(ls_a_mat)
		if is_estado = 'A' then
			st_estado.text			= 'Estado  :  Activo'
			st_estado.textcolor	= rgb(0,0,0)
			st_fecha_fin.text		= 'Fec.Ing.:  '+string(idt_fecha_ini,'dd/mm/yyyy')
			
		elseif is_estado = 'I' then
			st_estado.text			= 'Estado  :  Inactivo'
			st_estado.textcolor	= rgb(255,0,0)
			st_fecha_fin.text		= 'Fec.Ing.:  '+string(idt_fecha_ini,'dd/mm/yyyy')
			if isnull(idt_fecha_fin) then
				st_fecha_fin.text	= st_fecha_fin.text+'  Término :  No Registra'
			else
				st_fecha_fin.text	= st_fecha_fin.text+'  Término :  '+string(idt_fecha_fin,'dd/mm/yyyy')
			end if
		end if
	end if
end if
//	else
//		messagebox("Error","No Existe Código")
//		st_nombre.text	= ''
//		em_codigo.setfocus()
//		close(w_produccion_por_periodo_y_codigo)
//	end if
//end if
end event

type st_3 from statictext within w_produccion_por_periodo_y_codigo
integer x = 1157
integer y = 40
integer width = 421
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Ingrese Código"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_agente from radiobutton within w_produccion_por_periodo_y_codigo
integer x = 832
integer y = 112
integer width = 274
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Agente"
end type

event clicked;is_ventana			= '3'
em_codigo.text		= ''
st_nombre.text		= ''
st_estado.text		= ''
st_fecha_fin.text	= ''
dw_lista.reset()
dw_destino.reset()
em_codigo.setfocus()
end event

type rb_supervisor from radiobutton within w_produccion_por_periodo_y_codigo
integer x = 457
integer y = 112
integer width = 352
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Supervisor"
end type

event clicked;is_ventana			= '2'
em_codigo.text		= ''
st_nombre.text		= ''
st_estado.text		= ''
st_fecha_fin.text	= ''
dw_lista.reset()
dw_destino.reset()
em_codigo.setfocus()
end event

type rb_jefe from radiobutton within w_produccion_por_periodo_y_codigo
integer x = 73
integer y = 112
integer width = 352
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Jefe Venta"
boolean checked = true
end type

event clicked;is_ventana			= '1'
em_codigo.text		= ''
st_nombre.text		= ''
st_estado.text		= ''
st_fecha_fin.text	= ''
dw_lista.reset()
dw_destino.reset()
em_codigo.setfocus()
end event

type st_limpiar from statictext within w_produccion_por_periodo_y_codigo
integer x = 2560
integer y = 1796
integer width = 288
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Limpiar"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;dw_destino.reset()
pb_proceso.enabled	= false
end event

type st_activar from statictext within w_produccion_por_periodo_y_codigo
integer x = 891
integer y = 1796
integer width = 425
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Activar Todo"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long	ll_indi
il_tot_filas	= dw_lista.rowcount()
if il_tot_filas>0 then
	for ll_indi = 1 to il_tot_filas
		dw_lista.setitem(ll_indi,'estado',1)
		dw_lista.SelectRow(ll_indi, true)
	next
	dw_lista.accepttext()
end if
end event

type st_desactivar from statictext within w_produccion_por_periodo_y_codigo
integer x = 1518
integer y = 1796
integer width = 489
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Desactivar Todo"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long	ll_indi
il_tot_filas	= dw_lista.rowcount()
if il_tot_filas>0 then
	for ll_indi = 1 to il_tot_filas
		dw_lista.setitem(ll_indi,'estado',0)
		dw_lista.SelectRow(ll_indi, FALSE)
	next
	dw_lista.accepttext()
end if
end event

type pb_proceso from picturebutton within w_produccion_por_periodo_y_codigo
integer x = 2926
integer y = 1772
integer width = 169
integer height = 148
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_string
long		ll_tot_reg
datetime	ldt_fecha_cierre_ini,ldt_fecha_cierre_fin

dw_destino.AcceptText()
ll_tot_reg						= dw_destino.rowcount()
if ll_tot_reg > 0 then
	ldt_fecha_cierre_ini		= dw_destino.getitemdatetime(ll_tot_reg,'fecha_cierre_ini')
	ldt_fecha_cierre_fin		= dw_destino.getitemdatetime(1,'fecha_cierre')
	ls_string					= string(ldt_fecha_cierre_ini,'dd/mm/yyyy')+'~t'+string(ldt_fecha_cierre_fin,'dd/mm/yyyy')
	CHOOSE CASE is_ventana
		CASE "1"
			ls_string	= ls_string+'~t'+"1"+'~t'+trim(em_codigo.text)
		CASE "2"
			ls_string	= ls_string+'~t'+"2"+'~t'+trim(em_codigo.text)
		CASE "3"
			ls_string	= ls_string+'~t'+"3"+'~t'+trim(em_codigo.text)
	END CHOOSE
	OpenWithParm(w_detalle_periodo_cierre_de_venta_emp, ls_string)
else
	messagebox('Advertencia','No Registra Datos de Busqueda')
end if
end event

type pb_eliminar from picturebutton within w_produccion_por_periodo_y_codigo
integer x = 2327
integer y = 1148
integer width = 197
integer height = 180
integer taborder = 50
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
string picturename = "Inicio.jpg"
alignment htextalign = left!
end type

event clicked;Long	ll_res, ll_fila, ll_periodo, ll_anno
ll_fila	= dw_destino.getrow()
if ll_fila > 0 then
	ll_periodo	= dw_destino.getitemnumber(ll_fila,'mes')
	ll_anno		= dw_destino.getitemnumber(ll_fila,'anno')
	ll_res	= MessageBox("Eliminar", "Está seguro de Eliminar, periodo "+string(ll_periodo)+' año '+string(ll_anno), Exclamation!, YesNo!, 2)
	IF ll_res = 1 THEN
		dw_destino.deleterow(ll_fila)
		dw_destino.scrolltorow(1)
	END IF
	if dw_destino.rowcount() = 0 then 
		pb_proceso.enabled	= false
	else
		pb_proceso.enabled	= True
	end if
end if
end event

type pb_agregar from picturebutton within w_produccion_por_periodo_y_codigo
integer x = 2327
integer y = 684
integer width = 197
integer height = 180
integer taborder = 40
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Agregar"
string picturename = "Final.jpg"
alignment htextalign = left!
end type

event clicked;long		ll_filas, ll_indi, ll_estado,ll_year, ll_periodo, ll_new
datetime	ldt_fecha_cierre,ldt_fecha_ini

ll_filas	= dw_lista.rowcount()
dw_destino.reset()
for ll_indi = 1 to ll_filas
	ll_estado	= dw_lista.getitemnumber(ll_indi,'estado')
	if ll_estado=1 then
		ll_periodo			= dw_lista.getitemnumber(ll_indi,'mes')
		ll_year				= dw_lista.getitemnumber(ll_indi,'anno')
		ldt_fecha_cierre 	= dw_lista.getitemdatetime(ll_indi,'fecha_cierre')
		ll_new				= dw_destino.insertrow(0)
		dw_destino.scrolltorow(ll_new)
		dw_destino.setitem(ll_new,'mes',ll_periodo)
		dw_destino.setitem(ll_new,'anno',ll_year)
		dw_destino.setitem(ll_new,'fecha_cierre',ldt_fecha_cierre)
		SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
		INTO 		:ldt_fecha_ini  
		FROM 		"CIERRE_VENTA"  
		WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre   
		USING		sqlca;
		dw_destino.setitem(ll_new,'fecha_cierre_ini',ldt_fecha_ini)
	end if
next
if dw_destino.rowcount() > 0 then 
	pb_proceso.enabled	= true
else
	pb_proceso.enabled	= False
	messagebox("Advertencia","Debe seleccionar a lo menos un periodo")
end if
end event

type dw_destino from datawindow within w_produccion_por_periodo_y_codigo
integer x = 2560
integer y = 272
integer width = 823
integer height = 1456
string dragicon = "Hand!"
string dataobject = "dwe_destino_periodo_cierre"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;il_row_destino	= row
if il_row_destino > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

event dragdrop;control_dw2 = DraggedObject()
if control_dw2 = dw_lista then
	pb_agregar.triggerevent(clicked!)
end if

end event

event doubleclicked;long	ll_indi
il_tot_filas	= dw_lista.rowcount()
if il_tot_filas>0 then
	for ll_indi = 1 to il_tot_filas
		dw_lista.setitem(ll_indi,'estado',1)
		dw_lista.SelectRow(ll_indi, true)
	next
	dw_lista.accepttext()
end if
end event

type st_mostrar_todo from statictext within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 1527
integer y = 1904
integer width = 585
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 79741120
string text = "Todos los Periodos"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;//dw_lista.dataobject	= 'dw_lista_periodos_cierre_venta'
//dw_lista.settransobject(sqlca)
//if dw_lista.retrieve()=0 then
//	messagebox("Advertencia","No registra datos")
//end if
pb_proceso_gral.triggerevent(clicked!)
end event

type pb_filtrar from picturebutton within w_produccion_por_periodo_y_codigo
event ue_mousemove pbm_mousemove
integer x = 384
integer y = 1772
integer width = 169
integer height = 148
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type pb_ordenar from picturebutton within w_produccion_por_periodo_y_codigo
event ue_mousemove pbm_mousemove
integer x = 210
integer y = 1772
integer width = 169
integer height = 148
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type pb_imprimir from picturebutton within w_produccion_por_periodo_y_codigo
event ue_mousemove pbm_mousemove
integer x = 558
integer y = 1772
integer width = 169
integer height = 148
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type pb_exportar from picturebutton within w_produccion_por_periodo_y_codigo
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1772
integer width = 169
integer height = 148
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_aceptar from picturebutton within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 3506
integer y = 44
integer width = 169
integer height = 148
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
end type

event clicked;string	ls_codigo, ls_codigo_aux, ls_nombre, ls_a_Pat, ls_a_mat, ls_estado
long		ll_indi, ll_filas, ll_new, ll_mes, ll_anno, ll_cont_unidad_promesa, ll_tot_uf_promesas
Long		ll_cont_unidad_nro_lib, ll_tot_uf_liberador
Date		ld_fecha_ing, ld_fecha_cierre, ld_fecha_cierre_aux
dw_lista.reset()
dw_destino.reset()
gd_fecha_inicio	= datetime(date(em_fec_ini.text),time('00:00:00'))
gd_fecha_fin	 	= datetime(date(em_fec_fin.text),time('23:59:59'))
if gd_fecha_inicio <= gd_fecha_fin then
	if trim(em_codigo.text) <> '' then
		ll_filas		= dw_detalle.retrieve(trim(em_codigo.text),gd_fecha_inicio,gd_fecha_fin)
		if ll_filas=0 then
			messagebox("Advertencia","No registra dato")
		else
			if rb_jefe.checked=true then
				dw_detalle.dataobject	= 'dw_informe_gestion_ventas_por_jefe_rango'
				dw_detalle.settransobject(sqlca)
				ld_fecha_cierre_aux		= date(dw_detalle.getitemDatetime(1,'oferta_v_cierre_venta'))
				for ll_indi=1 to ll_filas
					if ld_fecha_cierre <> ld_fecha_cierre_aux then
						if not isnull(ld_fecha_cierre) and ll_mes>0 and ll_anno>0 then
							ll_new	= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,'mes',ll_mes)
							dw_lista.setitem(ll_new,'anno',ll_anno)
							dw_lista.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
							dw_lista.setitem(ll_new,'unidad_promesa',ll_cont_unidad_promesa)
							dw_lista.setitem(ll_new,'uf_promesa',ll_tot_uf_promesas)
							dw_lista.setitem(ll_new,'unidad_liberador',ll_cont_unidad_nro_lib)
							dw_lista.setitem(ll_new,'uf_liberador',ll_tot_uf_liberador)
						end if
						ld_fecha_cierre_aux	= ld_fecha_cierre
					end if
					ls_nombre					= dw_detalle.getitemstring(ll_indi,'jefe_ventas_nombre')
					ls_a_pat						= dw_detalle.getitemstring(ll_indi,'jefe_ventas_a_paterno')
					ls_a_mat						= dw_detalle.getitemstring(ll_indi,'jefe_ventas_a_materno')
					ls_codigo					= dw_detalle.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
					ls_estado					= dw_detalle.getitemstring(ll_indi,'jefe_ventas_estado')
					ll_cont_unidad_promesa	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
					ll_cont_unidad_nro_lib	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
					ll_tot_uf_promesas		= dw_detalle.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
					ll_tot_uf_liberador		= dw_detalle.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
					ld_fecha_ing				= date(dw_detalle.getitemDatetime(ll_indi,'jefe_ventas_fecha_ing'))
					ld_fecha_cierre			= date(dw_detalle.getitemDatetime(ll_indi,'oferta_v_cierre_venta'))
					ll_mes						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_periodo')
					ll_anno						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_anno')
				next
			end if
			
			if rb_supervisor.checked=true then
				dw_detalle.dataobject	= 'dw_informe_gestion_ventas_por_sup_rango'
				dw_detalle.settransobject(sqlca)
				ld_fecha_cierre_aux		= date(dw_detalle.getitemDatetime(1,'oferta_v_cierre_venta'))
				for ll_indi=1 to ll_filas
					if ld_fecha_cierre <> ld_fecha_cierre_aux then
						if not isnull(ld_fecha_cierre) and ll_mes>0 and ll_anno>0 then
							ll_new	= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,'mes',ll_mes)
							dw_lista.setitem(ll_new,'anno',ll_anno)
							dw_lista.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
							dw_lista.setitem(ll_new,'unidad_promesa',ll_cont_unidad_promesa)
							dw_lista.setitem(ll_new,'uf_promesa',ll_tot_uf_promesas)
							dw_lista.setitem(ll_new,'unidad_liberador',ll_cont_unidad_nro_lib)
							dw_lista.setitem(ll_new,'uf_liberador',ll_tot_uf_liberador)
						end if
						ld_fecha_cierre_aux	= ld_fecha_cierre
					end if
					ls_nombre					= dw_detalle.getitemstring(ll_indi,'supervisor_nombre')
					ls_a_pat						= dw_detalle.getitemstring(ll_indi,'supervisor_a_paterno')
					ls_a_mat						= dw_detalle.getitemstring(ll_indi,'supervisor_a_materno')
					ls_codigo					= dw_detalle.getitemstring(ll_indi,'supervisor_cod_sup')
					ls_estado					= dw_detalle.getitemstring(ll_indi,'supervisor_estado')
					ll_cont_unidad_promesa	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
					ll_cont_unidad_nro_lib	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
					ll_tot_uf_promesas		= dw_detalle.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
					ll_tot_uf_liberador		= dw_detalle.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
					ld_fecha_ing				= date(dw_detalle.getitemDatetime(ll_indi,'supervisor_fecha_ing'))
					ld_fecha_cierre			= date(dw_detalle.getitemDatetime(ll_indi,'oferta_v_cierre_venta'))
					ll_mes						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_periodo')
					ll_anno						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_anno')
				next
			end if
			if rb_agente.checked=true then
				dw_detalle.dataobject	= 'dw_informe_gestion_ventas_por_age_rango'
				dw_detalle.settransobject(sqlca)
				ld_fecha_cierre_aux		= date(dw_detalle.getitemDatetime(1,'oferta_v_cierre_venta'))
				for ll_indi=1 to ll_filas
					if ld_fecha_cierre <> ld_fecha_cierre_aux then
						if not isnull(ld_fecha_cierre) and ll_mes>0 and ll_anno>0 then
							ll_new	= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,'mes',ll_mes)
							dw_lista.setitem(ll_new,'anno',ll_anno)
							dw_lista.setitem(ll_new,'fecha_cierre',ld_fecha_cierre)
							dw_lista.setitem(ll_new,'unidad_promesa',ll_cont_unidad_promesa)
							dw_lista.setitem(ll_new,'uf_promesa',ll_tot_uf_promesas)
							dw_lista.setitem(ll_new,'unidad_liberador',ll_cont_unidad_nro_lib)
							dw_lista.setitem(ll_new,'uf_liberador',ll_tot_uf_liberador)
						end if
						ld_fecha_cierre_aux	= ld_fecha_cierre
					end if
					ls_nombre					= dw_detalle.getitemstring(ll_indi,'agentes_nombre')
					ls_a_pat						= dw_detalle.getitemstring(ll_indi,'agentes_a_paterno')
					ls_a_mat						= dw_detalle.getitemstring(ll_indi,'agentes_a_materno')
					ls_codigo					= dw_detalle.getitemstring(ll_indi,'agentes_cod_age')
					ls_estado					= dw_detalle.getitemstring(ll_indi,'agentes_estado')
					ll_cont_unidad_promesa	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe')
					ll_cont_unidad_nro_lib	= dw_detalle.getitemNumber(ll_indi,'cont_unidad_nro_jefe_lib')
					ll_tot_uf_promesas		= dw_detalle.getitemNumber(ll_indi,'tot_uf_promesas_jefe')
					ll_tot_uf_liberador		= dw_detalle.getitemNumber(ll_indi,'tot_uf_liberador_jefe')
					ld_fecha_ing				= date(dw_detalle.getitemDatetime(ll_indi,'agentes_fecha_ini'))
					ld_fecha_cierre			= date(dw_detalle.getitemDatetime(ll_indi,'oferta_v_cierre_venta'))
					ll_mes						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_periodo')
					ll_anno						= dw_detalle.getitemNumber(ll_indi,'cierre_venta_anno')
				next
			end if
		end if
	else
		messagebox("Advertencia","Debe ingresar Código a Consultar")
	end if
else
	messagebox("Advertencia","Rango fecha Incorrecta")
end if
end event

type st_2 from statictext within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 3506
integer y = 72
integer width = 155
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 3506
integer y = 60
integer width = 334
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type p_fec_fin from picture within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 3506
integer y = 64
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type p_fec_ini from picture within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 3506
integer y = 64
integer width = 82
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 3506
integer y = 60
integer width = 334
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_produccion_por_periodo_y_codigo
boolean visible = false
integer x = 3506
integer y = 72
integer width = 379
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Ingrese Periodo"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_salir from picturebutton within w_produccion_por_periodo_y_codigo
integer x = 3209
integer y = 1772
integer width = 169
integer height = 148
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_produccion_por_periodo_y_codigo)
end event

type dw_lista from datawindow within w_produccion_por_periodo_y_codigo
event ue_keypress ( )
integer x = 37
integer y = 272
integer width = 2254
integer height = 1456
string dragicon = "Exclamation!"
boolean bringtotop = true
string dataobject = "dwe_detalle_cierre_venta_por_trabajador"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long	ll_estado
il_row_origen	= row
dw_destino.reset()
if il_row_origen>0 then
	ll_estado	= this.getitemnumber(il_row_origen,'estado')
	this.accepttext()
	if ll_estado = 0 or isnull(ll_estado) then
		this.setitem(il_row_origen,'estado',1)
		This.SelectRow(il_row_origen, TRUE)
	else
		this.setitem(il_row_origen,'estado',0)
		This.SelectRow(il_row_origen, FALSE)
	end if
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;//if this.getrow()>0 then
//	This.SelectRow(0, FALSE)
//	This.SelectRow(this.getrow(), TRUE)
//end if
end event

event dragdrop;String	ls_codigo
control_dw = DraggedObject()
if control_dw = dw_destino and il_row_destino > 0 then
	dw_destino.deleterow(il_row_destino)
	if dw_destino.rowcount() = 0 then 
		pb_proceso.enabled	= false
	else
		pb_proceso.enabled	= True
	end if
end if
end event

type gb_grupo from groupbox within w_produccion_por_periodo_y_codigo
integer x = 37
integer y = 24
integer width = 1088
integer height = 212
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Opciones de Busqueda"
end type

