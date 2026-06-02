forward
global type w_verificar_datos_contrato from window
end type
type st_est_jefe from statictext within w_verificar_datos_contrato
end type
type st_est_super from statictext within w_verificar_datos_contrato
end type
type st_est_agente from statictext within w_verificar_datos_contrato
end type
type st_nombre_jefe from statictext within w_verificar_datos_contrato
end type
type st_nombre_super from statictext within w_verificar_datos_contrato
end type
type st_nombre_agente from statictext within w_verificar_datos_contrato
end type
type st_numero from editmask within w_verificar_datos_contrato
end type
type st_serie from statictext within w_verificar_datos_contrato
end type
type st_base from statictext within w_verificar_datos_contrato
end type
type cb_cancelar from commandbutton within w_verificar_datos_contrato
end type
type cb_aceptar from commandbutton within w_verificar_datos_contrato
end type
type st_jefe from statictext within w_verificar_datos_contrato
end type
type st_supervisor from statictext within w_verificar_datos_contrato
end type
type st_agente from statictext within w_verificar_datos_contrato
end type
type st_5 from statictext within w_verificar_datos_contrato
end type
type st_4 from statictext within w_verificar_datos_contrato
end type
type st_3 from statictext within w_verificar_datos_contrato
end type
type st_nro from statictext within w_verificar_datos_contrato
end type
type gb_1 from groupbox within w_verificar_datos_contrato
end type
end forward

global type w_verificar_datos_contrato from window
integer width = 3237
integer height = 1980
boolean titlebar = true
string title = "Verificar Datos del Contrato"
windowtype windowtype = response!
long backcolor = 67108864
st_est_jefe st_est_jefe
st_est_super st_est_super
st_est_agente st_est_agente
st_nombre_jefe st_nombre_jefe
st_nombre_super st_nombre_super
st_nombre_agente st_nombre_agente
st_numero st_numero
st_serie st_serie
st_base st_base
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
st_jefe st_jefe
st_supervisor st_supervisor
st_agente st_agente
st_5 st_5
st_4 st_4
st_3 st_3
st_nro st_nro
gb_1 gb_1
end type
global w_verificar_datos_contrato w_verificar_datos_contrato

on w_verificar_datos_contrato.create
this.st_est_jefe=create st_est_jefe
this.st_est_super=create st_est_super
this.st_est_agente=create st_est_agente
this.st_nombre_jefe=create st_nombre_jefe
this.st_nombre_super=create st_nombre_super
this.st_nombre_agente=create st_nombre_agente
this.st_numero=create st_numero
this.st_serie=create st_serie
this.st_base=create st_base
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.st_jefe=create st_jefe
this.st_supervisor=create st_supervisor
this.st_agente=create st_agente
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_nro=create st_nro
this.gb_1=create gb_1
this.Control[]={this.st_est_jefe,&
this.st_est_super,&
this.st_est_agente,&
this.st_nombre_jefe,&
this.st_nombre_super,&
this.st_nombre_agente,&
this.st_numero,&
this.st_serie,&
this.st_base,&
this.cb_cancelar,&
this.cb_aceptar,&
this.st_jefe,&
this.st_supervisor,&
this.st_agente,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_nro,&
this.gb_1}
end on

on w_verificar_datos_contrato.destroy
destroy(this.st_est_jefe)
destroy(this.st_est_super)
destroy(this.st_est_agente)
destroy(this.st_nombre_jefe)
destroy(this.st_nombre_super)
destroy(this.st_nombre_agente)
destroy(this.st_numero)
destroy(this.st_serie)
destroy(this.st_base)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.st_jefe)
destroy(this.st_supervisor)
destroy(this.st_agente)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_nro)
destroy(this.gb_1)
end on

event open;String	ls_codigo,ls_nom,ls_ap_pat,ls_ap_mat,ls_estado
gf_centrar(w_verificar_datos_contrato)
st_base.text				= gs_base 
st_serie.text				= substr(1,1,Message.StringParm)
st_numero.text			= substr(1,2,Message.StringParm)
st_agente.text			= substr(1,3,Message.StringParm)
st_supervisor.text		= substr(1,8,Message.StringParm)
st_jefe.text				= substr(1,9,Message.StringParm)
//Agente
setnull(ls_nom);setnull(ls_ap_pat);setnull(ls_ap_mat);setnull(ls_codigo);setnull(ls_estado)
ls_codigo				= trim(st_agente.text)
SELECT	"AGENTES"."NOMBRE",   
			"AGENTES"."A_PATERNO",   
			"AGENTES"."A_MATERNO",
			"AGENTES"."ESTADO"
INTO 		:ls_nom,   
			:ls_ap_pat,   
			:ls_ap_mat,
			:ls_estado
FROM 		"AGENTES"  
WHERE 	"AGENTES"."COD_AGE" = :ls_codigo   
USING		sqlca;
if sqlca.sqlcode=0 then
	st_nombre_agente.text		= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
	if ls_estado='A' then
		st_est_agente.text		= 'Estado:  ACTIVO'
		st_est_agente.enabled	= true
	else
		st_est_agente.text		= 'Estado:  INACTIVO'
		st_est_agente.enabled	= false
	end if
end if
//Supervisor
setnull(ls_nom);setnull(ls_ap_pat);setnull(ls_ap_mat);setnull(ls_codigo);setnull(ls_estado)
ls_codigo				= trim(st_supervisor.text)
SELECT	"SUPERVISOR"."NOMBRE",   
			"SUPERVISOR"."A_PATERNO",   
			"SUPERVISOR"."A_MATERNO",
			"SUPERVISOR"."ESTADO"
INTO 		:ls_nom,   
			:ls_ap_pat,   
			:ls_ap_mat,
			:ls_estado
FROM 		"SUPERVISOR"  
WHERE 	"SUPERVISOR"."COD_SUP" = :ls_codigo   
USING		sqlca;
if sqlca.sqlcode=0 then
	st_nombre_super.text	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
	if ls_estado='A' then
		st_est_super.text			= 'Estado:  ACTIVO'
		st_est_super.enabled		= true
	else
		st_est_super.text			= 'Estado:  INACTIVO'
		st_est_super.enabled		= false
	end if
end if
//Jefe Venta
setnull(ls_nom);setnull(ls_ap_pat);setnull(ls_ap_mat);setnull(ls_codigo);setnull(ls_estado)
ls_codigo				= trim(st_jefe.text)
SELECT	"JEFE_VENTAS"."NOMBRE",   
			"JEFE_VENTAS"."A_PATERNO",   
			"JEFE_VENTAS"."A_MATERNO",
			"JEFE_VENTAS"."ESTADO"
INTO 		:ls_nom,   
			:ls_ap_pat,   
			:ls_ap_mat,
			:ls_estado
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo   
USING		sqlca;
if sqlca.sqlcode=0 then
	st_nombre_jefe.text	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
	if ls_estado='A' then
		st_est_jefe.text			= 'Estado:  ACTIVO'
		st_est_jefe.enabled		= true
	else
		st_est_jefe.text			= 'Estado:  INACTIVO'
		st_est_jefe.enabled		= false
	end if
end if
end event

type st_est_jefe from statictext within w_verificar_datos_contrato
integer x = 338
integer y = 1292
integer width = 873
integer height = 96
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_est_super from statictext within w_verificar_datos_contrato
integer x = 338
integer y = 1004
integer width = 873
integer height = 96
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_est_agente from statictext within w_verificar_datos_contrato
integer x = 338
integer y = 716
integer width = 873
integer height = 96
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_nombre_jefe from statictext within w_verificar_datos_contrato
integer x = 1280
integer y = 1152
integer width = 1829
integer height = 256
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_nombre_super from statictext within w_verificar_datos_contrato
integer x = 1280
integer y = 864
integer width = 1829
integer height = 256
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_nombre_agente from statictext within w_verificar_datos_contrato
integer x = 1280
integer y = 576
integer width = 1829
integer height = 256
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
boolean focusrectangle = false
end type

type st_numero from editmask within w_verificar_datos_contrato
integer x = 1330
integer y = 160
integer width = 1595
integer height = 288
integer textsize = -40
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###,###"
end type

type st_serie from statictext within w_verificar_datos_contrato
integer x = 1001
integer y = 160
integer width = 302
integer height = 288
integer textsize = -40
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long backcolor = 80269524
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_base from statictext within w_verificar_datos_contrato
integer x = 672
integer y = 160
integer width = 302
integer height = 288
integer textsize = -40
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long backcolor = 80269524
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_verificar_datos_contrato
integer x = 1755
integer y = 1600
integer width = 622
integer height = 156
integer taborder = 10
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&No"
boolean default = true
end type

event clicked;CloseWithReturn(Parent,'NO')
end event

type cb_aceptar from commandbutton within w_verificar_datos_contrato
integer x = 658
integer y = 1600
integer width = 622
integer height = 156
integer taborder = 20
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Si"
end type

event clicked;CloseWithReturn(Parent,'OK')
end event

type st_jefe from statictext within w_verificar_datos_contrato
integer x = 677
integer y = 1152
integer width = 571
integer height = 136
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_supervisor from statictext within w_verificar_datos_contrato
integer x = 677
integer y = 864
integer width = 571
integer height = 136
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_agente from statictext within w_verificar_datos_contrato
integer x = 677
integer y = 576
integer width = 571
integer height = 136
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_verificar_datos_contrato
integer x = 110
integer y = 1168
integer width = 521
integer height = 104
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
string text = "JEFE VENTA"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_verificar_datos_contrato
integer x = 110
integer y = 880
integer width = 521
integer height = 104
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
string text = "SUPERVISOR"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_verificar_datos_contrato
integer x = 110
integer y = 592
integer width = 521
integer height = 104
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
string text = "AGENTE"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nro from statictext within w_verificar_datos_contrato
integer x = 233
integer y = 192
integer width = 347
integer height = 256
integer textsize = -40
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long backcolor = 80269524
string text = "Nº:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_verificar_datos_contrato
integer x = 37
integer y = 32
integer width = 3150
integer height = 1824
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
string text = "Verificar Datos del Contrato"
end type

