forward
global type w_principal_derecho from window
end type
type st_2 from statictext within w_principal_derecho
end type
type cb_filtrar_soli from commandbutton within w_principal_derecho
end type
type cb_4 from commandbutton within w_principal_derecho
end type
type cb_3 from commandbutton within w_principal_derecho
end type
type cb_2 from commandbutton within w_principal_derecho
end type
type cb_1 from commandbutton within w_principal_derecho
end type
type cb_cta_cte from commandbutton within w_principal_derecho
end type
type cb_refrescar from commandbutton within w_principal_derecho
end type
type st_1 from statictext within w_principal_derecho
end type
type cb_salir from commandbutton within w_principal_derecho
end type
type p_1 from picture within w_principal_derecho
end type
type dw_listado_derecho from datawindow within w_principal_derecho
end type
type gb_1 from groupbox within w_principal_derecho
end type
end forward

global type w_principal_derecho from window
integer x = 5
integer y = 4
integer width = 3616
integer height = 2288
boolean titlebar = true
string title = "DERECHO ESPECIAL DE SEPULTURA "
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
cb_refrescar cb_refrescar
st_1 st_1
cb_salir cb_salir
p_1 p_1
dw_listado_derecho dw_listado_derecho
gb_1 gb_1
end type
global w_principal_derecho w_principal_derecho

on w_principal_derecho.create
this.st_2=create st_2
this.cb_filtrar_soli=create cb_filtrar_soli
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cta_cte=create cb_cta_cte
this.cb_refrescar=create cb_refrescar
this.st_1=create st_1
this.cb_salir=create cb_salir
this.p_1=create p_1
this.dw_listado_derecho=create dw_listado_derecho
this.gb_1=create gb_1
this.Control[]={this.st_2,&
this.cb_filtrar_soli,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cta_cte,&
this.cb_refrescar,&
this.st_1,&
this.cb_salir,&
this.p_1,&
this.dw_listado_derecho,&
this.gb_1}
end on

on w_principal_derecho.destroy
destroy(this.st_2)
destroy(this.cb_filtrar_soli)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cta_cte)
destroy(this.cb_refrescar)
destroy(this.st_1)
destroy(this.cb_salir)
destroy(this.p_1)
destroy(this.dw_listado_derecho)
destroy(this.gb_1)
end on

event open;long 		ll_total,RET,i,cta_pag_la,cta_pag_isa,nro_cuotas, ret1, cta_pag_m, ret2, numero
Long		cta_pag_s,dias,ll_count_reg
datetime fecha_prim,fecha_vto
String	serie,ls_estado,base='D'
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
gf_centrar(w_principal_derecho)
dw_listado_derecho.SetTransObject(SQLCA)
gs_ventana	= 'w_principal_derecho'
f_valida_objeto()
Open(w_espera)
ll_total = dw_listado_derecho.Retrieve()
if ll_total > 0 then
	for i =1 to ll_total
		serie			= dw_listado_derecho.getitemstring(i,'derecho_serie_p')
		numero		= dw_listado_derecho.getitemnumber(i,'derecho_nro_pagare')
		SELECT	count("SOL_ESTATUS"."NUMERO")
    	INTO 		:ll_count_reg  
    	FROM 		"SOL_ESTATUS"  
   	WHERE  ( "SOL_ESTATUS"."BASE" = :base ) AND  
				 ( "SOL_ESTATUS"."SERIE" = :serie ) AND  
				 ( "SOL_ESTATUS"."NUMERO" = :numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_listado_derecho.setitem(i,'cant_solicitudes',ll_count_reg)
		end if
		w_espera.st_i.text="Reg. Leidos "+ string(i) +" de " + string(ll_total)
	next
end if	
Close(w_espera)
st_1.text = String(ll_total,"###,###,###") + " Derechos Especiales"
setpointer(arrow!)
end event

type st_2 from statictext within w_principal_derecho
integer x = 402
integer y = 96
integer width = 2121
integer height = 120
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado General Derecho Especial de Sepultura"
boolean focusrectangle = false
end type

type cb_filtrar_soli from commandbutton within w_principal_derecho
boolean visible = false
integer x = 2231
integer width = 521
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
dw_listado_derecho.SetFilter(DWfilter2)
dw_listado_derecho.Filter( )
st_1.text	= string(dw_listado_derecho.rowcount(),"###,###,###,###,##0")+" Derechos Especiales"

end event

type cb_4 from commandbutton within w_principal_derecho
integer x = 3237
integer y = 120
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

event clicked;datawindow dw_paso
dw_paso	= dw_listado_derecho
if dw_listado_derecho.rowcount() > 0 then f_DWToExcel( dw_paso )

//SaveAsType TipoArchivo
//string Archivo
//boolean encabezado
//integer ret
//
//TipoArchivo = excel!
//Archivo = 'derecho.xls'
//
//If FileExists(Archivo) Then
//	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret = dw_listado_derecho.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If
end event

type cb_3 from commandbutton within w_principal_derecho
integer x = 3008
integer y = 120
integer width = 224
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtro"
end type

event clicked;string nulo
Setnull (nulo)
dw_listado_derecho.setfilter(nulo)
dw_listado_derecho.filter()
st_1.text	= string(dw_listado_derecho.rowcount(),"###,###,###,###,##0")+" Derechos Especiales"
end event

type cb_2 from commandbutton within w_principal_derecho
integer x = 2779
integer y = 120
integer width = 224
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

event clicked;
string nulo
Setnull (nulo)
dw_listado_derecho.setsort(nulo)
dw_listado_derecho.sort()

end event

type cb_1 from commandbutton within w_principal_derecho
integer x = 2213
integer y = 2056
integer width = 498
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rel&ación * Rut"
end type

event clicked;if dw_listado_derecho.getrow() > 0 then 
	gi_rut = dw_listado_derecho.getitemnumber(dw_listado_derecho.getrow(),'cadena_rut')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if
end event

type cb_cta_cte from commandbutton within w_principal_derecho
integer x = 1682
integer y = 2056
integer width = 526
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

event clicked;if dw_listado_derecho.getrow() > 0 then open(w_cuenta_corriente_derecho)
end event

type cb_refrescar from commandbutton within w_principal_derecho
boolean visible = false
integer x = 987
integer y = 2056
integer width = 498
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Refrescar"
end type

event clicked;//long ll_total
//
//Open(w_espera)
//ll_total = dw_listado_derecho.Retrieve()
//Close(w_espera)
//st_1.text = String(ll_total,"###,###,###") + " Derechos Especiales"
//
end event

type st_1 from statictext within w_principal_derecho
integer x = 46
integer y = 2056
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
string text = "0 Derecho Esp."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_salir from commandbutton within w_principal_derecho
integer x = 3173
integer y = 2056
integer width = 379
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_principal_derecho)

end event

type p_1 from picture within w_principal_derecho
integer x = 37
integer y = 32
integer width = 306
integer height = 256
string picturename = "logo_parque_conce.jpg"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_listado_derecho from datawindow within w_principal_derecho
integer x = 37
integer y = 320
integer width = 3511
integer height = 1696
integer taborder = 40
string dataobject = "d_listado_derecho"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 		= "D"
	gi_rut		= GetItemnumber(row, 'cadena_rut')
	gs_serie 	= GetItemString(row, "derecho_serie_p")
	gi_numero 	= GetItemNumber(row, "derecho_nro_pagare")
END IF
end event

event doubleclicked;if row>0 then
	gs_base = "D"
	gi_rut	= GetItemnumber(row, 'cadena_rut')
	gs_serie = GetItemString(row, "derecho_serie_p")
	gi_numero = GetItemNumber(row, "derecho_nro_pagare")
	open(w_cuenta_corriente_derecho)
end if
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	gs_base 		= "D"
	gi_rut		= GetItemnumber(this.getrow(), 'cadena_rut')
	gs_serie 	= GetItemString(this.getrow(), "derecho_serie_p")
	gi_numero 	= GetItemNumber(this.getrow(), "derecho_nro_pagare")
END IF
end event

type gb_1 from groupbox within w_principal_derecho
integer x = 2734
integer y = 44
integer width = 814
integer height = 208
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Utilitarios"
end type

