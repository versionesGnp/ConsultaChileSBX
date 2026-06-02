forward
global type w_ingreso_nuevo_beneficiario from window
end type
type st_contrato from statictext within w_ingreso_nuevo_beneficiario
end type
type st_rechazado from statictext within w_ingreso_nuevo_beneficiario
end type
type st_3 from statictext within w_ingreso_nuevo_beneficiario
end type
type dw_detalle_original from datawindow within w_ingreso_nuevo_beneficiario
end type
type dw_cliente_original from datawindow within w_ingreso_nuevo_beneficiario
end type
type st_cliente from statictext within w_ingreso_nuevo_beneficiario
end type
type dw_print from datawindow within w_ingreso_nuevo_beneficiario
end type
type cb_ordenar from commandbutton within w_ingreso_nuevo_beneficiario
end type
type cb_exportar from commandbutton within w_ingreso_nuevo_beneficiario
end type
type cb_imprimir from commandbutton within w_ingreso_nuevo_beneficiario
end type
type cb_grabar from commandbutton within w_ingreso_nuevo_beneficiario
end type
type st_2 from statictext within w_ingreso_nuevo_beneficiario
end type
type st_1 from statictext within w_ingreso_nuevo_beneficiario
end type
type cb_cerrar from commandbutton within w_ingreso_nuevo_beneficiario
end type
type dw_detalle from datawindow within w_ingreso_nuevo_beneficiario
end type
type dw_cliente from datawindow within w_ingreso_nuevo_beneficiario
end type
end forward

global type w_ingreso_nuevo_beneficiario from window
integer width = 3031
integer height = 2356
boolean titlebar = true
string title = "Antecedentes Cliente a Transferir"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_contrato st_contrato
st_rechazado st_rechazado
st_3 st_3
dw_detalle_original dw_detalle_original
dw_cliente_original dw_cliente_original
st_cliente st_cliente
dw_print dw_print
cb_ordenar cb_ordenar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_grabar cb_grabar
st_2 st_2
st_1 st_1
cb_cerrar cb_cerrar
dw_detalle dw_detalle
dw_cliente dw_cliente
end type
global w_ingreso_nuevo_beneficiario w_ingreso_nuevo_beneficiario

type variables
String	is_base,is_serie,is_dv,is_opcion,is_tipo_sol
Long		il_rut,il_fila_detalle,il_correlativo,il_sw_cliente=0,il_sw_detalle=0
Date		idt_fecha_hoy
Double	il_numero
end variables

forward prototypes
public subroutine wf_limpiar_variable ()
end prototypes

public subroutine wf_limpiar_variable ();String	ls_dv,ls_nom,ls_ap_pat,ls_ap_mat,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,&
			ls_fono_p,ls_sexo,ls_dom_c,ls_fono_c,ls_est_civil
datetime	ld_fec_nac
Long		ll_total_renta,ll_grupo_f

setnull(ls_dv)			;setnull(ls_nom)		;setnull(ls_ap_pat)		;setnull(ls_ap_mat)
setnull(ls_dir_p)		;setnull(ls_pob)		;setnull(ls_sector)		;setnull(ls_comuna)
setnull(ls_ciudad)	;setnull(ls_fono_p)	;setnull(ls_sexo)			;setnull(ld_fec_nac)
setnull(ls_dom_c)		;setnull(ls_fono_c)	;setnull(ls_est_civil)	;setnull(ll_total_renta)
setnull(ll_grupo_f)
dw_cliente.setitem(1,'dv',ls_dv);dw_cliente.setitem(1,'nombres',ls_nom)
dw_cliente.setitem(1,'ap_paterno',ls_ap_pat);dw_cliente.setitem(1,'ap_materno',ls_ap_mat)
dw_cliente.setitem(1,'direccion_p',ls_dir_p);dw_cliente.setitem(1,'poblacion',ls_pob)
dw_cliente.setitem(1,'sector',ls_sector);dw_cliente.setitem(1,'comuna',ls_comuna)
dw_cliente.setitem(1,'ciudad',ls_ciudad);dw_cliente.setitem(1,'fono_p',ls_fono_p)
dw_cliente.setitem(1,'sexo',ls_sexo);dw_cliente.setitem(1,'fecha_nac',ld_fec_nac)
dw_cliente.setitem(1,'domicilio_c',ls_dom_c);dw_cliente.setitem(1,'fono_c',ls_fono_c)
dw_cliente.setitem(1,'estado_civil',ls_est_civil);dw_cliente.setitem(1,'fecha_ing',idt_fecha_hoy)
dw_cliente.setitem(1,'total_renta',ll_total_renta);dw_cliente.setitem(1,'grupo_f',ll_grupo_f)
dw_detalle.reset()
//if dw_detalle.update()=1 then
//	commit;
//else
//	rollback;
//end if
end subroutine

on w_ingreso_nuevo_beneficiario.create
this.st_contrato=create st_contrato
this.st_rechazado=create st_rechazado
this.st_3=create st_3
this.dw_detalle_original=create dw_detalle_original
this.dw_cliente_original=create dw_cliente_original
this.st_cliente=create st_cliente
this.dw_print=create dw_print
this.cb_ordenar=create cb_ordenar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_grabar=create cb_grabar
this.st_2=create st_2
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.dw_cliente=create dw_cliente
this.Control[]={this.st_contrato,&
this.st_rechazado,&
this.st_3,&
this.dw_detalle_original,&
this.dw_cliente_original,&
this.st_cliente,&
this.dw_print,&
this.cb_ordenar,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_grabar,&
this.st_2,&
this.st_1,&
this.cb_cerrar,&
this.dw_detalle,&
this.dw_cliente}
end on

on w_ingreso_nuevo_beneficiario.destroy
destroy(this.st_contrato)
destroy(this.st_rechazado)
destroy(this.st_3)
destroy(this.dw_detalle_original)
destroy(this.dw_cliente_original)
destroy(this.st_cliente)
destroy(this.dw_print)
destroy(this.cb_ordenar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_grabar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
destroy(this.dw_cliente)
end on

event open;long	ll_new,ll_rut_ben
string	ls_estado,ls_nom_ben,ls_ap_pat_ben,ls_ap_mat_ben,ls_dv_ben
setnull(ll_rut_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)

idt_fecha_hoy	= date(gdt_fec_sistema)
is_base 			= trim(substr(1,1,Message.StringParm))
is_serie			= trim(substr(1,2,Message.StringParm))
il_numero		= Double(trim(substr(1,3,Message.StringParm)))
il_rut				= long(trim(substr(1,4,Message.StringParm)))
il_correlativo	= long(trim(substr(1,5,Message.StringParm)))
is_dv				= trim(substr(1,6,Message.StringParm))
is_opcion			= trim(substr(1,7,Message.StringParm))
ls_estado		= trim(substr(1,8,Message.StringParm))
is_tipo_sol		= trim(substr(1,9,Message.StringParm))
if w_mantencion_fromulario_solicitudes.cb_grabar.enabled = true then
	cb_grabar.enabled				= true
else
	cb_grabar.enabled				= false
end if
if is_tipo_sol='19' then
	st_3.text	= 'Detalle de Herederos'
	st_2.text	= 'detalle de Herederos'
else
	st_3.text	= 'Detalle de Beneficiarios'
	st_2.text	= 'detalle de Beneficiarios'
end if
st_contrato.text= 'CONTRATO Nº:  '+is_base+' - '+is_serie+' - '+string(il_numero,"###,###,###,###,##0")
gf_centrar(w_ingreso_nuevo_beneficiario)
dw_print.settransobject(sqlca)
dw_cliente.settransobject(sqlca)
dw_cliente_original.settransobject(sqlca)
dw_detalle_original.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_cliente_original.retrieve(il_rut)
if dw_cliente.retrieve(il_rut,is_base,is_serie,il_numero,il_correlativo)=0 then
	ll_new	= dw_cliente.insertrow(0)
	dw_cliente.scrolltorow(ll_new)
	dw_cliente.setitem(1,'fecha_ing',idt_fecha_hoy)
	dw_cliente.setitem(1,'usuario',gs_user)
	dw_cliente.setitem(1,'base',is_base)
	dw_cliente.setitem(1,'serie',is_serie)
	dw_cliente.setitem(1,'numero',il_numero)
	dw_cliente.setitem(1,'correlativo',il_correlativo)
	dw_cliente.setitem(1,'rut_cliente_ori',il_rut)
end if
if dw_detalle_original.retrieve(il_rut,is_base,is_serie,il_numero,il_correlativo)=0 then
	CHOOSE CASE is_base
		CASE 'O'
			DECLARE x1 CURSOR FOR  
			SELECT 	"CO_PROP"."RUT",   "CO_PROP"."NOMBRE",   "CO_PROP"."A_PATERNO",   "CO_PROP"."A_MATERNO"  
			FROM 		"CO_PROP"  
			WHERE  ( "CO_PROP"."SERIE" = :is_serie ) AND  
					 ( "CO_PROP"."NRO_OFERTA" = :il_numero )   
			USING		sqlca ;
			open x1;
			DO WHILE sqlca.sqlcode=0 
				
				Fetch x1 into :ll_rut_ben,:ls_nom_ben,:ls_ap_pat_ben,:ls_ap_mat_ben;
				if not isnull(ls_nom_ben) and ls_nom_ben<>'' and not isnull(ls_ap_pat_ben) &
					and ls_ap_pat_ben<>'' then
					ll_new	= dw_detalle_original.insertrow(0)
					dw_detalle_original.scrolltorow(ll_new)
					dw_detalle_original.setitem(ll_new,'base',is_base)
					dw_detalle_original.setitem(ll_new,'serie',is_serie)
					dw_detalle_original.setitem(ll_new,'numero',il_numero)
					dw_detalle_original.setitem(ll_new,'rut_cliente',il_rut)
					ls_dv_ben	= f_valida_rut(string(il_rut))
					dw_detalle_original.setitem(ll_new,'sol_coprop_dv_cliente',ls_dv_ben)
					dw_detalle_original.setitem(ll_new,'sol_coprop_estado_a_n','A')
					
					dw_detalle_original.setitem(ll_new,'rut',ll_rut_ben)
					ls_dv_ben	= f_valida_rut(string(ll_rut_ben))
					dw_detalle_original.setitem(ll_new,'dv',ls_dv_ben)
					dw_detalle_original.setitem(ll_new,'nombres',ls_nom_ben)
					dw_detalle_original.setitem(ll_new,'ap_paterno',ls_ap_pat_ben)
					dw_detalle_original.setitem(ll_new,'ap_materno',ls_ap_mat_ben)
					setnull(ll_rut_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
				end if
			LOOP
			close x1;			
			
		CASE 'C'
			DECLARE x2 CURSOR FOR  
			SELECT 	"COPROP_ISACRUZ"."RUT",   "COPROP_ISACRUZ"."DV",   "COPROP_ISACRUZ"."NOMBRES",   "COPROP_ISACRUZ"."APATERNO",   "COPROP_ISACRUZ"."AMATERNO"  
			FROM 		"COPROP_ISACRUZ"  
			WHERE  ( "COPROP_ISACRUZ"."SERIE" = :is_serie ) AND  
					 ( "COPROP_ISACRUZ"."NUMERO" = :il_numero )    
			USING		sqlca ;
			open x2;
			DO WHILE sqlca.sqlcode=0 
				Fetch x2 into :ll_rut_ben,:ls_dv_ben,:ls_nom_ben,:ls_ap_pat_ben,:ls_ap_mat_ben;
				if not isnull(ls_nom_ben) and ls_nom_ben<>'' and not isnull(ls_ap_pat_ben) &
					and ls_ap_pat_ben<>'' then
					ll_new	= dw_detalle_original.insertrow(0)
					dw_detalle_original.scrolltorow(ll_new)
					dw_detalle_original.setitem(ll_new,'base',is_base)
					dw_detalle_original.setitem(ll_new,'serie',is_serie)
					dw_detalle_original.setitem(ll_new,'numero',il_numero)
					dw_detalle_original.setitem(ll_new,'rut_cliente',il_rut)
					dw_detalle_original.setitem(ll_new,'sol_coprop_estado_a_n','A')
					
					dw_detalle_original.setitem(ll_new,'rut',ll_rut_ben)
					dw_detalle_original.setitem(ll_new,'dv',ls_dv_ben)
					dw_detalle_original.setitem(ll_new,'nombres',ls_nom_ben)
					dw_detalle_original.setitem(ll_new,'ap_paterno',ls_ap_pat_ben)
					dw_detalle_original.setitem(ll_new,'ap_materno',ls_ap_mat_ben)
					setnull(ll_rut_ben);setnull(ls_nom_ben);setnull(ls_ap_pat_ben);setnull(ls_ap_mat_ben)
				end if
			LOOP
			close x2;			
	END CHOOSE
end if
dw_detalle.retrieve(il_rut,is_base,is_serie,il_numero,il_correlativo)
st_rechazado.visible	= false
if is_opcion='S' then
	if ls_estado='I' or ls_estado='Z' then
		dw_cliente.enabled	= false
		dw_detalle.enabled	= false
//		cb_grabar.enabled		= false
		if ls_estado='I' then st_rechazado.visible=true
//		cb_imprimir.enabled	= false
//		cb_exportar.enabled	= false
//		cb_ordenar.enabled	= false
	else
		dw_cliente.enabled	= true
		dw_detalle.enabled	= true
//		cb_grabar.enabled		= true
	end if
elseif is_opcion='N' then
	dw_cliente.enabled	= false
	dw_detalle.enabled	= false
//	cb_grabar.enabled		= false
end if
dw_cliente.setfocus()
gs_ventana					= 'w_ingreso_nuevo_beneficiario'
f_valida_objeto()
end event

type st_contrato from statictext within w_ingreso_nuevo_beneficiario
integer x = 1518
integer y = 16
integer width = 1353
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_rechazado from statictext within w_ingreso_nuevo_beneficiario
integer x = 1454
integer y = 840
integer width = 974
integer height = 104
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 79741120
string text = "RECHAZADO"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ingreso_nuevo_beneficiario
integer x = 59
integer y = 336
integer width = 955
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Beneficiarios Actual"
boolean focusrectangle = false
end type

type dw_detalle_original from datawindow within w_ingreso_nuevo_beneficiario
integer x = 46
integer y = 404
integer width = 2917
integer height = 432
integer taborder = 10
string title = "none"
string dataobject = "dw_ingreso_detalle_copropietario_origina"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

type dw_cliente_original from datawindow within w_ingreso_nuevo_beneficiario
integer x = 55
integer y = 96
integer width = 2912
integer height = 208
string title = "none"
string dataobject = "dw_antecedente_cliente_original"
boolean border = false
boolean livescroll = true
end type

type st_cliente from statictext within w_ingreso_nuevo_beneficiario
integer x = 59
integer y = 28
integer width = 800
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes Cliente Original"
boolean focusrectangle = false
end type

type dw_print from datawindow within w_ingreso_nuevo_beneficiario
boolean visible = false
integer x = 1125
integer y = 2176
integer width = 425
integer height = 464
string dataobject = "dw_print_transferencia"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ordenar from commandbutton within w_ingreso_nuevo_beneficiario
integer x = 1861
integer y = 2128
integer width = 297
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_exportar from commandbutton within w_ingreso_nuevo_beneficiario
integer x = 1559
integer y = 2128
integer width = 297
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_detalle
if dw_detalle.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_ingreso_nuevo_beneficiario
integer x = 818
integer y = 2128
integer width = 297
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if is_base<>'' and is_serie<>'' and il_numero>0 and il_correlativo>0 and il_rut>0 then
	dw_print.retrieve(is_base,is_serie,il_numero,il_rut,il_correlativo)
	f_Print( dw_print )
end if
end event

type cb_grabar from commandbutton within w_ingreso_nuevo_beneficiario
integer x = 46
integer y = 2128
integer width = 297
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_rut,ll_tot_reg,ll_indi,ll_sw=0,ll_rut_cli
string	ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_dv_cli

dw_cliente.accepttext()
dw_detalle.accepttext()
dw_detalle_original.accepttext()
ll_rut			= dw_cliente.getitemnumber(1,'rut')
ls_dv			= dw_cliente.getitemstring(1,'dv')
ls_nombre	= dw_cliente.getitemstring(1,'nombres')
ls_ap_pat	= dw_cliente.getitemstring(1,'ap_paterno')
ls_ap_mat	= dw_cliente.getitemstring(1,'ap_materno')
if isnull(ll_rut) or ll_rut<0 or isnull(ls_dv) or ls_dv='' or &
	isnull(ls_nombre) or ls_nombre='' or isnull(ls_ap_pat) or &
	ls_ap_pat='' or isnull(ls_ap_mat) or ls_ap_mat='' then
	messagebox("Advertencia","Falta ingresar datos a Cliente")
	dw_cliente.setfocus()
else
	ll_tot_reg	= dw_detalle_original.rowcount()
	if ll_tot_reg > 0 then
		ll_rut_cli	= dw_cliente.getitemnumber(1,'rut')
		ls_dv_cli	= dw_cliente_original.getitemstring(1,'cliente_dv')
		for ll_indi=1 to ll_tot_reg
			dw_detalle_original.setitem(ll_indi,'sol_coprop_rut_cliente_tran',ll_rut_cli)
			dw_detalle_original.setitem(ll_indi,'sol_coprop_dv_cliente',ls_dv_cli)
		next
	end if

	ll_tot_reg	= dw_detalle.rowcount()
	if ll_tot_reg > 0 then
		for ll_indi=1 to ll_tot_reg
			ll_rut		= dw_detalle.getitemnumber(ll_indi,'rut')
			ls_dv			= dw_detalle.getitemstring(ll_indi,'dv')
			ls_nombre	= dw_detalle.getitemstring(ll_indi,'nombres')
			ls_ap_pat	= dw_detalle.getitemstring(ll_indi,'ap_paterno')
			ls_ap_mat	= dw_detalle.getitemstring(ll_indi,'ap_materno')
			if isnull(ll_rut) or ll_rut<0 or isnull(ls_dv) or ls_dv='' or &
				isnull(ls_nombre) or ls_nombre='' or isnull(ls_ap_pat) or &
				ls_ap_pat='' or isnull(ls_ap_mat) or ls_ap_mat='' then
				ll_sw	= 1
				if is_tipo_sol='19' then
					messagebox("Advertencia","Heredero Nº "+string(ll_indi)+" falta ingresar dato")
				else
					messagebox("Advertencia","Beneficiario Nº "+string(ll_indi)+" falta ingresar dato")
				end if
				exit
				dw_detalle.setfocus()
				dw_detalle.scrolltorow(ll_indi)
				if isnull(ll_rut) or ll_rut<0 then dw_detalle.setcolumn('rut')
				if isnull(ls_dv) or ls_dv='' then dw_detalle.setcolumn('dv')
				if isnull(ls_nombre) or ls_nombre='' then dw_detalle.setcolumn('nombres')
				if isnull(ls_ap_pat) or ls_ap_pat='' then dw_detalle.setcolumn('ap_paterno')
				if isnull(ls_ap_mat) or ls_ap_mat='' then dw_detalle.setcolumn('ap_materno')
			end if
		next
	end if
	if ll_sw=0 then
		if dw_cliente.update()=1 then
			commit;
			if dw_detalle.update()=1 then
				commit;
				if dw_detalle_original.update()=1 then
					commit;
					il_sw_cliente	= 0
					il_sw_detalle	= 0
					messagebox("Grabar","Grabación Exitosa")
					close(w_ingreso_nuevo_beneficiario)
				else
					rollback;
				end if
			else
				rollback;
				if is_tipo_sol='19' then
					messagebox("Error Grabar","Error al Grabar Detalle de Herederos SQL: "+SQLCA.SQLErrText)
				else
					messagebox("Error Grabar","Error al Grabar Detalle de Beneficiarios SQL: "+SQLCA.SQLErrText)
				end if
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Cliente SQL: "+SQLCA.SQLErrText)
		end if
	end if
end if
end event

type st_2 from statictext within w_ingreso_nuevo_beneficiario
integer x = 59
integer y = 1568
integer width = 942
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de Beneficiarios"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ingreso_nuevo_beneficiario
integer x = 59
integer y = 868
integer width = 955
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes Cliente a Transferir"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_ingreso_nuevo_beneficiario
integer x = 2665
integer y = 2128
integer width = 297
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;long		ll_res
long		ll_rut,ll_tot_reg,ll_indi,ll_sw=0
string	ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat

if il_sw_cliente=1 or il_sw_detalle=1 then
	ll_res	= MessageBox("Advertencia", "Desea Grabar los Cambios",Exclamation!, YesNo!, 2)
	if ll_res = 1 then
		ll_rut		= dw_cliente.getitemnumber(1,'rut')
		ls_dv			= dw_cliente.getitemstring(1,'dv')
		ls_nombre	= dw_cliente.getitemstring(1,'nombres')
		ls_ap_pat	= dw_cliente.getitemstring(1,'ap_paterno')
		ls_ap_mat	= dw_cliente.getitemstring(1,'ap_materno')
		if isnull(ll_rut) or ll_rut<0 or isnull(ls_dv) or ls_dv='' or &
			isnull(ls_nombre) or ls_nombre='' or isnull(ls_ap_pat) or &
			ls_ap_pat='' or isnull(ls_ap_mat) or ls_ap_mat='' then
			messagebox("Advertencia","Falta ingresar datos a Cliente")
			dw_cliente.setfocus()
			ll_sw	= 1
		else
			ll_tot_reg	= dw_detalle.rowcount()
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					ll_rut		= dw_detalle.getitemnumber(ll_indi,'rut')
					ls_dv			= dw_detalle.getitemstring(ll_indi,'dv')
					ls_nombre	= dw_detalle.getitemstring(ll_indi,'nombres')
					ls_ap_pat	= dw_detalle.getitemstring(ll_indi,'ap_paterno')
					ls_ap_mat	= dw_detalle.getitemstring(ll_indi,'ap_materno')
					if isnull(ll_rut) or ll_rut<0 or isnull(ls_dv) or ls_dv='' or &
						isnull(ls_nombre) or ls_nombre='' or isnull(ls_ap_pat) or &
						ls_ap_pat='' or isnull(ls_ap_mat) or ls_ap_mat='' then
						ll_sw	= 1
						if is_tipo_sol='19' then
							messagebox("Advertencia","Heredero Nº "+string(ll_indi)+" no registra datos")
						else
							messagebox("Advertencia","Beneficiario Nº "+string(ll_indi)+" no registra datos")
						end if
						exit
						dw_detalle.setfocus()
						dw_detalle.scrolltorow(ll_indi)
						if isnull(ll_rut) or ll_rut<0 then dw_detalle.setcolumn('rut')
						if isnull(ls_dv) or ls_dv='' then dw_detalle.setcolumn('dv')
						if isnull(ls_nombre) or ls_nombre='' then dw_detalle.setcolumn('nombres')
						if isnull(ls_ap_pat) or ls_ap_pat='' then dw_detalle.setcolumn('ap_paterno')
						if isnull(ls_ap_mat) or ls_ap_mat='' then dw_detalle.setcolumn('ap_materno')
					end if
				next
			end if
			if ll_sw=0 then
				if dw_cliente.update()=1 then
					commit;
					if dw_detalle.update()=1 then
						commit;
					else
						rollback;
					end if
				else
					rollback;
				end if
			end if
		end if
	end if
end if
if ll_sw=0 then close(w_ingreso_nuevo_beneficiario)
end event

type dw_detalle from datawindow within w_ingreso_nuevo_beneficiario
integer x = 46
integer y = 1636
integer width = 2917
integer height = 452
integer taborder = 30
string title = "none"
string dataobject = "dw_ingreso_detalle_copropietario"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna,ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat
long		ll_new,ll_res,ll_tot_reg,ll_indi,ll_sw=0,ll_rut,ll_rut_cli
ll_rut_cli	= dw_cliente.getitemnumber(1,'rut')
if ll_rut_cli>=0 then
	ls_columna	= dwo.name
	CHOOSE CASE ls_columna
		CASE 't_nuevo'
			ll_tot_reg	= this.rowcount()
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					ll_rut		= this.getitemnumber(ll_indi,'rut')
					ls_dv			= this.getitemstring(ll_indi,'dv')
					ls_nombre	= this.getitemstring(ll_indi,'nombres')
					ls_ap_pat	= this.getitemstring(ll_indi,'ap_paterno')
					ls_ap_mat	= this.getitemstring(ll_indi,'ap_materno')
					if isnull(ll_rut) or ll_rut<0 or isnull(ls_dv) or ls_dv='' or &
						isnull(ls_nombre) or ls_nombre='' or isnull(ls_ap_pat) or &
						ls_ap_pat='' or isnull(ls_ap_mat) or ls_ap_mat='' then
						ll_sw	= 1
						if is_tipo_sol='19' then
							messagebox("Advertencia","Heredero Nº "+string(ll_indi)+" no registra datos")
						else
							messagebox("Advertencia","Beneficiario Nº "+string(ll_indi)+" no registra datos")
						end if
						exit
						this.scrolltorow(ll_indi)
					end if
				next
			end if
			if ll_sw=0 then
				ll_new	= this.insertrow(0)
				this.scrolltorow(ll_new)
				this.setitem(ll_new,'base',is_base)
				this.setitem(ll_new,'serie',is_serie)
				this.setitem(ll_new,'numero',il_numero)
				this.setitem(ll_new,'rut_cliente',il_rut)
				this.setitem(ll_new,'sol_coprop_dv_cliente',is_dv)
				this.setitem(ll_new,'sol_coprop_rut_cliente_tran',ll_rut_cli)
				this.setitem(ll_new,'sol_coprop_estado_a_n','N')
			end if
	
		CASE 't_eliminar'
			if this.rowcount() = 0 then
				if is_tipo_sol='19' then
					messagebox("Advertencia","No registra Heredero")
				else
					messagebox("Advertencia","No registra Beneficiario")
				end if
			else
				il_fila_detalle	= this.getrow()
				if il_fila_detalle>0 then
					ll_res	= MessageBox("Eliminar CoPropietario", "Está seguro de Eliminar CoPropietario Nº "+string(il_fila_detalle,"###,###,###,###,##0"), &
								  Exclamation!, YesNo!, 2)
					IF ll_res = 1 THEN
						this.deleterow(il_fila_detalle)
						if this.rowcount() > 0 then
							this.scrolltorow(1)
						else
							il_fila_detalle=0
						end if
					END IF
				else
					if is_tipo_sol='19' then
						messagebox("Advertencia","Debe seleccionar Heredero a Eliminar")
					else
						messagebox("Advertencia","Debe seleccionar Beneficiario a Eliminar")
					end if
				end if
			end if
	END CHOOSE
else
	messagebox("Advertencia","Debe ingresar Cliente a Transferir")
	dw_cliente.setfocus()
end if
end event

event rowfocuschanged;il_fila_detalle	= this.getrow()
end event

event itemchanged;Long		ll_rut,ll_fila
String		ls_val_dv,ls_dv,ls_columna,ls_nulo

ll_fila				= dw_detalle.getrow()
il_sw_detalle	= 1
this.accepttext()
Setnull(ls_nulo)
ls_columna		= dwo.name
if ls_columna='rut' or ls_columna='dv' then
	ls_dv			= dw_detalle.getitemstring(ll_fila,'dv')
	ll_rut			= dw_detalle.getitemnumber(ll_fila,'rut')
	if ll_rut > 0 and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','Rut Inválido',stopsign!)
			dw_detalle.setitem(ll_fila,'dv',ls_nulo)
		end if
	end if
end if
this.accepttext()
end event

event losefocus;this.accepttext()
end event

event itemfocuschanged;Long		ll_rut,ll_fila
String		ls_val_dv,ls_dv,ls_nulo

il_sw_detalle	= 1
ll_fila				= dw_detalle.getrow()
this.accepttext()
Setnull(ls_nulo)
ls_dv				= dw_detalle.getitemstring(ll_fila,'dv')
ll_rut				= dw_detalle.getitemnumber(ll_fila,'rut')
if ll_rut > 0 and not isnull(ls_dv) then
	if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
		dw_detalle.setitem(ll_fila,'dv',ls_nulo)
		dw_detalle.setitem(ll_fila,'nombres',ls_nulo)
		dw_detalle.setitem(ll_fila,'dv',ls_nulo)
		dw_detalle.setitem(ll_fila,'ap_paterno',ls_nulo)
		dw_detalle.setitem(ll_fila,'ap_materno',ls_nulo)
		dw_detalle.setfocus()
		dw_detalle.setcolumn('dv')
	end if
end if
this.accepttext()
end event

type dw_cliente from datawindow within w_ingreso_nuevo_beneficiario
integer x = 41
integer y = 932
integer width = 2930
integer height = 616
integer taborder = 20
string dataobject = "dw_ingreso_cliente_beneficiario"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_columna,ls_fecha,ls_nom,ls_ap_pat,ls_ap_mat
date		ld_fecha
long		ll_rut
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'p_fec_nac'
		ll_rut		= this.getitemnumber(1,'rut')
		ls_nom		= this.getitemstring(1,'nombres')
		ls_ap_pat	= this.getitemstring(1,'ap_paterno')
		ls_ap_mat	= this.getitemstring(1,'ap_materno')
		if not isnull(ll_rut) and not isnull(ls_nom) and ls_nom<>'' and &
			not isnull(ls_ap_pat) and ls_ap_pat<>'' and not isnull(ls_ap_mat) and &
			ls_ap_mat<>'' then
			
			ld_fecha		= date(dw_cliente.getitemdatetime(1,'fecha_nac'))
			if isnull(ld_fecha) or ld_fecha=date("00/00/0000") then 
				ld_fecha	= idt_fecha_hoy
			end if
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_cliente.setitem(1,'fecha_nac',ld_fecha)
				return
			end if
			ls_fecha	= string(ld_fecha)
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				dw_cliente.setitem(1,'fecha_nac',date(trim(Message.StringParm)))
			END IF
		end if
END CHOOSE

end event

event itemchanged;string	ls_columna,ls_nom,ls_ap_pat,ls_ap_mat,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad, &
			ls_fono_p,ls_sexo,ls_est_civil,ls_dom_c,ls_fono_c,ls_dv,ls_dv_aux,ls_nom_aux,&
			ls_ap_pat_aux,ls_ap_mat_aux,ls_val_dv
Datetime	ld_fec_nac,ld_fec_ing
Long		ll_total_renta,ll_grupo_f,ll_rut,ll_new

il_sw_cliente		= 1
ls_columna			= dwo.name
this.accepttext()
CHOOSE CASE ls_columna
	CASE 'rut','dv'
		ll_rut			= dw_cliente.getitemnumber(1,'rut')
		ls_dv			= dw_cliente.getitemstring(1,'dv')
		ls_val_dv		= ls_dv
		if ll_rut > 0 and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','Rut Inválido',stopsign!)
				dw_cliente.reset()
				ll_new	= dw_cliente.insertrow(0)
				dw_cliente.scrolltorow(ll_new)
				dw_cliente.setitem(ll_new,'fecha_ing',idt_fecha_hoy)
				dw_cliente.setitem(ll_new,'usuario',gs_user)
				dw_cliente.setitem(ll_new,'base',is_base)
				dw_cliente.setitem(ll_new,'serie',is_serie)
				dw_cliente.setitem(ll_new,'numero',il_numero)
				dw_cliente.setitem(ll_new,'correlativo',il_correlativo)
				dw_cliente.setitem(ll_new,'rut_cliente_ori',il_rut)
				dw_cliente.setitem(ll_new,'rut',ll_rut)
				dw_cliente.setfocus()
				dw_cliente.setcolumn('dv')
			else
				if (not isnull(ll_rut) or ll_rut>0 ) and (not isnull(ls_val_dv) or ls_val_dv<>'') then
					if il_rut	= ll_rut then
						messagebox("Advertencia","Rut del Cliente a Transferir no debe ser Igual al Cliente Original")
						dw_cliente.reset()
						ll_new	= dw_cliente.insertrow(0)
						dw_cliente.scrolltorow(ll_new)
						dw_cliente.setitem(ll_new,'fecha_ing',idt_fecha_hoy)
						dw_cliente.setitem(ll_new,'usuario',gs_user)
						dw_cliente.setitem(ll_new,'base',is_base)
						dw_cliente.setitem(ll_new,'serie',is_serie)
						dw_cliente.setitem(ll_new,'numero',il_numero)
						dw_cliente.setitem(ll_new,'correlativo',il_correlativo)
						dw_cliente.setitem(ll_new,'rut_cliente_ori',il_rut)
						dw_cliente.setitem(ll_new,'rut',ll_rut)
						dw_cliente.setfocus()
						dw_cliente.setcolumn('dv')
					else
						if ll_rut>0 then
							wf_limpiar_variable()
							SELECT	"CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."FECHA_INGR",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV"  
							INTO 		:ls_nom,   				 :ls_ap_pat,   				:ls_ap_mat,   				:ls_dir_p,   					:ls_pob,   					 :ls_sector,   			:ls_comuna,   			:ls_ciudad,   			 :ls_fono_p,   			:ls_sexo,   		 :ld_fec_nac,   				:ls_est_civil,   			 :ls_dom_c,   					 :ls_fono_c,   			:ld_fec_ing,   			 :ll_total_renta,   			:ll_grupo_f,   			:ls_dv  
							FROM 		"CLIENTE"  
							WHERE 	"CLIENTE"."RUT" = :ll_rut   
							Using		sqlca;
							if sqlca.sqlcode=0 then
								dw_cliente.setitem(1,'dv',ls_dv)
								dw_cliente.setitem(1,'nombres',ls_nom)
								dw_cliente.setitem(1,'ap_paterno',ls_ap_pat)
								dw_cliente.setitem(1,'ap_materno',ls_ap_mat)
								dw_cliente.setitem(1,'direccion_p',ls_dir_p)
								dw_cliente.setitem(1,'poblacion',ls_pob)
								dw_cliente.setitem(1,'sector',ls_sector)
								dw_cliente.setitem(1,'comuna',ls_comuna)
								dw_cliente.setitem(1,'ciudad',ls_ciudad)
								dw_cliente.setitem(1,'fono_p',ls_fono_p)
								dw_cliente.setitem(1,'sexo',ls_sexo)
								dw_cliente.setitem(1,'fecha_nac',ld_fec_nac)
								dw_cliente.setitem(1,'domicilio_c',ls_dom_c)
								dw_cliente.setitem(1,'fono_c',ls_fono_c)
								dw_cliente.setitem(1,'estado_civil',ls_est_civil)
								dw_cliente.setitem(1,'fecha_ing',idt_fecha_hoy)
								dw_cliente.setitem(1,'total_renta',ll_total_renta)
								dw_cliente.setitem(1,'grupo_f',ll_grupo_f)
							end if
						else
							setnull(ls_dv);setnull(ls_nom);setnull(ls_ap_pat);setnull(ls_ap_mat)
							setnull(ls_dir_p);setnull(ls_pob);setnull(ls_sector);setnull(ls_comuna)
							setnull(ls_ciudad);setnull(ls_fono_p);setnull(ls_sexo);setnull(ld_fec_nac)
							setnull(ls_dom_c);setnull(ls_fono_c);setnull(ls_est_civil);setnull(ll_total_renta)
							setnull(ll_grupo_f)
							dw_cliente.setitem(1,'dv',ls_dv);dw_cliente.setitem(1,'nombres',ls_nom)
							dw_cliente.setitem(1,'ap_paterno',ls_ap_pat);dw_cliente.setitem(1,'ap_materno',ls_ap_mat)
							dw_cliente.setitem(1,'direccion_p',ls_dir_p);dw_cliente.setitem(1,'poblacion',ls_pob)
							dw_cliente.setitem(1,'sector',ls_sector);dw_cliente.setitem(1,'comuna',ls_comuna)
							dw_cliente.setitem(1,'ciudad',ls_ciudad);dw_cliente.setitem(1,'fono_p',ls_fono_p)
							dw_cliente.setitem(1,'sexo',ls_sexo);dw_cliente.setitem(1,'fecha_nac',ld_fec_nac)
							dw_cliente.setitem(1,'domicilio_c',ls_dom_c);dw_cliente.setitem(1,'fono_c',ls_fono_c)
							dw_cliente.setitem(1,'estado_civil',ls_est_civil);dw_cliente.setitem(1,'fecha_ing',idt_fecha_hoy)
							dw_cliente.setitem(1,'total_renta',ll_total_renta);dw_cliente.setitem(1,'grupo_f',ll_grupo_f)
						end if
					end if
				end if
			end if
		end if
		
END CHOOSE
this.accepttext()
end event

