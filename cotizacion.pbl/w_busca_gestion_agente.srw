forward
global type w_busca_gestion_agente from window
end type
type cb_aceptar from commandbutton within w_busca_gestion_agente
end type
type rb_todos from radiobutton within w_busca_gestion_agente
end type
type rb_por_agente from radiobutton within w_busca_gestion_agente
end type
type cb_limpiar from commandbutton within w_busca_gestion_agente
end type
type pb_ok2 from picturebutton within w_busca_gestion_agente
end type
type dw_agente_buscar from datawindow within w_busca_gestion_agente
end type
type cb_exportar from commandbutton within w_busca_gestion_agente
end type
type cb_5 from commandbutton within w_busca_gestion_agente
end type
type cb_3 from commandbutton within w_busca_gestion_agente
end type
type cb_4 from commandbutton within w_busca_gestion_agente
end type
type p_fin from picture within w_busca_gestion_agente
end type
type st_3 from statictext within w_busca_gestion_agente
end type
type p_ini from picture within w_busca_gestion_agente
end type
type em_fec_ini from editmask within w_busca_gestion_agente
end type
type st_2 from statictext within w_busca_gestion_agente
end type
type em_fec_fin from editmask within w_busca_gestion_agente
end type
type dw_busqueda_gestion_agente from datawindow within w_busca_gestion_agente
end type
type cb_cerrar from commandbutton within w_busca_gestion_agente
end type
type gb_2 from groupbox within w_busca_gestion_agente
end type
type gb_1 from groupbox within w_busca_gestion_agente
end type
end forward

global type w_busca_gestion_agente from window
integer width = 4622
integer height = 2368
boolean titlebar = true
string title = "Gestión Agente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_aceptar cb_aceptar
rb_todos rb_todos
rb_por_agente rb_por_agente
cb_limpiar cb_limpiar
pb_ok2 pb_ok2
dw_agente_buscar dw_agente_buscar
cb_exportar cb_exportar
cb_5 cb_5
cb_3 cb_3
cb_4 cb_4
p_fin p_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
em_fec_fin em_fec_fin
dw_busqueda_gestion_agente dw_busqueda_gestion_agente
cb_cerrar cb_cerrar
gb_2 gb_2
gb_1 gb_1
end type
global w_busca_gestion_agente w_busca_gestion_agente

on w_busca_gestion_agente.create
this.cb_aceptar=create cb_aceptar
this.rb_todos=create rb_todos
this.rb_por_agente=create rb_por_agente
this.cb_limpiar=create cb_limpiar
this.pb_ok2=create pb_ok2
this.dw_agente_buscar=create dw_agente_buscar
this.cb_exportar=create cb_exportar
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_4=create cb_4
this.p_fin=create p_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.dw_busqueda_gestion_agente=create dw_busqueda_gestion_agente
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_aceptar,&
this.rb_todos,&
this.rb_por_agente,&
this.cb_limpiar,&
this.pb_ok2,&
this.dw_agente_buscar,&
this.cb_exportar,&
this.cb_5,&
this.cb_3,&
this.cb_4,&
this.p_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.em_fec_fin,&
this.dw_busqueda_gestion_agente,&
this.cb_cerrar,&
this.gb_2,&
this.gb_1}
end on

on w_busca_gestion_agente.destroy
destroy(this.cb_aceptar)
destroy(this.rb_todos)
destroy(this.rb_por_agente)
destroy(this.cb_limpiar)
destroy(this.pb_ok2)
destroy(this.dw_agente_buscar)
destroy(this.cb_exportar)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.p_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.dw_busqueda_gestion_agente)
destroy(this.cb_cerrar)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;string    ls_cod_sup, ls_nom_sup, ls_ap_pat_sup, ls_ap_mat_sup
datetime  ldt_fecha_hoy
long      ll_new


em_fec_ini.text = string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text = string(gdt_fec_sistema,'dd/mm/yyyy')

gf_centrar(w_busca_gestion_agente)
dw_busqueda_gestion_agente.settransobject(sqlca)
dw_agente_buscar.settransobject(sqlca)

if gs_depto ='R'	or gs_depto ='B' or gs_user = 'SORTIZ'	then
	
	SELECT DISTINCT "SUPERVISOR"."NOMBRE", "SUPERVISOR"."A_PATERNO", "SUPERVISOR"."A_MATERNO", "SUPERVISOR"."COD_SUP"
	INTO   			:ls_nom_sup, 				:ls_ap_pat_sup,           :ls_ap_mat_sup,           :ls_cod_sup
	FROM   	"ENCARGADOS", "SUPERVISOR"  
	WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "SUPERVISOR"."COD_SUP" ) and  
			 (("ENCARGADOS"."ESTADO" = 'A' ) AND  
			 ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   
	ORDER BY "SUPERVISOR"."COD_SUP" ASC
	USING              sqlca;
	if sqlca.sqlcode=0 then
		gb_1.height										= 212
		rb_por_agente.text							= 'Por Agente'
		dw_agente_buscar.dataobject 				= 'dwe_seleccionar_agente_por_supervisor'
		dw_agente_buscar.settransobject(sqlca)
		dw_agente_buscar.getchild('agente',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ls_cod_sup)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_agente_buscar.height						= 116
		dw_agente_buscar.insertrow(0)
		dw_busqueda_gestion_agente.y				= 276
		dw_busqueda_gestion_agente.height		= 1752
	else
		SELECT	"JEFE_VENTAS"."NOMBRE"  
		INTO 		:ls_nom_sup  
		FROM 		"JEFE_VENTAS"  
		WHERE  ( "JEFE_VENTAS"."JEFE_VENTAS" = :gs_user ) AND  
				 ( "JEFE_VENTAS"."ESTADO" = 'A' )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			gb_1.height									= 340
			rb_por_agente.text						= 'Por Superv'
			dw_agente_buscar.dataobject 			= 'dwe_seleccionar_superv_y_agente_por_jefe'
			dw_agente_buscar.settransobject(sqlca)
			dw_agente_buscar.getchild('supervisor',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			dw_agente_buscar.getchild('agente',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle2.retrieve(gs_user)=0 then
				idw_detalle2.insertrow(0)
			end if
			idw_detalle.insertrow(0)
			dw_agente_buscar.height					= 240
			dw_agente_buscar.insertrow(0)
			dw_busqueda_gestion_agente.height	= 1648
			dw_busqueda_gestion_agente.y			= 380
		else
			SELECT 	"ENCARGADOS"."NOMBRE"  
			INTO 		:ls_nom_sup  
			FROM 		"ENCARGADOS"  
			WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) AND  
					 ( "ENCARGADOS"."ESTADO" = 'A' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				gb_1.height									= 340
				rb_por_agente.text						= 'Por Superv'
				dw_agente_buscar.dataobject 			= 'dwe_seleccionar_superv_y_agente_todos'
				dw_agente_buscar.settransobject(sqlca)
				dw_agente_buscar.getchild('supervisor',idw_detalle2)
				idw_detalle2.settransobject(sqlca)
				dw_agente_buscar.getchild('agente',idw_detalle)
				idw_detalle.settransobject(sqlca)
				if idw_detalle2.retrieve()=0 then
					idw_detalle2.insertrow(0)
				end if
				idw_detalle.insertrow(0)
				dw_agente_buscar.height					= 240
				dw_agente_buscar.insertrow(0)
				dw_busqueda_gestion_agente.height	= 1648
				dw_busqueda_gestion_agente.y			= 380
			end if
		end if
	end if
	dw_agente_buscar.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_busca_gestion_agente)
end if 
end event

type cb_aceptar from commandbutton within w_busca_gestion_agente
integer x = 69
integer y = 2092
integer width = 402
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_fila,ll_corr
String	ls_cod_age,ls_ciudad,ls_estado_reg
date		ldt_fecha_rep


if dw_busqueda_gestion_agente.rowcount()>0 then
	ll_fila	= dw_busqueda_gestion_agente.getrow()
	if ll_fila>0 then
		ll_corr			= dw_busqueda_gestion_agente.getitemnumber(ll_fila,'correlativo')
		ldt_fecha_rep	= date(dw_busqueda_gestion_agente.getitemdatetime(ll_fila,'fecha_reporte'))
		ls_cod_age		= dw_busqueda_gestion_agente.getitemstring(ll_fila,'cod_age')
		ls_ciudad		= dw_busqueda_gestion_agente.getitemstring(ll_fila,'ciudad_contacto')
		if not isnull(ldt_fecha_rep) and not isnull(ls_cod_age) and ls_cod_age<>'' then
			if isvalid(w_informe_agente) then close(w_informe_agente)
			open(w_informe_agente)
			if w_informe_agente.dw_informe_agente.retrieve(ls_cod_age,ldt_fecha_rep,ll_corr)>0 then
				w_informe_agente.dw_informe_agente.object.fecha_reporte.protect=1
				w_informe_agente.dw_informe_agente.object.p_3.visible = false
				w_informe_agente.dw_informe_agente.getchild('comuna_contacto',idw_detalle3)
				idw_detalle3.settransobject(sqlca)
				idw_detalle3.retrieve(ls_ciudad)
				if	w_informe_agente.dw_informe_agente.retrieve(ls_cod_age,ldt_fecha_rep,ll_corr)>0 then
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
end if
			

end event

type rb_todos from radiobutton within w_busca_gestion_agente
integer x = 3584
integer y = 108
integer width = 617
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

event clicked;//dw_agente_buscar.reset()
dw_agente_buscar.insertrow(0)
dw_busqueda_gestion_agente.reset()
dw_agente_buscar.enabled = false
end event

type rb_por_agente from radiobutton within w_busca_gestion_agente
integer x = 1609
integer y = 108
integer width = 389
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

event clicked;dw_agente_buscar.enabled = true
dw_busqueda_gestion_agente.reset()
dw_agente_buscar.setfocus()
end event

type cb_limpiar from commandbutton within w_busca_gestion_agente
integer x = 635
integer y = 2092
integer width = 402
integer height = 112
integer taborder = 110
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

	dw_busqueda_gestion_agente.reset()
	dw_agente_buscar.reset()
	//dw_busqueda_gestion_agente.InsertRow(0)
	dw_agente_buscar.InsertRow(0)
	em_fec_ini.text = string(gdt_fec_sistema,'dd/mm/yyyy')
	em_fec_fin.text = string(gdt_fec_sistema,'dd/mm/yyyy')
end if	
end event

type pb_ok2 from picturebutton within w_busca_gestion_agente
integer x = 4352
integer y = 60
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
dw_busqueda_gestion_agente.reset()
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
				if dw_agente_buscar.dataobject 	= 'dwe_seleccionar_superv_y_agente_por_jefe' then
					dw_agente_buscar.accepttext()
					ls_superv	= dw_agente_buscar.getitemstring(1,'supervisor')
					ls_agente	= dw_agente_buscar.getitemstring(1,'agente')
					if not isnull(ls_superv) and not isnull(ls_agente) then
						dw_busqueda_gestion_agente.dataobject	= 'dw_busqueda_gestion_agente_y_super'
						dw_busqueda_gestion_agente.settransobject(sqlca)
						if dw_busqueda_gestion_agente.retrieve(ld_fec_ini,ld_fec_fin,ls_agente,ls_superv)=0 then
							messagebox("Advertencia","No registra Dato")
						end if
					
					elseif not isnull(ls_superv) and isnull(ls_agente) then
						dw_busqueda_gestion_agente.dataobject	= 'dw_busqueda_gestion_sup'
						dw_busqueda_gestion_agente.settransobject(sqlca)
						if dw_busqueda_gestion_agente.retrieve(ld_fec_ini,ld_fec_fin,ls_superv)=0 then
							messagebox("Advertencia","No registra Dato")
						end if
					else
						messagebox("Advertencia","Debe Seleccionar Supervisor")
					end if
			else 
				dw_busqueda_gestion_agente.dataobject	= 'dwe_seleccionar_agente_por_supervisor'
				dw_agente_buscar.accepttext()
				ls_agente	= dw_agente_buscar.getitemstring(1,'agente')
				if not isnull(ls_agente) then
					dw_busqueda_gestion_agente.dataobject	= 'dw_busqueda_gestion_agente'
					dw_busqueda_gestion_agente.settransobject(sqlca)
					if dw_busqueda_gestion_agente.retrieve(ld_fec_ini,ld_fec_fin,ls_agente)=0 then
						messagebox("Advertencia","No registra Dato")
					end if
				else
					messagebox("Advertencia","Debe Seleccionar Agente")
				end if
			end if
				
		elseif rb_por_agente.checked=true then
				ls_cod_agente	= dw_agente_buscar.getitemstring(1,'agente')
				if	not isnull(ls_cod_agente) and ls_cod_agente<>'' then
					dw_busqueda_gestion_agente.dataobject	= 'dw_busqueda_gestion_agente'
					dw_busqueda_gestion_agente.settransobject(sqlca)
					if dw_busqueda_gestion_agente.retrieve(ld_fec_ini,ld_fec_fin,ls_cod_agente)=0 then
						messagebox("Advertencia","No Registra Dato")
					end if
				else
					messagebox("Advertencia","Debe Seleccionar AGENTE")
					dw_agente_buscar.setfocus()
				end if
			elseif rb_todos.checked=true then
				if gs_depto='R' or gs_depto='B' then
					dw_busqueda_gestion_agente.dataobject	= 'dw_busqueda_gestion_agente_restric'
				elseif gs_user='SORTIZ' THEN
					dw_busqueda_gestion_agente.dataobject	= 'dw_busqueda_gestion_agente_todos'
				end if 
					dw_busqueda_gestion_agente.settransobject(sqlca)
				if dw_busqueda_gestion_agente.retrieve(ld_fec_ini,ld_fec_fin,gs_user)=0 then
					messagebox("Advertencia","No Registra Dato")
				end if
			end if
		end if
	end if
end if
end event

type dw_agente_buscar from datawindow within w_busca_gestion_agente
integer x = 1993
integer y = 92
integer width = 1563
integer height = 240
integer taborder = 30
string title = "none"
string dataobject = "dwe_seleccionar_superv_y_agente_todos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_sup,ls_nulo

Setnull(ls_nulo)
ls_columna		= dwo.name
dw_agente_buscar.accepttext()
if dw_agente_buscar.dataobject='dwe_seleccionar_superv_y_agente_por_jefe' or dw_agente_buscar.dataobject='dwe_seleccionar_superv_y_agente_todos' then
	if ls_columna='supervisor' then
		ls_sup	= dw_agente_buscar.getitemstring(1,'supervisor')
		dw_agente_buscar.setitem(1,'agente',ls_nulo)
		idw_detalle.reset()
		idw_detalle.insertrow(0)
		idw_detalle.retrieve(ls_sup)
		dw_agente_buscar.accepttext()
	end if
end if
dw_busqueda_gestion_agente.reset()

end event

type cb_exportar from commandbutton within w_busca_gestion_agente
integer x = 2066
integer y = 2100
integer width = 242
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_busqueda_gestion_agente.rowcount() > 0 then
	f_DWToExcel( dw_busqueda_gestion_agente)
end if
end event

type cb_5 from commandbutton within w_busca_gestion_agente
integer x = 2313
integer y = 2100
integer width = 242
integer height = 84
integer taborder = 80
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
dw_busqueda_gestion_agente.SETSORT(NULO)
dw_busqueda_gestion_agente.SORT()

end event

type cb_3 from commandbutton within w_busca_gestion_agente
integer x = 2560
integer y = 2100
integer width = 206
integer height = 84
integer taborder = 90
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
dw_busqueda_gestion_agente.SETfilter(ls_texto)
dw_busqueda_gestion_agente.filter()
end event

type cb_4 from commandbutton within w_busca_gestion_agente
integer x = 2770
integer y = 2100
integer width = 229
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_busqueda_gestion_agente.rowcount() > 0 then 
	dw_busqueda_gestion_agente.object.datawindow.Print.Preview	= true
	dw_busqueda_gestion_agente.object.datawindow.zoom				= 90
	f_Print( dw_busqueda_gestion_agente )
	dw_busqueda_gestion_agente.object.datawindow.Print.Preview	= False
	dw_busqueda_gestion_agente.object.datawindow.zoom				= 100
end if
end event

type p_fin from picture within w_busca_gestion_agente
integer x = 1426
integer y = 96
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
		dw_busqueda_gestion_agente.reset()
	end if	
END IF
end event

type st_3 from statictext within w_busca_gestion_agente
integer x = 873
integer y = 104
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

type p_ini from picture within w_busca_gestion_agente
integer x = 786
integer y = 96
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
		dw_busqueda_gestion_agente.reset()
	end if	
END IF
end event

type em_fec_ini from editmask within w_busca_gestion_agente
integer x = 425
integer y = 96
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_busqueda_gestion_agente.reset()
end event

type st_2 from statictext within w_busca_gestion_agente
integer x = 41
integer y = 104
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

type em_fec_fin from editmask within w_busca_gestion_agente
integer x = 1065
integer y = 96
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

event modified;dw_busqueda_gestion_agente.reset()
end event

type dw_busqueda_gestion_agente from datawindow within w_busca_gestion_agente
integer x = 59
integer y = 276
integer width = 4485
integer height = 1752
integer taborder = 50
string title = "none"
string dataobject = "dw_busqueda_gestion_agente_restric"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event itemfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event doubleclicked;if row > 0 then 
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
		dw_busqueda_gestion_agente.SETfilter(ls_filtro)
		dw_busqueda_gestion_agente.filter()
	elseif ls_columna='t_rojo' or ls_columna='t_rojo_t' then
		ls_filtro	= 'estado_reg = "I"'
		dw_busqueda_gestion_agente.SETfilter(ls_filtro)
		dw_busqueda_gestion_agente.filter()
	elseif ls_columna='t_mostrar_todo' then
		ls_filtro	= ''
		dw_busqueda_gestion_agente.SETfilter(ls_filtro)
		dw_busqueda_gestion_agente.filter()
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_cerrar from commandbutton within w_busca_gestion_agente
integer x = 4142
integer y = 2092
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_busca_gestion_agente)
end event

type gb_2 from groupbox within w_busca_gestion_agente
integer x = 2043
integer y = 2052
integer width = 983
integer height = 156
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

type gb_1 from groupbox within w_busca_gestion_agente
integer x = 1573
integer y = 16
integer width = 2674
integer height = 212
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

