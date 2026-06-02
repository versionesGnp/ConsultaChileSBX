forward
global type w_carta_sepultacion from window
end type
type dw_carta from datawindow within w_carta_sepultacion
end type
type cb_carta from commandbutton within w_carta_sepultacion
end type
type pb_primer from picturebutton within w_carta_sepultacion
end type
type pb_sigue from picturebutton within w_carta_sepultacion
end type
type pb_antes from picturebutton within w_carta_sepultacion
end type
type pb_fin from picturebutton within w_carta_sepultacion
end type
type cb_grabar from commandbutton within w_carta_sepultacion
end type
type dw_buscar from datawindow within w_carta_sepultacion
end type
type st_16 from statictext within w_carta_sepultacion
end type
type dw_parque from datawindow within w_carta_sepultacion
end type
type pb_ok from picturebutton within w_carta_sepultacion
end type
type dw_print from datawindow within w_carta_sepultacion
end type
type cb_limpiar from commandbutton within w_carta_sepultacion
end type
type cb_cerrar from commandbutton within w_carta_sepultacion
end type
type dw_lista from datawindow within w_carta_sepultacion
end type
type gb_1 from groupbox within w_carta_sepultacion
end type
type cb_buscar from commandbutton within w_carta_sepultacion
end type
type cb_print from commandbutton within w_carta_sepultacion
end type
type gb_2 from groupbox within w_carta_sepultacion
end type
end forward

global type w_carta_sepultacion from window
integer width = 3570
integer height = 2764
boolean titlebar = true
string title = "Carta Sepultación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_carta dw_carta
cb_carta cb_carta
pb_primer pb_primer
pb_sigue pb_sigue
pb_antes pb_antes
pb_fin pb_fin
cb_grabar cb_grabar
dw_buscar dw_buscar
st_16 st_16
dw_parque dw_parque
pb_ok pb_ok
dw_print dw_print
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
cb_buscar cb_buscar
cb_print cb_print
gb_2 gb_2
end type
global w_carta_sepultacion w_carta_sepultacion

type variables
String	is_dv,is_nombre,is_ap_pat,is_ap_mat,is_tipo_via,is_direc,is_depto,is_block,is_sector_tit,&
			is_pob_tit,is_nro,is_fono_par,is_fono_com
Long		il_rut,il_modif
datawindowchild			idw_detalle5,idw_detalle6
end variables

on w_carta_sepultacion.create
this.dw_carta=create dw_carta
this.cb_carta=create cb_carta
this.pb_primer=create pb_primer
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_fin=create pb_fin
this.cb_grabar=create cb_grabar
this.dw_buscar=create dw_buscar
this.st_16=create st_16
this.dw_parque=create dw_parque
this.pb_ok=create pb_ok
this.dw_print=create dw_print
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.cb_buscar=create cb_buscar
this.cb_print=create cb_print
this.gb_2=create gb_2
this.Control[]={this.dw_carta,&
this.cb_carta,&
this.pb_primer,&
this.pb_sigue,&
this.pb_antes,&
this.pb_fin,&
this.cb_grabar,&
this.dw_buscar,&
this.st_16,&
this.dw_parque,&
this.pb_ok,&
this.dw_print,&
this.cb_limpiar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.cb_buscar,&
this.cb_print,&
this.gb_2}
end on

on w_carta_sepultacion.destroy
destroy(this.dw_carta)
destroy(this.cb_carta)
destroy(this.pb_primer)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_fin)
destroy(this.cb_grabar)
destroy(this.dw_buscar)
destroy(this.st_16)
destroy(this.dw_parque)
destroy(this.pb_ok)
destroy(this.dw_print)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.cb_buscar)
destroy(this.cb_print)
destroy(this.gb_2)
end on

event open;Long	ll_new

il_modif	= 0
gf_centrar(w_carta_sepultacion)
dw_parque.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_carta.settransobject(sqlca)
dw_parque.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
dw_buscar.settransobject(sqlca)
dw_buscar.getchild('sepultura',idw_detalle6)
idw_detalle6.settransobject(sqlca)
idw_detalle6.insertrow(0)

dw_buscar.getchild('sector',idw_detalle5)
idw_detalle5.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'cod_parque',1)
	idw_detalle5.retrieve(1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(1,'cod_parque',11)
	idw_detalle5.retrieve(11)
end if
ll_new		= dw_buscar.insertrow(0)
gs_ventana	= 'w_carta_sepultacion'
f_valida_objeto2()
dw_buscar.accepttext()
end event

type dw_carta from datawindow within w_carta_sepultacion
boolean visible = false
integer x = 1129
integer y = 2624
integer width = 411
integer height = 432
string dataobject = "dw_carta_autorizacion_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_carta from commandbutton within w_carta_sepultacion
integer x = 1303
integer y = 2508
integer width = 389
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Carta"
end type

event clicked;Long		ll_corr,ll_parque
String	ls_sector,ls_sepul
Datetime	ldt_fecha
if dw_lista.rowcount() > 0 then 
	ll_corr		= dw_lista.getitemnumber(dw_lista.getrow(),'correlativo')
//	ll_corr		= dw_lista.getrow()
	ll_parque	= dw_lista.getitemnumber(dw_lista.getrow(),'cod_parque')
	ls_sector	= dw_lista.getitemstring(dw_lista.getrow(),'sector')
	ls_sepul		= dw_lista.getitemstring(dw_lista.getrow(),'sepultura')
	ldt_fecha	= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_sepultacion')
	if ll_parque>0 and not isnull(ls_sepul) then
		if dw_carta.retrieve(ls_sector,ls_sepul,ldt_fecha,ll_parque,ll_corr)>0 then
			f_Print( dw_carta )
			dw_carta.print()
		else
			messagebox("Advertencia","No Registra Carta de Autorización de Sepultación")
		end if
	end if
end if

end event

type pb_primer from picturebutton within w_carta_sepultacion
integer x = 2391
integer y = 2512
integer width = 119
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
dw_lista.setfocus()
end event

type pb_sigue from picturebutton within w_carta_sepultacion
integer x = 2514
integer y = 2512
integer width = 119
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
dw_lista.setfocus()
end event

type pb_antes from picturebutton within w_carta_sepultacion
integer x = 2638
integer y = 2512
integer width = 119
integer height = 88
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
dw_lista.setfocus()
end event

type pb_fin from picturebutton within w_carta_sepultacion
integer x = 2761
integer y = 2512
integer width = 119
integer height = 88
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount())
dw_lista.setfocus()
end event

type cb_grabar from commandbutton within w_carta_sepultacion
integer x = 46
integer y = 2504
integer width = 311
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_indi,ll_tot_reg,ll_rut
Long		ll_corr,ll_new,ll_new_lap
double	ll_numero
String	ls_cod_parent,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_depto,&
			ls_block,ls_sector_tit,ls_pob_tit,ls_nro,ls_pasa,ls_fono_p,ls_fono_c,ls_base,ls_serie,ls_sector,ls_sepultura

if il_modif > 0 then
	ll_tot_reg			= dw_lista.rowcount()
	ls_pasa				= 'S'
	for ll_indi=1 to ll_tot_reg
		ls_cod_parent	= dw_lista.Getitemstring(ll_indi,'cod_parentesco_autoriza')
		ll_rut			= dw_lista.getitemnumber(ll_indi,'rut_titular')
		ls_dv				= dw_lista.getitemstring(ll_indi,'dv_titular')
		ls_nombre		= dw_lista.getitemstring(ll_indi,'nombre_titular')
		ls_ap_pat		= dw_lista.getitemstring(ll_indi,'apellido_paterno_titular')
		ls_ap_mat		= dw_lista.getitemstring(ll_indi,'apellido_materno_titular')
		ls_tipo_via		= dw_lista.getitemstring(ll_indi,'tipo_via_titular')
		ls_direc			= dw_lista.getitemstring(ll_indi,'direccion_titular')
		ls_nro			= dw_lista.getitemstring(ll_indi,'numero_direccion_titular')
		ls_depto			= dw_lista.getitemstring(ll_indi,'depto_direccion_titular')
		ls_block			= dw_lista.getitemstring(ll_indi,'block_direccion_titular')
		ls_sector_tit	= dw_lista.getitemstring(ll_indi,'sector_titular')
		ls_pob_tit		= dw_lista.getitemstring(ll_indi,'poblacion_villa_titular')
		ls_fono_p		= dw_lista.getitemstring(ll_indi,'fono_particular_titular')
		ls_fono_c		= dw_lista.getitemstring(ll_indi,'fono_comercial_titular')
		ls_base			= dw_lista.getitemstring(ll_indi,'base')
		ls_serie			= dw_lista.getitemstring(ll_indi,'serie')
		ll_numero		= dw_lista.getitemnumber(ll_indi,'numero')
		ls_sector			= dw_lista.getitemstring(ll_indi,'sector')
		ls_sepultura		= dw_lista.getitemstring(ll_indi,'sepultura')
		if isnull(ls_cod_parent) or ls_cod_parent='' then
			messagebox("Advertencia","Debe Seleccionar PARENTESCO en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('cod_parentesco_autoriza')
			ls_pasa		= 'N'
			exit
		elseif isnull(ll_rut) or ll_rut=0 then
			messagebox("Advertencia","Debe Ingresar RUT en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('rut_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_dv) or ls_dv='' or ls_dv='-' then
			messagebox("Advertencia","Debe Ingresar DIGITO VERIFICADOR en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('dv_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_nombre) or ls_nombre='' or ls_nombre='-' then
			messagebox("Advertencia","Debe Ingresar NOMBRE en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('nombre_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_ap_pat) or ls_ap_pat='' or ls_ap_pat='-' then
			messagebox("Advertencia","Debe Ingresar APELLIDO PATERNO en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('apellido_paterno_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_ap_mat) or ls_ap_mat='' then
			messagebox("Advertencia","Debe Ingresar APELLIDO MATERNO en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('apellido_materno_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_tipo_via) or ls_tipo_via='' then
			messagebox("Advertencia","Debe Ingresar TIPO VIA en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('tipo_via_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_direc) or ls_direc='' then
			messagebox("Advertencia","Debe Ingresar DIRECCION en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('direccion_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_nro) or ls_nro='' then
			messagebox("Advertencia","Debe Ingresar NUMERO en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('numero_direccion_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_depto) or ls_depto='' then
			messagebox("Advertencia","Debe Ingresar DEPARTAMENTO en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('depto_direccion_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_block) or ls_block='' then
			messagebox("Advertencia","Debe Ingresar BLOCK en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('block_direccion_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_sector_tit) or ls_sector_tit='' then
			messagebox("Advertencia","Debe Ingresar SECTOR en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('sector_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_pob_tit) or ls_pob_tit='' then
			messagebox("Advertencia","Debe Ingresar POBLACION O VILLA en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('poblacion_villa_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_fono_p) or ls_fono_p='' then
			messagebox("Advertencia","Debe Ingresar FONO PARTICULAR en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('fono_particular_titular')
			ls_pasa		= 'N'
			exit
		elseif isnull(ls_fono_c) or ls_fono_c='' then
			messagebox("Advertencia","Debe Ingresar FONO COMERCIAL en Carta Autorización Nº "+string(ll_indi))
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setfocus()
			dw_lista.setcolumn('fono_comercial_titular')
			ls_pasa		= 'N'
			exit
		end if
		ll_new		= ll_indi
	next
	SELECT count("FICHA_CARTA_SEPULTACION"."CORRELATIVO")
	INTO		:ll_corr
   	FROM 	"FICHA_CARTA_SEPULTACION"  
   	WHERE 	( "FICHA_CARTA_SEPULTACION"."BASE" = :ls_base ) AND
				( "FICHA_CARTA_SEPULTACION"."SERIE" = :ls_serie ) AND
				( "FICHA_CARTA_SEPULTACION"."NUMERO" = :ll_numero ) AND	
				( "FICHA_CARTA_SEPULTACION"."SECTOR" = :ls_sector ) AND  
        			( "FICHA_CARTA_SEPULTACION"."SEPULTURA" = :ls_sepultura )

	USING	 sqlca;
	if isnull(ll_corr) or ll_corr <= 1 then
		ll_corr	= 1
	else
		ll_corr	= ll_corr
	end if
	if ls_pasa = 'S' then
		dw_lista.Setitem(ll_new,'correlativo',ll_corr)
		if dw_lista.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_mantenedor_estadistico) then close(w_carta_sepultacion)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Carta Autorización SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type dw_buscar from datawindow within w_carta_sepultacion
integer x = 864
integer y = 40
integer width = 1563
integer height = 104
integer taborder = 20
string title = "none"
string dataobject = "dwe_seleccionar_sector_sepultura"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_sector
Long		ll_cod_parque

this.accepttext()
dw_lista.reset()
dw_lista.insertrow(0)
ls_columna	= dwo.name
if ls_columna='cod_parque' then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	idw_detalle5.retrieve(ll_cod_parque)
elseif ls_columna='sector' then
	ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
	ls_sector		= dw_buscar.getitemstring(1,'sector')
	idw_detalle6.retrieve(ll_cod_parque,ls_sector)
end if
end event

type st_16 from statictext within w_carta_sepultacion
integer x = 23
integer y = 52
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

type dw_parque from datawindow within w_carta_sepultacion
integer x = 256
integer y = 44
integer width = 594
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque
dw_parque.accepttext()
dw_lista.reset()
dw_lista.insertrow(0)
ll_cod_parque	= this.getitemnumber(1,'cod_parque')
idw_detalle5.retrieve(ll_cod_parque)
end event

type pb_ok from picturebutton within w_carta_sepultacion
integer x = 2487
integer y = 24
integer width = 160
integer height = 132
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

event clicked;String	ls_sector,ls_sepultura
Long		ll_cod_parque,ll_fila

dw_lista.reset()
dw_lista.insertrow(0)
ls_sector		= dw_buscar.getitemstring(1,'sector')
ls_sepultura	= dw_buscar.getitemstring(1,'sepultura')
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if not isnull(ls_sector) and not isnull(ls_sepultura) and ll_cod_parque>0 then
	if dw_lista.retrieve(ls_sector,ls_sepultura,ll_cod_parque)=0 then
		dw_lista.insertrow(0)
		messagebox("Advertencia","No Registra Dato")
	else
		ll_fila	= dw_lista.Find("estado_reg <> 'G'", 1, dw_lista.RowCount())
		if ll_fila > 0 then
			cb_grabar.enabled	= true
		else
			cb_grabar.enabled	= true
		end if
		dw_lista.scrolltorow(dw_lista.rowcount())
	end if
else
	if isnull(ls_sector) then
		messagebox("Advertencia","Debe Ingresar Sector")
		dw_buscar.setcolumn('sector')
	elseif isnull(ls_sepultura) then
		messagebox("Advertencia","Debe Ingresar Sepultura")
		dw_buscar.setcolumn('sepultura')
	elseif ll_cod_parque=0 or isnull(ll_cod_parque) then
		messagebox("Advertencia","Debe Ingresar Parque")
		dw_parque.setfocus()
	end if
end if
end event

type dw_print from datawindow within w_carta_sepultacion
boolean visible = false
integer x = 457
integer y = 2616
integer width = 539
integer height = 432
string dataobject = "dw_solicitud_grabacion_lapida_print"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_limpiar from commandbutton within w_carta_sepultacion
integer x = 1783
integer y = 2508
integer width = 302
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_resp,ll_new

ll_resp	= messagebox("ADVERTENCIA","Está seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	dw_parque.reset()
	dw_print.reset()
	dw_parque.insertrow(0)
	dw_lista.reset()
	dw_lista.insertrow(0)
	dw_buscar.reset()
	dw_buscar.getchild('sepultura',idw_detalle6)
	idw_detalle6.settransobject(sqlca)
	idw_detalle6.reset()
	idw_detalle6.insertrow(0)
	
	dw_buscar.getchild('sector',idw_detalle5)
	idw_detalle5.settransobject(sqlca)
	if gs_conexion	= "Parque El Prado" then
		dw_parque.setitem(1,'cod_parque',1)
		idw_detalle5.retrieve(1)
	elseif gs_conexion = "Parque La Foresta" then
		dw_parque.setitem(1,'cod_parque',11)
		idw_detalle5.retrieve(11)
	end if
	ll_new	= dw_buscar.insertrow(0)
	dw_buscar.accepttext()
end if
dw_parque.setfocus()
end event

type cb_cerrar from commandbutton within w_carta_sepultacion
integer x = 3150
integer y = 2504
integer width = 347
integer height = 100
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_carta_sepultacion)
end event

type dw_lista from datawindow within w_carta_sepultacion
integer x = 46
integer y = 176
integer width = 3451
integer height = 2272
integer taborder = 40
string title = "none"
string dataobject = "dw_ingreso_carta_autorizacion"
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String	ls_columna,ls_dv,ls_cod_parentesco,ls_nulo
Long		ll_rut,ll_res,ll_nulo

this.accepttext()
il_modif ++
Setnull(ls_nulo);Setnull(ll_nulo)
ls_columna	= dwo.name
if ls_columna='rut_titular' or ls_columna='dv_titular' then
	ll_rut				= this.getitemnumber(this.getrow(),'rut_titular')
	ls_dv					= this.getitemstring(this.getrow(),'dv_titular')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
		else
			if ll_rut>0 and il_rut>0 then
				if ll_rut <> il_rut then
					ls_cod_parentesco	= this.Getitemstring(this.getrow(),'cod_parentesco_autoriza')
					if ls_cod_parentesco='19' then
						messagebox("Advertencia","Debe Seleccionar Parentesco quien Autoriza")
					end if
				else
					this.Setitem(this.getrow(),'rut_titular',il_rut)
					this.Setitem(this.getrow(),'dv_titular',is_dv)
					this.Setitem(this.getrow(),'nombre_titular',is_nombre)
					this.Setitem(this.getrow(),'apellido_paterno_titular',is_ap_pat)
					this.Setitem(this.getrow(),'apellido_materno_titular',is_ap_mat)
					this.Setitem(this.getrow(),'tipo_via_titular',is_tipo_via)
					this.Setitem(this.getrow(),'direccion_titular',is_direc)
					this.Setitem(this.getrow(),'numero_direccion_titular',is_nro)
					this.Setitem(this.getrow(),'depto_direccion_titular',is_depto)
					this.Setitem(this.getrow(),'block_direccion_titular',is_block)
					this.Setitem(this.getrow(),'sector_titular',is_sector_tit)
					this.Setitem(this.getrow(),'poblacion_villa_titular',is_pob_tit)
					this.Setitem(this.getrow(),'fono_particular_titular',is_fono_par)
					this.Setitem(this.getrow(),'fono_comercial_titular',is_fono_com)
				end if
			end if
		end if 
	end if
end if
if ls_columna='cod_parentesco_autoriza' then
	ls_cod_parentesco	= trim(data)
	if ls_cod_parentesco='19' then
		this.Setitem(this.getrow(),'rut_titular',il_rut)
		this.Setitem(this.getrow(),'dv_titular',is_dv)
		this.Setitem(this.getrow(),'nombre_titular',is_nombre)
		this.Setitem(this.getrow(),'apellido_paterno_titular',is_ap_pat)
		this.Setitem(this.getrow(),'apellido_materno_titular',is_ap_mat)
		this.Setitem(this.getrow(),'tipo_via_titular',is_tipo_via)
		this.Setitem(this.getrow(),'direccion_titular',is_direc)
		this.Setitem(this.getrow(),'numero_direccion_titular',is_nro)
		this.Setitem(this.getrow(),'depto_direccion_titular',is_depto)
		this.Setitem(this.getrow(),'block_direccion_titular',is_block)
		this.Setitem(this.getrow(),'sector_titular',is_sector_tit)
		this.Setitem(this.getrow(),'poblacion_villa_titular',is_pob_tit)
		this.Setitem(this.getrow(),'fono_particular_titular',is_fono_par)
		this.Setitem(this.getrow(),'fono_comercial_titular',is_fono_com)
		this.accepttext()
	else
		ll_res	= messagebox("Advertencia","En caso de NO ser Titular se debe Registra, desea Ingresar Antecedentes",Exclamation!,YesNo!,2)
		if ll_res=1 then
			this.Setitem(this.getrow(),'rut_titular',ll_nulo)
			this.Setitem(this.getrow(),'dv_titular',ls_nulo)
			this.Setitem(this.getrow(),'nombre_titular',ls_nulo)
			this.Setitem(this.getrow(),'apellido_paterno_titular',ls_nulo)
			this.Setitem(this.getrow(),'apellido_materno_titular',ls_nulo)
			this.Setitem(this.getrow(),'tipo_via_titular',ls_nulo)
			this.Setitem(this.getrow(),'direccion_titular',ls_nulo)
			this.Setitem(this.getrow(),'numero_direccion_titular',ls_nulo)
			this.Setitem(this.getrow(),'depto_direccion_titular',ls_nulo)
			this.Setitem(this.getrow(),'block_direccion_titular',ls_nulo)
			this.Setitem(this.getrow(),'sector_titular',ls_nulo)
			this.Setitem(this.getrow(),'poblacion_villa_titular',ls_nulo)
			this.Setitem(this.getrow(),'fono_particular_titular',ls_nulo)
			this.Setitem(this.getrow(),'fono_comercial_titular',ls_nulo)
			this.accepttext()
		end if
	end if
end if
end event

event itemfocuschanged;String	ls_columna,ls_dv,ls_nulo,ls_cod_parentesco
Long		ll_rut

ls_columna					= dwo.name
if ls_columna<>'rut_titular' or ls_columna<>'dv_titular' then
	Setnull(ls_nulo)
	ll_rut					= this.getitemnumber(this.getrow(),'rut_titular')
	ls_dv						= this.getitemstring(this.getrow(),'dv_titular')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			this.Setitem(this.getrow(),'dv_titular',ls_nulo)
			this.setcolumn('dv_titular')
		else
			if ll_rut>0 and il_rut>0 then
				if ll_rut <> il_rut then
					ls_cod_parentesco	= this.Getitemstring(this.getrow(),'cod_parentesco_autoriza')
					if ls_cod_parentesco='19' then
						this.Setitem(this.getrow(),'cod_parentesco_autoriza',ls_nulo)
						this.setcolumn('cod_parentesco_autoriza')
					end if
				end if
				il_rut			= this.getitemnumber(this.getrow(),'rut_titular')
				is_dv				= this.getitemstring(this.getrow(),'dv_titular')
				is_nombre		= this.getitemstring(this.getrow(),'nombre_titular')
				is_ap_pat		= this.getitemstring(this.getrow(),'apellido_paterno_titular')
				is_ap_mat		= this.getitemstring(this.getrow(),'apellido_materno_titular')
				is_tipo_via		= this.getitemstring(this.getrow(),'tipo_via_titular')
				is_direc			= this.getitemstring(this.getrow(),'direccion_titular')
				is_nro			= this.getitemstring(this.getrow(),'numero_direccion_titular')
				is_depto			= this.getitemstring(this.getrow(),'depto_direccion_titular')
				is_block			= this.getitemstring(this.getrow(),'block_direccion_titular')
				is_sector_tit	= this.getitemstring(this.getrow(),'sector_titular')
				is_pob_tit		= this.getitemstring(this.getrow(),'poblacion_villa_titular')
				is_fono_par		= this.getitemstring(this.getrow(),'fono_particular_titular')
				is_fono_com		= this.getitemstring(this.getrow(),'fono_comercial_titular')
			end if
		end if 
	end if
end if
end event

event clicked;String	ls_columna,ls_dv,ls_cod_pare,ls_nom,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,&
			ls_depto,ls_block,ls_sector,ls_pobl,ls_nro,ls_fono_part,ls_fono_com
Long		ll_indi,ll_tot_reg,ll_rut,ll_fila

ls_columna				= dwo.name
if ls_columna='t_copiar' then
//	if dw_lista.object.t_copiar.visible = true then
		ll_tot_reg		= dw_lista.rowcount()
		if ll_tot_reg > 1 then
			ll_fila		= row
			ll_rut		= dw_lista.getitemnumber(ll_fila,'rut_titular')
			ls_dv			= dw_lista.getitemstring(ll_fila,'dv_titular')
			ls_cod_pare	= dw_lista.getitemstring(ll_fila,'cod_parentesco_autoriza')
			ls_nom		= dw_lista.getitemstring(ll_fila,'nombre_titular')
			ls_ap_pat	= dw_lista.getitemstring(ll_fila,'apellido_paterno_titular')
			ls_ap_mat	= dw_lista.getitemstring(ll_fila,'apellido_materno_titular')
			ls_tipo_via	= dw_lista.getitemstring(ll_fila,'tipo_via_titular')
			ls_direc		= dw_lista.getitemstring(ll_fila,'direccion_titular')
			ls_nro		= dw_lista.getitemstring(ll_fila,'numero_direccion_titular')
			ls_depto		= dw_lista.getitemstring(ll_fila,'depto_direccion_titular')
			ls_block		= dw_lista.getitemstring(ll_fila,'block_direccion_titular')
			ls_sector	= dw_lista.getitemstring(ll_fila,'sector_titular')
			ls_pobl		= dw_lista.getitemstring(ll_fila,'poblacion_villa_titular')
			ls_fono_part= dw_lista.getitemstring(ll_fila,'fono_particular_titular')
			ls_fono_com	= dw_lista.getitemstring(ll_fila,'fono_comercial_titular')
			if ll_fila=ll_tot_reg then
				messagebox("Advertencia","No es Posible COPIAR, se encuentra Posicionado en el último Registro")
			else
				if ll_fila < ll_tot_reg then
					ll_fila ++
					il_modif ++
					for ll_indi=ll_fila to ll_tot_reg
						dw_lista.Setitem(ll_indi,'rut_titular',ll_rut)
						dw_lista.Setitem(ll_indi,'dv_titular',ls_dv)
						dw_lista.Setitem(ll_indi,'cod_parentesco_autoriza',ls_cod_pare)
						dw_lista.Setitem(ll_indi,'nombre_titular',ls_nom)
						dw_lista.Setitem(ll_indi,'apellido_paterno_titular',ls_ap_pat)
						dw_lista.Setitem(ll_indi,'apellido_materno_titular',ls_ap_mat)
						dw_lista.Setitem(ll_indi,'tipo_via_titular',ls_tipo_via)
						dw_lista.Setitem(ll_indi,'direccion_titular',ls_direc)
						dw_lista.Setitem(ll_indi,'numero_direccion_titular',ls_nro)
						dw_lista.Setitem(ll_indi,'depto_direccion_titular',ls_depto)
						dw_lista.Setitem(ll_indi,'block_direccion_titular',ls_block)
						dw_lista.Setitem(ll_indi,'sector_titular',ls_sector)
						dw_lista.Setitem(ll_indi,'poblacion_villa_titular',ls_pobl)
						dw_lista.Setitem(ll_indi,'fono_particular_titular',ls_fono_part)
						dw_lista.Setitem(ll_indi,'fono_comercial_titular',ls_fono_com)
					next
				end if
			end if
		end if
//	end if
end if
end event

type gb_1 from groupbox within w_carta_sepultacion
integer x = 2359
integer y = 2456
integer width = 553
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_buscar from commandbutton within w_carta_sepultacion
integer x = 535
integer y = 2508
integer width = 443
integer height = 100
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Carta"
end type

event clicked;if isvalid(w_buscar_ficha) then close(w_buscar_ficha)
OpenWithParm(w_buscar_ficha, "CS")
end event

type cb_print from commandbutton within w_carta_sepultacion
boolean visible = false
integer x = 1513
integer y = 2708
integer width = 302
integer height = 92
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimir"
end type

event clicked;Long		ll_corr,ll_parque,ll_cap,ll_hora,ll_imagen
String	ls_sector,ls_sepul,ls_dir_par,ls_nro_tec,ls_nom,ls_ap_pat,ls_ap_mat,ls_nombre_archivo,&
			ls_fono_p,ls_fono_c
datetime	ldt_fecha

if dw_lista.rowcount() > 0 then 
	ll_corr		= dw_lista.getitemnumber(dw_lista.getrow(),'correlativo')
	ll_parque	= dw_lista.getitemnumber(dw_lista.getrow(),'cod_parque')
	ls_sector	= dw_lista.getitemstring(dw_lista.getrow(),'sector')
	ls_sepul		= dw_lista.getitemstring(dw_lista.getrow(),'sepultura')
	ldt_fecha	= dw_lista.getitemdatetime(dw_lista.getrow(),'fecha_carta')
	ls_dir_par	= dw_lista.getitemstring(dw_lista.getrow(),'direccion_titular')
	ls_nro_tec	= dw_lista.getitemstring(dw_lista.getrow(),'numero_tecnico')
	ll_cap		= dw_lista.getitemnumber(dw_lista.getrow(),'capacidad')
	ls_nom		= dw_lista.getitemstring(dw_lista.getrow(),'nombre_fallecido')
	ls_ap_pat	= dw_lista.getitemstring(dw_lista.getrow(),'apellido_paterno_fall')
	ls_ap_mat	= dw_lista.getitemstring(dw_lista.getrow(),'apellido_materno_fall')
	ll_hora		= dw_lista.getitemnumber(dw_lista.getrow(),'hora_sepultacion')
	ls_fono_p	= dw_lista.getitemstring(dw_lista.getrow(),'fono_particular_titular')
	ls_fono_c	= dw_lista.getitemstring(dw_lista.getrow(),'fono_comercial_titular')
	if ll_parque=0 or isnull(ll_parque) then
		messagebox("Advertencia","recuerde falta Ingresar PARQUE")
	elseif isnull(ls_sector) or ls_sector='' or ls_sector='-' then
		messagebox("Advertencia","recuerde falta Ingresar SECTOR")
	elseif isnull(ls_sepul) or ls_sepul='' or ls_sepul='-' then
		messagebox("Advertencia","recuerde falta Ingresar SEPULTURA")
	elseif isnull(ldt_fecha) then
		messagebox("Advertencia","recuerde falta Ingresar FECHA DE SEPULTACION")
	elseif isnull(ls_dir_par) or ls_dir_par='' or ls_dir_par='-' then
		messagebox("Advertencia","recuerde falta Ingresar DIRECCION TITULAR")
	elseif isnull(ls_nro_tec) or ls_nro_tec='' or ls_nro_tec='-' then
		messagebox("Advertencia","recuerde falta Ingresar NUMERO TECNICO")
	elseif isnull(ll_cap) or ll_cap=0 then
		messagebox("Advertencia","recuerde falta Ingresar CAPACIDAD")
	elseif isnull(ls_nom) or ls_nom='' or ls_nom='-' then
		messagebox("Advertencia","recuerde falta Ingresar NOMBRE FALLECIDO")
	elseif isnull(ls_ap_pat) or ls_ap_pat='' then
		messagebox("Advertencia","recuerde falta Ingresar APELLIDO PATERNO FALLECIDO")
	elseif isnull(ls_ap_mat) or ls_ap_mat='' then
		messagebox("Advertencia","recuerde falta Ingresar APELLIDO MATERNO FALLECIDO")
	elseif isnull(ll_hora) or ll_hora=0 then
		messagebox("Advertencia","recuerde falta Ingresar HORA SEPULTACION")
	elseif isnull(ls_fono_p) or ls_fono_p='' then
		messagebox("Advertencia","recuerde falta Ingresar FONO PARTICULAR")
	elseif isnull(ls_fono_c) or ls_fono_c='' then
		messagebox("Advertencia","recuerde falta Ingresar FONO COMERCIAL")
	end if
	if dw_print.retrieve(ls_sector,ls_sepul,ll_parque,ldt_fecha,ll_corr)>0 then
		ll_imagen	= dw_print.getitemnumber(1,'codigo_imagen')
		SELECT	"FICHA_CUNOS"."NOMBRE_ARCHIVO"  
		INTO 		:ls_nombre_archivo  
		FROM 		"FICHA_CUNOS"  
		WHERE 	"FICHA_CUNOS"."CODIGO" = :ll_imagen   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_print.object.p_1.Filename 	= ls_nombre_archivo
		else
			dw_print.object.p_1.Filename 	= ''
		end if
		f_Print( dw_print )
		dw_print.print()
		dw_print.print()
	end if
end if

end event

type gb_2 from groupbox within w_carta_sepultacion
integer x = 1275
integer y = 2456
integer width = 837
integer height = 168
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

