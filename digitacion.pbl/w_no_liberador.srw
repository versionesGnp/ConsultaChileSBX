forward
global type w_no_liberador from window
end type
type cb_cancelar from commandbutton within w_no_liberador
end type
type st_3 from statictext within w_no_liberador
end type
type sle_numero from singlelineedit within w_no_liberador
end type
type st_2 from statictext within w_no_liberador
end type
type st_1 from statictext within w_no_liberador
end type
type sle_serie from singlelineedit within w_no_liberador
end type
type cb_aceptar from commandbutton within w_no_liberador
end type
type p_1 from picture within w_no_liberador
end type
end forward

global type w_no_liberador from window
integer x = 1074
integer y = 484
integer width = 1769
integer height = 592
boolean titlebar = true
string title = "Ingreso de Anexo Liberador"
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
global w_no_liberador w_no_liberador

on w_no_liberador.create
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

on w_no_liberador.destroy
destroy(this.cb_cancelar)
destroy(this.st_3)
destroy(this.sle_numero)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_serie)
destroy(this.cb_aceptar)
destroy(this.p_1)
end on

event open;gf_centrar(w_no_liberador)
end event

type cb_cancelar from commandbutton within w_no_liberador
integer x = 1326
integer y = 340
integer width = 357
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;
Close(w_no_liberador)
end event

type st_3 from statictext within w_no_liberador
integer x = 475
integer y = 64
integer width = 1097
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 79741120
boolean enabled = false
string text = "Ingreso de Liberador"
boolean focusrectangle = false
end type

type sle_numero from singlelineedit within w_no_liberador
integer x = 841
integer y = 352
integer width = 425
integer height = 92
integer taborder = 10
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_no_liberador
integer x = 485
integer y = 368
integer width = 334
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Nº Anexo"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_no_liberador
integer x = 617
integer y = 252
integer width = 201
integer height = 76
integer textsize = -10
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

type sle_serie from singlelineedit within w_no_liberador
integer x = 841
integer y = 240
integer width = 165
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = "L"
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type cb_aceptar from commandbutton within w_no_liberador
integer x = 1326
integer y = 216
integer width = 357
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;//string		is_serie, is_serie2
//long 			ll_numero
//long		ll_cant,ll_null
//datetime	ld_fecha, ld_null
//string 	ls_null
//
//if isvalid(w_ingresar_liberador) then
//	w_ingresar_liberador.cb_aceptar.enabled	= true
//	is_serie		= trim(sle_serie.Text)
//	ll_numero 	= long(sle_numero.text)
//	SELECT	"CONTRATOS_E"."COD_SUP",   
//				"CONTRATOS_E"."COD_AGE",
//				"CONTRATOS_E"."SERIE" ,
//				"CONTRATOS_E"."COD_JEF" 
//	 INTO 	:gs_sup,   
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
//		gs_base 		= "L"
//////////////////////////////////////////////////////////////////////////	
//		if isvalid(w_ingresar_liberador) then
//			ld_fecha 	= DateTime(Today())
//			SetNull(ld_null);SetNull(ls_null);SetNull(ll_null)
//			ll_cant 		= w_ingresar_liberador.dw_anexo_liberador.Retrieve(gs_serie,gi_numero)
//			IF ll_cant = 0 THEN
//				w_ingresar_liberador.cb_aceptar.text			= "Ingresar"
//				w_ingresar_liberador.dw_anexo_liberador.InsertRow(0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "serie_m", gs_serie)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "nro_liberador", gi_numero)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "ult_folio", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "base", ls_null)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "serie", ls_null)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "nro_oferta", ll_null)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "rut", ll_null)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "tot_pagado", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "cta_pag_m", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "abono_m", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "usuario", gs_user)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "fecha_ingreso", ld_fecha)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "forma_pago", ls_null)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "fecha_cierre", ld_null)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "fecha_com", ld_null)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "uf_cierre", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "nro_resc", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "cod_agente", gs_age)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "cod_super", gs_sup)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "cod_jef", gs_jefe)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "estado_comi", "N")
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "estado_premio", "N")
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "total_com", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "por_ingre", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "porce_sup", 0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, "porce_age", 0)
//				w_ingresar_liberador.dw_clientes.reset()
//				w_ingresar_liberador.dw_clientes.insertrow(0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, 'estado_rut',1)
//				w_ingresar_liberador.dw_pago_liberador.enabled	= false
//			ELSE
//				w_ingresar_liberador.cb_aceptar.text 				= "Actualizar"
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1, 'estado_rut',0)
//				w_ingresar_liberador.dw_pago_liberador.enabled	= true
//				gi_rut 						= Long(w_ingresar_liberador.dw_anexo_liberador.GetItemNumber(1, "rut"))
//				if w_ingresar_liberador.dw_clientes.Retrieve(gi_rut)=0 then w_ingresar_liberador.dw_clientes.insertrow(0)
//				w_ingresar_liberador.dw_anexo_liberador.SetItem(1,"compute",upper(w_ingresar_liberador.dw_clientes.GetItemstring(1,"dv")))
//			END IF
//			ll_cant 							= w_ingresar_liberador.dw_pago_liberador.Retrieve(gs_serie,gi_numero)
//			IF ll_cant = 0 THEN
//				w_ingresar_liberador.dw_pago_liberador.InsertRow(0)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "serie_m", gs_serie)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "nro_liberador", gi_numero)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "fecha", ld_fecha)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "folio", 0)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "precio", 0)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "pie_pagado", 0)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "pie", 0)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "tasa", 0)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "valor_cuota", 0)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "nro_cuotas", 0)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "uf_dia", gd_uf_dia)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "moneda", ls_null)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "fecha_prim", ld_null)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "fecha_ult", ld_null)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "fecha_pie", ld_null)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "modificado", gs_user)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "fecha_mod", ld_fecha)
//				w_ingresar_liberador.dw_pago_liberador.SetItem(1, "gastos_adm", 0)
//			END IF
//		end if
//////////////////////////////////////////////////////////////////////////
//		w_ingresar_liberador.dw_anexo_liberador.setfocus()
//		Close(w_no_liberador)
//	ELSE
//		MessageBox("Ingresar Anexo Liberador", "Serie o número del Anexo ya existe !")
//		setnull(gi_numero)
//		setnull(gs_serie)
//		gs_base 		= "L"
//		sle_numero.setfocus()
//	END IF
//end if
end event

type p_1 from picture within w_no_liberador
integer x = 41
integer y = 36
integer width = 389
integer height = 416
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

