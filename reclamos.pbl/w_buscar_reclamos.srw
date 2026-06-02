forward
global type w_buscar_reclamos from window
end type
type pb_buscar from picturebutton within w_buscar_reclamos
end type
type em_ctto from editmask within w_buscar_reclamos
end type
type st_busqueda from statictext within w_buscar_reclamos
end type
type dw_parque from datawindow within w_buscar_reclamos
end type
type cb_ordenar from commandbutton within w_buscar_reclamos
end type
type cb_filtrar from commandbutton within w_buscar_reclamos
end type
type cb_exportar from commandbutton within w_buscar_reclamos
end type
type cb_imprimir from commandbutton within w_buscar_reclamos
end type
type st_2 from statictext within w_buscar_reclamos
end type
type em_fec_ini from editmask within w_buscar_reclamos
end type
type p_ini from picture within w_buscar_reclamos
end type
type st_3 from statictext within w_buscar_reclamos
end type
type em_fec_fin from editmask within w_buscar_reclamos
end type
type p_fin from picture within w_buscar_reclamos
end type
type pb_ok from picturebutton within w_buscar_reclamos
end type
type cb_cerrar from commandbutton within w_buscar_reclamos
end type
type cb_aceptar from commandbutton within w_buscar_reclamos
end type
type dw_lista from datawindow within w_buscar_reclamos
end type
type gb_1 from groupbox within w_buscar_reclamos
end type
end forward

global type w_buscar_reclamos from window
integer width = 3351
integer height = 1640
boolean titlebar = true
string title = "Buscar Solicitud de Requerimiento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
pb_buscar pb_buscar
em_ctto em_ctto
st_busqueda st_busqueda
dw_parque dw_parque
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
st_3 st_3
em_fec_fin em_fec_fin
p_fin p_fin
pb_ok pb_ok
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
gb_1 gb_1
end type
global w_buscar_reclamos w_buscar_reclamos

type variables
datawindowchild			idw_detalle5,idw_detalle6,idw_detalle7,idw_detalle8
end variables

on w_buscar_reclamos.create
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.st_busqueda=create st_busqueda
this.dw_parque=create dw_parque
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.st_3=create st_3
this.em_fec_fin=create em_fec_fin
this.p_fin=create p_fin
this.pb_ok=create pb_ok
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.pb_buscar,&
this.em_ctto,&
this.st_busqueda,&
this.dw_parque,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.st_3,&
this.em_fec_fin,&
this.p_fin,&
this.pb_ok,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista,&
this.gb_1}
end on

on w_buscar_reclamos.destroy
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.st_busqueda)
destroy(this.dw_parque)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.st_3)
destroy(this.em_fec_fin)
destroy(this.p_fin)
destroy(this.pb_ok)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_mes,ll_ano,ll_cod_parque

gf_centrar(w_buscar_reclamos)
dw_lista.settransobject(sqlca)
dw_parque.dataobject 				= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
SELECT 	"ENCARGADOS"."COD_PARQUE"  
INTO 		:ll_cod_parque  
FROM 	"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   ;

if isvalid(w_ingreso_reclamo) and ll_cod_parque = 9999 then
	ll_cod_parque		= 9999
elseif isvalid(w_ingreso_reclamo) and ll_cod_parque > 0 then
	ll_cod_parque		= w_ingreso_reclamo.dw_ingreso.getitemnumber(1,'cod_parque')
else
	if gs_conexion	= "Parque El Prado" then
		ll_cod_parque	= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_cod_parque	= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_cod_parque	= 801
	end if
end if
dw_parque.setitem(1,'parque',ll_cod_parque)
dw_parque.accepttext()
ll_mes									= month(date(gdt_fec_sistema))
ll_ano										= year(date(gdt_fec_sistema))
em_fec_ini.text							= string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))
em_fec_fin.text							= string(gdt_fec_sistema,'dd/mm/yyyy')
pb_ok.triggerevent(clicked!)
end event

type pb_buscar from picturebutton within w_buscar_reclamos
integer x = 2679
integer y = 1412
integer width = 101
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string		ls_string
Double	ll_numero
ll_numero				= Double(em_ctto.text)
if ll_numero > 0 then
	ll_tot_reg			= dw_lista.rowcount()
	ls_string				= "numero_reclamo = "+string(ll_numero)
	ll_fila 					= dw_lista.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_lista.scrolltorow(ll_fila)
		dw_lista.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","Nº Requerimiento No Existe en Lista")
		dw_lista.scrolltorow(1)
	end if
else
	messagebox("Advertencia","Debe Ingresar N° Requerimiento")
	em_ctto.setfocus()
end if
end event

type em_ctto from editmask within w_buscar_reclamos
integer x = 2231
integer y = 1412
integer width = 443
integer height = 92
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if Double(em_ctto.text)>0 then pb_buscar.triggerevent(clicked!)
end event

type st_busqueda from statictext within w_buscar_reclamos
integer x = 1659
integer y = 1428
integer width = 549
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Requerimiento"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_buscar_reclamos
integer x = 46
integer y = 68
integer width = 887
integer height = 96
integer taborder = 1
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type cb_ordenar from commandbutton within w_buscar_reclamos
event ue_mousemove pbm_dwnmousemove
integer x = 562
integer y = 1416
integer width = 229
integer height = 80
integer taborder = 70
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

type cb_filtrar from commandbutton within w_buscar_reclamos
event ue_mousemove pbm_mousemove
integer x = 795
integer y = 1416
integer width = 229
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string 	ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_buscar_reclamos
event ue_mousemove pbm_mousemove
integer x = 1024
integer y = 1416
integer width = 229
integer height = 80
integer taborder = 90
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

type cb_imprimir from commandbutton within w_buscar_reclamos
event ue_mousemove pbm_mousemove
integer x = 1275
integer y = 1416
integer width = 229
integer height = 80
integer taborder = 100
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
end if
end event

type st_2 from statictext within w_buscar_reclamos
integer x = 951
integer y = 84
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_buscar_reclamos
integer x = 1472
integer y = 68
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -9
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

event modified;dw_lista.reset()
end event

type p_ini from picture within w_buscar_reclamos
integer x = 1833
integer y = 68
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

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
	end if	
END IF
end event

type st_3 from statictext within w_buscar_reclamos
integer x = 1947
integer y = 84
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 700
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

type em_fec_fin from editmask within w_buscar_reclamos
integer x = 2139
integer y = 68
integer width = 357
integer height = 88
integer taborder = 20
integer textsize = -9
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

event modified;dw_lista.reset()
end event

type p_fin from picture within w_buscar_reclamos
integer x = 2501
integer y = 68
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

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
	end if	
END IF
end event

type pb_ok from picturebutton within w_buscar_reclamos
integer x = 2711
integer y = 24
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;Long		ll_cod_parque
Datetime	ld_fec_ini,ld_fec_fin
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

SetPointer(HourGlass!)
ll_cod_parque					= dw_parque.getitemnumber(1,'parque')
if isnull(ll_cod_parque) then
	messagebox("Advertencia","Debe seleccionar Parque")
	dw_parque.setfocus()
else
	ld_fec_ini						= datetime(date(em_fec_ini.text),lt_ini)
	ld_fec_fin						= datetime(date(em_fec_fin.text),lt_fin)
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
				if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,ll_cod_parque)=0 then
					messagebox("Advertencia","No Registra Dato")
					em_fec_fin.setfocus()
				end if
			end if
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_buscar_reclamos
integer x = 2999
integer y = 1408
integer width = 306
integer height = 100
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_buscar_reclamos)
end event

type cb_aceptar from commandbutton within w_buscar_reclamos
integer x = 32
integer y = 1408
integer width = 306
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;Long		ll_reclamo,ll_cod_parque,ll_rut,ll_mora_cred,ll_mora_mant
String		ls_base,ls_serie,ls_estado,ls_descrip,ls_area,ls_sector,ls_sepultura,ls_depto,ls_depto_asig,ls_codigo_sol,ls_cod_gerencia_select,&
			ls_tipo_sol
Double	ll_numero

if isvalid(w_ingreso_reclamo) and dw_lista.rowcount() > 0 then
	ll_reclamo			= dw_lista.getitemnumber(dw_lista.getrow(),'numero_reclamo')
	ll_cod_parque		= dw_lista.getitemnumber(dw_lista.getrow(),'cod_parque')
	ls_sector				= dw_lista.getitemstring(dw_lista.getrow(),'sector')	
	ls_base				= dw_lista.getitemstring(dw_lista.getrow(),'base')	
	ls_serie				= dw_lista.getitemstring(dw_lista.getrow(),'serie')	
	ll_numero			= dw_lista.getitemnumber(dw_lista.getrow(),'numero')
	ls_depto_asig		= dw_lista.getitemstring(dw_lista.getrow(),'depto_asig')
	ls_codigo_sol		= dw_lista.getitemstring(dw_lista.getrow(),'codigo_solicitud')
	ls_tipo_sol			= dw_lista.getitemstring(dw_lista.getrow(),'reclamo_solicitud_tipo_solicitud')

	SELECT	"RECLAMO_CODIGO_TIPO"."CODIGO_GERENCIA"  
	INTO 		:ls_cod_gerencia_select  
	FROM 	"RECLAMO_CODIGO_TIPO"  
	WHERE 	"RECLAMO_CODIGO_TIPO"."CODIGO_RECLAMO" = :ls_codigo_sol   ;
	w_ingreso_reclamo.dw_ingreso.getchild('codigo_tipo_reclamo',idw_detalle8)  // DEPTO
	idw_detalle8.settransobject(sqlca)
	w_ingreso_reclamo.dw_ingreso.getchild('serie',idw_detalle6)  // base
	idw_detalle6.settransobject(sqlca)
	w_ingreso_reclamo.dw_ingreso.getchild('codigo_reclamo',idw_detalle7)  // depto
	idw_detalle7.settransobject(sqlca)
	w_ingreso_reclamo.dw_ingreso.getchild('area',idw_detalle)
	idw_detalle.settransobject(sqlca)
	w_ingreso_reclamo.dw_ingreso.getchild('sector',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	w_ingreso_reclamo.dw_ingreso.getchild('sepultura',idw_detalle3)  //Parque y Sector
	idw_detalle3.settransobject(sqlca)
	w_ingreso_reclamo.dw_ingreso.getchild('usuario_asignado',idw_detalle4)
	idw_detalle4.settransobject(sqlca)
	w_ingreso_reclamo.dw_ingreso.getchild('ult_estado_gestion',idw_detalle5)	// depto
	idw_detalle5.settransobject(sqlca)
	
	if idw_detalle.retrieve(ll_cod_parque)=0 then idw_detalle.insertrow(0)
	if idw_detalle2.retrieve(ll_cod_parque)=0 then idw_detalle2.insertrow(0)
	if idw_detalle6.retrieve(ls_base)=0 then idw_detalle6.insertrow(0)
	if idw_detalle3.retrieve(ll_cod_parque,ls_sector)=0 then idw_detalle3.insertrow(0)
	if idw_detalle8.retrieve(ls_depto_asig)=0 then idw_detalle8.insertrow(0)
	if idw_detalle7.retrieve(ls_depto_asig,ls_tipo_sol)=0 then idw_detalle7.insertrow(0)
	if idw_detalle4.retrieve(gs_user,ll_cod_parque,ls_cod_gerencia_select)=0 then idw_detalle4.insertrow(0)
	if idw_detalle5.retrieve()=0 then idw_detalle5.insertrow(0)
	
	w_ingreso_reclamo.dw_ingreso.retrieve(ll_reclamo)
	if not isnull(ls_base) and not isnull(ls_serie) and ll_numero > 0 then
		SELECT		"CADENA"."ESTADO" ,
						"CADENA"."RUT",
						"CADENA"."COD_PARQUE",
						"CADENA_MORA"."MORA_CRED",
						"CADENA_MORA"."MORA_MANT"
		INTO 			:ls_estado,
						:ll_rut,
						:ll_cod_parque,
						:ll_mora_cred,
						:ll_mora_mant
		FROM 		"CADENA",
						"CADENA_MORA"
		WHERE 	  ( "CADENA"."CODIGO" = "CADENA_MORA"."BASE" ) AND  
					  ( "CADENA"."SERIE" = "CADENA_MORA"."SERIE" ) AND  
					  ( "CADENA"."NUMERO" = "CADENA_MORA"."NUMERO" )  AND
					  ( "CADENA"."CODIGO" = :ls_base ) AND  
					  ( "CADENA"."SERIE" = :ls_serie ) AND  
					  ( "CADENA"."NUMERO" = :ll_numero )  
		USING		sqlca;
		if sqlca.sqlcode= 0 then
			SELECT	"ESTADO"."NOMBRE_ESTADO"  
			INTO		:ls_descrip  
			FROM		"ESTADO"  
			WHERE	"ESTADO"."COD_ESTADO" = :ls_estado   ;
			ls_estado																= 'Estado Contrato:  '+ls_descrip
			w_ingreso_reclamo.dw_ingreso.object.t_estado.text			= ls_estado
			w_ingreso_reclamo.dw_ingreso.object.t_mora_cred.text		= 'Mora Crédito ('+string(ll_mora_cred,'###,##0')+')'
			w_ingreso_reclamo.dw_ingreso.object.t_mora_mant.text	= 'Mora Mantención ('+string(ll_mora_mant,'###,##0')+')'
		end if
	end if
	w_ingreso_reclamo.dw_ingreso.setfocus()
	cb_cerrar.triggerevent(clicked!)
end if
end event

type dw_lista from datawindow within w_buscar_reclamos
integer x = 32
integer y = 208
integer width = 3273
integer height = 1168
integer taborder = 50
string title = "none"
string dataobject = "dw_lista_buscar_reclamos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

event doubleclicked;if row > 0 then cb_aceptar.triggerevent(clicked!)
end event

type gb_1 from groupbox within w_buscar_reclamos
event ue_mousemove pbm_mousemove
integer x = 539
integer y = 1368
integer width = 987
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

