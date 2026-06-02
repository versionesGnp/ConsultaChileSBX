forward
global type w_campana_res_comi from window
end type
type cb_detalle from commandbutton within w_campana_res_comi
end type
type cb_clasif_hist from commandbutton within w_campana_res_comi
end type
type cb_limpiar from commandbutton within w_campana_res_comi
end type
type pb_aceptar from picturebutton within w_campana_res_comi
end type
type cb_cerrar from commandbutton within w_campana_res_comi
end type
type cb_imprimir from commandbutton within w_campana_res_comi
end type
type dw_lista from datawindow within w_campana_res_comi
end type
type dw_seleccion from datawindow within w_campana_res_comi
end type
type dw_fecha_cierre from datawindow within w_campana_res_comi
end type
type gb_1 from groupbox within w_campana_res_comi
end type
end forward

global type w_campana_res_comi from window
integer width = 3365
integer height = 1904
boolean titlebar = true
string title = "Calidad Cartera Supervisores"
boolean controlmenu = true
long backcolor = 67108864
cb_detalle cb_detalle
cb_clasif_hist cb_clasif_hist
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_lista dw_lista
dw_seleccion dw_seleccion
dw_fecha_cierre dw_fecha_cierre
gb_1 gb_1
end type
global w_campana_res_comi w_campana_res_comi

type variables
long il_row
string	is_cod1,is_cod2,is_cod3,is_cod4,is_cod5
end variables

forward prototypes
public subroutine wf_sup_hered (string as_cod_sup)
public function integer wf_cta_vta (string as_cod_sup, datetime as_fecha, datetime as_fec_clas, string as_clas)
public function long wf_reg_sup_h (string as_cod_sup)
end prototypes

public subroutine wf_sup_hered (string as_cod_sup);string	ls_cod
long	ll_folio,ll_cta

//wf_sup_hered(as_cod_sup)

SELECT	count("COD_SUP_HEREDADO")
INTO		:ll_cta
FROM 	"SUPERVISOR_HEREDADO"  
WHERE 	"SUPERVISOR_HEREDADO"."COD_SUP" = :as_cod_sup AND
			"SUPERVISOR_HEREDADO"."CORREL" = 1  AND
			"SUPERVISOR_HEREDADO"."ESTADO" = 'V'
USING	sqlca;
if isnull(ll_cta) or ll_cta=0 then ll_cta=0
if ll_cta=0 then
	is_cod1						= as_cod_sup
	is_cod2						= as_cod_sup
	is_cod3						= as_cod_sup
	is_cod4						= as_cod_sup
	is_cod5						= as_cod_sup
else
	DECLARE suph CURSOR FOR
	SELECT	ROWNUM,	"SUPERVISOR_HEREDADO"."COD_SUP_HEREDADO"
	FROM 	"SUPERVISOR_HEREDADO"  
	WHERE 	"SUPERVISOR_HEREDADO"."COD_SUP" = :as_cod_sup AND
				"SUPERVISOR_HEREDADO"."CORREL" = 1  AND
				"SUPERVISOR_HEREDADO"."ESTADO" = 'V'
	USING	sqlca;
	open suph;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch suph INTO	:ll_folio,	:ls_cod;
			if not isnull(ll_folio) and ll_folio>0 and not isnull(ls_cod) or ls_cod <> '' then
				if ll_folio=1 then
					is_cod1		= ls_cod
					is_cod2		= as_cod_sup
					is_cod3		= as_cod_sup
					is_cod4		= as_cod_sup
					is_cod5		= as_cod_sup
				elseif ll_folio=2 then
					is_cod2		= ls_cod
					is_cod3		= as_cod_sup
					is_cod4		= as_cod_sup
					is_cod5		= as_cod_sup
				elseif ll_folio=3 then
					is_cod3		= ls_cod
					is_cod4		= as_cod_sup	
					is_cod5		= as_cod_sup	
				elseif ll_folio=4 then
					is_cod4		= ls_cod	
					is_cod5		= as_cod_sup	
				elseif ll_folio=5 then
					is_cod5		= ls_cod
				end if
			end if
			setnull(ls_cod)
		LOOP
	end if
	close suph;
end if
end subroutine

public function integer wf_cta_vta (string as_cod_sup, datetime as_fecha, datetime as_fec_clas, string as_clas);long	ll_cant_vta

//wf_cta_vta(as_cod_sup,as_fecha,as_fec_clas,as_clas)
SELECT	COUNT("AGENTES"."COD_AGE")
INTO		:ll_cant_vta
FROM		"AGENTES",	"CLASIFICA_HIST"  
WHERE	"AGENTES"."COD_AGE" = "CLASIFICA_HIST"."COD_AGE" and  
			"AGENTES"."ESTADO" = 'A' AND  
			("AGENTES"."COD_SUP" = :as_cod_sup or "AGENTES"."COD_SUP" = :is_cod1 or "AGENTES"."COD_SUP" = :is_cod2 or "AGENTES"."COD_SUP" = :is_cod3 or "AGENTES"."COD_SUP" = :is_cod4 or "AGENTES"."COD_SUP" = :is_cod5 ) AND  
			( "AGENTES"."DEPTO" = 'K' OR "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'X') AND
			"AGENTES"."FECHA_INI" <= :as_fecha AND
			("AGENTES"."CANAL" = 'NF' OR "AGENTES"."CANAL" = 'UG') AND 
			"CLASIFICA_HIST"."FECHA_CLASIFICA" = :as_fec_clas AND  
			"CLASIFICA_HIST"."TIPO_CLASIFICA" = :as_clas
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_cant_vta) and ll_cant_vta > 0 then
		ll_cant_vta 						= ll_cant_vta
	else
		ll_cant_vta						= 0
	end if
else
	ll_cant_vta							= 0	
end if
if isnull(ll_cant_vta) or ll_cant_vta=0 then ll_cant_vta=0
Return ll_cant_vta


end function

public function long wf_reg_sup_h (string as_cod_sup);long	ll_cta

//wf_reg_sup_h(as_cod_sup)
SELECT	count("COD_SUP_HEREDADO")
INTO		:ll_cta
FROM 	"SUPERVISOR_HEREDADO"  
WHERE 	"SUPERVISOR_HEREDADO"."COD_SUP" = :as_cod_sup AND
			"SUPERVISOR_HEREDADO"."CORREL" = 1  AND
			"SUPERVISOR_HEREDADO"."ESTADO" = 'V'
USING	sqlca;
if isnull(ll_cta) or ll_cta=0 then ll_cta=0
return ll_cta

end function

on w_campana_res_comi.create
this.cb_detalle=create cb_detalle
this.cb_clasif_hist=create cb_clasif_hist
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.dw_seleccion=create dw_seleccion
this.dw_fecha_cierre=create dw_fecha_cierre
this.gb_1=create gb_1
this.Control[]={this.cb_detalle,&
this.cb_clasif_hist,&
this.cb_limpiar,&
this.pb_aceptar,&
this.cb_cerrar,&
this.cb_imprimir,&
this.dw_lista,&
this.dw_seleccion,&
this.dw_fecha_cierre,&
this.gb_1}
end on

on w_campana_res_comi.destroy
destroy(this.cb_detalle)
destroy(this.cb_clasif_hist)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.dw_seleccion)
destroy(this.dw_fecha_cierre)
destroy(this.gb_1)
end on

event open;string	ls_nulo,ls_jefe
long	ll_parque,ll_tot_reg

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;

gf_centrar(w_campana_res_comi)

dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)

if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque													= 1
	else
		ll_parque													= 11
	end if
	dw_seleccion.width	= 709
	pb_aceptar.x			= 905
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
	dw_seleccion.width	= 2203
	pb_aceptar.x			= 2405
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
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
	dw_seleccion.width	= 2203
	pb_aceptar.x			= 2405
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
	close(w_premios_calidad_cartera_sup)
end if

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type cb_detalle from commandbutton within w_campana_res_comi
integer x = 1193
integer y = 1640
integer width = 425
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Agentes"
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha_cierre,ldt_fecha_ini

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	ldt_fecha_ini				= dw_lista.getitemdatetime(il_row,'fecha_ini')
	ldt_fecha_cierre			= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	ls_codigo					= dw_lista.getitemstring(il_row,'cod_sup')
	if not isnull(ls_codigo) and ls_codigo<>''  then
		ls_string					= ls_codigo+'~t'+string(ldt_fecha_ini,'dd/mm/yyyy')+'~t'+string(ldt_fecha_cierre,'dd/mm/yyyy')
		if isvalid(w_detalle_calidad_cart_sup) then close(w_detalle_calidad_cart_sup)
		OpenWithParm (w_detalle_calidad_cart_sup,ls_string)
	end if
end if
end event

type cb_clasif_hist from commandbutton within w_campana_res_comi
integer x = 736
integer y = 1640
integer width = 457
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Clasificación Hist."
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha

dw_fecha_cierre.accepttext()
dw_lista.accepttext()

if dw_lista.rowcount() > 0 then
	if dw_lista.dataobject			='dwe_premios_calidad_cartera_sup' and dw_lista.rowcount() > 0 then
		ls_codigo						= dw_lista.getitemstring(il_row,'cod_sup')
		ldt_fecha						= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	end if
	if not isnull(ls_codigo) and ls_codigo<>'' and not isnull(ldt_fecha) then
		ls_string						= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')
		if isvalid(w_clasifica_historica) then close(w_clasifica_historica)
		OpenWithParm (w_clasifica_historica,ls_string)
	end if
end if
end event

type cb_limpiar from commandbutton within w_campana_res_comi
integer x = 2304
integer y = 1640
integer width = 274
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_campana_res_comi.triggerevent(open!)
end event

type pb_aceptar from picturebutton within w_campana_res_comi
integer x = 2405
integer y = 88
integer width = 133
integer height = 116
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_jefe,ls_superv,ls_cod_contab,ls_cod_sup,ls_nombre,ls_a_paterno,ls_a_materno,ls_estado,ls_nombre_comp,&
			ls_clasif_hist,ls_cargo,ls_decrip_premio
long		ll_cod_parque,ll_tipo_premio,ll_premio_a,ll_premio_b,ll_rut,ll_new,tot_reg,ll_cant_A,ll_tot_premio_A,&
			ll_cant_B,ll_tot_premio_B,ll_tot_premio,ll_cta
datetime	ldt_fecha_cierre,ldt_fecha_consul,ldt_fecha_cierre_ini,ldt_fecha_ing,ldt_fecha_clasif,ldt_fecha

dw_seleccion.AcceptText()
dw_fecha_cierre.AcceptText()
dw_lista.Reset()
ll_cod_parque																= dw_seleccion.getitemnumber(1,'parque')
ldt_fecha_cierre															= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ls_jefe																		= dw_seleccion.getitemstring(1,'jefe')
ls_superv																	= dw_seleccion.getitemstring(1,'supervisor')
ls_cod_contab																= 'P08'
ls_cargo																		= 'S'
SELECT	"COD_PREMIO",		"DESCRIPCION",			"PREMIO1",		"PREMIO2"
INTO		:ll_tipo_premio,	:ls_decrip_premio,	:ll_premio_a,	:ll_premio_b
FROM		"PREMIO_TIPO"  
WHERE 	( "PREMIO_TIPO"."COD_CONTAB" = :ls_cod_contab ) AND  
         	( "PREMIO_TIPO"."CARGO" = :ls_cargo )
USING	sqlca;
dw_lista.dataobject														= 'dwe_premios_calidad_cartera_sup'
dw_lista.settransobject(sqlca)
dw_lista.object.usuario.text												= gs_user
if not isnull(ll_cod_parque) and ll_cod_parque > 0 and not isnull(ldt_fecha_cierre) then
	SELECT DISTINCT	"FECHA_TERMINO"
	INTO		:ldt_fecha_consul
	FROM		"CIERRE_PAGOS_VENTAS"
	WHERE	"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
				"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_cierre AND
				"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque AND
				"CIERRE_PAGOS_VENTAS"."TIPO_EMPLEADO" = :ls_cargo
	USING	sqlca;
	if sqlca.sqlcode = 0 then
		if not isnull(ldt_fecha_consul) then
			dw_lista.object.titulo_1.text									= ls_decrip_premio
			SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
			INTO 		:ldt_fecha_cierre_ini  
			FROM 	"CIERRE_VENTA"  
			WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
			USING	Trans_1;
			if Trans_1.sqlcode=0 then
				if not isnull(ldt_fecha_cierre_ini) then
					ldt_fecha_cierre_ini 									= ldt_fecha_cierre_ini 
				end if
			end if
			SELECT	MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
			INTO		:ldt_fecha_clasif  
			FROM		"CLASIFICA_HIST"  
			WHERE	"CLASIFICA_HIST"."FECHA_CLASIFICA" <= :ldt_fecha_cierre
			USING	Trans_1;
			if Trans_1.sqlcode=0 then
				if not isnull(ldt_fecha_clasif) then
					ldt_fecha_clasif 										= ldt_fecha_clasif
				end if
			end if
			dw_lista.object.titulo_1.text									= ls_decrip_premio
			if not isnull(ls_jefe) and ls_jefe<> '' and isnull(ls_superv) then
				DECLARE x1 CURSOR FOR
				SELECT	"RES_COMI"."COD_AGE_SUP",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO",	"SUPERVISOR"."ESTADO",	"RES_COMI"."RUT",	"SUPERVISOR"."FECHA_ING",	"RES_COMI"."COD_CONTABLE",	"RES_COMI"."TOTAL_PAGO"
				FROM		"RES_COMI",	"SUPERVISOR"  
   				WHERE	( "RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" ) and  
         					( ( "SUPERVISOR"."COD_JEFE" = :ls_jefe ) AND  
         					( "RES_COMI"."FECHA" = :ldt_fecha_cierre ) AND  
         					( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab ) AND
							( "SUPERVISOR"."COD_PARQUE" = :ll_cod_parque ))
				ORDER BY	"SUPERVISOR"."FECHA_ING" ASC
				USING		Trans_2;
				open x1;
					if Trans_2.sqlcode=0 then
						DO WHILE Trans_2.sqlcode=0
						fetch x1 INTO :ls_cod_sup,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ls_estado,	:ll_rut,	:ldt_fecha_ing,	:ls_cod_contab,	:ll_tot_premio;
							if not isnull(ls_cod_sup) and ls_cod_sup <> '' and not isnull(ll_rut) and ll_rut > 0 then
								ls_nombre_comp								= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
								ls_clasif_hist									= f_clasif_hist(ls_cod_sup,ldt_fecha_cierre)
								wf_sup_hered(ls_cod_sup)
								if ls_clasif_hist <> 'D' then
									ldt_fecha										= datetime(RelativeDate(date(ldt_fecha_cierre), - 90))
									ll_cant_A										= wf_cta_vta(ls_cod_sup,ldt_fecha,ldt_fecha_clasif,'A')
									ll_tot_premio_A							= ll_cant_A * ll_premio_a
									if isnull(ll_tot_premio_A) then ll_tot_premio_A=0
									ll_cant_B										= wf_cta_vta(ls_cod_sup,ldt_fecha,ldt_fecha_clasif,'B')
									ll_tot_premio_B								= ll_cant_B * ll_premio_b
									if isnull(ll_tot_premio_B) then ll_tot_premio_B=0
									ll_tot_premio								= ll_tot_premio_A + ll_tot_premio_B
									ll_new										= dw_lista.insertrow(0)
									dw_lista.scrolltorow(ll_new)
									dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
									dw_lista.setitem(ll_new,"rut",ll_rut)
									dw_lista.setitem(ll_new,"cod_contab",ls_cod_contab)
									dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
									dw_lista.setitem(ll_new,"clasif",ls_clasif_hist)
									dw_lista.setitem(ll_new,"agte_a",ll_cant_A)
									dw_lista.setitem(ll_new,"agte_b",ll_cant_B)
									dw_lista.setitem(ll_new,"valor_a",ll_tot_premio_A)
									dw_lista.setitem(ll_new,"valor_b",ll_tot_premio_B)
									dw_lista.setitem(ll_new,"premio",ll_tot_premio)
									dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_cierre_ini)
									dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_cierre)
									dw_lista.setitem(ll_new,"parque",ll_cod_parque)
									dw_lista.setitem(ll_new,"fecha_clasif",ldt_fecha_clasif)
									dw_lista.setitem(ll_new,"cargo",ls_cargo)
								end if
							end if
							setnull(ls_cod_sup);setnull(ll_rut)
						LOOP
					end if
				close x1;
				tot_reg														= dw_lista.RowCount()
				if tot_reg = 0 then
					messagebox("Advertencia","No Registra Premios Calidad Cartera Supervisores N.F.")
				end if
			elseif not isnull(ls_jefe) and ls_jefe<>'' and not isnull(ls_superv) and ls_superv<>'' then
				DECLARE x2 CURSOR FOR
				SELECT	"RES_COMI"."COD_AGE_SUP",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO",	"SUPERVISOR"."ESTADO",	"RES_COMI"."RUT",	"SUPERVISOR"."FECHA_ING",	"RES_COMI"."COD_CONTABLE",	"RES_COMI"."TOTAL_PAGO"
				FROM		"RES_COMI",	"SUPERVISOR"  
   				WHERE	"RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" and  
         					"RES_COMI"."COD_AGE_SUP" = :ls_superv AND  
         					"RES_COMI"."FECHA" = :ldt_fecha_cierre AND  
         					"RES_COMI"."COD_CONTABLE" = :ls_cod_contab AND
							"SUPERVISOR"."COD_PARQUE" = :ll_cod_parque 
				ORDER BY		"SUPERVISOR"."FECHA_ING" ASC
				USING		Trans_2;
				open x2;
					if Trans_2.sqlcode=0 then
						DO WHILE Trans_2.sqlcode=0
						fetch x2 INTO :ls_cod_sup,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ls_estado,	:ll_rut,	:ldt_fecha_ing,	:ls_cod_contab,	:ll_tot_premio;
							if not isnull(ls_cod_sup) and ls_cod_sup <> '' and not isnull(ll_rut) and ll_rut > 0 then
								ls_nombre_comp								= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
								ls_clasif_hist									= f_clasif_hist(ls_cod_sup,ldt_fecha_cierre)
								wf_sup_hered(ls_cod_sup)
								if ls_clasif_hist <> 'D' then
									ldt_fecha										= datetime(RelativeDate(date(ldt_fecha_cierre), - 90))
									ll_cant_A										= wf_cta_vta(ls_cod_sup,ldt_fecha,ldt_fecha_clasif,'A')
									ll_tot_premio_A							= ll_cant_A * ll_premio_a
									if isnull(ll_tot_premio_A) then ll_tot_premio_A=0
									ll_cant_B										= wf_cta_vta(ls_cod_sup,ldt_fecha,ldt_fecha_clasif,'B')
									ll_tot_premio_B								= ll_cant_B * ll_premio_b
									if isnull(ll_tot_premio_B) then ll_tot_premio_B=0
									ll_tot_premio								= ll_tot_premio_A + ll_tot_premio_B
									ll_new										= dw_lista.insertrow(0)
									dw_lista.scrolltorow(ll_new)
									dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
									dw_lista.setitem(ll_new,"rut",ll_rut)
									dw_lista.setitem(ll_new,"cod_contab",ls_cod_contab)
									dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
									dw_lista.setitem(ll_new,"clasif",ls_clasif_hist)
									dw_lista.setitem(ll_new,"agte_a",ll_cant_A)
									dw_lista.setitem(ll_new,"agte_b",ll_cant_B)
									dw_lista.setitem(ll_new,"valor_a",ll_tot_premio_A)
									dw_lista.setitem(ll_new,"valor_b",ll_tot_premio_B)
									dw_lista.setitem(ll_new,"premio",ll_tot_premio)
									dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_cierre_ini)
									dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_cierre)
									dw_lista.setitem(ll_new,"parque",ll_cod_parque)
									dw_lista.setitem(ll_new,"fecha_clasif",ldt_fecha_clasif)
									dw_lista.setitem(ll_new,"cargo",ls_cargo)
								end if
							end if
							setnull(ls_cod_sup);setnull(ll_rut)
						LOOP
					end if
				close x2;
				tot_reg														= dw_lista.RowCount()
				if tot_reg = 0 then
					messagebox("Advertencia","No Registra Premios Calidad Cartera Supervisor N.F.")
				end if
			else
				DECLARE x3 CURSOR FOR
				SELECT	"RES_COMI"."COD_AGE_SUP",	"SUPERVISOR"."NOMBRE",	"SUPERVISOR"."A_PATERNO",	"SUPERVISOR"."A_MATERNO",	"SUPERVISOR"."ESTADO",	"RES_COMI"."RUT",	"SUPERVISOR"."FECHA_ING",	"RES_COMI"."COD_CONTABLE",	"RES_COMI"."TOTAL_PAGO"
				FROM		"RES_COMI",	"SUPERVISOR"  
   				WHERE	( "RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" ) and  
         					( ("RES_COMI"."FECHA" = :ldt_fecha_cierre ) AND  
         					( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab ) AND
							( "SUPERVISOR"."COD_PARQUE" = :ll_cod_parque ))
				ORDER BY		"SUPERVISOR"."FECHA_ING" ASC
				USING		Trans_2;
				open x3;
					if Trans_2.sqlcode=0 then
						DO WHILE Trans_2.sqlcode=0
						fetch x3 INTO :ls_cod_sup,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ls_estado,	:ll_rut,	:ldt_fecha_ing,	:ls_cod_contab,	:ll_tot_premio;
							if not isnull(ls_cod_sup) and ls_cod_sup <> '' and not isnull(ll_rut) and ll_rut > 0 then
								ls_nombre_comp								= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
								ls_clasif_hist									= f_clasif_hist(ls_cod_sup,ldt_fecha_cierre)
								wf_sup_hered(ls_cod_sup)
								if ls_clasif_hist <> 'D' then
									ldt_fecha										= datetime(RelativeDate(date(ldt_fecha_cierre), - 90))
									ll_cant_A										= wf_cta_vta(ls_cod_sup,ldt_fecha,ldt_fecha_clasif,'A')
									ll_tot_premio_A							= ll_cant_A * ll_premio_a
									if isnull(ll_tot_premio_A) then ll_tot_premio_A=0
									ll_cant_B										= wf_cta_vta(ls_cod_sup,ldt_fecha,ldt_fecha_clasif,'B')
									ll_tot_premio_B								= ll_cant_B * ll_premio_b
									if isnull(ll_tot_premio_B) then ll_tot_premio_B=0
									ll_tot_premio								= ll_tot_premio_A + ll_tot_premio_B
									ll_new										= dw_lista.insertrow(0)
									dw_lista.scrolltorow(ll_new)
									dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
									dw_lista.setitem(ll_new,"rut",ll_rut)
									dw_lista.setitem(ll_new,"cod_contab",ls_cod_contab)
									dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
									dw_lista.setitem(ll_new,"clasif",ls_clasif_hist)
									dw_lista.setitem(ll_new,"agte_a",ll_cant_A)
									dw_lista.setitem(ll_new,"agte_b",ll_cant_B)
									dw_lista.setitem(ll_new,"valor_a",ll_tot_premio_A)
									dw_lista.setitem(ll_new,"valor_b",ll_tot_premio_B)
									dw_lista.setitem(ll_new,"premio",ll_tot_premio)
									dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_cierre_ini)
									dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_cierre)
									dw_lista.setitem(ll_new,"parque",ll_cod_parque)
									dw_lista.setitem(ll_new,"fecha_clasif",ldt_fecha_clasif)
									dw_lista.setitem(ll_new,"cargo",ls_cargo)
								end if
							end if
							setnull(ls_cod_sup);setnull(ll_rut)
						LOOP
					end if
				close x3;
				tot_reg														= dw_lista.RowCount()
				if tot_reg = 0 then
					messagebox("Advertencia","No Registra Premios Calidad Cartera Supervisor N.F.")
				end if
			end if
		end if
	else
		if gl_proceso>=4 then
			dw_lista.object.titulo_1.text								= 'Proceso '+ls_decrip_premio
			SELECT	"CIERRE_VENTA"."CIERRE_VENTA_INI"  
			INTO 		:ldt_fecha_cierre_ini  
			FROM 		"CIERRE_VENTA"  
			WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				if not isnull(ldt_fecha_cierre_ini) then
					ldt_fecha_cierre_ini 								= ldt_fecha_cierre_ini 
				end if
			end if
			
			SELECT	MAX("CLASIFICA_HIST"."FECHA_CLASIFICA")  
			INTO		:ldt_fecha_clasif  
			FROM		"CLASIFICA_HIST"  
			WHERE		"CLASIFICA_HIST"."FECHA_CLASIFICA" <= :ldt_fecha_cierre
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				if not isnull(ldt_fecha_clasif) then
					ldt_fecha_clasif 										= ldt_fecha_clasif
				end if
			end if
			DECLARE x4 CURSOR FOR
			SELECT	"COD_SUP",		"NOMBRE",	"A_PATERNO",	"A_MATERNO",	"ESTADO",	"RUT",	"FECHA_ING"
			FROM		"SUPERVISOR"
			WHERE	(	"SUPERVISOR"."ESTADO" = 'A' ) AND  
						(	"SUPERVISOR"."COD_PARQUE" = :ll_cod_parque ) AND  
						(	"SUPERVISOR"."CANAL" = 'NF' OR "SUPERVISOR"."CANAL" = 'UG') AND  
						(	"SUPERVISOR"."DEPTO" = 'R' OR "SUPERVISOR"."DEPTO" = 'X' ) AND
						(	"SUPERVISOR"."COD_SUP" <> 'CS' ) AND
						//(	"SUPERVISOR"."CANAL" = 'UG' ) AND
						(	"SUPERVISOR"."PAGOS_VENTA" = 'S' )
			ORDER BY	"SUPERVISOR"."FECHA_ING" ASC
			USING	Trans_2;
			open x4;
				if Trans_2.sqlcode=0 then
					DO WHILE Trans_2.sqlcode=0
					fetch x4 INTO :ls_cod_sup,	:ls_nombre,	:ls_a_paterno,	:ls_a_materno,	:ls_estado,	:ll_rut,	:ldt_fecha_ing;
						if not isnull(ls_cod_sup) and ls_cod_sup <> '' and not isnull(ll_rut) and ll_rut > 0 then
							ls_nombre_comp									= ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
							ls_clasif_hist										= f_clasif_hist(ls_cod_sup,ldt_fecha_cierre)
							wf_sup_hered(ls_cod_sup)
							if ls_clasif_hist <> 'D' then
								ldt_fecha											= datetime(RelativeDate(date(ldt_fecha_cierre), - 90))
								ll_cant_A											= wf_cta_vta(ls_cod_sup,ldt_fecha,ldt_fecha_clasif,'A')
								ll_tot_premio_A								= ll_cant_A * ll_premio_a
								if isnull(ll_tot_premio_A) then ll_tot_premio_A=0
								ll_cant_B											= wf_cta_vta(ls_cod_sup,ldt_fecha,ldt_fecha_clasif,'B')
								ll_tot_premio_B									= ll_cant_B * ll_premio_b
								if isnull(ll_tot_premio_B) then ll_tot_premio_B=0
								ll_tot_premio									= ll_tot_premio_A + ll_tot_premio_B
								ll_new											= dw_lista.insertrow(0)
								dw_lista.scrolltorow(ll_new)
								dw_lista.setitem(ll_new,"cod_sup",ls_cod_sup)
								dw_lista.setitem(ll_new,"rut",ll_rut)
								dw_lista.setitem(ll_new,"cod_contab",ls_cod_contab)
								dw_lista.setitem(ll_new,"nombre",ls_nombre_comp)
								dw_lista.setitem(ll_new,"clasif",ls_clasif_hist)
								dw_lista.setitem(ll_new,"agte_a",ll_cant_A)
								dw_lista.setitem(ll_new,"agte_b",ll_cant_B)
								dw_lista.setitem(ll_new,"valor_a",ll_tot_premio_A)
								dw_lista.setitem(ll_new,"valor_b",ll_tot_premio_B)
								dw_lista.setitem(ll_new,"premio",ll_tot_premio)
								dw_lista.setitem(ll_new,"fecha_ini",ldt_fecha_cierre_ini)
								dw_lista.setitem(ll_new,"fecha_fin",ldt_fecha_cierre)
								dw_lista.setitem(ll_new,"parque",ll_cod_parque)
								dw_lista.setitem(ll_new,"fecha_clasif",ldt_fecha_clasif)
								dw_lista.setitem(ll_new,"cargo",ls_cargo)
							end if
						end if
						setnull(ls_cod_sup);setnull(ll_rut)
					LOOP
				end if
			close x4;
			tot_reg															= dw_lista.RowCount()
			if tot_reg = 0 then
				messagebox("Advertencia","No Registra Premio Calidad Cartera Supervisores N.F.")
			end if
		end if
	end if
else
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia", "Debe Ingresar Parque")
		dw_seleccion.setfocus()
		dw_seleccion.setcolumn('parque')
	elseif isnull(ldt_fecha_cierre) then
		messagebox("Advertencia", "Debe Ingresar Fecha Cierre de Ventas")
		dw_fecha_cierre.setfocus()
		dw_fecha_cierre.setcolumn('cierre_ventas')
	end if
end if
end event

type cb_cerrar from commandbutton within w_campana_res_comi
integer x = 3026
integer y = 1640
integer width = 274
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_campana_res_comi)
end event

type cb_imprimir from commandbutton within w_campana_res_comi
integer x = 2583
integer y = 1640
integer width = 274
integer height = 88
integer taborder = 50
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

type dw_lista from datawindow within w_campana_res_comi
integer x = 32
integer y = 228
integer width = 3269
integer height = 1368
integer taborder = 40
string title = "none"
string dataobject = "dwe_premios_calidad_cartera_sup"
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

event doubleclicked;string	ls_codigo,ls_string
datetime	ldt_fecha

ls_codigo					= dw_lista.getitemstring(il_row,'cod_sup')
ldt_fecha					= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
ls_string					= ls_codigo+'~t'+string(ldt_fecha,'dd/mm/yyyy')

if isvalid(w_premios_calidad_cartera_agte) then close(w_premios_calidad_cartera_agte)
	OpenWithParm (w_premios_calidad_cartera_agte,ls_string)
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type dw_seleccion from datawindow within w_campana_res_comi
integer x = 183
integer y = 32
integer width = 2203
integer height = 188
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

type dw_fecha_cierre from datawindow within w_campana_res_comi
integer x = 37
integer y = 120
integer width = 841
integer height = 100
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_campana_res_comi
integer x = 2281
integer y = 1592
integer width = 603
integer height = 160
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

