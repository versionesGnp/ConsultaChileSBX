forward
global type w_beneficios_ingreso_bkp from window
end type
type sle_moneda from singlelineedit within w_beneficios_ingreso_bkp
end type
type dw_ingreso from datawindow within w_beneficios_ingreso_bkp
end type
type dw_beneficios_seleccionados from datawindow within w_beneficios_ingreso_bkp
end type
type sle_pie from singlelineedit within w_beneficios_ingreso_bkp
end type
type st_pie from statictext within w_beneficios_ingreso_bkp
end type
type sle_numero from singlelineedit within w_beneficios_ingreso_bkp
end type
type sle_base from singlelineedit within w_beneficios_ingreso_bkp
end type
type sle_serie from singlelineedit within w_beneficios_ingreso_bkp
end type
type st_2 from statictext within w_beneficios_ingreso_bkp
end type
type st_1 from statictext within w_beneficios_ingreso_bkp
end type
type cb_grabar from commandbutton within w_beneficios_ingreso_bkp
end type
type cb_cerrar from commandbutton within w_beneficios_ingreso_bkp
end type
type dw_lista_beneficios from datawindow within w_beneficios_ingreso_bkp
end type
type gb_1 from groupbox within w_beneficios_ingreso_bkp
end type
type st_6 from statictext within w_beneficios_ingreso_bkp
end type
end forward

global type w_beneficios_ingreso_bkp from window
integer width = 2839
integer height = 2204
boolean titlebar = true
string title = "Ingreso Promociones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_moneda sle_moneda
dw_ingreso dw_ingreso
dw_beneficios_seleccionados dw_beneficios_seleccionados
sle_pie sle_pie
st_pie st_pie
sle_numero sle_numero
sle_base sle_base
sle_serie sle_serie
st_2 st_2
st_1 st_1
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_lista_beneficios dw_lista_beneficios
gb_1 gb_1
st_6 st_6
end type
global w_beneficios_ingreso_bkp w_beneficios_ingreso_bkp

type variables
string		is_base,is_serie
Double	il_numero
Real		il_pie
end variables

on w_beneficios_ingreso_bkp.create
this.sle_moneda=create sle_moneda
this.dw_ingreso=create dw_ingreso
this.dw_beneficios_seleccionados=create dw_beneficios_seleccionados
this.sle_pie=create sle_pie
this.st_pie=create st_pie
this.sle_numero=create sle_numero
this.sle_base=create sle_base
this.sle_serie=create sle_serie
this.st_2=create st_2
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_lista_beneficios=create dw_lista_beneficios
this.gb_1=create gb_1
this.st_6=create st_6
this.Control[]={this.sle_moneda,&
this.dw_ingreso,&
this.dw_beneficios_seleccionados,&
this.sle_pie,&
this.st_pie,&
this.sle_numero,&
this.sle_base,&
this.sle_serie,&
this.st_2,&
this.st_1,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_lista_beneficios,&
this.gb_1,&
this.st_6}
end on

on w_beneficios_ingreso_bkp.destroy
destroy(this.sle_moneda)
destroy(this.dw_ingreso)
destroy(this.dw_beneficios_seleccionados)
destroy(this.sle_pie)
destroy(this.st_pie)
destroy(this.sle_numero)
destroy(this.sle_base)
destroy(this.sle_serie)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_lista_beneficios)
destroy(this.gb_1)
destroy(this.st_6)
end on

event open;string		ls_usuario,ls_estado,ls_moneda,ls_texto
long		ll_rut,ll_indi,ll_tot_reg,ll_cod,ll_cod_det,ll_fila,ll_codigo
date		ld_fecha

gf_centrar(w_beneficios_ingreso)
dw_lista_beneficios.settransobject(sqlca)
dw_ingreso.settransobject(sqlca)
is_base				= trim(substr(1,1,Message.StringParm))
is_serie				= trim(substr(1,2,Message.StringParm))
il_numero			= Double(substr(1,3,Message.StringParm))
il_pie					= Real(substr(1,4,Message.StringParm))
ll_codigo				= long(substr(1,5,Message.StringParm))
ls_moneda			= trim(substr(1,6,Message.StringParm))
dw_ingreso.retrieve(is_base,is_serie,il_numero)
if ls_moneda='1' then
	sle_moneda.text	= '$'
elseif ls_moneda='2' then
	sle_moneda.text	= 'UF'
end if
sle_base.text		= is_base
sle_serie.text		= is_serie
sle_numero.text	= string(il_numero,'###,###,###,##0')
sle_pie.text			= string(il_pie,'###,###,###,##0.0###')
ll_tot_reg			= dw_lista_beneficios.retrieve(ll_codigo)
for ll_indi=1 to ll_tot_reg
	dw_lista_beneficios.setitem(ll_indi,'estado_reg',1)
next
DECLARE		x1 CURSOR FOR  
SELECT 		"TIPO_PROMOCION_ASOCIADOS"."COD_BENEFICIO",   
				"TIPO_PROMOCION_ASOCIADOS"."COD_BENEF_DETALLE"  
FROM 		"TIPO_PROMOCION_ASOCIADOS"  
WHERE 	  ( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
			  ( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
			  ( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero )   AND 
			  ( "TIPO_PROMOCION_ASOCIADOS"."ESTADO" = 'P' )
USING		sqlca;
if sqlca.sqlcode=0 then
	open x1;
	do while sqlca.sqlcode=0
		fetch x1 into :ll_cod, :ll_cod_det;
		if not isnull(ll_cod) then
			ls_texto	= "tipo_promocion_codigo = "+string(ll_cod) +" and tipo_promocion_detalle_codigo_promocion = "+string(ll_cod_det)
			ll_fila		= dw_lista_beneficios.Find(ls_texto,1,ll_tot_reg)
			if ll_fila > 0 then
				dw_lista_beneficios.setitem(ll_fila,'estado_reg',0)
			end if
		end if
		Setnull(ll_cod)
	loop
	close x1;
end if
dw_lista_beneficios.accepttext()

end event

type sle_moneda from singlelineedit within w_beneficios_ingreso_bkp
integer x = 1842
integer y = 52
integer width = 114
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type dw_ingreso from datawindow within w_beneficios_ingreso_bkp
integer x = 46
integer y = 1160
integer width = 2738
integer height = 780
integer taborder = 20
string title = "none"
string dataobject = "dw_ingreso_beneficios_asociados"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_beneficios_seleccionados from datawindow within w_beneficios_ingreso_bkp
integer x = 3159
integer y = 272
integer width = 686
integer height = 776
string title = "none"
string dataobject = "dwe_paso_beneficios"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_pie from singlelineedit within w_beneficios_ingreso_bkp
integer x = 1970
integer y = 52
integer width = 338
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_pie from statictext within w_beneficios_ingreso_bkp
integer x = 1696
integer y = 60
integer width = 137
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pie:"
boolean focusrectangle = false
end type

type sle_numero from singlelineedit within w_beneficios_ingreso_bkp
integer x = 1083
integer y = 56
integer width = 402
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_base from singlelineedit within w_beneficios_ingreso_bkp
integer x = 233
integer y = 56
integer width = 133
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_serie from singlelineedit within w_beneficios_ingreso_bkp
integer x = 617
integer y = 56
integer width = 133
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_2 from statictext within w_beneficios_ingreso_bkp
integer x = 421
integer y = 60
integer width = 187
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_beneficios_ingreso_bkp
integer x = 46
integer y = 60
integer width = 187
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base:"
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_beneficios_ingreso_bkp
integer x = 41
integer y = 1980
integer width = 288
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string ls_estado,ls_estado_reg
long	ll_cod_benef,ll_cod_benef_d,ll_tot_reg,ll_indi,ll_corr,ll_regis,ll_new,ll_res,ll_fila
date	ld_fecha

SELECT sysdate    INTO :gdt_fec_sistema   FROM "TASA"   WHERE "TASA"."LOOK" = 1   ;
if dw_ingreso.retrieve(is_base,is_serie,il_numero) > 0 then
	UPDATE	"TIPO_PROMOCION_ASOCIADOS"  
	SET 		"ESTADO" = 'I'  
	WHERE 	( "TIPO_PROMOCION_ASOCIADOS"."BASE" = :is_base ) AND  
				( "TIPO_PROMOCION_ASOCIADOS"."SERIE" = :is_serie ) AND  
				( "TIPO_PROMOCION_ASOCIADOS"."NUMERO" = :il_numero )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
	dw_ingreso.retrieve(is_base,is_serie,il_numero)
end if
SELECT 	MAX("TIPO_PROMOCION_ASOCIADOS"."CORRELATIVO" )
INTO 		:ll_corr  
FROM 	"TIPO_PROMOCION_ASOCIADOS"  
USING 	sqlca;
if isnull(ll_corr) or ll_corr=0 then
	ll_corr			= 1
end if
ll_tot_reg					= dw_lista_beneficios.rowcount()
ld_fecha						= date(gdt_fec_sistema)
if ll_tot_reg > 0 then
	for ll_indi=1 to ll_tot_reg
		ll_regis					= dw_lista_beneficios.getitemnumber(ll_indi,"estado_reg")
		if ll_regis	= 0 then
			ll_cod_benef		= dw_lista_beneficios.getitemnumber(ll_indi,'tipo_promocion_codigo')
			ll_cod_benef_d		= dw_lista_beneficios.getitemnumber(ll_indi,'tipo_promocion_detalle_codigo_promocion')
			ll_fila					= dw_ingreso.Find("cod_beneficio = "+string(ll_cod_benef) +" and cod_benef_detalle = "+string(ll_cod_benef_d),1,ll_tot_reg)
			if ll_fila > 0 then
				dw_ingreso.setitem(ll_fila,'estado','P')
			else
				ll_corr				= ll_corr+1
				ll_new				= dw_ingreso.insertrow(0)
				dw_ingreso.setitem(ll_new,'correlativo',ll_corr)
				dw_ingreso.setitem(ll_new,'cod_beneficio',ll_cod_benef)
				dw_ingreso.setitem(ll_new,'cod_benef_detalle',ll_cod_benef_d)
				dw_ingreso.setitem(ll_new,'estado','P')
				dw_ingreso.setitem(ll_new,'fecha_creacion',gdt_fec_sistema)
				dw_ingreso.setitem(ll_new,'base',is_base)
				dw_ingreso.setitem(ll_new,'serie',is_serie)
				dw_ingreso.setitem(ll_new,'numero',il_numero)
				dw_ingreso.setitem(ll_new,'usuario',gs_user)
				dw_ingreso.accepttext()
			end if
		end if
	next
	ll_res					= messagebox("Grabar","Está seguro Grabar Promoción",Exclamation!,YesNo!,2)
	if ll_res=1 then
		if dw_ingreso.update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
		else
			rollback;
			messagebox("Error Grabar","Error Grabar Promociones SQL: "+sqlca.sqlerrtext)
		end if
	end if
	dw_ingreso.retrieve(is_base,is_serie,il_numero)
else
	messagebox('Advertencia','No Han Agregado Beneficios')
end if
end event

type cb_cerrar from commandbutton within w_beneficios_ingreso_bkp
integer x = 2450
integer y = 1980
integer width = 338
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_beneficios_ingreso)
end event

type dw_lista_beneficios from datawindow within w_beneficios_ingreso_bkp
integer x = 46
integer y = 284
integer width = 2725
integer height = 788
integer taborder = 10
string title = "none"
string dataobject = "dw_lista_detalle_promocion_seleccionar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

type gb_1 from groupbox within w_beneficios_ingreso_bkp
integer x = 32
integer y = 208
integer width = 2770
integer height = 896
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Lista de Beneficios a Agregar"
end type

type st_6 from statictext within w_beneficios_ingreso_bkp
integer x = 805
integer y = 60
integer width = 261
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Numero:"
boolean focusrectangle = false
end type

