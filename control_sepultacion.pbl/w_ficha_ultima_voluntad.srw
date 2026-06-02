forward
global type w_ficha_ultima_voluntad from window
end type
type st_contrato from statictext within w_ficha_ultima_voluntad
end type
type st_2 from statictext within w_ficha_ultima_voluntad
end type
type st_help from statictext within w_ficha_ultima_voluntad
end type
type st_1 from statictext within w_ficha_ultima_voluntad
end type
type st_nombre from statictext within w_ficha_ultima_voluntad
end type
type st_rut from statictext within w_ficha_ultima_voluntad
end type
type cb_eliminar from commandbutton within w_ficha_ultima_voluntad
end type
type cb_nuevo from commandbutton within w_ficha_ultima_voluntad
end type
type dw_detalle from datawindow within w_ficha_ultima_voluntad
end type
type cb_cerrar from commandbutton within w_ficha_ultima_voluntad
end type
type cb_grabar from commandbutton within w_ficha_ultima_voluntad
end type
type dw_lista from datawindow within w_ficha_ultima_voluntad
end type
end forward

global type w_ficha_ultima_voluntad from window
integer width = 3063
integer height = 2252
boolean titlebar = true
string title = "Ultima Voluntad"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_contrato st_contrato
st_2 st_2
st_help st_help
st_1 st_1
st_nombre st_nombre
st_rut st_rut
cb_eliminar cb_eliminar
cb_nuevo cb_nuevo
dw_detalle dw_detalle
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_lista dw_lista
end type
global w_ficha_ultima_voluntad w_ficha_ultima_voluntad

type variables
Long		il_row,il_rut,il_cod_parque_cta,il_modif
String		is_base,is_serie,is_apellido_paterno,is_apellido_materno,is_nombres,is_dv
Double	il_numero
end variables

on w_ficha_ultima_voluntad.create
this.st_contrato=create st_contrato
this.st_2=create st_2
this.st_help=create st_help
this.st_1=create st_1
this.st_nombre=create st_nombre
this.st_rut=create st_rut
this.cb_eliminar=create cb_eliminar
this.cb_nuevo=create cb_nuevo
this.dw_detalle=create dw_detalle
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.Control[]={this.st_contrato,&
this.st_2,&
this.st_help,&
this.st_1,&
this.st_nombre,&
this.st_rut,&
this.cb_eliminar,&
this.cb_nuevo,&
this.dw_detalle,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_lista}
end on

on w_ficha_ultima_voluntad.destroy
destroy(this.st_contrato)
destroy(this.st_2)
destroy(this.st_help)
destroy(this.st_1)
destroy(this.st_nombre)
destroy(this.st_rut)
destroy(this.cb_eliminar)
destroy(this.cb_nuevo)
destroy(this.dw_detalle)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_ficha_ultima_voluntad)
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
is_base					= substr(1,1,Message.StringParm)
is_serie					= substr(1,2,Message.StringParm)
il_numero				= Double(substr(1,3,Message.StringParm))
il_rut						= Long(substr(1,4,Message.StringParm))
is_apellido_paterno	= substr(1,5,Message.StringParm)
is_apellido_materno	= substr(1,6,Message.StringParm)
is_nombres				= substr(1,7,Message.StringParm)
is_dv						= substr(1,8,Message.StringParm)
il_cod_parque_cta		= Long(substr(1,9,Message.StringParm))
st_rut.text				= string(il_rut,'###,###,###,###,###')+'-'+is_dv
st_nombre.text			= is_nombres+' '+is_apellido_paterno+' '+is_apellido_materno
st_contrato.text		= is_base+'-'+is_serie+'-'+string(il_numero,'###,###,###,###,###')
st_help.visible		= false
if dw_lista.retrieve(il_rut)=0 then
	dw_detalle.Modify("DataWindow.Header.Height=1036")
	dw_detalle.Modify("DataWindow.Detail.Height=0")
else
	dw_detalle.Modify("DataWindow.Header.Height=0")
	dw_detalle.Modify("DataWindow.Detail.Height=1100")
end if
end event

type st_contrato from statictext within w_ficha_ultima_voluntad
integer x = 2587
integer y = 32
integer width = 430
integer height = 84
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ficha_ultima_voluntad
integer x = 2286
integer y = 36
integer width = 288
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NºContrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_help from statictext within w_ficha_ultima_voluntad
integer x = 379
integer y = 1992
integer width = 1216
integer height = 84
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Lucida Sans"
long textcolor = 255
long backcolor = 67108864
string text = "Recuerde Grabar Observación"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ficha_ultima_voluntad
integer x = 18
integer y = 36
integer width = 201
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cliente"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nombre from statictext within w_ficha_ultima_voluntad
integer x = 663
integer y = 32
integer width = 1595
integer height = 84
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_rut from statictext within w_ficha_ultima_voluntad
integer x = 256
integer y = 32
integer width = 379
integer height = 84
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_eliminar from commandbutton within w_ficha_ultima_voluntad
integer x = 1961
integer y = 1972
integer width = 320
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Inactivar"
end type

event clicked;Long		ll_rut
String		ls_obs,ls_estado
Double	ll_numero
ll_rut			= dw_detalle.getitemnumber(1,'rut')
ll_numero	= dw_detalle.getitemnumber(1,'numero')
ls_obs		= dw_detalle.getitemstring(1,'observacion')
ls_estado	= dw_detalle.getitemstring(1,'estado_reg')
if ll_numero > 0 and not isnull(ls_obs) and ll_rut > 0 and not isnull(ls_estado) then
	if ls_estado='I' then
		messagebox("Advertencia","Registro Inactivo")
	else
		dw_detalle.setitem(1,'estado_reg','I')
		dw_detalle.accepttext()
		if dw_detalle.update()=1 then
			messagebox("Inactivar","Inactivación Exitosa")
			dw_lista.retrieve(il_rut)
		else
			messagebox("Error Inactivar","Error al Inactivar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if


end event

type cb_nuevo from commandbutton within w_ficha_ultima_voluntad
integer x = 1637
integer y = 1972
integer width = 320
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Nuevo"
end type

event clicked;Long		ll_new,ll_corr
String	ls_sector,ls_sepultura

dw_detalle.Modify("DataWindow.Header.Height=0")
dw_detalle.Modify("DataWindow.Detail.Height=1100")
dw_detalle.reset()
ll_new	= dw_detalle.insertrow(0)
st_help.visible	= true
//SELECT 	sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;


dw_detalle.setitem(ll_new,'base',is_base)
dw_detalle.setitem(ll_new,'serie',is_serie)
dw_detalle.setitem(ll_new,'numero',il_numero)
dw_detalle.setitem(ll_new,'rut',il_rut)
dw_detalle.setitem(ll_new,'cliente_dv',is_dv)
dw_detalle.setitem(ll_new,'cliente_nombre',is_nombres)
dw_detalle.setitem(ll_new,'cliente_a_paterno',is_apellido_paterno)
dw_detalle.setitem(ll_new,'cliente_a_materno',is_apellido_materno)
dw_detalle.setitem(ll_new,'estado_reg','A')
//dw_detalle.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
dw_detalle.setitem(ll_new,'ficha_ultima_voluntad_usuario',gs_user)
if is_base='O' then
	SELECT	"PAGO_OFERTA"."SECTOR",   
				"PAGO_OFERTA"."SEPULTURA"  
	INTO		:ls_sector,   
				:ls_sepultura  
	FROM		"OFERTA_V",   
				"PAGO_OFERTA",   
				"CADENA"  
	WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
			 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
			 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
			 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
			 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
			 (("CADENA"."CODIGO" = :is_base ) AND  
			 ( "OFERTA_V"."SERIE" = :is_serie ) AND  
			 ( "OFERTA_V"."NRO_OFERTA" = :il_numero ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_detalle.setitem(ll_new,'sector',ls_sector)
		dw_detalle.setitem(ll_new,'sepultura',ls_sepultura)
	end if

elseif is_base='C' then
	SELECT	"CONTRATO"."SECTOR",   
				"CONTRATO"."SEPULTURA"  
	INTO 		:ls_sector,   
				:ls_sepultura  
	FROM 		"CADENA",   
				"CONTRATO"  
	WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
			 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
			 (("CADENA"."CODIGO" = :is_base ) AND  
			 ( "CONTRATO"."SERIE_C" = :is_serie ) AND  
			 ( "CONTRATO"."NRO_CONTRATO" = :il_numero ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_detalle.setitem(ll_new,'sector',ls_sector)
		dw_detalle.setitem(ll_new,'sepultura',ls_sepultura)
	end if
end if
dw_detalle.setitem(ll_new,'cod_parque',il_cod_parque_cta)
dw_detalle.accepttext()
dw_detalle.setfocus()
dw_detalle.setcolumn('observacion')
end event

type dw_detalle from datawindow within w_ficha_ultima_voluntad
integer x = 41
integer y = 828
integer width = 2994
integer height = 1128
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_ficha_ultima_voluntad_detalle"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna

ls_columna	= dwo.name
if ls_columna='observacion' then il_modif ++
end event

type cb_cerrar from commandbutton within w_ficha_ultima_voluntad
integer x = 2656
integer y = 1972
integer width = 352
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ficha_ultima_voluntad)
end event

type cb_grabar from commandbutton within w_ficha_ultima_voluntad
integer x = 41
integer y = 1972
integer width = 320
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_obs
Long		ll_corr

dw_detalle.accepttext()
if il_modif > 0 then
	ls_obs	= dw_detalle.getitemstring(1,'observacion')
	if not isnull(ls_obs) and ls_obs<>'' and ls_obs<>'-' then
		SELECT	MAX("FICHA_ULTIMA_VOLUNTAD"."CORRELATIVO")  
		INTO 		:ll_corr  
		FROM 		"FICHA_ULTIMA_VOLUNTAD"  
		WHERE		"COD_PARQUE" = :il_cod_parque_cta
		USING		sqlca;
		if ll_corr > 0 then
			ll_corr ++
		else
			ll_corr	= 1
		end if
		dw_detalle.setitem(1,'correlativo',ll_corr)
		dw_detalle.accepttext()
		if dw_detalle.update()=1 then
			st_help.visible	= false
			commit;
			messagebox("Grabar","Grabación Exitosa")
			dw_lista.retrieve(il_rut)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Ultima Voluntad SQL: "+sqlca.sqlerrtext)
		end if
	else
		messagebox("Advertencia","Debe Ingresar Observación")
		dw_detalle.setfocus()
	end if
end if
end event

type dw_lista from datawindow within w_ficha_ultima_voluntad
integer x = 41
integer y = 152
integer width = 2971
integer height = 656
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_ficha_ultima_voluntad_x_cliente"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long	ll_rut,ll_corr

if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_rut	= dw_lista.getitemnumber(il_row,'rut')
	ll_corr	= dw_lista.getitemnumber(il_row,'correlativo')
	if ll_rut > 0 and ll_corr > 0 then
		if dw_detalle.retrieve(ll_rut,ll_corr)=0 then
			dw_detalle.Modify("DataWindow.Header.Height=1036")
			dw_detalle.Modify("DataWindow.Detail.Height=0")
		else
			dw_detalle.Modify("DataWindow.Header.Height=0")
			dw_detalle.Modify("DataWindow.Detail.Height=1100")
		end if
	end if
end if
end event

event rowfocuschanged;Long	ll_rut,ll_corr

if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_rut	= dw_lista.getitemnumber(il_row,'rut')
	ll_corr	= dw_lista.getitemnumber(il_row,'correlativo')
	if ll_rut > 0 and ll_corr > 0 then
		if dw_detalle.retrieve(ll_rut,ll_corr)=0 then
			dw_detalle.Modify("DataWindow.Header.Height=1036")
			dw_detalle.Modify("DataWindow.Detail.Height=0")
		else
			dw_detalle.Modify("DataWindow.Header.Height=0")
			dw_detalle.Modify("DataWindow.Detail.Height=1100")
		end if
	end if
end if
end event

