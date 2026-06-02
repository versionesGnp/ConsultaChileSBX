forward
global type w_muestra_detalle_gestion_ind from window
end type
type hpb_1 from hprogressbar within w_muestra_detalle_gestion_ind
end type
type st_porc from statictext within w_muestra_detalle_gestion_ind
end type
type st_fondo from statictext within w_muestra_detalle_gestion_ind
end type
type dw_lista_agente from datawindow within w_muestra_detalle_gestion_ind
end type
type dw_lista from datawindow within w_muestra_detalle_gestion_ind
end type
type st_cod_agente from statictext within w_muestra_detalle_gestion_ind
end type
type em_cod_age from editmask within w_muestra_detalle_gestion_ind
end type
type cb_sort from commandbutton within w_muestra_detalle_gestion_ind
end type
type cb_exportar from commandbutton within w_muestra_detalle_gestion_ind
end type
type cb_imprimir from commandbutton within w_muestra_detalle_gestion_ind
end type
type cb_salir from commandbutton within w_muestra_detalle_gestion_ind
end type
type st_volver from statictext within w_muestra_detalle_gestion_ind
end type
type dw_muestra from datawindow within w_muestra_detalle_gestion_ind
end type
end forward

global type w_muestra_detalle_gestion_ind from window
integer x = 110
integer y = 100
integer width = 3250
integer height = 2024
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
hpb_1 hpb_1
st_porc st_porc
st_fondo st_fondo
dw_lista_agente dw_lista_agente
dw_lista dw_lista
st_cod_agente st_cod_agente
em_cod_age em_cod_age
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_salir cb_salir
st_volver st_volver
dw_muestra dw_muestra
end type
global w_muestra_detalle_gestion_ind w_muestra_detalle_gestion_ind

type variables
datawindow dw_paso
Long il_empresa
string is_codigo, is_estado, is_conexion
Datetime	idt_fec_ini, idt_fec_fin
long il_cp00, il_cp01, il_cp02, il_cp03, il_cp04, il_cp05, il_cp06, il_cp07
long il_cp10, il_cp11, il_cp12, il_cp13, il_cp14, il_cp15, il_cp16, il_cp17
long il_cp20, il_cp21, il_cp22, il_cp23, il_cp24, il_cp25, il_cp26, il_cp27
long il_cp30, il_cp31, il_cp32, il_cp33, il_cp34, il_cp35, il_cp36, il_cp37
long il_cp40, il_cp41, il_cp42, il_cp43, il_cp44, il_cp45, il_cp46, il_cp47
long il_cp50, il_cp51, il_cp52, il_cp53, il_cp54, il_cp55, il_cp56, il_cp57
long il_cp60, il_cp61, il_cp62, il_cp63, il_cp64, il_cp65, il_cp66, il_cp67
long il_cp70, il_cp71, il_cp72, il_cp73, il_cp74, il_cp75, il_cp76, il_cp77
long il_cp80, il_cp81, il_cp82, il_cp83, il_cp84, il_cp85, il_cp86, il_cp87
long il_cp90, il_cp91, il_cp92, il_cp93, il_cp94, il_cp95, il_cp96, il_cp97
long il_cp100, il_cp101, il_cp102, il_cp103, il_cp104, il_cp105, il_cp106, il_cp107
long il_cp110, il_cp111, il_cp112, il_cp113, il_cp114, il_cp115, il_cp116, il_cp117
long il_cp120, il_cp121, il_cp122, il_cp123, il_cp124, il_cp125, il_cp126, il_cp127
long il_cp130, il_cp131, il_cp132, il_cp133, il_cp134, il_cp135, il_cp136, il_cp137
String is_nom_jefe, is_nom_sup, is_nom_age
String is_codigo_age, is_codigo_sup, is_codigo_jef, is_estado_age, is_estado_sup
String is_clasif, is_clasif_sup
Date id_fec_ini_age, id_fec_fin_age, id_fec_ini_sup, id_fec_fin_sup
Long il_rut_agente, il_rut_supervisor, il_rut_jefe, il_sw
end variables

forward prototypes
public subroutine wf_cargar_moras (integer al_fila)
public subroutine wf_contar_detalle (long al_nro_cuota, long al_nro_mora)
public subroutine wf_informe (datawindow adw_lista, datawindow adw_muestra)
public subroutine wf_inicializar_variables ()
public function string wf_muestra_detalle_cuotas (string as_columna)
public subroutine wf_rescatar_datos (datawindow adw_datos)
public subroutine wf_volver_sup ()
end prototypes

public subroutine wf_cargar_moras (integer al_fila);dw_muestra.setitem(al_fila,'cp00',il_cp00)
dw_muestra.setitem(al_fila,'cp01',il_cp01)
dw_muestra.setitem(al_fila,'cp02',il_cp02)
dw_muestra.setitem(al_fila,'cp03',il_cp03)
dw_muestra.setitem(al_fila,'cp04',il_cp04)
dw_muestra.setitem(al_fila,'cp05',il_cp05)
dw_muestra.setitem(al_fila,'cp06',il_cp06)
dw_muestra.setitem(al_fila,'cp07',il_cp07)

dw_muestra.setitem(al_fila,'cp10',il_cp10)
dw_muestra.setitem(al_fila,'cp11',il_cp11)
dw_muestra.setitem(al_fila,'cp12',il_cp12)
dw_muestra.setitem(al_fila,'cp13',il_cp13)
dw_muestra.setitem(al_fila,'cp14',il_cp14)
dw_muestra.setitem(al_fila,'cp15',il_cp15)
dw_muestra.setitem(al_fila,'cp16',il_cp16)
dw_muestra.setitem(al_fila,'cp17',il_cp17)

dw_muestra.setitem(al_fila,'cp20',il_cp20)
dw_muestra.setitem(al_fila,'cp21',il_cp21)
dw_muestra.setitem(al_fila,'cp22',il_cp22)
dw_muestra.setitem(al_fila,'cp23',il_cp23)
dw_muestra.setitem(al_fila,'cp24',il_cp24)
dw_muestra.setitem(al_fila,'cp25',il_cp25)
dw_muestra.setitem(al_fila,'cp26',il_cp26)
dw_muestra.setitem(al_fila,'cp27',il_cp27)

dw_muestra.setitem(al_fila,'cp30',il_cp30)
dw_muestra.setitem(al_fila,'cp31',il_cp31)
dw_muestra.setitem(al_fila,'cp32',il_cp32)
dw_muestra.setitem(al_fila,'cp33',il_cp33)
dw_muestra.setitem(al_fila,'cp34',il_cp34)
dw_muestra.setitem(al_fila,'cp35',il_cp35)
dw_muestra.setitem(al_fila,'cp36',il_cp36)
dw_muestra.setitem(al_fila,'cp37',il_cp37)

dw_muestra.setitem(al_fila,'cp40',il_cp40)
dw_muestra.setitem(al_fila,'cp41',il_cp41)
dw_muestra.setitem(al_fila,'cp42',il_cp42)
dw_muestra.setitem(al_fila,'cp43',il_cp43)
dw_muestra.setitem(al_fila,'cp44',il_cp44)
dw_muestra.setitem(al_fila,'cp45',il_cp45)
dw_muestra.setitem(al_fila,'cp46',il_cp46)
dw_muestra.setitem(al_fila,'cp47',il_cp47)

dw_muestra.setitem(al_fila,'cp50',il_cp50)
dw_muestra.setitem(al_fila,'cp51',il_cp51)
dw_muestra.setitem(al_fila,'cp52',il_cp52)
dw_muestra.setitem(al_fila,'cp53',il_cp53)
dw_muestra.setitem(al_fila,'cp54',il_cp54)
dw_muestra.setitem(al_fila,'cp55',il_cp55)
dw_muestra.setitem(al_fila,'cp56',il_cp56)
dw_muestra.setitem(al_fila,'cp57',il_cp57)

dw_muestra.setitem(al_fila,'cp60',il_cp60)
dw_muestra.setitem(al_fila,'cp61',il_cp61)
dw_muestra.setitem(al_fila,'cp62',il_cp62)
dw_muestra.setitem(al_fila,'cp63',il_cp63)
dw_muestra.setitem(al_fila,'cp64',il_cp64)
dw_muestra.setitem(al_fila,'cp65',il_cp65)
dw_muestra.setitem(al_fila,'cp66',il_cp66)
dw_muestra.setitem(al_fila,'cp67',il_cp67)

dw_muestra.setitem(al_fila,'cp70',il_cp70)
dw_muestra.setitem(al_fila,'cp71',il_cp71)
dw_muestra.setitem(al_fila,'cp72',il_cp72)
dw_muestra.setitem(al_fila,'cp73',il_cp73)
dw_muestra.setitem(al_fila,'cp74',il_cp74)
dw_muestra.setitem(al_fila,'cp75',il_cp75)
dw_muestra.setitem(al_fila,'cp76',il_cp76)
dw_muestra.setitem(al_fila,'cp77',il_cp77)

dw_muestra.setitem(al_fila,'cp80',il_cp80)
dw_muestra.setitem(al_fila,'cp81',il_cp81)
dw_muestra.setitem(al_fila,'cp82',il_cp82)
dw_muestra.setitem(al_fila,'cp83',il_cp83)
dw_muestra.setitem(al_fila,'cp84',il_cp84)
dw_muestra.setitem(al_fila,'cp85',il_cp85)
dw_muestra.setitem(al_fila,'cp86',il_cp86)
dw_muestra.setitem(al_fila,'cp87',il_cp87)

dw_muestra.setitem(al_fila,'cp90',il_cp90)
dw_muestra.setitem(al_fila,'cp91',il_cp91)
dw_muestra.setitem(al_fila,'cp92',il_cp92)
dw_muestra.setitem(al_fila,'cp93',il_cp93)
dw_muestra.setitem(al_fila,'cp94',il_cp94)
dw_muestra.setitem(al_fila,'cp95',il_cp95)
dw_muestra.setitem(al_fila,'cp96',il_cp96)
dw_muestra.setitem(al_fila,'cp97',il_cp97)

dw_muestra.setitem(al_fila,'cp100',il_cp100)
dw_muestra.setitem(al_fila,'cp101',il_cp101)
dw_muestra.setitem(al_fila,'cp102',il_cp102)
dw_muestra.setitem(al_fila,'cp103',il_cp103)
dw_muestra.setitem(al_fila,'cp104',il_cp104)
dw_muestra.setitem(al_fila,'cp105',il_cp105)
dw_muestra.setitem(al_fila,'cp106',il_cp106)
dw_muestra.setitem(al_fila,'cp107',il_cp107)

dw_muestra.setitem(al_fila,'cp110',il_cp110)
dw_muestra.setitem(al_fila,'cp111',il_cp111)
dw_muestra.setitem(al_fila,'cp112',il_cp112)
dw_muestra.setitem(al_fila,'cp113',il_cp113)
dw_muestra.setitem(al_fila,'cp114',il_cp114)
dw_muestra.setitem(al_fila,'cp115',il_cp115)
dw_muestra.setitem(al_fila,'cp116',il_cp116)
dw_muestra.setitem(al_fila,'cp117',il_cp117)

dw_muestra.setitem(al_fila,'cp120',il_cp120)
dw_muestra.setitem(al_fila,'cp121',il_cp121)
dw_muestra.setitem(al_fila,'cp122',il_cp122)
dw_muestra.setitem(al_fila,'cp123',il_cp123)
dw_muestra.setitem(al_fila,'cp124',il_cp124)
dw_muestra.setitem(al_fila,'cp125',il_cp125)
dw_muestra.setitem(al_fila,'cp126',il_cp126)
dw_muestra.setitem(al_fila,'cp127',il_cp127)

dw_muestra.setitem(al_fila,'cp130',il_cp130)
dw_muestra.setitem(al_fila,'cp131',il_cp131)
dw_muestra.setitem(al_fila,'cp132',il_cp132)
dw_muestra.setitem(al_fila,'cp133',il_cp133)
dw_muestra.setitem(al_fila,'cp134',il_cp134)
dw_muestra.setitem(al_fila,'cp135',il_cp135)
dw_muestra.setitem(al_fila,'cp136',il_cp136)
dw_muestra.setitem(al_fila,'cp137',il_cp137)
dw_muestra.setitem(al_fila,'empresa',il_empresa)
dw_muestra.object.usuario.text = gs_user
dw_muestra.setitem(al_fila,'fecha_ini',date(gd_fecha_inicio))
dw_muestra.setitem(al_fila,'fecha_fin',date(gd_fecha_fin))
if dw_muestra.dataobject = 'dw_informe_external_supervisor' then dw_muestra.object.codigo_t.text = 'Supervisor'
if dw_muestra.dataobject = 'dw_informe_external_agente' then dw_muestra.object.codigo_t.text = 'Agente'
dw_muestra.setitem(al_fila,'codigo',is_codigo_sup)
dw_muestra.setitem(al_fila,'nombre',is_nom_sup)
dw_muestra.setitem(al_fila,'estado',is_estado_sup)

end subroutine

public subroutine wf_contar_detalle (long al_nro_cuota, long al_nro_mora);	CHOOSE CASE al_nro_mora
		CASE 0
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp00 ++
				CASE 1
					il_cp01 ++
				CASE 2
					il_cp02 ++
				CASE 3
					il_cp03 ++
				CASE 4
					il_cp04 ++
				CASE 5
					il_cp05 ++
				CASE 6
					il_cp06 ++
				CASE ELSE
					il_cp07 ++
			END CHOOSE
		CASE 1
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp10 ++
				CASE 1
					il_cp11 ++
				CASE 2
					il_cp12 ++
				CASE 3
					il_cp13 ++
				CASE 4
					il_cp14 ++
				CASE 5
					il_cp15 ++
				CASE 6
					il_cp16 ++
				CASE ELSE
					il_cp17 ++
			END CHOOSE
		CASE 2
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp20 ++
				CASE 1
					il_cp21 ++
				CASE 2
					il_cp22 ++
				CASE 3
					il_cp23 ++
				CASE 4
					il_cp24 ++
				CASE 5
					il_cp25 ++
				CASE 6
					il_cp26 ++
				CASE ELSE
					il_cp27 ++
			END CHOOSE
		CASE 3
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp30 ++
				CASE 1
					il_cp31 ++
				CASE 2
					il_cp32 ++
				CASE 3
					il_cp33 ++
				CASE 4
					il_cp34 ++
				CASE 5
					il_cp35 ++
				CASE 6
					il_cp36 ++
				CASE ELSE
					il_cp37 ++
			END CHOOSE
		CASE 4
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp40 ++
				CASE 1
					il_cp41 ++
				CASE 2
					il_cp42 ++
				CASE 3
					il_cp43 ++
				CASE 4
					il_cp44 ++
				CASE 5
					il_cp45 ++
				CASE 6
					il_cp46 ++
				CASE ELSE
					il_cp47 ++
			END CHOOSE
		CASE 5
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp50 ++
				CASE 1
					il_cp51 ++
				CASE 2
					il_cp52 ++
				CASE 3
					il_cp53 ++
				CASE 4
					il_cp54 ++
				CASE 5
					il_cp55 ++
				CASE 6
					il_cp56 ++
				CASE ELSE
					il_cp57 ++
			END CHOOSE
		CASE 6
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp60 ++
				CASE 1
					il_cp61 ++
				CASE 2
					il_cp62 ++
				CASE 3
					il_cp63 ++
				CASE 4
					il_cp64 ++
				CASE 5
					il_cp65 ++
				CASE 6
					il_cp66 ++
				CASE ELSE
					il_cp67 ++
			END CHOOSE
		CASE 7
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp70 ++
				CASE 1
					il_cp71 ++
				CASE 2
					il_cp72 ++
				CASE 3
					il_cp73 ++
				CASE 4
					il_cp74 ++
				CASE 5
					il_cp75 ++
				CASE 6
					il_cp76 ++
				CASE ELSE
					il_cp77 ++
			END CHOOSE
		CASE 8
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp80 ++
				CASE 1
					il_cp81 ++
				CASE 2
					il_cp82 ++
				CASE 3
					il_cp83 ++
				CASE 4
					il_cp84 ++
				CASE 5
					il_cp85 ++
				CASE 6
					il_cp86 ++
				CASE ELSE
					il_cp87 ++
			END CHOOSE
		CASE 9
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp90 ++
				CASE 1
					il_cp91 ++
				CASE 2
					il_cp92 ++
				CASE 3
					il_cp93 ++
				CASE 4
					il_cp94 ++
				CASE 5
					il_cp95 ++
				CASE 6
					il_cp96 ++
				CASE ELSE
					il_cp97 ++
			END CHOOSE
		CASE 10
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp100 ++
				CASE 1
					il_cp101 ++
				CASE 2
					il_cp102 ++
				CASE 3
					il_cp103 ++
				CASE 4
					il_cp104 ++
				CASE 5
					il_cp105 ++
				CASE 6
					il_cp106 ++
				CASE ELSE
					il_cp107 ++
			END CHOOSE
		CASE 11
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp110 ++
				CASE 1
					il_cp111 ++
				CASE 2
					il_cp112 ++
				CASE 3
					il_cp113 ++
				CASE 4
					il_cp114 ++
				CASE 5
					il_cp115 ++
				CASE 6
					il_cp116 ++
				CASE ELSE
					il_cp117 ++
			END CHOOSE
		CASE 12
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp120 ++
				CASE 1
					il_cp121 ++
				CASE 2
					il_cp122 ++
				CASE 3
					il_cp123 ++
				CASE 4
					il_cp124 ++
				CASE 5
					il_cp125 ++
				CASE 6
					il_cp126 ++
				CASE ELSE
					il_cp127 ++
			END CHOOSE
		CASE ELSE
			CHOOSE CASE al_nro_cuota
				CASE 0
					il_cp130 ++
				CASE 1
					il_cp131 ++
				CASE 2
					il_cp132 ++
				CASE 3
					il_cp133 ++
				CASE 4
					il_cp134 ++
				CASE 5
					il_cp135 ++
				CASE 6
					il_cp136 ++
				CASE ELSE
					il_cp137 ++
			END CHOOSE
	END CHOOSE
end subroutine

public subroutine wf_informe (datawindow adw_lista, datawindow adw_muestra);long 		ll_tot_reg, ll_indi, ll_tot_porc, ll_tot_porc_aux
Long		ll_cant_mora, ll_tot_cuotas_p
Int		li_new
String	ls_estado_cont
SetPointer(HourGlass!)
ll_tot_reg	= adw_lista.rowcount()
ll_cant_mora=0; ll_tot_cuotas_p=0
ll_tot_porc=0;ll_tot_porc_aux=0
wf_inicializar_variables()
st_fondo.visible	= true
hpb_1.visible 		= true
st_porc.visible 	= true
hpb_1.Position		= ll_tot_porc
for ll_indi = 1 to ll_tot_reg
	ls_estado_cont		= adw_lista.getitemstring(ll_indi,'cadena_estado')
	ll_cant_mora		= adw_lista.getitemNumber(ll_indi,'funcion_mora')
	ll_tot_cuotas_p	= adw_lista.getitemNumber(ll_indi,'oferta_v_cta_pag_s')
	if ls_estado_cont='V' then wf_contar_detalle(ll_tot_cuotas_p,ll_cant_mora)
	if ll_tot_porc <> ll_tot_porc_aux then 
		st_porc.text		= string(ll_tot_porc)+" %"
		ll_tot_porc_aux	= ll_tot_porc
	end if
	ll_tot_porc		= 100 - (ll_tot_reg / ll_indi)
	hpb_1.Position = ll_tot_porc
next
st_fondo.visible	= false
hpb_1.visible 		= false
st_porc.visible 	= false
li_new	= adw_muestra.insertrow(0)
adw_muestra.scrolltorow(li_new)
if adw_muestra.dataobject = 'dw_informe_external_agente' or adw_muestra.dataobject = 'dw_informe_external_supervisor' then
	wf_cargar_moras(li_new)
end if
SetPointer(Arrow!)
end subroutine

public subroutine wf_inicializar_variables ();il_cp00=0; il_cp01=0; il_cp02=0; il_cp03=0; il_cp04=0; il_cp05=0; il_cp06=0; il_cp07=0
il_cp10=0; il_cp11=0; il_cp12=0; il_cp13=0; il_cp14=0; il_cp15=0; il_cp16=0; il_cp17=0
il_cp20=0; il_cp21=0; il_cp22=0; il_cp23=0; il_cp24=0; il_cp25=0; il_cp26=0; il_cp27=0
il_cp30=0; il_cp31=0; il_cp32=0; il_cp33=0; il_cp34=0; il_cp35=0; il_cp36=0; il_cp37=0
il_cp40=0; il_cp41=0; il_cp42=0; il_cp43=0; il_cp44=0; il_cp45=0; il_cp46=0; il_cp47=0
il_cp50=0; il_cp51=0; il_cp52=0; il_cp53=0; il_cp54=0; il_cp55=0; il_cp56=0; il_cp57=0
il_cp60=0; il_cp61=0; il_cp62=0; il_cp63=0; il_cp64=0; il_cp65=0; il_cp66=0; il_cp67=0
il_cp70=0; il_cp71=0; il_cp72=0; il_cp73=0; il_cp74=0; il_cp75=0; il_cp76=0; il_cp77=0
il_cp80=0; il_cp81=0; il_cp82=0; il_cp83=0; il_cp84=0; il_cp85=0; il_cp86=0; il_cp87=0
il_cp90=0; il_cp91=0; il_cp92=0; il_cp93=0; il_cp94=0; il_cp95=0; il_cp96=0; il_cp97=0
il_cp100=0; il_cp101=0; il_cp102=0; il_cp103=0; il_cp104=0; il_cp105=0; il_cp106=0; il_cp107=0
il_cp110=0; il_cp111=0; il_cp112=0; il_cp113=0; il_cp114=0; il_cp115=0; il_cp116=0; il_cp117=0
il_cp120=0; il_cp121=0; il_cp122=0; il_cp123=0; il_cp124=0; il_cp125=0; il_cp126=0; il_cp127=0
il_cp130=0; il_cp131=0; il_cp132=0; il_cp133=0; il_cp134=0; il_cp135=0; il_cp136=0; il_cp137=0

end subroutine

public function string wf_muestra_detalle_cuotas (string as_columna);string	ls_formula
il_sw	= 0
CHOOSE CASE as_columna
	CASE 'c_tot_c0'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s = 0'
	CASE 'c_tot_c1'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s = 1'
	CASE 'c_tot_c2'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s = 2'
	CASE 'c_tot_c3'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s = 3'
	CASE 'c_tot_c4'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s = 4'
	CASE 'c_tot_c5'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s = 5'
	CASE 'c_tot_c6'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s = 6'
	CASE 'c_tot_c7'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_total'
		ls_formula	= 'funcion_mora > 0 and oferta_v_cta_pag_s >= 0'
		
	CASE 'cp00'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s = 0'
	CASE 'cp01'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s = 1'
	CASE 'cp02'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s = 2'
	CASE 'cp03'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s = 3'
	CASE 'cp04'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s = 4'
	CASE 'cp05'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s = 5'
	CASE 'cp06'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s = 6'
	CASE 'cp07'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_0'
		ls_formula	= 'funcion_mora = 0 and oferta_v_cta_pag_s >= 0'

	CASE 'cp10'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s = 0'
	CASE 'cp11'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s = 1'
	CASE 'cp12'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s = 2'
	CASE 'cp13'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s = 3'
	CASE 'cp14'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s = 4'
	CASE 'cp15'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s = 5'
	CASE 'cp16'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s = 6'
	CASE 'cp17'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_1'
		ls_formula	= 'funcion_mora = 1 and oferta_v_cta_pag_s >= 0'

	CASE 'cp20'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s = 0'
	CASE 'cp21'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s = 1'
	CASE 'cp22'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s = 2'
	CASE 'cp23'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s = 3'
	CASE 'cp24'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s = 4'
	CASE 'cp25'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s = 5'
	CASE 'cp26'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s = 6'
	CASE 'cp27'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_2'
		ls_formula	= 'funcion_mora = 2 and oferta_v_cta_pag_s >= 0'

	CASE 'cp30'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s = 0'
	CASE 'cp31'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s = 1'
	CASE 'cp32'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s = 2'
	CASE 'cp33'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s = 3'
	CASE 'cp34'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s = 4'
	CASE 'cp35'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s = 5'
	CASE 'cp36'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s = 6'
	CASE 'cp37'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_3'
		ls_formula	= 'funcion_mora = 3 and oferta_v_cta_pag_s = 0'

	CASE 'cp40'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s = 0'
	CASE 'cp41'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s = 1'
	CASE 'cp42'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s = 2'
	CASE 'cp43'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s = 3'
	CASE 'cp44'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s = 4'
	CASE 'cp45'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s = 5'
	CASE 'cp46'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s = 6'
	CASE 'cp47'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_4'
		ls_formula	= 'funcion_mora = 4 and oferta_v_cta_pag_s >= 0'

	CASE 'cp50'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s = 0'
	CASE 'cp51'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s = 1'
	CASE 'cp52'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s = 2'
	CASE 'cp53'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s = 3'
	CASE 'cp54'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s = 4'
	CASE 'cp55'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s = 5'
	CASE 'cp56'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s = 6'
	CASE 'cp57'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_5'
		ls_formula	= 'funcion_mora = 5 and oferta_v_cta_pag_s >= 0'

	CASE 'cp60'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s = 0'
	CASE 'cp61'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s = 1'
	CASE 'cp62'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s = 2'
	CASE 'cp63'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s = 3'
	CASE 'cp64'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s = 4'
	CASE 'cp65'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s = 5'
	CASE 'cp66'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s = 6'
	CASE 'cp67'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s >= 6'
	CASE 'c_tot_6'
		ls_formula	= 'funcion_mora = 6 and oferta_v_cta_pag_s >= 0'

	CASE 'cp70'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s = 0'
	CASE 'cp71'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s = 1'
	CASE 'cp72'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s = 2'
	CASE 'cp73'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s = 3'
	CASE 'cp74'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s = 4'
	CASE 'cp75'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s = 5'
	CASE 'cp76'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s = 6'
	CASE 'cp77'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_7'
		ls_formula	= 'funcion_mora = 7 and oferta_v_cta_pag_s >= 0'

	CASE 'cp80'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s = 0'
	CASE 'cp81'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s = 1'
	CASE 'cp82'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s = 2'
	CASE 'cp83'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s = 3'
	CASE 'cp84'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s = 4'
	CASE 'cp85'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s = 5'
	CASE 'cp86'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s = 6'
	CASE 'cp87'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_8'
		ls_formula	= 'funcion_mora = 8 and oferta_v_cta_pag_s >= 0'

	CASE 'cp90'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s = 0'
	CASE 'cp91'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s = 1'
	CASE 'cp92'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s = 2'
	CASE 'cp93'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s = 3'
	CASE 'cp94'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s = 4'
	CASE 'cp95'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s = 5'
	CASE 'cp96'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s = 6'
	CASE 'cp97'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_9'
		ls_formula	= 'funcion_mora = 9 and oferta_v_cta_pag_s >= 0'

	CASE 'cp100'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s = 0'
	CASE 'cp101'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s = 1'
	CASE 'cp102'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s = 2'
	CASE 'cp103'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s = 3'
	CASE 'cp104'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s = 4'
	CASE 'cp105'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s = 5'
	CASE 'cp106'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s = 6'
	CASE 'cp107'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_10'
		ls_formula	= 'funcion_mora = 10 and oferta_v_cta_pag_s >= 0'

	CASE 'cp110'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s = 0'
	CASE 'cp111'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s = 1'
	CASE 'cp112'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s = 2'
	CASE 'cp113'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s = 3'
	CASE 'cp114'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s = 4'
	CASE 'cp115'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s = 5'
	CASE 'cp116'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s = 6'
	CASE 'cp117'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_11'
		ls_formula	= 'funcion_mora = 11 and oferta_v_cta_pag_s >= 0'

	CASE 'cp120'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s = 0'
	CASE 'cp121'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s = 1'
	CASE 'cp122'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s = 2'
	CASE 'cp123'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s = 3'
	CASE 'cp124'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s = 4'
	CASE 'cp125'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s = 5'
	CASE 'cp126'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s = 6'
	CASE 'cp127'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_12'
		ls_formula	= 'funcion_mora = 12 and oferta_v_cta_pag_s >= 0'

	CASE 'cp130'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s = 0'
	CASE 'cp131'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s = 1'
	CASE 'cp132'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s = 2'
	CASE 'cp133'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s = 3'
	CASE 'cp134'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s = 4'
	CASE 'cp135'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s = 5'
	CASE 'cp136'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s = 6'
	CASE 'cp137'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s > 6'
	CASE 'c_tot_13'
		ls_formula	= 'funcion_mora > 12 and oferta_v_cta_pag_s >= 0'

END CHOOSE
if trim(ls_formula) = '' then il_sw = 1
return ls_formula
end function

public subroutine wf_rescatar_datos (datawindow adw_datos);is_nom_jefe			= adw_datos.getitemstring(1,'c_nom_jef')
is_nom_sup			= adw_datos.getitemstring(1,'c_nom_sup')
is_nom_age			= adw_datos.getitemstring(1,'c_nom_age')
id_fec_ini_age		= date(adw_datos.getitemdatetime(1,'agentes_fecha_ini'))
id_fec_fin_age		= date(adw_datos.getitemdatetime(1,'agentes_fecha_fin'))
id_fec_ini_sup		= date(adw_datos.getitemdatetime(1,'supervisor_fecha_ing'))
id_fec_fin_sup		= date(adw_datos.getitemdatetime(1,'supervisor_fecha_fin'))
is_codigo_age		= adw_datos.getitemstring(1,'agentes_cod_age')
is_codigo_sup		= adw_datos.getitemstring(1,'supervisor_cod_sup')
is_codigo_jef		= adw_datos.getitemstring(1,'jefe_ventas_jefe_ventas')
is_estado_age		= adw_datos.getitemstring(1,'agentes_estado')
is_estado_sup		= adw_datos.getitemstring(1,'supervisor_estado')
is_clasif			= adw_datos.getitemstring(1,'agentes_clasificacion')
is_clasif_sup		= adw_datos.getitemstring(1,'supervisor_clasifica')
il_rut_agente		= adw_datos.getitemNumber(1,'agentes_rut')
il_rut_supervisor	= adw_datos.getitemNumber(1,'supervisor_rut')
//il_rut_jefe			= adw_datos.getitemNumber(1,'jefe_ventas_rut')
end subroutine

public subroutine wf_volver_sup ();w_muestra_detalle_gestion_ind.title	= "Resumen Actual de Agentes por Supervisor"
dw_muestra.dataobject					= 'dw_resumen_promesas_por_gral_sup_ind'
dw_muestra.settransobject(sqlca)
dw_muestra.object.titulo.text 		= 'Informe Gestion Actual por Supervisor'
dw_muestra.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
dw_muestra.object.usuario.text 		= gs_user
em_cod_age.visible						= false
st_cod_agente.visible					= false
cb_salir.visible							= true
end subroutine

on w_muestra_detalle_gestion_ind.create
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.dw_lista_agente=create dw_lista_agente
this.dw_lista=create dw_lista
this.st_cod_agente=create st_cod_agente
this.em_cod_age=create em_cod_age
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_salir=create cb_salir
this.st_volver=create st_volver
this.dw_muestra=create dw_muestra
this.Control[]={this.hpb_1,&
this.st_porc,&
this.st_fondo,&
this.dw_lista_agente,&
this.dw_lista,&
this.st_cod_agente,&
this.em_cod_age,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_salir,&
this.st_volver,&
this.dw_muestra}
end on

on w_muestra_detalle_gestion_ind.destroy
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.dw_lista_agente)
destroy(this.dw_lista)
destroy(this.st_cod_agente)
destroy(this.em_cod_age)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_salir)
destroy(this.st_volver)
destroy(this.dw_muestra)
end on

event open;String ls_texto
gf_centrar(w_muestra_detalle_gestion_ind)
em_cod_age.visible		= false
st_cod_agente.visible	= false
st_volver.visible			= false
cb_sort.visible			= true
dw_lista.settransobject(sqlca)
dw_lista_agente.settransobject(sqlca)
ls_texto						= message.StringParm	
// ls_conexion	= datawindow 1=jefe 2=supervisor
is_conexion					= mid(ls_texto,1,1)
idt_fec_ini					= datetime(date(mid(ls_texto,2,10)),time(00:00:00))
idt_fec_fin					= datetime(date(mid(ls_texto,12,10)),time(00:00:00))
is_codigo					= TRIM(mid(ls_texto,22,5))
il_empresa					= long(mid(ls_texto,27,1))

if is_conexion = '1' then // jefe
	this.title					= "Resumen Actual de Agentes por Supervisor"
	dw_muestra.dataobject	= 'dw_resumen_promesas_por_gral_sup_ind'
	dw_muestra.settransobject(sqlca)
	dw_muestra.object.titulo.text = 'Informe Gestion Actual por Supervisor'
	if dw_muestra.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa) = 0 then 
		cb_salir.triggerevent(clicked!)
	end if
end if
if is_conexion = '2' then // agente
	this.title					= "Resumen Actual de Promesas por Agente"
	dw_muestra.dataobject	= 'dw_resumen_promesas_por_agente_ind'
	dw_muestra.settransobject(sqlca)
	dw_muestra.object.titulo.text = 'Informe Gestion Actual por Agente'
	if dw_muestra.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa) = 0 then 
		cb_salir.triggerevent(clicked!)
	end if
	cb_sort.visible			= false
end if
dw_muestra.object.usuario.text 	= gs_user
gs_ventana								= 'w_muestra_detalle_gestion_ind'
f_valida_objeto_1()
end event

type hpb_1 from hprogressbar within w_muestra_detalle_gestion_ind
boolean visible = false
integer x = 914
integer y = 1264
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_muestra_detalle_gestion_ind
boolean visible = false
integer x = 1454
integer y = 1184
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

type st_fondo from statictext within w_muestra_detalle_gestion_ind
boolean visible = false
integer x = 882
integer y = 1160
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

type dw_lista_agente from datawindow within w_muestra_detalle_gestion_ind
boolean visible = false
integer x = 1083
integer y = 1808
integer width = 238
integer height = 108
string dataobject = "dw_ofertas_periodo_agente_ind"
boolean livescroll = true
end type

type dw_lista from datawindow within w_muestra_detalle_gestion_ind
boolean visible = false
integer x = 2496
integer y = 1812
integer width = 238
integer height = 116
integer taborder = 60
string dataobject = "dw_ofertas_periodo_supervisor_ind"
boolean livescroll = true
end type

type st_cod_agente from statictext within w_muestra_detalle_gestion_ind
integer x = 1289
integer y = 1820
integer width = 471
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
boolean enabled = false
string text = "Ingrese Cód. Agente"
boolean focusrectangle = false
end type

type em_cod_age from editmask within w_muestra_detalle_gestion_ind
integer x = 1787
integer y = 1816
integer width = 411
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12639424
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#####"
string displaydata = "@"
end type

event modified;String	ls_string, ls_codi
Long		ll_nro_caracter, ll_row
if trim(this.text) <> '' then
	if gs_conexion = "Parque El Prado" then
		il_empresa = 1
	elseif gs_conexion = "Parque La Foresta" then
		il_empresa = 2
	elseif gs_conexion = "Parque Concepción" then
		il_empresa = 3
	end if	
	CHOOSE CASE dw_muestra.dataobject
		CASE 'dw_resumen_promesas_por_supervisor_ind'
			ll_row	= dw_muestra.Find("agentes_cod_age ='" +trim(this.text)+"'", 1, dw_muestra.RowCount())
			if ll_row > 0 then
				ls_string	= '2'
				ll_nro_caracter	= len(trim(this.text))
				ll_nro_caracter	= (5 - ll_nro_caracter)
				ls_codi				= trim(this.text) + space(ll_nro_caracter)
				ls_string			= ls_string+string(date(gd_fecha_inicio))+string(date(gd_fecha_fin))+ls_codi+string(il_empresa)
				OpenWithParm(w_muestra_detalle_gestion_agente_ind,ls_string)
			else
				messagebox("Advertencia","No existe Código")
			end if
	END CHOOSE
end if
end event

type cb_sort from commandbutton within w_muestra_detalle_gestion_ind
integer x = 681
integer y = 1808
integer width = 325
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
setnull (nulo)
dw_muestra.SETSORT(NULO)
dw_muestra.SORT()
end event

type cb_exportar from commandbutton within w_muestra_detalle_gestion_ind
event clicked pbm_bnclicked
integer x = 352
integer y = 1808
integer width = 325
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;dw_paso	= dw_muestra
if dw_muestra.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_muestra_detalle_gestion_ind
event clicked pbm_bnclicked
integer x = 37
integer y = 1808
integer width = 311
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_muestra.rowcount() > 0 then 
	dw_muestra.object.datawindow.print.Preview = true
	f_Print( dw_muestra)
	dw_muestra.object.datawindow.print.Preview = false	
end if
end event

type cb_salir from commandbutton within w_muestra_detalle_gestion_ind
integer x = 2926
integer y = 1808
integer width = 261
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(parent)
end event

type st_volver from statictext within w_muestra_detalle_gestion_ind
integer x = 2368
integer y = 1636
integer width = 256
integer height = 64
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Volver"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;this.visible	= false
wf_volver_sup()

end event

type dw_muestra from datawindow within w_muestra_detalle_gestion_ind
integer x = 37
integer y = 24
integer width = 3154
integer height = 1736
integer taborder = 10
string dataobject = "dw_resumen_promesas_por_gral_sup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna, ls_cadena, ls_colx
Int		li_new
Long		ll_nro_caracter
ls_columna	= dwo.name
if this.rowcount() > 0 then
	if this.dataobject = 'dw_resumen_promesas_por_gral_sup_ind' then
		f_color_titulo(dw_muestra,ls_columna)
		CHOOSE CASE ls_columna
			CASE 'c_grafico'
				if this.object.c_grafico.text = 'Mostrar Gráfico' then
					this.object.g_graf.Visible = 1
					this.object.c_grafico.text = 'Sacar Gráfico'
				else
					this.object.g_graf.Visible = 0
					this.object.c_grafico.text = 'Mostrar Gráfico'
				end if
			CASE 'c_rescomi'
				is_codigo_sup								= this.getitemstring(1,'supervisor_cod_sup')
				is_estado_sup								= this.getitemstring(1,'supervisor_estado')
				il_rut_supervisor							= this.getitemnumber(1,'supervisor_rut')
				is_nom_sup									= this.getitemstring(1,'nom_comp_sup')
				id_fec_ini_sup								= date(this.getitemdatetime(1,'supervisor_fecha_ing'))
				cb_salir.visible							= false
				dw_muestra.dataobject 					= 'dw_lista_res_comi_sup'
				dw_muestra.settransobject(sqlca)
				dw_muestra.retrieve(is_codigo_sup)
				dw_muestra.object.c_codigo.text		= is_codigo_sup
				dw_muestra.object.c_estado.text		= is_estado_sup
				dw_muestra.object.c_rut.text			= string(il_rut_supervisor)
				dw_muestra.object.c_nombre.text		= is_nom_sup
				dw_muestra.object.c_fecha_ini.text	= string(id_fec_ini_sup)
				st_volver.visible							= true
				
			CASE 'c_clasif'
				is_codigo_sup								= this.getitemstring(1,'supervisor_cod_sup')
				is_estado_sup								= this.getitemstring(1,'supervisor_estado')
				il_rut_supervisor							= this.getitemnumber(1,'supervisor_rut')
				is_nom_sup									= this.getitemstring(1,'nom_comp_sup')
				id_fec_ini_sup								= date(this.getitemdatetime(1,'supervisor_fecha_ing'))
				cb_salir.visible							= false
				dw_muestra.dataobject					= 'dw_lista_clasif_hist_sup' //superv
				dw_muestra.settransobject(sqlca)
				dw_muestra.retrieve(is_codigo_sup)
				dw_muestra.object.c_codigo.text		= is_codigo_sup
				dw_muestra.object.c_estado.text		= is_estado_sup
				dw_muestra.object.c_rut.text			= string(il_rut_supervisor)
				dw_muestra.object.c_nombre.text		= is_nom_sup
				dw_muestra.object.c_fecha_ini.text	= string(id_fec_ini_sup)
				st_volver.visible							= true
				
			CASE 'c_detalle'
				dw_muestra.dataobject	= 'dw_resumen_promesas_por_supervisor_ind'
				dw_muestra.settransobject(sqlca)
				dw_muestra.object.c_volver.visible = 0
				dw_muestra.object.titulo.text	= 'Resumen Actual de Agentes por Supervisor'
				em_cod_age.visible				= true
				st_cod_agente.visible			= true
				em_cod_age.text					= ''
				if dw_muestra.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa) = 0 then 
					messagebox("Advertencia","No registra dato")
					wf_volver_sup()
				else
					st_volver.visible				= true
					cb_salir.visible				= false
					em_cod_age.setfocus()
					ls_colx = dw_muestra.describe("fec_ing_t.x")
					dw_muestra.Modify("datawindow.horizontalscrollsplit=" + ls_colx)
					dw_muestra.object.usuario.text = gs_user
				end if
			CASE 'c_moras'
				dw_muestra.dataobject	= 'dw_informe_external_supervisor'
				dw_muestra.settransobject(sqlca)
				cb_salir.visible			= false
				if dw_lista.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa) > 0 then
					wf_rescatar_datos(dw_lista)
					wf_informe(dw_lista,dw_muestra)
				else
					messagebox("Advertencia","No se registran datos, en el periodo "+string(gd_fecha_inicio)+" al "+string(gd_fecha_inicio))
				end if
		
		END CHOOSE
	elseif this.dataobject = 'dw_informe_external_supervisor' then
		if ls_columna = 'c_volver' then
			cb_salir.visible			= true
			dw_muestra.dataobject	= 'dw_resumen_promesas_por_gral_sup_ind'
			dw_muestra.settransobject(sqlca)
			dw_muestra.object.titulo.text = 'Informe Gestion Actual por Supervisor'
			dw_muestra.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
			dw_muestra.object.usuario.text = gs_user
		end if
	elseif this.dataobject = 'dw_resumen_promesas_por_agente_ind' then
		f_color_titulo(dw_muestra,ls_columna)
		CHOOSE CASE ls_columna
			CASE 'c_grafico'
				if this.object.c_grafico.text = 'Mostrar Gráfico' then
					this.object.g_graf.Visible = 1
					this.object.c_grafico.text = 'Sacar Gráfico'
				else
					this.object.g_graf.Visible = 0
					this.object.c_grafico.text = 'Mostrar Gráfico'
				end if
				
			CASE 'c_moras'
				dw_muestra.dataobject	= 'dw_informe_external_agente'
				dw_muestra.settransobject(sqlca)
				cb_salir.visible			= false
				if dw_lista_agente.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa) > 0 then
					wf_rescatar_datos(dw_lista_agente)
					wf_informe(dw_lista_agente,dw_muestra)
				else
					messagebox("Advertencia","No se registran datos, en el periodo "+string(date(gd_fecha_inicio))+" al "+string(date(gd_fecha_inicio)))
				end if
		END CHOOSE
	elseif this.dataobject = 'dw_informe_external_agente' then
		if ls_columna = 'c_volver' then
			dw_muestra.dataobject	= 'dw_resumen_promesas_por_agente_ind'
			dw_muestra.settransobject(sqlca)
			dw_muestra.object.titulo.text = 'Informe Gestion Actual por Agente'
			dw_muestra.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
			dw_muestra.object.usuario.text = gs_user
			cb_sort.visible	= false
			cb_salir.visible	= true
		end if
	elseif this.dataobject = 'dw_resumen_promesas_por_supervisor_ind' then
		em_cod_age.setfocus()
	end if
end if
end event

event doubleclicked;String	ls_columna, ls_cadena, ls_formula
Int		li_new
Long		ll_nro_caracter, ll_valor
ls_columna	= dwo.name
if this.rowcount() > 0 then
	if this.dataobject = 'dw_resumen_promesas_por_gral_sup_ind' or dw_muestra.dataobject	= 'dw_resumen_promesas_por_agente_ind' then
		ll_nro_caracter	= len(trim(is_codigo))
		ll_nro_caracter	= (5 - ll_nro_caracter)
		is_codigo			= trim(is_codigo) + space(ll_nro_caracter)
		if dw_muestra.dataobject = 'dw_resumen_promesas_por_gral_sup_ind' then ls_cadena = '2'
		if dw_muestra.dataobject = 'dw_resumen_promesas_por_agente_ind' then	ls_cadena = '3'
		ls_cadena			= ls_cadena + is_codigo
		ls_cadena			= ls_cadena + string(date(gd_fecha_inicio)) + string(date(gd_fecha_fin))
		CHOOSE CASE ls_columna
			CASE 'ts_1','c_cien','tot_vtas_t'
				ls_cadena	= ls_cadena + '%'
				OpenWithParm(w_detalle_totales_individual, ls_cadena)
	
			CASE 'c_1_resc1','c_1_resc2','tot_nulas_n_t'
				ls_cadena	= ls_cadena + 'N'
				OpenWithParm(w_detalle_totales_individual, ls_cadena)
				
			CASE 'c_1_resueltas1','c_1_resueltas2','tot_resueltas_t'
				ls_cadena	= ls_cadena + 'R'
				OpenWithParm(w_detalle_totales_individual, ls_cadena)
				
			CASE 'c_1_reprog1','c_1_reprog2','tot_nulas_p_t'
				ls_cadena	= ls_cadena + 'P'
				OpenWithParm(w_detalle_totales_individual, ls_cadena)
			CASE 'c_1_cancel1','c_1_cancel2','tot_canceladas_t'
				ls_cadena	= ls_cadena + 'C'
				OpenWithParm(w_detalle_totales_individual, ls_cadena)
				
			CASE 'c_1_vigente1','c_1_vigente2','tot_vigentes_t'
				ls_cadena	= ls_cadena + 'V'
				OpenWithParm(w_detalle_totales_individual, ls_cadena)
				
			CASE 'age_al_dia1','age_al_dia2','tot_al_dia_t'
				ls_cadena	= ls_cadena + 'A'
				OpenWithParm(w_detalle_totales_individual, ls_cadena)
				
			CASE 'age_mora1','age_mora2','tot_en_mora_t'
				ls_cadena	= ls_cadena + 'M'
				OpenWithParm(w_detalle_totales_individual, ls_cadena)
			
		END CHOOSE
	elseif this.dataobject = 'dw_informe_external_supervisor' or this.dataobject = 'dw_informe_external_agente' then
		if mid(ls_columna,1,1) = 'c' then
			ll_valor					= this.getitemnumber(1,ls_columna)
			if ll_valor > 0 then
				ll_nro_caracter	= len(trim(is_codigo))
				ll_nro_caracter	= (5 - ll_nro_caracter)
				is_codigo			= trim(is_codigo) + space(ll_nro_caracter)
				if this.dataobject = 'dw_informe_external_supervisor' then ls_cadena = '2'
				if this.dataobject = 'dw_informe_external_agente' then	ls_cadena = '3'
				ls_cadena			= ls_cadena + is_codigo
				ls_cadena			= ls_cadena + string(date(gd_fecha_inicio)) + string(date(gd_fecha_fin))
				ls_formula			= wf_muestra_detalle_cuotas(ls_columna)
				ls_formula			= ls_formula+'~t'+ls_cadena+'~t'+ls_columna
				if il_sw = 0 then openwithparm(w_muestra_detalle_cuota_ind,ls_formula)
			end if
		end if
	elseif this.dataobject = 'dw_resumen_promesas_por_supervisor_ind' then
		em_cod_age.setfocus()
	end if
end if
end event

