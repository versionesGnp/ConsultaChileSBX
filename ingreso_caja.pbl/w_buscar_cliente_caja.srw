forward
global type w_buscar_cliente_caja from window
end type
type cb_3 from commandbutton within w_buscar_cliente_caja
end type
type cb_1 from commandbutton within w_buscar_cliente_caja
end type
type cb_limpiar from commandbutton within w_buscar_cliente_caja
end type
type st_1 from statictext within w_buscar_cliente_caja
end type
type pb_ok from picturebutton within w_buscar_cliente_caja
end type
type dw_buscar from datawindow within w_buscar_cliente_caja
end type
type cb_cerrar from commandbutton within w_buscar_cliente_caja
end type
type cb_aceptar from commandbutton within w_buscar_cliente_caja
end type
type dw_lista from datawindow within w_buscar_cliente_caja
end type
type gb_1 from groupbox within w_buscar_cliente_caja
end type
type gb_2 from groupbox within w_buscar_cliente_caja
end type
end forward

global type w_buscar_cliente_caja from window
integer width = 3195
integer height = 1736
boolean titlebar = true
string title = "Buscar Cliente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_3 cb_3
cb_1 cb_1
cb_limpiar cb_limpiar
st_1 st_1
pb_ok pb_ok
dw_buscar dw_buscar
cb_cerrar cb_cerrar
cb_aceptar cb_aceptar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type
global w_buscar_cliente_caja w_buscar_cliente_caja

type variables
Long	il_row
end variables

on w_buscar_cliente_caja.create
this.cb_3=create cb_3
this.cb_1=create cb_1
this.cb_limpiar=create cb_limpiar
this.st_1=create st_1
this.pb_ok=create pb_ok
this.dw_buscar=create dw_buscar
this.cb_cerrar=create cb_cerrar
this.cb_aceptar=create cb_aceptar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_3,&
this.cb_1,&
this.cb_limpiar,&
this.st_1,&
this.pb_ok,&
this.dw_buscar,&
this.cb_cerrar,&
this.cb_aceptar,&
this.dw_lista,&
this.gb_1,&
this.gb_2}
end on

on w_buscar_cliente_caja.destroy
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.cb_limpiar)
destroy(this.st_1)
destroy(this.pb_ok)
destroy(this.dw_buscar)
destroy(this.cb_cerrar)
destroy(this.cb_aceptar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;gf_centrar(w_buscar_cliente_caja)
dw_lista.settransobject(sqlca)
dw_buscar.settransobject(sqlca)

dw_buscar.insertrow(0)
dw_buscar.setfocus()

end event

type cb_3 from commandbutton within w_buscar_cliente_caja
integer x = 1390
integer y = 1476
integer width = 219
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
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

type cb_1 from commandbutton within w_buscar_cliente_caja
integer x = 1125
integer y = 1476
integer width = 261
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
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_limpiar from commandbutton within w_buscar_cliente_caja
integer x = 1691
integer y = 1476
integer width = 293
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
dw_buscar.reset()
dw_buscar.insertrow(0)
dw_buscar.setfocus()

end event

type st_1 from statictext within w_buscar_cliente_caja
integer x = 37
integer y = 472
integer width = 466
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista Contratos"
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_buscar_cliente_caja
integer x = 2875
integer y = 104
integer width = 178
integer height = 156
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
string disabledname = "ok.bmp"
alignment htextalign = right!
end type

event clicked;String	ls_ap_mat,ls_ap_pat,ls_nom
Long		ll_rut,ll_ctto

dw_buscar.accepttext()
ll_rut					= dw_buscar.getitemnumber(1,'rut')
ll_ctto					= dw_buscar.getitemnumber(1,'numero')
ls_ap_mat				= dw_buscar.getitemstring(1,'ap_materno')
ls_ap_pat				= dw_buscar.getitemstring(1,'ap_paterno')
ls_nom					= dw_buscar.getitemstring(1,'nombre')

if isnull(ls_ap_mat) or ls_ap_mat='' then ls_ap_mat=''
if isnull(ls_ap_pat) or ls_ap_pat='' then ls_ap_pat=''
if isnull(ls_nom) or ls_nom='' then ls_nom=''
if isnull(ll_rut) or ll_rut=0 then ll_rut=0
if isnull(ll_ctto) or ll_ctto=0 then ll_ctto=0

if ls_ap_mat<>'' and ls_ap_pat='' and ls_nom='' and ll_rut=0 and ll_ctto=0 then
	dw_lista.dataobject	= 'dw_lista_vista_caja_parques_ap_mat'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(ls_ap_mat)
elseif ls_ap_mat='' and ls_ap_pat<>'' and ls_nom='' and ll_rut=0 and ll_ctto=0 then
	dw_lista.dataobject	= 'dw_lista_vista_caja_parques_ap_pat'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(ls_ap_pat)
elseif ls_ap_mat='' and ls_ap_pat='' and ls_nom<>'' and ll_rut=0 and ll_ctto=0 then
	dw_lista.dataobject	= 'dw_lista_vista_caja_parques_nombre'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(ls_nom)
elseif ls_ap_mat='' and ls_ap_pat='' and ls_nom='' and ll_rut>0 and ll_ctto=0 then
	dw_lista.dataobject	= 'dw_lista_vista_caja_parques_rut'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(ll_rut)
elseif ls_ap_mat='' and ls_ap_pat='' and ls_nom='' and ll_rut=0 and ll_ctto>0 then
	dw_lista.dataobject	= 'dw_lista_vista_caja_parques_contrato'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(ll_ctto)
elseif ll_rut>0 and ll_ctto>0 and ls_nom='' and ls_ap_pat='' and ls_ap_mat='' then
	
elseif ll_rut>0 and ll_ctto>0 and ls_nom<>'' and ls_ap_pat='' and ls_ap_mat='' then

elseif ll_rut>0 and ll_ctto>0 and ls_nom<>'' and ls_ap_pat<>'' and ls_ap_mat='' then
	
elseif ll_rut>0 and ll_ctto>0 and ls_nom<>'' and ls_ap_pat<>'' and ls_ap_mat<>'' then
	
end if
if dw_lista.rowcount()=0 then
	messagebox("Advertencia","No Registra Dato")
end if
end event

type dw_buscar from datawindow within w_buscar_cliente_caja
integer x = 69
integer y = 104
integer width = 2651
integer height = 316
integer taborder = 10
string title = "none"
string dataobject = "dwe_buscar_por_contrato"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_base

this.accepttext()
ls_columna	= dwo.name
dw_lista.reset()

end event

type cb_cerrar from commandbutton within w_buscar_cliente_caja
integer x = 2766
integer y = 1472
integer width = 352
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_cliente_caja)
end event

type cb_aceptar from commandbutton within w_buscar_cliente_caja
integer x = 32
integer y = 1472
integer width = 293
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_cod_parque,ll_rut
String	ls_ap_pat,ls_ap_mat,ls_base,ls_serie,ls_estado,ls_nom,is_dbms,is_logpass,is_servername,&
			is_logid, is_dbparam,ls_dv,ls_rut,ls_numero
Double	id_uf,ll_numero
Date		id_fecha

if il_row>0 and dw_lista.rowcount()>0 then
	ll_cod_parque	= dw_lista.getitemnumber(il_row,'cod_parque')
	ls_base			= dw_lista.getitemstring(il_row,'codigo')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'numero')
	ls_estado		= dw_lista.getitemstring(il_row,'estado')
	ll_rut			= dw_lista.getitemnumber(il_row,'rut')
	ls_nom			= dw_lista.getitemstring(il_row,'nombre')
	ls_ap_pat		= dw_lista.getitemstring(il_row,'a_paterno')
	ls_ap_mat		= dw_lista.getitemstring(il_row,'a_materno')
	if ll_cod_parque=1 or ll_cod_parque=102 then	// Prado & Manantial
		DISCONNECT USING sqlca ;
		disconnect using Trans_1;
		disconnect using Trans_2;
		disconnect using Trans_4;
		is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O73 ORACLE v7.3")
		is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
		is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","@prado_8i")
		is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","prado")
		is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
		Trans_1					= CREATE transaction
		Trans_2					= CREATE transaction
		Trans_4					= CREATE transaction
		SQLCA.DBMS 				= is_dbms
		SQLCA.LogPass 			= is_logpass
		SQLCA.ServerName 		= is_servername
		SQLCA.LogId 			= is_logid
		SQLCA.dbParm 			= is_dbparam
		Trans_1.DBMS 			= is_dbms
		Trans_1.LogPass 		= is_logpass
		Trans_1.ServerName 	= is_servername
		Trans_1.LogId 			= is_logid
		Trans_1.dbParm 		= is_dbparam
		Trans_2.DBMS 			= is_dbms
		Trans_2.LogPass 		= is_logpass
		Trans_2.ServerName 	= is_servername
		Trans_2.LogId 			= is_logid
		Trans_2.dbParm 		= is_dbparam
		Trans_4.DBMS 			= is_dbms
		Trans_4.LogPass 		= is_logpass
		Trans_4.ServerName 	= is_servername
		Trans_4.LogId 			= is_logid
		Trans_4.dbParm 		= is_dbparam
		connect using sqlca;
		connect using Trans_1;
		connect using Trans_2;
		connect using Trans_4;
		if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Prado/Manantial )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Parque: Prado/Manantial'+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
		
	elseif ll_cod_parque=11 then	// Foresta
		DISCONNECT USING sqlca ;
		disconnect using Trans_1;
		disconnect using Trans_2;
		disconnect using Trans_4;
		is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O73 ORACLE v7.3")
		is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
		is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","@foresta_8i")
		is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
		is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
		Trans_1					= CREATE transaction
		Trans_2					= CREATE transaction
		Trans_4					= CREATE transaction
		SQLCA.DBMS 				= is_dbms
		SQLCA.LogPass 			= is_logpass
		SQLCA.ServerName 		= is_servername
		SQLCA.LogId 			= is_logid
		SQLCA.dbParm 			= is_dbparam
		Trans_1.DBMS 			= is_dbms
		Trans_1.LogPass 		= is_logpass
		Trans_1.ServerName 	= is_servername
		Trans_1.LogId 			= is_logid
		Trans_1.dbParm 		= is_dbparam
		Trans_2.DBMS 			= is_dbms
		Trans_2.LogPass 		= is_logpass
		Trans_2.ServerName 	= is_servername
		Trans_2.LogId 			= is_logid
		Trans_2.dbParm 		= is_dbparam
		Trans_4.DBMS 			= is_dbms
		Trans_4.LogPass 		= is_logpass
		Trans_4.ServerName 	= is_servername
		Trans_4.LogId 			= is_logid
		Trans_4.dbParm 		= is_dbparam
		connect using sqlca;
		connect using Trans_1;
		connect using Trans_2;
		connect using Trans_4;
		if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Parque: Foresta'+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")

	elseif ll_cod_parque=103 then // Santiago
		DISCONNECT USING sqlca ;
		disconnect using Trans_1;
		disconnect using Trans_2;
		disconnect using Trans_4;
		is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O73 ORACLE v7.3")
		is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","santiago")
		is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","@santiago_8i")	
		is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","santiago")
		Trans_1					= CREATE transaction
		Trans_2					= CREATE transaction
		Trans_4					= CREATE transaction
		SQLCA.DBMS 				= is_dbms
		SQLCA.LogPass 			= is_logpass
		SQLCA.ServerName 		= is_servername
		SQLCA.LogId 			= is_logid
		SQLCA.dbParm 			= is_dbparam
		Trans_1.DBMS 			= is_dbms
		Trans_1.LogPass 		= is_logpass
		Trans_1.ServerName 	= is_servername
		Trans_1.LogId 			= is_logid
		Trans_1.dbParm 		= is_dbparam
		Trans_2.DBMS 			= is_dbms
		Trans_2.LogPass 		= is_logpass
		Trans_2.ServerName 	= is_servername
		Trans_2.LogId 			= is_logid
		Trans_2.dbParm 		= is_dbparam
		Trans_4.DBMS 			= is_dbms
		Trans_4.LogPass 		= is_logpass
		Trans_4.ServerName 	= is_servername
		Trans_4.LogId 			= is_logid
		Trans_4.dbParm 		= is_dbparam
		connect using sqlca;
		connect using Trans_1;
		connect using Trans_2;
		connect using Trans_4;
		if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Santiago )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Parque: Santiago'+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
	end if
	CHOOSE CASE w_ingreso2.tab_ingreso.SelectedTab
		CASE 1 // Cupón
			w_ingreso2.dw_dias_mora.settransobject(sqlca)
			w_ingreso2.dw_encabezado_ingreso_cupon.SetTransObject(SQLCA)
			w_ingreso2.tab_ingreso.tp_cupon.dw_datos_credito_oferta.SetTransObject(SQLCA)
			w_ingreso2.tab_ingreso.tp_cupon.dw_detalle_pago_cupon.SetTransObject(SQLCA)
			w_ingreso2.dw_detalle_pago_cupon2.SetTransObject(SQLCA)
			w_ingreso2.tab_ingreso.tp_boletas.dw_bl_buscar_cliente.SetTransObject(SQLCA)
			w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.Settransobject(sqlca)
			w_ingreso2.tab_ingreso.tp_boletas.dw_gastos_bl.Settransobject(sqlca)
			w_ingreso2.tab_ingreso.tp_boletas.dw_datos_bl.Settransobject(sqlca)
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.SetTransObject(SQLCA)
			w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.SetTransObject(SQLCA)
			w_ingreso2.tab_ingreso.tp_ci.dw_gastos_ci.SetTransObject(SQLCA)
			id_fecha		= Date(gdt_fec_sistema)
			SELECT 	"TAB_UF"."VALOR_UF"  
			INTO 		:id_uf  
			FROM 		"TAB_UF"  
			WHERE 	"TAB_UF"."FECHA_UF" = :id_fecha
			using		sqlca;
			if id_uf>0 then
				gd_uf 	= id_uf	
				w_ingreso2.tab_ingreso.tp_ci.dw_detalle_ci.getchild('tipo_cob',idw_detalle)
				idw_detalle.settransobject(sqlca)
				idw_detalle.retrieve('CI')
				
				w_ingreso2.tab_ingreso.tp_boletas.dw_detalle_bl.getchild('tipo_cob',idw_detalle2)
				idw_detalle2.settransobject(sqlca)
				idw_detalle2.retrieve('BL')
			end if
			w_ingreso2.tab_ingreso.tp_cupon.sle_n_contrato.text	= string(ls_base)+string(ls_serie)+String(ll_numero)
			w_ingreso2.tab_ingreso.tp_cupon.sle_n_contrato.triggerevent(modified!)
			
		CASE 2 // CI
			w_ingreso2.tab_ingreso.tp_ci.cb_ci_borrar.TriggerEvent(Clicked!)
			ls_rut		= string(dw_buscar.getitemnumber(1,'rut'))
			ls_dv			= trim(dw_buscar.getitemstring(1,'dv'))
			ls_numero	= string(dw_buscar.getitemnumber(1,'numero'))
			ls_nom		= trim(dw_buscar.getitemstring(1,'nombre'))
			ls_ap_pat	= trim(dw_buscar.getitemstring(1,'ap_paterno'))
			ls_ap_mat	= trim(dw_buscar.getitemstring(1,'ap_materno'))
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,'rl_rut',ls_rut)
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,'rn_contrato',ls_numero)
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,'rs_a_paterno',ls_ap_pat)
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,'rs_a_materno',ls_ap_mat)
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setitem(1,'rs_nombre',ls_nom)
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.AcceptText()
			w_ingreso2.tab_ingreso.tp_ci.dw_ci_buscar_cliente.setfocus()
//			w_ingreso2.cb_itemchanged.triggerevent(clicked!)
			
		CASE 3 // BL
	END CHOOSE
end if
end event

type dw_lista from datawindow within w_buscar_cliente_caja
integer x = 32
integer y = 560
integer width = 3086
integer height = 868
integer taborder = 30
string dataobject = "dw_lista_vista_caja_parques_ap_mat"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_buscar_cliente_caja
integer x = 37
integer y = 16
integer width = 3086
integer height = 428
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Opción de Busqueda"
end type

type gb_2 from groupbox within w_buscar_cliente_caja
integer x = 1097
integer y = 1428
integer width = 914
integer height = 168
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

