forward
global type w_lista_promesas_r from window
end type
type cb_exportar from commandbutton within w_lista_promesas_r
end type
type cb_3 from commandbutton within w_lista_promesas_r
end type
type cb_2 from commandbutton within w_lista_promesas_r
end type
type cb_filtrar from commandbutton within w_lista_promesas_r
end type
type pb_aceptar from picturebutton within w_lista_promesas_r
end type
type st_2 from statictext within w_lista_promesas_r
end type
type ddlb_parque from dropdownlistbox within w_lista_promesas_r
end type
type cb_cerrar from commandbutton within w_lista_promesas_r
end type
type st_1 from statictext within w_lista_promesas_r
end type
type dw_fecha_invent from datawindow within w_lista_promesas_r
end type
type dw_lista from datawindow within w_lista_promesas_r
end type
type gb_1 from groupbox within w_lista_promesas_r
end type
end forward

global type w_lista_promesas_r from window
integer width = 3831
integer height = 1976
boolean titlebar = true
string title = "Listado de Promesas R"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_exportar cb_exportar
cb_3 cb_3
cb_2 cb_2
cb_filtrar cb_filtrar
pb_aceptar pb_aceptar
st_2 st_2
ddlb_parque ddlb_parque
cb_cerrar cb_cerrar
st_1 st_1
dw_fecha_invent dw_fecha_invent
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_promesas_r w_lista_promesas_r

type variables
long il_parque
end variables

on w_lista_promesas_r.create
this.cb_exportar=create cb_exportar
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_filtrar=create cb_filtrar
this.pb_aceptar=create pb_aceptar
this.st_2=create st_2
this.ddlb_parque=create ddlb_parque
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.dw_fecha_invent=create dw_fecha_invent
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_3,&
this.cb_2,&
this.cb_filtrar,&
this.pb_aceptar,&
this.st_2,&
this.ddlb_parque,&
this.cb_cerrar,&
this.st_1,&
this.dw_fecha_invent,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_promesas_r.destroy
destroy(this.cb_exportar)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_filtrar)
destroy(this.pb_aceptar)
destroy(this.st_2)
destroy(this.ddlb_parque)
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.dw_fecha_invent)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;string	ls_parque,ls_descrip_parque,ls_cod_parque
long	ll_parque,ll_codigo,ll_pos

dw_lista.settransobject(sqlca)
dw_fecha_invent.settransobject(sqlca)
ddlb_parque.reset()
SELECT COD_PARQUE into :ll_parque FROM ENCARGADOS WHERE CODIGO_USUARIO = :gs_user ;

IF ll_parque = 9999 then
	DECLARE	x1 CURSOR FOR 
	SELECT 	"COD_PARQ"."CODIGO",   
				"COD_PARQ"."NOMBRE"  
	FROM 	"COD_PARQ"  
	WHERE 	"COD_PARQ"."GRUPO" = 1  AND 
				"COD_PARQ"."CODIGO" <> 106 AND
				"COD_PARQ"."CODIGO" <> 9999
	USING	sqlca;
	open x1;
	DO WHILE sqlca.sqlcode=0
		fetch x1 into :ll_codigo, :ls_descrip_parque;
		if not isnull(ll_codigo) and ll_codigo>0 then
			ls_parque					= trim(string(ll_codigo)+' - '+ls_descrip_parque)
			ddlb_parque.additem(ls_parque)
		end if
		setnull(ll_codigo);setnull(ls_descrip_parque);setnull(ls_parque)
	LOOP
	close x1;
	if gs_empresa = 'El Prado' then
		ddlb_parque.text				= '1 - EL PRADO'
		//ddlb_parque.additem('103 - SANTIAGO 2')
	elseif gs_empresa = 'La Foresta' then
		ddlb_parque.text				= '11 - LA FORESTA'	
	end if
ELSE
	DECLARE	x2 CURSOR FOR
	SELECT 	"COD_PARQ"."CODIGO",   
				"COD_PARQ"."NOMBRE"  
	FROM 	"COD_PARQ"  
	WHERE 	"COD_PARQ"."GRUPO" = 1  AND 
				"COD_PARQ"."CODIGO" <> 106 AND
				"COD_PARQ"."CODIGO" = :ll_parque
	USING	sqlca;
	open x2;
	DO WHILE sqlca.sqlcode=0
		fetch x2 into :ll_codigo, :ls_descrip_parque;
		if not isnull(ll_codigo) and ll_codigo>0 then
			ls_parque					= trim(string(ll_codigo)+' - '+ls_descrip_parque)
			ddlb_parque.additem(ls_parque)
		end if
		setnull(ll_codigo);setnull(ls_descrip_parque);setnull(ls_parque)
	LOOP
	close x2;
	if gs_empresa = 'El Prado' then
		ddlb_parque.text				= '1 - EL PRADO'
		//ddlb_parque.additem('103 - SANTIAGO 2')
	elseif gs_empresa = 'La Foresta' then
		ddlb_parque.text				= '11 - LA FORESTA'	
	end if
END IF
ll_pos						= pos(ddlb_parque.text,'-')
ls_cod_parque			= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
ll_parque					= long(ls_cod_parque)
il_parque					= ll_parque


//dw_fech_cierre.reset()
//dw_fech_cierre.settransobject(sqlca)
//dw_fech_cierre.insertrow(0)
//

dw_fecha_invent.settransobject(sqlca)	
dw_fecha_invent.getchild('fecha',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(ll_parque)=0 then
	idw_detalle.insertrow(0)
end if
dw_fecha_invent.accepttext()
dw_fecha_invent.insertrow(0)
//st_1.visible = TRUE
end event

type cb_exportar from commandbutton within w_lista_promesas_r
integer x = 654
integer y = 1752
integer width = 288
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;//datawindow dw_paso
//dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_lista)
end event

type cb_3 from commandbutton within w_lista_promesas_r
integer x = 1019
integer y = 1752
integer width = 302
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type cb_2 from commandbutton within w_lista_promesas_r
integer x = 347
integer y = 1752
integer width = 302
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type cb_filtrar from commandbutton within w_lista_promesas_r
integer x = 41
integer y = 1752
integer width = 302
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
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

type pb_aceptar from picturebutton within w_lista_promesas_r
integer x = 1897
integer y = 48
integer width = 160
integer height = 140
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;date	ld_fec_cierre

if il_parque= 0 or isnull(il_parque) then	
	messagebox('Advertencia','Debe Seleccionar Parque')
else
	//ld_fec_cierre		= date(dw_fecha_invent.getitemdatetime(1,'fec_cierre'))
	ld_fec_cierre		= dw_fecha_invent.getitemdate(1,'fec_cierre')
	if isnull(ld_fec_cierre)	 then
		messagebox('Advertencia','Debe Seleccionar Fecha de Cierre')
	else
		dw_lista.retrieve(ld_fec_cierre,il_parque) 
	end if	
end if	
end event

type st_2 from statictext within w_lista_promesas_r
integer x = 41
integer y = 84
integer width = 229
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_parque from dropdownlistbox within w_lista_promesas_r
integer x = 283
integer y = 60
integer width = 686
integer height = 656
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;Long		ll_pos,i,ll_parque
String		ls_cod_parque,ls_descrip_parque

ll_pos						= pos(ddlb_parque.text,'-')
ls_cod_parque			= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
ll_parque					= long(ls_cod_parque)
il_parque					= ll_parque

dw_fecha_invent.reset()
//dw_fecha_invent.settransobject(sqlca)	
dw_fecha_invent.getchild('fecha',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve(ll_parque)=0 then
	idw_detalle.insertrow(0)
end if
dw_fecha_invent.accepttext()
dw_fecha_invent.insertrow(0)


end event

type cb_cerrar from commandbutton within w_lista_promesas_r
integer x = 3456
integer y = 1740
integer width = 325
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_lista_promesas_r)
end event

type st_1 from statictext within w_lista_promesas_r
boolean visible = false
integer x = 1029
integer y = 84
integer width = 357
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Cierre:"
boolean focusrectangle = false
end type

type dw_fecha_invent from datawindow within w_lista_promesas_r
integer x = 1051
integer y = 80
integer width = 795
integer height = 112
integer taborder = 10
string title = "none"
string dataobject = "dwe_fec_cierre"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_lista from datawindow within w_lista_promesas_r
integer x = 32
integer y = 228
integer width = 3749
integer height = 1472
integer taborder = 10
string title = "none"
string dataobject = "dw_promesas_r"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_lista_promesas_r
integer x = 32
integer y = 4
integer width = 2053
integer height = 212
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

