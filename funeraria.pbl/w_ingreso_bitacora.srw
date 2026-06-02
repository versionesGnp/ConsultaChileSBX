forward
global type w_ingreso_bitacora from window
end type
type cb_exportar from commandbutton within w_ingreso_bitacora
end type
type dw_excel from datawindow within w_ingreso_bitacora
end type
type dw_imprimir from datawindow within w_ingreso_bitacora
end type
type cb_cerrar from commandbutton within w_ingreso_bitacora
end type
type cb_imprimir from commandbutton within w_ingreso_bitacora
end type
type cb_grabar from commandbutton within w_ingreso_bitacora
end type
type dw_bitacora_det from datawindow within w_ingreso_bitacora
end type
type dw_bitacora_c from datawindow within w_ingreso_bitacora
end type
end forward

global type w_ingreso_bitacora from window
integer width = 3145
integer height = 1868
boolean titlebar = true
string title = "Ingreso Registro"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_exportar cb_exportar
dw_excel dw_excel
dw_imprimir dw_imprimir
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
cb_grabar cb_grabar
dw_bitacora_det dw_bitacora_det
dw_bitacora_c dw_bitacora_c
end type
global w_ingreso_bitacora w_ingreso_bitacora

type variables
string	is_modif = 'N',is_modif_2 = 'N',is_modif_3 = 'N',is_modif_4 = 'N',is_modif_5 = 'N',is_modif_6 = 'N',is_modif_7 = 'N',is_modif_8 = 'N'
long il_mod=0
datetime idt_fecha_sep
end variables

on w_ingreso_bitacora.create
this.cb_exportar=create cb_exportar
this.dw_excel=create dw_excel
this.dw_imprimir=create dw_imprimir
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.cb_grabar=create cb_grabar
this.dw_bitacora_det=create dw_bitacora_det
this.dw_bitacora_c=create dw_bitacora_c
this.Control[]={this.cb_exportar,&
this.dw_excel,&
this.dw_imprimir,&
this.cb_cerrar,&
this.cb_imprimir,&
this.cb_grabar,&
this.dw_bitacora_det,&
this.dw_bitacora_c}
end on

on w_ingreso_bitacora.destroy
destroy(this.cb_exportar)
destroy(this.dw_excel)
destroy(this.dw_imprimir)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.cb_grabar)
destroy(this.dw_bitacora_det)
destroy(this.dw_bitacora_c)
end on

event open;Long		ll_cod_parque,ll_parque,ll_reg
String		ls_base,ls_serie,ls_nom_titular,ls_pat_tit,ls_mat_tit,ls_nom_fall,ls_pat_fall,ls_mat_fall,ls_dv_cliente,ls_dv_fall,ls_string,ls_fono,ls_cel,ls_orden_compra,&
			ls_cod_agente
datetime	ldt_fecha_sepult
Double	ll_numero,ll_rut_cliente,ll_rut_fall

gf_centrar(w_ingreso_bitacora)
dw_bitacora_c.settransobject(sqlca)
dw_bitacora_c.insertrow(0)
dw_bitacora_det.settransobject(sqlca)
dw_bitacora_det.insertrow(0)
ls_base					= trim(substr(1,1,Message.StringParm))
ls_serie					= trim(substr(1,2,Message.StringParm))
ll_numero				= long(substr(1,3,Message.StringParm))
ll_rut_cliente			= long(substr(1,4,Message.StringParm))
ll_rut_fall					= long(substr(1,6,Message.StringParm))
ls_cod_agente			= trim(substr(1,5,Message.StringParm))
ls_orden_compra		= ls_base+ls_serie+string(ll_numero)
if dw_bitacora_c.retrieve(ll_rut_cliente)>0 then
	dw_bitacora_det.retrieve(ll_rut_cliente,ll_rut_fall)
else
	dw_bitacora_c.insertrow(0)
	ll_reg	= dw_bitacora_c.getrow()
	if not isnull(ll_rut_cliente) or ll_rut_cliente > 0 then
		 SELECT "CLIENTE"."NOMBRE",   
					"CLIENTE"."A_PATERNO",   
					"CLIENTE"."A_MATERNO",
					"CLIENTE"."DV",
					"CLIENTE"."FONO_P",
					"CLIENTE"."CELULAR"
		 INTO		:ls_nom_titular,:ls_pat_tit,:ls_mat_tit ,:ls_dv_cliente,:ls_fono,:ls_cel
		 FROM "CLIENTE"  
		WHERE "CLIENTE"."RUT" = :ll_rut_cliente  ;
	end if	
	if not isnull(ll_rut_fall) or ll_rut_fall > 0 then
		SELECT  "PRODUCTO_BENEFICIARIO"."NOMBRE",   
      			    "PRODUCTO_BENEFICIARIO"."A_PATERNO",   
         			"PRODUCTO_BENEFICIARIO"."A_MATERNO",
					"PRODUCTO_BENEFICIARIO"."DV"	
		INTO		:ls_nom_fall,:ls_pat_fall,:ls_mat_fall,:ls_dv_fall			
    		FROM "PRODUCTO_BENEFICIARIO"  
   		WHERE "PRODUCTO_BENEFICIARIO"."RUT" = :ll_rut_fall   ;
	end if	
	dw_bitacora_c.insertrow(0)
	if isnull(ls_nom_titular) then  ls_nom_titular = '-'
	if isnull(ls_pat_tit) then ls_pat_tit = '-'
	if isnull(ls_mat_tit) then  ls_mat_tit = '-'
	if isnull(ls_fono) then  ls_fono = '-'
	if isnull(ls_cel) then  ls_cel = '-'
	if isnull(ls_nom_fall) then  ls_nom_fall = '-'
	if isnull(ls_pat_fall) then  ls_pat_fall = '-'
	if isnull(ls_mat_fall) then  ls_mat_fall = '-'


	dw_bitacora_c.setitem(ll_reg,'base',ls_base)
	dw_bitacora_c.setitem(ll_reg,'serie',ls_serie)	
	dw_bitacora_c.setitem(ll_reg,'numero',ll_numero)
	dw_bitacora_c.setitem(ll_reg,'rut_titular',ll_rut_cliente)
	dw_bitacora_c.setitem(ll_reg,'dv_titular',ls_dv_cliente)
	dw_bitacora_c.setitem(ll_reg,'nombre_titular',ls_nom_titular)
	dw_bitacora_c.setitem(ll_reg,'ap_pat_titular',ls_pat_tit)
	dw_bitacora_c.setitem(ll_reg,'ap_mat_titular',ls_mat_tit)
	dw_bitacora_c.setitem(ll_reg,'telefono_titular',(ls_fono+'-'+ls_cel))
	dw_bitacora_c.setitem(ll_reg,'rut_fallecido',ll_rut_fall)
	dw_bitacora_c.setitem(ll_reg,'dv_fallecido',ls_dv_fall)
	dw_bitacora_c.setitem(ll_reg,'nombre_fallecido',ls_nom_fall)
	dw_bitacora_c.setitem(ll_reg,'ap_pat_fallecido',ls_pat_fall)
	dw_bitacora_c.setitem(ll_reg,'ap_mat_fallecido',ls_mat_fall)
	dw_bitacora_c.setitem(ll_reg,'orden_compra',ls_orden_compra)
	dw_bitacora_c.setitem(ll_reg,'codigo_vendedor',ls_cod_agente)
	dw_bitacora_det.setitem(ll_reg,'base',ls_base)
	dw_bitacora_det.setitem(ll_reg,'serie',ls_serie)	
	dw_bitacora_det.setitem(ll_reg,'numero',ll_numero)
	dw_bitacora_det.setitem(ll_reg,'rut_titular',ll_rut_cliente)
	dw_bitacora_det.setitem(ll_reg,'rut_fallecido',ll_rut_fall)
	dw_bitacora_det.setitem(ll_reg,'dv_titular',ls_dv_cliente)
	dw_bitacora_det.setitem(ll_reg,'dv_fallecido',ls_dv_fall)
	
	dw_bitacora_c.accepttext()
	
end if

end event

type cb_exportar from commandbutton within w_ingreso_bitacora
integer x = 1097
integer y = 1648
integer width = 338
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;Double	ll_numero,ll_rut_cliente,ll_rut_fall
String		ls_base,ls_serie
datawindow dw_paso
dw_excel.settransobject(sqlca)
ll_rut_cliente		= dw_bitacora_c.getitemnumber(1, "rut_titular")
ls_base				= dw_bitacora_c.getitemstring(1, "base")
ls_serie				= dw_bitacora_c.getitemstring(1, "serie")
ll_numero			= dw_bitacora_c.getitemnumber(1, "numero")
ll_rut_fall				= dw_bitacora_c.GetItemNumber(1, "rut_fallecido")
if dw_excel.retrieve(ls_base,ls_serie,ll_numero,ll_rut_cliente,ll_rut_fall)> 0 then
	dw_paso	= dw_excel
	if dw_excel.rowcount() > 0 then f_DWToExcel( dw_paso )
end if	
end event

type dw_excel from datawindow within w_ingreso_bitacora
integer x = 2231
integer y = 1864
integer width = 686
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "dw_imprimir_bitacora_excel"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_imprimir from datawindow within w_ingreso_bitacora
boolean visible = false
integer x = 718
integer y = 1808
integer width = 1463
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_imprimir_bitacora"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cerrar from commandbutton within w_ingreso_bitacora
integer x = 2752
integer y = 1648
integer width = 338
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ingreso_bitacora)
end event

type cb_imprimir from commandbutton within w_ingreso_bitacora
integer x = 553
integer y = 1648
integer width = 338
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Impirmir"
end type

event clicked;Long		ll_cod_parque,ll_parque,ll_reg,ll_row,ll_lleg_parque
String		ls_base,ls_serie,ls_nom_titular,ls_pat_tit,ls_mat_tit,ls_nom_fall,ls_pat_fall,ls_mat_fall,ls_dv_cliente,ls_dv_fall,ls_string,ls_fono,ls_orden_comp,&
			ls_funeraria,ls_codigo_vendedor,ls_defun_dire,ls_defun_fech,ls_defun_hora,ls_defun_minu,ls_sal_inst_dire,ls_sal_inst_fech,ls_sal_inst_hora,ls_sal_inst_minu,&
			ls_lleg_inst_dire,ls_lleg_inst_fech,ls_lleg_inst_hora,ls_lleg_inst_minu,ls_responso_dire,ls_responso_fech,ls_responso_hora,ls_responso_minu,ls_serv_home_dire,&
			ls_serv_home_fech,ls_serv_home_hora,ls_serv_home_minu,ls_lleg_carroza_dire,ls_lleg_carroza_fech,ls_lleg_carroza_hora,ls_lleg_carroza_minu,&
			ls_lleg_cemen_fech,ls_lleg_cemen_hora,ls_lleg_cemen_minu,ls_cod_vendedor,ls_cor_np,ls_lugar_sepultura,ls_observacion,ls_lleg_vel_dire,ls_lleg_vel_fech,ls_lleg_vel_hora,ls_lleg_vel_minu
datetime	ldt_fecha_sepult
Double	ll_numero,ll_rut_cliente,ll_rut_fall

dw_imprimir.settransobject(sqlca)
if il_mod = 0 then
	ll_rut_cliente		= dw_bitacora_c.getitemnumber(1, "rut_titular")
	ls_base				= dw_bitacora_c.getitemstring(1, "base")
	ls_serie				= dw_bitacora_c.getitemstring(1, "serie")
	ll_numero			= dw_bitacora_c.getitemnumber(1, "numero")
	ll_rut_fall				= dw_bitacora_c.GetItemNumber(1, "rut_fallecido")
	if dw_imprimir.retrieve(ls_base,ls_serie,ll_numero,ll_rut_cliente,ll_rut_fall)> 0 then
		f_Print( dw_imprimir )
	else
		messagebox("Avertencia","Antes de Imprimir debe Guardar Bitácora")
	end if	
else
	messagebox("Avertencia","Antes de Imprimir debe Guardar Bitácora")
end if	



//	ll_numero			= dw_bitacora_c.getitemnumber(ll_row, "nuemro")
//	ls_nom_titular		= dw_bitacora_c.getitemstring(ll_row, "nombre_titular")
//	ls_pat_tit				= dw_bitacora_c.getitemstring(ll_row, "ap_pat_titular")
//	ls_mat_tit			= dw_bitacora_c.getitemstring(ll_row, "ap_mat_titular")
//	ls_fono				= dw_bitacora_c.getitemstring(ll_row, "telefono_titular")
//	ls_orden_comp		= dw_bitacora_c.getitemstring(ll_row, "orden_compra")
//	ls_cod_vendedor	= dw_bitacora_c.getitemstring(ll_row, "codigo_vendedor")
//	ls_funeraria			= dw_bitacora_c.getitemstring(ll_row, "funeraria")
//	ls_cor_np			= dw_bitacora_c.getitemstring(ll_row, "coordinador_np")
//	ll_rut_fall				= dw_bitacora_c.GetItemNumber(ll_row, "rut_fallecido")
//	ls_nom_fall			= dw_bitacora_c.getitemstring(ll_row, "nombre_fallecido")
//	ls_pat_fall			= dw_bitacora_c.getitemstring(ll_row, "ap_pat_fallecido")
//	ls_mat_fall			= dw_bitacora_c.getitemstring(ll_row, "ap_mat_fallecido")
//	ls_dv_cliente		= dw_bitacora_c.getitemstring(ll_row, "dv_titular")
//	ls_dv_fall				= dw_bitacora_c.getitemstring(ll_row, "dv_fallecido")
//	ls_defun_dire		= dw_bitacora_det.getitemstring(ll_row, "defuncion_direccion")
//	ls_defun_fech		= dw_bitacora_det.getitemstring(ll_row, "defuncion_fecha")
//	ls_defun_hora		= dw_bitacora_det.getitemstring(ll_row, "defuncion_hora")
//	ls_defun_minu		= dw_bitacora_det.getitemstring(ll_row, "defuncion_minuto")
//	ls_sal_inst_dire		= dw_bitacora_det.getitemstring(ll_row, "salida_instalacion_direccion")
//	ls_sal_inst_fech	= dw_bitacora_det.getitemstring(ll_row, "salida_instalacion_fecha")
//	ls_sal_inst_hora	= dw_bitacora_det.getitemstring(ll_row, "salida_instalacion_hora")
//	ls_sal_inst_minu	= dw_bitacora_det.getitemstring(ll_row, "salida_instalacion_minuto")
//	ls_lleg_inst_dire	= dw_bitacora_det.getitemstring(ll_row, "llegada_instalacion_direccion")
//	ls_lleg_inst_fech	= dw_bitacora_det.getitemstring(ll_row, "llegada_instalacion_fecha")
////	ls_lleg_inst_hora	= dw_bitacora_det.getitemstring(ll_row, "legada_instalacion_hora")
//	ls_lleg_inst_minu	= dw_bitacora_det.getitemstring(ll_row, "llegada_instalacion_minuto")
//	ls_lleg_vel_dire		= dw_bitacora_det.getitemstring(ll_row, "llegada_velacion_direccion")
//	ls_lleg_vel_fech	= dw_bitacora_det.getitemstring(ll_row, "llegada_velacion_fecha")
////	ls_lleg_vel_hora	= dw_bitacora_det.getitemstring(ll_row, "legada_velacion_hora")
//	ls_lleg_vel_minu	= dw_bitacora_det.getitemstring(ll_row, "llegada_velacion_minuto")
//	ls_responso_dire	= dw_bitacora_det.getitemstring(ll_row, "responso_direccion")
//	ls_responso_fech	= dw_bitacora_det.getitemstring(ll_row, "responso_fecha")
//	ls_responso_hora	= dw_bitacora_det.getitemstring(ll_row, "responso_hora")
//	ls_responso_minu	= dw_bitacora_det.getitemstring(ll_row, "responso_minuto")
//	ls_serv_home_dire	= dw_bitacora_det.getitemstring(ll_row, "servicio_homenaje_direccion")
//	ls_serv_home_fech	= dw_bitacora_det.getitemstring(ll_row, "servicio_homenaje_fecha")
//	ls_serv_home_hora	= dw_bitacora_det.getitemstring(ll_row, "servicio_homenaje_hora")
//	ls_serv_home_minu	= dw_bitacora_det.getitemstring(ll_row, "servicio_homenaje_minuto")
//	ls_lleg_carroza_dire	= dw_bitacora_det.getitemstring(ll_row, "llegada_carroza_direccion")
//	ls_lleg_carroza_fech	= dw_bitacora_det.getitemstring(ll_row, "llegada_carroza_fecha")
//	ls_lleg_carroza_hora	= dw_bitacora_det.getitemstring(ll_row, "llegada_carroza_hora")
//	ls_lleg_carroza_minu	= dw_bitacora_det.getitemstring(ll_row, "llegada_carroza_minuto")
//	ll_lleg_parque			= dw_bitacora_det.getitemnumber(ll_row, "llegada_cementerio_parque")
//	ls_lleg_cemen_fech	= dw_bitacora_det.getitemstring(ll_row, "llegada_cementerio_fecha")
//	ls_lleg_cemen_hora	= dw_bitacora_det.getitemstring(ll_row, "llegada_cementerio_hora")
//	ls_lleg_cemen_minu	= dw_bitacora_det.getitemstring(ll_row, "llegada_cementerio_minuto")
//	ls_lugar_sepultura		= dw_bitacora_det.getitemstring(ll_row, "lugar_sepultura")
//	ls_observacion			= dw_bitacora_det.getitemstring(ll_row, "Observacion")
//	
//	//dw_imprimir.setitem(1,'rut_tituar',ll_rut_cliente)
//	dw_imprimir.setitem(1,'base',ls_base)
//	dw_imprimir.setitem(1,'serie',ls_serie)
//	dw_imprimir.setitem(1,'nuemro',ll_numero)
//	dw_imprimir.setitem(1,'nombre_titular',ls_nom_titular)
//	dw_imprimir.setitem(1,'ap_pat_titular',ls_pat_tit)
//	dw_imprimir.setitem(1,'ap_mat_titular',ls_mat_tit)
//	dw_imprimir.setitem(1,'fono_titular',ls_fono)
//	dw_imprimir.setitem(1,'orden_compra',ls_orden_comp)
//	dw_imprimir.setitem(1,'codigo_vendedor',ls_cod_vendedor)
//	dw_imprimir.setitem(1,'funeraria',ls_funeraria)
//	dw_imprimir.setitem(1,'coordinador_np',ls_cor_np)
//	dw_imprimir.setitem(1,'rut_fallecido',ll_rut_fall)
//	dw_imprimir.setitem(1,'nombre_fall',ls_nom_fall)
//	dw_imprimir.setitem(1,'ap_pat_fall',ls_pat_fall)
//	dw_imprimir.setitem(1,'ap_mat_fall',ls_mat_fall)
//	dw_imprimir.setitem(1,'dv_titular',ls_dv_cliente)
//	dw_imprimir.setitem(1,'dv_fallecido',ls_dv_fall)
//	dw_imprimir.setitem(1,'defuncion_direccion',ls_defun_dire)
//	dw_imprimir.setitem(1,'defuncion_fecha',ls_defun_fech)
//	dw_imprimir.setitem(1,'defuncion_hora',ls_defun_hora)
//	dw_imprimir.setitem(1,'defuncion_minuto',ls_defun_minu)
//	dw_imprimir.setitem(1,'salida_instalacion_direccion',ls_sal_inst_dire)
//	dw_imprimir.setitem(1,'salida_instalacion_fecha',ls_sal_inst_fech)
//	dw_imprimir.setitem(1,'salida_instalacion_hora',ls_sal_inst_hora)
//	dw_imprimir.setitem(1,'salida_instalacion_minuto',ls_sal_inst_minu)
//	dw_imprimir.setitem(1,'llegada_instalacion_direccion',ls_lleg_inst_dire)
//	dw_imprimir.setitem(1,'llegada_instalacion_fecha',ls_lleg_inst_fech)
//	dw_imprimir.setitem(1,'legada_instalacion_hora',ls_lleg_inst_hora)
//	dw_imprimir.setitem(1,'llegada_instalacion_minuto',ls_lleg_inst_minu)
//	dw_imprimir.setitem(1,'llegada_velacion_direccion',ls_lleg_vel_dire)
//	dw_imprimir.setitem(1,'llegada_velacion_fecha',ls_lleg_vel_fech)
//	dw_imprimir.setitem(1,'legada_velacion_hora',ls_lleg_vel_hora)
//	dw_imprimir.setitem(1,'llegada_velacion_minuto',ls_lleg_vel_minu)
//	dw_imprimir.setitem(1,'responso_direccion',ls_responso_dire)
//	dw_imprimir.setitem(1,'responso_fecha',ls_responso_fech)
//	dw_imprimir.setitem(1,'responso_hora',ls_responso_hora)
//	dw_imprimir.setitem(1,'responso_minuto',ls_responso_minu)
//	dw_imprimir.setitem(1,'servicio_homenaje_direccion',ls_serv_home_dire)
//	dw_imprimir.setitem(1,'servicio_homenaje_fecha',ls_serv_home_fech)
//	dw_imprimir.setitem(1,'servicio_homenaje_hora',ls_serv_home_hora)
//	dw_imprimir.setitem(1,'servicio_homenaje_minuto',ls_serv_home_minu)
//	dw_imprimir.setitem(1,'llegada_carroza_direccion',ls_lleg_carroza_dire)
//	dw_imprimir.setitem(1,'llegada_carroza_fecha',ls_lleg_carroza_fech)
//	dw_imprimir.setitem(1,'llegada_carroza_hora',ls_lleg_carroza_hora)
//	dw_imprimir.setitem(1,'llegada_carroza_minuto',ls_lleg_carroza_minu)
//	dw_imprimir.setitem(1,'llegada_cementerio_parque',ll_lleg_parque)
//	dw_imprimir.setitem(1,'llegada_cementerio_fecha',ls_lleg_cemen_fech)
//	dw_imprimir.setitem(1,'llegada_cementerio_hora',ls_lleg_cemen_hora)
//	dw_imprimir.setitem(1,'llegada_cementerio_minuto',ls_lleg_cemen_minu)
//	dw_imprimir.setitem(1,'lugar_sepultura',ls_lugar_sepultura)
//	dw_imprimir.setitem(1,'Observacion',ls_observacion)
//	dw_bitacora_c.accepttext()
//	
end event

type cb_grabar from commandbutton within w_ingreso_bitacora
integer x = 5
integer y = 1648
integer width = 338
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;Long		ll_cod_parque,ll_parque,ll_reg,ll_row,ll_lleg_parque,ls_defun_hora,ls_defun_minu,ls_sal_inst_hora,ls_sal_inst_minu,ls_lleg_inst_hora,ls_lleg_inst_minu,&
			ls_responso_hora,ls_responso_minu,ls_lleg_carroza_hora,ls_lleg_carroza_minu,ls_lleg_cemen_hora,ls_lleg_cemen_minu,ls_lleg_vel_hora,ls_lleg_vel_minu
String		ls_base,ls_serie,ls_nom_titular,ls_pat_tit,ls_mat_tit,ls_nom_fall,ls_pat_fall,ls_mat_fall,ls_dv_cliente,ls_dv_fall,ls_string,ls_fono,ls_orden_comp,&
			ls_funeraria,ls_codigo_vendedor,ls_defun_dire,ls_defun_fech,ls_sal_inst_dire,ls_sal_inst_fech,&
			ls_lleg_inst_dire,ls_lleg_inst_fech,ls_responso_dire,ls_responso_fech,ls_serv_home_dire,&
			ls_serv_home_fech,ls_serv_home_hora,ls_serv_home_minu,ls_lleg_carroza_dire,ls_lleg_carroza_fech,&
			ls_lleg_cemen_fech,ls_cod_vendedor,ls_cor_np,ls_lugar_sepultura,ls_observacion,ls_lleg_vel_dire,ls_lleg_vel_fech
datetime	ldt_fecha_sepult
Double	ll_numero,ll_rut_cliente,ll_rut_fall

ll_row					= dw_bitacora_det.getrow()
if ll_row > 0 and dw_bitacora_c.rowcount()>0 then
	ll_rut_cliente		= dw_bitacora_c.GetItemNumber(ll_row, "rut_titular")
	ls_base				= dw_bitacora_c.getitemstring(ll_row, "base")
	ls_serie				= dw_bitacora_c.getitemstring(ll_row, "serie")
	ll_numero			= dw_bitacora_c.getitemnumber(ll_row, "numero")
	ls_nom_titular		= dw_bitacora_c.getitemstring(ll_row, "nombre_titular")
	ls_pat_tit				= dw_bitacora_c.getitemstring(ll_row, "ap_pat_titular")
	ls_mat_tit			= dw_bitacora_c.getitemstring(ll_row, "ap_mat_titular")
	ls_fono				= dw_bitacora_c.getitemstring(ll_row, "telefono_titular")
	ls_orden_comp		= dw_bitacora_c.getitemstring(ll_row, "orden_compra")
	ls_cod_vendedor	= dw_bitacora_c.getitemstring(ll_row, "codigo_vendedor")
	ls_funeraria			= dw_bitacora_c.getitemstring(ll_row, "funeraria")
	ls_cor_np			= dw_bitacora_c.getitemstring(ll_row, "coordinador_np")
	ll_rut_fall				= dw_bitacora_c.GetItemNumber(ll_row, "rut_fallecido")
	ls_nom_fall			= dw_bitacora_c.getitemstring(ll_row, "nombre_fallecido")
	ls_pat_fall			= dw_bitacora_c.getitemstring(ll_row, "ap_pat_fallecido")
	ls_mat_fall			= dw_bitacora_c.getitemstring(ll_row, "ap_mat_fallecido")
	ls_dv_cliente		= dw_bitacora_c.getitemstring(ll_row, "dv_titular")
	ls_dv_fall				= dw_bitacora_c.getitemstring(ll_row, "dv_fallecido")
	ls_defun_dire		= dw_bitacora_det.getitemstring(ll_row, "defuncion_direccion")
	ls_defun_fech		= dw_bitacora_det.getitemstring(ll_row, "defuncion_fecha")
	ls_defun_hora		= dw_bitacora_det.getitemnumber(ll_row, "defuncion_hora")
	ls_defun_minu		= dw_bitacora_det.getitemnumber(ll_row, "defuncion_minuto")
	ls_sal_inst_dire		= dw_bitacora_det.getitemstring(ll_row, "salida_instalacion_direccion")
	ls_sal_inst_fech	= dw_bitacora_det.getitemstring(ll_row, "salida_instalacion_fecha")
	ls_sal_inst_hora	= dw_bitacora_det.getitemnumber(ll_row, "salida_instalacion_hora")
	ls_sal_inst_minu	= dw_bitacora_det.getitemnumber(ll_row, "salida_instalacion_minuto")
	ls_lleg_inst_dire	= dw_bitacora_det.getitemstring(ll_row, "llegada_instalacion_direccion")
	ls_lleg_inst_fech	= dw_bitacora_det.getitemstring(ll_row, "llegada_instalacion_fecha")
	ls_lleg_inst_hora	= dw_bitacora_det.getitemnumber(ll_row, "llegada_instalacion_hora")
	ls_lleg_inst_minu	= dw_bitacora_det.getitemnumber(ll_row, "llegada_instalacion_minuto")
	ls_lleg_vel_dire		= dw_bitacora_det.getitemstring(ll_row, "llegada_velacion_direccion")
	ls_lleg_vel_fech	= dw_bitacora_det.getitemstring(ll_row, "llegada_velacion_fecha")
	ls_lleg_vel_hora	= dw_bitacora_det.getitemnumber(ll_row, "llegada_velacion_hora")
	ls_lleg_vel_minu	= dw_bitacora_det.getitemnumber(ll_row, "llegada_velacion_minuto")
	ls_responso_dire	= dw_bitacora_det.getitemstring(ll_row, "responso_direccion")
	ls_responso_fech	= dw_bitacora_det.getitemstring(ll_row, "responso_fecha")
	ls_responso_hora	= dw_bitacora_det.getitemnumber(ll_row, "responso_hora")
	ls_responso_minu	= dw_bitacora_det.getitemnumber(ll_row, "responso_minuto")
	ls_serv_home_dire	= dw_bitacora_det.getitemstring(ll_row, "servicio_homenaje_direccion")
	ls_serv_home_fech	= dw_bitacora_det.getitemstring(ll_row, "servicio_homenaje_fecha")
	ls_serv_home_hora	= dw_bitacora_det.getitemstring(ll_row, "servicio_homenaje_hora")
	ls_serv_home_minu	= dw_bitacora_det.getitemstring(ll_row, "servicio_homenaje_minuto")
	ls_lleg_carroza_dire	= dw_bitacora_det.getitemstring(ll_row, "llegada_carroza_direccion")
	ls_lleg_carroza_fech	= dw_bitacora_det.getitemstring(ll_row, "llegada_carroza_fecha")
	ls_lleg_carroza_hora	= dw_bitacora_det.getitemnumber(ll_row, "llegada_carroza_hora")
	ls_lleg_carroza_minu	= dw_bitacora_det.getitemnumber(ll_row, "llegada_carroza_minuto")
	ll_lleg_parque			= dw_bitacora_det.getitemnumber(ll_row, "llegada_cementerio_parque")
	ls_lleg_cemen_fech	= dw_bitacora_det.getitemstring(ll_row, "llegada_cementerio_fecha")
	ls_lleg_cemen_hora	= dw_bitacora_det.getitemnumber(ll_row, "llegada_cementerio_hora")
	ls_lleg_cemen_minu	= dw_bitacora_det.getitemnumber(ll_row, "llegada_cementerio_minuto")
	ls_lugar_sepultura		= dw_bitacora_det.getitemstring(ll_row, "lugar_sepultura")
	ls_observacion			= dw_bitacora_det.getitemstring(ll_row, "Observacion")
	if dw_bitacora_c.update() = 1 then
		commit;
		if sqlca.sqlcode = 0 then
			commit using sqlca;			
			if dw_bitacora_det.update() = 1 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
				il_mod = 0
			else
				rollback;
			end if	
		else
			rollback;
		end if
	else
		rollback using sqlca;
	end if
end if	

end event

type dw_bitacora_det from datawindow within w_ingreso_bitacora
integer x = 14
integer y = 496
integer width = 3081
integer height = 1124
integer taborder = 20
string title = "none"
string dataobject = "dw_bitacora_det"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_columna,ls_fecha_def,ls_fecha_sal_ins,ls_fecha_lleg_ins,ls_fecha_lleg_ival,ls_fecha,ls_defcha_def
long	ll_hora, ll_minutos,ll_hora_1,ll_minuto_1
date	ld_fecha_sep,ldt_fecha_1
datetime ldt_fecha_valida

il_mod++
dw_bitacora_det.accepttext()
ls_columna				= dwo.name

ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(dw_bitacora_det.getrow(),'defuncion_fecha')))
ld_fecha_sep			= date(dw_bitacora_det.getitemdatetime(dw_bitacora_det.getrow(),'defuncion_fecha'))

if ls_columna = 'defuncion_fecha' then		
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'defuncion_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
		dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'defuncion_fecha',gd_hoy)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('defuncion_fecha')
		return
	end if
	if ls_columna='defuncion_fecha' then
		is_modif	= 'S'
	end if
	
end if
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'salida_instalacion_fecha')))
if ls_columna = 'salida_instalacion_fecha' then
	if date(dw_bitacora_det.getitemdatetime(1,'salida_instalacion_fecha')) >= ld_fecha_sep then		
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'salida_instalacion_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'salida_instalacion_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('salida_instalacion_fecha')
			return
		end if
	else
		messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'salida_instalacion_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('salida_instalacion_fecha')	
	end if	
	if ls_columna='salida_instalacion_fecha' then
		is_modif_2	= 'S'
	end if
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'llegada_instalacion_fecha')))
if ls_columna = 'llegada_instalacion_fecha' then
	if date(dw_bitacora_det.getitemdatetime(1,'llegada_instalacion_fecha')) >= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'llegada_instalacion_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'llegada_instalacion_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_instalacion_fecha')
			return
		end if
	else
		messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_instalacion_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_instalacion_fecha')	
	end if
	if ls_columna='llegada_instalacion_fecha' then
		is_modif_3	= 'S'
	end if
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'llegada_velacion_fecha')))
if ls_columna = 'llegada_velacion_fecha' then
	if date(dw_bitacora_det.getitemdatetime(1,'llegada_velacion_fecha')) >= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'llegada_velacion_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'llegada_velacion_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_velacion_fecha')
			return
		end if
	else
		messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_velacion_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_velacion_fecha')		
	end if
	if ls_columna='llegada_velacion_fecha' then
		is_modif_4	= 'S'
	end if
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'responso_fecha')))
if ls_columna = 'responso_fecha' then
	if date(dw_bitacora_det.getitemdatetime(1,'responso_fecha') )>= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'responso_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'responso_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('responso_fecha')
			return
		end if
	else
		messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'responso_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('responso_fecha')			
	end if
	if ls_columna='responso_fecha' then
		is_modif_5	= 'S'
	end if
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'servicio_homenaje_fecha')))
if ls_columna = 'servicio_homenaje_fecha' then
	if date(dw_bitacora_det.getitemdatetime(1,'servicio_homenaje_fecha')) >= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'servicio_homenaje_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'servicio_homenaje_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('servicio_homenaje_fecha')
			return
		end if
	else
		messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'servicio_homenaje_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('servicio_homenaje_fecha')		
	end if	
	if ls_columna='servicio_homenaje_fecha' then
		is_modif_6	= 'S'
	end if
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'llegada_carroza_fecha')))
if ls_columna = 'llegada_carroza_fecha' then
	if date(dw_bitacora_det.getitemdatetime(1,'llegada_carroza_fecha')) >= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'llegada_carroza_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'llegada_carroza_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_carroza_fecha')
			return
		end if
	else
		messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_carroza_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_carroza_fecha')		
	end if	
	if ls_columna='llegada_carroza_fecha' then
		is_modif_7	= 'S'
	end if
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'llegada_cementerio_fecha')))
if ls_columna = 'llegada_cementerio_fecha' then
	if date(dw_bitacora_det.getitemdatetime(1,'llegada_cementerio_fecha')) >= ld_fecha_sep then
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'llegada_cementerio_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'llegada_cementerio_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_cementerio_fecha')
			return
		end if
	else	
		messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_cementerio_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_cementerio_fecha')	
	end if
	if ls_columna='llegada_cementerio_fecha' then
		is_modif_8	= 'S'
	end if
end if	

if ls_columna='defuncion_hora' then
	ll_hora		= dw_bitacora_det.getitemnumber(dw_bitacora_det.getrow(), "defuncion_hora")
	if ll_hora>23 or ll_hora <8  then
		ll_hora		= 0
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(dw_bitacora_det.getrow(),'defuncion_hora',ll_hora)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('defuncion_hora')
	end if	
end if
if ls_columna='salida_instalacion_hora' then
	ll_hora	= dw_bitacora_det.getitemnumber(dw_bitacora_det.getrow(),'salida_instalacion_hora')
	if ll_hora>23 or ll_hora <8 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'salida_instalacion_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('salida_instalacion_hora')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'salida_instalacion_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'salida_instalacion_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'salida_instalacion_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'salida_instalacion_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'salida_instalacion_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('salida_instalacion_fecha')
		end if	
	end if
end if
if ls_columna='llegada_instalacion_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'llegada_instalacion_hora')
	if ll_hora>23 or ll_hora <8 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'llegada_instalacion_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_instalacion_hora')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'llegada_instalacion_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'llegada_instalacion_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'llegada_instalacion_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'llegada_instalacion_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'llegada_instalacion_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_instalacion_fecha')
		end if		
	end if
end if
if ls_columna='llegada_velacion_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'llegada_velacion_hora')
	if ll_hora>23 or ll_hora <8 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'llegada_velacion_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_velacion_hora')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'llegada_velacion_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'llegada_velacion_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'llegada_velacion_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'llegada_velacion_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'llegada_velacion_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_velacion_fecha')
		end if		
	end if
end if
if ls_columna='responso_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'responso_hora')
	if ll_hora>23 or ll_hora <8 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'responso_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('responso_hora')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'responso_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'responso_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'responso_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'responso_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'responso_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('responso_fecha')
		end if	
	end if
end if
if ls_columna='servicio_homenaje_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'servicio_homenaje_hora')
	if ll_hora>23 or ll_hora <8 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'servicio_homenaje_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('servicio_homenaje_hora')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'servicio_homenaje_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'servicio_homenaje_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'servicio_homenaje_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'servicio_homenaje_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'servicio_homenaje_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('servicio_homenaje_fecha')
		end if	
	end if
end if
if ls_columna='llegada_carroza_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'llegada_carroza_hora')
	if ll_hora>23 or ll_hora <8 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'llegada_carroza_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_carroza_hora')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'llegada_carroza_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'llegada_carroza_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'llegada_carroza_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'llegada_carroza_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'llegada_carroza_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_carroza_fecha')
		end if		
	end if
end if
if ls_columna='llegada_cementerio_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'llegada_cementerio_hora')
	if ll_hora>23 or ll_hora <8 then
		messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'llegada_cementerio_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_cementerio_hora')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'llegada_cementerio_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'llegada_cementerio_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'llegada_cementerio_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'llegada_cementerio_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'llegada_cementerio_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_cementerio_fecha')
		end if			
	end if
end if
if ls_columna='defuncion_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'defuncion_minuto')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'defuncion_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('defuncion_minuto')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'defuncion_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'defuncion_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'defuncion_minuto')
		idt_fecha_sep	= datetime(string(ldt_fecha_1)+' '+string(ll_hora_1)+':'+string(ll_minuto_1)+':'+'00')
	end if
end if
if ls_columna='salida_instalacion_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'salida_instalacion_minuto')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'salida_instalacion_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('salida_instalacion_minuto')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'salida_instalacion_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'salida_instalacion_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'salida_instalacion_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'salida_instalacion_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'salida_instalacion_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('salida_instalacion_hora')
		end if	
	end if
end if
if ls_columna='llegada_instalacion_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'llegada_instalacion_minuto')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'llegada_instalacion_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_instalacion_minuto')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'llegada_instalacion_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'llegada_instalacion_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'llegada_instalacion_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'llegada_instalacion_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'llegada_instalacion_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_instalacion_hora')
		end if		
	end if
end if
if ls_columna='llegada_velacion_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'llegada_velacion_minuto')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'llegada_velacion_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_velacion_minuto')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'llegada_velacion_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'llegada_velacion_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'llegada_velacion_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'llegada_velacion_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'llegada_velacion_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_velacion_hora')
		end if			
	end if
end if
if ls_columna='responso_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'responso_minuto')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'responso_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('responso_minuto')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'responso_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'responso_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'responso_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'responso_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'responso_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('responso_hora')
		end if				
	end if
end if
if ls_columna='servicio_homenaje_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'servicio_homenaje_minuto')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'servicio_homenaje_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('servicio_homenaje_minuto')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'servicio_homenaje_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'servicio_homenaje_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'servicio_homenaje_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'servicio_homenaje_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'servicio_homenaje_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('servicio_homenaje_hora')
		end if			
	end if
end if
if ls_columna='llegada_carroza_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'llegada_carroza_minuto')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'llegada_carroza_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_carroza_minuto')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'llegada_carroza_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'llegada_carroza_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'llegada_carroza_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'llegada_carroza_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'llegada_carroza_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_carroza_hora')
		end if				
	end if
end if
if ls_columna='llegada_cementerio_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'llegada_cementerio_minuto')
	if ll_minutos>59 then
		messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'llegada_cementerio_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_cementerio_minuto')
	else
		ldt_fecha_1		= date(dw_bitacora_det.getitemdatetime(1,'llegada_cementerio_fecha'))
		ll_hora_1			= dw_bitacora_det.getitemnumber(1,'llegada_cementerio_hora')
		ll_minuto_1		= dw_bitacora_det.getitemnumber(1,'llegada_cementerio_minuto')
		ldt_fecha_valida	= datetime(string(ldt_fecha_1)+':'+string(ll_hora_1)+':'+string(ll_minuto_1)+'/'+'00') 
		if ldt_fecha_valida < idt_fecha_sep then
			messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
			this.setitem(this.getrow(),'llegada_cementerio_fecha',ld_fecha_sep)
			this.setitem(this.getrow(),'llegada_cementerio_hora',0)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_cementerio_hora')
		end if					
	end if
end if
ll_hora		= dw_bitacora_det.getitemnumber(dw_bitacora_det.getrow(), "defuncion_hora")
dw_bitacora_det.accepttext()

end event

event clicked;string	ls_fecha_def,ls_fecha_sal_ins,ls_fecha_lleg_ins,ls_fecha_lleg_ival


ls_fecha_def	= string(date(dw_bitacora_det.getitemdatetime(dw_bitacora_det.getrow(),'defuncion_fecha')))
if isnull(ls_fecha_def) then ls_fecha_def = string(today(),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha_def)=-1 then 
	dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'defuncion_fecha',datetime(string(today(),gs_formato_fecha)))
	return
end if
this.accepttext()

ls_fecha_sal_ins	= string(date(dw_bitacora_det.getitemdatetime(dw_bitacora_det.getrow(),'salida_instalacion_fecha')))
if isnull(ls_fecha_sal_ins) then ls_fecha_sal_ins = string(today(),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha_sal_ins)=-1 then 
	dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'salida_instalacion_fecha',datetime(string(today(),gs_formato_fecha)))
	return
end if
this.accepttext()


ls_fecha_lleg_ins	= string(date(dw_bitacora_det.getitemdatetime(dw_bitacora_det.getrow(),'defuncion_fecha')))
if isnull(ls_fecha_lleg_ins) then ls_fecha_def = string(today(),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha_lleg_ins)=-1 then 
	dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'defuncion_fecha',datetime(string(today(),gs_formato_fecha)))
	return
end if
this.accepttext()

ls_fecha_lleg_ival	= string(date(dw_bitacora_det.getitemdatetime(dw_bitacora_det.getrow(),'salida_instalacion_fecha')))
if isnull(ls_fecha_lleg_ival) then ls_fecha_sal_ins = string(today(),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha_lleg_ival)=-1 then 
	dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'salida_instalacion_fecha',datetime(string(today(),gs_formato_fecha)))
	return
end if
this.accepttext()
end event

event itemfocuschanged;string	ls_columna,ls_fecha_def,ls_fecha_sal_ins,ls_fecha_lleg_ins,ls_fecha_lleg_ival,ls_fecha,ls_defcha_def
long	ll_hora, ll_minutos
date	ld_fecha_sep

dw_bitacora_det.accepttext()
ls_columna				= dwo.name

ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(dw_bitacora_det.getrow(),'defuncion_fecha')))
ld_fecha_sep			= date(dw_bitacora_det.getitemdatetime(dw_bitacora_det.getrow(),'defuncion_fecha'))

if ls_columna <> 'defuncion_fecha' and is_modif = 'S' then		
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'defuncion_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
		dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'defuncion_fecha',gd_hoy)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('defuncion_fecha')
		is_modif = 'N'
		return
	else
		is_modif = 'N'
	end if	
end if
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'salida_instalacion_fecha')))
if ls_columna <> 'salida_instalacion_fecha' and is_modif_2 = 'S' then
	if date(dw_bitacora_det.getitemdatetime(1,'salida_instalacion_fecha')) >= ld_fecha_sep then		
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'salida_instalacion_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'salida_instalacion_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('salida_instalacion_fecha')
			is_modif_2 = 'N' 
			return
		else
			is_modif_2 = 'N'
		end if
	else
		//messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'salida_instalacion_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('salida_instalacion_fecha')
		is_modif_2 = 'N' 
	end if	
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'llegada_instalacion_fecha')))
if ls_columna <> 'llegada_instalacion_fecha' and is_modif_3 = 'S' then
	if date(dw_bitacora_det.getitemdatetime(1,'llegada_instalacion_fecha')) >= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'llegada_instalacion_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'llegada_instalacion_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_instalacion_fecha')
			is_modif_3 = 'N' 
			return
		else
			is_modif_3 = 'N'
		end if
	else
	//	messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_instalacion_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_instalacion_fecha')	
		is_modif_3 = 'N' 
	end if	
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'llegada_velacion_fecha')))
if ls_columna <> 'llegada_velacion_fecha' and is_modif_4 = 'S' then
	if date(dw_bitacora_det.getitemdatetime(1,'llegada_velacion_fecha')) >= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'llegada_velacion_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'llegada_velacion_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_velacion_fecha')
			is_modif_4 = 'N' 
			return
		else
			is_modif_4 = 'N'
		end if
	else
		//messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_velacion_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_velacion_fecha')	
		is_modif_4 = 'N' 
	end if	
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'responso_fecha')))
if ls_columna <> 'responso_fecha' and is_modif_5 = 'S' then
	if date(dw_bitacora_det.getitemdatetime(1,'responso_fecha') )>= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'responso_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'responso_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('responso_fecha')
			is_modif_5 = 'N' 
			return
		else
			is_modif_5 = 'N'
		end if
	else
		//messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_velacion_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_velacion_fecha')	
		is_modif_5 = 'N'
	end if	
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'servicio_homenaje_fecha')))
if ls_columna <> 'servicio_homenaje_fecha' and is_modif_6 = 'S' then
	if date(dw_bitacora_det.getitemdatetime(1,'servicio_homenaje_fecha')) >= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'servicio_homenaje_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'servicio_homenaje_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('servicio_homenaje_fecha')
			is_modif_6 = 'N' 
			return
		else
			is_modif_6 = 'N'
		end if
	else
		//messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'servicio_homenaje_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('servicio_homenaje_fecha')		
		is_modif_6 = 'N' 
	end if	
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'llegada_carroza_fecha')))
if ls_columna <> 'llegada_carroza_fecha'  and is_modif_7 = 'S' then
	if date(dw_bitacora_det.getitemdatetime(1,'servicio_homenaje_fecha')) >= ld_fecha_sep then	
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'llegada_carroza_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'llegada_carroza_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_carroza_fecha')
			is_modif_7 = 'N' 
			return
		else
			is_modif_7 = 'N'
		end if
	else
		//messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_carroza_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_carroza_fecha')
		is_modif_7 = 'N' 
	end if	
end if	
ls_fecha					= string(date(dw_bitacora_det.getitemdatetime(1,'llegada_cementerio_fecha')))
if ls_columna <> 'llegada_cementerio_fecha' and is_modif_8 = 'S' then
	if date(dw_bitacora_det.getitemdatetime(1,'llegada_cementerio_fecha')) >= ld_fecha_sep then
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_bitacora_det.setitem(1,'llegada_cementerio_fecha',datetime(string(ls_fecha,gs_formato_fecha)))
			dw_bitacora_det.setitem(dw_bitacora_det.getrow(),'llegada_cementerio_fecha',gd_hoy)
			dw_bitacora_det.accepttext()
			dw_bitacora_det.setfocus()
			dw_bitacora_det.setcolumn('llegada_cementerio_fecha')
			is_modif_8 = 'N' 
			return
		else
			is_modif_8 = 'N'
		end if
	else	
		//messagebox("Advertencia","La fecha no puede ser Menor a la Fecha de Sepultación")
		this.setitem(this.getrow(),'llegada_cementerio_fecha',ld_fecha_sep)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_cementerio_fecha')	
		is_modif_8 = 'N' 
	end if	
end if	
if ls_columna='defuncion_hora' then
	ll_hora		= dw_bitacora_det.getitemnumber(dw_bitacora_det.getrow(), "defuncion_hora")
	if ll_hora>23 or ll_hora <8 then
	//	messagebox("Advertencia","Hora Incorrecta")
		//ll_hora		= 0
		this.setitem(this.getrow(),'defuncion_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('defuncion_hora')
	end if
end if
if ls_columna<>'salida_instalacion_hora' then
	ll_hora	= dw_bitacora_det.getitemnumber(dw_bitacora_det.getrow(),'salida_instalacion_hora')
	if ll_hora>23 or ll_hora <8 then
	//	messagebox("Advertencia","Hora Incorrecta")
		ll_hora = 0
		this.setitem(this.getrow(),'salida_instalacion_hora',ll_hora)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('salida_instalacion_hora')		
	end if
end if
if ls_columna<>'llegada_instalacion_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'llegada_instalacion_hora')
	if ll_hora>23 or ll_hora <8 then
	//	messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'llegada_instalacion_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_instalacion_hora')
	end if
end if
if ls_columna<>'llegada_velacion_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'llegada_velacion_hora')
	if ll_hora>23 or ll_hora <8 then
	//	messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'llegada_velacion_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_velacion_hora')
	end if
end if
if ls_columna<>'responso_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'responso_hora')
	if ll_hora>23 or ll_hora <8 then
	//	messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'responso_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('responso_hora')
	end if
end if
if ls_columna<>'servicio_homenaje_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'servicio_homenaje_hora')
	if ll_hora>23 or ll_hora <8 then
		//messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'servicio_homenaje_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('servicio_homenaje_hora')
	end if
end if
if ls_columna<>'llegada_carroza_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'llegada_carroza_hora')
	if ll_hora>23 or ll_hora <8 then
	//	messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'llegada_carroza_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_carroza_hora')
	end if
end if
if ls_columna<>'llegada_cementerio_hora' then
	ll_hora	= this.getitemnumber(this.getrow(),'llegada_cementerio_hora')
	if ll_hora>23 or ll_hora <8 then
	//	messagebox("Advertencia","Hora Incorrecta")
		this.setitem(this.getrow(),'llegada_cementerio_hora',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_cementerio_hora')
	end if
end if
if ls_columna<>'defuncion_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'defuncion_minuto')
	if ll_minutos>59 then
	//	messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'defuncion_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('defuncion_minuto')
	end if
end if
if ls_columna<>'salida_instalacion_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'salida_instalacion_minuto')
	if ll_minutos>59 then
	//	messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'salida_instalacion_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('salida_instalacion_minuto')
	end if
end if
if ls_columna<>'llegada_instalacion_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'llegada_instalacion_minuto')
	if ll_minutos>59 then
	//	messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'llegada_instalacion_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_instalacion_minuto')
	end if
end if
if ls_columna<>'llegada_velacion_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'llegada_velacion_minuto')
	if ll_minutos>59 then
	//	messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'llegada_velacion_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_velacion_minuto')
	end if
end if
if ls_columna<>'responso_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'responso_minuto')
	if ll_minutos>59 then
	//	messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'responso_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('responso_minuto')
	end if
end if
if ls_columna<>'servicio_homenaje_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'servicio_homenaje_minuto')
	if ll_minutos>59 then
	//	messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'servicio_homenaje_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('servicio_homenaje_minuto')
	end if
end if
if ls_columna<>'llegada_carroza_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'llegada_carroza_minuto')
	if ll_minutos>59 then
	//	messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'llegada_carroza_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_carroza_minuto')
	end if
end if
if ls_columna<>'llegada_cementerio_minuto' then
	ll_minutos	= this.getitemnumber(this.getrow(),'llegada_cementerio_minuto')
	if ll_minutos>59 then
	//	messagebox("Advertencia","Minutos Incorrecto")
		this.setitem(this.getrow(),'llegada_cementerio_minuto',0)
		dw_bitacora_det.accepttext()
		dw_bitacora_det.setfocus()
		dw_bitacora_det.setcolumn('llegada_cementerio_minuto')
	end if
end if
is_modif = 'N' 
end event

type dw_bitacora_c from datawindow within w_ingreso_bitacora
integer x = 18
integer y = 48
integer width = 3072
integer height = 444
integer taborder = 10
string title = "none"
string dataobject = "dw_bitacora_cab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

