forward
global type w_lista_codigos from window
end type
type cb_2 from commandbutton within w_lista_codigos
end type
type cb_buscar from commandbutton within w_lista_codigos
end type
type em_cod_supervisor from editmask within w_lista_codigos
end type
type st_cod_supervisor from statictext within w_lista_codigos
end type
type em_ape_paterno from editmask within w_lista_codigos
end type
type st_apellido from statictext within w_lista_codigos
end type
type em_nombre from editmask within w_lista_codigos
end type
type st_nombre from statictext within w_lista_codigos
end type
type em_estado from editmask within w_lista_codigos
end type
type st_estado from statictext within w_lista_codigos
end type
type em_rut from editmask within w_lista_codigos
end type
type st_rut from statictext within w_lista_codigos
end type
type em_codigo from editmask within w_lista_codigos
end type
type st_1 from statictext within w_lista_codigos
end type
type cb_aceptar from commandbutton within w_lista_codigos
end type
type cb_1 from commandbutton within w_lista_codigos
end type
type dw_lista from datawindow within w_lista_codigos
end type
type cb_exportar from commandbutton within w_lista_codigos
end type
type cb_filtrar from commandbutton within w_lista_codigos
end type
type cb_salir from commandbutton within w_lista_codigos
end type
type gb_1 from groupbox within w_lista_codigos
end type
end forward

global type w_lista_codigos from window
integer x = 110
integer y = 172
integer width = 3314
integer height = 2124
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_2 cb_2
cb_buscar cb_buscar
em_cod_supervisor em_cod_supervisor
st_cod_supervisor st_cod_supervisor
em_ape_paterno em_ape_paterno
st_apellido st_apellido
em_nombre em_nombre
st_nombre st_nombre
em_estado em_estado
st_estado st_estado
em_rut em_rut
st_rut st_rut
em_codigo em_codigo
st_1 st_1
cb_aceptar cb_aceptar
cb_1 cb_1
dw_lista dw_lista
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_salir cb_salir
gb_1 gb_1
end type
global w_lista_codigos w_lista_codigos

type variables
datawindow dw_paso
string is_opcion
Long il_row
end variables

on w_lista_codigos.create
this.cb_2=create cb_2
this.cb_buscar=create cb_buscar
this.em_cod_supervisor=create em_cod_supervisor
this.st_cod_supervisor=create st_cod_supervisor
this.em_ape_paterno=create em_ape_paterno
this.st_apellido=create st_apellido
this.em_nombre=create em_nombre
this.st_nombre=create st_nombre
this.em_estado=create em_estado
this.st_estado=create st_estado
this.em_rut=create em_rut
this.st_rut=create st_rut
this.em_codigo=create em_codigo
this.st_1=create st_1
this.cb_aceptar=create cb_aceptar
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_salir=create cb_salir
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_buscar,&
this.em_cod_supervisor,&
this.st_cod_supervisor,&
this.em_ape_paterno,&
this.st_apellido,&
this.em_nombre,&
this.st_nombre,&
this.em_estado,&
this.st_estado,&
this.em_rut,&
this.st_rut,&
this.em_codigo,&
this.st_1,&
this.cb_aceptar,&
this.cb_1,&
this.dw_lista,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_salir,&
this.gb_1}
end on

on w_lista_codigos.destroy
destroy(this.cb_2)
destroy(this.cb_buscar)
destroy(this.em_cod_supervisor)
destroy(this.st_cod_supervisor)
destroy(this.em_ape_paterno)
destroy(this.st_apellido)
destroy(this.em_nombre)
destroy(this.st_nombre)
destroy(this.em_estado)
destroy(this.st_estado)
destroy(this.em_rut)
destroy(this.st_rut)
destroy(this.em_codigo)
destroy(this.st_1)
destroy(this.cb_aceptar)
destroy(this.cb_1)
destroy(this.dw_lista)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_salir)
destroy(this.gb_1)
end on

event open;String	ls_filtro,ls_pasa,ls_estado

is_opcion	= message.stringparm
gf_centrar(w_lista_codigos)
gs_ventana	= 'w_lista_codigos'
f_valida_objeto()
ls_pasa	= 'N'

SELECT	"JEFE_VENTAS"."ESTADO"  
INTO 		:ls_estado  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING		sqlca;
if sqlca.sqlcode=0 then
	ls_pasa	= 'J'
else
	SELECT	"SUPERVISOR"."ESTADO"  
	INTO 		:ls_estado  
	FROM 		"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		ls_pasa	= 'S'
	else
		SELECT	"AGENTES"."ESTADO"  
		INTO 		:ls_estado  
		FROM 		"AGENTES"  
		WHERE 	"AGENTES"."COD_AGE" = :gs_user   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ls_pasa	= 'A'
		end if
	end if
end if

if is_opcion='J' or is_opcion='J2' or is_opcion='1' or is_opcion='G' then
	if isvalid(w_cd_asignar_agente) or isvalid(w_cd_ingresar_control_documentacion) then
		if gs_depto='O' or gs_depto='E' then
			dw_lista.dataobject  = 'dw_todos_jefe_ventas_activos_t'
		else
			dw_lista.dataobject  = 'dw_todos_jefe_ventas_activos'
		end if
	else
		dw_lista.dataobject  	= 'dw_todos_jefe_ventas'
	end if
	if ls_pasa='J' then
		ls_filtro					= "jefe_ventas='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	elseif ls_pasa='S' then
		ls_filtro					= "supervisor_cod_sup='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	elseif ls_pasa='A' then
		ls_filtro					= "agentes_cod_age='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	else
		ls_filtro					= ""
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	end if
	this.title						= 'Lista de Jefe de Ventas'
	st_cod_supervisor.visible 	= false
	em_cod_supervisor.visible	= false
elseif is_opcion='S' or is_opcion='S2' or is_opcion='2' then
	if isvalid(w_cd_asignar_agente) or isvalid(w_cd_ingresar_control_documentacion) then
		if gs_depto='O' or gs_depto='E' then
			dw_lista.dataobject 	= 'dw_todos_supervisor_activos_t'
		else
			dw_lista.dataobject 	= 'dw_todos_supervisor_activos'
		end if
	else
		dw_lista.dataobject 		= 'dw_todos_supervisor'
	end if
	if ls_pasa='J' then
		ls_filtro					= "cod_jefe='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	elseif ls_pasa='S' then
		ls_filtro					= "cod_sup='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	elseif ls_pasa='A' then
		ls_filtro					= "agentes_cod_age='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	else
		ls_filtro					= ""
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	end if
	
	
	this.title						= 'Lista de Supervisores'
	st_cod_supervisor.visible 	= true
	em_cod_supervisor.visible	= true
	st_cod_supervisor.text		= 'Cód. Jefe Venta'
elseif is_opcion='A' or is_opcion='A2' or is_opcion='A3' or is_opcion='3' then
	if isvalid(w_cd_asignar_agente) or isvalid(w_cd_ingresar_control_documentacion) then
		if gs_depto='O' or gs_depto='E' then
			dw_lista.dataobject 	= 'dw_todos_agentes_activos_t'
		else
			dw_lista.dataobject 	= 'dw_todos_agentes_activos'
		end if
	else
		dw_lista.dataobject 		= 'dw_todos_agentes'
	end if
	if ls_pasa='J' then
		ls_filtro					= "supervisor_cod_jefe='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	elseif ls_pasa='S' then
		ls_filtro					= "cod_sup='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	elseif ls_pasa='A' then
		ls_filtro					= "cod_age='"+gs_user+"'"
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	else
		ls_filtro					= ""
		dw_lista.SetFilter(ls_filtro)
		dw_lista.Filter( )
	end if
	this.title						= 'Lista de Agentes'
	st_cod_supervisor.visible 	= true
	em_cod_supervisor.visible	= true
	st_cod_supervisor.text		= 'Cód. Supervisor'
end if
dw_lista.settransobject(sqlca)
dw_lista.retrieve()

end event

type cb_2 from commandbutton within w_lista_codigos
integer x = 2921
integer y = 932
integer width = 338
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;em_ape_paterno.text		= ''
em_cod_supervisor.text	= ''
em_codigo.text				= ''
em_estado.text				= ''
em_nombre.text				= ''
em_rut.text					= ''
em_codigo.setfocus()
end event

type cb_buscar from commandbutton within w_lista_codigos
event clicked pbm_bnclicked
integer x = 2578
integer y = 932
integer width = 338
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;Long 		ll_row
String	ls_string
dw_lista.ScrollToRow(1)
if trim(em_ape_paterno.text) <> '' or trim(em_cod_supervisor.text) <> '' or &
	trim(em_codigo.text) <> '' or trim(em_estado.text) <> '' or trim(em_nombre.text)<> '' or &
	trim(em_rut.text) <> '' then
	ls_string	= ''
	CHOOSE CASE dw_lista.dataobject
		CASE 'dw_todos_agentes','dw_todos_agentes_activos'
			if trim(em_codigo.text) <> '' then
				ls_string	= "cod_age='"+trim(em_codigo.text)+"'"
			end if
			if trim(em_rut.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "rut="+trim(em_rut.text)
				else
					ls_string	= ls_string+" and rut="+trim(em_rut.text)
				end if
			end if
			if trim(em_estado.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "estado='"+trim(em_estado.text)+"'"
				else
					ls_string	= ls_string+" and estado='"+trim(em_estado.text)+"'"
				end if
			end if
			if trim(em_nombre.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "nombre='"+trim(em_nombre.text)+"'"
				else
					ls_string	= ls_string+" and nombre='"+trim(em_nombre.text)+"'"
				end if
			end if
			if trim(em_ape_paterno.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "a_paterno='"+trim(em_ape_paterno.text)+"'"
				else
					ls_string	= ls_string+" and a_paterno='"+trim(em_ape_paterno.text)+"'"
				end if
			end if
			if trim(em_cod_supervisor.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "cod_sup='"+trim(em_cod_supervisor.text)+"'"
				else
					ls_string	= ls_string+" and cod_sup='"+trim(em_cod_supervisor.text)+"'"
				end if
			end if
	
		CASE 'dw_todos_supervisor','dw_todos_supervisor_activos'
			if trim(em_codigo.text) <> '' then
				ls_string	= "cod_sup='"+trim(em_codigo.text)+"'"
			end if
			if trim(em_rut.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "rut="+trim(em_rut.text)
				else
					ls_string	= ls_string+" and rut="+trim(em_rut.text)
				end if
			end if
			if trim(em_estado.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "estado='"+trim(em_estado.text)+"'"
				else
					ls_string	= ls_string+" and estado='"+trim(em_estado.text)+"'"
				end if
			end if
			if trim(em_nombre.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "nombre='"+trim(em_nombre.text)+"'"
				else
					ls_string	= ls_string+" and nombre='"+trim(em_nombre.text)+"'"
				end if
			end if
			if trim(em_ape_paterno.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "a_paterno='"+trim(em_ape_paterno.text)+"'"
				else
					ls_string	= ls_string+" and a_paterno='"+trim(em_ape_paterno.text)+"'"
				end if
			end if
			if trim(em_cod_supervisor.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "cod_jefe='"+trim(em_cod_supervisor.text)+"'"
				else
					ls_string	= ls_string+" and cod_jefe='"+trim(em_cod_supervisor.text)+"'"
				end if
			end if
			
		CASE 'dw_todos_jefe_ventas','dw_todos_jefe_ventas_activos'
			if trim(em_codigo.text) <> '' then
				ls_string	= "jefe_ventas='"+trim(em_codigo.text)+"'"
			end if
			if trim(em_rut.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "rut="+trim(em_rut.text)
				else
					ls_string	= ls_string+" and rut="+trim(em_rut.text)
				end if
			end if
			if trim(em_estado.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "estado='"+trim(em_estado.text)+"'"
				else
					ls_string	= ls_string+" and estado='"+trim(em_estado.text)+"'"
				end if
			end if
			if trim(em_nombre.text) <> '' then 
				if ls_string='' or isnull(ls_string) then
					ls_string	= "nombre='"+trim(em_nombre.text)+"'"
				else
					ls_string	= ls_string+" and nombre='"+trim(em_nombre.text)+"'"
				end if
			end if
			if trim(em_ape_paterno.text) <> '' then
				if ls_string='' or isnull(ls_string) then
					ls_string	= "a_paterno='"+trim(em_ape_paterno.text)+"'"
				else
					ls_string	= ls_string+" and a_paterno='"+trim(em_ape_paterno.text)+"'"
				end if
			end if
	END CHOOSE
	
	ll_row = dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
	ELSE
		MessageBox("Advertencia", "Información Inexistente")
	END IF
end if
end event

type em_cod_supervisor from editmask within w_lista_codigos
integer x = 2999
integer y = 764
integer width = 224
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
string displaydata = ""
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_cod_supervisor from statictext within w_lista_codigos
integer x = 2619
integer y = 772
integer width = 379
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Cód. Supervisor"
boolean focusrectangle = false
end type

type em_ape_paterno from editmask within w_lista_codigos
integer x = 2619
integer y = 664
integer width = 603
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
string displaydata = ""
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_apellido from statictext within w_lista_codigos
integer x = 2619
integer y = 600
integer width = 379
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Apellido Paterno"
boolean focusrectangle = false
end type

type em_nombre from editmask within w_lista_codigos
integer x = 2619
integer y = 504
integer width = 603
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
string displaydata = ""
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_nombre from statictext within w_lista_codigos
integer x = 2619
integer y = 436
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Nombre"
boolean focusrectangle = false
end type

type em_estado from editmask within w_lista_codigos
integer x = 2848
integer y = 332
integer width = 375
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
string displaydata = "°üDecimalSeparator = ~'.~';Delimitidentifier = ~'Yes~';PBDBMS = 0"
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_estado from statictext within w_lista_codigos
integer x = 2619
integer y = 340
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Estado"
boolean focusrectangle = false
end type

type em_rut from editmask within w_lista_codigos
integer x = 2848
integer y = 232
integer width = 375
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
string mask = "#########"
string displaydata = ""
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_rut from statictext within w_lista_codigos
integer x = 2619
integer y = 240
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Rut"
boolean focusrectangle = false
end type

type em_codigo from editmask within w_lista_codigos
integer x = 2848
integer y = 136
integer width = 375
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
string displaydata = "~r"
end type

event modified;cb_buscar.triggerevent(clicked!)
end event

type st_1 from statictext within w_lista_codigos
integer x = 2619
integer y = 144
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Código"
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_lista_codigos
integer x = 2578
integer y = 1660
integer width = 338
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string 	ls_codigo,ls_estado,ls_age,ls_sup,ls_jefe,ls_sup_aux,ls_jefe_aux,ls_age_actual,&
		 	ls_sup_actual,ls_jefe_actual,ls_glosa,ls_nom,ls_pat,ls_mat,ls_ap_pat,ls_ap_mat,&
			ls_nom_com_age,ls_nom_com_sup,ls_nom_com_jef,ls_canal,ls_nulo,ls_orig_venta,ls_depto
long		ll_nulo
Datetime	ld_fec_ini,ld_fec_fin
Double	ldb_porce_sup,ldb_factor_sup_2,ldb_porce_jefe,ldb_porce_sup_2,ldb_factor_jefe_2,&
			ldb_porce_jefe_2

dw_lista.accepttext()
Setnull(ls_nulo)
if dw_lista.getrow() > 0 then
	if is_opcion='A' or is_opcion='A2' or is_opcion='A3' or is_opcion='3' then
		ls_codigo								= dw_lista.getitemstring(il_row,'cod_age')
	elseif is_opcion='S' or is_opcion='S2' or is_opcion='2' then
		ls_codigo								= dw_lista.getitemstring(il_row,'cod_sup')
	elseif is_opcion='J' or is_opcion='J2' or is_opcion='1' or is_opcion='G' then
		ls_codigo								= dw_lista.getitemstring(il_row,'jefe_ventas')
	end if
	if isvalid(w_mantencion) then
		w_mantencion.dw_datos.setitem(1,'codigo',gs_codigo)
		w_mantencion.dw_datos.accepttext()
		gs_codigo								= ls_codigo
		w_mantencion.wf_buscar_codigo(ls_codigo,is_opcion)
		w_mantencion.dw_datos.setfocus()
		w_mantencion.dw_datos.setcolumn('nro_licencia')
	elseif isvalid(w_mantenedor_venta) then
		w_mantenedor_venta.em_codigo.text	= ls_codigo
		w_mantenedor_venta.em_codigo.setfocus()
		w_mantenedor_venta.em_codigo.triggerevent(modified!)
	elseif isvalid(w_informe_estado_cartera) then
		w_informe_estado_cartera.em_codigo.text	= ls_codigo
		w_informe_estado_cartera.em_codigo.setfocus()
		w_informe_estado_cartera.em_codigo.triggerevent(modified!)
	elseif isvalid(w_inf_gestion_hist) then
		w_inf_gestion_hist.em_codigo.setfocus()
		w_inf_gestion_hist.em_codigo.text	= ls_codigo
		w_inf_gestion_hist.em_codigo.triggerevent(modified!)
	elseif isvalid(w_produccion_por_periodo_y_codigo) then
		w_produccion_por_periodo_y_codigo.em_codigo.text	= ls_codigo
		w_produccion_por_periodo_y_codigo.em_codigo.setfocus()
		w_produccion_por_periodo_y_codigo.em_codigo.triggerevent(modified!)
	elseif isvalid(w_inf_gestion) then
		w_inf_gestion.em_codigo.text	= ls_codigo
		w_inf_gestion.em_codigo.triggerevent(modified!)
	elseif isvalid(w_inf_gestion_individual) then
		w_inf_gestion_individual.em_codigo.text	= ls_codigo
		w_inf_gestion_individual.em_codigo.setfocus()
		w_inf_gestion_individual.em_codigo.triggerevent(modified!)
	elseif isvalid(w_cambiar_estado) then
		w_cambiar_estado.em_codigo.text		= ls_codigo
		w_cambiar_estado.em_codigo.setfocus()
		w_cambiar_estado.em_codigo.triggerevent(modified!)
	elseif isvalid(w_cd_consultas) then
		w_cd_consultas.em_codigo.text			= ls_codigo
		if is_opcion='A' or is_opcion='3' then
			w_cd_consultas.gb_2.text			= 'Ingrese Codigo Agente'
		elseif is_opcion='S' or is_opcion='2' then
			w_cd_consultas.gb_2.text			= 'Ingrese Codigo Supervisor'
		elseif is_opcion='J' or is_opcion='1' or is_opcion='G' then
			w_cd_consultas.gb_2.text			= 'Ingrese Codigo Jefe Venta'
		end if
		if not isnull(ls_codigo) and ls_codigo<>'' then
			CHOOSE CASE is_opcion
				CASE 'A','3'
					SELECT	"AGENTES"."NOMBRE",   
								"AGENTES"."A_PATERNO",   
								"AGENTES"."A_MATERNO",   
								"AGENTES"."ESTADO"  
					INTO 		:ls_nom,   
								:ls_pat,   
								:ls_mat,   
								:ls_estado  
					FROM 	"AGENTES"  
					WHERE 	"AGENTES"."COD_AGE" = :ls_codigo 
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nom							= ls_nom+' '+ls_pat+' '+ls_mat
						if ls_estado='A' then
							ls_estado					= 'Activo'
						else
							ls_estado					= 'Inactivo'
						end if
						w_cd_consultas.gb_2.text	= 'Ingrese Codigo Agente          '+ls_nom+'          Estado:'+ls_estado
					end if
		
				CASE 'S','2'
					SELECT	"SUPERVISOR"."NOMBRE",   
								"SUPERVISOR"."A_PATERNO",   
								"SUPERVISOR"."A_MATERNO",   
								"SUPERVISOR"."ESTADO"  
					INTO 		:ls_nom,   
								:ls_pat,   
								:ls_mat,   
								:ls_estado  
					FROM 		"SUPERVISOR"  
					WHERE 	"SUPERVISOR"."COD_SUP" = :ls_codigo   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nom							= ls_nom+' '+ls_pat+' '+ls_mat
						if ls_estado='A' then
							ls_estado					= 'Activo'
						else
							ls_estado					= 'Inactivo'
						end if
						w_cd_consultas.gb_2.text	= 'Ingrese Codigo Supervisor          '+ls_nom+'          Estado:'+ls_estado
					end if
		
				CASE 'J','1','G'
					SELECT	"JEFE_VENTAS"."NOMBRE",   
								"JEFE_VENTAS"."A_PATERNO",   
								"JEFE_VENTAS"."A_MATERNO",   
								"JEFE_VENTAS"."ESTADO"  
					INTO 		:ls_nom,   
								:ls_pat,   
								:ls_mat,   
								:ls_estado  
					FROM 		"JEFE_VENTAS"  
					WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ls_nom							= ls_nom+' '+ls_pat+' '+ls_mat
						if ls_estado='A' then
							ls_estado					= 'Activo'
						else
							ls_estado					= 'Inactivo'
						end if
						w_cd_consultas.gb_2.text	= 'Ingrese Codigo Jefe Venta          '+ls_nom+'          Estado:'+ls_estado
					end if
		
			END CHOOSE
			w_cd_consultas.dw_lista.reset()
		end if
		ld_fec_ini										= datetime(date(w_cd_consultas.em_ini.text))
		ld_fec_fin										= datetime(date(w_cd_consultas.em_fin.text),time('23:59:59'))
		w_cd_consultas.dw_lista.retrieve(ls_codigo,ld_fec_ini,ld_fec_fin)
	elseif isvalid(w_cd_ingresar_control_documentacion) then
		if is_opcion='A' or is_opcion='3' then 
			SELECT	"AGENTES"."COD_SUP",   
						"SUPERVISOR"."COD_JEFE"  
			INTO 		:ls_sup_aux,   
						:ls_jefe_aux  
			FROM 		"AGENTES",   
						"SUPERVISOR"  
			WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
					 (("AGENTES"."COD_AGE" = :ls_codigo ) )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_age_actual	= trim(w_cd_ingresar_control_documentacion.dw_actual.getitemstring(1,'cod_agente'))
				if ls_age_actual <> ls_codigo then
					ls_sup_actual	= trim(w_cd_ingresar_control_documentacion.dw_actual.getitemstring(1,'cod_supervisor'))
					ls_jefe_actual	= trim(w_cd_ingresar_control_documentacion.dw_actual.getitemstring(1,'cod_jefe_venta'))
					ls_glosa			= trim(w_cd_ingresar_control_documentacion.dw_nuevo.getitemstring(1,'glosa'))
					
					//Nombre Agente
					SELECT	"AGENTES"."NOMBRE",  "AGENTES"."A_PATERNO",  "AGENTES"."A_MATERNO"  
					INTO 		:ls_nom,   				:ls_ap_pat,   				:ls_ap_mat  
					FROM 		"AGENTES"  
					WHERE 	"AGENTES"."COD_AGE" = :ls_codigo   
					USING		sqlca;
					if sqlca.sqlcode=0 then ls_nom_com_age	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
					//Nombre Supervisor
					SELECT	"SUPERVISOR"."NOMBRE",  "SUPERVISOR"."A_PATERNO",  "SUPERVISOR"."A_MATERNO"  
					INTO 		:ls_nom,						:ls_ap_pat,   					:ls_ap_mat  
					FROM 		"SUPERVISOR"  
					WHERE 	"SUPERVISOR"."COD_SUP" = :ls_sup_aux
					USING		sqlca;
					if sqlca.sqlcode=0 then ls_nom_com_sup	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
					//Nombre Jefe
					SELECT	"JEFE_VENTAS"."NOMBRE", 	"JEFE_VENTAS"."A_PATERNO",   	"JEFE_VENTAS"."A_MATERNO"  
					INTO 		:ls_nom,   						:ls_ap_pat,   						:ls_ap_mat  
					FROM 		"JEFE_VENTAS"  
					WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe_aux
					USING		sqlca;
					if sqlca.sqlcode=0 then ls_nom_com_jef	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
					
					if ls_age<>ls_age_actual then
						ls_glosa	= ls_glosa + ', SE MODIFICA AGENTE: '+ls_age_actual+' POR '+ls_codigo+'  '+ls_nom_com_age
					end if
					if ls_sup<>ls_sup_actual then
						ls_glosa	= ls_glosa + ', SE MODIFICA SUPERVISOR: '+ls_sup_actual+' POR '+ls_sup_aux+'  '+ls_nom_com_sup
					end if
					if ls_jefe<>ls_jefe_actual then
						ls_glosa	= ls_glosa + ', SE MODIFICA JEFE DE VENTA: '+ls_jefe_actual+' POR '+ls_jefe_aux+'  '+ls_nom_com_jef
					end if
					ls_glosa	= ls_glosa + ' REALIZADO POR USUARIO: '+gs_user+' EL DIA: '+string(gdt_fec_sistema,"dd/mm/yyyy")
					w_cd_ingresar_control_documentacion.dw_nuevo.setitem(1,'glosa',trim(ls_glosa))
					w_cd_ingresar_control_documentacion.dw_nuevo.setitem(1,'cod_agente',ls_codigo)
					w_cd_ingresar_control_documentacion.dw_nuevo.setitem(1,'cod_supervisor',ls_sup_aux)
					w_cd_ingresar_control_documentacion.dw_nuevo.setitem(1,'cod_jefe_venta',ls_jefe_aux)
				else
					messagebox("Advertencia","Codigo Seleccionado, corresponde al Agente Actualmente Asignado")
					w_cd_ingresar_control_documentacion.dw_nuevo.setfocus()
				end if
				w_cd_ingresar_control_documentacion.dw_nuevo.accepttext()
			end if
		end if
		if is_opcion='S' or is_opcion='2' then 
			ls_sup_actual	= trim(w_cd_ingresar_control_documentacion.dw_actual.getitemstring(1,'cod_supervisor'))
			if ls_sup_actual <> ls_codigo then 
				w_cd_ingresar_control_documentacion.dw_nuevo.setitem(1,'cod_supervisor',ls_codigo)
			else
				messagebox("Advertencia","Codigo Seleccionado, corresponde al Supervisor Actualmente Asignado")
				w_cd_ingresar_control_documentacion.dw_nuevo.setfocus()
			end if
		end if
		if is_opcion='J' or is_opcion='1' or is_opcion='G' then 
			ls_jefe_actual	= trim(w_cd_ingresar_control_documentacion.dw_actual.getitemstring(1,'cod_jefe_venta'))
			if ls_jefe_actual <> ls_codigo then 
				w_cd_ingresar_control_documentacion.dw_nuevo.setitem(1,'cod_jefe_venta',ls_codigo)
			else
				messagebox("Advertencia","Codigo Seleccionado, corresponde al Jefe de Venta Actualmente Asignado")
				w_cd_ingresar_control_documentacion.dw_nuevo.setfocus()
			end if
		end if
		w_cd_ingresar_control_documentacion.dw_nuevo.accepttext()
	elseif isvalid(w_cd_asignar_agente) then
		CHOOSE CASE is_opcion
			CASE 'A','3'
				w_cd_asignar_agente.dw_asignar.setitem(1,'cod_agente',ls_codigo)
				w_cd_asignar_agente.dw_asignar.accepttext()
				ls_age	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_agente')
				ls_sup	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_supervisor')
				ls_jefe	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_jefe_venta')
				if not isnull(ls_age) and ls_age<>'' then
					SELECT	"AGENTES"."ESTADO",   
								"AGENTES"."COD_SUP",   
								"SUPERVISOR"."COD_JEFE"  
					INTO 		:ls_estado,   
								:ls_sup_aux,   
								:ls_jefe_aux  
					FROM 		"AGENTES",   
								"SUPERVISOR"  
					WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
							 (("AGENTES"."COD_AGE" = :ls_age ) )
					USING		sqlca;
					if sqlca.sqlcode<>0 then
						messagebox("Advertencia","No Existe Agente "+ls_age)
						w_cd_asignar_agente.dw_asignar.reset()
						w_cd_asignar_agente.dw_asignar.retrieve(gs_base,gs_serie,gi_numero)
						w_cd_asignar_agente.dw_asignar.setitem(1,'cod_supervisor',ls_sup)
						w_cd_asignar_agente.dw_asignar.setitem(1,'cod_jefe_venta',ls_jefe)
						w_cd_asignar_agente.dw_asignar.setfocus()
						w_cd_asignar_agente.dw_asignar.setcolumn('cod_agente')
					else
						if ls_sup <> ls_sup_aux or isnull(ls_sup) then	//isnull(ls_sup) or ls_sup='' or ls_sup="" then
							w_cd_asignar_agente.dw_asignar.setitem(1,'cod_supervisor',ls_sup_aux)
						end if
						if ls_jefe <> ls_jefe_aux or isnull(ls_jefe) then 	//isnull(ls_jefe) or ls_jefe='' or ls_jefe="" then
							w_cd_asignar_agente.dw_asignar.setitem(1,'cod_jefe_venta',ls_jefe_aux)
						end if
						w_cd_asignar_agente.dw_asignar.accepttext()
					end if
				end if
		
			CASE 'S','2'
				w_cd_asignar_agente.dw_asignar.setitem(1,'cod_supervisor',ls_codigo)
				w_cd_asignar_agente.dw_asignar.accepttext()
				ls_age	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_agente')
				ls_sup	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_supervisor')
				ls_jefe	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_jefe_venta')
				if not isnull(ls_sup) and ls_sup<>'' then
					SELECT 	"SUPERVISOR"."ESTADO",
								"SUPERVISOR"."COD_JEFE"
					INTO 		:ls_estado,
								:ls_jefe_aux
					FROM 		"SUPERVISOR"  
					WHERE 	"SUPERVISOR"."COD_SUP" = :ls_sup   
					USING		sqlca;
					if sqlca.sqlcode<>0 then
						messagebox("Advertencia","No Existe Supervisor "+ls_sup)
						w_cd_asignar_agente.dw_asignar.reset()
						w_cd_asignar_agente.dw_asignar.retrieve(gs_base,gs_serie,gi_numero)
						w_cd_asignar_agente.dw_asignar.setitem(1,'cod_agente',ls_age)
						w_cd_asignar_agente.dw_asignar.setitem(1,'cod_jefe_venta',ls_jefe)
						w_cd_asignar_agente.dw_asignar.setfocus()
						w_cd_asignar_agente.dw_asignar.setcolumn('cod_supervisor')
					else
						if ls_jefe <> ls_jefe_aux or isnull(ls_jefe) then	//isnull(ls_jefe) then
							w_cd_asignar_agente.dw_asignar.setitem(1,'cod_jefe_venta',ls_jefe_aux)
						end if
						w_cd_asignar_agente.dw_asignar.accepttext()
					end if
				end if

			CASE 'J','1','G'
				w_cd_asignar_agente.dw_asignar.setitem(1,'cod_jefe_venta',ls_codigo)
				w_cd_asignar_agente.dw_asignar.accepttext()
				ls_age	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_agente')
				ls_sup	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_supervisor')
				ls_jefe	= w_cd_asignar_agente.dw_asignar.getitemstring(1,'cod_jefe_venta')
				if not isnull(ls_jefe) and ls_jefe<>'' then
					SELECT	"JEFE_VENTAS"."ESTADO"  
					INTO 		:ls_estado  
					FROM 		"JEFE_VENTAS"  
					WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe   
					USING		sqlca;
					if sqlca.sqlcode<>0 then
						messagebox("Advertencia","No Existe Jefe Venta "+ls_jefe)
						w_cd_asignar_agente.dw_asignar.reset()
						w_cd_asignar_agente.dw_asignar.retrieve(gs_base,gs_serie,gi_numero)
						w_cd_asignar_agente.dw_asignar.setitem(1,'cod_agente',ls_age)
						w_cd_asignar_agente.dw_asignar.setitem(1,'cod_supervisor',ls_sup)
						w_cd_asignar_agente.dw_asignar.setfocus()
						w_cd_asignar_agente.dw_asignar.setcolumn('cod_jefe_venta')
					else
						w_cd_asignar_agente.dw_asignar.accepttext()
					end if
				end if
		END CHOOSE
		w_cd_asignar_agente.dw_asignar.accepttext()
		
	elseif isvalid(w_comision_comp_asignacion) then
		CHOOSE CASE is_opcion
			CASE 'A2','3'
				w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_2',ls_codigo)
				w_comision_comp_asignacion.dw_asignar.accepttext()
				ls_age														= w_comision_comp_asignacion.dw_asignar.getitemstring(1,'cod_age_2')
				ls_orig_venta												= w_comision_comp_asignacion.dw_asignar.getitemstring(1,'codigo_tipo_vta')
				if not isnull(ls_age) and ls_age<>'' then
					SELECT	"AGENTES"."ESTADO",	"AGENTES"."COD_SUP",	"AGENTES"."DEPTO",	"SUPERVISOR"."COD_JEFE",	"SUPERVISOR"."PORC_SUPERVISOR", "JEFE_VENTAS"."PORC_JEFE_VTA"   
					INTO 		:ls_estado,				:ls_sup,		 			:ls_depto,				:ls_jefe,						:ldb_porce_sup,						:ldb_porce_jefe
					FROM 		"AGENTES","SUPERVISOR","JEFE_VENTAS"
					WHERE		( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
								( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS") and 
								( "AGENTES"."COD_AGE" = :ls_age )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_estado='A' then
							if ls_orig_venta = '5' or ls_orig_venta = '8' then
								if ls_depto <> 'M' then
									messagebox("Advertencia","Agente "+ls_age+" No Pertenece Canal Funerario")
									w_comision_comp_asignacion.dw_asignar.setfocus()
									w_comision_comp_asignacion.dw_asignar.setcolumn('cod_age_2')
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
								else
									if not isnull(ls_sup) and ls_sup<>'' and ls_sup<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_sup)
										ldb_factor_sup_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_sup_2')
										ldb_porce_sup_2					= ldb_porce_sup * ldb_factor_sup_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
									end if
									if not isnull(ls_jefe) and ls_jefe<>'' and ls_jefe<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
										ldb_factor_jefe_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_jefe_2')
										ldb_porce_jefe_2					= ldb_porce_jefe * ldb_factor_jefe_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
									end if
								end if
							elseif ls_orig_venta = 'U' or ls_orig_venta = 'C' then
								if ls_depto <> 'X' then
									messagebox("Advertencia","Agente "+ls_age+" No Pertenece U.G.N.")
									w_comision_comp_asignacion.dw_asignar.setfocus()
									w_comision_comp_asignacion.dw_asignar.setcolumn('cod_age_2')
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
								else
									if not isnull(ls_sup) and ls_sup<>'' then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_sup)
										ldb_factor_sup_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_sup_2')
										ldb_porce_sup_2					= ldb_porce_sup * ldb_factor_sup_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
									end if
									if not isnull(ls_jefe) and ls_jefe<>'' and ls_jefe<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
										ldb_factor_jefe_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_jefe_2')
										ldb_porce_jefe_2					= ldb_porce_jefe * ldb_factor_jefe_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
									end if
								end if
							else
								if not isnull(ls_sup) and ls_sup<>'' and ls_sup<>"" then
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_sup)
									ldb_factor_sup_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_sup_2')
									ldb_porce_sup_2					= ldb_porce_sup * ldb_factor_sup_2
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
								end if
								if not isnull(ls_jefe) and ls_jefe<>'' and ls_jefe<>"" then
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
									ldb_factor_jefe_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_jefe_2')
									ldb_porce_jefe_2					= ldb_porce_jefe * ldb_factor_jefe_2
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
								end if
							end if
						else
							messagebox("Advertencia","Agente "+ls_age+" Inactivo")
							w_comision_comp_asignacion.dw_asignar.setfocus()
							w_comision_comp_asignacion.dw_asignar.setcolumn('cod_age_2')
							w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_2',ls_nulo)
							w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
							w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
							w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
							w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
							w_comision_comp_asignacion.dw_asignar.accepttext()
						end if
					end if
				else
					messagebox("Advertencia","Agente "+ls_age+" No Registra Información ")
					w_comision_comp_asignacion.dw_asignar.setfocus()
					w_comision_comp_asignacion.dw_asignar.setcolumn('cod_age_2')
					w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_2',ls_nulo)
					w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
					w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
					w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
					w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
					w_comision_comp_asignacion.dw_asignar.accepttext()
				end if
			CASE 'S2','2'
				w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_codigo)
				w_comision_comp_asignacion.dw_asignar.accepttext()
				ls_sup												= w_comision_comp_asignacion.dw_asignar.getitemstring(1,'cod_sup_2')
				if not isnull(ls_sup) and ls_sup <>'' then
					SELECT	"SUPERVISOR"."ESTADO",	"SUPERVISOR"."CANAL",	"SUPERVISOR"."DEPTO",	"SUPERVISOR"."COD_SUP",	"SUPERVISOR"."COD_JEFE",	"SUPERVISOR"."PORC_SUPERVISOR", "JEFE_VENTAS"."PORC_JEFE_VTA"   
					INTO 		:ls_estado,					:ls_canal,					:ls_depto,					:ls_sup,		 				:ls_jefe,						:ldb_porce_sup,						:ldb_porce_jefe
					FROM 		"SUPERVISOR","JEFE_VENTAS"
					WHERE		( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS") and 
								( "SUPERVISOR"."COD_SUP" = :ls_sup )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_estado='A' then
							if ls_orig_venta = '5' or ls_orig_venta = '8' then
								if ls_canal <> 'NI' then
									messagebox("Advertencia","Supervisor "+ls_sup+" No Pertenece Canal Funerario")
									w_comision_comp_asignacion.dw_asignar.setfocus()
									w_comision_comp_asignacion.dw_asignar.setcolumn('cod_sup_2')
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
								else
									if not isnull(ls_sup) and ls_sup<>'' and ls_sup<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_sup)
										ldb_factor_sup_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_sup_2')
										ldb_porce_sup_2					= ldb_porce_sup * ldb_factor_sup_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
									end if
									if not isnull(ls_jefe) and ls_jefe<>'' and ls_jefe<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
										ldb_factor_jefe_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_jefe_2')
										ldb_porce_jefe_2					= ldb_porce_jefe * ldb_factor_jefe_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
									end if
								end if
							elseif ls_orig_venta = 'U' then
								if ls_depto <> 'X' then
									messagebox("Advertencia","Supervisor "+ls_sup+" No Pertenece U.G.N.")
									w_comision_comp_asignacion.dw_asignar.setfocus()
									w_comision_comp_asignacion.dw_asignar.setcolumn('cod_sup_2')
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
									w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
								else
									if not isnull(ls_sup) and ls_sup<>'' and ls_sup<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_sup)
										ldb_factor_sup_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_sup_2')
										ldb_porce_sup_2					= ldb_porce_sup * ldb_factor_sup_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
									end if
									if not isnull(ls_jefe) and ls_jefe<>'' and ls_jefe<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
										ldb_factor_jefe_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_jefe_2')
										ldb_porce_jefe_2					= ldb_porce_jefe * ldb_factor_jefe_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
									end if
								end if
							elseif ls_orig_venta = '3' or ls_orig_venta = 'C' then
								SELECT	"SUPERVISOR"."ESTADO",	"SUPERVISOR"."CANAL",	"SUPERVISOR"."DEPTO",	"SUPERVISOR"."COD_JEFE",	"SUPERVISOR"."PORC_SUPERVISOR", "JEFE_VENTAS"."PORC_JEFE_VTA"   
								INTO 		:ls_estado,					:ls_canal,					:ls_depto,					:ls_jefe,						:ldb_porce_sup,						:ldb_porce_jefe
								FROM 		"SUPERVISOR","JEFE_VENTAS"
								WHERE		( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS") and 
											( "SUPERVISOR"."DEPTO" = 'X' ) and
											( "SUPERVISOR"."ESTADO" = 'A' ) 
								USING		sqlca;
								if sqlca.sqlcode = 0 then
									if not isnull(ls_sup) and ls_sup<>'' and ls_sup<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_sup)
										ldb_factor_sup_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_sup_2')
										ldb_porce_sup_2					= ldb_porce_sup * ldb_factor_sup_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ldb_porce_sup_2)
									end if
									if not isnull(ls_jefe) and ls_jefe<>'' and ls_jefe<>"" then
										w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_jefe)
										ldb_factor_jefe_2					= w_comision_comp_asignacion.dw_porcentaje.getitemnumber(1,'porce_jefe_2')
										ldb_porce_jefe_2					= ldb_porce_jefe * ldb_factor_jefe_2
										w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ldb_porce_jefe_2)
									end if
								end if
							end if
						else
							messagebox("Advertencia","Supervisor "+ls_sup+" Inactivo")
							w_comision_comp_asignacion.dw_asignar.setfocus()
							w_comision_comp_asignacion.dw_asignar.setcolumn('cod_sup_2')
							w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
							w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
							w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
							w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
							w_comision_comp_asignacion.dw_asignar.accepttext()
						end if
					end if
				else
					messagebox("Advertencia","Supervisor "+ls_sup+" No Registra Información ")
					w_comision_comp_asignacion.dw_asignar.setfocus()
					w_comision_comp_asignacion.dw_asignar.setcolumn('cod_sup_2')
					w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_sup_2',ls_nulo)
					w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_sup_2',ll_nulo)
					w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_jefe_2',ls_nulo)
					w_comision_comp_asignacion.dw_asignar.setitem(1,'porce_jefe_2',ll_nulo)
					w_comision_comp_asignacion.dw_asignar.accepttext()
				end if
			CASE 'A3','4'	
				w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_3',ls_codigo)
				w_comision_comp_asignacion.dw_asignar.accepttext()
				ls_age												= w_comision_comp_asignacion.dw_asignar.getitemstring(1,'cod_age_3')
				if not isnull(ls_age) and ls_age<>'' then
					SELECT	"AGENTES"."ESTADO",	"AGENTES"."COD_SUP",	"AGENTES"."DEPTO",	"SUPERVISOR"."COD_JEFE",	"SUPERVISOR"."PORC_SUPERVISOR", "JEFE_VENTAS"."PORC_JEFE_VTA"   
					INTO 		:ls_estado,				:ls_sup,		 			:ls_depto,				:ls_jefe,						:ldb_porce_sup,						:ldb_porce_jefe
					FROM 		"AGENTES","SUPERVISOR","JEFE_VENTAS"
					WHERE		( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
								( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS") and 
								( "AGENTES"."COD_AGE" = :ls_age )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						if ls_estado='A' then
							if ls_depto <> 'X' then
								messagebox("Advertencia","Agente "+ls_age+" No Pertenece U.G.N.")
								w_comision_comp_asignacion.dw_asignar.setfocus()
								w_comision_comp_asignacion.dw_asignar.setcolumn('cod_age_3')
								w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_3',ls_nulo)
								w_comision_comp_asignacion.dw_asignar.accepttext()
							end if
						else
							messagebox("Advertencia","Agente "+ls_age+" Inactivo")
							w_comision_comp_asignacion.dw_asignar.setfocus()
							w_comision_comp_asignacion.dw_asignar.setcolumn('cod_age_3')
							w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_3',ls_nulo)
							w_comision_comp_asignacion.dw_asignar.accepttext()
						end if
					end if
				else
					messagebox("Advertencia","Agente "+ls_age+" No Registra Información ")
					w_comision_comp_asignacion.dw_asignar.setfocus()
					w_comision_comp_asignacion.dw_asignar.setcolumn('cod_age_3')
					w_comision_comp_asignacion.dw_asignar.setitem(1,'cod_age_3',ls_nulo)
					w_comision_comp_asignacion.dw_asignar.accepttext()
				end if
		END CHOOSE
		w_comision_comp_asignacion.dw_asignar.accepttext()
	end if
	cb_salir.triggerevent(clicked!)
end if


end event

type cb_1 from commandbutton within w_lista_codigos
integer x = 2921
integer y = 1760
integer width = 338
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type dw_lista from datawindow within w_lista_codigos
integer x = 50
integer y = 44
integer width = 2482
integer height = 1916
integer taborder = 10
string dataobject = "dw_todos_agentes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(Row, TRUE)
end if
end event

event rowfocuschanged;il_row	= this.getrow()
if il_row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row > 0 then
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

event dberror;return(0)
end event

type cb_exportar from commandbutton within w_lista_codigos
integer x = 2921
integer y = 1660
integer width = 338
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso	= dw_lista
//OpenWithParm(w_exportar, dw_paso)
f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_lista_codigos
integer x = 2578
integer y = 1760
integer width = 338
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_salir from commandbutton within w_lista_codigos
integer x = 2578
integer y = 1860
integer width = 681
integer height = 96
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_codigos)
end event

type gb_1 from groupbox within w_lista_codigos
integer x = 2578
integer y = 12
integer width = 681
integer height = 888
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Opciones de Busqueda"
end type

