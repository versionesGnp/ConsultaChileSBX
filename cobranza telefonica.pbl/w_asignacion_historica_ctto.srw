forward
global type w_asignacion_historica_ctto from window
end type
type dw_telef from datawindow within w_asignacion_historica_ctto
end type
type dw_pagos from datawindow within w_asignacion_historica_ctto
end type
type cb_cerrar from commandbutton within w_asignacion_historica_ctto
end type
type cb_ordenar from commandbutton within w_asignacion_historica_ctto
end type
type cb_filtrar from commandbutton within w_asignacion_historica_ctto
end type
type cb_exportar from commandbutton within w_asignacion_historica_ctto
end type
type cb_imprimir from commandbutton within w_asignacion_historica_ctto
end type
type dw_lista from datawindow within w_asignacion_historica_ctto
end type
type gb_1 from groupbox within w_asignacion_historica_ctto
end type
type gb_2 from groupbox within w_asignacion_historica_ctto
end type
type gb_3 from groupbox within w_asignacion_historica_ctto
end type
type gb_4 from groupbox within w_asignacion_historica_ctto
end type
end forward

global type w_asignacion_historica_ctto from window
integer x = 832
integer y = 360
integer width = 3374
integer height = 2136
boolean titlebar = true
string title = "Asiganación Histórica"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_telef dw_telef
dw_pagos dw_pagos
cb_cerrar cb_cerrar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_asignacion_historica_ctto w_asignacion_historica_ctto

type variables
long	il_row,il_row2,il_row3
end variables

forward prototypes
public function integer wf_actualizar (string fecha_cierre)
end prototypes

public function integer wf_actualizar (string fecha_cierre);datetime fecha1

fecha1 = datetime(date(fecha_cierre),time('00:00:00'))
DELETE FROM "FACTURA_OFERTA"  
WHERE ( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
      ( "FACTURA_OFERTA"."FECHA_CIERRE" = :FECHA1 ) ;
If sqlca.sqlcode < 0 Then
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_actualiza()")
	ROLLBACK;
ELSE
	COMMIT;
end if	
DELETE FROM "FACTURA_OFERTA_DV"  
WHERE ( "FACTURA_OFERTA_DV"."BASE" = 'O' ) AND  
      ( "FACTURA_OFERTA_DV"."FECHA_CIERRE" = :FECHA1 ) ;
If sqlca.sqlcode < 0 Then
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_actualiza()")
	ROLLBACK;
ELSE
	COMMIT;
end if
DELETE FROM "FACTURA_OFERTA_DV_M"  
WHERE ( "FACTURA_OFERTA_DV_M"."BASE" = 'O' ) AND  
      ( "FACTURA_OFERTA_DV_M"."FECHA_CIERRE" = :FECHA1 ) ;
If sqlca.sqlcode < 0 Then
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_actualiza()")
	ROLLBACK;
ELSE
	COMMIT;
end if	
return 1
end function

on w_asignacion_historica_ctto.create
this.dw_telef=create dw_telef
this.dw_pagos=create dw_pagos
this.cb_cerrar=create cb_cerrar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.dw_telef,&
this.dw_pagos,&
this.cb_cerrar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_asignacion_historica_ctto.destroy
destroy(this.dw_telef)
destroy(this.dw_pagos)
destroy(this.cb_cerrar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;string		ls_base,ls_serie
long		ll_tot_reg
double	ldb_numero,ldb_rut

gf_centrar(w_asignacion_historica_ctto)

dw_lista.dataobject = 'dw_asiganacion_historica_ctto'
dw_lista.settransobject(sqlca)

dw_telef.dataobject = 'dw_detalle_cob_periodo'
dw_telef.settransobject(sqlca)

dw_pagos.dataobject = 'dw_ingresos_fecha_gestion'
dw_pagos.settransobject(sqlca)

ls_base				= substr(1,1,Message.StringParm)
ls_serie				= substr(1,2,Message.StringParm)
ldb_numero			= double(substr(1,3,Message.StringParm))
ldb_rut				= double(substr(1,4,Message.StringParm))
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero>0 then
	ll_tot_reg		= dw_lista.retrieve(ls_base,ls_serie,ldb_numero,ldb_rut)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Asignación")
	end if
end if


end event

type dw_telef from datawindow within w_asignacion_historica_ctto
integer x = 69
integer y = 812
integer width = 3195
integer height = 416
integer taborder = 30
string title = "none"
string dataobject = "dw_detalle_cob_periodo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row2				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row2, TRUE)
end if
end event

type dw_pagos from datawindow within w_asignacion_historica_ctto
integer x = 69
integer y = 1384
integer width = 3195
integer height = 416
integer taborder = 20
string title = "none"
string dataobject = "dw_ingresos_fecha_gestion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row3				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row3, TRUE)
end if
end event

type cb_cerrar from commandbutton within w_asignacion_historica_ctto
event ue_mousemove pbm_mousemove
integer x = 3003
integer y = 1880
integer width = 297
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_asignacion_historica_ctto)
end event

type cb_ordenar from commandbutton within w_asignacion_historica_ctto
event ue_mousemove pbm_dwnmousemove
integer x = 1047
integer y = 1888
integer width = 247
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_filtrar from commandbutton within w_asignacion_historica_ctto
event ue_mousemove pbm_mousemove
integer x = 1298
integer y = 1888
integer width = 247
integer height = 92
integer taborder = 20
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
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_exportar from commandbutton within w_asignacion_historica_ctto
event ue_mousemove pbm_mousemove
integer x = 1550
integer y = 1888
integer width = 247
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_asignacion_historica_ctto
event ue_mousemove pbm_mousemove
integer x = 1842
integer y = 1888
integer width = 247
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_asignacion_historica_ctto
integer x = 69
integer y = 96
integer width = 3195
integer height = 520
integer taborder = 10
string title = "none"
string dataobject = "dw_asiganacion_historica_ctto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string		ls_base,ls_serie
long		ll_tot_reg,ll_cuotas,ll_tot_reg2
double	ldb_numero,ldb_rut
Datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_prox_3_meses

if row>0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ldb_numero			= dw_lista.getitemnumber(il_row,'numero')
	ldb_rut				= dw_lista.getitemnumber(il_row,'rut')
		
	ldt_fec_ini			= dw_lista.getitemdatetime(il_row,'fecha_asignacion')
	ldt_fec_fin			= dw_lista.getitemdatetime(il_row,'fec_termino_asig')
	if isnull(ldt_fec_fin) then
		ll_cuotas			= 3
		DECLARE sp_prox_3_meses PROCEDURE FOR sp_calcular_3_meses( :ldt_fec_ini, :ll_cuotas );
		EXECUTE sp_prox_3_meses;
		if sqlca.sqlcode=0 then
			fetch sp_prox_3_meses into :ldt_fec_prox_3_meses ;
			close sp_prox_3_meses;
		end if
	end if
	ll_tot_reg			= dw_pagos.retrieve(ls_base,ls_serie,ldb_numero,ldt_fec_ini,ldt_fec_fin)
	ll_tot_reg2			= dw_telef.retrieve(ldb_rut,ldt_fec_ini,ldt_fec_fin)
end if
end event

event rowfocuschanged;string		ls_base,ls_serie
long		ll_tot_reg,ll_cuotas,ll_tot_reg2
double	ldb_numero,ldb_rut
Datetime	ldt_fec_ini,ldt_fec_fin,ldt_fec_prox_3_meses

if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ls_base				= dw_lista.getitemstring(il_row,'base')
	ls_serie				= dw_lista.getitemstring(il_row,'serie')
	ldb_numero			= dw_lista.getitemnumber(il_row,'numero')
	ldb_rut				= dw_lista.getitemnumber(il_row,'rut')
	ldt_fec_ini			= dw_lista.getitemdatetime(il_row,'fecha_asignacion')
	ldt_fec_fin			= dw_lista.getitemdatetime(il_row,'fec_termino_asig')
	if isnull(ldt_fec_fin) then
		ll_cuotas			= 3
		DECLARE sp_prox_3_meses PROCEDURE FOR sp_calcular_3_meses( :ldt_fec_ini, :ll_cuotas );
		EXECUTE sp_prox_3_meses;
		if sqlca.sqlcode=0 then
			fetch sp_prox_3_meses into :ldt_fec_prox_3_meses ;
			close sp_prox_3_meses;
		end if
	end if
	ll_tot_reg			= dw_pagos.retrieve(ls_base,ls_serie,ldb_numero,ldt_fec_ini,ldt_fec_fin)
	ll_tot_reg2			= dw_telef.retrieve(ldb_rut,ldt_fec_ini,ldt_fec_fin)
end if
end event

type gb_1 from groupbox within w_asignacion_historica_ctto
event ue_mousemove pbm_mousemove
integer x = 1029
integer y = 1844
integer width = 1088
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_asignacion_historica_ctto
integer x = 32
integer y = 736
integer width = 3273
integer height = 524
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Detalle Llamado Período Asignación"
end type

type gb_3 from groupbox within w_asignacion_historica_ctto
integer x = 32
integer y = 24
integer width = 3273
integer height = 680
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Detalle Asignación Histórica"
end type

type gb_4 from groupbox within w_asignacion_historica_ctto
integer x = 32
integer y = 1308
integer width = 3273
integer height = 524
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "Detalle Pago Período Asignación"
end type

