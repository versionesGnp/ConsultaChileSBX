forward
global type w_envio_archivo_pac_bkp from window
end type
type dw_recupera_uni from datawindow within w_envio_archivo_pac_bkp
end type
type dw_recupera_pac from datawindow within w_envio_archivo_pac_bkp
end type
type tab_1 from tab within w_envio_archivo_pac_bkp
end type
type tabpage_1 from userobject within tab_1
end type
type cb_ord_envio from commandbutton within tabpage_1
end type
type cb_filtrar_envio from commandbutton within tabpage_1
end type
type cb_mantenedor from commandbutton within tabpage_1
end type
type cb_exportar_archivo from commandbutton within tabpage_1
end type
type cb_proceso from picturebutton within tabpage_1
end type
type p_2 from picture within tabpage_1
end type
type em_fec_fin from editmask within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type p_1 from picture within tabpage_1
end type
type em_fec_ini from editmask within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type dw_lista_envio_archivo_pac from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_ord_envio cb_ord_envio
cb_filtrar_envio cb_filtrar_envio
cb_mantenedor cb_mantenedor
cb_exportar_archivo cb_exportar_archivo
cb_proceso cb_proceso
p_2 p_2
em_fec_fin em_fec_fin
st_2 st_2
p_1 p_1
em_fec_ini em_fec_ini
st_4 st_4
dw_lista_envio_archivo_pac dw_lista_envio_archivo_pac
end type
type tabpage_2 from userobject within tab_1
end type
type cb_exp_rec from commandbutton within tabpage_2
end type
type cb_ord_rec from commandbutton within tabpage_2
end type
type cb_filtrar_rec from commandbutton within tabpage_2
end type
type cb_grabar from commandbutton within tabpage_2
end type
type cb_proceso_rec from picturebutton within tabpage_2
end type
type p_4 from picture within tabpage_2
end type
type em_fec_fin_rec from editmask within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type p_3 from picture within tabpage_2
end type
type em_fec_ini_rec from editmask within tabpage_2
end type
type st_5 from statictext within tabpage_2
end type
type dw_recupera_archivo from datawindow within tabpage_2
end type
type cb_recupera from commandbutton within tabpage_2
end type
type dw_cargar from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_exp_rec cb_exp_rec
cb_ord_rec cb_ord_rec
cb_filtrar_rec cb_filtrar_rec
cb_grabar cb_grabar
cb_proceso_rec cb_proceso_rec
p_4 p_4
em_fec_fin_rec em_fec_fin_rec
st_6 st_6
p_3 p_3
em_fec_ini_rec em_fec_ini_rec
st_5 st_5
dw_recupera_archivo dw_recupera_archivo
cb_recupera cb_recupera
dw_cargar dw_cargar
end type
type tabpage_4 from userobject within tab_1
end type
type cb_exportar_no_ap from commandbutton within tabpage_4
end type
type cb_filtrar_no_ap from commandbutton within tabpage_4
end type
type cb_ord_no_ap from commandbutton within tabpage_4
end type
type cb_proceso_no from picturebutton within tabpage_4
end type
type p_hasta from picture within tabpage_4
end type
type em_fec_fin_hasta from editmask within tabpage_4
end type
type st_hasta from statictext within tabpage_4
end type
type p_desde from picture within tabpage_4
end type
type em_fec_ini_no from editmask within tabpage_4
end type
type st_desde from statictext within tabpage_4
end type
type dw_no_aplicar from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
cb_exportar_no_ap cb_exportar_no_ap
cb_filtrar_no_ap cb_filtrar_no_ap
cb_ord_no_ap cb_ord_no_ap
cb_proceso_no cb_proceso_no
p_hasta p_hasta
em_fec_fin_hasta em_fec_fin_hasta
st_hasta st_hasta
p_desde p_desde
em_fec_ini_no em_fec_ini_no
st_desde st_desde
dw_no_aplicar dw_no_aplicar
end type
type tabpage_3 from userobject within tab_1
end type
type cb_exportar from commandbutton within tabpage_3
end type
type dw_errores from datawindow within tabpage_3
end type
type cb_ordenar from commandbutton within tabpage_3
end type
type cb_filtrar from commandbutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_exportar cb_exportar
dw_errores dw_errores
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
end type
type tabpage_5 from userobject within tab_1
end type
type cb_grabar_man from commandbutton within tabpage_5
end type
type cb_exp_uni from commandbutton within tabpage_5
end type
type cb_ord_uni from commandbutton within tabpage_5
end type
type cb_filtrar_uni from commandbutton within tabpage_5
end type
type cb_cargar_uni from commandbutton within tabpage_5
end type
type dw_lista_universo from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
cb_grabar_man cb_grabar_man
cb_exp_uni cb_exp_uni
cb_ord_uni cb_ord_uni
cb_filtrar_uni cb_filtrar_uni
cb_cargar_uni cb_cargar_uni
dw_lista_universo dw_lista_universo
end type
type tab_1 from tab within w_envio_archivo_pac_bkp
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_4 tabpage_4
tabpage_3 tabpage_3
tabpage_5 tabpage_5
end type
type dw_print_mant from datawindow within w_envio_archivo_pac_bkp
end type
type dw_print_cred from datawindow within w_envio_archivo_pac_bkp
end type
type cb_print from commandbutton within w_envio_archivo_pac_bkp
end type
type dw_pac_detalle from datawindow within w_envio_archivo_pac_bkp
end type
type dw_envio_archivo_pac_mant from datawindow within w_envio_archivo_pac_bkp
end type
type cb_cuenta_corriente from commandbutton within w_envio_archivo_pac_bkp
end type
type cb_limpiar from commandbutton within w_envio_archivo_pac_bkp
end type
type cb_cerrar from commandbutton within w_envio_archivo_pac_bkp
end type
type dw_envio_archivo_pac_cred from datawindow within w_envio_archivo_pac_bkp
end type
type gb_1 from groupbox within w_envio_archivo_pac_bkp
end type
end forward

global type w_envio_archivo_pac_bkp from window
integer width = 4050
integer height = 2112
boolean titlebar = true
string title = "Pago Automático de Cuenta  PAC"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_recupera_uni dw_recupera_uni
dw_recupera_pac dw_recupera_pac
tab_1 tab_1
dw_print_mant dw_print_mant
dw_print_cred dw_print_cred
cb_print cb_print
dw_pac_detalle dw_pac_detalle
dw_envio_archivo_pac_mant dw_envio_archivo_pac_mant
cb_cuenta_corriente cb_cuenta_corriente
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
dw_envio_archivo_pac_cred dw_envio_archivo_pac_cred
gb_1 gb_1
end type
global w_envio_archivo_pac_bkp w_envio_archivo_pac_bkp

type variables
Long		il_row,il_row_rec,il_row_no,il_row_uni
Date		idt_fecha_hoy
String	named
end variables

forward prototypes
public function string wf_moneda (string as_base, string as_serie, long al_numero)
end prototypes

public function string wf_moneda (string as_base, string as_serie, long al_numero);String	ls_moneda

CHOOSE CASE as_base
	CASE 'O'
		SELECT	"PAGO_OFERTA"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"CADENA",	"OFERTA_V", 	"PAGO_OFERTA"  
		WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
				 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
				 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
				 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'C'
		SELECT	"CONTRATO"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"CADENA",   "CONTRATO"  
		WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
				 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) )   ;

	CASE 'L'
		SELECT	"PAGO_LIBERADOR"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
		WHERE  ( "CADENA"."SERIE" = "ANEXO_LIBERADOR"."SERIE_M" ) and  
				 ( "CADENA"."NUMERO" = "ANEXO_LIBERADOR"."NRO_LIBERADOR" ) and  
				 ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
				 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
				 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'P'
		SELECT	"PAGARE"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"CADENA",	"PAGARE"  
		WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
				 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'A'
		SELECT	"PAGO_AUMENTO"."MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"ANEXO_AUMENTO",	"CADENA",			"PAGO_AUMENTO"  
		WHERE  ( "CADENA"."SERIE" = "ANEXO_AUMENTO"."SERIE_M" ) and  
				 ( "CADENA"."NUMERO" = "ANEXO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
				 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
				 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

	CASE 'R'
		SELECT	"REPACTA_MANTENCION"."TIPO_MONEDA"  
		INTO 		:ls_moneda  
		FROM 		"CADENA",	"REPACTA_MANTENCION"  
		WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
				 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
				 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
				 (("CADENA"."CODIGO" = :as_base ) AND  
				 ( "CADENA"."SERIE" = :as_serie ) AND  
				 ( "CADENA"."NUMERO" = :al_numero ) )   ;

END CHOOSE
Return ls_moneda
end function

on w_envio_archivo_pac_bkp.create
this.dw_recupera_uni=create dw_recupera_uni
this.dw_recupera_pac=create dw_recupera_pac
this.tab_1=create tab_1
this.dw_print_mant=create dw_print_mant
this.dw_print_cred=create dw_print_cred
this.cb_print=create cb_print
this.dw_pac_detalle=create dw_pac_detalle
this.dw_envio_archivo_pac_mant=create dw_envio_archivo_pac_mant
this.cb_cuenta_corriente=create cb_cuenta_corriente
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.dw_envio_archivo_pac_cred=create dw_envio_archivo_pac_cred
this.gb_1=create gb_1
this.Control[]={this.dw_recupera_uni,&
this.dw_recupera_pac,&
this.tab_1,&
this.dw_print_mant,&
this.dw_print_cred,&
this.cb_print,&
this.dw_pac_detalle,&
this.dw_envio_archivo_pac_mant,&
this.cb_cuenta_corriente,&
this.cb_limpiar,&
this.cb_cerrar,&
this.dw_envio_archivo_pac_cred,&
this.gb_1}
end on

on w_envio_archivo_pac_bkp.destroy
destroy(this.dw_recupera_uni)
destroy(this.dw_recupera_pac)
destroy(this.tab_1)
destroy(this.dw_print_mant)
destroy(this.dw_print_cred)
destroy(this.cb_print)
destroy(this.dw_pac_detalle)
destroy(this.dw_envio_archivo_pac_mant)
destroy(this.cb_cuenta_corriente)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.dw_envio_archivo_pac_cred)
destroy(this.gb_1)
end on

event open;date 		ld_fecha,ld_fecha_proc,ld_fecha_proc_fin
datetime	ldt_fec_max_envio

gf_centrar(w_envio_archivo_pac)
idt_fecha_hoy			= date(gdt_fec_sistema)
tab_1.tabpage_1.dw_lista_envio_archivo_pac.settransobject(sqlca)
tab_1.tabpage_2.dw_recupera_archivo.settransobject(sqlca)
tab_1.tabpage_2.dw_cargar.settransobject(sqlca)

tab_1.tabpage_5.dw_lista_universo.settransobject(sqlca)
tab_1.tabpage_5.dw_lista_universo.retrieve()
dw_recupera_uni.settransobject(sqlca)

dw_envio_archivo_pac_cred.settransobject(sqlca)
dw_envio_archivo_pac_mant.settransobject(sqlca)
dw_print_cred.settransobject(sqlca)
dw_print_mant.settransobject(sqlca)
dw_pac_detalle.settransobject(sqlca)
dw_recupera_pac.settransobject(sqlca)
tab_1.tabpage_3.dw_errores.settransobject(sqlca)
tab_1.tabpage_3.dw_errores.retrieve()
tab_1.tabpage_4.dw_no_aplicar.settransobject(sqlca)
SELECT	MAX("PAC_DETALLE"."FECHA_ENVIO")  
INTO 		:ldt_fec_max_envio  
FROM 		"PAC_DETALLE"  ;
if not isnull(ldt_fec_max_envio) then
	ld_fecha										= date(ldt_fec_max_envio)
	ld_fecha_proc								= RelativeDate(ld_fecha, 5)
	tab_1.tabpage_1.em_fec_ini.text 		= string(ld_fecha_proc,'dd/mm/yyyy')
	tab_1.tabpage_2.em_fec_ini_rec.text	= string(ld_fecha_proc,'dd/mm/yyyy')
	tab_1.tabpage_4.em_fec_ini_no.text	= string(ld_fecha_proc,'dd/mm/yyyy')
	ld_fecha_proc_fin							= RelativeDate(ld_fecha_proc, 7)
	tab_1.tabpage_1.em_fec_fin.text		= string(ld_fecha_proc_fin,"dd/mm/yyyy")
	tab_1.tabpage_2.em_fec_fin_rec.text	= string(ld_fecha_proc_fin,"dd/mm/yyyy")
	tab_1.tabpage_4.em_fec_fin_hasta.text	= string(ld_fecha_proc_fin,"dd/mm/yyyy")
else
	tab_1.tabpage_1.em_fec_ini.text 		= string(gdt_fec_sistema,'dd/mm/yyyy')
	tab_1.tabpage_2.em_fec_ini_rec.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
	tab_1.tabpage_4.em_fec_ini_no.text	= string(gdt_fec_sistema,'dd/mm/yyyy')
	ld_fecha										= date(gdt_fec_sistema)
	ld_fecha_proc								= RelativeDate(ld_fecha, 7)
	tab_1.tabpage_1.em_fec_fin.text		= string(ld_fecha_proc,"dd/mm/yyyy")
	tab_1.tabpage_2.em_fec_fin_rec.text	= string(ld_fecha_proc,"dd/mm/yyyy")
	tab_1.tabpage_4.em_fec_fin_hasta.text	= string(ld_fecha_proc,"dd/mm/yyyy")
end if
tab_1.tabpage_5.cb_grabar_man.enabled	= false
tab_1.tabpage_2.cb_grabar.enabled		= false
tab_1.tabpage_1.em_fec_ini.setfocus()
end event

type dw_recupera_uni from datawindow within w_envio_archivo_pac_bkp
boolean visible = false
integer x = 1019
integer y = 1916
integer width = 613
integer height = 428
string dataobject = "dwe_recuperar_universo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_recupera_pac from datawindow within w_envio_archivo_pac_bkp
boolean visible = false
integer x = 1810
integer y = 1956
integer width = 594
integer height = 268
integer taborder = 10
string title = "none"
string dataobject = "dwe_recuperar_pac"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_envio_archivo_pac_bkp
event create ( )
event destroy ( )
integer x = 37
integer y = 36
integer width = 3931
integer height = 1796
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_4 tabpage_4
tabpage_3 tabpage_3
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_4=create tabpage_4
this.tabpage_3=create tabpage_3
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_4,&
this.tabpage_3,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_4)
destroy(this.tabpage_3)
destroy(this.tabpage_5)
end on

event selectionchanged;CHOOSE CASE tab_1.SelectedTab
	CASE 1
		tab_1.tabpage_1.em_fec_ini.setfocus()
	CASE 2
		tab_1.tabpage_2.em_fec_ini_rec.setfocus()
END CHOOSE

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 120
integer width = 3895
integer height = 1660
long backcolor = 67108864
string text = " Envio Archivo"
long tabtextcolor = 33554432
string picturename = "Regenerate!"
long picturemaskcolor = 536870912
cb_ord_envio cb_ord_envio
cb_filtrar_envio cb_filtrar_envio
cb_mantenedor cb_mantenedor
cb_exportar_archivo cb_exportar_archivo
cb_proceso cb_proceso
p_2 p_2
em_fec_fin em_fec_fin
st_2 st_2
p_1 p_1
em_fec_ini em_fec_ini
st_4 st_4
dw_lista_envio_archivo_pac dw_lista_envio_archivo_pac
end type

on tabpage_1.create
this.cb_ord_envio=create cb_ord_envio
this.cb_filtrar_envio=create cb_filtrar_envio
this.cb_mantenedor=create cb_mantenedor
this.cb_exportar_archivo=create cb_exportar_archivo
this.cb_proceso=create cb_proceso
this.p_2=create p_2
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.p_1=create p_1
this.em_fec_ini=create em_fec_ini
this.st_4=create st_4
this.dw_lista_envio_archivo_pac=create dw_lista_envio_archivo_pac
this.Control[]={this.cb_ord_envio,&
this.cb_filtrar_envio,&
this.cb_mantenedor,&
this.cb_exportar_archivo,&
this.cb_proceso,&
this.p_2,&
this.em_fec_fin,&
this.st_2,&
this.p_1,&
this.em_fec_ini,&
this.st_4,&
this.dw_lista_envio_archivo_pac}
end on

on tabpage_1.destroy
destroy(this.cb_ord_envio)
destroy(this.cb_filtrar_envio)
destroy(this.cb_mantenedor)
destroy(this.cb_exportar_archivo)
destroy(this.cb_proceso)
destroy(this.p_2)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.em_fec_ini)
destroy(this.st_4)
destroy(this.dw_lista_envio_archivo_pac)
end on

type cb_ord_envio from commandbutton within tabpage_1
integer x = 2094
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_lista_envio_archivo_pac.setsort(nulo)
dw_lista_envio_archivo_pac.sort()
end event

type cb_filtrar_envio from commandbutton within tabpage_1
integer x = 1847
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 50
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
dw_lista_envio_archivo_pac.SETfilter(NULO)
dw_lista_envio_archivo_pac.filter()
end event

type cb_mantenedor from commandbutton within tabpage_1
integer x = 3090
integer y = 1536
integer width = 773
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Mantenedor Contratos Exportado"
end type

event clicked;if isvalid(w_mantenedor_pac) then close(w_mantenedor_pac)
open(w_mantenedor_pac)
end event

type cb_exportar_archivo from commandbutton within tabpage_1
integer x = 2514
integer y = 1536
integer width = 471
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar Archivo"
end type

event clicked;string	ls_fila,ls_string,ls_dv,ls_ap_mat,ls_ap_pat,ls_nombre,ls_direccion_p,ls_fecha_cobro_pac,ls_rut,&
			ls_fax,ls_cod_comuna,ls_base,ls_serie,ls_codigo_banco,ls_tipo_cuenta,ls_linea,ls_numero,ls_descuento, &
			ls_cupon,ls_numero_cuenta, ls_pasa ='S',ls_cuenta_final,ls_monto_credito,ls_monto_mantencion,&
			ls_fecha_proc,ls_fecha_cred,ls_fecha_mant,ls_identificador,ls_forma_cargo,ls_of_destino,&
			ls_estado_cob,ls_ap_pat_otro,ls_ap_mat_otro,ls_nombre_otro,ls_moneda
long 		ll_new,ll_rut,ll_indi,ll_tot_reg,ll_largo,ll_cupon,ll_numero,ll_codigo_banco,ll_pos,ll_monto_cred_peso,&
			ll_new_reg,ll_new_cred,ll_new_mant
Datetime	ldt_fecha_cobro_pac,ldt_venc_cred,ldt_venc_mant, ldt_fecha_ini, ldt_fecha_fin
Double	ldb_uf_dia,ldb_val_uf,ll_monto_cred,ll_monto_mant
Datawindow	dw_paso

dw_envio_archivo_pac_cred.reset()
dw_envio_archivo_pac_mant.reset()
dw_print_cred.reset()
dw_print_mant.reset()
dw_pac_detalle.reset()
ldt_fecha_ini	= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fecha_fin	= datetime(date(em_fec_fin.text),time('00:00:00'))
ll_tot_reg 		= dw_lista_envio_archivo_pac.rowcount()
if ll_tot_reg>0 then
	ls_fecha_proc				= mid(em_fec_ini.text,4,7)
	for ll_indi=1 to ll_tot_reg
		ldt_fecha_cobro_pac	= dw_lista_envio_archivo_pac.GetItemDatetime(ll_indi,'sol_pac_fecha_cobro_pac')
		ll_rut					= dw_lista_envio_archivo_pac.GetItemNumber(ll_indi,'sol_pac_rut_titular')
		ls_dv						= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_dv')
		ls_ap_pat				= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_ap_paterno')
		ls_ap_mat				= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_ap_materno')
		ls_nombre				= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_nombre')
		ls_ap_pat_otro			= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_ap_paterno')
		ls_ap_mat_otro			= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_ap_materno')
		ls_nombre_otro			= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_nombre')
		ls_direccion_p			= trim(dw_lista_envio_archivo_pac.GetItemString(ll_indi,'c_direccion_p'))
		ls_fax					= '0000000000'
		ls_cod_comuna			= '000'
		ls_descuento			= '0000000000000'
		ls_of_destino			= '000'
		ls_base					= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_base')
		ls_serie					= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_serie')
		ll_numero				= dw_lista_envio_archivo_pac.GetItemNumber(ll_indi,'sol_pac_numero')
		ls_numero_cuenta		= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_numero_cuenta')
		ll_codigo_banco		= dw_lista_envio_archivo_pac.GetItemnumber(ll_indi,'sol_pac_cod_banco')
		ls_tipo_cuenta			= dw_lista_envio_archivo_pac.GetItemString(ll_indi,'sol_pac_tipo_cuenta') //C o V
		ll_monto_cred			= dw_lista_envio_archivo_pac.GetItemnumber(ll_indi,'sol_pac_monto_cuota_cred')
		ll_monto_mant			= dw_lista_envio_archivo_pac.GetItemnumber(ll_indi,'sol_pac_monto_cuota_mant')
		ldt_venc_cred			= dw_lista_envio_archivo_pac.GetItemdatetime(ll_indi,'cadena_mora_fecha_venc_cred')
		ldt_venc_mant			= dw_lista_envio_archivo_pac.GetItemdatetime(ll_indi,'cadena_mora_fecha_venc_mant')
		ls_fecha_cred			= mid(string(ldt_venc_cred),4,7)
		ls_fecha_mant			= mid(string(ldt_venc_mant),4,7)
		ls_moneda				= wf_moneda(ls_base,ls_serie,ll_numero)
		if ll_monto_cred>0.001 and ldt_venc_cred >= ldt_fecha_ini and ldt_venc_cred <= ldt_fecha_fin then //valida cuota credito
			SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"  
			INTO		:ll_cupon
			FROM 		"CUPONERAS_DETALLE"  
			WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
					 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
					 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
					 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) AND  
					 ( "CUPONERAS_DETALLE"."FECHA_VENC" = ( SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC") 
																		 FROM 	"CUPONERAS_DETALLE" 
																		 WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND 
																				 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND 
																				 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND 
																				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND 
																				 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' ) ) )   
			USING		sqlca;
			if ls_moneda = '2' then
				SELECT	"TAB_UF"."VALOR_UF"  
				INTO 		:ldb_val_uf  
				FROM 		"TAB_UF"  
				WHERE 	"TAB_UF"."FECHA_UF" = :ldt_venc_cred   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_monto_cred	= round(ll_monto_cred * ldb_val_uf,0)
				else
					SELECT	"TAB_UF"."VALOR_UF"  
					INTO 		:ldb_val_uf  
					FROM 		"TAB_UF"  
					WHERE 	"TAB_UF"."FECHA_UF" = ( SELECT MAX("TAB_UF"."FECHA_UF") 
																FROM "TAB_UF"  )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_monto_cred	= round(ll_monto_cred * ldb_val_uf,0)
					end if
				end if
		
			end if
			ls_identificador		= string(ll_numero)
			ll_largo					= Len(ls_identificador)
			if ll_largo > 25 then
				ls_identificador = Mid(ls_identificador,1,25)
			else 
				ls_identificador = ls_identificador + Fill(' ',25 - ll_largo)
			end if
			ls_fecha_cobro_pac   = string(ldt_venc_cred,'ddmmyyyy')
			ls_rut					= string(ll_rut,'00000000')
			ls_numero				= string(ll_numero,'000000')
			ls_cupon					= string(ll_cupon)
			ls_monto_credito		= string(ll_monto_cred,'0000000000000')
			ls_pasa					= 'S'
			DO WHILE ls_pasa='S'
				ll_pos				= Pos(ls_numero_cuenta,'-')
				ls_cuenta_final	= mid(ls_numero_cuenta,1,ll_pos - 1)
				if ll_pos>0 then ll_pos	= ll_pos + 1
				ls_cuenta_final	= ls_cuenta_final + mid(ls_numero_cuenta,(ll_pos))
				if ll_pos = 0 or isnull(ll_pos) then
					ls_pasa  = 'N'
				end if
				ls_numero_cuenta	= ls_cuenta_final
			LOOP
			
			ls_pasa					= 'S'
			DO WHILE ls_pasa='S'
				ll_pos				= Pos(ls_numero_cuenta,'.')
				ls_cuenta_final	= mid(ls_numero_cuenta,1,ll_pos - 1)
				if ll_pos>0 then ll_pos	= ll_pos + 1
				ls_cuenta_final	= ls_cuenta_final + mid(ls_numero_cuenta,(ll_pos))
				if ll_pos = 0 or isnull(ll_pos) then
					ls_pasa  = 'N'
				end if
				ls_numero_cuenta	= ls_cuenta_final
			LOOP

			ll_largo					= Len(ls_numero_cuenta)
			if ll_largo > 15 then
				ls_numero_cuenta = Mid(ls_numero_cuenta,1,15)
			else 
				ls_numero_cuenta = Fill('0',15 - ll_largo)+ls_numero_cuenta
			end if
			
			if ll_codigo_banco = 16 then
				ls_forma_cargo		= 'CCT'
			else
				ls_forma_cargo		= 'OTC'
			end if
			ls_codigo_banco		= string(ll_codigo_banco)
			ll_largo					= Len(ls_codigo_banco)
			if ll_largo > 3 then
				ls_codigo_banco = Mid(ls_codigo_banco,1,3)
			else
				ls_codigo_banco = Fill('0',3 - ll_largo)+ls_codigo_banco
			end if
			
			ll_largo					= Len(ls_ap_pat)
			if ll_largo > 15 then
				ls_ap_pat = Mid(ls_ap_pat,1,15)
			else 
				ls_ap_pat = ls_ap_pat + Fill(' ',15 - ll_largo)
			end if
			
			ll_largo					= Len(ls_ap_mat)
			if ll_largo > 15 then
				ls_ap_mat = Mid(ls_ap_mat,1,15)
			else 
				ls_ap_mat = ls_ap_mat + Fill(' ',15 - ll_largo)
			end if
			
			ll_largo					= Len(ls_nombre)
			if ll_largo > 15 then
				ls_nombre = Mid(ls_nombre,1,15)
			else 
				ls_nombre = ls_nombre + Fill(' ',15 - ll_largo)
			end if
			
			ll_largo					= Len(ls_direccion_p)
			if ll_largo > 35 then
				ls_direccion_p = Mid(ls_direccion_p,1,35)
			else 
				ls_direccion_p = ls_direccion_p + Fill(' ',35 - ll_largo)
			end if
			
			ll_largo					= Len(ls_cupon)
			if ll_largo > 25 then
				ls_cupon = Mid(ls_cupon,1,25)
			else 
				ls_cupon = ls_cupon + Fill(' ',25 - ll_largo)
			end if

			ls_linea = ls_fecha_cobro_pac+ls_rut+ls_dv+ls_ap_pat+ls_ap_mat+ls_nombre+ls_direccion_p+ls_fax+ls_cod_comuna+ls_identificador+ls_cupon+ls_monto_credito+ls_descuento+ls_monto_credito+ls_forma_cargo+ls_numero_cuenta+ls_codigo_banco+ls_of_destino
			ll_new   = dw_envio_archivo_pac_cred.insertrow(0)
			dw_envio_archivo_pac_cred.setitem(ll_new,'linea',ls_linea)
			ll_new_reg	= dw_pac_detalle.insertrow(0)
			dw_pac_detalle.setitem(ll_new_reg,'base',ls_base)
			dw_pac_detalle.setitem(ll_new_reg,'serie',ls_serie)
			dw_pac_detalle.setitem(ll_new_reg,'numero',ll_numero)
			dw_pac_detalle.setitem(ll_new_reg,'fecha_envio',idt_fecha_hoy)
			dw_pac_detalle.setitem(ll_new_reg,'fecha_pago',ldt_venc_cred)
			dw_pac_detalle.setitem(ll_new_reg,'monto_pago',ll_monto_cred)
			dw_pac_detalle.setitem(ll_new_reg,'cupon',ll_cupon)
			dw_pac_detalle.setitem(ll_new_reg,'usuario',gs_user)
			dw_pac_detalle.setitem(ll_new_reg,'tipo_mov','E')
			dw_pac_detalle.accepttext()
			
			ll_new_cred		= dw_print_cred.insertrow(0)
			dw_print_cred.setitem(ll_new_cred,'fecha_envio',idt_fecha_hoy)
			dw_print_cred.setitem(ll_new_cred,'nombre',ls_nombre_otro)
			dw_print_cred.setitem(ll_new_cred,'ap_paterno',ls_ap_pat_otro)
			dw_print_cred.setitem(ll_new_cred,'ap_materno',ls_ap_mat_otro)
			dw_print_cred.setitem(ll_new_cred,'fecha_vcto_cred',ldt_venc_cred)
			dw_print_cred.setitem(ll_new_cred,'monto_cobro',ll_monto_cred)
			dw_print_cred.setitem(ll_new_cred,'cod_banco',ll_codigo_banco)
			dw_print_cred.setitem(ll_new_cred,'tipo_cuenta',ls_tipo_cuenta)
			dw_print_cred.setitem(ll_new_cred,'nro_cuenta',ls_numero_cuenta)
			dw_print_cred.setitem(ll_new_cred,'base',ls_base)
			dw_print_cred.setitem(ll_new_cred,'serie',ls_serie)
			dw_print_cred.setitem(ll_new_cred,'numero',ll_numero)
			dw_print_cred.setitem(ll_new_cred,'cupon',ll_cupon)
			dw_print_cred.accepttext()
		end if
		
		if ll_monto_mant>0.001 and ldt_venc_mant >= ldt_fecha_ini and ldt_venc_mant <= ldt_fecha_fin then //valida cuota mant
			SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"  
			INTO		:ll_cupon
			FROM 		"CUPONERAS_DETALLE"  
			WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
					 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
					 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
					 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND  
					 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) AND  
					 ( "CUPONERAS_DETALLE"."FECHA_VENC" = ( SELECT	MIN("CUPONERAS_DETALLE"."FECHA_VENC") 
																		 FROM 	"CUPONERAS_DETALLE" 
																		 WHERE ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND 
																				 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND 
																				 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND 
																				 ( "CUPONERAS_DETALLE"."ESTADO_PAGO_CUPON" = 'V' ) AND 
																				 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' ) ) )   
			USING		sqlca;
			if ls_moneda = '2' then
				SELECT	"TAB_UF"."VALOR_UF"  
				INTO 		:ldb_val_uf  
				FROM 		"TAB_UF"  
				WHERE 	"TAB_UF"."FECHA_UF" = :ldt_venc_mant   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ll_monto_mant	= round(ll_monto_mant * ldb_val_uf,0)
				else
					SELECT	"TAB_UF"."VALOR_UF"  
					INTO 		:ldb_val_uf  
					FROM 		"TAB_UF"  
					WHERE 	"TAB_UF"."FECHA_UF" = ( SELECT MAX("TAB_UF"."FECHA_UF") 
																FROM "TAB_UF"  )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_monto_mant	= round(ll_monto_mant * ldb_val_uf,0)
					end if
				end if
		
			end if
			ls_identificador		= string(ll_numero)
			ll_largo					= Len(ls_identificador)
			if ll_largo > 25 then
				ls_identificador = Mid(ls_identificador,1,25)
			else 
				ls_identificador = ls_identificador + Fill(' ',25 - ll_largo)
			end if
			ls_fecha_cobro_pac   = string(ldt_venc_mant,'ddmmyyyy')
			ls_rut					= string(ll_rut,'00000000')
			ls_numero				= string(ll_numero,'000000')
			ls_cupon					= string(ll_cupon)
			ls_monto_mantencion	= string(ll_monto_mant,'0000000000000')
			ls_pasa					= 'S'
			DO WHILE ls_pasa='S'
				ll_pos				= Pos(ls_numero_cuenta,'-')
				ls_cuenta_final	= mid(ls_numero_cuenta,1,ll_pos - 1)
				if ll_pos>0 then ll_pos	= ll_pos + 1
				ls_cuenta_final	= ls_cuenta_final + mid(ls_numero_cuenta,(ll_pos))
				if ll_pos = 0 or isnull(ll_pos) then
					ls_pasa  = 'N'
				end if
				ls_numero_cuenta	= ls_cuenta_final
			LOOP
			
			
			ls_pasa					= 'S'
			DO WHILE ls_pasa='S'
				ll_pos				= Pos(ls_numero_cuenta,'.')
				ls_cuenta_final	= mid(ls_numero_cuenta,1,ll_pos - 1)
				if ll_pos>0 then ll_pos	= ll_pos + 1
				ls_cuenta_final	= ls_cuenta_final + mid(ls_numero_cuenta,(ll_pos))
				if ll_pos = 0 or isnull(ll_pos) then
					ls_pasa  = 'N'
				end if
				ls_numero_cuenta	= ls_cuenta_final
			LOOP

			ll_largo					= Len(ls_numero_cuenta)
			if ll_largo > 15 then
				ls_numero_cuenta = Mid(ls_numero_cuenta,1,15)
			else 
				ls_numero_cuenta = Fill('0',15 - ll_largo)+ls_numero_cuenta
			end if
			
			if ll_codigo_banco = 16 then
				ls_forma_cargo		= 'CCT'
			else
				ls_forma_cargo		= 'OTC'
			end if
			ls_codigo_banco		= string(ll_codigo_banco)
			ll_largo					= Len(ls_codigo_banco)
			if ll_largo > 3 then
				ls_codigo_banco = Mid(ls_codigo_banco,1,3)
			else 
				ls_codigo_banco = Fill('0',3 - ll_largo)+ls_codigo_banco
			end if
			
			ll_largo					= Len(ls_ap_pat)
			if ll_largo > 15 then
				ls_ap_pat = Mid(ls_ap_pat,1,15)
			else 
				ls_ap_pat = ls_ap_pat + Fill(' ',15 - ll_largo)
			end if
			
			ll_largo					= Len(ls_ap_mat)
			if ll_largo > 15 then
				ls_ap_mat = Mid(ls_ap_mat,1,15)
			else 
				ls_ap_mat = ls_ap_mat + Fill(' ',15 - ll_largo)
			end if
			
			ll_largo					= Len(ls_nombre)
			if ll_largo > 15 then
				ls_nombre = Mid(ls_nombre,1,15)
			else 
				ls_nombre = ls_nombre + Fill(' ',15 - ll_largo)
			end if
			
			ll_largo					= Len(ls_direccion_p)
			if ll_largo > 35 then
				ls_direccion_p = Mid(ls_direccion_p,1,35)
			else 
				ls_direccion_p = ls_direccion_p + Fill(' ',35 - ll_largo)
			end if
			
			ll_largo					= Len(ls_cupon)
			if ll_largo > 25 then
				ls_cupon = Mid(ls_cupon,1,25)
			else 
				ls_cupon = ls_cupon + Fill(' ',25 - ll_largo)
			end if

			ls_linea = ls_fecha_cobro_pac+ls_rut+ls_dv+ls_ap_pat+ls_ap_mat+ls_nombre+ls_direccion_p+ls_fax+ls_cod_comuna+ls_identificador+ls_cupon+ls_monto_mantencion+ls_descuento+ls_monto_mantencion+ls_forma_cargo+ls_numero_cuenta+ls_codigo_banco+ls_of_destino
			ll_new   = dw_envio_archivo_pac_mant.insertrow(0)
			dw_envio_archivo_pac_mant.setitem(ll_new,'linea',ls_linea)
			ll_new_reg	= dw_pac_detalle.insertrow(0)
			dw_pac_detalle.setitem(ll_new_reg,'base',ls_base)
			dw_pac_detalle.setitem(ll_new_reg,'serie',ls_serie)
			dw_pac_detalle.setitem(ll_new_reg,'numero',ll_numero)
			dw_pac_detalle.setitem(ll_new_reg,'fecha_envio',idt_fecha_hoy)
			dw_pac_detalle.setitem(ll_new_reg,'fecha_pago',ldt_venc_mant)
			dw_pac_detalle.setitem(ll_new_reg,'monto_pago',ll_monto_mant)
			dw_pac_detalle.setitem(ll_new_reg,'cupon',ll_cupon)
			dw_pac_detalle.setitem(ll_new_reg,'usuario',gs_user)
			dw_pac_detalle.accepttext()
			
			ll_new_mant		= dw_print_mant.insertrow(0)
			dw_print_mant.setitem(ll_new_mant,'fecha_envio',idt_fecha_hoy)
			dw_print_mant.setitem(ll_new_mant,'nombre',ls_nombre_otro)
			dw_print_mant.setitem(ll_new_mant,'ap_paterno',ls_ap_pat_otro)
			dw_print_mant.setitem(ll_new_mant,'ap_materno',ls_ap_mat_otro)
			dw_print_mant.setitem(ll_new_mant,'fecha_vcto_cred',ldt_venc_mant)
			dw_print_mant.setitem(ll_new_mant,'monto_cobro',ll_monto_mant)
			dw_print_mant.setitem(ll_new_mant,'cod_banco',ll_codigo_banco)
			dw_print_mant.setitem(ll_new_mant,'tipo_cuenta',ls_tipo_cuenta)
			dw_print_mant.setitem(ll_new_mant,'nro_cuenta',ls_numero_cuenta)
			dw_print_mant.setitem(ll_new_mant,'base',ls_base)
			dw_print_mant.setitem(ll_new_mant,'serie',ls_serie)
			dw_print_mant.setitem(ll_new_mant,'numero',ll_numero)
			dw_print_mant.setitem(ll_new_mant,'cupon',ll_cupon)
			dw_pac_detalle.setitem(ll_new_reg,'tipo_mov','F')
			dw_print_mant.accepttext()
			
		end if
	next	
	if dw_envio_archivo_pac_cred.rowcount()>0 or dw_envio_archivo_pac_mant.rowcount()>0 then
		if dw_print_cred.rowcount() > 0 then
			dw_print_cred.object.t_titulo.text	= 'Detalle Envio PAC  COBRO CREDITO  Fecha del '+string(em_fec_ini.text)+' al '+string(em_fec_fin.text)
		end if
		if dw_print_mant.rowcount() > 0 then
			dw_print_cred.object.t_titulo.text	= 'Detalle Envio PAC  COBRO MANTENCION  Fecha del '+string(em_fec_ini.text)+' al '+string(em_fec_fin.text)
		end if
		Open(w_exportar_archivo_pac)
	end if
end if
end event

type cb_proceso from picturebutton within tabpage_1
integer x = 1477
integer y = 1488
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string 	ls_string,ls_filtro,ls_base,ls_serie,ls_est_reg,ls_estado_mandato
Date		ld_fecha,ld_fecha_proc
Datetime	ldt_fec_vcto_c,ldt_fec_vcto_m,ld_fec_ini,ld_fec_fin
Long		ll_tot_reg,ll_indi,ll_numero,ll_cupon_c,ll_count,ll_cupon_m,ll_tot_reg_antes,ll_tot_reg_despues,&
			ll_rut
Double	ldb_cta_cred,ldb_cta_mant

ld_fec_ini					= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin.text),time('00:00:00'))
dw_lista_envio_archivo_pac.reset()
ls_filtro 					= ""
dw_lista_envio_archivo_pac.SetFilter(ls_filtro)
dw_lista_envio_archivo_pac.Filter( )
dw_lista_envio_archivo_pac.accepttext()

if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin.text		= string(ld_fecha_proc,'dd/mm/yyyy')
else
	ll_tot_reg				= dw_lista_envio_archivo_pac.retrieve(ld_fec_ini,ld_fec_fin)
	if ll_tot_reg>0 then
		dw_envio_archivo_pac_cred.reset()
		dw_envio_archivo_pac_mant.reset()
		dw_print_cred.reset()
		dw_print_mant.reset()
		dw_pac_detalle.reset()
		for ll_indi=1 to ll_tot_reg
			ls_base			= dw_lista_envio_archivo_pac.getitemstring(ll_indi,'sol_pac_base')
			ls_serie			= dw_lista_envio_archivo_pac.getitemstring(ll_indi,'sol_pac_serie')
			ll_numero		= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_numero')
			ldt_fec_vcto_c	= dw_lista_envio_archivo_pac.getitemdatetime(ll_indi,'cadena_mora_fecha_venc_cred')
			ldt_fec_vcto_m	= dw_lista_envio_archivo_pac.getitemdatetime(ll_indi,'cadena_mora_fecha_venc_mant')
			ldb_cta_cred	= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_monto_cuota_cred')
			ldb_cta_mant	= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_monto_cuota_mant')
			ll_rut			= dw_lista_envio_archivo_pac.getitemnumber(ll_indi,'sol_pac_rut_titular')
			dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','S')
//			ls_est_reg		= ''
			if ldb_cta_cred > 0 and ldt_fec_vcto_c >= ld_fec_ini and ldt_fec_vcto_c <= ld_fec_fin then
				SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"  
				INTO 		:ll_cupon_c  
				FROM 		"CUPONERAS_DETALLE"  
				WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
						 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
						 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
						 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fec_vcto_c ) AND  
						 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'E' )   
				USING		sqlca;
				if ll_cupon_c > 0 then
					SELECT	COUNT("PAC_DETALLE"."BASE")  	
					INTO 		:ll_count  
					FROM 		"PAC_DETALLE"  
					WHERE  ( "PAC_DETALLE"."BASE" = :ls_base ) AND  
							 ( "PAC_DETALLE"."SERIE" = :ls_serie ) AND  
							 ( "PAC_DETALLE"."NUMERO" = :ll_numero ) AND  
							 ( "PAC_DETALLE"."FECHA_PAGO" = :ldt_fec_vcto_c ) AND  
							 ( "PAC_DETALLE"."CUPON" = :ll_cupon_c )   
					USING		sqlca;
					if ll_count > 0 then
						ls_est_reg	= 'N'
					else
						ls_est_reg	= 'S'
					end if
					dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado',ls_est_reg)
					if ls_est_reg = 'S' then
						SELECT	"SOL_PAC_UNIVERSO_MANDATOS"."ESTADO"  
						INTO 		:ls_estado_mandato  
						FROM 		"SOL_PAC_UNIVERSO_MANDATOS"  
						WHERE  ( "SOL_PAC_UNIVERSO_MANDATOS"."RUT" = :ll_rut ) AND  
								 ( "SOL_PAC_UNIVERSO_MANDATOS"."IDENTIFICADOR" = :ll_numero )   
						USING		sqlca;
						if ls_estado_mandato = '015' then
							dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','S')
							ls_est_reg	= 'S'
						else
							dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','M')
							ls_est_reg	= 'N'
						end if
					end if
				end if
//			else
//				ls_est_reg		= 'N'
//				dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado',ls_est_reg)
			end if
			dw_lista_envio_archivo_pac.accepttext()
			if ldb_cta_mant > 0 and ls_est_reg = 'N' and ldt_fec_vcto_m >= ld_fec_ini and ldt_fec_vcto_m <= ld_fec_fin then
				SELECT	"CUPONERAS_DETALLE"."NRO_CUPON"  
				INTO 		:ll_cupon_m  
				FROM 		"CUPONERAS_DETALLE"  
				WHERE  ( "CUPONERAS_DETALLE"."BASE" = :ls_base ) AND  
						 ( "CUPONERAS_DETALLE"."SERIE" = :ls_serie ) AND  
						 ( "CUPONERAS_DETALLE"."NUMERO" = :ll_numero ) AND  
						 ( "CUPONERAS_DETALLE"."FECHA_VENC" = :ldt_fec_vcto_m ) AND  
						 ( "CUPONERAS_DETALLE"."TIPO_MOV" = 'F' )   
				USING		sqlca;
				if ll_cupon_m > 0 then
					SELECT	COUNT("PAC_DETALLE"."BASE")  	
					INTO 		:ll_count  
					FROM 		"PAC_DETALLE"  
					WHERE  ( "PAC_DETALLE"."BASE" = :ls_base ) AND  
							 ( "PAC_DETALLE"."SERIE" = :ls_serie ) AND  
							 ( "PAC_DETALLE"."NUMERO" = :ll_numero ) AND  
							 ( "PAC_DETALLE"."FECHA_PAGO" = :ldt_fec_vcto_m ) AND  
							 ( "PAC_DETALLE"."CUPON" = :ll_cupon_m )   
					USING		sqlca;
					if ll_count > 0 then
						ls_est_reg	= 'N'
					else
						ls_est_reg	= 'S'
					end if
					dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado',ls_est_reg)
					if ls_est_reg = 'S' then
						SELECT	"SOL_PAC_UNIVERSO_MANDATOS"."ESTADO"  
						INTO 		:ls_estado_mandato  
						FROM 		"SOL_PAC_UNIVERSO_MANDATOS"  
						WHERE  ( "SOL_PAC_UNIVERSO_MANDATOS"."RUT" = :ll_rut ) AND  
								 ( "SOL_PAC_UNIVERSO_MANDATOS"."IDENTIFICADOR" = :ll_numero )   
						USING		sqlca;
						if ls_estado_mandato = '015' then
							dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','S')
							ls_est_reg	= 'S'
						else
							dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado','M')
							ls_est_reg	= 'N'
						end if
					end if
				end if
//			else
//				ls_est_reg		= 'N'
//				dw_lista_envio_archivo_pac.setitem(ll_indi,'c_estado',ls_est_reg)
			end if
		next
		dw_lista_envio_archivo_pac.accepttext()
		ll_tot_reg_antes		= dw_lista_envio_archivo_pac.rowcount()
		
		ls_filtro = "c_estado = 'S'"
		dw_lista_envio_archivo_pac.SetFilter(ls_filtro)
		dw_lista_envio_archivo_pac.Filter( )
		dw_lista_envio_archivo_pac.accepttext()
		ll_tot_reg_despues	= dw_lista_envio_archivo_pac.rowcount()
		if ll_tot_reg_antes <> ll_tot_reg_despues then
			messagebox("Advertencia","Para el Rango Fecha del "+string(ld_fec_ini,'dd/mm/yyyy')+" al "+string(ld_fec_fin,'dd/mm/yyyy')+", Existe(n) Diferencia(s) en Registro(s), Exportación de Archivo ya Realizado")
		end if
	else
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type p_2 from picture within tabpage_1
integer x = 1376
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
datetime	ld_fecha_fin
Double	ldb_uf_fin
date		ld_fecha,ld_fecha_proc

dw_lista_envio_archivo_pac.reset()
if trim(em_fec_fin.text)='00/00/0000' or trim(em_fec_fin.text)='' or &
	isnull(trim(em_fec_fin.text)) then	
	
	em_fec_fin.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if trim(em_fec_fin.text)<>'00/00/0000' and not isnull(trim(em_fec_fin.text)) and &
	trim(em_fec_fin.text)<>'' then
	
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_fin.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin.text = Message.StringParm

datetime	ld_fec_ini,ld_fec_fin
ld_fec_ini	= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			cb_proceso.triggerevent(clicked!)
//			em_fec_fin.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type em_fec_fin from editmask within tabpage_1
integer x = 978
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;datetime	ld_fec_ini,ld_fec_fin
Date		ld_fecha,ld_fecha_proc
Double	ldb_uf_fin

dw_lista_envio_archivo_pac.reset()
ld_fec_ini	= datetime(date(em_fec_ini.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			cb_proceso.triggerevent(clicked!)
//			em_fec_fin.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type st_2 from statictext within tabpage_1
integer x = 837
integer y = 1528
integer width = 142
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within tabpage_1
integer x = 741
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;Date		ld_fecha,ld_fecha_proc
String	ls_fecha
datetime	ldt_fec_min,ldt_fecha

dw_lista_envio_archivo_pac.reset()
if trim(em_fec_ini.text)='00/00/0000' or trim(em_fec_ini.text)='' or &
	isnull(trim(em_fec_ini.text)) then	
	
	em_fec_ini.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if trim(em_fec_ini.text)<>'00/00/0000' and not isnull(trim(em_fec_ini.text)) and &
	trim(em_fec_ini.text)<>'' then
	
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_ini.text 	= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini.text 	= Message.StringParm
ld_fecha				= date(em_fec_ini.text)
ld_fecha_proc		= RelativeDate(ld_fecha, 7)
em_fec_fin.text	= string(ld_fecha_proc,"dd/mm/yyyy")

ldt_fecha			= datetime(date(em_fec_ini.text),time('00:00:00'))
SELECT	MIN("PAC_DETALLE"."FECHA_ENVIO")  
INTO 		:ldt_fec_min  
FROM 		"PAC_DETALLE"  
USING		sqlca;
if not isnull(ldt_fec_min) then
	if ldt_fecha < ldt_fec_min then
		messagebox("Advertencia","Fecha Inicial NO debe ser Menor a Fecha Mínima Registrada que es "+string(ldt_fec_min,'dd/mm/yyyy'))
		em_fec_ini.text	= string(ldt_fec_min,'dd/mm/yyyy')
	end if
end if

end event

type em_fec_ini from editmask within tabpage_1
integer x = 343
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;datetime	ldt_fec_min,ldt_fecha

ldt_fecha	= datetime(date(em_fec_ini.text),time('00:00:00'))
SELECT	MIN("PAC_DETALLE"."FECHA_ENVIO")  
INTO 		:ldt_fec_min  
FROM 		"PAC_DETALLE"  
USING		sqlca;
if not isnull(ldt_fec_min) then
	if ldt_fecha < ldt_fec_min then
		messagebox("Advertencia","Fecha Inicial NO debe ser Menor a Fecha Mínima Registrada que es "+string(ldt_fec_min,'dd/mm/yyyy'))
		em_fec_ini.text	= string(ldt_fec_min,'dd/mm/yyyy')
	end if
end if

end event

type st_4 from statictext within tabpage_1
integer x = 18
integer y = 1528
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_lista_envio_archivo_pac from datawindow within tabpage_1
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 100
string title = "none"
string dataobject = "dw_lista_archivo_pac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 120
integer width = 3895
integer height = 1660
long backcolor = 67108864
string text = " Recupera Archivo"
long tabtextcolor = 33554432
string picturename = "Retrieve!"
long picturemaskcolor = 536870912
cb_exp_rec cb_exp_rec
cb_ord_rec cb_ord_rec
cb_filtrar_rec cb_filtrar_rec
cb_grabar cb_grabar
cb_proceso_rec cb_proceso_rec
p_4 p_4
em_fec_fin_rec em_fec_fin_rec
st_6 st_6
p_3 p_3
em_fec_ini_rec em_fec_ini_rec
st_5 st_5
dw_recupera_archivo dw_recupera_archivo
cb_recupera cb_recupera
dw_cargar dw_cargar
end type

on tabpage_2.create
this.cb_exp_rec=create cb_exp_rec
this.cb_ord_rec=create cb_ord_rec
this.cb_filtrar_rec=create cb_filtrar_rec
this.cb_grabar=create cb_grabar
this.cb_proceso_rec=create cb_proceso_rec
this.p_4=create p_4
this.em_fec_fin_rec=create em_fec_fin_rec
this.st_6=create st_6
this.p_3=create p_3
this.em_fec_ini_rec=create em_fec_ini_rec
this.st_5=create st_5
this.dw_recupera_archivo=create dw_recupera_archivo
this.cb_recupera=create cb_recupera
this.dw_cargar=create dw_cargar
this.Control[]={this.cb_exp_rec,&
this.cb_ord_rec,&
this.cb_filtrar_rec,&
this.cb_grabar,&
this.cb_proceso_rec,&
this.p_4,&
this.em_fec_fin_rec,&
this.st_6,&
this.p_3,&
this.em_fec_ini_rec,&
this.st_5,&
this.dw_recupera_archivo,&
this.cb_recupera,&
this.dw_cargar}
end on

on tabpage_2.destroy
destroy(this.cb_exp_rec)
destroy(this.cb_ord_rec)
destroy(this.cb_filtrar_rec)
destroy(this.cb_grabar)
destroy(this.cb_proceso_rec)
destroy(this.p_4)
destroy(this.em_fec_fin_rec)
destroy(this.st_6)
destroy(this.p_3)
destroy(this.em_fec_ini_rec)
destroy(this.st_5)
destroy(this.dw_recupera_archivo)
destroy(this.cb_recupera)
destroy(this.dw_cargar)
end on

type cb_exp_rec from commandbutton within tabpage_2
integer x = 2341
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_cargar
if dw_cargar.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ord_rec from commandbutton within tabpage_2
integer x = 2094
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

type cb_filtrar_rec from commandbutton within tabpage_2
integer x = 1847
integer y = 1536
integer width = 242
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

type cb_grabar from commandbutton within tabpage_2
integer x = 2651
integer y = 1536
integer width = 389
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_max,ll_indi,ll_tot_reg,value,ll_rut,ll_numero_cupon,ll_monto_pago,ll_cod_banco,ll_numero,ll_new,&
			ll_ctas_pag_s,ll_ctas_pag_m,ll_tot_pagado_s,ll_tot_pagado_m,ll_interes,ll_gasto_cob,ll_count,ll_res,&
			ll_graba
String	ls_string_1,ls_string_2,ls_string_3,docname,ls_dv,ls_cod_rechazo,ls_estado,ls_cuenta,ls_base,ls_serie,&
			ls_tipo_mov,ls_caja
datetime	ldt_fecha_cargo,ldt_fecha_pago,ldt_fecha_ori,ldt_fecha_carga,ldt_fecha_hoy,ld_fec_ini,ld_fec_fin

ll_tot_reg					= tab_1.tabpage_2.dw_cargar.rowcount()
ll_res						= messagebox("Advertencia","Está Seguro Actualizar PAC",Exclamation!,YesNo!,2)
if ll_res=1 then
	SetPointer(HourGlass!)	
	ll_graba					= 0
	ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
	ls_caja					= 'CP'
	ll_interes				= 0
	ll_gasto_cob			= 0
	SELECT	MAX("SOL_PAC_RECUPERA_ARCHIVO"."CODIGO_GRUPO")  
	INTO 		:ll_max  
	FROM 		"SOL_PAC_RECUPERA_ARCHIVO"  
	USING		sqlca;
	if ll_max=0 or isnull(ll_max) then
		ll_max	= 1
	else
		ll_max ++
	end if
	if ll_tot_reg > 0 then
		if ll_max > 0 then
			for ll_indi=1 to ll_tot_reg
				tab_1.tabpage_2.dw_cargar.setitem(ll_indi,'codigo_grupo',ll_max)
				ll_rut				= tab_1.tabpage_2.dw_cargar.getitemnumber(ll_indi,'rut')
				ls_dv					= tab_1.tabpage_2.dw_cargar.getitemstring(ll_indi,'dv')
				ls_cod_rechazo		= tab_1.tabpage_2.dw_cargar.getitemstring(ll_indi,'codigo_rechazo')
				ldt_fecha_cargo	= tab_1.tabpage_2.dw_cargar.getitemdatetime(ll_indi,'fecha_cargo')
				ls_base				= tab_1.tabpage_2.dw_cargar.getitemstring(ll_indi,'base')
				ls_serie				= tab_1.tabpage_2.dw_cargar.getitemstring(ll_indi,'serie')
				ll_numero			= tab_1.tabpage_2.dw_cargar.getitemnumber(ll_indi,'numero')
				ll_numero_cupon	= tab_1.tabpage_2.dw_cargar.getitemnumber(ll_indi,'numero_cupon')
				ll_monto_pago		= tab_1.tabpage_2.dw_cargar.getitemnumber(ll_indi,'monto_pago')
				ldt_fecha_pago		= tab_1.tabpage_2.dw_cargar.getitemdatetime(ll_indi,'fecha_pago')
				ls_estado			= tab_1.tabpage_2.dw_cargar.getitemstring(ll_indi,'estado')
				ls_cuenta			= tab_1.tabpage_2.dw_cargar.getitemstring(ll_indi,'cuenta_cargo')
				ll_cod_banco		= tab_1.tabpage_2.dw_cargar.getitemnumber(ll_indi,'cod_banco')
				ldt_fecha_ori		= tab_1.tabpage_2.dw_cargar.getitemdatetime(ll_indi,'fecha_cargo_ori')
				if ls_estado='021' then
					INSERT INTO "INGRESO"  
								 ( "FOLIO",				"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",		"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" )
					VALUES 	 ( :ll_numero_cupon,	'CU',			:ldt_fecha_pago,	:ls_tipo_mov,	:ll_monto_pago,	1,					:ls_serie,	:ll_numero,	:ls_caja,	' ',			:gd_uf_dia,		'A',				:ls_base,	:ll_rut,	:gs_user,	null,			null,				null,					null,					null,			null,				null,			:ldt_fecha_pago,	'0',				'N',				null )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						CHOOSE CASE ls_base
							CASE 'O'
								SELECT	"OFERTA_V"."CTA_PAG_S",	"OFERTA_V"."CTA_PAG_M",	"OFERTA_V"."TOT_PAGADO",	"OFERTA_V"."TOT_PAGADO_M"  
								INTO 		:ll_ctas_pag_s, 			:ll_ctas_pag_m,			:ll_tot_pagado_s, 			:ll_tot_pagado_m  
								FROM 		"OFERTA_V",	"CADENA",	"PAGO_OFERTA"  
								WHERE  ( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										 ( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										 ( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
										 ( "OFERTA_V"."SERIE" = "CADENA"."SERIE" ) and  
										 ( "OFERTA_V"."NRO_OFERTA" = "CADENA"."NUMERO" ) and  
										 (("CADENA"."CODIGO" = :ls_base ) AND  
										 ( "CADENA"."SERIE" = :ls_serie ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									if ls_tipo_mov='E' then
										ll_ctas_pag_s ++
										ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
										UPDATE	"OFERTA_V"  
										SET 		"CTA_PAG_S" = :ll_ctas_pag_s,   
													"TOT_PAGADO" = :ll_tot_pagado_s
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									elseif ls_tipo_mov='F' then
										ll_ctas_pag_m++
										ll_tot_pagado_m	= ll_tot_pagado_m + ll_monto_pago
										UPDATE	"OFERTA_V"  
										SET 		"CTA_PAG_M" = :ll_ctas_pag_m,   
													"TOT_PAGADO_M" = :ll_tot_pagado_m  
										WHERE  ( "OFERTA_V"."SERIE" = :ls_serie ) AND  
												 ( "OFERTA_V"."NRO_OFERTA" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
								end if
							CASE 'L'
								SELECT	"ANEXO_LIBERADOR"."TOT_PAGADO",	"ANEXO_LIBERADOR"."CTA_PAG_M"  
								INTO 		:ll_tot_pagado_s,						:ll_ctas_pag_s  
								FROM 		"ANEXO_LIBERADOR",	"CADENA",	"PAGO_LIBERADOR"  
								WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
										 ( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
										 ( "ANEXO_LIBERADOR"."SERIE_M" = "CADENA"."SERIE" ) and  
										 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "CADENA"."NUMERO" ) and  
										 (("CADENA"."CODIGO" = :ls_base ) AND  
										 ( "CADENA"."SERIE" = :ls_serie ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ll_ctas_pag_s ++
									ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
									if ls_tipo_mov='E' then
										UPDATE	"ANEXO_LIBERADOR"  
										SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
													"CTA_PAG_M" = :ll_ctas_pag_s  
										WHERE  ( "ANEXO_LIBERADOR"."SERIE_M" = :ls_serie ) AND  
												 ( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
								end if
								
							CASE 'P'
								SELECT	"PAGARE"."TOT_PAGADO",	"PAGARE"."CTA_PAG_LA"   
								INTO 		:ll_tot_pagado_s,			:ll_ctas_pag_s  
								FROM		"CADENA",	"PAGARE"  
								WHERE  ( "CADENA"."SERIE" = "PAGARE"."SERIE_P" ) and  
										 ( "CADENA"."NUMERO" = "PAGARE"."NRO_PAGARE" ) and  
										 (("CADENA"."CODIGO" = :ls_base ) AND  
										 ( "CADENA"."SERIE" = :ls_serie ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ll_ctas_pag_s ++
									ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
									if ls_tipo_mov='E' then
										UPDATE	"PAGARE"  
										SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
													"CTA_PAG_LA" = :ll_ctas_pag_s  
										WHERE  ( "PAGARE"."SERIE_P" = :ls_serie ) AND  
												 ( "PAGARE"."NRO_PAGARE" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
								end if
								
							CASE 'R'
								SELECT	"REPACTA_MANTENCION"."CTAS_PAGADAS",	"REPACTA_MANTENCION"."TOTAL_PAGADO"  
								INTO 		:ll_ctas_pag_s,								:ll_tot_pagado_s  
								FROM 		"CADENA",	"REPACTA_MANTENCION"  
								WHERE  ( "CADENA"."CODIGO" = "REPACTA_MANTENCION"."BASE" ) and  
										 ( "CADENA"."SERIE" = "REPACTA_MANTENCION"."SERIE" ) and  
										 ( "CADENA"."NUMERO" = "REPACTA_MANTENCION"."NUMERO" ) and  
										 (("CADENA"."CODIGO" = :ls_base ) AND  
										 ( "CADENA"."SERIE" = :ls_serie ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ll_ctas_pag_s ++
									ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
									if ls_tipo_mov='E' then
										UPDATE	"REPACTA_MANTENCION"  
										SET 		"CTAS_PAGADAS" = :ll_ctas_pag_s,   
													"TOTAL_PAGADO" = :ll_tot_pagado_s  
										WHERE  ( "REPACTA_MANTENCION"."BASE" = :ls_base ) AND  
												 ( "REPACTA_MANTENCION"."SERIE" = :ls_serie ) AND  
												 ( "REPACTA_MANTENCION"."NUMERO" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if	
								end if
								
							CASE 'D'
								SELECT	"DERECHO"."TOT_PAGADO",	"DERECHO"."CTA_PAG_LA"  
								INTO 		:ll_tot_pagado_s,			:ll_ctas_pag_s  
								FROM 		"CADENA",	"DERECHO"  
								WHERE  ( "CADENA"."SERIE" = "DERECHO"."SERIE_P" ) and  
										 ( "CADENA"."NUMERO" = "DERECHO"."NRO_PAGARE" ) and  
										 (("CADENA"."CODIGO" = :ls_base ) AND  
										 ( "CADENA"."SERIE" = :ls_serie ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ll_ctas_pag_s ++
									ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
									if ls_tipo_mov='E' then
										UPDATE	"DERECHO"  
										SET 		"TOT_PAGADO" = :ll_tot_pagado_s,   
													"CTA_PAG_LA" = :ll_ctas_pag_s  
										WHERE  ( "DERECHO"."SERIE_P" = :ls_serie ) AND  
												 ( "DERECHO"."NRO_PAGARE" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if
								end if
								
							CASE 'A'
								SELECT	"ANEXO_AUMENTO"."TOT_PAGADO",	"ANEXO_AUMENTO"."CTA_PAG_M"  
								INTO 		:ll_tot_pagado_s,					:ll_ctas_pag_s  
								FROM 		"ANEXO_AUMENTO",	"CADENA",	"PAGO_AUMENTO"  
								WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
										 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
										 ( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
										 ( "ANEXO_AUMENTO"."SERIE_M" = "CADENA"."SERIE" ) and  
										 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = "CADENA"."NUMERO" ) and  
										 (("CADENA"."CODIGO" = :ls_base ) AND  
										 ( "CADENA"."SERIE" = :ls_serie ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ll_ctas_pag_s ++
									ll_tot_pagado_s	= ll_tot_pagado_s + ll_monto_pago
									if ls_tipo_mov='E' then
										UPDATE	"ANEXO_AUMENTO"  
										SET 		"CTA_PAG_M" = :ll_ctas_pag_s,   
													"TOT_PAGADO" = :ll_tot_pagado_s  
										WHERE  ( "ANEXO_AUMENTO"."SERIE_M" = :ls_serie ) AND  
												 ( "ANEXO_AUMENTO"."NRO_AUMENTO" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if	
								end if
								
							CASE 'C'
								SELECT	"CONTRATO"."CTA_PAG_M"  
								INTO 		:ll_ctas_pag_m  
								FROM 		"CADENA",	"CONTRATO"  
								WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
										 ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
										 (("CADENA"."CODIGO" = :ls_base ) AND  
										 ( "CADENA"."SERIE" = :ls_serie ) AND  
										 ( "CADENA"."NUMERO" = :ll_numero ) )   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ll_ctas_pag_m ++
									if ls_tipo_mov='F' then
										UPDATE	"CONTRATO"  
										SET 		"CTA_PAG_M" = :ll_ctas_pag_m  
										WHERE  ( "CONTRATO"."SERIE_C" = :ls_serie ) AND  
												 ( "CONTRATO"."NRO_CONTRATO" = :ll_numero )   
										USING		sqlca;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
										end if
									end if	
								end if
						END CHOOSE
						DECLARE sp_nuevo_cadena_mora PROCEDURE FOR sp_nuevo_cadena_mora(:ls_base,:ls_serie,:ll_numero,'M');
						EXECUTE sp_nuevo_cadena_mora;
						if ll_interes > 0 then
							INSERT INTO "INGRESO"  
										 ( "FOLIO",				"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",		"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" )
							VALUES 	 ( :ll_numero_cupon,	'CU',			:ldt_fecha_pago,	'G',				:ll_interes,		0,					:ls_serie,	:ll_numero,	:ls_caja,	' ',			:gd_uf_dia,		'A',				:ls_base,	:ll_rut,	:gs_user,	null,			null,				null,					null,					null,			null,				null,			:ldt_fecha_pago,	'0',				'N',				null )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
						if ll_gasto_cob > 0 then
							INSERT INTO "INGRESO"  
										 ( "FOLIO",				"TIPO_COB",	"FECHA_PAGO",		"TIPO_MOV",		"MONTO",				"CUOTAS_PAG",	"SERIE",		"CONTRATO",	"COD_CAJA",	"REZAGO",	"VALOR_UF",		"PAGO_HIST",	"BASE",		"RUT",	"USUARIO",	"COD_AGE",	"FECHA_VENC",	"PAGO_EXTERNO",	"LUGAR_EXTERNO",	"VIENE_DE",	"FECHA_ANT",	"FCHA_ANT",	"SERVIPAG",			"CODIGO_OTRO",	"TRASPASO_E",	"FECHA_TRASPASO_REZAGO" )
							VALUES 	 ( :ll_numero_cupon,	'CU',			:ldt_fecha_pago,	'J',				:ll_gasto_cob,		0,					:ls_serie,	:ll_numero,	:ls_caja,	' ',			:gd_uf_dia,		'A',				:ls_base,	:ll_rut,	:gs_user,	null,			null,				null,					null,					null,			null,				null,			:ldt_fecha_pago,	'0',				'N',				null )  
							USING		sqlca;
							if sqlca.sqlcode=0 then
								commit;
							else
								rollback;
							end if
						end if
						UPDATE	"CUPONERAS_DETALLE"  
						SET 		"ESTADO_PAGO_CUPON" = 'C',   
									"TIPO_COB_PAGO" = 'CU',   
									"FOLIO_PAGO" = :ll_numero_cupon,   
									"FECHA_PAGO" = :ldt_fecha_pago  
						WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
						else
							rollback;
						end if
					else
						rollback;
					end if
				else
					INSERT INTO   "SOL_PAC_RECUPERA_RECHAZO"  
									( "CODIGO_RECHAZO",	"FECHA_CARGO",		"FECHA_CARGO_ORI",	"RUT",	"DV",		"BASE",		"SERIE",		"NUMERO",	"NUMERO_CUPON",	"MONTO_PAGO",		"FECHA_PAGO",		"ESTADO",	"CUENTA_CARGO",	"COD_BANCO",	"CODIGO_GRUPO" )  
					VALUES 		( :ls_cod_rechazo,	:ldt_fecha_cargo,	:ldt_fecha_ori,		:ll_rut,	:ls_dv,	:ls_base,	:ls_serie,	:ll_numero,	:ll_numero_cupon,	:ll_monto_pago,	:ldt_fecha_pago,	:ls_estado,	:ls_cuenta,			:ll_cod_banco,	:ll_max )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				end if
			next
			dw_cargar.accepttext()
			if dw_cargar.update() = 1 then
				commit;
				INSERT INTO "SOL_PAC_RECUPERA_ARCHIVO"  
							( "CODIGO_GRUPO",	"NOMBRE_ARCHIVO",	"FECHA_CARGA",		"CANT_REGISTROS",	"USUARIO" )  
				VALUES 	( :ll_max,			:named,				:ldt_fecha_hoy,	:ll_tot_reg,		:gs_user )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ld_fec_ini					= datetime(date(em_fec_ini_rec.text),time('00:00:00'))
					ld_fec_fin					= datetime(date(em_fec_fin_rec.text),time('00:00:00'))
					dw_recupera_archivo.reset()
					dw_recupera_archivo.retrieve(ld_fec_ini,ld_fec_fin)
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar Recupera Archivo PAC SQL: "+sqlca.sqlerrtext)
				end if
				messagebox("Grabar","Grabación Exitosa")
				ll_graba ++
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Detalle Recuperación PAC SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
	ll_tot_reg					= tab_1.tabpage_4.dw_no_aplicar.rowcount()
	if ll_tot_reg > 0 then
		if ll_max > 0 then
			for ll_indi=1 to ll_tot_reg
				tab_1.tabpage_4.dw_no_aplicar.setitem(ll_indi,'codigo_grupo',ll_max)
			next
			tab_1.tabpage_4.dw_no_aplicar.accepttext()
			if tab_1.tabpage_4.dw_no_aplicar.update() = 1 then
				commit;
				ll_graba ++
			else
				rollback;
//				messagebox("Error Grabar","Error al Grabar Rechazo PAC SQL: "+sqlca.sqlerrtext)
			end if
		end if
	end if
	if ll_graba > 0 then
		cb_grabar.enabled		= false
	end if
	SetPointer(Arrow!)
end if
end event

type cb_proceso_rec from picturebutton within tabpage_2
integer x = 1477
integer y = 1488
integer width = 169
integer height = 148
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;datetime		ld_fec_ini,ld_fec_fin
date			ld_fecha,ld_fecha_proc
Long			ll_tot_reg

cb_grabar.enabled			= false
ld_fec_ini					= datetime(date(em_fec_ini_rec.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin_rec.text),time('00:00:00'))
dw_recupera_archivo.reset()
dw_cargar.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini_rec.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin_rec.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	ll_tot_reg				= dw_recupera_archivo.retrieve(ld_fec_ini,ld_fec_fin)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type p_4 from picture within tabpage_2
integer x = 1376
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
datetime	ld_fecha_fin
Double	ldb_uf_fin
date		ld_fecha,ld_fecha_proc

dw_recupera_archivo.reset()
dw_cargar.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
if trim(em_fec_fin_rec.text)='00/00/0000' or trim(em_fec_fin_rec.text)='' or &
	isnull(trim(em_fec_fin_rec.text)) then	
	
	em_fec_fin_rec.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin_rec.text)=-1 then 
	em_fec_fin_rec.text=string(today(),gs_formato_fecha)
	em_fec_fin_rec.setfocus()
	return
end if	
if trim(em_fec_fin_rec.text)<>'00/00/0000' and not isnull(trim(em_fec_fin_rec.text)) and &
	trim(em_fec_fin_rec.text)<>'' then
	
	ls_fecha = em_fec_fin_rec.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_fin_rec.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin_rec.text = Message.StringParm

datetime	ld_fec_ini,ld_fec_fin
ld_fec_ini					= datetime(date(em_fec_ini_rec.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin_rec.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini_rec.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin_rec.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin_rec.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type em_fec_fin_rec from editmask within tabpage_2
integer x = 978
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;datetime	ld_fec_ini,ld_fec_fin
Date		ld_fecha,ld_fecha_proc
Double	ldb_uf_fin

dw_recupera_archivo.reset()
dw_cargar.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
ld_fec_ini					= datetime(date(em_fec_ini_rec.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin_rec.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini_rec.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin_rec.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin_rec.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type st_6 from statictext within tabpage_2
integer x = 837
integer y = 1528
integer width = 142
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_3 from picture within tabpage_2
integer x = 741
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;Date		ld_fecha,ld_fecha_proc
String	ls_fecha

dw_recupera_archivo.reset()
dw_cargar.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
if trim(em_fec_ini_rec.text)='00/00/0000' or trim(em_fec_ini_rec.text)='' or &
	isnull(trim(em_fec_ini_rec.text)) then	
	
	em_fec_ini_rec.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini_rec.text)=-1 then 
	em_fec_ini_rec.text=string(today(),gs_formato_fecha)
	em_fec_ini_rec.setfocus()
	return
end if	
if trim(em_fec_ini_rec.text)<>'00/00/0000' and not isnull(trim(em_fec_ini_rec.text)) and &
	trim(em_fec_ini_rec.text)<>'' then
	
	ls_fecha = em_fec_ini_rec.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_ini_rec.text 	= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini_rec.text 	= Message.StringParm
ld_fecha					= date(em_fec_ini_rec.text)
ld_fecha_proc			= RelativeDate(ld_fecha, 7)
em_fec_fin_rec.text	= string(ld_fecha_proc,"dd/mm/yyyy")
end event

type em_fec_ini_rec from editmask within tabpage_2
integer x = 343
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_5 from statictext within tabpage_2
integer x = 18
integer y = 1528
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_recupera_archivo from datawindow within tabpage_2
integer x = 23
integer y = 32
integer width = 1097
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_archivos_recuperados"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long	ll_grupo
if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_grupo										= dw_recupera_archivo.getitemnumber(row,'codigo_grupo')
	if ll_grupo > 0 then 
		dw_cargar.retrieve(ll_grupo)
		dw_cargar.scrolltorow(1)
		dw_cargar.setfocus()
	end if
end if
end event

event rowfocuschanged;Long	ll_grupo
if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	ll_grupo										= dw_recupera_archivo.getitemnumber(getrow(),'codigo_grupo')
	if ll_grupo > 0 then 
		dw_cargar.retrieve(ll_grupo)
		dw_cargar.scrolltorow(1)
		dw_cargar.setfocus()
	end if
end if
end event

type cb_recupera from commandbutton within tabpage_2
integer x = 3090
integer y = 1536
integer width = 773
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Recuperar Archivo"
end type

event clicked;Long		ll_max,ll_indi,ll_tot_reg,value,ll_rut,ll_numero_cupon,ll_monto_pago,ll_cod_banco,ll_numero,ll_new,&
			ll_ctas_pag_s,ll_ctas_pag_m,ll_tot_pagado_s,ll_tot_pagado_m,ll_interes,ll_gasto_cob,ll_count,ll_new_no
String	ls_string_1,ls_string_2,ls_string_3,docname,ls_dv,ls_cod_rechazo,ls_estado,ls_cuenta,ls_base,ls_serie,&
			ls_tipo_mov,ls_caja
datetime	ldt_fecha_cargo,ldt_fecha_pago,ldt_fecha_ori,ldt_fecha_carga,ldt_fecha_hoy,ld_fec_ini,ld_fec_fin

dw_recupera_archivo.reset()
dw_cargar.reset()
dw_recupera_pac.reset()
tab_1.tabpage_4.dw_no_aplicar.reset()
cb_grabar.enabled							= false
value 										= GetFileOpenName("Seleccione Archivo", docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
If value = 1 Then
	SetPointer(HourGlass!)
	dw_recupera_pac.ImportFile(docname)
	ll_tot_reg								= dw_recupera_pac.rowcount()
	if ll_tot_reg > 0 then
		dw_recupera_pac.deleterow(1)
		dw_recupera_pac.deleterow(dw_recupera_pac.rowcount())
		ll_tot_reg							= dw_recupera_pac.rowcount()
		if ll_tot_reg > 0 then
			cb_grabar.enabled				= true
			ldt_fecha_hoy					= datetime(date(gdt_fec_sistema),time('00:00:00'))
			ls_caja							= 'CP'
			ll_interes						= 0
			ll_gasto_cob					= 0
			SELECT	"SOL_PAC_RECUPERA_ARCHIVO"."FECHA_CARGA"  
			INTO 		:ldt_fecha_carga  
			FROM 		"SOL_PAC_RECUPERA_ARCHIVO"  
			WHERE 	"SOL_PAC_RECUPERA_ARCHIVO"."NOMBRE_ARCHIVO" = :named   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Advertencia","Archivo Ya Recuperado el día "+string(ldt_fecha_carga,'dd/mm/yyyy'))
			elseif sqlca.sqlcode=100 then
				for ll_indi=1 to ll_tot_reg step 3
					ls_string_1			= upper(dw_recupera_pac.getitemstring(ll_indi,'linea'))
					ls_string_2			= upper(dw_recupera_pac.getitemstring(ll_indi + 1,'linea'))
					ls_string_3			= upper(dw_recupera_pac.getitemstring(ll_indi + 2,'linea'))
					ll_rut				= long(mid(ls_string_2,9,9))
					ls_dv					= mid(ls_string_2,18,1)
					ls_cod_rechazo		= mid(ls_string_2,93,4)
					ldt_fecha_cargo	= datetime(date( string(mid(ls_string_1,121,2)) +'/'+ string(mid(ls_string_1,119,2)) +'/'+ string(mid(ls_string_1,123,4)) ) ,time('00:00:00'))
					ll_numero_cupon	= Long(mid(ls_string_2,44,25))
					ll_monto_pago		= Long(mid(ls_string_2,69,11))
					ldt_fecha_pago		= datetime(date( string(mid(ls_string_2,84,2)) +'/'+ string(mid(ls_string_2,82,2)) +'/'+ string(mid(ls_string_2,86,4)) ) ,time('00:00:00'))
					ls_estado			= mid(ls_string_2,90,3)
					ls_cuenta			= mid(ls_string_2,97,12)
					ll_cod_banco		= Long(mid(ls_string_2,110,3))
					ldt_fecha_ori		= datetime(date( string(mid(ls_string_1,139,2)) +'/'+ string(mid(ls_string_1,141,2)) +'/'+ string(mid(ls_string_1,143,4)) ) ,time('00:00:00'))
					SELECT	COUNT("SOL_PAC_RECUPERA"."RUT")  
					INTO 		:ll_count  
					FROM 		"SOL_PAC_RECUPERA"  
					WHERE 	"SOL_PAC_RECUPERA"."NUMERO_CUPON" = :ll_numero_cupon   ;
					if ll_count=0 or isnull(ll_count) then
						SELECT	"CUPONERAS_DETALLE"."BASE",	"CUPONERAS_DETALLE"."SERIE",	"CUPONERAS_DETALLE"."NUMERO",		"CUPONERAS_DETALLE"."TIPO_MOV"
						INTO 		:ls_base,							:ls_serie,							:ll_numero,								:ls_tipo_mov
						FROM 		"CUPONERAS_DETALLE"  
						WHERE 	"CUPONERAS_DETALLE"."NRO_CUPON" = :ll_numero_cupon   
						USING		sqlca;
						ll_new				= dw_cargar.insertrow(0)
						dw_cargar.setitem(ll_new,'rut',ll_rut)
						dw_cargar.setitem(ll_new,'dv',ls_dv)
						dw_cargar.setitem(ll_new,'codigo_rechazo',ls_cod_rechazo)
						dw_cargar.setitem(ll_new,'fecha_cargo',ldt_fecha_cargo)
						dw_cargar.setitem(ll_new,'base',ls_base)
						dw_cargar.setitem(ll_new,'serie',ls_serie)
						dw_cargar.setitem(ll_new,'numero',ll_numero)
						dw_cargar.setitem(ll_new,'numero_cupon',ll_numero_cupon)
						dw_cargar.setitem(ll_new,'monto_pago',ll_monto_pago)
						dw_cargar.setitem(ll_new,'fecha_pago',ldt_fecha_pago)
						dw_cargar.setitem(ll_new,'estado',ls_estado)
						dw_cargar.setitem(ll_new,'cuenta_cargo',ls_cuenta)
						dw_cargar.setitem(ll_new,'cod_banco',ll_cod_banco)
						dw_cargar.setitem(ll_new,'fecha_cargo_ori',ldt_fecha_ori)
						if ls_estado <> '021' then
							ll_new_no		= tab_1.tabpage_4.dw_no_aplicar.insertrow(0)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'rut',ll_rut)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'dv',ls_dv)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'codigo_rechazo',ls_cod_rechazo)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_cargo',ldt_fecha_cargo)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'base',ls_base)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'serie',ls_serie)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'numero',ll_numero)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'numero_cupon',ll_numero_cupon)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'monto_pago',ll_monto_pago)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_pago',ldt_fecha_pago)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'estado',ls_estado)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'cuenta_cargo',ls_cuenta)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'cod_banco',ll_cod_banco)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'fecha_cargo_ori',ldt_fecha_ori)
							tab_1.tabpage_4.dw_no_aplicar.setitem(ll_new_no,'codigo_grupo',ll_max)
							tab_1.tabpage_4.dw_no_aplicar.accepttext()
						end if
					else
						messagebox("Advertencia","Contrato Nº "+ls_base+"-"+ls_serie+"-"+string(ll_numero,'###,###,###,###,###')+" con Fecha de Pago "+string(ldt_fecha_pago,'dd/mm/yyyy')+" Monto de $ "+string(ll_monto_pago,'###,###,###,###')+", Ya fue Recuperado")
					end if
				next
				dw_cargar.accepttext()
			else
				messagebox("Advertencia","Error SQL "+sqlca.sqlerrtext)
			end if
		end if
	end if
	SetPointer(Arrow!)
end if
end event

type dw_cargar from datawindow within tabpage_2
integer x = 1161
integer y = 32
integer width = 2697
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_cargar_pac_recupera"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row_rec									= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_rec, TRUE)
end if

end event

event rowfocuschanged;if getrow() > 0 then
	il_row_rec									= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_rec, TRUE)
end if

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 120
integer width = 3895
integer height = 1660
long backcolor = 67108864
string text = " Cargos NO Aplicados"
long tabtextcolor = 33554432
string picturename = "StyleLibraryList!"
long picturemaskcolor = 536870912
cb_exportar_no_ap cb_exportar_no_ap
cb_filtrar_no_ap cb_filtrar_no_ap
cb_ord_no_ap cb_ord_no_ap
cb_proceso_no cb_proceso_no
p_hasta p_hasta
em_fec_fin_hasta em_fec_fin_hasta
st_hasta st_hasta
p_desde p_desde
em_fec_ini_no em_fec_ini_no
st_desde st_desde
dw_no_aplicar dw_no_aplicar
end type

on tabpage_4.create
this.cb_exportar_no_ap=create cb_exportar_no_ap
this.cb_filtrar_no_ap=create cb_filtrar_no_ap
this.cb_ord_no_ap=create cb_ord_no_ap
this.cb_proceso_no=create cb_proceso_no
this.p_hasta=create p_hasta
this.em_fec_fin_hasta=create em_fec_fin_hasta
this.st_hasta=create st_hasta
this.p_desde=create p_desde
this.em_fec_ini_no=create em_fec_ini_no
this.st_desde=create st_desde
this.dw_no_aplicar=create dw_no_aplicar
this.Control[]={this.cb_exportar_no_ap,&
this.cb_filtrar_no_ap,&
this.cb_ord_no_ap,&
this.cb_proceso_no,&
this.p_hasta,&
this.em_fec_fin_hasta,&
this.st_hasta,&
this.p_desde,&
this.em_fec_ini_no,&
this.st_desde,&
this.dw_no_aplicar}
end on

on tabpage_4.destroy
destroy(this.cb_exportar_no_ap)
destroy(this.cb_filtrar_no_ap)
destroy(this.cb_ord_no_ap)
destroy(this.cb_proceso_no)
destroy(this.p_hasta)
destroy(this.em_fec_fin_hasta)
destroy(this.st_hasta)
destroy(this.p_desde)
destroy(this.em_fec_ini_no)
destroy(this.st_desde)
destroy(this.dw_no_aplicar)
end on

type cb_exportar_no_ap from commandbutton within tabpage_4
integer x = 3543
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_no_aplicar
if dw_no_aplicar.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar_no_ap from commandbutton within tabpage_4
integer x = 2011
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
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
dw_no_aplicar.SETfilter(NULO)
dw_no_aplicar.filter()
end event

type cb_ord_no_ap from commandbutton within tabpage_4
integer x = 2341
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_no_aplicar.setsort(nulo)
dw_no_aplicar.sort()
end event

type cb_proceso_no from picturebutton within tabpage_4
integer x = 1477
integer y = 1488
integer width = 169
integer height = 148
integer taborder = 70
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string 	ls_string,ls_filtro,ls_base,ls_serie,ls_est_reg
Date		ld_fecha,ld_fecha_proc
Datetime	ldt_fec_vcto_c,ldt_fec_vcto_m,ld_fec_ini,ld_fec_fin
Long		ll_tot_reg,ll_indi,ll_numero,ll_cupon_c,ll_count,ll_cupon_m,ll_tot_reg_antes,ll_tot_reg_despues
Double	ldb_cta_cred,ldb_cta_mant

ld_fec_ini					= datetime(date(em_fec_ini_no.text),time('00:00:00'))
ld_fec_fin					= datetime(date(em_fec_fin_hasta.text),time('00:00:00'))
dw_no_aplicar.reset()
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha					= date(em_fec_ini_no.text)
	ld_fecha_proc			= RelativeDate(ld_fecha, 7)
	em_fec_fin_hasta.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	ll_tot_reg				= dw_no_aplicar.retrieve(ld_fec_ini,ld_fec_fin)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

type p_hasta from picture within tabpage_4
integer x = 1376
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
datetime	ld_fecha_fin
Double	ldb_uf_fin
date		ld_fecha,ld_fecha_proc

dw_no_aplicar.reset()
if trim(em_fec_fin_hasta.text)='00/00/0000' or trim(em_fec_fin_hasta.text)='' or &
	isnull(trim(em_fec_fin_hasta.text)) then	
	
	em_fec_fin_hasta.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_fin_hasta.text)=-1 then 
	em_fec_fin_hasta.text=string(today(),gs_formato_fecha)
	em_fec_fin_hasta.setfocus()
	return
end if	
if trim(em_fec_fin_hasta.text)<>'00/00/0000' and not isnull(trim(em_fec_fin_hasta.text)) and &
	trim(em_fec_fin_hasta.text)<>'' then
	
	ls_fecha = em_fec_fin_hasta.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_fin_hasta.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_fin_hasta.text = Message.StringParm

datetime	ld_fec_ini,ld_fec_fin
ld_fec_ini	= datetime(date(em_fec_ini_no.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin_hasta.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini_no.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin_hasta.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin_hasta.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type em_fec_fin_hasta from editmask within tabpage_4
integer x = 978
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;datetime	ld_fec_ini,ld_fec_fin
Date		ld_fecha,ld_fecha_proc
Double	ldb_uf_fin

dw_no_aplicar.reset()
ld_fec_ini	= datetime(date(em_fec_ini_no.text),time('00:00:00'))
ld_fec_fin	= datetime(date(em_fec_fin_hasta.text),time('00:00:00'))
if ld_fec_fin < ld_fec_ini then
	messagebox("Advertencia","Fecha Inválida, Fecha Inicial NO debe ser Superior a la Fecha Término")
	ld_fecha				= date(em_fec_ini_no.text)
	ld_fecha_proc		= RelativeDate(ld_fecha, 7)
	em_fec_fin_hasta.text	= string(ld_fecha_proc,'dd/mm/yyyy')
else
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_uf_fin  
	FROM 		"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ld_fec_fin   
	USING		sqlca;
	if sqlca.sqlcode=0 then
	else
		SELECT	MAX("TAB_UF"."FECHA_UF")  
		INTO 		:ld_fec_fin  
		FROM 		"TAB_UF"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","UF Registrada es hasta el día "+string(ld_fec_fin,'dd/mm/yyyy'))
			em_fec_fin_hasta.text	= string(ld_fec_fin,'dd/mm/yyyy')
		end if
	end if
end if
end event

type st_hasta from statictext within tabpage_4
integer x = 837
integer y = 1528
integer width = 142
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_desde from picture within tabpage_4
integer x = 741
integer y = 1516
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;Date		ld_fecha,ld_fecha_proc
String	ls_fecha

dw_no_aplicar.reset()
if trim(em_fec_ini_no.text)='00/00/0000' or trim(em_fec_ini_no.text)='' or &
	isnull(trim(em_fec_ini_no.text)) then	
	
	em_fec_ini_no.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_fec_ini_no.text)=-1 then 
	em_fec_ini_no.text=string(today(),gs_formato_fecha)
	em_fec_ini_no.setfocus()
	return
end if	
if trim(em_fec_ini_no.text)<>'00/00/0000' and not isnull(trim(em_fec_ini_no.text)) and &
	trim(em_fec_ini_no.text)<>'' then
	
	ls_fecha = em_fec_ini_no.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
em_fec_ini_no.text 	= ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_fec_ini_no.text 	= Message.StringParm
ld_fecha				= date(em_fec_ini_no.text)
ld_fecha_proc		= RelativeDate(ld_fecha, 7)
em_fec_fin_hasta.text	= string(ld_fecha_proc,"dd/mm/yyyy")
end event

type em_fec_ini_no from editmask within tabpage_4
integer x = 343
integer y = 1516
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_desde from statictext within tabpage_4
integer x = 18
integer y = 1528
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_no_aplicar from datawindow within tabpage_4
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_rechazo_pac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_no	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_no, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row_no	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_no, TRUE)
end if
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 120
integer width = 3895
integer height = 1660
long backcolor = 67108864
string text = " Tabla Rechazo"
long tabtextcolor = 33554432
string picturename = "Hand!"
long picturemaskcolor = 536870912
cb_exportar cb_exportar
dw_errores dw_errores
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
end type

on tabpage_3.create
this.cb_exportar=create cb_exportar
this.dw_errores=create dw_errores
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.Control[]={this.cb_exportar,&
this.dw_errores,&
this.cb_ordenar,&
this.cb_filtrar}
end on

on tabpage_3.destroy
destroy(this.cb_exportar)
destroy(this.dw_errores)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
end on

type cb_exportar from commandbutton within tabpage_3
integer x = 3543
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_errores
if dw_errores.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type dw_errores from datawindow within tabpage_3
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_tabala_errores_pac"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_ordenar from commandbutton within tabpage_3
integer x = 23
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_errores.setsort(nulo)
dw_errores.sort()
end event

type cb_filtrar from commandbutton within tabpage_3
integer x = 357
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 50
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
dw_errores.SETfilter(NULO)
dw_errores.filter()
end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 120
integer width = 3895
integer height = 1660
long backcolor = 67108864
string text = " Universo de Mandatos"
long tabtextcolor = 33554432
string picturename = "Custom042!"
long picturemaskcolor = 536870912
cb_grabar_man cb_grabar_man
cb_exp_uni cb_exp_uni
cb_ord_uni cb_ord_uni
cb_filtrar_uni cb_filtrar_uni
cb_cargar_uni cb_cargar_uni
dw_lista_universo dw_lista_universo
end type

on tabpage_5.create
this.cb_grabar_man=create cb_grabar_man
this.cb_exp_uni=create cb_exp_uni
this.cb_ord_uni=create cb_ord_uni
this.cb_filtrar_uni=create cb_filtrar_uni
this.cb_cargar_uni=create cb_cargar_uni
this.dw_lista_universo=create dw_lista_universo
this.Control[]={this.cb_grabar_man,&
this.cb_exp_uni,&
this.cb_ord_uni,&
this.cb_filtrar_uni,&
this.cb_cargar_uni,&
this.dw_lista_universo}
end on

on tabpage_5.destroy
destroy(this.cb_grabar_man)
destroy(this.cb_exp_uni)
destroy(this.cb_ord_uni)
destroy(this.cb_filtrar_uni)
destroy(this.cb_cargar_uni)
destroy(this.dw_lista_universo)
end on

type cb_grabar_man from commandbutton within tabpage_5
integer x = 2651
integer y = 1536
integer width = 389
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long	ll_res
ll_res	= messagebox("Advertencia","Desea Actualizar Tabla Mandatos PAC",Exclamation!,YesNo!,2)
if ll_res=1 then
	DELETE FROM "SOL_PAC_UNIVERSO_MANDATOS"  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		commit;
	else
		rollback;
	end if
	if dw_lista_universo.rowcount() > 0 then
		if dw_lista_universo.update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			cb_grabar_man.enabled	= false
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Tabla Mandatos SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_exp_uni from commandbutton within tabpage_5
integer x = 3543
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_universo
if dw_lista_universo.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ord_uni from commandbutton within tabpage_5
integer x = 2094
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull(nulo)
dw_lista_universo.setsort(nulo)
dw_lista_universo.sort()
end event

type cb_filtrar_uni from commandbutton within tabpage_5
integer x = 1765
integer y = 1536
integer width = 325
integer height = 100
integer taborder = 60
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
dw_lista_universo.SETfilter(NULO)
dw_lista_universo.filter()
end event

type cb_cargar_uni from commandbutton within tabpage_5
integer x = 23
integer y = 1536
integer width = 407
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cargar"
end type

event clicked;Long		value,ll_tot_reg,ll_indi,ll_rut,ll_numero_cupon,ll_monto_pago,ll_cod_banco,ll_new,ll_cod_banco_des,&
			ll_identificador,ll_rut_aux
String	docname,named_uni,ls_string_1,ls_string_2,ls_string_3,ls_dv,ls_cod_rechazo,ls_estado,ls_tipo
Datetime	ldt_fecha_cargo

dw_recupera_uni.reset()
dw_lista_universo.reset()
value 										= GetFileOpenName("Seleccione Archivo", docname, named_uni, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
If value = 1 Then
	SetPointer(HourGlass!)
	dw_recupera_uni.ImportFile(docname)
	ll_tot_reg								= dw_recupera_uni.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg 
			ls_string_1			= upper(dw_recupera_uni.getitemstring(ll_indi,'linea'))
			ls_tipo				= mid(ls_string_1,1,1)
			if ls_tipo='2' then
				ll_rut				= long(mid(ls_string_1,9,9))
				ls_dv					= mid(ls_string_1,18,1)
				ls_cod_rechazo		= mid(ls_string_1,257,4)
				ldt_fecha_cargo	= datetime(date( string(mid(ls_string_1,229,2)) +'/'+ string(mid(ls_string_1,227,2)) +'/'+ string(mid(ls_string_1,231,4)) ) ,time('00:00:00'))
				ls_estado			= mid(ls_string_1,254,3)
				ll_cod_banco		= Long(mid(ls_string_1,189,3))
				ll_cod_banco_des	= Long(mid(ls_string_1,261,3))
				ll_identificador	= Long(mid(ls_string_1,139,25))
				SELECT	"CLIENTE"."RUT"  
				INTO 		:ll_rut_aux  
				FROM 		"CLIENTE"  
				WHERE 	"CLIENTE"."RUT" = :ll_rut   
				USING		sqlca ;
				if sqlca.sqlcode=0 then
					ll_new				= dw_lista_universo.insertrow(0)
					dw_lista_universo.setitem(ll_new,'rut',ll_rut)
					dw_lista_universo.setitem(ll_new,'dv',ls_dv)
					dw_lista_universo.setitem(ll_new,'cod_rechazo',ls_cod_rechazo)
					dw_lista_universo.setitem(ll_new,'fecha_movimiento',ldt_fecha_cargo)
					dw_lista_universo.setitem(ll_new,'estado',ls_estado)
					dw_lista_universo.setitem(ll_new,'cod_banco_recauda',ll_cod_banco)
					dw_lista_universo.setitem(ll_new,'cod_banco_destino',ll_cod_banco_des)
					dw_lista_universo.setitem(ll_new,'usuario_crea',gs_user)
					dw_lista_universo.setitem(ll_new,'identificador',ll_identificador)
					dw_lista_universo.setitem(ll_new,'nombre_archivo',named_uni)
				else
					SELECT	"SOL_PAC"."RUT_TITULAR",	"CLIENTE"."DV"
					INTO 		:ll_rut,							:ls_dv
					FROM 		"SOL_PAC",	"CLIENTE"  
					WHERE  ( "SOL_PAC"."RUT_TITULAR" = "CLIENTE"."RUT" ) and  
							 ( ( "SOL_PAC"."NUMERO" = :ll_identificador ) )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_new				= dw_lista_universo.insertrow(0)
						dw_lista_universo.setitem(ll_new,'rut',ll_rut)
						dw_lista_universo.setitem(ll_new,'dv',ls_dv)
						dw_lista_universo.setitem(ll_new,'cod_rechazo',ls_cod_rechazo)
						dw_lista_universo.setitem(ll_new,'fecha_movimiento',ldt_fecha_cargo)
						dw_lista_universo.setitem(ll_new,'estado',ls_estado)
						dw_lista_universo.setitem(ll_new,'cod_banco_recauda',ll_cod_banco)
						dw_lista_universo.setitem(ll_new,'cod_banco_destino',ll_cod_banco_des)
						dw_lista_universo.setitem(ll_new,'usuario_crea',gs_user)
						dw_lista_universo.setitem(ll_new,'identificador',ll_identificador)
						dw_lista_universo.setitem(ll_new,'nombre_archivo',named_uni)
					end if
				end if
			end if
		next
		dw_lista_universo.accepttext()
		if dw_lista_universo.rowcount() > 0 then
			cb_grabar_man.enabled	= true
			messagebox("Advertencia","Recuerde Grabar la Actualización de Mandatos Vigentes")
		else
			cb_grabar_man.enabled	= false
			messagebox("Advertencia","No Registra Mandato")
		end if
	else
		dw_lista_universo.retrieve()
		cb_grabar_man.enabled		= false
		messagebox("Advertencia","No Fue Cargado Archivo Mandatos Vigentes")
	end if
	SetPointer(Arrow!)
else
	dw_lista_universo.retrieve()
	cb_grabar_man.enabled			= false
	messagebox("Advertencia","No Fue Cargado Archivo Mandatos Vigentes")
end if
end event

type dw_lista_universo from datawindow within tabpage_5
integer x = 23
integer y = 32
integer width = 3845
integer height = 1424
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_universo_mandatos"
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row_uni	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_uni, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row_uni	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_uni, TRUE)
end if
end event

type dw_print_mant from datawindow within w_envio_archivo_pac_bkp
integer x = 453
integer y = 2332
integer width = 233
integer height = 432
string title = "none"
string dataobject = "dwe_imprimir_detalle_envio_credito"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_print_cred from datawindow within w_envio_archivo_pac_bkp
integer x = 123
integer y = 2324
integer width = 229
integer height = 432
string title = "none"
string dataobject = "dwe_imprimir_detalle_envio_credito"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_envio_archivo_pac_bkp
integer x = 1696
integer y = 1888
integer width = 288
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;CHOOSE CASE tab_1.SelectedTab
	CASE 1
		if dw_print_cred.rowcount() = 0 and dw_print_mant.rowcount() = 0 then
			messagebox("Advertencia","Recuerde Antes de Imprimir debe EXPORTAR ARCHIVO")
		else
			if gs_empresa = 'El Prado' then
				dw_print_cred.object.t_empresa.text	= 'Rut Empresa~r96.844.000 - 4'
				dw_print_mant.object.t_empresa.text	= 'Rut Empresa~r96.844.000 - 4'
			elseif gs_empresa = 'La Foresta' then
				dw_print_cred.object.t_empresa.text	= 'Rut Empresa~r96.835.970 - 3'
				dw_print_mant.object.t_empresa.text	= 'Rut Empresa~r96.835.970 - 3'
			elseif gs_empresa = 'Concepcion' then
				dw_print_cred.object.t_empresa.text	= 'Rut Empresa~r76.703.310 - 9'
				dw_print_mant.object.t_empresa.text	= 'Rut Empresa~r76.703.310 - 9'
			end if
			if dw_print_cred.rowcount() > 0 and dw_print_mant.rowcount() = 0 then
				dw_print_cred.setSort("fecha_vcto_cred A");
				dw_print_cred.sort();
				f_printdlg(dw_print_cred,gstr_print,w_envio_archivo_pac)
			elseif dw_print_cred.rowcount() = 0 and dw_print_mant.rowcount() > 0 then
				dw_print_mant.setSort("fecha_vcto_cred A");
				dw_print_mant.sort();
				f_printdlg(dw_print_mant,gstr_print,w_envio_archivo_pac)
			elseif dw_print_cred.rowcount() > 0 and dw_print_mant.rowcount() > 0 then
				dw_print_cred.setSort("fecha_vcto_cred A");
				dw_print_cred.sort();
				dw_print_mant.setSort("fecha_vcto_cred A");
				dw_print_mant.sort();
				f_printdlg(dw_print_cred,gstr_print,w_envio_archivo_pac)
				dw_envio_archivo_pac_mant.print()
			end if
		end if
		
	CASE 2
		if tab_1.tabpage_2.dw_cargar.rowcount() > 0 then
			f_printdlg(tab_1.tabpage_2.dw_cargar,gstr_print,w_envio_archivo_pac)
		end if
		
	CASE 3
		if tab_1.tabpage_4.dw_no_aplicar.rowcount() > 0 then
			f_printdlg(tab_1.tabpage_4.dw_no_aplicar,gstr_print,w_envio_archivo_pac)
		end if		
	
	CASE 4
		if tab_1.tabpage_3.dw_errores.rowcount() > 0 then
			tab_1.tabpage_3.dw_errores.Object.DataWindow.Zoom = 93
			f_printdlg(tab_1.tabpage_3.dw_errores,gstr_print,w_envio_archivo_pac)
			tab_1.tabpage_3.dw_errores.Object.DataWindow.Zoom = 100
		end if

END CHOOSE
end event

type dw_pac_detalle from datawindow within w_envio_archivo_pac_bkp
boolean visible = false
integer x = 754
integer y = 2152
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_grabar_pac_detalle"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_envio_archivo_pac_mant from datawindow within w_envio_archivo_pac_bkp
integer x = 453
integer y = 2136
integer width = 219
integer height = 168
string title = "none"
string dataobject = "dwe_enviar_archivo_pac_mant"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cuenta_corriente from commandbutton within w_envio_archivo_pac_bkp
integer x = 37
integer y = 1880
integer width = 443
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;CHOOSE CASE tab_1.SelectedTab
	CASE 1
		if il_row>0 then
			gs_base 			= tab_1.tabpage_1.dw_lista_envio_archivo_pac.GetItemString(il_row, "sol_pac_base")
			gs_serie 		= tab_1.tabpage_1.dw_lista_envio_archivo_pac.GetItemString(il_row, "sol_pac_serie")
			gi_numero 		= tab_1.tabpage_1.dw_lista_envio_archivo_pac.GetItemNumber(il_row, "sol_pac_numero")
		
			if not isnull(gs_base) and gi_numero>0 then
				CHOOSE CASE gs_base
					CASE "O" 	// Oferta
						if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
						Open(w_cuenta_corriente_oferta)
					CASE "L" 	// Anexo Liberador
						if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
						Open(w_cuenta_corriente_liberador)
					CASE "P" 	// Pagaré
						if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
						Open(w_cuenta_corriente_pagare)
					CASE "C" 	// Contrato ISA
						if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
						Open(w_cuenta_corriente_contrato_isa)
					CASE "D" 	// Derecho Especial
						if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
						Open(w_cuenta_corriente_derecho)
					CASE "R" 	// Repactación Ctas.Mantencion
						if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
						Open(w_cuenta_corriente_repactar_cta_mant)
					CASE "A"
						if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
						Open(w_cuenta_corriente_aumento_capacidad)
					CASE "F"
						if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
						open(w_cuenta_corriente_funeraria) 
				END CHOOSE
			end if
		end if
		
	CASE 2
		if il_row_rec>0 then
			gs_base 			= tab_1.tabpage_2.dw_cargar.GetItemString(il_row_rec, "base")
			gs_serie 			= tab_1.tabpage_2.dw_cargar.GetItemString(il_row_rec, "serie")
			gi_numero 		= tab_1.tabpage_2.dw_cargar.GetItemNumber(il_row_rec, "numero")
		
			if not isnull(gs_base) and gi_numero>0 then
				CHOOSE CASE gs_base
					CASE "O" 	// Oferta
						if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
						Open(w_cuenta_corriente_oferta)
					CASE "L" 	// Anexo Liberador
						if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
						Open(w_cuenta_corriente_liberador)
					CASE "P" 	// Pagaré
						if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
						Open(w_cuenta_corriente_pagare)
					CASE "C" 	// Contrato ISA
						if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
						Open(w_cuenta_corriente_contrato_isa)
					CASE "D" 	// Derecho Especial
						if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
						Open(w_cuenta_corriente_derecho)
					CASE "R" 	// Repactación Ctas.Mantencion
						if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
						Open(w_cuenta_corriente_repactar_cta_mant)
					CASE "A"
						if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
						Open(w_cuenta_corriente_aumento_capacidad)
					CASE "F"
						if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
						open(w_cuenta_corriente_funeraria) 
				END CHOOSE
			end if
		end if
	
	CASE 3
		if il_row_no>0 then
			gs_base 			= tab_1.tabpage_4.dw_no_aplicar.GetItemString(il_row_no, "base")
			gs_serie 			= tab_1.tabpage_4.dw_no_aplicar.GetItemString(il_row_no, "serie")
			gi_numero 		= tab_1.tabpage_4.dw_no_aplicar.GetItemNumber(il_row_no, "numero")
		
			if not isnull(gs_base) and gi_numero>0 then
				CHOOSE CASE gs_base
					CASE "O" 	// Oferta
						if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
						Open(w_cuenta_corriente_oferta)
					CASE "L" 	// Anexo Liberador
						if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
						Open(w_cuenta_corriente_liberador)
					CASE "P" 	// Pagaré
						if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
						Open(w_cuenta_corriente_pagare)
					CASE "C" 	// Contrato ISA
						if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
						Open(w_cuenta_corriente_contrato_isa)
					CASE "D" 	// Derecho Especial
						if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
						Open(w_cuenta_corriente_derecho)
					CASE "R" 	// Repactación Ctas.Mantencion
						if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
						Open(w_cuenta_corriente_repactar_cta_mant)
					CASE "A"
						if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
						Open(w_cuenta_corriente_aumento_capacidad)
					CASE "F"
						if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
						open(w_cuenta_corriente_funeraria) 
				END CHOOSE
			end if
		end if
		
	CASE 5
		
END CHOOSE





end event

type cb_limpiar from commandbutton within w_envio_archivo_pac_bkp
integer x = 2025
integer y = 1888
integer width = 311
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;date		ld_fecha,ld_fecha_proc
CHOOSE CASE tab_1.SelectedTab
	CASE 1
		tab_1.tabpage_1.dw_lista_envio_archivo_pac.reset()
		dw_envio_archivo_pac_cred.reset()
		dw_envio_archivo_pac_mant.reset()
		dw_pac_detalle.reset()
		tab_1.tabpage_1.em_fec_ini.text 			= string(gdt_fec_sistema,'dd/mm/yyyy')
		ld_fecha											= date(gdt_fec_sistema)
		ld_fecha_proc									= RelativeDate(ld_fecha, 7)
		tab_1.tabpage_1.em_fec_fin.text			= string(ld_fecha_proc,'dd/mm/yyyy')
	CASE 2
		tab_1.tabpage_2.dw_cargar.reset()
		dw_recupera_pac.reset()
		tab_1.tabpage_2.dw_recupera_archivo.reset()
		tab_1.tabpage_2.em_fec_ini_rec.text 	= string(gdt_fec_sistema,'dd/mm/yyyy')
		ld_fecha											= date(gdt_fec_sistema)
		ld_fecha_proc									= RelativeDate(ld_fecha, 7)
		tab_1.tabpage_2.em_fec_fin_rec.text		= string(ld_fecha_proc,'dd/mm/yyyy')
		tab_1.tabpage_2.cb_grabar.enabled		= false
		
	CASE 3
		tab_1.tabpage_4.dw_no_aplicar.reset()
		tab_1.tabpage_4.em_fec_ini_no.text 		= string(gdt_fec_sistema,'dd/mm/yyyy')
		ld_fecha											= date(gdt_fec_sistema)
		ld_fecha_proc									= RelativeDate(ld_fecha, 7)
		tab_1.tabpage_4.em_fec_fin_hasta.text	= string(ld_fecha_proc,'dd/mm/yyyy')
		
	CASE 4
		tab_1.tabpage_3.dw_errores.SETfilter('')
		tab_1.tabpage_3.dw_errores.filter()
		tab_1.tabpage_3.dw_errores.retrieve()
		
	CASE 5
		tab_1.tabpage_5.dw_lista_universo.retrieve()
		
END CHOOSE

end event

type cb_cerrar from commandbutton within w_envio_archivo_pac_bkp
integer x = 3639
integer y = 1880
integer width = 329
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_envio_archivo_pac)
end event

type dw_envio_archivo_pac_cred from datawindow within w_envio_archivo_pac_bkp
integer x = 101
integer y = 2136
integer width = 219
integer height = 168
string title = "none"
string dataobject = "dwe_enviar_archivo_pac_cred"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_envio_archivo_pac_bkp
integer x = 1669
integer y = 1840
integer width = 695
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

