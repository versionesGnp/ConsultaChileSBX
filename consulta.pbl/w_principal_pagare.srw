forward
global type w_principal_pagare from window
end type
type st_2 from statictext within w_principal_pagare
end type
type cb_filtrar_soli from commandbutton within w_principal_pagare
end type
type cb_4 from commandbutton within w_principal_pagare
end type
type cb_3 from commandbutton within w_principal_pagare
end type
type cb_2 from commandbutton within w_principal_pagare
end type
type cb_1 from commandbutton within w_principal_pagare
end type
type cb_cta_cte from commandbutton within w_principal_pagare
end type
type st_1 from statictext within w_principal_pagare
end type
type cb_salir from commandbutton within w_principal_pagare
end type
type p_1 from picture within w_principal_pagare
end type
type dw_listado_pagare from datawindow within w_principal_pagare
end type
type gb_1 from groupbox within w_principal_pagare
end type
type cb_refrescar from commandbutton within w_principal_pagare
end type
end forward

global type w_principal_pagare from window
integer x = 818
integer y = 560
integer width = 3630
integer height = 2320
boolean titlebar = true
string title = "PAGARE"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_2 st_2
cb_filtrar_soli cb_filtrar_soli
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cta_cte cb_cta_cte
st_1 st_1
cb_salir cb_salir
p_1 p_1
dw_listado_pagare dw_listado_pagare
gb_1 gb_1
cb_refrescar cb_refrescar
end type
global w_principal_pagare w_principal_pagare

on w_principal_pagare.create
this.st_2=create st_2
this.cb_filtrar_soli=create cb_filtrar_soli
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cta_cte=create cb_cta_cte
this.st_1=create st_1
this.cb_salir=create cb_salir
this.p_1=create p_1
this.dw_listado_pagare=create dw_listado_pagare
this.gb_1=create gb_1
this.cb_refrescar=create cb_refrescar
this.Control[]={this.st_2,&
this.cb_filtrar_soli,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cta_cte,&
this.st_1,&
this.cb_salir,&
this.p_1,&
this.dw_listado_pagare,&
this.gb_1,&
this.cb_refrescar}
end on

on w_principal_pagare.destroy
destroy(this.st_2)
destroy(this.cb_filtrar_soli)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cta_cte)
destroy(this.st_1)
destroy(this.cb_salir)
destroy(this.p_1)
destroy(this.dw_listado_pagare)
destroy(this.gb_1)
destroy(this.cb_refrescar)
end on

event open;long 		ll_total,RET,i,cta_pag_la,cta_pag_isa,nro_cuotas, ret1, cta_pag_m, ret2
Long		cta_pag_s, dias,ll_count_reg
String		ls_base,ls_serie,ls_estado
datetime fecha_prim,fecha_vto
Double	numero,ll_numero
setpointer(hourglass!)
if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 	= 'logo_parque_stgo.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.jpg'
end if
gf_centrar(w_principal_pagare)
//select count(serie_p) into :cuenta from pagare;
dw_listado_pagare.SetTransObject(SQLCA)
gs_ventana	= 'w_principal_pagare'
f_valida_objeto()
Open(w_espera)
ll_total = dw_listado_pagare.Retrieve()
if ll_total > 0 then
	for i =1 to ll_total
		ls_base		= dw_listado_pagare.getitemstring(i,'cadena_codigo')
		ls_serie		= dw_listado_pagare.getitemstring(i,'pagare_serie_p')
		ll_numero	= dw_listado_pagare.getitemnumber(i,'pagare_nro_pagare')
		SELECT	count("SOL_ESTATUS"."NUMERO")
    	INTO 		:ll_count_reg  
    	FROM 		"SOL_ESTATUS"  
   	WHERE  ( "SOL_ESTATUS"."BASE" = :ls_base ) AND  
				 ( "SOL_ESTATUS"."SERIE" = :ls_serie ) AND  
				 ( "SOL_ESTATUS"."NUMERO" = :ll_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_listado_pagare.setitem(i,'cant_solicitudes',ll_count_reg)
		end if
		w_espera.st_i.text="Reg. Leidos "+ string(i) +" de " + string(ll_total)
	next
end if	
Close(w_espera)
st_1.text = String(ll_total,"###,###,###") + " Pagares"
setpointer(arrow!)
end event

type st_2 from statictext within w_principal_pagare
integer x = 439
integer y = 96
integer width = 1257
integer height = 128
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado General Pagaré"
boolean focusrectangle = false
end type

type cb_filtrar_soli from commandbutton within w_principal_pagare
boolean visible = false
integer x = 1888
integer y = 108
integer width = 558
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Filtrar S&olicitudes"
end type

event clicked;string DWfilter2

DWfilter2 = 'isnull( ingreso_solicitudes_codigo_solicitud ) or (ingreso_solicitudes_codigo_solicitud <>"1" and ingreso_solicitudes_codigo_solicitud <>"2") or (ingreso_solicitudes_estado_reg)<>"A"'
dw_listado_pagare.SetFilter(DWfilter2)
dw_listado_pagare.Filter( )
st_1.text	= string(dw_listado_pagare.rowcount(),"###,###,###,###,##0")+" Pagares"

end event

type cb_4 from commandbutton within w_principal_pagare
integer x = 1952
integer y = 2080
integer width = 494
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Re&lación * Rut"
end type

event clicked;if dw_listado_pagare.getrow() > 0 then 
	gi_rut = dw_listado_pagare.getitemnumber(dw_listado_pagare.getrow(),'cadena_rut')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type cb_3 from commandbutton within w_principal_pagare
integer x = 3255
integer y = 108
integer width = 265
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow	dw_paso
dw_paso	= dw_listado_pagare
if dw_listado_pagare.rowcount() > 0 then f_DWToExcel( dw_paso )

//SaveAsType TipoArchivo
//string Archivo
//boolean encabezado
//integer ret
//
//TipoArchivo = excel!
//Archivo = 'pagare.xls'
//
//If FileExists(Archivo) Then
//	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret = dw_listado_pagare.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If
end event

type cb_2 from commandbutton within w_principal_pagare
integer x = 2999
integer y = 108
integer width = 251
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filter"
end type

event clicked;string nulo
Setnull (nulo)
dw_listado_pagare.setfilter(nulo)
dw_listado_pagare.filter()
st_1.text	= string(dw_listado_pagare.rowcount(),"###,###,###,###,##0")+" Pagares"
end event

type cb_1 from commandbutton within w_principal_pagare
integer x = 2743
integer y = 108
integer width = 251
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
Setnull (nulo)
dw_listado_pagare.setsort(nulo)
dw_listado_pagare.sort()

end event

type cb_cta_cte from commandbutton within w_principal_pagare
integer x = 1454
integer y = 2080
integer width = 494
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_listado_pagare.getrow() > 0 then open(w_cuenta_corriente_pagare)
end event

type st_1 from statictext within w_principal_pagare
integer x = 37
integer y = 2076
integer width = 896
integer height = 108
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "0 Ofertas"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_salir from commandbutton within w_principal_pagare
integer x = 3209
integer y = 2080
integer width = 361
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_principal_pagare)

end event

type p_1 from picture within w_principal_pagare
integer x = 37
integer y = 32
integer width = 325
integer height = 268
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_listado_pagare from datawindow within w_principal_pagare
integer x = 37
integer y = 324
integer width = 3538
integer height = 1716
integer taborder = 40
string dataobject = "d_listado_pagare"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base		= "P"
	gs_serie 	= GetItemString(row, "pagare_serie_p")
	gi_numero	= GetItemNumber(row, "pagare_nro_pagare")
	gi_rut		= GetItemnumber(row, 'cadena_rut')
END IF
end event

event doubleclicked;if row>0 then
	gs_base = "P"
	gs_serie = GetItemString(row, "pagare_serie_p")
	gi_numero = GetItemNumber(row, "pagare_nro_pagare")
	gi_rut	= GetItemnumber(row, 'cadena_rut')
	open(w_cuenta_corriente_pagare)
end if
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	gs_base		= "P"
	gs_serie 	= GetItemString(this.getrow(), "pagare_serie_p")
	gi_numero	= GetItemNumber(this.getrow(), "pagare_nro_pagare")
	gi_rut		= GetItemnumber(this.getrow(), 'cadena_rut')
END IF
end event

type gb_1 from groupbox within w_principal_pagare
integer x = 2706
integer y = 32
integer width = 855
integer height = 204
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Utilitarios"
end type

type cb_refrescar from commandbutton within w_principal_pagare
boolean visible = false
integer x = 955
integer y = 2080
integer width = 361
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Refrescar"
end type

event clicked;//long ll_total
//
//Open(w_espera)
//ll_total = dw_listado_pagare.Retrieve()
//Close(w_espera)
//st_1.text = String(ll_total,"###,###,###") + " Pagares"
//
end event

