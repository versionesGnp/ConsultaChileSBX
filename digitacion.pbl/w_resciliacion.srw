forward
global type w_resciliacion from window
end type
type cb_vigente from commandbutton within w_resciliacion
end type
type cb_buscar from commandbutton within w_resciliacion
end type
type st_7 from statictext within w_resciliacion
end type
type dw_listado from datawindow within w_resciliacion
end type
type cb_cerrar from commandbutton within w_resciliacion
end type
type cb_resciliar from commandbutton within w_resciliacion
end type
type cb_ver_cta_cte from commandbutton within w_resciliacion
end type
type em_fecha from editmask within w_resciliacion
end type
type st_6 from statictext within w_resciliacion
end type
type st_5 from statictext within w_resciliacion
end type
type st_4 from statictext within w_resciliacion
end type
type st_3 from statictext within w_resciliacion
end type
type sle_numero from singlelineedit within w_resciliacion
end type
type sle_serie from singlelineedit within w_resciliacion
end type
type sle_nombre from singlelineedit within w_resciliacion
end type
type sle_amaterno from singlelineedit within w_resciliacion
end type
type sle_apaterno from singlelineedit within w_resciliacion
end type
type st_2 from statictext within w_resciliacion
end type
type st_1 from statictext within w_resciliacion
end type
type p_1 from picture within w_resciliacion
end type
end forward

global type w_resciliacion from window
integer x = 832
integer y = 360
integer width = 3013
integer height = 1508
boolean titlebar = true
string title = "Resciliación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_vigente cb_vigente
cb_buscar cb_buscar
st_7 st_7
dw_listado dw_listado
cb_cerrar cb_cerrar
cb_resciliar cb_resciliar
cb_ver_cta_cte cb_ver_cta_cte
em_fecha em_fecha
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
sle_numero sle_numero
sle_serie sle_serie
sle_nombre sle_nombre
sle_amaterno sle_amaterno
sle_apaterno sle_apaterno
st_2 st_2
st_1 st_1
p_1 p_1
end type
global w_resciliacion w_resciliacion

type variables
string is_sql
end variables

forward prototypes
public function integer f_busqueda ()
end prototypes

public function integer f_busqueda ();string ls_sql, ls_where
integer ret

ls_where = ""

IF sle_serie.text <> "" THEN
	ls_where = ls_where + " AND CADENA.SERIE = '" + sle_serie.text + "'"
END IF
IF sle_numero.text <> "" THEN
	ls_where = ls_where + " AND CADENA.NUMERO = " + sle_numero.text + ""
END IF
IF sle_apaterno.text <> "" THEN
	ls_where = ls_where + " AND CLIENTE.A_PATERNO = '" + sle_apaterno.text + "'"
END IF
IF sle_amaterno.text <> "" THEN
	ls_where = ls_where + " AND CLIENTE.A_MATERNO = '" + sle_amaterno.text + "'"
END IF
IF sle_nombre.text <> "" THEN
	ls_where = ls_where + " AND CLIENTE.NOMBRE = '" + sle_nombre.text + "'"
END IF

ls_where = ls_where + " AND CADENA.CODIGO < > 'C' AND CADENA.CODIGO < > 'P' AND CADENA.CODIGO < > 'D' "

ls_sql = is_sql + ls_where + " ORDER BY CADENA.NUMERO ASC, CLIENTE.A_PATERNO ASC "

dw_listado.SetSQLSelect(ls_sql)
ret = dw_listado.Retrieve()

IF ret = 0 THEN
	MessageBox("Busqueda", "No se encontró ningún contrato")
	dw_listado.Reset()
	RETURN 1
END IF

RETURN 0
end function

on w_resciliacion.create
this.cb_vigente=create cb_vigente
this.cb_buscar=create cb_buscar
this.st_7=create st_7
this.dw_listado=create dw_listado
this.cb_cerrar=create cb_cerrar
this.cb_resciliar=create cb_resciliar
this.cb_ver_cta_cte=create cb_ver_cta_cte
this.em_fecha=create em_fecha
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.sle_numero=create sle_numero
this.sle_serie=create sle_serie
this.sle_nombre=create sle_nombre
this.sle_amaterno=create sle_amaterno
this.sle_apaterno=create sle_apaterno
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.cb_vigente,&
this.cb_buscar,&
this.st_7,&
this.dw_listado,&
this.cb_cerrar,&
this.cb_resciliar,&
this.cb_ver_cta_cte,&
this.em_fecha,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.sle_numero,&
this.sle_serie,&
this.sle_nombre,&
this.sle_amaterno,&
this.sle_apaterno,&
this.st_2,&
this.st_1,&
this.p_1}
end on

on w_resciliacion.destroy
destroy(this.cb_vigente)
destroy(this.cb_buscar)
destroy(this.st_7)
destroy(this.dw_listado)
destroy(this.cb_cerrar)
destroy(this.cb_resciliar)
destroy(this.cb_ver_cta_cte)
destroy(this.em_fecha)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_numero)
destroy(this.sle_serie)
destroy(this.sle_nombre)
destroy(this.sle_amaterno)
destroy(this.sle_apaterno)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
end on

event open;
gf_centrar(w_resciliacion)

dw_listado.SetTransObject(SQLCA)
is_sql = dw_listado.GetSQLSelect()
em_fecha.Text = String(today(),"dd/mm/yyyy")
end event

type cb_vigente from commandbutton within w_resciliacion
integer x = 1513
integer y = 1280
integer width = 448
integer height = 108
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Vigente"
end type

event clicked;datetime ld_fecha  

SetNull(ld_fecha)
IF MessageBox("Vigente", "Establecer como Vigente ?", Question!, YesNo!)=1 THEN
	UPDATE "CADENA"  
		  SET "FECHA_RES" = :ld_fecha,   
				"ESTADO" = 'V'  
		WHERE ( "CADENA"."CODIGO" = :gs_base ) AND  
				( "CADENA"."SERIE" = :gs_serie ) AND  
				( "CADENA"."NUMERO" = :gi_numero );
				
	Commit using SQLCA;
	  
	f_busqueda()
	cb_ver_cta_cte.Enabled = false
	cb_resciliar.Enabled = false
	cb_vigente.Enabled = false
	dw_listado.SelectRow(0, FALSE)
END IF
end event

type cb_buscar from commandbutton within w_resciliacion
integer x = 832
integer y = 456
integer width = 480
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar >>"
boolean default = true
end type

event clicked;
f_busqueda()
cb_ver_cta_cte.Enabled = false
cb_resciliar.Enabled = false
cb_vigente.Enabled = false
dw_listado.SelectRow(0, FALSE)

end event

type st_7 from statictext within w_resciliacion
integer x = 37
integer y = 580
integer width = 608
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Listado de Contratos"
boolean focusrectangle = false
end type

type dw_listado from datawindow within w_resciliacion
integer x = 18
integer y = 652
integer width = 2935
integer height = 592
integer taborder = 80
string dataobject = "d_resciliacion_listado_contratos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string ls_estado

IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	
	gs_base = GetItemString(row , "cadena_codigo")
	gs_serie = GetItemString(row , "cadena_serie")
	gi_numero = GetItemNumber(row , "cadena_numero")
	gi_rut = GetItemNumber(row , "cadena_rut")
	ls_estado = GetItemString(row , "cadena_estado")
	
	cb_ver_cta_cte.Enabled = true
	IF ls_estado = "V" THEN
		cb_resciliar.Enabled = true
		cb_vigente.Enabled = false
	ELSE
		cb_resciliar.Enabled = false
		cb_vigente.Enabled = true
	END IF	
END IF
end event

type cb_cerrar from commandbutton within w_resciliacion
integer x = 2496
integer y = 1280
integer width = 448
integer height = 108
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
Close(w_resciliacion)
end event

type cb_resciliar from commandbutton within w_resciliacion
integer x = 2007
integer y = 1280
integer width = 448
integer height = 108
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Resciliar"
end type

event clicked;date ld_fecha  

ld_fecha = Date(em_fecha.text)
IF MessageBox("Resciliar", "Resciliar este contrato ?", Question!, YesNo!)=1 THEN
	UPDATE "CADENA"  
		  SET "FECHA_RES" = :ld_fecha,   
				"ESTADO" = 'N'  
		WHERE ( "CADENA"."CODIGO" = :gs_base ) AND  
				( "CADENA"."SERIE" = :gs_serie ) AND  
				( "CADENA"."NUMERO" = :gi_numero );
				
	Commit using SQLCA;
	  
	f_busqueda()
	cb_ver_cta_cte.Enabled = false
	cb_resciliar.Enabled = false
	cb_vigente.Enabled = false
	dw_listado.SelectRow(0, FALSE)
END IF

  
  

end event

type cb_ver_cta_cte from commandbutton within w_resciliacion
integer x = 18
integer y = 1272
integer width = 462
integer height = 108
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&uenta Corriente"
end type

event clicked;
CHOOSE CASE gs_base
	CASE "O"
		Open(w_cuenta_corriente_oferta)
	CASE "L"
		Open(w_cuenta_corriente_liberador)
	CASE "C"
		Open(w_cuenta_corriente_contrato_isa)
	CASE "P"
		Open(w_cuenta_corriente_pagare)
	CASE "D"
		Open(w_cuenta_corriente_derecho)
END CHOOSE
end event

type em_fecha from editmask within w_resciliacion
integer x = 2432
integer y = 520
integer width = 521
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "4"
end type

type st_6 from statictext within w_resciliacion
integer x = 1792
integer y = 536
integer width = 599
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Fecha de Resciliación"
boolean focusrectangle = false
end type

type st_5 from statictext within w_resciliacion
integer x = 539
integer y = 336
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Contrato"
boolean focusrectangle = false
end type

type st_4 from statictext within w_resciliacion
integer x = 2217
integer y = 220
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Nombre"
boolean focusrectangle = false
end type

type st_3 from statictext within w_resciliacion
integer x = 1344
integer y = 220
integer width = 338
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ap. Materno"
boolean focusrectangle = false
end type

type sle_numero from singlelineedit within w_resciliacion
integer x = 987
integer y = 328
integer width = 325
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_serie from singlelineedit within w_resciliacion
integer x = 823
integer y = 328
integer width = 137
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_nombre from singlelineedit within w_resciliacion
integer x = 2459
integer y = 212
integer width = 489
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_amaterno from singlelineedit within w_resciliacion
integer x = 1701
integer y = 212
integer width = 489
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_apaterno from singlelineedit within w_resciliacion
integer x = 827
integer y = 212
integer width = 489
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_resciliacion
integer x = 475
integer y = 220
integer width = 329
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ap. Paterno"
boolean focusrectangle = false
end type

type st_1 from statictext within w_resciliacion
integer x = 475
integer y = 60
integer width = 1696
integer height = 76
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Proceso de Resciliación de Oferta o Liberadores"
boolean focusrectangle = false
end type

type p_1 from picture within w_resciliacion
integer x = 37
integer y = 32
integer width = 389
integer height = 416
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

