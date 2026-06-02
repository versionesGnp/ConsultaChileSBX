forward
global type w_inf_gestion from window
end type
type rb_aumento from radiobutton within w_inf_gestion
end type
type rb_promesas from radiobutton within w_inf_gestion
end type
type st_licencias from statictext within w_inf_gestion
end type
type pb_licencias from picturebutton within w_inf_gestion
end type
type st_detalle from statictext within w_inf_gestion
end type
type cb_cancelar_preg from commandbutton within w_inf_gestion
end type
type cb_aceptar_preg from commandbutton within w_inf_gestion
end type
type rb_con_ventas from radiobutton within w_inf_gestion
end type
type rb_todos from radiobutton within w_inf_gestion
end type
type rb_inactivo from radiobutton within w_inf_gestion
end type
type rb_activo from radiobutton within w_inf_gestion
end type
type st_filtrar from statictext within w_inf_gestion
end type
type st_ordenar from statictext within w_inf_gestion
end type
type st_agentes_general from statictext within w_inf_gestion
end type
type st_exportar from statictext within w_inf_gestion
end type
type st_procesar from statictext within w_inf_gestion
end type
type pb_filtrar from picturebutton within w_inf_gestion
end type
type dw_general from datawindow within w_inf_gestion
end type
type pb_general from picturebutton within w_inf_gestion
end type
type st_grupo from statictext within w_inf_gestion
end type
type pb_ordenar from picturebutton within w_inf_gestion
end type
type pb_exportar from picturebutton within w_inf_gestion
end type
type pb_aceptar from picturebutton within w_inf_gestion
end type
type pb_imprimir from picturebutton within w_inf_gestion
end type
type pb_salir from picturebutton within w_inf_gestion
end type
type dw_detalle from datawindow within w_inf_gestion
end type
type st_nombre from statictext within w_inf_gestion
end type
type pb_buscar from picturebutton within w_inf_gestion
end type
type em_codigo from editmask within w_inf_gestion
end type
type em_1 from editmask within w_inf_gestion
end type
type p_1 from picture within w_inf_gestion
end type
type em_2 from editmask within w_inf_gestion
end type
type p_2 from picture within w_inf_gestion
end type
type st_1 from statictext within w_inf_gestion
end type
type st_2 from statictext within w_inf_gestion
end type
type rb_agente from radiobutton within w_inf_gestion
end type
type rb_supervisor from radiobutton within w_inf_gestion
end type
type rb_jefe from radiobutton within w_inf_gestion
end type
type dw_lista from datawindow within w_inf_gestion
end type
type gb_2 from groupbox within w_inf_gestion
end type
type gb_1 from groupbox within w_inf_gestion
end type
type em_grupo from editmask within w_inf_gestion
end type
type gb_3 from groupbox within w_inf_gestion
end type
type st_porc from statictext within w_inf_gestion
end type
type hpb_1 from hprogressbar within w_inf_gestion
end type
type st_fondo from statictext within w_inf_gestion
end type
type st_volver from statictext within w_inf_gestion
end type
type st_imprimir from statictext within w_inf_gestion
end type
type st_fondo_pregunta from statictext within w_inf_gestion
end type
type dw_informe from datawindow within w_inf_gestion
end type
type dw_sin_detalle from datawindow within w_inf_gestion
end type
type gb_4 from groupbox within w_inf_gestion
end type
end forward

global type w_inf_gestion from window
integer x = 82
integer y = 84
integer width = 3387
integer height = 2248
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
rb_aumento rb_aumento
rb_promesas rb_promesas
st_licencias st_licencias
pb_licencias pb_licencias
st_detalle st_detalle
cb_cancelar_preg cb_cancelar_preg
cb_aceptar_preg cb_aceptar_preg
rb_con_ventas rb_con_ventas
rb_todos rb_todos
rb_inactivo rb_inactivo
rb_activo rb_activo
st_filtrar st_filtrar
st_ordenar st_ordenar
st_agentes_general st_agentes_general
st_exportar st_exportar
st_procesar st_procesar
pb_filtrar pb_filtrar
dw_general dw_general
pb_general pb_general
st_grupo st_grupo
pb_ordenar pb_ordenar
pb_exportar pb_exportar
pb_aceptar pb_aceptar
pb_imprimir pb_imprimir
pb_salir pb_salir
dw_detalle dw_detalle
st_nombre st_nombre
pb_buscar pb_buscar
em_codigo em_codigo
em_1 em_1
p_1 p_1
em_2 em_2
p_2 p_2
st_1 st_1
st_2 st_2
rb_agente rb_agente
rb_supervisor rb_supervisor
rb_jefe rb_jefe
dw_lista dw_lista
gb_2 gb_2
gb_1 gb_1
em_grupo em_grupo
gb_3 gb_3
st_porc st_porc
hpb_1 hpb_1
st_fondo st_fondo
st_volver st_volver
st_imprimir st_imprimir
st_fondo_pregunta st_fondo_pregunta
dw_informe dw_informe
dw_sin_detalle dw_sin_detalle
gb_4 gb_4
end type
global w_inf_gestion w_inf_gestion

type variables
Datawindow dw_paso
Date id_fec_ini_age, id_fec_fin_age, id_fec_ini_sup
Date id_fec_fin_sup
String is_codigo_age, is_codigo_sup, is_codigo_jef,is_cod_ejec
String is_estado_age, is_estado_sup, is_moneda
String is_codigo, is_ventana, is_nom_age, is_nom_sup
String is_nom_jefe, is_clasif, is_clasif_sup
String is_estado_cont, is_cod_jefe, is_cod_supervisor, is_cod_agente
Long il_empresa, il_row, il_rut_agente, il_rut_supervisor, il_rut_jefe
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
Long il_cant_mora, il_tot_v, il_tot_r, il_tot_n, il_tot_p, il_tot_c
Long il_tot_dia, il_tot_mora, il_tot_cuotas_p, il_sw
Long il_tot_uf_promesas, il_tot_uf_resc, il_tot_uf_res, il_tot_uf_rep, il_tot_uf_canc
Long il_tot_uf_vig, il_tot_uf_dia, il_tot_uf_mora
Long il_po_precio
end variables

forward prototypes
public subroutine wf_rescatar_datos (datawindow adw_lista, long al_fila)
public subroutine wf_cargar_jefe (datawindow adw_informe, long al_fila)
public subroutine wf_cargar_supervisor (datawindow adw_informe, long al_fila)
public subroutine wf_contar_detalle (long al_nro_mora, long al_nro_cuota)
public subroutine wf_inicializar_variables ()
public subroutine wf_cargar_moras (integer al_fila)
public subroutine wf_cargar_agente (datawindow adw_informe, long al_fila)
public subroutine wf_cargar_gestion1 (datawindow adw_informe)
public function string wf_muestra_detalle_cuotas (string as_columna)
public subroutine wf_informe (datawindow adw_detalle, string as_ventana, datawindow adw_informe)
end prototypes

public subroutine wf_rescatar_datos (datawindow adw_lista, long al_fila);is_nom_jefe		= dw_lista.getitemstring(al_fila,'c_nom_jefe')
is_nom_sup		= dw_lista.getitemstring(al_fila,'c_nom_sup')
is_nom_age		= dw_lista.getitemstring(al_fila,'c_nom_age')
id_fec_ini_age	= date(dw_lista.getitemdatetime(al_fila,'agentes_fecha_ini'))
id_fec_fin_age	= date(dw_lista.getitemdatetime(al_fila,'agentes_fecha_fin'))
id_fec_ini_sup	= date(dw_lista.getitemdatetime(al_fila,'supervisor_fecha_ing'))
id_fec_fin_sup	= date(dw_lista.getitemdatetime(al_fila,'supervisor_fecha_fin'))
is_codigo_age	= dw_lista.getitemstring(al_fila,'agentes_cod_age')
is_codigo_sup	= dw_lista.getitemstring(al_fila,'supervisor_cod_sup')
is_codigo_jef	= dw_lista.getitemstring(al_fila,'jefe_ventas_jefe_ventas')
is_estado_age	= dw_lista.getitemstring(al_fila,'agentes_estado')
is_estado_sup	= dw_lista.getitemstring(al_fila,'supervisor_estado')
is_clasif		= dw_lista.getitemstring(al_fila,'agentes_clasificacion')
is_clasif_sup	= dw_lista.getitemstring(al_fila,'supervisor_clasifica')
il_rut_agente	= dw_lista.getitemNumber(al_fila,'agentes_rut')
il_rut_supervisor	= dw_lista.getitemNumber(al_fila,'supervisor_rut')
il_rut_jefe		= dw_lista.getitemNumber(al_fila,'jefe_ventas_rut')
end subroutine

public subroutine wf_cargar_jefe (datawindow adw_informe, long al_fila);adw_informe.setitem(al_fila,'cod_jefe',is_nom_jefe)
adw_informe.setitem(al_fila,'codigo_jef',is_codigo_jef)
adw_informe.setitem(al_fila,'cod_supervisor','XXX')
adw_informe.setitem(al_fila,'fecha_ini_sup',date("00/00/0000"))
adw_informe.setitem(al_fila,'fecha_fin_sup',date("00/00/0000"))
adw_informe.setitem(al_fila,'codigo_sup','XXX')
adw_informe.setitem(al_fila,'estado_sup','XXX')		
adw_informe.setitem(al_fila,'clasi_sup','XXX')
adw_informe.setitem(al_fila,'cod_agente','XXX')
adw_informe.setitem(al_fila,'fecha_ini_age',date("00/00/0000"))
adw_informe.setitem(al_fila,'fecha_fin_age',date("00/00/0000"))
adw_informe.setitem(al_fila,'codigo_age','XXX')
adw_informe.setitem(al_fila,'estado_age','XXX')
adw_informe.setitem(al_fila,'clasificacion',"XXX")
end subroutine

public subroutine wf_cargar_supervisor (datawindow adw_informe, long al_fila);adw_informe.setitem(al_fila,'cod_jefe',is_nom_jefe)
adw_informe.setitem(al_fila,'codigo_jef',is_codigo_jef)
adw_informe.setitem(al_fila,'fecha_ini_sup',id_fec_ini_sup)
adw_informe.setitem(al_fila,'fecha_fin_sup',id_fec_fin_sup)
adw_informe.setitem(al_fila,'codigo_sup',is_codigo_sup)
adw_informe.setitem(al_fila,'cod_supervisor',is_nom_sup)
adw_informe.setitem(al_fila,'estado_sup',is_estado_sup)	
adw_informe.setitem(al_fila,'clasi_sup',is_clasif_sup) //falta
adw_informe.setitem(al_fila,'cod_agente','XXX')
adw_informe.setitem(al_fila,'fecha_ini_age',date("00/00/0000"))
adw_informe.setitem(al_fila,'fecha_fin_age',date("00/00/0000"))
adw_informe.setitem(al_fila,'codigo_age','XXX')
adw_informe.setitem(al_fila,'estado_age','XXX')
adw_informe.setitem(al_fila,'clasificacion','XXX')
end subroutine

public subroutine wf_contar_detalle (long al_nro_mora, long al_nro_cuota);	CHOOSE CASE al_nro_mora
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
il_cant_mora=0; il_tot_v=0; il_tot_r=0; il_tot_n=0; il_tot_p=0; il_tot_c=0
il_tot_dia=0; il_tot_mora=0; il_tot_cuotas_p=0
il_tot_v=0; il_tot_r=0; il_tot_n=0; il_tot_p=0; il_tot_c=0;il_tot_uf_dia=0;il_tot_mora=0
il_tot_uf_promesas=0;il_tot_uf_resc=0;il_tot_uf_res=0;il_tot_uf_rep=0;il_tot_uf_canc=0
il_tot_uf_vig=0;il_tot_uf_dia=0;Il_tot_uf_mora=0
end subroutine

public subroutine wf_cargar_moras (integer al_fila);dw_informe.setitem(al_fila,'cp00',il_cp00)
dw_informe.setitem(al_fila,'cp01',il_cp01)
dw_informe.setitem(al_fila,'cp02',il_cp02)
dw_informe.setitem(al_fila,'cp03',il_cp03)
dw_informe.setitem(al_fila,'cp04',il_cp04)
dw_informe.setitem(al_fila,'cp05',il_cp05)
dw_informe.setitem(al_fila,'cp06',il_cp06)
dw_informe.setitem(al_fila,'cp07',il_cp07)

dw_informe.setitem(al_fila,'cp10',il_cp10)
dw_informe.setitem(al_fila,'cp11',il_cp11)
dw_informe.setitem(al_fila,'cp12',il_cp12)
dw_informe.setitem(al_fila,'cp13',il_cp13)
dw_informe.setitem(al_fila,'cp14',il_cp14)
dw_informe.setitem(al_fila,'cp15',il_cp15)
dw_informe.setitem(al_fila,'cp16',il_cp16)
dw_informe.setitem(al_fila,'cp17',il_cp17)

dw_informe.setitem(al_fila,'cp20',il_cp20)
dw_informe.setitem(al_fila,'cp21',il_cp21)
dw_informe.setitem(al_fila,'cp22',il_cp22)
dw_informe.setitem(al_fila,'cp23',il_cp23)
dw_informe.setitem(al_fila,'cp24',il_cp24)
dw_informe.setitem(al_fila,'cp25',il_cp25)
dw_informe.setitem(al_fila,'cp26',il_cp26)
dw_informe.setitem(al_fila,'cp27',il_cp27)

dw_informe.setitem(al_fila,'cp30',il_cp30)
dw_informe.setitem(al_fila,'cp31',il_cp31)
dw_informe.setitem(al_fila,'cp32',il_cp32)
dw_informe.setitem(al_fila,'cp33',il_cp33)
dw_informe.setitem(al_fila,'cp34',il_cp34)
dw_informe.setitem(al_fila,'cp35',il_cp35)
dw_informe.setitem(al_fila,'cp36',il_cp36)
dw_informe.setitem(al_fila,'cp37',il_cp37)

dw_informe.setitem(al_fila,'cp40',il_cp40)
dw_informe.setitem(al_fila,'cp41',il_cp41)
dw_informe.setitem(al_fila,'cp42',il_cp42)
dw_informe.setitem(al_fila,'cp43',il_cp43)
dw_informe.setitem(al_fila,'cp44',il_cp44)
dw_informe.setitem(al_fila,'cp45',il_cp45)
dw_informe.setitem(al_fila,'cp46',il_cp46)
dw_informe.setitem(al_fila,'cp47',il_cp47)

dw_informe.setitem(al_fila,'cp50',il_cp50)
dw_informe.setitem(al_fila,'cp51',il_cp51)
dw_informe.setitem(al_fila,'cp52',il_cp52)
dw_informe.setitem(al_fila,'cp53',il_cp53)
dw_informe.setitem(al_fila,'cp54',il_cp54)
dw_informe.setitem(al_fila,'cp55',il_cp55)
dw_informe.setitem(al_fila,'cp56',il_cp56)
dw_informe.setitem(al_fila,'cp57',il_cp57)

dw_informe.setitem(al_fila,'cp60',il_cp60)
dw_informe.setitem(al_fila,'cp61',il_cp61)
dw_informe.setitem(al_fila,'cp62',il_cp62)
dw_informe.setitem(al_fila,'cp63',il_cp63)
dw_informe.setitem(al_fila,'cp64',il_cp64)
dw_informe.setitem(al_fila,'cp65',il_cp65)
dw_informe.setitem(al_fila,'cp66',il_cp66)
dw_informe.setitem(al_fila,'cp67',il_cp67)

dw_informe.setitem(al_fila,'cp70',il_cp70)
dw_informe.setitem(al_fila,'cp71',il_cp71)
dw_informe.setitem(al_fila,'cp72',il_cp72)
dw_informe.setitem(al_fila,'cp73',il_cp73)
dw_informe.setitem(al_fila,'cp74',il_cp74)
dw_informe.setitem(al_fila,'cp75',il_cp75)
dw_informe.setitem(al_fila,'cp76',il_cp76)
dw_informe.setitem(al_fila,'cp77',il_cp77)

dw_informe.setitem(al_fila,'cp80',il_cp80)
dw_informe.setitem(al_fila,'cp81',il_cp81)
dw_informe.setitem(al_fila,'cp82',il_cp82)
dw_informe.setitem(al_fila,'cp83',il_cp83)
dw_informe.setitem(al_fila,'cp84',il_cp84)
dw_informe.setitem(al_fila,'cp85',il_cp85)
dw_informe.setitem(al_fila,'cp86',il_cp86)
dw_informe.setitem(al_fila,'cp87',il_cp87)

dw_informe.setitem(al_fila,'cp90',il_cp90)
dw_informe.setitem(al_fila,'cp91',il_cp91)
dw_informe.setitem(al_fila,'cp92',il_cp92)
dw_informe.setitem(al_fila,'cp93',il_cp93)
dw_informe.setitem(al_fila,'cp94',il_cp94)
dw_informe.setitem(al_fila,'cp95',il_cp95)
dw_informe.setitem(al_fila,'cp96',il_cp96)
dw_informe.setitem(al_fila,'cp97',il_cp97)

dw_informe.setitem(al_fila,'cp100',il_cp100)
dw_informe.setitem(al_fila,'cp101',il_cp101)
dw_informe.setitem(al_fila,'cp102',il_cp102)
dw_informe.setitem(al_fila,'cp103',il_cp103)
dw_informe.setitem(al_fila,'cp104',il_cp104)
dw_informe.setitem(al_fila,'cp105',il_cp105)
dw_informe.setitem(al_fila,'cp106',il_cp106)
dw_informe.setitem(al_fila,'cp107',il_cp107)

dw_informe.setitem(al_fila,'cp110',il_cp110)
dw_informe.setitem(al_fila,'cp111',il_cp111)
dw_informe.setitem(al_fila,'cp112',il_cp112)
dw_informe.setitem(al_fila,'cp113',il_cp113)
dw_informe.setitem(al_fila,'cp114',il_cp114)
dw_informe.setitem(al_fila,'cp115',il_cp115)
dw_informe.setitem(al_fila,'cp116',il_cp116)
dw_informe.setitem(al_fila,'cp117',il_cp117)

dw_informe.setitem(al_fila,'cp120',il_cp120)
dw_informe.setitem(al_fila,'cp121',il_cp121)
dw_informe.setitem(al_fila,'cp122',il_cp122)
dw_informe.setitem(al_fila,'cp123',il_cp123)
dw_informe.setitem(al_fila,'cp124',il_cp124)
dw_informe.setitem(al_fila,'cp125',il_cp125)
dw_informe.setitem(al_fila,'cp126',il_cp126)
dw_informe.setitem(al_fila,'cp127',il_cp127)

dw_informe.setitem(al_fila,'cp130',il_cp130)
dw_informe.setitem(al_fila,'cp131',il_cp131)
dw_informe.setitem(al_fila,'cp132',il_cp132)
dw_informe.setitem(al_fila,'cp133',il_cp133)
dw_informe.setitem(al_fila,'cp134',il_cp134)
dw_informe.setitem(al_fila,'cp135',il_cp135)
dw_informe.setitem(al_fila,'cp136',il_cp136)
dw_informe.setitem(al_fila,'cp137',il_cp137)
dw_informe.setitem(al_fila,'empresa',il_empresa)
dw_informe.object.usuario.text = gs_user
dw_informe.setitem(al_fila,'fecha_ini',date(em_1.text))
dw_informe.setitem(al_fila,'fecha_fin',date(em_2.text))
if rb_jefe.checked = true then
	dw_informe.object.codigo_t.text = 'Jefe Venta'
	dw_informe.setitem(al_fila,'codigo',is_codigo_jef)
	dw_informe.setitem(al_fila,'nombre',is_nom_jefe)
end if
if rb_supervisor.checked = true then
	dw_informe.object.codigo_t.text = 'Supervisor'
	dw_informe.setitem(al_fila,'codigo',is_codigo_sup)
	dw_informe.setitem(al_fila,'nombre',is_nom_sup)
	dw_informe.setitem(al_fila,'estado',is_estado_sup)
end if
if rb_agente.checked = true then
	dw_informe.object.codigo_t.text = 'Agente'
	dw_informe.setitem(al_fila,'codigo',is_codigo_age)
	dw_informe.setitem(al_fila,'nombre',is_nom_age)
	dw_informe.setitem(al_fila,'estado',is_estado_age)
end if
end subroutine

public subroutine wf_cargar_agente (datawindow adw_informe, long al_fila);adw_informe.setitem(al_fila,'cod_jefe',is_nom_jefe)
adw_informe.setitem(al_fila,'codigo_jef',is_codigo_jef)
adw_informe.setitem(al_fila,'cod_supervisor',is_nom_sup)
adw_informe.setitem(al_fila,'fecha_ini_sup',id_fec_ini_sup)
adw_informe.setitem(al_fila,'fecha_fin_sup',id_fec_fin_sup)
adw_informe.setitem(al_fila,'codigo_sup',is_codigo_sup)
adw_informe.setitem(al_fila,'estado_sup',is_estado_sup)		
adw_informe.setitem(al_fila,'clasi_sup',is_clasif_sup)
adw_informe.setitem(al_fila,'fecha_ini_age',id_fec_ini_age)
adw_informe.setitem(al_fila,'fecha_fin_age',id_fec_fin_age)
adw_informe.setitem(al_fila,'codigo_age',is_codigo_age)
adw_informe.setitem(al_fila,'cod_agente',is_nom_age)
adw_informe.setitem(al_fila,'estado_age',is_estado_age)
adw_informe.setitem(al_fila,'clasificacion',is_clasif)
end subroutine

public subroutine wf_cargar_gestion1 (datawindow adw_informe);Long li_new
adw_informe.dataobject = 'dw_informe'
adw_informe.settransobject(sqlca)
li_new	= adw_informe.insertrow(0)
adw_informe.setitem(li_new,'empresa',il_empresa)
adw_informe.object.usuario.text = gs_user
adw_informe.setitem(li_new,'tot_vtas',(il_tot_v+il_tot_r+il_tot_n+il_tot_p+il_tot_c))
adw_informe.setitem(li_new,'tot_vigentes',il_tot_v)
adw_informe.setitem(li_new,'tot_resueltas',il_tot_r)
adw_informe.setitem(li_new,'tot_nulas_n',il_tot_n)
adw_informe.setitem(li_new,'tot_nulas_p',il_tot_p)
adw_informe.setitem(li_new,'tot_canceladas',il_tot_c)
adw_informe.setitem(li_new,'tot_al_dia',il_tot_dia)
adw_informe.setitem(li_new,'tot_moras',il_tot_mora)
adw_informe.setitem(li_new,'fecha_ini',date(em_1.text))
adw_informe.setitem(li_new,'fecha_fin',date(em_2.text))

adw_informe.setitem(li_new,'tot_uf_promesas',(il_tot_uf_resc+il_tot_uf_res+il_tot_uf_rep+il_tot_uf_canc+il_tot_uf_mora+il_tot_uf_dia))
adw_informe.setitem(li_new,'tot_uf_resciliados',il_tot_uf_resc)
adw_informe.setitem(li_new,'tot_uf_resueltas',il_tot_uf_res)
adw_informe.setitem(li_new,'tot_uf_resc_reprog',il_tot_uf_rep)
adw_informe.setitem(li_new,'tot_uf_canceladas',il_tot_uf_canc)
adw_informe.setitem(li_new,'tot_uf_vigentes',(il_tot_uf_mora + il_tot_uf_dia)) //il_tot_uf_vig)
adw_informe.setitem(li_new,'tot_uf_al_dia',il_tot_uf_dia)
adw_informe.setitem(li_new,'tot_uf_en_mora',il_tot_uf_mora)
CHOOSE CASE is_ventana
	CASE '1'
		wf_cargar_jefe(adw_informe,li_new)
	CASE '2'
		wf_cargar_supervisor(adw_informe,li_new)
	CASE '3'
		wf_cargar_agente(adw_informe,li_new)
END CHOOSE
if rb_jefe.checked = true then
	adw_informe.Modify("cod_jefe.font.italic='1'")
	adw_informe.object.titulo.text = 'Informe Gestion Actual Jefe de Venta'
	adw_informe.object.c_por_agente.Visible	= 1
	adw_informe.object.c_rescomi.x				= 892
	adw_informe.object.c_por_agente.x			= 1527
	adw_informe.object.c_clasif.Visible 		= 0
	adw_informe.object.c_clasif.Visible 		= 0
	adw_informe.object.c_por_agente.text 		= 'Por Supervisor'
end if
if rb_supervisor.checked = true then
	adw_informe.Modify("cod_supervisor.font.italic='1'")
	adw_informe.object.titulo.text = 'Informe Gestion Actual Supervisor'
	adw_informe.object.c_por_agente.Visible 	= 1
	adw_informe.object.c_clasif.Visible 		= 1
	adw_informe.object.c_por_agente.x			= 1733
	adw_informe.object.c_clasif.x					= 1162
	adw_informe.object.c_rescomi.x				= 663
	adw_informe.object.c_por_agente.text 		= 'Por Agente'
end if
if rb_agente.checked = true then
	adw_informe.Modify("cod_agente.font.italic='1'")
	adw_informe.setitem(li_new,'clasificacion',is_clasif)
	adw_informe.object.titulo.text = 'Informe Gestion Actual Agente'
	adw_informe.object.c_por_agente.Visible	= 0
	adw_informe.object.c_clasif.Visible 		= 1
	adw_informe.object.c_rescomi.x				= 892
	adw_informe.object.c_clasif.x 				= 1527
end if
if rb_promesas.checked=true then dw_informe.object.tot_vtas_t.text	= 'Total~rPromesas'
if rb_aumento.checked=true then dw_informe.object.tot_vtas_t.text	= 'Total~rAum.Cap.'
end subroutine

public function string wf_muestra_detalle_cuotas (string as_columna);string	ls_formula
il_sw	= 0
if rb_promesas.checked=true then
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
elseif rb_aumento.checked=true then
	CHOOSE CASE as_columna
		CASE 'c_tot_c0'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m = 0'
		CASE 'c_tot_c1'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m = 1'
		CASE 'c_tot_c2'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m = 2'
		CASE 'c_tot_c3'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m = 3'
		CASE 'c_tot_c4'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m = 4'
		CASE 'c_tot_c5'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m = 5'
		CASE 'c_tot_c6'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m = 6'
		CASE 'c_tot_c7'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_total'
			ls_formula	= 'funcion_mora > 0 and anexo_aumento_cta_pag_m >= 0'
			
		CASE 'cp00'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp01'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp02'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp03'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp04'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp05'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp06'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp07'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_0'
			ls_formula	= 'funcion_mora = 0 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp10'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp11'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp12'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp13'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp14'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp15'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp16'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp17'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_1'
			ls_formula	= 'funcion_mora = 1 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp20'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp21'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp22'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp23'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp24'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp25'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp26'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp27'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_2'
			ls_formula	= 'funcion_mora = 2 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp30'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp31'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp32'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp33'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp34'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp35'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp36'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp37'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_3'
			ls_formula	= 'funcion_mora = 3 and anexo_aumento_cta_pag_m = 0'
	
		CASE 'cp40'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp41'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp42'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp43'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp44'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp45'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp46'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp47'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_4'
			ls_formula	= 'funcion_mora = 4 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp50'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp51'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp52'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp53'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp54'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp55'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp56'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp57'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_5'
			ls_formula	= 'funcion_mora = 5 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp60'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp61'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp62'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp63'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp64'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp65'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp66'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp67'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m >= 6'
		CASE 'c_tot_6'
			ls_formula	= 'funcion_mora = 6 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp70'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp71'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp72'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp73'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp74'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp75'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp76'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp77'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_7'
			ls_formula	= 'funcion_mora = 7 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp80'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp81'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp82'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp83'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp84'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp85'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp86'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp87'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_8'
			ls_formula	= 'funcion_mora = 8 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp90'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp91'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp92'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp93'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp94'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp95'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp96'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp97'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_9'
			ls_formula	= 'funcion_mora = 9 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp100'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp101'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp102'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp103'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp104'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp105'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp106'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp107'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_10'
			ls_formula	= 'funcion_mora = 10 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp110'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp111'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp112'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp113'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp114'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp115'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp116'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp117'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_11'
			ls_formula	= 'funcion_mora = 11 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp120'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp121'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp122'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp123'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp124'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp125'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp126'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp127'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_12'
			ls_formula	= 'funcion_mora = 12 and anexo_aumento_cta_pag_m >= 0'
	
		CASE 'cp130'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m = 0'
		CASE 'cp131'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m = 1'
		CASE 'cp132'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m = 2'
		CASE 'cp133'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m = 3'
		CASE 'cp134'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m = 4'
		CASE 'cp135'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m = 5'
		CASE 'cp136'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m = 6'
		CASE 'cp137'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m > 6'
		CASE 'c_tot_13'
			ls_formula	= 'funcion_mora > 12 and anexo_aumento_cta_pag_m >= 0'
	
	END CHOOSE
end if
if trim(ls_formula) = '' then il_sw = 1
return ls_formula
end function

public subroutine wf_informe (datawindow adw_detalle, string as_ventana, datawindow adw_informe);//as_ventana 1=fefe 2=supervisor 3=agente
long 		ll_tot_reg, ll_indi, ll_monto_uf
Long		ll_tot_porc_aux, ll_tot_porc
Int		li_new
SetPointer(HourGlass!)
ll_tot_porc=0;ll_tot_porc_aux=0
ll_tot_reg	= adw_detalle.rowcount()
st_fondo.visible	= true
hpb_1.visible 		= true
st_porc.visible 	= true
hpb_1.Position		= ll_tot_porc
for ll_indi = 1 to ll_tot_reg
//	if adw_detalle.dataobject='
	if dw_detalle.dataobject = 'dw_ofertas_periodo_33_buscar_jefe' or &
		dw_detalle.dataobject = 'dw_ofertas_periodo_33_buscar_supervisor' or &
		dw_detalle.dataobject = 'dw_ofertas_periodo_33_buscar_agente' then
		is_estado_cont		= adw_detalle.getitemstring(ll_indi,'cadena_estado')
		il_cant_mora		= adw_detalle.getitemNumber(ll_indi,'funcion_mora')
		is_cod_jefe			= adw_detalle.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
		is_cod_supervisor	= adw_detalle.getitemstring(ll_indi,'oferta_v_cod_sup')
		is_cod_agente		= adw_detalle.getitemstring(ll_indi,'agentes_cod_age')
		il_tot_cuotas_p	= adw_detalle.getitemNumber(ll_indi,'oferta_v_cta_pag_s')
		il_po_precio		= adw_detalle.getitemNumber(ll_indi,'precio_uf')
		is_moneda			= adw_detalle.getitemString(ll_indi,'pago_oferta_moneda')
	elseif dw_detalle.dataobject = 'dw_aumento_periodo_33_buscar_jefe' or &
		dw_detalle.dataobject = 'dw_aumento_periodo_33_buscar_supervisor' or &
		dw_detalle.dataobject = 'dw_aumento_periodo_33_buscar_agente' then
		is_estado_cont		= adw_detalle.getitemstring(ll_indi,'cadena_estado')
		il_cant_mora		= adw_detalle.getitemNumber(ll_indi,'funcion_mora')
		is_cod_jefe			= adw_detalle.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
		is_cod_supervisor	= adw_detalle.getitemstring(ll_indi,'anexo_aumento_cod_super')
		is_cod_agente		= adw_detalle.getitemstring(ll_indi,'agentes_cod_age')
		il_tot_cuotas_p	= adw_detalle.getitemNumber(ll_indi,'anexo_aumento_cta_pag_m')
		il_po_precio		= adw_detalle.getitemNumber(ll_indi,'precio_uf')
		is_moneda			= adw_detalle.getitemString(ll_indi,'pago_aumento_moneda')
	end if
	if is_estado_cont='V' then wf_contar_detalle(il_cant_mora,il_tot_cuotas_p)
	if is_estado_cont='V' and il_cant_mora = 0 then 
		il_tot_uf_dia	= il_tot_uf_dia + il_po_precio
		il_tot_dia++
	end if
	if is_estado_cont='V' and il_cant_mora > 0 then 
		il_tot_uf_mora	= il_tot_uf_mora + il_po_precio
		il_tot_mora++
	end if
	CHOOSE CASE is_estado_cont
		CASE 'V' //Vigente
			il_tot_uf_vig	= il_tot_uf_vig + il_po_precio
			il_tot_v++

		CASE 'R' //Resuelta
			il_tot_uf_res	= il_tot_uf_res + il_po_precio
			il_tot_r++
			
		CASE 'N' //Resciliado
			il_tot_uf_resc	= il_tot_uf_resc + il_po_precio
			il_tot_n++
			
		CASE 'P' //Nulo * reprogramacion
			il_tot_uf_rep	= il_tot_uf_rep + il_po_precio
			il_tot_p++
			
		CASE 'C' //cancelado
			il_tot_uf_canc	= il_tot_uf_canc + il_po_precio
			il_tot_c++
			
	END CHOOSE
	if ll_tot_porc <> ll_tot_porc_aux then 
		st_porc.text		= string(ll_tot_porc)+" %"
		ll_tot_porc_aux	= ll_tot_porc
	end if
	ll_tot_porc		= (ll_indi / ll_tot_reg) * 100
	hpb_1.Position = ll_tot_porc
next
hpb_1.visible 		= false
st_porc.visible 	= false
st_fondo.visible	= false
li_new	= adw_informe.insertrow(0)
adw_informe.scrolltorow(li_new)
if adw_informe.dataobject = 'dw_informe' then
	adw_informe.setitem(li_new,'empresa',il_empresa)
	adw_informe.object.usuario.text = gs_user
	adw_informe.setitem(li_new,'tot_vtas',(il_tot_v+il_tot_r+il_tot_n+il_tot_p+il_tot_c))
	adw_informe.setitem(li_new,'tot_vigentes',il_tot_v)
	adw_informe.setitem(li_new,'tot_resueltas',il_tot_r)
	adw_informe.setitem(li_new,'tot_nulas_n',il_tot_n)
	adw_informe.setitem(li_new,'tot_nulas_p',il_tot_p)
	adw_informe.setitem(li_new,'tot_canceladas',il_tot_c)
	adw_informe.setitem(li_new,'tot_al_dia',il_tot_dia)
	adw_informe.setitem(li_new,'tot_moras',il_tot_mora)
	adw_informe.setitem(li_new,'fecha_ini',date(em_1.text))
	adw_informe.setitem(li_new,'fecha_fin',date(em_2.text))
	
	adw_informe.setitem(li_new,'tot_uf_promesas',(il_tot_uf_resc+il_tot_uf_res+il_tot_uf_rep+il_tot_uf_canc+il_tot_uf_mora+il_tot_uf_dia))
	adw_informe.setitem(li_new,'tot_uf_resciliados',il_tot_uf_resc)
	adw_informe.setitem(li_new,'tot_uf_resueltas',il_tot_uf_res)
	adw_informe.setitem(li_new,'tot_uf_resc_reprog',il_tot_uf_rep)
	adw_informe.setitem(li_new,'tot_uf_canceladas',il_tot_uf_canc)
	adw_informe.setitem(li_new,'tot_uf_vigentes',(il_tot_uf_mora + il_tot_uf_dia)) //il_tot_uf_vig)
	adw_informe.setitem(li_new,'tot_uf_al_dia',il_tot_uf_dia)
	adw_informe.setitem(li_new,'tot_uf_en_mora',il_tot_uf_mora)

	CHOOSE CASE is_ventana
		CASE '1'
			wf_cargar_jefe(adw_informe,li_new)
		CASE '2'
			wf_cargar_supervisor(adw_informe,li_new)
		CASE '3'
			wf_cargar_agente(adw_informe,li_new)
	END CHOOSE
	if rb_jefe.checked = true then
		adw_informe.Modify("cod_jefe.font.italic='1'")
		adw_informe.object.titulo.text = 'Informe Gestion Actual Jefe de Venta'
	end if
	if rb_supervisor.checked = true then
		adw_informe.Modify("cod_supervisor.font.italic='1'")
		adw_informe.object.titulo.text = 'Informe Gestion Actual Supervisor'
	end if
	if rb_agente.checked = true then
		adw_informe.Modify("cod_agente.font.italic='1'")
		adw_informe.setitem(li_new,'clasificacion',is_clasif)
		adw_informe.object.titulo.text = 'Informe Gestion Actual Agente'
	end if
elseif adw_informe.dataobject = 'dw_detalle_ciotas_pagadas' then
	wf_cargar_moras(li_new)
elseif adw_informe.dataobject = 'dw_resumen_promesas_por_jefe' or &
	adw_informe.dataobject = 'dw_resumen_promesas_por_supervisor' then
	if rb_jefe.checked = true then
		adw_informe.dataobject = 'dw_resumen_promesas_por_jefe'
		adw_informe.settransobject(sqlca)
		adw_informe.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
		adw_informe.object.titulo.text = 'Resumen Actual de Supervisores por Jefe de Venta'
		adw_informe.object.usuario.text = gs_user
	end if
	if rb_supervisor.checked = true then
		adw_informe.dataobject = 'dw_resumen_promesas_por_supervisor'
		adw_informe.settransobject(sqlca)
		adw_informe.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
		adw_informe.object.titulo.text = 'Resumen Actual de Agentes por Supervisor'
		adw_informe.object.usuario.text = gs_user
	end if
	if rb_agente.checked = true then
		adw_informe.dataobject = 'dw_informe'
		adw_informe.settransobject(sqlca)
		li_new	= adw_informe.insertrow(0)
		adw_informe.scrolltorow(li_new)
		adw_informe.setitem(li_new,'empresa',il_empresa)
		adw_informe.object.usuario.text = gs_user
		adw_informe.setitem(li_new,'tot_vtas',(il_tot_v+il_tot_r+il_tot_n+il_tot_p+il_tot_c))
		adw_informe.setitem(li_new,'tot_vigentes',il_tot_v)
		adw_informe.setitem(li_new,'tot_resueltas',il_tot_r)
		adw_informe.setitem(li_new,'tot_nulas_n',il_tot_n)
		adw_informe.setitem(li_new,'tot_nulas_p',il_tot_p)
		adw_informe.setitem(li_new,'tot_canceladas',il_tot_c)
		adw_informe.setitem(li_new,'tot_al_dia',il_tot_dia)
		adw_informe.setitem(li_new,'tot_moras',il_tot_mora)
		adw_informe.setitem(li_new,'fecha_ini',date(em_1.text))
		adw_informe.setitem(li_new,'fecha_fin',date(em_2.text))

		CHOOSE CASE is_ventana
			CASE '1'
				wf_cargar_jefe(adw_informe,li_new)
			CASE '2'
				wf_cargar_supervisor(adw_informe,li_new)
			CASE '3'
				wf_cargar_agente(adw_informe,li_new)
		END CHOOSE
		adw_informe.Modify("cod_agente.font.italic='1'")
		adw_informe.setitem(li_new,'clasificacion',is_clasif)
		adw_informe.object.titulo.text = 'Informe Gestion Actual Agente'
	end if
end if
SetPointer(Arrow!)
end subroutine

event open;string ls_estado_aux

gf_centrar(w_inf_gestion)
st_grupo.visible			= false
em_grupo.text				= ''
em_grupo.visible			= false
st_detalle.visible		= false
dw_lista.settransobject(sqlca)
dw_detalle.settransobject(sqlca)
dw_general.settransobject(sqlca)
dw_informe.dataobject 	= 'dw_informe'
dw_informe.settransobject(sqlca)
dw_sin_detalle.settransobject(sqlca)
dw_sin_detalle.visible	= false
dw_informe.HSplitScroll = TRUE
if gs_conexion = "Parque El Prado" then
	il_empresa 		= 1
elseif gs_conexion = "Parque La Foresta" then
	il_empresa 		= 2
elseif gs_conexion = "Parque Concepción" then
	il_empresa 		= 3
end if
em_1.text									= string(today())
em_2.text 									= string(today())
rb_promesas.checked						= true
dw_informe.object.tot_vtas_t.text	= 'Total~rPromesas'
is_ventana									= message.StringParm
CHOOSE CASE is_ventana
	CASE '1' //jefe
		this.title = "Informe Gestion Actual por Jefe de Venta"
		rb_jefe.checked 			= true
		rb_supervisor.checked 	= false
		rb_agente.checked 		= false
		pb_general.enabled		= true
		SELECT	"SUPERVISOR"."ESTADO"  
		INTO 		:ls_estado_aux  
		FROM 		"SUPERVISOR"  
		WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","No tiene acceso")
			em_codigo.enabled					= false
			rb_jefe.enabled					= false
			rb_supervisor.enabled			= false
			rb_agente.enabled					= false
			pb_buscar.enabled					= false
			rb_promesas.enabled				= false	
			rb_aumento.enabled				= false
			pb_aceptar.enabled				= false
		end if 
	CASE '2' //supervisor
		this.title = "Informe Gestion Actual por Supervisor"
		rb_jefe.checked 			= false
		rb_supervisor.checked 	= true
		rb_agente.checked 		= false
		pb_general.enabled		= false
		
		
	CASE '3' //agente
		this.title = "Informe Gestion Actual por Agente"
		rb_jefe.checked 			= false
		rb_supervisor.checked 	= false
		rb_agente.checked 		= true
		pb_general.enabled		= false
		
END CHOOSE
if dw_lista.retrieve() = 0 then messagebox("Advertencia","No registra dato")
if rb_agente.checked = true then
	dw_informe.object.c_por_agente.Visible	= 0
	dw_informe.object.c_clasif.Visible 		= 1
	dw_informe.object.c_rescomi.x				= 892
	dw_informe.object.c_clasif.x 				= 1527
end if
if rb_jefe.checked = true then
	dw_informe.object.c_por_agente.Visible = 1
	dw_informe.object.c_rescomi.x				= 892
	dw_informe.object.c_por_agente.x			= 1527
	dw_informe.object.c_clasif.Visible 		= 0
	dw_informe.object.c_clasif.Visible 		= 0
	dw_informe.object.c_por_agente.text 	= 'Por Supervisor'
end if
if rb_supervisor.checked = true then
	dw_informe.object.c_por_agente.Visible = 1
	dw_informe.object.c_clasif.Visible 		= 1
	dw_informe.object.c_por_agente.x			= 1733
	dw_informe.object.c_clasif.x				= 1162
	dw_informe.object.c_rescomi.x				= 663
	dw_informe.object.c_por_agente.text 	= 'Por Agente'
end if
gs_ventana	= 'w_inf_gestion'
f_valida_objeto_1()
SELECT	"JEFE_VENTAS"."ESTADO"  
INTO 		:ls_estado_aux  
FROM 		"JEFE_VENTAS"  
WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user   
USING		sqlca;
if sqlca.sqlcode<>0 then
	SELECT	"SUPERVISOR"."ESTADO"  
	INTO 		:ls_estado_aux  
	FROM 		"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
	USING		sqlca;
	if sqlca.sqlcode<>0 then
		SELECT	"AGENTES"."ESTADO"  
		INTO 		:ls_estado_aux  
		FROM 		"AGENTES"  
		WHERE 	"AGENTES"."COD_AGE" = :gs_user   
		USING		sqlca;
		if sqlca.sqlcode<>0 then
			em_codigo.enabled				= true
		else
			if is_ventana='3' then
				em_codigo.text				= gs_user
				em_codigo.enabled			= true
				rb_jefe.enabled			= false
				rb_supervisor.enabled 	= false
				pb_general.enabled		= true
				pb_buscar.enabled			= false
			else
				em_codigo.enabled			= true
				rb_jefe.enabled			= true
				rb_supervisor.enabled 	= true
				pb_general.enabled		= true
				pb_buscar.enabled			= true
			end if
			is_cod_ejec						= 'A'
			em_codigo.triggerevent(modified!)
		end if
	else
		if is_ventana='2' then
			SELECT	"SUPERVISOR"."ESTADO"  
			INTO 		:ls_estado_aux  
			FROM 		"SUPERVISOR"  
			WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user   
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				em_codigo.text					= gs_user
				em_codigo.enabled				= false
				rb_jefe.enabled				= false
				rb_supervisor.enabled		= true
				rb_agente.enabled				= true
				pb_buscar.enabled				= true  
			else
				em_codigo.enabled				= false
				rb_jefe.enabled				= false
				rb_supervisor.enabled		= true
				rb_agente.enabled				= true
				pb_buscar.enabled				= true  
			end if
		end if
		is_cod_ejec							= 'S'
		em_codigo.triggerevent(modified!)
	end if
else
	if is_ventana='1' then
		em_codigo.text						= gs_user
		em_codigo.enabled					= true
		rb_jefe.enabled					= true
		rb_supervisor.enabled			= true
		rb_agente.enabled					= true
		pb_buscar.enabled					= true
	else
		em_codigo.enabled					= true
		rb_jefe.enabled					= true
		rb_supervisor.enabled			= true
		rb_agente.enabled					= true
		pb_buscar.enabled					= true
	end if
	is_cod_ejec								= 'J'
	em_codigo.triggerevent(modified!)
end if
end event

on w_inf_gestion.create
this.rb_aumento=create rb_aumento
this.rb_promesas=create rb_promesas
this.st_licencias=create st_licencias
this.pb_licencias=create pb_licencias
this.st_detalle=create st_detalle
this.cb_cancelar_preg=create cb_cancelar_preg
this.cb_aceptar_preg=create cb_aceptar_preg
this.rb_con_ventas=create rb_con_ventas
this.rb_todos=create rb_todos
this.rb_inactivo=create rb_inactivo
this.rb_activo=create rb_activo
this.st_filtrar=create st_filtrar
this.st_ordenar=create st_ordenar
this.st_agentes_general=create st_agentes_general
this.st_exportar=create st_exportar
this.st_procesar=create st_procesar
this.pb_filtrar=create pb_filtrar
this.dw_general=create dw_general
this.pb_general=create pb_general
this.st_grupo=create st_grupo
this.pb_ordenar=create pb_ordenar
this.pb_exportar=create pb_exportar
this.pb_aceptar=create pb_aceptar
this.pb_imprimir=create pb_imprimir
this.pb_salir=create pb_salir
this.dw_detalle=create dw_detalle
this.st_nombre=create st_nombre
this.pb_buscar=create pb_buscar
this.em_codigo=create em_codigo
this.em_1=create em_1
this.p_1=create p_1
this.em_2=create em_2
this.p_2=create p_2
this.st_1=create st_1
this.st_2=create st_2
this.rb_agente=create rb_agente
this.rb_supervisor=create rb_supervisor
this.rb_jefe=create rb_jefe
this.dw_lista=create dw_lista
this.gb_2=create gb_2
this.gb_1=create gb_1
this.em_grupo=create em_grupo
this.gb_3=create gb_3
this.st_porc=create st_porc
this.hpb_1=create hpb_1
this.st_fondo=create st_fondo
this.st_volver=create st_volver
this.st_imprimir=create st_imprimir
this.st_fondo_pregunta=create st_fondo_pregunta
this.dw_informe=create dw_informe
this.dw_sin_detalle=create dw_sin_detalle
this.gb_4=create gb_4
this.Control[]={this.rb_aumento,&
this.rb_promesas,&
this.st_licencias,&
this.pb_licencias,&
this.st_detalle,&
this.cb_cancelar_preg,&
this.cb_aceptar_preg,&
this.rb_con_ventas,&
this.rb_todos,&
this.rb_inactivo,&
this.rb_activo,&
this.st_filtrar,&
this.st_ordenar,&
this.st_agentes_general,&
this.st_exportar,&
this.st_procesar,&
this.pb_filtrar,&
this.dw_general,&
this.pb_general,&
this.st_grupo,&
this.pb_ordenar,&
this.pb_exportar,&
this.pb_aceptar,&
this.pb_imprimir,&
this.pb_salir,&
this.dw_detalle,&
this.st_nombre,&
this.pb_buscar,&
this.em_codigo,&
this.em_1,&
this.p_1,&
this.em_2,&
this.p_2,&
this.st_1,&
this.st_2,&
this.rb_agente,&
this.rb_supervisor,&
this.rb_jefe,&
this.dw_lista,&
this.gb_2,&
this.gb_1,&
this.em_grupo,&
this.gb_3,&
this.st_porc,&
this.hpb_1,&
this.st_fondo,&
this.st_volver,&
this.st_imprimir,&
this.st_fondo_pregunta,&
this.dw_informe,&
this.dw_sin_detalle,&
this.gb_4}
end on

on w_inf_gestion.destroy
destroy(this.rb_aumento)
destroy(this.rb_promesas)
destroy(this.st_licencias)
destroy(this.pb_licencias)
destroy(this.st_detalle)
destroy(this.cb_cancelar_preg)
destroy(this.cb_aceptar_preg)
destroy(this.rb_con_ventas)
destroy(this.rb_todos)
destroy(this.rb_inactivo)
destroy(this.rb_activo)
destroy(this.st_filtrar)
destroy(this.st_ordenar)
destroy(this.st_agentes_general)
destroy(this.st_exportar)
destroy(this.st_procesar)
destroy(this.pb_filtrar)
destroy(this.dw_general)
destroy(this.pb_general)
destroy(this.st_grupo)
destroy(this.pb_ordenar)
destroy(this.pb_exportar)
destroy(this.pb_aceptar)
destroy(this.pb_imprimir)
destroy(this.pb_salir)
destroy(this.dw_detalle)
destroy(this.st_nombre)
destroy(this.pb_buscar)
destroy(this.em_codigo)
destroy(this.em_1)
destroy(this.p_1)
destroy(this.em_2)
destroy(this.p_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rb_agente)
destroy(this.rb_supervisor)
destroy(this.rb_jefe)
destroy(this.dw_lista)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.em_grupo)
destroy(this.gb_3)
destroy(this.st_porc)
destroy(this.hpb_1)
destroy(this.st_fondo)
destroy(this.st_volver)
destroy(this.st_imprimir)
destroy(this.st_fondo_pregunta)
destroy(this.dw_informe)
destroy(this.dw_sin_detalle)
destroy(this.gb_4)
end on

event mousemove;st_procesar.visible			= false
st_exportar.visible			= false
st_imprimir.visible			= false
st_agentes_general.visible	= false
st_ordenar.visible			= false
st_filtrar.visible			= false
st_licencias.visible			= false
end event

type rb_aumento from radiobutton within w_inf_gestion
integer x = 1856
integer y = 232
integer width = 457
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Aum.Capacidad"
end type

event clicked;em_grupo.visible											= false
st_grupo.visible											= false
if dw_informe.dataobject <> 'dw_informe' then
	dw_informe.dataobject 								= 'dw_informe'
	dw_informe.settransobject(sqlca)
end if
if rb_agente.checked = true then
	dw_informe.object.c_por_agente.Visible			= 0
	dw_informe.object.c_clasif.Visible 				= 1
	dw_informe.object.c_rescomi.x						= 892
	dw_informe.object.c_clasif.x 						= 1527
end if
if rb_jefe.checked = true then
	dw_informe.object.c_por_agente.Visible 		= 1
	dw_informe.object.c_rescomi.x						= 892
	dw_informe.object.c_por_agente.x					= 1527
	dw_informe.object.c_clasif.Visible 				= 0
	dw_informe.object.c_clasif.Visible 				= 0
	dw_informe.object.c_por_agente.text 			= 'Por Supervisor'
end if
if rb_supervisor.checked = true then
	dw_informe.object.c_por_agente.Visible 		= 1
	dw_informe.object.c_clasif.Visible 				= 1
	dw_informe.object.c_por_agente.x					= 1733
	dw_informe.object.c_clasif.x						= 1162
	dw_informe.object.c_rescomi.x						= 663
	dw_informe.object.c_por_agente.text 			= 'Por Agente'
end if
if rb_aumento.checked=true then 
	dw_informe.reset()
	if dw_informe.dataobject='dw_informe' then dw_informe.object.tot_vtas_t.text	= 'Total~rAum.Cap.'
end if
end event

type rb_promesas from radiobutton within w_inf_gestion
integer x = 1856
integer y = 136
integer width = 457
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Promesas"
end type

event clicked;em_grupo.visible											= false
st_grupo.visible											= false
if dw_informe.dataobject <> 'dw_informe' then
	dw_informe.dataobject 								= 'dw_informe'
	dw_informe.settransobject(sqlca)
end if
if rb_agente.checked = true then
	dw_informe.object.c_por_agente.Visible			= 0
	dw_informe.object.c_clasif.Visible 				= 1
	dw_informe.object.c_rescomi.x						= 892
	dw_informe.object.c_clasif.x 						= 1527
end if
if rb_jefe.checked = true then
	dw_informe.object.c_por_agente.Visible 		= 1
	dw_informe.object.c_rescomi.x						= 892
	dw_informe.object.c_por_agente.x					= 1527
	dw_informe.object.c_clasif.Visible 				= 0
	dw_informe.object.c_clasif.Visible 				= 0
	dw_informe.object.c_por_agente.text 			= 'Por Supervisor'
end if
if rb_supervisor.checked = true then
	dw_informe.object.c_por_agente.Visible 		= 1
	dw_informe.object.c_clasif.Visible 				= 1
	dw_informe.object.c_por_agente.x					= 1733
	dw_informe.object.c_clasif.x						= 1162
	dw_informe.object.c_rescomi.x						= 663
	dw_informe.object.c_por_agente.text 			= 'Por Agente'
end if
if rb_promesas.checked=true then	
	dw_informe.reset()
	if dw_informe.dataobject='dw_informe' then dw_informe.object.tot_vtas_t.text	= 'Total~rPromesas'
end if
end event

type st_licencias from statictext within w_inf_gestion
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3127
integer y = 1020
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Licencias"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

type pb_licencias from picturebutton within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 3159
integer y = 872
integer width = 169
integer height = 148
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Buscar.BMP"
string disabledname = "Buscar_no.BMP"
alignment htextalign = left!
end type

event ue_mousemove;st_imprimir.visible	= false
st_procesar.visible	= false
st_exportar.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= true

end event

event clicked;openwithparm(w_reporte_licencias,is_codigo)
end event

type st_detalle from statictext within w_inf_gestion
boolean visible = false
integer x = 1298
integer y = 2000
integer width = 434
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Sin Detalle"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;if trim(this.text) = 'Con Detalle' then
	this.text = 'Sin Detalle'
	dw_sin_detalle.visible	= false
	dw_informe.visible		= true
	st_detalle.visible		= true
	st_volver.visible			= true
elseif trim(this.text) = 'Sin Detalle' then
	this.text = 'Con Detalle'
	dw_sin_detalle.visible	= true
	dw_informe.visible		= false
	st_detalle.visible		= true
	st_volver.visible			= true
end if
end event

type cb_cancelar_preg from commandbutton within w_inf_gestion
boolean visible = false
integer x = 1659
integer y = 1168
integer width = 338
integer height = 104
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;st_fondo_pregunta.visible	= false
rb_activo.visible				= false
rb_inactivo.visible			= false
rb_con_ventas.visible		= false
rb_todos.visible				= false
cb_aceptar_preg.visible		= false
cb_cancelar_preg.visible	= false
end event

type cb_aceptar_preg from commandbutton within w_inf_gestion
boolean visible = false
integer x = 1079
integer y = 1168
integer width = 338
integer height = 104
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;Long		ll_tot_filas, ll_indi, ll_new, ll_tot_porc=0, ll_tot_porc_aux, ll_row
String	ls_cod_age, ls_cod_age_aux, ls_select, ls_base
String	ls_jefe,	ls_nombre, ls_a_pat,	ls_a_mat, ls_estado, ls_clasif, ls_superv, ls_clas_sup
Date		ld_fec_ini, ld_fec_fin
DateTime	ld_fec_ini2, ld_fec_fin2
Long		ll_tot_vtas, ll_vig_dia, ll_vig_mora, ll_tot_vig_pie, ll_tot_res_pie, ll_sw
double	ll_por_vig_dia, ll_por_res_mora
gd_fecha_inicio = datetime(date(em_1.text),time('00:00:00'))
gd_fecha_fin	 = datetime(date(em_2.text),time('00:00:00'))
if rb_promesas.checked=true then ls_base='O'
if rb_aumento.checked=true then ls_base='A'
if gd_fecha_inicio <= gd_fecha_fin then
	pb_ordenar.visible	= true
	pb_filtrar.visible	= true
	pb_aceptar.enabled	= false
	SetPointer(HourGlass!)
	if rb_agente.checked = true then
		if rb_activo.checked=true then 
			if ls_base='O' then
				dw_general.dataobject = 'dw_ofertas_periodo_general_por_agente_ac'
			elseif ls_base='A' then
				dw_general.dataobject = 'dw_aumento_periodo_general_por_agente_ac'
			end if
		end if
		if rb_inactivo.checked=true then 
			if ls_base='O' then
				dw_general.dataobject = 'dw_ofertas_periodo_general_por_agente_in'
			elseif ls_base='A' then
				dw_general.dataobject = 'dw_aumento_periodo_general_por_agente_in'
			end if
		end if
		if rb_con_ventas.checked=true or rb_todos.checked=true then 
			if ls_base='O' then
				dw_general.dataobject = 'dw_ofertas_periodo_general_por_agente'
			elseif ls_base='A' then
				dw_general.dataobject = 'dw_aumento_periodo_general_por_agente'
			end if
		end if
		dw_informe.dataobject	= 'dwe_cartera_general_por_agente'
	end if
	dw_general.settransobject(sqlca)
	dw_informe.settransobject(sqlca)
	st_volver.visible	= true
	st_volver.y			= 2000
	ls_cod_age_aux		= ''
	ll_tot_filas		= dw_general.retrieve(gd_fecha_inicio,gd_fecha_fin,il_empresa)
	if ll_tot_filas = 0 then
		messagebox("Advertencia","No registra datos")
		em_1.setfocus()
	else
		if rb_agente.checked = true then
			st_fondo.visible	= true
			hpb_1.visible 		= true
			st_porc.visible 	= true
			st_porc.text		= string(ll_tot_porc)+" %"
			hpb_1.Position		= ll_tot_porc
			if gs_conexion	= "Parque El Prado" then
				dw_informe.object.t_titulo.text	= 'Parque El Prado'
			elseif gs_conexion	= "Parque La Foresta" then
				dw_informe.object.t_titulo.text	= 'Parque La Foresta'
			elseif gs_conexion	= "Parque Concepción" then
				dw_informe.object.t_titulo.text	= 'Parque Concepción'
			end if
			dw_informe.object.t_cabecera.text	= 'Estado de la Cartera por Vendedor, Ventas realizadas entre '+ trim(em_1.text) +' y el '+ trim(em_2.text)
			for ll_indi=1 to ll_tot_filas
				ls_cod_age	= dw_general.getitemstring(ll_indi,'agentes_cod_age')
				if ls_cod_age <> ls_cod_age_aux then
					ls_cod_age_aux		= ls_cod_age
					ls_jefe				= dw_general.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
					ls_nombre			= dw_general.getitemstring(ll_indi,'agentes_nombre')
					ls_a_pat				= dw_general.getitemstring(ll_indi,'agentes_a_paterno')
					ls_a_mat				= dw_general.getitemstring(ll_indi,'agentes_a_materno')
					ld_fec_ini			= date(dw_general.getitemdatetime(ll_indi,'agentes_fecha_ini'))
					ld_fec_fin			= date(dw_general.getitemdatetime(ll_indi,'agentes_fecha_fin'))
					ls_estado			= dw_general.getitemstring(ll_indi,'agentes_estado')
					ls_clasif			= dw_general.getitemstring(ll_indi,'agentes_clasificacion')
					ls_superv			= dw_general.getitemstring(ll_indi,'agentes_cod_sup')
					ls_clas_sup			= dw_general.getitemstring(ll_indi,'supervisor_clasifica')
					ll_tot_vtas			= dw_general.getitemNumber(ll_indi,'tot_ventas')
					ll_vig_dia			= dw_general.getitemNumber(ll_indi,'canc_vig_al_dia')
					ll_por_vig_dia		= dw_general.GetItemnumber(ll_indi,'porc_vig_dia')
					ll_vig_mora			= dw_general.getitemNumber(ll_indi,'cant_vig_con_dia')
					ll_por_res_mora	= dw_general.GetItemnumber(ll_indi,'porc_res_mora')
					ll_tot_vig_pie		= dw_general.getitemNumber(ll_indi,'tot_vig_solo_pie')
					ll_tot_res_pie		= dw_general.getitemNumber(ll_indi,'tot_res_solo_pie')
					if rb_agente.checked = true then
						if rb_activo.checked=true or rb_con_ventas.checked=true then
							if ls_estado='A' then
								ll_new	= dw_informe.insertrow(0)
								dw_informe.scrolltorow(ll_new)
								dw_informe.setitem(ll_new,'cod_jefe_venta',ls_jefe)
								dw_informe.setitem(ll_new,'cod_agente',ls_cod_age)
								dw_informe.setitem(ll_new,'nombre_agente',ls_nombre)
								dw_informe.setitem(ll_new,'ap_paterno',ls_a_pat)
								dw_informe.setitem(ll_new,'ap_materno',ls_a_mat)
								dw_informe.setitem(ll_new,'fec_ini',datetime(ld_fec_ini))
								dw_informe.setitem(ll_new,'fec_fin',datetime(ld_fec_fin))
								dw_informe.setitem(ll_new,'estado',ls_estado)
								dw_informe.setitem(ll_new,'clasificacion',ls_clasif)
								dw_informe.setitem(ll_new,'clasif_superv',ls_clas_sup)
								dw_informe.setitem(ll_new,'cod_supervisor',ls_superv)
								dw_informe.setitem(ll_new,'total_ventas',ll_tot_vtas)
								dw_informe.setitem(ll_new,'canc_vig_al_dia',ll_vig_dia)
								dw_informe.setitem(ll_new,'por_canc_vig_al_dia',ll_por_vig_dia)
								dw_informe.setitem(ll_new,'resuel_vig_con_mora',ll_vig_mora)
								dw_informe.setitem(ll_new,'por_resuel_vig_con_mora',ll_por_res_mora)
								dw_informe.setitem(ll_new,'vig_solo_pie',ll_tot_vig_pie)
								dw_informe.setitem(ll_new,'resuel_solo_pie',ll_tot_res_pie)
							end if
						end if
						if rb_inactivo.checked=true then 
							if ls_estado='I' then
								ll_new	= dw_informe.insertrow(0)
								dw_informe.scrolltorow(ll_new)
								dw_informe.setitem(ll_new,'cod_jefe_venta',ls_jefe)
								dw_informe.setitem(ll_new,'cod_agente',ls_cod_age)
								dw_informe.setitem(ll_new,'nombre_agente',ls_nombre)
								dw_informe.setitem(ll_new,'ap_paterno',ls_a_pat)
								dw_informe.setitem(ll_new,'ap_materno',ls_a_mat)
								dw_informe.setitem(ll_new,'fec_ini',ld_fec_ini)
								dw_informe.setitem(ll_new,'fec_fin',ld_fec_fin)
								dw_informe.setitem(ll_new,'estado',ls_estado)
								dw_informe.setitem(ll_new,'clasificacion',ls_clasif)
								dw_informe.setitem(ll_new,'clasif_superv',ls_clas_sup)
								dw_informe.setitem(ll_new,'cod_supervisor',ls_superv)
								dw_informe.setitem(ll_new,'total_ventas',ll_tot_vtas)
								dw_informe.setitem(ll_new,'canc_vig_al_dia',ll_vig_dia)
								dw_informe.setitem(ll_new,'por_canc_vig_al_dia',ll_por_vig_dia)
								dw_informe.setitem(ll_new,'resuel_vig_con_mora',ll_vig_mora)
								dw_informe.setitem(ll_new,'por_resuel_vig_con_mora',ll_por_res_mora)
								dw_informe.setitem(ll_new,'vig_solo_pie',ll_tot_vig_pie)
								dw_informe.setitem(ll_new,'resuel_solo_pie',ll_tot_res_pie)
							end if
						end if
						if rb_todos.checked=true then
							ll_new	= dw_informe.insertrow(0)
							dw_informe.scrolltorow(ll_new)
							dw_informe.setitem(ll_new,'cod_jefe_venta',ls_jefe)
							dw_informe.setitem(ll_new,'cod_agente',ls_cod_age)
							dw_informe.setitem(ll_new,'nombre_agente',ls_nombre)
							dw_informe.setitem(ll_new,'ap_paterno',ls_a_pat)
							dw_informe.setitem(ll_new,'ap_materno',ls_a_mat)
							dw_informe.setitem(ll_new,'fec_ini',ld_fec_ini)
							dw_informe.setitem(ll_new,'fec_fin',ld_fec_fin)
							dw_informe.setitem(ll_new,'estado',ls_estado)
							dw_informe.setitem(ll_new,'clasificacion',ls_clasif)
							dw_informe.setitem(ll_new,'clasif_superv',ls_clas_sup)
							dw_informe.setitem(ll_new,'cod_supervisor',ls_superv)
							dw_informe.setitem(ll_new,'total_ventas',ll_tot_vtas)
							dw_informe.setitem(ll_new,'canc_vig_al_dia',ll_vig_dia)
							dw_informe.setitem(ll_new,'por_canc_vig_al_dia',ll_por_vig_dia)
							dw_informe.setitem(ll_new,'resuel_vig_con_mora',ll_vig_mora)
							dw_informe.setitem(ll_new,'por_resuel_vig_con_mora',ll_por_res_mora)
							dw_informe.setitem(ll_new,'vig_solo_pie',ll_tot_vig_pie)
							dw_informe.setitem(ll_new,'resuel_solo_pie',ll_tot_res_pie)
						end if
					end if
				end if
				if ll_tot_porc <> ll_tot_porc_aux then 
					st_porc.text		= string(ll_tot_porc)+" %"
					ll_tot_porc_aux	= ll_tot_porc
				end if
				ll_tot_porc		= (ll_indi / ll_tot_filas) * 100
				hpb_1.Position = ll_tot_porc
			next
			if rb_con_ventas.checked=false then
				ll_tot_filas	= dw_informe.rowcount()
				if rb_agente.checked = true then
					if rb_activo.checked=true then
						ls_select = 'SELECT AGENTES.COD_AGE,'+&
						 '	AGENTES.NOMBRE,'+&
						 ' AGENTES.A_PATERNO,'+&
						 ' AGENTES.A_MATERNO,'+&
						 ' AGENTES.FECHA_INI,'+&
						 ' AGENTES.FECHA_FIN,'+&
						 ' AGENTES.ESTADO,'+&
						 ' AGENTES.COD_SUP,'+&
						 ' AGENTES.CLASIFICACION,'+&
						 ' SUPERVISOR.COD_JEFE,'+&   
						 ' SUPERVISOR.CLASIFICA'+&
						 ' FROM AGENTES,'+&
						 ' SUPERVISOR'+&
						 ' WHERE AGENTES.COD_SUP = SUPERVISOR.COD_SUP and AGENTES.ESTADO = '+"'A'"+&
						 ' ORDER BY AGENTES.COD_AGE ASC '
					end if
					if rb_inactivo.checked=true then 
						ls_select = 'SELECT AGENTES.COD_AGE,'+&
						 '	AGENTES.NOMBRE,'+&
						 ' AGENTES.A_PATERNO,'+&
						 ' AGENTES.A_MATERNO,'+&
						 ' AGENTES.FECHA_INI,'+&
						 ' AGENTES.FECHA_FIN,'+&
						 ' AGENTES.ESTADO,'+&
						 ' AGENTES.COD_SUP,'+&
						 ' AGENTES.CLASIFICACION,'+&
						 ' SUPERVISOR.COD_JEFE,'+&   
						 ' SUPERVISOR.CLASIFICA'+&
						 ' FROM AGENTES,'+&
						 ' SUPERVISOR'+&
						 ' WHERE AGENTES.COD_SUP = SUPERVISOR.COD_SUP and AGENTES.ESTADO = '+"'I'"+&
						 ' ORDER BY AGENTES.COD_AGE ASC '
					end if
					if rb_todos.checked=true then
						ls_select = 'SELECT AGENTES.COD_AGE,'+&
						 '	AGENTES.NOMBRE,'+&
						 ' AGENTES.A_PATERNO,'+&
						 ' AGENTES.A_MATERNO,'+&
						 ' AGENTES.FECHA_INI,'+&
						 ' AGENTES.FECHA_FIN,'+&
						 ' AGENTES.ESTADO,'+&
						 ' AGENTES.COD_SUP,'+&
						 ' AGENTES.CLASIFICACION,'+&
						 ' SUPERVISOR.COD_JEFE,'+&   
						 ' SUPERVISOR.CLASIFICA'+&
						 ' FROM AGENTES,'+&
						 ' SUPERVISOR'+&
						 ' WHERE AGENTES.COD_SUP = SUPERVISOR.COD_SUP'+&
						 ' ORDER BY AGENTES.COD_AGE ASC '
					end if
				end if
				PREPARE sqlsa FROM :ls_select;
				DECLARE x1 DYNAMIC CURSOR FOR sqlsa;
				OPEN DYNAMIC x1; 
				DO WHILE sqlca.sqlcode=0 
					setnull(ls_cod_age);setnull(ls_nombre);setnull(ls_a_pat);setnull(ls_a_mat)
					setnull(ld_fec_ini);setnull(ld_fec_fin);setnull(ls_estado);setnull(ls_superv)
					setnull(ls_clasif);setnull(ls_jefe);setnull(ls_clas_sup)
					fetch x1 into :ls_cod_age,:ls_nombre,:ls_a_pat,:ls_a_mat,:ld_fec_ini2,:ld_fec_fin2,:ls_estado,:ls_superv,:ls_clasif,:ls_jefe,:ls_clas_sup;
					ll_row = dw_informe.Find("cod_agente='"+ls_cod_age+"'", 1, ll_tot_filas)
					ld_fec_ini	= date(ld_fec_ini2)
					ld_fec_fin	= date(ld_fec_fin2)
					IF ll_row > 0 THEN
						ll_sw	= 1
					ELSE
						ll_sw	= 0
					END IF
					if ll_sw = 0 and (ls_cod_age<>'' or not isnull(ls_cod_age)) then
						//insertar registro
						ll_new	= dw_informe.insertrow(0)
						dw_informe.scrolltorow(ll_new)
						dw_informe.setitem(ll_new,'cod_jefe_venta',ls_jefe)
						dw_informe.setitem(ll_new,'cod_agente',ls_cod_age)
						dw_informe.setitem(ll_new,'nombre_agente',ls_nombre)
						dw_informe.setitem(ll_new,'ap_paterno',ls_a_pat)
						dw_informe.setitem(ll_new,'ap_materno',ls_a_mat)
						dw_informe.setitem(ll_new,'fec_ini',ld_fec_ini)
						dw_informe.setitem(ll_new,'fec_fin',ld_fec_fin)
						dw_informe.setitem(ll_new,'estado',ls_estado)
						dw_informe.setitem(ll_new,'clasificacion',ls_clasif)
						dw_informe.setitem(ll_new,'clasif_superv',ls_clas_sup)
						dw_informe.setitem(ll_new,'cod_supervisor',ls_superv)
						dw_informe.setitem(ll_new,'total_ventas',0)
						dw_informe.setitem(ll_new,'canc_vig_al_dia',0)
						dw_informe.setitem(ll_new,'por_canc_vig_al_dia',0)
						dw_informe.setitem(ll_new,'resuel_vig_con_mora',0)
						dw_informe.setitem(ll_new,'por_resuel_vig_con_mora',0)
						dw_informe.setitem(ll_new,'vig_solo_pie',0)
						dw_informe.setitem(ll_new,'resuel_solo_pie',0)
	//					ll_tot_filas++
					end if
				LOOP
				close x1;
				dw_informe.setSort("cod_agente A");
				dw_informe.sort()
			end if
		else
			
		end if
	end if
	hpb_1.visible 		= false
	st_porc.visible 	= false
	st_fondo.visible	= false
	SetPointer(Arrow!)
	cb_cancelar_preg.triggerevent(clicked!)
else
	messagebox("Advertencia","Rango fecha Incorrecta")
	em_1.setfocus()
end if
end event

type rb_con_ventas from radiobutton within w_inf_gestion
boolean visible = false
integer x = 951
integer y = 864
integer width = 1147
integer height = 104
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
string text = "Agentes Activos solo con Ventas"
end type

type rb_todos from radiobutton within w_inf_gestion
boolean visible = false
integer x = 951
integer y = 996
integer width = 987
integer height = 104
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
string text = "Todos"
end type

type rb_inactivo from radiobutton within w_inf_gestion
boolean visible = false
integer x = 951
integer y = 732
integer width = 987
integer height = 104
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
string text = "Agentes Inactivos"
end type

type rb_activo from radiobutton within w_inf_gestion
boolean visible = false
integer x = 951
integer y = 600
integer width = 987
integer height = 104
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 80269524
string text = "Agentes Activos"
boolean checked = true
end type

type st_filtrar from statictext within w_inf_gestion
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3127
integer y = 1476
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Filtrar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;this.visible	= false
end event

type st_ordenar from statictext within w_inf_gestion
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3127
integer y = 1324
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Ordenar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
end event

type st_agentes_general from statictext within w_inf_gestion
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 2962
integer y = 1172
integer width = 393
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Cartera Agentes"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
end event

type st_exportar from statictext within w_inf_gestion
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3127
integer y = 704
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Exportar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
end event

type st_procesar from statictext within w_inf_gestion
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3127
integer y = 552
integer width = 229
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Procesar"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
end event

type pb_filtrar from picturebutton within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 3159
integer y = 1336
integer width = 169
integer height = 148
integer taborder = 120
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "filtrar.bmp"
string disabledname = "filtrar_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_filtrar.visible	= true
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_licencias.visible	= false

end event

event clicked;string nulo
setnull (nulo)
dw_informe.SETfilter(NULO)
dw_informe.filter()

end event

type dw_general from datawindow within w_inf_gestion
boolean visible = false
integer x = 3177
integer y = 1832
integer width = 123
integer height = 116
integer taborder = 130
string dataobject = "dw_aumento_periodo_general_por_agente_ac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_general from picturebutton within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 3159
integer y = 1024
integer width = 169
integer height = 148
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Agenc_on.BMP"
string disabledname = "Agenc_off.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_agentes_general.visible	= true
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;pb_aceptar.enabled	= false
if rb_jefe.checked=true then
	if trim(em_codigo.text)='' then
		messagebox("Advertencia","Debe ingresar Código")
		em_codigo.setfocus()
	else
		dw_informe.dataobject	= 'dw_detalle_general_por_jefe_venta'
		dw_informe.settransobject(sqlca)
		pb_ordenar.visible	= false
		pb_filtrar.visible	= false
		st_detalle.visible	= true
		st_volver.visible		= true
		st_volver.y				= 2000
		gd_fecha_inicio 		= datetime(date(em_1.text),time('00:00:00'))
		gd_fecha_fin	 		= datetime(date(em_2.text),time('00:00:00'))
		if gd_fecha_inicio <= gd_fecha_fin then
			if dw_sin_detalle.retrieve(gd_fecha_inicio,gd_fecha_fin,il_empresa,trim((em_codigo.text)))=0 then
				messagebox("Advertencia","No registra dato")
				em_1.setfocus()
			else
				dw_informe.retrieve(gd_fecha_inicio,gd_fecha_fin,il_empresa,trim((em_codigo.text)))
			end if
		else
			messagebox("Advertencia","Rango fecha Incorrecta")
			em_1.setfocus()
		end if
	end if
end if
if rb_agente.checked=true then
	st_fondo_pregunta.visible	= true
	rb_activo.text					= 'Agentes Activos'
	rb_inactivo.text				= 'Agentes Inactivos'
	rb_con_ventas.text			= 'Agentes Activos solo con Ventas'
	rb_activo.visible				= true
	rb_inactivo.visible			= true
	rb_con_ventas.visible		= true
	rb_todos.visible				= true
	cb_aceptar_preg.visible		= true
	cb_cancelar_preg.visible	= true
	pb_ordenar.visible			= true
	pb_filtrar.visible			= true
	cb_aceptar_preg.setfocus()
end if

end event

type st_grupo from statictext within w_inf_gestion
boolean visible = false
integer x = 599
integer y = 36
integer width = 521
integer height = 72
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = " Buscar Cód.Superv."
boolean focusrectangle = false
end type

type pb_ordenar from picturebutton within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 3159
integer y = 1180
integer width = 169
integer height = 148
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ordenar.bmp"
string disabledname = "ordenar_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_ordenar.visible	= true
st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;if dw_informe.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_informe.SETSORT(NULO)
	dw_informe.SORT()
end if
end event

type pb_exportar from picturebutton within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 3159
integer y = 560
integer width = 169
integer height = 148
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar_como.bmp"
string disabledname = "grabar_como_no.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_exportar.visible	= true
st_procesar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;dw_paso	= dw_informe
if dw_informe.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type pb_aceptar from picturebutton within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 3159
integer y = 404
integer width = 178
integer height = 156
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
alignment htextalign = right!
end type

event ue_mousemove;st_procesar.visible	= true
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;wf_inicializar_variables()
st_detalle.visible										= false
if gs_conexion = "Parque El Prado" then
	il_empresa 		= 1
elseif gs_conexion = "Parque La Foresta" then
	il_empresa 		= 2
elseif gs_conexion = "Parque Concepción" then
	il_empresa 		= 3
end if
gd_fecha_inicio 											= datetime(date(em_1.text),time('00:00:00'))
gd_fecha_fin	 											= datetime(date(em_2.text),time('00:00:00'))
st_grupo.visible											= false
em_grupo.text												= ''
em_grupo.visible											= false
dw_informe.reset()
if dw_informe.dataobject <> 'dw_informe' then
	dw_informe.dataobject 								= 'dw_informe'
	dw_informe.settransobject(sqlca)
end if
if rb_agente.checked = true then
	dw_informe.object.c_por_agente.Visible			= 0
	dw_informe.object.c_clasif.Visible 				= 1
	dw_informe.object.c_rescomi.x						= 892
	dw_informe.object.c_clasif.x 						= 1527
end if
if rb_jefe.checked = true then
	dw_informe.object.c_por_agente.Visible 		= 1
	dw_informe.object.c_rescomi.x						= 892
	dw_informe.object.c_por_agente.x					= 1527
	dw_informe.object.c_clasif.Visible 				= 0
	dw_informe.object.c_clasif.Visible 				= 0
	dw_informe.object.c_por_agente.text 			= 'Por Supervisor'
end if
if rb_supervisor.checked = true then
	dw_informe.object.c_por_agente.Visible 		= 1
	dw_informe.object.c_clasif.Visible 				= 1
	dw_informe.object.c_por_agente.x					= 1733
	dw_informe.object.c_clasif.x						= 1162
	dw_informe.object.c_rescomi.x						= 663
	dw_informe.object.c_por_agente.text 			= 'Por Agente'
end if
if gd_fecha_inicio <= gd_fecha_fin then
	if em_codigo.text <> '' then
		CHOOSE CASE is_ventana
			CASE '1'
				if rb_promesas.checked=true then
					pb_general.enabled					= true
					dw_detalle.dataobject 				= 'dw_ofertas_periodo_33_buscar_jefe'
				else
					dw_detalle.dataobject 				= 'dw_aumento_periodo_33_buscar_jefe'
				end if
				dw_detalle.settransobject(sqlca)
			CASE '2'
				if rb_promesas.checked=true then
					pb_general.enabled					= false
					dw_detalle.dataobject 				= 'dw_ofertas_periodo_33_buscar_supervisor'
				else
					dw_detalle.dataobject 				= 'dw_aumento_periodo_33_buscar_supervisor'
				end if
				dw_detalle.settransobject(sqlca)
			CASE '3'
				if rb_promesas.checked=true then
					pb_general.enabled					= true
					dw_detalle.dataobject 				= 'dw_ofertas_periodo_33_buscar_agente'
				else
					dw_detalle.dataobject 				= 'dw_aumento_periodo_33_buscar_agente'
				end if
				dw_detalle.settransobject(sqlca)
		END CHOOSE
		is_codigo = trim(em_codigo.text)
		if dw_detalle.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa) > 0 then
			wf_informe(dw_detalle,is_ventana,dw_informe)
			if rb_promesas.checked=true then
				dw_informe.object.tot_vtas_t.text	= 'Total~rPromesas'
			else
				dw_informe.object.tot_vtas_t.text	= 'Total~rAum.Cap.'
			end if
			em_grupo.enabled 								= true
		else
			messagebox("Advertencia","No se registran datos, en el periodo "+em_1.text+" al "+em_2.text)
		end if
	else
		messagebox("Advertencia","Falta ingresar Código")
	end if
else
	messagebox("Advertencia","Rango fecha Incorrecta")
end if
end event

type pb_imprimir from picturebutton within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 3159
integer y = 716
integer width = 169
integer height = 148
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print.bmp"
string disabledname = "print_no.bmp"
end type

event ue_mousemove;st_imprimir.visible	= true
st_procesar.visible	= false
st_exportar.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;if dw_informe.rowcount() > 0 then 
	dw_informe.object.datawindow.print.Preview = true
	f_Print( dw_informe )
	dw_informe.object.datawindow.print.Preview = false	
end if
end event

type pb_salir from picturebutton within w_inf_gestion
integer x = 3159
integer y = 1972
integer width = 169
integer height = 148
integer taborder = 150
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = right!
end type

event clicked;close(parent)
end event

type dw_detalle from datawindow within w_inf_gestion
boolean visible = false
integer x = 3177
integer y = 1700
integer width = 123
integer height = 116
string dataobject = "dw_ofertas_periodo_33_buscar_jefe"
boolean livescroll = true
end type

type st_nombre from statictext within w_inf_gestion
integer x = 82
integer y = 244
integer width = 1015
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_inf_gestion
integer x = 1605
integer y = 104
integer width = 142
integer height = 116
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa.bmp"
string disabledname = "lupa_no.bmp"
end type

event clicked;dw_informe.reset()
em_grupo.text 	= ''
openwithparm(w_lista_codigos,is_ventana)
//em_codigo.triggerevent(modified!)
//em_codigo.setfocus()
end event

type em_codigo from editmask within w_inf_gestion
integer x = 82
integer y = 124
integer width = 411
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
string displaydata = "T"
end type

event modified;long 		ll_indi, ll_tot_reg, ll_sw
string	ls_nombre,ls_pasa,ls_cod,ls_cod_aux 


ls_cod			= this.text
if ls_cod <> '' then
	ls_pasa		= 'S'
	if is_cod_ejec	= 'J' then
		if rb_supervisor.checked=true then
			SELECT	"SUPERVISOR"."COD_JEFE"  
			INTO 		:ls_cod_aux  
			FROM		"SUPERVISOR"  
			WHERE  ( "SUPERVISOR"."COD_SUP" = :ls_cod ) AND  
					 ( "SUPERVISOR"."ESTADO" = 'A' )   
			USING		sqlca;
			if gs_user <> ls_cod_aux then
				messagebox("Advertencia","Supervisor No Corresponde al Jefe de Venta "+gs_user+" o está Inactivo")
				ls_pasa			= 'N'
				em_codigo.text	= ''
			end if

		elseif rb_agente.checked=true then
			SELECT	"JEFE_VENTAS"."JEFE_VENTAS"  
			INTO 		:ls_cod_aux  
			FROM 		"AGENTES",	"JEFE_VENTAS",	"SUPERVISOR"  
			WHERE  ( "SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" ) and  
					 ( "SUPERVISOR"."COD_SUP" = "AGENTES"."COD_SUP" ) and  
					 (("AGENTES"."COD_AGE" = :ls_cod ) AND  
					 ( "AGENTES"."ESTADO" = 'A' )   )  
			USING		sqlca;
			if gs_user <> ls_cod_aux then
				messagebox("Advertencia","Agente No Corresponde al Jefe de Venta "+gs_user+" o está Inactivo")
				ls_pasa			= 'N'
				em_codigo.text	= ''
			end if
		end if
	elseif is_cod_ejec = 'S' then
		if rb_agente.checked=true then
			SELECT	"AGENTES"."COD_SUP"  
			INTO 		:ls_cod_aux  
			FROM 		"AGENTES"  
			WHERE  ( "AGENTES"."COD_AGE" = :ls_cod ) AND  
					 ( "AGENTES"."ESTADO" = 'A' )   
			USING		sqlca;
			if gs_user <> ls_cod_aux then
				messagebox("Advertencia","Agente No Corresponde al Supervisor "+gs_user+" o está Inactivo")
				ls_pasa			= 'N'
				em_codigo.text	= ''
			end if
		end if
	end if
	if ls_pasa='S' then
		ll_tot_reg		= dw_lista.rowcount()
		st_nombre.text = ''
		ll_sw				= 0
		for ll_indi = 1 to ll_tot_reg
			if rb_jefe.checked = true then
				is_codigo	= dw_lista.getitemstring(ll_indi,'jefe_ventas_jefe_ventas')
				if is_codigo = trim(em_codigo.text) then
					st_nombre.text	= dw_lista.getitemstring(ll_indi,'c_nom_jefe')
					wf_rescatar_datos(dw_lista,ll_indi)
					ll_indi			= ll_tot_reg
					ll_sw				= 1
				end if
			end if
			if rb_supervisor.checked = true then
				is_codigo	= dw_lista.getitemstring(ll_indi,'supervisor_cod_sup')
				if is_codigo = trim(em_codigo.text) then
					st_nombre.text	= dw_lista.getitemstring(ll_indi,'c_nom_sup')
					wf_rescatar_datos(dw_lista,ll_indi)
					ll_indi			= ll_tot_reg
					ll_sw				= 1
				end if
			end if
			if rb_agente.checked = true then
				is_codigo	= dw_lista.getitemstring(ll_indi,'agentes_cod_age')
				if is_codigo = trim(em_codigo.text) then
					is_clasif		= dw_lista.getitemstring(ll_indi,'agentes_clasificacion')
					st_nombre.text	= dw_lista.getitemstring(ll_indi,'c_nom_age')
					wf_rescatar_datos(dw_lista,ll_indi)
					ll_indi			= ll_tot_reg
					ll_sw				= 1
				end if
			end if
		next
		if ll_sw = 0 then 
			messagebox("Error","No existe Codigo : "+em_codigo.text)
			close(w_inf_gestion)
		end if
	end if
end if
end event

type em_1 from editmask within w_inf_gestion
integer x = 2386
integer y = 224
integer width = 347
integer height = 76
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

event getfocus;if em_codigo.text='' or isnull(em_codigo.text) then em_codigo.setfocus()
end event

type p_1 from picture within w_inf_gestion
event clicked pbm_bnclicked
integer x = 2743
integer y = 220
integer width = 82
integer height = 80
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_1.text)=-1 then 
	em_1.text=string(today(),gs_formato_fecha)
	em_1.setfocus()
	return
end if	
if em_1.text<>'00/00/0000' then
	ls_fecha = em_1.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(EM_2.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_1.setfocus()
		return
	else	
		em_1.text = Message.StringParm
	end if	
END IF
end event

type em_2 from editmask within w_inf_gestion
integer x = 2866
integer y = 224
integer width = 347
integer height = 76
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type p_2 from picture within w_inf_gestion
event clicked pbm_bnclicked
integer x = 3223
integer y = 220
integer width = 82
integer height = 80
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_2.text)=-1 then 
	em_2.text=string(today(),gs_formato_fecha)
	em_2.setfocus()
	return
end if	
if em_2.text<>'00/00/0000' then
	ls_fecha = em_2.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(EM_1.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_2.setfocus()
		return
	else	
		em_2.text = Message.StringParm
	end if	
END IF
end event

type st_1 from statictext within w_inf_gestion
integer x = 2391
integer y = 136
integer width = 384
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha inicio"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_inf_gestion
integer x = 2848
integer y = 144
integer width = 434
integer height = 68
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha Término"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_agente from radiobutton within w_inf_gestion
integer x = 1207
integer y = 260
integer width = 384
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Agente"
end type

event clicked;em_grupo.visible											= false
st_grupo.visible											= false
if dw_informe.dataobject <> 'dw_informe' then
	dw_informe.dataobject 								= 'dw_informe'
	dw_informe.settransobject(sqlca)
end if
if rb_agente.checked = true then
	dw_informe.object.c_por_agente.Visible			= 0
	dw_informe.object.c_clasif.Visible 				= 1
	dw_informe.object.c_rescomi.x						= 892
	dw_informe.object.c_clasif.x 						= 1527
end if
if rb_promesas.checked=true then dw_informe.object.tot_vtas_t.text	= 'Total~rPromesas'
if rb_aumento.checked=true then dw_informe.object.tot_vtas_t.text	= 'Total~rAum.Cap.'
st_detalle.visible	= false
if dw_informe.dataobject = 'dw_resumen_promesas_por_jefe' or dw_informe.dataobject = 'dw_resumen_promesas_por_supervisor' or &
	dw_informe.dataobject = 'dw_resumen_aumento_por_jefe' or dw_informe.dataobject = 'dw_resumen_aumento_por_supervisor' then
	em_grupo.visible	= false
	st_grupo.visible	= false
end if
if dw_informe.dataobject='dwe_cartera_general_por_agente' or &
	dw_informe.dataobject='dw_detalle_general_por_jefe_venta' then
	if dw_informe.dataobject='dwe_cartera_general_por_agente' then
		pb_ordenar.visible	= true
		pb_filtrar.visible	= true
	else
		pb_ordenar.visible	= false
		pb_filtrar.visible	= false
	end if
	pb_aceptar.enabled	= false
end if
dw_sin_detalle.visible	= false
dw_informe.visible		= true
st_detalle.visible		= false
st_volver.visible			= false
pb_general.enabled		= true
em_codigo.text				= ''
st_nombre.text				= ''
em_grupo.text				= ''
dw_informe.reset()
em_codigo.setfocus()
is_ventana				= '3'
w_inf_gestion.title 	= "Informe Gestion Actual por Agente"
if dw_informe.dataobject = 'dw_informe' then
	dw_informe.object.c_por_agente.Visible	= 0
	dw_informe.object.c_clasif.Visible 		= 1
	dw_informe.object.c_rescomi.x				= 892
	dw_informe.object.c_clasif.x 				= 1527
end if

end event

type rb_supervisor from radiobutton within w_inf_gestion
integer x = 1207
integer y = 184
integer width = 384
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Supervisor"
end type

event clicked;em_grupo.visible									= false
st_grupo.visible									= false
if dw_informe.dataobject <> 'dw_informe' then
	dw_informe.dataobject 								= 'dw_informe'
	dw_informe.settransobject(sqlca)
end if
if rb_supervisor.checked = true then
	dw_informe.object.c_por_agente.Visible = 1
	dw_informe.object.c_clasif.Visible 		= 1
	dw_informe.object.c_por_agente.x			= 1733
	dw_informe.object.c_clasif.x				= 1162
	dw_informe.object.c_rescomi.x				= 663
	dw_informe.object.c_por_agente.text 	= 'Por Agente'
end if
if rb_promesas.checked=true then dw_informe.object.tot_vtas_t.text	= 'Total~rPromesas'
if rb_aumento.checked=true then dw_informe.object.tot_vtas_t.text	= 'Total~rAum.Cap.'
st_detalle.visible	= false
if dw_informe.dataobject = 'dw_resumen_promesas_por_supervisor' or dw_informe.dataobject = 'dw_resumen_promesas_por_jefe' or &
	dw_informe.dataobject = 'dw_resumen_aumento_por_supervisor' or dw_informe.dataobject = 'dw_resumen_aumento_por_jefe'then
	em_grupo.visible	= true
	st_grupo.visible	= true
end if
if dw_informe.dataobject='dwe_cartera_general_por_agente' or &
	dw_informe.dataobject='dw_detalle_general_por_jefe_venta' then
	pb_ordenar.visible	= false
	pb_filtrar.visible	= false
	pb_aceptar.enabled	= true
	wf_cargar_gestion1(dw_informe)
end if
dw_sin_detalle.visible	= false
dw_informe.visible		= true
st_detalle.visible		= false
st_volver.visible			= false
pb_general.enabled		= false
em_codigo.text				= ''
st_nombre.text				= ''
em_grupo.text				= ''
dw_informe.reset()
em_codigo.setfocus()
is_ventana				= '2'
w_inf_gestion.title 	= "Informe Gestion Actual por Supervisor"
st_grupo.text			= ' Buscar Cód.Agente '
if dw_informe.dataobject = 'dw_informe' then
	dw_informe.object.c_por_agente.Visible = 1
	dw_informe.object.c_clasif.Visible 		= 1
	dw_informe.object.c_por_agente.x			= 1733
	dw_informe.object.c_clasif.x				= 1162
	dw_informe.object.c_rescomi.x				= 663
	dw_informe.object.c_por_agente.text 	= 'Por Agente'
end if

end event

type rb_jefe from radiobutton within w_inf_gestion
integer x = 1207
integer y = 108
integer width = 384
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = " Jefe Venta"
boolean checked = true
end type

event clicked;em_grupo.visible									= false
st_grupo.visible									= false
if dw_informe.dataobject <> 'dw_informe' then
	dw_informe.dataobject 								= 'dw_informe'
	dw_informe.settransobject(sqlca)
end if
if rb_jefe.checked = true then
	dw_informe.object.c_por_agente.Visible = 1
	dw_informe.object.c_rescomi.x				= 892
	dw_informe.object.c_por_agente.x			= 1527
	dw_informe.object.c_clasif.Visible 		= 0
	dw_informe.object.c_clasif.Visible 		= 0
	dw_informe.object.c_por_agente.text 	= 'Por Supervisor'
end if
if rb_promesas.checked=true then dw_informe.object.tot_vtas_t.text	= 'Total~rPromesas'
if rb_aumento.checked=true then dw_informe.object.tot_vtas_t.text	= 'Total~rAum.Cap.'
if dw_informe.dataobject = 'dw_resumen_promesas_por_supervisor' or dw_informe.dataobject = 'dw_resumen_promesas_por_jefe' or &
	dw_informe.dataobject = 'dw_resumen_aumento_por_supervisor' or dw_informe.dataobject = 'dw_resumen_aumento_por_jefe'then
	em_grupo.visible								= true
	st_grupo.visible								= true
end if
if dw_informe.dataobject='dwe_cartera_general_por_agente' or &
	dw_informe.dataobject='dw_detalle_general_por_jefe_venta' then
	if dw_informe.dataobject='dwe_cartera_general_por_agente' then
		pb_ordenar.visible						= true
		pb_filtrar.visible						= true
	else
		pb_ordenar.visible						= false
		pb_filtrar.visible						= false
	end if
	pb_aceptar.enabled							= false
end if
dw_sin_detalle.visible							= false
dw_informe.visible								= true
st_detalle.visible								= false
st_volver.visible									= false
pb_general.enabled								= true
em_codigo.text										= ''
st_nombre.text										= ''
em_grupo.text										= ''
dw_informe.reset()
em_codigo.setfocus()
is_ventana											= '1'
w_inf_gestion.title 								= "Informe Gestion Actual por Jefe de Venta"
st_grupo.text										= ' Buscar Cód.Superv. '
if dw_informe.dataobject = 'dw_informe' then
	dw_informe.object.c_por_agente.Visible = 1
	dw_informe.object.c_rescomi.x				= 892
	dw_informe.object.c_por_agente.x			= 1527
	dw_informe.object.c_clasif.Visible 		= 0
	dw_informe.object.c_clasif.Visible 		= 0
	dw_informe.object.c_por_agente.text 	= 'Por Supervisor'
end if

end event

type dw_lista from datawindow within w_inf_gestion
boolean visible = false
integer x = 3177
integer y = 1568
integer width = 123
integer height = 116
string dataobject = "dw_datos_vendedor_buscar_1"
boolean livescroll = true
end type

type gb_2 from groupbox within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 2363
integer y = 36
integer width = 969
integer height = 328
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ventas Periodo"
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
end event

type gb_1 from groupbox within w_inf_gestion
integer x = 1166
integer y = 36
integer width = 635
integer height = 328
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Opciones Busqueda"
end type

type em_grupo from editmask within w_inf_gestion
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 663
integer y = 124
integer width = 411
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12639424
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!"
string displaydata = ""
end type

event ue_mousemove;if dw_informe.dataobject = 'dw_resumen_promesas_por_supervisor' or dw_informe.dataobject = 'dw_resumen_promesas_por_jefe' then
	if dw_informe.rowcount() > 0 then
		this.enabled 	= true
	else
		this.text		= ''
		this.enabled 	= false
	end if
end if
end event

event modified;String	ls_string, ls_codi,ls_opcion
Long		ll_nro_caracter, ll_row
if trim(this.text) <> '' then
	CHOOSE CASE dw_informe.dataobject
		CASE 'dw_resumen_promesas_por_jefe','dw_resumen_aumento_por_jefe'
			ll_row	= dw_informe.Find("agentes_cod_sup ='" +trim(this.text)+"'", 1, dw_informe.RowCount())
			if ll_row > 0 then
				ls_string	= '1'
				ll_nro_caracter	= len(trim(this.text))
				ll_nro_caracter	= (5 - ll_nro_caracter)
				ls_codi				= trim(this.text) + space(ll_nro_caracter)
				ls_string			= ls_string+string(date(gd_fecha_inicio))+string(date(gd_fecha_fin))+ls_codi+string(il_empresa)
				if rb_promesas.checked=true then ls_opcion='O'
				if rb_aumento.checked=true then ls_opcion='A'
				ls_string			= ls_string+'~t'+ls_opcion
				OpenWithParm(w_muestra_detalle_gestion,ls_string)
			else
				messagebox("Advertencia","No existe Código")
			end if
		CASE 'dw_resumen_promesas_por_supervisor','dw_resumen_aumento_por_supervisor'
			ll_row	= dw_informe.Find("agentes_cod_age ='" +trim(this.text)+"'", 1, dw_informe.RowCount())
			if ll_row > 0 then
				ls_string	= '2'
				ll_nro_caracter	= len(trim(this.text))
				ll_nro_caracter	= (5 - ll_nro_caracter)
				ls_codi				= trim(this.text) + space(ll_nro_caracter)
				ls_string			= ls_string+string(date(gd_fecha_inicio))+string(date(gd_fecha_fin))+ls_codi+string(il_empresa)
				if rb_promesas.checked=true then ls_opcion='O'
				if rb_aumento.checked=true then ls_opcion='A'
				ls_string			= ls_string+'~t'+ls_opcion
				OpenWithParm(w_muestra_detalle_gestion,ls_string)
			else
				messagebox("Advertencia","No existe Código")
			end if
	END CHOOSE
end if
end event

type gb_3 from groupbox within w_inf_gestion
integer x = 37
integer y = 36
integer width = 1111
integer height = 328
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Ingrese Código"
end type

type st_porc from statictext within w_inf_gestion
boolean visible = false
integer x = 1454
integer y = 1188
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

type hpb_1 from hprogressbar within w_inf_gestion
boolean visible = false
integer x = 914
integer y = 1264
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_fondo from statictext within w_inf_gestion
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

type st_volver from statictext within w_inf_gestion
boolean visible = false
integer x = 2455
integer y = 2000
integer width = 315
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

event clicked;pb_ordenar.visible 	= false
pb_filtrar.visible	= false
this.visible			= false
pb_aceptar.enabled	= true
st_detalle.visible	= false
dw_informe.visible	= true
st_detalle.visible	= false
st_volver.visible		= false
dw_sin_detalle.visible	= false
wf_cargar_gestion1(dw_informe)

end event

type st_imprimir from statictext within w_inf_gestion
event ue_mousemove pbm_mousemove
boolean visible = false
integer x = 3127
integer y = 864
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 31457278
string text = "Imprimir"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
end event

type st_fondo_pregunta from statictext within w_inf_gestion
boolean visible = false
integer x = 859
integer y = 452
integer width = 1326
integer height = 912
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
boolean underline = true
long backcolor = 80269524
string text = "Seleccione Opción"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_informe from datawindow within w_inf_gestion
event ue_mousemove pbm_mousemove
integer x = 41
integer y = 388
integer width = 3063
integer height = 1736
string dataobject = "dw_informe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_mousemove;st_procesar.visible	= false
st_exportar.visible	= false
st_imprimir.visible	= false
st_agentes_general.visible	= false
st_ordenar.visible	= false
st_filtrar.visible	= false
st_licencias.visible	= false
end event

event clicked;String	ls_columna, ls_cadena, ls_codigo, ls_colx
Long		ll_nro_caracter
Int		li_new

if this.dataobject = 'dwe_cartera_general_por_agente' or &
	this.dataobject = 'dw_detalle_general_por_jefe_venta' then
	if row > 0 then
		This.SelectRow(0, FALSE)
		This.SelectRow(row, TRUE)
	end if
else
	if dw_informe.dataobject = 'dw_lista_res_comi_jefe' or &
		dw_informe.dataobject = 'dw_lista_res_comi' or &
		dw_informe.dataobject = 'dw_lista_res_comi_sup' or &
		dw_informe.dataobject = 'dw_lista_clasif_hist_sup' or &
		dw_informe.dataobject = 'dw_lista_clasif_hist' then
		st_volver.visible			= true
	end if
	em_grupo.text					= ''
	em_grupo.visible 				= false
	st_grupo.visible 				= false
	if gs_conexion = "Parque El Prado" then
		il_empresa 		= 1
	elseif gs_conexion = "Parque La Foresta" then
		il_empresa 		= 2
	elseif gs_conexion = "Parque Concepción" then
		il_empresa 		= 3
	end if
	ls_columna						= dwo.name
	if this.rowcount() > 0 then
		if this.dataobject = 'dw_informe' then
			if rb_jefe.checked = true then
				ls_cadena			= "1"
			end if
			if rb_supervisor.checked = true then
				ls_cadena			= "2"
			end if
			if rb_agente.checked = true then
				ls_cadena			= "3"
			end if
			ll_nro_caracter		= len(trim(em_codigo.text))
			ll_nro_caracter		= (5 - ll_nro_caracter)
			ls_codigo				= trim(em_codigo.text) + space(ll_nro_caracter)
			ls_cadena				= ls_cadena + ls_codigo
			ls_cadena				= ls_cadena + trim(em_1.text) + trim(em_2.text)
			f_color_titulo(dw_informe,ls_columna)
			CHOOSE CASE ls_columna
				CASE 'c_rescomi'
					st_volver.visible			= true
					if rb_jefe.checked = true then		//agente
						dw_informe.dataobject 					= 'dw_lista_res_comi_jefe'
						dw_informe.settransobject(sqlca)
						dw_informe.retrieve(is_codigo_jef)
						dw_informe.object.c_codigo.text		= is_codigo_jef
						dw_informe.object.c_estado.text		= "XXX"
						dw_informe.object.c_rut.text			= string(il_rut_jefe)
						dw_informe.object.c_nombre.text		= is_nom_jefe
						dw_informe.object.c_fecha_ini.text	= "XXX"
					end if
					if rb_agente.checked = true then		//agente
						dw_informe.dataobject 					= 'dw_lista_res_comi'
						dw_informe.settransobject(sqlca)
						dw_informe.retrieve(is_codigo_age)
						dw_informe.object.c_codigo.text		= is_codigo_age
						dw_informe.object.c_estado.text		= is_estado_age
						dw_informe.object.c_rut.text			= string(il_rut_agente)
						dw_informe.object.c_nombre.text		= is_nom_age
						dw_informe.object.c_fecha_ini.text	= string(id_fec_ini_age)
					end if
					if rb_supervisor.checked = true then	//supervisor
						dw_informe.dataobject = 'dw_lista_res_comi_sup'
						dw_informe.settransobject(sqlca)
						dw_informe.retrieve(is_codigo_sup)
						dw_informe.object.c_codigo.text		= is_codigo_sup
						dw_informe.object.c_estado.text		= is_estado_sup
						dw_informe.object.c_rut.text			= string(il_rut_supervisor)
						dw_informe.object.c_nombre.text		= is_nom_sup
						dw_informe.object.c_fecha_ini.text	= string(id_fec_ini_sup)
					end if
					
				CASE 'c_clasif'
					st_volver.visible			= true
					if rb_supervisor.checked = true then	//supervisor
						dw_informe.dataobject = 'dw_lista_clasif_hist_sup' //superv
						dw_informe.settransobject(sqlca)
						dw_informe.retrieve(is_codigo_sup)
						dw_informe.object.c_codigo.text		= is_codigo_sup
						dw_informe.object.c_estado.text		= is_estado_sup
						dw_informe.object.c_rut.text			= string(il_rut_supervisor)
						dw_informe.object.c_nombre.text		= is_nom_sup
						dw_informe.object.c_fecha_ini.text	= string(id_fec_ini_sup)
					end if
					if rb_agente.checked = true then		//agente
						dw_informe.dataobject = 'dw_lista_clasif_hist'  //agente
						dw_informe.settransobject(sqlca)
						dw_informe.retrieve(is_codigo_age)
						dw_informe.object.c_codigo.text		= is_codigo_age
						dw_informe.object.c_estado.text		= is_estado_age
						dw_informe.object.c_rut.text			= string(il_rut_agente)
						dw_informe.object.c_nombre.text		= is_nom_age
						dw_informe.object.c_fecha_ini.text	= string(id_fec_ini_age)
					end if
					
				CASE 'c_detalle_moras'
					pb_ordenar.visible 		= false
					dw_informe.dataobject = 'dw_detalle_ciotas_pagadas'
					dw_informe.settransobject(sqlca)
					li_new	= dw_informe.insertrow(0)
					dw_informe.scrolltorow(li_new)
					wf_cargar_moras(li_new)
					
				CASE 'c_grafico'
					pb_ordenar.visible 		= false
					pb_ordenar.visible 		= false
					if (il_tot_v>0 or il_tot_r>0 or il_tot_n>0 or il_tot_p>0 or il_tot_c>0 or il_tot_dia>0 or il_tot_mora>0) and (em_1.text<>'' and em_2.text<>'') then
						if this.object.c_grafico.text = 'Mostrar Gráfico' then
							this.object.g_graf.Visible = 1
							this.object.c_grafico.text = 'Sacar Gráfico'
						else
							this.object.g_graf.Visible = 0
							this.object.c_grafico.text = 'Mostrar Gráfico'
						end if
					end if
					
				CASE 'c_por_agente'
					if this.object.c_por_agente.text = 'Por Supervisor' then
						if rb_promesas.checked=true then
							pb_ordenar.visible 		= true
							dw_informe.dataobject	= 'dw_resumen_promesas_por_jefe'
							dw_informe.settransobject(sqlca)
							dw_informe.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
							dw_informe.object.titulo.text	= 'Resumen Actual de Supervisores por Jefe Venta'
							ls_colx = dw_informe.describe("fec_ing_t.x")
							dw_informe.Modify("datawindow.horizontalscrollsplit=" + ls_colx)
							dw_informe.object.usuario.text = gs_user
						elseif rb_aumento.checked=true then
							pb_ordenar.visible 		= true
							dw_informe.dataobject	= 'dw_resumen_aumento_por_jefe'
							dw_informe.settransobject(sqlca)
							dw_informe.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
							dw_informe.object.titulo.text	= 'Resumen Actual de Supervisores por Jefe Venta'
							ls_colx = dw_informe.describe("fec_ing_t.x")
							dw_informe.Modify("datawindow.horizontalscrollsplit=" + ls_colx)
							dw_informe.object.usuario.text = gs_user
						end if

					elseif this.object.c_por_agente.text = 'Por Agente' then
						if rb_promesas.checked=true then
							pb_ordenar.visible 		= true
							dw_informe.dataobject	= 'dw_resumen_promesas_por_supervisor'
							dw_informe.settransobject(sqlca)
							dw_informe.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
							dw_informe.object.titulo.text	= 'Resumen Actual de Agentes por Supervisor'
							ls_colx = dw_informe.describe("fec_ing_t.x")
							dw_informe.Modify("datawindow.horizontalscrollsplit=" + ls_colx)
							dw_informe.object.usuario.text = gs_user
						elseif rb_aumento.checked=true then
							pb_ordenar.visible 		= true
							dw_informe.dataobject	= 'dw_resumen_aumento_por_supervisor'
							dw_informe.settransobject(sqlca)
							dw_informe.retrieve(gd_fecha_inicio,gd_fecha_fin,trim(is_codigo),il_empresa)
							dw_informe.object.titulo.text	= 'Resumen Actual de Agentes por Supervisor'
							ls_colx = dw_informe.describe("fec_ing_t.x")
							dw_informe.Modify("datawindow.horizontalscrollsplit=" + ls_colx)
							dw_informe.object.usuario.text = gs_user
						end if
						
					end if
			END CHOOSE
			
		elseif this.dataobject = 'dw_resumen_promesas_por_jefe' or this.dataobject = 'dw_resumen_promesas_por_supervisor' or &
				 this.dataobject = 'dw_resumen_aumento_por_jefe' or this.dataobject = 'dw_resumen_aumento_por_supervisor' then
			CHOOSE CASE ls_columna
				CASE 'c_volver'
					pb_ordenar.visible 		= false
					wf_cargar_gestion1(dw_informe)
			END CHOOSE
			
		elseif this.dataobject = 'dw_detalle_ciotas_pagadas' then
			CHOOSE CASE ls_columna
				CASE 'c_informe_gestion'
					pb_ordenar.visible 		= false
					wf_cargar_gestion1(dw_informe)
			END CHOOSE
		end if
	end if
	if this.dataobject = 'dw_resumen_promesas_por_jefe' or this.dataobject = 'dw_resumen_aumento_por_jefe' then 
		st_grupo.text		= ' Buscar Cód.Superv. '
		st_grupo.visible 	= true
		em_grupo.visible 	= true
		em_grupo.setfocus()
	end if
	if this.dataobject = 'dw_resumen_promesas_por_supervisor' or this.dataobject = 'dw_resumen_aumento_por_supervisor' then
		st_grupo.text		= ' Buscar Cód.Agente '
		st_grupo.visible = true
		em_grupo.visible = true
		em_grupo.setfocus()
	end if
end if
end event

event doubleclicked;String	ls_columna, ls_cadena, ls_codigo, ls_formula, ls_fec_ini, ls_fec_fin, ls_string,&
			ls_op_base,ls_tipo_fecha='U'
Long		ll_nro_caracter, ll_valor
Int		li_new
ls_columna	= dwo.name
if this.dataobject = 'dwe_cartera_general_por_agente' or &
	this.dataobject = 'dw_detalle_general_por_jefe_venta' then
	if row > 0 then
		ls_fec_ini	= trim(em_1.text)
		ls_fec_fin	= trim(em_2.text)
		if this.dataobject = 'dwe_cartera_general_por_agente' then
			ls_codigo	= this.getitemstring(this.getrow(),'cod_agente')
			if rb_activo.checked=true then
				ls_string	= ls_codigo+'~t'+ls_fec_ini+'~t'+ls_fec_fin+'~t'+'1'+'~t'+ls_tipo_fecha
			end if
			if rb_inactivo.checked=true then
				ls_string	= ls_codigo+'~t'+ls_fec_ini+'~t'+ls_fec_fin+'~t'+'2'+'~t'+ls_tipo_fecha
			end if
			if rb_con_ventas.checked=true then
				ls_string	= ls_codigo+'~t'+ls_fec_ini+'~t'+ls_fec_fin+'~t'+'3'+'~t'+ls_tipo_fecha
			end if
			if rb_todos.checked=true then
				ls_string	= ls_codigo+'~t'+ls_fec_ini+'~t'+ls_fec_fin+'~t'+'4'+'~t'+ls_tipo_fecha
			end if
			OpenWithParm(w_detalle_ventas_agente, ls_string)
		elseif this.dataobject = 'dw_detalle_general_por_jefe_venta' then
			gi_numero = this.getitemnumber(this.getrow(),'oferta_v_nro_oferta')
			gi_tipo_busqueda = 8
			Open(w_listado_contratos)
		end if
	end if
else
	if this.rowcount() > 0 then
		if this.dataobject = 'dw_informe' then
			if rb_jefe.checked = true then
				ls_cadena	= "1"
			end if
			if rb_supervisor.checked = true then
				ls_cadena	= "2"
			end if
			if rb_agente.checked = true then
				ls_cadena	= "3"
			end if
			if rb_promesas.checked=true then
				ls_op_base		= 'O'
			elseif rb_aumento.checked=true then
				ls_op_base		= 'A'
			end if
			ll_nro_caracter	= len(trim(em_codigo.text))
			ll_nro_caracter	= (5 - ll_nro_caracter)
			ls_codigo			= trim(em_codigo.text) + space(ll_nro_caracter)
			ls_cadena			= ls_cadena + ls_codigo
			ls_cadena			= ls_cadena + trim(em_1.text) + trim(em_2.text)
			CHOOSE CASE ls_columna
				CASE 'tot_vtas','c_cien','tot_vtas_t'
					ls_cadena	= ls_cadena +'%'+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					OpenWithParm(w_detalle_totales, ls_cadena)
				CASE 'tot_nulas_n','c_por_resciliados','tot_nulas_n_t'
					ls_cadena	= ls_cadena +'N'+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					OpenWithParm(w_detalle_totales, ls_cadena)
				CASE 'tot_resueltas','c_tot_resuelta','tot_resueltas_t'
					ls_cadena	= ls_cadena +'R'+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					OpenWithParm(w_detalle_totales, ls_cadena)
				CASE 'tot_nulas_p','c_por_nulas_p','tot_nulas_p_t'
					ls_cadena	= ls_cadena +'P'+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					OpenWithParm(w_detalle_totales, ls_cadena)
				CASE 'tot_canceladas','c_por_canc','tot_canceladas_t'
					ls_cadena	= ls_cadena +'C'+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					OpenWithParm(w_detalle_totales, ls_cadena)
				CASE 'tot_vigentes','c_por_vigente','tot_vigentes_t'
					ls_cadena	= ls_cadena +'V'+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					OpenWithParm(w_detalle_totales, ls_cadena)
				CASE 'tot_al_dia','porce_vig','tot_al_dia_t'
					ls_cadena	= ls_cadena +'A'+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					OpenWithParm(w_detalle_totales, ls_cadena)
				CASE 'tot_moras','porce_mora','tot_en_mora_t'
					ls_cadena	= ls_cadena +'M'+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					OpenWithParm(w_detalle_totales, ls_cadena)
			END CHOOSE
		elseif this.dataobject = 'dw_detalle_ciotas_pagadas' then
			if mid(ls_columna,1,1) = 'c' then
				ll_valor				= this.getitemnumber(1,ls_columna)
				if ll_valor > 0 then
					ll_nro_caracter	= len(trim(is_codigo))
					ll_nro_caracter	= (5 - ll_nro_caracter)
					is_codigo			= trim(is_codigo) + space(ll_nro_caracter)
					if rb_jefe.checked = true then ls_cadena = '1'
					if rb_supervisor.checked = true then ls_cadena = '2'
					if rb_agente.checked = true then ls_cadena = '3'
					if rb_promesas.checked=true then
						ls_op_base			= 'O'
					elseif rb_aumento.checked=true then
						ls_op_base			= 'A'
					end if
					ls_cadena			= ls_cadena + is_codigo
					ls_cadena			= ls_cadena + string(date(gd_fecha_inicio)) + string(date(gd_fecha_fin))
					ls_formula			= wf_muestra_detalle_cuotas(ls_columna)
					ls_formula			= ls_formula+'~t'+ls_cadena+'~t'+ls_columna+'~t'+ls_op_base+'~t'+ls_tipo_fecha
					if il_sw	= 0 then	openwithparm(w_muestra_detalle_cuota,ls_formula)
				end if
			end if
		end if
	end if
end if
end event

event rowfocuschanged;if this.dataobject = 'dwe_cartera_general_por_agente' or &
	this.dataobject = 'dw_detalle_general_por_jefe_venta' then
	if this.getrow() > 0 then
		This.SelectRow(0, FALSE)
		This.SelectRow(this.getrow(), TRUE)
	end if
end if
end event

type dw_sin_detalle from datawindow within w_inf_gestion
boolean visible = false
integer x = 41
integer y = 388
integer width = 3063
integer height = 1736
string dataobject = "dw_detalle_general_por_jefe_venta_resume"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_inf_gestion
integer x = 1819
integer y = 36
integer width = 526
integer height = 328
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tipo Contrato"
end type

