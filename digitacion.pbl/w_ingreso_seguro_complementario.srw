forward
global type w_ingreso_seguro_complementario from window
end type
type st_1 from statictext within w_ingreso_seguro_complementario
end type
type cb_eliminar from commandbutton within w_ingreso_seguro_complementario
end type
type cb_grabar from commandbutton within w_ingreso_seguro_complementario
end type
type cb_cerrar from commandbutton within w_ingreso_seguro_complementario
end type
type dw_lista from datawindow within w_ingreso_seguro_complementario
end type
end forward

global type w_ingreso_seguro_complementario from window
integer width = 2848
integer height = 1044
boolean titlebar = true
string title = "Ingreso Seguro Complementario"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_1 st_1
cb_eliminar cb_eliminar
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_ingreso_seguro_complementario w_ingreso_seguro_complementario

type variables
String	is_base,is_serie
Long		il_cantidad,il_tipo_seguro,il_row_eli
Double	ild_factor,il_numero
end variables

event open;Long		ll_indi,ll_tot_reg,ll_new,ll_tipo_seguro,ll_resp
Double	ldb_factor
Datetime	ldt_fecha
gf_centrar(w_ingreso_seguro_complementario)

is_base			= trim(substr(1,1,Message.StringParm))
is_serie			= trim(substr(1,2,Message.StringParm))
il_numero		= Double(substr(1,3,Message.StringParm))
il_cantidad		= long(substr(1,4,Message.StringParm))
ild_factor		= double(substr(1,5,Message.StringParm))
il_tipo_seguro	= long(substr(1,6,Message.StringParm))
if isvalid(w_ingresar_oferta) then
	ldt_fecha	= w_ingresar_oferta.dw_oferta_v.getitemdatetime(1,'fecha')
elseif isvalid(w_ingresar_liberador) then
	ldt_fecha	= w_ingresar_liberador.dw_anexo_liberador.getitemdatetime(1,'fecha')
end if
if il_tipo_seguro=2 then
	dw_lista.dataobject	= 'dw_ingreso_seguro_complementario_2'
elseif il_tipo_seguro=1 then
	dw_lista.dataobject	= 'dw_ingreso_seguro_complementario'
elseif il_tipo_seguro=3 or il_tipo_seguro=5 then
	dw_lista.dataobject	= 'dw_ingreso_seguro_complementario_3'
end if
dw_lista.settransobject(sqlca)
dw_lista.getchild('codigo_seguro',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve()
ll_tot_reg			= dw_lista.retrieve(il_numero,is_base,is_serie)
if ll_tot_reg=0 then
	ll_new			= dw_lista.insertrow(0)
	dw_lista.scrolltorow(ll_new)
	if il_tipo_seguro=2 or il_tipo_seguro=3 or il_tipo_seguro=5 then
		dw_lista.setitem(ll_new,'cantidad_meses_renta',il_cantidad)
	end if
	dw_lista.setitem(ll_new,'base_ctto_original',is_base)
	dw_lista.setitem(ll_new,'serie_ctto_original',is_serie)
	dw_lista.setitem(ll_new,'numero_ctto_original',il_numero)
	dw_lista.setitem(ll_new,'fecha',ldt_fecha)
	dw_lista.setitem(ll_new,'folio_seguro',il_numero)
	dw_lista.setitem(ll_new,'factor',ild_factor)
	dw_lista.setitem(ll_new,'codigo_seguro',il_tipo_seguro)
	dw_lista.accepttext()
	dw_lista.setfocus()
	dw_lista.setcolumn('fecha')
else
	ll_tipo_seguro	= dw_lista.getitemnumber(1,'codigo_seguro')
	ldb_factor		= dw_lista.getitemnumber(1,'factor')
	if ll_tipo_seguro <> il_tipo_seguro then
		st_1.text	= 'Recuerde Ud ha Modificado Tipo de Seguro, debe Grabar los Cambios'
	else
		if ldb_factor <> ild_factor then
			st_1.text	= 'Existe Modificaciones en datos, debe Grabar antes de Salir'
		else
			st_1.text	= ''
		end if
	end if
	if il_tipo_seguro=2 or il_tipo_seguro=3 or il_tipo_seguro=5 then
		dw_lista.setitem(1,'cantidad_meses_renta',il_cantidad)
	end if
	dw_lista.setitem(1,'base_ctto_original',is_base)
	dw_lista.setitem(1,'serie_ctto_original',is_serie)
	dw_lista.setitem(1,'numero_ctto_original',il_numero)
	dw_lista.setitem(1,'folio_seguro',il_numero)
	dw_lista.setitem(1,'factor',ild_factor)
	dw_lista.setitem(1,'codigo_seguro',il_tipo_seguro)
	dw_lista.accepttext()
	dw_lista.setfocus()
	dw_lista.setcolumn('fecha')
end if
end event

on w_ingreso_seguro_complementario.create
this.st_1=create st_1
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.st_1,&
this.cb_eliminar,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_ingreso_seguro_complementario.destroy
destroy(this.st_1)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

type st_1 from statictext within w_ingreso_seguro_complementario
integer x = 933
integer y = 756
integer width = 1454
integer height = 128
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 255
long backcolor = 80269524
boolean focusrectangle = false
end type

type cb_eliminar from commandbutton within w_ingreso_seguro_complementario
integer x = 489
integer y = 780
integer width = 338
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;long	ll_resp

ll_resp	= MessageBox("Eliminar", "Está seguro de Eliminar Seguro ", Exclamation!, YesNo!, 2)
IF ll_resp = 1 THEN
	dw_lista.deleterow(1)
	if dw_lista.update()=1 then
		commit;
		messagebox("Eliminar","Eliminación Exitosa")
		if isvalid(w_ingresar_oferta) then
			w_ingresar_oferta.dw_oferta_v.object.pago_oferta_codigo_tipo_seguro.font.italic = 0
			cb_cerrar.triggerevent(clicked!)
		end if
	else
		rollback;
		messagebox("Error Eliminar","Error al Eliminar SQL: "+sqlca.sqlerrtext)
	end if
END IF


end event

type cb_grabar from commandbutton within w_ingreso_seguro_complementario
integer x = 46
integer y = 780
integer width = 338
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_folio,ll_cod_seguro,ll_cant_meses
String	ls_base_ori,ls_serie_ori
Datetime	ld_fecha
Double	ldb_uf_renta,ldb_uf_deceso,ldb_factor,ll_num_ori

dw_lista.accepttext()
ls_base_ori		= dw_lista.getitemstring(1,'base_ctto_original')
ls_serie_ori	= dw_lista.getitemstring(1,'serie_ctto_original')
ll_num_ori		= dw_lista.getitemnumber(1,'numero_ctto_original')
ll_folio			= dw_lista.getitemnumber(1,'folio_seguro')
ll_cod_seguro	= dw_lista.getitemnumber(1,'codigo_seguro')
ll_cant_meses	= dw_lista.getitemnumber(1,'cantidad_meses_renta')
ld_fecha			= dw_lista.getitemdatetime(1,'fecha')
ldb_uf_renta	= dw_lista.getitemnumber(1,'valor_renta_uf')
ldb_uf_deceso	= dw_lista.getitemnumber(1,'valor_deceso_uf')
ldb_factor		= dw_lista.getitemnumber(1,'factor')
if isnull(ls_base_ori) or ls_base_ori='' or isnull(ls_serie_ori) or ls_serie_ori='' or isnull(ll_num_ori) or ll_num_ori=0 then
	messagebox("Advertencia","Debe Ingresar Contrato Original")
elseif isnull(ll_folio) or ll_folio=0 then
	messagebox("Advertencia","Debe Ingresar Folio Seguro")
	dw_lista.setfocus()
	dw_lista.setcolumn('folio_seguro')
elseif isnull(ll_cod_seguro) or ll_cod_seguro=0 then
	messagebox("Advertencia","Debe Ingresar Seguro")
	dw_lista.setfocus()
	dw_lista.setcolumn('codigo_seguro')
elseif isnull(ld_fecha) then
	messagebox("Advertencia","Debe Ingresar Fecha")
	dw_lista.setfocus()
	dw_lista.setcolumn('fecha')
elseif (isnull(ll_cant_meses) or ll_cant_meses=0) and il_tipo_seguro=1 then
	messagebox("Advertencia","Debe Ingresar Cantidad Meses Renta")
	dw_lista.setfocus()
	dw_lista.setcolumn('cantidad_meses_renta')
elseif (isnull(ldb_uf_renta) or ldb_uf_renta=0) and il_tipo_seguro=1 then
	messagebox("Advertencia","Debe Ingresar Cantidad U.F. Renta")
	dw_lista.setfocus()
	dw_lista.setcolumn('valor_renta_uf')
elseif (isnull(ldb_uf_deceso) or ldb_uf_deceso=0) and il_tipo_seguro=1 then
	messagebox("Advertencia","Debe Ingresar Cantidad U.F. Deceso")
	dw_lista.setfocus()
	dw_lista.setcolumn('valor_deceso_uf')
elseif (isnull(ldb_factor) or ldb_factor=0) and il_tipo_seguro=1 then
	messagebox("Advertencia","Debe Ingresar Factor Seguro")
	dw_lista.setfocus()
	dw_lista.setcolumn('factor')
else
	if dw_lista.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		if isvalid(w_ingresar_oferta) then
			w_ingresar_oferta.dw_oferta_v.object.pago_oferta_codigo_tipo_seguro.font.italic = 1
			cb_cerrar.triggerevent(clicked!)
		elseif isvalid(w_ingresar_liberador) then
			w_ingresar_liberador.cb_ingresar.italic = true
			cb_cerrar.triggerevent(clicked!)
		end if
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_ingreso_seguro_complementario
integer x = 2450
integer y = 780
integer width = 338
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_seguro_complementario)
end event

type dw_lista from datawindow within w_ingreso_seguro_complementario
integer x = 41
integer y = 48
integer width = 2779
integer height = 680
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_seguro_complementario_3"
boolean border = false
end type

event itemchanged;String	ls_dv,ls_columna
Long		ll_rut,ll_tot_reg,ll_indi,ll_sum=0
if row>0 then
	dw_lista.accepttext()
	ls_columna						= dwo.name
//	if ls_columna='rut' then
//		ll_rut						= dw_lista.getitemnumber(row,'rut')
//		ll_tot_reg	= dw_lista.rowcount()
//		for ll_indi=1 to ll_tot_reg
//			if dw_lista.getitemnumber(ll_indi,'rut')=ll_rut then ll_sum ++
//		next
//		if ll_sum>1 then
//			messagebox("Advertencia","Error Beneficiario Duplicado")
//		end if
//	else
	if ls_columna='dv' then
		ll_rut						= dw_lista.getitemnumber(row,'rut')
		ls_dv							= dw_lista.getitemstring(row,'dv')
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es valido',stopsign!)
			cb_grabar.enabled		= false
			dw_lista.SetItem(row, "estado_rut",0)
			dw_lista.setfocus()
			dw_lista.setcolumn('dv')
		else
			cb_grabar.enabled		= true
			dw_lista.SetItem(1, "estado_rut",1)
			dw_lista.setcolumn('nombres')
		end if
	end if
	dw_lista.accepttext()
end if
end event

event clicked;String	ls_columna,ls_fecha
ls_columna	= dwo.name
if row>0 then il_row_eli=row
if ls_columna='p_1' then
	ls_fecha					= string(date(dw_lista.getitemdatetime(1,'fecha')))
	if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_lista.setitem(1,'fecha',datetime(string(today(),gs_formato_fecha)))
		return
	end if
	OpenWithParm(w_calendar,ls_fecha)
	IF not isnull(Message.StringParm) THEN
		ls_fecha				= trim(Message.StringParm)
		dw_lista.setitem(1,'fecha',date(ls_fecha))
	END IF
	dw_lista.setfocus()
	dw_lista.setcolumn('fecha')
end if
end event

event rowfocuschanged;if getrow()>0 then il_row_eli=getrow()
end event

