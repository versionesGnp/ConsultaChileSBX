forward
global type w_principal_aumento_capacidad from window
end type
type st_2 from statictext within w_principal_aumento_capacidad
end type
type cb_filtrar_soli from commandbutton within w_principal_aumento_capacidad
end type
type cb_4 from commandbutton within w_principal_aumento_capacidad
end type
type cb_3 from commandbutton within w_principal_aumento_capacidad
end type
type cb_2 from commandbutton within w_principal_aumento_capacidad
end type
type cb_1 from commandbutton within w_principal_aumento_capacidad
end type
type cb_cta_cte from commandbutton within w_principal_aumento_capacidad
end type
type cb_refrescar from commandbutton within w_principal_aumento_capacidad
end type
type st_1 from statictext within w_principal_aumento_capacidad
end type
type cb_salir from commandbutton within w_principal_aumento_capacidad
end type
type p_1 from picture within w_principal_aumento_capacidad
end type
type dw_listado_liberador from datawindow within w_principal_aumento_capacidad
end type
type gb_1 from groupbox within w_principal_aumento_capacidad
end type
end forward

global type w_principal_aumento_capacidad from window
integer x = 818
integer y = 560
integer width = 3621
integer height = 2316
boolean titlebar = true
string title = "ANEXO LIBERADOR DE MANTENCION"
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
dw_listado_liberador dw_listado_liberador
gb_1 gb_1
end type
global w_principal_aumento_capacidad w_principal_aumento_capacidad

on w_principal_aumento_capacidad.create
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
this.dw_listado_liberador=create dw_listado_liberador
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
this.dw_listado_liberador,&
this.gb_1}
end on

on w_principal_aumento_capacidad.destroy
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
destroy(this.dw_listado_liberador)
destroy(this.gb_1)
end on

event open;setpointer(hourglass!)
long 		ll_total,i,numero,ll_count_reg
STRING 	base, serie,estado

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
gf_centrar(w_principal_aumento_capacidad)
dw_listado_liberador.SetTransObject(SQLCA)
gs_ventana	= 'w_principal_aumento_capacidad'
f_valida_objeto()
Open(w_espera)
ll_total = dw_listado_liberador.Retrieve()
if ll_total > 0 then
	for i =1 to ll_total
		base   = dw_listado_liberador.getitemstring(i,'cadena_codigo')
		serie  = dw_listado_liberador.getitemstring(i,'anexo_aumento_serie_m')
		numero = dw_listado_liberador.getitemnumber(i,'anexo_aumento_nro_aumento')
		SELECT	count("SOL_ESTATUS"."NUMERO")
    	INTO 		:ll_count_reg  
    	FROM 		"SOL_ESTATUS"  
   	WHERE  ( "SOL_ESTATUS"."BASE" = :base ) AND  
				 ( "SOL_ESTATUS"."SERIE" = :serie ) AND  
				 ( "SOL_ESTATUS"."NUMERO" = :numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_listado_liberador.setitem(i,'cant_solicitudes',ll_count_reg)
		end if
		w_espera.st_i.text	= "Reg. Leidos "+ string(i) +" de " + string(ll_total)
	next
end if	
Close(w_espera)
st_1.text = String(ll_total,"###,###,###") + " Aumento Capacidad"
setpointer(arrow!)
end event

type st_2 from statictext within w_principal_aumento_capacidad
integer x = 439
integer y = 96
integer width = 2117
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
string text = "Listado General Aumento Capacidad"
boolean focusrectangle = false
end type

type cb_filtrar_soli from commandbutton within w_principal_aumento_capacidad
boolean visible = false
integer x = 2153
integer y = 16
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
dw_listado_liberador.SetFilter(DWfilter2)
dw_listado_liberador.Filter( )
st_1.text	= string(dw_listado_liberador.rowcount(),"###,###,###,###,##0")+" Aumento Capacidad"

end event

type cb_4 from commandbutton within w_principal_aumento_capacidad
integer x = 1966
integer y = 2080
integer width = 443
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rel&acion * Rut"
end type

event clicked;if dw_listado_liberador.getrow() > 0 then 
	gi_rut 				= dw_listado_liberador.getitemnumber(dw_listado_liberador.getrow(),'cadena_rut')
	gi_tipo_busqueda 	= 1
	open(w_listado_contratos)
end if
end event

type cb_3 from commandbutton within w_principal_aumento_capacidad
integer x = 3246
integer y = 116
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
dw_paso	= dw_listado_liberador
if dw_listado_liberador.rowcount() > 0 then f_DWToExcel( dw_paso )


//SaveAsType TipoArchivo
//string Archivo
//boolean encabezado
//integer ret
//
//TipoArchivo = excel!
//Archivo = 'libera.xls'
//
//If FileExists(Archivo) Then
//	Ret = MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret = dw_listado_liberador.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If
end event

type cb_2 from commandbutton within w_principal_aumento_capacidad
integer x = 3017
integer y = 116
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
dw_listado_liberador.setfilter(nulo)
dw_listado_liberador.filter()
st_1.text	= string(dw_listado_liberador.rowcount(),"###,###,###,###,##0")+" Aumento Capacidad"
end event

type cb_1 from commandbutton within w_principal_aumento_capacidad
integer x = 2789
integer y = 116
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

event clicked;string nulo
Setnull (nulo)
dw_listado_liberador.setsort(nulo)
dw_listado_liberador.sort()

end event

type cb_cta_cte from commandbutton within w_principal_aumento_capacidad
integer x = 1509
integer y = 2080
integer width = 453
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;if dw_listado_liberador.getrow() > 0 then open(w_cuenta_corriente_aumento_capacidad)
end event

type cb_refrescar from commandbutton within w_principal_aumento_capacidad
boolean visible = false
integer x = 987
integer y = 2080
integer width = 517
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
//ll_total = dw_listado_liberador.Retrieve()
//Close(w_espera)
//st_1.text = String(ll_total,"###,###,###") + " Anexos liberadores"
//
end event

type st_1 from statictext within w_principal_aumento_capacidad
integer x = 37
integer y = 2084
integer width = 745
integer height = 96
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

type cb_salir from commandbutton within w_principal_aumento_capacidad
integer x = 3186
integer y = 2080
integer width = 370
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_principal_aumento_capacidad)

end event

type p_1 from picture within w_principal_aumento_capacidad
integer x = 32
integer y = 24
integer width = 315
integer height = 264
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_listado_liberador from datawindow within w_principal_aumento_capacidad
integer x = 37
integer y = 308
integer width = 3511
integer height = 1716
integer taborder = 40
string dataobject = "d_listado_aumento_capacidad"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	gs_base 		= "A"
	gs_serie 	= GetItemString(row, "anexo_aumento_serie_m")
	gi_numero 	= GetItemNumber(row, "anexo_aumento_nro_aumento")
	gi_rut		= GetItemnumber(row, 'cadena_rut')
END IF
end event

event doubleclicked;if row>0 then
	gs_base 		= "A"
	gi_rut		= GetItemnumber(row, 'cadena_rut')
	gs_serie 	= GetItemString(row, "anexo_aumento_serie_m")
	gi_numero 	= GetItemNumber(row, "anexo_aumento_nro_aumento")
	open(w_cuenta_corriente_aumento_capacidad)
end if
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
	gs_base 		= "A"
	gs_serie 	= GetItemString(this.getrow(), "anexo_aumento_serie_m")
	gi_numero 	= GetItemNumber(this.getrow(), "anexo_aumento_nro_aumento")
	gi_rut		= GetItemnumber(this.getrow(), 'cadena_rut')
END IF
end event

type gb_1 from groupbox within w_principal_aumento_capacidad
integer x = 2752
integer y = 28
integer width = 791
integer height = 216
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Utilitarios"
end type

