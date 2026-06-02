forward
global type w_ingreso_bl_nulas_11 from window
end type
type st_1 from statictext within w_ingreso_bl_nulas_11
end type
type em_1 from editmask within w_ingreso_bl_nulas_11
end type
type cerrar from commandbutton within w_ingreso_bl_nulas_11
end type
type cb_2 from commandbutton within w_ingreso_bl_nulas_11
end type
type gb_1 from groupbox within w_ingreso_bl_nulas_11
end type
end forward

global type w_ingreso_bl_nulas_11 from window
integer width = 1326
integer height = 680
boolean titlebar = true
string title = "Ingreso de Boletas Nulas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_1 st_1
em_1 em_1
cerrar cerrar
cb_2 cb_2
gb_1 gb_1
end type
global w_ingreso_bl_nulas_11 w_ingreso_bl_nulas_11

type variables
integer il_fila,il_auto
end variables

on w_ingreso_bl_nulas_11.create
this.st_1=create st_1
this.em_1=create em_1
this.cerrar=create cerrar
this.cb_2=create cb_2
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.em_1,&
this.cerrar,&
this.cb_2,&
this.gb_1}
end on

on w_ingreso_bl_nulas_11.destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cerrar)
destroy(this.cb_2)
destroy(this.gb_1)
end on

event open;gf_centrar(w_ingreso_bl_nulas_11)


end event

type st_1 from statictext within w_ingreso_bl_nulas_11
integer x = 133
integer y = 164
integer width = 142
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_1 from editmask within w_ingreso_bl_nulas_11
integer x = 329
integer y = 140
integer width = 645
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;if long(trim(this.text))>0 then
	if isvalid(w_ingreso2) or isvalid(w_forma_pago2) then
		messagebox("Advertencia","Para Ingresar B.L. Nulas, No debe Existir Ingreso de Pagos")
		CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
			CASE 1 //Cupón
				w_ingreso2.wf_limpiar_opciones() 
				w_ingreso2.tab_ingreso.tp_cupon.sle_n_contrato.setfocus()
			CASE 2 //Comprobante Ingreso
				w_ingreso2.wf_limpiar_opciones()
				w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setfocus()
//			CASE 3 //Boletas
//				w_ingreso2.wf_limpiar_opciones()
//				w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.setfocus()
//			CASE 4 //Boleta Reprog.Cta.Mant.
//				w_ingreso2.wf_limpiar_opciones()
//				w_ingreso2.tab_ingreso.tp_repacta_bl_mant.dw_busca_cliente_repac_mant.setfocus()
//			CASE 5 //Pago Traspaso a Empresa
//				w_ingreso2.wf_limpiar_opciones()
//				w_ingreso2.tab_ingreso.tp_traspaso.dw_ci_buscar_cliente2.setfocus()
		END CHOOSE
		close(w_forma_pago2)
	end if
else
	this.text	= ''
end if
end event

type cerrar from commandbutton within w_ingreso_bl_nulas_11
integer x = 791
integer y = 352
integer width = 347
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ingreso_bl_nulas_11)
end event

type cb_2 from commandbutton within w_ingreso_bl_nulas_11
integer x = 192
integer y = 352
integer width = 347
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;long 		folio,folio_aux,ret,i,ll_resp
datetime fecha
fecha	= datetime(today ())
folio = long(em_1.text)	
if isnull(em_1.text) or em_1.text = '' then
	MessageBox("Falta N° de Folio", "No se puede ingresar Boleta Nula por que falta N° de Folio.",information!)
	em_1.setfocus()
	return
end if
ll_resp	= messagebox("Advertencia","Está seguro de Anular Folio",Exclamation!,YesNo!,2)
if ll_resp=1 then
	SELECT count(FOLIO) INTO :folio_aux FROM INGRESO WHERE ( FOLIO = :folio ) AND ( TIPO_COB = 'BL' OR TIPO_COB = 'B0' ) ;
	if folio_aux > 0 then
		MessageBox("Existe Folio", "El Folio de Boleta N°"+string(folio,'###,###,###,###')+" existe.~t~n      No es Posible Grabar.",stopsign!)
		em_1.setfocus()
		return
	end if
	ret	= MessageBox("Grabar", "Desea Grabar la Boleta Nula",Question!, YesNo! , 2)
	if ret = 1 then
		INSERT INTO "INGRESO"  
				 ( "FOLIO","TIPO_COB","FECHA_PAGO","TIPO_MOV","MONTO","CUOTAS_PAG","SERIE","CONTRATO","COD_CAJA","REZAGO","VALOR_UF","PAGO_HIST","BASE","RUT","USUARIO",	"COD_AGE","FECHA_VENC","PAGO_EXTERNO","LUGAR_EXTERNO","VIENE_DE","FECHA_ANT","FCHA_ANT","SERVIPAG","CODIGO_OTRO" )  
		VALUES ( :folio ,'BL'      , :fecha     ,'W'       ,0      ,0           ,'N'    ,0         ,:gs_caja  ,null    ,null      ,'A'        ,'O'   ,99   ,:gs_user,	null     ,:fecha      ,null          ,null           ,null      ,null       ,null      ,null      ,'0' )  ;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			MessageBox("Exito", "El Folio de Boleta N°"+string(folio,'###,###,###,###')+" se ha grabado con exito.",information!)
			em_1.text 	= ''
			em_1.setfocus()
		else
			rollback using sqlca;
			MessageBox("SQL error", SQLCA.SQLErrText)
			em_1.setfocus()
		end if
	else
		em_1.text		= ''
		em_1.setfocus()
	end if
end if
end event

type gb_1 from groupbox within w_ingreso_bl_nulas_11
integer x = 55
integer y = 24
integer width = 1207
integer height = 500
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Folio"
borderstyle borderstyle = stylelowered!
end type

