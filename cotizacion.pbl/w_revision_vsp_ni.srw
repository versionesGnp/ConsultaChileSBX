forward
global type w_revision_vsp_ni from window
end type
type rb_todos from radiobutton within w_revision_vsp_ni
end type
type rb_por_agente from radiobutton within w_revision_vsp_ni
end type
type p_fin from picture within w_revision_vsp_ni
end type
type st_1 from statictext within w_revision_vsp_ni
end type
type st_2 from statictext within w_revision_vsp_ni
end type
type em_fec_fin from editmask within w_revision_vsp_ni
end type
type pb_aceptar from picturebutton within w_revision_vsp_ni
end type
type dw_age from datawindow within w_revision_vsp_ni
end type
type em_fec_ini from statictext within w_revision_vsp_ni
end type
type dw_simulacion_clasificacion_ni from datawindow within w_revision_vsp_ni
end type
type cb_cerrar from commandbutton within w_revision_vsp_ni
end type
type cb_imprimir from commandbutton within w_revision_vsp_ni
end type
type gb_1 from groupbox within w_revision_vsp_ni
end type
end forward

global type w_revision_vsp_ni from window
integer width = 4027
integer height = 2488
boolean titlebar = true
string title = "Simulación por Clasificación NI"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
rb_todos rb_todos
rb_por_agente rb_por_agente
p_fin p_fin
st_1 st_1
st_2 st_2
em_fec_fin em_fec_fin
pb_aceptar pb_aceptar
dw_age dw_age
em_fec_ini em_fec_ini
dw_simulacion_clasificacion_ni dw_simulacion_clasificacion_ni
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
gb_1 gb_1
end type
global w_revision_vsp_ni w_revision_vsp_ni

type variables
Long	il_row
end variables

on w_revision_vsp_ni.create
this.rb_todos=create rb_todos
this.rb_por_agente=create rb_por_agente
this.p_fin=create p_fin
this.st_1=create st_1
this.st_2=create st_2
this.em_fec_fin=create em_fec_fin
this.pb_aceptar=create pb_aceptar
this.dw_age=create dw_age
this.em_fec_ini=create em_fec_ini
this.dw_simulacion_clasificacion_ni=create dw_simulacion_clasificacion_ni
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.gb_1=create gb_1
this.Control[]={this.rb_todos,&
this.rb_por_agente,&
this.p_fin,&
this.st_1,&
this.st_2,&
this.em_fec_fin,&
this.pb_aceptar,&
this.dw_age,&
this.em_fec_ini,&
this.dw_simulacion_clasificacion_ni,&
this.cb_cerrar,&
this.cb_imprimir,&
this.gb_1}
end on

on w_revision_vsp_ni.destroy
destroy(this.rb_todos)
destroy(this.rb_por_agente)
destroy(this.p_fin)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_fec_fin)
destroy(this.pb_aceptar)
destroy(this.dw_age)
destroy(this.em_fec_ini)
destroy(this.dw_simulacion_clasificacion_ni)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.gb_1)
end on

event open;String	ls_nom_sup,ls_ap_pat_sup,ls_ap_mat_sup,ls_cod_sup,ls_fecha,ls_fecha2
Date		ldt_fecha_antes,ldt_fecha_hoy,ldt_fecha_fin,ldt_fecha_ini
Long		ll_cuotas,ll_mes,ll_anno,ll_dia,ll_mes2,ll_anno2,ll_dia2

gf_centrar(w_revision_vsp_ni)
dw_simulacion_clasificacion_ni.settransobject(sqlca)
ll_mes  									= month(date(gdt_fec_sistema))
ll_anno 									= year(date(gdt_fec_sistema))
if ll_mes = 1 then
	ls_fecha								= '31/'+ string(ll_mes,'00')+ '/' +string(ll_anno,'0000')
elseif ll_mes = 2 then
	if ll_anno/4 = int(ll_anno/4) then
		ls_fecha							= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	else 
		ls_fecha							= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	end if
elseif ll_mes = 3 then
	ls_fecha								= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 4 then
	ls_fecha								= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 5 then
	ls_fecha								= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 6 then
	ls_fecha								= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 7 then
	ls_fecha								= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 8 then
	ls_fecha								= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 9 then
	ls_fecha								= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 10 then
	ls_fecha								= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 11 then
	ls_fecha								= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
elseif ll_mes = 12 then
	ls_fecha								= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
end if
em_fec_fin.text 						= string(ls_fecha) 
ldt_fecha_fin	 						= date(em_fec_fin.text)
ll_dia2    								= day(ldt_fecha_fin)
ll_mes2    								= month(ldt_fecha_fin) 
ll_anno2   								= year(ldt_fecha_fin)
ll_anno2   								= ll_anno2 - 1

ls_fecha2 								= string(ll_dia2,'00') +'/'+ string(ll_mes2,'00') +'/'+ string(ll_anno2,'0000')
em_fec_ini.text						= string(ls_fecha2)
ldt_fecha_ini							= date(em_fec_ini.text)

if gs_depto='G' or gs_depto='I' or gs_depto='M' or gs_depto='R' or gs_depto='B' then
	ldt_fecha_hoy			= date(gdt_fec_sistema)
		SELECT	DISTINCT "SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO", "SUPERVISOR"."COD_SUP"
		INTO					:ls_nom_sup,				:ls_ap_pat_sup,				:ls_ap_mat_sup,			  :ls_cod_sup
		FROM 		"ENCARGADOS",         "SUPERVISOR"  
		WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = "SUPERVISOR"."COD_SUP" ) and  
				 (("ENCARGADOS"."ESTADO" = 'A' ) AND  
				 ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) )   
		ORDER BY "SUPERVISOR"."COD_SUP" ASC
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_age.dataobject			= 'dwe_seleccionar_agente_por_supervisor'
			dw_age.settransobject(sqlca)
			dw_age.getchild('agente',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(ls_cod_sup,ldt_fecha_ini,ldt_fecha_fin)=0 then
				idw_detalle.insertrow(0)
			end if
			dw_age.insertrow(0)
		else
			dw_age.dataobject			= 'dwe_seleccionar_agentes_para_todos'
			dw_age.settransobject(sqlca)
			dw_age.getchild('agente',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(ldt_fecha_ini,ldt_fecha_fin)=0 then
				idw_detalle.insertrow(0)
			end if
			dw_age.insertrow(0)
		end if
	gs_ventana	= 'w_revision_vsp_ni'
	f_valida_objeto2()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_revision_vsp_ni)
end if
end event

type rb_todos from radiobutton within w_revision_vsp_ni
integer x = 3017
integer y = 128
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

event clicked;dw_age.reset()
dw_age.insertrow(0)
dw_simulacion_clasificacion_ni.reset()
dw_age.enabled = false
end event

type rb_por_agente from radiobutton within w_revision_vsp_ni
integer x = 937
integer y = 128
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

event clicked;dw_age.enabled 		= true
dw_simulacion_clasificacion_ni.reset()
dw_age.setfocus()
end event

type p_fin from picture within w_revision_vsp_ni
integer x = 736
integer y = 152
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string 	ls_fecha,fech,ls_fecha2
long 		ll_dia2,ll_mes2,ll_anno2
date		ldt_fecha_fin

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
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
		ldt_fecha_fin	 	= date(em_fec_fin.text)
		ll_dia2    			= day(ldt_fecha_fin)
		ll_mes2    			= month(ldt_fecha_fin) 
		ll_anno2   			= year(ldt_fecha_fin)
		ll_anno2				= ll_anno2 - 1
		if ll_mes2=2 and ll_dia2>28 then
			if ll_anno2/4 = int(ll_anno2/4) then
				ls_fecha2	= '29/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
			else 
				ls_fecha2	= '28/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
			end if
		else
			ls_fecha2 		= string(ll_dia2,'00') +'/'+ string(ll_mes2,'00') +'/'+ string(ll_anno2,'0000')
		end if
		em_fec_ini.text	= string(ls_fecha2)
	end if	
END IF
end event

type st_1 from statictext within w_revision_vsp_ni
integer x = 37
integer y = 64
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

type st_2 from statictext within w_revision_vsp_ni
integer x = 187
integer y = 168
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

type em_fec_fin from editmask within w_revision_vsp_ni
integer x = 357
integer y = 152
integer width = 375
integer height = 88
integer taborder = 20
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
dw_simulacion_clasificacion_ni.reset()
ldt_fecha_fin	 	= date(em_fec_fin.text)
ll_dia2    			= day(ldt_fecha_fin)
ll_mes2    			= month(ldt_fecha_fin) 
ll_anno2   			= year(ldt_fecha_fin)
ll_anno2				= ll_anno2 - 1
if ll_mes2=2 and ll_dia2>28 then
	if ll_anno2/4 = int(ll_anno2/4) then
		ls_fecha2	= '29/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
	else 
		ls_fecha2	= '28/'+string(ll_mes2,'00')+'/'+string(ll_anno2,'0000')
	end if
else
	ls_fecha2 		= string(ll_dia2,'00') +'/'+ string(ll_mes2,'00') +'/'+ string(ll_anno2,'0000')
end if
em_fec_ini.text	= string(ls_fecha2)
end event

type pb_aceptar from picturebutton within w_revision_vsp_ni
integer x = 3790
integer y = 80
integer width = 169
integer height = 148
integer taborder = 10
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
String	ls_cod_age
ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if ld_fec_ini>ld_fec_fin or isnull(ld_fec_ini) or isnull(ld_fec_fin) then
	messagebox("Advertencia","Rango de Fecha Inválida")
else
	if rb_por_agente.checked=true then
		ls_cod_age	= dw_age.getitemstring(1,'agente')
		if not isnull(ls_cod_age) and ls_cod_age<>'' then
			dw_simulacion_clasificacion_ni.dataobject	= 'dw_revision_promesas_ni'
			dw_simulacion_clasificacion_ni.settransobject(sqlca)
			if dw_simulacion_clasificacion_ni.retrieve(ld_fec_ini,ld_fec_fin,ls_cod_age,gs_user)=0 then 
			messagebox("Advertencia","No Registra datos")
			end if
		end if		
	elseif rb_todos.checked=true then
		dw_simulacion_clasificacion_ni.dataobject		= 'dw_revision_promesas_ni_todo'
		dw_simulacion_clasificacion_ni.settransobject(sqlca)
		if dw_simulacion_clasificacion_ni.retrieve(ld_fec_ini,ld_fec_fin,gs_user,gs_user)=0 then
			messagebox("Advertencia","No Registra datos")
		end if
	end if
end if
end event

type dw_age from datawindow within w_revision_vsp_ni
integer x = 1330
integer y = 112
integer width = 1499
integer height = 112
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_agente_por_supervisor"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_simulacion_clasificacion_ni.reset()
end event

type em_fec_ini from statictext within w_revision_vsp_ni
integer x = 357
integer y = 52
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

type dw_simulacion_clasificacion_ni from datawindow within w_revision_vsp_ni
integer x = 50
integer y = 288
integer width = 3909
integer height = 1880
integer taborder = 20
string title = "none"
string dataobject = "dw_revision_promesas_ni_todo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type cb_cerrar from commandbutton within w_revision_vsp_ni
integer x = 3557
integer y = 2208
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_revision_vsp_ni)
end event

type cb_imprimir from commandbutton within w_revision_vsp_ni
integer x = 50
integer y = 2208
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_simulacion_clasificacion_ni.rowcount() > 0 then 
	dw_simulacion_clasificacion_ni.object.datawindow.zoom				= 88
	f_Print( dw_simulacion_clasificacion_ni )
	dw_simulacion_clasificacion_ni.object.datawindow.zoom				= 100
end if


end event

type gb_1 from groupbox within w_revision_vsp_ni
integer x = 901
integer y = 36
integer width = 2825
integer height = 208
integer taborder = 10
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

