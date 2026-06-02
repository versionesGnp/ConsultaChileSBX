forward
global type w_año_trimestral from window
end type
type ddlb_2 from dropdownlistbox within w_año_trimestral
end type
type st_2 from statictext within w_año_trimestral
end type
type rb_mora from radiobutton within w_año_trimestral
end type
type ddlb_1 from dropdownlistbox within w_año_trimestral
end type
type rb_facturacion_anual from radiobutton within w_año_trimestral
end type
type cb_2 from commandbutton within w_año_trimestral
end type
type cb_1 from commandbutton within w_año_trimestral
end type
type gb_1 from groupbox within w_año_trimestral
end type
end forward

global type w_año_trimestral from window
integer x = 1074
integer y = 484
integer width = 1061
integer height = 480
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
ddlb_2 ddlb_2
st_2 st_2
rb_mora rb_mora
ddlb_1 ddlb_1
rb_facturacion_anual rb_facturacion_anual
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_año_trimestral w_año_trimestral

type variables
date fecha
end variables

on w_año_trimestral.create
this.ddlb_2=create ddlb_2
this.st_2=create st_2
this.rb_mora=create rb_mora
this.ddlb_1=create ddlb_1
this.rb_facturacion_anual=create rb_facturacion_anual
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.ddlb_2,&
this.st_2,&
this.rb_mora,&
this.ddlb_1,&
this.rb_facturacion_anual,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_año_trimestral.destroy
destroy(this.ddlb_2)
destroy(this.st_2)
destroy(this.rb_mora)
destroy(this.ddlb_1)
destroy(this.rb_facturacion_anual)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;string c_fecha,sql,fech
double valor_uf
setpointer (HourGlass!)
this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name
fecha = today ()
sql = 'SELECT DISTINCT substr( "FACTURA_OFERTA"."FECHA_CIERRE",8,10)  '+& 
		' FROM "FACTURA_OFERTA"  '+& 
		' WHERE "FACTURA_OFERTA"."ESTADO" = '+"'"+'N' +"'"+& 
		' GROUP BY "FACTURA_OFERTA"."FECHA_CIERRE" '
fech = mid(string(fecha,gs_formato_fecha),len(string(fecha,gs_formato_fecha))-1)		
ddlb_1.SelectItem(f_ddlb_all_mes(ddlb_1,sql,fech))
if month (today ())<=4 then
	ddlb_2.SelectItem(1)
elseif month (today ()) >= 5 and month (today ()) <= 8 then
	ddlb_2.SelectItem(2)
elseif month (today ()) >= 9 and month (today ()) <= 12 then
	ddlb_2.SelectItem(3)
end if
end event

type ddlb_2 from dropdownlistbox within w_año_trimestral
integer x = 64
integer y = 108
integer width = 443
integer height = 328
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Primer","Segundo","Tercer","Cuarto"}
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_año_trimestral
integer x = 69
integer y = 44
integer width = 434
integer height = 64
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean enabled = false
string text = "Trimestre"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_mora from radiobutton within w_año_trimestral
integer x = 411
integer y = 684
integer width = 800
integer height = 104
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12632256
string text = "Mora Anual"
boolean checked = true
end type

type ddlb_1 from dropdownlistbox within w_año_trimestral
boolean visible = false
integer x = 594
integer y = 408
integer width = 443
integer height = 564
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12632256
boolean vscrollbar = true
end type

type rb_facturacion_anual from radiobutton within w_año_trimestral
boolean visible = false
integer x = 411
integer y = 632
integer width = 800
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12632256
string text = "Facturación Anual"
end type

type cb_2 from commandbutton within w_año_trimestral
integer x = 686
integer y = 228
integer width = 302
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_año_trimestral)
end event

type cb_1 from commandbutton within w_año_trimestral
integer x = 686
integer y = 68
integer width = 302
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string param
integer i
gs_sql = ''
param = trim(ddlb_1.text)
if trim(ddlb_2.text) = 'Primer' then
	gi_trimestre = 1
	for i =1 to ddlb_1.TotalItems( )
		gs_sql = gs_sql + '  SELECT FACTURA_OFERTA.SERIE,   '+&
		'         FACTURA_OFERTA.SALDO_TOTAL,   '+&
		'         FACTURA_OFERTA.CAPITAL,   '+&
		'         FACTURA_OFERTA.INTERES,   '+&
		'         FACTURA_OFERTA.GC,   '+&
		'         FACTURA_OFERTA.FACTURADO,   '+&
		'         FACTURA_OFERTA.FECHA_CIERRE,   '+&
		'         FACTURA_OFERTA.ESTADO  '+&
		'    FROM FACTURA_OFERTA  '+&
		"   WHERE (( FACTURA_OFERTA.FECHA_CIERRE >= TO_DATE('31-Jan-"+trim(ddlb_1.text(i))+" 00:00:00','DD-MON-YYYY HH24:MI:SS') ) AND  "+&
		"         ( FACTURA_OFERTA.FECHA_CIERRE <= TO_DATE('31-Mar-"+trim(ddlb_1.text(i))+" 00:00:00','DD-MON-YYYY HH24:MI:SS') )) AND  "+&
		"         (FACTURA_OFERTA.ESTADO <> '"+'S'+"' AND FACTURA_OFERTA.ESTADO <> '"+'V'+"') AND  "+&
		"         FACTURA_OFERTA.BASE = '"+'O'+"'"+' AND '+&
		'         FACTURA_OFERTA.COD_PARQUE = '+STRING(gi_parque_select)
		if i < ddlb_1.TotalItems( ) then gs_sql = gs_sql+' union '
	next	
elseif trim(ddlb_2.text) = 'Segundo' then
	gi_trimestre = 2
	for i =1 to ddlb_1.TotalItems( )
		gs_sql = gs_sql + '  SELECT FACTURA_OFERTA.SERIE,   '+&
		'         FACTURA_OFERTA.SALDO_TOTAL,   '+&
		'         FACTURA_OFERTA.CAPITAL,   '+&
		'         FACTURA_OFERTA.INTERES,   '+&
		'         FACTURA_OFERTA.GC,   '+&
		'         FACTURA_OFERTA.FACTURADO,   '+&
		'         FACTURA_OFERTA.FECHA_CIERRE,   '+&
		'         FACTURA_OFERTA.ESTADO  '+&
		'    FROM FACTURA_OFERTA  '+&
		"   WHERE (( FACTURA_OFERTA.FECHA_CIERRE >= TO_DATE('30-Apr-"+trim(ddlb_1.text(i))+" 00:00:00','DD-MON-YYYY HH24:MI:SS') ) AND  "+&
		"         ( FACTURA_OFERTA.FECHA_CIERRE <= TO_DATE('30-Jun-"+trim(ddlb_1.text(i))+" 00:00:00','DD-MON-YYYY HH24:MI:SS') )) AND  "+&
		"         (FACTURA_OFERTA.ESTADO = '"+'N'+"' OR FACTURA_OFERTA.ESTADO = '"+'R'+"') AND  "+&
		"         FACTURA_OFERTA.BASE = '"+'O'+"'"+' AND '+&
		'         FACTURA_OFERTA.COD_PARQUE = '+STRING(gi_parque_select)
		if i < ddlb_1.TotalItems( ) then gs_sql = gs_sql+' union '
	next
elseif trim(ddlb_2.text) = 'Tercer' then
	gi_trimestre = 3
	for i =1 to ddlb_1.TotalItems( )
		gs_sql = gs_sql + '  SELECT FACTURA_OFERTA.SERIE,   '+&
		'         FACTURA_OFERTA.SALDO_TOTAL,   '+&
		'         FACTURA_OFERTA.CAPITAL,   '+&
		'         FACTURA_OFERTA.INTERES,   '+&
		'         FACTURA_OFERTA.GC,   '+&
		'         FACTURA_OFERTA.FACTURADO,   '+&
		'         FACTURA_OFERTA.FECHA_CIERRE,   '+&
		'         FACTURA_OFERTA.ESTADO  '+&
		'    FROM FACTURA_OFERTA  '+&
		"   WHERE (( FACTURA_OFERTA.FECHA_CIERRE >= TO_DATE('31-Jul-"+trim(ddlb_1.text(i))+" 00:00:00','DD-MON-YYYY HH24:MI:SS') ) AND  "+&
		"         ( FACTURA_OFERTA.FECHA_CIERRE <= TO_DATE('30-Sep-"+trim(ddlb_1.text(i))+" 00:00:00','DD-MON-YYYY HH24:MI:SS') )) AND  "+&
		"         (FACTURA_OFERTA.ESTADO = '"+'N'+"' OR FACTURA_OFERTA.ESTADO = '"+'R'+"') AND  "+&
		"         FACTURA_OFERTA.BASE = '"+'O'+"'"+' AND '+&
		'         FACTURA_OFERTA.COD_PARQUE = '+STRING(gi_parque_select)
		if i < ddlb_1.TotalItems( ) then gs_sql = gs_sql+' union '
	next
elseif trim(ddlb_2.text) = 'Cuarto' then
	gi_trimestre = 4
	for i =1 to ddlb_1.TotalItems( )
		gs_sql = gs_sql + '  SELECT FACTURA_OFERTA.SERIE,   '+&
		'         FACTURA_OFERTA.SALDO_TOTAL,   '+&
		'         FACTURA_OFERTA.CAPITAL,   '+&
		'         FACTURA_OFERTA.INTERES,   '+&
		'         FACTURA_OFERTA.GC,   '+&
		'         FACTURA_OFERTA.FACTURADO,   '+&
		'         FACTURA_OFERTA.FECHA_CIERRE,   '+&
		'         FACTURA_OFERTA.ESTADO  '+&
		'    FROM FACTURA_OFERTA  '+&
		"   WHERE (( FACTURA_OFERTA.FECHA_CIERRE >= TO_DATE('31-Oct-"+trim(ddlb_1.text(i))+" 00:00:00','DD-MON-YYYY HH24:MI:SS') ) AND  "+&
		"         ( FACTURA_OFERTA.FECHA_CIERRE <= TO_DATE('31-Dec-"+trim(ddlb_1.text(i))+" 00:00:00','DD-MON-YYYY HH24:MI:SS') )) AND  "+&
		"         (FACTURA_OFERTA.ESTADO = '"+'N'+"' OR FACTURA_OFERTA.ESTADO = '"+'R'+"') AND  "+&
		"         FACTURA_OFERTA.BASE = '"+'O'+"'"+' AND '+&
		'         FACTURA_OFERTA.COD_PARQUE = '+STRING(gi_parque_select)
		if i < ddlb_1.TotalItems( ) then gs_sql = gs_sql+' union '
	next
end if
OpenWithParm(w_estadisticas_fact_total_trimestral,param)	
//close(w_año_trimestral)
end event

type gb_1 from groupbox within w_año_trimestral
integer x = 41
integer y = 548
integer width = 1646
integer height = 352
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
end type

