forward
global type w_estadistica_ventas_detalle from window
end type
type ddlb_opcion from dropdownlistbox within w_estadistica_ventas_detalle
end type
type rb_todos from radiobutton within w_estadistica_ventas_detalle
end type
type dw_codigos from datawindow within w_estadistica_ventas_detalle
end type
type cb_ordenar from commandbutton within w_estadistica_ventas_detalle
end type
type cb_filtrar from commandbutton within w_estadistica_ventas_detalle
end type
type cb_exportar from commandbutton within w_estadistica_ventas_detalle
end type
type cb_imprimir from commandbutton within w_estadistica_ventas_detalle
end type
type cb_cta_cte from commandbutton within w_estadistica_ventas_detalle
end type
type cb_cerrar from commandbutton within w_estadistica_ventas_detalle
end type
type dw_detalle from datawindow within w_estadistica_ventas_detalle
end type
type gb_3 from groupbox within w_estadistica_ventas_detalle
end type
end forward

global type w_estadistica_ventas_detalle from window
integer width = 3858
integer height = 2168
boolean titlebar = true
string title = "Detalle Producción por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
ddlb_opcion ddlb_opcion
rb_todos rb_todos
dw_codigos dw_codigos
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
cb_cerrar cb_cerrar
dw_detalle dw_detalle
gb_3 gb_3
end type
global w_estadistica_ventas_detalle w_estadistica_ventas_detalle

type variables
long il_row
end variables

on w_estadistica_ventas_detalle.create
this.ddlb_opcion=create ddlb_opcion
this.rb_todos=create rb_todos
this.dw_codigos=create dw_codigos
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.gb_3=create gb_3
this.Control[]={this.ddlb_opcion,&
this.rb_todos,&
this.dw_codigos,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.cb_cerrar,&
this.dw_detalle,&
this.gb_3}
end on

on w_estadistica_ventas_detalle.destroy
destroy(this.ddlb_opcion)
destroy(this.rb_todos)
destroy(this.dw_codigos)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
destroy(this.gb_3)
end on

event open;string	ls_cod_busca,ls_filtro,ls_forma,ls_descrip,ls_nombre,ls_a_pater,ls_a_mater
long		ll_grupo,ll_tot_reg,ll_indi,ll_meses,ll_anos,ll_cta_reg,ll_cod_parque
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_nac
date		ld_fecha

gf_centrar(w_estadistica_ventas_detalle)
dw_detalle.dataobject = 'dw_estadistica_ventas_detalle'
dw_detalle.settransobject(sqlca)
dw_codigos.dataobject = 'dwe_estadistica_codigos'
dw_codigos.settransobject(sqlca)
dw_codigos.insertrow(0)
ldt_fecha_ini										= datetime(date(substr(1,1,Message.StringParm)),time('00:00:00'))
ldt_fecha_fin										= datetime(date(substr(1,2,Message.StringParm)),time('00:00:00'))
ls_cod_busca										= substr(1,3,Message.StringParm)
ll_grupo												= long(substr(1,4,Message.StringParm))

ls_forma												= substr(1,5,Message.StringParm)
ll_cta_reg											= long(substr(1,6,Message.StringParm))
ll_cod_parque										= long(substr(1,7,Message.StringParm))

gi_parque											= ll_cod_parque
gd_fecha_inicio									= ldt_fecha_ini
gd_fecha_fin										= ldt_fecha_fin
gl_grupo												= ll_grupo


ll_tot_reg											= dw_detalle.retrieve(ldt_fecha_ini,ldt_fecha_fin,ll_cod_parque)
if ll_tot_reg>0 then
	dw_detalle.Object.usuario.text 			= gs_user
	dw_detalle.Object.titulo02.text 			= 'Período Evaluado desde '+string(ldt_fecha_ini,'dd/mm/yyyy')+' hasta '+string(ldt_fecha_fin,'dd/mm/yyyy')
	for ll_indi=1 to ll_tot_reg
		ldt_fecha_nac								= dw_detalle.getitemdatetime(ll_indi,'cliente_fecha_nac')
		ll_meses										= f_calculo_meses(ldt_fecha_nac,ldt_fecha_fin)
		if ll_meses>0 then
			ll_anos									= ll_meses	/ 12
		else
			ll_anos									= 0
		end if
		dw_detalle.setitem(ll_indi,"c_anos",ll_anos)
		dw_detalle.setitem(ll_indi,"c_grupo",ll_grupo)
		dw_detalle.setitem(ll_indi,"c_forma",ls_forma)
		dw_detalle.setitem(ll_indi,"c_cuenta",ll_cta_reg)
	next
	
	if ll_grupo = 1 then
		if ls_forma = '1' then
			dw_detalle.Object.titulo03.text	= 'Promedio por Ejecutivo'
			dw_detalle.Object.resumen01.text	= 'Promedio por Ejecutivo'
			ls_filtro 								= ''
			gs_filtro								= ls_filtro
		elseif ls_forma = '2' then
			dw_detalle.Object.titulo03.text	= 'Promedio por Precio Ventas'
			dw_detalle.Object.resumen01.text	= 'Promedio por Precio Ventas'
			ls_filtro 								= ''
			gs_filtro								= ls_filtro
		elseif ls_forma = '4' then
			dw_detalle.Object.titulo03.text	= 'Promedio por Precio Ventas Contado'
			dw_detalle.Object.resumen01.text	= 'Promedio por Precio Ventas Contado'
			ls_filtro 								= "oferta_v_forma_pago <> '2' "
			gs_filtro								= ls_filtro
		elseif ls_forma = '5' then
			dw_detalle.Object.titulo03.text	= 'Promedio Pie Pagado Contratos a Crédito'
			dw_detalle.Object.resumen01.text	= 'Promedio Pie Pagado Contratos a Crédito'
			ls_filtro 								= "oferta_v_forma_pago = '2' "
			gs_filtro								= ls_filtro
		elseif ls_forma = '6' then
			dw_detalle.Object.titulo03.text	= 'Promedio Plazo Contratos a Crédito y Contado'
			dw_detalle.Object.resumen01.text	= 'Promedio Plazo Contratos a Crédito y Contado'
			ls_filtro 								= ''
			gs_filtro								= ls_filtro
		elseif ls_forma = '7' then
			dw_detalle.Object.titulo03.text	= 'Promedio Valor Cuota Contratos a Crédito'
			dw_detalle.Object.resumen01.text	= 'Promedio Valor Cuota Contratos a Crédito'
			ls_filtro 								= "oferta_v_forma_pago = '2' "
			gs_filtro								= ls_filtro
		elseif ls_forma = '8' then
			dw_detalle.Object.titulo03.text	= 'Promedio Edad Cliente'
			dw_detalle.Object.resumen01.text	= 'Promedio Edad Cliente'
			ls_filtro 								= ''
			gs_filtro								= ls_filtro
		elseif ls_forma = '9' then
			dw_detalle.Object.titulo03.text	= 'Monto Renta Promedio'
			dw_detalle.Object.resumen01.text	= 'Monto Renta Promedio'
			ls_filtro 								= ''
			gs_filtro								= ls_filtro
		end if
		dw_detalle.SetFilter(ls_filtro)
		dw_detalle.Filter( )
	elseif ll_grupo = 2 then
		if ls_cod_busca='F' then 
			dw_detalle.Object.titulo03.text	= 'Porcentaje de Clientes Mujeres'
			dw_detalle.Object.resumen01.text	= 'Porcentaje de Clientes Mujeres'
		elseif ls_cod_busca='M' then 
			dw_detalle.Object.titulo03.text	= 'Porcentaje de Clientes Hombres'
			dw_detalle.Object.resumen01.text	= 'Porcentaje de Clientes Hombres'
		else
			dw_detalle.Object.titulo03.text	= 'Porcentaje de Clientes Empresa'
			dw_detalle.Object.resumen01.text	= 'Porcentaje de Clientes Empresa'
		end if
		ls_filtro 									= "cliente_sexo = '"+ls_cod_busca+"'"
		gs_filtro									= ls_filtro
	elseif ll_grupo = 3 then
		dw_detalle.Object.titulo03.text		= 'Porcentaje de Ventas por Área Comercial '+ls_cod_busca
		dw_detalle.Object.resumen01.text		= 'Porcentaje de Ventas por Área Comercial '+ls_cod_busca
		ls_filtro 									= "pago_oferta_area = '"+ls_cod_busca+"'"
		gs_filtro									= ls_filtro
	elseif ll_grupo = 4 then
		dw_detalle.Object.titulo03.text		= 'Porcentaje de Ventas por Uso Comercial '+ls_cod_busca
		dw_detalle.Object.resumen01.text		= 'Porcentaje de Ventas por Uso Comercial '+ls_cod_busca
		ls_filtro 									= "oferta_v_uso = '"+ls_cod_busca+"'"
		gs_filtro									= ls_filtro
	elseif ll_grupo = 5 then
		dw_detalle.Object.titulo03.text		= 'Porcentaje de Ventas por Capacidad '+ls_cod_busca
		dw_detalle.Object.resumen01.text		= 'Porcentaje de Ventas por Capacidad '+ls_cod_busca
		ls_filtro 									= "pago_oferta_capacidad = "+string(ls_cod_busca)
		gs_filtro									= ls_filtro
	elseif ll_grupo = 6 then
		SELECT	"DESCRIPCION" 
		INTO		:ls_descrip
		FROM		"TIPO_FORMA_PAGO"
		WHERE		"TIPO_FORMA_PAGO"."FORMA_PAGO" = :ls_cod_busca
		USING		sqlca;
		dw_detalle.Object.titulo03.text		= 'Porcentaje de Ventas por  '+ls_descrip
		dw_detalle.Object.resumen01.text		= 'Porcentaje de Ventas por  '+ls_descrip
		ls_filtro 									= "oferta_v_forma_pago = '"+ls_cod_busca+"'"
		gs_filtro									= ls_filtro
	elseif ll_grupo = 7 then
		SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO"  
		INTO		:ls_nombre,	:ls_a_pater,	:ls_a_mater
		FROM		"JEFE_VENTAS"
		WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_cod_busca
		USING		sqlca;
		dw_detalle.Object.titulo03.text		= 'Porcentaje de Ventas por Jefe de Unidad Código '+ls_cod_busca+' - '+ls_nombre+' '+ls_a_pater+' '+ls_a_mater
		dw_detalle.Object.resumen01.text		= 'Porcentaje de Ventas por Jefe de Unidad'
		ls_filtro 									= "oferta_v_cod_jef = '"+ls_cod_busca+"'"
		gs_filtro									= ls_filtro
	elseif ll_grupo = 8 then
		SELECT	"NOMBRE",	"A_PATERNO",	"A_MATERNO"  
		INTO		:ls_nombre,	:ls_a_pater,	:ls_a_mater
		FROM		"SUPERVISOR"
		WHERE 	"SUPERVISOR"."COD_SUP" = :ls_cod_busca
		USING		sqlca;
		dw_detalle.Object.titulo03.text		= 'Porcentaje de Ventas por Supervisor Código '+ls_cod_busca+' - '+ls_nombre+' '+ls_a_pater+' '+ls_a_mater
		dw_detalle.Object.resumen01.text		= 'Porcentaje de Ventas por Supervisor'
		ls_filtro 									= "oferta_v_cod_sup = '"+ls_cod_busca+"'"
		gs_filtro									= ls_filtro
	elseif ll_grupo = 9 then
		SELECT	"COMUNA"."COMUNA"  
    	INTO		:ls_descrip  
    	FROM		"COMUNA"  
   	WHERE		"COMUNA"."CODIGO_COMUNA" = :ls_cod_busca   
      USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_descrip) and ls_descrip<>'' then
				ls_descrip							= ls_descrip
			else
				ls_descrip							= ''
			end if
		else
			ls_descrip								= ''
		end if
		dw_detalle.Object.titulo03.text		= 'Porcentaje de Ventas por Comuna '+ls_descrip
		dw_detalle.Object.resumen01.text		= 'Porcentaje de Ventas por Comuna '+ls_descrip
		ls_filtro 									= "cliente_comuna = '"+ls_cod_busca+"'"
		gs_filtro									= ls_filtro
	elseif ll_grupo = 10 then
		SELECT	"DESCRIPCION"  
    	INTO 		:ls_descrip  
    	FROM		"CODIGO_ESTADO_CIVIL"  
   	WHERE 	"CODIGO_ESTADO_CIVIL"."CODIGO_ESTADO" = :ls_cod_busca
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ls_descrip) and ls_descrip<>'' then
				ls_descrip							= ls_descrip
			else
				ls_descrip							= ''
			end if
		else
			ls_descrip								= ''
		end if
		dw_detalle.Object.titulo03.text		= 'Porcentaje de Ventas Estado Civil '+ls_descrip
		dw_detalle.Object.resumen01.text		= 'Porcentaje de Ventas Estado Civil '+ls_descrip
		ls_filtro 									= "cliente_esta_civil = '"+ls_cod_busca+"'"
		gs_filtro									= ls_filtro
	end if
	dw_detalle.SetFilter(ls_filtro)
	dw_detalle.Filter( )
else
	messagebox("Advertencia","No registra dato")
	close(w_estadistica_ventas_detalle)
end if
end event

type ddlb_opcion from dropdownlistbox within w_estadistica_ventas_detalle
integer x = 1211
integer y = 32
integer width = 1129
integer height = 640
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string	ls_filtro,ls_busqueda,ls_cod_comuna,ls_filtro_2
long		ll_codigo,ll_pos,ll_tot_reg

dw_codigos.accepttext()
dw_detalle.accepttext()
ll_codigo																	= dw_codigos.getitemnumber(1,'codigo')
if gl_grupo=1 then
	ls_filtro_2																= "'"
else
	ls_filtro_2																=  " + ' and " + gs_filtro
end if
	
ls_busqueda                        									= ddlb_opcion.text
ll_pos                           									= POS (ls_busqueda,'-')
if ll_pos > 0 then ll_pos = ll_pos - 1
	ls_busqueda                      								= trim(mid(ls_busqueda,1,ll_pos))
if ll_codigo=2 then
	ls_filtro																= "cliente_sexo = '" +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_sexo.Color 									= RGB(255,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(255,0,0)
	
	dw_detalle.Object.t_area.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(0,0,0)
	dw_detalle.Object.t_uso.Color 									= RGB(0,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_cap.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(0,0,0)
	dw_detalle.Object.t_forma_pag.Color 							= RGB(0,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(0,0,0)
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(0,0,0)
	dw_detalle.Object.t_cod_sup.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(0,0,0)
	dw_detalle.Object.t_comuna.Color 								= RGB(0,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(0,0,0)
	dw_detalle.Object.t_estado_civil.Color 						= RGB(0,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(0,0,0)

elseif ll_codigo=3 then
	ls_filtro																= "pago_oferta_area = '" +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_area.Color 									= RGB(255,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(255,0,0)
	
	dw_detalle.Object.t_sexo.Color 									= RGB(0,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_uso.Color 									= RGB(0,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_cap.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(0,0,0)
	dw_detalle.Object.t_forma_pag.Color 							= RGB(0,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(0,0,0)
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(0,0,0)
	dw_detalle.Object.t_cod_sup.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(0,0,0)
	dw_detalle.Object.t_comuna.Color 								= RGB(0,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(0,0,0)
	dw_detalle.Object.t_estado_civil.Color 						= RGB(0,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(0,0,0)

elseif ll_codigo=4 then
	ls_filtro																= "oferta_v_uso = '" +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_uso.Color 									= RGB(255,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(255,0,0)
	
	dw_detalle.Object.t_sexo.Color 									= RGB(0,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_area.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(0,0,0)
	dw_detalle.Object.t_cap.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(0,0,0)
	dw_detalle.Object.t_forma_pag.Color 							= RGB(0,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(0,0,0)
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(0,0,0)
	dw_detalle.Object.t_cod_sup.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(0,0,0)
	dw_detalle.Object.t_comuna.Color 								= RGB(0,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(0,0,0)
	dw_detalle.Object.t_estado_civil.Color 						= RGB(0,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(0,0,0)

elseif ll_codigo=5 then
	if gl_grupo=1 then
		ls_filtro_2															= ''
	else
		ls_filtro_2															=  " + ' and " + gs_filtro
	end if
	ls_filtro																= "pago_oferta_capacidad = " +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_cap.Color 									= RGB(255,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(255,0,0)
	
	dw_detalle.Object.t_sexo.Color 									= RGB(0,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_area.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(0,0,0)
	dw_detalle.Object.t_uso.Color 									= RGB(0,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_forma_pag.Color 							= RGB(0,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(0,0,0)
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(0,0,0)
	dw_detalle.Object.t_cod_sup.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(0,0,0)
	dw_detalle.Object.t_comuna.Color 								= RGB(0,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(0,0,0)
	dw_detalle.Object.t_estado_civil.Color 						= RGB(0,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(0,0,0)

elseif ll_codigo=6 then
	ls_filtro																= "oferta_v_forma_pago = '" +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_forma_pag.Color 							= RGB(255,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(255,0,0)
	
	dw_detalle.Object.t_sexo.Color 									= RGB(0,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_area.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(0,0,0)
	dw_detalle.Object.t_uso.Color 									= RGB(0,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_cap.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(0,0,0)
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(0,0,0)
	dw_detalle.Object.t_cod_sup.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(0,0,0)
	dw_detalle.Object.t_comuna.Color 								= RGB(0,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(0,0,0)
	dw_detalle.Object.t_estado_civil.Color 						= RGB(0,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(0,0,0)

elseif ll_codigo=7 then
	ls_filtro																= "oferta_v_cod_jef = '" +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(255,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(255,0,0)
	
	dw_detalle.Object.t_sexo.Color 									= RGB(0,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_area.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(0,0,0)
	dw_detalle.Object.t_uso.Color 									= RGB(0,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_cap.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(0,0,0)
	dw_detalle.Object.t_forma_pag.Color 							= RGB(0,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(0,0,0)
	dw_detalle.Object.t_cod_sup.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(0,0,0)
	dw_detalle.Object.t_comuna.Color 								= RGB(0,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(0,0,0)
	dw_detalle.Object.t_estado_civil.Color 						= RGB(0,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(0,0,0)

elseif ll_codigo=8 then
	ls_filtro																= "oferta_v_cod_sup = '" +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_cod_sup.Color 								= RGB(255,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(255,0,0)
	
	dw_detalle.Object.t_sexo.Color 									= RGB(0,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_area.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(0,0,0)
	dw_detalle.Object.t_uso.Color 									= RGB(0,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_cap.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(0,0,0)
	dw_detalle.Object.t_forma_pag.Color 							= RGB(0,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(0,0,0)
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(0,0,0)
	dw_detalle.Object.t_comuna.Color 								= RGB(0,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(0,0,0)
	dw_detalle.Object.t_estado_civil.Color 						= RGB(0,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(0,0,0)

elseif ll_codigo=9 then
	ls_busqueda                      								= trim(ddlb_opcion.text)
	SELECT	"COMUNA"."CODIGO_COMUNA"
	INTO 		:ls_cod_comuna
   FROM		"COMUNA"  
   WHERE		"COMUNA"."COMUNA" = :ls_busqueda
   USING	sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ls_cod_comuna) and ls_cod_comuna<>'' then
			ls_busqueda														= ls_cod_comuna
		else
			ls_busqueda														= ''
		end if
	else
		ls_busqueda															= ''
	end if			
	ls_filtro																= "cliente_comuna = '" +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_comuna.Color 								= RGB(255,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(255,0,0)
	
	dw_detalle.Object.t_sexo.Color 									= RGB(0,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_area.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(0,0,0)
	dw_detalle.Object.t_uso.Color 									= RGB(0,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_cap.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(0,0,0)
	dw_detalle.Object.t_forma_pag.Color 							= RGB(0,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(0,0,0)
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(0,0,0)
	dw_detalle.Object.t_cod_sup.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(0,0,0)
	dw_detalle.Object.t_estado_civil.Color 						= RGB(0,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(0,0,0)

elseif ll_codigo=10 then
	ls_filtro																= "cliente_esta_civil = '" +ls_busqueda+ls_filtro_2
	dw_detalle.Object.t_estado_civil.Color 						= RGB(255,0,0)
	dw_detalle.Object.codigo_estado_civil_descripcion.Color	= RGB(255,0,0)
	
	dw_detalle.Object.t_sexo.Color 									= RGB(0,0,0)
	dw_detalle.Object.cliente_sexo.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_area.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_area.Color 						= RGB(0,0,0)
	dw_detalle.Object.t_uso.Color 									= RGB(0,0,0)
	dw_detalle.Object.oferta_v_uso.Color 							= RGB(0,0,0)
	dw_detalle.Object.t_cap.Color 									= RGB(0,0,0)
	dw_detalle.Object.pago_oferta_capacidad.Color				= RGB(0,0,0)
	dw_detalle.Object.t_forma_pag.Color 							= RGB(0,0,0)
	dw_detalle.Object.oferta_v_forma_pago.Color					= RGB(0,0,0)
	dw_detalle.Object.t_cod_jefe.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_jef.Color						= RGB(0,0,0)
	dw_detalle.Object.t_cod_sup.Color 								= RGB(0,0,0)
	dw_detalle.Object.oferta_v_cod_sup.Color						= RGB(0,0,0)
	dw_detalle.Object.t_comuna.Color 								= RGB(0,0,0)
	dw_detalle.Object.comuna_comuna.Color							= RGB(0,0,0)
end if
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )
ll_tot_reg																	= dw_detalle.RowCount()
if ll_tot_reg=0 then
	messagebox("Advertencia","No Registra Datos")
end if


end event

type rb_todos from radiobutton within w_estadistica_ventas_detalle
integer x = 2391
integer y = 40
integer width = 293
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;string	ls_filtro,ls_string,ls_descrip

ddlb_opcion.reset()
dw_codigos.dataobject = 'dwe_estadistica_codigos'
dw_codigos.settransobject(sqlca)
dw_codigos.insertrow(0)
ls_filtro 									= gs_filtro
dw_detalle.SetFilter(ls_filtro)
dw_detalle.Filter( )	

end event

type dw_codigos from datawindow within w_estadistica_ventas_detalle
integer x = 46
integer y = 28
integer width = 1147
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dwe_estadistica_codigos"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_filtro,ls_sexo,ls_descrip,ls_string,ls_area,ls_uso,ls_forma_pag,ls_cod_jef,ls_nombre,ls_a_pater,ls_mater,&
			ls_cod_sup,ls_cod_comuna,ls_comuna,ls_cod_est_civil,ls_descrip_civil
long		ll_codigo,ll_capac

ddlb_opcion.reset()
dw_codigos.accepttext()
ll_codigo						= dw_codigos.getitemnumber(1,'codigo')
if ll_codigo=2 then
	DECLARE	x1 CURSOR FOR  
	SELECT 	distinct "CLIENTE"."SEXO"  
	FROM 		"CLIENTE"  
	WHERE 	"CLIENTE"."SEXO" is not null
	ORDER BY "CLIENTE"."SEXO"  ASC 
	USING    sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 into :ls_sexo;
			if not isnull(ls_sexo) and ls_sexo <> '' then
				if ls_sexo= 'F' then
					ls_descrip			= 'FEMENINO'
				elseif ls_sexo= 'M' then
					ls_descrip			= 'MASCULINO'
				end if
				ls_string          	= ls_sexo+'-'+ls_descrip
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ls_sexo);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x1;
elseif ll_codigo=3 then
	DECLARE	x2 CURSOR FOR
	SELECT DISTINCT	"PAGO_OFERTA"."AREA" 
	FROM 		"OFERTA_V","PAGO_OFERTA","CADENA"  
	WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
				( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
				( "CADENA"."CODIGO" = 'O' ) AND  
				( "CADENA"."COD_PARQUE" = :gi_parque ) AND
				( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and   
				( "OFERTA_V"."CIERRE_VENTA" >= :gd_fecha_inicio ) and  
				( "OFERTA_V"."CIERRE_VENTA" <= :gd_fecha_fin )
	ORDER BY	"PAGO_OFERTA"."AREA"  ASC
	USING		sqlca;
	open x2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x2 INTO	:ls_area;
			if not isnull(ls_area) and ls_area<>'' then
				ls_descrip				= 'AREA'
				ls_string           	= ls_area+'-'+ls_descrip
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ls_area);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x2;
elseif ll_codigo=4 then
	DECLARE	x3 CURSOR FOR
	SELECT DISTINCT	"LISTA_PRECIO"."CANAL"  
	FROM		"LISTA_PRECIO"
	ORDER BY	"LISTA_PRECIO"."CANAL" ASC
	USING		sqlca;
	open x3;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x3 INTO	:ls_uso;
			if not isnull(ls_uso) and ls_uso<>'' then
				ls_descrip				= 'USO SEPULTURA'
				ls_string           	= ls_uso+'-'+ls_descrip
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ls_uso);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x3;
elseif ll_codigo=5 then
	DECLARE	x4 CURSOR FOR
	SELECT DISTINCT "INVENTARIO_PLANI"."CAPACIDAD"  
	FROM		"INVENTARIO_PLANI"
	WHERE		"INVENTARIO_PLANI"."CAPACIDAD" <> 999 
	ORDER BY	"INVENTARIO_PLANI"."CAPACIDAD" ASC
	USING		sqlca;
	open x4;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x4 INTO	:ll_capac;
			if not isnull(ll_capac) and ll_capac >0 then
				if ll_capac<=1 then
					ls_descrip								= 'CAPACIDAD'
				else
					ls_descrip								= 'CAPACIDADES'
				end if
				ls_string           						= string(ll_capac)+'-'+ls_descrip
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ll_capac);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x4;
elseif ll_codigo=6 then
	DECLARE	x5 CURSOR FOR
	SELECT	"FORMA_PAGO",	"SIGLA"  
	FROM		"TIPO_FORMA_PAGO"
	ORDER BY	"TIPO_FORMA_PAGO"."FORMA_PAGO" ASC
	USING		sqlca;
	open x5;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x5 INTO	:ls_forma_pag,:ls_descrip;
			if not isnull(ls_forma_pag) and ls_forma_pag <>'' and not isnull(ls_descrip) and ls_descrip<>'' then
				ls_string           					= ls_forma_pag+'-'+ls_descrip
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ls_forma_pag);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x5;
elseif ll_codigo=7 then
	DECLARE	x6 CURSOR FOR
	SELECT DISTINCT	"JEFE_VENTAS"."JEFE_VENTAS","JEFE_VENTAS"."NOMBRE","JEFE_VENTAS"."A_PATERNO","JEFE_VENTAS"."A_MATERNO"  
	FROM		"JEFE_VENTAS","OFERTA_V","CADENA"  
	WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
				( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
				( "CADENA"."CODIGO" = 'O' ) AND  
				( "CADENA"."COD_PARQUE" = :gi_parque ) AND
				( "OFERTA_V"."COD_JEF" = "JEFE_VENTAS"."JEFE_VENTAS" ) AND
				( "OFERTA_V"."CIERRE_VENTA" >= :gd_fecha_inicio ) AND  
				( "OFERTA_V"."CIERRE_VENTA" <= :gd_fecha_fin )
	ORDER BY	"JEFE_VENTAS"."JEFE_VENTAS" ASC
	USING		sqlca;
	open x6;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x6 INTO	:ls_cod_jef,:ls_nombre,:ls_a_pater,:ls_mater;
			if not isnull(ls_cod_jef) and ls_cod_jef <>'' and not isnull(ls_nombre) and ls_nombre<>'' then
				ls_descrip								= ls_nombre+' '+ls_a_pater+' '+ls_mater
				ls_string           					= ls_cod_jef+'-'+ls_descrip
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ls_cod_jef);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x6;
elseif ll_codigo=8 then
	DECLARE	x7 CURSOR FOR
	SELECT DISTINCT	"SUPERVISOR"."COD_SUP","SUPERVISOR"."NOMBRE","SUPERVISOR"."A_PATERNO","SUPERVISOR"."A_MATERNO"  
	FROM		"SUPERVISOR","OFERTA_V","CADENA"  
	WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
				( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
				( "CADENA"."CODIGO" = 'O' ) AND  
				( "CADENA"."COD_PARQUE" = :gi_parque ) AND
				( "OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) AND
				( "OFERTA_V"."CIERRE_VENTA" >= :gd_fecha_inicio ) AND  
				( "OFERTA_V"."CIERRE_VENTA" <= :gd_fecha_fin )
	ORDER BY	"SUPERVISOR"."COD_SUP" ASC
	USING		sqlca;
	open x7;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x7 INTO	:ls_cod_sup,:ls_nombre,:ls_a_pater,:ls_mater;
			if not isnull(ls_cod_sup) and ls_cod_sup <>'' and not isnull(ls_nombre) and ls_nombre<>'' then
				ls_descrip								= ls_nombre+' '+ls_a_pater+' '+ls_mater
				ls_string           					= ls_cod_sup+'-'+ls_descrip
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ls_cod_sup);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x7;
elseif ll_codigo=9 then
	DECLARE	x8 CURSOR FOR
	SELECT DISTINCT	"COMUNA"."CODIGO_COMUNA","COMUNA"."COMUNA"  
	FROM 		"OFERTA_V","PAGO_OFERTA","CADENA","CLIENTE","COMUNA"  
	WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
				( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
				( "CADENA"."CODIGO" = 'O' ) AND  
				( "CADENA"."COD_PARQUE" = :gi_parque ) AND
				( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and   
				( "CADENA"."RUT" = "CLIENTE"."RUT" ) AND
				( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) AND
				( "OFERTA_V"."CIERRE_VENTA" >= :gd_fecha_inicio ) and  
				( "OFERTA_V"."CIERRE_VENTA" <= :gd_fecha_fin )
	ORDER BY	"COMUNA"."COMUNA" ASC
	USING		sqlca;
	open x8;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x8 INTO	:ls_cod_comuna,:ls_comuna;
			if not isnull(ls_cod_comuna) and ls_cod_comuna <>'' and not isnull(ls_comuna) and ls_comuna<>'' then
				ls_descrip								= ls_comuna
				ls_string           					= ls_comuna
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ls_cod_comuna);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x8;
elseif ll_codigo=10 then
	DECLARE	x9 CURSOR FOR
	SELECT	"CODIGO_ESTADO",	"DESCRIPCION"  
	FROM 		"CODIGO_ESTADO_CIVIL"
	ORDER BY	"CODIGO_ESTADO" ASC
	USING		sqlca;
	open x9;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x9 INTO	:ls_cod_est_civil,:ls_descrip_civil;
			if not isnull(ls_cod_est_civil) and ls_cod_est_civil<>'' and not isnull(ls_descrip_civil) and ls_descrip_civil<>'' then
				ls_descrip								= Upper(ls_descrip_civil)
				ls_string           					= ls_cod_est_civil+'-'+ls_descrip
				ddlb_opcion.AddItem(ls_string)
			end if
			Setnull(ls_cod_est_civil);Setnull(ls_descrip);Setnull(ls_string)
		LOOP
	end if
	close x9;			
end if

end event

event clicked;rb_todos.checked		= false
end event

type cb_ordenar from commandbutton within w_estadistica_ventas_detalle
integer x = 1979
integer y = 1912
integer width = 238
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_filtrar from commandbutton within w_estadistica_ventas_detalle
integer x = 1737
integer y = 1912
integer width = 238
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

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()
end event

type cb_exportar from commandbutton within w_estadistica_ventas_detalle
integer x = 1495
integer y = 1912
integer width = 238
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_estadistica_ventas_detalle
integer x = 2281
integer y = 1912
integer width = 238
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then 
	f_Print( dw_detalle )
end if
end event

type cb_cta_cte from commandbutton within w_estadistica_ventas_detalle
integer x = 41
integer y = 1888
integer width = 439
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta Corrie&nte"
end type

event clicked;string	ls_base,ls_serie
long		ll_cd_estado_promesa,ll_rut
double	ldb_numero

dw_detalle.accepttext()
if dw_detalle.rowcount() > 0 then
	ls_base				= dw_detalle.getitemstring(il_row,'cadena_codigo')
	ls_serie				= dw_detalle.getitemstring(il_row,'oferta_v_serie')
	ldb_numero			= dw_detalle.getitemnumber(il_row,'oferta_v_nro_oferta')
	ll_rut				= dw_detalle.getitemnumber(il_row,'oferta_v_rut')
	if il_row>0 then
		gi_numero 		= ldb_numero
		gs_base			= ls_base
		gs_serie			= ls_serie
		gi_rut	 		= ll_rut
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	end if
end if
end event

type cb_cerrar from commandbutton within w_estadistica_ventas_detalle
integer x = 3474
integer y = 1888
integer width = 329
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estadistica_ventas_detalle)
end event

type dw_detalle from datawindow within w_estadistica_ventas_detalle
integer x = 41
integer y = 136
integer width = 3762
integer height = 1720
integer taborder = 10
string title = "none"
string dataobject = "dw_estadistica_ventas_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_3 from groupbox within w_estadistica_ventas_detalle
integer x = 1472
integer y = 1864
integer width = 1070
integer height = 156
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

