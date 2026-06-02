forward
global type w_inf_reserva_tec from window
end type
type cb_2 from commandbutton within w_inf_reserva_tec
end type
type cb_1 from commandbutton within w_inf_reserva_tec
end type
type rb_resumen from radiobutton within w_inf_reserva_tec
end type
type rb_detalle from radiobutton within w_inf_reserva_tec
end type
type rb_todos from radiobutton within w_inf_reserva_tec
end type
type dw_parque from datawindow within w_inf_reserva_tec
end type
type cb_imprimir from commandbutton within w_inf_reserva_tec
end type
type cb_filtrar from commandbutton within w_inf_reserva_tec
end type
type cb_ordenar from commandbutton within w_inf_reserva_tec
end type
type cb_exportar from commandbutton within w_inf_reserva_tec
end type
type cb_cerrar from commandbutton within w_inf_reserva_tec
end type
type dw_resv_tecnica from datawindow within w_inf_reserva_tec
end type
type gb_2 from groupbox within w_inf_reserva_tec
end type
type gb_1 from groupbox within w_inf_reserva_tec
end type
end forward

global type w_inf_reserva_tec from window
integer width = 3835
integer height = 2084
boolean titlebar = true
string title = "Informe reservas Tecnicas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_cargar pbm_custom01
cb_2 cb_2
cb_1 cb_1
rb_resumen rb_resumen
rb_detalle rb_detalle
rb_todos rb_todos
dw_parque dw_parque
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_cerrar cb_cerrar
dw_resv_tecnica dw_resv_tecnica
gb_2 gb_2
gb_1 gb_1
end type
global w_inf_reserva_tec w_inf_reserva_tec

type variables
string	is_area_stgo
long 	il_row, il_parque
end variables

forward prototypes
public subroutine wf_por_parque (long al_cod_parque)
public subroutine wf_todos ()
end prototypes

event ue_cargar;//rb_todos.triggerevent(clicked!)
//wf_todos()
rb_resumen.triggerevent(clicked!)
dw_resv_tecnica.ScrollToRow(1)
end event

public subroutine wf_por_parque (long al_cod_parque);string		ls_area,ls_sector,ls_estado,ls_string
long		ll_cod_parque,ll_stock,ll_asig,ll_reserv,ll_new,ll_disp,ll_res_tec,ll_operacional,ll_normativas,ll_prov_comercial,ll_paisajismo,&
			ll_inversion,ll_permiso,ll_tot_no_vend,ll_tot_vend,ll_tot_resv_sepul

//wf_por_parque(al_cod_parque)
dw_resv_tecnica.reset()
SetPointer(HourGlass!)

if rb_detalle.checked = true then
	if al_cod_parque <> 103 then
		DECLARE x1 CURSOR FOR
		SELECT DISTINCT "COD_PARQUE","AREA","SECTOR"
		FROM			"BASE_PLANI"
		WHERE		"BASE_PLANI"."COD_PARQUE" = :al_cod_parque AND
						"BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto
		ORDER BY 	"BASE_PLANI"."COD_PARQUE" ASC,
						"BASE_PLANI"."AREA" ASC,
						"BASE_PLANI"."SECTOR" ASC
		USING		sqlca;
	else
		ls_string		= is_area_stgo +'%'
		DECLARE x3 CURSOR FOR
		SELECT DISTINCT "COD_PARQUE","AREA","SECTOR"
		FROM			"BASE_PLANI"
		WHERE		"BASE_PLANI"."COD_PARQUE" = :al_cod_parque and
						"BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto AND
						"BASE_PLANI"."AREA"	like :ls_string
		ORDER BY 	"BASE_PLANI"."COD_PARQUE" ASC,
						"BASE_PLANI"."AREA" ASC,
						"BASE_PLANI"."SECTOR" ASC
		USING		sqlca;
	end if	
	
elseif rb_resumen.checked = true then
	if al_cod_parque <> 103 then
		DECLARE x2 CURSOR FOR
		SELECT DISTINCT "COD_PARQUE","AREA"
		FROM			"BASE_PLANI"
		WHERE		"BASE_PLANI"."COD_PARQUE" = :al_cod_parque AND
						"BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto
		ORDER BY 	"BASE_PLANI"."COD_PARQUE" ASC,
						"BASE_PLANI"."AREA" ASC
		USING		sqlca;
	else
		ls_string		= is_area_stgo +'%'
		DECLARE x4 CURSOR FOR
		SELECT DISTINCT "COD_PARQUE","AREA"
		FROM			"BASE_PLANI"
		WHERE		"BASE_PLANI"."COD_PARQUE" = :al_cod_parque and
						"BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto and
						"BASE_PLANI"."AREA"	like :ls_string
		ORDER BY 	"BASE_PLANI"."COD_PARQUE" ASC,
						"BASE_PLANI"."AREA" ASC
		USING			sqlca;
	end if	
end if
if rb_detalle.checked = true then
	if al_cod_parque <> 103 then
		open x1;
	else
		open x3;
	end if	
elseif rb_resumen.checked = true then
	if al_cod_parque <> 103 then
		open x2;
	else
		open x4;
	end if	
end if
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		if rb_detalle.checked = true then
			if al_cod_parque <> 103 then
				fetch x1 INTO	:ll_cod_parque,:ls_area,:ls_sector;
			else
				fetch x3 INTO	:ll_cod_parque,:ls_area,:ls_sector;
			end if	
		elseif rb_resumen.checked = true then
			if al_cod_parque <> 103 then
				fetch x2 INTO	:ll_cod_parque,:ls_area;
			else
				fetch x4 INTO	:ll_cod_parque,:ls_area;
			end if	
		end if
		if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_area) and ls_area<>'' then
			if rb_detalle.checked = true then
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_operacional
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '6' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto='CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_operacional
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '6' ) AND
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if
				
				if sqlca.sqlcode=0 then
					if not isnull(ll_operacional) and ll_operacional>0 then
						ll_operacional							= ll_operacional
					else
						ll_operacional							= 0 
					end if
				else
					ll_operacional								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_normativas
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '2' ) AND 
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND 
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto='CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_normativas
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '2' ) AND 
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND 
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if

				if sqlca.sqlcode=0 then
					if not isnull(ll_normativas) and ll_normativas>0 then
						ll_normativas							= ll_normativas
					else
						ll_normativas							= 0 
					end if
				else
					ll_normativas								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_prov_comercial
					FROM		"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '5' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_prov_comercial
					FROM		"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '5' ) AND
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_prov_comercial) and ll_prov_comercial>0 then
						ll_prov_comercial							= ll_prov_comercial
					else
						ll_prov_comercial							= 0 
					end if
				else
					ll_prov_comercial								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_paisajismo
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '3' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto='CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_paisajismo
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '3' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_paisajismo) and ll_paisajismo>0 then
						ll_paisajismo								= ll_paisajismo
					else
						ll_paisajismo								= 0 
					end if
				else
					ll_paisajismo									= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_inversion
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '1' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_inversion
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '1' ) AND
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_inversion) and ll_inversion>0 then
						ll_inversion								= ll_inversion
					else
						ll_inversion								= 0 
					end if
				else
					ll_inversion									= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_permiso
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '4' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_permiso
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '4' ) AND
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_permiso) and ll_permiso>0 then
						ll_permiso								= ll_permiso
					else
						ll_permiso								= 0 
					end if
				else
					ll_permiso									= 0
				end if
			elseif rb_resumen.checked = true then
				if gs_producto='SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_operacional
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '6' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto='CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_operacional
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '6' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_operacional) and ll_operacional>0 then
						ll_operacional							= ll_operacional
					else
						ll_operacional							= 0 
					end if
				else
					ll_operacional								= 0
				end if
				if gs_producto='SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_normativas
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '2' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto='CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_normativas
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '2' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_normativas) and ll_normativas>0 then
						ll_normativas							= ll_normativas
					else
						ll_normativas							= 0 
					end if
				else
					ll_normativas								= 0
				end if
				if gs_producto='SE' then
					SELECT	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_prov_comercial
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '5' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto='CU' then
					SELECT	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_prov_comercial
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '5' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_prov_comercial) and ll_prov_comercial>0 then
						ll_prov_comercial							= ll_prov_comercial
					else
						ll_prov_comercial							= 0 
					end if
				else
					ll_prov_comercial								= 0
				end if
				if gs_producto='SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_paisajismo
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '3' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto='CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_paisajismo
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '3' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_paisajismo) and ll_paisajismo>0 then
						ll_paisajismo								= ll_paisajismo
					else
						ll_paisajismo								= 0 
					end if
				else
					ll_paisajismo									= 0
				end if
				if gs_producto='SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_inversion
					FROM 	"RESERVA_SEPULTURA"  
					WHERE	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '1' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto='CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_inversion
					FROM 	"RESERVA_SEPULTURA"  
					WHERE	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '1' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_inversion) and ll_inversion>0 then
						ll_inversion								= ll_inversion
					else
						ll_inversion								= 0 
					end if
				else
					ll_inversion									= 0
				end if
				if gs_producto='SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_permiso
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '4' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> '4' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto='CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_permiso
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '4' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = '4' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_permiso) and ll_permiso>0 then
						ll_permiso								= ll_permiso
					else
						ll_permiso								= 0 
					end if
				else
					ll_permiso									= 0
				end if
			end if
			ll_new							= dw_resv_tecnica.insertrow(0)
			dw_resv_tecnica.scrolltorow(ll_new)
			dw_resv_tecnica.setitem(ll_new,"cod_parque",ll_cod_parque)
			dw_resv_tecnica.setitem(ll_new,"area",ls_area)
			dw_resv_tecnica.setitem(ll_new,"sector",ls_sector)
			dw_resv_tecnica.setitem(ll_new,"operacional",ll_operacional)
			dw_resv_tecnica.setitem(ll_new,"normativas",ll_normativas)
			ll_tot_no_vend				= ll_operacional + ll_normativas
			dw_resv_tecnica.setitem(ll_new,"total_no_vendible",ll_tot_no_vend)
			
			dw_resv_tecnica.setitem(ll_new,"prov_comercial",ll_prov_comercial)
			dw_resv_tecnica.setitem(ll_new,"paisajismo",ll_paisajismo)
			dw_resv_tecnica.setitem(ll_new,"con_inversion",ll_inversion)
			dw_resv_tecnica.setitem(ll_new,"sin_permiso",ll_permiso)
			ll_tot_vend					= ll_prov_comercial + ll_paisajismo + ll_inversion + ll_permiso
			dw_resv_tecnica.setitem(ll_new,"total_vendible",ll_tot_vend)
			ll_tot_resv_sepul				= ll_tot_no_vend + ll_tot_vend
			dw_resv_tecnica.setitem(ll_new,"total_rev_tecnicas",ll_tot_resv_sepul)
			
//			ll_disp 							= ll_stock - (ll_asig + ll_reserv + ll_res_tec)
//			dw_resv_tecnica.setitem(ll_new,"sep_disponibles",ll_disp)
			if rb_detalle.checked = true then
				ls_estado = 'V'
				dw_resv_tecnica.object.sector_t.text	= 'Sector'
			elseif rb_resumen.checked = true then
				ls_estado = 'I'
				//dw_resv_tecnica.object.sector_t.text	= 'Area'
			end if
			dw_resv_tecnica.setitem(ll_new,"estado",ls_estado)
			dw_resv_tecnica.accepttext()
		end if
		setnull(ll_cod_parque);setnull(ls_area);setnull(ll_normativas);&
		setnull(ll_operacional);setnull(ll_paisajismo);setnull(ll_prov_comercial);setnull(ll_inversion);setnull(ll_permiso)
	LOOP
end if
if rb_detalle.checked = true then
	if al_cod_parque <> 103 then
		close x1;
	else
		close x3;
	end if	
elseif rb_resumen.checked = true then
	if al_cod_parque <> 103 then
		close x2;
	else
		close x4;
	end if	
end if
SetPointer(Arrow!)

end subroutine

public subroutine wf_todos ();string		ls_area,ls_sector,ls_estado
long		ll_cod_parque,ll_stock,ll_asig,ll_reserv,ll_new,ll_disp,ll_res_tec,ll_operacional,ll_normativas,ll_prov_comercial,ll_paisajismo,ll_inversion,ll_permiso

//wf_todos()
dw_resv_tecnica.reset()
SetPointer(HourGlass!)
if rb_detalle.checked = true then
	DECLARE x1 CURSOR FOR
	SELECT DISTINCT "COD_PARQUE","AREA","SECTOR"
	FROM			"BASE_PLANI"
	WHERE		"BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto
	ORDER BY 	"BASE_PLANI"."COD_PARQUE" ASC,
					"BASE_PLANI"."AREA" ASC,
					"BASE_PLANI"."SECTOR" ASC
	USING		sqlca;
elseif rb_resumen.checked = true then
	DECLARE x2 CURSOR FOR
	SELECT DISTINCT "COD_PARQUE","AREA"
	FROM			"BASE_PLANI"
	WHERE		"BASE_PLANI"."CODIGO_PRODUCTO" = :gs_producto
	ORDER BY 	"BASE_PLANI"."COD_PARQUE" ASC,
					"BASE_PLANI"."AREA" ASC
	USING		sqlca;
end if
if rb_detalle.checked = true then
	open x1;
elseif rb_resumen.checked = true then
	open x2;
end if
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
		if rb_detalle.checked = true then
			fetch x1 INTO	:ll_cod_parque,:ls_area,:ls_sector;
		elseif rb_resumen.checked = true then
			fetch x2 INTO	:ll_cod_parque,:ls_area;
		end if
		if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_area) and ls_area<>'' then
			if rb_detalle.checked = true then
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_operacional
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '6' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_operacional
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '6' ) AND
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_operacional) and ll_operacional>0 then
						ll_operacional							= ll_operacional
					else
						ll_operacional							= 0 
					end if
				else
					ll_operacional								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."BASE")
					INTO		:ll_normativas
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '2' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )  
					USING		sqlca;

				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_normativas
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '2' ) AND 
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_normativas) and ll_normativas>0 then
						ll_normativas							= ll_normativas
					else
						ll_normativas							= 0 
					end if
				else
					ll_normativas								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_prov_comercial
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '5' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_prov_comercial
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '5' ) AND
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_prov_comercial) and ll_prov_comercial>0 then
						ll_prov_comercial							= ll_prov_comercial
					else
						ll_prov_comercial							= 0 
					end if
				else
					ll_prov_comercial								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_paisajismo
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '3' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_paisajismo
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '3' ) AND
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_paisajismo) and ll_paisajismo>0 then
						ll_paisajismo								= ll_paisajismo
					else
						ll_paisajismo								= 0 
					end if
				else
					ll_paisajismo									= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_inversion
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '1' ) AND
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_inversion
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '1' ) AND
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_inversion) and ll_inversion>0 then
						ll_inversion								= ll_inversion
					else
						ll_inversion								= 0 
					end if
				else
					ll_inversion									= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_permiso
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '4' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_permiso
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '4' ) AND
								("RESERVA_SEPULTURA"."SECTOR" = :ls_sector ) and
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_permiso) and ll_permiso>0 then
						ll_permiso								= ll_permiso
					else
						ll_permiso								= 0 
					end if
				else
					ll_permiso									= 0
				end if
//				SELECT	COUNT("INVENTARIO_PLANI"."NUMERO")
//				INTO		:ll_stock
//				FROM		"BASE_PLANI","INVENTARIO_PLANI"  
//				WHERE 	"BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" and  
//							"BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" and  
//							"INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque AND
//							"BASE_PLANI"."AREA" = :ls_area AND	
//							"INVENTARIO_PLANI"."SECTOR" = :ls_sector
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					if not isnull(ll_stock) and ll_stock>0 then
//						ll_stock							= ll_stock
//					else
//						ll_stock							= 0 
//					end if
//				else
//					ll_stock								= 0
//				end if
//				SELECT	COUNT("INVENTARIO_PLANI"."NUMERO")
//				INTO		:ll_asig
//				FROM		"BASE_PLANI","INVENTARIO_PLANI"  
//				WHERE 	"BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" and  
//							"BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" and  
//							"INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque AND
//							"BASE_PLANI"."AREA" = :ls_area AND	
//							"INVENTARIO_PLANI"."SECTOR" = :ls_sector AND
//							"INVENTARIO_PLANI"."NUMERO" > 0
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					if not isnull(ll_asig) and ll_asig>0 then
//						ll_asig							= ll_asig
//					else
//						ll_asig							= 0 
//					end if
//				else
//					ll_asig								= 0
//				end if
//				SELECT	count("RESERVA_SEPULTURA"."SECTOR")
//				INTO		:ll_reserv	
//				FROM 		"RESERVA_SEPULTURA"  
//				WHERE 	"RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque AND
//							"RESERVA_SEPULTURA"."AREA" = :ls_area AND
//							"RESERVA_SEPULTURA"."SECTOR" = :ls_sector AND  
//							"RESERVA_SEPULTURA"."ESTADO" = 1
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					if not isnull(ll_reserv) and ll_reserv>0 then
//						ll_reserv							= ll_reserv
//					else
//						ll_reserv							= 0 
//					end if
//				else
//					ll_reserv								= 0
//				end if
//				SELECT	count("RESERVA_SEPULTURA"."SECTOR")
//				INTO		:ll_res_tec
//				FROM 		"RESERVA_SEPULTURA"  
//				WHERE 	"RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque AND
//							"RESERVA_SEPULTURA"."AREA" = :ls_area AND
//							"RESERVA_SEPULTURA"."SECTOR" = :ls_sector AND  
//							"RESERVA_SEPULTURA"."ESTADO" = 4
//				USING		Trans_1;
//				if Trans_1.sqlcode=0 then
//					if not isnull(ll_res_tec) and ll_res_tec>0 then
//						ll_res_tec								= ll_res_tec
//					else
//						ll_res_tec								= 0 
//					end if
//				else
//					ll_res_tec									= 0
//				end if
			elseif rb_resumen.checked = true then
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_operacional
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '6' ) AND 
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_operacional
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '6' ) AND 
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_operacional) and ll_operacional>0 then
						ll_operacional							= ll_operacional
					else
						ll_operacional							= 0 
					end if
				else
					ll_operacional								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_normativas
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '2' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_normativas
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '2' ) AND  
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_normativas) and ll_normativas>0 then
						ll_normativas							= ll_normativas
					else
						ll_normativas							= 0 
					end if
				else
					ll_normativas								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_prov_comercial
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '5' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_prov_comercial
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '5' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING	sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_prov_comercial) and ll_prov_comercial>0 then
						ll_prov_comercial							= ll_prov_comercial
					else
						ll_prov_comercial							= 0 
					end if
				else
					ll_prov_comercial								= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_paisajismo
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '3' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_paisajismo
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '3' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_paisajismo) and ll_paisajismo>0 then
						ll_paisajismo								= ll_paisajismo
					else
						ll_paisajismo								= 0 
					end if
				else
					ll_paisajismo									= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_inversion
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '1' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_inversion
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '1' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_inversion) and ll_inversion>0 then
						ll_inversion								= ll_inversion
					else
						ll_inversion								= 0 
					end if
				else
					ll_inversion									= 0
				end if
				if gs_producto = 'SE' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_permiso
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '4' ) AND  
								( "RESERVA_SEPULTURA"."BASE" <> 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				elseif gs_producto = 'CO' then
					SELECT 	count("RESERVA_SEPULTURA"."TIPO_RESERVA")
					INTO		:ll_permiso
					FROM 	"RESERVA_SEPULTURA"  
					WHERE 	( "RESERVA_SEPULTURA"."AREA" = :ls_area ) AND  
								( "RESERVA_SEPULTURA"."TIPO_RESERVA" = '4' ) AND  
								( "RESERVA_SEPULTURA"."BASE" = 'U' ) AND
								( "RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque )   
					USING		sqlca;
				end if
				if sqlca.sqlcode=0 then
					if not isnull(ll_permiso) and ll_permiso>0 then
						ll_permiso								= ll_permiso
					else
						ll_permiso								= 0 
					end if
				else
					ll_permiso									= 0
				end if
				
//				SELECT	COUNT("INVENTARIO_PLANI"."NUMERO")
//				INTO		:ll_stock
//				FROM		"BASE_PLANI","INVENTARIO_PLANI"  
//				WHERE 	"BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" and  
//							"BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" and  
//							"INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque AND
//							"BASE_PLANI"."AREA" = :ls_area
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					if not isnull(ll_stock) and ll_stock>0 then
//						ll_stock							= ll_stock
//					else
//						ll_stock							= 0 
//					end if
//				else
//					ll_stock								= 0
//				end if
//				SELECT	COUNT("INVENTARIO_PLANI"."NUMERO")
//				INTO		:ll_asig
//				FROM		"BASE_PLANI","INVENTARIO_PLANI"  
//				WHERE 	"BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" and  
//							"BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" and  
//							"INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque AND
//							"BASE_PLANI"."AREA" = :ls_area AND	
//							"INVENTARIO_PLANI"."NUMERO" > 0
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					if not isnull(ll_asig) and ll_asig>0 then
//						ll_asig							= ll_asig
//					else
//						ll_asig							= 0 
//					end if
//				else
//					ll_asig								= 0
//				end if
//				SELECT	count("RESERVA_SEPULTURA"."SECTOR")
//				INTO		:ll_reserv	
//				FROM 		"RESERVA_SEPULTURA"  
//				WHERE 	"RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque AND
//							"RESERVA_SEPULTURA"."AREA" = :ls_area AND
//							("RESERVA_SEPULTURA"."ESTADO" = 1 )
//				USING		sqlca;
//				if sqlca.sqlcode=0 then
//					if not isnull(ll_reserv) and ll_reserv>0 then
//						ll_reserv							= ll_reserv
//					else
//						ll_reserv							= 0 
//					end if
//				else
//					ll_reserv								= 0
//				end if
//				SELECT	count("RESERVA_SEPULTURA"."SECTOR")
//				INTO		:ll_res_tec	
//				FROM 		"RESERVA_SEPULTURA"  
//				WHERE 	"RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque AND
//							"RESERVA_SEPULTURA"."AREA" = :ls_area AND
//							"RESERVA_SEPULTURA"."ESTADO" = 4
//				USING		Trans_1;
//				if Trans_1.sqlcode=0 then
//					if not isnull(ll_res_tec) and ll_res_tec>0 then
//						ll_res_tec								= ll_res_tec
//					else
//						ll_res_tec								= 0 
//					end if
//				else
//					ll_res_tec									= 0
//				end if
			end if
			ll_new							= dw_resv_tecnica.insertrow(0)
			dw_resv_tecnica.scrolltorow(ll_new)
			dw_resv_tecnica.setitem(ll_new,"cod_parque",ll_cod_parque)
			dw_resv_tecnica.setitem(ll_new,"area",ls_area)
			dw_resv_tecnica.setitem(ll_new,"sector",ls_sector)
			dw_resv_tecnica.setitem(ll_new,"operacional",ll_operacional)
			dw_resv_tecnica.setitem(ll_new,"normativas",ll_normativas)
			dw_resv_tecnica.setitem(ll_new,"no_habitables",(ll_normativas+ll_operacional))
			dw_resv_tecnica.setitem(ll_new,"prov_comercial",ll_prov_comercial)
			dw_resv_tecnica.setitem(ll_new,"paisajismo",ll_paisajismo)
			dw_resv_tecnica.setitem(ll_new,"con_inversion",ll_inversion)
			dw_resv_tecnica.setitem(ll_new,"sin_permiso",ll_permiso)
			dw_resv_tecnica.setitem(ll_new,"habitables",(ll_prov_comercial+ll_paisajismo+ll_inversion+ll_permiso))
//			dw_resv_tecnica.setitem(ll_new,"sector",ls_sector)
//			dw_resv_tecnica.setitem(ll_new,"stock",ll_stock)
//			dw_resv_tecnica.setitem(ll_new,"sep_asignadas",ll_asig)
//			dw_resv_tecnica.setitem(ll_new,"sep_reservadas",ll_reserv)
//			dw_resv_tecnica.setitem(ll_new,"reservas_tec",ll_res_tec)
//			ll_disp 							= ll_stock - (ll_asig + ll_reserv + ll_res_tec)
//			dw_resv_tecnica.setitem(ll_new,"sep_disponibles",ll_disp)
//			if rb_detalle.checked = true then
//				ls_estado = 'V'
//				dw_resv_tecnica.object.sector_t.text	= 'Sector'
//			else
			if rb_resumen.checked = true then
				ls_estado = 'I'
				dw_resv_tecnica.object.sector_t.text	= 'Area'
			end if
			dw_resv_tecnica.setitem(ll_new,"estado",ls_estado)
			dw_resv_tecnica.accepttext()
		end if
		setnull(ll_cod_parque);setnull(ls_area);setnull(ll_operacional);&
		setnull(ll_normativas);setnull(ll_prov_comercial);setnull(ll_paisajismo);setnull(ll_inversion);setnull(ll_permiso)
	LOOP
end if
if gs_producto = 'SE' then
	dw_resv_tecnica.object.t_1.text		= 'Informe Reservas Tecnicas SEPULTURAS'
elseif gs_producto = 'CO' then
	dw_resv_tecnica.object.t_1.text		= 'Informe Reservas Tecnicas COLUMBARIOS'
end if
if rb_detalle.checked = true then
	close x1;
elseif rb_resumen.checked = true then
	close x2;
end if
SetPointer(Arrow!)

end subroutine

on w_inf_reserva_tec.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.rb_resumen=create rb_resumen
this.rb_detalle=create rb_detalle
this.rb_todos=create rb_todos
this.dw_parque=create dw_parque
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_cerrar=create cb_cerrar
this.dw_resv_tecnica=create dw_resv_tecnica
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.rb_resumen,&
this.rb_detalle,&
this.rb_todos,&
this.dw_parque,&
this.cb_imprimir,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_cerrar,&
this.dw_resv_tecnica,&
this.gb_2,&
this.gb_1}
end on

on w_inf_reserva_tec.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.rb_resumen)
destroy(this.rb_detalle)
destroy(this.rb_todos)
destroy(this.dw_parque)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_cerrar)
destroy(this.dw_resv_tecnica)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;string	ls_descrip_parque,ls_parque,ls_area
Long	ll_new,ll_parque,ll_codigo,id_parque,ll_pos

connect using Trans_1;
SetPointer(HourGlass!)
gf_centrar(w_inf_reserva_tec)

ll_pos						= pos(w_plano_sector_parque.ddlb_parque.text,'-')
ls_descrip_parque		= trim(mid(w_plano_sector_parque.ddlb_parque.text,(ll_pos + 1)))
il_parque				= Long(substr(1,1,Message.StringParm))
if il_parque = 103 then
	if ls_descrip_parque = 'SANTIAGO 2' then
		is_area_stgo = 'P'
	elseif ls_descrip_parque = 'SANTIAGO' then
		is_area_stgo = 'A'
	end if		
 //  ls_area				= trim(substr(1,2,Message.StringParm))
end if
//rb_todos.checked		= false
dw_resv_tecnica.settransobject(sqlca)
dw_parque.dataobject	= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
ll_new					= dw_parque.insertrow(0)
dw_parque.setitem(ll_new,'parque',il_parque)
dw_parque.accepttext()
if gs_depto = 'I' or gs_depto = 'G' or gs_depto = 'W' then
	dw_parque.enabled = true
else
	dw_parque.enabled = false
end if
postevent('ue_cargar')
SetPointer(Arrow!)
end event

event close;disconnect using Trans_1;
end event

type cb_2 from commandbutton within w_inf_reserva_tec
integer x = 923
integer y = 1828
integer width = 443
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Detalle Sepulturas"
end type

event clicked;string	ls_string,ls_parque
long	ll_parque

ll_parque					= dw_parque.getitemnumber(1,'parque')
if ll_parque > 0 then
	ls_parque		= string(ll_parque)
	ls_string			= ls_parque
	OpenWithParm(w_listado_inf_21_sepulturas,ls_string)
else
end if	
end event

type cb_1 from commandbutton within w_inf_reserva_tec
boolean visible = false
integer x = 4279
integer y = 280
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "respaldo"
end type

event clicked;//string	ls_area,ls_sector,ls_sector_sel,ls_area_sel,ls_area_aux,ls_sector_aux
//long		ll_cod_parque,ll_stock,ll_asig,ll_reserv,ll_cod_parque_sel,ll_new, ll_disp, ll_sum_tot_stock, &
//			ll_sum_total, ll_sum_tot_asig, ll_sum_tot_reser,ll_sum_tot_disp,ll_disp_tot,ll_cod_parque_aux,&
//			ll_tot_reg,ll_indi
//String	ls_filtro
//
//SetPointer(HourGlass!)
//dw_plani_disp_vta.reset()
//
//ll_sum_tot_stock	= 0
//ll_sum_tot_asig	= 0 
//ll_sum_tot_reser	= 0
//ll_sum_tot_disp	= 0
//
//DECLARE x1 CURSOR FOR
//SELECT DISTINCT "COD_PARQUE","AREA","SECTOR"
//FROM		"BASE_PLANI"
//ORDER BY "BASE_PLANI"."COD_PARQUE" ASC,
//			"BASE_PLANI"."AREA" ASC,
//			"BASE_PLANI"."SECTOR" ASC
//USING		sqlca;
//open x1;
//if sqlca.sqlcode=0 then
//	DO WHILE sqlca.sqlcode=0
//	fetch x1 INTO	:ll_cod_parque,:ls_area,:ls_sector;
//		if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_area) and ls_area<>'' and not isnull(ls_sector) and ls_sector<>'' then
//			SELECT	COUNT("INVENTARIO_PLANI"."NUMERO")
//			INTO		:ll_stock
//			FROM		"BASE_PLANI","INVENTARIO_PLANI"  
//			WHERE 	"BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" and  
//						"BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" and  
//						"INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque AND  
//						"INVENTARIO_PLANI"."SECTOR" = :ls_sector
//			USING		Trans_1;
//			if Trans_1.sqlcode=0 then
//				if not isnull(ll_stock) and ll_stock>0 then
//					ll_stock							= ll_stock
//				else
//					ll_stock							= 0 
//				end if
//			else
//				ll_stock								= 0
//			end if
//			SELECT	COUNT("INVENTARIO_PLANI"."NUMERO")
//			INTO		:ll_asig
//			FROM		"BASE_PLANI","INVENTARIO_PLANI"  
//			WHERE 	"BASE_PLANI"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" and  
//						"BASE_PLANI"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" and  
//						"INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque AND  
//						"INVENTARIO_PLANI"."SECTOR" = :ls_sector AND
//						"INVENTARIO_PLANI"."NUMERO" > 0
//			USING		Trans_1;
//			if Trans_1.sqlcode=0 then
//				if not isnull(ll_asig) and ll_asig>0 then
//					ll_asig							= ll_asig
//				else
//					ll_asig							= 0 
//				end if
//			else
//				ll_asig								= 0
//			end if
//			SELECT	count("RESERVA_SEPULTURA"."SECTOR")
//			INTO		:ll_reserv	
//			FROM 		"RESERVA_SEPULTURA"  
//			WHERE 	"RESERVA_SEPULTURA"."COD_PARQUE" = :ll_cod_parque AND
//						"RESERVA_SEPULTURA"."SECTOR" = :ls_sector AND  
//						("RESERVA_SEPULTURA"."ESTADO" = 1 OR "RESERVA_SEPULTURA"."ESTADO" = 4)
//			USING		Trans_1;
//			if Trans_1.sqlcode=0 then
//				if not isnull(ll_reserv) and ll_reserv>0 then
//					ll_reserv							= ll_reserv
//				else
//					ll_reserv							= 0 
//				end if
//			else
//				ll_reserv								= 0
//			end if			
//			
//			
//			
//			SELECT	"INVENTARIO_PLANI"."COD_PARQUE",
//						"INVENTARIO_PLANI"."SECTOR",
//						(	SELECT	count("INVENTARIO_PLANI"."SECTOR")   
//							FROM		"INVENTARIO_PLANI" "INVENTARIO_PLANI_A" 
//							WHERE 	"INVENTARIO_PLANI_A"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" and
//										"INVENTARIO_PLANI_A"."SECTOR" = "INVENTARIO_PLANI"."SECTOR"),
//						count("INVENTARIO_PLANI"."COD_PARQUE"),
//						(	SELECT	count("RESERVA_SEPULTURA"."SECTOR")   
//							FROM 		"RESERVA_SEPULTURA"  
//							WHERE 	"RESERVA_SEPULTURA"."SECTOR" = "INVENTARIO_PLANI"."SECTOR" and  
//										"RESERVA_SEPULTURA"."COD_PARQUE" = "INVENTARIO_PLANI"."COD_PARQUE" AND
//										("RESERVA_SEPULTURA"."ESTADO" = 1 OR "RESERVA_SEPULTURA"."ESTADO" = 4))
//			INTO		:ll_cod_parque_sel,:ls_sector_sel,:ll_stock,:ll_asig,:ll_reserv
//			FROM 		"INVENTARIO_PLANI"
//			WHERE		"INVENTARIO_PLANI"."COD_PARQUE" = :ll_cod_parque and
//						"INVENTARIO_PLANI"."SECTOR" = :ls_sector and
//						"INVENTARIO_PLANI"."NUMERO" > 0   
//			GROUP BY	"INVENTARIO_PLANI"."COD_PARQUE",
//						"INVENTARIO_PLANI"."SECTOR"
//			USING		Trans_1;
//			if Trans_1.sqlcode=0 then
//				if not isnull(ll_cod_parque_sel) and ll_cod_parque_sel>0 and not isnull(ls_sector_sel) and ls_sector_sel<>'' then
//					if rb_detalle.checked = true then
//						ll_new						= dw_plani_disp_vta.insertrow(0)
//						dw_plani_disp_vta.scrolltorow(ll_new)
//						dw_plani_disp_vta.setitem(ll_new,"cod_parque",ll_cod_parque)
//						dw_plani_disp_vta.setitem(ll_new,"area",ls_area)
//						dw_plani_disp_vta.setitem(ll_new,"sector",ls_sector)
//						dw_plani_disp_vta.setitem(ll_new,"stock",ll_stock)
//						dw_plani_disp_vta.setitem(ll_new,"sep_asignadas",ll_asig)
//						dw_plani_disp_vta.setitem(ll_new,"sep_reservadas",ll_reserv)
//						ll_disp = ll_stock - (ll_asig + ll_reserv)
//						dw_plani_disp_vta.setitem(ll_new,"sep_disponibles",ll_disp)
//			  		elseif rb_resumen.checked = true then
//						if ll_tot_reg > 0 then 
//							ll_cod_parque_aux 					= dw_plani_disp_vta.getitemnumber(1,'cod_parque')
//							ls_area_aux								= dw_plani_disp_vta.getitemstring(1,'area')
//							ls_sector_aux							= dw_plani_disp_vta.getitemstring(1,'sector')
//							for ll_indi=1 to ll_tot_reg
//								ll_cod_parque	= dw_plani_disp_vta.getitemnumber(ll_indi,'cod_parque')
//								ls_area			= dw_plani_disp_vta.getitemstring(ll_indi,'area')
//								ls_sector		= dw_plani_disp_vta.getitemstring(ll_indi,'sector')
//								if ll_cod_parque = ll_cod_parque_aux and ls_area = ls_area_aux and ls_sector = ls_sector_aux then
//									ll_sum_tot_stock							=	ll_sum_tot_stock + ll_stock
//									ll_sum_tot_asig							=	ll_sum_tot_asig + ll_asig
//									ll_sum_tot_reser							=	ll_sum_tot_reser + ll_reserv
//									ll_sum_tot_disp							=	ll_sum_tot_disp + ll_disp
//								else
//									ll_new								= dw_plani_disp_vta.insertrow(0)
//									dw_plani_disp_vta.scrolltorow(ll_new)
//									dw_plani_disp_vta.setitem(ll_new,"cod_parque",ll_cod_parque_aux)
//									dw_plani_disp_vta.setitem(ll_new,"area",ls_area_aux)
//									dw_plani_disp_vta.setitem(ll_new,"sector",ls_sector_aux)
//									dw_plani_disp_vta.setitem(ll_new,"stock",ll_sum_tot_stock)
//									dw_plani_disp_vta.setitem(ll_new,"sep_asignadas",ll_sum_tot_asig)
//									dw_plani_disp_vta.setitem(ll_new,"sep_reservadas",ll_sum_tot_reser)
//									ll_disp 									= ll_stock - (ll_asig + ll_reserv)
//									dw_plani_disp_vta.setitem(ll_new,"sep_disponibles",ll_sum_tot_disp)
//									dw_plani_disp_vta.accepttext()
//									ll_cod_parque_aux 					= ll_cod_parque
//									ls_area_aux								= ls_area
//									ls_sector_aux							= ls_sector
//									ll_sum_tot_stock						= ll_stock
//									ll_sum_tot_asig						= ll_asig
//									ll_sum_tot_reser						= ll_reserv
//									ll_sum_tot_disp						= ll_disp
//									dw_plani_disp_vta.accepttext()
//								end if
//							next
//						end if
//					end if
//				end if
//			end if
//		end if
//	LOOP
//end if
//close x1;
//SetPointer(Arrow!)
//
end event

type rb_resumen from radiobutton within w_inf_reserva_tec
integer x = 1623
integer y = 1836
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen"
boolean checked = true
end type

event clicked;long	ll_cod_parque

dw_parque.accepttext()
ll_cod_parque					= dw_parque.getitemnumber(1,'parque')
//dw_resv_tecnica.Modify("DataWindow.Trailer.2.Height = 0")
if rb_todos.checked = true then
	wf_todos()
elseif rb_todos.checked = false then
	wf_por_parque(ll_cod_parque)
end if
dw_resv_tecnica.Modify("DataWindow.detail.Height = 4")
dw_resv_tecnica.accepttext()
dw_resv_tecnica.ScrollToRow(1)
end event

type rb_detalle from radiobutton within w_inf_reserva_tec
integer x = 2098
integer y = 1840
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle"
end type

event clicked;long	ll_cod_parque

dw_parque.accepttext()
ll_cod_parque					= dw_parque.getitemnumber(1,'parque')
dw_resv_tecnica.Modify("DataWindow.detail.Height = 80")
dw_resv_tecnica.Modify("DataWindow.Trailer.2.Height = 100")
dw_resv_tecnica.accepttext()
if rb_todos.checked = true then
	wf_todos()
elseif rb_todos.checked = false then
	wf_por_parque(ll_cod_parque)
end if
dw_resv_tecnica.ScrollToRow(1)
end event

type rb_todos from radiobutton within w_inf_reserva_tec
boolean visible = false
integer x = 1129
integer y = 72
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Todos"
boolean lefttext = true
end type

event clicked;dw_parque.reset()

dw_parque.dataobject						= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
//rb_todos.checked			= false
rb_resumen.triggerevent(clicked!)
dw_resv_tecnica.ScrollToRow(1)

end event

type dw_parque from datawindow within w_inf_reserva_tec
integer x = 46
integer y = 52
integer width = 773
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long 		ll_cod_parque
string 	ls_filtro, ls_columna

dw_resv_tecnica.reset()
dw_parque.accepttext()
ll_cod_parque					= dw_parque.getitemnumber(1,'parque')
if ll_cod_parque > 0 then
	if rb_resumen.checked=true then
		rb_todos.checked		= false
		rb_resumen.triggerevent(clicked!)
//	elseif rb_detalle.checked=true then
//		rb_todos.checked		= false
//		rb_detalle.triggerevent(clicked!)
	end if
end if
dw_resv_tecnica.ScrollToRow(1)
end event

type cb_imprimir from commandbutton within w_inf_reserva_tec
integer x = 658
integer y = 1824
integer width = 201
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_resv_tecnica.rowcount() > 0 then 
	f_Print( dw_resv_tecnica )
end if
end event

type cb_filtrar from commandbutton within w_inf_reserva_tec
integer x = 480
integer y = 1824
integer width = 178
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_resv_tecnica.setfilter(ls_texto)
dw_resv_tecnica.filter()
end event

type cb_ordenar from commandbutton within w_inf_reserva_tec
integer x = 270
integer y = 1824
integer width = 210
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string 	nulo
setnull (nulo)
dw_resv_tecnica.SETSORT(NULO)
dw_resv_tecnica.SORT()

end event

type cb_exportar from commandbutton within w_inf_reserva_tec
integer x = 50
integer y = 1824
integer width = 219
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_resv_tecnica.rowcount() > 0 then
	f_DWToExcel(  dw_resv_tecnica)
end if
end event

type cb_cerrar from commandbutton within w_inf_reserva_tec
integer x = 3442
integer y = 1816
integer width = 329
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_inf_reserva_tec)
end event

type dw_resv_tecnica from datawindow within w_inf_reserva_tec
integer x = 41
integer y = 172
integer width = 3730
integer height = 1588
string dataobject = "dwe_reserv_tecnitca_detalle"
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna
if row > 0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
//else
//	if ls_columna='t_detalle' then
//		if dw_resv_tecnica.object.t_detalle.text = 'Mostrar Detalle' then
//			dw_resv_tecnica.object.t_detalle.text = 'Mostrar Resumen'
//			dw_resv_tecnica.Modify ( "DataWindow.detail.height=68")
//		else
//			dw_resv_tecnica.object.t_detalle.text	= 'Mostrar Detalle'
//			dw_resv_tecnica.Modify ( "DataWindow.detail.height=4")
//		end if
//		dw_resv_tecnica.accepttext()
//	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
//	dw_plani_disp_vta.SelectRow(0, FALSE)
//	dw_plani_disp_vta.SelectRow(il_row, TRUE)
end if
end event

type gb_2 from groupbox within w_inf_reserva_tec
integer x = 32
integer y = 1780
integer width = 1362
integer height = 148
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

type gb_1 from groupbox within w_inf_reserva_tec
integer x = 1591
integer y = 1772
integer width = 873
integer height = 152
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar"
end type

