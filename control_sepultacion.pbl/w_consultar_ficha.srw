forward
global type w_consultar_ficha from window
end type
type cb_1 from commandbutton within w_consultar_ficha
end type
type cb_2 from commandbutton within w_consultar_ficha
end type
type cb_3 from commandbutton within w_consultar_ficha
end type
type cb_imprimir from commandbutton within w_consultar_ficha
end type
type cb_aceptar from commandbutton within w_consultar_ficha
end type
type cb_cerrar from commandbutton within w_consultar_ficha
end type
type dw_parque from datawindow within w_consultar_ficha
end type
type st_16 from statictext within w_consultar_ficha
end type
type pb_ok from picturebutton within w_consultar_ficha
end type
type st_2 from statictext within w_consultar_ficha
end type
type em_fec_ini from editmask within w_consultar_ficha
end type
type p_ini from picture within w_consultar_ficha
end type
type dw_lista from datawindow within w_consultar_ficha
end type
type gb_1 from groupbox within w_consultar_ficha
end type
end forward

global type w_consultar_ficha from window
integer width = 3625
integer height = 2132
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_imprimir cb_imprimir
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
dw_parque dw_parque
st_16 st_16
pb_ok pb_ok
st_2 st_2
em_fec_ini em_fec_ini
p_ini p_ini
dw_lista dw_lista
gb_1 gb_1
end type
global w_consultar_ficha w_consultar_ficha

type variables
String	is_usuario_esta
Long		il_row
datawindowchild	idw_detalle5
end variables

on w_consultar_ficha.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_parque=create dw_parque
this.st_16=create st_16
this.pb_ok=create pb_ok
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.p_ini=create p_ini
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_imprimir,&
this.cb_aceptar,&
this.cb_cerrar,&
this.dw_parque,&
this.st_16,&
this.pb_ok,&
this.st_2,&
this.em_fec_ini,&
this.p_ini,&
this.dw_lista,&
this.gb_1}
end on

on w_consultar_ficha.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.p_ini)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_parque,ll_count_usuario
Datetime	ld_fec_ini
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

gf_centrar(w_consultar_ficha)
SELECT	COUNT("FICHA_USUARIO_ESTADISTICO"."USUARIO")  
INTO 		:ll_count_usuario  
FROM 		"FICHA_USUARIO_ESTADISTICO"  
WHERE  ( "FICHA_USUARIO_ESTADISTICO"."ESTADO" = 'A' ) AND  
		 ( "FICHA_USUARIO_ESTADISTICO"."USUARIO" = :gs_user )   
USING		sqlca;
if ll_count_usuario=1 then
	is_usuario_esta		= 'S'
else
	is_usuario_esta		= 'N'
end if
em_fec_ini.text			= string(relativedate(date(gdt_fec_sistema),-30),'dd/mm/yyyy')
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)

dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_parque				= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_parque				= 11
end if
dw_parque.setitem(1,'cod_parque',ll_parque)
dw_lista.getchild('codigo_parentesco',idw_detalle5)
idw_detalle5.settransobject(sqlca)
idw_detalle5.retrieve(ll_parque)

ld_fec_ini					= datetime(date(em_fec_ini.text),lt_ini)
dw_lista.retrieve(ld_fec_ini,ll_parque)
end event

type cb_1 from commandbutton within w_consultar_ficha
integer x = 1317
integer y = 1876
integer width = 238
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_consultar_ficha
integer x = 1783
integer y = 1876
integer width = 219
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_consultar_ficha
integer x = 1559
integer y = 1876
integer width = 219
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_imprimir from commandbutton within w_consultar_ficha
integer x = 2190
integer y = 1876
integer width = 219
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom        	= 52
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview  = False
	dw_lista.object.datawindow.zoom           = 100
end if
end event

type cb_aceptar from commandbutton within w_consultar_ficha
integer x = 37
integer y = 1880
integer width = 297
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_cod_parque,ll_parque,ll_imagen,ll_cod_parque_des,ll_tot_reg,ll_indi
String	ls_sector,ls_sepultura,ls_base,ls_serie,ls_ciu_fall,ls_ciu_tit,ls_nombre_archivo,ls_base_ori,&
			ls_base_des,ls_ciudad_ori,ls_ciudad_des,ls_sector_des
datetime	ldt_fecha_sepult
datawindowchild	idw_detalle_55,idw_detalle6,idw_detalle7,idw_detalle8,idw_detalle9,idw_detalle10,&
						idw_detalle11	//,idw_detalle12

il_row						= dw_lista.getrow()
if dw_lista.rowcount()>0 and il_row>0 then
	if isvalid(w_ingreso_ficha_sepultacion) then
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_sector			= dw_lista.getitemstring(il_row,'sector')
		ls_sepultura		= dw_lista.getitemstring(il_row,'sepultura')
		ldt_fecha_sepult	= dw_lista.getitemdatetime(il_row,'fecha_sepultacion')
		ll_tot_reg			= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
		w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.enabled	= true
		w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.enabled		= true
		w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.enabled		= true
		ll_parque	= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getitemnumber(1,'cod_parque')
		ls_sector	= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'sector')
		ls_base		= w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getitemstring(1,'base')
		ls_ciu_fall	= w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.getitemstring(1,'codigo_ciudad_fall')
		ls_ciu_tit	= w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.getitemstring(1,'codigo_ciudad_titular')
		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getchild('serie',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.retrieve(ls_base)

		w_ingreso_ficha_sepultacion.tab_1.tabpage_1.dw_ant_fall.getchild('codigo_comuna_fall',idw_detalle_55)
		idw_detalle_55.settransobject(sqlca)
		idw_detalle_55.retrieve(ls_ciu_fall)

		w_ingreso_ficha_sepultacion.tab_1.tabpage_2.dw_ant_titular.getchild('codigo_comuna_titular',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.retrieve(ls_ciu_tit)

		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getchild('sector',idw_detalle7)
		idw_detalle7.settransobject(sqlca)
		idw_detalle7.retrieve(ll_parque)
		
		w_ingreso_ficha_sepultacion.tab_1.tabpage_4.dw_aranceles.getchild('codigo_parentesco',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		if gs_conexion	= "Parque El Prado" then
			idw_detalle4.retrieve(1)
		elseif gs_conexion = "Parque La Foresta" then
			idw_detalle4.retrieve(11)
		end if

		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura',idw_detalle8)
		idw_detalle8.settransobject(sqlca)
		idw_detalle8.retrieve(ll_parque,ls_sector)
		for ll_indi=1 to ll_tot_reg
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estado_reg','S')
			w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
		next
		w_ingreso_ficha_sepultacion.pb_fin.triggerevent(clicked!)
		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		w_ingreso_ficha_sepultacion.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora')
		close(w_consultar_ficha)
		
	elseif isvalid(w_carta_sepultacion) then
		ls_sector			= dw_lista.getitemstring(il_row,'sector')
		ls_sepultura		= dw_lista.getitemstring(il_row,'sepultura')
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		w_carta_sepultacion.dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)
		w_carta_sepultacion.dw_parque.reset()
		w_carta_sepultacion.dw_parque.insertrow(0)
		w_carta_sepultacion.dw_buscar.reset()
		w_carta_sepultacion.dw_buscar.getchild('sepultura',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.reset()
		idw_detalle6.insertrow(0)
		
		w_carta_sepultacion.dw_buscar.getchild('sector',idw_detalle5)
		idw_detalle5.reset()
		idw_detalle5.insertrow(0)

		w_carta_sepultacion.dw_buscar.insertrow(0)
		w_carta_sepultacion.dw_lista.setfocus()
		close(w_consultar_ficha)
		
	elseif isvalid(w_solicitud_grabacion_lapida) then
		ls_sector			= dw_lista.getitemstring(il_row,'sector')
		ls_sepultura		= dw_lista.getitemstring(il_row,'sepultura')
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		w_solicitud_grabacion_lapida.dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)
		ll_imagen			= dw_lista.getitemnumber(il_row,'codigo_imagen')
		SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
		INTO 		:ls_nombre_archivo  
		FROM 		"FICHA_CUNOS"  
		WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			w_solicitud_grabacion_lapida.dw_lista.object.p_1.Filename 	= ls_nombre_archivo
		else
			w_solicitud_grabacion_lapida.dw_lista.object.p_1.Filename 	= ''
		end if
		w_solicitud_grabacion_lapida.dw_parque.reset()
		w_solicitud_grabacion_lapida.dw_parque.insertrow(0)
		w_solicitud_grabacion_lapida.dw_buscar.reset()
		w_solicitud_grabacion_lapida.dw_buscar.getchild('sepultura',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.reset()
		idw_detalle6.insertrow(0)
		
		w_solicitud_grabacion_lapida.dw_buscar.getchild('sector',idw_detalle5)
		idw_detalle5.reset()
		idw_detalle5.insertrow(0)

		w_solicitud_grabacion_lapida.dw_buscar.insertrow(0)
		w_solicitud_grabacion_lapida.dw_lista.setfocus()
		close(w_consultar_ficha)
		
	elseif isvalid(w_ingreso_ficha_traslado) then
		ll_cod_parque		= dw_lista.getitemnumber(il_row,'cod_parque')
		ls_sector			= dw_lista.getitemstring(il_row,'sector_origen')
		ls_sepultura		= dw_lista.getitemstring(il_row,'sepultura_origen')
		ldt_fecha_sepult	= dw_lista.getitemdatetime(il_row,'fecha_traslado')
		ls_base_ori			= dw_lista.getitemstring(il_row,'base_origen')
		ls_base_des			= dw_lista.getitemstring(il_row,'base_destino')
		ll_cod_parque_des	= dw_lista.getitemnumber(il_row,'cod_parque_destino')
		ls_sector_des		= dw_lista.getitemstring(il_row,'sector_destino')
		ls_ciudad_ori		= dw_lista.getitemstring(il_row,'cod_ciudad_titular_origen')
		ls_ciudad_des		= dw_lista.getitemstring(il_row,'cod_ciudad_titular_destino')
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.enabled	= true
		w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.enabled		= true
		w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.enabled		= true
		ll_tot_reg	= w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.retrieve(ll_cod_parque,ls_sector,ls_sepultura,ldt_fecha_sepult)
		for ll_indi=1 to ll_tot_reg
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estado','S')
			w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setitem(ll_indi,'c_estadistico',is_usuario_esta)
			if w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.getitemnumber(ll_indi,'rut_fallecido')>0 then
				w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estado','S')
			else
				w_ingreso_ficha_traslado.tab_1.tabpage_1.dw_ant_fall.setitem(ll_indi,'c_estado','N')
			end if
			w_ingreso_ficha_traslado.tab_1.tabpage_4.dw_aranceles.setitem(ll_indi,'c_estado','S')
		next
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('serie_origen',idw_detalle_55)
		idw_detalle_55.settransobject(sqlca)
		idw_detalle_55.retrieve(ls_base_ori)

		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('serie_destino',idw_detalle6)
		idw_detalle6.settransobject(sqlca)
		idw_detalle6.retrieve(ls_base_des)

		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('sector_origen',idw_detalle7)
		idw_detalle7.settransobject(sqlca)
		idw_detalle7.retrieve(ll_cod_parque)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('sector_destino',idw_detalle8)
		idw_detalle8.settransobject(sqlca)
		idw_detalle8.retrieve(ll_cod_parque_des)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura_origen',idw_detalle9)
		idw_detalle9.settransobject(sqlca)
		idw_detalle9.retrieve(ll_cod_parque,ls_sector)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('sepultura_destino',idw_detalle10)
		idw_detalle10.settransobject(sqlca)
		idw_detalle10.retrieve(ll_cod_parque_des,ls_sector_des)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('cod_comuna_titular_origen',idw_detalle11)
		idw_detalle11.settransobject(sqlca)
		idw_detalle11.retrieve(ls_ciudad_ori)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.getchild('cod_comuna_titular_destino',idw_detalle12)
		idw_detalle12.settransobject(sqlca)
		idw_detalle12.retrieve(ls_ciudad_des)
		
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setfocus()
		w_ingreso_ficha_traslado.tab_1.tabpage_3.dw_ficha_sepult.setcolumn('hora_fijada')
		close(w_consultar_ficha)
	end if
end if
end event

type cb_cerrar from commandbutton within w_consultar_ficha
integer x = 3264
integer y = 1880
integer width = 297
integer height = 92
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consultar_ficha)
end event

type dw_parque from datawindow within w_consultar_ficha
integer x = 1134
integer y = 40
integer width = 594
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_parque.accepttext()
dw_lista.reset()
end event

type st_16 from statictext within w_consultar_ficha
integer x = 901
integer y = 48
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_consultar_ficha
integer x = 1769
integer y = 20
integer width = 151
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Datetime	ld_fec_ini
Long		ll_cod_parque
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')

ld_fec_ini	= datetime(date(em_fec_ini.text),lt_ini)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	if ll_cod_parque>0 then
		idw_detalle5.retrieve(ll_cod_parque)
		if dw_lista.retrieve(ld_fec_ini,ll_cod_parque)=0 then
			messagebox("Advertencia","No Registra Dato")
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type st_2 from statictext within w_consultar_ficha
integer x = 32
integer y = 48
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_consultar_ficha
integer x = 421
integer y = 40
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

type p_ini from picture within w_consultar_ficha
integer x = 782
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
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
	em_fec_ini.text = Message.StringParm
END IF
end event

type dw_lista from datawindow within w_consultar_ficha
integer x = 37
integer y = 172
integer width = 3525
integer height = 1652
integer taborder = 40
string title = "none"
string dataobject = "dw_consultar_ficha_sepultacion_traslado"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna
if row>0 then
	il_row		= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	ls_columna	= dwo.name
	if ls_columna='t_rojo' or ls_columna='t_anulados' then
		dw_lista.SETfilter('estado_reg = "A"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_blanco' or ls_columna='t_pendientes' then
		dw_lista.SETfilter('c_fecha_2="No" and estado_reg = "P" and today() <= fecha_sepultacion')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_amarillo' or ls_columna='t_gestionados' then
		dw_lista.SETfilter('estado_reg = "G"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_verde' or ls_columna='t_vencer' then
		dw_lista.SETfilter('c_fecha_2="Si" and estado_reg="P"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_celeste' or ls_columna='t_vencidos' then
		dw_lista.SETfilter('today() > fecha_sepultacion and c_fecha_2="No"')
		dw_lista.filter()
		if dw_lista.rowcount()=0 then
			messagebox("Advertencia","No Registra dato")
		end if
	elseif ls_columna='t_todo' then
		dw_lista.SETfilter('')
		dw_lista.filter()
	end if
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_consultar_ficha
integer x = 1289
integer y = 1824
integer width = 1147
integer height = 172
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

