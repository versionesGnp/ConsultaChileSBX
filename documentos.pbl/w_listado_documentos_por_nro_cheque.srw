forward
global type w_listado_documentos_por_nro_cheque from window
end type
type cb_ctacte from commandbutton within w_listado_documentos_por_nro_cheque
end type
type cb_limpiar from commandbutton within w_listado_documentos_por_nro_cheque
end type
type cb_filtrar from commandbutton within w_listado_documentos_por_nro_cheque
end type
type cb_ordenar from commandbutton within w_listado_documentos_por_nro_cheque
end type
type cb_aceptar from commandbutton within w_listado_documentos_por_nro_cheque
end type
type st_2 from statictext within w_listado_documentos_por_nro_cheque
end type
type cb_cerrar from commandbutton within w_listado_documentos_por_nro_cheque
end type
type em_nro_cheque from editmask within w_listado_documentos_por_nro_cheque
end type
type st_1 from statictext within w_listado_documentos_por_nro_cheque
end type
type dw_cheque from datawindow within w_listado_documentos_por_nro_cheque
end type
type dw_bancos from datawindow within w_listado_documentos_por_nro_cheque
end type
end forward

global type w_listado_documentos_por_nro_cheque from window
integer width = 2889
integer height = 1468
boolean titlebar = true
string title = "Buscar por Número Cheque"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_ctacte cb_ctacte
cb_limpiar cb_limpiar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_aceptar cb_aceptar
st_2 st_2
cb_cerrar cb_cerrar
em_nro_cheque em_nro_cheque
st_1 st_1
dw_cheque dw_cheque
dw_bancos dw_bancos
end type
global w_listado_documentos_por_nro_cheque w_listado_documentos_por_nro_cheque

type variables
DataWindowChild dwch
end variables

on w_listado_documentos_por_nro_cheque.create
this.cb_ctacte=create cb_ctacte
this.cb_limpiar=create cb_limpiar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_aceptar=create cb_aceptar
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.em_nro_cheque=create em_nro_cheque
this.st_1=create st_1
this.dw_cheque=create dw_cheque
this.dw_bancos=create dw_bancos
this.Control[]={this.cb_ctacte,&
this.cb_limpiar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_aceptar,&
this.st_2,&
this.cb_cerrar,&
this.em_nro_cheque,&
this.st_1,&
this.dw_cheque,&
this.dw_bancos}
end on

on w_listado_documentos_por_nro_cheque.destroy
destroy(this.cb_ctacte)
destroy(this.cb_limpiar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_aceptar)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.em_nro_cheque)
destroy(this.st_1)
destroy(this.dw_cheque)
destroy(this.dw_bancos)
end on

event open;gf_centrar(w_listado_documentos_por_nro_cheque)
dw_cheque.settransobject(sqlca)
dw_bancos.GetChild('banco', dwch)
dwch.SetTransObject(SQLCA)
dwch.Retrieve()
dw_bancos.settransobject(sqlca)
dw_bancos.insertrow(0)
end event

type cb_ctacte from commandbutton within w_listado_documentos_por_nro_cheque
integer x = 782
integer y = 1164
integer width = 425
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuenta C&orriente"
end type

event clicked;long		ll_folio
String	ls_tipo_cob
if dw_cheque.getrow()>0 then
	ll_folio		= dw_cheque.getitemnumber(dw_cheque.getrow(),'folio')
	ls_tipo_cob	= dw_cheque.getitemstring(dw_cheque.getrow(),'tipo_cob')
	gi_tipo_busqueda	= 1
	DECLARE x1 CURSOR FOR  
	SELECT DISTINCT "INGRESO"."RUT"  
   FROM 		"INGRESO"  
   WHERE 	"INGRESO"."FOLIO" = :ll_folio AND
				"INGRESO"."TIPO_COB" = :ls_tipo_cob
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x1 into :gi_rut;
			exit
		LOOP
	end if
	close x1;
	open(w_listado_contratos)
end if
end event

type cb_limpiar from commandbutton within w_listado_documentos_por_nro_cheque
integer x = 1339
integer y = 1164
integer width = 302
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long	ll_banco
setnull(ll_banco)
dw_cheque.reset()
em_nro_cheque.text	= ''
dw_bancos.setitem(1,'banco',ll_banco)
em_nro_cheque.setfocus()
end event

type cb_filtrar from commandbutton within w_listado_documentos_por_nro_cheque
integer x = 347
integer y = 1164
integer width = 302
integer height = 100
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
setnull (nulo)
dw_cheque.SETfilter(NULO)
dw_cheque.filter()

end event

type cb_ordenar from commandbutton within w_listado_documentos_por_nro_cheque
integer x = 41
integer y = 1164
integer width = 302
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_cheque.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_cheque.SETSORT(NULO)
	dw_cheque.SORT()
end if
end event

type cb_aceptar from commandbutton within w_listado_documentos_por_nro_cheque
integer x = 2514
integer y = 28
integer width = 270
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_banco,ll_nro_cheque
ll_nro_cheque	= long(em_nro_cheque.text)
ll_banco			= long(dw_bancos.getitemnumber(1,'banco'))
if (isnull(ll_nro_cheque) or ll_nro_cheque=0) and ll_banco>0 then
	dw_cheque.dataobject	= 'dw_lista_documentos_por_nro_cheque_banco'
	dw_cheque.settransobject(sqlca)
	dw_cheque.retrieve(ll_nro_cheque,ll_banco)
else
	dw_cheque.dataobject	= 'dw_lista_documentos_por_numero_cheque'
	dw_cheque.settransobject(sqlca)
	dw_cheque.retrieve(ll_nro_cheque)
end if
end event

type st_2 from statictext within w_listado_documentos_por_nro_cheque
integer x = 1138
integer y = 48
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Banco"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_listado_documentos_por_nro_cheque
integer x = 2482
integer y = 1164
integer width = 302
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_documentos_por_nro_cheque)
end event

type em_nro_cheque from editmask within w_listado_documentos_por_nro_cheque
integer x = 567
integer y = 32
integer width = 562
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

event modified;long	ll_nro_cheque
ll_nro_cheque	= long(this.text)
if ll_nro_cheque > 0 then
	dw_cheque.reset()
end if
end event

type st_1 from statictext within w_listado_documentos_por_nro_cheque
integer x = 23
integer y = 48
integer width = 521
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Nº Cheque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_cheque from datawindow within w_listado_documentos_por_nro_cheque
integer x = 41
integer y = 168
integer width = 2743
integer height = 960
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_documentos_por_numero_cheque"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long	ll_folio
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;Long		ll_folio
String	ls_tipo_cob
if row>0 then
	ll_folio		= dw_cheque.getitemnumber(row,'folio')
	ls_tipo_cob	= dw_cheque.getitemstring(row,'tipo_cob')
	DECLARE x1 CURSOR FOR  
	SELECT DISTINCT "INGRESO"."RUT"  
   FROM 		"INGRESO"  
   WHERE 	"INGRESO"."FOLIO" = :ll_folio  AND
				"INGRESO"."TIPO_COB" = :ls_tipo_cob
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			fetch x1 into :gi_rut;
			exit
		LOOP
	end if
	close x1;
	st_param_dcto.rut        = gi_rut
	st_param_dcto.folio      = ll_folio
	st_param_dcto.num_cheque = this.getitemnumber(row,'n_cheque')
	if this.getitemstring(row,'rezago') ='S' then
		st_param_dcto.datawindows = 'dw_documentos_x_fecha_rezago'
	else
		st_param_dcto.datawindows = 'dw_documentos_x_fecha'
	end if
	if isvalid(w_cambio_doc_est) then close(w_cambio_doc_est)
	open(w_cambio_doc_est)
end if
end event

type dw_bancos from datawindow within w_listado_documentos_por_nro_cheque
integer x = 1376
integer y = 32
integer width = 1065
integer height = 104
integer taborder = 20
string title = "none"
string dataobject = "dwe_listado_bancos"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna
ls_columna	= dwo.name
if ls_columna='banco' then
	dw_cheque.reset()
end if
end event

