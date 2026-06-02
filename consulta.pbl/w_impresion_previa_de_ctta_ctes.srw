forward
global type w_impresion_previa_de_ctta_ctes from window
end type
type dw_1 from datawindow within w_impresion_previa_de_ctta_ctes
end type
type dw_impresion from datawindow within w_impresion_previa_de_ctta_ctes
end type
type cb_cancelar from commandbutton within w_impresion_previa_de_ctta_ctes
end type
type cb_imprimir from commandbutton within w_impresion_previa_de_ctta_ctes
end type
type p_11 from picture within w_impresion_previa_de_ctta_ctes
end type
type p_22 from picture within w_impresion_previa_de_ctta_ctes
end type
type p_33 from picture within w_impresion_previa_de_ctta_ctes
end type
type p_44 from picture within w_impresion_previa_de_ctta_ctes
end type
type pb_primer from picturebutton within w_impresion_previa_de_ctta_ctes
end type
type pb_sigue from picturebutton within w_impresion_previa_de_ctta_ctes
end type
type pb_antes from picturebutton within w_impresion_previa_de_ctta_ctes
end type
type pb_fin from picturebutton within w_impresion_previa_de_ctta_ctes
end type
end forward

global type w_impresion_previa_de_ctta_ctes from window
integer x = 192
integer y = 236
integer width = 3913
integer height = 2096
boolean titlebar = true
string title = "Impresión Previa"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
dw_1 dw_1
dw_impresion dw_impresion
cb_cancelar cb_cancelar
cb_imprimir cb_imprimir
p_11 p_11
p_22 p_22
p_33 p_33
p_44 p_44
pb_primer pb_primer
pb_sigue pb_sigue
pb_antes pb_antes
pb_fin pb_fin
end type
global w_impresion_previa_de_ctta_ctes w_impresion_previa_de_ctta_ctes

type variables
String		is_base_mesag
end variables

on w_impresion_previa_de_ctta_ctes.create
this.dw_1=create dw_1
this.dw_impresion=create dw_impresion
this.cb_cancelar=create cb_cancelar
this.cb_imprimir=create cb_imprimir
this.p_11=create p_11
this.p_22=create p_22
this.p_33=create p_33
this.p_44=create p_44
this.pb_primer=create pb_primer
this.pb_sigue=create pb_sigue
this.pb_antes=create pb_antes
this.pb_fin=create pb_fin
this.Control[]={this.dw_1,&
this.dw_impresion,&
this.cb_cancelar,&
this.cb_imprimir,&
this.p_11,&
this.p_22,&
this.p_33,&
this.p_44,&
this.pb_primer,&
this.pb_sigue,&
this.pb_antes,&
this.pb_fin}
end on

on w_impresion_previa_de_ctta_ctes.destroy
destroy(this.dw_1)
destroy(this.dw_impresion)
destroy(this.cb_cancelar)
destroy(this.cb_imprimir)
destroy(this.p_11)
destroy(this.p_22)
destroy(this.p_33)
destroy(this.p_44)
destroy(this.pb_primer)
destroy(this.pb_sigue)
destroy(this.pb_antes)
destroy(this.pb_fin)
end on

event open;Long	 	protesto, prorrogado, cancelado, reemplazado, i
String		ls_descrip
Long		ll_row

gf_centrar (w_impresion_previa_de_ctta_ctes)
dw_impresion.DataObject 	= gs_datawindow_a_imprimir
dw_impresion.SetTransObject(SQLCA)
gs_ventana													= 'w_impresion_previa_de_ctta_ctes'
f_valida_objeto()

if gs_datawindow_a_imprimir = 'dw_rep_impresion_ctta_cte_producto' then
	ll_row														= dw_impresion.Retrieve(gs_serie, gi_numero, gi_rut,gs_base)
else
	ll_row														= dw_impresion.Retrieve(gs_serie, gi_numero, gi_rut,gs_base)
end if
if ll_row > 0 then
	if dw_impresion.dataobject= 'd_rep_impresion_ctta_cte_orden' then
		if gs_base='O' then
			dw_impresion.object.t_2.text				= 'CUENTA CORRIENTE PROMESA [Base = O]'
		elseif gs_base='U' then
			dw_impresion.object.t_2.text				= 'CUENTA CORRIENTE COLUMNBARIO [Base = U]'
		elseif gs_base='M' then
			dw_impresion.object.t_2.text				= 'CUENTA CORRIENTE MULTIPRODUCTO [Base = M]'
		end if
		
	elseif dw_impresion.dataobject= 'dw_rep_impresion_ctta_cte_producto' then
		if gs_base = 'F' then
			if gs_serie='F' then
				is_base_mesag								= 'Servicio Funerario'
				dw_impresion.object.t_1.text			= 'CUENTA CORRIENTE SERVICIO FUNERARIO [Base = F ]'
			elseif gs_serie='C' then
				is_base_mesag								= 'Servicio Cremación'
				dw_impresion.object.t_1.text			= 'CUENTA CORRIENTE SERVICIO CREMATORIO'
			end if
		elseif gs_base = 'G' then
			is_base_mesag									= 'Servicio Cremación'
			dw_impresion.object.t_1.text				= 'CUENTA CORRIENTE SERVICIO CREMATORIO [Base = G]'
		elseif gs_base = 'V' then
			is_base_mesag									= 'Contrato de Servicio'
			dw_impresion.object.t_1.text				= 'CUENTA CORRIENTE CONTRATO DE SERVICIO [Base = V]'
		end if

	end if
	SELECT	"COD_PARQ"."NOMBRE"  
	INTO 		:ls_descrip  
	FROM 		"CADENA",	"COD_PARQ"  
	WHERE  ( "CADENA"."COD_PARQUE" = "COD_PARQ"."CODIGO" ) and  
			 (("CADENA"."CODIGO" = :gs_base ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_impresion.object.titulo.text 				= 'PARQUE '+ls_descrip
	else
		dw_impresion.object.titulo.text 				= 'PARQUE '+gs_nom_cod_parque	//gs_conexion
	end if
	dw_1.settransobject (sqlca)
	if dw_1.retrieve(gs_serie,gi_numero,gs_base) > 0 then
		for i = 1 to dw_1.rowcount()
			if dw_1.getitemstring(i,'documentos_estado_ch') = 'P' then
				protesto ++
			elseif dw_1.getitemstring(i,'documentos_estado_ch') = 'D' then
				prorrogado ++
			elseif dw_1.getitemstring(i,'documentos_estado_ch') = 'C' then
				cancelado ++
			elseif dw_1.getitemstring(i,'documentos_estado_ch') = 'P' then
				reemplazado ++
			end if
		next
		if protesto > 0 or prorrogado > 0 or cancelado > 0 or reemplazado > 0 then
			dw_impresion.object.protesto.text    		= string(protesto   ,'###,##0')
			dw_impresion.object.prorrogado.text  	= string(prorrogado ,'###,##0')
			dw_impresion.object.cancelado.text   	= string(cancelado  ,'###,##0')
			dw_impresion.object.reemplazado.text 	= string(reemplazado,'###,##0')
		end if
		
	end if
//---------------------------------------------------------------------------

else
	close(w_impresion_previa_de_ctta_ctes)
end if 
end event

type dw_1 from datawindow within w_impresion_previa_de_ctta_ctes
boolean visible = false
integer x = 1486
integer y = 1848
integer width = 201
integer height = 136
string dataobject = "d_listado_cuenta_cte_ch"
boolean livescroll = true
end type

type dw_impresion from datawindow within w_impresion_previa_de_ctta_ctes
integer x = 37
integer y = 32
integer width = 3813
integer height = 1780
integer taborder = 10
string dataobject = "d_rep_impresion_ctta_cte_repac_cta_mant"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancelar from commandbutton within w_impresion_previa_de_ctta_ctes
integer x = 3511
integer y = 1852
integer width = 334
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;Close(w_impresion_previa_de_ctta_ctes)
end event

type cb_imprimir from commandbutton within w_impresion_previa_de_ctta_ctes
integer x = 3173
integer y = 1852
integer width = 334
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;//f_printdlg(dw_impresion,gstr_print,w_impresion_previa_de_ctta_ctes)
//cb_cancelar.triggerevent(clicked!)
f_Print( dw_impresion )
end event

type p_11 from picture within w_impresion_previa_de_ctta_ctes
event clicked pbm_bnclicked
integer x = 55
integer y = 1880
integer width = 73
integer height = 60
string picturename = "primer.bmp"
boolean focusrectangle = false
end type

event clicked;pb_primer.TriggerEvent(clicked!)
end event

type p_22 from picture within w_impresion_previa_de_ctta_ctes
event clicked pbm_bnclicked
integer x = 155
integer y = 1880
integer width = 73
integer height = 60
string picturename = "antes.bmp"
boolean focusrectangle = false
end type

event clicked;pb_sigue.TriggerEvent(clicked!)
end event

type p_33 from picture within w_impresion_previa_de_ctta_ctes
event clicked pbm_bnclicked
integer x = 256
integer y = 1880
integer width = 73
integer height = 60
string picturename = "sigue.bmp"
boolean focusrectangle = false
end type

event clicked;pb_antes.TriggerEvent(clicked!)
end event

type p_44 from picture within w_impresion_previa_de_ctta_ctes
event clicked pbm_bnclicked
integer x = 352
integer y = 1880
integer width = 73
integer height = 60
string picturename = "fin.bmp"
boolean focusrectangle = false
end type

event clicked;pb_fin.TriggerEvent(clicked!)
end event

type pb_primer from picturebutton within w_impresion_previa_de_ctta_ctes
event clicked pbm_bnclicked
integer x = 46
integer y = 1864
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_impresion.ScrollToRow(1) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_sigue from picturebutton within w_impresion_previa_de_ctta_ctes
event clicked pbm_bnclicked
integer x = 146
integer y = 1864
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_impresion.ScrollPriorPage( )
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_antes from picturebutton within w_impresion_previa_de_ctta_ctes
event clicked pbm_bnclicked
integer x = 247
integer y = 1864
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_impresion.ScrollNextPage( ) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

type pb_fin from picturebutton within w_impresion_previa_de_ctta_ctes
event clicked pbm_bnclicked
integer x = 343
integer y = 1864
integer width = 96
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment htextalign = left!
end type

event clicked;dw_impresion.ScrollToRow(dw_impresion.rowcount() ) 
//st_registros.text = ' '+DW_1.GetItemstring(1,'paginas')
end event

