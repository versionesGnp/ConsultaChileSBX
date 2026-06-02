forward
global type w_no_oferta from window
end type
type cb_cancelar from commandbutton within w_no_oferta
end type
type st_3 from statictext within w_no_oferta
end type
type sle_numero from singlelineedit within w_no_oferta
end type
type st_2 from statictext within w_no_oferta
end type
type st_1 from statictext within w_no_oferta
end type
type sle_serie from singlelineedit within w_no_oferta
end type
type cb_aceptar from commandbutton within w_no_oferta
end type
type p_1 from picture within w_no_oferta
end type
end forward

global type w_no_oferta from window
integer x = 1074
integer y = 484
integer width = 1769
integer height = 592
boolean titlebar = true
string title = "Ingreso de Ofertas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_cancelar cb_cancelar
st_3 st_3
sle_numero sle_numero
st_2 st_2
st_1 st_1
sle_serie sle_serie
cb_aceptar cb_aceptar
p_1 p_1
end type
global w_no_oferta w_no_oferta

on w_no_oferta.create
this.cb_cancelar=create cb_cancelar
this.st_3=create st_3
this.sle_numero=create sle_numero
this.st_2=create st_2
this.st_1=create st_1
this.sle_serie=create sle_serie
this.cb_aceptar=create cb_aceptar
this.p_1=create p_1
this.Control[]={this.cb_cancelar,&
this.st_3,&
this.sle_numero,&
this.st_2,&
this.st_1,&
this.sle_serie,&
this.cb_aceptar,&
this.p_1}
end on

on w_no_oferta.destroy
destroy(this.cb_cancelar)
destroy(this.st_3)
destroy(this.sle_numero)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_serie)
destroy(this.cb_aceptar)
destroy(this.p_1)
end on

event open;gf_centrar(w_no_oferta)
end event

type cb_cancelar from commandbutton within w_no_oferta
integer x = 1362
integer y = 340
integer width = 329
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;
Close(w_no_oferta)
end event

type st_3 from statictext within w_no_oferta
integer x = 475
integer y = 64
integer width = 1061
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Ingreso de Promesa"
boolean focusrectangle = false
end type

type sle_numero from singlelineedit within w_no_oferta
integer x = 846
integer y = 352
integer width = 425
integer height = 92
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_no_oferta
integer x = 480
integer y = 368
integer width = 325
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Nº Oferta"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_no_oferta
integer x = 640
integer y = 252
integer width = 165
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_serie from singlelineedit within w_no_oferta
event ue_tecla pbm_keyup
integer x = 846
integer y = 240
integer width = 165
integer height = 92
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

event ue_tecla;if len(sle_serie.text)=1 then sle_numero.setfocus()
end event

type cb_aceptar from commandbutton within w_no_oferta
integer x = 1362
integer y = 216
integer width = 329
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;//string	is_serie, is_serie2
//long 		ll_numero,ll_count_reg
//
//if isvalid(w_ingresar_oferta) then 
//	is_serie 	= sle_serie.Text
//	ll_numero 	= long(sle_numero.text)
//	SELECT 	"CONTRATOS_E"."COD_SUP",   
//				"CONTRATOS_E"."COD_AGE",
//				"CONTRATOS_E"."SERIE" ,
//				"CONTRATOS_E"."COD_JEF" 
//	INTO 		:gs_sup,   
//				:gs_age,
//				:is_serie2,
//				:gs_jefe
//	FROM 		"CONTRATOS_E"  
//	WHERE  ( "CONTRATOS_E"."SERIE" = :is_serie ) AND  
//			 ( "CONTRATOS_E"."NRO_OFERTA" = :ll_numero ) AND  
//			 ( "CONTRATOS_E"."ESTADO" = 'V' );    
//	IF is_serie = is_serie2 THEN
//		gi_numero	= ll_numero
//		gs_serie 	= is_serie
//		gs_base 		= "O"
//	///////////////////////////////////////////////	
//		long		ll_cant
//		//datetime ld_fecha, ld_null
//		date 		ld_fecha, ld_null
//		date 		id_fecha
//		double 	ld_valor_uf
//		string 	ls_null
//		long 		ll_null
//		ld_fecha 				= gd_tiempo_serv
//		SetNull(ld_null);SetNull(ls_null);SetNull(ll_null)
//		ll_cant 					= w_ingresar_oferta.dw_oferta_v.Retrieve(gs_serie,gi_numero)
//		IF ll_cant = 0 THEN
//			w_ingresar_oferta.cb_aceptar.text 													= "Ingresar"
//			w_ingresar_oferta.dw_oferta_v.InsertRow(0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "serie", gs_serie)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "nro_oferta", gi_numero)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "ult_folio", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "fecha", ld_fecha)
//			w_ingresar_oferta.em_rut.text															= ''
//			w_ingresar_oferta.em_dv.text															= ''
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "rut", ll_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_age_ant", gs_age)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_age", gs_age)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_sup", gs_sup)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_jef", gs_jefe)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "cod_emp", "0")
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "contacto", gs_age)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "age_ant", "0")
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "tipo_sepult", ls_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "tipo_cons", ls_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "tipo_venta", ls_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "uso", ls_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "tot_pagado", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "cta_pag_s", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "cta_pag_m", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "valor_cuota_m", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "fecha_m", ld_fecha)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "abono_c", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "abono_m", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "tot_pagado_m", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "abono_d", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "lugar_v", ls_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "titulo", "0")
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "estado_comi", "N")
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "estado_premio", "N")
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "usuario", gs_user)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "fecha_ingreso", ld_fecha)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "forma_pago", ls_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "fecha_cierre", ld_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "uf_cierre", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "fecha_com", ld_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "total_com", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "por_ingre", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_ing", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "tipo_mant", "N")
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "nro_resc", "0")
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "origen", ls_null)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "estado", "0")
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_venta", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_ubicacion", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_adicional", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_manperpe", 0)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1, "porce_sup", 1)
//			w_ingresar_oferta.dw_oferta_v.Object.rut_institucional.TabSequence		= 0
//			w_ingresar_oferta.dw_oferta_v.Object.compute_0050.TabSequence 				= 0	
//		ELSE
//			w_ingresar_oferta.cb_aceptar.text 													= "Actualizar"
//			gi_rut 																						= Long(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut"))
//			w_ingresar_oferta.dw_clientes.Retrieve(gi_rut)
//			w_ingresar_oferta.dw_oferta_v.SetItem(1,"compute",upper(w_ingresar_oferta.dw_clientes.GetItemstring(1,"dv")))
//			w_ingresar_oferta.em_rut.text															= string(gi_rut)
//			w_ingresar_oferta.em_dv.text															= string(upper(w_ingresar_oferta.dw_clientes.GetItemstring(1,"dv")))
//			if w_ingresar_oferta.dw_oferta_v.GetItemstring(1, "tipo_venta") = '6' then
//				w_ingresar_oferta.dw_oferta_v.Object.rut_institucional.TabSequence	= 130
//				w_ingresar_oferta.dw_oferta_v.Object.compute_0050.TabSequence 			= 140
//			else
//				w_ingresar_oferta.dw_oferta_v.Object.rut_institucional.TabSequence 	= 0
//				w_ingresar_oferta.dw_oferta_v.Object.compute_0050.TabSequence 			= 0
//			end if
//			w_ingresar_oferta.dw_oferta_v.setitem(1,'compute_0050',gf_obtener_dv(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut_institucional")))
//			w_ingresar_oferta.dw_oferta_v.setitem(1,'compute_0053',gf_obtener_dv(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut_aval")))
//			w_ingresar_oferta.dw_oferta_v.setitem(1,'compute_0055',gf_obtener_dv(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut_funeraria")))
//			w_ingresar_oferta.dw_oferta_v.setitem(1,'compute',gf_obtener_dv(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut")))
//		END IF
//	//	w_ingresar_oferta.dw_pago_oferta.SetTransObject(SQLCA)
//		ll_cant = w_ingresar_oferta.dw_pago_oferta.Retrieve(gs_serie,gi_numero)
//		IF ll_cant = 0 THEN
//			w_ingresar_oferta.dw_pago_oferta.InsertRow(0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "serie", gs_serie)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "nro_oferta", gi_numero)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "fecha", ld_fecha)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "folio", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "precio", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "pie", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "tasa", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "capacidad", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "n_reduccion", ls_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "valor_cuota", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "des_esp", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "nro_cuotas", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "uf_dia", gd_uf_dia)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "moneda", ls_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "fecha_prim", ld_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "fecha_ult", ld_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "fecha_entre", ld_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "fecha_pie", ld_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "modificado", mid(gs_nombre_usuario,1,4))
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "fecha_mod", ld_fecha)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "area", ls_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "parque", gi_cod_parque)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "sector", "0")
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "sepultura", ls_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "derecho_lib", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "gastos_adm", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "factura", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "fecha_fact", ld_null)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "total_fact", 0)
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "carta_bienv", "N")
//			w_ingresar_oferta.dw_pago_oferta.SetItem(1, "pie_pagado", 0)
//		END IF
//	//	w_ingresar_oferta.dw_beneficiarios.SetTransObject(SQLCA)
//		ll_cant					= w_ingresar_oferta.dw_beneficiarios.Retrieve(gs_serie,gi_numero)
//		IF ll_cant >0 THEN
//			w_ingresar_oferta.cb_borrar.Enabled	= True
//		END IF
//		SELECT	Count("PAGARE_V"."SERIE")  
//		INTO 		:ll_count_reg  
//		FROM 		"PAGARE_V"  
//		WHERE  ( "PAGARE_V"."SERIE" = :gs_serie ) AND  
//				 ( "PAGARE_V"."NUMERO" = :gi_numero )   
//		Using		sqlca;
//		if ll_count_reg>0 then 
//			w_ingresar_oferta.st_pagare.italic	= true
//		else
//			w_ingresar_oferta.st_pagare.italic	= false
//		end if
//	//////////////////////////////////////////////////////
//	
//		Close(w_no_oferta)
//	//	Open(w_ingresar_oferta)
//		setnull(gi_numero)
//		setnull(gs_serie)
//		w_ingresar_oferta.setfocus()
//	ELSE
//		MessageBox("Asignación de Ofertas", "Serie o número de Oferta no válida o no asignada !")
//		sle_numero.setfocus()
//	END IF
//end if
end event

type p_1 from picture within w_no_oferta
integer x = 41
integer y = 36
integer width = 389
integer height = 416
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

