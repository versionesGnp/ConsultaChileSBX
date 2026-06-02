forward
global type w_informe_general_at from window
end type
type cb_historico from commandbutton within w_informe_general_at
end type
type cb_ctacte from commandbutton within w_informe_general_at
end type
type cb_imprimir from commandbutton within w_informe_general_at
end type
type cb_exportar from commandbutton within w_informe_general_at
end type
type cb_filtrar from commandbutton within w_informe_general_at
end type
type cb_ordenar from commandbutton within w_informe_general_at
end type
type cb_cerrar from commandbutton within w_informe_general_at
end type
type em_mora_fin from editmask within w_informe_general_at
end type
type st_4 from statictext within w_informe_general_at
end type
type em_mora_ini from editmask within w_informe_general_at
end type
type st_3 from statictext within w_informe_general_at
end type
type dw_estado_gestion from datawindow within w_informe_general_at
end type
type pb_ok from picturebutton within w_informe_general_at
end type
type dw_ejecutivo from datawindow within w_informe_general_at
end type
type dw_parque from datawindow within w_informe_general_at
end type
type rb_grupo from radiobutton within w_informe_general_at
end type
type rb_ejecutivo from radiobutton within w_informe_general_at
end type
type rb_parque from radiobutton within w_informe_general_at
end type
type dw_lista from datawindow within w_informe_general_at
end type
type gb_1 from groupbox within w_informe_general_at
end type
type gb_2 from groupbox within w_informe_general_at
end type
type gb_3 from groupbox within w_informe_general_at
end type
end forward

global type w_informe_general_at from window
integer width = 3442
integer height = 1924
boolean titlebar = true
string title = "Informe General  Cartera Asignada Ejecutivo en Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_historico cb_historico
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_cerrar cb_cerrar
em_mora_fin em_mora_fin
st_4 st_4
em_mora_ini em_mora_ini
st_3 st_3
dw_estado_gestion dw_estado_gestion
pb_ok pb_ok
dw_ejecutivo dw_ejecutivo
dw_parque dw_parque
rb_grupo rb_grupo
rb_ejecutivo rb_ejecutivo
rb_parque rb_parque
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_informe_general_at w_informe_general_at

type variables
Long		il_row
String	is_estado
end variables

on w_informe_general_at.create
this.cb_historico=create cb_historico
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_cerrar=create cb_cerrar
this.em_mora_fin=create em_mora_fin
this.st_4=create st_4
this.em_mora_ini=create em_mora_ini
this.st_3=create st_3
this.dw_estado_gestion=create dw_estado_gestion
this.pb_ok=create pb_ok
this.dw_ejecutivo=create dw_ejecutivo
this.dw_parque=create dw_parque
this.rb_grupo=create rb_grupo
this.rb_ejecutivo=create rb_ejecutivo
this.rb_parque=create rb_parque
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.cb_historico,&
this.cb_ctacte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_cerrar,&
this.em_mora_fin,&
this.st_4,&
this.em_mora_ini,&
this.st_3,&
this.dw_estado_gestion,&
this.pb_ok,&
this.dw_ejecutivo,&
this.dw_parque,&
this.rb_grupo,&
this.rb_ejecutivo,&
this.rb_parque,&
this.dw_lista,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_informe_general_at.destroy
destroy(this.cb_historico)
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_cerrar)
destroy(this.em_mora_fin)
destroy(this.st_4)
destroy(this.em_mora_ini)
destroy(this.st_3)
destroy(this.dw_estado_gestion)
destroy(this.pb_ok)
destroy(this.dw_ejecutivo)
destroy(this.dw_parque)
destroy(this.rb_grupo)
destroy(this.rb_ejecutivo)
destroy(this.rb_parque)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;Long	ll_new
gf_centrar(w_informe_general_at)

dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)

dw_ejecutivo.settransobject(sqlca)
dw_ejecutivo.insertrow(0)

dw_estado_gestion.settransobject(sqlca)
ll_new	= dw_estado_gestion.insertrow(0)
dw_estado_gestion.setitem(ll_new,'estado','G')

rb_parque.checked	= true
rb_parque.triggerevent(clicked!)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'parque',1)
else
	dw_parque.setitem(1,'parque',11)
end if

end event

type cb_historico from commandbutton within w_informe_general_at
event ue_mousemove pbm_dwnmousemove
integer x = 1605
integer y = 1676
integer width = 283
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gs_base		= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_ctacte from commandbutton within w_informe_general_at
integer x = 1161
integer y = 1676
integer width = 407
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string		ls_base,ls_serie,param
long 	 	ll_rut
Double	ll_numero

if il_row > 0 then
	gs_base		= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O","U","M" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "F","G" // Anexo funeraria
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			OpenWithParm(w_cuenta_corriente_funeraria,param)	
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
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type cb_imprimir from commandbutton within w_informe_general_at
event ue_mousemove pbm_mousemove
integer x = 859
integer y = 1676
integer width = 247
integer height = 92
integer taborder = 140
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

type cb_exportar from commandbutton within w_informe_general_at
event ue_mousemove pbm_mousemove
integer x = 567
integer y = 1676
integer width = 247
integer height = 92
integer taborder = 130
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

type cb_filtrar from commandbutton within w_informe_general_at
event ue_mousemove pbm_mousemove
integer x = 315
integer y = 1676
integer width = 247
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;//string nulo
long		ll_filas
//setnull (nulo)
//dw_lista.SETfilter(NULO)
//dw_lista.filter()
//gs_formula 	= dw_lista.describe("datawindow.syntax")
//messagebox("",gs_formula)

long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas		= dw_lista.rowcount()
gs_formula 	= dw_lista.describe("datawindow.syntax")
ll_largototal	= len(gs_formula)
ll_posini	= Pos(gs_formula, "filter") + 8
ll_posfin	= len("~nfilter~n")
ls_texto		= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto		= ll_posfin - ll_posini
gs_formula	= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula	= ''
end if

end event

type cb_ordenar from commandbutton within w_informe_general_at
event ue_mousemove pbm_dwnmousemove
integer x = 64
integer y = 1676
integer width = 247
integer height = 92
integer taborder = 110
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

type cb_cerrar from commandbutton within w_informe_general_at
integer x = 3090
integer y = 1676
integer width = 283
integer height = 92
integer taborder = 170
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_general_at)
end event

type em_mora_fin from editmask within w_informe_general_at
integer x = 2057
integer y = 360
integer width = 329
integer height = 88
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,##0"
boolean spin = true
end type

event modified;dw_lista.reset()
end event

type st_4 from statictext within w_informe_general_at
integer x = 1874
integer y = 376
integer width = 165
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_mora_ini from editmask within w_informe_general_at
integer x = 1527
integer y = 360
integer width = 329
integer height = 88
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,##0"
boolean spin = true
end type

event modified;dw_lista.reset()
end event

type st_3 from statictext within w_informe_general_at
integer x = 1243
integer y = 376
integer width = 270
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Mora Inicial"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_estado_gestion from datawindow within w_informe_general_at
integer x = 151
integer y = 360
integer width = 754
integer height = 104
integer taborder = 60
string title = "none"
string dataobject = "dwe_ingresar_estado_gestion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type pb_ok from picturebutton within w_informe_general_at
integer x = 3191
integer y = 348
integer width = 133
integer height = 116
integer taborder = 90
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_cod_parque,ll_grupo,ll_pasa,ll_mora_ini,ll_mora_fin,ll_tot_reg
String	ls_cod_ejecutivo,ls_estado,ls_descrip_parque,ls_titulo,&
			ls_descrip_estado,ls_nombre,ls_descrip_cartera
datetime	ld_fec_ini, ld_fec_fin
dw_lista.reset()
ll_pasa													= 0
if rb_parque.checked=true then
	ll_cod_parque										= dw_parque.getitemnumber(1,'parque')
	if ll_cod_parque=0 or isnull(ll_cod_parque) then
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
		ll_pasa ++
	end if
elseif rb_ejecutivo.checked=true then
	ls_cod_ejecutivo									= trim(dw_ejecutivo.getitemstring(1,'ejecutivo_at'))
	if ls_cod_ejecutivo='' or isnull(ls_cod_ejecutivo) then
		messagebox("Advertencia","Debe Seleccionar Ejecutivo")
		dw_ejecutivo.setfocus()
		ll_pasa ++
	end if
elseif rb_parque.checked=false and rb_ejecutivo.checked=false and rb_grupo.checked=false then
	messagebox("Advertencia","Debe Seleccionar Modo de Agrupación")
	ll_pasa ++
end if
ls_estado												= trim(dw_estado_gestion.getitemstring(1,'estado'))
if isnull(ls_estado) then ls_estado='%'
if ls_estado='' then
	messagebox("Advertencia","Debe Seleccionar Estado Gestion")
	dw_estado_gestion.setfocus()
	ll_pasa ++
end if
ll_mora_ini												= long(em_mora_ini.text)
ll_mora_fin												= long(em_mora_fin.text)
if isnull(ll_mora_ini) then ll_mora_ini=0
if isnull(ll_mora_fin) then ll_mora_fin=0
if ll_mora_ini > ll_mora_fin then
	ll_pasa ++
	messagebox("Advertencia","Rango Cuotas Mora Inválida, Mora Inicial NO debe ser Mayor")
	em_mora_fin.setfocus()
elseif ll_mora_ini=0 and ll_mora_fin=0 then
	ll_mora_ini											= 0
	ll_mora_fin											= 500
end if
if ll_pasa=0 then
	if rb_parque.checked=true then
		ll_tot_reg										= dw_lista.retrieve(ll_cod_parque,ls_estado,ll_mora_ini,ll_mora_fin)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Dato")
		else
			SELECT	"COD_PARQ"."NOMBRE"  
			INTO 		:ls_descrip_parque  
			FROM 		"COD_PARQ"  
			WHERE 	"COD_PARQ"."CODIGO" = :ll_cod_parque   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.object.t_parque.text		= 'Parque:  '+ ls_descrip_parque
			end if
		end if
	elseif rb_ejecutivo.checked=true then
		ll_tot_reg										= dw_lista.retrieve(ls_cod_ejecutivo,ls_estado,ll_mora_ini,ll_mora_fin)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Dato")
		else
			SELECT	"ENCARGADOS"."NOMBRE"  
			INTO 		:ls_nombre 
			FROM 		"ENCARGADOS"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_cod_ejecutivo   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.object.t_parque.text	= 'Nombre Ejecutivo Terreno:   ' + ls_nombre
			end if
		end if
	elseif rb_grupo.checked=true then
		ll_tot_reg									= dw_lista.retrieve(ls_estado,ll_mora_ini,ll_mora_fin)
		if ll_tot_reg=0 then
			messagebox("Advertencia","No Registra Dato")
		else
			SELECT	"AT_LISTA_GESTION"."OBERVACION"  
			INTO 		:ls_descrip_cartera  
			FROM 		"AT_LISTA_GESTION"  
			WHERE 	"AT_LISTA_GESTION"."CODIGO_GRUPO" = :ll_grupo   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				dw_lista.object.t_parque.text	= 'Cartera Asignada:   ' + string(ll_grupo,"###,###,###,###")+' - '+ls_descrip_cartera
			end if
		end if
	end if
	if dw_lista.rowcount()>0 then
		ls_titulo									= 'Informe '
		if ls_estado<>'%' then
			SELECT	"GESTION_ESTADO_LISTA"."DESCRIPCION"  
			INTO 		:ls_descrip_estado  
			FROM 		"GESTION_ESTADO_LISTA"  
			WHERE 	"GESTION_ESTADO_LISTA"."CODIGO" = :ls_estado   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if isnull(ls_titulo) or ls_titulo='' then
					ls_titulo						= 'Estado Gestión '+ls_descrip_estado
				else
					ls_titulo						= ls_titulo+' - Estado Gestión '+ls_descrip_estado
				end if
			end if
		end if
		if ll_mora_ini>=0 and ll_mora_fin>0 and ll_mora_fin<>500 then
			if isnull(ls_titulo) or ls_titulo='' then
				ls_titulo							= 'Rango Mora Crédito de '+ string(ll_mora_ini,"###,###,###") + ' a '+string(ll_mora_fin,"###,###,###")+' Cuotas'
			else
				ls_titulo							= ls_titulo+' - Rango Mora Crédito de '+ string(ll_mora_ini,"###,###,###") + ' a '+string(ll_mora_fin,"###,###,###")+' Cuotas'
			end if
		end if
		dw_lista.object.t_titulo.text			= ls_titulo
	end if
end if
end event

type dw_ejecutivo from datawindow within w_informe_general_at
integer x = 1271
integer y = 148
integer width = 837
integer height = 112
integer taborder = 20
string title = "none"
string dataobject = "dde_ejecutivo_atencion_terreno_uno"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type dw_parque from datawindow within w_informe_general_at
integer x = 151
integer y = 148
integer width = 768
integer height = 112
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_filtro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type rb_grupo from radiobutton within w_informe_general_at
integer x = 2496
integer y = 84
integer width = 727
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todo"
end type

event clicked;if rb_grupo.checked=true then
	dw_lista.dataobject	= 'dw_solicitud_informe_cartera_grupo'
	dw_lista.settransobject(sqlca)
	
	dw_parque.reset()
	dw_parque.insertrow(0)
	dw_parque.enabled		= false
	
	dw_ejecutivo.reset()
	dw_ejecutivo.insertrow(0)
	dw_ejecutivo.enabled	= false
	
	dw_estado_gestion.setfocus()
end if
end event

type rb_ejecutivo from radiobutton within w_informe_general_at
integer x = 1289
integer y = 84
integer width = 521
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ejecutivo"
end type

event clicked;if rb_ejecutivo.checked=true then
	dw_lista.dataobject	= 'dw_solicitud_informe_cartera_ejecutivo'
	dw_lista.settransobject(sqlca)
	
	dw_parque.reset()
	dw_parque.insertrow(0)
	dw_parque.enabled		= false
	
	dw_ejecutivo.reset()
	dw_ejecutivo.insertrow(0)
	dw_ejecutivo.enabled	= true
	
	dw_ejecutivo.setfocus()
end if
end event

type rb_parque from radiobutton within w_informe_general_at
integer x = 151
integer y = 84
integer width = 521
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
end type

event clicked;Long	ll_new
if rb_parque.checked=true then
	dw_lista.dataobject	= 'dw_solicitud_informe_cartera_parque'
	dw_lista.settransobject(sqlca)
	dw_parque.reset()
	ll_new				= dw_parque.insertrow(0)
	dw_parque.enabled	= true
	
	dw_ejecutivo.reset()
	dw_ejecutivo.insertrow(0)
	dw_ejecutivo.enabled	= false
	
	if gs_conexion	= "Parque El Prado" then
		dw_parque.setitem(ll_new,'parque',1)
	else
		dw_parque.setitem(ll_new,'parque',11)
	end if
	dw_parque.setfocus()
end if
end event

type dw_lista from datawindow within w_informe_general_at
integer x = 37
integer y = 520
integer width = 3337
integer height = 1096
integer taborder = 100
string dataobject = "dw_solicitud_informe_cartera_grupo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')
end if
end event

type gb_1 from groupbox within w_informe_general_at
integer x = 37
integer y = 12
integer width = 3337
integer height = 272
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Modo de Agrupación"
end type

type gb_2 from groupbox within w_informe_general_at
integer x = 37
integer y = 288
integer width = 3337
integer height = 208
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Criterios de Filtro"
end type

type gb_3 from groupbox within w_informe_general_at
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1628
integer width = 1088
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

