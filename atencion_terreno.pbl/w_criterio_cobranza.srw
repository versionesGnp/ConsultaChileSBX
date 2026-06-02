forward
global type w_criterio_cobranza from window
end type
type cb_grabar from commandbutton within w_criterio_cobranza
end type
type cb_cerrar from commandbutton within w_criterio_cobranza
end type
type dw_detalle from datawindow within w_criterio_cobranza
end type
end forward

global type w_criterio_cobranza from window
integer width = 1312
integer height = 852
boolean titlebar = true
string title = "Modifica Criterios Cobranza Terreno"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_detalle dw_detalle
end type
global w_criterio_cobranza w_criterio_cobranza

type variables
string		is_base,is_serie,is_modif_fec='N',is_modif_mto='N',is_graba='N',is_tipo_cob
long 		il_row,il_fila
datetime	idt_fec_ini,idt_fec_fin
double	idb_ing_caja=0
Double	il_numero
end variables

forward prototypes
public subroutine wf_cargar_resto (datetime adt_fecha_ini, datetime adt_fecha_fin, string as_serie, long al_numero)
public subroutine wf_actualizar (string fecha_cierre)
end prototypes

public subroutine wf_cargar_resto (datetime adt_fecha_ini, datetime adt_fecha_fin, string as_serie, long al_numero);
end subroutine

public subroutine wf_actualizar (string fecha_cierre);
end subroutine

on w_criterio_cobranza.create
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_detalle=create dw_detalle
this.Control[]={this.cb_grabar,&
this.cb_cerrar,&
this.dw_detalle}
end on

on w_criterio_cobranza.destroy
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_detalle)
end on

event open;long		ll_new

gf_centrar(w_criterio_cobranza)
dw_detalle.settransobject(sqlca)
is_base									= substr(1,1,Message.StringParm)
is_serie									= substr(1,2,Message.StringParm)
il_numero								= Double(substr(1,3,Message.StringParm))
il_fila										= long(substr(1,4,Message.StringParm))
idt_fec_ini								= datetime(date(substr(1,5,Message.StringParm)),time('00:00:00'))
idt_fec_fin								= datetime(date(substr(1,6,Message.StringParm)),time('00:00:00'))
is_tipo_cob								= substr(1,7,Message.StringParm)
if not isnull(is_base) and is_base<>'' and not isnull(is_serie) and is_serie<>'' and not isnull(il_numero) and il_numero>0 then
	dw_detalle.settransobject(sqlca)
	dw_detalle.getchild('concepto',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(is_tipo_cob)=0 then
		idw_detalle.insertrow(0)
	end if
	idw_detalle.insertrow(0)
	ll_new								= dw_detalle.insertrow(0)
	dw_detalle.scrolltorow(ll_new)
	dw_detalle.setitem(ll_new,"base",is_base)
	dw_detalle.setitem(ll_new,"serie",is_serie)
	dw_detalle.setitem(ll_new,"numero",il_numero)
	dw_detalle.setitem(ll_new,"fecha_inicio",idt_fec_ini)
	dw_detalle.setitem(ll_new,"monto",0)
	dw_detalle.setitem(ll_new,"pasa",'N')
	idb_ing_caja					= f_ing_caja_cob_terreno(is_base,is_serie,il_numero,idt_fec_ini,idt_fec_fin,is_tipo_cob)
	dw_detalle.setitem(ll_new,"ing_caja",idb_ing_caja)
	dw_detalle.accepttext()
end if
end event

type cb_grabar from commandbutton within w_criterio_cobranza
integer x = 55
integer y = 580
integer width = 357
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Grabar"
end type

event clicked;string		ls_pasa,ls_concep
long		ll_tot_reg,ll_res,ll_indi,ll_fila
datetime	ldt_fec_ini
double	ldb_monto

dw_detalle.accepttext()
ll_tot_reg											= dw_detalle.rowcount()
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		ll_res										= messageBox("Grabar","¿Desea Grabar Modificación Realizadas Cobranza Terreno?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			is_graba								= 'S'
			ldt_fec_ini							= dw_detalle.getitemdatetime(ll_indi,'fecha_inicio')
			ls_pasa								= dw_detalle.getitemstring(ll_indi,'pasa')
			if isvalid(w_comision_ejecutivo_terreno_asig) then
				w_comision_ejecutivo_terreno_asig.dw_comision.scrolltorow(il_fila)
				if is_modif_fec = 'S' then
					w_comision_ejecutivo_terreno_asig.dw_comision.setitem(il_fila,"at_gestion_fec_ini",ldt_fec_ini)
					w_comision_ejecutivo_terreno_asig.dw_comision.setitem(il_fila,"at_gestion_fec_fin",ldt_fec_ini)
					w_comision_ejecutivo_terreno_asig.dw_comision.setitem(il_fila,"at_gestion_monto",idb_ing_caja)
				elseif is_modif_mto = 'S' then
					w_comision_ejecutivo_terreno_asig.dw_comision.setitem(il_fila,"mto_min",ldb_monto)
				end if
				w_comision_ejecutivo_terreno_asig.dw_comision.setitem(il_fila,"pasa",'S')
				w_comision_ejecutivo_terreno_asig.dw_comision.accepttext()
				w_comision_ejecutivo_terreno_asig.dw_comision.setfocus()
			end if
			if isvalid(w_comision_ejec_terreno_asig_anular) then
				w_comision_ejec_terreno_asig_anular.dw_detalle.setitem(1,"at_gestion_fec_ini",ldt_fec_ini)
				w_comision_ejec_terreno_asig_anular.dw_detalle.setitem(1,"at_gestion_fec_fin",ldt_fec_ini)
				w_comision_ejec_terreno_asig_anular.dw_detalle.setitem(1,"at_gestion_monto",idb_ing_caja)
				w_comision_ejec_terreno_asig_anular.dw_detalle.accepttext()
				w_comision_ejec_terreno_asig_anular.dw_detalle.setfocus()
				w_comision_ejec_terreno_asig_anular.cb_grabar.triggerevent(clicked!)
			end if
		end if
	next
	//w_comision_ejecutivo_terreno_asig.cb_criterio_cob.enabled		= false
	close(w_criterio_cobranza)
end if
end event

type cb_cerrar from commandbutton within w_criterio_cobranza
integer x = 882
integer y = 588
integer width = 357
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if is_graba = 'S' then
	close(w_criterio_cobranza)
end if
end event

type dw_detalle from datawindow within w_criterio_cobranza
integer x = 137
integer y = 116
integer width = 974
integer height = 432
integer taborder = 40
string title = "none"
string dataobject = "dwe_criterio_cobranza"
boolean border = false
end type

event itemchanged;string		ls_columna,ls_nulo,ls_estado_comi,ls_descrip
long		ll_tipo_gestion
datetime	ldt_nulo
double	ldb_ing_caja

setnull(ldt_nulo);setnull(ls_nulo)
dw_detalle.accepttext()
ls_columna								= dwo.name
if ls_columna = 'fecha_inicio' or ls_columna = 'monto' then
	idb_ing_caja						= f_ing_caja_cob_terreno(is_base,is_serie,il_numero,idt_fec_ini,idt_fec_fin,is_tipo_cob)
	dw_detalle.setitem(1,"ing_caja",idb_ing_caja)
	dw_detalle.accepttext()
	if ls_columna = 'fecha_inicio' then
		idt_fec_ini						= dw_detalle.getitemdatetime(1,'fecha_inicio') 
		idb_ing_caja					= f_ing_caja_cob_terreno(is_base,is_serie,il_numero,idt_fec_ini,idt_fec_fin,is_tipo_cob)
		dw_detalle.setitem(1,"ing_caja",idb_ing_caja)
		dw_detalle.accepttext()
		is_modif_fec					= 'S'
	elseif ls_columna = 'monto' then
		is_modif_mto					= 'S'
	end if
	cb_grabar.enabled					= true
	dw_detalle.setitem(1,"pasa",'N')
	dw_detalle.accepttext()
end if
end event

