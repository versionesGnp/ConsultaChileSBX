forward
global type w_eliminar_reemplazar_asigna_ejecutivo from window
end type
type cb_eliminar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type pb_2 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type pb_3 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type pb_4 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type pb_5 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type cb_ctacte from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type cb_historico from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type cb_imprimir from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type cb_ordenar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type pb_1 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type sle_1 from singlelineedit within w_eliminar_reemplazar_asigna_ejecutivo
end type
type st_2 from statictext within w_eliminar_reemplazar_asigna_ejecutivo
end type
type cb_limpiar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type cb_grabar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type pb_cambio from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type dw_ejecutivo from datawindow within w_eliminar_reemplazar_asigna_ejecutivo
end type
type pb_ok from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type em_grupo from editmask within w_eliminar_reemplazar_asigna_ejecutivo
end type
type st_1 from statictext within w_eliminar_reemplazar_asigna_ejecutivo
end type
type cb_cerrar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
end type
type dw_lista from datawindow within w_eliminar_reemplazar_asigna_ejecutivo
end type
type gb_1 from groupbox within w_eliminar_reemplazar_asigna_ejecutivo
end type
type gb_2 from groupbox within w_eliminar_reemplazar_asigna_ejecutivo
end type
type gb_3 from groupbox within w_eliminar_reemplazar_asigna_ejecutivo
end type
type gb_4 from groupbox within w_eliminar_reemplazar_asigna_ejecutivo
end type
end forward

global type w_eliminar_reemplazar_asigna_ejecutivo from window
integer width = 3383
integer height = 1868
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_eliminar cb_eliminar
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
cb_ctacte cb_ctacte
cb_historico cb_historico
cb_imprimir cb_imprimir
cb_ordenar cb_ordenar
pb_1 pb_1
sle_1 sle_1
st_2 st_2
cb_limpiar cb_limpiar
cb_grabar cb_grabar
pb_cambio pb_cambio
dw_ejecutivo dw_ejecutivo
pb_ok pb_ok
em_grupo em_grupo
st_1 st_1
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_eliminar_reemplazar_asigna_ejecutivo w_eliminar_reemplazar_asigna_ejecutivo

type variables
String	is_opcion
Long		il_row
end variables

on w_eliminar_reemplazar_asigna_ejecutivo.create
this.cb_eliminar=create cb_eliminar
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.cb_ctacte=create cb_ctacte
this.cb_historico=create cb_historico
this.cb_imprimir=create cb_imprimir
this.cb_ordenar=create cb_ordenar
this.pb_1=create pb_1
this.sle_1=create sle_1
this.st_2=create st_2
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.pb_cambio=create pb_cambio
this.dw_ejecutivo=create dw_ejecutivo
this.pb_ok=create pb_ok
this.em_grupo=create em_grupo
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.cb_eliminar,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.pb_5,&
this.cb_ctacte,&
this.cb_historico,&
this.cb_imprimir,&
this.cb_ordenar,&
this.pb_1,&
this.sle_1,&
this.st_2,&
this.cb_limpiar,&
this.cb_grabar,&
this.pb_cambio,&
this.dw_ejecutivo,&
this.pb_ok,&
this.em_grupo,&
this.st_1,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_eliminar_reemplazar_asigna_ejecutivo.destroy
destroy(this.cb_eliminar)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.cb_ctacte)
destroy(this.cb_historico)
destroy(this.cb_imprimir)
destroy(this.cb_ordenar)
destroy(this.pb_1)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.pb_cambio)
destroy(this.dw_ejecutivo)
destroy(this.pb_ok)
destroy(this.em_grupo)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;gf_centrar(w_eliminar_reemplazar_asigna_ejecutivo)

connect using Trans_1;
connect using Trans_2;
is_opcion														= Message.StringParm
if is_opcion='E' then
	w_eliminar_reemplazar_asigna_ejecutivo.title	= 'Eliminar Cartera Asignada por Nº Grupo'
	gb_2.visible												= false
	dw_ejecutivo.visible									= false
	pb_cambio.visible										= false
elseif is_opcion='R' then
	w_eliminar_reemplazar_asigna_ejecutivo.title	= 'Reemplazar Ejecutivo Visita Terreno por Nº Grupo'
	gb_2.visible												= true
	dw_ejecutivo.visible									= true
	pb_cambio.visible										= true
end if
dw_lista.settransobject(sqlca)
dw_ejecutivo.settransobject(sqlca)
dw_ejecutivo.insertrow(0)
dw_ejecutivo.enabled										= false
pb_cambio.enabled										= false
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_eliminar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 293
integer y = 1628
integer width = 242
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_resp,ll_rut_cliente
Date		ld_fecha
Datetime	ldt_fec_prox_llam
String		ls_base,ls_serie
Double	ll_numero

if il_row>0 then
	ld_fecha			= date(dw_lista.getitemdatetime(il_row,'fecha_crea'))
	ll_rut_cliente	= dw_lista.getitemnumber(il_row,'rut_cliente')
	ls_base			= dw_lista.getitemstring(il_row,'base')
	ls_serie			= dw_lista.getitemstring(il_row,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row,'numero')
	ll_resp			= messagebox("Eliminar","Está Seguro Eliminar Item Nº "+string(il_row,"###,###,###,###")+' Contrato Nº '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###,###"),Exclamation!,YesNo!,2)
	if ll_resp=1 then
		dw_lista.deleterow(il_row)
		dw_lista.setfocus()
		if dw_lista.rowcount()>0 then dw_lista.scrolltorow(1)
		if dw_lista.update()=1 then
			commit;
			ldt_fec_prox_llam	= datetime(RelativeDate(date(ld_fecha), -370))
			UPDATE 	"CLIENTE"  
			SET 		"ASIGNADO_COBRANZA" = 'N',
						"FECHA_PROX_LLAMADO" = :ldt_fec_prox_llam
			WHERE 	"CLIENTE"."RUT" = :ll_rut_cliente   
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				commit using Trans_1;
				UPDATE	"CADENA"  
				SET 		"ASIGNACION_AT" = 'N',
							"DEPTO_COB_ASIG" = null
				WHERE  	( "CADENA"."CODIGO" = :ls_base ) AND  
						 	( "CADENA"."SERIE" = :ls_serie ) AND  
						 	( "CADENA"."NUMERO" = :ll_numero )   
				USING		Trans_2;
				if Trans_2.sqlcode=0 then
					commit using Trans_2;
				else
					rollback using Trans_2;
					messagebox("Error Grabar","Error al Grabar T.CADENA SQL: "+sqlca.sqlerrtext)
				end if
			else
				rollback using Trans_1;
				messagebox("Error Grabar","Error al Grabar T.CLIENTE SQL: "+sqlca.sqlerrtext)
			end if
			messagebox("Eliminar","Eliminación Exitosa")
			cb_limpiar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error Eliminar","Error al Eliminar LISTA SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type pb_2 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 2318
integer y = 1632
integer width = 91
integer height = 80
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
end event

type pb_3 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 2414
integer y = 1632
integer width = 91
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
end event

type pb_4 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 2510
integer y = 1632
integer width = 91
integer height = 80
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
end event

type pb_5 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 2606
integer y = 1632
integer width = 91
integer height = 80
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount() )
end event

type cb_ctacte from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 553
integer y = 1628
integer width = 402
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuen&ta Corriente"
end type

event clicked;string param
if il_row > 0 and dw_lista.rowcount()>0 then
	gs_base   = dw_lista.getitemstring(il_row,'base' )
	gs_serie  = dw_lista.getitemstring(il_row,'serie')
	gi_numero = dw_lista.getitemnumber(il_row,'numero' )
	gi_rut    = dw_lista.getitemnumber(il_row,'rut_cliente')
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O","U","M" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
	END CHOOSE
else
	messagebox('Seleción','Debe Seleccionar un contrato.',information!)
end if
end event

type cb_historico from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_dwnmousemove
integer x = 960
integer y = 1628
integer width = 242
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gs_base			= dw_lista.getitemstring(il_row,'base')
	gs_serie			= dw_lista.getitemstring(il_row,'serie')
	gi_numero		= dw_lista.getitemnumber(il_row,'numero')
	gi_rut			= dw_lista.getitemnumber(il_row,'rut_cliente')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_imprimir from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 1454
integer y = 1632
integer width = 192
integer height = 80
integer taborder = 110
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
//	f_printdlg(dw_lista,gstr_print,parent)
end if
end event

type cb_ordenar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_dwnmousemove
integer x = 1239
integer y = 1632
integer width = 206
integer height = 80
integer taborder = 100
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

type pb_1 from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 2167
integer y = 1628
integer width = 105
integer height = 92
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lupa.bmp"
string disabledname = "Lupa.bmp"
alignment htextalign = left!
end type

event clicked;STRING	ls_string,ls_rut
long		ll_row
if trim(sle_1.text)<>'' then
	dw_lista.scrolltorow(1)
	ls_rut		= trim(sle_1.text)
	ls_string	= "rut_cliente="+trim(ls_rut)
	ll_row 		= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
		dw_lista.setfocus()
	ELSE
		MessageBox("Advertencia", "Rut Inexistente")
	END IF
end if
end event

type sle_1 from singlelineedit within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 1806
integer y = 1628
integer width = 352
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;pb_1.triggerevent (clicked!)
end event

type st_2 from statictext within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 1673
integer y = 1644
integer width = 119
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 2747
integer y = 1628
integer width = 224
integer height = 92
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;em_grupo.text				= ''
dw_lista.reset()
if is_opcion='E' then
	gb_2.visible			= false
	dw_ejecutivo.visible	= false
	pb_cambio.visible		= false
elseif is_opcion='R' then
	dw_ejecutivo.reset()
	dw_ejecutivo.insertrow(0)
	dw_ejecutivo.enabled	= false
	pb_cambio.enabled		= false
end if
em_grupo.setfocus()
end event

type cb_grabar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 32
integer y = 1628
integer width = 242
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;if dw_lista.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
	cb_limpiar.triggerevent(clicked!)
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type pb_cambio from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 3118
integer y = 84
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "control_documentario.bmp"
string disabledname = "control_documentario_no.bmp"
end type

event clicked;String	ls_usu_ori,ls_usu_des,ls_usuario
Long		ll_tot_reg,ll_indi,ll_sw

ll_sw			= 0
ls_usu_ori	= trim(dw_ejecutivo.getitemstring(1,'ejecutivo_original'))
ls_usu_des	= trim(dw_ejecutivo.getitemstring(1,'ejecutivo_destino'))
if ls_usu_ori = ls_usu_des then
	messagebox("Advertencia","No es Posible Cambiar por el Mismo Ejecutivo")
	dw_ejecutivo.setfocus()
	dw_ejecutivo.setcolumn('ejecutivo_destino')
else
	if not isnull(ls_usu_ori) and ls_usu_ori<>'' and not isnull(ls_usu_des) and ls_usu_des<>'' then
		ll_tot_reg	= dw_lista.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ls_usuario	= trim(dw_lista.getitemstring(ll_indi,'usuario_asignado'))
				if ls_usuario = ls_usu_ori then
					dw_lista.setitem(ll_indi,'usuario_asignado',ls_usu_des)
					ll_sw ++
				end if
			next
			dw_lista.accepttext()
			if ll_sw>0 then
				messagebox("Advertencia","Cambio Exitoso, Recuerde debe Grabar Cambios antes de Salir o efectuar otra Operación")
			end if
		else
			messagebox("Advertencia","No Registra Cartera Asignada a Modificar")
		end if
	end if
end if
end event

type dw_ejecutivo from datawindow within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 1184
integer y = 108
integer width = 1920
integer height = 112
integer taborder = 30
string title = "none"
string dataobject = "dwe_cambio_ejecutivo_terreno"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_usu_ori,ls_columna,ls_usu_des
Long		ll_fila,ll_tot_reg,ll_new

dw_ejecutivo.accepttext()
dw_lista.accepttext()
ls_columna					= dw_ejecutivo.GetColumnName()
ll_tot_reg					= dw_lista.rowcount()
if ll_tot_reg>0 then
	if ls_columna='ejecutivo_original' then
		ls_usu_ori			= trim(dw_ejecutivo.getitemstring(1,'ejecutivo_original'))
		ll_fila 					= dw_lista.Find("usuario_asignado = '"+ls_usu_ori+"'", 1, ll_tot_reg)
		if ll_fila=0 or isnull(ll_fila) then
			messagebox("Advertencia","Ejecutivo Original "+ls_usu_ori+" No Existe en Lista")
			dw_ejecutivo.reset()
			dw_ejecutivo.insertrow(0)
			dw_ejecutivo.setfocus()
			dw_ejecutivo.setcolumn('ejecutivo_original')
		end if
	else
		ls_usu_des			= trim(dw_ejecutivo.getitemstring(1,'ejecutivo_destino'))
		ls_usu_ori			= trim(dw_ejecutivo.getitemstring(1,'ejecutivo_original'))
		if ls_usu_des = ls_usu_ori then
			messagebox("Advertencia","No es posible Cambiar por el mismo Ejecutivo")
			dw_ejecutivo.reset()
			ll_new			= dw_ejecutivo.insertrow(0)
			dw_ejecutivo.setitem(ll_new,'ejecutivo_original',ls_usu_ori)
			dw_ejecutivo.accepttext()
			dw_ejecutivo.setfocus()
			dw_ejecutivo.setcolumn('ejecutivo_destino')
		end if
	end if
end if
end event

type pb_ok from picturebutton within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 910
integer y = 84
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
end type

event clicked;Long	ll_grupo
String	ls_estado

ll_grupo								= long(em_grupo.text)
dw_ejecutivo.reset()
dw_ejecutivo.insertrow(0)
if ll_grupo>0 then
	if dw_lista.retrieve(ll_grupo,gs_user,gs_depto,is_opcion)=0 then
		SELECT	"AT_LISTA_GESTION"."ESTADO_GESTION_LISTA"  
		INTO 		:ls_estado  
		FROM 	"AT_LISTA_GESTION"  
		WHERE 	"AT_LISTA_GESTION"."CODIGO_GRUPO" = :ll_grupo   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='A' then
				messagebox("Advertencia","No Registra Dato, Lista se encuentra en Estado A-Anulado")
			elseif ls_estado='G' then
				messagebox("Advertencia","No Registra Dato, Lista se encuentra en Estado G-Gestionado")
			end if
		else
			messagebox("Advertencia","No Registra Dato")
		end if
		dw_ejecutivo.enabled		= false
		pb_cambio.enabled		= false
	else
		dw_ejecutivo.enabled		= true
		pb_cambio.enabled		= true
	end if
end if
end event

type em_grupo from editmask within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 334
integer y = 112
integer width = 521
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
boolean spin = true
end type

event modified;dw_lista.reset()
dw_ejecutivo.reset()
dw_ejecutivo.insertrow(0)
if long(em_grupo.text)>0 then pb_ok.triggerevent(clicked!)
end event

type st_1 from statictext within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 78
integer y = 128
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Grupo"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 3058
integer y = 1628
integer width = 261
integer height = 92
integer taborder = 190
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_eliminar_reemplazar_asigna_ejecutivo)
end event

type dw_lista from datawindow within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 32
integer y = 300
integer width = 3287
integer height = 1268
integer taborder = 50
string dataobject = "dw_lista_para_cambiar_ejecutivo"
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

event rowfocuschanging;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 32
integer y = 24
integer width = 1088
integer height = 240
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Datos de Asignación"
end type

type gb_2 from groupbox within w_eliminar_reemplazar_asigna_ejecutivo
integer x = 1161
integer y = 24
integer width = 2158
integer height = 240
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cambio de Ejecutivo Masivo"
end type

type gb_3 from groupbox within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 1221
integer y = 1584
integer width = 453
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within w_eliminar_reemplazar_asigna_ejecutivo
event ue_mousemove pbm_mousemove
integer x = 2295
integer y = 1584
integer width = 430
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 1086902484
end type

