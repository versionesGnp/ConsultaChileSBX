forward
global type w_ingreso_beneficiario_seg_comple from window
end type
type dw_seguro from datawindow within w_ingreso_beneficiario_seg_comple
end type
type rb_uf from radiobutton within w_ingreso_beneficiario_seg_comple
end type
type rb_porce from radiobutton within w_ingreso_beneficiario_seg_comple
end type
type st_1 from statictext within w_ingreso_beneficiario_seg_comple
end type
type pb_2 from picturebutton within w_ingreso_beneficiario_seg_comple
end type
type pb_3 from picturebutton within w_ingreso_beneficiario_seg_comple
end type
type pb_4 from picturebutton within w_ingreso_beneficiario_seg_comple
end type
type pb_5 from picturebutton within w_ingreso_beneficiario_seg_comple
end type
type cb_grabar from commandbutton within w_ingreso_beneficiario_seg_comple
end type
type cb_eliminar from commandbutton within w_ingreso_beneficiario_seg_comple
end type
type cb_ingresar from commandbutton within w_ingreso_beneficiario_seg_comple
end type
type cb_cerrar from commandbutton within w_ingreso_beneficiario_seg_comple
end type
type gb_2 from groupbox within w_ingreso_beneficiario_seg_comple
end type
type st_no_reg from statictext within w_ingreso_beneficiario_seg_comple
end type
type dw_lista from datawindow within w_ingreso_beneficiario_seg_comple
end type
type ln_1 from line within w_ingreso_beneficiario_seg_comple
end type
type ln_2 from line within w_ingreso_beneficiario_seg_comple
end type
end forward

global type w_ingreso_beneficiario_seg_comple from window
integer width = 3872
integer height = 1372
boolean titlebar = true
string title = "Ingreso Beneficiarios Seguro Complementario"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_seguro dw_seguro
rb_uf rb_uf
rb_porce rb_porce
st_1 st_1
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
cb_grabar cb_grabar
cb_eliminar cb_eliminar
cb_ingresar cb_ingresar
cb_cerrar cb_cerrar
gb_2 gb_2
st_no_reg st_no_reg
dw_lista dw_lista
ln_1 ln_1
ln_2 ln_2
end type
global w_ingreso_beneficiario_seg_comple w_ingreso_beneficiario_seg_comple

type variables
String	is_base,is_serie,is_tipo_via,is_direccion,is_nro_part,is_depto_part,&
			is_block_part,is_comuna,is_ciudad,is_pob,is_sector,is_fono,is_validar
Long		il_cantidad,il_tipo_seguro,il_row_eli
Double	ild_factor,il_numero
Date		idt_fecha_hoy
end variables

event open;Long		ll_indi,ll_tot_reg,ll_rut,ll_tipo_seg, ll_new
String		ls_tipo_via,ls_direccion,ls_nro_part,ls_depto_part,ls_block_part,ls_comuna,ls_ciudad,ls_pob,&
			ls_sector,ls_dv,ls_cod_par,ls_nom,ls_ap_pat,ls_ap_mat
Datetime	ldt_fec_nac
			
gf_centrar(w_ingreso_beneficiario_seg_comple)
is_validar						= 'N'
idt_fecha_hoy					= date(gdt_fec_sistema)
rb_porce.checked				= true
is_base							= trim(substr(1,1,Message.StringParm))
is_serie							= trim(substr(1,2,Message.StringParm))
il_numero						= Double(substr(1,3,Message.StringParm))
il_cantidad						= long(substr(1,4,Message.StringParm))
ild_factor							= double(substr(1,5,Message.StringParm))
il_tipo_seguro					= long(substr(1,6,Message.StringParm))
if il_tipo_seguro=1 then
	dw_lista.dataobject		= 'dw_mant_benef_renta_deceso_1'
	st_1.visible					= false
	rb_porce.visible			= false
	rb_uf.visible					= false
elseif il_tipo_seguro=2 then
	dw_lista.dataobject		= 'dw_mantenedor_beneficiarios_renta_deceso'
	st_1.visible					= true
	rb_porce.visible			= true
	rb_uf.visible					= true
elseif il_tipo_seguro=3 then
	dw_lista.dataobject		= 'dw_mant_benef_seguro_desg'
	st_1.visible					= false
	rb_porce.visible			= false
	rb_uf.visible					= false
elseif il_tipo_seguro=5 or il_tipo_seguro=7 then
	dw_lista.dataobject		= 'dw_mantenedor_beneficiarios_asistencia'
	st_1.visible					= false
	rb_porce.visible			= false
	rb_uf.visible					= false
end if
dw_lista.settransobject(sqlca)
dw_lista.getchild('comuna_particular',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if
dw_lista.getchild('codigo_seguro_detalle',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.retrieve(il_tipo_seguro)
end if
dw_lista.object.t_titulo.text	= 'Ingreso Beneficiarios'
SELECT	"CLIENTE"."TIPO_VIA",	"CLIENTE"."DIRECCION_P",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR",	"CLIENTE"."COMUNA",	"CLIENTE"."CIUDAD",	"CLIENTE"."POBLACION",	"CLIENTE"."SECTOR",	"CLIENTE"."FONO_P"  
INTO 		:is_tipo_via,				:is_direccion,					:is_nro_part,							:is_depto_part,					:is_block_part,					:is_comuna,				:is_ciudad,				:is_pob,						:is_sector,				:is_fono  
FROM 		"CLIENTE"  
WHERE 	"CLIENTE"."RUT" = :gi_rut   
USING		sqlca;
ll_tot_reg						= dw_lista.retrieve(il_numero,is_base,is_serie,il_tipo_seguro)
if ll_tot_reg>0 then
	st_no_reg.visible			= false
	for ll_indi=1 to ll_tot_reg
		dw_lista.SetItem(ll_indi, "estado_rut",1)
		if il_tipo_seguro=2 then dw_lista.SetItem(ll_indi, "estado_asigna",1)
	next
	if (il_tipo_seguro=3 and isvalid(w_cuenta_corriente_oferta)) then
		cb_grabar.enabled		= false
		cb_ingresar.enabled	= false
		cb_eliminar.enabled	= false
		dw_lista.enabled		= false
		rb_porce.enabled		= false
		rb_uf.enabled			= false
	end if
else
	st_no_reg.visible			= true
	if il_tipo_seguro = 5 then
		DECLARE x1 CURSOR FOR  
		SELECT	"VALIDAR_BENEFICIARIOS"."RUT",   
					"VALIDAR_BENEFICIARIOS"."DV",   
					"VALIDAR_BENEFICIARIOS"."COD_PARENTESCO",   
					"VALIDAR_BENEFICIARIOS"."FECHA_NAC",   
					"VALIDAR_BENEFICIARIOS"."NOMBRE",   
					"VALIDAR_BENEFICIARIOS"."AP_PATERNO",   
					"VALIDAR_BENEFICIARIOS"."AP_MATERNO",   
					"VALIDAR_BENEFICIARIOS"."TIPO_SEGURO"
		FROM 		"VALIDAR_BENEFICIARIOS"  
		WHERE  ( "VALIDAR_BENEFICIARIOS"."BASE" = :is_base ) AND  
				 ( "VALIDAR_BENEFICIARIOS"."SERIE" = :is_serie ) AND  
				 ( "VALIDAR_BENEFICIARIOS"."NUMERO" = :il_numero )   AND
				 ( "VALIDAR_BENEFICIARIOS"."TIPO_SEGURO" = 1 OR "VALIDAR_BENEFICIARIOS"."TIPO_SEGURO" = 2  )
		ORDER BY "VALIDAR_BENEFICIARIOS"."ORDEN" ASC  
		USING		sqlca;
		open x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				fetch x1 into :ll_rut, :ls_dv, :ls_cod_par, :ldt_fec_nac, :ls_nom, :ls_ap_pat, :ls_ap_mat, :ll_tipo_seg;
				if ll_rut > 0 and not isnull(ll_rut) then
					ll_new		= dw_lista.insertrow(0)
					if rb_porce.checked=true then
						dw_lista.SetItem(ll_new,'estado_asigna',1)
					else
						dw_lista.SetItem(ll_new,'estado_asigna',0)
					end if
					dw_lista.SetItem(ll_new,'estado_rut',0)
					dw_lista.setitem(ll_new,'rut',ll_rut)
					dw_lista.setitem(ll_new,'dv',ls_dv)
					dw_lista.setitem(ll_new,'codigo_parentesco',ls_cod_par)
					dw_lista.setitem(ll_new,'fecha_nacimiento',ldt_fec_nac)
					dw_lista.setitem(ll_new,'nombres',ls_nom)
					dw_lista.setitem(ll_new,'ap_paterno',ls_ap_pat)
					dw_lista.setitem(ll_new,'ap_materno',ls_ap_mat)
					dw_lista.setitem(ll_new,'base',is_base)
					dw_lista.setitem(ll_new,'serie',is_serie)
					dw_lista.setitem(ll_new,'numero',il_numero)
					dw_lista.setitem(ll_new,'codigo_seguro',il_tipo_seguro)
					dw_lista.setitem(ll_new,'codigo_seguro_detalle',ll_tipo_seg)
					dw_lista.setitem(ll_new,'tipo_via',is_tipo_via)
					dw_lista.setitem(ll_new,'direccion_particular',is_direccion)
					dw_lista.setitem(ll_new,'numero_particular',is_nro_part)
					dw_lista.setitem(ll_new,'depto_particular',is_depto_part)
					dw_lista.setitem(ll_new,'block_particular',is_block_part)
					dw_lista.setitem(ll_new,'ciudad_particular',is_ciudad)
					idw_detalle2.retrieve(is_ciudad)
					dw_lista.setitem(ll_new,'comuna_particular',is_comuna)
					dw_lista.setitem(ll_new,'villa_poblacion',is_pob)
					dw_lista.setitem(ll_new,'fono_contacto',is_fono)
				end if
				setnull(ll_rut)
			LOOP
			dw_lista.accepttext()
			dw_lista.setfocus()
			dw_lista.scrolltorow(1)
			dw_lista.setcolumn('rut')
		end if
		close x1;
		ll_tot_reg						= dw_lista.rowcount()
		if ll_tot_reg>0 then
			st_no_reg.visible			= false
		else
			st_no_reg.visible			= true
		end if
	elseif il_tipo_seguro = 7 then
		DECLARE x2 CURSOR FOR  
		SELECT	"VALIDAR_BENEFICIARIOS"."RUT",   
					"VALIDAR_BENEFICIARIOS"."DV",   
					"VALIDAR_BENEFICIARIOS"."COD_PARENTESCO",   
					"VALIDAR_BENEFICIARIOS"."FECHA_NAC",   
					"VALIDAR_BENEFICIARIOS"."NOMBRE",   
					"VALIDAR_BENEFICIARIOS"."AP_PATERNO",   
					"VALIDAR_BENEFICIARIOS"."AP_MATERNO",   
					"VALIDAR_BENEFICIARIOS"."TIPO_SEGURO"
		FROM 		"VALIDAR_BENEFICIARIOS"  
		WHERE  ( "VALIDAR_BENEFICIARIOS"."BASE" = :is_base ) AND  
				 ( "VALIDAR_BENEFICIARIOS"."SERIE" = :is_serie ) AND  
				 ( "VALIDAR_BENEFICIARIOS"."NUMERO" = :il_numero )   AND
				 ( "VALIDAR_BENEFICIARIOS"."TIPO_SEGURO" = 7 )
		ORDER BY "VALIDAR_BENEFICIARIOS"."ORDEN" ASC  
		USING		sqlca;
		open x2;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				fetch x2 into :ll_rut, :ls_dv, :ls_cod_par, :ldt_fec_nac, :ls_nom, :ls_ap_pat, :ls_ap_mat, :ll_tipo_seg;
				if ll_rut > 0 and not isnull(ll_rut) then
					ll_new		= dw_lista.insertrow(0)
					if rb_porce.checked=true then
						dw_lista.SetItem(ll_new,'estado_asigna',1)
					else
						dw_lista.SetItem(ll_new,'estado_asigna',0)
					end if
					dw_lista.SetItem(ll_new,'estado_rut',0)
					dw_lista.setitem(ll_new,'rut',ll_rut)
					dw_lista.setitem(ll_new,'dv',ls_dv)
					dw_lista.setitem(ll_new,'codigo_parentesco',ls_cod_par)
					dw_lista.setitem(ll_new,'fecha_nacimiento',ldt_fec_nac)
					dw_lista.setitem(ll_new,'nombres',ls_nom)
					dw_lista.setitem(ll_new,'ap_paterno',ls_ap_pat)
					dw_lista.setitem(ll_new,'ap_materno',ls_ap_mat)
					dw_lista.setitem(ll_new,'base',is_base)
					dw_lista.setitem(ll_new,'serie',is_serie)
					dw_lista.setitem(ll_new,'numero',il_numero)
					dw_lista.setitem(ll_new,'codigo_seguro',il_tipo_seguro)
					dw_lista.setitem(ll_new,'codigo_seguro_detalle',ll_tipo_seg)
					dw_lista.setitem(ll_new,'tipo_via',is_tipo_via)
					dw_lista.setitem(ll_new,'direccion_particular',is_direccion)
					dw_lista.setitem(ll_new,'numero_particular',is_nro_part)
					dw_lista.setitem(ll_new,'depto_particular',is_depto_part)
					dw_lista.setitem(ll_new,'block_particular',is_block_part)
					dw_lista.setitem(ll_new,'ciudad_particular',is_ciudad)
					idw_detalle2.retrieve(is_ciudad)
					dw_lista.setitem(ll_new,'comuna_particular',is_comuna)
					dw_lista.setitem(ll_new,'villa_poblacion',is_pob)
					dw_lista.setitem(ll_new,'fono_contacto',is_fono)
				end if
				setnull(ll_rut)
			LOOP
			dw_lista.accepttext()
			dw_lista.setfocus()
			dw_lista.scrolltorow(1)
			dw_lista.setcolumn('rut')
		end if
		close x2;
		ll_tot_reg						= dw_lista.rowcount()
		if ll_tot_reg>0 then
			st_no_reg.visible			= false
		else
			st_no_reg.visible			= true
		end if
	end if
end if
dw_seguro.settransobject(sqlca)
dw_seguro.retrieve(is_base,is_serie,il_numero)
if gs_depto='O' or gs_depto='I' or gs_depto='N' or gs_depto='E' then
	cb_grabar.enabled		= true
	cb_ingresar.enabled	= true
	cb_eliminar.enabled	= true
	dw_lista.enabled		= true
	rb_porce.enabled		= true
	rb_uf.enabled			= true
else
	cb_grabar.enabled		= false
	cb_ingresar.enabled	= false
	cb_eliminar.enabled	= false
	dw_lista.enabled		= false
	rb_porce.enabled		= false
	rb_uf.enabled			= false
end if
end event

on w_ingreso_beneficiario_seg_comple.create
this.dw_seguro=create dw_seguro
this.rb_uf=create rb_uf
this.rb_porce=create rb_porce
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.cb_grabar=create cb_grabar
this.cb_eliminar=create cb_eliminar
this.cb_ingresar=create cb_ingresar
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.st_no_reg=create st_no_reg
this.dw_lista=create dw_lista
this.ln_1=create ln_1
this.ln_2=create ln_2
this.Control[]={this.dw_seguro,&
this.rb_uf,&
this.rb_porce,&
this.st_1,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.pb_5,&
this.cb_grabar,&
this.cb_eliminar,&
this.cb_ingresar,&
this.cb_cerrar,&
this.gb_2,&
this.st_no_reg,&
this.dw_lista,&
this.ln_1,&
this.ln_2}
end on

on w_ingreso_beneficiario_seg_comple.destroy
destroy(this.dw_seguro)
destroy(this.rb_uf)
destroy(this.rb_porce)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.cb_grabar)
destroy(this.cb_eliminar)
destroy(this.cb_ingresar)
destroy(this.cb_cerrar)
destroy(this.gb_2)
destroy(this.st_no_reg)
destroy(this.dw_lista)
destroy(this.ln_1)
destroy(this.ln_2)
end on

type dw_seguro from datawindow within w_ingreso_beneficiario_seg_comple
integer x = 2784
integer y = 56
integer width = 1019
integer height = 1024
integer taborder = 20
string title = "none"
string dataobject = "dw_listado_seguros_asoc_retrieve"
boolean border = false
boolean livescroll = true
end type

type rb_uf from radiobutton within w_ingreso_beneficiario_seg_comple
integer x = 2350
integer y = 44
integer width = 238
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " U.F."
end type

event clicked;Long	ll_tot_reg,ll_indi
dw_lista.accepttext()
ll_tot_reg		= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		dw_lista.SetItem(ll_indi, "estado_asigna",0)
	next
	dw_lista.accepttext()
	dw_lista.setfocus()
	dw_lista.setcolumn('nro_uf_designa')
end if

end event

type rb_porce from radiobutton within w_ingreso_beneficiario_seg_comple
integer x = 2103
integer y = 44
integer width = 215
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " %"
boolean checked = true
end type

event clicked;Long	ll_tot_reg,ll_indi
dw_lista.accepttext()
ll_tot_reg		= dw_lista.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		dw_lista.SetItem(ll_indi, "estado_asigna",1)
	next
	dw_lista.accepttext()
	dw_lista.setfocus()
	dw_lista.setcolumn('porce_uf_designa')
end if
end event

type st_1 from statictext within w_ingreso_beneficiario_seg_comple
integer x = 1349
integer y = 48
integer width = 690
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleccione Modo Repartir"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_ingreso_beneficiario_seg_comple
event ue_mousemove pbm_mousemove
integer x = 1550
integer y = 1148
integer width = 123
integer height = 88
integer taborder = 60
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

type pb_3 from picturebutton within w_ingreso_beneficiario_seg_comple
event ue_mousemove pbm_mousemove
integer x = 1678
integer y = 1148
integer width = 123
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila
ll_fila				= dw_lista.getrow() - 1
if ll_fila<1 then ll_fila=1
dw_lista.Scrolltorow(ll_fila)
end event

type pb_4 from picturebutton within w_ingreso_beneficiario_seg_comple
event ue_mousemove pbm_mousemove
integer x = 1806
integer y = 1148
integer width = 123
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_fila,ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
ll_fila		= dw_lista.getrow() + 1
if ll_fila>ll_tot_reg then ll_fila=ll_tot_reg
dw_lista.Scrolltorow(ll_fila)
end event

type pb_5 from picturebutton within w_ingreso_beneficiario_seg_comple
event ue_mousemove pbm_mousemove
integer x = 1934
integer y = 1148
integer width = 123
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;Long	ll_tot_reg
ll_tot_reg	= dw_lista.rowcount()
dw_lista.ScrollToRow(ll_tot_reg)
end event

type cb_grabar from commandbutton within w_ingreso_beneficiario_seg_comple
integer x = 46
integer y = 1144
integer width = 338
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_indi,ll_tot_reg,ll_rut,ll_cod_seg, ll_dia_hoy,ll_dia_nac,ll_mes_hoy,ll_mes_nac,ll_ano_hoy,ll_ano_nac,&
			ll_edad,ll_cod_seg_det,ll_fila
String	ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro_part,ls_ciudad,ls_comuna,ls_pasa='S',ls_sexo,&
			ls_cod_parentesco,ls_pasa_porce
Double	ldb_suma_uf,ldb_sumar_porce
Date		ld_fecha,ld_fecha_dia,ld_nulo

dw_lista.accepttext()
if dw_lista.dataobject='dw_mantenedor_beneficiarios_renta_deceso' then
	ll_tot_reg				= dw_lista.rowcount()
	if ll_tot_reg>0 then
		ldb_suma_uf		= round(dw_lista.getitemnumber(1,'sumar_uf'),0)
		ldb_sumar_porce	= round(dw_lista.getitemnumber(1,'sumar_porce'),0)
		if round(ild_factor,0) = ldb_suma_uf and round(ldb_sumar_porce,0)=100 then
			ls_pasa			= 'S'
		else
			ls_pasa			= 'N'
			messagebox("Advertencia","No Cuadra Cantidad de U.F., lo permitido es: "+string(ild_factor,"###,###,###,##0.0###"))
		end if
		if ls_pasa='S' then
			if ll_tot_reg<=il_cantidad then
				for ll_indi=1 to ll_tot_reg
					ll_rut			= dw_lista.getitemnumber(ll_indi,'rut')
					ls_dv			= dw_lista.getitemstring(ll_indi,'dv')
					ls_nombre	= dw_lista.getitemstring(ll_indi,'nombres')
					ls_ap_pat	= dw_lista.getitemstring(ll_indi,'ap_paterno')
					ls_ap_mat	= dw_lista.getitemstring(ll_indi,'ap_materno')
					ll_cod_seg	= dw_lista.getitemnumber(ll_indi,'codigo_seguro_detalle')
					ls_tipo_via	= dw_lista.getitemstring(ll_indi,'tipo_via')
					ls_direc		= dw_lista.getitemstring(ll_indi,'direccion_particular')
					ls_nro_part	= dw_lista.getitemstring(ll_indi,'numero_particular')
					ls_ciudad		= dw_lista.getitemstring(ll_indi,'ciudad_particular')
					ls_comuna	= dw_lista.getitemstring(ll_indi,'comuna_particular')
					ls_sexo		= dw_lista.getitemstring(ll_indi,'sexo')
					if isnull(ll_rut) or ll_rut=0 then
						messagebox("Advertencia","Debe Ingresar Rut Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('rut')
						exit
					elseif isnull(ls_dv) or ls_dv='' then
						messagebox("Advertencia","Debe Ingresar Digito Verificador Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('dv')
						exit
					elseif isnull(ls_nombre) or ls_nombre='' then
						messagebox("Advertencia","Debe Ingresar Nombre Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('nombres')
						exit
					elseif isnull(ls_ap_pat) or ls_ap_pat='' then
						messagebox("Advertencia","Debe Ingresar Apellido Paterno Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('ap_paterno')
						exit
					elseif isnull(ls_ap_mat) or ls_ap_mat='' then
						messagebox("Advertencia","Debe Ingresar Apellido Materno Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('ap_materno')
						exit
					elseif isnull(ll_cod_seg) or ll_cod_seg=0 then
						messagebox("Advertencia","Debe Ingresar Tipo Seguro del Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('codigo_seguro_detalle')
						exit
					elseif isnull(ls_tipo_via) or ls_tipo_via='' then
						messagebox("Advertencia","Debe Ingresar Tipo Via Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('tipo_via')
						exit
					elseif isnull(ls_direc) or ls_direc='' then
						messagebox("Advertencia","Debe Ingresar Dirección "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('direccion_particular')
						exit
					elseif isnull(ls_nro_part) or ls_nro_part='' then
						messagebox("Advertencia","Debe Ingresar Número Dirección "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('numero_particular')
						exit
					elseif isnull(ls_ciudad) or ls_ciudad='' then
						messagebox("Advertencia","Debe Ingresar Ciudad "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('ciudad_particular')
						exit
					elseif isnull(ls_comuna) or ls_comuna='' then
						messagebox("Advertencia","Debe Ingresar Comuna "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('comuna_particular')
						exit
					elseif isnull(ls_sexo) or ls_sexo='' then
						messagebox("Advertencia","Debe Ingresar Sexo "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('sexo')
						exit
					end if
				next
				if ls_pasa='S' then
					if dw_lista.update()=1 then
						commit;
						messagebox("Grabar","Grabación Exitosa")
						if isvalid(w_ingresar_oferta) then
							w_ingresar_oferta.dw_oferta_v.object.t_seguro.font.italic = 1
							cb_cerrar.triggerevent(clicked!)
						end if
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				end if
			else
				messagebox("Advertencia","No puede Ingresar más de "+string(il_cantidad)+' Beneficiarios')
			end if
		end if
	else
		if dw_lista.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_ingresar_oferta) then
				w_ingresar_oferta.dw_oferta_v.object.t_seguro.font.italic = 1
				cb_cerrar.triggerevent(clicked!)
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
elseif dw_lista.dataobject='dw_mant_benef_renta_deceso_1' or dw_lista.dataobject='dw_mant_benef_seguro_desg' or &
		dw_lista.dataobject='dw_mantenedor_beneficiarios_asistencia' then
	ll_tot_reg	= dw_lista.rowcount()
	if ll_tot_reg>0 then
		if dw_lista.dataobject='dw_mantenedor_beneficiarios_asistencia' then
			ldb_suma_uf					= round(dw_lista.getitemnumber(1,'sumar_uf'),0)
			ldb_sumar_porce				= round(dw_lista.getitemnumber(1,'sumar_porce'),0)
			ll_fila								= dw_lista.Find("codigo_seguro_detalle = 2", 1, dw_lista.RowCount())
			if ll_fila > 0 then
				if round(ild_factor,0) = ldb_suma_uf and round(ldb_sumar_porce,0)=100 then
					ls_pasa_porce			= 'S'
				else
					ls_pasa_porce			= 'N'
					messagebox("Advertencia","No Cuadra Cantidad de U.F., lo permitido es: "+string(ild_factor,"###,###,###,##0.0###"))
				end if
			else
				ls_pasa_porce				= 'S'
			end if
		else
			ls_pasa_porce					= 'S'
		end if
		if ls_pasa_porce='S' then
			ld_fecha_dia					= date(gdt_fec_sistema)
			Setnull(ld_nulo)
			if ll_tot_reg<=il_cantidad then
				for ll_indi=1 to ll_tot_reg
					ll_rut						= dw_lista.getitemnumber(ll_indi,'rut')
					ls_dv						= dw_lista.getitemstring(ll_indi,'dv')
					ls_nombre				= dw_lista.getitemstring(ll_indi,'nombres')
					ls_ap_pat				= dw_lista.getitemstring(ll_indi,'ap_paterno')
					ls_ap_mat				= dw_lista.getitemstring(ll_indi,'ap_materno')
					ll_cod_seg				= dw_lista.getitemnumber(ll_indi,'codigo_seguro_detalle')
					ls_tipo_via				= dw_lista.getitemstring(ll_indi,'tipo_via')
					ls_direc					= dw_lista.getitemstring(ll_indi,'direccion_particular')
					ls_nro_part				= dw_lista.getitemstring(ll_indi,'numero_particular')
					ls_ciudad					= dw_lista.getitemstring(ll_indi,'ciudad_particular')
					ls_comuna				= dw_lista.getitemstring(ll_indi,'comuna_particular')
					if il_tipo_seguro = 5 or il_tipo_seguro = 7 then
						ld_fecha				= date(dw_lista.getitemdatetime(ll_indi,'fecha_nacimiento'))
						ll_cod_seg_det		= dw_lista.getitemnumber(ll_indi,'codigo_seguro_detalle')
						if ll_cod_seg_det=1 then
							if isnull(ld_fecha) or string(ld_fecha,'dd/mm/yyyy')='00/00/0000' then
								messagebox("Advertencia","Fecha Inválida")
								dw_lista.setfocus()
								dw_lista.scrolltorow(ll_indi)
								dw_lista.setcolumn('fecha_nacimiento')
								ls_pasa				= 'N'
								exit
							else
								//ls_cod_parentesco	= dw_lista.getitemstring(ll_indi,'codigo_parentesco')
								ll_dia_hoy			= day(ld_fecha_dia)
								ll_dia_nac			= day(ld_fecha)
								ll_mes_hoy			= month(ld_fecha_dia)
								ll_mes_nac			= month(ld_fecha)
								ll_ano_hoy			= year(ld_fecha_dia)
								ll_ano_nac			= year(ld_fecha)
								ll_edad				= ll_ano_hoy - ll_ano_nac
								if ll_mes_nac > ll_mes_hoy  then
									ll_edad			= ll_edad - 1
								elseif ll_mes_hoy = ll_mes_nac then
									if ll_dia_hoy > ll_dia_nac then
										ll_edad		= ll_edad - 1
									end if
								end if
								if  ls_cod_parentesco='4' and (ll_edad < 18 or ll_edad > 75) then
									messagebox("Advertencia","Edad de Conyuge debe ser Mayor 18 y Menor 75 años")
									ls_pasa			= 'N'
									dw_lista.setfocus()
									dw_lista.scrolltorow(ll_indi)
									dw_lista.setcolumn('fecha_nacimiento')
									exit
								elseif ls_cod_parentesco='3' and ll_edad > 24 then
									messagebox("Advertencia","Edad de Hijo(a) No debe ser Mayor a 24 años")
									dw_lista.setfocus()
									dw_lista.scrolltorow(ll_indi)
									dw_lista.setcolumn('fecha_nacimiento')
									ls_pasa	= 'N'
									exit
								end if
							end if
						end if
					end if
					if isnull(ll_rut) or ll_rut=0 then
						messagebox("Advertencia","Debe Ingresar Rut Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('rut')
						exit
					elseif isnull(ls_dv) or ls_dv='' then
						messagebox("Advertencia","Debe Ingresar Digito Verificador Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('dv')
						exit
					elseif isnull(ls_nombre) or ls_nombre='' then
						messagebox("Advertencia","Debe Ingresar Nombre Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('nombres')
						exit
					elseif isnull(ls_ap_pat) or ls_ap_pat='' then
						messagebox("Advertencia","Debe Ingresar Apellido Paterno Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('ap_paterno')
						exit
					elseif isnull(ls_ap_mat) or ls_ap_mat='' then
						messagebox("Advertencia","Debe Ingresar Apellido Materno Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('ap_materno')
						exit
					elseif isnull(ll_cod_seg) or ll_cod_seg=0 then
						messagebox("Advertencia","Debe Ingresar Tipo Seguro del Beneficiario Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('codigo_seguro_detalle')
						exit
					elseif isnull(ls_tipo_via) or ls_tipo_via='' then
						messagebox("Advertencia","Debe Ingresar Tipo Via Fila Nº "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('tipo_via')
						exit
					elseif isnull(ls_direc) or ls_direc='' then
						messagebox("Advertencia","Debe Ingresar Dirección "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('direccion_particular')
						exit
					elseif isnull(ls_nro_part) or ls_nro_part='' then
						messagebox("Advertencia","Debe Ingresar Número Dirección "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('numero_particular')
						exit
					elseif isnull(ls_ciudad) or ls_ciudad='' then
						messagebox("Advertencia","Debe Ingresar Ciudad "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('ciudad_particular')
						exit
					elseif isnull(ls_comuna) or ls_comuna='' then
						messagebox("Advertencia","Debe Ingresar Comuna "+string(ll_indi))
						ls_pasa	= 'N'
						dw_lista.setfocus()
						dw_lista.scrolltorow(ll_indi)
						dw_lista.setcolumn('comuna_particular')
						exit
					end if
				next
				if ls_pasa='S' then
					if dw_lista.update()=1 then
						commit;
						messagebox("Grabar","Grabación Exitosa")
						if isvalid(w_ingresar_oferta) then
							w_ingresar_oferta.dw_oferta_v.object.t_seguro.font.italic = 1
							cb_cerrar.triggerevent(clicked!)
						end if
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				end if
			else
				messagebox("Advertencia","No puede Ingresar más de "+string(il_cantidad)+' Beneficiarios')
			end if
		end if
	else
		if dw_lista.update()=1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			if isvalid(w_ingresar_oferta) then
				w_ingresar_oferta.dw_oferta_v.object.t_seguro.font.italic = 1
				cb_cerrar.triggerevent(clicked!)
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_eliminar from commandbutton within w_ingreso_beneficiario_seg_comple
integer x = 951
integer y = 1144
integer width = 338
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Eliminar"
end type

event clicked;Long		ll_resp,ll_rut
Double	ll_numero
String		ls_nombre,ls_ap_pat,ls_ap_mat,ls_nom_comp,ls_base,ls_serie

dw_lista.accepttext()
if il_row_eli > 0 and dw_lista.rowcount()>0 then
	ls_nombre		= dw_lista.getitemstring(il_row_eli,'nombres')
	ls_ap_pat		= dw_lista.getitemstring(il_row_eli,'ap_paterno')
	ls_ap_mat		= dw_lista.getitemstring(il_row_eli,'ap_materno')
	ll_rut				= dw_lista.getitemnumber(il_row_eli,'rut')
	ls_base			= dw_lista.getitemstring(il_row_eli,'base')
	ls_serie			= dw_lista.getitemstring(il_row_eli,'serie')
	ll_numero		= dw_lista.getitemnumber(il_row_eli,'numero')
	ls_nom_comp	= ls_nombre+' '+ls_ap_pat+' '+ls_ap_mat
	ll_resp			= MessageBox("Eliminar", "Está Seguro Eliminar Beneficiario Nº "+string(il_row_eli)+ ' ' +ls_nom_comp, Exclamation!, YesNo!, 2)
	IF ll_resp = 1 or isnull(ls_nom_comp) THEN
		dw_lista.deleterow(il_row_eli)
		dw_lista.accepttext()
		if dw_lista.update() = 1 then
			commit;
			DELETE FROM	"VALIDAR_BENEFICIARIOS"  
			WHERE 		  ( "VALIDAR_BENEFICIARIOS"."RUT" = :ll_rut ) AND  
							  ( "VALIDAR_BENEFICIARIOS"."TIPO_SEGURO" = :il_tipo_seguro ) AND  
							  ( "VALIDAR_BENEFICIARIOS"."BASE" = :ls_base ) AND  
							  ( "VALIDAR_BENEFICIARIOS"."SERIE" = :ls_serie ) AND  
							  ( "VALIDAR_BENEFICIARIOS"."NUMERO" = :ll_numero )   ;

			messagebox("Eliminar","Eliminación Exitosa")
		else
			rollback;
			messagebox("Error Eliminar","Error al Eliminar SQL: "+sqlca.sqlerrtext)
		end if
	END IF
end if
if dw_lista.rowcount()>0 then 
	st_no_reg.visible	= false
else
	st_no_reg.visible	= true
end if
end event

type cb_ingresar from commandbutton within w_ingreso_beneficiario_seg_comple
integer x = 603
integer y = 1144
integer width = 338
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ingresar"
end type

event clicked;long		ll_new,ll_indi,ll_tot_reg,ll_rut,ll_cod_seg,ll_dia_hoy,ll_dia_nac,ll_mes_hoy,ll_mes_nac,&
			ll_ano_hoy,ll_ano_nac,ll_edad,ll_cod_seg_det
String	ls_dv,ls_nombre,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_nro_part,&
			ls_ciudad,ls_comuna,ls_pasa='S',ls_cod_parentesco
Date		ld_fecha,ld_fecha_dia

dw_lista.accepttext()
ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg < il_cantidad then
	ld_fecha_dia	= date(gdt_fec_sistema)
	for ll_indi=1 to ll_tot_reg
		ll_rut		= dw_lista.getitemnumber(ll_indi,'rut')
		ls_dv			= dw_lista.getitemstring(ll_indi,'dv')
		ls_nombre	= dw_lista.getitemstring(ll_indi,'nombres')
		ls_ap_pat	= dw_lista.getitemstring(ll_indi,'ap_paterno')
		ls_ap_mat	= dw_lista.getitemstring(ll_indi,'ap_materno')
		ll_cod_seg	= dw_lista.getitemnumber(ll_indi,'codigo_seguro_detalle')
		ls_tipo_via	= dw_lista.getitemstring(ll_indi,'tipo_via')
		ls_direc		= dw_lista.getitemstring(ll_indi,'direccion_particular')
		ls_nro_part	= dw_lista.getitemstring(ll_indi,'numero_particular')
		ls_ciudad	= dw_lista.getitemstring(ll_indi,'ciudad_particular')
		ls_comuna	= dw_lista.getitemstring(ll_indi,'comuna_particular')
		if il_tipo_seguro = 5 or il_tipo_seguro = 7 then
			ld_fecha				= date(dw_lista.getitemdatetime(ll_indi,'fecha_nacimiento'))
			ls_cod_parentesco	= dw_lista.getitemstring(ll_indi,'codigo_parentesco')
			ll_cod_seg_det		= dw_lista.getitemnumber(ll_indi,'codigo_seguro_detalle')
			if ll_cod_seg_det=1 then
				ll_dia_hoy			= day(ld_fecha_dia)
				ll_dia_nac			= day(ld_fecha)
				ll_mes_hoy			= month(ld_fecha_dia)
				ll_mes_nac			= month(ld_fecha)
				ll_ano_hoy			= year(ld_fecha_dia)
				ll_ano_nac			= year(ld_fecha)
				ll_edad				= ll_ano_hoy - ll_ano_nac
				if ll_mes_nac > ll_mes_hoy  then
					ll_edad			= ll_edad - 1
				elseif ll_mes_hoy = ll_mes_nac then
					if ll_dia_hoy > ll_dia_nac then
						ll_edad		= ll_edad - 1
					end if
				end if
				if ls_cod_parentesco='4' and (ll_edad < 18 or ll_edad > 75) then 
					messagebox("Advertencia","Edad de Conyuge debe ser Mayor 18 y Menor 75 años")
					ls_pasa	= 'N'
					dw_lista.setfocus()
					dw_lista.scrolltorow(ll_indi)
					dw_lista.setcolumn('fecha_nacimiento')
					exit
				elseif ls_cod_parentesco='3' and ll_edad > 24 then
					messagebox("Advertencia","Edad de Hijo(a) No debe ser Mayor a 24 años")
					dw_lista.setfocus()
					dw_lista.scrolltorow(ll_indi)
					dw_lista.setcolumn('fecha_nacimiento')
					ls_pasa	= 'N'
					exit
				end if
			end if
		end if
		if isnull(ll_rut) or ll_rut=0 then
			messagebox("Advertencia","Debe Ingresar Rut Beneficiario Fila Nº "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('rut')
			exit
		elseif isnull(ls_dv) or ls_dv='' then
			messagebox("Advertencia","Debe Ingresar Digito Verificador Beneficiario Fila Nº "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('dv')
			exit
		elseif isnull(ls_nombre) or ls_nombre='' then
			messagebox("Advertencia","Debe Ingresar Nombre Beneficiario Fila Nº "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('nombres')
			exit
		elseif isnull(ls_ap_pat) or ls_ap_pat='' then
			messagebox("Advertencia","Debe Ingresar Apellido Paterno Beneficiario Fila Nº "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('ap_paterno')
			exit
		elseif isnull(ls_ap_mat) or ls_ap_mat='' then
			messagebox("Advertencia","Debe Ingresar Apellido Materno Beneficiario Fila Nº "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('ap_materno')
			exit
		elseif isnull(ll_cod_seg) or ll_cod_seg=0 then
			messagebox("Advertencia","Debe Ingresar Tipo Seguro del Beneficiario Fila Nº "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('codigo_seguro_detalle')
			exit
		elseif isnull(ls_tipo_via) or ls_tipo_via='' then
			messagebox("Advertencia","Debe Ingresar Tipo Via Fila Nº "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('tipo_via')
			exit
		elseif isnull(ls_direc) or ls_direc='' then
			messagebox("Advertencia","Debe Ingresar Dirección "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('direccion_particular')
			exit
		elseif isnull(ls_nro_part) or ls_nro_part='' then
			messagebox("Advertencia","Debe Ingresar Número Dirección "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('numero_particular')
			exit
		elseif isnull(ls_ciudad) or ls_ciudad='' then
			messagebox("Advertencia","Debe Ingresar Ciudad "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('ciudad_particular')
			exit
		elseif isnull(ls_comuna) or ls_comuna='' then
			messagebox("Advertencia","Debe Ingresar Comuna "+string(ll_indi))
			ls_pasa	= 'N'
			dw_lista.setfocus()
			dw_lista.scrolltorow(ll_indi)
			dw_lista.setcolumn('comuna_particular')
			exit
		end if
	next
	if ls_pasa='S' then
		ll_new	= dw_lista.insertrow(0)
		dw_lista.scrolltorow(ll_new)
		if il_tipo_seguro=2 or il_tipo_seguro=5 then
			if rb_porce.checked=true then
				dw_lista.SetItem(ll_new,'estado_asigna',1)
			else
				dw_lista.SetItem(ll_new,'estado_asigna',0)
			end if
		end if
		if il_tipo_seguro=3 then
			dw_lista.SetItem(ll_new,'dps',1)
			dw_lista.SetItem(ll_new,'codigo_seguro_detalle',1)
		end if
		dw_lista.SetItem(ll_new,'estado_rut',0)
		dw_lista.setitem(ll_new,'base',is_base)
		dw_lista.setitem(ll_new,'serie',is_serie)
		dw_lista.setitem(ll_new,'numero',il_numero)
		dw_lista.setitem(ll_new,'codigo_seguro',il_tipo_seguro)
		dw_lista.setitem(ll_new,'tipo_via',is_tipo_via)
		dw_lista.setitem(ll_new,'direccion_particular',is_direccion)
		dw_lista.setitem(ll_new,'numero_particular',is_nro_part)
		dw_lista.setitem(ll_new,'depto_particular',is_depto_part)
		dw_lista.setitem(ll_new,'block_particular',is_block_part)
		dw_lista.setitem(ll_new,'ciudad_particular',is_ciudad)
		idw_detalle2.retrieve(is_ciudad)
		dw_lista.setitem(ll_new,'comuna_particular',is_comuna)
		dw_lista.setitem(ll_new,'villa_poblacion',is_pob)
		dw_lista.setitem(ll_new,'fono_contacto',is_fono)
		dw_lista.setfocus()
		dw_lista.setcolumn('rut')
	end if
else
	messagebox("Advertencia","No puede Ingresar más de "+string(il_cantidad)+' Beneficiarios')
end if
if dw_lista.rowcount()>0 then 
	st_no_reg.visible	= false
else
	st_no_reg.visible	= true
end if
end event

type cb_cerrar from commandbutton within w_ingreso_beneficiario_seg_comple
integer x = 3465
integer y = 1144
integer width = 338
integer height = 96
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_beneficiario_seg_comple)
end event

type gb_2 from groupbox within w_ingreso_beneficiario_seg_comple
event ue_mousemove pbm_mousemove
integer x = 1522
integer y = 1100
integer width = 562
integer height = 156
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217750
long backcolor = 67108864
end type

type st_no_reg from statictext within w_ingreso_beneficiario_seg_comple
integer x = 41
integer y = 304
integer width = 2674
integer height = 608
integer textsize = -48
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
string text = "No Registra Beneficiario"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_ingreso_beneficiario_seg_comple
integer x = 41
integer y = 36
integer width = 2674
integer height = 1044
integer taborder = 10
string title = "none"
string dataobject = "dw_mantenedor_beneficiarios_asistencia"
boolean border = false
end type

event itemchanged;String	ls_dv,ls_columna,ls_ciudad, ls_cod_parentesco
Long		ll_rut,ll_tot_reg,ll_indi,ll_sum=0,ll_dia_hoy,ll_dia_nac,&
			ll_mes_hoy,ll_mes_nac,ll_ano_hoy,ll_ano_nac,ll_edad,ll_cod_seg_det
Double	ldb_valor,ldb_resultado,ldb_porce_100,ldb_porce_sum
Date		ld_fecha,ld_nulo,ld_fecha_dia

dw_lista.accepttext()
if row>0 then
	is_validar						= 'S'
	il_row_eli						= row
	ls_columna						= dwo.name
	if ls_columna='rut' then
		ll_rut							= dw_lista.getitemnumber(row,'rut')
		ls_dv							= dw_lista.getitemstring(row,'dv')
		if ll_rut>0 and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es valido',stopsign!)
				cb_grabar.enabled		= false
				dw_lista.SetItem(row, "estado_rut",0)
				dw_lista.setfocus()
				dw_lista.setcolumn('dv')
			else
				cb_grabar.enabled		= true
				dw_lista.SetItem(row, "estado_rut",1)
				dw_lista.setcolumn('nombres')
			end if
		end if
	elseif ls_columna='dv' then
		ll_rut							= dw_lista.getitemnumber(row,'rut')
		ls_dv							= dw_lista.getitemstring(row,'dv')
		if ll_rut>0 and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es valido',stopsign!)
				cb_grabar.enabled		= false
				dw_lista.SetItem(row, "estado_rut",0)
				dw_lista.setfocus()
				dw_lista.setcolumn('dv')
			else
				cb_grabar.enabled		= true
				dw_lista.SetItem(row, "estado_rut",1)
				dw_lista.setcolumn('nombres')
			end if
		end if
	elseif ls_columna='ciudad_particular' then
		ls_ciudad					= dw_lista.getitemstring(row,'ciudad_particular')
		if not isnull(ls_ciudad) and ls_ciudad<>'' then
			idw_detalle2.retrieve(ls_ciudad)
		end if
		if ls_ciudad='999' then
			dw_lista.setitem(row,'comuna_particular','999')
		end if
		if ls_ciudad='0' then
			dw_lista.setitem(row,'comuna_particular','0')
		end if
	elseif ls_columna='porce_uf_designa' then
		ldb_valor		= dw_lista.getitemnumber(row,'porce_uf_designa')
		ldb_porce_100	= dw_lista.getitemnumber(1,'sumar_porce')
		if ldb_porce_100 > 100 then
			messagebox("Advertencia","Porcentaje Invalido, no debe superar el 100%")
			dw_lista.setitem(row,'nro_uf_designa',0)
		else
			ldb_resultado	= (ldb_valor * ild_factor) / 100
			dw_lista.setitem(row,'nro_uf_designa',ldb_resultado)
		end if
	elseif ls_columna='nro_uf_designa' then
		ldb_valor		= dw_lista.getitemnumber(row,'nro_uf_designa')
		ldb_porce_sum	= dw_lista.getitemnumber(1,'sumar_uf')
		if ldb_porce_sum > ild_factor then
			messagebox("Advertencia","Cantidad Invalido, no debe superar las "+string(ild_factor,"###,###,##0.0###")+" U.F. definidas")
			dw_lista.setitem(row,'porce_uf_designa',0)
		else
			ldb_resultado	= (ldb_valor / ild_factor) * 100
			dw_lista.setitem(row,'porce_uf_designa',ldb_resultado)
		end if
	elseif ls_columna='fecha_nacimiento' and il_tipo_seguro=5 then
		if isvalid(w_ingresar_oferta) then
			ld_fecha_dia		= date(w_ingresar_oferta.dw_oferta_v.getitemdatetime(1,'fecha'))
		else
			ld_fecha_dia		= date(gdt_fec_sistema)
		end if
		if isnull(ld_fecha_dia) then ld_fecha_dia=date(gdt_fec_sistema)
		ld_fecha				= date(dw_lista.getitemdatetime(row,'fecha_nacimiento'))
		ls_cod_parentesco	= dw_lista.getitemstring(row,'codigo_parentesco')
		ll_cod_seg_det		= dw_lista.getitemnumber(row,'codigo_seguro_detalle')
		if ll_cod_seg_det=1 then
			ll_dia_hoy			= day(ld_fecha_dia)
			ll_dia_nac			= day(ld_fecha)
			ll_mes_hoy			= month(ld_fecha_dia)
			ll_mes_nac			= month(ld_fecha)
			ll_ano_hoy			= year(ld_fecha_dia)
			ll_ano_nac			= year(ld_fecha)
			ll_edad				= ll_ano_hoy - ll_ano_nac
			if ll_mes_nac > ll_mes_hoy  then
				ll_edad			= ll_edad - 1
			elseif ll_mes_hoy = ll_mes_nac then
				if ll_dia_hoy > ll_dia_nac then
					ll_edad		= ll_edad - 1
				end if
			end if
			if ls_cod_parentesco='4' and (ll_edad < 18 or ll_edad > 75) then 
				messagebox("Advertencia","Edad de Conyuge debe ser Mayor 18 y Menor 75 años")
				dw_lista.setitem(row,'fecha_nacimiento',ld_nulo)
			elseif ls_cod_parentesco='3' and ll_edad > 24 then
				messagebox("Advertencia","Edad de Hijo(a) No debe ser Mayor a 24 años")
				dw_lista.setitem(row,'fecha_nacimiento',ld_nulo)
			end if
		end if
	end if
end if
dw_lista.accepttext()
end event

event clicked;String	ls_columna,ls_fecha, ls_cod_parentesco
Long		ll_estado,ll_dia_hoy,ll_dia_nac,ll_mes_hoy,ll_mes_nac,ll_ano_hoy,ll_cod_seg_det,&
			ll_ano_nac,ll_edad
Date		ld_fecha, ld_fecha_dia, ld_nulo

dw_lista.accepttext()
SetNull(ld_nulo)
if row>0 then il_row_eli = row
ls_columna							= dwo.name
if ls_columna='p_1' then
	ll_estado							= dw_lista.getitemnumber(row,'estado_rut')
	ls_cod_parentesco				= dw_lista.getitemstring(row,'codigo_parentesco')
//	ld_fecha_dia					= date(gdt_fec_sistema)
	if isvalid(w_ingresar_oferta) then
		ld_fecha_dia				= date(w_ingresar_oferta.dw_oferta_v.getitemdatetime(1,'fecha'))
	else
		ld_fecha_dia				= date(gdt_fec_sistema)
	end if
	if isnull(ld_fecha_dia) then ld_fecha_dia=date(gdt_fec_sistema)
	if ll_estado<>0 then
		ls_fecha						= string(date(dw_lista.getitemdatetime(row,'fecha_nacimiento')))
		if isnull(ls_fecha) then ls_fecha = string(idt_fecha_hoy,"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_lista.setitem(row,'fecha_nacimiento',datetime(string(idt_fecha_hoy,gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha					= trim(Message.StringParm)
			if il_tipo_seguro=5 then
				ld_fecha				= date(ls_fecha)
				ll_cod_seg_det		= dw_lista.getitemnumber(row,'codigo_seguro_detalle')
				if ll_cod_seg_det=1 then
					ll_dia_hoy		= day(ld_fecha_dia)
					ll_dia_nac		= day(ld_fecha)
					ll_mes_hoy		= month(ld_fecha_dia)
					ll_mes_nac		= month(ld_fecha)
					ll_ano_hoy		= year(ld_fecha_dia)
					ll_ano_nac		= year(ld_fecha)
					ll_edad			= ll_ano_hoy - ll_ano_nac
					if ll_mes_nac > ll_mes_hoy  then
						ll_edad		= ll_edad - 1
					elseif ll_mes_hoy = ll_mes_nac then
						if ll_dia_hoy > ll_dia_nac then
							ll_edad	= ll_edad - 1
						end if
					end if
					if ls_cod_parentesco='4' and (ll_edad < 18 or ll_edad > 75) then  
						messagebox("Advertencia","Edad de Conyuge debe ser Mayor 18 y Menor 75 años")
						dw_lista.setitem(row,'fecha_nacimiento',ld_nulo)
					elseif ls_cod_parentesco='3' and ll_edad > 24 then
						messagebox("Advertencia","Edad de Hijo(a) No debe ser Mayor a 24 años")
						dw_lista.setitem(row,'fecha_nacimiento',ld_nulo)
					else
						dw_lista.setitem(row,'fecha_nacimiento',date(ls_fecha))
					end if
				end if
			else
				dw_lista.setitem(row,'fecha_nacimiento',date(ls_fecha))
			end if
		END IF
		dw_lista.setfocus()
		dw_lista.setcolumn('fecha_nacimiento')
	end if
end if
dw_lista.accepttext()
end event

event rowfocuschanged;String	ls_ciudad
if getrow()>0 then 
	il_row_eli = getrow()
	ls_ciudad					= dw_lista.getitemstring(il_row_eli,'ciudad_particular')
	if not isnull(ls_ciudad) and ls_ciudad<>'' then
		idw_detalle2.retrieve(ls_ciudad)
	end if
	if ls_ciudad='999' then
		dw_lista.setitem(il_row_eli,'comuna_particular','999')
	end if
	if ls_ciudad='0' then
		dw_lista.setitem(il_row_eli,'comuna_particular','0')
	end if
end if
end event

event itemfocuschanged;String	ls_columna,ls_cod_parentesco
Date		ld_fecha_dia,ld_fecha,ld_nulo
Long		ll_dia_hoy,ll_dia_nac,ll_mes_hoy,ll_mes_nac,ll_ano_hoy,ll_ano_nac,ll_edad,ll_cod_seg_det

ls_columna						= dwo.name
if il_tipo_seguro=5 then
	Setnull(ld_nulo)
	if ls_columna <> 'fecha_nacimiento' and is_validar = 'S' then
		if isvalid(w_ingresar_oferta) then
			ld_fecha_dia		= date(w_ingresar_oferta.dw_oferta_v.getitemdatetime(1,'fecha'))
		else
			ld_fecha_dia		= date(gdt_fec_sistema)
		end if
		if isnull(ld_fecha_dia) then ld_fecha_dia=date(gdt_fec_sistema)
		ld_fecha					= date(dw_lista.getitemdatetime(row,'fecha_nacimiento'))
		ls_cod_parentesco		= dw_lista.getitemstring(row,'codigo_parentesco')
		ll_cod_seg_det			= dw_lista.getitemnumber(row,'codigo_seguro_detalle')
		if ll_cod_seg_det=1 then
			ll_dia_hoy			= day(ld_fecha_dia)
			ll_dia_nac			= day(ld_fecha)
			ll_mes_hoy			= month(ld_fecha_dia)
			ll_mes_nac			= month(ld_fecha)
			ll_ano_hoy			= year(ld_fecha_dia)
			ll_ano_nac			= year(ld_fecha)
			ll_edad				= ll_ano_hoy - ll_ano_nac
			if ll_mes_nac > ll_mes_hoy  then
				ll_edad			= ll_edad - 1
			elseif ll_mes_hoy = ll_mes_nac then
				if ll_dia_hoy > ll_dia_nac then
					ll_edad		= ll_edad - 1
				end if
			end if
			if ls_cod_parentesco='4' and (ll_edad < 18 or ll_edad > 75) then	//
				dw_lista.setitem(row,'fecha_nacimiento',ld_nulo)
			elseif ls_cod_parentesco='3' and ll_edad > 24 then
				dw_lista.setitem(row,'fecha_nacimiento',ld_nulo)
			end if
		end if
	end if
end if
dw_lista.accepttext()
end event

type ln_1 from line within w_ingreso_beneficiario_seg_comple
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2757
integer beginy = 36
integer endx = 2757
integer endy = 1116
end type

type ln_2 from line within w_ingreso_beneficiario_seg_comple
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2761
integer beginy = 36
integer endx = 2761
integer endy = 1116
end type

