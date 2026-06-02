forward
global type w_revision_vsp from window
end type
type em_fec_ini from statictext within w_revision_vsp
end type
type rb_por_supervisor from radiobutton within w_revision_vsp
end type
type rb_todos from radiobutton within w_revision_vsp
end type
type p_fin from picture within w_revision_vsp
end type
type dw_sup from datawindow within w_revision_vsp
end type
type pb_aceptar from picturebutton within w_revision_vsp
end type
type em_fec_fin from editmask within w_revision_vsp
end type
type st_2 from statictext within w_revision_vsp
end type
type st_1 from statictext within w_revision_vsp
end type
type cb_imprimir from commandbutton within w_revision_vsp
end type
type dw_simulacion_clasificacion from datawindow within w_revision_vsp
end type
type cb_cerrar from commandbutton within w_revision_vsp
end type
type gb_1 from groupbox within w_revision_vsp
end type
end forward

global type w_revision_vsp from window
integer width = 4009
integer height = 2356
boolean titlebar = true
string title = "Simulación por Clasificación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
em_fec_ini em_fec_ini
rb_por_supervisor rb_por_supervisor
rb_todos rb_todos
p_fin p_fin
dw_sup dw_sup
pb_aceptar pb_aceptar
em_fec_fin em_fec_fin
st_2 st_2
st_1 st_1
cb_imprimir cb_imprimir
dw_simulacion_clasificacion dw_simulacion_clasificacion
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_revision_vsp w_revision_vsp

type variables
Long	il_row
end variables

on w_revision_vsp.create
this.em_fec_ini=create em_fec_ini
this.rb_por_supervisor=create rb_por_supervisor
this.rb_todos=create rb_todos
this.p_fin=create p_fin
this.dw_sup=create dw_sup
this.pb_aceptar=create pb_aceptar
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.st_1=create st_1
this.cb_imprimir=create cb_imprimir
this.dw_simulacion_clasificacion=create dw_simulacion_clasificacion
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.em_fec_ini,&
this.rb_por_supervisor,&
this.rb_todos,&
this.p_fin,&
this.dw_sup,&
this.pb_aceptar,&
this.em_fec_fin,&
this.st_2,&
this.st_1,&
this.cb_imprimir,&
this.dw_simulacion_clasificacion,&
this.cb_cerrar,&
this.gb_1}
end on

on w_revision_vsp.destroy
destroy(this.em_fec_ini)
destroy(this.rb_por_supervisor)
destroy(this.rb_todos)
destroy(this.p_fin)
destroy(this.dw_sup)
destroy(this.pb_aceptar)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_imprimir)
destroy(this.dw_simulacion_clasificacion)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;String	ls_nom_jefe,ls_ap_pat_jefe,ls_ap_mat_jefe,ls_cod_jefe,ls_fecha,ls_fecha2
Date		ldt_fecha_antes,ldt_fecha_hoy,ldt_fecha_fin,ldt_fecha_ini
Long		ll_cuotas,ll_mes,ll_anno,ll_dia,ll_mes2,ll_anno2,ll_dia2

gf_centrar(w_revision_vsp)
dw_simulacion_clasificacion.settransobject(sqlca)
ll_mes  = month(date(gdt_fec_sistema))
ll_anno = year(date(gdt_fec_sistema))
if ll_mes = 1 then
	ls_fecha	= '31/'+ string(ll_mes,'00')+ '/' +string(ll_anno,'0000')
elseif ll_mes = 2 then
	if ll_anno/4 = int(ll_anno/4) then
		ls_fecha	= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	else 
		ls_fecha	= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	end if
elseif ll_mes = 3 then
	ls_fecha	= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 4 then
	ls_fecha	= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 5 then
	ls_fecha	= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 6 then
	ls_fecha	= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 7 then
	ls_fecha	= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 8 then
	ls_fecha	= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 9 then
	ls_fecha	= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 10 then
	ls_fecha	= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 11 then
	ls_fecha	= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 12 then
	ls_fecha	= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
end if

em_fec_fin.text 	= string(ls_fecha) 
ldt_fecha_fin	 	= date(em_fec_fin.text)
ll_dia2    			= day(ldt_fecha_fin)
ll_mes2    			= month(ldt_fecha_fin) 
ll_anno2   			= year(ldt_fecha_fin)
ll_mes2   			= ll_mes2 - 6

if ll_mes2 <= 0 then
	ll_anno2  = ll_anno2 - 1
	if ll_mes2  	 = 6 then
		ll_mes2  = 12
	elseif ll_mes2  = 5 then
		ll_mes2  = 11
	elseif ll_mes2  = 4 then
		ll_mes2  = 10
	elseif ll_mes2  = 3 then
		ll_mes2  = 9
	elseif ll_mes2  = 2 then
		ll_mes2  = 8
	elseif ll_mes2  = 1 then
		ll_mes2  = 7
	end if
end if

ls_fecha2 			= string(ll_dia2,'00') +'/'+ string(ll_mes2,'00') +'/'+ string(ll_anno2,'0000')
em_fec_ini.text	= string(ls_fecha2)
ldt_fecha_ini		= date(em_fec_ini.text)

if gs_depto='G' or gs_depto='I' or gs_depto ='R' or gs_depto ='B' then
	ldt_fecha_hoy	= date(gdt_fec_sistema)
		SELECT	DISTINCT "JEFE_VENTAS"."NOMBRE",	"JEFE_VENTAS"."A_PATERNO",	"JEFE_VENTAS"."A_MATERNO", "JEFE_VENTAS"."JEFE_VENTAS"
		INTO					:ls_nom_jefe,				:ls_ap_pat_jefe,				:ls_ap_mat_jefe,				:ls_cod_jefe
		FROM 		"ENCARGADOS",         "JEFE_VENTAS"  
		WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "JEFE_VENTAS"."USUARIO_ENCARGADO" ) and  
				 (("ENCARGADOS"."ESTADO" = 'A' ) AND  
				 ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   
		ORDER BY "JEFE_VENTAS"."JEFE_VENTAS" ASC
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_sup.dataobject	= 'dwe_seleccionar_superv_por_jefe'
			dw_sup.settransobject(sqlca)
			dw_sup.getchild('cod_sup',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(ls_cod_jefe,ldt_fecha_ini,ldt_fecha_fin)=0 then
				idw_detalle.insertrow(0)
			end if
			rb_por_supervisor.text = 'supervisor'
			dw_sup.insertrow(0)
		else
			SELECT  DISTINCT "SUPERVISOR"."NOMBRE",   "SUPERVISOR"."A_PATERNO",   "SUPERVISOR"."A_MATERNO",	"SUPERVISOR"."COD_SUP"
			INTO					:ls_nom_jefe,				:ls_ap_pat_jefe,				:ls_ap_mat_jefe,				:ls_cod_jefe
			FROM 		"SUPERVISOR"  
			WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_sup.dataobject	= 'dwe_seleccionar_agente_por_supervisor_nf'
				dw_sup.settransobject(sqlca)
				dw_sup.getchild('cod_sup',idw_detalle)
				idw_detalle.settransobject(sqlca)
				if idw_detalle.retrieve(ls_cod_jefe,ldt_fecha_ini,ldt_fecha_fin)=0 then
					idw_detalle.insertrow(0)
				end if
				rb_por_supervisor.text			= 'Agente'
				dw_sup.insertrow(0)
			else
				dw_sup.dataobject	= 'dwe_seleccionar_superv_para_todos'
				dw_sup.settransobject(sqlca)
				dw_sup.getchild('cod_sup',idw_detalle)
				idw_detalle.settransobject(sqlca)
				if idw_detalle.retrieve(ldt_fecha_ini,ldt_fecha_fin)=0 then
					idw_detalle.insertrow(0)
				end if
				rb_por_supervisor.text = 'supervisor'
				dw_sup.insertrow(0)
			end if
		end if
	gs_ventana	= 'w_revision_vsp'
	f_valida_objeto2()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_revision_vsp)
end if
em_fec_fin.triggerevent(modified!)
end event

type em_fec_ini from statictext within w_revision_vsp
integer x = 347
integer y = 56
integer width = 375
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_por_supervisor from radiobutton within w_revision_vsp
integer x = 882
integer y = 140
integer width = 425
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por Supervisor"
boolean checked = true
end type

event clicked;dw_simulacion_clasificacion.reset()
dw_sup.enabled = true
end event

type rb_todos from radiobutton within w_revision_vsp
integer x = 2885
integer y = 132
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

event clicked;dw_sup.reset()
dw_sup.insertrow(0)
dw_simulacion_clasificacion.reset()
dw_sup.enabled = false
end event

type p_fin from picture within w_revision_vsp
integer x = 731
integer y = 160
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech

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
	IF DATE(Message.StringParm) < DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text	= Message.StringParm
		em_fec_fin.triggerevent(modified!)
	end if	
END IF
end event

type dw_sup from datawindow within w_revision_vsp
integer x = 1326
integer y = 128
integer width = 1381
integer height = 108
integer taborder = 20
string title = "none"
string dataobject = "dwe_seleccionar_agente_por_supervisor_nf"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_simulacion_clasificacion.reset()
end event

type pb_aceptar from picturebutton within w_revision_vsp
integer x = 3707
integer y = 92
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no.bmp"
end type

event clicked;date		ld_fec_ini,ld_fec_fin
String	ls_cod_sup,ls_fecha_ini

//ls_fecha_ini	= string(em_fec_ini.text)
ld_fec_ini		= date(em_fec_ini.text)
ld_fec_fin		= date(em_fec_fin.text)
if ld_fec_ini>ld_fec_fin or isnull(ld_fec_ini) or isnull(ld_fec_fin) then
	messagebox("Advertencia","Rango de Fecha Inválida")
else
	if rb_por_supervisor.checked=true then
		ls_cod_sup	= dw_sup.getitemstring(1,'cod_sup')
		if not isnull(ls_cod_sup) and ls_cod_sup<>'' then
			dw_simulacion_clasificacion.dataobject	= 'dw_revision_promesas'
			dw_simulacion_clasificacion.settransobject(sqlca)
			if dw_simulacion_clasificacion.retrieve(ld_fec_ini,ld_fec_fin,ls_cod_sup,gs_user)=0 then 
			messagebox("Advertencia","No Registra datos")
			end if
		end if		
	elseif rb_todos.checked=true then
		dw_simulacion_clasificacion.dataobject	= 'dw_revision_promesas_todos'
		dw_simulacion_clasificacion.settransobject(sqlca)
		if dw_simulacion_clasificacion.retrieve(ld_fec_ini,ld_fec_fin,gs_user,gs_user)=0 then
			messagebox("Advertencia","No Registra datos")
		end if
	end if
end if
end event

type em_fec_fin from editmask within w_revision_vsp
integer x = 347
integer y = 160
integer width = 375
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 700
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

event modified;String	ls_fecha2
date		ldt_fecha_fin
Long		ll_dia2,ll_mes2,ll_anno2

dw_simulacion_clasificacion.reset()

ldt_fecha_fin	 	= date(em_fec_fin.text)
ll_dia2    			= day(ldt_fecha_fin)
ll_mes2    			= month(ldt_fecha_fin) 
ll_anno2   			= year(ldt_fecha_fin)
ll_mes2   			= ll_mes2 - 6
if ll_mes2 <= 0 then
	ll_anno2			= ll_anno2 - 1
	if ll_mes2 = 0 then
		ll_mes2  	= 12
	elseif ll_mes2 = -1 then
		ll_mes2  	= 11
	elseif ll_mes2 = -2 then
		ll_mes2  	= 10
	elseif ll_mes2 = -3 then
		ll_mes2 		= 9
	elseif ll_mes2 = -4 then
		ll_mes2  	= 8
	elseif ll_mes2 = -5 then
		ll_mes2  	= 7
	end if
end if
if (ll_mes2 = 1 or ll_mes2 = 3 or ll_mes2 = 5 or ll_mes2 = 7 or ll_mes2 = 8 or ll_mes2 = 10 or ll_mes2 = 12) and ll_dia2 >= 30 then
	ls_fecha2		= '31/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
elseif ll_mes2 = 2 and ll_dia2 >= 28 then
	if ll_anno2/4 = int(ll_anno2/4) then
		ls_fecha2	= '29/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
	else 
		ls_fecha2	= '28/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
	end if
elseif (ll_mes2 = 4 or ll_mes2 = 6 or ll_mes2 = 9 or ll_mes2 = 11) and ll_dia2 >= 30 then
	ls_fecha2		= '30/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
else
	ls_fecha2		= string(ll_dia2,'00')+'/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
end if
em_fec_ini.text	= string(ls_fecha2)



end event

type st_2 from statictext within w_revision_vsp
integer x = 178
integer y = 176
integer width = 160
integer height = 56
integer textsize = -8
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

type st_1 from statictext within w_revision_vsp
integer x = 27
integer y = 72
integer width = 315
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_revision_vsp
integer x = 41
integer y = 2072
integer width = 375
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_simulacion_clasificacion.rowcount() > 0 then 
	dw_simulacion_clasificacion.object.datawindow.zoom				= 88
	f_Print( dw_simulacion_clasificacion )
	dw_simulacion_clasificacion.object.datawindow.zoom				= 100
end if


end event

type dw_simulacion_clasificacion from datawindow within w_revision_vsp
integer x = 41
integer y = 296
integer width = 3899
integer height = 1740
integer taborder = 40
string title = "none"
string dataobject = "dw_revision_promesas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_cerrar from commandbutton within w_revision_vsp
integer x = 3579
integer y = 2072
integer width = 361
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_revision_vsp)
end event

type gb_1 from groupbox within w_revision_vsp
integer x = 859
integer y = 56
integer width = 2825
integer height = 208
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

