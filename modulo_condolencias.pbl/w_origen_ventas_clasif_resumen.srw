forward
global type w_origen_ventas_clasif_resumen from window
end type
type p_fin from picture within w_origen_ventas_clasif_resumen
end type
type p_ini from picture within w_origen_ventas_clasif_resumen
end type
type cb_exportar from commandbutton within w_origen_ventas_clasif_resumen
end type
type dw_grupo from datawindow within w_origen_ventas_clasif_resumen
end type
type st_cargo from statictext within w_origen_ventas_clasif_resumen
end type
type dw_seleccion from datawindow within w_origen_ventas_clasif_resumen
end type
type cb_1 from commandbutton within w_origen_ventas_clasif_resumen
end type
type st_2 from statictext within w_origen_ventas_clasif_resumen
end type
type st_1 from statictext within w_origen_ventas_clasif_resumen
end type
type em_fin from editmask within w_origen_ventas_clasif_resumen
end type
type em_ini from editmask within w_origen_ventas_clasif_resumen
end type
type hpb_1 from hprogressbar within w_origen_ventas_clasif_resumen
end type
type st_porc from statictext within w_origen_ventas_clasif_resumen
end type
type st_fondo from statictext within w_origen_ventas_clasif_resumen
end type
type cb_limpiar from commandbutton within w_origen_ventas_clasif_resumen
end type
type pb_aceptar from picturebutton within w_origen_ventas_clasif_resumen
end type
type cb_2 from commandbutton within w_origen_ventas_clasif_resumen
end type
type cb_imprimir from commandbutton within w_origen_ventas_clasif_resumen
end type
type dw_lista from datawindow within w_origen_ventas_clasif_resumen
end type
type gb_1 from groupbox within w_origen_ventas_clasif_resumen
end type
type st_cuenta from statictext within w_origen_ventas_clasif_resumen
end type
type gb_2 from groupbox within w_origen_ventas_clasif_resumen
end type
end forward

global type w_origen_ventas_clasif_resumen from window
integer width = 3666
integer height = 1864
boolean titlebar = true
string title = "Ingreso Caja Supervisores"
boolean controlmenu = true
long backcolor = 67108864
p_fin p_fin
p_ini p_ini
cb_exportar cb_exportar
dw_grupo dw_grupo
st_cargo st_cargo
dw_seleccion dw_seleccion
cb_1 cb_1
st_2 st_2
st_1 st_1
em_fin em_fin
em_ini em_ini
hpb_1 hpb_1
st_porc st_porc
st_fondo st_fondo
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
cb_2 cb_2
cb_imprimir cb_imprimir
dw_lista dw_lista
gb_1 gb_1
st_cuenta st_cuenta
gb_2 gb_2
end type
global w_origen_ventas_clasif_resumen w_origen_ventas_clasif_resumen

type variables
long il_row,il_conexion
string	is_tipo
end variables

forward prototypes
public subroutine wf_carga_resumen (datetime adt_fec_ini, datetime adt_fec_fin, string as_codigo, string as_cargo)
public function long wf_cta_clasif (string as_codigo, datetime adt_fec_ini, datetime adt_fec_fin, string as_clasif, string as_cargo, string as_origen, long al_cod_parque)
end prototypes

public subroutine wf_carga_resumen (datetime adt_fec_ini, datetime adt_fec_fin, string as_codigo, string as_cargo);string	ls_cod_origen,ls_descrip,ls_parque,ls_nombre,cadena
long	ll_new,ll_cod_parque,ll_pra_a,ll_pra_b,ll_pra_c,ll_man_a,ll_man_b,ll_man_c,ll_san_a,ll_san_b,ll_san_c,ll_can_a,ll_can_b,ll_can_c
datetime ldt_fec_ini,ldt_fec_fin

//wf_(adt_fec_ini,adt_fec_fin,as_codigo,as_cargo)

if as_cargo='J' then
	SELECT	"NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"
	INTO		:ls_nombre
	FROM 	"JEFE_VENTAS"  
	WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :as_codigo
	USING	sqlca;
elseif as_cargo='S' then
	SELECT	"NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"
	INTO		:ls_nombre
	FROM 	"SUPERVISOR"  
	WHERE 	"SUPERVISOR"."COD_SUP" = :as_codigo
	USING	sqlca;
elseif as_cargo='A' then
	SELECT	"NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"
	INTO		:ls_nombre
	FROM 	"AGENTES"  
	WHERE 	"AGENTES"."COD_AGE" = :as_codigo
	USING	sqlca;
end if
if isnull(ls_nombre) then ls_nombre=''

DECLARE x2 CURSOR FOR
SELECT	"TIP_VENTA",	"DESCRIPCION"
FROM 	"TIPO_VENTA"
USING	Trans_2;
open x2;
if Trans_2.sqlcode=0 then
	DO WHILE Trans_2.sqlcode=0
	fetch x2 INTO	:ls_cod_origen,	:ls_descrip;
		if not isnull(ls_cod_origen) and ls_cod_origen<>'' and not isnull(ls_descrip) and ls_descrip <> '' then
			if il_conexion=1 then
				ll_pra_a					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'A',as_cargo,ls_cod_origen,1)
				ll_pra_b					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'B',as_cargo,ls_cod_origen,1)
				ll_pra_c					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'C',as_cargo,ls_cod_origen,1)
				ll_man_a					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'A',as_cargo,ls_cod_origen,102)
				ll_man_b					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'B',as_cargo,ls_cod_origen,102)
				ll_man_c					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'C',as_cargo,ls_cod_origen,102)
				ll_san_a					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'A',as_cargo,ls_cod_origen,103)
				ll_san_b					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'B',as_cargo,ls_cod_origen,103)
				ll_san_c					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'C',as_cargo,ls_cod_origen,103)
				ll_can_a					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'A',as_cargo,ls_cod_origen,101)
				ll_can_b					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'B',as_cargo,ls_cod_origen,101)
				ll_can_c					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'C',as_cargo,ls_cod_origen,101)
			else
				ll_pra_a					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'A',as_cargo,ls_cod_origen,11)
				ll_pra_b					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'B',as_cargo,ls_cod_origen,11)
				ll_pra_c					= wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,'C',as_cargo,ls_cod_origen,11)
			end if
			
			dw_lista.object.usuario.text		= gs_user
			ll_new								= dw_lista.insertrow(0)
			dw_lista.scrolltorow(ll_new)
			dw_lista.setitem(ll_new,"conexion",il_conexion)
			//dw_lista.setitem(ll_new,"parque",ll_cod_parque)
			//dw_lista.setitem(ll_new,"monb_parque",ls_parque)
			dw_lista.setitem(ll_new,"fec_ini",adt_fec_ini)
			dw_lista.setitem(ll_new,"fec_fin",adt_fec_fin)
			dw_lista.setitem(ll_new,"codigo",as_codigo)
			dw_lista.setitem(ll_new,"nombre",ls_nombre)
			dw_lista.setitem(ll_new,"cod_origen",ls_cod_origen)
			dw_lista.setitem(ll_new,"origen",(ls_cod_origen+' '+ls_descrip))
			dw_lista.setitem(ll_new,"pra_a",ll_pra_a)
			dw_lista.setitem(ll_new,"pra_b",ll_pra_b)
			dw_lista.setitem(ll_new,"pra_c",ll_pra_c)
			dw_lista.setitem(ll_new,"man_a",ll_man_a)
			dw_lista.setitem(ll_new,"man_b",ll_man_b)
			dw_lista.setitem(ll_new,"man_c",ll_man_c)
			dw_lista.setitem(ll_new,"san_a",ll_san_a)
			dw_lista.setitem(ll_new,"san_b",ll_san_b)
			dw_lista.setitem(ll_new,"san_c",ll_san_c)
			dw_lista.setitem(ll_new,"can_a",ll_can_a)
			dw_lista.setitem(ll_new,"can_b",ll_can_b)
			dw_lista.setitem(ll_new,"can_c",ll_can_c)
			dw_lista.setitem(ll_new,"cargo",as_cargo)
			dw_lista.accepttext()
		end if
		setnull(ls_cod_origen);setnull(ls_descrip)
		ll_pra_a=0;ll_pra_b=0;ll_pra_c=0;ll_man_a=0;ll_man_b=0;ll_man_c=0;ll_san_a=0;ll_san_b=0;ll_san_c=0;ll_can_a=0;ll_can_b=0;ll_can_c=0
	LOOP
end if
close x2;























end subroutine

public function long wf_cta_clasif (string as_codigo, datetime adt_fec_ini, datetime adt_fec_fin, string as_clasif, string as_cargo, string as_origen, long al_cod_parque);long	ll_clasif

//wf_cta_clasif(as_codigo,adt_fec_ini,adt_fec_fin,as_clasif,as_cargo)
if as_cargo='A' then
	SELECT	count("BASE")
	INTO		:ll_clasif
	FROM 	"VISTA_PRODUCC_MENSUAL"  
	WHERE	"VISTA_PRODUCC_MENSUAL"."COD_AGE" = :as_codigo AND  
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" >= :adt_fec_ini AND  
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" <= :adt_fec_fin AND
				"VISTA_PRODUCC_MENSUAL"."CLASIFICA_VENTA" = :as_clasif AND
				"VISTA_PRODUCC_MENSUAL"."TIPO_VENTA" = :as_origen AND
				"VISTA_PRODUCC_MENSUAL"."COD_PARQUE" = :al_cod_parque
	USING	sqlca;
elseif as_cargo='S' then
	SELECT	count("BASE")
	INTO		:ll_clasif
	FROM 	"VISTA_PRODUCC_MENSUAL"  
	WHERE	"VISTA_PRODUCC_MENSUAL"."COD_SUP" = :as_codigo AND  
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" >= :adt_fec_ini AND  
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" <= :adt_fec_fin AND
				"VISTA_PRODUCC_MENSUAL"."CLASIFICA_VENTA" = :as_clasif AND
				"VISTA_PRODUCC_MENSUAL"."TIPO_VENTA" = :as_origen AND
				"VISTA_PRODUCC_MENSUAL"."COD_PARQUE" = :al_cod_parque
	USING	sqlca;
elseif as_cargo='J' then
	SELECT	count("BASE")
	INTO		:ll_clasif
	FROM 	"VISTA_PRODUCC_MENSUAL"  
	WHERE	"VISTA_PRODUCC_MENSUAL"."COD_JEF" = :as_codigo AND  
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" >= :adt_fec_ini AND  
				"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" <= :adt_fec_fin AND
				"VISTA_PRODUCC_MENSUAL"."CLASIFICA_VENTA" = :as_clasif AND
				"VISTA_PRODUCC_MENSUAL"."TIPO_VENTA" = :as_origen AND
				"VISTA_PRODUCC_MENSUAL"."COD_PARQUE" = :al_cod_parque
	USING	sqlca;
end if
if isnull(ll_clasif) then ll_clasif=0
return	ll_clasif
end function

on w_origen_ventas_clasif_resumen.create
this.p_fin=create p_fin
this.p_ini=create p_ini
this.cb_exportar=create cb_exportar
this.dw_grupo=create dw_grupo
this.st_cargo=create st_cargo
this.dw_seleccion=create dw_seleccion
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.em_fin=create em_fin
this.em_ini=create em_ini
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.st_cuenta=create st_cuenta
this.gb_2=create gb_2
this.Control[]={this.p_fin,&
this.p_ini,&
this.cb_exportar,&
this.dw_grupo,&
this.st_cargo,&
this.dw_seleccion,&
this.cb_1,&
this.st_2,&
this.st_1,&
this.em_fin,&
this.em_ini,&
this.hpb_1,&
this.st_porc,&
this.st_fondo,&
this.cb_limpiar,&
this.pb_aceptar,&
this.cb_2,&
this.cb_imprimir,&
this.dw_lista,&
this.gb_1,&
this.st_cuenta,&
this.gb_2}
end on

on w_origen_ventas_clasif_resumen.destroy
destroy(this.p_fin)
destroy(this.p_ini)
destroy(this.cb_exportar)
destroy(this.dw_grupo)
destroy(this.st_cargo)
destroy(this.dw_seleccion)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_fin)
destroy(this.em_ini)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.st_cuenta)
destroy(this.gb_2)
end on

event open;string		ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg,ll_mes,ll_ano
datetime	ldt_ult_cierre,ldt_fec_ini

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
gf_centrar(w_origen_ventas_clasif_resumen)
dw_lista.dataobject	= 'dw_origen_clasif_resumen'
dw_lista.settransobject(sqlca)

SELECT 	max("CIERRE_VENTA")  
INTO		:ldt_ult_cierre
FROM 	"CIERRE_VENTA"
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldt_ult_cierre) then
		ldt_ult_cierre										= ldt_ult_cierre
	else
		ldt_ult_cierre										= gdt_fec_sistema
	end if
else
	ldt_ult_cierre											= gdt_fec_sistema
end if
ll_mes														= month(date(ldt_ult_cierre))
ll_ano															= year(date(ldt_ult_cierre))
ldt_fec_ini													= datetime(date(string('01/'+ string(ll_mes,'00')+ '/' +string(ll_ano,'0000'))),time('00:00:00'))
em_ini.text													= string(ldt_fec_ini,'dd/mm/yyyy')
em_fin.text													= string(ldt_ult_cierre,'dd/mm/yyyy')

dw_grupo.settransobject(sqlca)
dw_grupo.getchild('codigo',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve('',ldt_fec_ini,ldt_ult_cierre,'')=0 then
	idw_detalle4.insertrow(0)
end if
dw_grupo.insertrow(0)
st_cargo.text												= 'Filtrar por Jefe Venta :'
if gs_conexion	= "Parque El Prado" then
		ll_parque												= 1
		il_conexion											= 1	
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque												= 11
		il_conexion											= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque												= 801
		il_conexion											= 801
	end if

if gl_proceso>=4 then
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.getchild('supervisor',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ll_parque,'')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_lista.reset()
	dw_seleccion.accepttext()
	
elseif gl_proceso=3 then
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect			= 1
		dw_seleccion.object.jefe.protect				= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,gs_user)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		end if
	dw_lista.reset()
	dw_seleccion.accepttext()

elseif gl_proceso=2 then
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 	"SUPERVISOR"."COD_JEFE"  
   INTO		:ll_parque,   
         	:ls_jefe  
   FROM 		"SUPERVISOR"  
   WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect		= 1
		dw_seleccion.object.jefe.protect			= 1
		dw_seleccion.object.supervisor.protect	= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
	end if
	dw_lista.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_origen_ventas_clasif_resumen)
end if

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type p_fin from picture within w_origen_ventas_clasif_resumen
integer x = 3054
integer y = 128
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_lista.reset()
string ls_fecha,fech

if f_valida_fecha(em_fin.text)=-1 then 
	em_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fin.setfocus()
	return
end if	
if em_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fin.setfocus()
		return
	else	
		em_fin.text = Message.StringParm
	end if	
END IF
end event

type p_ini from picture within w_origen_ventas_clasif_resumen
integer x = 2601
integer y = 124
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_lista.reset()
string ls_fecha,fech

if f_valida_fecha(em_ini.text)=-1 then 
	em_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_ini.setfocus()
	return
end if	
if em_ini.text<>'00/00/0000' then
	ls_fecha = em_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_ini.setfocus()
		return
	else	
		em_ini.text = Message.StringParm
	end if	
END IF
end event

type cb_exportar from commandbutton within w_origen_ventas_clasif_resumen
integer x = 2528
integer y = 1644
integer width = 229
integer height = 92
integer taborder = 130
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

type dw_grupo from datawindow within w_origen_ventas_clasif_resumen
integer x = 622
integer y = 1644
integer width = 1093
integer height = 92
integer taborder = 120
string title = "none"
string dataobject = "dwe_personail_x_cargo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_cod
dw_grupo.accepttext()
if dw_lista.rowcount()>0 then
	ls_cod				= dw_grupo.getitemstring(1,'codigo')
	if not isnull(ls_cod) and ls_cod<>'' then
		ls_cod 			= "codigo = '"+ls_cod+"'"
		dw_lista.SetFilter(ls_cod)
		dw_lista.Filter( )
	end if
end if
end event

type st_cargo from statictext within w_origen_ventas_clasif_resumen
integer x = 37
integer y = 1660
integer width = 576
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por Supervisor :"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_seleccion from datawindow within w_origen_ventas_clasif_resumen
integer x = 27
integer y = 44
integer width = 2208
integer height = 192
integer taborder = 50
string title = "none"
string dataobject = "dwe_seleccion_opcion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

event itemfocuschanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

type cb_1 from commandbutton within w_origen_ventas_clasif_resumen
integer x = 2135
integer y = 1644
integer width = 375
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Ventas"
end type

event clicked;string	ls_codigo,ls_cargo,ls_string
datetime	ldt_fec_ini,ldt_fec_fin	

dw_lista.accepttext()
if  dw_lista.rowcount() > 0 then
	ls_codigo				= dw_lista.getitemstring(il_row,'codigo')
	ldt_fec_ini			= dw_lista.getitemdatetime(il_row,'fec_ini')
	ldt_fec_fin			= dw_lista.getitemdatetime(il_row,'fec_fin')
	ls_cargo				= dw_lista.getitemstring(il_row,'cargo')
	if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fec_ini) and not isnull(ldt_fec_fin) and not isnull(ls_cargo) and ls_cargo<>'' then
		ls_string			= ls_codigo+'~t'+string(ldt_fec_ini,'dd/mm/yyyy')+'~t'+string(ldt_fec_fin,'dd/mm/yyyy')+'~t'+ls_cargo
		if isvalid(w_origen_ventas_clasif_detalle) then close(w_origen_ventas_clasif_detalle)
		OpenWithParm (w_origen_ventas_clasif_detalle,ls_string)
	end if
end if
end event

type st_2 from statictext within w_origen_ventas_clasif_resumen
integer x = 2711
integer y = 64
integer width = 421
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fec Término"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_origen_ventas_clasif_resumen
integer x = 2272
integer y = 64
integer width = 407
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fec Inicio"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fin from editmask within w_origen_ventas_clasif_resumen
integer x = 2720
integer y = 124
integer width = 329
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type em_ini from editmask within w_origen_ventas_clasif_resumen
integer x = 2267
integer y = 124
integer width = 329
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type hpb_1 from hprogressbar within w_origen_ventas_clasif_resumen
boolean visible = false
integer x = 1211
integer y = 840
integer width = 1042
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_origen_ventas_clasif_resumen
boolean visible = false
integer x = 1582
integer y = 768
integer width = 306
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from statictext within w_origen_ventas_clasif_resumen
boolean visible = false
integer x = 1189
integer y = 752
integer width = 1093
integer height = 268
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_limpiar from commandbutton within w_origen_ventas_clasif_resumen
integer x = 2757
integer y = 1644
integer width = 229
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_origen_ventas_clasif_resumen.triggerevent(open!)
end event

type pb_aceptar from picturebutton within w_origen_ventas_clasif_resumen
integer x = 3168
integer y = 96
integer width = 137
integer height = 120
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string		ls_jef,ls_sup,ls_pasa='S',ls_codigo,ls_cargo
long		ll_cod_parque
datetime	ldt_fec_ini,ldt_fec_fin

dw_lista.reset()
dw_seleccion.accepttext()
ll_cod_parque														= dw_seleccion.getitemnumber(1,'parque')
ls_jef																	= dw_seleccion.getitemstring(1,'jefe')
ls_sup																= dw_seleccion.getitemstring(1,'supervisor')
ldt_fec_ini															= datetime(date(em_ini.text),time('00:00:00'))
ldt_fec_fin															= datetime(date(em_fin.text),time('00:00:00'))

if isnull(ldt_fec_ini) then
	messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
	em_ini.setfocus()
	ls_pasa															= 'N'
elseif isnull(ldt_fec_fin) then
	messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
	em_fin.setfocus()
	ls_pasa															= 'N'
end if
if ldt_fec_ini>ldt_fec_fin then
	messagebox("Advertencia", "Rango Fecha Invalido")
	ls_pasa															= 'N'
else
	if isnull(ll_cod_parque) and ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('parque')
		ls_pasa														= 'N'
	end if	
end if
if ls_pasa='S' then
	if not isnull(ll_cod_parque) and ll_cod_parque>0 and (isnull(ls_jef) or ls_jef='') and (isnull(ls_sup) or ls_sup='') then
		is_tipo														= 'J'
		st_cargo.text												= 'Filtrar por Jefe Venta :'
		if idw_detalle4.retrieve(is_tipo,ldt_fec_ini,ldt_fec_fin,'')=0 then
			idw_detalle4.insertrow(0)
		end if
		dw_grupo.insertrow(0)
	elseif not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_jef) and ls_jef<>'' and (isnull(ls_sup) or ls_sup='') then
		is_tipo														= 'S'
		st_cargo.text												= 'Filtrar por Supervisor :'
		if idw_detalle4.retrieve(is_tipo,ldt_fec_ini,ldt_fec_fin,ls_jef)=0 then
			idw_detalle4.insertrow(0)
		end if
		dw_grupo.insertrow(0)
	elseif not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_jef) and ls_jef<>'' and not isnull(ls_sup) and ls_sup<>'' then
		is_tipo														= 'A'
		st_cargo.text												= 'Filtrar por Agente :'
		if idw_detalle4.retrieve(is_tipo,ldt_fec_ini,ldt_fec_fin,ls_sup)=0 then
			idw_detalle4.insertrow(0)
		end if
		dw_grupo.insertrow(0)
	end if
	
	if is_tipo='J' then
		DECLARE c_jef CURSOR FOR
		SELECT		"VISTA_PRODUCC_MENSUAL"."COD_JEF","JEFE_VENTAS"."CARGO" 
		FROM 		"VISTA_PRODUCC_MENSUAL","JEFE_VENTAS" 
		WHERE		"VISTA_PRODUCC_MENSUAL"."COD_JEF" = "JEFE_VENTAS"."JEFE_VENTAS" AND  
						"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" >= :ldt_fec_ini AND  
						"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" <= :ldt_fec_fin
		GROUP BY	"VISTA_PRODUCC_MENSUAL"."COD_JEF","JEFE_VENTAS"."CARGO" 
		USING		Trans_4;
	elseif is_tipo='S' then
		DECLARE c_sup CURSOR FOR
		SELECT		"VISTA_PRODUCC_MENSUAL"."COD_SUP","SUPERVISOR"."CARGO"
		FROM 		"VISTA_PRODUCC_MENSUAL","SUPERVISOR" 
		WHERE		"VISTA_PRODUCC_MENSUAL"."COD_SUP" = "SUPERVISOR"."COD_SUP" AND  
						"VISTA_PRODUCC_MENSUAL"."COD_JEF" = :ls_jef AND  
						"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" >= :ldt_fec_ini AND  
						"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" <= :ldt_fec_fin
		GROUP BY	"VISTA_PRODUCC_MENSUAL"."COD_SUP","SUPERVISOR"."CARGO" 
		USING		Trans_4;
	elseif is_tipo='A' then
		DECLARE c_age CURSOR FOR
		SELECT		"VISTA_PRODUCC_MENSUAL"."COD_AGE","AGENTES"."CARGO" 
		FROM 		"VISTA_PRODUCC_MENSUAL","AGENTES" 
		WHERE		"VISTA_PRODUCC_MENSUAL"."COD_AGE" = "AGENTES"."COD_AGE" AND  
						"VISTA_PRODUCC_MENSUAL"."COD_SUP" = :ls_sup AND  
						"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" >= :ldt_fec_ini AND  
						"VISTA_PRODUCC_MENSUAL"."CIERRE_VENTA" <= :ldt_fec_fin 
		GROUP BY	"VISTA_PRODUCC_MENSUAL"."COD_AGE","AGENTES"."CARGO" 
		USING		Trans_4;
	end if
	if is_tipo = 'J' then
		open c_jef;
	elseif is_tipo = 'S' then 
		open c_sup;
	elseif is_tipo = 'A' then 
		open c_age;	
	end if
	if Trans_4.sqlcode=0 then
		DO WHILE Trans_4.sqlcode=0
			if is_tipo = 'J' then
				fetch c_jef INTO	:ls_codigo,:ls_cargo;
			elseif is_tipo = 'S' then 
				fetch c_sup INTO	:ls_codigo,:ls_cargo;
			elseif is_tipo = 'A' then 
				fetch c_age INTO	:ls_codigo,:ls_cargo;	
			end if
			if not isnull(ls_codigo) and ls_codigo <> '' and not isnull(ls_cargo) and ls_cargo <> '' then
				wf_carga_resumen(ldt_fec_ini,ldt_fec_fin,ls_codigo,ls_cargo)
			end if
			setnull(ls_codigo);setnull(ls_cargo)
		LOOP
	end if
	if is_tipo = 'J' then
		close c_jef;
	elseif is_tipo = 'S' then
		close c_sup;
	elseif is_tipo = 'A' then
		close c_age;	
	end if
end if

end event

type cb_2 from commandbutton within w_origen_ventas_clasif_resumen
integer x = 3346
integer y = 1644
integer width = 274
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_origen_ventas_clasif_resumen)
end event

type cb_imprimir from commandbutton within w_origen_ventas_clasif_resumen
integer x = 2985
integer y = 1644
integer width = 229
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() >0 then 
	f_Print( dw_lista )
end if
end event

type dw_lista from datawindow within w_origen_ventas_clasif_resumen
integer x = 32
integer y = 252
integer width = 3589
integer height = 1364
integer taborder = 40
string title = "none"
string dataobject = "dw_origen_clasif_resumen"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()
end event

event clicked;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type gb_1 from groupbox within w_origen_ventas_clasif_resumen
integer x = 2117
integer y = 1600
integer width = 1125
integer height = 160
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_cuenta from statictext within w_origen_ventas_clasif_resumen
boolean visible = false
integer x = 1211
integer y = 912
integer width = 1042
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_origen_ventas_clasif_resumen
integer x = 2245
integer y = 8
integer width = 910
integer height = 228
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Período"
end type

