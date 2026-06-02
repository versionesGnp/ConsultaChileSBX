forward
global type w_detalle_gestion_agrupado from window
end type
type ddlb_ejecutivo from dropdownlistbox within w_detalle_gestion_agrupado
end type
type st_3 from statictext within w_detalle_gestion_agrupado
end type
type cb_print from commandbutton within w_detalle_gestion_agrupado
end type
type cb_4 from commandbutton within w_detalle_gestion_agrupado
end type
type cb_2 from commandbutton within w_detalle_gestion_agrupado
end type
type cb_3 from commandbutton within w_detalle_gestion_agrupado
end type
type st_1 from statictext within w_detalle_gestion_agrupado
end type
type em_fec_ini from editmask within w_detalle_gestion_agrupado
end type
type st_2 from statictext within w_detalle_gestion_agrupado
end type
type p_ini from picture within w_detalle_gestion_agrupado
end type
type em_fec_fin from editmask within w_detalle_gestion_agrupado
end type
type p_fin from picture within w_detalle_gestion_agrupado
end type
type pb_aceptar from picturebutton within w_detalle_gestion_agrupado
end type
type cb_cerrar from commandbutton within w_detalle_gestion_agrupado
end type
type dw_lista from datawindow within w_detalle_gestion_agrupado
end type
type gb_1 from groupbox within w_detalle_gestion_agrupado
end type
end forward

global type w_detalle_gestion_agrupado from window
integer width = 2834
integer height = 2180
boolean titlebar = true
string title = "Resumen Rango Fecha por Gestión Telefónica"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
ddlb_ejecutivo ddlb_ejecutivo
st_3 st_3
cb_print cb_print
cb_4 cb_4
cb_2 cb_2
cb_3 cb_3
st_1 st_1
em_fec_ini em_fec_ini
st_2 st_2
p_ini p_ini
em_fec_fin em_fec_fin
p_fin p_fin
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_gestion_agrupado w_detalle_gestion_agrupado

type variables
String	is_tipo
end variables

on w_detalle_gestion_agrupado.create
this.ddlb_ejecutivo=create ddlb_ejecutivo
this.st_3=create st_3
this.cb_print=create cb_print
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_3=create cb_3
this.st_1=create st_1
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.p_ini=create p_ini
this.em_fec_fin=create em_fec_fin
this.p_fin=create p_fin
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.ddlb_ejecutivo,&
this.st_3,&
this.cb_print,&
this.cb_4,&
this.cb_2,&
this.cb_3,&
this.st_1,&
this.em_fec_ini,&
this.st_2,&
this.p_ini,&
this.em_fec_fin,&
this.p_fin,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_gestion_agrupado.destroy
destroy(this.ddlb_ejecutivo)
destroy(this.st_3)
destroy(this.cb_print)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.p_ini)
destroy(this.em_fec_fin)
destroy(this.p_fin)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;String	ls_usuario,ls_nombre
gf_centrar(w_detalle_gestion_agrupado)
is_tipo								= trim(Message.StringParm)
if is_tipo='T' then
	dw_lista.dataobject			= 'dw_agrupar_estado_titular_contadores'
	this.title							= 'Resumen Rango Fecha por Gestión Telefónica Actual'
elseif is_tipo='V' then
	dw_lista.dataobject			= 'dw_agrupar_estado_titular_contadores_v'
	this.title							= 'Resumen Rango Fecha por Visita Terreno o Atención Público Actual'
elseif is_tipo='E' then
	dw_lista.dataobject			= 'dw_agrupar_estado_titular_contadores_e'
	this.title							= 'Resumen Rango Fecha por Gestión Envio Carta Actual'
end if
dw_lista.settransobject(sqlca)
em_fec_ini.text						= string(date(gdt_fec_sistema),"dd/mm/yyyy")
em_fec_fin.text						= string(date(gdt_fec_sistema),"dd/mm/yyyy")

DECLARE x1 CURSOR FOR  
SELECT		"ENCARGADOS"."CODIGO_USUARIO",   
				"ENCARGADOS"."NOMBRE"  
FROM 		"ENCARGADOS"  
WHERE 		"ENCARGADOS"."DEPTO" = 'E'   
ORDER BY	"ENCARGADOS"."CODIGO_USUARIO" ASC  
USING		sqlca;
open x1;
DO WHILE sqlca.sqlcode=0
	fetch x1 into :ls_usuario, :ls_nombre;
	if not isnull(ls_usuario) then
		ddlb_ejecutivo.additem(trim(ls_usuario)+' - '+trim(ls_nombre))
	end if
	setnull(ls_usuario)
LOOP
close x1;
ddlb_ejecutivo.additem('All - Todos')
SELECT	"SOL_PERMISOS_USUARIO"."USUARIO"  
INTO 		:ls_usuario  
FROM 	"SOL_PERMISOS_USUARIO"  
WHERE	( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'AT' ) AND  
			( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
		 	( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )   
USING	sqlca;
if sqlca.sqlcode=0 or gs_depto='I' then
	st_3.visible						= true
	ddlb_ejecutivo.visible			= true
else
	st_3.visible						= false
	ddlb_ejecutivo.visible			= false
end if
em_fec_ini.setfocus()
end event

type ddlb_ejecutivo from dropdownlistbox within w_detalle_gestion_agrupado
integer x = 1710
integer y = 44
integer width = 882
integer height = 352
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type st_3 from statictext within w_detalle_gestion_agrupado
integer x = 1449
integer y = 56
integer width = 251
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ejecutivo"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_detalle_gestion_agrupado
integer x = 818
integer y = 1948
integer width = 229
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
//	f_printdlg(dw_lista,gstr_print,w_detalle_gestion_agrupado)
end if
end event

type cb_4 from commandbutton within w_detalle_gestion_agrupado
integer x = 64
integer y = 1948
integer width = 224
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setsort(nulo)
dw_lista.sort()




end event

type cb_2 from commandbutton within w_detalle_gestion_agrupado
integer x = 297
integer y = 1948
integer width = 238
integer height = 92
integer taborder = 60
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

type cb_3 from commandbutton within w_detalle_gestion_agrupado
integer x = 544
integer y = 1948
integer width = 229
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type st_1 from statictext within w_detalle_gestion_agrupado
integer x = 37
integer y = 24
integer width = 338
integer height = 112
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha    desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_detalle_gestion_agrupado
integer x = 393
integer y = 40
integer width = 343
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 700
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

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_detalle_gestion_agrupado
integer x = 837
integer y = 52
integer width = 155
integer height = 64
integer textsize = -8
integer weight = 700
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

type p_ini from picture within w_detalle_gestion_agrupado
integer x = 745
integer y = 40
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
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
dw_lista.reset()
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

type em_fec_fin from editmask within w_detalle_gestion_agrupado
integer x = 1001
integer y = 40
integer width = 343
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 700
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

event modified;dw_lista.reset()
end event

type p_fin from picture within w_detalle_gestion_agrupado
integer x = 1353
integer y = 40
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
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
dw_lista.reset()
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

type pb_aceptar from picturebutton within w_detalle_gestion_agrupado
event ue_mousemove pbm_mousemove
integer x = 2633
integer y = 24
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event clicked;date		ld_fec_ini, ld_fec_fin
String	ls_usuario,ls_cod_usu,ls_usu_sel
Long		ll_pos

ld_fec_ini			= date(em_fec_ini.text)
ld_fec_fin			= date(em_fec_fin.text)
if ddlb_ejecutivo.visible=false then
	ls_usuario		= gs_user
	ls_usu_sel		= gs_user
else
	ls_cod_usu		= trim(ddlb_ejecutivo.text)
	ll_pos			= Pos(ls_cod_usu, "-")
	if ll_pos>0 then
		ll_pos		= ll_pos - 1
		ls_usu_sel	= trim(mid(ls_cod_usu,1,ll_pos))
	end if
	if ls_usu_sel='All' then
		ls_usuario	= '%'
	else
		ls_usuario	= ls_usu_sel
	end if
end if
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ls_usu_sel='' or isnull(ls_usu_sel) then
			messagebox("Advertencia","Debe Seleccionar Ejecutivo")
			ddlb_ejecutivo.setfocus()
		else
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ls_usuario)=0 then
				messagebox("Advertencia","No registra dato")
			end if		
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_detalle_gestion_agrupado
integer x = 2464
integer y = 1948
integer width = 311
integer height = 92
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_gestion_agrupado)
end event

type dw_lista from datawindow within w_detalle_gestion_agrupado
integer x = 41
integer y = 172
integer width = 2729
integer height = 1724
integer taborder = 40
string dataobject = "dw_agrupar_estado_titular_contadores_e"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_detalle_gestion_agrupado
integer x = 41
integer y = 1900
integer width = 1033
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

