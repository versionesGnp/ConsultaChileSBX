forward
global type w_ejecutivo_ugn from window
end type
type st_cuenta from statictext within w_ejecutivo_ugn
end type
type hpb_1 from hprogressbar within w_ejecutivo_ugn
end type
type st_porc from statictext within w_ejecutivo_ugn
end type
type st_cant from statictext within w_ejecutivo_ugn
end type
type cb_marcar from commandbutton within w_ejecutivo_ugn
end type
type em_divisor from editmask within w_ejecutivo_ugn
end type
type st_2 from statictext within w_ejecutivo_ugn
end type
type cb_limpiar from commandbutton within w_ejecutivo_ugn
end type
type pb_aceptar from picturebutton within w_ejecutivo_ugn
end type
type cb_cerrar from commandbutton within w_ejecutivo_ugn
end type
type cb_1 from commandbutton within w_ejecutivo_ugn
end type
type st_1 from statictext within w_ejecutivo_ugn
end type
type dw_parque from datawindow within w_ejecutivo_ugn
end type
type cb_ordenar from commandbutton within w_ejecutivo_ugn
end type
type cb_exportar from commandbutton within w_ejecutivo_ugn
end type
type gb_1 from groupbox within w_ejecutivo_ugn
end type
type cb_imprimir from commandbutton within w_ejecutivo_ugn
end type
type cb_filtrar from commandbutton within w_ejecutivo_ugn
end type
type st_fondo from statictext within w_ejecutivo_ugn
end type
type dw_lista_ejecutivo from datawindow within w_ejecutivo_ugn
end type
end forward

global type w_ejecutivo_ugn from window
integer width = 3374
integer height = 2192
boolean titlebar = true
string title = "Asignación Prospectos"
boolean controlmenu = true
long backcolor = 67108864
st_cuenta st_cuenta
hpb_1 hpb_1
st_porc st_porc
st_cant st_cant
cb_marcar cb_marcar
em_divisor em_divisor
st_2 st_2
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
cb_1 cb_1
st_1 st_1
dw_parque dw_parque
cb_ordenar cb_ordenar
cb_exportar cb_exportar
gb_1 gb_1
cb_imprimir cb_imprimir
cb_filtrar cb_filtrar
st_fondo st_fondo
dw_lista_ejecutivo dw_lista_ejecutivo
end type
global w_ejecutivo_ugn w_ejecutivo_ugn

type variables
long il_cantidad
end variables

on w_ejecutivo_ugn.create
this.st_cuenta=create st_cuenta
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_cant=create st_cant
this.cb_marcar=create cb_marcar
this.em_divisor=create em_divisor
this.st_2=create st_2
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_parque=create dw_parque
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.gb_1=create gb_1
this.cb_imprimir=create cb_imprimir
this.cb_filtrar=create cb_filtrar
this.st_fondo=create st_fondo
this.dw_lista_ejecutivo=create dw_lista_ejecutivo
this.Control[]={this.st_cuenta,&
this.hpb_1,&
this.st_porc,&
this.st_cant,&
this.cb_marcar,&
this.em_divisor,&
this.st_2,&
this.cb_limpiar,&
this.pb_aceptar,&
this.cb_cerrar,&
this.cb_1,&
this.st_1,&
this.dw_parque,&
this.cb_ordenar,&
this.cb_exportar,&
this.gb_1,&
this.cb_imprimir,&
this.cb_filtrar,&
this.st_fondo,&
this.dw_lista_ejecutivo}
end on

on w_ejecutivo_ugn.destroy
destroy(this.st_cuenta)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_cant)
destroy(this.cb_marcar)
destroy(this.em_divisor)
destroy(this.st_2)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_parque)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.gb_1)
destroy(this.cb_imprimir)
destroy(this.cb_filtrar)
destroy(this.st_fondo)
destroy(this.dw_lista_ejecutivo)
end on

event open;string ls_cod

gf_centrar(w_ejecutivo_ugn)
dw_lista_ejecutivo.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)


SELECT	"SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD"  
INTO 		:ls_cod  
FROM 	"SOL_PERMISOS_USUARIO"  
WHERE 	"SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user AND  
			"SOL_PERMISOS_USUARIO"."ESTADO" = 'A' and
			"SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'NC'
USING	sqlca;

if ls_cod = 'NC' then
else
	messagebox('','Ud. No Tiene Los Permisos Privilegios para Asignar')
	close(w_ejecutivo_ugn)
end if	
	
end event

type st_cuenta from statictext within w_ejecutivo_ugn
boolean visible = false
integer x = 1042
integer y = 1084
integer width = 1371
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
string text = "none"
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_ejecutivo_ugn
boolean visible = false
integer x = 1042
integer y = 1012
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_ejecutivo_ugn
boolean visible = false
integer x = 1618
integer y = 940
integer width = 233
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_cant from statictext within w_ejecutivo_ugn
integer x = 2327
integer y = 56
integer width = 489
integer height = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 255
long backcolor = 81324524
boolean focusrectangle = false
end type

type cb_marcar from commandbutton within w_ejecutivo_ugn
integer x = 2935
integer y = 52
integer width = 379
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Marcar"
end type

event clicked;Long		ll_tot_reg,ll_cantidad,ll_indi
String		ls_cant
double	ldb_tot_porc=0,ldb_tot_porc_aux=0

ll_tot_reg			= dw_lista_ejecutivo.rowcount()
ll_cantidad			= il_cantidad
if ll_tot_reg > 0 and ll_cantidad > 0 then
	SetPointer(HourGlass!)
	st_fondo.visible										= true
	st_cuenta.visible									= true
	hpb_1.visible 										= true
	st_porc.visible 										= true
	hpb_1.Position										= ldb_tot_porc
	for ll_indi = 1 to ll_tot_reg
		dw_lista_ejecutivo.setitem(ll_indi,'est_reg',1)
		if ldb_tot_porc <> ldb_tot_porc_aux then 
			st_porc.text									= string(ldb_tot_porc,'#0.0#')+" %"
			ldb_tot_porc_aux							= ldb_tot_porc
		end if
		ldb_tot_porc										= (ll_indi / ll_tot_reg) * 100
		hpb_1.Position 									= ldb_tot_porc
		st_cuenta.text 									= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Cálculados '+string(ll_indi,'###,###,###')+' ( '+string((ll_indi*100)/ll_tot_reg,'#0.0#')+'% )'
		dw_lista_ejecutivo.accepttext()
	next
	st_fondo.visible										= false
	st_cuenta.visible									= false
	hpb_1.visible 										= false
	st_porc.visible 										= false
	SetPointer(Arrow!)
	if ll_cantidad > 0 then
		for ll_indi = 1 to ll_cantidad
			dw_lista_ejecutivo.setitem(ll_indi,'est_reg',0)
		next
	end if
	dw_lista_ejecutivo.accepttext()
end if
end event

type em_divisor from editmask within w_ejecutivo_ugn
integer x = 1989
integer y = 36
integer width = 306
integer height = 96
integer taborder = 20
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
boolean spin = true
string minmax = "~~5"
end type

event modified;Long		ll_cant,ll_tot_reg
Double	ldb_div

ll_tot_reg			= dw_lista_ejecutivo.rowcount()
ll_cant				= long(em_divisor.text)
if ll_cant > 0 then
	ldb_div			= round(double(ll_tot_reg / ll_cant),0)
	il_cantidad		= ldb_div
	st_cant.text	= string(ldb_div,'###,###,###')+' Registro(s)'
end if

end event

type st_2 from statictext within w_ejecutivo_ugn
integer x = 1394
integer y = 56
integer width = 571
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cantidad Div. Lista"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_ejecutivo_ugn
event ue_mousemove pbm_dwnmousemove
integer x = 2158
integer y = 1936
integer width = 247
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista_ejecutivo.reset()
dw_parque.reset()
dw_parque.insertrow(0)
em_divisor.text	= ''
st_cant.text		= ''

end event

type pb_aceptar from picturebutton within w_ejecutivo_ugn
integer x = 1120
integer y = 24
integer width = 169
integer height = 148
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long 		ll_parque,ll_tot_reg,ll_indi,ll_dias,ll_count,ll_grupo,ll_corre
date		ld_fecha
double	ldb_tot_porc=0,ldb_tot_porc_aux=0			
		

ll_parque		= dw_parque.getitemnumber(1,'parque')
ld_fecha  		= date(gdt_fec_sistema)
if ll_parque > 0 and not isnull(ld_fecha) then
	SELECT	"COD_PARQ"."CANT_DIAS_UGN"  
	INTO 		:ll_dias  
	FROM		"COD_PARQ"  
	WHERE 	"COD_PARQ"."CODIGO" = :ll_parque   ;

	ll_tot_reg	= dw_lista_ejecutivo.retrieve(ld_fecha,ll_parque,ll_dias)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Dato")
	else
		SetPointer(HourGlass!)
		st_fondo.visible										= true
		st_cuenta.visible									= true
		hpb_1.visible 										= true
		st_porc.visible 										= true
		hpb_1.Position										= ldb_tot_porc
		for ll_indi=1 to ll_tot_reg
			dw_lista_ejecutivo.setitem(ll_indi,'est_reg',1)
			// as tipo_asigna  
			ll_grupo	= dw_lista_ejecutivo.getitemnumber(ll_indi,'ugn_cliente_grupo')
			ll_corre	= dw_lista_ejecutivo.getitemnumber(ll_indi,'ugn_cliente_correlativo')
			
			SELECT	Count("UGN_CLIENTE"."NOMBRE") 
			INTO		:ll_count
         	FROM 	"UGN_CLIENTE",	"UGN_EJECUTIVO"
  			WHERE  ( "UGN_CLIENTE"."GRUPO" = "UGN_EJECUTIVO"."GRUPO" ) and  
         		 (("UGN_EJECUTIVO"."FECHA_ASIGNACION" + 90) < :ld_fecha ) AND  
					// ( "UGN_CLIENTE"."ESTADO_GRUPO" = 'P' ) AND  
					 ( "UGN_EJECUTIVO"."PARQUE" = :ll_parque ) AND  
					 ( "UGN_CLIENTE"."ULT_ESTADO_GESTION" <> '22'  )  AND
					 ( "UGN_CLIENTE"."GRUPO" = :ll_grupo  )  AND
					 ( "UGN_CLIENTE"."CORRELATIVO" = :ll_corre )
			USING		sqlca;
			if ll_count > 0 then
				dw_lista_ejecutivo.setitem(ll_indi,'tipo_asigna','RE-ASIG')
			end if
			if ldb_tot_porc <> ldb_tot_porc_aux then 
				st_porc.text											= string(ldb_tot_porc,'#0.0#')+" %"
				ldb_tot_porc_aux									= ldb_tot_porc
			end if
			ldb_tot_porc												= (ll_indi / ll_tot_reg) * 100
			hpb_1.Position 											= ldb_tot_porc
			st_cuenta.text 											= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Cálculados '+string(ll_indi,'###,###,###')+' ( '+string((ll_indi*100)/ll_tot_reg,'#0.0#')+'% )'
			dw_lista_ejecutivo.accepttext()
		next
		st_fondo.visible												= false
		st_cuenta.visible											= false
		hpb_1.visible 												= false
		st_porc.visible 												= false
		SetPointer(Arrow!)
	end if
elseif isnull(ll_parque) or ll_parque=0 then
	messagebox("Advertencia","Debe Seleccionar Parque")
	dw_parque.setfocus()
end if	
end event

type cb_cerrar from commandbutton within w_ejecutivo_ugn
integer x = 2999
integer y = 1928
integer width = 315
integer height = 108
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ejecutivo_ugn)
end event

type cb_1 from commandbutton within w_ejecutivo_ugn
integer x = 37
integer y = 1928
integer width = 315
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Asignar"
end type

event clicked;long		ll_fila, ll_tot_reg,ll_row,ll_rut,ll_grupo,ll_corr,ll_indi,ll_regis
string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_fono_p,ls_fono_c,ls_celular,ls_ult_gestion,&
			ls_ult_glosa,ls_dv,ls_est_registro,ls_est_grupo,ls_string,ls_est_reg
datetime	ldt_ult_fech

dw_lista_ejecutivo.accepttext()
ll_tot_reg		= dw_lista_ejecutivo.rowcount()
ls_est_reg		= 'est_reg = 0'
ll_fila 			= dw_lista_ejecutivo.Find(ls_est_reg, 1, ll_tot_reg)
if ll_fila=0 or isnull(ll_fila) then
	messagebox("Advertencia","Debe Seleccionar por lo Menos UN Registro para Asignar")
	dw_lista_ejecutivo.setfocus()
else
	if isvalid(w_ejecutivo_detalle_ugn) then close (w_ejecutivo_detalle_ugn)
	open(w_ejecutivo_detalle_ugn)	
end if
end event

type st_1 from statictext within w_ejecutivo_ugn
integer x = 32
integer y = 56
integer width = 210
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_ejecutivo_ugn
integer x = 251
integer y = 36
integer width = 800
integer height = 120
integer taborder = 10
string title = "none"
string dataobject = "dwe_parque_condolencias"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_lista_ejecutivo.reset()
end event

type cb_ordenar from commandbutton within w_ejecutivo_ugn
event ue_mousemove pbm_dwnmousemove
integer x = 1033
integer y = 1936
integer width = 247
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista_ejecutivo.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista_ejecutivo.SETSORT(NULO)
	dw_lista_ejecutivo.SORT()
end if
end event

type cb_exportar from commandbutton within w_ejecutivo_ugn
event ue_mousemove pbm_mousemove
integer x = 1536
integer y = 1936
integer width = 247
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista_ejecutivo
if dw_lista_ejecutivo.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type gb_1 from groupbox within w_ejecutivo_ugn
event ue_mousemove pbm_mousemove
integer x = 1015
integer y = 1888
integer width = 1408
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

type cb_imprimir from commandbutton within w_ejecutivo_ugn
event ue_mousemove pbm_mousemove
integer x = 1783
integer y = 1936
integer width = 256
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista_ejecutivo.rowcount()>0 then
	f_Print( dw_lista_ejecutivo )
end if
end event

type cb_filtrar from commandbutton within w_ejecutivo_ugn
event ue_mousemove pbm_mousemove
integer x = 1285
integer y = 1936
integer width = 247
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_nulo

setnull(ls_nulo)
dw_lista_ejecutivo.setfilter(ls_nulo)
dw_lista_ejecutivo.filter()
end event

type st_fondo from statictext within w_ejecutivo_ugn
boolean visible = false
integer x = 1015
integer y = 916
integer width = 1431
integer height = 268
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_lista_ejecutivo from datawindow within w_ejecutivo_ugn
integer x = 37
integer y = 192
integer width = 3278
integer height = 1688
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_ejec"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_filtro

this.accepttext()
ls_columna			= dwo.name
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	if ls_columna='t_color_blanco' or ls_columna='t_texto_blanco' or ls_columna='t_color_celeste' or &
		ls_columna='t_texto_celeste' or ls_columna='t_color_amarillo' or ls_columna='t_texto_amarillo' or &
		ls_columna='t_todo' then
		if ls_columna='t_color_blanco' or ls_columna='t_texto_blanco' then
			ls_filtro	= 'tipo_asigna ="ASIG"'
		elseif ls_columna='t_color_celeste' or ls_columna='t_texto_celeste' then
			ls_filtro	= 'tipo_asigna ="RE-ASIG"'
		elseif ls_columna='t_color_amarillo' or ls_columna='t_texto_amarillo' then
			ls_filtro	= 'ugn_cliente_ult_estado_gestion="22"'
		elseif ls_columna='t_todo' then
			ls_filtro	= ''
		end if
		dw_lista_ejecutivo.setfilter(ls_filtro)
		dw_lista_ejecutivo.filter()
		if dw_lista_ejecutivo.rowcount() = 0 then messagebox("Advertencia","No Registra Dato")
	end if
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event itemchanged;Long		ll_est_reg,ll_tot_reg,ll_grupo,ll_indi,ll_grupo_reg
String	ls_columna

this.accepttext()
ls_columna						= dwo.name
if row > 0 then
	if ls_columna='est_reg' then
		ll_est_reg					= long(data)
		if ll_est_reg=0 then
			ll_tot_reg				= dw_lista_ejecutivo.rowcount()
			ll_grupo					= dw_lista_ejecutivo.getitemnumber(this.getrow(),'ugn_cliente_grupo')
			for ll_indi=1 to ll_tot_reg
				ll_grupo_reg		= dw_lista_ejecutivo.getitemnumber(ll_indi,'ugn_cliente_grupo')
				if ll_grupo_reg = ll_grupo then
					dw_lista_ejecutivo.setitem(ll_indi,'est_reg',0)
				end if
			next
			dw_lista_ejecutivo.accepttext()
		end if
	end if
end if
end event

event doubleclicked;Long		ll_grupo, ll_corre, ll_row
String	ls_string

if row > 0 then
	ll_grupo		= dw_lista_ejecutivo.getitemnumber(row,'ugn_cliente_grupo')
	ll_corre		= dw_lista_ejecutivo.getitemnumber(row,'ugn_cliente_correlativo')
	ls_string	= string(ll_grupo)+'~t'+string(ll_corre)
	openwithparm(w_mostrar_detalle_gestion_ugn,ls_string)
end if
end event

