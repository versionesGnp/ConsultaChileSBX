forward
global type w_convenio_bk from window
end type
type cb_guardar from commandbutton within w_convenio_bk
end type
type cb_exportar from commandbutton within w_convenio_bk
end type
type cb_2 from commandbutton within w_convenio_bk
end type
type cb_3 from commandbutton within w_convenio_bk
end type
type cb_4 from commandbutton within w_convenio_bk
end type
type rb_promesa from radiobutton within w_convenio_bk
end type
type rb_pagare from radiobutton within w_convenio_bk
end type
type cb_procesar from commandbutton within w_convenio_bk
end type
type cb_cerrar from commandbutton within w_convenio_bk
end type
type dw_convenio from datawindow within w_convenio_bk
end type
type st_1 from statictext within w_convenio_bk
end type
type gb_2 from groupbox within w_convenio_bk
end type
end forward

global type w_convenio_bk from window
integer width = 3991
integer height = 2244
boolean titlebar = true
string title = "Convenio"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_guardar cb_guardar
cb_exportar cb_exportar
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
rb_promesa rb_promesa
rb_pagare rb_pagare
cb_procesar cb_procesar
cb_cerrar cb_cerrar
dw_convenio dw_convenio
st_1 st_1
gb_2 gb_2
end type
global w_convenio_bk w_convenio_bk

on w_convenio_bk.create
this.cb_guardar=create cb_guardar
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.rb_promesa=create rb_promesa
this.rb_pagare=create rb_pagare
this.cb_procesar=create cb_procesar
this.cb_cerrar=create cb_cerrar
this.dw_convenio=create dw_convenio
this.st_1=create st_1
this.gb_2=create gb_2
this.Control[]={this.cb_guardar,&
this.cb_exportar,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.rb_promesa,&
this.rb_pagare,&
this.cb_procesar,&
this.cb_cerrar,&
this.dw_convenio,&
this.st_1,&
this.gb_2}
end on

on w_convenio_bk.destroy
destroy(this.cb_guardar)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.rb_promesa)
destroy(this.rb_pagare)
destroy(this.cb_procesar)
destroy(this.cb_cerrar)
destroy(this.dw_convenio)
destroy(this.st_1)
destroy(this.gb_2)
end on

event open;datetime ldt_fecha_hoy
double	ldb_valor_uf_dia

gf_centrar(w_convenio)
dw_convenio.settransobject(sqlca)
rb_pagare.checked = true

end event

type cb_guardar from commandbutton within w_convenio_bk
integer x = 713
integer y = 1964
integer width = 343
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar"
end type

event clicked;string 	ls_nombre,ls_apellido_pat,ls_apellido_mat,ls_serie
long   	ll_rut,ll_valor_cuota,ll_cod_convenio,ret
datetime ldt_fecha_hoy,ldt_fecha_pago
Double	ll_numero
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
ls_serie					= dw_convenio.GetItemString(1,'contrato_serie')
ll_numero				= dw_convenio.GetItemNumber(1,'contrato_nro_contrato')
ll_rut						= dw_convenio.GetItemNumber(1,'contrato_rut')
ls_nombre				= dw_convenio.GetItemString(1,'cliente_nombre')
ls_apellido_pat			= dw_convenio.GetItemString(1,'cliente_a_paterno')
ls_apellido_mat			= dw_convenio.GetItemString(1,'cliente_a_materno')
ll_valor_cuota			= dw_convenio.GetItemNumber(1,'c_valor_cuota')
ldt_fecha_pago			= dw_convenio.GetItemdatetime(1,'cadena_mora_fecha_venc_cred')
ll_cod_convenio		= dw_convenio.GetItemNumber(1,'convenio_retiro_cod_convenio')

ret = MessageBox('Actualizar', "Desea Grabar Convenios", Question!, YesNo!, 2)
IF ret = 1 THEN
	INSERT INTO "CONVENIO"  
				( "SERIE",		"NUMERO",	"RUT",	"NOMBRE",	"AP_PATERNO",		"AP_MATERNO",		"FECHA_PAGO",		"VALOR_CUOTA",		"COD_CONVENIO",		"FECHA_ENVIO_CARTA")  
	VALUES 	( :ls_serie,	:ll_numero,	:ll_rut,	:ls_nombre,	:ls_apellido_pat,	:ls_apellido_mat,	:ldt_fecha_pago,	:ll_valor_cuota,	:ll_cod_convenio,		:ldt_fecha_hoy)
	USING   sqlca;
	if sqlca.sqlcode = 0 then
		commit using sqlca;
		 messagebox("Grabar","Grabación Exitosa",Exclamation!)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Convenio SQL: "+sqlca.sqlerrtext)
	end if
end if


end event

type cb_exportar from commandbutton within w_convenio_bk
integer x = 1856
integer y = 1984
integer width = 242
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_convenio.rowcount() > 0 then
	f_DWToExcel(dw_convenio)
end if
end event

type cb_2 from commandbutton within w_convenio_bk
integer x = 2103
integer y = 1984
integer width = 242
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_convenio.SETSORT(NULO)
dw_convenio.SORT()

end event

type cb_3 from commandbutton within w_convenio_bk
integer x = 2350
integer y = 1984
integer width = 206
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_convenio.SETfilter(ls_texto)
dw_convenio.filter()
end event

type cb_4 from commandbutton within w_convenio_bk
integer x = 2560
integer y = 1984
integer width = 229
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_convenio.rowcount() > 0 then 
	dw_convenio.object.datawindow.Print.Preview	= true
	dw_convenio.object.datawindow.zoom				= 82
	f_Print( dw_convenio )
	dw_convenio.object.datawindow.Print.Preview	= False
	dw_convenio.object.datawindow.zoom				= 100
end if
end event

type rb_promesa from radiobutton within w_convenio_bk
integer x = 658
integer y = 200
integer width = 402
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Promesa"
end type

event clicked;dw_convenio.reset()
end event

type rb_pagare from radiobutton within w_convenio_bk
integer x = 69
integer y = 196
integer width = 402
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagare"
end type

event clicked;dw_convenio.reset()
end event

type cb_procesar from commandbutton within w_convenio_bk
integer x = 27
integer y = 1964
integer width = 343
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;long		tot_reg,ll_indi
datetime ldt_fecha_hoy
double	ldb_valor_uf_dia

ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf_dia  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldb_valor_uf_dia) AND ldb_valor_uf_dia > 0 then
		ldb_valor_uf_dia		= ldb_valor_uf_dia
	else
		ldb_valor_uf_dia		= 0
	end if
end if

if rb_pagare.checked=true then
	dw_convenio.dataobject	= 'dw_convenio'
	dw_convenio.settransobject(sqlca)
	dw_convenio.retrieve()
	tot_reg						= dw_convenio.RowCount()
	if tot_reg > 0 then
		for ll_indi = 1 to tot_reg
			dw_convenio.setitem(ll_indi,"c_uf_dia",ldb_valor_uf_dia)
		next
	else
		messagebox("Advertencia","No Registra datos")
	end if
elseif rb_promesa.checked=true then
	dw_convenio.dataobject	= 'dw_convenio_promesas'
	dw_convenio.settransobject(sqlca)
	if dw_convenio.retrieve()=0 then 
		messagebox("Advertencia","No Registra datos")
	end if
end if
end event

type cb_cerrar from commandbutton within w_convenio_bk
integer x = 3584
integer y = 1964
integer width = 343
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_convenio)
end event

type dw_convenio from datawindow within w_convenio_bk
integer x = 27
integer y = 300
integer width = 3899
integer height = 1636
integer taborder = 10
string title = "none"
string dataobject = "dw_convenio"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

type st_1 from statictext within w_convenio_bk
integer x = 1760
integer y = 64
integer width = 608
integer height = 124
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Convenio"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_convenio_bk
integer x = 1833
integer y = 1936
integer width = 983
integer height = 156
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

