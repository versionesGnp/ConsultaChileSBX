forward
global type w_muestra_detalle_cuota_hist from window
end type
type cb_filtrar from commandbutton within w_muestra_detalle_cuota_hist
end type
type cb_2 from commandbutton within w_muestra_detalle_cuota_hist
end type
type cb_3 from commandbutton within w_muestra_detalle_cuota_hist
end type
type cb_consulta from commandbutton within w_muestra_detalle_cuota_hist
end type
type cb_4 from commandbutton within w_muestra_detalle_cuota_hist
end type
type cb_1 from commandbutton within w_muestra_detalle_cuota_hist
end type
type dw_lista from datawindow within w_muestra_detalle_cuota_hist
end type
end forward

global type w_muestra_detalle_cuota_hist from window
integer x = 110
integer y = 212
integer width = 3451
integer height = 2108
boolean titlebar = true
string title = "Detalle Cuotas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_filtrar cb_filtrar
cb_2 cb_2
cb_3 cb_3
cb_consulta cb_consulta
cb_4 cb_4
cb_1 cb_1
dw_lista dw_lista
end type
global w_muestra_detalle_cuota_hist w_muestra_detalle_cuota_hist

type variables
Long		il_row
String	is_opcion
end variables

forward prototypes
public function string wf_titulo (string as_columna)
end prototypes

public function string wf_titulo (string as_columna);String ls_tt
CHOOSE CASE as_columna
		
	CASE 'c_tot_c0'
		ls_tt	= '0 cuotas pagadas y en mora'
	CASE 'c_tot_c1'
		ls_tt	= '1 cuota pagada y en mora'
	CASE 'c_tot_c2'
		ls_tt	= '2 cuotas pagadas y en mora'
	CASE 'c_tot_c3'
		ls_tt	= '3 cuotas pagadas y en mora'
	CASE 'c_tot_c4'
		ls_tt	= '4 cuotas pagadas y en mora'
	CASE 'c_tot_c5'
		ls_tt	= '5 cuotas pagadas y en mora'
	CASE 'c_tot_c6'
		ls_tt	= '6 cuotas pagadas y en mora'
	CASE 'c_tot_c7'
		ls_tt	= '6 o más cuotas pagadas y en mora'
	CASE 'c_tot_total'
		ls_tt	= 'cuotas en mora'
		
	CASE 'cp00'
		ls_tt	= '0 cuota pagada y sin mora'
	CASE 'cp01'
		ls_tt	= '1 cuota pagada y sin mora'
	CASE 'cp02'
		ls_tt	= '2 cuotas pagadas y sin mora'
	CASE 'cp03'
		ls_tt	= '3 cuotas pagadas y sin mora'
	CASE 'cp04'
		ls_tt	= '4 cuotas pagadas y sin mora'
	CASE 'cp05'
		ls_tt	= '5 cuotas pagadas y sin mora'
	CASE 'cp06'
		ls_tt	= '6 cuotas pagadas y sin mora'
	CASE 'cp07'
		ls_tt	= 'más de 6 cuotas pagadas y sin mora'
	CASE 'c_tot_0'
		ls_tt	= '0 o más cuotas pagadas y sin mora'

	CASE 'cp10'
		ls_tt	= '0 cuota pagada y 1 cuota en Mora'
	CASE 'cp11'
		ls_tt	= '1 cuota pagada y 1 cuota en Mora'
	CASE 'cp12'
		ls_tt	= '2 cuotas pagadas y 1 cuota en Mora'
	CASE 'cp13'
		ls_tt	= '3 cuotas pagadas y 1 cuota en Mora'
	CASE 'cp14'
		ls_tt	= '4 cuotas pagadas y 1 cuota en Mora'
	CASE 'cp15'
		ls_tt	= '5 cuotas pagadas y 1 cuota en Mora'
	CASE 'cp16'
		ls_tt	= '6 cuotas pagadas y 1 cuota en Mora'
	CASE 'cp17'
		ls_tt	= 'más de 6 cuotas pagadas y 1 cuota en Mora'
	CASE 'c_tot_1'
		ls_tt	= '0 o más cuotas pagadas y 1 cuota en mora'

	CASE 'cp20'
		ls_tt	= '0 cuota pagada y 2 cuotas en Moras'
	CASE 'cp21'
		ls_tt	= '1 cuota pagada y 2 cuotas en Moras'
	CASE 'cp22'
		ls_tt	= '2 cuota pagada y 2 cuotas en Moras'
	CASE 'cp23'
		ls_tt	= '3 cuota pagada y 2 cuotas en Moras'
	CASE 'cp24'
		ls_tt	= '4 cuota pagada y 2 cuotas en Moras'
	CASE 'cp25'
		ls_tt	= '5 cuota pagada y 2 cuotas en Moras'
	CASE 'cp26'
		ls_tt	= '6 cuota pagada y 2 cuotas en Moras'
	CASE 'cp27'
		ls_tt	= 'más de 6 cuotas pagadas y 2 cuotas en Mora'
	CASE 'c_tot_2'
		ls_tt	= '0 o más cuotas pagadas y 2 cuotas en mora'

	CASE 'cp30'
		ls_tt	= '0 cuota pagada y 3 cuotas en Moras'
	CASE 'cp31'
		ls_tt	= '1 cuota pagada y 3 cuotas en Moras'
	CASE 'cp32'
		ls_tt	= '2 cuotas pagadas y 3 cuotas en Moras'
	CASE 'cp33'
		ls_tt	= '3 cuotas pagadas y 3 cuotas en Moras'
	CASE 'cp34'
		ls_tt	= '4 cuotas pagadas y 3 cuotas en Moras'
	CASE 'cp35'
		ls_tt	= '5 cuotas pagadas y 3 cuotas en Moras'
	CASE 'cp36'
		ls_tt	= '6 cuotas pagadas y 3 cuotas en Moras'
	CASE 'cp37'
		ls_tt	= 'más de 6 cuotas pagadas y 3 cuotas en Mora'
	CASE 'c_tot_3'
		ls_tt	= '0 o más cuotas pagadas y 3 cuotas en mora'

	CASE 'cp40'
		ls_tt	= '0 cuota pagada y 4 cuotas en Moras'
	CASE 'cp41'
		ls_tt	= '1 cuota pagada y 4 cuotas en Moras'
	CASE 'cp42'
		ls_tt	= '2 cuotas pagadas y 4 cuotas en Moras'
	CASE 'cp43'
		ls_tt	= '3 cuotas pagadas y 4 cuotas en Moras'
	CASE 'cp44'
		ls_tt	= '4 cuotas pagadas y 4 cuotas en Moras'
	CASE 'cp45'
		ls_tt	= '5 cuotas pagadas y 4 cuotas en Moras'
	CASE 'cp46'
		ls_tt	= '6 cuotas pagadas y 4 cuotas en Moras'
	CASE 'cp47'
		ls_tt	= 'más de 6 cuotas pagadas y 4 cuotas en Mora'
	CASE 'c_tot_4'
		ls_tt	= '0 o más cuotas pagadas y 4 cuotas en mora'

	CASE 'cp50'
		ls_tt	= '0 cuota pagada y 5 cuotas en Moras'
	CASE 'cp51'
		ls_tt	= '1 cuota pagada y 5 cuotas en Moras'
	CASE 'cp52'
		ls_tt	= '2 cuotas pagadas y 5 cuotas en Moras'
	CASE 'cp53'
		ls_tt	= '3 cuotas pagadas y 5 cuotas en Moras'
	CASE 'cp54'
		ls_tt	= '4 cuotas pagadas y 5 cuotas en Moras'
	CASE 'cp55'
		ls_tt	= '5 cuotas pagadas y 5 cuotas en Moras'
	CASE 'cp56'
		ls_tt	= '6 cuotas pagadas y 5 cuotas en Moras'
	CASE 'cp57'
		ls_tt	= 'más de 6 cuotas pagadas y 5 cuotas en Mora'
	CASE 'c_tot_5'
		ls_tt	= '0 o más cuotas pagadas y 5 cuotas en mora'

	CASE 'cp60'
		ls_tt	= '0 cuota pagada y 6 cuotas en Moras'
	CASE 'cp61'
		ls_tt	= '1 cuota pagada y 6 cuotas en Moras'
	CASE 'cp62'
		ls_tt	= '2 cuotas pagadas y 6 cuotas en Moras'
	CASE 'cp63'
		ls_tt	= '3 cuotas pagadas y 6 cuotas en Moras'
	CASE 'cp64'
		ls_tt	= '4 cuotas pagadas y 6 cuotas en Moras'
	CASE 'cp65'
		ls_tt	= '5 cuotas pagadas y 6 cuotas en Moras'
	CASE 'cp66'
		ls_tt	= '6 cuotas pagadas y 6 cuotas en Moras'
	CASE 'cp67'
		ls_tt	= 'más de 6 cuotas pagadas y 6 cuotas en Mora'
	CASE 'c_tot_6'
		ls_tt	= '0 o más cuotas pagadas y 6 cuotas en mora'

	CASE 'cp70'
		ls_tt	= '0 cuota pagada y 7 cuotas en Moras'
	CASE 'cp71'
		ls_tt	= '1 cuota pagada y 7 cuotas en Moras'
	CASE 'cp72'
		ls_tt	= '2 cuotas pagadas y 7 cuotas en Moras'
	CASE 'cp73'
		ls_tt	= '3 cuotas pagadas y 7 cuotas en Moras'
	CASE 'cp74'
		ls_tt	= '4 cuotas pagadas y 7 cuotas en Moras'
	CASE 'cp75'
		ls_tt	= '5 cuotas pagadas y 7 cuotas en Moras'
	CASE 'cp76'
		ls_tt	= '6 cuotas pagadas y 7 cuotas en Moras'
	CASE 'cp77'
		ls_tt	= 'más de 6 cuotas pagadas y 7 cuotas en Mora'
	CASE 'c_tot_7'
		ls_tt	= '0 o más cuotas pagadas y 7 cuotas en mora'

	CASE 'cp80'
		ls_tt	= '0 cuota pagada y 8 cuotas en Moras'
	CASE 'cp81'
		ls_tt	= '1 cuota pagada y 8 cuotas en Moras'
	CASE 'cp82'
		ls_tt	= '2 cuotas pagadas y 8 cuotas en Moras'
	CASE 'cp83'
		ls_tt	= '3 cuotas pagadas y 8 cuotas en Moras'
	CASE 'cp84'
		ls_tt	= '4 cuotas pagadas y 8 cuotas en Moras'
	CASE 'cp85'
		ls_tt	= '5 cuotas pagadas y 8 cuotas en Moras'
	CASE 'cp86'
		ls_tt	= '6 cuotas pagadas y 8 cuotas en Moras'
	CASE 'cp87'
		ls_tt	= 'más de 6 cuotas pagadas y 8 cuotas en Mora'
	CASE 'c_tot_8'
		ls_tt	= '0 o más cuotas pagadas y 8 cuotas en mora'

	CASE 'cp90'
		ls_tt	= '0 cuota pagada y 9 cuotas en Moras'
	CASE 'cp91'
		ls_tt	= '1 cuota pagada y 9 cuotas en Moras'
	CASE 'cp92'
		ls_tt	= '2 cuotas pagadas y 9 cuotas en Moras'
	CASE 'cp93'
		ls_tt	= '3 cuotas pagadas y 9 cuotas en Moras'
	CASE 'cp94'
		ls_tt	= '4 cuotas pagadas y 9 cuotas en Moras'
	CASE 'cp95'
		ls_tt	= '5 cuotas pagadas y 9 cuotas en Moras'
	CASE 'cp96'
		ls_tt	= '6 cuotas pagadas y 9 cuotas en Moras'
	CASE 'cp97'
		ls_tt	= 'más de 6 cuotas pagadas y 9 cuotas en Mora'
	CASE 'c_tot_9'
		ls_tt	= '0 o más cuotas pagadas y 9 cuotas en mora'

	CASE 'cp100'
		ls_tt	= '0 cuota pagada y 10 cuotas en Moras'
	CASE 'cp101'
		ls_tt	= '1 cuota pagada y 10 cuotas en Moras'
	CASE 'cp102'
		ls_tt	= '2 cuotas pagadas y 10 cuotas en Moras'
	CASE 'cp103'
		ls_tt	= '3 cuotas pagadas y 10 cuotas en Moras'
	CASE 'cp104'
		ls_tt	= '4 cuotas pagadas y 10 cuotas en Moras'
	CASE 'cp105'
		ls_tt	= '5 cuotas pagadas y 10 cuotas en Moras'
	CASE 'cp106'
		ls_tt	= '6 cuotas pagadas y 10 cuotas en Moras'
	CASE 'cp107'
		ls_tt	= 'más de 6 cuotas pagadas y 10 cuotas en Mora'
	CASE 'c_tot_10'
		ls_tt	= '0 o más cuotas pagadas y 10 cuotas en mora'

	CASE 'cp110'
		ls_tt	= '0 cuota pagada y 11 cuotas en Moras'
	CASE 'cp111'
		ls_tt	= '1 cuota pagada y 11 cuotas en Moras'
	CASE 'cp112'
		ls_tt	= '2 cuotas pagadas y 11 cuotas en Moras'
	CASE 'cp113'
		ls_tt	= '3 cuotas pagadas y 11 cuotas en Moras'
	CASE 'cp114'
		ls_tt	= '4 cuotas pagadas y 11 cuotas en Moras'
	CASE 'cp115'
		ls_tt	= '5 cuotas pagadas y 11 cuotas en Moras'
	CASE 'cp116'
		ls_tt	= '6 cuotas pagadas y 11 cuotas en Moras'
	CASE 'cp117'
		ls_tt	= 'más de 6 cuotas pagadas y 11 cuotas en Mora'
	CASE 'c_tot_11'
		ls_tt	= '0 o más cuotas pagadas y 11 cuotas en mora'

	CASE 'cp120'
		ls_tt	= '0 cuota pagada y 12 cuotas en Moras'
	CASE 'cp121'
		ls_tt	= '1 cuota pagada y 12 cuotas en Moras'
	CASE 'cp122'
		ls_tt	= '2 cuotas pagadas y 12 cuotas en Moras'
	CASE 'cp123'
		ls_tt	= '3 cuotas pagadas y 12 cuotas en Moras'
	CASE 'cp124'
		ls_tt	= '4 cuotas pagadas y 12 cuotas en Moras'
	CASE 'cp125'
		ls_tt	= '5 cuotas pagadas y 12 cuotas en Moras'
	CASE 'cp126'
		ls_tt	= '6 cuotas pagadas y 12 cuotas en Moras'
	CASE 'cp127'
		ls_tt	= 'más de 6 cuotas pagadas y 12 cuotas en Moras'
	CASE 'c_tot_12'
		ls_tt	= '0 o más cuotas pagadas y 12 cuotas en moras'

	CASE 'cp130'
		ls_tt	= '0 cuota pagada y más de 12 cuotas en Moras'
	CASE 'cp131'
		ls_tt	= '1 cuotas pagadas y más de 12 cuotas en Moras'
	CASE 'cp132'
		ls_tt	= '2 cuotas pagadas y más de 12 cuotas en Moras'
	CASE 'cp133'
		ls_tt	= '3 cuotas pagadas y más de 12 cuotas en Moras'
	CASE 'cp134'
		ls_tt	= '4 cuotas pagadas y más de 12 cuotas en Moras'
	CASE 'cp135'
		ls_tt	= '5 cuotas pagadas y más de 12 cuotas en Moras'
	CASE 'cp136'
		ls_tt	= '6 cuotas pagadas y más de 12 cuotas en Moras'
	CASE 'cp137'
		ls_tt	= 'más de 6 cuotas pagadas y más de 12 cuotas en Moras'
	CASE 'c_tot_13'
		ls_tt	= '0 o más cuotas pagadas y más de 12 cuotas en moras'

END CHOOSE
return ls_tt
end function

on w_muestra_detalle_cuota_hist.create
this.cb_filtrar=create cb_filtrar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_consulta=create cb_consulta
this.cb_4=create cb_4
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.Control[]={this.cb_filtrar,&
this.cb_2,&
this.cb_3,&
this.cb_consulta,&
this.cb_4,&
this.cb_1,&
this.dw_lista}
end on

on w_muestra_detalle_cuota_hist.destroy
destroy(this.cb_filtrar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_consulta)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.dw_lista)
end on

event open;string 	ls_string, ls_codigo, ls_tipo_cargo, ls_tipo_total, ls_filtro, &
			ls_columna, ls_texto
long		il_empresa
datetime	ld_fec_ini, ld_fec_fin
gf_centrar(w_muestra_detalle_cuota_hist)
ls_filtro   	= substr(1,1,Message.StringParm)
ls_string		= substr(1,2,Message.StringParm)
ls_columna		= substr(1,3,Message.StringParm)
is_opcion		= substr(1,4,Message.StringParm)
ls_tipo_cargo	= mid(ls_string,1,1)
ls_codigo		= trim(mid(ls_string,2,5))
ld_fec_ini		= datetime(date(mid(ls_string,6,11)),time("00:00:00"))
ld_fec_fin		= datetime(date(mid(ls_string,17,10)),time("00:00:00"))
ls_tipo_total	= mid(ls_string,27,1)
gs_ventana		= 'w_muestra_detalle_cuota_hist'
f_valida_objeto_1()
if gs_conexion = "Parque El Prado" then
	il_empresa = 1
elseif gs_conexion = "Parque La Foresta" then
	il_empresa = 2
elseif gs_conexion = "Parque Concepción" then
	il_empresa = 3
end if
CHOOSE CASE ls_tipo_cargo
	CASE '1'
		this.title					= 'Detalle Cuotas Mora por Jefe de Venta'
		if is_opcion='O' then
			dw_lista.dataobject	= 'dw_lista_detalle_cuotas_mora_jefe_hist'
		elseif is_opcion='A' then
			dw_lista.dataobject	= 'dw_lista_detalle_cuotas_mora_jefe_aum_hi'
		end if

	CASE '2'
		this.title					= 'Detalle Cuotas Mora por Supervisor'
		if is_opcion='O' then
			dw_lista.dataobject	= 'dw_lista_detalle_cuotas_mora_sup_hist'
		elseif is_opcion='A' then
			dw_lista.dataobject	= 'dw_lista_detalle_cuotas_mora_sup_aum_his'
		end if

	CASE '3'
		this.title					= 'Detalle Cuotas Mora por Agente'
		if is_opcion='O' then
			dw_lista.dataobject	= 'dw_lista_detalle_cuotas_mora_agente_hist'
		elseif is_opcion='A' then
			dw_lista.dataobject	= 'dw_lista_detalle_cuotas_mora_age_aum_his'
		end if

END CHOOSE
dw_lista.settransobject(sqlca)
dw_lista.retrieve(ld_fec_ini,ld_fec_fin,trim(ls_codigo),il_empresa,'V')
ls_texto								= wf_titulo(ls_columna)
dw_lista.object.c_titulo.text = ls_texto
dw_lista.setfilter(ls_filtro)
dw_lista.filter()
dw_lista.object.usuario.text 	= gs_user
end event

type cb_filtrar from commandbutton within w_muestra_detalle_cuota_hist
event clicked pbm_bnclicked
integer x = 41
integer y = 1888
integer width = 302
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_muestra_detalle_cuota_hist
event clicked pbm_bnclicked
integer x = 347
integer y = 1888
integer width = 302
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type cb_3 from commandbutton within w_muestra_detalle_cuota_hist
event clicked pbm_bnclicked
integer x = 654
integer y = 1888
integer width = 302
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	dw_lista.object.datawindow.print.Preview = true
	f_Print( dw_lista )
	dw_lista.object.datawindow.print.Preview = false	
end if
end event

type cb_consulta from commandbutton within w_muestra_detalle_cuota_hist
event clicked pbm_bnclicked
integer x = 1321
integer y = 1892
integer width = 302
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Histórico"
end type

event clicked;string ls_age, ls_sup, ls_string
if is_opcion='O' then
	ls_sup	= dw_lista.getitemstring(dw_lista.getrow(),'oferta_v_cod_sup')
	ls_age	= dw_lista.getitemstring(dw_lista.getrow(),'oferta_v_cod_age')
elseif is_opcion='A' then
	ls_sup	= dw_lista.getitemstring(dw_lista.getrow(),'anexo_aumento_cod_super')
	ls_age	= dw_lista.getitemstring(dw_lista.getrow(),'anexo_aumento_cod_agente')
end if
ls_string	= ls_age+'~t'+ls_sup
openwithparm(w_agente_info,ls_string)

end event

type cb_4 from commandbutton within w_muestra_detalle_cuota_hist
event clicked pbm_bnclicked
integer x = 1627
integer y = 1892
integer width = 421
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consulta Cta.Cte."
end type

event clicked;string tipo
string esta
if is_opcion='O' then
	gi_numero = dw_lista.getitemnumber(dw_lista.getrow(),'oferta_v_nro_oferta')
elseif is_opcion='A' then
	gi_numero = dw_lista.getitemnumber(dw_lista.getrow(),'anexo_aumento_nro_aumento')
end if
gi_tipo_busqueda = 8
Open(w_listado_contratos)
end event

type cb_1 from commandbutton within w_muestra_detalle_cuota_hist
integer x = 3141
integer y = 1892
integer width = 256
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type dw_lista from datawindow within w_muestra_detalle_cuota_hist
integer x = 41
integer y = 52
integer width = 3355
integer height = 1800
integer taborder = 70
string dataobject = "dw_lista_detalle_cuotas_mora_age_aum_his"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

