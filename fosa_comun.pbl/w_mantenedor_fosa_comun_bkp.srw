forward
global type w_mantenedor_fosa_comun_bkp from window
end type
type p_1 from picture within w_mantenedor_fosa_comun_bkp
end type
type dw_print from datawindow within w_mantenedor_fosa_comun_bkp
end type
type cb_print from commandbutton within w_mantenedor_fosa_comun_bkp
end type
type st_help from statictext within w_mantenedor_fosa_comun_bkp
end type
type cb_ctacte from commandbutton within w_mantenedor_fosa_comun_bkp
end type
type cb_limpiar from commandbutton within w_mantenedor_fosa_comun_bkp
end type
type cb_desocupar from commandbutton within w_mantenedor_fosa_comun_bkp
end type
type st_6 from statictext within w_mantenedor_fosa_comun_bkp
end type
type st_5 from statictext within w_mantenedor_fosa_comun_bkp
end type
type st_4 from statictext within w_mantenedor_fosa_comun_bkp
end type
type st_3 from statictext within w_mantenedor_fosa_comun_bkp
end type
type st_2 from statictext within w_mantenedor_fosa_comun_bkp
end type
type st_1 from statictext within w_mantenedor_fosa_comun_bkp
end type
type cb_asignar from commandbutton within w_mantenedor_fosa_comun_bkp
end type
type pb_ok from picturebutton within w_mantenedor_fosa_comun_bkp
end type
type st_16 from statictext within w_mantenedor_fosa_comun_bkp
end type
type dw_parque from datawindow within w_mantenedor_fosa_comun_bkp
end type
type cb_cerrar from commandbutton within w_mantenedor_fosa_comun_bkp
end type
type dw_lista from datawindow within w_mantenedor_fosa_comun_bkp
end type
type st_titulo from statictext within w_mantenedor_fosa_comun_bkp
end type
type dw_detalle from datawindow within w_mantenedor_fosa_comun_bkp
end type
end forward

global type w_mantenedor_fosa_comun_bkp from window
integer width = 3954
integer height = 1920
boolean titlebar = true
string title = "Mantenedor Fosa Común"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
p_1 p_1
dw_print dw_print
cb_print cb_print
st_help st_help
cb_ctacte cb_ctacte
cb_limpiar cb_limpiar
cb_desocupar cb_desocupar
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_asignar cb_asignar
pb_ok pb_ok
st_16 st_16
dw_parque dw_parque
cb_cerrar cb_cerrar
dw_lista dw_lista
st_titulo st_titulo
dw_detalle dw_detalle
end type
global w_mantenedor_fosa_comun_bkp w_mantenedor_fosa_comun_bkp

type variables
Long	il_fila,il_primer
end variables

on w_mantenedor_fosa_comun_bkp.create
this.p_1=create p_1
this.dw_print=create dw_print
this.cb_print=create cb_print
this.st_help=create st_help
this.cb_ctacte=create cb_ctacte
this.cb_limpiar=create cb_limpiar
this.cb_desocupar=create cb_desocupar
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_asignar=create cb_asignar
this.pb_ok=create pb_ok
this.st_16=create st_16
this.dw_parque=create dw_parque
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.st_titulo=create st_titulo
this.dw_detalle=create dw_detalle
this.Control[]={this.p_1,&
this.dw_print,&
this.cb_print,&
this.st_help,&
this.cb_ctacte,&
this.cb_limpiar,&
this.cb_desocupar,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_asignar,&
this.pb_ok,&
this.st_16,&
this.dw_parque,&
this.cb_cerrar,&
this.dw_lista,&
this.st_titulo,&
this.dw_detalle}
end on

on w_mantenedor_fosa_comun_bkp.destroy
destroy(this.p_1)
destroy(this.dw_print)
destroy(this.cb_print)
destroy(this.st_help)
destroy(this.cb_ctacte)
destroy(this.cb_limpiar)
destroy(this.cb_desocupar)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_asignar)
destroy(this.pb_ok)
destroy(this.st_16)
destroy(this.dw_parque)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.st_titulo)
destroy(this.dw_detalle)
end on

event open;Long	ll_new
gf_centrar(w_mantenedor_fosa_comun)
dw_lista.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_print.settransobject(sqlca)
ll_new	= dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(ll_new,'cod_parque',1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(ll_new,'cod_parque',11)
elseif gs_conexion = "Parque Concepción" then
	dw_parque.setitem(ll_new,'cod_parque',801)
end if
dw_lista.reset()
dw_detalle.reset()
end event

event mousemove;st_help.text		= ' '
end event

type p_1 from picture within w_mantenedor_fosa_comun_bkp
integer x = 2464
integer y = 416
integer width = 27
integer height = 992
string picturename = "linea_doble.bmp"
boolean focusrectangle = false
end type

type dw_print from datawindow within w_mantenedor_fosa_comun_bkp
boolean visible = false
integer x = 2921
integer y = 1752
integer width = 411
integer height = 432
string title = "none"
string dataobject = "dw_lista_sepulturas_fosa_comun_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 2469
integer y = 1644
integer width = 343
integer height = 104
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;Long		ll_new,ll_cod_parque,ll_fila
String	ls_area,ls_sector,ls_sepultura

dw_print.reset()
ll_fila			= dw_lista.getrow()
if dw_lista.rowcount() > 0 and ll_fila > 0 then
	ll_cod_parque	= dw_lista.getitemnumber(ll_fila,'cod_parque')
	ls_area			= dw_lista.getitemstring(ll_fila,'area')
	ls_sector		= dw_lista.getitemstring(ll_fila,'sector')
	ls_sepultura	= dw_lista.getitemstring(ll_fila,'sepultura')
	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) and &
		dw_detalle.rowcount() > 0 then

		if dw_print.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
			dw_print.object.t_titulo.text		= 'AREA:  '+ls_area+'  -  SECTOR:  '+ls_sector+'  -  SEPULTURA:  '+ls_sepultura
			dw_print.object.t_fecha.text		= 'DISPONIBILIDAD EN FOSA COMUN AL '+string(gdt_fec_sistema,'dd/mm/yyyy')
			dw_print.object.t_usuario.text	= gs_user
			dw_print.accepttext()
			f_Print( dw_print )
		end if
	end if
end if
end event

type st_help from statictext within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 1216
integer y = 36
integer width = 2610
integer height = 160
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "MS Serif"
long backcolor = 80269524
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type cb_ctacte from commandbutton within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 1824
integer y = 1640
integer width = 530
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;Long	ll_fila

ll_fila			= dw_detalle.getrow()
if ll_fila > 0 then
	gi_numero 	= dw_detalle.getitemnumber(ll_fila,'numero')
	gs_base		= dw_detalle.getitemstring(ll_fila,'base')
	gs_serie		= dw_detalle.getitemstring(ll_fila,'serie')
	if	gi_numero > 0 then
		CHOOSE CASE gs_base
			CASE "O" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F","G"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
		END CHOOSE
	end if
end if
end event

type cb_limpiar from commandbutton within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 553
integer y = 1640
integer width = 539
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar Seleccionados"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;Long		ll_tot_reg,ll_indi,ll_res,ll_fila,ll_row,ll_cod_parque
String	ls_area,ls_sector,ls_sepultura

dw_detalle.accepttext()
if dw_lista.rowcount() > 0 then
	ll_tot_reg				= dw_detalle.RowCount()
	ll_fila					= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg)
	if ll_fila > 0 then
		ll_res				= messagebox("Advertencia","Está Seguro dejar Disponible los Niveles Seleccionados",Exclamation!,YesNo!,2)
		if ll_res=1 then
			ll_row			= dw_lista.getrow()
			ls_area			= dw_lista.getitemstring(ll_row,'area')
			ls_sector		= dw_lista.getitemstring(ll_row,'sector')
			ls_sepultura	= dw_lista.getitemstring(ll_row,'sepultura')
			ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
			if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
				if dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
					st_titulo.text	= 'Distribución Fosa Común Area: '+ls_area+' Sector: '+ls_sector+' Sepultura: '+ls_sepultura
				end if
			end if
			st_help.text	= ' '
			il_fila			= 0
			il_primer		= 0
		end if
	end if
end if
end event

type cb_desocupar from commandbutton within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 1143
integer y = 1640
integer width = 530
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Desocupar Fosa"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;String	ls_nivel,ls_estado_reg,ls_nulo,ls_nivel_fosa,ls_area_fosa,ls_sector_fosa,ls_sepult_fosa,&
			ls_base_fosa,ls_serie_fosa,ls_base,ls_serie,ls_area,ls_sector,ls_sepultura
Long		ll_nulo,ll_parque_fosa,ll_corr_fosa,ll_res,ll_indi,ll_tot_reg,ll_numero,&
			ll_numero_fosa,ll_suma,ll_suma_g,ll_row,ll_cod_parque
Datetime	ldt_nulo

if il_fila>0 then
	Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)
	ll_tot_reg				= dw_detalle.rowcount()
	ls_nivel_fosa			= dw_detalle.getitemstring(il_fila,'niveles')
	ls_area_fosa			= dw_detalle.getitemstring(il_fila,'area')
	ls_sector_fosa			= dw_detalle.getitemstring(il_fila,'sector')
	ls_sepult_fosa			= dw_detalle.getitemstring(il_fila,'sepultura')
	ls_estado_reg			= dw_detalle.getitemstring(il_fila,'estado_reg')
	ll_parque_fosa			= dw_detalle.getitemnumber(il_fila,'cod_parque')
	ls_base_fosa			= dw_detalle.getitemstring(il_fila,'base')
	ls_serie_fosa			= dw_detalle.getitemstring(il_fila,'serie')
	ll_numero_fosa			= dw_detalle.getitemnumber(il_fila,'numero')
	if ls_estado_reg = 'O' then
		ll_suma					= 0
		ll_suma_g				= 0
		ll_res					= messagebox("Advertencia","Está Seguro Desocupar Fosa Común Area: "+ls_area_fosa+" Sector: "+ls_sector_fosa+" Sepultura: "+ls_sepult_fosa+" Nivel: "+ls_nivel_fosa,Exclamation!,YesNo!,2)
		if ll_res=1 then
			for ll_indi=1 to ll_tot_reg
				ls_base			= dw_detalle.getitemstring(ll_indi,'base')
				ls_serie			= dw_detalle.getitemstring(ll_indi,'serie')
				ll_numero		= dw_detalle.getitemnumber(ll_indi,'numero')
				ls_nivel			= dw_detalle.getitemstring(ll_indi,'niveles')
				ll_corr_fosa	= dw_detalle.getitemnumber(ll_indi,'correlativo')
				if ls_base = ls_base_fosa and ls_serie = ls_serie_fosa and ll_numero = ll_numero_fosa then
					ll_suma ++
					UPDATE	"FOSA_COMUN"  
					SET 		"LLAVE_FALLECIDO" = :ll_nulo,   
								"NOMBRE_FALLECIDO" = :ls_nulo,   
								"AP_PATERNO_FALLECIDO" = :ls_nulo,   
								"AP_MATERNO_FALLECIDO" = :ls_nulo,   
								"FECHA_TRASLADO" = :ldt_nulo,   
								"COD_PARQUE_ORIGEN" = :ll_nulo,   
								"AREA_ORIGEN" = :ls_nulo,   
								"SECTOR_ORIGEN" = :ls_nulo,   
								"SEPULTURA_ORIGEN" = :ls_nulo,   
								"NRO_RESOLUCION" = :ls_nulo,   
								"FECHA_RESOLUCION" = :ldt_nulo,   
								"NRO_ACTA" = :ls_nulo,   
								"CODIGO_CAPATAZ" = :ll_nulo,   
								"BASE" = :ls_nulo,   
								"SERIE" = :ls_nulo,   
								"NUMERO" = :ll_nulo,   
								"ESTADO_REG" = 'D',
								"COD_REGISTRO" = :ls_nulo
					WHERE  ( "FOSA_COMUN"."COD_PARQUE" = :ll_parque_fosa ) AND  
							 ( "FOSA_COMUN"."AREA" = :ls_area_fosa ) AND  
							 ( "FOSA_COMUN"."SECTOR" = :ls_sector_fosa ) AND  
							 ( "FOSA_COMUN"."SEPULTURA" = :ls_sepult_fosa ) AND  
							 ( "FOSA_COMUN"."CORRELATIVO" = :ll_corr_fosa ) AND  
							 ( "FOSA_COMUN"."NIVELES" = :ls_nivel )   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						ll_suma_g ++
						dw_detalle.setitem(ll_indi,'estado_reg','D')
						dw_detalle.setitem(ll_indi,'base',ls_nulo)
						dw_detalle.setitem(ll_indi,'serie',ls_nulo)
						dw_detalle.setitem(ll_indi,'numero',ll_nulo)
						dw_detalle.accepttext()
						commit;
					else
						rollback;
						messagebox("Error Desocupación","Error al Desocupar Fosa Común Area: "+ls_area_fosa+" Sector: "+ls_sector_fosa+" Sepultura: "+ls_sepult_fosa+" Nivel: "+ls_nivel+" SQL: "+sqlca.sqlerrtext)
					end if
				end if
			next
			if ll_suma = ll_suma_g then
				ll_row			= dw_lista.getrow()
				ls_area			= dw_lista.getitemstring(ll_row,'area')
				ls_sector		= dw_lista.getitemstring(ll_row,'sector')
				ls_sepultura	= dw_lista.getitemstring(ll_row,'sepultura')
				ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
				if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
					if dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
						st_titulo.text	= 'Distribución Fosa Común Area: '+ls_area+' Sector: '+ls_sector+' Sepultura: '+ls_sepultura
					end if
				end if
				il_fila					= 0
				il_primer				= 0
				messagebox("Desocupar Fosa","Desocupación Exitosa")
			end if
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Sepultura Ocupada")
	end if
end if
end event

type st_6 from statictext within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 2546
integer y = 1468
integer width = 407
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Seleccionados"
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_5 from statictext within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 2418
integer y = 1464
integer width = 105
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_4 from statictext within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 1957
integer y = 1468
integer width = 407
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Disponible"
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_3 from statictext within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 1829
integer y = 1464
integer width = 105
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_2 from statictext within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 1367
integer y = 1468
integer width = 407
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Ocupado"
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type st_1 from statictext within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 1239
integer y = 1464
integer width = 105
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 65535
long backcolor = 65535
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type cb_asignar from commandbutton within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1640
integer width = 411
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ocupar Fosa"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;Long		ll_fila,ll_indi,ll_tot_reg,ll_suma,ll_res
String	ls_estado_reg,ls_string,ls_niveles

ll_tot_reg				= dw_detalle.RowCount()
ll_fila					= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg)
if ll_fila > 0 then
	ls_niveles			= dw_detalle.getitemstring(ll_fila,'niveles')
	ll_suma				= 0
	for ll_indi=1 to ll_tot_reg
		ls_estado_reg	= dw_detalle.getitemstring(ll_indi,'estado_reg')
		if ls_estado_reg='A' then
			ll_suma ++
		end if
	next
	if ll_suma=1 then
		ll_res			= messagebox("Advertencia","El Nivel Seleccionado "+ls_niveles+", la Cantidad de Sub-Nivel ha Utilizar es: "+string(ll_suma),Exclamation!,YesNo!,2)
	else
		ll_res			= messagebox("Advertencia","El Nivel Seleccionado "+ls_niveles+", la Cantidad de Sub-Niveles ha Utilizar son: "+string(ll_suma),Exclamation!,YesNo!,2)
	end if
	if ll_res=1 then
		gs_grabar_fosa	= 'N'
		ls_string		= dw_detalle.getitemstring(il_primer,'niveles')
		if isvalid(w_grabar_ocupacion_fosa_comun) then close(w_grabar_ocupacion_fosa_comun)
		openwithparm(w_grabar_ocupacion_fosa_comun,ls_string)
		if gs_grabar_fosa='S' then
			il_fila		= 0
			il_primer	= 0
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar Nivel")
end if
end event

type pb_ok from picturebutton within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 923
integer y = 28
integer width = 169
integer height = 148
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;Long	ll_cod_parque

dw_parque.accepttext()
ll_cod_parque		= dw_parque.getitemnumber(1,'cod_parque')
if ll_cod_parque>0 then
	st_help.text	= ' '
	if dw_lista.retrieve(ll_cod_parque)>0 then
		dw_lista.setfocus()
		dw_lista.scrolltorow(1)
		dw_lista.SelectRow(0, FALSE)
		dw_lista.SelectRow(1, TRUE)
	end if
end if
end event

type st_16 from statictext within w_mantenedor_fosa_comun_bkp
integer x = 23
integer y = 64
integer width = 210
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_mantenedor_fosa_comun_bkp
integer x = 265
integer y = 56
integer width = 594
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Long	ll_cod_parque

dw_parque.accepttext()
ll_cod_parque		= this.getitemnumber(1,'cod_parque')
st_help.text		= ' '
if ll_cod_parque>0 then
	dw_lista.reset()
	dw_detalle.reset()
	pb_ok.triggerevent(clicked!)
end if
end event

type cb_cerrar from commandbutton within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 3493
integer y = 1640
integer width = 347
integer height = 108
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;close(w_mantenedor_fosa_comun)
end event

type dw_lista from datawindow within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 212
integer width = 1051
integer height = 1376
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_sepulturas_fosa_comun"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_help.text		= ' '
end event

event clicked;Long		ll_cod_parque
String	ls_area,ls_sector,ls_sepultura
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	ll_cod_parque	= dw_lista.getitemnumber(row,'cod_parque')
	ls_area			= dw_lista.getitemstring(row,'area')
	ls_sector		= dw_lista.getitemstring(row,'sector')
	ls_sepultura	= dw_lista.getitemstring(row,'sepultura')
	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
		if dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
			st_titulo.text	= 'Distribución Fosa Común Area: '+ls_area+' Sector: '+ls_sector+' Sepultura: '+ls_sepultura
		end if
	end if
end if
end event

event rowfocuschanged;Long		ll_fila,ll_cod_parque
String	ls_area,ls_sector,ls_sepultura

ll_fila	= this.getrow()
if ll_fila>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(ll_fila, TRUE)
	ll_cod_parque	= dw_lista.getitemnumber(ll_fila,'cod_parque')
	ls_area			= dw_lista.getitemstring(ll_fila,'area')
	ls_sector		= dw_lista.getitemstring(ll_fila,'sector')
	ls_sepultura	= dw_lista.getitemstring(ll_fila,'sepultura')
	if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
		if dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
			st_titulo.text	= 'Distribución Fosa Común Area: '+ls_area+' Sector: '+ls_sector+' Sepultura: '+ls_sepultura
		end if
	end if
end if
end event

type st_titulo from statictext within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_mousemove
integer x = 1239
integer y = 224
integer width = 2450
integer height = 188
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Distribución Fosa Común"
boolean focusrectangle = false
end type

event ue_mousemove;st_help.text		= ' '
end event

type dw_detalle from datawindow within w_mantenedor_fosa_comun_bkp
event ue_mousemove pbm_dwnmousemove
integer x = 1143
integer y = 212
integer width = 2697
integer height = 1376
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_grilla_fosa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;string	ls_columna,ls_base,ls_serie,ls_nivel,ls_nom_fall,ls_ap_pat_fall,ls_ap_mat_fall,ls_estado_reg
Long		ll_row,ll_numero,ll_llave

ls_columna				= dwo.name
if row > 1 or ls_columna='niveles' or ls_columna='base' or ls_columna='serie' or ls_columna='numero' then
	ll_row				= row
	ls_base				= dw_detalle.getitemstring(ll_row,'base')
	ls_serie				= dw_detalle.getitemstring(ll_row,'serie')
	ll_numero			= dw_detalle.getitemnumber(ll_row,'numero')
	ls_nivel				= dw_detalle.getitemstring(ll_row,'niveles')
	ls_nom_fall			= dw_detalle.getitemstring(ll_row,'nombre_fallecido')
	ls_ap_pat_fall		= dw_detalle.getitemstring(ll_row,'ap_paterno_fallecido')
	ls_ap_mat_fall		= dw_detalle.getitemstring(ll_row,'ap_materno_fallecido')
	ll_llave				= dw_detalle.getitemnumber(ll_row,'llave_fallecido')
	ls_estado_reg		= dw_detalle.getitemstring(ll_row,'estado_reg')
	if ls_estado_reg='O' then
		st_help.text	= 'Sepultura OCUPADA, Nivel:  '+ls_nivel+'  Nº Contrato: '+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###,###')+',  Fallecido Nº:  '+string(ll_llave,"###,###,###,###,###")+' Nombre Fallecido '+ls_nom_fall+' '+ls_ap_pat_fall+' '+ls_ap_mat_fall
	else
		st_help.text	= 'Sepultura DISPONIBLE, Nivel:  '+ls_nivel+'  DISPONIBLE'
	end if
end if
end event

event clicked;String	ls_nivel,ls_estado_reg,ls_columna,ls_est_reg_prox,ls_pasa,ls_est_reg_ini,ls_area,ls_sector,&
			ls_sepultura,ls_serie_fosa,ls_nulo,ls_nivel_fosa,ls_area_fosa,ls_sector_fosa,ls_sepult_fosa,&
			ls_base_fosa,ls_base,ls_serie
Long		ll_suma_a,ll_res,ll_numero_fosa,ll_nulo,ll_tot_reg,ll_parque_fosa,ll_suma,ll_suma_g,ll_indi,&
			ll_numero,ll_corr_fosa,ll_row,ll_cod_parque,ll_tot_reg_det,ll_fila_det
Datetime	ldt_nulo

ls_pasa					= 'S'
il_fila					= row
ls_columna				= dwo.name
if il_fila > 0 and (ls_columna='niveles' or ls_columna='base' or ls_columna='serie' or ls_columna='numero') then
	ll_tot_reg			= dw_detalle.rowcount()
	ls_nivel_fosa		= dw_detalle.getitemstring(il_fila,'niveles')
	ls_area_fosa		= dw_detalle.getitemstring(il_fila,'area')
	ls_sector_fosa		= dw_detalle.getitemstring(il_fila,'sector')
	ls_sepult_fosa		= dw_detalle.getitemstring(il_fila,'sepultura')
	ls_estado_reg		= dw_detalle.getitemstring(il_fila,'estado_reg')
	ll_parque_fosa		= dw_detalle.getitemnumber(il_fila,'cod_parque')
	ls_base_fosa		= dw_detalle.getitemstring(il_fila,'base')
	ls_serie_fosa		= dw_detalle.getitemstring(il_fila,'serie')
	ll_numero_fosa		= dw_detalle.getitemnumber(il_fila,'numero')
	if ls_estado_reg <> 'O' then
		This.SelectRow(0, FALSE)
		This.SelectRow(il_fila, TRUE)
	end if
	if ls_estado_reg = 'O' then
		ll_res			= messagebox("Advertencia","Nivel Ya Utilizado, desea Desocupar Fosa Común Area: "+ls_area_fosa+' Sector: '+ls_sector_fosa+' Sepultura: '+ls_sepult_fosa+' Nivel: '+ls_nivel_fosa,Exclamation!,YesNo!,2)
		if ll_res=1 then
			if il_fila>0 then
				Setnull(ls_nulo);Setnull(ll_nulo);Setnull(ldt_nulo)
				ll_suma				= 0
				ll_suma_g			= 0
				for ll_indi=1 to ll_tot_reg
					ls_base			= dw_detalle.getitemstring(ll_indi,'base')
					ls_serie			= dw_detalle.getitemstring(ll_indi,'serie')
					ll_numero		= dw_detalle.getitemnumber(ll_indi,'numero')
					ls_nivel			= dw_detalle.getitemstring(ll_indi,'niveles')
					ll_corr_fosa	= dw_detalle.getitemnumber(ll_indi,'correlativo')
					if ls_base = ls_base_fosa and ls_serie = ls_serie_fosa and ll_numero = ll_numero_fosa then
						ll_suma ++
						UPDATE	"FOSA_COMUN"  
						SET 		"LLAVE_FALLECIDO" = :ll_nulo,   
									"NOMBRE_FALLECIDO" = :ls_nulo,   
									"AP_PATERNO_FALLECIDO" = :ls_nulo,   
									"AP_MATERNO_FALLECIDO" = :ls_nulo,   
									"FECHA_TRASLADO" = :ldt_nulo,   
									"COD_PARQUE_ORIGEN" = :ll_nulo,   
									"AREA_ORIGEN" = :ls_nulo,   
									"SECTOR_ORIGEN" = :ls_nulo,   
									"SEPULTURA_ORIGEN" = :ls_nulo,   
									"NRO_RESOLUCION" = :ls_nulo,   
									"FECHA_RESOLUCION" = :ldt_nulo,   
									"NRO_ACTA" = :ls_nulo,   
									"CODIGO_CAPATAZ" = :ll_nulo,   
									"BASE" = :ls_nulo,   
									"SERIE" = :ls_nulo,   
									"NUMERO" = :ll_nulo,   
									"ESTADO_REG" = 'D'  
						WHERE  ( "FOSA_COMUN"."COD_PARQUE" = :ll_parque_fosa ) AND  
								 ( "FOSA_COMUN"."AREA" = :ls_area_fosa ) AND  
								 ( "FOSA_COMUN"."SECTOR" = :ls_sector_fosa ) AND  
								 ( "FOSA_COMUN"."SEPULTURA" = :ls_sepult_fosa ) AND  
								 ( "FOSA_COMUN"."CORRELATIVO" = :ll_corr_fosa ) AND  
								 ( "FOSA_COMUN"."NIVELES" = :ls_nivel )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ll_suma_g ++
							dw_detalle.setitem(ll_indi,'estado_reg','D')
							dw_detalle.setitem(ll_indi,'base',ls_nulo)
							dw_detalle.setitem(ll_indi,'serie',ls_nulo)
							dw_detalle.setitem(ll_indi,'numero',ll_nulo)
							dw_detalle.accepttext()
							commit;
						else
							rollback;
							messagebox("Error Desocupación","Error al Desocupar Fosa Común Area: "+ls_area_fosa+" Sector: "+ls_sector_fosa+" Sepultura: "+ls_sepult_fosa+" Nivel: "+ls_nivel+" SQL: "+sqlca.sqlerrtext)
						end if
					end if
				next
				if ll_suma = ll_suma_g then
					ll_row			= dw_lista.getrow()
					ls_area			= dw_lista.getitemstring(ll_row,'area')
					ls_sector		= dw_lista.getitemstring(ll_row,'sector')
					ls_sepultura	= dw_lista.getitemstring(ll_row,'sepultura')
					ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
					if ll_cod_parque>0 and not isnull(ls_area) and not isnull(ls_sector) and not isnull(ls_sepultura) then
						if dw_detalle.retrieve(ll_cod_parque,ls_area,ls_sector,ls_sepultura)>0 then
							st_titulo.text	= 'Distribución Fosa Común Area: '+ls_area+' Sector: '+ls_sector+' Sepultura: '+ls_sepultura
						end if
					end if
					il_fila			= 0
					il_primer		= 0
				end if
			end if
		else
			This.SelectRow(il_fila, False)
		end if
	elseif il_fila=1 or il_fila=9 or il_fila=17 or il_fila=25 or il_fila=33 or il_fila=5 or il_fila=13 or &
		il_fila=21 or il_fila=29 or il_fila=37 then
		ls_est_reg_prox	= dw_detalle.getitemstring(il_fila + 8,'estado_reg')
		if ls_est_reg_prox='D' then
			messagebox("Advertencia","No es Posible Ocupar este Nivel, debe Seleccionar el Nivel Inferior que esté Disponible")
			This.SelectRow(il_fila, False)
			ls_pasa			= 'N'
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		end if
	elseif il_fila=2 or il_fila=3 or il_fila=4 then
		if il_primer <> 1 and il_primer <> 2 and il_primer <> 3 and il_primer <> 4 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa		= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(1,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 6.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=10 or il_fila=11 or il_fila=12 then
		if il_primer <> 9 and il_primer <> 10 and il_primer <> 11 and il_primer <> 12 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(9,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 5.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=18 or il_fila=19 or il_fila=20 then
		if il_primer <> 17 and il_primer <> 18 and il_primer <> 19 and il_primer <> 20 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(17,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 4.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=26 or il_fila=27 or il_fila=28 then
		if il_primer <> 25 and il_primer <> 26 and il_primer <> 27 and il_primer <> 28 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(25,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 3.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=34 or il_fila=35 or il_fila=36 then
		if il_primer <> 33 and il_primer <> 34 and il_primer <> 35 and il_primer <> 36 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(33,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 2.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=42 or il_fila=43 or il_fila=44 then
		if il_primer <> 41 and il_primer <> 42 and il_primer <> 43 and il_primer <> 44 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(41,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 6.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=6 or il_fila=7 or il_fila=8 then
		if il_primer <> 5 and il_primer <> 6 and il_primer <> 7 and il_primer <> 8 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(5,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 12.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=14 or il_fila=15 or il_fila=16 then
		if il_primer <> 13 and il_primer <> 14 and il_primer <> 15 and il_primer <> 16 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(13,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 11.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=22 or il_fila=23 or il_fila=24 then
		if il_primer <> 21 and il_primer <> 22 and il_primer <> 23 and il_primer <> 24 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(21,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 10.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=30 or il_fila=31 or il_fila=32 then
		if il_primer <> 29 and il_primer <> 30 and il_primer <> 31 and il_primer <> 32 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(29,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 9.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=38 or il_fila=39 or il_fila=40 then
		if il_primer <> 37 and il_primer <> 38 and il_primer <> 39 and il_primer <> 40 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(37,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 8.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	elseif il_fila=46 or il_fila=47 or il_fila=48 then
		if il_primer <> 45 and il_primer <> 46 and il_primer <> 47 and il_primer <> 48 and il_primer <> 0 then
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		else
			ls_est_reg_ini	= dw_detalle.getitemstring(45,'estado_reg')
			if ls_est_reg_ini='D' then
				messagebox("Advertencia","No es Posible Ocupar este Nivel, debe estar Ocupado o Seleccionado Nivel 7.1")
				This.SelectRow(il_fila, False)
				ls_pasa	= 'N'
				ll_tot_reg_det	= dw_detalle.RowCount()
				ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
				if ll_fila_det = 0 then
					il_primer	= 0
				end if
			end if
		end if
	end if
	if il_primer>0 and ls_pasa='S' then
		if (il_primer=1 or il_primer=2 or il_primer=3 or il_primer=4) and (il_fila=1 or il_fila=2 or il_fila=3 or il_fila=4) then
			ls_pasa	= 'S'
		elseif (il_primer=9 or il_primer=10 or il_primer=11 or il_primer=12) and (il_fila=9 or il_fila=10 or il_fila=11 or il_fila=12) then
			ls_pasa	= 'S'
		elseif (il_primer=17 or il_primer=18 or il_primer=19 or il_primer=20) and (il_fila=17 or il_fila=18 or il_fila=19 or il_fila=20) then
			ls_pasa	= 'S'
		elseif (il_primer=25 or il_primer=26 or il_primer=27 or il_primer=28) and (il_fila=25 or il_fila=26 or il_fila=27 or il_fila=28) then
			ls_pasa	= 'S'
		elseif (il_primer=33 or il_primer=34 or il_primer=35 or il_primer=36) and (il_fila=33 or il_fila=34 or il_fila=35 or il_fila=36) then
			ls_pasa	= 'S'
		elseif (il_primer=41 or il_primer=42 or il_primer=43 or il_primer=44) and (il_fila=41 or il_fila=42 or il_fila=43 or il_fila=44) then
			ls_pasa	= 'S'
		elseif (il_primer=5 or il_primer=6 or il_primer=7 or il_primer=8) and (il_fila=5 or il_fila=6 or il_fila=7 or il_fila=8) then
			ls_pasa	= 'S'
		elseif (il_primer=13 or il_primer=14 or il_primer=15 or il_primer=16) and (il_fila=13 or il_fila=14 or il_fila=15 or il_fila=16) then
			ls_pasa	= 'S'
		elseif (il_primer=21 or il_primer=22 or il_primer=23 or il_primer=24) and (il_fila=21 or il_fila=22 or il_fila=23 or il_fila=24) then
			ls_pasa	= 'S'
		elseif (il_primer=29 or il_primer=30 or il_primer=31 or il_primer=32) and (il_fila=29 or il_fila=30 or il_fila=31 or il_fila=32) then
			ls_pasa	= 'S'
		elseif (il_primer=37 or il_primer=38 or il_primer=39 or il_primer=40) and (il_fila=37 or il_fila=38 or il_fila=39 or il_fila=40) then
			ls_pasa	= 'S'
		elseif (il_primer=45 or il_primer=46 or il_primer=47 or il_primer=48) and (il_fila=45 or il_fila=46 or il_fila=47 or il_fila=48) then
			ls_pasa	= 'S'
		else
			messagebox("Advertencia","Recuerde debe Seleccionar en el mismo Nivel")
			ls_pasa	= 'N'
			This.SelectRow(il_fila, False)
			ll_tot_reg_det	= dw_detalle.RowCount()
			ll_fila_det		= dw_detalle.Find("estado_reg = 'A'", 1, ll_tot_reg_det)
			if ll_fila_det = 0 then
				il_primer	= 0
			end if
		end if
	end if
	if ls_pasa='S' then
		il_primer			= il_fila
		if ls_estado_reg = 'A' then 
			il_fila			= row
			dw_detalle.setitem(il_fila,'estado_reg','D')
			This.SelectRow(il_fila, False)
		elseif ls_estado_reg = 'O' then 
			il_fila			= row
			This.SelectRow(il_fila, False)
		else
			il_fila			= row
			dw_detalle.setitem(il_fila,'estado_reg','A')
		end if
		dw_detalle.accepttext()
		if il_fila > 0 then
			ll_suma_a		= dw_detalle.getitemnumber(il_fila,'c_suma_a')
			if ll_suma_a = 1 then
				il_primer	= row
			elseif ll_suma_a = 0 then
				il_primer	= 0
			end if
		end if
	end if
	dw_detalle.accepttext()
end if
end event

