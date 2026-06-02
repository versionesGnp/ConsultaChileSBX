forward
global type w_print_etiquetas from window
end type
type pb_final from picturebutton within w_print_etiquetas
end type
type pb_derecha from picturebutton within w_print_etiquetas
end type
type pb_izquierda from picturebutton within w_print_etiquetas
end type
type pb_primer from picturebutton within w_print_etiquetas
end type
type cb_imprimir from commandbutton within w_print_etiquetas
end type
type cb_cerrar from commandbutton within w_print_etiquetas
end type
type dw_lista from datawindow within w_print_etiquetas
end type
type gb_1 from groupbox within w_print_etiquetas
end type
end forward

global type w_print_etiquetas from window
integer width = 3835
integer height = 2388
boolean titlebar = true
string title = "Imprimir Etiquetas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
pb_final pb_final
pb_derecha pb_derecha
pb_izquierda pb_izquierda
pb_primer pb_primer
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_print_etiquetas w_print_etiquetas

on w_print_etiquetas.create
this.pb_final=create pb_final
this.pb_derecha=create pb_derecha
this.pb_izquierda=create pb_izquierda
this.pb_primer=create pb_primer
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.pb_final,&
this.pb_derecha,&
this.pb_izquierda,&
this.pb_primer,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_print_etiquetas.destroy
destroy(this.pb_final)
destroy(this.pb_derecha)
destroy(this.pb_izquierda)
destroy(this.pb_primer)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Long		ll_new,ll_tot_reg,ll_fila,ll_indi,ll_marca,ll_estado_cup,ll_rut,ll_correlativo
String		ls_base,ls_serie,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direccion,ls_nro,&
			ls_depto,ls_block,ls_poblacion,ls_comuna,ls_nombre_comp,ls_direc_comp
Double	ll_numero
gf_centrar(w_print_etiquetas)
dw_lista.settransobject(sqlca)
if isvalid(w_administrar_cuponera) then
	if w_administrar_cuponera.tab_1.SelectedTab=4 then
		ll_tot_reg				= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.rowcount()
		ll_fila						= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.Find("genera = 0", 1, ll_tot_reg)
		if ll_tot_reg > 0 and ll_fila > 0 then
			ll_correlativo		= 1
			for ll_indi = ll_fila to ll_tot_reg
				ll_marca			= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'genera')
				if ll_marca=0 then
					ls_base		= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_codigo')
					ls_serie		= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemstring(ll_indi,'cadena_serie')
					ll_numero	= w_administrar_cuponera.tab_1.tabpage_4.dw_print_masivo.getitemnumber(ll_indi,'cadena_numero')
					if ll_numero > 0 then
						SELECT	"CADENA"."EST_CUP",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."COMUNA"
						INTO 		:ll_estado_cup,		:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat,					:ls_tipo_via,					:ls_direccion,					:ls_nro,									:ls_depto,							:ls_block,							:ls_poblacion,				:ls_comuna  
						FROM 		"CADENA",	"CLIENTE",	"TIPO_VIA"  
						WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
								 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_numero ) )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ll_new	= dw_lista.insertrow(0)
							dw_lista.setitem(ll_new,'correlativo',ll_correlativo)
							dw_lista.setitem(ll_new,'signo',ll_estado_cup)
							dw_lista.setitem(ll_new,'rut',ll_rut)
							dw_lista.setitem(ll_new,'dv',ls_dv)
							if not isnull(ls_nombre) and ls_nombre<>'' and ls_nombre<>'-' then
								ls_nombre_comp	= 'Sr(a): '+ls_nombre
							else
								ls_nombre_comp	= 'Sr(a): '
							end if
							if not isnull(ls_ap_pat) and ls_ap_pat<>'' and ls_ap_pat<>'-' then
								ls_nombre_comp	= ls_nombre_comp+' '+ls_ap_pat
							end if
							if not isnull(ls_ap_mat) and ls_ap_mat<>'' and ls_ap_mat<>'-' then
								ls_nombre_comp	= ls_nombre_comp+' '+ls_ap_mat
							end if
							dw_lista.setitem(ll_new,'nombre',ls_nombre_comp)
							ls_direc_comp	= ls_tipo_via+ ' ' +ls_direccion
							if not isnull(ls_nro) and ls_nro<>'' and ls_nro <>'-' then
								ls_direc_comp	= ls_direc_comp +' Nº: '+ls_nro
							end if
							if not isnull(ls_depto) and ls_depto<>'' and ls_depto <>'-' then
								ls_direc_comp	= ls_direc_comp +' D/'+ls_depto
							end if
							if not isnull(ls_block) and ls_block<>'' and ls_block <>'-' then
								ls_direc_comp	= ls_direc_comp +' B/'+ls_block
							end if
							dw_lista.setitem(ll_new,'direccion',ls_direc_comp)
							dw_lista.setitem(ll_new,'poblacion',ls_poblacion)
							dw_lista.setitem(ll_new,'comuna',ls_comuna)
							dw_lista.setitem(ll_new,'base',ls_base)
							dw_lista.setitem(ll_new,'serie',ls_serie)
							dw_lista.setitem(ll_new,'numero',ll_numero)
							ll_correlativo ++
							Setnull(ls_nombre);Setnull(ls_ap_pat);Setnull(ls_ap_mat)
							Setnull(ls_nombre_comp);Setnull(ls_direc_comp)
							Setnull(ls_nro);Setnull(ls_depto);Setnull(ls_block)
						end if
					end if
				end if
			next
			dw_lista.accepttext()
		end if
	elseif w_administrar_cuponera.tab_1.SelectedTab=1 then
		ll_tot_reg				= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.rowcount()
		ll_fila						= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.Find("estado = 0", 1, ll_tot_reg)
		if ll_tot_reg > 0 and ll_fila > 0 then
			ll_correlativo		= 1
			for ll_indi = ll_fila to ll_tot_reg
				ll_marca			= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'estado')
				if ll_marca=0 then
					ls_base		= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'base')
					ls_serie		= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemstring(ll_indi,'serie')
					ll_numero	= w_administrar_cuponera.tab_1.tabpage_1.dw_lista.getitemnumber(ll_indi,'numero')
					if ll_numero > 0 then
						SELECT	"CADENA"."EST_CUP",	"CLIENTE"."RUT",	"CLIENTE"."DV",	"CLIENTE"."NOMBRE",	"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"TIPO_VIA"."DESCRIPCION",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."POBLACION",	"CLIENTE"."COMUNA"
						INTO 		:ll_estado_cup,		:ll_rut,				:ls_dv,				:ls_nombre,				:ls_ap_pat,					:ls_ap_mat,					:ls_tipo_via,					:ls_direccion,					:ls_nro,									:ls_depto,							:ls_block,							:ls_poblacion,				:ls_comuna  
						FROM 		"CADENA",	"CLIENTE",	"TIPO_VIA"  
						WHERE  ( "CADENA"."RUT" = "CLIENTE"."RUT" ) and  
								 ( "CLIENTE"."TIPO_VIA" = "TIPO_VIA"."TIPO_VIA" ) and  
								 (("CADENA"."CODIGO" = :ls_base ) AND  
								 ( "CADENA"."SERIE" = :ls_serie ) AND  
								 ( "CADENA"."NUMERO" = :ll_numero ) )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ll_new	= dw_lista.insertrow(0)
							dw_lista.setitem(ll_new,'correlativo',ll_correlativo)
							dw_lista.setitem(ll_new,'signo',ll_estado_cup)
							dw_lista.setitem(ll_new,'rut',ll_rut)
							dw_lista.setitem(ll_new,'dv',ls_dv)
							if not isnull(ls_nombre) and ls_nombre<>'' and ls_nombre<>'-' then
								ls_nombre_comp	= 'Sr(a): '+ls_nombre
							else
								ls_nombre_comp	= 'Sr(a): '
							end if
							if not isnull(ls_ap_pat) and ls_ap_pat<>'' and ls_ap_pat<>'-' then
								ls_nombre_comp	= ls_nombre_comp+' '+ls_ap_pat
							end if
							if not isnull(ls_ap_mat) and ls_ap_mat<>'' and ls_ap_mat<>'-' then
								ls_nombre_comp	= ls_nombre_comp+' '+ls_ap_mat
							end if
							dw_lista.setitem(ll_new,'nombre',ls_nombre_comp)
							ls_direc_comp	= ls_tipo_via+ ' ' +ls_direccion
							if not isnull(ls_nro) and ls_nro<>'' and ls_nro <>'-' then
								ls_direc_comp	= ls_direc_comp +' Nº: '+ls_nro
							end if
							if not isnull(ls_depto) and ls_depto<>'' and ls_depto <>'-' then
								ls_direc_comp	= ls_direc_comp +' D/'+ls_depto
							end if
							if not isnull(ls_block) and ls_block<>'' and ls_block <>'-' then
								ls_direc_comp	= ls_direc_comp +' B/'+ls_block
							end if
							dw_lista.setitem(ll_new,'direccion',ls_direc_comp)
							dw_lista.setitem(ll_new,'poblacion',ls_poblacion)
							dw_lista.setitem(ll_new,'comuna',ls_comuna)
							dw_lista.setitem(ll_new,'base',ls_base)
							dw_lista.setitem(ll_new,'serie',ls_serie)
							dw_lista.setitem(ll_new,'numero',ll_numero)
							ll_correlativo ++
							Setnull(ls_nombre);Setnull(ls_ap_pat);Setnull(ls_ap_mat)
							Setnull(ls_nombre_comp);Setnull(ls_direc_comp)
							Setnull(ls_nro);Setnull(ls_depto);Setnull(ls_block)
						end if
					end if
				end if
			next
			dw_lista.accepttext()
		end if
	end if
else
	close(w_print_etiquetas)
end if
end event

type pb_final from picturebutton within w_print_etiquetas
integer x = 2048
integer y = 2160
integer width = 101
integer height = 84
integer taborder = 60
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

type pb_derecha from picturebutton within w_print_etiquetas
integer x = 1943
integer y = 2160
integer width = 101
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Flec_de.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
end event

type pb_izquierda from picturebutton within w_print_etiquetas
integer x = 1838
integer y = 2160
integer width = 101
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Flec_iz.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
end event

type pb_primer from picturebutton within w_print_etiquetas
integer x = 1733
integer y = 2160
integer width = 101
integer height = 84
integer taborder = 30
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

type cb_imprimir from commandbutton within w_print_etiquetas
integer x = 37
integer y = 2148
integer width = 334
integer height = 104
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_print_etiquetas
integer x = 3429
integer y = 2148
integer width = 334
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_print_etiquetas)
end event

type dw_lista from datawindow within w_print_etiquetas
integer x = 37
integer y = 36
integer width = 3726
integer height = 2064
integer taborder = 10
string title = "none"
string dataobject = "dwe_imprimir_etiquetas_proceso"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_print_etiquetas
integer x = 1705
integer y = 2108
integer width = 471
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

