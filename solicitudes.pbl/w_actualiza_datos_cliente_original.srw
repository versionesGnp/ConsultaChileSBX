forward
global type w_actualiza_datos_cliente_original from window
end type
type st_19 from statictext within w_actualiza_datos_cliente_original
end type
type st_18 from statictext within w_actualiza_datos_cliente_original
end type
type st_17 from statictext within w_actualiza_datos_cliente_original
end type
type st_16 from statictext within w_actualiza_datos_cliente_original
end type
type st_15 from statictext within w_actualiza_datos_cliente_original
end type
type st_14 from statictext within w_actualiza_datos_cliente_original
end type
type st_13 from statictext within w_actualiza_datos_cliente_original
end type
type st_12 from statictext within w_actualiza_datos_cliente_original
end type
type st_11 from statictext within w_actualiza_datos_cliente_original
end type
type st_10 from statictext within w_actualiza_datos_cliente_original
end type
type st_9 from statictext within w_actualiza_datos_cliente_original
end type
type st_8 from statictext within w_actualiza_datos_cliente_original
end type
type st_7 from statictext within w_actualiza_datos_cliente_original
end type
type st_6 from statictext within w_actualiza_datos_cliente_original
end type
type st_5 from statictext within w_actualiza_datos_cliente_original
end type
type st_nom_comp from statictext within w_actualiza_datos_cliente_original
end type
type st_rut from statictext within w_actualiza_datos_cliente_original
end type
type st_2 from statictext within w_actualiza_datos_cliente_original
end type
type cb_cerrar from commandbutton within w_actualiza_datos_cliente_original
end type
type em_dire_part from statictext within w_actualiza_datos_cliente_original
end type
type em_pobla from statictext within w_actualiza_datos_cliente_original
end type
type em_sector from statictext within w_actualiza_datos_cliente_original
end type
type em_comuna from statictext within w_actualiza_datos_cliente_original
end type
type em_ciudad from statictext within w_actualiza_datos_cliente_original
end type
type em_fono_part from statictext within w_actualiza_datos_cliente_original
end type
type em_celular from statictext within w_actualiza_datos_cliente_original
end type
type em_otro_fono from statictext within w_actualiza_datos_cliente_original
end type
type em_dire_comer from statictext within w_actualiza_datos_cliente_original
end type
type em_fono_comer from statictext within w_actualiza_datos_cliente_original
end type
type em_otro_fono_comer from statictext within w_actualiza_datos_cliente_original
end type
type em_fec_nac from statictext within w_actualiza_datos_cliente_original
end type
type em_renta from statictext within w_actualiza_datos_cliente_original
end type
type em_grupo_fam from statictext within w_actualiza_datos_cliente_original
end type
type em_est_civil from statictext within w_actualiza_datos_cliente_original
end type
type gb_1 from groupbox within w_actualiza_datos_cliente_original
end type
end forward

global type w_actualiza_datos_cliente_original from window
integer width = 2569
integer height = 1620
boolean titlebar = true
string title = "Antecedente Original del Cliente "
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_19 st_19
st_18 st_18
st_17 st_17
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_nom_comp st_nom_comp
st_rut st_rut
st_2 st_2
cb_cerrar cb_cerrar
em_dire_part em_dire_part
em_pobla em_pobla
em_sector em_sector
em_comuna em_comuna
em_ciudad em_ciudad
em_fono_part em_fono_part
em_celular em_celular
em_otro_fono em_otro_fono
em_dire_comer em_dire_comer
em_fono_comer em_fono_comer
em_otro_fono_comer em_otro_fono_comer
em_fec_nac em_fec_nac
em_renta em_renta
em_grupo_fam em_grupo_fam
em_est_civil em_est_civil
gb_1 gb_1
end type
global w_actualiza_datos_cliente_original w_actualiza_datos_cliente_original

type variables
String	is_dv, is_nombre, is_a_pat,is_a_mat,is_direc_p,is_pob,is_sector,&
			is_comuna,is_ciudad,is_fono_p,is_celular,is_fono_c,is_domic_c,is_est_civil,&
			is_otro_fono_p,is_otro_fono_c,is_base,is_serie,is_tipo_sol,is_tipo_via,&
			is_nro_part,is_depto_part,is_block_part
Long		il_rut,il_tot_renta,il_grupo_f,il_sw=0,il_correlativo
Date		id_fec_nac
Double	il_numero
end variables

on w_actualiza_datos_cliente_original.create
this.st_19=create st_19
this.st_18=create st_18
this.st_17=create st_17
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_nom_comp=create st_nom_comp
this.st_rut=create st_rut
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.em_dire_part=create em_dire_part
this.em_pobla=create em_pobla
this.em_sector=create em_sector
this.em_comuna=create em_comuna
this.em_ciudad=create em_ciudad
this.em_fono_part=create em_fono_part
this.em_celular=create em_celular
this.em_otro_fono=create em_otro_fono
this.em_dire_comer=create em_dire_comer
this.em_fono_comer=create em_fono_comer
this.em_otro_fono_comer=create em_otro_fono_comer
this.em_fec_nac=create em_fec_nac
this.em_renta=create em_renta
this.em_grupo_fam=create em_grupo_fam
this.em_est_civil=create em_est_civil
this.gb_1=create gb_1
this.Control[]={this.st_19,&
this.st_18,&
this.st_17,&
this.st_16,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_nom_comp,&
this.st_rut,&
this.st_2,&
this.cb_cerrar,&
this.em_dire_part,&
this.em_pobla,&
this.em_sector,&
this.em_comuna,&
this.em_ciudad,&
this.em_fono_part,&
this.em_celular,&
this.em_otro_fono,&
this.em_dire_comer,&
this.em_fono_comer,&
this.em_otro_fono_comer,&
this.em_fec_nac,&
this.em_renta,&
this.em_grupo_fam,&
this.em_est_civil,&
this.gb_1}
end on

on w_actualiza_datos_cliente_original.destroy
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_nom_comp)
destroy(this.st_rut)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.em_dire_part)
destroy(this.em_pobla)
destroy(this.em_sector)
destroy(this.em_comuna)
destroy(this.em_ciudad)
destroy(this.em_fono_part)
destroy(this.em_celular)
destroy(this.em_otro_fono)
destroy(this.em_dire_comer)
destroy(this.em_fono_comer)
destroy(this.em_otro_fono_comer)
destroy(this.em_fec_nac)
destroy(this.em_renta)
destroy(this.em_grupo_fam)
destroy(this.em_est_civil)
destroy(this.gb_1)
end on

event open;String	ls_est_reg
gf_centrar(w_actualiza_datos_cliente_original)

is_a_pat						= trim(substr(1,1,Message.StringParm))
is_a_mat						= trim(substr(1,2,Message.StringParm))
is_nombre					= trim(substr(1,3,Message.StringParm))
il_rut						= long(trim(substr(1,4,Message.StringParm)))
is_dv							= trim(substr(1,5,Message.StringParm))
is_direc_p					= trim(substr(1,6,Message.StringParm))
is_pob						= trim(substr(1,7,Message.StringParm))
is_sector					= trim(substr(1,8,Message.StringParm))
is_comuna					= trim(substr(1,9,Message.StringParm))
is_ciudad					= trim(substr(1,10,Message.StringParm))
is_fono_p					= trim(substr(1,11,Message.StringParm))
is_otro_fono_p				= trim(substr(1,12,Message.StringParm))
is_domic_c					= trim(substr(1,13,Message.StringParm))
is_fono_c					= trim(substr(1,14,Message.StringParm))
id_fec_nac					= date(trim(substr(1,15,Message.StringParm)))
il_tot_renta				= long(trim(substr(1,16,Message.StringParm)))
il_grupo_f					= long(trim(substr(1,17,Message.StringParm)))
is_est_civil				= trim(substr(1,18,Message.StringParm))
is_celular					= trim(substr(1,19,Message.StringParm))
is_otro_fono_c				= trim(substr(1,20,Message.StringParm))
is_base						= trim(substr(1,21,Message.StringParm))
is_serie						= trim(substr(1,22,Message.StringParm))
il_numero					= Double(trim(substr(1,23,Message.StringParm)))
is_tipo_sol					= trim(substr(1,24,Message.StringParm))
il_correlativo				= long(trim(substr(1,25,Message.StringParm)))
ls_est_reg					= trim(substr(1,26,Message.StringParm))
is_tipo_via					= trim(substr(1,27,Message.StringParm))
is_nro_part					= trim(substr(1,28,Message.StringParm))
is_depto_part				= trim(substr(1,29,Message.StringParm))
is_block_part				= trim(substr(1,30,Message.StringParm))

st_rut.text					= string(il_rut,"###,###,###,##0")+' - '+is_dv
st_nom_comp.text			= is_a_pat+' '+is_a_mat+' '+is_nombre
em_dire_part.text			= trim(is_direc_p)
em_pobla.text				= trim(is_pob)
em_sector.text				= trim(is_sector)
em_comuna.text				= trim(is_comuna)
em_ciudad.text				= trim(is_ciudad)
em_fono_part.text			= trim(is_fono_p)
em_celular.text			= trim(is_celular)
em_otro_fono.text			= trim(is_otro_fono_p)
em_dire_comer.text		= trim(is_domic_c)
em_fono_comer.text		= trim(is_fono_c)
em_otro_fono_comer.text	= trim(is_otro_fono_c)
if not isnull(id_fec_nac) and id_fec_nac<>date('01/01/1900') and id_fec_nac<>date('00/00/0000') then em_fec_nac.text = string(id_fec_nac,"dd/mm/yyyy")
em_renta.text				= string(il_tot_renta,"###,###,###,###,###,##0")
em_grupo_fam.text			= string(il_grupo_f,"###,###,###,###,###,##0")
if is_est_civil='E' then em_est_civil.text = 'E - Separado'
if is_est_civil='C' then em_est_civil.text = 'C - Casado'
if is_est_civil='S' then em_est_civil.text = 'S - Soltero'
if is_est_civil='D' then em_est_civil.text = 'D - Divorciado'
if is_est_civil='V' then em_est_civil.text = 'V - Viudo'
st_rut.enabled					= false
st_nom_comp.enabled			= false
em_dire_part.enabled			= false
em_pobla.enabled				= false
em_sector.enabled				= false
em_comuna.enabled				= false
em_ciudad.enabled				= false
em_fono_part.enabled			= false
em_celular.enabled			= false
em_otro_fono.enabled			= false
em_dire_comer.enabled		= false
em_fono_comer.enabled		= false
em_otro_fono_comer.enabled	= false
em_fec_nac.enabled			= false
em_renta.enabled				= false
em_grupo_fam.enabled			= false
em_est_civil.enabled			= false
end event

type st_19 from statictext within w_actualiza_datos_cliente_original
integer x = 73
integer y = 1180
integer width = 283
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Est.Civil:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_18 from statictext within w_actualiza_datos_cliente_original
integer x = 1637
integer y = 1064
integer width = 311
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo Fam.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_17 from statictext within w_actualiza_datos_cliente_original
integer x = 864
integer y = 1064
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Renta:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_16 from statictext within w_actualiza_datos_cliente_original
integer x = 73
integer y = 1064
integer width = 283
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Nac.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_15 from statictext within w_actualiza_datos_cliente_original
integer x = 1253
integer y = 948
integer width = 270
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Otro Fono:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_14 from statictext within w_actualiza_datos_cliente_original
integer x = 64
integer y = 948
integer width = 293
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fono Com.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_13 from statictext within w_actualiza_datos_cliente_original
integer x = 87
integer y = 808
integer width = 270
integer height = 116
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dirección Comercial"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_12 from statictext within w_actualiza_datos_cliente_original
integer x = 1637
integer y = 620
integer width = 288
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Otro Fono:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within w_actualiza_datos_cliente_original
integer x = 864
integer y = 620
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Celular:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_10 from statictext within w_actualiza_datos_cliente_original
integer x = 82
integer y = 620
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fono Part.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_actualiza_datos_cliente_original
integer x = 1307
integer y = 508
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ciudad:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_actualiza_datos_cliente_original
integer x = 82
integer y = 508
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comuna:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_actualiza_datos_cliente_original
integer x = 1307
integer y = 396
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sector:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_actualiza_datos_cliente_original
integer x = 82
integer y = 396
integer width = 274
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Población:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_actualiza_datos_cliente_original
integer x = 82
integer y = 260
integer width = 274
integer height = 116
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dirección Particular"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nom_comp from statictext within w_actualiza_datos_cliente_original
integer x = 809
integer y = 172
integer width = 1664
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_rut from statictext within w_actualiza_datos_cliente_original
integer x = 361
integer y = 172
integer width = 421
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_actualiza_datos_cliente_original
integer x = 101
integer y = 168
integer width = 233
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cliente:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_actualiza_datos_cliente_original
integer x = 2144
integer y = 1376
integer width = 343
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_actualiza_datos_cliente_original)
end event

type em_dire_part from statictext within w_actualiza_datos_cliente_original
integer x = 375
integer y = 272
integer width = 2053
integer height = 88
integer textsize = -10
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

type em_pobla from statictext within w_actualiza_datos_cliente_original
integer x = 375
integer y = 384
integer width = 859
integer height = 88
integer textsize = -10
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

type em_sector from statictext within w_actualiza_datos_cliente_original
integer x = 1536
integer y = 384
integer width = 891
integer height = 88
integer textsize = -8
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

type em_comuna from statictext within w_actualiza_datos_cliente_original
integer x = 375
integer y = 496
integer width = 859
integer height = 88
integer textsize = -8
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

type em_ciudad from statictext within w_actualiza_datos_cliente_original
integer x = 1536
integer y = 496
integer width = 891
integer height = 88
integer textsize = -8
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

type em_fono_part from statictext within w_actualiza_datos_cliente_original
integer x = 375
integer y = 608
integer width = 448
integer height = 88
integer textsize = -8
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

type em_celular from statictext within w_actualiza_datos_cliente_original
integer x = 1097
integer y = 608
integer width = 480
integer height = 88
integer textsize = -8
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

type em_otro_fono from statictext within w_actualiza_datos_cliente_original
integer x = 1947
integer y = 608
integer width = 480
integer height = 88
integer textsize = -8
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

type em_dire_comer from statictext within w_actualiza_datos_cliente_original
integer x = 375
integer y = 820
integer width = 2053
integer height = 88
integer textsize = -8
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

type em_fono_comer from statictext within w_actualiza_datos_cliente_original
integer x = 375
integer y = 936
integer width = 859
integer height = 88
integer textsize = -8
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

type em_otro_fono_comer from statictext within w_actualiza_datos_cliente_original
integer x = 1536
integer y = 936
integer width = 891
integer height = 88
integer textsize = -8
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

type em_fec_nac from statictext within w_actualiza_datos_cliente_original
integer x = 375
integer y = 1052
integer width = 448
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_renta from statictext within w_actualiza_datos_cliente_original
integer x = 1097
integer y = 1052
integer width = 480
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_grupo_fam from statictext within w_actualiza_datos_cliente_original
integer x = 1947
integer y = 1052
integer width = 480
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_est_civil from statictext within w_actualiza_datos_cliente_original
integer x = 375
integer y = 1168
integer width = 448
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_actualiza_datos_cliente_original
integer x = 37
integer y = 40
integer width = 2450
integer height = 1292
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antecedentes Personales"
end type

