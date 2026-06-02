forward
global type w_modificar_telefonos_cliente from window
end type
type st_contrato from statictext within w_modificar_telefonos_cliente
end type
type st_rut from statictext within w_modificar_telefonos_cliente
end type
type st_5 from statictext within w_modificar_telefonos_cliente
end type
type st_4 from statictext within w_modificar_telefonos_cliente
end type
type st_nombre from statictext within w_modificar_telefonos_cliente
end type
type st_2 from statictext within w_modificar_telefonos_cliente
end type
type st_1 from statictext within w_modificar_telefonos_cliente
end type
type cb_grabar from commandbutton within w_modificar_telefonos_cliente
end type
type dw_mant_fono from datawindow within w_modificar_telefonos_cliente
end type
end forward

global type w_modificar_telefonos_cliente from window
integer width = 2281
integer height = 1456
boolean titlebar = true
string title = "Modificar Telefono Cliente"
windowtype windowtype = response!
long backcolor = 67108864
st_contrato st_contrato
st_rut st_rut
st_5 st_5
st_4 st_4
st_nombre st_nombre
st_2 st_2
st_1 st_1
cb_grabar cb_grabar
dw_mant_fono dw_mant_fono
end type
global w_modificar_telefonos_cliente w_modificar_telefonos_cliente

on w_modificar_telefonos_cliente.create
this.st_contrato=create st_contrato
this.st_rut=create st_rut
this.st_5=create st_5
this.st_4=create st_4
this.st_nombre=create st_nombre
this.st_2=create st_2
this.st_1=create st_1
this.cb_grabar=create cb_grabar
this.dw_mant_fono=create dw_mant_fono
this.Control[]={this.st_contrato,&
this.st_rut,&
this.st_5,&
this.st_4,&
this.st_nombre,&
this.st_2,&
this.st_1,&
this.cb_grabar,&
this.dw_mant_fono}
end on

on w_modificar_telefonos_cliente.destroy
destroy(this.st_contrato)
destroy(this.st_rut)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_nombre)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_grabar)
destroy(this.dw_mant_fono)
end on

event open;date		ld_fecha_hoy,ld_fecha_prox
Long		ll_rut,ll_count_mant,ll_new_reg
String		ls_base,ls_serie,ls_fono_pc,ls_fono_cc,ls_fono_celular,ls_nom,	ls_ap_pat,ls_ap_mat,ls_dv,ls_nom_comp
Double	ll_numero
gf_centrar(w_modificar_telefonos_cliente)
dw_mant_fono.settransobject(sqlca)
ld_fecha_hoy			= date(gdt_fec_sistema)
ll_rut 						= long(substr(1,1,Message.StringParm))
ls_base					= substr(1,2,Message.StringParm)
ls_serie					= substr(1,3,Message.StringParm)
ll_numero				= Double(substr(1,4,Message.StringParm))
ld_fecha_hoy			= date( datetime(date(substr(1,5,Message.StringParm)),time('00:00:00')) )
SELECT	"CLIENTE"."NOMBRE",		"CLIENTE"."A_PATERNO",	"CLIENTE"."A_MATERNO",	"CLIENTE"."DV"  
INTO 		:ls_nom,						:ls_ap_pat,						:ls_ap_mat,						:ls_dv  
FROM		"CLIENTE"  
WHERE	"CLIENTE"."RUT" = :ll_rut   
USING	sqlca;
if sqlca.sqlcode=0 then
	ls_nom_comp		= trim(ls_nom)+ ' '+trim(ls_ap_pat)+ ' '+trim(ls_ap_mat)
	st_nombre.text		= ls_nom_comp
end if
st_rut.text				= string(ll_rut,'###,###,###,##')+'-'+ls_dv
st_contrato.text			= ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###')
//if dw_mant_fono.retrieve(ll_rut, ls_base,ls_serie,ll_numero,ld_fecha_hoy)=0 then
//	SELECT	Count("CAJA_ACTUALIZA_FONO"."ESTADO_REG")  
//	INTO 		:ll_count_mant
//	FROM 	 "CAJA_ACTUALIZA_FONO"  
//	WHERE  ( "CAJA_ACTUALIZA_FONO"."RUT" = :gi_rut) OR  
//			   ( "CAJA_ACTUALIZA_FONO"."BASE" = :gs_base AND  
//				 "CAJA_ACTUALIZA_FONO"."SERIE" = :gs_serie AND  
//				 "CAJA_ACTUALIZA_FONO"."NUMERO" = :gi_numero)   
//	USING		sqlca;
//	if ll_count_mant=0 then
		dw_mant_fono.reset()
		ll_new_reg			= dw_mant_fono.insertrow(0)
		ls_fono_pc			= w_ingreso2.dw_encabezado_ingreso_cupon.getitemstring(1,'cliente_fono_p')
		ls_fono_cc			= w_ingreso2.dw_encabezado_ingreso_cupon.getitemstring(1,'cliente_fono_c')
		ls_fono_celular		= w_ingreso2.dw_encabezado_ingreso_cupon.getitemstring(1,'cliente_celular')
		dw_mant_fono.setitem(ll_new_reg,'fono_actual',ls_fono_pc)
		dw_mant_fono.setitem(ll_new_reg,'celular_actual',ls_fono_celular)
		dw_mant_fono.setitem(ll_new_reg,'fono_comercial_actual',ls_fono_cc)
		dw_mant_fono.setitem(ll_new_reg,'base',gs_base)
		dw_mant_fono.setitem(ll_new_reg,'serie',gs_serie)
		dw_mant_fono.setitem(ll_new_reg,'numero',gi_numero)
		dw_mant_fono.setitem(ll_new_reg,'rut',gi_rut)
		SELECT "CLIENTE"."DV"  INTO :gs_dv  FROM "CLIENTE"  WHERE "CLIENTE"."RUT" = :gi_rut   ;
		dw_mant_fono.setitem(ll_new_reg,'dv',gs_dv)
		dw_mant_fono.setitem(ll_new_reg,'usuario_crea',gs_user)
		dw_mant_fono.accepttext()
		dw_mant_fono.enabled	= true
		dw_mant_fono.setfocus()
//	end if
//else
//	dw_mant_fono.accepttext()
//	dw_mant_fono.enabled	= true
//	ld_fecha_prox				= date(dw_mant_fono.getitemdatetime(1,'fecha_prox_consulta'))
//	if ld_fecha_prox > ld_fecha_hoy then
//		close(w_modificar_telefonos_cliente)
//	end if
//end if


end event

type st_contrato from statictext within w_modificar_telefonos_cliente
integer x = 503
integer y = 528
integer width = 1742
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_rut from statictext within w_modificar_telefonos_cliente
integer x = 503
integer y = 336
integer width = 1742
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_5 from statictext within w_modificar_telefonos_cliente
integer x = 23
integer y = 528
integer width = 343
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Contrato"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_modificar_telefonos_cliente
integer x = 128
integer y = 336
integer width = 238
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rut"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nombre from statictext within w_modificar_telefonos_cliente
integer x = 503
integer y = 432
integer width = 1742
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_2 from statictext within w_modificar_telefonos_cliente
integer x = 128
integer y = 432
integer width = 238
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_modificar_telefonos_cliente
integer x = 41
integer y = 36
integer width = 2190
integer height = 240
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recuerde Preguntar a Cliente Números Telefónicos"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_modificar_telefonos_cliente
integer x = 55
integer y = 1184
integer width = 2149
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String	ls_fono_pc,ls_fono_cel,ls_fono_cc
Date		ld_fecha_hoy

dw_mant_fono.accepttext()
ld_fecha_hoy	= date(gdt_fec_sistema)
ls_fono_pc		= dw_mant_fono.getitemstring(1,'fono_nuevo')
ls_fono_cel		= dw_mant_fono.getitemstring(1,'celular_nuevo')
ls_fono_cc		= dw_mant_fono.getitemstring(1,'fono_comercial_nuevo')
if (isnull(ls_fono_pc) or ls_fono_pc='') and (isnull(ls_fono_cel) or ls_fono_cel='') and (isnull(ls_fono_cc) or ls_fono_cc='') then
	dw_mant_fono.setitem(1,'fecha_prox_consulta',relativedate(ld_fecha_hoy,90))
	dw_mant_fono.setitem(1,'actualiza_reg','N')
	dw_mant_fono.accepttext()
	if dw_mant_fono.update()=1 then
		commit;
		close(w_modificar_telefonos_cliente)
	else
		rollback;
	end if
else
	dw_mant_fono.setitem(1,'fecha_prox_consulta',relativedate(ld_fecha_hoy,180))
	dw_mant_fono.setitem(1,'actualiza_reg','S')
	dw_mant_fono.accepttext()
	if dw_mant_fono.update()=1 then
		commit;
		close(w_modificar_telefonos_cliente)
	else
		rollback;
	end if
end if
end event

type dw_mant_fono from datawindow within w_modificar_telefonos_cliente
integer x = 14
integer y = 636
integer width = 2226
integer height = 548
integer taborder = 10
string title = "none"
string dataobject = "dw_mantencion_fono_en_caja"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna

this.accepttext()
ls_columna	= dwo.name
if ls_columna='fono_nuevo' or ls_columna='celular_nuevo' or ls_columna='fono_comercial_nuevo' then
	this.setitem(1,'estado_reg','V')
	this.accepttext()
end if
end event

