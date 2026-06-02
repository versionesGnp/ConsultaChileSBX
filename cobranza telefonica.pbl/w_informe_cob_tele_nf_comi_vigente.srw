forward
global type w_informe_cob_tele_nf_comi_vigente from window
end type
type dw_parque from datawindow within w_informe_cob_tele_nf_comi_vigente
end type
type st_16 from statictext within w_informe_cob_tele_nf_comi_vigente
end type
type hpb_1 from hprogressbar within w_informe_cob_tele_nf_comi_vigente
end type
type st_fondo from statictext within w_informe_cob_tele_nf_comi_vigente
end type
type st_porc from statictext within w_informe_cob_tele_nf_comi_vigente
end type
type pb_1 from picturebutton within w_informe_cob_tele_nf_comi_vigente
end type
type sle_1 from singlelineedit within w_informe_cob_tele_nf_comi_vigente
end type
type st_4 from statictext within w_informe_cob_tele_nf_comi_vigente
end type
type sle_titulo from singlelineedit within w_informe_cob_tele_nf_comi_vigente
end type
type st_3 from statictext within w_informe_cob_tele_nf_comi_vigente
end type
type cb_imprimir from commandbutton within w_informe_cob_tele_nf_comi_vigente
end type
type cb_exportar from commandbutton within w_informe_cob_tele_nf_comi_vigente
end type
type cb_filtrar from commandbutton within w_informe_cob_tele_nf_comi_vigente
end type
type pb_aceptar from picturebutton within w_informe_cob_tele_nf_comi_vigente
end type
type p_fin from picture within w_informe_cob_tele_nf_comi_vigente
end type
type em_fec_fin from editmask within w_informe_cob_tele_nf_comi_vigente
end type
type st_2 from statictext within w_informe_cob_tele_nf_comi_vigente
end type
type p_ini from picture within w_informe_cob_tele_nf_comi_vigente
end type
type em_fec_ini from editmask within w_informe_cob_tele_nf_comi_vigente
end type
type st_1 from statictext within w_informe_cob_tele_nf_comi_vigente
end type
type cb_cerrar from commandbutton within w_informe_cob_tele_nf_comi_vigente
end type
type cb_ctacte from commandbutton within w_informe_cob_tele_nf_comi_vigente
end type
type dw_lista_detalle from datawindow within w_informe_cob_tele_nf_comi_vigente
end type
type dw_lista from datawindow within w_informe_cob_tele_nf_comi_vigente
end type
type gb_1 from groupbox within w_informe_cob_tele_nf_comi_vigente
end type
end forward

global type w_informe_cob_tele_nf_comi_vigente from window
integer width = 3424
integer height = 2224
boolean titlebar = true
string title = "Informe Cobranza Telefónica Comisiones Vigentes NF"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_parque dw_parque
st_16 st_16
hpb_1 hpb_1
st_fondo st_fondo
st_porc st_porc
pb_1 pb_1
sle_1 sle_1
st_4 st_4
sle_titulo sle_titulo
st_3 st_3
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
pb_aceptar pb_aceptar
p_fin p_fin
em_fec_fin em_fec_fin
st_2 st_2
p_ini p_ini
em_fec_ini em_fec_ini
st_1 st_1
cb_cerrar cb_cerrar
cb_ctacte cb_ctacte
dw_lista_detalle dw_lista_detalle
dw_lista dw_lista
gb_1 gb_1
end type
global w_informe_cob_tele_nf_comi_vigente w_informe_cob_tele_nf_comi_vigente

type variables
long	il_row
end variables

on w_informe_cob_tele_nf_comi_vigente.create
this.dw_parque=create dw_parque
this.st_16=create st_16
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.st_porc=create st_porc
this.pb_1=create pb_1
this.sle_1=create sle_1
this.st_4=create st_4
this.sle_titulo=create sle_titulo
this.st_3=create st_3
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.pb_aceptar=create pb_aceptar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_2=create st_2
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.cb_ctacte=create cb_ctacte
this.dw_lista_detalle=create dw_lista_detalle
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.dw_parque,&
this.st_16,&
this.hpb_1,&
this.st_fondo,&
this.st_porc,&
this.pb_1,&
this.sle_1,&
this.st_4,&
this.sle_titulo,&
this.st_3,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.pb_aceptar,&
this.p_fin,&
this.em_fec_fin,&
this.st_2,&
this.p_ini,&
this.em_fec_ini,&
this.st_1,&
this.cb_cerrar,&
this.cb_ctacte,&
this.dw_lista_detalle,&
this.dw_lista,&
this.gb_1}
end on

on w_informe_cob_tele_nf_comi_vigente.destroy
destroy(this.dw_parque)
destroy(this.st_16)
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.st_porc)
destroy(this.pb_1)
destroy(this.sle_1)
destroy(this.st_4)
destroy(this.sle_titulo)
destroy(this.st_3)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.pb_aceptar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_2)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.cb_ctacte)
destroy(this.dw_lista_detalle)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;Date	ld_fec_ini,ld_fec_fin
Long	ll_cod_parque
connect using trans_1;
gf_centrar(w_informe_cob_tele_nf_comi_vigente)
em_fec_ini.text	= string(today(),"dd/mm/yyyy")
em_fec_fin.text	= string(today(),"dd/mm/yyyy")
ld_fec_ini			= today()
ld_fec_fin			= today()
dw_lista.settransobject(sqlca)
dw_lista_detalle.settransobject(sqlca)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque	= 1
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque	= 11
elseif gs_conexion = "Parque Concepción" then
	ll_cod_parque	= 801
end if
dw_parque.setitem(1,'cod_parque',ll_cod_parque)
dw_parque.accepttext()

end event

event close;disconnect using trans_1;
end event

type dw_parque from datawindow within w_informe_cob_tele_nf_comi_vigente
integer x = 1719
integer y = 36
integer width = 594
integer height = 104
integer taborder = 30
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
dw_parque.accepttext()
end event

type st_16 from statictext within w_informe_cob_tele_nf_comi_vigente
integer x = 1536
integer y = 52
integer width = 169
integer height = 60
integer textsize = -8
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

type hpb_1 from hprogressbar within w_informe_cob_tele_nf_comi_vigente
boolean visible = false
integer x = 997
integer y = 1040
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_informe_cob_tele_nf_comi_vigente
boolean visible = false
integer x = 965
integer y = 936
integer width = 1431
integer height = 192
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_porc from statictext within w_informe_cob_tele_nf_comi_vigente
boolean visible = false
integer x = 1568
integer y = 964
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_informe_cob_tele_nf_comi_vigente
event ue_mousemove pbm_mousemove
integer x = 3264
integer y = 44
integer width = 105
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lupa.bmp"
string disabledname = "Lupa.bmp"
alignment htextalign = left!
end type

event clicked;STRING	ls_string,ls_codigo
long		ll_row
if trim(sle_1.text)<>'' then
	dw_lista.SETfilter("")
	dw_lista.filter()
	dw_lista.sort()
	dw_lista.scrolltorow(1)
	ls_codigo	= trim(sle_1.text)
	ls_string	= "cod_sup='"+trim(ls_codigo)+"'"
	ll_row 		= dw_lista.Find(ls_string, 1, dw_lista.RowCount() )
	IF ll_row > 0 THEN
		dw_lista.ScrollToRow( ll_row )
		dw_lista.setfocus()
	ELSE
		MessageBox("Advertencia", "Supervisor Inexistente")
	END IF
end if
end event

type sle_1 from singlelineedit within w_informe_cob_tele_nf_comi_vigente
event ue_mousemove pbm_mousemove
integer x = 3049
integer y = 40
integer width = 206
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;pb_1.triggerevent (clicked!)
end event

type st_4 from statictext within w_informe_cob_tele_nf_comi_vigente
event ue_mousemove pbm_mousemove
integer x = 2560
integer y = 52
integer width = 475
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 80269524
string text = "Buscar Supervisor"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;String	ls_cod_sup,ls_string
ls_cod_sup	= trim(sle_1.text)
if not isnull(ls_cod_sup) and ls_cod_sup<>'' then
	ls_string	= "cod_sup='"+trim(ls_cod_sup)+"'"
	dw_lista.SETfilter(ls_string)
	dw_lista.filter()
	dw_lista.sort()
end if
end event

type sle_titulo from singlelineedit within w_informe_cob_tele_nf_comi_vigente
integer x = 1691
integer y = 1984
integer width = 1344
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
integer limit = 1000
borderstyle borderstyle = stylelowered!
end type

event modified;string	ls_titulo
ls_titulo	= trim(sle_titulo.text)
if not isnull(ls_titulo) and ls_titulo<>'' then
	dw_lista.object.t_4.text	= ls_titulo
end if
end event

type st_3 from statictext within w_informe_cob_tele_nf_comi_vigente
integer x = 1317
integer y = 2000
integer width = 361
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Modificar Título"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_informe_cob_tele_nf_comi_vigente
event ue_mousemove pbm_mousemove
integer x = 1024
integer y = 1984
integer width = 247
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	dw_lista.Modify("DataWindow.Print.Preview = 'True'")
	f_Print( dw_lista )
	dw_lista.Modify("DataWindow.Print.Preview = 'False'")
end if
end event

type cb_exportar from commandbutton within w_informe_cob_tele_nf_comi_vigente
event ue_mousemove pbm_mousemove
integer x = 731
integer y = 1984
integer width = 247
integer height = 92
integer taborder = 90
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

type cb_filtrar from commandbutton within w_informe_cob_tele_nf_comi_vigente
event ue_mousemove pbm_mousemove
integer x = 480
integer y = 1984
integer width = 247
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;//string nulo
long		ll_filas
//setnull (nulo)
//dw_lista.SETfilter(NULO)
//dw_lista.filter()
//gs_formula 	= dw_lista.describe("datawindow.syntax")
//messagebox("",gs_formula)

long ll_posini, ll_posfin, ll_largototal, ll_indi, ll_resto
string ls_texto
setnull (gs_formula)
dw_lista.SETfilter(gs_formula)
dw_lista.filter()
ll_filas				= dw_lista.rowcount()
gs_formula 			= dw_lista.describe("datawindow.syntax")
ll_largototal		= len(gs_formula)
ll_posini			= Pos(gs_formula, "filter") + 8
ll_posfin			= len("~nfilter~n")
ls_texto				= mid(gs_formula, ll_posini, ll_posfin)
for ll_indi = ll_posini to ll_largototal
	if mid(gs_formula,ll_indi,1) = '"' then
		ll_posfin	= ll_indi
		ll_indi		= ll_largototal
	end if
next
ll_resto				= ll_posfin - ll_posini
gs_formula			= trim(mid(gs_formula,ll_posini,ll_resto))
if mid(gs_formula,1,2)='7;' then
	gs_formula		= ''
end if
dw_lista.sort()
end event

type pb_aceptar from picturebutton within w_informe_cob_tele_nf_comi_vigente
event ue_mousemove pbm_mousemove
integer x = 2327
integer y = 24
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event clicked;Date		ld_fec_fin,ld_fec_ini
Long		ll_tot_reg,ll_indi,ll_new,ll_count,ll_tot_porc,ll_tot_porc_aux,ll_cod_parque
String	ls_cod_jefe,ls_cod_sup,ls_cod_age,ls_base,ls_serie,ls_estado,ls_glosa,ls_usuario
Datetime	ldt_fecha,ld_fecha_pago
double	ldb_numero

SetPointer(HourGlass!)
dw_lista.reset()
dw_parque.accepttext()
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
ld_fec_ini		= date(em_fec_ini.text)
ld_fec_fin		= date(em_fec_fin.text)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ll_cod_parque>0 then
			if dw_lista_detalle.retrieve(ld_fec_ini,ld_fec_fin,ll_cod_parque)=0 then //,gs_user
				messagebox("Advertencia","No registra dato")
			else
				dw_lista_detalle.accepttext()
				dw_lista.reset()
				dw_lista.object.t_4.text		= 'INFORME COBRANZA TELEFONICA COMISIONES VIGENTES NF'
				sle_titulo.text					= ''
				dw_lista.object.t_fecha.text	= 'Rango fecha desde: '+string( ld_fec_ini ,"dd/mm/yyyy")+' hasta: '+string( ld_fec_fin ,"dd/mm/yyyy")
				ll_tot_reg							= dw_lista_detalle.rowcount()
				dw_lista_detalle.accepttext()
				dw_lista_detalle.sort()
				
				st_fondo.visible					= true
				hpb_1.visible 						= true
				st_porc.visible 					= true
				ll_tot_porc							= 0
				ll_tot_porc_aux					= 0
				hpb_1.Position						= ll_tot_porc
				
				for ll_indi=1 to ll_tot_reg
					Setnull(ls_cod_jefe);	Setnull(ls_cod_sup);			Setnull(ls_cod_age)
					ls_cod_jefe				= dw_lista_detalle.getitemstring(ll_indi,'anexo_liberador_cod_jef')
					ls_cod_sup				= dw_lista_detalle.getitemstring(ll_indi,'anexo_liberador_cod_super')
					ls_cod_age				= dw_lista_detalle.getitemstring(ll_indi,'anexo_liberador_cod_agente')
					ls_base					= dw_lista_detalle.getitemstring(ll_indi,'cadena_codigo')
					ls_serie					= dw_lista_detalle.getitemstring(ll_indi,'cadena_serie')
					ldb_numero				= dw_lista_detalle.getitemnumber(ll_indi,'cadena_numero')
					ls_usuario				= dw_lista_detalle.getitemstring(ll_indi,'tele_log_usuario')
					if not isnull(ls_cod_jefe) and not isnull(ls_cod_sup) and not isnull(ls_cod_age) and &
						ls_cod_jefe<>'' and ls_cod_sup<>'' and ls_cod_age<>'' then
						ll_new					= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,'cod_jv',ls_cod_jefe)
						dw_lista.setitem(ll_new,'nombre_jv',dw_lista_detalle.getitemstring(ll_indi,'jefe_ventas_nombre'))
						dw_lista.setitem(ll_new,'ap_pat_jv',dw_lista_detalle.getitemstring(ll_indi,'jefe_ventas_a_paterno'))
						dw_lista.setitem(ll_new,'ap_mat_jv',dw_lista_detalle.getitemstring(ll_indi,'jefe_ventas_a_materno'))
						dw_lista.setitem(ll_new,'cod_sup',ls_cod_sup)
						dw_lista.setitem(ll_new,'nombre_sup',dw_lista_detalle.getitemstring(ll_indi,'supervisor_nombre'))
						dw_lista.setitem(ll_new,'ap_pat_sup',dw_lista_detalle.getitemstring(ll_indi,'supervisor_a_paterno'))
						dw_lista.setitem(ll_new,'ap_mat_sup',dw_lista_detalle.getitemstring(ll_indi,'supervisor_a_materno'))
						dw_lista.setitem(ll_new,'cod_age',ls_cod_age)
						dw_lista.setitem(ll_new,'nombre_age',dw_lista_detalle.getitemstring(ll_indi,'agentes_nombre'))
						dw_lista.setitem(ll_new,'ap_pat_age',dw_lista_detalle.getitemstring(ll_indi,'agentes_a_paterno'))
						dw_lista.setitem(ll_new,'ap_mat_age',dw_lista_detalle.getitemstring(ll_indi,'agentes_a_materno'))
						dw_lista.setitem(ll_new,'base',ls_base)
						dw_lista.setitem(ll_new,'serie',ls_serie)
						dw_lista.setitem(ll_new,'numero',ldb_numero)
						dw_lista.setitem(ll_new,'rut_cliente',dw_lista_detalle.getitemnumber(ll_indi,'cliente_rut'))
						dw_lista.setitem(ll_new,'dv_cliente',dw_lista_detalle.getitemstring(ll_indi,'cliente_dv'))
						dw_lista.setitem(ll_new,'nombre_cliente',dw_lista_detalle.getitemstring(ll_indi,'cliente_nombre'))
						dw_lista.setitem(ll_new,'ap_pat_cliente',dw_lista_detalle.getitemstring(ll_indi,'cliente_a_paterno'))
						dw_lista.setitem(ll_new,'ap_mat_cliente',dw_lista_detalle.getitemstring(ll_indi,'cliente_a_materno'))
						dw_lista.setitem(ll_new,'fono_c',dw_lista_detalle.getitemstring(ll_indi,'cliente_fono_c'))
						dw_lista.setitem(ll_new,'fono_p',dw_lista_detalle.getitemstring(ll_indi,'cliente_fono_p'))
						dw_lista.setitem(ll_new,'mora_cred',dw_lista_detalle.getitemnumber(ll_indi,'cadena_mora_mora_cred'))
						dw_lista.setitem(ll_new,'fecha_vcto_cred',date(dw_lista_detalle.getitemdatetime(ll_indi,'cadena_mora_fecha_venc_cred')))
						dw_lista.setitem(ll_new,'ctas_pag_cred',dw_lista_detalle.getitemnumber(ll_indi,'cadena_mora_ctas_pag_s'))
						dw_lista.setitem(ll_new,'plazo_cred',dw_lista_detalle.getitemnumber(ll_indi,'cadena_mora_plazo'))
						dw_lista.setitem(ll_new,'valor_cuota',double(dw_lista_detalle.getitemnumber(ll_indi,'pago_liberador_valor_cuota')))
						dw_lista.setitem(ll_new,'estado_cuponera',dw_lista_detalle.getitemnumber(ll_indi,'cadena_est_cup'))
						dw_lista.setitem(ll_new,'fallecido',dw_lista_detalle.getitemnumber(ll_indi,'cadena_mora_fallecidos'))
						dw_lista.setitem(ll_new,'estado_jefe',dw_lista_detalle.getitemstring(ll_indi,'jefe_ventas_estado'))
						dw_lista.setitem(ll_new,'estado_sup',dw_lista_detalle.getitemstring(ll_indi,'supervisor_estado'))
						dw_lista.setitem(ll_new,'estado_age',dw_lista_detalle.getitemstring(ll_indi,'agentes_estado'))
						dw_lista.setitem(ll_new,'dias_mora_cred',dw_lista_detalle.getitemnumber(ll_indi,'cadena_mora_dias_mora_cred'))
						dw_lista.setitem(ll_new,'usuario',ls_usuario)
						if isnull(trim(dw_lista_detalle.getitemString(ll_indi,'uso'))) or trim(dw_lista_detalle.getitemString(ll_indi,'uso'))='' then
							dw_lista.setitem(ll_new,'uso','XX')
						else
							dw_lista.setitem(ll_new,'uso',dw_lista_detalle.getitemString(ll_indi,'uso'))
						end if
						SELECT	MAX("INGRESO"."FECHA_PAGO")  
						INTO 		:ld_fecha_pago  
						FROM 		"INGRESO"  
						WHERE  ( "INGRESO"."BASE" = :ls_base ) AND  
								 ( "INGRESO"."SERIE" = :ls_serie ) AND  
								 ( "INGRESO"."CONTRATO" = :ldb_numero ) and 
								 (("INGRESO"."TIPO_COB" = 'CI' ) or 
								  ("INGRESO"."TIPO_COB" = 'C0' ) or 
								  ("INGRESO"."TIPO_COB" = 'C1' ) or 
								  ("INGRESO"."TIPO_COB" = 'CU' ) OR 
								  ("INGRESO"."TIPO_COB" = 'CC' ))  
						USING		Trans_1;
						if Trans_1.sqlcode=0 then
							dw_lista.setitem(ll_new,'fecha_ult_pago',ld_fecha_pago)
						end if
						ll_count					= 0
						
						DECLARE 	x1 CURSOR FOR  
						SELECT 	"TELE_LOG"."ESTADO",   
									"TELE_LOG"."FECHA",   
									"TELE_LOG"."GLOSA"  
						FROM 		"TELE_LOG"  
						WHERE  ( "TELE_LOG"."BASE" = :ls_base ) AND  
								 ( "TELE_LOG"."SERIE" = :ls_serie ) AND  
								 ( "TELE_LOG"."NUMERO" = :ldb_numero ) AND
								 ( "TELE_LOG"."FECHA" >= :ld_fec_ini ) AND  
								 ( "TELE_LOG"."FECHA" <= :ld_fec_Fin ) and 
									ROWNUM < 4  
						ORDER BY "TELE_LOG"."FECHA" DESC 
						USing		sqlca;
						open x1;
						if sqlca.sqlcode=0 then
							DO WHILE sqlca.sqlcode=0
								fetch x1 into :ls_estado, :ldt_fecha, :ls_glosa;
								ll_count ++
								if not isnull(ls_estado) and ls_estado<>'' and not isnull(ls_glosa) and &
									ls_glosa<>'' and not isnull(ldt_fecha) and ll_count=1 then
									dw_lista.setitem(ll_new,'estado_cob_1',ls_estado)
									dw_lista.setitem(ll_new,'fecha_cob_1',ldt_fecha)
									dw_lista.setitem(ll_new,'glosa_cob_1',ls_glosa)
								elseif not isnull(ls_estado) and ls_estado<>'' and not isnull(ls_glosa) and &
									ls_glosa<>'' and not isnull(ldt_fecha) and ll_count=2 then
									dw_lista.setitem(ll_new,'estado_cob_2',ls_estado)
									dw_lista.setitem(ll_new,'fecha_cob_2',ldt_fecha)
									dw_lista.setitem(ll_new,'glosa_cob_2',ls_glosa)
								elseif not isnull(ls_estado) and ls_estado<>'' and not isnull(ls_glosa) and &
									ls_glosa<>'' and not isnull(ldt_fecha) and ll_count=3 then
									dw_lista.setitem(ll_new,'estado_cob_3',ls_estado)
									dw_lista.setitem(ll_new,'fecha_cob_3',ldt_fecha)
									dw_lista.setitem(ll_new,'glosa_cob_3',ls_glosa)
								elseif ll_count>3 then
									exit
								end if
								setnull(ls_estado);setnull(ldt_fecha);setnull(ls_glosa)
							LOOP
							if isnull(dw_lista.getitemstring(ll_new,'estado_cob_1')) then
								setnull(ldt_fecha)
								dw_lista.setitem(ll_new,'estado_cob_1','XX')
								dw_lista.setitem(ll_new,'fecha_cob_1',ldt_fecha)
								dw_lista.setitem(ll_new,'glosa_cob_1','XX')
							end if
							if isnull(dw_lista.getitemstring(ll_new,'estado_cob_2')) then
								setnull(ldt_fecha)
								dw_lista.setitem(ll_new,'estado_cob_2','XX')
								dw_lista.setitem(ll_new,'fecha_cob_2',ldt_fecha)
								dw_lista.setitem(ll_new,'glosa_cob_2','XX')
							end if
							if isnull(dw_lista.getitemstring(ll_new,'estado_cob_3')) then
								setnull(ldt_fecha)
								dw_lista.setitem(ll_new,'estado_cob_3','XX')
								dw_lista.setitem(ll_new,'fecha_cob_3',ldt_fecha)
								dw_lista.setitem(ll_new,'glosa_cob_3','XX')
							end if
						else
							setnull(ldt_fecha)
							dw_lista.setitem(ll_new,'estado_cob_1','XX')
							dw_lista.setitem(ll_new,'fecha_cob_1',ldt_fecha)
							dw_lista.setitem(ll_new,'glosa_cob_1','XX')
							dw_lista.setitem(ll_new,'estado_cob_2','XX')
							dw_lista.setitem(ll_new,'fecha_cob_2',ldt_fecha)
							dw_lista.setitem(ll_new,'glosa_cob_2','XX')
							dw_lista.setitem(ll_new,'estado_cob_3','XX')
							dw_lista.setitem(ll_new,'fecha_cob_3',ldt_fecha)
							dw_lista.setitem(ll_new,'glosa_cob_3','XX')
						end if
						close x1;
					end if
					if ll_tot_porc <> ll_tot_porc_aux then 
						st_porc.text		= string(ll_tot_porc)+" %"
						ll_tot_porc_aux	= ll_tot_porc
					end if
					ll_tot_porc				= (ll_indi / ll_tot_reg) * 100
					hpb_1.Position 		= int(ll_tot_porc)
				next
				dw_lista.accepttext()
				dw_lista.scrolltorow(1)
				st_fondo.visible			= false
				hpb_1.visible 				= false
				st_porc.visible 			= false
			end if
		else
			messagebox("Advertencia","Debe Seleccionar Parque")
			dw_parque.setfocus()
		end if
	end if
end if
SetPointer(arrow!)
end event

type p_fin from picture within w_informe_cob_tele_nf_comi_vigente
integer x = 1422
integer y = 40
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf
dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text=string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha = em_fec_fin.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type em_fec_fin from editmask within w_informe_cob_tele_nf_comi_vigente
integer x = 1102
integer y = 40
integer width = 315
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_informe_cob_tele_nf_comi_vigente
integer x = 946
integer y = 52
integer width = 160
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_ini from picture within w_informe_cob_tele_nf_comi_vigente
integer x = 855
integer y = 40
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf
dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_informe_cob_tele_nf_comi_vigente
integer x = 535
integer y = 40
integer width = 315
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_informe_cob_tele_nf_comi_vigente
integer x = 41
integer y = 52
integer width = 503
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha   desde:"
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_informe_cob_tele_nf_comi_vigente
integer x = 3099
integer y = 1984
integer width = 274
integer height = 92
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_informe_cob_tele_nf_comi_vigente)
end event

type cb_ctacte from commandbutton within w_informe_cob_tele_nf_comi_vigente
integer x = 32
integer y = 1984
integer width = 407
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string param
if il_row > 0 then
	gs_base		= dw_lista.getitemstring(il_row,'base')
	gs_serie		= dw_lista.getitemstring(il_row,'serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'rut_cliente')
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "P" // Pagaré
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type dw_lista_detalle from datawindow within w_informe_cob_tele_nf_comi_vigente
boolean visible = false
integer x = 23
integer y = 1984
integer width = 352
integer height = 500
string title = "none"
string dataobject = "dw_informe_cob_tele_nf_comi_vigente"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type dw_lista from datawindow within w_informe_cob_tele_nf_comi_vigente
integer x = 37
integer y = 168
integer width = 3337
integer height = 1768
integer taborder = 60
string title = "none"
string dataobject = "dwe_cob_tele_nf_comi_vgte"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then 
	il_row	= row
	cb_ctacte.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_informe_cob_tele_nf_comi_vigente
event ue_mousemove pbm_mousemove
integer x = 457
integer y = 1936
integer width = 841
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

