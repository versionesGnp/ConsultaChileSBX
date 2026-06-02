forward
global type w_imprimir_etiquetas_externas from window
end type
type cb_exportar from commandbutton within w_imprimir_etiquetas_externas
end type
type cb_ordenar from commandbutton within w_imprimir_etiquetas_externas
end type
type cb_setup from commandbutton within w_imprimir_etiquetas_externas
end type
type dw_no_encontrados from datawindow within w_imprimir_etiquetas_externas
end type
type dw_base from datawindow within w_imprimir_etiquetas_externas
end type
type cb_limpiar from commandbutton within w_imprimir_etiquetas_externas
end type
type cb_imprimir from commandbutton within w_imprimir_etiquetas_externas
end type
type cb_cerrar from commandbutton within w_imprimir_etiquetas_externas
end type
type cb_cargar from commandbutton within w_imprimir_etiquetas_externas
end type
type dw_etiqueta from datawindow within w_imprimir_etiquetas_externas
end type
type gb_1 from groupbox within w_imprimir_etiquetas_externas
end type
end forward

global type w_imprimir_etiquetas_externas from window
integer width = 3835
integer height = 1996
boolean titlebar = true
string title = "Imprimir Etiquetas sin BASE"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
cb_exportar cb_exportar
cb_ordenar cb_ordenar
cb_setup cb_setup
dw_no_encontrados dw_no_encontrados
dw_base dw_base
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
cb_cargar cb_cargar
dw_etiqueta dw_etiqueta
gb_1 gb_1
end type
global w_imprimir_etiquetas_externas w_imprimir_etiquetas_externas

on w_imprimir_etiquetas_externas.create
this.cb_exportar=create cb_exportar
this.cb_ordenar=create cb_ordenar
this.cb_setup=create cb_setup
this.dw_no_encontrados=create dw_no_encontrados
this.dw_base=create dw_base
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.cb_cargar=create cb_cargar
this.dw_etiqueta=create dw_etiqueta
this.gb_1=create gb_1
this.Control[]={this.cb_exportar,&
this.cb_ordenar,&
this.cb_setup,&
this.dw_no_encontrados,&
this.dw_base,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_cerrar,&
this.cb_cargar,&
this.dw_etiqueta,&
this.gb_1}
end on

on w_imprimir_etiquetas_externas.destroy
destroy(this.cb_exportar)
destroy(this.cb_ordenar)
destroy(this.cb_setup)
destroy(this.dw_no_encontrados)
destroy(this.dw_base)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.cb_cargar)
destroy(this.dw_etiqueta)
destroy(this.gb_1)
end on

event open;gf_centrar(w_imprimir_etiquetas_externas)
dw_etiqueta.settransobject(sqlca)
dw_base.settransobject(sqlca)
dw_no_encontrados.settransobject(sqlca)
end event

type cb_exportar from commandbutton within w_imprimir_etiquetas_externas
event ue_mousemove pbm_mousemove
integer x = 1326
integer y = 1708
integer width = 238
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_etiqueta
if dw_etiqueta.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_ordenar from commandbutton within w_imprimir_etiquetas_externas
event ue_mousemove pbm_dwnmousemove
integer x = 1083
integer y = 1708
integer width = 238
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_etiqueta.SETSORT(NULO)
dw_etiqueta.SORT()

end event

type cb_setup from commandbutton within w_imprimir_etiquetas_externas
event ue_mousemove pbm_mousemove
integer x = 1618
integer y = 1708
integer width = 293
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print &Setup"
end type

event clicked;PrintSetup()
end event

type dw_no_encontrados from datawindow within w_imprimir_etiquetas_externas
boolean visible = false
integer x = 2039
integer y = 1740
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_lista_contratos_no_encontrados"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_base from datawindow within w_imprimir_etiquetas_externas
boolean visible = false
integer x = 2542
integer y = 1740
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dwe_lista_base_etiqueta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_limpiar from commandbutton within w_imprimir_etiquetas_externas
integer x = 1989
integer y = 1704
integer width = 315
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_etiqueta.reset()
dw_base.reset()
dw_no_encontrados.reset()
end event

type cb_imprimir from commandbutton within w_imprimir_etiquetas_externas
integer x = 553
integer y = 1704
integer width = 457
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir Etiquetas"
end type

event clicked;Long	ll_resp
if dw_etiqueta.rowcount()>0 then
	f_Print( dw_etiqueta )
else
	messagebox("Advertencia","No Registra Etiquetas para Imprimir")
end if
if dw_no_encontrados.rowcount()>0 then
	ll_resp	= messagebox("Advertencia","Se encontraron Contratos sin Información, desea Imprimir",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		f_Print( dw_no_encontrados )
	end if
end if
end event

type cb_cerrar from commandbutton within w_imprimir_etiquetas_externas
integer x = 3415
integer y = 1704
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_imprimir_etiquetas_externas)
end event

type cb_cargar from commandbutton within w_imprimir_etiquetas_externas
integer x = 41
integer y = 1704
integer width = 439
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cargar &Archivo"
end type

event clicked;integer 	value
String		docname,named,ls_base,ls_serie,ls_nombres,ls_ap_pat,ls_ap_mat,ls_direc_p,&
			ls_pob,ls_sexo,ls_nro_p,ls_depto_p,ls_block_p,ls_tipo_via,ls_comuna,ls_ciudad,&
			ls_nom_comp,ls_dir_comp,ls_trato,ls_estado_tit
Long		ll_tot_reg,ll_indi,ll_rut,ll_new_no,ll_new
Double	ll_numero

dw_base.reset()
//value		= GetFileOpenName("Seleccione Archivo", docname, named, "*.txt", "Archivos de Texto (*.txt")
value 	= GetFileOpenName("Seleccione Archivo",+ docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
SetPointer(HourGlass!)
If value = 1 Then
	dw_base.ImportFile(docname)
End If
ll_tot_reg	= dw_base.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ls_base		= dw_base.getitemstring(ll_indi,'base')
		ls_serie		= dw_base.getitemstring(ll_indi,'serie')
		ll_numero	= dw_base.getitemnumber(ll_indi,'numero')
		SELECT	"CADENA"."RUT"  
		INTO 		:ll_rut  
		FROM 		"CADENA"  
		WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
				 ( "CADENA"."SERIE" = :ls_serie ) AND  
				 ( "CADENA"."NUMERO" = :ll_numero )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			SELECT	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."POBLACION",	"CLIENTE"."SEXO",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"TIPO_VIA"."DESCRIPCION",	"COMUNA"."SIGLA_COMUNA",	"CIUDAD"."SIGLA_CIUDAD",	"CLIENTE"."ESTADO_TITULAR"
			INTO 		:ls_nombres,			:ls_ap_pat,					:ls_ap_mat,					:ls_direc_p,					:ls_pob,						:ls_sexo,			:ls_nro_p,								:ls_depto_p,						:ls_block_p,						:ls_tipo_via,					:ls_comuna,						:ls_ciudad,						:ls_estado_tit
			FROM 		"CLIENTE",   
						"CIUDAD",   
						"COMUNA",   
						"TIPO_VIA"  
			WHERE  ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
					 ( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) and  
					 ( "CLIENTE"."CIUDAD" = "CIUDAD"."CODIGO_CIUDAD" ) and  
					 (("CLIENTE"."RUT" = :ll_rut ) )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ls_estado_tit='0' then
					ls_nom_comp	= ls_nombres+' '+ls_ap_pat+' '+ls_ap_mat
				else
					ls_nom_comp	= 'FAMILIA '+ls_ap_pat+' '+ls_ap_mat
				end if
				if not isnull(ls_tipo_via) and ls_tipo_via<>'' and ls_tipo_via<>'-' then
					ls_dir_comp	= ls_tipo_via+' '+ls_direc_p
				else
					ls_dir_comp	= ls_direc_p
				end if
				if not isnull(ls_nro_p) and ls_nro_p<>'' and ls_nro_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Nº: '+ls_nro_p
				end if
				if not isnull(ls_depto_p) and ls_depto_p<>'' and ls_depto_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Depto: '+ls_depto_p
				end if
				if not isnull(ls_block_p) and ls_block_p<>'' and ls_block_p<>'-' then
					ls_dir_comp	= ls_dir_comp+' Block: '+ls_block_p
				end if
				if ls_sexo='M' then
					ls_trato	= 'Sr.'
				else
					ls_trato	= 'Sra.'
				end if
				ll_new	= dw_etiqueta.insertrow(0)
				dw_etiqueta.scrolltorow(ll_new)
				dw_etiqueta.setitem(ll_new,'base',ls_base)
				dw_etiqueta.setitem(ll_new,'serie',ls_serie)
				dw_etiqueta.setitem(ll_new,'numero',ll_numero)
				dw_etiqueta.setitem(ll_new,'trato',ls_trato)
				dw_etiqueta.setitem(ll_new,'nombre_completo',ls_nom_comp)
				dw_etiqueta.setitem(ll_new,'direccion_completa',ls_dir_comp)
				dw_etiqueta.setitem(ll_new,'villa_poblacion',ls_pob)
				dw_etiqueta.setitem(ll_new,'ciudad',upper(ls_ciudad))
				dw_etiqueta.setitem(ll_new,'comuna',upper(ls_comuna))
			else
				ll_new_no	= dw_no_encontrados.insertrow(0)
				dw_no_encontrados.scrolltorow(ll_new_no)
				dw_no_encontrados.setitem(ll_new_no,'base',ls_base)
				dw_no_encontrados.setitem(ll_new_no,'serie',ls_serie)
				dw_no_encontrados.setitem(ll_new_no,'numero',ll_numero)
				dw_no_encontrados.setitem(ll_new_no,'rut',ll_rut)
			end if
		else
			ll_new_no	= dw_no_encontrados.insertrow(0)
			dw_no_encontrados.scrolltorow(ll_new_no)
			dw_no_encontrados.setitem(ll_new_no,'base',ls_base)
			dw_no_encontrados.setitem(ll_new_no,'serie',ls_serie)
			dw_no_encontrados.setitem(ll_new_no,'numero',ll_numero)
			dw_no_encontrados.setitem(ll_new_no,'rut',0)
		end if
	next
end if
SetPointer(Arrow!)
end event

type dw_etiqueta from datawindow within w_imprimir_etiquetas_externas
integer x = 41
integer y = 36
integer width = 3717
integer height = 1620
integer taborder = 10
string title = "none"
string dataobject = "dwe_imprimir_etiqueta_externa"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_imprimir_etiquetas_externas
event ue_mousemove pbm_mousemove
integer x = 1061
integer y = 1656
integer width = 873
integer height = 168
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

