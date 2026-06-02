forward
global type w_consultar_contato from window
end type
type cb_8 from commandbutton within w_consultar_contato
end type
type cb_7 from commandbutton within w_consultar_contato
end type
type dw_3 from datawindow within w_consultar_contato
end type
type cb_6 from commandbutton within w_consultar_contato
end type
type dw_2 from datawindow within w_consultar_contato
end type
type st_10 from statictext within w_consultar_contato
end type
type st_9 from statictext within w_consultar_contato
end type
type cb_5 from commandbutton within w_consultar_contato
end type
type cb_4 from commandbutton within w_consultar_contato
end type
type cb_3 from commandbutton within w_consultar_contato
end type
type cb_2 from commandbutton within w_consultar_contato
end type
type st_8 from statictext within w_consultar_contato
end type
type st_7 from statictext within w_consultar_contato
end type
type cb_1 from commandbutton within w_consultar_contato
end type
type sle_numero from singlelineedit within w_consultar_contato
end type
type st_6 from statictext within w_consultar_contato
end type
type st_5 from statictext within w_consultar_contato
end type
type sle_apellido_paterno from singlelineedit within w_consultar_contato
end type
type sle_rut from singlelineedit within w_consultar_contato
end type
type st_4 from statictext within w_consultar_contato
end type
type sle_serie from singlelineedit within w_consultar_contato
end type
type st_3 from statictext within w_consultar_contato
end type
type sle_numero_contrato from singlelineedit within w_consultar_contato
end type
type st_2 from statictext within w_consultar_contato
end type
type ddlb_tipo_contrato from dropdownlistbox within w_consultar_contato
end type
type st_1 from statictext within w_consultar_contato
end type
type cb_buscar from commandbutton within w_consultar_contato
end type
type cb_cancelar from commandbutton within w_consultar_contato
end type
type gb_2 from groupbox within w_consultar_contato
end type
type gb_1 from groupbox within w_consultar_contato
end type
type dw_1 from datawindow within w_consultar_contato
end type
end forward

global type w_consultar_contato from window
integer x = 718
integer y = 484
integer width = 1362
integer height = 1180
boolean titlebar = true
string title = "Buscar Contrato"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_8 cb_8
cb_7 cb_7
dw_3 dw_3
cb_6 cb_6
dw_2 dw_2
st_10 st_10
st_9 st_9
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
st_8 st_8
st_7 st_7
cb_1 cb_1
sle_numero sle_numero
st_6 st_6
st_5 st_5
sle_apellido_paterno sle_apellido_paterno
sle_rut sle_rut
st_4 st_4
sle_serie sle_serie
st_3 st_3
sle_numero_contrato sle_numero_contrato
st_2 st_2
ddlb_tipo_contrato ddlb_tipo_contrato
st_1 st_1
cb_buscar cb_buscar
cb_cancelar cb_cancelar
gb_2 gb_2
gb_1 gb_1
dw_1 dw_1
end type
global w_consultar_contato w_consultar_contato

on w_consultar_contato.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.dw_3=create dw_3
this.cb_6=create cb_6
this.dw_2=create dw_2
this.st_10=create st_10
this.st_9=create st_9
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.st_8=create st_8
this.st_7=create st_7
this.cb_1=create cb_1
this.sle_numero=create sle_numero
this.st_6=create st_6
this.st_5=create st_5
this.sle_apellido_paterno=create sle_apellido_paterno
this.sle_rut=create sle_rut
this.st_4=create st_4
this.sle_serie=create sle_serie
this.st_3=create st_3
this.sle_numero_contrato=create sle_numero_contrato
this.st_2=create st_2
this.ddlb_tipo_contrato=create ddlb_tipo_contrato
this.st_1=create st_1
this.cb_buscar=create cb_buscar
this.cb_cancelar=create cb_cancelar
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_1=create dw_1
this.Control[]={this.cb_8,&
this.cb_7,&
this.dw_3,&
this.cb_6,&
this.dw_2,&
this.st_10,&
this.st_9,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.st_8,&
this.st_7,&
this.cb_1,&
this.sle_numero,&
this.st_6,&
this.st_5,&
this.sle_apellido_paterno,&
this.sle_rut,&
this.st_4,&
this.sle_serie,&
this.st_3,&
this.sle_numero_contrato,&
this.st_2,&
this.ddlb_tipo_contrato,&
this.st_1,&
this.cb_buscar,&
this.cb_cancelar,&
this.gb_2,&
this.gb_1,&
this.dw_1}
end on

on w_consultar_contato.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.dw_3)
destroy(this.cb_6)
destroy(this.dw_2)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.cb_1)
destroy(this.sle_numero)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.sle_apellido_paterno)
destroy(this.sle_rut)
destroy(this.st_4)
destroy(this.sle_serie)
destroy(this.st_3)
destroy(this.sle_numero_contrato)
destroy(this.st_2)
destroy(this.ddlb_tipo_contrato)
destroy(this.st_1)
destroy(this.cb_buscar)
destroy(this.cb_cancelar)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;gf_centrar (w_consultar_contato)
dw_1.dataobject='dw_buscar_direccion_iguales'
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
end event

type cb_8 from commandbutton within w_consultar_contato
boolean visible = false
integer x = 485
integer y = 1964
integer width = 498
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Traspaso Cliente"
end type

event clicked;//open(w_traspaso_datos_por_cliente)
//Long		ll_rut
//String	ls_estado,ls_glosa
//Datetime	ldt_fecha
//SetPointer(HourGlass!)
//connect using trans_1;
//DECLARE	x1 CURSOR FOR  
//SELECT 	"CLIENTE"."RUT"  
//FROM 		"CLIENTE"  
//ORDER BY "CLIENTE"."RUT" ASC  
//USING		sqlca;
//open x1;
//DO WHILE sqlca.sqlcode=0
//	fetch x1 into :ll_rut;
//	if ll_rut>0 then
//		SELECT	"ATENCION_LOG"."ESTADO",   
//					"ATENCION_LOG"."FECHA",   
//					"ATENCION_LOG"."GLOSA"  
//		INTO 		:ls_estado,   
//					:ldt_fecha,   
//					:ls_glosa  
//		FROM 		"ATENCION_LOG"  
//		WHERE	 ( "ATENCION_LOG"."RUT" = :ll_rut ) AND  
//				 ( "ATENCION_LOG"."FECHA" = ( SELECT MAX("ATENCION_LOG"."FECHA") 
//				 										FROM "ATENCION_LOG" 
//														WHERE "ATENCION_LOG"."RUT" = :ll_rut  ) )
//		USING		trans_1;
//		if trans_1.sqlcode=0 then
//			UPDATE	"CLIENTE"  
//			SET 		"ULT_ESTADO_PUB" = :ls_estado,   
//						"ULT_GLOSA_PUB" = :ls_glosa,   
//						"ULT_FECHA_PUB" = :ldt_fecha  
//			WHERE 	"CLIENTE"."RUT" = :ll_rut   
//			USING		trans_1;
//			if trans_1.sqlcode=0 then
//				commit;
//			else
//				rollback;
//			end if
//		end if
//	end if
//LOOP
//close x1;
//disconnect using trans_1;
//SetPointer(Arrow!)
end event

type cb_7 from commandbutton within w_consultar_contato
boolean visible = false
integer x = 2043
integer y = 924
integer width = 297
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_3
if dw_3.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type dw_3 from datawindow within w_consultar_contato
boolean visible = false
integer x = 1294
integer y = 1164
integer width = 1047
integer height = 432
boolean enabled = false
string title = "none"
string dataobject = "dwe_lista_cliente_direccion_repetida"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_consultar_contato
boolean visible = false
integer x = 1362
integer y = 916
integer width = 507
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Buscar Direccion"
end type

event clicked;long	ll_tot_reg,ll_indi,ll_count,ll_rut,ll_new
string	ls_dir,ls_dv,ls_nom,ls_ap_pat,ls_ap_mat

ll_tot_reg	= dw_2.retrieve()
SetPointer(HourGlass!)
dw_3.reset()
for ll_indi=1 to ll_tot_reg
	ls_dir		= dw_2.getitemstring(ll_indi,'direccion_p')
	ll_rut		= dw_2.getitemnumber(ll_indi,'rut')
	ls_dv			= dw_2.getitemstring(ll_indi,'dv')
	ls_nom		= dw_2.getitemstring(ll_indi,'nombre')
	ls_ap_pat	= dw_2.getitemstring(ll_indi,'a_paterno')
	ls_ap_mat	= dw_2.getitemstring(ll_indi,'a_materno')
	SELECT	count("CLIENTE"."RUT")  
	INTO 		:ll_count  
	FROM 		"CLIENTE"  
	WHERE 	"CLIENTE"."DIRECCION_P" = :ls_dir   
	USING		sqlca;
	if ll_count>1 then
		ll_new	= dw_3.insertrow(0)
		dw_3.scrolltorow(ll_new)
		dw_3.setitem(ll_new,'rut',ll_rut)
		dw_3.setitem(ll_new,'dv',ls_dv)
		dw_3.setitem(ll_new,'direccion_p',ls_dir)
		dw_3.setitem(ll_new,'nombre',ls_nom)
		dw_3.setitem(ll_new,'ap_paterno',ls_ap_pat)
		dw_3.setitem(ll_new,'ap_materno',ls_ap_mat)
	end if
next
SetPointer(Arrow!)
end event

type dw_2 from datawindow within w_consultar_contato
boolean visible = false
integer x = 59
integer y = 1164
integer width = 1010
integer height = 432
boolean enabled = false
string title = "none"
string dataobject = "dw_lista_clientes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_consultar_contato
boolean visible = false
integer x = 846
integer y = 1088
integer width = 375
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_consultar_contato
boolean visible = false
integer x = 485
integer y = 1092
integer width = 320
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Registro"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_consultar_contato
boolean visible = false
integer x = 50
integer y = 1192
integer width = 567
integer height = 112
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Direccion"
end type

event clicked;open(w_actualizar_direccion_cliente)

//long		ll_rut,ll_total_renta_nueva,ll_grupo_f_nueva,ll_indi=0
//String	ls_direccion_p_nueva,ls_poblacion_nueva,ls_sector_nueva,ls_comuna_nueva,&
//			ls_ciudad_nueva,ls_fono_p_nueva,ls_estado_civil_nueva,ls_domicilio_c_nueva,&
//			ls_fono_c_nueva,ls_estado_cob_nueva,ls_nombre_nueva,ls_ap_paterno_nueva,&
//			ls_ap_materno_nueva
//Datetime	ldt_fecha_nac_nueva
//connect using Trans_1;
// DECLARE x1 CURSOR FOR  
//  SELECT "SOL_MOD_ANTECE"."RUT",   
//         "SOL_MOD_ANTECE"."DIRECCION_P_NUEVA",   
//         "SOL_MOD_ANTECE"."POBLACION_NUEVA",   
//         "SOL_MOD_ANTECE"."SECTOR_NUEVA",   
//         "SOL_MOD_ANTECE"."COMUNA_NUEVA",   
//         "SOL_MOD_ANTECE"."CIUDAD_NUEVA",   
//         "SOL_MOD_ANTECE"."FONO_P_NUEVA",   
//         "SOL_MOD_ANTECE"."FECHA_NAC_NUEVA",   
//         "SOL_MOD_ANTECE"."ESTADO_CIVIL_NUEVA",   
//         "SOL_MOD_ANTECE"."DOMICILIO_C_NUEVA",   
//         "SOL_MOD_ANTECE"."FONO_C_NUEVA",   
//         "SOL_MOD_ANTECE"."TOTAL_RENTA_NUEVA",   
//         "SOL_MOD_ANTECE"."GRUPO_F_NUEVA",   
//         "SOL_MOD_ANTECE"."ESTADO_COB_NUEVA"
//    FROM "SOL_MOD_ANTECE"  
//	 WHERE "SOL_MOD_ANTECE"."ESTATUS_MOD" = 0
//USING	sqlca;
//if sqlca.sqlcode=0 then
//	open x1;
//	DO WHILE sqlca.sqlcode=0
//		setnull(ll_rut);setnull(ls_direccion_p_nueva);setnull(ls_direccion_p_nueva);setnull(ls_sector_nueva)
//		setnull(ls_comuna_nueva);setnull(ls_ciudad_nueva);setnull(ls_fono_p_nueva);setnull(ldt_fecha_nac_nueva)
//		setnull(ls_estado_civil_nueva);setnull(ls_domicilio_c_nueva);setnull(ls_fono_c_nueva);setnull(ll_total_renta_nueva)
//		setnull(ll_grupo_f_nueva);setnull(ls_estado_cob_nueva);setnull(ls_nombre_nueva);setnull(ls_ap_paterno_nueva)
//		setnull(ls_ap_materno_nueva)
//		fetch x1 into :ll_rut,:ls_direccion_p_nueva,:ls_poblacion_nueva,:ls_sector_nueva,:ls_comuna_nueva,:ls_ciudad_nueva,:ls_fono_p_nueva,:ldt_fecha_nac_nueva,:ls_estado_civil_nueva,:ls_domicilio_c_nueva,:ls_fono_c_nueva,:ll_total_renta_nueva,:ll_grupo_f_nueva,:ls_estado_cob_nueva;
//		if not isnull(ll_rut) and not isnull(ls_direccion_p_nueva) and not isnull(ls_comuna_nueva) then
//			UPDATE "CLIENTE"  
//			SET	"DIRECCION_P" = :ls_direccion_p_nueva,   
//					"POBLACION" = :ls_poblacion_nueva,   
//					"SECTOR" = :ls_sector_nueva,   
//					"COMUNA" = :ls_comuna_nueva,   
//					"CIUDAD" = :ls_ciudad_nueva,   
//					"FONO_P" = :ls_fono_p_nueva,   
//					"FECHA_NAC" = :ldt_fecha_nac_nueva,   
//					"ESTA_CIVIL" = :ls_estado_civil_nueva,   
//					"DOMICILIO_C" = :ls_domicilio_c_nueva,   
//					"FONO_C" = :ls_fono_c_nueva,   
//					"TOTAL_RENT" = :ll_total_renta_nueva,   
//					"GRUPO_F" = :ll_grupo_f_nueva,   
//					"ESTADO_COBRANZA" = :ls_estado_cob_nueva
//			WHERE "CLIENTE"."RUT" = :ll_rut   
//			USING	TRANS_1;
//			if TRANS_1.sqlcode=0 then
//				commit using trans_1;
//			else
//				rollback using trans_1;
//			end if
//		else
//			messagebox("Error","Error dato nulo")
//		end if
//		ll_indi ++
//		st_10.text	= string(ll_indi)
//	LOOP
//	close x1;
//end if
//disconnect using Trans_1;
end event

type cb_4 from commandbutton within w_consultar_contato
integer x = 814
integer y = 1976
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_1
if dw_1.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_3 from commandbutton within w_consultar_contato
integer x = 123
integer y = 1964
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_1.SETfilter(NULO)
dw_1.filter()
end event

type cb_2 from commandbutton within w_consultar_contato
integer x = 91
integer y = 1248
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "proceso"
end type

event clicked;long	ll_tot_reg=0,ll_indi=0
string	ls_dir
SetPointer(HourGlass!)

ll_tot_reg						= dw_1.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_dir	= dw_1.getitemstring(ll_indi,'direccion_p')
		if f_buscar_dir_iguales(ls_dir)='S' then
			dw_1.setitem(ll_indi,'sw_igual','S')
		else
			dw_1.setitem(ll_indi,'sw_igual','N')
		end if
		dw_1.scrolltorow(ll_indi)
	next
	dw_1.accepttext()
end if
SetPointer(Arrow!)
end event

type st_8 from statictext within w_consultar_contato
integer x = 91
integer y = 56
integer width = 667
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Buscar por"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_consultar_contato
integer x = 91
integer y = 592
integer width = 667
integer height = 92
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 255
boolean enabled = false
string text = "Solo Nº de Contrato"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_consultar_contato
integer x = 750
integer y = 704
integer width = 498
integer height = 116
integer taborder = 50
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar Numero"
end type

event clicked;string tipo
string esta

gi_numero = Double(sle_numero.text)
if gi_numero>0 then
	gi_tipo_busqueda = 8
	if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
	if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
	if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
	if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
	if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
	if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
	if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
	Open(w_listado_contratos)
end if
end event

type sle_numero from singlelineedit within w_consultar_contato
event key pbm_keydown
integer x = 146
integer y = 708
integer width = 498
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event key;if KeyDown(KeyEnter!) then
	cb_1.triggerevent (clicked!)
end if
end event

event modified;cb_buscar.default = false
cb_1.default 		= true
end event

type st_6 from statictext within w_consultar_contato
integer x = 283
integer y = 356
integer width = 165
integer height = 76
integer textsize = -11
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "+   %"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_consultar_contato
integer x = 110
integer y = 296
integer width = 517
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Apellido Paterno"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_apellido_paterno from singlelineedit within w_consultar_contato
event key pbm_keydown
integer x = 640
integer y = 288
integer width = 608
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event key;if KeyDown(KeyEnter!) then
	cb_buscar.triggerevent (clicked!)
END IF
end event

event getfocus;cb_buscar.default 	= true
cb_1.default 		= false
end event

type sle_rut from singlelineedit within w_consultar_contato
event key pbm_keydown
integer x = 640
integer y = 180
integer width = 608
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event key;if KeyDown(KeyEnter!) then
	cb_buscar.triggerevent (clicked!)
END IF
end event

event getfocus;cb_buscar.default = true
cb_1.default = false
end event

type st_4 from statictext within w_consultar_contato
integer x = 448
integer y = 188
integer width = 178
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "R.U.T."
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_serie from singlelineedit within w_consultar_contato
integer x = 1765
integer y = 176
integer width = 165
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_consultar_contato
integer x = 1490
integer y = 176
integer width = 238
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_numero_contrato from singlelineedit within w_consultar_contato
integer x = 1765
integer y = 280
integer width = 361
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_consultar_contato
integer x = 1381
integer y = 280
integer width = 347
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Número de Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_tipo_contrato from dropdownlistbox within w_consultar_contato
integer x = 1765
integer y = 68
integer width = 622
integer height = 496
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
boolean vscrollbar = true
string item[] = {"O - PROMESA","L - Anexo Liberador","P - Pagaré","C - Contrato ISA","D - Derecho Especial de Sep."}
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_consultar_contato
integer x = 1504
integer y = 68
integer width = 224
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "BASE "
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_buscar from commandbutton within w_consultar_contato
integer x = 750
integer y = 404
integer width = 498
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;string tipo
string esta
IF sle_rut.text = "" THEN
	IF sle_numero_contrato.text = "" THEN
		gi_tipo_busqueda = 2
		gs_apellido_paterno = sle_apellido_paterno.text
	ELSE 
		gs_base = Mid(ddlb_tipo_contrato.text, 1, 1)
		gs_serie = Mid(sle_serie.text , 1, 1)
		gi_numero = Double(sle_numero_contrato.text)
      select cadena.rut into :rutx from cadena where cadena.codigo=:gs_base and cadena.serie=:gs_serie and cadena.numero= :gi_numero;
		gi_tipo_busqueda = 0
	END IF	
ELSE 
	gi_rut = Long(sle_rut.text)
	gi_tipo_busqueda = 1
END IF
if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
Open(w_listado_contratos)
end event

type cb_cancelar from commandbutton within w_consultar_contato
integer x = 750
integer y = 900
integer width = 498
integer height = 116
integer taborder = 60
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_consultar_contato)
end event

type gb_2 from groupbox within w_consultar_contato
integer x = 55
integer y = 68
integer width = 1230
integer height = 496
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar"
end type

type gb_1 from groupbox within w_consultar_contato
integer x = 55
integer y = 600
integer width = 1230
integer height = 264
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

type dw_1 from datawindow within w_consultar_contato
boolean visible = false
integer x = 73
integer y = 1424
integer width = 2167
integer height = 496
string dataobject = "dw_buscar_direccion_iguales"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

