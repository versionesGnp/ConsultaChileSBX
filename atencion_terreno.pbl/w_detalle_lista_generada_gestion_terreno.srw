forward
global type w_detalle_lista_generada_gestion_terreno from window
end type
type cb_modif_comi from commandbutton within w_detalle_lista_generada_gestion_terreno
end type
type cb_historico from commandbutton within w_detalle_lista_generada_gestion_terreno
end type
type cb_cerrar from commandbutton within w_detalle_lista_generada_gestion_terreno
end type
type cb_ctacte from commandbutton within w_detalle_lista_generada_gestion_terreno
end type
type cb_imprimir from commandbutton within w_detalle_lista_generada_gestion_terreno
end type
type cb_exportar from commandbutton within w_detalle_lista_generada_gestion_terreno
end type
type cb_filtrar from commandbutton within w_detalle_lista_generada_gestion_terreno
end type
type cb_ordenar from commandbutton within w_detalle_lista_generada_gestion_terreno
end type
type dw_lista from datawindow within w_detalle_lista_generada_gestion_terreno
end type
type gb_1 from groupbox within w_detalle_lista_generada_gestion_terreno
end type
end forward

global type w_detalle_lista_generada_gestion_terreno from window
integer width = 3579
integer height = 1828
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_modif_comi cb_modif_comi
cb_historico cb_historico
cb_cerrar cb_cerrar
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_lista_generada_gestion_terreno w_detalle_lista_generada_gestion_terreno

type variables
long		il_codigo,il_row
String	MenuHabilitado,is_estado,is_string
end variables

on w_detalle_lista_generada_gestion_terreno.create
this.cb_modif_comi=create cb_modif_comi
this.cb_historico=create cb_historico
this.cb_cerrar=create cb_cerrar
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_modif_comi,&
this.cb_historico,&
this.cb_cerrar,&
this.cb_ctacte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_lista_generada_gestion_terreno.destroy
destroy(this.cb_modif_comi)
destroy(this.cb_historico)
destroy(this.cb_cerrar)
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;long		ll_indi, ll_tot_reg, ll_count_reg, ll_rut
Datetime	ldt_fecha
String		ls_nombre,ls_tipo_gestion

SetPointer(HourGlass!)
connect using trans_1;

gf_centrar(w_detalle_lista_generada_gestion_terreno)
il_codigo						= long(substr(1,1,Message.StringParm))
ls_tipo_gestion				= substr(1,2,Message.StringParm)
dw_lista.settransobject(sqlca)
if ls_tipo_gestion='N' then
	ls_tipo_gestion								= 'N'
elseif ls_tipo_gestion='C' or ls_tipo_gestion='M' then
	ls_tipo_gestion								= 'CM'
end if

SELECT	"ENCARGADOS"."NOMBRE"  
INTO 		:ls_nombre  
FROM 	"AT_LISTA_GESTION",   
			"ENCARGADOS"  
WHERE	( "AT_LISTA_GESTION"."USUARIO_ASIGNADO" = "ENCARGADOS"."CODIGO_USUARIO" ) and  
			(("AT_LISTA_GESTION"."CODIGO_GRUPO" = :il_codigo ) )   
USING	sqlca;
this.title						= 'Detalle de Atención Clientes en Terreno          CODIGO:  '+string(il_codigo)+'          Ejecutivo:  '+ls_nombre
ll_tot_reg					= dw_lista.retrieve(il_codigo)
if ll_tot_reg>0 then
	for ll_indi = 1 to ll_tot_reg
		ll_rut					= dw_lista.getitemnumber(ll_indi,'at_gestion_rut_cliente')
		ldt_fecha				= dw_lista.getitemdatetime(ll_indi,'at_lista_gestion_fecha_crea')
		idw_detalle.retrieve(ls_tipo_gestion)
		ll_count_reg	= 0
		SELECT	Count("TELE_LOG"."RUT")  
		INTO 		:ll_count_reg 
		FROM		"TELE_LOG","ENCARGADOS"  
		WHERE	( "TELE_LOG"."USUARIO" = "ENCARGADOS"."CODIGO_USUARIO" ) and  
					(("TELE_LOG"."RUT" = :ll_rut ) AND  
				 	( "TELE_LOG"."FECHA" >= :ldt_fecha ) AND
				 	( "ENCARGADOS"."DEPTO" = 'E' ))    
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'estatus_telefonico',0)
		else
			dw_lista.setitem(ll_indi,'estatus_telefonico',1)
		end if
		ll_count_reg	= 0
		SELECT	count("CARTA_LOG"."RUT")  
		INTO 		:ll_count_reg  
		FROM 	"CARTA_LOG"  
		WHERE	( "CARTA_LOG"."RUT" = :ll_rut ) and
					( "CARTA_LOG"."FECHA_CARTA" >= :ldt_fecha )
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'estatus_carta',0)
		else
			dw_lista.setitem(ll_indi,'estatus_carta',1)
		end if
		ll_count_reg	= 0
		SELECT	"ATENCION_LOG"."RUT"  
		INTO 		:ll_count_reg  
		FROM 	"ATENCION_LOG","ENCARGADOS"  
		WHERE	( "ATENCION_LOG"."USUARIO" = "ENCARGADOS"."CODIGO_USUARIO" ) and  
				 	(("ATENCION_LOG"."RUT" = :ll_rut ) AND  
					( "ATENCION_LOG"."FECHA" >= :ldt_fecha ) AND  
				 	( "ENCARGADOS"."DEPTO" = 'E' ) )   
		Using		trans_1;
		if ll_count_reg>0 then
			dw_lista.setitem(ll_indi,'estatus_publico',0)
		else
			dw_lista.setitem(ll_indi,'estatus_publico',1)
		end if
	next
end if
disconnect using trans_1;
SetPointer(Arrow!)
end event

type cb_modif_comi from commandbutton within w_detalle_lista_generada_gestion_terreno
event ue_mousemove pbm_dwnmousemove
integer x = 2624
integer y = 1576
integer width = 425
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pago Comisión"
end type

event clicked;string		ls_base,ls_serie,ls_string,ls_tipo_gest
long		ll_cod_grupo
Double	ll_numero

if dw_lista.getrow()>0 then
	ls_base					= dw_lista.getitemstring(il_row,'at_gestion_base')
	ls_serie					= dw_lista.getitemstring(il_row,'at_gestion_serie')
	ll_numero				= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	ll_cod_grupo			= dw_lista.getitemnumber(il_row,'at_lista_gestion_codigo_grupo')
	ls_tipo_gest				= dw_lista.getitemstring(il_row,'at_gestion_tipo_cobranza')
	
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and ll_numero>0 then
		ls_string				= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+string(ll_cod_grupo)+'~t'+ls_tipo_gest
		if isvalid(w_comision_ejec_terreno_asig_anular) then close(w_comision_ejec_terreno_asig_anular)
		OpenWithParm (w_comision_ejec_terreno_asig_anular,ls_string)
	end if
end if
end event

type cb_historico from commandbutton within w_detalle_lista_generada_gestion_terreno
event ue_mousemove pbm_dwnmousemove
integer x = 1669
integer y = 1576
integer width = 283
integer height = 92
integer taborder = 70
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

type cb_cerrar from commandbutton within w_detalle_lista_generada_gestion_terreno
integer x = 3191
integer y = 1576
integer width = 329
integer height = 92
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_lista_generada_gestion_terreno)
end event

type cb_ctacte from commandbutton within w_detalle_lista_generada_gestion_terreno
integer x = 1198
integer y = 1576
integer width = 407
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string ls_base,ls_serie,param
long 	 ll_numero,ll_rut
if il_row > 0 then
	gs_base				= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie				= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero			= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut					= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')
end if
end event

type cb_imprimir from commandbutton within w_detalle_lista_generada_gestion_terreno
event ue_mousemove pbm_mousemove
integer x = 859
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 50
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

type cb_exportar from commandbutton within w_detalle_lista_generada_gestion_terreno
event ue_mousemove pbm_mousemove
integer x = 567
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 40
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

type cb_filtrar from commandbutton within w_detalle_lista_generada_gestion_terreno
event ue_mousemove pbm_mousemove
integer x = 315
integer y = 1576
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_lista.SETfilter(ls_texto)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_detalle_lista_generada_gestion_terreno
event ue_mousemove pbm_dwnmousemove
integer x = 64
integer y = 1576
integer width = 247
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

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type dw_lista from datawindow within w_detalle_lista_generada_gestion_terreno
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 44
integer width = 3483
integer height = 1476
integer taborder = 10
string dataobject = "dw_detale_select_por_gestion_cob_terreno"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna
ls_columna	= dwo.name

CHOOSE CASE ls_columna
	CASE 't_10','t_11' //rojo
		if is_string="at_gestion_estado_gestion ='A'" then
			is_string	= ''
		else
			is_string	= "at_gestion_estado_gestion ='"+'A'+"'"
		end if
		dw_lista.SETfilter(is_string)
		dw_lista.filter()
	CASE 't_12','t_13' //amarillo
		if is_string	= "at_gestion_estado_gestion ='G'" then
			is_string	= ''
		else
			is_string	= "at_gestion_estado_gestion ='"+'G'+"'"
		end if
		dw_lista.SETfilter(is_string)
		dw_lista.filter()
	CASE 't_14','t_15' //blanco
		if is_string	= "at_gestion_estado_gestion ='P'" then
			is_string	= ''
		else
			is_string	= "at_gestion_estado_gestion ='"+'P'+"'"
		end if
		dw_lista.SETfilter(is_string)
		dw_lista.filter()
END CHOOSE

if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
end if

end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	gs_base		= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
end if

end event

event rbuttondown;if row>0 then
	il_row		= row
	gs_base		= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')
	is_estado	= dw_lista.getitemstring(il_row,'at_gestion_estado_gestion')
	if is_estado<>'A' then
		m_gestiones_popup Menu
		Menu = Create m_gestiones_popup
		Menu.m_popup.m_ingresargestiontelefonica.Visible 		= (Mid(MenuHabilitado, 1, 1) = "0")
		Menu.m_popup.m_ingresarenviocarta.Visible 				= (Mid(MenuHabilitado, 2, 1) = "0")
		Menu.m_popup.m_ingresargestionatencionpublico.Visible = (Mid(MenuHabilitado, 3, 1) = "0")
		//menu.dw_paso = This
		Menu.m_popup.PopMenu(This.X + PointerX(), This.Y + PointerY()-20)
	else
		messagebox("Advertencia","Cliente Anulado")
	end if
end if
end event

event constructor;MenuHabilitado	= '000'
end event

type gb_1 from groupbox within w_detalle_lista_generada_gestion_terreno
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1528
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

