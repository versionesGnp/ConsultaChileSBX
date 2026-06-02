forward
global type w_premio_sin_0 from window
end type
type cb_agte from commandbutton within w_premio_sin_0
end type
type cb_detalle from commandbutton within w_premio_sin_0
end type
type cb_ordenar from commandbutton within w_premio_sin_0
end type
type cb_imprimir from commandbutton within w_premio_sin_0
end type
type dw_fecha_cierre from datawindow within w_premio_sin_0
end type
type dw_seleccion from datawindow within w_premio_sin_0
end type
type rb_agente from radiobutton within w_premio_sin_0
end type
type rb_supervisor from radiobutton within w_premio_sin_0
end type
type rb_jefe from radiobutton within w_premio_sin_0
end type
type cb_limpiar from commandbutton within w_premio_sin_0
end type
type pb_aceptar from picturebutton within w_premio_sin_0
end type
type cb_1 from commandbutton within w_premio_sin_0
end type
type dw_lista from datawindow within w_premio_sin_0
end type
type gb_3 from groupbox within w_premio_sin_0
end type
end forward

global type w_premio_sin_0 from window
integer width = 3355
integer height = 1924
boolean titlebar = true
string title = "Premio Supervisores (Sin Cero)"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
cb_agte cb_agte
cb_detalle cb_detalle
cb_ordenar cb_ordenar
cb_imprimir cb_imprimir
dw_fecha_cierre dw_fecha_cierre
dw_seleccion dw_seleccion
rb_agente rb_agente
rb_supervisor rb_supervisor
rb_jefe rb_jefe
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
cb_1 cb_1
dw_lista dw_lista
gb_3 gb_3
end type
global w_premio_sin_0 w_premio_sin_0

type variables
Long	il_mes,il_ano,il_row
end variables

forward prototypes
public function integer wf_vacac (string as_cod_age, datetime adt_fec_ini, datetime adt_fec_fin)
public function integer wf_licen (string as_cod_age, datetime adt_fec_ini, datetime adt_fec_fin)
end prototypes

public function integer wf_vacac (string as_cod_age, datetime adt_fec_ini, datetime adt_fec_fin);long		ll_vacac,ll_cta_vaca
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fec_ini_val,ldt_fec_fin_val

ldt_fec_ini_val						= datetime(date(string('01/01/1900')))
ldt_fec_fin_val						= datetime(date(string('01/01/1900')))

//wf_vacac(as_cod_age,adt_fec_ini,adt_fec_fin)
ll_cta_vaca								= 0
DECLARE x3 CURSOR FOR

SELECT DISTINCT	"CLISER"."REM_MOV_VACAC"."FECHA_INI_VAC",   
        				"CLISER"."REM_MOV_VACAC"."FECHA_FIN_VAC"  
FROM    "CLISER"."REM_MOV_VACAC","AGENTES"  
WHERE   "CLISER"."REM_MOV_VACAC"."NUM_RUT" = "AGENTES"."RUT" AND
        		"CLISER"."REM_MOV_VACAC"."TIP_MOV_VACAC" = '1' AND
		  	"AGENTES"."COD_AGE" = :as_cod_age AND
			(("CLISER"."REM_MOV_VACAC"."FECHA_FIN_VAC" >= :adt_fec_ini AND "CLISER"."REM_MOV_VACAC"."FECHA_FIN_VAC" <= :adt_fec_fin) OR
			("CLISER"."REM_MOV_VACAC"."FECHA_INI_VAC" >= :adt_fec_ini AND "CLISER"."REM_MOV_VACAC"."FECHA_INI_VAC" <= :adt_fec_fin) OR 
			("CLISER"."REM_MOV_VACAC"."FECHA_INI_VAC" <= :adt_fec_ini AND "CLISER"."REM_MOV_VACAC"."FECHA_FIN_VAC" >= :adt_fec_fin))	
USING		sqlca;
open x3;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
	fetch x3 INTO :ldt_fecha_ini,:ldt_fecha_fin;
		if not isnull(ldt_fecha_ini) and ldt_fecha_ini<> ldt_fec_ini_val and not isnull(ldt_fecha_fin) and ldt_fecha_fin<>ldt_fec_fin_val then
			if ldt_fecha_ini<adt_fec_ini and ldt_fecha_fin<=adt_fec_fin then
				ll_vacac					= (daysafter(date(adt_fec_ini),date(ldt_fecha_fin))+1)
			elseif ldt_fecha_ini>=adt_fec_ini and ldt_fecha_fin<=adt_fec_fin then
				ll_vacac					= (daysafter(date(ldt_fecha_ini), date(ldt_fecha_fin))+1)
			elseif ldt_fecha_ini>=adt_fec_ini and ldt_fecha_fin>=adt_fec_fin then
				ll_vacac					= (daysafter(date(ldt_fecha_ini), date(adt_fec_fin))+1)
			elseif ldt_fecha_ini<=adt_fec_ini and ldt_fecha_fin>=adt_fec_fin then
				ll_vacac					= (daysafter(date(adt_fec_ini), date(adt_fec_fin))+1)	
			end if
			ll_cta_vaca					= ll_cta_vaca + ll_vacac
		end if
		setnull(ldt_fecha_ini);setnull(ldt_fecha_fin)
	LOOP
end if
close x3;
if ll_cta_vaca<=0 then
	ll_cta_vaca							= 0
end if

if isnull(ll_cta_vaca) then ll_cta_vaca=0
Return ll_cta_vaca
end function

public function integer wf_licen (string as_cod_age, datetime adt_fec_ini, datetime adt_fec_fin);long		ll_licen,ll_cta_lice,ll_mes
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fec_ini_val,ldt_fec_fin_val

ldt_fec_ini_val						= datetime(date(string('01/01/1900')))
ldt_fec_fin_val						= datetime(date(string('01/01/1900')))

//wf_licen(as_cod_age,adt_fec_ini,adt_fec_fin)
ll_cta_lice								= 0
DECLARE x3 CURSOR FOR
SELECT	"LICENCIAS"."FECHA_INICIO_LICENCIA", "LICENCIAS"."FECHA_FIN_LICENCIA"
FROM		"AGENTES",	"LICENCIAS"  
WHERE		"AGENTES"."RUT" = "LICENCIAS"."RUT_EMPLEADO" and  
			"AGENTES"."COD_AGE" = "LICENCIAS"."CODIGO_EMPLEADO" and  
			"AGENTES"."COD_AGE" = :as_cod_age AND
			(("LICENCIAS"."FECHA_FIN_LICENCIA" >= :adt_fec_ini AND "LICENCIAS"."FECHA_FIN_LICENCIA" <= :adt_fec_fin) OR
			("LICENCIAS"."FECHA_INICIO_LICENCIA" >= :adt_fec_ini AND "LICENCIAS"."FECHA_INICIO_LICENCIA" <= :adt_fec_fin) OR 
			("LICENCIAS"."FECHA_INICIO_LICENCIA" <= :adt_fec_ini AND "LICENCIAS"."FECHA_FIN_LICENCIA" >= :adt_fec_fin))
USING		sqlca;
open x3;
if sqlca.sqlcode=0 then
	DO WHILE sqlca.sqlcode=0
	fetch x3 INTO :ldt_fecha_ini,:ldt_fecha_fin;
		if not isnull(ldt_fecha_ini) and ldt_fecha_ini <> ldt_fec_ini_val and not isnull(ldt_fecha_fin) and ldt_fecha_fin <> ldt_fec_fin_val then
			if ldt_fecha_ini<adt_fec_ini and ldt_fecha_fin<=adt_fec_fin then
				ll_licen					= (daysafter(date(adt_fec_ini),date(ldt_fecha_fin))+1)
			elseif ldt_fecha_ini>=adt_fec_ini and ldt_fecha_fin<=adt_fec_fin then
				ll_licen					= (daysafter(date(ldt_fecha_ini), date(ldt_fecha_fin))+1)
			elseif ldt_fecha_ini>=adt_fec_ini and ldt_fecha_fin>=adt_fec_fin then
				ll_licen					= (daysafter(date(ldt_fecha_ini), date(adt_fec_fin))+1)
			elseif ldt_fecha_ini<=adt_fec_ini and ldt_fecha_fin>=adt_fec_fin then
				ll_licen					= (daysafter(date(adt_fec_ini), date(adt_fec_fin))+1)
			end if	
			ll_cta_lice					= ll_cta_lice + ll_licen
		end if
		setnull(ldt_fecha_ini);setnull(ldt_fecha_fin)
	LOOP
end if
close x3;
if ll_cta_lice<=0 then
	ll_cta_lice							= 0
end if

if isnull(ll_cta_lice) then ll_cta_lice=0
Return ll_cta_lice
end function

on w_premio_sin_0.create
this.cb_agte=create cb_agte
this.cb_detalle=create cb_detalle
this.cb_ordenar=create cb_ordenar
this.cb_imprimir=create cb_imprimir
this.dw_fecha_cierre=create dw_fecha_cierre
this.dw_seleccion=create dw_seleccion
this.rb_agente=create rb_agente
this.rb_supervisor=create rb_supervisor
this.rb_jefe=create rb_jefe
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.cb_1=create cb_1
this.dw_lista=create dw_lista
this.gb_3=create gb_3
this.Control[]={this.cb_agte,&
this.cb_detalle,&
this.cb_ordenar,&
this.cb_imprimir,&
this.dw_fecha_cierre,&
this.dw_seleccion,&
this.rb_agente,&
this.rb_supervisor,&
this.rb_jefe,&
this.cb_limpiar,&
this.pb_aceptar,&
this.cb_1,&
this.dw_lista,&
this.gb_3}
end on

on w_premio_sin_0.destroy
destroy(this.cb_agte)
destroy(this.cb_detalle)
destroy(this.cb_ordenar)
destroy(this.cb_imprimir)
destroy(this.dw_fecha_cierre)
destroy(this.dw_seleccion)
destroy(this.rb_agente)
destroy(this.rb_supervisor)
destroy(this.rb_jefe)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.cb_1)
destroy(this.dw_lista)
destroy(this.gb_3)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg

connect using Trans_1;
connect using Trans_2;

gf_centrar(w_premio_sin_0)

dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/01/2012'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque													= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque													= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque													= 801
	end if
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
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		if ll_parque=11 then
			dw_seleccion.object.supervisor.protect			= 1
		end if
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
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.object.supervisor.protect				= 1
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
	close(w_premio_sin_0)
end if

end event

type cb_agte from commandbutton within w_premio_sin_0
integer x = 512
integer y = 1648
integer width = 411
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Agente Ventas"
end type

event clicked;string	ls_codigo,ls_string

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ls_codigo			= dw_lista.getitemstring(il_row,'cod_02')
end if
if not isnull(ls_codigo) and ls_codigo<>''  then
	ls_string			= ls_codigo
	if isvalid(w_muestra_datos_agente) then close(w_muestra_datos_agente)
	OpenWithParm (w_muestra_datos_agente,ls_string)
end if
end event

type cb_detalle from commandbutton within w_premio_sin_0
integer x = 32
integer y = 1648
integer width = 475
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle de Ventas"
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ldt_fecha			= dw_lista.getitemdatetime(il_row,'fecha_cierre')
	ls_codigo			= dw_lista.getitemstring(il_row,'cod_02')
end if
if not isnull(ls_codigo) and ls_codigo<>''  then
	ls_string			= string(ldt_fecha,'dd/mm/yyyy')+'~t'+ls_codigo
	if isvalid(w_detalle_ventas_mensual) then close(w_detalle_ventas_mensual)
	OpenWithParm (w_detalle_ventas_mensual,ls_string)
end if
end event

type cb_ordenar from commandbutton within w_premio_sin_0
integer x = 1801
integer y = 1652
integer width = 238
integer height = 92
integer taborder = 70
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

type cb_imprimir from commandbutton within w_premio_sin_0
integer x = 2043
integer y = 1652
integer width = 238
integer height = 92
integer taborder = 40
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

type dw_fecha_cierre from datawindow within w_premio_sin_0
integer x = 37
integer y = 120
integer width = 841
integer height = 100
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

type dw_seleccion from datawindow within w_premio_sin_0
integer x = 183
integer y = 32
integer width = 2203
integer height = 192
integer taborder = 10
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

type rb_agente from radiobutton within w_premio_sin_0
integer x = 4169
integer y = 344
integer width = 283
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agente"
end type

type rb_supervisor from radiobutton within w_premio_sin_0
integer x = 4169
integer y = 252
integer width = 283
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Superv"
end type

type rb_jefe from radiobutton within w_premio_sin_0
integer x = 4169
integer y = 168
integer width = 283
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jefe"
end type

type cb_limpiar from commandbutton within w_premio_sin_0
integer x = 1563
integer y = 1652
integer width = 238
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_premio_sin_0.triggerevent(open!)
end event

type pb_aceptar from picturebutton within w_premio_sin_0
integer x = 2395
integer y = 92
integer width = 133
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_cod_jef,ls_cod_sup,ls_cod_age,ls_nomb,ls_a_pater,ls_a_mater,ls_nombre,ls_codigo,&
			ls_pasa,ls_est_age,ls_new_estado
long		ll_cod_parque,ll_cta,ll_new,ll_licen,ll_vacac,ll_antig,ll_dias_mes,ll_dota_age,&
			ll_dias_traj,ll_premio,ll_tot_reg,ll_cta_premios,ll_premio_sup,ll_cta_fores,&
			ll_cta_dota,ll_rut,ll_cta_ofe,ll_cta_lib,ll_cta_aum,ll_dias_min_trab
datetime	ldt_fecha_cierre,ldt_fecha_ini,ldt_fecha_fin,ldt_fec_ing,ldt_fec_ter

dw_seleccion.accepttext()
dw_fecha_cierre.accepttext()
dw_lista.reset()
ldt_fecha_cierre									= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ll_cod_parque										= dw_seleccion.getitemnumber(1,'parque')
ls_cod_jef											= dw_seleccion.getitemstring(1,'jefe')
ls_cod_sup											= dw_seleccion.getitemstring(1,'supervisor')
ls_pasa												= 'N'
ll_dias_min_trab									= 15
if ll_cod_parque=11 then
	if not isnull(ldt_fecha_cierre) and not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_cod_jef) and ls_cod_jef<>'' then  
		ls_pasa										= 'S'
	end if
else
	if not isnull(ldt_fecha_cierre) and not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_cod_jef) and ls_cod_jef<>'' and not isnull(ls_cod_sup) and ls_cod_sup<>''then  
		ls_pasa										= 'S'
	end if
end if

if ls_pasa= 'S' then  
	SELECT	"CIERRE_VENTA_INI","CIERRE_VENTA"  
	INTO		:ldt_fecha_ini,:ldt_fecha_fin  
	FROM		"CIERRE_VENTA"  
	WHERE	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
	USING		sqlca;
	if sqlca.sqlcode=0 then
	end if
	if ll_cod_parque=11 then
		DECLARE x1 CURSOR FOR
		SELECT		"AGENTES"."COD_AGE","AGENTES"."FECHA_INI","AGENTES"."FECHA_FIN","JEFE_VENTAS"."NOMBRE","JEFE_VENTAS"."A_PATERNO","JEFE_VENTAS"."A_MATERNO","JEFE_VENTAS"."JEFE_VENTAS","JEFE_VENTAS"."RUT","AGENTES"."ESTADO"
		FROM 		"AGENTES","SUPERVISOR","JEFE_VENTAS"
		WHERE 		"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" AND
						"SUPERVISOR"."COD_JEFE" = "JEFE_VENTAS"."JEFE_VENTAS" AND
						"SUPERVISOR"."COD_JEFE" = :ls_cod_jef AND
						"AGENTES"."FECHA_INI" <= :ldt_fecha_fin and
						"AGENTES"."SINDICATO" = 'N' and
						"AGENTES"."COD_AGE"<>'AL'
		ORDER BY	"AGENTES"."FECHA_INI"		
		USING		sqlca;
	else
		DECLARE x2 CURSOR FOR
		SELECT		"AGENTES"."COD_AGE","AGENTES"."FECHA_INI","AGENTES"."FECHA_FIN","SUPERVISOR"."NOMBRE","SUPERVISOR"."A_PATERNO","SUPERVISOR"."A_MATERNO","SUPERVISOR"."COD_SUP","SUPERVISOR"."RUT","AGENTES"."ESTADO"     
		FROM 		"AGENTES","SUPERVISOR"
		WHERE 		"AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" AND
						"AGENTES"."COD_SUP" = :ls_cod_sup AND
						"AGENTES"."FECHA_INI" <= :ldt_fecha_fin and
						"AGENTES"."SINDICATO" = 'N'
		ORDER BY	"AGENTES"."FECHA_INI"		
		USING		sqlca;
	end if
	if ll_cod_parque=11 then
		open x1;
	else
		open x2;
	end if
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
			if ll_cod_parque=11 then
				fetch x1 INTO	:ls_cod_age,:ldt_fec_ing,:ldt_fec_ter,:ls_nomb,:ls_a_pater,:ls_a_mater,:ls_codigo,:ll_rut,:ls_est_age;
			else
				fetch x2 INTO	:ls_cod_age,:ldt_fec_ing,:ldt_fec_ter,:ls_nomb,:ls_a_pater,:ls_a_mater,:ls_codigo,:ll_rut,:ls_est_age;
			end if
			if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ldt_fec_ing) and not isnull(ldt_fec_ter) then
				ls_nombre							= ls_nomb+' '+ls_a_pater+' '+ls_a_mater
				dw_lista.object.usuario.text	= gs_user
				
				if ls_est_age = 'I' and ldt_fec_ter < ldt_fecha_ini then
					ls_new_estado					= 'I'
				elseif ls_est_age = 'I' and ldt_fec_ter > ldt_fecha_fin then
					ls_new_estado					= 'A'
					ll_antig							= DaysAfter(date(ldt_fec_ing), date(ldt_fecha_fin))
				elseif ls_est_age = 'I' and ldt_fec_ter >= ldt_fecha_ini and ldt_fec_ter <= ldt_fecha_fin then
					ls_new_estado					= 'A'
					ll_antig							= DaysAfter(date(ldt_fec_ing), date(ldt_fec_ter))
				elseif ls_est_age = 'I' and ldt_fec_ter < ldt_fecha_ini and ldt_fec_ter >= ldt_fecha_ini and ldt_fec_ter <= ldt_fecha_fin then
					ls_new_estado					= 'A'
					ll_antig							= DaysAfter(date(ldt_fec_ing), date(ldt_fec_ter))	
				elseif ls_est_age = 'A' then
					ls_new_estado					= 'A'
					ll_antig							= DaysAfter(date(ldt_fec_ing), date(ldt_fecha_cierre))
				end if
				if ls_new_estado = 'A' then
					SELECT	count("OFERTA_V"."SERIE")
					INTO		:ll_cta_ofe
					FROM		"OFERTA_V"
					WHERE 	"OFERTA_V"."CIERRE_VENTA" = :ldt_fecha_cierre and
								"OFERTA_V"."COD_AGE" = :ls_cod_age   
					USING		sqlca;
					if isnull(ll_cta_ofe) then ll_cta_ofe=0
					SELECT	count("ANEXO_LIBERADOR"."SERIE_M")
					INTO		:ll_cta_lib
					FROM		"ANEXO_LIBERADOR"
					WHERE 	"ANEXO_LIBERADOR"."CIERRE_VENTA" = :ldt_fecha_cierre and
								"ANEXO_LIBERADOR"."COD_AGENTE" = :ls_cod_age   
					USING	sqlca;
					if isnull(ll_cta_lib) then ll_cta_lib=0
					SELECT	count("ANEXO_AUMENTO"."SERIE_M")
					INTO		:ll_cta_aum
					FROM		"ANEXO_AUMENTO"
					WHERE 	"ANEXO_AUMENTO"."CIERRE_VENTA" = :ldt_fecha_cierre and
								"ANEXO_AUMENTO"."COD_AGENTE" = :ls_cod_age   
					USING	sqlca;
					if isnull(ll_cta_aum) then ll_cta_aum=0
					ll_cta								= ll_cta_ofe + ll_cta_lib + ll_cta_aum
						
					if ll_cta>0 then
						ll_premio						= 1
					else
						ll_premio						= 0
					end if
					ll_vacac							= wf_vacac(ls_cod_age,ldt_fecha_ini,ldt_fecha_fin)
					ll_licen							= wf_licen(ls_cod_age,ldt_fecha_ini,ldt_fecha_fin)
					if ldt_fec_ter>=ldt_fecha_ini and ldt_fec_ter<=ldt_fecha_fin then
						ll_dias_mes					= (DaysAfter(date(ldt_fecha_ini), date(ldt_fec_ter))+1)
					elseif ldt_fec_ing>=ldt_fecha_ini and ldt_fec_ing<=ldt_fecha_fin then
						ll_dias_mes					= (DaysAfter(date(ldt_fec_ing), date(ldt_fecha_fin))+1)
					else
						ll_dias_mes					= (DaysAfter(date(ldt_fecha_ini), date(ldt_fecha_fin))+1)
					end if
					if ll_dias_mes>=ll_dias_min_trab then
						ll_dias_traj					= ll_dias_mes - (ll_vacac + ll_licen)
						if ll_dias_traj<0 then
							ll_dias_traj				= 0
						end if
						if ll_cta>0 then
							ll_dota_age				= 1
						elseif ll_dias_traj>=ll_dias_min_trab and ll_cta>0 then
							ll_dota_age				= 1
						elseif ll_dias_traj<ll_dias_min_trab and ll_cta=0 then
							ll_dota_age				= 1
						else
							ll_dota_age				= 0
						end if
						ll_new						= dw_lista.insertrow(0)
						dw_lista.scrolltorow(ll_new)
						dw_lista.setitem(ll_new,"fecha_cierre_ini",ldt_fecha_ini)
						dw_lista.setitem(ll_new,"fecha_cierre",ldt_fecha_cierre)
						dw_lista.setitem(ll_new,"dias_min_tab",ll_dias_min_trab)
						dw_lista.setitem(ll_new,"cod_01",ls_codigo)
						dw_lista.setitem(ll_new,"cod_02",ls_cod_age)
						dw_lista.setitem(ll_new,"fecha_ing",ldt_fec_ing)
						dw_lista.setitem(ll_new,"fecha_ter",ldt_fec_ter)
						dw_lista.setitem(ll_new,"estado_age",ls_est_age)
						dw_lista.setitem(ll_new,"prueba",ls_new_estado)
						dw_lista.setitem(ll_new,"cta_vtas",ll_cta)
						dw_lista.setitem(ll_new,"dias_incorp",ll_antig)
						dw_lista.setitem(ll_new,"licencia",ll_licen)
						dw_lista.setitem(ll_new,"vacaciones",ll_vacac)
						dw_lista.setitem(ll_new,"dias_trabajado",ll_dias_traj)
						dw_lista.setitem(ll_new,"premio",ll_premio)
						dw_lista.setitem(ll_new,"dota_age",ll_dota_age)
						dw_lista.setitem(ll_new,"nombre",ls_nombre)
						dw_lista.setitem(ll_new,"rut_01",ll_rut)
						dw_lista.accepttext()
					end if
				end if
			end if
			setnull(ls_cod_age);setnull(ll_cta);setnull(ldt_fec_ing);setnull(ldt_fec_ter);setnull(ls_new_estado);& 
			setnull(ls_new_estado)
		LOOP
	end if
	if ll_cod_parque = 11 then
		close x1;
	else
		close x2;
	end if
	ll_tot_reg										= dw_lista.rowcount()
	if ll_tot_reg>0 then
		ll_cta_premios								= dw_lista.getitemnumber(1,'c_cta_premiados')
		ll_cta_dota									= dw_lista.getitemnumber(1,'c_cta_dota')
		if ll_tot_reg>=8 then
			if ll_cod_parque=11 then
				ll_cta_fores							= ll_tot_reg - ll_cta_dota
				if ll_cta_fores<=2 then
					ll_premio_sup					= ll_cta_premios * 15000
				else
					ll_premio_sup					= 0
				end if	
			else
				if ll_tot_reg = ll_cta_dota then
					ll_premio_sup					= ll_cta_premios * 15000
				else
					ll_premio_sup					= 0
				end if
			end if
			dw_lista.setitem(1,"premio_sup",ll_premio_sup)
		end if
	end if
else
	if ll_cod_parque=11 then
		if isnull(ldt_fecha_cierre) then
			messagebox("Advertencia", "Debe Ingresar Fecha Cierre")
			dw_fecha_cierre.setfocus()
			dw_fecha_cierre.setcolumn('cierre_ventas')
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia", "Debe Ingresar Parque")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('parque')
		elseif isnull(ls_cod_jef) or ls_cod_jef='' then
			messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('jefe')
		end if
	else
		if isnull(ldt_fecha_cierre) then
			messagebox("Advertencia", "Debe Ingresar Fecha Cierre")
			dw_fecha_cierre.setfocus()
			dw_fecha_cierre.setcolumn('cierre_ventas')
		elseif isnull(ll_cod_parque) or ll_cod_parque=0 then
			messagebox("Advertencia", "Debe Ingresar Parque")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('parque')
		elseif isnull(ls_cod_jef) or ls_cod_jef='' then
			messagebox("Advertencia", "Debe Ingresar Jefe de Ventas")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('jefe')
		elseif isnull(ls_cod_sup) or ls_cod_sup='' then
			messagebox("Advertencia", "Debe Ingresar Supervisor de Ventas")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('supervisor')		
		end if
	end if
end if
end event

type cb_1 from commandbutton within w_premio_sin_0
integer x = 2981
integer y = 1644
integer width = 315
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_premio_sin_0)
end event

type dw_lista from datawindow within w_premio_sin_0
integer x = 41
integer y = 272
integer width = 3255
integer height = 1344
integer taborder = 30
string title = "none"
string dataobject = "dwe_premio_sin_0"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

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

event doubleclicked;cb_agte.triggerevent(clicked!)
end event

type gb_3 from groupbox within w_premio_sin_0
integer x = 1541
integer y = 1604
integer width = 768
integer height = 160
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

