forward
global type w_cd_consultas from window
end type
type cb_cta_cte from commandbutton within w_cd_consultas
end type
type cb_mostrar_todo2 from commandbutton within w_cd_consultas
end type
type dw_estado from datawindow within w_cd_consultas
end type
type st_4 from statictext within w_cd_consultas
end type
type st_lista from statictext within w_cd_consultas
end type
type p_fec_estado_fin from picture within w_cd_consultas
end type
type p_fec_estado_ini from picture within w_cd_consultas
end type
type st_3 from statictext within w_cd_consultas
end type
type st_2 from statictext within w_cd_consultas
end type
type cb_mostrar_todo from commandbutton within w_cd_consultas
end type
type cb_filtrar from commandbutton within w_cd_consultas
end type
type cb_sort from commandbutton within w_cd_consultas
end type
type cb_exportar from commandbutton within w_cd_consultas
end type
type cb_imprimir from commandbutton within w_cd_consultas
end type
type cb_limpiar from commandbutton within w_cd_consultas
end type
type pb_lupa from picturebutton within w_cd_consultas
end type
type st_folio from statictext within w_cd_consultas
end type
type cb_detalle from commandbutton within w_cd_consultas
end type
type pb_aceptar from picturebutton within w_cd_consultas
end type
type p_fin from picture within w_cd_consultas
end type
type em_fec_fin from editmask within w_cd_consultas
end type
type st_21 from statictext within w_cd_consultas
end type
type p_ini from picture within w_cd_consultas
end type
type cb_cerrar from commandbutton within w_cd_consultas
end type
type dw_lista from datawindow within w_cd_consultas
end type
type gb_3 from groupbox within w_cd_consultas
end type
type rb_fecha_crea from radiobutton within w_cd_consultas
end type
type rb_fecha_ult_estado from radiobutton within w_cd_consultas
end type
type em_folio_fin from editmask within w_cd_consultas
end type
type em_ini from editmask within w_cd_consultas
end type
type st_11 from statictext within w_cd_consultas
end type
type st_hasta from statictext within w_cd_consultas
end type
type gb_1 from groupbox within w_cd_consultas
end type
type st_1 from statictext within w_cd_consultas
end type
type em_fec_ini from editmask within w_cd_consultas
end type
type em_fin from editmask within w_cd_consultas
end type
type em_folio from editmask within w_cd_consultas
end type
type em_codigo from editmask within w_cd_consultas
end type
type dwe_estado from datawindow within w_cd_consultas
end type
type gb_2 from groupbox within w_cd_consultas
end type
type em_referencia from editmask within w_cd_consultas
end type
end forward

global type w_cd_consultas from window
integer width = 3931
integer height = 1808
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_mousemove ( )
cb_cta_cte cb_cta_cte
cb_mostrar_todo2 cb_mostrar_todo2
dw_estado dw_estado
st_4 st_4
st_lista st_lista
p_fec_estado_fin p_fec_estado_fin
p_fec_estado_ini p_fec_estado_ini
st_3 st_3
st_2 st_2
cb_mostrar_todo cb_mostrar_todo
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
pb_lupa pb_lupa
st_folio st_folio
cb_detalle cb_detalle
pb_aceptar pb_aceptar
p_fin p_fin
em_fec_fin em_fec_fin
st_21 st_21
p_ini p_ini
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_3 gb_3
rb_fecha_crea rb_fecha_crea
rb_fecha_ult_estado rb_fecha_ult_estado
em_folio_fin em_folio_fin
em_ini em_ini
st_11 st_11
st_hasta st_hasta
gb_1 gb_1
st_1 st_1
em_fec_ini em_fec_ini
em_fin em_fin
em_folio em_folio
em_codigo em_codigo
dwe_estado dwe_estado
gb_2 gb_2
em_referencia em_referencia
end type
global w_cd_consultas w_cd_consultas

type variables
String		is_opcion,is_base,is_serie
Long		il_row,il_aceptar=0
Double	il_numero
end variables

event open;string	ls_nom,ls_pat,ls_mat,ls_estado,ld_cod_jef 
Datetime	ld_fec_ini, ld_fec_fin

dw_estado.settransobject(sqlca)
dw_estado.retrieve()
w_cd_consultas.width					= 3278
p_fec_estado_ini.visible				= false
p_fec_estado_fin.visible				= false
em_ini.visible							= false
em_fin.visible							= false
st_1.visible								= false
st_3.visible								= false
st_2.visible								= false
st_hasta.visible							= false
is_opcion									= trim(substr(1,1,Message.StringParm))
st_folio.width							= 352
st_folio.TextSize						= 19


CHOOSE CASE is_opcion
	CASE 'F' //Por Fecha
		st_folio.visible					= false
		em_referencia.visible			= false
		em_folio.visible					= false
		dwe_estado.visible			= false
		em_codigo.visible				= false
		pb_lupa.visible					= false
		st_hasta.visible					= false
		em_folio_fin.visible			= false
		gb_1.visible						= true
		st_11.visible						= true
		em_fec_ini.visible				= true
		p_ini.visible						= true
		st_21.visible						= true
		em_fec_fin.visible				= true
		p_fin.visible						= true
		gb_2.text							= 'Seleccione Opción'
		gb_2.width						= 791
		gb_2.visible						= true
		rb_fecha_crea.visible			= true
		rb_fecha_ult_estado.visible	= true
		rb_fecha_crea.checked		= true
		pb_aceptar.x					= 2286
		em_fec_ini.text					= string(today(),"dd/mm/yyyy")
		em_fec_fin.text					= string(today(),"dd/mm/yyyy")
		w_cd_consultas.title			= 'Consultar por Rango de Fecha'
		if gs_depto='B' then
			dw_lista.dataobject		= 'dw_consulta_rango_fecha_creacion_jefe'
		elseif gs_depto='R' then
			dw_lista.dataobject		= 'dw_consulta_rango_fecha_creacion_depto'
		else
			dw_lista.dataobject		= 'dw_consulta_rango_fecha_creacion'
		end if
		dw_lista.Height					= 1240
		ld_fec_ini							= datetime(date(em_fec_ini.text))
		ld_fec_fin							= datetime(date(em_fec_fin.text),time('23:59:59'))
		dw_lista.settransobject(sqlca)
		if gs_depto='R' or gs_depto='B' then
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)>0 then 
				dw_lista.scrolltorow(1)
				dw_lista.object.t_fecha.text	= 'Consulta por Rango Fecha Creación desde: '+string( date(ld_fec_ini) ,"dd/mm/yyyy")+' hasta: '+string( date(ld_fec_fin) ,"dd/mm/yyyy")
			end if
		else
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)>0 then 
				dw_lista.scrolltorow(1)
				dw_lista.object.t_fecha.text	= 'Consulta por Rango Fecha Creación desde: '+string( date(ld_fec_ini) ,"dd/mm/yyyy")+' hasta: '+string( date(ld_fec_fin) ,"dd/mm/yyyy")
			end if
		end if
		em_fec_ini.setfocus()
		gf_centrar(w_cd_consultas)
	CASE 'O' //Por Folio
		w_cd_consultas.title				= 'Consultar por Rango de Folio'
		if gs_depto='B' then
			dw_lista.dataobject			= 'dw_consulta_por_folio_jefe'
		elseif gs_depto='R' then
			dw_lista.dataobject			= 'dw_consulta_por_folio_depto'
		else
			dw_lista.dataobject			= 'dw_consulta_por_folio'
		end if
		dw_lista.settransobject(sqlca)
		em_referencia.visible			= false
		em_codigo.visible					= false
		pb_lupa.visible					= false
		dwe_estado.visible				= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		gb_2.visible						= true
		st_hasta.visible					= true
		em_folio_fin.visible				= true
		gb_2.text							= 'Ingrese Folio'
		gb_2.width							= 1755
		pb_aceptar.x						= 1833
		st_folio.visible					= true
		em_folio.text						= ''
		em_folio.visible					= true
		st_folio.TextSize					= 15
		st_hasta.TextSize					= 15
		st_folio.text						= 'Folio desde'
		dw_lista.Height					= 1240
		em_folio.setfocus()
		gf_centrar(w_cd_consultas)
	CASE 'E' //Por Estado
		st_folio.text						= 'Estado'
		em_referencia.visible			= false
		em_codigo.visible					= false
		pb_lupa.visible					= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio.visible					= false
		em_folio_fin.visible				= false
		dwe_estado.visible				= true
		p_fec_estado_ini.visible		= true
		p_fec_estado_fin.visible		= true
		em_ini.visible						= true
		em_fin.visible						= true
		st_1.visible						= true
		st_3.visible						= true
		st_2.visible						= true
		em_ini.text							= string(today(),"dd/mm/yyyy")
		em_fin.text							= string(today(),"dd/mm/yyyy")
		st_folio.TextSize					= 14
		dwe_estado.x						= 293
		st_folio.width						= 238
		pb_aceptar.x						= 3035
		gb_2.width							= 2967
		st_1.x								= 1467
		st_3.x								= 1678
		em_ini.x								= 1861
		p_fec_estado_ini.x				= 2226
		st_2.x								= 2318
		em_fin.x								= 2505
		p_fec_estado_fin.x				= 2871
		gb_2.text							= 'Seleccione Opcion'
		w_cd_consultas.title				= 'Consultar por Estado Actual'
		if gs_depto='B' then
			dw_lista.dataobject			= 'dw_consulta_por_estado_jefe'
		elseif gs_depto='R' then
			dw_lista.dataobject			= 'dw_consulta_por_estado_depto'
		else
			dw_lista.dataobject			= 'dw_consulta_por_estado'
		end if
		dwe_estado.settransobject(sqlca)
		dwe_estado.insertrow(0)
		dw_lista.Height					= 1240
		dw_lista.settransobject(sqlca)
		dwe_estado.setfocus()
		gf_centrar(w_cd_consultas)
	CASE 'U' //Por Estado Histótico
		st_folio.text						= 'Estado'
		em_referencia.visible			= false
		em_codigo.visible					= false
		pb_lupa.visible					= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio.visible					= false
		em_folio_fin.visible				= false
		dwe_estado.visible				= true
		p_fec_estado_ini.visible		= true
		p_fec_estado_fin.visible		= true
		em_ini.visible						= true
		em_fin.visible						= true
		st_1.visible						= true
		st_3.visible						= true
		st_2.visible						= true
		em_ini.text							= string(today(),"dd/mm/yyyy")
		em_fin.text							= string(today(),"dd/mm/yyyy")
		st_folio.TextSize					= 14
		dwe_estado.x						= 293
		st_folio.width						= 238
		pb_aceptar.x						= 3035
		gb_2.width							= 2967
		st_1.x								= 1467
		st_3.x								= 1678
		em_ini.x								= 1861
		p_fec_estado_ini.x				= 2226
		st_2.x								= 2318
		em_fin.x								= 2505
		p_fec_estado_fin.x				= 2871
		gb_2.text							= 'Seleccione Opcion'
		w_cd_consultas.title				= 'Consultar por Estado Histótico'
		if gs_depto='B' then
			dw_lista.dataobject			= 'dw_detalle_cd_agrupado_por_estado_jefe'
		elseif gs_depto='R' then
			dw_lista.dataobject			= 'dw_detalle_cd_agrupado_por_estado_depto'
		else
			dw_lista.dataobject			= 'dw_detalle_cd_agrupado_por_estado'
		end if
		dwe_estado.settransobject(sqlca)
		dwe_estado.insertrow(0)
		dw_lista.Height					= 1240
		dw_lista.settransobject(sqlca)
		dwe_estado.setfocus()
		gf_centrar(w_cd_consultas)
	CASE 'A' //Por Agente
		st_folio.text						= 'Agente'
		w_cd_consultas.title				= 'Consultar por Agente'
		em_referencia.visible			= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio.visible					= false
		em_folio_fin.visible				= false
		em_codigo.visible					= true
		pb_lupa.visible					= true
		pb_aceptar.x						= 2679
		gb_2.width							= 2583
		p_fec_estado_ini.visible		= true
		p_fec_estado_fin.visible		= true
		em_ini.visible						= true
		em_fin.visible						= true
		st_1.visible						= true
		st_3.visible						= true
		st_2.visible						= true
		st_1.x								= 1070
		st_3.x								= 1280
		em_ini.x								= 1463
		p_fec_estado_ini.x				= 1829
		st_2.x								= 1920
		em_fin.x								= 2107
		p_fec_estado_fin.x				= 2473
		em_ini.text							= string(today(),"dd/mm/yyyy")
		em_fin.text							= string(today(),"dd/mm/yyyy")
		gb_2.text							= 'Ingrese Codigo Agente'
		if gs_depto='B' then
			dw_lista.dataobject			= 'dw_consulta_por_agente_jefe'
		elseif gs_depto='R' then
			dw_lista.dataobject			= 'dw_consulta_por_agente_depto'
		else
			dw_lista.dataobject			= 'dw_consulta_por_agente'
		end if
		dw_lista.settransobject(sqlca)
		em_codigo.text						= ''
		dw_lista.Height					= 1240
		em_codigo.setfocus()
		gf_centrar(w_cd_consultas)
	CASE 'S' //Por Supervisor
		if gs_depto='B' then
			dw_lista.dataobject			= 'dw_consulta_por_supervisor_jefe'
		elseif gs_depto='R' then
			dw_lista.dataobject			= 'dw_consulta_por_supervisor_depto'
			SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO"  
			INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado  
			FROM 		"SUPERVISOR"  
			WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_nom						= ls_nom+' '+ls_pat+' '+ls_mat
				if ls_estado='A' then
					ls_estado				= 'Activo'
				else
					ls_estado				= 'Inactivo'
				end if
				em_codigo.text				= gs_user
				em_codigo.enabled			= false
			else
				em_codigo.text					= ''
				dw_lista.dataobject			= 'dw_consulta_por_supervisor'
			end if
		else
			em_codigo.text					= ''
			dw_lista.dataobject			= 'dw_consulta_por_supervisor'
		end if
		dw_lista.settransobject(sqlca)
		w_cd_consultas.title				= 'Consultar por Supervisor'
		st_folio.text						= 'Supervisor'
		st_folio.TextSize					= 15
		em_referencia.visible			= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio.visible					= false
		em_folio_fin.visible				= false
		em_codigo.visible					= true
		pb_lupa.visible					= true
		pb_aceptar.x						= 2679
		gb_2.width							= 2583
		p_fec_estado_ini.visible		= true
		p_fec_estado_fin.visible		= true
		em_ini.visible						= true
		em_fin.visible						= true
		st_1.visible						= true
		st_3.visible						= true
		st_2.visible						= true
		st_1.x								= 1070
		st_3.x								= 1280
		em_ini.x								= 1463
		p_fec_estado_ini.x				= 1829
		st_2.x								= 1920
		em_fin.x								= 2107
		p_fec_estado_fin.x				= 2473
		em_ini.text							= string(today(),"dd/mm/yyyy")
		em_fin.text							= string(today(),"dd/mm/yyyy")
		gb_2.text							= 'Ingrese Codigo Supervisor'
		dw_lista.Height					= 1240
		em_codigo.setfocus()
		gf_centrar(w_cd_consultas)
	CASE 'J' //Por Jefe de Venta
		w_cd_consultas.title				= 'Consultar por Jefe de Venta'
		st_folio.text						= 'Jefe Venta'
		st_folio.TextSize					= 15
		em_referencia.visible			= false
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		st_hasta.visible					= false
		em_folio.visible					= false
		em_folio_fin.visible				= false
		em_codigo.visible					= true
		pb_lupa.visible					= true
		pb_aceptar.x						= 2679
		gb_2.width							= 2583
		p_fec_estado_ini.visible		= true
		p_fec_estado_fin.visible		= true
		em_ini.visible						= true
		em_fin.visible						= true
		st_1.visible						= true
		st_3.visible						= true
		st_2.visible						= true
		st_1.x								= 1070
		st_3.x								= 1280
		em_ini.x								= 1463
		p_fec_estado_ini.x				= 1829
		st_2.x								= 1920
		em_fin.x								= 2107
		p_fec_estado_fin.x				= 2473
		em_ini.text							= string(today(),"dd/mm/yyyy")
		em_fin.text							= string(today(),"dd/mm/yyyy")
		gb_2.text							= 'Ingrese Codigo Jefe Venta'
		gf_centrar(w_cd_consultas)
		if gs_depto='B' then
			dw_lista.dataobject			= 'dw_consulta_por_jefe_venta_jefe'
			SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO"  
			INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado  
			FROM 		"JEFE_VENTAS"  
			WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_nom						= ls_nom+' '+ls_pat+' '+ls_mat
				if ls_estado='A' then
					ls_estado				= 'Activo'
				else
					ls_estado				= 'Inactivo'
				end if
				em_codigo.text				= gs_user
				em_codigo.enabled			= false
			end if
		elseif gs_depto='R' then
			messagebox("Advertencia","No Puede Consultar Datos de Jefe Ventas")
			close(w_cd_consultas)
		else
			em_codigo.text					= ''
			dw_lista.dataobject			= 'dw_consulta_por_jefe_venta'
			dw_lista.settransobject(sqlca)
			dw_lista.Height					= 1240
			em_codigo.setfocus()
			gf_centrar(w_cd_consultas)
		end if
	CASE 'R' //Referencia Memorandum
		w_cd_consultas.title				= 'Consultar por Referencia Memorandum'
		st_folio.text						= 'Referencia'
		st_folio.TextSize					= 15
		gb_1.visible						= false
		st_11.visible						= false
		em_fec_ini.visible				= false
		p_ini.visible						= false
		st_21.visible						= false
		em_fec_fin.visible				= false
		p_fin.visible						= false
		rb_fecha_crea.visible			= false
		rb_fecha_ult_estado.visible	= false
		rb_fecha_crea.checked			= false
		em_codigo.visible					= false
		pb_lupa.visible					= false
		st_hasta.visible					= false
		em_folio.visible					= false
		em_folio_fin.visible				= false
		em_referencia.visible			= true
		pb_aceptar.x						= 2665
		gb_2.width							= 2592
		gb_2.text							= 'Ingrese Referencia Memorandum'
		if gs_depto='B' then
			dw_lista.dataobject			= 'dw_consulta_por_referencia_memorandum_je'
		elseif gs_depto='R' then
			dw_lista.dataobject			= 'dw_consulta_por_referencia_memorandum_de'
		else
			dw_lista.dataobject			= 'dw_consulta_por_referencia_memorandum'
		end if
		dw_lista.settransobject(sqlca)
		dw_lista.Height					= 1240
		em_referencia.text				= ''
		em_referencia.setfocus()
		gf_centrar(w_cd_consultas)
END CHOOSE

end event

on w_cd_consultas.create
this.cb_cta_cte=create cb_cta_cte
this.cb_mostrar_todo2=create cb_mostrar_todo2
this.dw_estado=create dw_estado
this.st_4=create st_4
this.st_lista=create st_lista
this.p_fec_estado_fin=create p_fec_estado_fin
this.p_fec_estado_ini=create p_fec_estado_ini
this.st_3=create st_3
this.st_2=create st_2
this.cb_mostrar_todo=create cb_mostrar_todo
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.pb_lupa=create pb_lupa
this.st_folio=create st_folio
this.cb_detalle=create cb_detalle
this.pb_aceptar=create pb_aceptar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_21=create st_21
this.p_ini=create p_ini
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_3=create gb_3
this.rb_fecha_crea=create rb_fecha_crea
this.rb_fecha_ult_estado=create rb_fecha_ult_estado
this.em_folio_fin=create em_folio_fin
this.em_ini=create em_ini
this.st_11=create st_11
this.st_hasta=create st_hasta
this.gb_1=create gb_1
this.st_1=create st_1
this.em_fec_ini=create em_fec_ini
this.em_fin=create em_fin
this.em_folio=create em_folio
this.em_codigo=create em_codigo
this.dwe_estado=create dwe_estado
this.gb_2=create gb_2
this.em_referencia=create em_referencia
this.Control[]={this.cb_cta_cte,&
this.cb_mostrar_todo2,&
this.dw_estado,&
this.st_4,&
this.st_lista,&
this.p_fec_estado_fin,&
this.p_fec_estado_ini,&
this.st_3,&
this.st_2,&
this.cb_mostrar_todo,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.pb_lupa,&
this.st_folio,&
this.cb_detalle,&
this.pb_aceptar,&
this.p_fin,&
this.em_fec_fin,&
this.st_21,&
this.p_ini,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_3,&
this.rb_fecha_crea,&
this.rb_fecha_ult_estado,&
this.em_folio_fin,&
this.em_ini,&
this.st_11,&
this.st_hasta,&
this.gb_1,&
this.st_1,&
this.em_fec_ini,&
this.em_fin,&
this.em_folio,&
this.em_codigo,&
this.dwe_estado,&
this.gb_2,&
this.em_referencia}
end on

on w_cd_consultas.destroy
destroy(this.cb_cta_cte)
destroy(this.cb_mostrar_todo2)
destroy(this.dw_estado)
destroy(this.st_4)
destroy(this.st_lista)
destroy(this.p_fec_estado_fin)
destroy(this.p_fec_estado_ini)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_mostrar_todo)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.pb_lupa)
destroy(this.st_folio)
destroy(this.cb_detalle)
destroy(this.pb_aceptar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_21)
destroy(this.p_ini)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_3)
destroy(this.rb_fecha_crea)
destroy(this.rb_fecha_ult_estado)
destroy(this.em_folio_fin)
destroy(this.em_ini)
destroy(this.st_11)
destroy(this.st_hasta)
destroy(this.gb_1)
destroy(this.st_1)
destroy(this.em_fec_ini)
destroy(this.em_fin)
destroy(this.em_folio)
destroy(this.em_codigo)
destroy(this.dwe_estado)
destroy(this.gb_2)
destroy(this.em_referencia)
end on

type cb_cta_cte from commandbutton within w_cd_consultas
integer x = 425
integer y = 1588
integer width = 325
integer height = 96
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ct&a.Corriente"
end type

event clicked;String		ls_serie_c,ls_base_c
Double	ll_numero_c
if il_row>0 then
	gi_numero 	= dw_lista.getitemnumber(il_row,'numero')
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta/Columbario
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			SELECT	"PAGARE_V"."SERIE",   
						"PAGARE_V"."NUMERO",   
						"PAGARE_V"."BASE"  
			INTO 		:ls_serie_c,   
						:ll_numero_c,   
						:ls_base_c  
			FROM 		"PAGARE_V"  
			WHERE  ( "PAGARE_V"."SERIE_P" = :gs_serie ) AND  
					 ( "PAGARE_V"."NUMERO_P" = :gi_numero )   
			USING		sqlca; 
			if not isnull(ls_serie_c) and ls_serie_c<>'' and not isnull(ls_base_c) and ls_base_c<>'0' and ll_numero_c>0 then
				messagebox("Advertencia","Recuerde Pagaré seleccionado está Asociado al Contrato Nº "+ls_base_c+'-'+ls_serie_c+'-'+string(ll_numero_c,"###,###,###,###,###"))
			else
				messagebox("Advertencia","No Registra Datos Pagaré "+gs_base+'-'+gs_serie+'-'+string(gi_numero,"###,###,###,###,###"))
			end if
//			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
//			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			Open(w_cuenta_corriente_derecho)
		CASE "R" //Repactación Ctas.Mantencion
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			Open(w_cuenta_corriente_repactar_cta_mant)
		CASE "F","G","V"
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			open(w_cuenta_corriente_funeraria) 
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			Open(w_cuenta_corriente_aumento_capacidad)
	END CHOOSE
end if
end event

type cb_mostrar_todo2 from commandbutton within w_cd_consultas
integer x = 3323
integer y = 1588
integer width = 535
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Sacar Filtro Estado"
end type

event clicked;String	ls_string
ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type dw_estado from datawindow within w_cd_consultas
integer x = 3296
integer y = 84
integer width = 576
integer height = 1448
integer taborder = 120
string title = "none"
string dataobject = "dw_lista_estados_cd"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_codigo
String	ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo					= this.getitemnumber(row,'codigo')
	if is_opcion='F' or is_opcion='O' or is_opcion='E' or is_opcion='A' or &
		is_opcion='S' or is_opcion='J' or is_opcion='R' then
		ls_string					= 'ult_estado='+string(ll_codigo)
	elseif is_opcion='U' then
		ls_string					= 'estado='+string(ll_codigo)
	end if
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

event doubleclicked;Long		ll_codigo
String	ls_string
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_codigo					= this.getitemnumber(row,'codigo')
	if is_opcion='F' or is_opcion='O' or is_opcion='E' or is_opcion='A' or &
		is_opcion='S' or is_opcion='J' or is_opcion='R' then
		ls_string					= 'ult_estado='+string(ll_codigo)
	elseif is_opcion='U' then
		ls_string					= 'estado='+string(ll_codigo)
	end if
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

event rowfocuschanged;Long		ll_codigo
String	ls_string
if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	ll_codigo					= this.getitemnumber(this.getrow(),'codigo')
	if is_opcion='F' or is_opcion='O' or is_opcion='E' or is_opcion='A' or &
		is_opcion='S' or is_opcion='J' or is_opcion='R' then
		ls_string					= 'ult_estado='+string(ll_codigo)
	elseif is_opcion='U' then
		ls_string					= 'estado='+string(ll_codigo)
	end if
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	cb_mostrar_todo.enabled	= true
end if
end event

type st_4 from statictext within w_cd_consultas
integer x = 3305
integer y = 16
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Estado"
boolean focusrectangle = false
end type

type st_lista from statictext within w_cd_consultas
integer x = 2542
integer y = 1568
integer width = 334
integer height = 128
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar Lista Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;String	ls_string

if st_lista.text='Mostrar Lista Estado' then
	w_cd_consultas.width	= 3931
	st_lista.text					= 'NO Mostrar Lista Estado'
elseif st_lista.text='NO Mostrar Lista Estado' then
	w_cd_consultas.width	= 3278
	st_lista.text					= 'Mostrar Lista Estado'
	ls_string						= ''
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
end if
gf_centrar(w_cd_consultas)
end event

type p_fec_estado_fin from picture within w_cd_consultas
integer x = 2473
integer y = 108
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech,ls_codigo
Date		ld_fec_ini,ld_fec_fin
Long		ll_estado
dw_lista.reset()
if f_valida_fecha(em_fin.text)=-1 then 
	em_fin.text=string(today(),gs_formato_fecha)
	em_fin.setfocus()
	return
end if	
if em_fin.text<>'00/00/0000' then
	ls_fecha = em_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fin.setfocus()
		return
	else	
		em_fin.text = Message.StringParm
		dwe_estado.accepttext()
		ld_fec_ini	= date(em_ini.text)
		ld_fec_fin	= date(em_fin.text)
		if is_opcion='E' then
			ll_estado	= dwe_estado.getitemnumber(1,'estado')
			if not isnull(ll_estado) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
				pb_aceptar.triggerevent(clicked!)
			end if
		elseif is_opcion='A' or is_opcion='S' or is_opcion='J' then
			ls_codigo	= trim(em_codigo.text)
			if not isnull(ls_codigo) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
				pb_aceptar.triggerevent(clicked!)
			end if
		end if
	end if	
END IF
end event

type p_fec_estado_ini from picture within w_cd_consultas
integer x = 1829
integer y = 108
integer width = 78
integer height = 88
boolean originalsize = true
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech,ls_codigo
Long		ll_estado
Date		ld_fec_ini,ld_fec_fin
dw_lista.reset()
if f_valida_fecha(em_ini.text)=-1 then 
	em_ini.text	= string(today(),gs_formato_fecha)
	em_ini.setfocus()
	return
end if	
if em_ini.text<>'00/00/0000' then
	ls_fecha = em_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_ini.setfocus()
		return
	else	
		em_ini.text = Message.StringParm
		dwe_estado.accepttext()
		ld_fec_ini	= date(em_ini.text)
		ld_fec_fin	= date(em_fin.text)
		if is_opcion='E' then
			ll_estado	= dwe_estado.getitemnumber(1,'estado')
			if not isnull(ll_estado) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
				pb_aceptar.triggerevent(clicked!)
			end if
		elseif is_opcion='A' or is_opcion='S' or is_opcion='J' then
			ls_codigo	= trim(em_codigo.text)
			if not isnull(ls_codigo) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
				pb_aceptar.triggerevent(clicked!)
			end if
		end if
		
	end if	
END IF
end event

type st_3 from statictext within w_cd_consultas
integer x = 1280
integer y = 120
integer width = 165
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicial"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_cd_consultas
integer x = 1920
integer y = 116
integer width = 178
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_mostrar_todo from commandbutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 2034
integer y = 1588
integer width = 457
integer height = 96
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sacar Filtro Estado"
end type

event clicked;String	ls_string
ls_string	= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
end event

type cb_filtrar from commandbutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 1751
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 1518
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 1285
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 1042
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )

end event

type cb_limpiar from commandbutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 800
integer y = 1596
integer width = 229
integer height = 80
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
CHOOSE CASE is_opcion
	CASE 'F' //Por Fecha
		em_fec_ini.text					= string(today(),"dd/mm/yyyy")
		em_fec_fin.text					= string(today(),"dd/mm/yyyy")
		em_fec_ini.setfocus()
		
	CASE 'O' //Por Folio
		em_folio.text						= ''
		em_folio.setfocus()

	CASE 'E' //Por Estado
		dwe_estado.reset()
		dwe_estado.insertrow(0)
		dwe_estado.setfocus()
		
	CASE 'A' //Por Agente
		em_codigo.text						= ''
		em_codigo.setfocus()
		
	CASE 'S' //Por Supervisor
		em_codigo.text						= ''
		em_codigo.setfocus()

	CASE 'J' //Por Jefe de Venta
		em_codigo.text						= ''
		em_codigo.setfocus()

END CHOOSE
end event

type pb_lupa from picturebutton within w_cd_consultas
integer x = 850
integer y = 100
integer width = 114
integer height = 100
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.bmp"
end type

event clicked;openwithparm(w_lista_codigos,is_opcion)
end event

type st_folio from statictext within w_cd_consultas
integer x = 59
integer y = 108
integer width = 238
integer height = 84
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_detalle from commandbutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1588
integer width = 366
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Gestión"
end type

event clicked;String	ls_string
if dw_lista.rowcount()>0 then
	is_base		= dw_lista.getitemstring(il_row,'base')
	is_serie		= dw_lista.getitemstring(il_row,'serie')
	il_numero	= dw_lista.getitemnumber(il_row,'numero')
	ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(is_base) and il_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type pb_aceptar from picturebutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 3035
integer y = 72
integer width = 183
integer height = 156
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event clicked;Datetime	ld_fec_fin,ld_fec_ini
Long		ll_estado
String		ls_codigo,ls_referencia
Double	ll_folio,ll_folio_fin
SetPointer(HourGlass!)
dw_lista.reset()
il_aceptar++
CHOOSE CASE is_opcion
	CASE 'F' //Por Fecha
		if rb_fecha_crea.checked=true then
			if gs_depto='B' then
				dw_lista.dataobject			= 'dw_consulta_rango_fecha_creacion_jefe'
			elseif gs_depto='R' then
				dw_lista.dataobject			= 'dw_consulta_rango_fecha_creacion_depto'
			else
				dw_lista.dataobject			= 'dw_consulta_rango_fecha_creacion'
			end if
		elseif rb_fecha_ult_estado.checked=true then
			if gs_depto='B' then
				dw_lista.dataobject			= 'dw_consulta_rango_fecha_ult_estado_jefe'
			elseif gs_depto='R' then
				dw_lista.dataobject			= 'dw_consulta_rango_fecha_ult_estado_depto'
			else
				dw_lista.dataobject			= 'dw_consulta_rango_fecha_ult_estado'
			end if
		end if
		dw_lista.Settransobject(sqlca)
		ld_fec_ini								= datetime(date(em_fec_ini.text))
		ld_fec_fin								= datetime(date(em_fec_fin.text),time('23:59:59'))
		if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
			messagebox("Advertencia","Fecha Inicial Inválida")
			em_fec_ini.setfocus()
		else
			if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
				messagebox("Advertencia","Fecha Término Inválida")
				em_fec_fin.setfocus()
			else
				if ld_fec_ini>ld_fec_fin then
					messagebox("Advertencia","Rango Fecha Inválida")
					em_fec_fin.setfocus()
				else
					if gs_depto='R' or gs_depto='B' then
						if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_user)=0 then
							messagebox("Advertencia","No registra dato")
						else
							if rb_fecha_crea.checked=true then
								dw_lista.object.t_fecha.text	= 'Rango Fecha Creación desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
							elseif rb_fecha_ult_estado.checked=true then
								dw_lista.object.t_fecha.text	= 'Rango Fecha Ultimo Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
							end if
							dw_lista.scrolltorow(1)
						end if
					else
						if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
							messagebox("Advertencia","No registra dato")
						else
							if rb_fecha_crea.checked=true then
								dw_lista.object.t_fecha.text	= 'Rango Fecha Creación desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
							elseif rb_fecha_ult_estado.checked=true then
								dw_lista.object.t_fecha.text	= 'Rango Fecha Ultimo Estado desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
							end if
							dw_lista.scrolltorow(1)
						end if
					end if
				end if
			end if
		end if
	CASE 'O' //Por Folio
		ll_folio												= Double(em_folio.text)
		ll_folio_fin											= Double(em_folio_fin.text)
		if (isnull(ll_folio) or ll_folio=0) and ll_folio_fin>0 then 
			ll_folio											= ll_folio_fin
			em_folio.text									= string(ll_folio_fin)
		end if
		if (isnull(ll_folio_fin) or ll_folio_fin=0) and ll_folio>0 then 
			ll_folio_fin										= ll_folio
			em_folio_fin.text								= String(ll_folio)
		end if
		if not isnull(ll_folio) and ll_folio>0 and not isnull(ll_folio_fin) and ll_folio_fin>0 then 
			if ll_folio > ll_folio_fin then
				messagebox("Advertencia","Rango Inválido")
				em_folio.setfocus()
			else
				if gs_depto='R' or gs_depto='B' then
					if dw_lista.retrieve(ll_folio,ll_folio_fin,gs_user)=0 then
						messagebox("Advertencia","No Registra Movimiento Folio Nº "+string(ll_folio,"###,###,###,###"))
						em_folio.text							= ''
						em_folio_fin.text						= ''
						em_folio.setfocus()
					else
						if ll_folio=ll_folio_fin then
							dw_lista.object.t_fecha.text	= 'Consulta Folio Nº '+string( ll_folio ,"###,###,###,###")
						else
							dw_lista.object.t_fecha.text	= 'Consulta Folio desde Nº '+string( ll_folio ,"###,###,###,###")+' hasta Nº '+string( ll_folio_fin ,"###,###,###,###")
						end if
					end if
				else
					if dw_lista.retrieve(ll_folio,ll_folio_fin)=0 then
						messagebox("Advertencia","No Registra Movimiento Folio Nº "+string(ll_folio,"###,###,###,###"))
						em_folio.text							= ''
						em_folio_fin.text						= ''
						em_folio.setfocus()
					else
						if ll_folio=ll_folio_fin then
							dw_lista.object.t_fecha.text	= 'Consulta Folio Nº '+string( ll_folio ,"###,###,###,###")
						else
							dw_lista.object.t_fecha.text	= 'Consulta Folio desde Nº '+string( ll_folio ,"###,###,###,###")+' hasta Nº '+string( ll_folio_fin ,"###,###,###,###")
						end if
					end if
				end if
			end if
		end if

	CASE 'E' //Por Estado
		ll_estado	= dwe_estado.getitemnumber(1,'estado')
		ld_fec_ini	= datetime(date(em_ini.text))
		ld_fec_fin	= datetime(date(em_fin.text),time('23:59:59'))
		if trim(em_ini.text)='00/00/0000' or isnull(em_ini.text) then
			messagebox("Advertencia","Fecha Inicial Inválida")
			em_ini.setfocus()
		else
			if trim(em_fin.text)='00/00/0000' or isnull(em_fin.text) then
				messagebox("Advertencia","Fecha Término Inválida")
				em_fin.setfocus()
			else
				if ld_fec_ini>ld_fec_fin then
					messagebox("Advertencia","Rango Fecha Inválida")
					em_fin.setfocus()
				else
					if not isnull(ll_estado) and ll_estado>=0 then
						if gs_depto='R' or gs_depto='B' then
							if dw_lista.retrieve(ll_estado,ld_fec_ini,ld_fec_fin,gs_user)=0 then
								messagebox("Advertencia","No Registra Movimiento Estado Codigo: "+string(ll_estado)+" en el Rango de Fecha Indicada")
								dwe_estado.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Ultimo Estado Codigo: '+string( ll_estado)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						else
							if dw_lista.retrieve(ll_estado,ld_fec_ini,ld_fec_fin)=0 then
								messagebox("Advertencia","No Registra Movimiento Estado Codigo: "+string(ll_estado)+" en el Rango de Fecha Indicada")
								dwe_estado.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Ultimo Estado Codigo: '+string( ll_estado)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						end if
					end if
				end if
			end if
		end if
		
	CASE 'U' //Por Estado
		ll_estado	= dwe_estado.getitemnumber(1,'estado')
		ld_fec_ini	= datetime(date(em_ini.text))
		ld_fec_fin	= datetime(date(em_fin.text),time('23:59:59'))
		if trim(em_ini.text)='00/00/0000' or isnull(em_ini.text) then
			messagebox("Advertencia","Fecha Inicial Inválida")
			em_ini.setfocus()
		else
			if trim(em_fin.text)='00/00/0000' or isnull(em_fin.text) then
				messagebox("Advertencia","Fecha Término Inválida")
				em_fin.setfocus()
			else
				if ld_fec_ini>ld_fec_fin then
					messagebox("Advertencia","Rango Fecha Inválida")
					em_fin.setfocus()
				else
					if not isnull(ll_estado) and ll_estado>=0 then
						if gs_depto='R' or gs_depto='B' then
							if dw_lista.retrieve(ll_estado,ld_fec_ini,ld_fec_fin,gs_user)=0 then
								messagebox("Advertencia","No Registra Movimiento Estado Codigo: "+string(ll_estado)+" en el Rango de Fecha Indicada")
								dwe_estado.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Estado Codigo: '+string( ll_estado)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						else
							if dw_lista.retrieve(ll_estado,ld_fec_ini,ld_fec_fin)=0 then
								messagebox("Advertencia","No Registra Movimiento Estado Codigo: "+string(ll_estado)+" en el Rango de Fecha Indicada")
								dwe_estado.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Estado Codigo: '+string( ll_estado)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						end if
					end if
				end if
			end if
		end if

	CASE 'A' //Por Agente
		ls_codigo	= trim(em_codigo.text)
		ld_fec_ini	= datetime(date(em_ini.text))
		ld_fec_fin	= datetime(date(em_fin.text),time('23:59:59'))
		if trim(em_ini.text)='00/00/0000' or isnull(em_ini.text) then
			messagebox("Advertencia","Fecha Inicial Inválida")
			em_ini.setfocus()
		else
			if trim(em_fin.text)='00/00/0000' or isnull(em_fin.text) then
				messagebox("Advertencia","Fecha Término Inválida")
				em_fin.setfocus()
			else
				if ld_fec_ini>ld_fec_fin then
					messagebox("Advertencia","Rango Fecha Inválida")
					em_fin.setfocus()
				else
					if not isnull(ls_codigo) and ls_codigo<>'' then
						if gs_depto='R' or gs_depto='B' then
							if dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin,gs_user)=0 then
								messagebox("Advertencia","No Registra Movimiento Agente Codigo: "+string(ls_codigo))
								em_codigo.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Agente Codigo: '+string(ls_codigo)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						else
							if dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin)=0 then
								messagebox("Advertencia","No Registra Movimiento Agente Codigo: "+string(ls_codigo))
								em_codigo.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Agente Codigo: '+string(ls_codigo)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						end if
					end if
				end if
			end if
		end if

	CASE 'S' //Por Supervisor
		ls_codigo	= trim(em_codigo.text)
		ld_fec_ini	= datetime(date(em_ini.text))
		ld_fec_fin	= datetime(date(em_fin.text),time('23:59:59'))
		if trim(em_ini.text)='00/00/0000' or isnull(em_ini.text) then
			messagebox("Advertencia","Fecha Inicial Inválida")
			em_ini.setfocus()
		else
			if trim(em_fin.text)='00/00/0000' or isnull(em_fin.text) then
				messagebox("Advertencia","Fecha Término Inválida")
				em_fin.setfocus()
			else
				if ld_fec_ini>ld_fec_fin then
					messagebox("Advertencia","Rango Fecha Inválida")
					em_fin.setfocus()
				else
					if not isnull(ls_codigo) and ls_codigo<>'' then
						if gs_depto='R' or gs_depto='B' then
							if dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin,gs_user)=0 then
								messagebox("Advertencia","No Registra Movimiento Supervisor Codigo: "+string(ls_codigo))
								em_codigo.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Supervisor Codigo: '+string(ls_codigo)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						else
							if dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin)=0 then
								messagebox("Advertencia","No Registra Movimiento Supervisor Codigo: "+string(ls_codigo))
								em_codigo.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Supervisor Codigo: '+string(ls_codigo)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						end if
					end if
				end if
			end if
		end if

	CASE 'J' //Por Jefe de Venta
		ls_codigo	= trim(em_codigo.text)
		ld_fec_ini	= datetime(date(em_ini.text))
		ld_fec_fin	= datetime(date(em_fin.text),time('23:59:59'))
		if trim(em_ini.text)='00/00/0000' or isnull(em_ini.text) then
			messagebox("Advertencia","Fecha Inicial Inválida")
			em_ini.setfocus()
		else
			if trim(em_fin.text)='00/00/0000' or isnull(em_fin.text) then
				messagebox("Advertencia","Fecha Término Inválida")
				em_fin.setfocus()
			else
				if ld_fec_ini>ld_fec_fin then
					messagebox("Advertencia","Rango Fecha Inválida")
					em_fin.setfocus()
				else
					if not isnull(ls_codigo) and ls_codigo<>'' then
						if gs_depto='R' or gs_depto='B' then
							if dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin,gs_user)=0 then
								messagebox("Advertencia","No Registra Movimiento Jefe Venta Codigo: "+string(ls_codigo))
								em_codigo.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Jefe Venta Codigo: '+string(ls_codigo)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						else
							if dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin)=0 then
								messagebox("Advertencia","No Registra Movimiento Jefe Venta Codigo: "+string(ls_codigo))
								em_codigo.setfocus()
							else
								dw_lista.object.t_fecha.text	= 'Consulta Jefe Venta Codigo: '+string(ls_codigo)+', Rango Fecha desde '+string(ld_fec_ini,"dd/mm/yyyy")+' al '+string(ld_fec_fin,"dd/mm/yyyy")
							end if
						end if
					end if
				end if
			end if
		end if

	CASE 'R' //Por Refrencia Memorandum
		ls_codigo		= trim(em_referencia.text)
		ls_referencia	= trim(em_referencia.text)
		if not isnull(ls_codigo) and ls_codigo<>'' then 
			ls_codigo	= ls_codigo+'%'
			if gs_depto='R' or gs_depto='B' then
				if dw_lista.retrieve(ls_codigo,gs_user)=0 then
					messagebox("Advertencia","No Registra Memorandum Referencia: "+string(ls_referencia))
					em_codigo.setfocus()
				else
					dw_lista.object.t_fecha.text	= 'Consulta Memorandum Referencia: '+string(ls_referencia)
				end if
			else
				if dw_lista.retrieve(ls_codigo)=0 then
					messagebox("Advertencia","No Registra Memorandum Referencia: "+string(ls_referencia))
					em_codigo.setfocus()
				else
					dw_lista.object.t_fecha.text	= 'Consulta Memorandum Referencia: '+string(ls_referencia)
				end if
			end if
		end if

END CHOOSE
SetPointer(arrow!)
end event

type p_fin from picture within w_cd_consultas
boolean visible = false
integer x = 2112
integer y = 112
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
Date		ld_fec_ini,ld_fec_fin
dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
		ld_fec_ini	= date(em_fec_ini.text)
		ld_fec_fin	= date(em_fec_fin.text)
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type em_fec_fin from editmask within w_cd_consultas
boolean visible = false
integer x = 1733
integer y = 112
integer width = 370
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type st_21 from statictext within w_cd_consultas
boolean visible = false
integer x = 1568
integer y = 124
integer width = 169
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_ini from picture within w_cd_consultas
boolean visible = false
integer x = 1472
integer y = 112
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
Date		ld_fec_ini,ld_fec_fin
dw_lista.reset()
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
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
		ld_fec_ini	= date(em_fec_ini.text)
		ld_fec_fin	= date(em_fec_fin.text)
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type cb_cerrar from commandbutton within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 2921
integer y = 1588
integer width = 297
integer height = 96
integer taborder = 200
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_consultas)
end event

type dw_lista from datawindow within w_cd_consultas
event ue_mousemove pbm_dwnmousemove
integer x = 37
integer y = 292
integer width = 3182
integer height = 1240
integer taborder = 120
string title = "none"
string dataobject = "dw_consulta_por_estado_jefe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	is_base		= this.getitemstring(il_row,'base')
	is_serie		= this.getitemstring(il_row,'serie')
	il_numero	= this.getitemnumber(il_row,'numero')
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	is_base		= this.getitemstring(il_row,'base')
	is_serie		= this.getitemstring(il_row,'serie')
	il_numero	= this.getitemnumber(il_row,'numero')
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	is_base		= this.getitemstring(il_row,'base')
	is_serie		= this.getitemstring(il_row,'serie')
	il_numero	= this.getitemnumber(il_row,'numero')
	if isnull(this.getitemstring(il_row,'usuario_crea')) or this.getitemstring(il_row,'usuario_crea')='' then
		cb_cta_cte.triggerevent(clicked!)
	else
		cb_detalle.triggerevent(clicked!)
	end if
end if
end event

type gb_3 from groupbox within w_cd_consultas
event ue_mousemove pbm_mousemove
integer x = 773
integer y = 1544
integer width = 1239
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_fecha_crea from radiobutton within w_cd_consultas
boolean visible = false
integer x = 69
integer y = 84
integer width = 654
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Fecha Creación"
end type

event clicked;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type rb_fecha_ult_estado from radiobutton within w_cd_consultas
boolean visible = false
integer x = 69
integer y = 160
integer width = 731
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Fecha Ultimo Estado"
end type

event clicked;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type em_folio_fin from editmask within w_cd_consultas
boolean visible = false
integer x = 1248
integer y = 96
integer width = 512
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;Double	ll_folio,ll_folio_fin
ll_folio			= Double(em_folio.text)
ll_folio_fin		= Double(em_folio_fin.text)
dw_lista.reset()
if not isnull(ll_folio) and ll_folio>0 and not isnull(ll_folio_fin) and ll_folio_fin>0 then 
	pb_aceptar.setfocus()
	if ll_folio <= ll_folio_fin then pb_aceptar.triggerevent(clicked!)
end if
end event

type em_ini from editmask within w_cd_consultas
integer x = 1463
integer y = 108
integer width = 361
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;String	ls_codigo
Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_ini.text)
ld_fec_fin	= date(em_fin.text)
ls_codigo	= trim(em_codigo.text)
if not isnull(ls_codigo) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type st_11 from statictext within w_cd_consultas
boolean visible = false
integer x = 887
integer y = 124
integer width = 187
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_hasta from statictext within w_cd_consultas
boolean visible = false
integer x = 919
integer y = 108
integer width = 306
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_cd_consultas
boolean visible = false
integer x = 864
integer y = 16
integer width = 1367
integer height = 236
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Rango de Fecha"
end type

type st_1 from statictext within w_cd_consultas
integer x = 1070
integer y = 84
integer width = 187
integer height = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_cd_consultas
boolean visible = false
integer x = 1093
integer y = 112
integer width = 370
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	if il_aceptar>0 then pb_aceptar.triggerevent(clicked!)
end if
end event

type em_fin from editmask within w_cd_consultas
integer x = 2107
integer y = 108
integer width = 361
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;String	ls_codigo
Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_ini.text)
ld_fec_fin	= date(em_fin.text)
ls_codigo	= trim(em_codigo.text)
if not isnull(ls_codigo) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type em_folio from editmask within w_cd_consultas
boolean visible = false
integer x = 411
integer y = 96
integer width = 544
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;Double		ll_folio,ll_folio_fin
ll_folio			= Double(em_folio.text)
ll_folio_fin		= Double(em_folio_fin.text)
dw_lista.reset()
if not isnull(ll_folio) and ll_folio>0 and not isnull(ll_folio_fin) and ll_folio_fin>0 then 
	em_folio_fin.setfocus()
	if ll_folio <= ll_folio_fin then pb_aceptar.triggerevent(clicked!)
end if
end event

type em_codigo from editmask within w_cd_consultas
integer x = 421
integer y = 100
integer width = 416
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
end type

event modified;String	ls_codigo,ls_estado,ls_nom,ls_pat,ls_mat,ls_cod_sup

if is_opcion='A' then
	gb_2.text	= 'Ingrese Codigo Agente'
elseif is_opcion='S' then
	gb_2.text	= 'Ingrese Codigo Supervisor'
elseif is_opcion='J' then
	gb_2.text	= 'Ingrese Codigo Jefe Venta'
end if
ls_codigo		= trim(this.text)
if not isnull(ls_codigo) and ls_codigo<>'' then
	CHOOSE CASE is_opcion
		CASE 'A'
			if gs_depto='B' then
				SELECT	"AGENTES"."NOMBRE",	"AGENTES"."A_PATERNO",	"AGENTES"."A_MATERNO",	"AGENTES"."ESTADO" 
				INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado
				FROM 		"AGENTES","SUPERVISOR"  
				WHERE 	"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" and
							"AGENTES"."COD_AGE" = :ls_codigo and
							"SUPERVISOR"."COD_JEFE" = :gs_user 
				USING		sqlca;
			elseif gs_depto='R' then
				SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO" 
				INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado
				FROM 		"AGENTES"  
				WHERE 	"AGENTES"."COD_AGE" = :ls_codigo and
							"AGENTES"."COD_SUP" = :gs_user 
				USING		sqlca;
			else
				SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO" 
				INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado
				FROM 		"AGENTES"  
				WHERE 	"AGENTES"."COD_AGE" = :ls_codigo 
				USING		sqlca;
			end if
			if sqlca.sqlcode=0 then
				ls_nom				= ls_nom+' '+ls_pat+' '+ls_mat
				if ls_estado='A' then
					ls_estado		= 'Activo'
				else
					ls_estado		= 'Inactivo'
				end if
				gb_2.text			= 'Ingrese Codigo Agente          '+ls_nom+'          Estado:'+ls_estado
			else
				if gs_depto='B' then
					messagebox("Advertencia","Codigo Agente No Asociado a Jefe Ventas "+gs_user)
					em_codigo.text		= ''
				elseif gs_depto='R' then
					messagebox("Advertencia","Codigo Agente No Asociado a Supervisor "+gs_user)
					em_codigo.text		= ''
				else
					messagebox("Advertencia","Codigo Agente No Existe")
					em_codigo.text		= ''
				end if
			end if

		CASE 'S'
			if gs_depto='B' then
				SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO"  
				INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado  
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_codigo and   
							"SUPERVISOR"."COD_JEFE" = :gs_user
				USING		sqlca;
			elseif gs_depto='R' then
				SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO"  
				INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado  
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
				USING		sqlca;
			else
				SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO"  
				INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado  
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_codigo   
				USING		sqlca;
			end if 
			if sqlca.sqlcode=0 then
				ls_nom				= ls_nom+' '+ls_pat+' '+ls_mat
				if ls_estado='A' then
					ls_estado		= 'Activo'
				else
					ls_estado		= 'Inactivo'
				end if
				gb_2.text			= 'Ingrese Codigo Supervisor          '+ls_nom+'          Estado:'+ls_estado
			else
				if gs_depto='B' then
					messagebox("Advertencia","Codigo Supervisor No Asociado a Jefe Ventas "+gs_user)
					em_codigo.text		= ''
				else
					messagebox("Advertencia","Codigo Agente No Existe")
					em_codigo.text		= ''
				end if
			end if

		CASE 'J'
			if gs_depto='B' then
				SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO"  
				INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado  
				FROM 		"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user    
				USING		sqlca;
			else
				SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO"  
				INTO 		:ls_nom,		:ls_pat,			:ls_mat,			:ls_estado  
				FROM 		"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo
				USING		sqlca;
			end if
			if sqlca.sqlcode=0 then
				ls_nom				= ls_nom+' '+ls_pat+' '+ls_mat
				if ls_estado='A' then
					ls_estado		= 'Activo'
				else
					ls_estado		= 'Inactivo'
				end if
				gb_2.text			= 'Ingrese Codigo Jefe Venta          '+ls_nom+'          Estado:'+ls_estado
			else
				messagebox("Advertencia","Codigo Jefe de Venta No Existe")
				em_codigo.text		= ''
			end if
	END CHOOSE
	dw_lista.reset()
end if
end event

type dwe_estado from datawindow within w_cd_consultas
boolean visible = false
integer x = 293
integer y = 96
integer width = 1184
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_estado"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_estado
Long		ll_estado
Date		ld_fec_ini,ld_fec_fin
ls_estado		= dwo.name
dwe_estado.accepttext()
ld_fec_ini		= date(em_ini.text)
ld_fec_fin		= date(em_fin.text)
if ls_estado='estado' then
	ll_estado	= dwe_estado.getitemnumber(1,'estado')
	if not isnull(ll_estado) and not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
		pb_aceptar.triggerevent(clicked!)
	end if
end if
end event

type gb_2 from groupbox within w_cd_consultas
integer x = 37
integer y = 16
integer width = 2583
integer height = 236
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_referencia from editmask within w_cd_consultas
boolean visible = false
integer x = 425
integer y = 96
integer width = 2158
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event modified;String	ls_ref
ls_ref	= trim(this.text)
if not isnull(ls_ref) and ls_ref<>'' then pb_aceptar.triggerevent(clicked!)
end event

