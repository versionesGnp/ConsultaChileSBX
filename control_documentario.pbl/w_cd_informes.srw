forward
global type w_cd_informes from window
end type
type dw_print from datawindow within w_cd_informes
end type
type st_6 from statictext within w_cd_informes
end type
type cb_grabar from commandbutton within w_cd_informes
end type
type cb_filtrar1 from commandbutton within w_cd_informes
end type
type cb_sort1 from commandbutton within w_cd_informes
end type
type cb_exportar1 from commandbutton within w_cd_informes
end type
type cb_hora from commandbutton within w_cd_informes
end type
type st_5 from statictext within w_cd_informes
end type
type dw_encargados from datawindow within w_cd_informes
end type
type st_4 from statictext within w_cd_informes
end type
type p_entrega from picture within w_cd_informes
end type
type em_fec_entrega from editmask within w_cd_informes
end type
type pb_eliminar from picturebutton within w_cd_informes
end type
type pb_insertar from picturebutton within w_cd_informes
end type
type st_3 from statictext within w_cd_informes
end type
type st_2 from statictext within w_cd_informes
end type
type dw_contratos from datawindow within w_cd_informes
end type
type cb_filtrar from commandbutton within w_cd_informes
end type
type cb_sort from commandbutton within w_cd_informes
end type
type cb_exportar from commandbutton within w_cd_informes
end type
type cb_imprimir from commandbutton within w_cd_informes
end type
type cb_limpiar from commandbutton within w_cd_informes
end type
type cb_detalle from commandbutton within w_cd_informes
end type
type pb_aceptar from picturebutton within w_cd_informes
end type
type p_fin from picture within w_cd_informes
end type
type em_fec_fin from editmask within w_cd_informes
end type
type p_ini from picture within w_cd_informes
end type
type cb_cerrar from commandbutton within w_cd_informes
end type
type dw_lista from datawindow within w_cd_informes
end type
type gb_3 from groupbox within w_cd_informes
end type
type em_fec_ini from editmask within w_cd_informes
end type
type st_11 from statictext within w_cd_informes
end type
type st_1 from statictext within w_cd_informes
end type
type st_21 from statictext within w_cd_informes
end type
type gb_4 from groupbox within w_cd_informes
end type
type dw_ref from datawindow within w_cd_informes
end type
type em_memo from editmask within w_cd_informes
end type
type gb_1 from groupbox within w_cd_informes
end type
end forward

global type w_cd_informes from window
integer width = 3552
integer height = 1956
boolean titlebar = true
string title = "Informes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_mousemove ( )
dw_print dw_print
st_6 st_6
cb_grabar cb_grabar
cb_filtrar1 cb_filtrar1
cb_sort1 cb_sort1
cb_exportar1 cb_exportar1
cb_hora cb_hora
st_5 st_5
dw_encargados dw_encargados
st_4 st_4
p_entrega p_entrega
em_fec_entrega em_fec_entrega
pb_eliminar pb_eliminar
pb_insertar pb_insertar
st_3 st_3
st_2 st_2
dw_contratos dw_contratos
cb_filtrar cb_filtrar
cb_sort cb_sort
cb_exportar cb_exportar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_detalle cb_detalle
pb_aceptar pb_aceptar
p_fin p_fin
em_fec_fin em_fec_fin
p_ini p_ini
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_3 gb_3
em_fec_ini em_fec_ini
st_11 st_11
st_1 st_1
st_21 st_21
gb_4 gb_4
dw_ref dw_ref
em_memo em_memo
gb_1 gb_1
end type
global w_cd_informes w_cd_informes

type variables
String		is_opcion,is_base,is_serie
Long		il_row_origen,il_row_destino,il_aceptar=0
Double	il_numero
DragObject control_dw
end variables

event open;Datetime		ld_fec_ini, ld_fec_fin
String		ls_hora
gf_centrar(w_cd_informes)
dw_contratos.dataobject				= 'dw_lista_contratos_informes'
dw_contratos.settransobject(sqlca)
dw_print.settransobject(sqlca)
dw_ref.settransobject(sqlca)
dw_ref.insertrow(0)
dw_contratos.enabled					= false
pb_insertar.enabled					= false
pb_eliminar.enabled					= false
cb_imprimir.enabled					= false
is_opcion								= Message.StringParm
em_fec_ini.text						= string(today(),"dd/mm/yyyy")
em_fec_fin.text						= string(today(),"dd/mm/yyyy")
em_fec_entrega.text					= string(today(),"dd/mm/yyyy")
ld_fec_ini								= datetime(date(em_fec_ini.text))
ld_fec_fin								= datetime(date(em_fec_fin.text),time('23:59:59'))
st_4.visible							= true
em_fec_entrega.visible				= true
p_entrega.visible						= true
dw_ref.visible							= true
CHOOSE CASE is_opcion
	CASE 'G' //Entrega Documentos agentes
		em_memo.text					= ''
		st_4.visible					= false
		em_fec_entrega.visible		= false
		p_entrega.visible				= false
		st_6.visible					= false
		em_memo.visible				= false
		dw_ref.visible					= false
		dw_contratos.dataobject		= 'dw_lista_contratos_informes_2'
		dw_contratos.settransobject(sqlca)
		this.title						= 'Entrega de Documento(s) Agentes (Estado 2)'
		dw_lista.dataobject			= 'dw_lista_informe_entrega_agentes'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,2,2)
		dw_encargados.dataobject	= 'dwe_lista_encargados_agente'
		dw_encargados.settransobject(sqlca)
		if gs_empresa = 'El Prado' then
			dw_lista.object.t_parque.text		= 'INMOBILIARIA PARQUE LA FLORIDA SpA'
		elseif gs_empresa = 'La Foresta' then
			dw_lista.object.t_parque.text		= 'INMOBILIARIA PARQUE LA SERENA SpA'
		elseif gs_empresa = 'Concepcion' then
			dw_lista.object.t_parque.text		= 'PARQUE DE CONCEPCION SpA'
		end if
	CASE 'E' //Entrega Documentos Operaciones
		em_memo.text					= ''
		st_6.visible					= false
		dw_ref.visible					= false
		em_memo.visible				= false
		this.title						= 'Entrega de Documento(s) a Departamento Operaciones (Estado 4)'
		dw_lista.dataobject			= 'dw_lista_informe_detalle_aceptado'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,4)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	CASE 'N' //Entrega Documentos Nulos Operaciones
		em_memo.text					= ''
		st_6.visible					= false
		dw_ref.visible					= false
		em_memo.visible				= false
		this.title						= 'Entrega de Documento(s) Nulo a Departamento Atención y Servicio al Cliente (Estado 102)'
		dw_lista.dataobject			= 'dw_lista_informe_detalle_nulos'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,102)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	CASE 'S' //Entrega Documentos Supervisores
		em_memo.text					= ''
		st_6.visible					= false
		dw_ref.visible					= false
		em_memo.visible				= false
		this.title						= 'Entrega de Documento(s) a Supervisores (Estado 3)'
		dw_lista.dataobject			= 'dw_lista_informe_entrega_supervisor'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,3)
		dw_encargados.dataobject	= 'dwe_lista_encargados_supervisor'
		dw_encargados.settransobject(sqlca)
	CASE 'D' //Devolución Documentos
		em_memo.text					= ''
		st_6.visible					= false
		dw_ref.visible					= false
		em_memo.visible				= false
		this.title						= 'Devolución de Documentos (Estado 12)'
		dw_lista.dataobject			= 'dw_lista_informe_devolucion_supervisor'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,12)
		dw_encargados.dataobject	= 'dwe_lista_encargados_supervisor'
		dw_encargados.settransobject(sqlca)
	CASE 'C' //Devolución Documentos a Depto. Adm. Venta
		em_memo.text					= ''
		st_6.visible					= true
		dw_ref.visible					= true
//		em_memo.visible				= true
		this.title						= 'Devolución de Documentos a Depto. Adm. Ventas (Estado 10)'
		dw_lista.dataobject			= 'dw_lista_informe_por_devolucion_opera' //'dw_lista_informe_detalle_rechazado'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,10)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	CASE 'A' //Devolución Documentos a Depto. At. Cliente
		em_memo.text					= ''
		st_6.visible					= true
		dw_ref.visible					= true
//		em_memo.visible				= true
		this.title						= 'Devolución de Documentos a Depto. At. Cliente (Estado 17)'
		dw_lista.dataobject			= 'dw_lista_informe_por_devolucion_opera_ac'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,17)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
		
	CASE 'T' //Devolución Documentos a Depto. At. Terreno
		em_memo.text					= ''
		st_6.visible					= true
		dw_ref.visible					= true
//		em_memo.visible				= true
		this.title						= 'Devolución de Documentos a Depto. At. Terreno (Estado 27)'
		dw_lista.dataobject			= 'dw_lista_informe_por_devolucion_opera_at'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,27)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
		
	CASE 'J' //Entrega Documentos al Ejecutivo Terreno
		em_memo.text					= ''
		st_6.visible					= true
		dw_ref.visible					= true
		this.title						= 'Entrega de Documentos a Depto. At. Terreno (Estado 21)'
		dw_lista.dataobject			= 'dw_lista_informe_entrega_ejecutivo_terre'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,21)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	
	CASE 'P' //Entrega Documentos a Operaciones
		em_memo.text					= ''
		st_6.visible					= true
		dw_ref.visible					= true
		this.title						= 'Entrega de Documentos a Depto. Operaciones (Estado 23)'
		dw_lista.dataobject			= 'dw_lista_informe_entrega_dcto_opera'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,23)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
		
	CASE 'U' //Entrega Documentos NULOS a Operaciones
		em_memo.text					= ''
		st_6.visible					= true
		dw_ref.visible					= true
		this.title						= 'Entrega de Documentos NULOS a Depto. Operaciones (Estado 104)'
		dw_lista.dataobject			= 'dw_lista_informe_entrega_dcto_opera'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,104)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	
	CASE 'I' //Recepcion Documentos del Ejecutivo
		em_memo.text					= ''
		st_6.visible					= true
		dw_ref.visible					= true
		this.title						= 'Recepción de Documentos del Ejecutivo (Estado 22)'
		dw_lista.dataobject			= 'dw_lista_informe_entrega_dcto_opera'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,22)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	
	CASE 'V' //Devolución de Documentos
		em_memo.text					= ''
		st_6.visible					= true
		dw_ref.visible					= true
		this.title						= 'Devolución de Documentos al Ejecutivo (Estado 28)'
		dw_lista.dataobject			= 'dw_lista_informe_por_devolucion_opera_at'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,28)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
END CHOOSE
if is_opcion='E' or is_opcion='A' or is_opcion='C' or is_opcion='N' or is_opcion='T' or &
	is_opcion='J' or is_opcion='P' or is_opcion='U' or is_opcion='I' or is_opcion='V' then
//	if gs_depto='O' then 
//		idw_detalle.retrieve('V')
//	elseif gs_depto='V' then
//		idw_detalle.retrieve('O')
//	else
		idw_detalle.retrieve('%')
//	end if
end if
dw_encargados.insertrow(0)
ls_hora									= string(Now(),"hh : mm : ss")
dw_lista.object.t_hora.text		= trim(ls_hora)
dw_encargados.enabled				= false
em_fec_entrega.enabled				= false
p_entrega.enabled						= false
cb_hora.enabled						= false
//pb_aceptar.triggerevent(clicked!)
em_fec_ini.setfocus()
end event

on w_cd_informes.create
this.dw_print=create dw_print
this.st_6=create st_6
this.cb_grabar=create cb_grabar
this.cb_filtrar1=create cb_filtrar1
this.cb_sort1=create cb_sort1
this.cb_exportar1=create cb_exportar1
this.cb_hora=create cb_hora
this.st_5=create st_5
this.dw_encargados=create dw_encargados
this.st_4=create st_4
this.p_entrega=create p_entrega
this.em_fec_entrega=create em_fec_entrega
this.pb_eliminar=create pb_eliminar
this.pb_insertar=create pb_insertar
this.st_3=create st_3
this.st_2=create st_2
this.dw_contratos=create dw_contratos
this.cb_filtrar=create cb_filtrar
this.cb_sort=create cb_sort
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_detalle=create cb_detalle
this.pb_aceptar=create pb_aceptar
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.p_ini=create p_ini
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_3=create gb_3
this.em_fec_ini=create em_fec_ini
this.st_11=create st_11
this.st_1=create st_1
this.st_21=create st_21
this.gb_4=create gb_4
this.dw_ref=create dw_ref
this.em_memo=create em_memo
this.gb_1=create gb_1
this.Control[]={this.dw_print,&
this.st_6,&
this.cb_grabar,&
this.cb_filtrar1,&
this.cb_sort1,&
this.cb_exportar1,&
this.cb_hora,&
this.st_5,&
this.dw_encargados,&
this.st_4,&
this.p_entrega,&
this.em_fec_entrega,&
this.pb_eliminar,&
this.pb_insertar,&
this.st_3,&
this.st_2,&
this.dw_contratos,&
this.cb_filtrar,&
this.cb_sort,&
this.cb_exportar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.cb_detalle,&
this.pb_aceptar,&
this.p_fin,&
this.em_fec_fin,&
this.p_ini,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_3,&
this.em_fec_ini,&
this.st_11,&
this.st_1,&
this.st_21,&
this.gb_4,&
this.dw_ref,&
this.em_memo,&
this.gb_1}
end on

on w_cd_informes.destroy
destroy(this.dw_print)
destroy(this.st_6)
destroy(this.cb_grabar)
destroy(this.cb_filtrar1)
destroy(this.cb_sort1)
destroy(this.cb_exportar1)
destroy(this.cb_hora)
destroy(this.st_5)
destroy(this.dw_encargados)
destroy(this.st_4)
destroy(this.p_entrega)
destroy(this.em_fec_entrega)
destroy(this.pb_eliminar)
destroy(this.pb_insertar)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_contratos)
destroy(this.cb_filtrar)
destroy(this.cb_sort)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_detalle)
destroy(this.pb_aceptar)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.p_ini)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_3)
destroy(this.em_fec_ini)
destroy(this.st_11)
destroy(this.st_1)
destroy(this.st_21)
destroy(this.gb_4)
destroy(this.dw_ref)
destroy(this.em_memo)
destroy(this.gb_1)
end on

type dw_print from datawindow within w_cd_informes
boolean visible = false
integer x = 1189
integer y = 1740
integer width = 411
integer height = 480
integer taborder = 250
string title = "none"
string dataobject = "dw_lista_informe_devolucion_supervisor"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;messagebox("",dataobject)
end event

type st_6 from statictext within w_cd_informes
integer x = 18
integer y = 192
integer width = 407
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Nº Memo"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_cd_informes
integer x = 2848
integer y = 1724
integer width = 306
integer height = 104
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;Long		ll_resp,ll_count_fila,ll_codigo,ll_tot_reg,ll_indi
String	ls_usuario,ls_referencia,ls_observacion,ls_hora,ls_nombre
Datetime	ldt_fecha,ld_fecha

ll_tot_reg	= dw_lista.rowcount()
if ll_tot_reg>0 then
	SELECT	sysdate
	INTO 		:ldt_fecha
	FROM 		"TASA"  ;
	ls_hora								= string(time(ldt_fecha),"hh : mm : ss")
	dw_lista.object.t_hora.text	= trim(ls_hora)
	ls_usuario							= dw_encargados.getitemstring(1,'usuario')
	ld_fecha								= datetime(date(em_fec_entrega.text),time(ldt_fecha))
	if isnull(ls_usuario) or ls_usuario='' then
		messagebox("Advertencia","Debe Seleccionar Usuario a Entregar Documento")
		dw_encargados.setfocus()
	else
		if not isnull(ld_fecha) then
			if is_opcion='E' then //Entrega Documentos Operaciones
				ll_codigo			= 4
			elseif is_opcion='G' then //Entrega Documentos Agente
				ll_codigo			= 2
			elseif is_opcion='S' then //Entrega Documentos Supervisores
				ll_codigo			= 3
				dw_lista.print()
			elseif is_opcion='D' then //Devolución Documentos
				ll_codigo			= 12
			elseif is_opcion='C' then //Devolución Documentos a Depto. Venta
				ll_codigo			= 10
			elseif is_opcion='A' then //Devolución Documentos a Depto. At. Cliente
				ll_codigo			= 17
			elseif is_opcion='N' then //Devolución Documentos Nulos a Depto. Operaciones
				ll_codigo			= 102
			elseif is_opcion='T' then
				ll_codigo			= 27
			elseif is_opcion='J' then
				ll_codigo			= 21
			elseif is_opcion='P' then
				ll_codigo			= 23
			elseif is_opcion='U' then
				ll_codigo			= 104
			elseif is_opcion='I' then
				ll_codigo			= 22
			elseif is_opcion='V' then
				ll_codigo			= 28
			end if
			SELECT	COUNT("CD_INFORME"."REFERENCIA")
			INTO 		:ll_count_fila  
			FROM 		"CD_INFORME"  
			WHERE 	"CD_INFORME"."CODIGO" = :ll_codigo   
			USING		sqlca;
			if isnull(ll_count_fila) or ll_count_fila=0 then 
				ll_count_fila		= 1
			else
				ll_count_fila ++
			end if
			if is_opcion='E' then //Entrega Documentos Operaciones
				SELECT	"ENCARGADOS"."NOMBRE"  
				INTO 		:ls_nombre  
				FROM 		"ENCARGADOS"  
				WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   ;
				if not isnull(ls_nombre) and ls_nombre<>'' then
					ls_observacion	= 'INFORME ENTREGA DOCUMENTOS A DEPARTAMENTO DE OPERACIONES GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+', ENTREGADO A '+ls_nombre+'.'
				else
					ls_observacion	= 'INFORME ENTREGA DOCUMENTOS A DEPARTAMENTO DE OPERACIONES GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+', ENTREGADO A '+ls_usuario+'.'
				end if
				ls_referencia		= 'ENTREGA DOCUMENTOS OPERACIONES, LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
			elseif is_opcion='N' then //Entrega Documentos Nulos a Operaciones
				SELECT	"ENCARGADOS"."NOMBRE"  
				INTO 		:ls_nombre  
				FROM 		"ENCARGADOS"  
				WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   ;
				if not isnull(ls_nombre) and ls_nombre<>'' then
					ls_observacion	= 'INFORME ENTREGA DOCUMENTOS NULOS A DEPARTAMENTO DE OPERACIONES GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+', ENTREGADO A '+ls_nombre+'.'
				else
					ls_observacion	= 'INFORME ENTREGA DOCUMENTOS NULOS A DEPARTAMENTO DE OPERACIONES GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+', ENTREGADO A '+ls_usuario+'.'
				end if
				ls_referencia		= 'ENTREGA DOCUMENTOS NULOS A OPERACIONES, LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
			elseif is_opcion='S' then //Entrega Documentos Supervisores
				ls_referencia		= 'ENTREGA DOCUMENTOS SUPERVISOR '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME ENTREGA DOCUMENTOS A SUPERVISOR '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			elseif is_opcion='G' then //Entrega Documentos Agente
				ls_referencia		= 'ENTREGA DOCUMENTOS AGENTE '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME ENTREGA DOCUMENTOS AGENTE '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			elseif is_opcion='D' then //Devolución Documentos
				ls_referencia		= 'DEVOLUCION DOCUMENTOS SUPERVISOR '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME DEVOLUCION DOCUMENTOS A SUPERVISOR '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			elseif is_opcion='C' then
				SELECT	"ENCARGADOS"."NOMBRE"  
				INTO 		:ls_nombre  
				FROM 		"ENCARGADOS"  
				WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   ;
				if not isnull(ls_nombre) and ls_nombre<>'' then
					ls_observacion	= 'INFORME DEVOLUCION DOCUMENTOS A DEPARTAMENTO DE ADMINISTRACION VENTAS GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+', ENTREGADO A '+ls_nombre+'.'
				else
					ls_observacion	= 'INFORME DEVOLUCION DOCUMENTOS A DEPARTAMENTO DE ADMINISTRACION VENTAS GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+', ENTREGADO A '+ls_usuario+'.'
				end if
				ls_referencia	= 'DEVOLUCION DOCUMENTOS ADMINISTRACION VENTAS, LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
			elseif is_opcion='A' then
				SELECT	"ENCARGADOS"."NOMBRE"  
				INTO 		:ls_nombre  
				FROM 		"ENCARGADOS"  
				WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   ;
				if not isnull(ls_nombre) and ls_nombre<>'' then
					ls_observacion	= 'INFORME DEVOLUCION DOCUMENTOS A DEPARTAMENTO DE ATENCION CLIENTE GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+', ENTREGADO A '+ls_nombre+'.'
				else
					ls_observacion	= 'INFORME DEVOLUCION DOCUMENTOS A DEPARTAMENTO DE ATENCION CLIENTE GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+', ENTREGADO A '+ls_usuario+'.'
				end if
				ls_referencia		= 'DEVOLUCION DOCUMENTOS ATENCION CLIENTE, LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
			elseif is_opcion='T' then //Devolución Documentos
				ls_referencia		= 'DEVOLUCION DOCUMENTOS ATENCION TERRENO '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME DEVOLUCION DOCUMENTOS ATENCION TERRENO '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			elseif is_opcion='J' then 
				ls_referencia		= 'ENTREGA DOCUMENTOS A EJECUTIVO EN TERRENO '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME ENTREGA DOCUMENTOS A EJECUTIVO EN TERRENO '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			elseif is_opcion='P' then 
				ls_referencia		= 'ENTREGA DOCUMENTOS A DEPTO. OPERACIONES '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME ENTREGA DOCUMENTOS A DEPTO. OPERACIONES '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			elseif is_opcion='U' then 
				ls_referencia		= 'ENTREGA DOCUMENTOS NULOS A DEPTO. OPERACIONES '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME ENTREGA DOCUMENTOS NULOS A DEPTO. OPERACIONES '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			elseif is_opcion='I' then 
				ls_referencia		= 'RECEPCION DOCUMENTOS DEL EJECUTIVO AT. TERRENO '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME RECEPCION DOCUMENTOS DEL EJECUTIVO AT. TERRENO '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			elseif is_opcion='V' then 
				ls_referencia		= 'DEVOLUCION DOCUMENTOS AL EJECUTIVO AT. TERRENO '+ls_usuario+', LISTA Nº '+STRING(ll_count_fila)+', DEL DIA '+TRIM(em_fec_entrega.text)
				ls_observacion		= 'INFORME DEVOLUCION DOCUMENTOS AL EJECUTIVO AT. TERRENO '+ls_usuario+' GENERADO POR '+gs_nombre+' EL DIA '+string(ldt_fecha)+', TOTAL DE DOCUMENTOS '+STRING(ll_tot_reg)+'.'
			end if
			INSERT INTO "CD_INFORME"  
						( "REFERENCIA",	"CORRELATIVO",		"USUARIO",	"FECHA_CREA",	"OBSERVACION",		"CANTIDAD_DCTO",	"CODIGO",	"USUARIO_ENTREGADO",	"FECHA_ENTREGA",	"COPIA" )  
			VALUES 	( :ls_referencia,	:ll_count_fila,	:gs_user,	:ldt_fecha,		:ls_observacion,	:ll_tot_reg,   	:ll_codigo,	:ls_usuario,			:ld_fecha,			1)  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit using sqlca;
				for ll_indi=1 to ll_tot_reg
					if dw_lista.dataobject='dw_lista_informe_detalle_aceptado' then
						dw_lista.setitem(ll_indi,'cd_informe_detalle_fecha_crea',ldt_fecha)
						dw_lista.setitem(ll_indi,'cd_informe_detalle_correlativo',ll_indi)
						dw_lista.setitem(ll_indi,'cd_informe_detalle_referencia',ls_referencia)
						dw_lista.setitem(ll_indi,'cd_informe_detalle_estado_cd', ll_codigo)
						dw_lista.setitem(ll_indi,'cd_informe_detalle_usuario', gs_user)
						if is_opcion<>'C' and is_opcion<>'A' then
							dw_lista.setitem(ll_indi,'cd_informe_detalle_observacion', ls_observacion)
						end if
						dw_lista.setitem(ll_indi,'cd_informe_detalle_departamento', gs_depto)
						dw_lista.setitem(ll_indi,'cd_informe_detalle_estado_registro','A')
						dw_lista.setitem(ll_indi,'cd_informe_detalle_correlativo_lista',ll_count_fila)
					else
						if dw_lista.dataobject<>'dw_lista_informe_entrega_agentes' then dw_lista.setitem(ll_indi,'fecha_crea',ldt_fecha)
						dw_lista.setitem(ll_indi,'correlativo',ll_indi)
						dw_lista.setitem(ll_indi,'referencia',ls_referencia)
						dw_lista.setitem(ll_indi,'estado_cd', ll_codigo)
						dw_lista.setitem(ll_indi,'usuario', gs_user)
						if is_opcion<>'C' and is_opcion<>'A' then
							dw_lista.setitem(ll_indi,'observacion', ls_observacion)
						end if
						dw_lista.setitem(ll_indi,'departamento', gs_depto)
						dw_lista.setitem(ll_indi,'estado_registro','A')
						dw_lista.setitem(ll_indi,'correlativo_lista',ll_count_fila)
					end if
				next
				dw_lista.accepttext()
				if dw_lista.update()=1 then
					commit;
					messagebox("Grabar","Grabación Exitosa")
					cb_imprimir.enabled					= true
					cb_imprimir.triggerevent(clicked!)
//					cb_limpiar.triggerevent(clicked!)
				else
					rollback;
					messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
				end if
			else
				rollback using sqlca;
				messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","Debe Ingresar Fecha de Entrega")
			em_fec_entrega.setfocus()
		end if
	end if
else
	messagebox("Advertencia","No Registra Dato a Imprimir")
end if
end event

type cb_filtrar1 from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 978
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_contratos.SETfilter(NULO)
dw_contratos.filter()
end event

type cb_sort1 from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 745
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_contratos.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_contratos.SETSORT(NULO)
	dw_contratos.SORT()
end if
end event

type cb_exportar1 from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 512
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_contratos
if dw_contratos.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_hora from commandbutton within w_cd_informes
integer x = 3090
integer y = 180
integer width = 407
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Actualizar Hora"
end type

event clicked;String	ls_hora

ls_hora								= string(Now(),"hh : mm : ss")
dw_lista.object.t_hora.text	= trim(ls_hora)
//dw_print.object.t_hora.text	= trim(ls_hora)
end event

type st_5 from statictext within w_cd_informes
integer x = 2021
integer y = 80
integer width = 265
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entregar a"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_encargados from datawindow within w_cd_informes
integer x = 2318
integer y = 60
integer width = 1184
integer height = 108
integer taborder = 60
boolean enabled = false
string title = "none"
string dataobject = "dwe_lista_encargados_por_depto"
boolean border = false
end type

event itemchanged;string	ls_usuario,ls_nombre,ls_cod_sup,ls_nom_sup,ls_ap_pat_sup,ls_ap_mat_sup,&
			ls_filtro
			
this.accepttext()
ls_filtro	= ''
dw_contratos.SETfilter(ls_filtro)
dw_contratos.filter()
if is_opcion='E' or is_opcion='A' or is_opcion='C' or is_opcion='N' or is_opcion='T' then
	ls_usuario	= dw_encargados.getitemstring(1,'usuario')
	if not isnull(ls_usuario) and ls_usuario<>'' then
		SELECT	"ENCARGADOS"."NOMBRE"  
		INTO 		:ls_nombre  
		FROM 		"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   ;
		dw_lista.object.t_nombre.text	= ls_nombre
	end if
elseif is_opcion='D' or is_opcion='S' or is_opcion='G' then
	ls_usuario	= dw_encargados.getitemstring(1,'usuario')
	if not isnull(ls_usuario) and ls_usuario<>'' then
		if is_opcion='D' or is_opcion='S' then
			dw_lista.reset()
			ls_filtro	= 'cod_supervisor="'+ls_usuario+'"'
			dw_contratos.SETfilter(ls_filtro)
			dw_contratos.filter()
			if dw_contratos.rowcount()<>0 then
				SELECT	"SUPERVISOR"."COD_SUP",   
							"SUPERVISOR"."NOMBRE",   
							"SUPERVISOR"."A_PATERNO",   
							"SUPERVISOR"."A_MATERNO"  
				INTO 		:ls_cod_sup,   
							:ls_nom_sup,   
							:ls_ap_pat_sup,   
							:ls_ap_mat_sup  
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_usuario   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					ls_nombre							= ls_cod_sup+' - '+ls_nom_sup+' '+ls_ap_pat_sup+' '+ls_ap_mat_sup
					dw_lista.object.t_nombre.text	= ls_nombre
				else
				end if
			end if
		elseif is_opcion='G' then
			dw_lista.reset()
			ls_filtro	= 'cod_agente="'+ls_usuario+'" and ult_estado=2'
			dw_contratos.SETfilter(ls_filtro)
			dw_contratos.filter()
		end if
	end if
end if
end event

type st_4 from statictext within w_cd_informes
integer x = 1934
integer y = 192
integer width = 352
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Entrega"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_entrega from picture within w_cd_informes
integer x = 2706
integer y = 180
integer width = 78
integer height = 88
boolean enabled = false
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
Date		ld_fec_entrega

if f_valida_fecha(em_fec_entrega.text)=-1 then 
	em_fec_entrega.text	= string(today(),gs_formato_fecha)
	em_fec_entrega.setfocus()
	return
end if	
if em_fec_entrega.text<>'00/00/0000' then
	ls_fecha 				= em_fec_entrega.text
else
	ls_fecha 				= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	em_fec_entrega.text	= Message.StringParm
	ld_fec_entrega			= date(em_fec_entrega.text)
END IF
if em_fec_entrega.text<>'00/00/0000' then 
	dw_lista.object.t_fecha.text	= trim(em_fec_entrega.text)
//	dw_print.object.t_fecha.text	= trim(em_fec_entrega.text)
end if
end event

type em_fec_entrega from editmask within w_cd_informes
integer x = 2327
integer y = 180
integer width = 370
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;if em_fec_entrega.text<>'00/00/0000' then 
	dw_lista.object.t_fecha.text	= trim(em_fec_entrega.text)
//	dw_print.object.t_fecha.text	= trim(em_fec_entrega.text)
end if
end event

type pb_eliminar from picturebutton within w_cd_informes
integer x = 1285
integer y = 1132
integer width = 160
integer height = 156
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras.jpg"
string disabledname = "atras.jpg"
end type

event clicked;if il_row_destino>0 then 
	dw_lista.deleterow(il_row_destino)
	dw_lista.accepttext() 
end if
end event

type pb_insertar from picturebutton within w_cd_informes
integer x = 1285
integer y = 652
integer width = 160
integer height = 156
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "adelante.jpg"
string disabledname = "adelante.jpg"
end type

event clicked;Long		ll_new,ll_fila,ll_tot_reg,ll_count_fila,ll_resp
Double	ll_numero
String		ls_base,ls_serie,ls_age,ls_sup,ls_jefe,ls_string,ls_numero,ls_glosa,ls_codigo,&
			ls_inserta_fila,ls_parametro,ls_pasa='S',ls_usuario,ls_cod_sup
Datetime	ld_fecha
if dw_contratos.rowcount()>0 then
	if is_opcion='G' or is_opcion='S' or is_opcion='N' or is_opcion='T' or &
		is_opcion='J' or is_opcion='P' or is_opcion='U' or is_opcion='I' or is_opcion='V' then
		ls_codigo	= dw_encargados.getitemstring(1,'usuario')
		if isnull(ls_codigo) or ls_codigo='' then
			messagebox("Advertencia","Debe Seleccionar Usuario que Entrega Documentos")
			dw_encargados.setfocus()
			ls_pasa	= 'N'
		end if
	end if
	if (is_opcion='D' or is_opcion='S') and ls_pasa='S' then
		ls_usuario	= dw_encargados.getitemstring(1,'usuario')
		ls_cod_sup	= dw_contratos.getitemstring(il_row_origen,'cod_supervisor')
		if ls_usuario<>ls_cod_sup then
			messagebox("Advertencia","Contrato No Corresponde al Supervisor Seleccionado")
			ls_pasa='N'
		end if
	end if
	if ls_pasa='S' then
		if il_row_origen>0 then
			ls_base		= dw_contratos.getitemstring(il_row_origen,'base')
			ls_serie		= dw_contratos.getitemstring(il_row_origen,'serie')
			ll_numero	= dw_contratos.getitemnumber(il_row_origen,'numero')
			ls_glosa		= trim(dw_contratos.getitemstring(il_row_origen,'ult_glosa_estado'))
			ls_numero	= string(ll_numero)
			if dw_lista.dataobject='dw_lista_informe_detalle_aceptado' then
				ls_string	= "cd_informe_detalle_base='"+ls_base+"'"+" and cd_informe_detalle_serie='"+ls_serie+"'"+" and cd_informe_detalle_numero="+trim(ls_numero)
			else
				ls_string	= "base='"+ls_base+"'"+" and serie='"+ls_serie+"'"+" and numero="+trim(ls_numero)
			end if
			ll_tot_reg	= dw_lista.RowCount()
			if ll_tot_reg>0 then ll_fila = dw_lista.Find(ls_string, 1,ll_tot_reg )
			if ll_fila>0 then
				messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+" Ya está considerado en el Informe")
				dw_contratos.setfocus()
			else
				ld_fecha	= dw_contratos.getitemdatetime(il_row_origen,'ult_fecha_estado')
				ls_age	= dw_contratos.getitemstring(il_row_origen,'cod_agente')
				ls_sup	= dw_contratos.getitemstring(il_row_origen,'cod_supervisor')
				ls_jefe	= dw_contratos.getitemstring(il_row_origen,'cod_jefe_venta')
				ll_new	= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				if dw_lista.dataobject='dw_lista_informe_detalle_aceptado' then
					dw_lista.setitem(ll_new,'cd_informe_detalle_base',ls_base)
					dw_lista.setitem(ll_new,'cd_informe_detalle_serie',ls_serie)
					dw_lista.setitem(ll_new,'cd_informe_detalle_numero',ll_numero)
					dw_lista.setitem(ll_new,'cd_informe_detalle_fecha_crea',ld_fecha)
					dw_lista.setitem(ll_new,'cd_informe_detalle_cod_agente',ls_age)
					dw_lista.setitem(ll_new,'cd_informe_detalle_cod_supervisor',ls_sup)
					dw_lista.setitem(ll_new,'cd_informe_detalle_cod_jefe_venta',ls_jefe)
					dw_lista.setitem(ll_new,'cd_informe_detalle_observacion',ls_glosa)
					dw_lista.setitem(ll_new,'cd_informe_detalle_motivo_devolucion',ls_glosa)
					dw_lista.setitem(ll_new,'cd_informe_detalle_referencia',trim(em_memo.text))
				else
					dw_lista.setitem(ll_new,'base',ls_base)
					dw_lista.setitem(ll_new,'serie',ls_serie)
					dw_lista.setitem(ll_new,'numero',ll_numero)
					dw_lista.setitem(ll_new,'fecha_crea',ld_fecha)
					dw_lista.setitem(ll_new,'cod_agente',ls_age)
					dw_lista.setitem(ll_new,'cod_supervisor',ls_sup)
					dw_lista.setitem(ll_new,'cod_jefe_venta',ls_jefe)
					dw_lista.setitem(ll_new,'observacion',ls_glosa)
					dw_lista.setitem(ll_new,'motivo_devolucion',ls_glosa)
					dw_lista.setitem(ll_new,'referencia',trim(em_memo.text))
				end if
				dw_lista.accepttext()
			end if
		end if
	end if
end if
end event

type st_3 from statictext within w_cd_informes
integer x = 1481
integer y = 296
integer width = 302
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informe"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cd_informes
integer x = 37
integer y = 296
integer width = 736
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de Contratos"
boolean focusrectangle = false
end type

type dw_contratos from datawindow within w_cd_informes
integer x = 37
integer y = 376
integer width = 1207
integer height = 1300
integer taborder = 90
string dragicon = "Form!"
string title = "none"
string dataobject = "dw_lista_contratos_informes_2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_usuario,ls_sup
if row>0 then
	il_row_origen	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_origen, TRUE)
	this.Drag(Begin!)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row_origen	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_origen, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row_origen	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_origen, TRUE)
	pb_insertar.triggerevent(clicked!)
end if
end event

type cb_filtrar from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 2240
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_sort from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 2007
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_exportar from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 1774
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 2533
integer y = 1724
integer width = 306
integer height = 104
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;Long			ll_resp,ll_count_fila,ll_codigo,ll_tot_reg,ll_indi
String		ls_usuario,ls_referencia,ls_observacion,ls_hora,ls_nombre,ls_cod_sup,&
				ls_nom_sup,ls_ap_pat_sup,ls_ap_mat_sup
Datetime		ldt_fecha,ld_fecha

ll_tot_reg								= dw_lista.rowcount()
if ll_tot_reg>0 then
	SELECT	sysdate
	INTO 		:ldt_fecha
	FROM 		"TASA"  ;
	ls_hora								= string(time(ldt_fecha),"hh : mm : ss")
	dw_lista.object.t_hora.text = trim(ls_hora)
//	dw_print.object.t_hora.text	= trim(ls_hora)
	ls_usuario							= dw_encargados.getitemstring(1,'usuario')
	ld_fecha								= datetime(date(em_fec_entrega.text),time(ldt_fecha))
	if isnull(ls_usuario) or ls_usuario='' then
		messagebox("Advertencia","Debe Seleccionar Usuario a Entregar Documento")
		dw_encargados.setfocus()
	else
		if not isnull(ld_fecha) then
			if dw_lista.rowcount() > 0 then 
				if is_opcion<>'C' and is_opcion<>'D' then //is_opcion<>'E' and 
					if is_opcion='E' then
						ll_count_fila		= dw_lista.getitemnumber(1,'cd_informe_detalle_correlativo_lista')
					else
						ll_count_fila		= dw_lista.getitemnumber(1,'correlativo_lista')
					end if
					f_Print( dw_lista )
					if is_opcion='N' or is_opcion='E' then dw_lista.print()
				elseif is_opcion='D' then//dw_lista_informe_devolucion_supervisor FALTA
					ll_count_fila		= dw_lista.getitemnumber(1,'correlativo_lista')
					if dw_print.retrieve(ll_count_fila,12)>0 then 
						dw_print.object.t_hora.text	= trim(ls_hora)
						ls_usuario	= dw_encargados.getitemstring(1,'usuario')
						SELECT	"SUPERVISOR"."COD_SUP",   
									"SUPERVISOR"."NOMBRE",   
									"SUPERVISOR"."A_PATERNO",   
									"SUPERVISOR"."A_MATERNO"  
						INTO 		:ls_cod_sup,   
									:ls_nom_sup,   
									:ls_ap_pat_sup,   
									:ls_ap_mat_sup  
						FROM 		"SUPERVISOR"  
						WHERE 	"SUPERVISOR"."COD_SUP" = :ls_usuario   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_nombre							= ls_cod_sup+' - '+ls_nom_sup+' '+ls_ap_pat_sup+' '+ls_ap_mat_sup
							dw_print.object.t_nombre.text	= ls_nombre
						end if
						dw_print.object.t_fecha.text	= trim(dw_lista.object.t_fecha.text)
						f_Print( dw_print )
						dw_print.print()
					end if
//				elseif is_opcion='D' then
//					ll_count_fila		= dw_lista.getitemnumber(1,'cd_informe_detalle_correlativo_lista')
//					if dw_print.retrieve(ll_count_fila,4)>0 then 
//						dw_print.object.t_hora.text	= trim(ls_hora)
//						ls_usuario	= dw_encargados.getitemstring(1,'usuario')
//						if not isnull(ls_usuario) and ls_usuario<>'' then
//							SELECT	"ENCARGADOS"."NOMBRE"  
//							INTO 		:ls_nombre  
//							FROM 		"ENCARGADOS"  
//							WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   ;
//							dw_print.object.t_nombre.text	= ls_nombre
//						end if
//						dw_print.object.t_fecha.text	= trim(dw_lista.object.t_fecha.text)
//						f_Print( dw_print )
//						dw_print.print()
//					end if
				elseif is_opcion='C' then
					dw_print.dataobject	= 'dw_lista_informe_por_devolucion_opera'
					dw_print.settransobject(sqlca)
					ll_count_fila		= dw_lista.getitemnumber(1,'correlativo_lista')
					if dw_print.retrieve(ll_count_fila,10)>0 then 
						dw_print.object.t_hora.text	= trim(ls_hora)
						dw_print.object.t_memo.text	= trim(em_memo.text)
						if not isnull(ls_usuario) and ls_usuario<>'' then
							SELECT	"ENCARGADOS"."NOMBRE"  
							INTO 		:ls_nombre  
							FROM 		"ENCARGADOS"  
							WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario   ;
							dw_print.object.t_nombre.text	= ls_nombre
						end if
						dw_print.object.t_fecha.text	= trim(dw_lista.object.t_fecha.text)
						f_Print( dw_print )
					end if
				end if
			end if
		else
			messagebox("Advertencia","Debe Ingresar Fecha de Entrega")
			em_fec_entrega.setfocus()
		end if
	end if
else
	messagebox("Advertencia","No Registra Dato a Imprimir")
end if
end event

type cb_limpiar from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 1513
integer y = 1740
integer width = 229
integer height = 80
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Datetime		ld_fec_ini, ld_fec_fin
String		ls_hora,ls_filtro

em_fec_ini.text									= string(today(),"dd/mm/yyyy")
em_fec_fin.text									= string(today(),"dd/mm/yyyy")
em_fec_entrega.text								= string(today(),"dd/mm/yyyy")
ld_fec_ini											= datetime(date(em_fec_ini.text))
ld_fec_fin											= datetime(date(em_fec_fin.text),time('23:59:59'))
dw_lista.reset()
dw_encargados.reset()
ls_filtro	= ''
dw_contratos.SETfilter(ls_filtro)
dw_contratos.filter()
dw_contratos.reset()
CHOOSE CASE is_opcion
	CASE 'G'
		em_memo.text								= ''
		st_6.visible								= false
		em_memo.visible							= false
		dw_contratos.dataobject					= 'dw_lista_contratos_informes_2'
		dw_contratos.settransobject(sqlca)
		dw_lista.dataobject						= 'dw_lista_informe_entrega_agentes'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,2,2)
		dw_encargados.dataobject				= 'dwe_lista_encargados_agente'
		dw_encargados.settransobject(sqlca)
		if gs_empresa = 'El Prado' then
			dw_lista.object.t_parque.text		= 'INMOBILIARIA PARQUE LA FLORIDA SpA'
		elseif gs_empresa = 'La Foresta' then
			dw_lista.object.t_parque.text		= 'INMOBILIARIA PARQUE LA SERENA SpA'
		elseif gs_empresa = 'Concepcion' then
			dw_lista.object.t_parque.text		= 'PARQUE DE CONCEPCION SpA'
		end if
	CASE 'E' //Entrega Documentos Operaciones
		dw_lista.dataobject						= 'dw_lista_informe_por_estado'
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,4)
		dw_lista.settransobject(sqlca)
		dw_encargados.dataobject				= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	CASE 'N' //Entrega Documentos Nulos Operaciones
		em_memo.text					= ''
		st_6.visible					= false
		em_memo.visible				= false
		dw_lista.dataobject			= 'dw_lista_informe_detalle_nulos'
		dw_lista.settransobject(sqlca)
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,102)
		dw_encargados.dataobject	= 'dwe_lista_encargados_por_depto'
		dw_encargados.settransobject(sqlca)
		dw_encargados.getchild('usuario',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.rowcount()=0 then
			idw_detalle.insertrow(0)
		end if
	CASE 'S' //Entrega Documentos Supervisores
		dw_lista.dataobject						= 'dw_lista_informe_entrega_supervisor'
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,3)
		dw_lista.settransobject(sqlca)
		dw_encargados.dataobject				= 'dwe_lista_encargados_supervisor'
		dw_encargados.settransobject(sqlca)
	CASE 'D' //Devolución Documentos
		dw_lista.dataobject						= 'dw_lista_informe_devolucion_supervisor'
		dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,5)
		dw_encargados.dataobject				= 'dwe_lista_encargados_supervisor'
		dw_encargados.settransobject(sqlca)
END CHOOSE
if is_opcion='E' or is_opcion='A' or is_opcion='C' then
//	if gs_depto='O' then 
//		idw_detalle.retrieve('V')
//	elseif gs_depto='V' then
//		idw_detalle.retrieve('O')
//	else
		idw_detalle.retrieve('%')
//	end if
end if
dw_encargados.insertrow(0)
ls_hora												= string(Now(),"hh : mm : ss")
dw_lista.object.t_hora.text 					= trim(ls_hora)
dw_encargados.enabled							= false
em_fec_entrega.enabled							= false
p_entrega.enabled									= false
cb_hora.enabled									= false
end event

type cb_detalle from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 1724
integer width = 370
integer height = 104
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Gestión"
end type

event clicked;String	ls_string
if dw_contratos.rowcount()>0 then
	is_base		= dw_contratos.getitemstring(il_row_origen,'base')
	is_serie		= dw_contratos.getitemstring(il_row_origen,'serie')
	il_numero	= dw_contratos.getitemnumber(il_row_origen,'numero')
	ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)
	if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
	if not isnull(is_base) and il_numero>0 then openwithparm(w_cd_consultas_detalle_gestion,ls_string)
end if
end event

type pb_aceptar from picturebutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 1582
integer y = 32
integer width = 183
integer height = 156
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
string disabledname = "ok_no2.bmp"
end type

event clicked;Datetime	ld_fec_fin,ld_fec_ini
String	ls_filtro
SetPointer(HourGlass!)
dw_lista.reset()
ls_filtro	= ''
dw_contratos.SETfilter(ls_filtro)
dw_contratos.filter()
il_aceptar ++
ld_fec_ini									= datetime(date(em_fec_ini.text))
ld_fec_fin									= datetime(date(em_fec_fin.text),time('23:59:59'))
if (trim(em_memo.text)='' or isnull(trim(em_memo.text))) and em_memo.visible=true then
	messagebox("Advertencia","Debe Ingresar Nº Memorandum")
	em_memo.setfocus()
elseif trim(em_memo.text)<>'' and em_memo.visible=true then
	dw_contratos.enabled						= false
	pb_insertar.enabled						= false
	pb_eliminar.enabled						= false
	if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_fec_ini.setfocus()
	else
		if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
			messagebox("Advertencia","Fecha Término Inválida")
			em_fec_fin.setfocus()
		else
			if ld_fec_ini>ld_fec_fin then
				messagebox("Advertencia","Rango Fecha Inválida")
				em_fec_fin.setfocus()
			else
				dw_contratos.enabled					= true
				pb_insertar.enabled					= true
				pb_eliminar.enabled					= true
				CHOOSE CASE is_opcion
					CASE 'G' //Entrega Documentos Agentes
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,2,2)
					CASE 'E' //Entrega Documentos Operaciones
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,4)
					CASE 'S' //Entrega Documentos Supervisores
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,3)
					CASE 'D' //Devolución Documentos ANTES 5
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,12)
					CASE 'C' //Devolución Documentos a depto. adm.venta
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,10)
					CASE 'A' //Devolución Documentos a depto. at. cliente
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,17)
					CASE 'N' //Devolución Documentos Nulos a depto. Operaciones
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,102)
					CASE 'T' //Devolución Documentos a depto. at. Terreno
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,27)
					CASE 'J' //Devolución Documentos a depto. at. Terreno
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,27)
						
						
						
						
						
						
				END CHOOSE
				if dw_contratos.rowcount()>0 then
					dw_encargados.enabled			= true
					em_fec_entrega.enabled			= true
					p_entrega.enabled					= true
					cb_hora.enabled					= true
					dw_lista.object.t_fecha.text	= trim(em_fec_entrega.text)
				end if
			end if
		end if
	end if
elseif em_memo.visible=false then
	dw_contratos.enabled						= false
	pb_insertar.enabled						= false
	pb_eliminar.enabled						= false
	if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_fec_ini.setfocus()
	else
		if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
			messagebox("Advertencia","Fecha Término Inválida")
			em_fec_fin.setfocus()
		else
			if ld_fec_ini>ld_fec_fin then
				messagebox("Advertencia","Rango Fecha Inválida")
				em_fec_fin.setfocus()
			else
				dw_contratos.enabled					= true
				pb_insertar.enabled					= true
				pb_eliminar.enabled					= true
				CHOOSE CASE is_opcion
					CASE 'G' //Entrega Documentos Agentes
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,2,2)
					CASE 'E' //Entrega Documentos Operaciones
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,4)
					CASE 'S' //Entrega Documentos Supervisores
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,3)
					CASE 'D' //Devolución Documentos ANTES 5
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,12)
					CASE 'C' //Devolución Documentos a depto. adm.venta
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,10)
					CASE 'A' //Devolución Documentos a depto. at. cliente
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,17)
					CASE 'N' //Entrega Documentos Nulos a Operaciones
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,102)
					CASE 'T' //Devolución Documentos a depto. at. terreno
						dw_contratos.retrieve(ld_fec_ini,ld_fec_fin,27)
				END CHOOSE
				if dw_contratos.rowcount()>0 then
					dw_encargados.enabled			= true
					em_fec_entrega.enabled			= true
					p_entrega.enabled					= true
					cb_hora.enabled					= true
					dw_lista.object.t_fecha.text	= trim(em_fec_entrega.text)
				end if
			end if
		end if
	end if
end if
SetPointer(arrow!)
end event

type p_fin from picture within w_cd_informes
integer x = 1413
integer y = 72
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
Date		ld_fec_ini,ld_fec_fin
dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
		ld_fec_ini	= date(em_fec_ini.text)
		ld_fec_fin	= date(em_fec_fin.text)
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type em_fec_fin from editmask within w_cd_informes
integer x = 1061
integer y = 72
integer width = 347
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	pb_aceptar.triggerevent(clicked!)
end if
end event

type p_ini from picture within w_cd_informes
integer x = 805
integer y = 72
integer width = 78
integer height = 88
string picturename = "Ddlb.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha,fech
Date		ld_fec_ini,ld_fec_fin
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
		ld_fec_ini	= date(em_fec_ini.text)
		ld_fec_fin	= date(em_fec_fin.text)
		if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
			pb_aceptar.triggerevent(clicked!)
		end if
	end if	
END IF
end event

type cb_cerrar from commandbutton within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 3205
integer y = 1724
integer width = 297
integer height = 104
integer taborder = 230
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cd_informes)
end event

type dw_lista from datawindow within w_cd_informes
event ue_mousemove pbm_dwnmousemove
integer x = 1481
integer y = 376
integer width = 2021
integer height = 1300
integer taborder = 120
string dragicon = "Information!"
string title = "none"
string dataobject = "dw_lista_informe_por_devolucion_opera_at"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row_destino	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row_destino	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
end if
end event

event dragdrop;Long			ll_new,ll_fila,ll_tot_reg,ll_count_fila,ll_resp
Double		ll_numero
String			ls_base,ls_serie,ls_age,ls_sup,ls_jefe,ls_numero,ls_pasa,ls_codigo,ls_glosa,&
				ls_string,ls_usuario,ls_cod_sup
Datetime		ld_fecha
if dw_contratos.rowcount()>0 then
	ls_pasa			= 'S'
	control_dw 		= DraggedObject()
	if is_opcion='G' or is_opcion='S' or is_opcion='N' or is_opcion='T' or &
		is_opcion='J' or is_opcion='P' or is_opcion='U' or is_opcion='I' or is_opcion='V' then
		
		ls_codigo	= dw_encargados.getitemstring(1,'usuario')
		if isnull(ls_codigo) or ls_codigo='' then
			messagebox("Advertencia","Debe Seleccionar Usuario que Entrega Documentos")
			dw_encargados.setfocus()
			ls_pasa	= 'N'
		end if
	end if
	if (is_opcion='D' or is_opcion='S') and ls_pasa='S' then
		ls_usuario	= dw_encargados.getitemstring(1,'usuario')
		ls_cod_sup	= dw_contratos.getitemstring(il_row_origen,'cod_supervisor')
		if ls_usuario<>ls_cod_sup then
			messagebox("Advertencia","Contrato No Corresponde al Supervisor Seleccionado")
			ls_pasa='N'
		end if
	end if
	if ls_pasa='S' then
		if il_row_origen>0 then
			ls_base		= dw_contratos.getitemstring(il_row_origen,'base')
			ls_serie		= dw_contratos.getitemstring(il_row_origen,'serie')
			ll_numero	= dw_contratos.getitemnumber(il_row_origen,'numero')
			ls_glosa		= trim(dw_contratos.getitemstring(il_row_origen,'ult_glosa_estado'))
			ls_numero	= string(ll_numero)
			if dw_lista.dataobject='dw_lista_informe_detalle_aceptado' then
				ls_string	= "cd_informe_detalle_base='"+ls_base+"'"+" and cd_informe_detalle_serie='"+ls_serie+"'"+" and cd_informe_detalle_numero="+trim(ls_numero)
			else
				ls_string	= "base='"+ls_base+"'"+" and serie='"+ls_serie+"'"+" and numero="+trim(ls_numero)
			end if
			ll_tot_reg	= dw_lista.RowCount()
			if ll_tot_reg>0 then ll_fila = dw_lista.Find(ls_string, 1,ll_tot_reg )
			if ll_fila>0 then
				messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+" Ya está considerado en el Informe")
				dw_contratos.setfocus()
			else
				ld_fecha	= dw_contratos.getitemdatetime(il_row_origen,'ult_fecha_estado')
				ls_age	= dw_contratos.getitemstring(il_row_origen,'cod_agente')
				ls_sup	= dw_contratos.getitemstring(il_row_origen,'cod_supervisor')
				ls_jefe	= dw_contratos.getitemstring(il_row_origen,'cod_jefe_venta')
				ll_new	= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				if dw_lista.dataobject='dw_lista_informe_detalle_aceptado' then
					dw_lista.setitem(ll_new,'cd_informe_detalle_base',ls_base)
					dw_lista.setitem(ll_new,'cd_informe_detalle_serie',ls_serie)
					dw_lista.setitem(ll_new,'cd_informe_detalle_numero',ll_numero)
					dw_lista.setitem(ll_new,'cd_informe_detalle_fecha_crea',ld_fecha)
					dw_lista.setitem(ll_new,'cd_informe_detalle_cod_agente',ls_age)
					dw_lista.setitem(ll_new,'cd_informe_detalle_cod_supervisor',ls_sup)
					dw_lista.setitem(ll_new,'cd_informe_detalle_cod_jefe_venta',ls_jefe)
					dw_lista.setitem(ll_new,'cd_informe_detalle_observacion',ls_glosa)
					dw_lista.setitem(ll_new,'cd_informe_detalle_motivo_devolucion',ls_glosa)
					dw_lista.setitem(ll_new,'cd_informe_detalle_referencia',trim(em_memo.text))
				else
					dw_lista.setitem(ll_new,'base',ls_base)
					dw_lista.setitem(ll_new,'serie',ls_serie)
					dw_lista.setitem(ll_new,'numero',ll_numero)
					dw_lista.setitem(ll_new,'fecha_crea',ld_fecha)
					dw_lista.setitem(ll_new,'cod_agente',ls_age)
					dw_lista.setitem(ll_new,'cod_supervisor',ls_sup)
					dw_lista.setitem(ll_new,'cod_jefe_venta',ls_jefe)
					dw_lista.setitem(ll_new,'observacion',ls_glosa)
					dw_lista.setitem(ll_new,'motivo_devolucion',ls_glosa)
					dw_lista.setitem(ll_new,'referencia',trim(em_memo.text))
				end if
				dw_lista.accepttext()
			end if
		end if
	end if
end if
end event

type gb_3 from groupbox within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 1481
integer y = 1688
integer width = 1024
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_fec_ini from editmask within w_cd_informes
integer x = 453
integer y = 72
integer width = 347
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;Date		ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if not isnull(ld_fec_ini) and not isnull(ld_fec_fin) then 
	if il_aceptar>0 then pb_aceptar.triggerevent(clicked!)
end if
end event

type st_11 from statictext within w_cd_informes
integer x = 261
integer y = 84
integer width = 165
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cd_informes
integer x = 73
integer y = 56
integer width = 165
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_21 from statictext within w_cd_informes
integer x = 891
integer y = 84
integer width = 169
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

type gb_4 from groupbox within w_cd_informes
event ue_mousemove pbm_mousemove
integer x = 480
integer y = 1688
integer width = 763
integer height = 156
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_ref from datawindow within w_cd_informes
integer x = 453
integer y = 180
integer width = 1051
integer height = 112
integer taborder = 50
string title = "none"
string dataobject = "dwe_lista_referencia_memo"
boolean border = false
boolean livescroll = true
end type

type em_memo from editmask within w_cd_informes
boolean visible = false
integer x = 453
integer y = 180
integer width = 1038
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

type gb_1 from groupbox within w_cd_informes
boolean visible = false
integer x = 37
integer y = 16
integer width = 1509
integer height = 236
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Rango de Fecha"
end type

