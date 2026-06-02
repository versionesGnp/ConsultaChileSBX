forward
global type w_modificar_beneficiarios from window
end type
type st_ayuda from statictext within w_modificar_beneficiarios
end type
type dw_print from datawindow within w_modificar_beneficiarios
end type
type cb_ordenar from commandbutton within w_modificar_beneficiarios
end type
type cb_imprimir from commandbutton within w_modificar_beneficiarios
end type
type pb_menos from picturebutton within w_modificar_beneficiarios
end type
type pb_mas from picturebutton within w_modificar_beneficiarios
end type
type dw_beneficiarios_eliminados from datawindow within w_modificar_beneficiarios
end type
type st_2 from statictext within w_modificar_beneficiarios
end type
type st_1 from statictext within w_modificar_beneficiarios
end type
type cb_grabar from commandbutton within w_modificar_beneficiarios
end type
type cb_cerrar from commandbutton within w_modificar_beneficiarios
end type
type dw_beneficiarios_actuales from datawindow within w_modificar_beneficiarios
end type
end forward

global type w_modificar_beneficiarios from window
integer x = 133
integer y = 364
integer width = 2885
integer height = 2332
boolean titlebar = true
string title = "Listado de Beneficiarios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
st_ayuda st_ayuda
dw_print dw_print
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
pb_menos pb_menos
pb_mas pb_mas
dw_beneficiarios_eliminados dw_beneficiarios_eliminados
st_2 st_2
st_1 st_1
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_beneficiarios_actuales dw_beneficiarios_actuales
end type
global w_modificar_beneficiarios w_modificar_beneficiarios

type variables
long	il_row,il_row_destino
Boolean   ib_dragflag
string	ls_nombre,ls_sepultura
Date		idt_fecha_hoy
DragObject control_dw, control_dw2

end variables

on w_modificar_beneficiarios.create
this.st_ayuda=create st_ayuda
this.dw_print=create dw_print
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.pb_menos=create pb_menos
this.pb_mas=create pb_mas
this.dw_beneficiarios_eliminados=create dw_beneficiarios_eliminados
this.st_2=create st_2
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_beneficiarios_actuales=create dw_beneficiarios_actuales
this.Control[]={this.st_ayuda,&
this.dw_print,&
this.cb_ordenar,&
this.cb_imprimir,&
this.pb_menos,&
this.pb_mas,&
this.dw_beneficiarios_eliminados,&
this.st_2,&
this.st_1,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_beneficiarios_actuales}
end on

on w_modificar_beneficiarios.destroy
destroy(this.st_ayuda)
destroy(this.dw_print)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.pb_menos)
destroy(this.pb_mas)
destroy(this.dw_beneficiarios_eliminados)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_beneficiarios_actuales)
end on

event open;gf_centrar(w_modificar_beneficiarios)
idt_fecha_hoy		= date(gdt_fec_sistema)
st_ayuda.visible	= false
if not isnull(gs_nombres) then 
	ls_nombre = gs_nombres
end if
if not isnull(gs_apellido_paterno) then 
	ls_nombre = ls_nombre+' '+gs_apellido_paterno
end if
if not isnull(gs_apellido_materno) then 
	ls_nombre = ls_nombre+' '+gs_apellido_materno
end if
if gs_base='C' then
	SELECT	"CONTRATO"."SEPULTURA",	"CADENA"."COD_PARQUE"  
   INTO 		:ls_sepultura,				:gl_cod_parque_cta  
   FROM 		"CADENA",   
         	"CONTRATO"  
   WHERE  ( "CADENA"."SERIE" = "CONTRATO"."SERIE_C" ) and  
          ( "CADENA"."NUMERO" = "CONTRATO"."NRO_CONTRATO" ) and  
          (("CADENA"."CODIGO" = 'C' ) AND  
          ( "CADENA"."SERIE" = :gs_serie ) AND  
          ( "CADENA"."NUMERO" = :gi_numero ) )   
	USING		sqlca;
	dw_beneficiarios_actuales.dataobject	= 'dw_ingreso_beneficiarios_reales'
	dw_beneficiarios_actuales.SetTransObject(SQLCA)
	if dw_beneficiarios_actuales.Retrieve(gs_serie,gi_numero,gs_base,ls_sepultura,ls_nombre,gs_conexion,gl_cod_parque_cta)=0 then
//		messagebox("Advertencia","No registra Beneficiarios")
	end if
	
elseif gs_base='O' then
	SELECT	"PAGO_OFERTA"."SEPULTURA",	"CADENA"."COD_PARQUE"   
	INTO 		:ls_sepultura,					:gl_cod_parque_cta  
	FROM 		"CADENA",   
				"OFERTA_V",   
				"PAGO_OFERTA"  
	WHERE  ( "PAGO_OFERTA"."SERIE" = "OFERTA_V"."SERIE" ) and  
			 ( "PAGO_OFERTA"."NRO_OFERTA" = "OFERTA_V"."NRO_OFERTA" ) and  
			 ( "PAGO_OFERTA"."FOLIO" = "OFERTA_V"."ULT_FOLIO" ) and  
			 ( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) and  
			 ( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) and  
			 (("CADENA"."CODIGO" = 'O' ) AND  
			 ( "CADENA"."SERIE" = :gs_serie ) AND  
			 ( "CADENA"."NUMERO" = :gi_numero ) )   
	USING		sqlca;
	dw_beneficiarios_actuales.dataobject	= 'dw_ingreso_beneficiarios_reales_promesa'
	dw_beneficiarios_actuales.SetTransObject(SQLCA)
	if dw_beneficiarios_actuales.Retrieve(gs_serie,gi_numero,gs_base,ls_sepultura,ls_nombre,gs_conexion,gl_cod_parque_cta)=0 then
//		messagebox("Advertencia","No registra Beneficiarios")
	end if
end if
if gs_conexion	= "Parque El Prado" then
//	dw_beneficiarios_actuales.object.t_l1.text				= 'INMOBILIARIA PARQUE LA FLORIDA SpA'
//	dw_beneficiarios_actuales.object.t_l2.text				= 'R.U.T.     : 96.844.000-4'
//	dw_beneficiarios_actuales.object.t_l3.text				= 'Explotación Cementerio'
//	dw_beneficiarios_actuales.object.t_l4.text				= 'Casa Matriz:  Estado Nº 360, 2º piso - Fono: 380 57 00'
//	dw_beneficiarios_actuales.object.t_l5.text				= 'Fax: 380 58 06 - Santiago Centro.'
//	dw_beneficiarios_actuales.object.t_l6.text				= 'SUCURSAL   : Av. Camilo Henriquez Nº 4673 - Fono: 267 00 01'
//	dw_beneficiarios_actuales.object.t_l7.text				= 'Fax        : 267 01 46 - Puente Alto.'
	dw_beneficiarios_actuales.object.txt_stgo.visible		= true
	dw_beneficiarios_actuales.object.txt_serena.visible	= false
	dw_beneficiarios_actuales.object.txt_conce.visible		= false
elseif gs_conexion	= "Parque la Foresta" then
//	dw_beneficiarios_actuales.object.t_l1.text				= 'INMOBILIARIA PARQUE DE LA SERENA SpA'
//	dw_beneficiarios_actuales.object.t_l2.text				= 'R.U.T.     : 96.835.970-3'
//	dw_beneficiarios_actuales.object.t_l2.text				= 'Explotación Cementerio'
//	dw_beneficiarios_actuales.object.t_l3.text				= 'Dirección  : Ruta 41 Sector Aeropuerto Camino Vicuña - Fono: 27 18 01'
//	dw_beneficiarios_actuales.object.t_l4.text				= 'Fax        : 27 18 58'
//	dw_beneficiarios_actuales.object.t_l5.text				= ''
//	dw_beneficiarios_actuales.object.t_l6.text				= ''
//	dw_beneficiarios_actuales.object.t_l7.text				= ''
	dw_beneficiarios_actuales.object.txt_serena.visible	= true
	dw_beneficiarios_actuales.object.txt_stgo.visible		= false
	dw_beneficiarios_actuales.object.txt_conce.visible		= false
elseif gs_conexion	= "Parque Concepción" then
	dw_beneficiarios_actuales.object.txt_serena.visible	= false
	dw_beneficiarios_actuales.object.txt_stgo.visible		= false
	dw_beneficiarios_actuales.object.txt_conce.visible		= true
end if
dw_beneficiarios_eliminados.SetTransObject(SQLCA)
dw_beneficiarios_eliminados.Retrieve(gs_base,gs_serie,gi_numero)
gs_ventana	= 'w_modificar_beneficiarios'
f_valida_objeto()
end event

event mousemove;st_ayuda.visible	= false
end event

type st_ayuda from statictext within w_modificar_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 123
integer y = 1536
integer width = 1582
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 28573695
string text = "Para Cualquier tipo de Cambio, debe Eliminar y Crear Nuevo Beneficiario"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_ayuda.visible	= false
end event

type dw_print from datawindow within w_modificar_beneficiarios
boolean visible = false
integer x = 1445
integer y = 2112
integer width = 558
integer height = 432
integer taborder = 40
string dataobject = "dw_ingreso_beneficiarios_isacruz_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ordenar from commandbutton within w_modificar_beneficiarios
integer x = 1083
integer y = 2112
integer width = 320
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_beneficiarios_actuales.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_beneficiarios_actuales.SETSORT(NULO)
	dw_beneficiarios_actuales.SORT()
end if
end event

type cb_imprimir from commandbutton within w_modificar_beneficiarios
integer x = 759
integer y = 2112
integer width = 320
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;CHOOSE CASE gs_base
	CASE 'O'
		dw_print.dataobject='dw_ingreso_beneficiarios_promesa_print'
	CASE 'C'
		dw_print.dataobject='dw_ingreso_beneficiarios_isacruz_print'
END CHOOSE
dw_print.settransobject(sqlca)
if gs_conexion	= "Parque El Prado" then
//	dw_print.object.t_l1.text				= 'INMOBILIARIA PARQUE LA FLORIDA SpA'
//	dw_print.object.t_l2.text				= 'R.U.T.     : 96.844.000-4'
//	dw_print.object.t_l3.text				= 'Explotación Cementerio'
//	dw_print.object.t_l4.text				= 'Casa Matriz:  Estado Nº 360, 2º piso - Fono: 380 57 00'
//	dw_print.object.t_l5.text				= 'Fax: 380 58 06 - Santiago Centro.'
//	dw_print.object.t_l6.text				= 'SUCURSAL   : Av. Camilo Henriquez Nº 4673 - Fono: 267 00 01'
//	dw_print.object.t_l7.text				= 'Fax        : 267 01 46 - Puente Alto.'
	dw_print.object.t_firma_pp.text	= 'pp. Inmobiliaria Parque La Florida SpA'
	dw_print.object.txt_stgo.visible		= true
	dw_print.object.txt_conce.visible	= false
	dw_print.object.txt_serena.visible	= false
elseif gs_conexion	= "Parque La Foresta" then
//	dw_print.object.t_l1.text				= 'INMOBILIARIA PARQUE DE LA SERENA SpA'
//	dw_print.object.t_l2.text				= 'R.U.T.     : 96.835.970-3'
//	dw_print.object.t_l2.text				= 'Explotación Cementerio'
//	dw_print.object.t_l3.text				= 'Dirección  : Ruta 41 Sector Aeropuerto Camino Vicuña - Fono: 27 18 01'
//	dw_print.object.t_l4.text				= 'Fax        : 27 18 58'
	dw_print.object.t_firma_pp.text	= 'pp. Inmobiliaria Parque De La Serena SpA'
//	dw_print.object.t_l5.text				= ''
//	dw_print.object.t_l6.text				= ''
//	dw_print.object.t_l7.text				= ''
	dw_print.object.txt_serena.visible	= true
	dw_print.object.txt_conce.visible	= false
	dw_print.object.txt_stgo.visible		= false
elseif gs_conexion	= "Parque Concepción" then
	dw_print.object.t_firma_pp.text	= 'pp. Parque de Concepción S.A.'
	dw_print.object.txt_conce.visible	= true
	dw_print.object.txt_serena.visible	= false
	dw_print.object.txt_stgo.visible		= false
end if
if dw_print.Retrieve(gs_serie,gi_numero,gs_base,ls_sepultura,ls_nombre,gl_cod_parque_cta)>0 then
	f_Print( dw_print )
end if
end event

type pb_menos from picturebutton within w_modificar_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 2469
integer y = 1552
integer width = 174
integer height = 132
integer taborder = 30
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Borrar"
string picturename = "menos.bmp"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;long 		ll_resp,ll_rut,ll_rut_aux,ll_new,ll_tot_reg,ll_indi,ll_sw=0,ll_sw_grabar=0
String	ls_nombre2,ls_ap_pat2,ls_ap_mat2,ls_dv,ls_nombre2_aux,ls_ap_pat2_aux,ls_ap_mat2_aux,&
			ls_serie_aux,ls_serie
Double	ll_numero_aux,ll_numero
if dw_beneficiarios_actuales.rowcount() > 0 then
	if gs_base='C' then
		ll_numero	= dw_beneficiarios_actuales.getitemnumber(il_row,'numero')
		ls_serie		= trim(dw_beneficiarios_actuales.getitemstring(il_row,'serie'))
		ll_rut		= dw_beneficiarios_actuales.getitemnumber(il_row,'rut')
		ls_dv			= trim(dw_beneficiarios_actuales.getitemstring(il_row,'dv'))
		ls_nombre2	= trim(dw_beneficiarios_actuales.getitemstring(il_row,'nombres'))
		ls_ap_pat2	= trim(dw_beneficiarios_actuales.getitemstring(il_row,'apaterno'))
		ls_ap_mat2	= trim(dw_beneficiarios_actuales.getitemstring(il_row,'amaterno'))
		SELECT	"COPROP_ISACRUZ"."RUT"  
		INTO 	 	:ll_rut_aux  
		FROM 	 	"COPROP_ISACRUZ"  
		WHERE  ( "COPROP_ISACRUZ"."RUT" = :ll_rut ) AND  
				 ( "COPROP_ISACRUZ"."NOMBRES" = :ls_nombre2 ) AND  
				 ( "COPROP_ISACRUZ"."APATERNO" = :ls_ap_pat2 ) AND 
				 ( "COPROP_ISACRUZ"."SERIE" = :ls_serie ) AND  
				 ( "COPROP_ISACRUZ"."NUMERO" = :ll_numero ) 
		USING	sqlca;

	elseif gs_base='O' then
		ll_numero	= dw_beneficiarios_actuales.getitemnumber(il_row,'nro_oferta')
		ls_serie		= trim(dw_beneficiarios_actuales.getitemstring(il_row,'serie'))
		ll_rut		= dw_beneficiarios_actuales.getitemnumber(il_row,'rut')
		ls_dv			= trim(dw_beneficiarios_actuales.getitemstring(il_row,'dv'))
		ls_nombre2	= trim(dw_beneficiarios_actuales.getitemstring(il_row,'nombre'))
		ls_ap_pat2	= trim(dw_beneficiarios_actuales.getitemstring(il_row,'a_paterno'))
		ls_ap_mat2	= trim(dw_beneficiarios_actuales.getitemstring(il_row,'a_materno'))
		SELECT 	"CO_PROP"."RUT"
		INTO 		:ll_rut_aux
		FROM 		"CO_PROP"
		WHERE  ( "CO_PROP"."RUT" = :ll_rut ) AND
				 ( "CO_PROP"."NOMBRE" = :ls_nombre2 ) AND
				 ( "CO_PROP"."A_PATERNO" = :ls_ap_pat2 ) AND
				 ( "CO_PROP"."SERIE" = :ls_serie ) AND
				 ( "CO_PROP"."NRO_OFERTA" = :ll_numero )
		USING		sqlca;
	end if
	if sqlca.sqlcode=0 then
		ll_resp	=	MessageBox("Advertencia",'Está seguro de Eliminar Beneficiario Nº '+string(il_row,"###,###,###,##0"), &
										Exclamation!, YesNo!, 2)
		IF ll_resp = 1 THEN
			ll_tot_reg	= dw_beneficiarios_eliminados.rowcount()
			for ll_indi=1 to ll_tot_reg
				ll_rut_aux		= dw_beneficiarios_eliminados.getitemnumber(ll_indi,'rut')
				ls_serie_aux	= trim(dw_beneficiarios_eliminados.getitemstring(ll_indi,'serie'))
				ll_numero_aux	= dw_beneficiarios_eliminados.getitemnumber(ll_indi,'numero')
				ls_nombre2_aux	= trim(dw_beneficiarios_eliminados.getitemstring(ll_indi,'nombres'))
				ls_ap_pat2_aux	= trim(dw_beneficiarios_eliminados.getitemstring(ll_indi,'apaterno'))
				ls_ap_mat2_aux	= trim(dw_beneficiarios_eliminados.getitemstring(ll_indi,'amaterno'))
				if ll_rut_aux=ll_rut and ls_serie_aux=ls_serie and ll_numero_aux=ll_numero and &
					ls_nombre2_aux=ls_nombre2 and ls_ap_pat2_aux=ls_ap_pat2 then
					ll_sw	= 1
				end if
			next
			if ll_sw=0 then
				dw_beneficiarios_actuales.deleterow(il_row)
				ll_new	= dw_beneficiarios_eliminados.insertrow(0)
				dw_beneficiarios_eliminados.scrolltorow(ll_new)
				dw_beneficiarios_eliminados.setitem(ll_new,'base',gs_base)
				dw_beneficiarios_eliminados.setitem(ll_new,'serie',gs_serie)
				dw_beneficiarios_eliminados.setitem(ll_new,'numero',gi_numero)
				dw_beneficiarios_eliminados.setitem(ll_new,'correlativo',dw_beneficiarios_actuales.rowcount())
				dw_beneficiarios_eliminados.setitem(ll_new,'nombres',ls_nombre2)
				dw_beneficiarios_eliminados.setitem(ll_new,'apaterno',ls_ap_pat2)
				dw_beneficiarios_eliminados.setitem(ll_new,'amaterno',ls_ap_mat2)
				dw_beneficiarios_eliminados.setitem(ll_new,'rut',ll_rut)
				dw_beneficiarios_eliminados.setitem(ll_new,'dv',ls_dv)
				dw_beneficiarios_eliminados.setitem(ll_new,'usuario',gs_user)
				dw_beneficiarios_eliminados.setitem(ll_new,'fecha_crea',idt_fecha_hoy)
			else
				dw_beneficiarios_actuales.deleterow(il_row)
			end if
			if dw_beneficiarios_actuales.update()=1 then
				commit;
				ll_sw_grabar	= 1
			else
				rollback;
			end if
		END IF
	else
		dw_beneficiarios_actuales.deleterow(il_row)
		if dw_beneficiarios_actuales.update()=1 then
			commit;
			ll_sw_grabar		= 1
		else
			rollback;
		end if	
	end if
end if
if ll_sw_grabar=1 then
	dw_beneficiarios_actuales.accepttext()
	dw_beneficiarios_eliminados.accepttext()
	ll_tot_reg	= dw_beneficiarios_actuales.rowcount()
	if ll_tot_reg=0 then
		dw_beneficiarios_actuales.reset()
	end if
	for ll_indi=1 to ll_tot_reg
		if dw_beneficiarios_actuales.dataobject='dw_ingreso_beneficiarios_reales' then
			dw_beneficiarios_actuales.setitem(ll_indi,'linea',ll_indi)
		else
			dw_beneficiarios_actuales.setitem(ll_indi,'contador',ll_indi)
		end if
	next
	dw_beneficiarios_actuales.accepttext()
	if dw_beneficiarios_actuales.update()=1 then
		commit;
	else
		rollback;
	end if
	if dw_beneficiarios_eliminados.update()=1 then
		commit;
	else
		rollback;
	end if
	CHOOSE CASE gs_base
		CASE 'O'
			w_listado_beneficiarios.dw_listado_beneficiarios.Retrieve(gs_serie,gi_numero)
		CASE 'C'
			w_listado_beneficiarios2.dw_listado_beneficiarios2.Retrieve(gs_serie,gi_numero)
	END CHOOSE
end if
end event

type pb_mas from picturebutton within w_modificar_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 2222
integer y = 1552
integer width = 174
integer height = 132
integer taborder = 20
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "nuevo"
string picturename = "mas.bmp"
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event clicked;long		ll_new,ll_tot_reg,ll_indi,ll_rut,ll_sw=0
string	ls_nombre2,ls_ap_pat2,ls_dv

ll_tot_reg	= dw_beneficiarios_actuales.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		if gs_base='C' then
			ll_rut		= dw_beneficiarios_actuales.getitemnumber(ll_indi,'rut')
			ls_dv			= dw_beneficiarios_actuales.getitemstring(ll_indi,'dv')
			ls_nombre2	= dw_beneficiarios_actuales.getitemstring(ll_indi,'nombres')
			ls_ap_pat2	= dw_beneficiarios_actuales.getitemstring(ll_indi,'apaterno')
		elseif gs_base='O' then
			ll_rut		= dw_beneficiarios_actuales.getitemnumber(ll_indi,'rut')
			ls_dv			= dw_beneficiarios_actuales.getitemstring(ll_indi,'dv')
			ls_nombre2	= dw_beneficiarios_actuales.getitemstring(ll_indi,'nombre')
			ls_ap_pat2	= dw_beneficiarios_actuales.getitemstring(ll_indi,'a_paterno')
		end if
		if isnull(ll_rut) or ll_rut<=0 then
			messagebox("Advertencia","Beneficiario Nº: "+string(ll_indi)+", Rut Inválido")
			ll_sw			= 1
			dw_beneficiarios_actuales.scrolltorow(ll_indi)
			dw_beneficiarios_actuales.setfocus()
			exit
		else
			if isnull(ls_nombre2) or ls_nombre2='' then
				messagebox("Advertencia","Beneficiario Nº: "+string(ll_indi)+", Nombre Inválido")
				ll_sw	= 1
				dw_beneficiarios_actuales.scrolltorow(ll_indi)
				dw_beneficiarios_actuales.setfocus()
				exit
			else
				if isnull(ls_ap_pat2) or ls_ap_pat2='' then
					messagebox("Advertencia","Beneficiario Nº: "+string(ll_indi)+", Apellido Paterno Inválido")
					ll_sw	= 1
					dw_beneficiarios_actuales.scrolltorow(ll_indi)
					dw_beneficiarios_actuales.setfocus()
					exit
				end if
			end if
		end if
	next
else
	dw_beneficiarios_actuales.Retrieve(gs_serie,gi_numero,gs_base,ls_sepultura,ls_nombre,gs_conexion,gl_cod_parque_cta)	
end if
if ll_sw	= 0 then
	ll_new		= dw_beneficiarios_actuales.insertrow(0)
	if gs_base='C' then
		dw_beneficiarios_actuales.setitem(ll_new,'linea',(ll_tot_reg+1))
		dw_beneficiarios_actuales.setitem(ll_new,'numero',gi_numero)
		dw_beneficiarios_actuales.setitem(ll_new,'serie',gs_serie)
		dw_beneficiarios_actuales.setitem(ll_new,'estado','S')
	elseif gs_base='O' then
		dw_beneficiarios_actuales.setitem(ll_new,'contador',(ll_tot_reg+1))
		dw_beneficiarios_actuales.setitem(ll_new,'nro_oferta',gi_numero)
		dw_beneficiarios_actuales.setitem(ll_new,'serie',gs_serie)
		dw_beneficiarios_actuales.setitem(ll_new,'estado','S')
	end if
	dw_beneficiarios_actuales.scrolltorow(ll_new)
	dw_beneficiarios_actuales.setfocus()
	dw_beneficiarios_actuales.setcolumn('rut')
end if
dw_beneficiarios_actuales.accepttext()
dw_beneficiarios_eliminados.accepttext()
end event

type dw_beneficiarios_eliminados from datawindow within w_modificar_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 1700
integer width = 2789
integer height = 380
string dragicon = "Exclamation!"
string dataobject = "dw_lista_beneficiarios_eliminados"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ayuda.visible	= false
end event

event dragdrop;control_dw2 = DraggedObject()
if control_dw2 = dw_beneficiarios_actuales then
	pb_menos.triggerevent(clicked!)
end if
end event

event dberror;return(1)
end event

event clicked;if row > 0 then
	il_row_destino	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
//	this.Drag(Begin!)
end if
end event

type st_2 from statictext within w_modificar_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 64
integer y = 1628
integer width = 1577
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Copperplate Gothic Light"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de Beneficiarios Eliminados"
boolean focusrectangle = false
end type

event ue_mousemove;st_ayuda.visible	= false
end event

type st_1 from statictext within w_modificar_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 64
integer y = 20
integer width = 1038
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Copperplate Gothic Light"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de Beneficiarios"
boolean focusrectangle = false
end type

event ue_mousemove;st_ayuda.visible	= false
end event

type cb_grabar from commandbutton within w_modificar_beneficiarios
integer x = 41
integer y = 2112
integer width = 320
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_tot_reg,ll_sw=0,ll_indi,ll_rut
String	ls_nombre2,ls_ap_pat2,ls_dv
ll_tot_reg	= dw_beneficiarios_actuales.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		if gs_base='C' then
			ll_rut		= dw_beneficiarios_actuales.getitemnumber(ll_indi,'rut')
			ls_dv			= dw_beneficiarios_actuales.getitemstring(ll_indi,'dv')
			ls_nombre2	= dw_beneficiarios_actuales.getitemstring(ll_indi,'nombres')
			ls_ap_pat2	= dw_beneficiarios_actuales.getitemstring(ll_indi,'apaterno')
		elseif gs_base='O' then
			ll_rut		= dw_beneficiarios_actuales.getitemnumber(ll_indi,'rut')
			ls_nombre2	= dw_beneficiarios_actuales.getitemstring(ll_indi,'nombre')
			ls_ap_pat2	= dw_beneficiarios_actuales.getitemstring(ll_indi,'a_paterno')
		end if
		if isnull(ll_rut) or ll_rut<=0 then
			messagebox("Advertencia","Rut Inválido")
			ll_sw	= 1
			exit
		else
			if isnull(ls_nombre2) or ls_nombre2='' then
				messagebox("Advertencia","Nombre Inválido")
				ll_sw	= 1
				exit
			else
				if isnull(ls_ap_pat2) or ls_ap_pat2='' then
					messagebox("Advertencia","Apellido Paterno Inválido")
					ll_sw	= 1
					exit
				end if
			end if
		end if
	next
end if
if ll_sw = 0 then
	dw_beneficiarios_actuales.accepttext()
	dw_beneficiarios_eliminados.accepttext()
	if dw_beneficiarios_actuales.update()=1 then
		commit;
		CHOOSE CASE gs_base
			CASE 'O'
				w_listado_beneficiarios.dw_listado_beneficiarios.Retrieve(gs_serie,gi_numero)
			CASE 'C'
				w_listado_beneficiarios2.dw_listado_beneficiarios2.Retrieve(gs_serie,gi_numero)
		END CHOOSE
		if dw_beneficiarios_eliminados.update()=1 then
			commit;
		else
			rollback;
		end if
		messagebox("Grabar","Grabación Exitosa")
		Close(w_modificar_beneficiarios)
	else
		rollback;
		messagebox("Error al Grabar","Error al Grabar: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_modificar_beneficiarios
integer x = 2510
integer y = 2112
integer width = 320
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_modificar_beneficiarios)
end event

type dw_beneficiarios_actuales from datawindow within w_modificar_beneficiarios
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 84
integer width = 2789
integer height = 1452
integer taborder = 10
string dragicon = "StopSign!"
string dataobject = "dw_ingreso_beneficiarios_reales"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_ayuda.visible	= true
end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event dberror;return(1)
end event

event dragdrop;//String	ls_codigo,ls_serie,ls_serie_aux,ls_nombre2,ls_ap_pat,ls_ap_mat,ls_dv
//Long		ll_rut,ll_numero,ll_tot_reg,ll_indi,ll_numero_aux,ll_rut_aux,ll_sw=0
//Long		ll_new
//control_dw = DraggedObject()
//if control_dw = dw_beneficiarios_eliminados and il_row_destino > 0 then
//	ll_rut		= dw_beneficiarios_eliminados.getitemnumber(il_row_destino,'rut')
//	ls_serie		= dw_beneficiarios_eliminados.getitemstring(il_row_destino,'serie')
//	ll_numero	= dw_beneficiarios_eliminados.getitemnumber(il_row_destino,'numero')
//	ls_nombre2	= dw_beneficiarios_eliminados.getitemstring(il_row_destino,'nombres')
//	ls_ap_pat	= dw_beneficiarios_eliminados.getitemstring(il_row_destino,'apaterno')
//	ls_ap_mat	= dw_beneficiarios_eliminados.getitemstring(il_row_destino,'amaterno')
//	ls_dv			= dw_beneficiarios_eliminados.getitemstring(il_row_destino,'dv')
//	ll_tot_reg	= dw_beneficiarios_actuales.rowcount()
//	for ll_indi = 1 to ll_tot_reg
//		ll_rut_aux		= dw_beneficiarios_actuales.getitemnumber(ll_indi,'rut')
//		ls_serie_aux	= dw_beneficiarios_actuales.getitemstring(ll_indi,'serie')
//		if gs_base='O' then
//			ll_numero_aux	= dw_beneficiarios_actuales.getitemnumber(ll_indi,'nro_oferta')
//		else
//			ll_numero_aux	= dw_beneficiarios_actuales.getitemnumber(ll_indi,'numero')
//		end if
//		if ll_rut_aux=ll_rut and ls_serie_aux=ls_serie and ll_numero_aux=ll_numero then
//			ll_sw	= 1
////			messagebox("Advertencia","No se puede Eliminar Beneficiario ya existe")
//			exit
//		end if
//	next
//	if ll_sw=0 then
//		dw_beneficiarios_eliminados.deleterow(il_row_destino)
////		if dw_beneficiarios_eliminados.update()=1 then
////			commit;
//			ll_new		= dw_beneficiarios_actuales.insertrow(0)
//			dw_beneficiarios_actuales.scrolltorow(ll_new)
//			if gs_base='C' then
//				dw_beneficiarios_actuales.setitem(ll_new,'linea',dw_beneficiarios_actuales.rowcount())
//				dw_beneficiarios_actuales.setitem(ll_new,'numero',ll_numero)
//				dw_beneficiarios_actuales.setitem(ll_new,'rut',ll_rut)
//				dw_beneficiarios_actuales.setitem(ll_new,'serie',ls_serie)
//				dw_beneficiarios_actuales.setitem(ll_new,'nombres',ls_nombre2)
//				dw_beneficiarios_actuales.setitem(ll_new,'apaterno',ls_ap_pat)
//				dw_beneficiarios_actuales.setitem(ll_new,'amaterno',ls_ap_mat)
//				dw_beneficiarios_actuales.setitem(ll_new,'dv',ls_dv)
//				
//			elseif gs_base='O' then
//				dw_beneficiarios_actuales.setitem(ll_new,'contador',dw_beneficiarios_actuales.rowcount())
//				dw_beneficiarios_actuales.setitem(ll_new,'nro_oferta',ll_numero)
//				dw_beneficiarios_actuales.setitem(ll_new,'rut',ll_rut)
//				dw_beneficiarios_actuales.setitem(ll_new,'serie',ls_serie)
//				dw_beneficiarios_actuales.setitem(ll_new,'nombre',ls_nombre2)
//				dw_beneficiarios_actuales.setitem(ll_new,'a_paterno',ls_ap_pat)
//				dw_beneficiarios_actuales.setitem(ll_new,'a_materno',ls_ap_mat)
//			end if
////			if dw_beneficiarios_actuales.update()=1 then
////				commit;
////			else
////				rollback;
////			end if
////		else
////			rollback;
////		end if
//	else
//		dw_beneficiarios_eliminados.deleterow(il_row_destino)
////		if dw_beneficiarios_eliminados.update()=1 then
////			commit;
////		else
////			rollback;
////		end if
//	end if
//	dw_beneficiarios_actuales.SelectRow(0, FALSE)
//	dw_beneficiarios_actuales.SelectRow(1, TRUE)
//	dw_beneficiarios_actuales.ScrollToRow(1)
//end if
//dw_beneficiarios_actuales.accepttext()
//dw_beneficiarios_eliminados.accepttext()
end event

