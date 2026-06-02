forward
global type w_cargar_contratos from window
end type
type dw_cargar from datawindow within w_cargar_contratos
end type
type cb_importar from commandbutton within w_cargar_contratos
end type
type cb_mostrar from commandbutton within w_cargar_contratos
end type
type cb_limpiar from commandbutton within w_cargar_contratos
end type
type pb_buscar from picturebutton within w_cargar_contratos
end type
type em_ctto from editmask within w_cargar_contratos
end type
type st_3 from statictext within w_cargar_contratos
end type
type cb_6 from commandbutton within w_cargar_contratos
end type
type cb_5 from commandbutton within w_cargar_contratos
end type
type cb_4 from commandbutton within w_cargar_contratos
end type
type cb_1 from commandbutton within w_cargar_contratos
end type
type cb_2 from commandbutton within w_cargar_contratos
end type
type cb_3 from commandbutton within w_cargar_contratos
end type
type st_2 from statictext within w_cargar_contratos
end type
type st_1 from statictext within w_cargar_contratos
end type
type cb_procesar from commandbutton within w_cargar_contratos
end type
type cb_cerrar from commandbutton within w_cargar_contratos
end type
type dw_detalle from datawindow within w_cargar_contratos
end type
type dw_ctto from datawindow within w_cargar_contratos
end type
type gb_1 from groupbox within w_cargar_contratos
end type
type gb_2 from groupbox within w_cargar_contratos
end type
end forward

global type w_cargar_contratos from window
integer width = 4507
integer height = 1512
boolean titlebar = true
string title = "Cargar Contratos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
dw_cargar dw_cargar
cb_importar cb_importar
cb_mostrar cb_mostrar
cb_limpiar cb_limpiar
pb_buscar pb_buscar
em_ctto em_ctto
st_3 st_3
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
st_2 st_2
st_1 st_1
cb_procesar cb_procesar
cb_cerrar cb_cerrar
dw_detalle dw_detalle
dw_ctto dw_ctto
gb_1 gb_1
gb_2 gb_2
end type
global w_cargar_contratos w_cargar_contratos

on w_cargar_contratos.create
this.dw_cargar=create dw_cargar
this.cb_importar=create cb_importar
this.cb_mostrar=create cb_mostrar
this.cb_limpiar=create cb_limpiar
this.pb_buscar=create pb_buscar
this.em_ctto=create em_ctto
this.st_3=create st_3
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_procesar=create cb_procesar
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.dw_ctto=create dw_ctto
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_cargar,&
this.cb_importar,&
this.cb_mostrar,&
this.cb_limpiar,&
this.pb_buscar,&
this.em_ctto,&
this.st_3,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.st_2,&
this.st_1,&
this.cb_procesar,&
this.cb_cerrar,&
this.dw_detalle,&
this.dw_ctto,&
this.gb_1,&
this.gb_2}
end on

on w_cargar_contratos.destroy
destroy(this.dw_cargar)
destroy(this.cb_importar)
destroy(this.cb_mostrar)
destroy(this.cb_limpiar)
destroy(this.pb_buscar)
destroy(this.em_ctto)
destroy(this.st_3)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_procesar)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
destroy(this.dw_ctto)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;

gf_centrar(w_cargar_contratos)
dw_ctto.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_cargar.settransobject(sqlca)
//dw_ctto.retrieve()
//ll_tot_reg	= dw_ctto.retrieve()
//'estado_reg',1)
end event

type dw_cargar from datawindow within w_cargar_contratos
boolean visible = false
integer x = 1568
integer y = 1416
integer width = 1211
integer height = 400
string title = "none"
string dataobject = "dwe_cargar_base_externa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_importar from commandbutton within w_cargar_contratos
integer x = 3698
integer y = 1260
integer width = 370
integer height = 100
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Importar Base"
end type

event clicked;Integer	value
String		docname,named,ls_base,ls_serie,ls_string
Long		ll_tot_reg, ll_indi,ll_numero,ll_marca,ll_tot_ctto,ll_count=0


dw_cargar.reset()
value			= GetFileOpenName("Seleccione Archivo", docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
dw_cargar.ImportFile(docname)
ll_tot_reg	= dw_cargar.rowcount()
ll_tot_ctto	= dw_ctto.rowcount()
if ll_tot_reg > 0 then
	SetPointer(HourGlass!)
	for ll_indi=1 to ll_tot_reg
		ls_base		= dw_cargar.getitemstring(ll_indi,'base')
		ls_serie		= dw_cargar.getitemstring(ll_indi,'serie')
		ll_numero	= dw_cargar.getitemnumber(ll_indi,'numero')
		if ll_numero > 0 then
			ls_string	= "base = '"+ls_base+"' and serie = '"+ls_serie+"' and numero = "+string(ll_numero)
			ll_marca	= dw_ctto.Find( ls_string,  1, ll_tot_ctto)
			if ll_marca > 0 then
				dw_ctto.setitem(ll_marca,'estado_reg',0)
				ll_count ++
			end if
		end if
	next
	SetPointer(Arrow!)
end if
dw_ctto.accepttext()

if ll_count > 0 then
	messagebox("Desarrollo Cuota","Se Encontró "+string(ll_count,'###,###,###,###,##0')+" Contratos para Desarrollo de Cuotas")
end if
end event

type cb_mostrar from commandbutton within w_cargar_contratos
integer x = 50
integer y = 1260
integer width = 302
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mostrar"
end type

event clicked;Long		ll_tot_reg,ll_indi

ll_tot_reg		= dw_ctto.retrieve()
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		dw_ctto.setitem(ll_indi,'estado_reg',1)
	next
	dw_ctto.accepttext()
end if
end event

type cb_limpiar from commandbutton within w_cargar_contratos
integer x = 3401
integer y = 1260
integer width = 279
integer height = 100
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_detalle.reset()
dw_ctto.reset()
em_ctto.text		= ''

end event

type pb_buscar from picturebutton within w_cargar_contratos
integer x = 2459
integer y = 1252
integer width = 128
integer height = 112
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "LUPA.BMP"
alignment htextalign = left!
end type

event clicked;String		ls_ctto
Long		ll_fila,ll_tot_reg

ll_tot_reg	= dw_ctto.RowCount()
if ll_tot_reg > 0 then
	ls_ctto		= trim(em_ctto.text)
	ll_fila			= dw_ctto.Find("numero = "+ls_ctto,1,ll_tot_reg )
	if ll_fila > 0 then
		dw_ctto.setfocus()
		dw_ctto.scrolltorow(ll_fila)
	end if
end if
end event

type em_ctto from editmask within w_cargar_contratos
integer x = 1870
integer y = 1260
integer width = 581
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

event modified;Double		ll_ctto

ll_ctto		= Double(trim(em_ctto.text))
if ll_ctto > 0 then pb_buscar.triggerevent(clicked!)
end event

type st_3 from statictext within w_cargar_contratos
integer x = 1463
integer y = 1280
integer width = 393
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_cargar_contratos
integer x = 2903
integer y = 1260
integer width = 219
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type cb_5 from commandbutton within w_cargar_contratos
boolean visible = false
integer x = 3127
integer y = 1260
integer width = 219
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_4 from commandbutton within w_cargar_contratos
integer x = 2661
integer y = 1260
integer width = 238
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_detalle.rowcount() > 0 then
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_1 from commandbutton within w_cargar_contratos
integer x = 759
integer y = 1260
integer width = 238
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_ctto.rowcount() > 0 then
	setnull (nulo)
	dw_ctto.SETSORT(NULO)
	dw_ctto.SORT()
end if
end event

type cb_2 from commandbutton within w_cargar_contratos
boolean visible = false
integer x = 1189
integer y = 1260
integer width = 219
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_ctto
if dw_ctto.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_3 from commandbutton within w_cargar_contratos
integer x = 1001
integer y = 1260
integer width = 183
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_ctto.SETfilter(NULO)
dw_ctto.filter()

end event

type st_2 from statictext within w_cargar_contratos
integer x = 2624
integer y = 32
integer width = 704
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Cuotas"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cargar_contratos
integer x = 50
integer y = 32
integer width = 704
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de Contratos"
boolean focusrectangle = false
end type

type cb_procesar from commandbutton within w_cargar_contratos
integer x = 379
integer y = 1260
integer width = 302
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;Long		ll_fila,ll_plazo,ll_tot_reg,ll_marca,ll_estado_reg,ll_res
Double	ldb_precio, ldb_pie, ldb_tasa,ldb_valor_cuota, ll_numero,ldb_gasto_adm,ldb_tasa_interes
String		ls_moneda,ls_base,ls_serie, ls_pasa='N'
Datetime	ldt_fecha_prim

ll_tot_reg 							= dw_ctto.rowcount()
if ll_tot_reg > 0 then
	ll_marca							= dw_ctto.Find( "estado_reg = 0",  1, ll_tot_reg)
	if ll_marca > 0 then
		dw_ctto.SETfilter('estado_reg = 0')
		dw_ctto.filter()
		ll_tot_reg					= dw_ctto.rowcount()
		if ll_tot_reg > 0 then
			ll_res						= messagebox("Advertencia","Esta Seguro Procesar",Exclamation!,YesNo!,2)
			if ll_res = 1 then ls_pasa='S'
		end if
		if ls_pasa='S' then
			for ll_fila=1 to ll_tot_reg
				ll_estado_reg			= dw_ctto.getitemnumber(ll_fila,'estado_reg')
				if ll_estado_reg = 0 then
					ldb_precio			= round(dw_ctto.getitemnumber(ll_fila,'precio'),2)
					ldb_pie				= dw_ctto.getitemnumber(ll_fila,'pie')
					ldb_tasa				= dw_ctto.getitemnumber(ll_fila,'tasa_base')
					ldb_tasa_interes	= dw_ctto.getitemnumber(ll_fila,'tasa_interes_cuota')
					ll_plazo				= dw_ctto.getitemnumber(ll_fila,'plazo')
					ldb_valor_cuota	= dw_ctto.getitemnumber(ll_fila,'valor_cuota')
					ls_moneda			= dw_ctto.getitemstring(ll_fila,'moneda')
					ls_base				= dw_ctto.getitemstring(ll_fila,'base')
					ls_serie				= dw_ctto.getitemstring(ll_fila,'serie')
					ll_numero			= dw_ctto.getitemnumber(ll_fila,'numero')
					ldb_gasto_adm		= dw_ctto.getitemnumber(ll_fila,'gastos_adm')
					ldt_fecha_prim		= dw_ctto.getitemdatetime(ll_fila,'fecha_prim')
					ldb_tasa				= (ldb_tasa / 100) * 12
				//	ldb_gasto_adm		= ldb_gasto_adm / ll_plazo
				//	ldb_precio			= (ldb_precio - ldb_pie) + ldb_gasto_adm
	//				DELETE FROM "DESARROLLO_CUOTA"  
	//				WHERE 	( "DESARROLLO_CUOTA"."BASE" = :ls_base ) AND  
	//							( "DESARROLLO_CUOTA"."SERIE" = :ls_serie ) AND  
	//							( "DESARROLLO_CUOTA"."NUMERO" = :ll_numero )  
	//				USING	sqlca;
	//				if sqlca.sqlcode=0 then
	//					commit;	
	//				else
	//					rollback;
	//				end if
					
					DECLARE SP_DESARROLLO_CUOTA PROCEDURE FOR SP_DESARROLLO_CUOTA( :ls_base, :ls_serie, :ll_numero, :ll_plazo, :ldb_precio, :ldb_pie, :ldb_tasa, :ldb_valor_cuota, :ldb_gasto_adm, :ldt_fecha_prim, :ls_moneda, :ldb_tasa_interes);
					EXECUTE SP_DESARROLLO_CUOTA;
				end if
			next
		end if
		dw_ctto.SETfilter('')
		dw_ctto.filter()
	else
		messagebox("Advertencia","Debe Seleccionar Registro a Crear")
	end if
end if

end event

type cb_cerrar from commandbutton within w_cargar_contratos
integer x = 4119
integer y = 1260
integer width = 302
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_cargar_contratos)
end event

type dw_detalle from datawindow within w_cargar_contratos
integer x = 2624
integer y = 120
integer width = 1797
integer height = 1084
integer taborder = 20
string title = "none"
string dataobject = "dw_desarrollo_cuota_capital_interes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

type dw_ctto from datawindow within w_cargar_contratos
integer x = 50
integer y = 120
integer width = 2542
integer height = 1084
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_contratos_capital_grilla"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, false)
	This.SelectRow(getrow(), true)
end if
end event

event clicked;Long		ll_tot_reg,ll_indi
String		ls_columna

ls_columna			= dwo.name
ll_tot_reg			= dw_ctto.rowcount()
if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
else
	if ll_tot_reg > 0 then
		if ls_columna = 't_marcar' then
			if dw_ctto.object.t_marcar.text	= 'Marcar Todo' then
				dw_ctto.object.t_marcar.text	= 'Desmarcar Todo'
				for ll_indi=1 to ll_tot_reg
					dw_ctto.setitem(ll_indi,'estado_reg',0)
				next
			else
				dw_ctto.object.t_marcar.text	= 'Marcar Todo'
				for ll_indi=1 to ll_tot_reg
					dw_ctto.setitem(ll_indi,'estado_reg',1)
				next
			end if
			dw_ctto.accepttext()
		end if
	end if
end if
end event

event doubleclicked;String		ls_base,ls_serie
Long		ll_numero

if row > 0 then
	ls_base		= dw_ctto.getitemstring(row,'base')
	ls_serie		= dw_ctto.getitemstring(row,'serie')
	ll_numero	= dw_ctto.getitemnumber(row,'numero')
	dw_detalle.retrieve(ls_base,ls_serie,ll_numero)
end if
end event

type gb_1 from groupbox within w_cargar_contratos
integer x = 736
integer y = 1208
integer width = 699
integer height = 172
integer taborder = 80
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_cargar_contratos
integer x = 2638
integer y = 1208
integer width = 736
integer height = 172
integer taborder = 140
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

