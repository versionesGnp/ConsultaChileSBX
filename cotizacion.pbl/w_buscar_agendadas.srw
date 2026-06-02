forward
global type w_buscar_agendadas from window
end type
type cb_4 from commandbutton within w_buscar_agendadas
end type
type cb_3 from commandbutton within w_buscar_agendadas
end type
type cb_5 from commandbutton within w_buscar_agendadas
end type
type cb_exportar from commandbutton within w_buscar_agendadas
end type
type cb_aceptar from commandbutton within w_buscar_agendadas
end type
type cb_imprimir from commandbutton within w_buscar_agendadas
end type
type em_fec_fin from editmask within w_buscar_agendadas
end type
type st_2 from statictext within w_buscar_agendadas
end type
type em_fec_ini from editmask within w_buscar_agendadas
end type
type p_ini from picture within w_buscar_agendadas
end type
type st_3 from statictext within w_buscar_agendadas
end type
type p_fin from picture within w_buscar_agendadas
end type
type dw_agente_buscar_agendadas from datawindow within w_buscar_agendadas
end type
type pb_ok2 from picturebutton within w_buscar_agendadas
end type
type rb_por_agente from radiobutton within w_buscar_agendadas
end type
type rb_todos from radiobutton within w_buscar_agendadas
end type
type dw_buscar_agendadas from datawindow within w_buscar_agendadas
end type
type cb_limpiar from commandbutton within w_buscar_agendadas
end type
type cb_cerrar from commandbutton within w_buscar_agendadas
end type
type gb_1 from groupbox within w_buscar_agendadas
end type
type gb_2 from groupbox within w_buscar_agendadas
end type
end forward

global type w_buscar_agendadas from window
integer width = 4329
integer height = 2676
boolean titlebar = true
string title = "Buscar Informes Agendados"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_4 cb_4
cb_3 cb_3
cb_5 cb_5
cb_exportar cb_exportar
cb_aceptar cb_aceptar
cb_imprimir cb_imprimir
em_fec_fin em_fec_fin
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
p_fin p_fin
dw_agente_buscar_agendadas dw_agente_buscar_agendadas
pb_ok2 pb_ok2
rb_por_agente rb_por_agente
rb_todos rb_todos
dw_buscar_agendadas dw_buscar_agendadas
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
gb_1 gb_1
gb_2 gb_2
end type
global w_buscar_agendadas w_buscar_agendadas

type variables
Long	il_row
end variables

on w_buscar_agendadas.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_exportar=create cb_exportar
this.cb_aceptar=create cb_aceptar
this.cb_imprimir=create cb_imprimir
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.p_fin=create p_fin
this.dw_agente_buscar_agendadas=create dw_agente_buscar_agendadas
this.pb_ok2=create pb_ok2
this.rb_por_agente=create rb_por_agente
this.rb_todos=create rb_todos
this.dw_buscar_agendadas=create dw_buscar_agendadas
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_5,&
this.cb_exportar,&
this.cb_aceptar,&
this.cb_imprimir,&
this.em_fec_fin,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.p_fin,&
this.dw_agente_buscar_agendadas,&
this.pb_ok2,&
this.rb_por_agente,&
this.rb_todos,&
this.dw_buscar_agendadas,&
this.cb_limpiar,&
this.cb_cerrar,&
this.gb_1,&
this.gb_2}
end on

on w_buscar_agendadas.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_exportar)
destroy(this.cb_aceptar)
destroy(this.cb_imprimir)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.p_fin)
destroy(this.dw_agente_buscar_agendadas)
destroy(this.pb_ok2)
destroy(this.rb_por_agente)
destroy(this.rb_todos)
destroy(this.dw_buscar_agendadas)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string	ls_cod_sup, ls_nom_sup, ls_ap_pat_sup, ls_ap_mat_sup
datetime	ldt_fecha_hoy
long		ll_new
datawindowchild idw_detalle5

gf_centrar(w_buscar_agendadas)
dw_buscar_agendadas.settransobject(sqlca)
em_fec_ini.text = string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text = string(gdt_fec_sistema,'dd/mm/yyyy')
dw_agente_buscar_agendadas.settransobject(sqlca)

if gs_depto ='R'	or gs_depto ='B' or gs_user='SORTIZ' then
	SELECT	DISTINCT "SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO", "SUPERVISOR"."COD_SUP"
	INTO					:ls_nom_sup,				:ls_ap_pat_sup,				:ls_ap_mat_sup,			  :ls_cod_sup
	FROM 					"ENCARGADOS",         "SUPERVISOR"  
	WHERE  				( "ENCARGADOS"."CODIGO_USUARIO" = "SUPERVISOR"."COD_SUP" ) and  
							(("ENCARGADOS"."ESTADO" = 'A' ) AND  
							( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   
	ORDER BY 			"SUPERVISOR"."COD_SUP" ASC
	USING		sqlca;
	if sqlca.sqlcode=0 then
		gb_1.height												= 228
		rb_por_agente.text									= 'Por Agente'
		dw_agente_buscar_agendadas.dataobject			= 'dwe_seleccionar_agente_por_supervisor'
		dw_agente_buscar_agendadas.settransobject(sqlca)
		dw_agente_buscar_agendadas.getchild('agente',idw_detalle5)
		idw_detalle5.settransobject(sqlca)
		if idw_detalle5.retrieve(ls_cod_sup)=0 then
			idw_detalle5.insertrow(0)
		end if
		dw_agente_buscar_agendadas.height				= 120
		dw_agente_buscar_agendadas.insertrow(0)
		dw_agente_buscar_agendadas.y						= 116
		dw_buscar_agendadas.height							= 1980

	else
		SELECT	"JEFE_VENTAS"."NOMBRE"  
		INTO 		:ls_nom_sup  
		FROM 		"JEFE_VENTAS"  
		WHERE  ( "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user ) AND  
				 ( "JEFE_VENTAS"."ESTADO" = 'A' )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			gb_1.height										  = 332
			rb_por_agente.text				   		= 'Por Superv'
			dw_agente_buscar_agendadas.dataobject 			= 'dwe_seleccionar_superv_y_agente_por_jefe'
			dw_agente_buscar_agendadas.settransobject(sqlca)
			dw_agente_buscar_agendadas.getchild('supervisor',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			dw_agente_buscar_agendadas.getchild('agente',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle2.retrieve(gs_user)=0 then
				idw_detalle2.insertrow(0)
			end if
			idw_detalle.insertrow(0)
			dw_agente_buscar_agendadas.height			= 244
			dw_agente_buscar_agendadas.insertrow(0)
			dw_buscar_agendadas.height						= 1800
			dw_buscar_agendadas.y							= 484
	else
			SELECT 	"ENCARGADOS"."NOMBRE"  
			INTO 		:ls_nom_sup  
			FROM 		"ENCARGADOS"  
			WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) AND  
					 ( "ENCARGADOS"."ESTADO" = 'A' )
			USING		sqlca;
		if sqlca.sqlcode=0 then
			gb_1.height										  = 332
			rb_por_agente.text				   		= 'Por Superv'
			dw_agente_buscar_agendadas.dataobject 			= 'dwe_seleccionar_superv_y_agente_todos'
			dw_agente_buscar_agendadas.settransobject(sqlca)
			dw_agente_buscar_agendadas.getchild('supervisor',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			dw_agente_buscar_agendadas.getchild('agente',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle2.retrieve()=0 then
				idw_detalle2.insertrow(0)
			end if
			idw_detalle.insertrow(0)
			dw_agente_buscar_agendadas.height			= 244
			dw_agente_buscar_agendadas.insertrow(0)
			dw_buscar_agendadas.height						= 1800
			dw_buscar_agendadas.y							= 484
			idw_detalle.insertrow(0)
			dw_agente_buscar_agendadas.height			= 244
			dw_agente_buscar_agendadas.insertrow(0)
			dw_buscar_agendadas.height						= 1800
			dw_buscar_agendadas.y							= 484
			end if
		end if
	end if 
	dw_buscar_agendadas.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_busca_gestion_agente)
end if

end event

type cb_4 from commandbutton within w_buscar_agendadas
integer x = 2935
integer y = 2368
integer width = 229
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_buscar_agendadas.rowcount() > 0 then 
	dw_buscar_agendadas.object.datawindow.Print.Preview	= true
	dw_buscar_agendadas.object.datawindow.zoom				= 90
	f_Print( dw_buscar_agendadas )
	dw_buscar_agendadas.object.datawindow.Print.Preview	= False
	dw_buscar_agendadas.object.datawindow.zoom				= 100
end if
end event

type cb_3 from commandbutton within w_buscar_agendadas
integer x = 2725
integer y = 2368
integer width = 206
integer height = 84
integer taborder = 80
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
dw_buscar_agendadas.SETfilter(ls_texto)
dw_buscar_agendadas.filter()
end event

type cb_5 from commandbutton within w_buscar_agendadas
integer x = 2478
integer y = 2368
integer width = 242
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_buscar_agendadas.SETSORT(NULO)
dw_buscar_agendadas.SORT()

end event

type cb_exportar from commandbutton within w_buscar_agendadas
integer x = 2231
integer y = 2368
integer width = 242
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_buscar_agendadas.rowcount() > 0 then
	f_DWToExcel( dw_buscar_agendadas)
end if
end event

type cb_aceptar from commandbutton within w_buscar_agendadas
integer x = 69
integer y = 2360
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String	ls_cod_age,ls_ciudad,ls_estado_reg
date		ldt_fecha_rep
long		ll_corr

if dw_buscar_agendadas.rowcount()>0 then
	if il_row>0 then
		ll_corr			= dw_buscar_agendadas.getitemnumber(il_row,'correlativo')
		ldt_fecha_rep	= date(dw_buscar_agendadas.getitemdatetime(il_row,'fecha_reporte'))
		ls_cod_age		= dw_buscar_agendadas.getitemstring(il_row,'cod_age')
		ls_ciudad		= dw_buscar_agendadas.getitemstring(il_row,'ciudad_contacto')
		if not isnull(ldt_fecha_rep) and not isnull(ls_cod_age) and ls_cod_age<>'' then
			if isvalid (w_informe_agente) then close (w_informe_agente)
			open(w_informe_agente)
			w_informe_agente.dw_informe_agente.getchild('comuna_contacto',idw_detalle3)
			idw_detalle3.settransobject(sqlca)
			idw_detalle3.retrieve(ls_ciudad)
			if	w_informe_agente.dw_informe_agente.retrieve(ls_cod_age,ldt_fecha_rep,ll_corr)>0 then
				w_informe_agente.dw_informe_agente.object.fecha_reporte.protect=1
				w_informe_agente.dw_informe_agente.object.p_3.visible = false
				ls_estado_reg		= w_informe_agente.dw_informe_agente.GetItemString(1,'estado_reg')
				if ls_estado_reg 	= 'I' then
					w_informe_agente.cb_borrar.enabled	= false
					w_informe_agente.cb_grabar.enabled	= false
					w_informe_agente.cb_limpiar.enabled	= false
				else
					if w_informe_agente.dw_informe_agente.getitemdatetime(1,'c_fecha_30_dias') <= w_informe_agente.dw_informe_agente.getitemdatetime(1,'fecha_prox_contacto') then
						w_informe_agente.cb_borrar.enabled	= false
						w_informe_agente.cb_grabar.enabled	= false
						w_informe_agente.cb_limpiar.enabled	= false
					else
						w_informe_agente.cb_borrar.enabled	= true
						w_informe_agente.cb_grabar.enabled	= true
						w_informe_agente.cb_limpiar.enabled	= true
					end if
				end if
			end if
		end if 
	end if
end if

end event

type cb_imprimir from commandbutton within w_buscar_agendadas
integer x = 649
integer y = 2360
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_buscar_agendadas.rowcount() > 0 then 
	dw_buscar_agendadas.object.datawindow.Print.Preview	= true
	dw_buscar_agendadas.object.datawindow.zoom				= 100
	f_Print( dw_buscar_agendadas )
	dw_buscar_agendadas.object.datawindow.Print.Preview	= False
	dw_buscar_agendadas.object.datawindow.zoom				= 100
end if
end event

type em_fec_fin from editmask within w_buscar_agendadas
integer x = 1056
integer y = 136
integer width = 357
integer height = 88
integer taborder = 20
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

event modified;dw_buscar_agendadas.reset()

end event

type st_2 from statictext within w_buscar_agendadas
integer x = 41
integer y = 144
integer width = 366
integer height = 72
integer textsize = -10
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

type em_fec_ini from editmask within w_buscar_agendadas
integer x = 425
integer y = 136
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_buscar_agendadas.reset()

end event

type p_ini from picture within w_buscar_agendadas
integer x = 786
integer y = 136
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type st_3 from statictext within w_buscar_agendadas
integer x = 873
integer y = 144
integer width = 169
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_fin from picture within w_buscar_agendadas
integer x = 1417
integer y = 136
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type dw_agente_buscar_agendadas from datawindow within w_buscar_agendadas
integer x = 1938
integer y = 116
integer width = 1495
integer height = 284
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_superv_y_agente_todos"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_sup,ls_nulo

Setnull(ls_nulo)
ls_columna		= dwo.name
dw_agente_buscar_agendadas.accepttext()
if dw_agente_buscar_agendadas.dataobject='dwe_seleccionar_superv_y_agente_por_jefe' or dw_agente_buscar_agendadas.dataobject='dwe_seleccionar_superv_y_agente_todos' then
	if ls_columna='supervisor' then
		ls_sup	= dw_agente_buscar_agendadas.getitemstring(1,'supervisor')
		dw_agente_buscar_agendadas.setitem(1,'agente',ls_nulo)
		idw_detalle.reset()
		idw_detalle.insertrow(0)
		idw_detalle.retrieve(ls_sup)
		dw_agente_buscar_agendadas.accepttext()
	end if
end if
dw_buscar_agendadas.reset()

end event

type pb_ok2 from picturebutton within w_buscar_agendadas
integer x = 4055
integer y = 96
integer width = 192
integer height = 152
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;datetime	ld_fec_ini,ld_fec_fin
Time		lt_ini=time('00:00:00'),lt_fin=time('23:59:59')
string	ls_cod_agente,ls_superv,ls_agente

ld_fec_ini													= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin													= datetime(date(em_fec_fin.text),lt_fin)

if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			if rb_por_agente.checked=true then
				if dw_agente_buscar_agendadas.dataobject 	= 'dwe_seleccionar_superv_y_agente_por_jefe' then
					ls_superv	= dw_agente_buscar_agendadas.getitemstring(1,'supervisor')
					ls_agente	= dw_agente_buscar_agendadas.getitemstring(1,'agente')
					
					if not isnull(ls_superv) and not isnull(ls_agente) then
						dw_buscar_agendadas.dataobject	= 'dw_busqueda_agendadas_super_y_agente'
						dw_buscar_agendadas.settransobject(sqlca)
						if dw_buscar_agendadas.retrieve(ld_fec_ini,ld_fec_fin,ls_agente,ls_superv)=0 then
							messagebox("Advertencia","No registra Dato")
						end if
					elseif not isnull(ls_superv) and isnull(ls_agente) then
						dw_buscar_agendadas.dataobject	= 'dw_busqueda_agendadas_por_sup'
						dw_buscar_agendadas.settransobject(sqlca)
						if dw_buscar_agendadas.retrieve(ld_fec_ini,ld_fec_fin,ls_superv)=0 then
							messagebox("Advertencia","No registra Dato")
						end if
					else
						messagebox("Advertencia","Debe Seleccionar Supervisor")
					end if
				elseif dw_agente_buscar_agendadas.dataobject	= 'dwe_seleccionar_agente_por_supervisor' then
					ls_agente	= dw_agente_buscar_agendadas.getitemstring(1,'agente')
					if not isnull(ls_agente) then
						dw_buscar_agendadas.dataobject	= 'dw_busqueda_agendadas'
						dw_buscar_agendadas.settransobject(sqlca)
						if dw_buscar_agendadas.retrieve(ld_fec_ini,ld_fec_fin,ls_agente)=0 then
							messagebox("Advertencia","No registra Dato")
						end if
					else
						messagebox("Advertencia","Debe Seleccionar Agente")
					end if
				end if			
			elseif rb_todos.checked=true then
				if gs_depto='R' or gs_depto='B' then
					dw_buscar_agendadas.dataobject = 'dw_busqueda_agendadas_todos_restric'
				else
					dw_buscar_agendadas.dataobject = 'dw_busqueda_agendadas_todos'
				end if
				dw_buscar_agendadas.settransobject(sqlca)
				if dw_buscar_agendadas.retrieve(ld_fec_ini,ld_fec_fin,gs_user)=0 then
					messagebox("Advertencia","No Registra Dato")
				end if
			end if
		end if
	end if
end if

end event

type rb_por_agente from radiobutton within w_buscar_agendadas
integer x = 1568
integer y = 148
integer width = 384
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Agente"
boolean checked = true
end type

event clicked;dw_buscar_agendadas.reset()
dw_agente_buscar_agendadas.enabled = true
end event

type rb_todos from radiobutton within w_buscar_agendadas
integer x = 3456
integer y = 148
integer width = 567
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos los Agentes"
end type

event clicked;dw_buscar_agendadas.reset()
dw_agente_buscar_agendadas.reset()
dw_agente_buscar_agendadas.insertrow(0)
dw_agente_buscar_agendadas.enabled = false

end event

type dw_buscar_agendadas from datawindow within w_buscar_agendadas
integer x = 69
integer y = 320
integer width = 4174
integer height = 1860
integer taborder = 50
string title = "none"
string dataobject = "dw_busqueda_agendadas_todos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row > 0 then 
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

event clicked;String	ls_columna,ls_filtro

this.accepttext()
ls_columna	= dwo.name
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	if ls_columna='t_blanco' or ls_columna='t_blanco_t' then
		ls_filtro	= 'estado_reg = "A"'
		dw_buscar_agendadas.SETfilter(ls_filtro)
		dw_buscar_agendadas.filter()
	elseif ls_columna='t_rojo' or ls_columna='t_rojo_t' then
		ls_filtro	= 'estado_reg = "I"'
		dw_buscar_agendadas.SETfilter(ls_filtro)
		dw_buscar_agendadas.filter()
	elseif ls_columna='t_mostrar_todo' then
		ls_filtro	= ''
		dw_buscar_agendadas.SETfilter(ls_filtro)
		dw_buscar_agendadas.filter()
	end if
end if

if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_limpiar from commandbutton within w_buscar_agendadas
integer x = 1230
integer y = 2360
integer width = 402
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long		ll_resp
datetime	ldt_fecha_hoy 

ll_resp				= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then

	dw_agente_buscar_agendadas.reset()
	dw_buscar_agendadas.reset()
	dw_agente_buscar_agendadas.InsertRow(0)
	//dw_buscar_agendadas.InsertRow(0)
	em_fec_ini.text = string(gdt_fec_sistema,'dd/mm/yyyy')
	em_fec_fin.text = string(gdt_fec_sistema,'dd/mm/yyyy')
end if	
end event

type cb_cerrar from commandbutton within w_buscar_agendadas
integer x = 3840
integer y = 2352
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_agendadas)
end event

type gb_1 from groupbox within w_buscar_agendadas
integer x = 1531
integer y = 56
integer width = 2510
integer height = 228
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Opción"
end type

type gb_2 from groupbox within w_buscar_agendadas
integer x = 2208
integer y = 2320
integer width = 983
integer height = 156
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

