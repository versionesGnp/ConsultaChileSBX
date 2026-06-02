forward
global type w_modificar_control_documento from window
end type
type cb_ctrol_doc from commandbutton within w_modificar_control_documento
end type
type cbx_cambio_serie from checkbox within w_modificar_control_documento
end type
type cb_limpiar from commandbutton within w_modificar_control_documento
end type
type cb_grabar from commandbutton within w_modificar_control_documento
end type
type tab_detalle from tab within w_modificar_control_documento
end type
type tabpage_detalle from userobject within tab_detalle
end type
type dw_detalle from datawindow within tabpage_detalle
end type
type p_1 from picture within tabpage_detalle
end type
type tabpage_detalle from userobject within tab_detalle
dw_detalle dw_detalle
p_1 p_1
end type
type tabpage_glosa_detalle from userobject within tab_detalle
end type
type dw_detalle_glosa from datawindow within tabpage_glosa_detalle
end type
type p_2 from picture within tabpage_glosa_detalle
end type
type tabpage_glosa_detalle from userobject within tab_detalle
dw_detalle_glosa dw_detalle_glosa
p_2 p_2
end type
type tabpage_memo_detalle from userobject within tab_detalle
end type
type dw_detalle_memo from datawindow within tabpage_memo_detalle
end type
type p_3 from picture within tabpage_memo_detalle
end type
type tabpage_memo_detalle from userobject within tab_detalle
dw_detalle_memo dw_detalle_memo
p_3 p_3
end type
type tab_detalle from tab within w_modificar_control_documento
tabpage_detalle tabpage_detalle
tabpage_glosa_detalle tabpage_glosa_detalle
tabpage_memo_detalle tabpage_memo_detalle
end type
type tab_control from tab within w_modificar_control_documento
end type
type tabpage_antecedente from userobject within tab_control
end type
type dw_antecedente from datawindow within tabpage_antecedente
end type
type tabpage_antecedente from userobject within tab_control
dw_antecedente dw_antecedente
end type
type tabpage_ult_gestion from userobject within tab_control
end type
type dw_ult_gestion from datawindow within tabpage_ult_gestion
end type
type tabpage_ult_gestion from userobject within tab_control
dw_ult_gestion dw_ult_gestion
end type
type tabpage_ult_memo from userobject within tab_control
end type
type dw_ult_memo from datawindow within tabpage_ult_memo
end type
type tabpage_ult_memo from userobject within tab_control
dw_ult_memo dw_ult_memo
end type
type tabpage_cambio_serie from userobject within tab_control
end type
type em_confirmar from editmask within tabpage_cambio_serie
end type
type em_nueva from editmask within tabpage_cambio_serie
end type
type st_6 from statictext within tabpage_cambio_serie
end type
type st_5 from statictext within tabpage_cambio_serie
end type
type em_serie_actual from editmask within tabpage_cambio_serie
end type
type st_actual from statictext within tabpage_cambio_serie
end type
type tabpage_cambio_serie from userobject within tab_control
em_confirmar em_confirmar
em_nueva em_nueva
st_6 st_6
st_5 st_5
em_serie_actual em_serie_actual
st_actual st_actual
end type
type tabpage_rev_ctto from userobject within tab_control
end type
type dw_rev_ctto from datawindow within tabpage_rev_ctto
end type
type tabpage_rev_ctto from userobject within tab_control
dw_rev_ctto dw_rev_ctto
end type
type tab_control from tab within w_modificar_control_documento
tabpage_antecedente tabpage_antecedente
tabpage_ult_gestion tabpage_ult_gestion
tabpage_ult_memo tabpage_ult_memo
tabpage_cambio_serie tabpage_cambio_serie
tabpage_rev_ctto tabpage_rev_ctto
end type
type pb_aceptar from picturebutton within w_modificar_control_documento
end type
type em_numero from editmask within w_modificar_control_documento
end type
type em_serie from editmask within w_modificar_control_documento
end type
type em_base from editmask within w_modificar_control_documento
end type
type st_4 from statictext within w_modificar_control_documento
end type
type st_3 from statictext within w_modificar_control_documento
end type
type st_2 from statictext within w_modificar_control_documento
end type
type st_1 from statictext within w_modificar_control_documento
end type
type cb_cerrar from commandbutton within w_modificar_control_documento
end type
type gb_1 from groupbox within w_modificar_control_documento
end type
end forward

global type w_modificar_control_documento from window
integer width = 3090
integer height = 1988
boolean titlebar = true
string title = "Modificar Control Documento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ctrol_doc cb_ctrol_doc
cbx_cambio_serie cbx_cambio_serie
cb_limpiar cb_limpiar
cb_grabar cb_grabar
tab_detalle tab_detalle
tab_control tab_control
pb_aceptar pb_aceptar
em_numero em_numero
em_serie em_serie
em_base em_base
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_modificar_control_documento w_modificar_control_documento

type variables
String		is_base,is_serie
Long		il_row,il_cierre,il_insertar=0,il_graba_rev=0
Double	il_numero
end variables

forward prototypes
public subroutine wf_limpiar ()
public subroutine wf_insertar_detalle ()
end prototypes

public subroutine wf_limpiar ();tab_control.SelectedTab	= 1
tab_detalle.SelectedTab	= 1
tab_control.tabpage_antecedente.dw_antecedente.reset()
tab_control.tabpage_ult_gestion.dw_ult_gestion.reset()
tab_control.tabpage_ult_memo.dw_ult_memo.reset()
tab_detalle.tabpage_detalle.dw_detalle.reset()
tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.reset()
tab_detalle.tabpage_memo_detalle.dw_detalle_memo.reset()
tab_control.tabpage_antecedente.dw_antecedente.insertrow(0)
tab_control.tabpage_ult_gestion.dw_ult_gestion.insertrow(0)
tab_control.tabpage_ult_memo.dw_ult_memo.insertrow(0)
tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.insertrow(0)
tab_detalle.tabpage_memo_detalle.dw_detalle_memo.insertrow(0)
Setnull(is_base);setnull(is_serie);setnull(il_numero)
em_base.text														= ''
em_serie.text														= ''
em_numero.text														= ''
tab_control.tabpage_cambio_serie.em_nueva.text			= ''
tab_control.tabpage_cambio_serie.em_confirmar.text		= ''
tab_control.tabpage_cambio_serie.em_serie_actual.text	= ''
setnull(is_base);setnull(is_serie);setnull(il_numero)
tab_control.Enabled												= false
tab_detalle.Enabled												= false
cbx_cambio_serie.checked										= false
cbx_cambio_serie.enabled										= false
tab_control.tabpage_cambio_serie.visible					= false
tab_control.tabpage_cambio_serie.em_nueva.enabled		= false
tab_control.tabpage_cambio_serie.em_confirmar.enabled	= false
em_base.setfocus()
end subroutine

public subroutine wf_insertar_detalle ();Long	ll_new
ll_new	= tab_detalle.tabpage_detalle.dw_detalle.insertrow(0)
tab_detalle.tabpage_detalle.dw_detalle.scrolltorow(ll_new)
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'c_modif','S')
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_estado_modificado','S')
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_base',is_base)
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_serie',is_serie)
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_numero',il_numero)
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_fecha_crea',gdt_fec_sistema)
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_usuario_crea',gs_user)
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_fecha_estado',today())
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_glosa','-')
tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_memo','-')
tab_detalle.tabpage_detalle.dw_detalle.accepttext()
tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.reset()
tab_detalle.tabpage_memo_detalle.dw_detalle_memo.reset()
tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.insertrow(0)
tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.setitem(1,'cd_folio_detalle_glosa','Se Crea Registro por medio Sistema Mantención, por Usuario: '+gs_user+' el '+string(gdt_fec_sistema))
tab_detalle.tabpage_memo_detalle.dw_detalle_memo.insertrow(0)
end subroutine

on w_modificar_control_documento.create
this.cb_ctrol_doc=create cb_ctrol_doc
this.cbx_cambio_serie=create cbx_cambio_serie
this.cb_limpiar=create cb_limpiar
this.cb_grabar=create cb_grabar
this.tab_detalle=create tab_detalle
this.tab_control=create tab_control
this.pb_aceptar=create pb_aceptar
this.em_numero=create em_numero
this.em_serie=create em_serie
this.em_base=create em_base
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.cb_ctrol_doc,&
this.cbx_cambio_serie,&
this.cb_limpiar,&
this.cb_grabar,&
this.tab_detalle,&
this.tab_control,&
this.pb_aceptar,&
this.em_numero,&
this.em_serie,&
this.em_base,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_cerrar,&
this.gb_1}
end on

on w_modificar_control_documento.destroy
destroy(this.cb_ctrol_doc)
destroy(this.cbx_cambio_serie)
destroy(this.cb_limpiar)
destroy(this.cb_grabar)
destroy(this.tab_detalle)
destroy(this.tab_control)
destroy(this.pb_aceptar)
destroy(this.em_numero)
destroy(this.em_serie)
destroy(this.em_base)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;string	ls_base,ls_serie,ls_modif
Double	ll_numero,ll_cod_parque

gf_centrar(w_modificar_control_documento)
gs_cerrar											= 'N'
tab_control.tabpage_antecedente.dw_antecedente.settransobject(sqlca)
tab_control.tabpage_ult_gestion.dw_ult_gestion.settransobject(sqlca)
tab_control.tabpage_ult_memo.dw_ult_memo.settransobject(sqlca)




//tab_control.tabpage_rev_ctto.dw_modif.settransobject(sqlca)
//tab_control.tabpage_rev_ctto.dw_rev_ctto.settransobject(sqlca)

tab_control.tabpage_rev_ctto.dw_rev_ctto.getchild('base',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve()=0 then
	idw_detalle3.insertrow(0)
end if

tab_control.tabpage_rev_ctto.dw_rev_ctto.getchild('serie',idw_detalle4)
idw_detalle4.settransobject(sqlca)
if idw_detalle4.retrieve('O',ll_cod_parque)=0 then
	idw_detalle4.insertrow(0)
end if
tab_control.tabpage_rev_ctto.dw_rev_ctto.insertrow(0)
tab_control.tabpage_rev_ctto.dw_rev_ctto.accepttext()

tab_detalle.tabpage_detalle.dw_detalle.settransobject(sqlca)
tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.settransobject(sqlca)
tab_detalle.tabpage_memo_detalle.dw_detalle_memo.settransobject(sqlca)


SELECT	"ENCARGADOS"."NOMBRE"  
INTO 		:gs_nombre_usuario  
FROM 		"ENCARGADOS"  
WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user 
Using		sqlca;
tab_control.tabpage_cambio_serie.visible						= false
cbx_cambio_serie.enabled											= false
tab_control.tabpage_cambio_serie.em_nueva.enabled		= false
tab_control.tabpage_cambio_serie.em_confirmar.enabled	= false
cb_limpiar.triggerevent(clicked!)
em_base.setfocus()

ls_base																= substr(1,1,Message.StringParm)
ls_serie																= substr(1,2,Message.StringParm)
ll_numero															= Double(substr(1,3,Message.StringParm))
ls_modif																= substr(1,4,Message.StringParm)
if ls_modif='M' then
	em_base.text													= ls_base
	em_serie.text													= ls_serie
	em_numero.text												= string(ll_numero)
	gs_cerrar														= 'S'
	pb_aceptar.triggerevent(clicked!)
end if
	
	
end event

type cb_ctrol_doc from commandbutton within w_modificar_control_documento
integer x = 1166
integer y = 1764
integer width = 347
integer height = 96
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Control Docto."
end type

event clicked;string		ls_string
ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)
if isvalid(w_cd_consultas_detalle_gestion) then close(w_cd_consultas_detalle_gestion)
openwithparm(w_cd_consultas_detalle_gestion,ls_string)

end event

type cbx_cambio_serie from checkbox within w_modificar_control_documento
integer x = 2501
integer y = 68
integer width = 485
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cambiar Serie"
end type

event clicked;if not isnull(is_base) and not isnull(is_serie) and il_numero>0 then
	if this.checked=true then
		tab_control.tabpage_cambio_serie.em_serie_actual.text	= trim(em_serie.text)
		tab_control.tabpage_cambio_serie.visible					= true
		tab_control.tabpage_cambio_serie.em_nueva.enabled		= true
		tab_control.tabpage_cambio_serie.em_confirmar.enabled	= true
		tab_control.tabpage_cambio_serie.em_nueva.text			= ''
		tab_control.tabpage_cambio_serie.em_confirmar.text		= ''
		tab_control.SelectedTab											= 4
		tab_control.tabpage_cambio_serie.em_nueva.setfocus()
	else
		tab_control.tabpage_cambio_serie.visible					= false
		tab_control.tabpage_cambio_serie.em_nueva.enabled		= false
		tab_control.tabpage_cambio_serie.em_confirmar.enabled	= false
		tab_control.tabpage_cambio_serie.em_nueva.text			= ''
		tab_control.tabpage_cambio_serie.em_confirmar.text		= ''
		tab_control.tabpage_cambio_serie.em_serie_actual.text	= ''
		tab_control.SelectedTab											= 1
	end if
end if
end event

type cb_limpiar from commandbutton within w_modificar_control_documento
integer x = 1518
integer y = 1760
integer width = 279
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;il_insertar	= 0
wf_limpiar()
end event

type cb_grabar from commandbutton within w_modificar_control_documento
integer x = 50
integer y = 1760
integer width = 279
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_ref,ls_memo,ls_usuario,ls_glosa,ls_codigo,ls_estado,ls_serie_actual,ls_serie_nueva,&
			ls_serie_confirma,ls_obs,ls_null,ls_base_mod,ls_serie_mod,ls_dv_mod,ls_dv_rev,ls_parque
Long		ll_estado,ll_resp,ll_sw_pasa=0,ll_estado_asig,ll_graba=0,ll_num_mod,ll_parque_mod,ll_rut_mod,ll_parque_rev,ll_rut_rev,ll_res
Datetime	ldt_fec_estado

if not isnull(is_base) and not isnull(is_serie) and il_numero>0 and trim(em_base.text)<>'' and &
	trim(em_serie.text)<>'' and trim(em_numero.text)<>'' then
	tab_control.tabpage_ult_gestion.dw_ult_gestion.accepttext()
	tab_control.tabpage_ult_memo.dw_ult_memo.accepttext()
	tab_detalle.tabpage_detalle.dw_detalle.accepttext()
	tab_control.tabpage_rev_ctto.dw_rev_ctto.accepttext()
	SELECT	sysdate
	INTO 		:gdt_fec_sistema
	FROM 	"TASA"  ;
	ls_ref								= tab_control.tabpage_ult_memo.dw_ult_memo.getitemstring(1,'ult_referencia_memo')
	ls_memo							= tab_control.tabpage_ult_memo.dw_ult_memo.getitemstring(1,'ult_memo')
	ll_estado							= tab_control.tabpage_ult_gestion.dw_ult_gestion.getitemnumber(1,'ult_estado')
	ldt_fec_estado					= tab_control.tabpage_ult_gestion.dw_ult_gestion.getitemdatetime(1,'ult_fecha_estado')
	ls_usuario						= tab_control.tabpage_ult_gestion.dw_ult_gestion.getitemstring(1,'ult_usuario_gestion')
	ls_glosa							= tab_control.tabpage_ult_gestion.dw_ult_gestion.getitemstring(1,'ult_glosa_estado')
	tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'ult_referencia_memo',ls_ref)
	tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'ult_memo',ls_memo)
	tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'ult_estado',ll_estado)
	tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'ult_fecha_estado',ldt_fec_estado)
	tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'ult_usuario_gestion',ls_usuario)
	tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'ult_glosa_estado',ls_glosa)
   	tab_control.tabpage_antecedente.dw_antecedente.accepttext()
	ls_codigo							= tab_control.tabpage_antecedente.dw_antecedente.getitemstring(1,'cod_agente')
	
	if tab_detalle.tabpage_detalle.dw_detalle.rowcount()>0 then
		ll_estado_asig					= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(tab_detalle.tabpage_detalle.dw_detalle.rowcount(),'cd_folio_detalle_estado')
		if (isnull(ll_estado_asig) or ll_estado_asig=0 or ll_estado_asig=1 or ll_estado_asig=97 or ll_estado_asig=98 or ll_estado_asig=99) and il_cierre=0 then
			ll_sw_pasa++
			messagebox("Advertencia","No es posible Ingresar Estado: 0-1-97-98-99")
		else
			if ll_estado >= 2 then
				SELECT	"AGENTES"."ESTADO"   
				INTO 		:ls_estado   
				FROM 	"AGENTES"   
				WHERE  	"AGENTES"."COD_AGE" = :ls_codigo
				USING	sqlca;
				If sqlca.sqlcode=0 then
					ls_codigo	= tab_control.tabpage_antecedente.dw_antecedente.getitemstring(1,'cod_supervisor')
					SELECT	"SUPERVISOR"."ESTADO"   
					INTO 		:ls_estado   
					FROM 		"SUPERVISOR"  
					WHERE 	"SUPERVISOR"."COD_SUP" = :ls_codigo   
					USING		sqlca;
					If sqlca.sqlcode=0 then
						ls_codigo	= tab_control.tabpage_antecedente.dw_antecedente.getitemstring(1,'cod_jefe_venta')
						SELECT	"JEFE_VENTAS"."ESTADO"  
						INTO 		:ls_estado  
						FROM 		"JEFE_VENTAS"  
						WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_codigo   
						USING		sqlca;
						If sqlca.sqlcode<>0 then
							ll_sw_pasa++
							messagebox("Advertencia","Jefe Venta Inexistente")
							tab_control.tabpage_antecedente.dw_antecedente.setfocus()
							tab_control.tabpage_antecedente.dw_antecedente.Setcolumn('cod_jefe_venta')
						end if
					else
						ll_sw_pasa++
						messagebox("Advertencia","Supervisor Inexistente")
						tab_control.tabpage_antecedente.dw_antecedente.setfocus()
						tab_control.tabpage_antecedente.dw_antecedente.Setcolumn('cod_supervisor')
					end if
				else
					ll_sw_pasa++
					messagebox("Advertencia","Agente Inexistente")
					tab_control.tabpage_antecedente.dw_antecedente.setfocus()
					tab_control.tabpage_antecedente.dw_antecedente.Setcolumn('cod_agente')
				end if
			else
				ll_sw_pasa		= 0
			end if
		end if
	end if
	if il_graba_rev=1 then
		ls_base_mod				= tab_control.tabpage_rev_ctto.dw_rev_ctto.getitemstring(1,'base')
		ls_serie_mod				= tab_control.tabpage_rev_ctto.dw_rev_ctto.getitemstring(1,'serie')
		ll_num_mod					= tab_control.tabpage_rev_ctto.dw_rev_ctto.getitemnumber(1,'numero')
		ll_parque_mod				= tab_control.tabpage_rev_ctto.dw_rev_ctto.getitemnumber(1,'cod_parque')
		ll_rut_mod					= tab_control.tabpage_rev_ctto.dw_rev_ctto.getitemnumber(1,'rut')
		ls_dv_mod					= tab_control.tabpage_rev_ctto.dw_rev_ctto.getitemstring(1,'dv')
		
		SELECT	"COD_PARQUE",	"RUT",		"DV"  
    		INTO 		:ll_parque_rev,		:ll_rut_rev,	:ls_dv_rev  
    		FROM		"REVISION_CONTRATOS"  
   		WHERE	( "REVISION_CONTRATOS"."BASE" = :is_base ) AND  
         			( "REVISION_CONTRATOS"."SERIE" = :is_serie ) AND  
         			( "REVISION_CONTRATOS"."NUMERO" = :il_numero )
		USING	sqlca;
		if ls_base_mod=is_base and ls_serie_mod=is_serie and ll_num_mod=il_numero and ll_parque_mod=ll_parque_rev and ll_rut_mod=ll_rut_rev and ls_dv_mod=ls_dv_rev then
		else
			ll_res						= MessageBox("Advertencia", 'Desea Grabar Modificación Registro Revisión Contrato', Exclamation!, YesNo!, 2)
			if ll_res=1 then
				SELECT "COD_PARQ"."NOMBRE"  
    				INTO 		:ls_parque  
    				FROM 	"COD_PARQ"  
   				WHERE 	"COD_PARQ"."CODIGO" = :ll_parque_rev
				USING	sqlca;

				
				if tab_control.tabpage_rev_ctto.dw_rev_ctto.update()=1 then
					commit using sqlca;
					UPDATE	"REVISION_CONTRATOS_OBSERVACION"  
     				SET 		"BASE" = :ls_base_mod,
					  			"SERIE" = :ls_serie_mod,
								"NUMERO" = :ll_num_mod,
								"RUT" = :ll_rut_mod
   					WHERE	( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :is_base ) AND  
         						( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :is_serie ) AND  
         						( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :il_numero )
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit using sqlca;
						ll_graba++				//1
					else
						rollback using sqlca;
					end if
					
					ls_obs					= 'SE MODIFICA DATOS DE REVISION CONTRATO '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")+', '+string(ll_parque_rev)+'-'+ls_parque+', '+string(ll_rut_rev,"###,###,###,###")+'-'+ls_dv_rev+', POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
					
					UPDATE	"CD_FOLIO"  
					SET 		"BASE" = :ls_base_mod,
					  			"SERIE" = :ls_serie_mod,
								"NUMERO" = :ll_num_mod,
								"COD_PARQUE" = :ll_parque_mod
					WHERE	( "CD_FOLIO"."BASE" = :is_base ) AND  
							 	( "CD_FOLIO"."SERIE" = :is_serie ) AND  
							 	( "CD_FOLIO"."NUMERO" = :il_numero )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_graba++				//2
					else
						messagebox("Error Grabar","Error al Modificación Datos CD_FOLIO SQL: "+sqlca.sqlerrtext)
						rollback;
					end if
					UPDATE	"CD_FOLIO_DETALLE"  
					SET 		"BASE" = :ls_base_mod,
					  			"SERIE" = :ls_serie_mod,
								"NUMERO" = :ll_num_mod,
								"COD_PARQUE" = :ll_parque_mod
					WHERE	( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
								( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
							 	( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_graba++				//3
					else
						rollback;
						messagebox("Error Grabar","Error al Modificación Datos CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
					end if
					
					UPDATE	"CLIENTE_REZAGO"  
					SET 		"BASE" = :ls_base_mod,
					  			"SERIE" = :ls_serie_mod,
								"NUMERO" = :ll_num_mod
					WHERE	( "CLIENTE_REZAGO"."BASE" = :is_base ) AND  
								( "CLIENTE_REZAGO"."SERIE" = :is_serie ) AND  
								( "CLIENTE_REZAGO"."NUMERO" = :il_numero )   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_graba++				//4
					else
						rollback;
						ll_graba++
						messagebox("Error Grabar","Error al Modificación Datos CLIENTE_REZAGO SQL: "+sqlca.sqlerrtext)
					end if
					
					INSERT INTO	"CD_FOLIO_DETALLE"  
								("BASE",			"SERIE",			"NUMERO",   	"FECHA_CREA",   	"USUARIO_CREA",	"ESTADO",	"FECHA_ESTADO",	"GLOSA",	"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA", "REFERENCIA_MEMO" )  
					VALUES	(:ls_base_mod,	:ls_serie_mod,	:ll_num_mod,	:gdt_fec_sistema,	:gs_user,   			107,  			:gdt_fec_sistema,	:ls_obs,	'-',   		:ls_null,  				:ls_null,   				:ls_null,   				'-' )  
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_graba++				//5
					else
						rollback;
						messagebox("Error Grabar","Error al Insertar Registro Modificación Datos CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback using sqlca;
					messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
				end if
				if ll_graba=5 then
					messagebox("Grabar","Grabación Exitosa")
					il_insertar							= 0
					cb_limpiar.triggerevent(clicked!)
				end if
			end if
		end if
	end if
	
	
	if ll_sw_pasa=0 then
		if tab_control.tabpage_antecedente.dw_antecedente.update()=1 then
			commit;
			if tab_detalle.tabpage_detalle.dw_detalle.update()=1 then
				commit;
				ll_graba++				//1
				if cbx_cambio_serie.checked=true then
					ls_serie_actual				= trim(tab_control.tabpage_cambio_serie.em_serie_actual.text)
					ls_serie_nueva				= trim(tab_control.tabpage_cambio_serie.em_nueva.text)
					ls_serie_confirma			= trim(tab_control.tabpage_cambio_serie.em_confirmar.text)
					if not isnull(ls_serie_actual) and ls_serie_actual<>'' and &
						not isnull(ls_serie_nueva) and ls_serie_nueva<>'' and &
						not isnull(ls_serie_confirma) and ls_serie_confirma<>'' and &
						not isnull(is_base) and is_base<>'' and &
						not isnull(is_serie) and is_serie<>'' and &
						not isnull(il_numero) and il_numero>0 then
						ls_obs					= 'SE CAMBIA SERIE DEL CONTRATO '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###") +' POR '+is_base+'-'+ls_serie_nueva+'-'+string(il_numero,"###,###,###,###,###")+', POR USUARIO: '+gs_user+': '+gs_nom_comp_usuario+' EL '+string(gdt_fec_sistema,"dd/mm/yyyy")
						// Actualiza cd_folio
						UPDATE	"CD_FOLIO"  
						SET 		"SERIE" = :ls_serie_nueva  
						WHERE	( "CD_FOLIO"."BASE" = :is_base ) AND  
								 	( "CD_FOLIO"."SERIE" = :is_serie ) AND  
								 	( "CD_FOLIO"."NUMERO" = :il_numero )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++				//2
						else
							messagebox("Error Grabar","Error al Cambiar Serie CD_FOLIO SQL: "+sqlca.sqlerrtext)
							rollback;
						end if
						UPDATE	"CD_FOLIO_DETALLE"  
						SET 		"SERIE" = :ls_serie_nueva  
						WHERE	( "CD_FOLIO_DETALLE"."BASE" = :is_base ) AND  
									( "CD_FOLIO_DETALLE"."SERIE" = :is_serie ) AND  
								 	( "CD_FOLIO_DETALLE"."NUMERO" = :il_numero )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++				//3
						else
							rollback;
							messagebox("Error Grabar","Error al Cambiar Serie CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
						end if
						UPDATE	"CLIENTE_REZAGO"  
						SET 		"SERIE" = :ls_serie_nueva  
						WHERE	( "CLIENTE_REZAGO"."BASE" = :is_base ) AND  
									( "CLIENTE_REZAGO"."SERIE" = :is_serie ) AND  
									( "CLIENTE_REZAGO"."NUMERO" = :il_numero )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++				//4
						else
							rollback;
							ll_graba++
							messagebox("Error Grabar","Error al Cambiar Serie CLIENTE_REZAGO SQL: "+sqlca.sqlerrtext)
						end if
						setnull(ls_null)
						// Insertar registro cd_folio_detalle
						INSERT INTO	"CD_FOLIO_DETALLE"  
									(	"BASE",		"SERIE",				"NUMERO",   "FECHA_CREA",   	"USUARIO_CREA",   "ESTADO",   "FECHA_ESTADO",   "GLOSA",   "MEMO",   "COD_AGENTE",		"COD_SUPERVISOR",		"COD_JEFE_VENTA", "REFERENCIA_MEMO" )  
						VALUES 	( :is_base,		:ls_serie_nueva,	:il_numero,	:gdt_fec_sistema,	:gs_user,   		97,   		:gdt_fec_sistema,	:ls_obs,   '-',   	:ls_null,  			:ls_null,   			:ls_null,   		'-' )  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++				//5
						else
							rollback;
							ll_graba++
							messagebox("Error Grabar","Error al Insertar Registro cambio serie CD_FOLIO_DETALLE SQL: "+sqlca.sqlerrtext)
						end if
						UPDATE	"REVISION_CONTRATOS"  
						SET 		"SERIE" = :ls_serie_nueva  
						WHERE	( "REVISION_CONTRATOS"."BASE" = :is_base ) AND  
									( "REVISION_CONTRATOS"."SERIE" = :is_serie ) AND  
									( "REVISION_CONTRATOS"."NUMERO" = :il_numero )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++				//6
						else
							rollback;
							ll_graba++
							messagebox("Error Grabar","Error al Cambiar Serie CLIENTE_REZAGO SQL: "+sqlca.sqlerrtext)
						end if
						UPDATE	"REVISION_CONTRATOS_OBSERVACION"  
						SET 		"SERIE" = :ls_serie_nueva  
						WHERE	( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :is_base ) AND  
									( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :is_serie ) AND  
									( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :il_numero )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++				//7
						else
							rollback;
							ll_graba++
							messagebox("Error Grabar","Error al Cambiar Serie CLIENTE_REZAGO SQL: "+sqlca.sqlerrtext)
						end if
						UPDATE	"CD_FOLIO_DETALLE_EXCEPCION"  
						SET 		"SERIE" = :ls_serie_nueva  
						WHERE	( "CD_FOLIO_DETALLE_EXCEPCION"."BASE" = :is_base ) AND  
									( "CD_FOLIO_DETALLE_EXCEPCION"."SERIE" = :is_serie ) AND  
									( "CD_FOLIO_DETALLE_EXCEPCION"."NUMERO" = :il_numero )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++				//8
						else
							rollback;
							ll_graba++
							messagebox("Error Grabar","Error al Cambiar Serie CD_FOLIO_DETALLE_EXCEPCION SQL: "+sqlca.sqlerrtext)
						end if
						UPDATE	"CD_FOLIO_DETALLE_RECHAZO"  
						SET 		"SERIE" = :ls_serie_nueva  
						WHERE	( "CD_FOLIO_DETALLE_RECHAZO"."BASE" = :is_base ) AND  
									( "CD_FOLIO_DETALLE_RECHAZO"."SERIE" = :is_serie ) AND  
									( "CD_FOLIO_DETALLE_RECHAZO"."NUMERO" = :il_numero )   
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++				//9
						else
							rollback;
							messagebox("Error Grabar","Error al Cambiar Serie CD_FOLIO_DETALLE_RECHAZO SQL: "+sqlca.sqlerrtext)
						end if
					end if
				end if
				if cbx_cambio_serie.checked=true and ll_graba=9 then
					messagebox("Grabar","Grabación Exitosa")
					il_insertar							= 0
					cb_limpiar.triggerevent(clicked!)
				elseif cbx_cambio_serie.checked=false and ll_graba=1 then
					messagebox("Grabar","Grabación Exitosa")
					il_insertar							= 0
					cb_limpiar.triggerevent(clicked!)
				end if
				if gs_cerrar	= 'S' then
					close(w_modificar_control_documento)
				end if
			else
				rollback;
				messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
			end if
		else
			rollback;
			messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type tab_detalle from tab within w_modificar_control_documento
integer x = 50
integer y = 884
integer width = 2976
integer height = 844
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_detalle tabpage_detalle
tabpage_glosa_detalle tabpage_glosa_detalle
tabpage_memo_detalle tabpage_memo_detalle
end type

on tab_detalle.create
this.tabpage_detalle=create tabpage_detalle
this.tabpage_glosa_detalle=create tabpage_glosa_detalle
this.tabpage_memo_detalle=create tabpage_memo_detalle
this.Control[]={this.tabpage_detalle,&
this.tabpage_glosa_detalle,&
this.tabpage_memo_detalle}
end on

on tab_detalle.destroy
destroy(this.tabpage_detalle)
destroy(this.tabpage_glosa_detalle)
destroy(this.tabpage_memo_detalle)
end on

event selectionchanged;if tab_detalle.SelectedTab=1 then
	tab_detalle.tabpage_detalle.dw_detalle.setfocus()
	tab_detalle.tabpage_detalle.dw_detalle.setcolumn('cd_folio_detalle_usuario_crea')
elseif tab_detalle.SelectedTab=2 then
	tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.setfocus()
	tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.setcolumn('cd_folio_detalle_glosa')
elseif tab_detalle.SelectedTab=3 then
	tab_detalle.tabpage_memo_detalle.dw_detalle_memo.setfocus()
	tab_detalle.tabpage_memo_detalle.dw_detalle_memo.setcolumn('cd_folio_detalle_referencia_memo')
end if
end event

type tabpage_detalle from userobject within tab_detalle
integer x = 18
integer y = 108
integer width = 2939
integer height = 720
long backcolor = 67108864
string text = "Detalle Gestión Documento"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_detalle dw_detalle
p_1 p_1
end type

on tabpage_detalle.create
this.dw_detalle=create dw_detalle
this.p_1=create p_1
this.Control[]={this.dw_detalle,&
this.p_1}
end on

on tabpage_detalle.destroy
destroy(this.dw_detalle)
destroy(this.p_1)
end on

type dw_detalle from datawindow within tabpage_detalle
integer x = 9
integer y = 28
integer width = 2921
integer height = 680
integer taborder = 40
string title = "none"
string dataobject = "dw_modificar_doc_folio_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Long		ll_estado,ll_new,ll_fila,ll_tot_reg,ll_indi
Datetime	ld_fecha_crea,ld_fecha_estado
String	ls_columna,ls_age,ls_sup,ls_jefe,ls_glosa,ls_pasa='S'
ls_columna				= dwo.name
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 		"TASA"  ;
if row>0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
	ll_estado			= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(il_row,'cd_folio_detalle_estado')
	ld_fecha_estado	= tab_detalle.tabpage_detalle.dw_detalle.getitemdatetime(il_row,'cd_folio_detalle_fecha_estado')
	ld_fecha_crea		= tab_detalle.tabpage_detalle.dw_detalle.getitemdatetime(il_row,'cd_folio_detalle_fecha_crea')
	tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.retrieve(is_base,is_serie,il_numero,ll_estado,ld_fecha_estado,ld_fecha_crea)
	tab_detalle.tabpage_memo_detalle.dw_detalle_memo.retrieve(is_base,is_serie,il_numero,ll_estado,ld_fecha_estado,ld_fecha_crea)
end if
if ls_columna='t_insertar' then
	if il_insertar>=1 then
		messagebox("Advertencia","No es posible Ingresar más de Un Item")
	else
		ll_tot_reg	= tab_detalle.tabpage_detalle.dw_detalle.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to ll_tot_reg
				ll_estado	= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(ll_indi,'cd_folio_detalle_estado')
				if isnull(ll_estado) then
					messagebox("Error","Debe Ingresar Estado en Fila Nº "+string(ll_estado))
					tab_detalle.tabpage_detalle.dw_detalle.setfocus()
					tab_detalle.tabpage_detalle.dw_detalle.scrolltorow(ll_indi)
					tab_detalle.tabpage_detalle.dw_detalle.setcolumn('cd_folio_detalle_estado')
					ls_pasa	= 'N'
					exit
				end if
			next
			if ll_tot_reg>2 and ls_pasa='S' then
//				ll_estado	= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(ll_tot_reg,'cd_folio_detalle_estado')
//				ll_est_ant	= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber((ll_tot_reg - 1),'cd_folio_detalle_estado')
//				if ll_estado=ll_est_ant then
//					messagebox("Advertencia","No es posible Ingresar Estado, Duplicado")
//					ls_pasa	= 'N'
//				end if
				if tab_detalle.tabpage_detalle.dw_detalle.getitemnumber((ll_tot_reg - 1),'cd_folio_detalle_estado')<>99 then
					ll_estado	= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber((ll_tot_reg - 1),'cd_folio_detalle_estado')
					ls_age		= tab_detalle.tabpage_detalle.dw_detalle.getitemString((ll_tot_reg - 1),'cd_folio_detalle_cod_agente')
					ls_sup		= tab_detalle.tabpage_detalle.dw_detalle.getitemString((ll_tot_reg - 1),'cd_folio_detalle_cod_supervisor')
					ls_jefe		= tab_detalle.tabpage_detalle.dw_detalle.getitemString((ll_tot_reg - 1),'cd_folio_detalle_cod_jefe_venta')
				else
					ll_estado	= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber((ll_tot_reg - 2),'cd_folio_detalle_estado')
					ls_age		= tab_detalle.tabpage_detalle.dw_detalle.getitemString((ll_tot_reg - 2),'cd_folio_detalle_cod_agente')
					ls_sup		= tab_detalle.tabpage_detalle.dw_detalle.getitemString((ll_tot_reg - 2),'cd_folio_detalle_cod_supervisor')
					ls_jefe		= tab_detalle.tabpage_detalle.dw_detalle.getitemString((ll_tot_reg - 2),'cd_folio_detalle_cod_jefe_venta')
				end if
			end if
		end if
		if ls_pasa = 'S' then
			il_insertar ++
			ll_new	= tab_detalle.tabpage_detalle.dw_detalle.insertrow(0)
			tab_detalle.tabpage_detalle.dw_detalle.scrolltorow(ll_new)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'c_modif','S')
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_estado',ll_estado)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_cod_agente',ls_age)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_cod_supervisor',ls_sup)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_cod_jefe_venta',ls_jefe)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_estado_modificado','S')
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_base',is_base)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_serie',is_serie)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_numero',il_numero)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_fecha_crea',gdt_fec_sistema)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_usuario_crea',gs_user)
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_fecha_estado',today())
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_glosa','-')
			tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_new,'cd_folio_detalle_memo','-')
			tab_detalle.tabpage_detalle.dw_detalle.accepttext()
			
			tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_estado',ll_estado)
			SELECT	"CD_ESTADO"."GLOSA"  
			INTO 		:ls_glosa  
			FROM 		"CD_ESTADO"  
			WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ls_glosa	= ls_glosa+', SE CAMBIA ESTADO POR SISTEMA EL DIA '+string(today(),"dd/mm/yyyy")+' POR USUARIO '+gs_nombre_usuario+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
				tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_glosa_estado',ls_glosa)
			end if
			tab_control.tabpage_ult_gestion.dw_ult_gestion.accepttext()
			
			tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.reset()
			tab_detalle.tabpage_memo_detalle.dw_detalle_memo.reset()
			tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.insertrow(0)
			tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.setitem(1,'cd_folio_detalle_glosa','Se Crea Registro por medio Sistema Mantención, por Usuario: '+gs_nombre_usuario+' el '+string(gdt_fec_sistema))
			tab_detalle.tabpage_memo_detalle.dw_detalle_memo.insertrow(0)
			tab_detalle.tabpage_detalle.dw_detalle.scrolltorow(ll_new)
			tab_detalle.tabpage_detalle.dw_detalle.setfocus()
			tab_detalle.tabpage_detalle.dw_detalle.setcolumn('cd_folio_detalle_estado')
		end if
	end if
//elseif ls_columna='t_eliminar' then
//	if gs_depto='I' then
//		tab_detalle.tabpage_detalle.dw_detalle.deleterow(il_row)
//		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.reset()
//		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.reset()
//	else
//		messagebox("Advertencia","Solo Personal de Informática, tiene autorización de Eliminar Registro")
//	end if
end if
end event

event itemchanged;String	ls_columna,ls_age,ls_estado,ls_sup,ls_jefe,ls_glosa
Long		ll_fila,ll_nulo,ll_estado,ll_ult_estado,ll_estado_ant,ll_new
Setnull(ll_nulo)
this.accepttext()
if il_insertar>1 then
	messagebox("Advertencia","No es posible Ingresar más de Un Item")
else
	ls_columna		= dwo.name
	if row>0 then
		ll_fila		= row
		CHOOSE CASE ls_columna
			CASE 'cd_folio_detalle_cod_agente'
				ll_estado	= this.getitemnumber(ll_fila,'cd_folio_detalle_estado')
				ls_age		= this.getitemstring(ll_fila,'cd_folio_detalle_cod_agente')
				SELECT	"AGENTES"."ESTADO",   
							"AGENTES"."COD_SUP",   
							"SUPERVISOR"."COD_JEFE"  
				INTO 		:ls_estado,   
							:ls_sup,   
							:ls_jefe  
				FROM 		"AGENTES",   
							"SUPERVISOR"  
				WHERE  ("AGENTES"."COD_AGE" = :ls_age )    
				USING		sqlca;
				If sqlca.sqlcode=0 then
					if ls_estado='I' then
						messagebox("Advertencia","Recuerde Código Agente "+ls_age+ "Inactivo")
					end if
					this.setitem(ll_fila,'cd_folio_detalle_cod_supervisor',ls_sup)
					this.setitem(ll_fila,'cd_folio_detalle_cod_jefe_venta',ls_jefe)
					if il_insertar>0 then
						tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'cod_agente',ls_age)
						tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'cod_supervisor',ls_sup)
						tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'cod_jefe_venta',ls_jefe)
						ll_estado		= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(ll_fila,'cd_folio_detalle_estado')
						if ll_estado=2 or ll_estado=20 then
							SELECT	"CD_ESTADO"."GLOSA"  
							INTO 		:ls_glosa  
							FROM 		"CD_ESTADO"  
							WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   
							USING		sqlca;
							if sqlca.sqlcode=0 then
								ls_glosa	= ls_glosa+': '+ls_age+', SUPERVISOR: '+ls_sup+' Y JEFE VENTA: '+ls_jefe+' EL DIA '+string(today(),"dd/mm/yyyy")+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
								tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_glosa_estado',ls_glosa)
								tab_control.tabpage_ult_gestion.dw_ult_gestion.accepttext()
							end if
						end if
						tab_control.tabpage_antecedente.dw_antecedente.accepttext()
					end if
					this.accepttext()
//					else
//						messagebox("Advertencia","Código Inactivo")
//						tab_detalle.tabpage_detalle.dw_detalle.deleterow(ll_fila)
//						wf_insertar_detalle()
//						tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_estado',ll_estado)
//						this.accepttext()
//					end if
				else
					messagebox("Advertencia","Código No Existe")
					tab_detalle.tabpage_detalle.dw_detalle.deleterow(ll_fila)
					wf_insertar_detalle()
					tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_estado',ll_estado)
					this.accepttext()
				end if
	
			CASE 'cd_folio_detalle_cod_supervisor'
				ls_sup		= this.getitemstring(ll_fila,'cd_folio_detalle_cod_supervisor')
				ll_estado	= this.getitemnumber(ll_fila,'cd_folio_detalle_estado')
				ls_age		= this.getitemstring(ll_fila,'cd_folio_detalle_cod_agente')
				SELECT	"SUPERVISOR"."ESTADO",   
							"SUPERVISOR"."COD_JEFE"  
				INTO 		:ls_estado,   
							:ls_jefe  
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_sup   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if ls_estado='A' then
						this.setitem(ll_fila,'cd_folio_detalle_cod_jefe_venta',ls_jefe)
						if il_insertar>0 then
							tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'cod_supervisor',ls_sup)
							tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'cod_jefe_venta',ls_jefe)
							tab_control.tabpage_antecedente.dw_antecedente.accepttext()
							ll_estado		= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(ll_fila,'cd_folio_detalle_estado')
							if ll_estado=2 or ll_estado=20 then
								SELECT	"CD_ESTADO"."GLOSA"  
								INTO 		:ls_glosa  
								FROM 		"CD_ESTADO"  
								WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_glosa	= ls_glosa+': '+ls_age+', SUPERVISOR: '+ls_sup+' Y JEFE VENTA: '+ls_jefe+' EL DIA '+string(today(),"dd/mm/yyyy")+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
									tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_glosa_estado',ls_glosa)
									tab_control.tabpage_ult_gestion.dw_ult_gestion.accepttext()
								end if
							end if
						end if
						this.accepttext()
					elseif ls_estado='I' then
						messagebox("Advertencia","Código Supervisor "+ls_sup+" Inactivo")
						tab_detalle.tabpage_detalle.dw_detalle.deleterow(ll_fila)
						wf_insertar_detalle()
						tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_estado',ll_estado)
						tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_cod_agente',ls_age)
						this.accepttext()
					end if
				else
					messagebox("Advertencia","Código No Existe")
					tab_detalle.tabpage_detalle.dw_detalle.deleterow(ll_fila)
					wf_insertar_detalle()
					tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_estado',ll_estado)
					tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_cod_agente',ls_age)
					this.accepttext()
				end if

			CASE 'cd_folio_detalle_cod_jefe_venta'
				ls_jefe		= this.getitemstring(ll_fila,'cd_folio_detalle_cod_jefe_venta')
				ls_sup		= this.getitemstring(ll_fila,'cd_folio_detalle_cod_supervisor')
				ll_estado	= this.getitemnumber(ll_fila,'cd_folio_detalle_estado')
				ls_age		= this.getitemstring(ll_fila,'cd_folio_detalle_cod_agente')
				SELECT	"JEFE_VENTAS"."ESTADO"  
				INTO 		:ls_estado  
				FROM 		"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if ls_estado='I' then
						messagebox("Advertencia","Código Inactivo")
						tab_detalle.tabpage_detalle.dw_detalle.deleterow(ll_fila)
						wf_insertar_detalle()
						tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_estado',ll_estado)
						tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_cod_agente',ls_age)
						tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_cod_supervisor',ls_sup)
						this.accepttext()
					else
						if il_insertar>0 then
							tab_control.tabpage_antecedente.dw_antecedente.setitem(1,'cod_jefe_venta',ls_jefe)
							tab_control.tabpage_antecedente.dw_antecedente.accepttext()
							ll_estado		= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(ll_fila,'cd_folio_detalle_estado')
							if ll_estado=2 or ll_estado=20 then
								SELECT	"CD_ESTADO"."GLOSA"  
								INTO 		:ls_glosa  
								FROM 		"CD_ESTADO"  
								WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   
								USING		sqlca;
								if sqlca.sqlcode=0 then
									ls_glosa	= ls_glosa+': '+ls_age+', SUPERVISOR: '+ls_sup+' Y JEFE VENTA: '+ls_jefe+' EL DIA '+string(today(),"dd/mm/yyyy")+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
									tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_glosa_estado',ls_glosa)
									tab_control.tabpage_ult_gestion.dw_ult_gestion.accepttext()
								end if
							end if
						end if
					end if
				else
					messagebox("Advertencia","Código Jefe Venta "+ls_jefe+" No Existe")
					tab_detalle.tabpage_detalle.dw_detalle.deleterow(ll_fila)
					wf_insertar_detalle()
					tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_estado',ll_estado)
					tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_cod_agente',ls_age)
					tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_fila,'cd_folio_detalle_cod_supervisor',ls_sup)
					this.accepttext()
				end if

			CASE 'cd_folio_detalle_estado'
				ll_estado		= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(ll_fila,'cd_folio_detalle_estado')
				ll_estado_ant	= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber((ll_fila - 1),'cd_folio_detalle_estado')
				ll_ult_estado	= tab_control.tabpage_ult_gestion.dw_ult_gestion.getitemnumber(1,'ult_estado')
				if ll_estado=ll_ult_estado or ll_estado=ll_estado_ant then
					messagebox("Advertencia","No es posible Ingresar Estado, el código coincide al Ultimo Ingresado")
					tab_detalle.tabpage_detalle.dw_detalle.deleterow(ll_fila)
					wf_insertar_detalle()
					tab_detalle.tabpage_detalle.dw_detalle.accepttext()
					tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_estado',ll_estado_ant)
					tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_glosa_estado','')
					tab_control.tabpage_ult_gestion.dw_ult_gestion.accepttext()
				elseif ll_estado=0 or ll_estado=1 or ll_estado=97 or ll_estado=98 or ll_estado=99 then
					messagebox("Advertencia","No es posible Ingresar Estado: 0-1-97-98-99")
					tab_detalle.tabpage_detalle.dw_detalle.deleterow(ll_fila)
					wf_insertar_detalle()
					tab_detalle.tabpage_detalle.dw_detalle.accepttext()
					tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_estado',ll_estado_ant)
					tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_glosa_estado','')
					tab_control.tabpage_ult_gestion.dw_ult_gestion.accepttext()
				else
					if il_insertar>0 then
						tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_estado',ll_estado)
						SELECT	"CD_ESTADO"."GLOSA"  
						INTO 		:ls_glosa  
						FROM 		"CD_ESTADO"  
						WHERE 	"CD_ESTADO"."CODIGO" = :ll_estado   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							ls_glosa	= ls_glosa+' EL DIA '+string(today(),"dd/mm/yyyy")+', FOLIO Nº '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###,###")
							tab_control.tabpage_ult_gestion.dw_ult_gestion.setitem(1,'ult_glosa_estado',ls_glosa)
						end if
						tab_control.tabpage_ult_gestion.dw_ult_gestion.accepttext()
					end if
				end if
		END CHOOSE
		this.accepttext()
	end if
end if
end event

type p_1 from picture within tabpage_detalle
boolean visible = false
integer x = 23
integer y = 36
integer width = 2889
integer height = 660
string picturename = "sin_detalle.bmp"
boolean focusrectangle = false
end type

type tabpage_glosa_detalle from userobject within tab_detalle
integer x = 18
integer y = 108
integer width = 2939
integer height = 720
long backcolor = 67108864
string text = "Glosa Detalle"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_detalle_glosa dw_detalle_glosa
p_2 p_2
end type

on tabpage_glosa_detalle.create
this.dw_detalle_glosa=create dw_detalle_glosa
this.p_2=create p_2
this.Control[]={this.dw_detalle_glosa,&
this.p_2}
end on

on tabpage_glosa_detalle.destroy
destroy(this.dw_detalle_glosa)
destroy(this.p_2)
end on

type dw_detalle_glosa from datawindow within tabpage_glosa_detalle
integer x = 14
integer y = 28
integer width = 2917
integer height = 680
integer taborder = 50
string title = "none"
string dataobject = "dw_modificar_doc_folio_detalle_glosa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_glosa
this.accepttext()
ls_columna	= dwo.name
if ls_columna='cd_folio_detalle_glosa' then
	ls_glosa	= trim(this.getitemstring(1,'cd_folio_detalle_glosa'))
	tab_detalle.tabpage_detalle.dw_detalle.setitem(il_row,'cd_folio_detalle_glosa',ls_glosa)
	tab_detalle.tabpage_detalle.dw_detalle.accepttext()
end if

end event

type p_2 from picture within tabpage_glosa_detalle
boolean visible = false
integer x = 27
integer y = 32
integer width = 2565
integer height = 656
string picturename = "sin_detalle.bmp"
boolean focusrectangle = false
end type

type tabpage_memo_detalle from userobject within tab_detalle
integer x = 18
integer y = 108
integer width = 2939
integer height = 720
long backcolor = 67108864
string text = "Memorandum Detalle"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_detalle_memo dw_detalle_memo
p_3 p_3
end type

on tabpage_memo_detalle.create
this.dw_detalle_memo=create dw_detalle_memo
this.p_3=create p_3
this.Control[]={this.dw_detalle_memo,&
this.p_3}
end on

on tabpage_memo_detalle.destroy
destroy(this.dw_detalle_memo)
destroy(this.p_3)
end on

type dw_detalle_memo from datawindow within tabpage_memo_detalle
integer x = 14
integer y = 28
integer width = 2926
integer height = 680
integer taborder = 50
string title = "none"
string dataobject = "dw_modificar_doc_folio_detalle_memo"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_columna,ls_ref,ls_memo
this.accepttext()
ls_columna	= dwo.name
if ls_columna='cd_folio_detalle_referencia_memo' then
	ls_ref	= trim(this.getitemstring(1,'cd_folio_detalle_referencia_memo'))
	tab_detalle.tabpage_detalle.dw_detalle.setitem(il_row,'cd_folio_detalle_referencia_memo',ls_ref)
	tab_detalle.tabpage_detalle.dw_detalle.accepttext()
elseif ls_columna='cd_folio_detalle_memo' then
	ls_memo	= trim(this.getitemstring(1,'cd_folio_detalle_memo'))
	tab_detalle.tabpage_detalle.dw_detalle.setitem(il_row,'cd_folio_detalle_memo',ls_memo)
	tab_detalle.tabpage_detalle.dw_detalle.accepttext()
end if

end event

type p_3 from picture within tabpage_memo_detalle
boolean visible = false
integer x = 27
integer y = 32
integer width = 2565
integer height = 656
string picturename = "sin_detalle.bmp"
boolean focusrectangle = false
end type

type tab_control from tab within w_modificar_control_documento
integer x = 50
integer y = 244
integer width = 2976
integer height = 624
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_antecedente tabpage_antecedente
tabpage_ult_gestion tabpage_ult_gestion
tabpage_ult_memo tabpage_ult_memo
tabpage_cambio_serie tabpage_cambio_serie
tabpage_rev_ctto tabpage_rev_ctto
end type

on tab_control.create
this.tabpage_antecedente=create tabpage_antecedente
this.tabpage_ult_gestion=create tabpage_ult_gestion
this.tabpage_ult_memo=create tabpage_ult_memo
this.tabpage_cambio_serie=create tabpage_cambio_serie
this.tabpage_rev_ctto=create tabpage_rev_ctto
this.Control[]={this.tabpage_antecedente,&
this.tabpage_ult_gestion,&
this.tabpage_ult_memo,&
this.tabpage_cambio_serie,&
this.tabpage_rev_ctto}
end on

on tab_control.destroy
destroy(this.tabpage_antecedente)
destroy(this.tabpage_ult_gestion)
destroy(this.tabpage_ult_memo)
destroy(this.tabpage_cambio_serie)
destroy(this.tabpage_rev_ctto)
end on

event selectionchanged;if tab_control.SelectedTab=1 then
	tab_control.tabpage_antecedente.dw_antecedente.setfocus()
	tab_control.tabpage_antecedente.dw_antecedente.setcolumn('cod_agente')
elseif tab_control.SelectedTab=2 then
	tab_control.tabpage_ult_gestion.dw_ult_gestion.setfocus()
	tab_control.tabpage_ult_gestion.dw_ult_gestion.setcolumn('ult_estado')
elseif tab_control.SelectedTab=3 then
	tab_control.tabpage_ult_memo.dw_ult_memo.setfocus()
	tab_control.tabpage_ult_memo.dw_ult_memo.setcolumn('ult_referencia_memo')
elseif tab_control.SelectedTab=4 then
	tab_control.tabpage_cambio_serie.em_serie_actual.setfocus()
end if
end event

type tabpage_antecedente from userobject within tab_control
integer x = 18
integer y = 104
integer width = 2939
integer height = 504
long backcolor = 67108864
string text = "Antecedente Folio"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_antecedente dw_antecedente
end type

on tabpage_antecedente.create
this.dw_antecedente=create dw_antecedente
this.Control[]={this.dw_antecedente}
end on

on tabpage_antecedente.destroy
destroy(this.dw_antecedente)
end on

type dw_antecedente from datawindow within tabpage_antecedente
integer x = 18
integer y = 20
integer width = 2921
integer height = 448
integer taborder = 50
string title = "none"
string dataobject = "dw_modificar_doc_folio_antecedente"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_age,ls_estado,ls_sup,ls_jefe
Long		ll_fila,ll_mes,ll_ano,ll_tot_reg,ll_indi,ll_mes_ant,&
			ll_ano_ant
			
this.accepttext()
ls_columna			= dwo.name
if row>0 then
	ll_fila			= row
	CHOOSE CASE ls_columna
		CASE 'cod_agente'
			ls_age	= this.getitemstring(ll_fila,'cod_agente')
			SELECT	"AGENTES"."ESTADO",   
						"AGENTES"."COD_SUP",   
						"SUPERVISOR"."COD_JEFE"  
			INTO 		:ls_estado,   
						:ls_sup,   
						:ls_jefe  
			FROM 		"AGENTES",   
						"SUPERVISOR"  
			WHERE  ( "AGENTES"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) and  
					 (("AGENTES"."COD_AGE" = :ls_age ) )   
			USING		sqlca;
			If sqlca.sqlcode=0 then
				il_cierre ++
//				if ls_estado='A' then
					this.setitem(ll_fila,'cod_supervisor',ls_sup)
					this.setitem(ll_fila,'cod_jefe_venta',ls_jefe)
					this.accepttext()
//				else
//					setnull(ls_age);setnull(ls_sup);setnull(ls_jefe)
//					this.setitem(ll_fila,'cod_agente',ls_age)
//					this.setitem(ll_fila,'cod_supervisor',ls_sup)
//					this.setitem(ll_fila,'cod_jefe_venta',ls_jefe)
//				end if
			else
				setnull(ls_age);setnull(ls_sup);setnull(ls_jefe)
				this.setitem(ll_fila,'cod_agente',ls_age)
				this.setitem(ll_fila,'cod_supervisor',ls_sup)
				this.setitem(ll_fila,'cod_jefe_venta',ls_jefe)
			end if

		CASE 'cod_supervisor'
			ls_sup	= this.getitemstring(ll_fila,'cod_supervisor')
			SELECT	"SUPERVISOR"."ESTADO",   
						"SUPERVISOR"."COD_JEFE"  
			INTO 		:ls_estado,   
						:ls_jefe  
			FROM 		"SUPERVISOR"  
			WHERE 	"SUPERVISOR"."COD_SUP" = :ls_sup   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				il_cierre ++
//				if ls_estado='A' then
					this.setitem(ll_fila,'cod_jefe_venta',ls_jefe)
					this.accepttext()
//				elseif ls_estado='I' then
//					setnull(ls_sup);setnull(ls_jefe)
//					this.setitem(ll_fila,'cod_supervisor',ls_sup)
//					this.setitem(ll_fila,'cod_jefe_venta',ls_jefe)
//				end if
			else
				setnull(ls_sup);setnull(ls_jefe)
				this.setitem(ll_fila,'cod_supervisor',ls_sup)
				this.setitem(ll_fila,'cod_jefe_venta',ls_jefe)
			end if

		CASE 'cod_jefe_venta'
			ls_jefe	= this.getitemstring(ll_fila,'cod_jefe_venta')
			SELECT	"JEFE_VENTAS"."ESTADO"  
			INTO 		:ls_estado  
			FROM 		"JEFE_VENTAS"  
			WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				il_cierre ++
//				if ls_estado='I' then
//					setnull(ls_jefe)
//					this.setitem(ll_fila,'cod_jefe_venta',ls_jefe)
//				end if
			else
				setnull(ls_jefe)
				this.setitem(ll_fila,'cod_jefe_venta',ls_jefe)
			end if
			
		CASE 'mes_cierre'
			ll_mes		= this.getitemnumber(ll_fila,'mes_cierre')
			ll_tot_reg	= tab_detalle.tabpage_detalle.dw_detalle.rowcount()
			for ll_indi=1 to ll_tot_reg
				ll_mes_ant	= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(ll_indi,'cd_folio_detalle_mes_cierre')
				if ll_mes_ant>0 then
					tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_indi,'cd_folio_detalle_mes_cierre',ll_mes)
					il_cierre ++
				end if
			next
		CASE 'ano_cierre'
			ll_ano		= this.getitemnumber(ll_fila,'ano_cierre')
			ll_tot_reg	= tab_detalle.tabpage_detalle.dw_detalle.rowcount()
			for ll_indi=1 to ll_tot_reg
				ll_ano_ant	= tab_detalle.tabpage_detalle.dw_detalle.getitemnumber(ll_indi,'cd_folio_detalle_ano_cierre')
				if ll_ano_ant>0 then
					tab_detalle.tabpage_detalle.dw_detalle.setitem(ll_indi,'cd_folio_detalle_ano_cierre',ll_ano)
					il_cierre ++
				end if
			next
	END CHOOSE
	this.accepttext()
end if
end event

type tabpage_ult_gestion from userobject within tab_control
integer x = 18
integer y = 104
integer width = 2939
integer height = 504
long backcolor = 67108864
string text = "Ultima Gestion"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_ult_gestion dw_ult_gestion
end type

on tabpage_ult_gestion.create
this.dw_ult_gestion=create dw_ult_gestion
this.Control[]={this.dw_ult_gestion}
end on

on tabpage_ult_gestion.destroy
destroy(this.dw_ult_gestion)
end on

type dw_ult_gestion from datawindow within tabpage_ult_gestion
integer x = 18
integer y = 12
integer width = 2921
integer height = 456
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_modificar_doc_folio_ultima_gestion"
boolean border = false
boolean livescroll = true
end type

type tabpage_ult_memo from userobject within tab_control
integer x = 18
integer y = 104
integer width = 2939
integer height = 504
long backcolor = 67108864
string text = "Ultimo Memorandum"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_ult_memo dw_ult_memo
end type

on tabpage_ult_memo.create
this.dw_ult_memo=create dw_ult_memo
this.Control[]={this.dw_ult_memo}
end on

on tabpage_ult_memo.destroy
destroy(this.dw_ult_memo)
end on

type dw_ult_memo from datawindow within tabpage_ult_memo
integer x = 23
integer y = 32
integer width = 2935
integer height = 436
integer taborder = 40
string title = "none"
string dataobject = "dw_modificar_doc_folio_ultima_memo"
boolean border = false
boolean livescroll = true
end type

type tabpage_cambio_serie from userobject within tab_control
integer x = 18
integer y = 104
integer width = 2939
integer height = 504
long backcolor = 67108864
string text = "Cambiar Serie Contrato"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
em_confirmar em_confirmar
em_nueva em_nueva
st_6 st_6
st_5 st_5
em_serie_actual em_serie_actual
st_actual st_actual
end type

on tabpage_cambio_serie.create
this.em_confirmar=create em_confirmar
this.em_nueva=create em_nueva
this.st_6=create st_6
this.st_5=create st_5
this.em_serie_actual=create em_serie_actual
this.st_actual=create st_actual
this.Control[]={this.em_confirmar,&
this.em_nueva,&
this.st_6,&
this.st_5,&
this.em_serie_actual,&
this.st_actual}
end on

on tabpage_cambio_serie.destroy
destroy(this.em_confirmar)
destroy(this.em_nueva)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.em_serie_actual)
destroy(this.st_actual)
end on

type em_confirmar from editmask within tabpage_cambio_serie
integer x = 2190
integer y = 256
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

event modified;String	ls_serie_confirma
ls_serie_confirma		= trim(this.text)
if not isnull(ls_serie_confirma) and ls_serie_confirma<>'' then
	if ls_serie_confirma=trim(tab_control.tabpage_cambio_serie.em_nueva.text) then
		cb_grabar.setfocus()
	else
		messagebox("Advertencia","Error debe Ingresar Serie :   "+trim(tab_control.tabpage_cambio_serie.em_nueva.text))
		em_confirmar.text			= ''
		em_confirmar.setfocus()
	end if
end if
end event

type em_nueva from editmask within tabpage_cambio_serie
integer x = 2190
integer y = 96
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

event modified;String		ls_serie,ls_base,ls_descrip
Double	ll_num_aux

ls_base								= trim(em_base.text)
ls_serie								= trim(this.text)
if not isnull(ls_base) and not isnull(ls_serie) and ls_base<>'' and ls_serie<>'' then
	if ls_serie <> trim(tab_control.tabpage_cambio_serie.em_serie_actual.text) then
		SELECT	"TABLA_SERIES"."DESCRIPCION"  
		INTO 		:ls_descrip  
		FROM 		"TABLA_SERIES"  
		WHERE  ( "TABLA_SERIES"."BASE" = :ls_base ) AND  
				 ( "TABLA_SERIES"."SERIE" = :ls_serie )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			SELECT	"CD_FOLIO"."NUMERO"  
			INTO 		:ll_num_aux  
			FROM 		"CD_FOLIO"  
			WHERE  ( "CD_FOLIO"."BASE" = :is_base ) AND  
					 ( "CD_FOLIO"."SERIE" = :ls_serie ) AND  
					 ( "CD_FOLIO"."NUMERO" = :il_numero )   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				messagebox("Advertencia","Documento Nº  "+is_base+'-'+ls_serie+'-'+string(il_numero,"###,###,###,###,###")+"  Ya Existe en tabla Control Documento")
				this.text					= ''
				em_confirmar.text			= ''
				em_confirmar.enabled		= false
				em_nueva.setfocus()
			elseif sqlca.sqlcode=100 then
				if is_base='O' or is_base='U' or is_base='L' or is_base='A' then
					SELECT	"CADENA"."NUMERO"  
					INTO 		:ll_num_aux  
					FROM 		"CADENA"  
					WHERE  ( "CADENA"."CODIGO" = :is_base ) AND  
							 ( "CADENA"."SERIE" = :ls_serie ) AND  
							 ( "CADENA"."NUMERO" = :il_numero )   
					USING		sqlca;
					if sqlca.sqlcode=100 then
						em_confirmar.enabled		= true
						em_confirmar.setfocus()
					elseif sqlca.sqlcode=0 then
						messagebox("Advertencia","Documento Nº  "+is_base+'-'+ls_serie+'-'+string(il_numero,"###,###,###,###,###")+"  Ya Existe en Cuenta Corriente")
						this.text					= ''
						em_confirmar.text			= ''
						em_confirmar.enabled		= false
						em_nueva.setfocus()
					else
						messagebox("Advertencia","Error en busqueda en tabla cadena SQL: "+sqlca.sqlerrtext)
						this.text					= ''
						em_confirmar.text			= ''
						em_confirmar.enabled		= false
						em_nueva.setfocus()
					end if
				elseif is_base='P' then
					SELECT	"PAGARE_V"."NUMERO_P"  
					INTO 		:ll_num_aux  
					FROM 		"PAGARE_V"  
					WHERE  ( "PAGARE_V"."SERIE_P" = :ls_serie ) AND  
							 ( "PAGARE_V"."NUMERO_P" = :il_numero )   
					USING		sqlca;
					if sqlca.sqlcode=100 then
						em_confirmar.enabled		= true
						em_confirmar.setfocus()
					elseif sqlca.sqlcode=0 then
						messagebox("Advertencia","Documento Nº  "+is_base+'-'+ls_serie+'-'+string(il_numero,"###,###,###,###,###")+"  Ya Existe en Cuenta Corriente")
						this.text					= ''
						em_confirmar.text			= ''
						em_confirmar.enabled		= false
						em_nueva.setfocus()
					else
						messagebox("Advertencia","Error en busqueda en tabla pagare_v SQL: "+sqlca.sqlerrtext)
						this.text					= ''
						em_confirmar.text			= ''
						em_confirmar.enabled		= false
						em_nueva.setfocus()
					end if
				end if
			elseif sqlca.sqlcode=-1 then
				messagebox("Advertencia","Error en busqueda en tabla cd_folio SQL: "+sqlca.sqlerrtext)
				this.text					= ''
				em_confirmar.text			= ''
				em_confirmar.enabled		= false
				em_nueva.setfocus()
			end if
		else
			messagebox("Advertencia","Serie  "+ls_serie+"  Inexistente")
			this.text					= ''
			em_confirmar.text			= ''
			em_confirmar.enabled		= false
			em_nueva.setfocus()
		end if
	else
		messagebox("Advertencia","Error No debe Ingresar la Serie Actual")
		this.text						= ''
		em_confirmar.text				= ''
		em_confirmar.enabled			= false
		em_nueva.setfocus()
	end if
else
	em_confirmar.text					= ''
	em_confirmar.enabled				= false
	em_nueva.setfocus()
end if
end event

type st_6 from statictext within tabpage_cambio_serie
integer x = 1230
integer y = 264
integer width = 905
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Confirmar Serie Nueva"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_cambio_serie
integer x = 1531
integer y = 104
integer width = 603
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie Nueva"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_serie_actual from editmask within tabpage_cambio_serie
integer x = 709
integer y = 96
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

event modified;String	ls_serie_actual
ls_serie_actual				= trim(this.text)
if not isnull(ls_serie_actual) and ls_serie_actual<>'' then
	if ls_serie_actual=trim(em_serie.text) then
		em_nueva.enabled		= true
		em_nueva.setfocus()
	else
		messagebox("Advertencia","Error debe Ingresar la misma Serie Actual :   "+trim(em_serie.text))
		this.text				= ''
		em_nueva.text			= ''
		em_confirmar.text		= ''
		em_nueva.enabled		= false
		em_confirmar.enabled	= false
		em_serie_actual.setfocus()
	end if
else
	em_nueva.text				= ''
	em_confirmar.text			= ''
	em_nueva.enabled			= false
	em_confirmar.enabled		= false
	em_serie_actual.setfocus()
end if
end event

type st_actual from statictext within tabpage_cambio_serie
integer x = 160
integer y = 96
integer width = 480
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie Actual"
alignment alignment = right!
boolean focusrectangle = false
end type

type tabpage_rev_ctto from userobject within tab_control
integer x = 18
integer y = 104
integer width = 2939
integer height = 504
long backcolor = 67108864
string text = "Revisión Ctto."
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_rev_ctto dw_rev_ctto
end type

on tabpage_rev_ctto.create
this.dw_rev_ctto=create dw_rev_ctto
this.Control[]={this.dw_rev_ctto}
end on

on tabpage_rev_ctto.destroy
destroy(this.dw_rev_ctto)
end on

type dw_rev_ctto from datawindow within tabpage_rev_ctto
integer y = 32
integer width = 2926
integer height = 464
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_revision_ctto_modifica"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string	ls_nulo,ls_columna,ls_base,ls_serie,ls_dv
long	ll_nulo,ll_cod_parque,ll_rut

Setnull(ls_nulo);setnull(ll_nulo)
dw_rev_ctto.accepttext()
ls_columna								= dwo.name
if ls_columna='cod_parque' or  ls_columna='base' then
	il_graba_rev							= 1		
	dw_rev_ctto.setitem(1,'serie',ls_nulo)
	ll_cod_parque						= dw_rev_ctto.getitemnumber(1,'cod_parque')
	ls_base								= dw_rev_ctto.getitemstring(1,'base')
	idw_detalle4.retrieve(ls_base,ll_cod_parque)
elseif ls_columna='serie' then
	il_graba_rev							= 1		
	ll_cod_parque						= dw_rev_ctto.getitemnumber(1,'cod_parque')
	if isnull(ll_cod_parque) or ll_cod_parque=0 then
		messagebox("Advertencia","Debe Ingresar Parque")
	else
		ls_base							= dw_rev_ctto.getitemstring(1,'base')
		ls_serie							= dw_rev_ctto.getitemstring(1,'serie')
		
		SELECT	"CD_TIPO_SERIE"."PARQUE"  
    		INTO		:ll_cod_parque  
    		FROM		"CD_TIPO_SERIE"  
   		WHERE	( "CD_TIPO_SERIE"."BASE" = :ls_base ) AND  
         			( "CD_TIPO_SERIE"."SERIE" = :ls_serie )
		USING	sqlca;
		if isnull(ll_cod_parque) or ll_cod_parque=0 then
			dw_rev_ctto.setitem(1,'cod_parque',ll_nulo)
		end if
	end if
elseif ls_columna = 'rut' or ls_columna = 'dv' then
	il_graba_rev							= 1		
	ll_rut									= dw_rev_ctto.getitemnumber(1,'rut')
	ls_dv									= dw_rev_ctto.getitemstring(1,'dv')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			dw_rev_ctto.setitem(1,'rut',ll_rut)
			dw_rev_ctto.setfocus()
			dw_rev_ctto.setcolumn('dv')
			dw_rev_ctto.setitem(1,'dv',ls_nulo)
		end if 
	end if
end if	
this.accepttext()
end event

type pb_aceptar from picturebutton within w_modificar_control_documento
integer x = 2190
integer y = 68
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;long			ll_tot_reg,ll_cod_parque,ll_existe

is_base		= trim(em_base.text)
is_serie		= trim(em_serie.text)
il_numero	= Double(trim(em_numero.text))
il_insertar	= 0
il_cierre	= 0
if not isnull(is_base) and not isnull(is_serie) and not isnull(il_numero) and &
	is_base<>'' and is_serie<>'' and il_numero>0 then
	if tab_control.tabpage_antecedente.dw_antecedente.retrieve(is_base,is_serie,il_numero)=0 then
		tab_control.tabpage_antecedente.dw_antecedente.insertrow(0)
		messagebox("Advertencia","No Registra Control de Documento")
		cbx_cambio_serie.enabled	= false
		cbx_cambio_serie.checked	= false
	else
		tab_control.Enabled			= true
		tab_detalle.Enabled			= true
		cbx_cambio_serie.enabled	= true
	end if
	
	SELECT	count("REVISION_CONTRATOS"."BASE")  
   	INTO 		:ll_existe  
    	FROM		"REVISION_CONTRATOS"  
   	WHERE	( "REVISION_CONTRATOS"."BASE" = :is_base ) AND  
         		( "REVISION_CONTRATOS"."SERIE" = :is_serie ) AND  
         		( "REVISION_CONTRATOS"."NUMERO" = :il_numero )
	USING	sqlca;
	if isnull(ll_existe) then ll_existe=0
	if ll_existe=0 then
		messagebox("Advertencia","No Registra Datos en Revisión Contratos")
	else
		SELECT	"REVISION_CONTRATOS"."COD_PARQUE"  
		INTO 		:ll_cod_parque  
		FROM		"REVISION_CONTRATOS"  
		WHERE	( "REVISION_CONTRATOS"."BASE" = :is_base ) AND  
					( "REVISION_CONTRATOS"."SERIE" = :is_serie ) AND  
					( "REVISION_CONTRATOS"."NUMERO" = :il_numero )
		USING	sqlca;
		if isnull(ll_cod_parque) then ll_cod_parque=0
		if ll_cod_parque>0 then
			tab_control.tabpage_rev_ctto.dw_rev_ctto.enabled 		= true
			
			tab_control.tabpage_rev_ctto.dw_rev_ctto.settransobject(sqlca)
			tab_control.tabpage_rev_ctto.dw_rev_ctto.getchild('base',idw_detalle3)
			idw_detalle3.settransobject(sqlca)
			if idw_detalle3.retrieve()=0 then
				idw_detalle3.insertrow(0)
			end if
			
			tab_control.tabpage_rev_ctto.dw_rev_ctto.settransobject(sqlca)
			tab_control.tabpage_rev_ctto.dw_rev_ctto.getchild('serie',idw_detalle4)
			idw_detalle4.settransobject(sqlca)
			if idw_detalle4.retrieve(is_base,ll_cod_parque)=0 then
				idw_detalle4.insertrow(0)
			end if
			
			tab_control.tabpage_rev_ctto.dw_rev_ctto.insertrow(0)
			tab_control.tabpage_rev_ctto.dw_rev_ctto.accepttext()
			
			ll_tot_reg															= tab_control.tabpage_rev_ctto.dw_rev_ctto.retrieve(is_base,is_serie,il_numero)
			if ll_tot_reg>0 then
				tab_control.Enabled											= true
				tab_detalle.Enabled											= true
			end if
			
		end if
	end if
	
	if tab_control.tabpage_ult_gestion.dw_ult_gestion.retrieve(is_base,is_serie,il_numero)=0 then
		tab_control.tabpage_ult_gestion.dw_ult_gestion.insertrow(0)
	end if
	if tab_control.tabpage_ult_memo.dw_ult_memo.retrieve(is_base,is_serie,il_numero)=0 then
		tab_control.tabpage_ult_memo.dw_ult_memo.insertrow(0)
	end if
	if tab_detalle.tabpage_detalle.dw_detalle.retrieve(is_base,is_serie,il_numero,gs_depto)=0 then
		tab_detalle.tabpage_detalle.dw_detalle.visible					= false
		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.visible	= false
		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.visible		= false
		tab_detalle.tabpage_detalle.p_1.visible							= true
		tab_detalle.tabpage_glosa_detalle.p_2.visible					= true
		tab_detalle.tabpage_memo_detalle.p_3.visible						= true
	else
		tab_detalle.tabpage_detalle.dw_detalle.visible					= true
		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.visible	= true
		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.visible		= true
		tab_detalle.tabpage_detalle.p_1.visible							= false
		tab_detalle.tabpage_glosa_detalle.p_2.visible					= false
		tab_detalle.tabpage_memo_detalle.p_3.visible						= false
	end if
else
	if isnull(is_base) or is_base='' then
		messagebox("Advertencia","Base Inválida")
		em_base.setfocus()
	elseif isnull(is_serie) or is_serie='' then
		messagebox("Advertencia","Serie Inválida")
		em_serie.setfocus()
	elseif isnull(il_numero) or il_numero=0 then
		messagebox("Advertencia","Número Inválido")
		em_numero.setfocus()
	end if
end if
end event

type em_numero from editmask within w_modificar_control_documento
integer x = 1600
integer y = 92
integer width = 434
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

event modified;Double	ll_numero
String		ls_base,ls_serie
ls_base		= trim(em_base.text)
ls_serie		= trim(em_serie.text)
ll_numero	= Double(em_numero.text)
if ll_numero>0 and not isnull(ll_numero) and not isnull(ls_base) and ls_base<>'' and &
	not isnull(ls_serie) and ls_serie<>'' then
	if ll_numero>0 then
		tab_control.tabpage_antecedente.dw_antecedente.reset()
		tab_control.tabpage_ult_gestion.dw_ult_gestion.reset()
		tab_control.tabpage_ult_memo.dw_ult_memo.reset()
		tab_detalle.tabpage_detalle.dw_detalle.reset()
		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.reset()
		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.reset()
		tab_control.tabpage_antecedente.dw_antecedente.insertrow(0)
		tab_control.tabpage_ult_gestion.dw_ult_gestion.insertrow(0)
		tab_control.tabpage_ult_memo.dw_ult_memo.insertrow(0)
		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.insertrow(0)
		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.insertrow(0)
		if not isnull(ls_base) and not isnull(ls_serie) then pb_aceptar.triggerevent(clicked!)
	else
		messagebox("Advertencia","Número  "+string(ll_numero,"###,###,###,###,###")+"  Inexistente")
		this.text	= ''
		this.setfocus()
	end if
end if
end event

type em_serie from editmask within w_modificar_control_documento
integer x = 1143
integer y = 92
integer width = 165
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

event modified;String	ls_serie,ls_base,ls_descrip

ls_base		= trim(em_base.text)
ls_serie		= trim(em_serie.text)
if not isnull(ls_base) and not isnull(ls_serie) and ls_base<>'' and ls_serie<>'' then
	SELECT	"TABLA_SERIES"."DESCRIPCION"  
	INTO 		:ls_descrip  
	FROM 		"TABLA_SERIES"  
	WHERE  ( "TABLA_SERIES"."BASE" = :ls_base ) AND  
			 ( "TABLA_SERIES"."SERIE" = :ls_serie )   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		tab_control.tabpage_antecedente.dw_antecedente.reset()
		tab_control.tabpage_ult_gestion.dw_ult_gestion.reset()
		tab_control.tabpage_ult_memo.dw_ult_memo.reset()
		tab_detalle.tabpage_detalle.dw_detalle.reset()
		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.reset()
		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.reset()
		tab_control.tabpage_antecedente.dw_antecedente.insertrow(0)
		tab_control.tabpage_ult_gestion.dw_ult_gestion.insertrow(0)
		tab_control.tabpage_ult_memo.dw_ult_memo.insertrow(0)
		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.insertrow(0)
		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.insertrow(0)
	else
		messagebox("Advertencia","Serie  "+ls_serie+"  Inexistente")
		this.text	= ''
		this.setfocus()
	end if
end if
end event

type em_base from editmask within w_modificar_control_documento
integer x = 773
integer y = 92
integer width = 165
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!"
end type

event modified;String	ls_base,ls_descrip
ls_base	= trim(em_base.text)
if not isnull(ls_base) and ls_base<>'' then
	SELECT	"TIPO_CONTRATO"."DESCRIPCION"  
	INTO 		:ls_descrip  
	FROM 		"TIPO_CONTRATO"  
	WHERE 	"TIPO_CONTRATO"."CODIGO" = :ls_base   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		tab_control.tabpage_antecedente.dw_antecedente.reset()
		tab_control.tabpage_ult_gestion.dw_ult_gestion.reset()
		tab_control.tabpage_ult_memo.dw_ult_memo.reset()
		tab_detalle.tabpage_detalle.dw_detalle.reset()
		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.reset()
		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.reset()
		tab_control.tabpage_antecedente.dw_antecedente.insertrow(0)
		tab_control.tabpage_ult_gestion.dw_ult_gestion.insertrow(0)
		tab_control.tabpage_ult_memo.dw_ult_memo.insertrow(0)
		tab_detalle.tabpage_glosa_detalle.dw_detalle_glosa.insertrow(0)
		tab_detalle.tabpage_memo_detalle.dw_detalle_memo.insertrow(0)
	else
		messagebox("Advertencia","Base  "+ls_base+"  Inexistente")
		this.text	= ''
		this.setfocus()
	end if
end if
end event

type st_4 from statictext within w_modificar_control_documento
integer x = 1344
integer y = 108
integer width = 233
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NUMERO"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_modificar_control_documento
integer x = 969
integer y = 108
integer width = 160
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SERIE"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_modificar_control_documento
integer x = 576
integer y = 108
integer width = 183
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "BASE"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_modificar_control_documento
integer x = 91
integer y = 104
integer width = 416
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Folio"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_modificar_control_documento
integer x = 2729
integer y = 1760
integer width = 297
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_modificar_control_documento)
end event

type gb_1 from groupbox within w_modificar_control_documento
integer x = 50
integer y = 20
integer width = 2990
integer height = 200
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingrese Documento"
end type

