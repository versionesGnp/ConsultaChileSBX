forward
global type w_cd_asignar_agente from window
end type
type dw_informe from datawindow within w_cd_asignar_agente
end type
type cb_grabar from commandbutton within w_cd_asignar_agente
end type
type cb_1 from commandbutton within w_cd_asignar_agente
end type
type dw_asignar from datawindow within w_cd_asignar_agente
end type
end forward

global type w_cd_asignar_agente from window
integer width = 2048
integer height = 1016
boolean titlebar = true
string title = "Asignar Agente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_informe dw_informe
cb_grabar cb_grabar
cb_1 cb_1
dw_asignar dw_asignar
end type
global w_cd_asignar_agente w_cd_asignar_agente

type variables
String	is_base,is_serie,is_opcion,is_agente,is_superv,is_jefe,is_pasa='S',is_depto_age='',is_depto_sup='',is_depto_jef=''
Long		il_sw_pasa=0
Double	il_numero
end variables

on w_cd_asignar_agente.create
this.dw_informe=create dw_informe
this.cb_grabar=create cb_grabar
this.cb_1=create cb_1
this.dw_asignar=create dw_asignar
this.Control[]={this.dw_informe,&
this.cb_grabar,&
this.cb_1,&
this.dw_asignar}
end on

on w_cd_asignar_agente.destroy
destroy(this.dw_informe)
destroy(this.cb_grabar)
destroy(this.cb_1)
destroy(this.dw_asignar)
end on

event open;Long		ll_new
gf_centrar(w_cd_asignar_agente)
dw_asignar.settransobject(sqlca)
is_base 		= trim(substr(1,1,Message.StringParm))
is_serie		= trim(substr(1,2,Message.StringParm))
il_numero	= Double(trim(substr(1,3,Message.StringParm)))
is_opcion		= trim(substr(1,4,Message.StringParm))
is_agente	= trim(substr(1,5,Message.StringParm))
is_superv	= trim(substr(1,6,Message.StringParm))
is_jefe		= trim(substr(1,7,Message.StringParm))
gs_base		= is_base
gs_serie		= is_serie 
gi_numero	= gi_numero
dw_informe.settransobject(sqlca)
if gs_depto='O' and gl_proceso=4 then
	SELECT	"ENCARGADOS"."DEPTO_CD_DOCTO"  
   	INTO 		:gs_depto  
    	FROM 	"ENCARGADOS"  
   	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
	USING	sqlca;
end if


if is_opcion='I' then
	if dw_asignar.retrieve(is_base,is_serie,il_numero)=0 then
		messagebox("Advertencia","No Registra Dato")
		close(w_cd_asignar_agente)
	else
		dw_asignar.object.t_titulo.text	= 'Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero)
	end if
elseif is_opcion='G' then
	if isvalid(w_cd_gestion_folio) then
		ll_new	= dw_asignar.insertrow(0)
		dw_asignar.setitem(ll_new,'cod_agente',is_agente)
		dw_asignar.setitem(ll_new,'cod_supervisor',is_superv)
		dw_asignar.setitem(ll_new,'cod_jefe_venta',is_jefe)
		dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_folio.em_numero_fin.text)
	elseif isvalid(w_cd_gestion_asignacion_agente) then
		ll_new	= dw_asignar.insertrow(0)
		dw_asignar.setitem(ll_new,'cod_agente',is_agente)
		dw_asignar.setitem(ll_new,'cod_supervisor',is_superv)
		dw_asignar.setitem(ll_new,'cod_jefe_venta',is_jefe)
		dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_asignacion_agente.em_numero_fin.text)
	end if
end if
dw_asignar.setfocus()

end event

event close;if gs_depto='O' and gl_proceso=4 then
	SELECT	"DEPTO"  
   	INTO 		:gs_depto  
    	FROM 	"ENCARGADOS"  
   	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
	USING	sqlca;
end if
end event

type dw_informe from datawindow within w_cd_asignar_agente
boolean visible = false
integer x = 667
integer y = 768
integer width = 731
integer height = 432
integer taborder = 40
string title = "none"
string dataobject = "dw_informe_entregar_agente"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_grabar from commandbutton within w_cd_asignar_agente
integer x = 41
integer y = 756
integer width = 357
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String		ls_age, ls_sup, ls_jefe,ls_glosa,ls_estado_reg,ls_base,ls_serie,ls_age_ant,ls_sup_ant, ls_jefe_ant,ls_nom,ls_ap_pat,ls_ap_mat,ls_nom_com_age,&
			ls_nom_com_sup,ls_nom_com_jef,ls_base_prim,ls_pasa,ls_dv_setear,ls_base_setear,ls_serie_setear
Long		ll_row,ll_tot_reg,ll_indi,ll_estado,ll_new,ll_resp,ll_ult_estado,ll_res,ll_sw_pasa=0,ll_cod_parque,ll_cd_funcion,ll_rut_setear//,ll_ulimo_estado_cd
Datetime	ldt_fecha
Double	ll_numero,ll_numero_setear

if il_sw_pasa>0 then
	dw_informe.reset()
	if isvalid(w_cd_gestion_asignacion_agente) then ls_base_prim = w_cd_gestion_asignacion_agente.dw_base.getitemstring(1,'base')
	if gs_empresa = 'El Prado' then
		dw_informe.object.t_parque.text		= 'INMOBILIARIA PARQUE LA FLORIDA SpA'
	else
		dw_informe.object.t_parque.text		= 'INMOBILIARIA PARQUE LA SERENA SpA'
	end if
	CHOOSE CASE ls_base_prim
		CASE 'O'
			dw_informe.object.t_contrato.text	= 'P R O M E S A'
		CASE 'A'
			dw_informe.object.t_contrato.text	= 'A U M E N T O   C A P A C I D A D'
		CASE 'P'
			dw_informe.object.t_contrato.text	= 'P A G A R E'
		CASE 'L'
			dw_informe.object.t_contrato.text	= 'A N E X O   L I B E R A D O R'
		CASE 'F'
			dw_informe.object.t_contrato.text	= 'S E R V I C I O  F U N E R A R I O'	
		CASE 'G'
			dw_informe.object.t_contrato.text	= 'S E R V I C I O  C R E M A T O R I O'	
		CASE 'U'
			dw_informe.object.t_contrato.text	= 'C O L U M B A R I O'	
		CASE 'V'
			dw_informe.object.t_contrato.text	= 'C O N T R  A T O   D E   S E R V I C I O'
		CASE 'M'
			dw_informe.object.t_contrato.text	= 'C O N T R  A T O   M U L T I P R O D U C T O'
	END CHOOSE
	
	SELECT	sysdate
	INTO 		:ldt_fecha
	FROM 		"TASA"  ;
	ls_age		= dw_asignar.getitemstring(1,'cod_agente')
	ls_sup		= dw_asignar.getitemstring(1,'cod_supervisor')
	ls_jefe		= dw_asignar.getitemstring(1,'cod_jefe_venta')
	
//	SELECT 	"CD_FOLIO"."ULT_ESTADO" 	
//	INTO 		:ll_ulimo_estado_cd  
//	FROM 	"CD_FOLIO"  	
//	WHERE 	( "CD_FOLIO"."BASE" = :is_base ) AND  
//				( "CD_FOLIO"."SERIE" = :is_serie ) AND  
//				( "CD_FOLIO"."NUMERO" = :il_numero )   ;
				
	SELECT	"AGENTES"."DEPTO"  
	INTO		:is_depto_age  
	FROM		"AGENTES"  
	WHERE	"AGENTES"."COD_AGE" = :ls_age
	USING	sqlca;
	SELECT	"SUPERVISOR"."DEPTO"  
	INTO		:is_depto_sup  
	FROM		"SUPERVISOR"  
	WHERE	"SUPERVISOR"."COD_SUP" = :ls_sup
	USING	sqlca;
	SELECT	"JEFE_VENTAS"."DEPTO"  
	INTO		:is_depto_jef  
	FROM		"JEFE_VENTAS"  
	WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe
	USING	sqlca;
	ls_pasa		= 'N'
	if (gs_depto='V' or gs_depto='I' or gs_depto='H' or gs_depto='O') and (is_depto_age='K' or is_depto_age='M') and is_depto_sup='R' and is_depto_jef='B' then
		ls_pasa	= 'S'
	elseif (gs_depto='O' or gs_depto='E' or gs_depto='I') and ((is_depto_age='E' and is_depto_sup='E' and is_depto_jef='E') or (is_depto_age='O' and is_depto_sup='O' and is_depto_jef='E')) then
		ls_pasa	= 'S'
	elseif (gs_depto='X' or gs_depto='I' or gs_depto='O') and is_depto_age='X' and is_depto_sup='X' and is_depto_jef='X' then
		ls_pasa	= 'S'	
	end if
	if (isnull(ls_age) or ls_age='') and (gs_depto='V' or gs_depto='H' or gs_depto='E') then
		ll_res	= messagebox("Advertencia","Está Seguro Asignar Contratos a Supervisor "+ls_sup,Exclamation!,YesNo!,2)
		if ll_res = 1 then
			ls_pasa	= 'S'
		else
			ls_pasa	= 'N'
		end if
	elseif not isnull(ls_age) and ls_age<>'' and (gs_depto='R' or gs_depto='B' or gs_depto='X' or gs_depto='I' or gs_depto='E') then
		ll_res	= messagebox("Advertencia","Está Seguro Asignar Contratos al Agente "+ls_age,Exclamation!,YesNo!,2)
		if ll_res = 1 then
			ls_pasa	= 'S'
		else
			ls_pasa	= 'N'
		end if
	end if
	if ls_pasa = 'S' then
		//Nombre Agente
		SELECT	"AGENTES"."NOMBRE",  "AGENTES"."A_PATERNO",  "AGENTES"."A_MATERNO"  
		INTO 		:ls_nom,   				:ls_ap_pat,   				:ls_ap_mat  
		FROM 		"AGENTES"  
		WHERE 	"AGENTES"."COD_AGE" = :ls_age   
		USING		sqlca;
		if sqlca.sqlcode=0 then ls_nom_com_age	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
		//Nombre Supervisor
		SELECT	"SUPERVISOR"."NOMBRE",  "SUPERVISOR"."A_PATERNO",  "SUPERVISOR"."A_MATERNO"  
		INTO 		:ls_nom,						:ls_ap_pat,   					:ls_ap_mat  
		FROM 		"SUPERVISOR"  
		WHERE 	"SUPERVISOR"."COD_SUP" = :ls_sup   
		USING		sqlca;
		if sqlca.sqlcode=0 then ls_nom_com_sup	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
		//Nombre Jefe
		SELECT	"JEFE_VENTAS"."NOMBRE", 	"JEFE_VENTAS"."A_PATERNO",   	"JEFE_VENTAS"."A_MATERNO"  
		INTO 		:ls_nom,   						:ls_ap_pat,   						:ls_ap_mat  
		FROM 		"JEFE_VENTAS"  
		WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe 
		USING		sqlca;
		if sqlca.sqlcode=0 then ls_nom_com_jef	= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
		if ( gs_depto='V' or gs_depto='H' or gs_depto='E' or gs_depto='X' or gs_depto='I' or (gs_depto='O' and gl_proceso=4) or (not isnull(ls_age) and (gs_depto='R' or gs_depto='B' or gs_depto='X') ) ) and not isnull(ls_sup) and not isnull(ls_jefe) then
			if isvalid(w_cd_gestion_asignacion_agente) then
				ll_tot_reg	= w_cd_gestion_asignacion_agente.dw_lista.rowcount()
				for ll_indi=1 to ll_tot_reg
					ls_estado_reg	= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'estado_reg')
					ll_estado			= w_cd_gestion_asignacion_agente.dw_lista.getitemNumber(ll_indi,'ult_estado')
					ls_base			= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'base')
					ls_serie			= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'serie')
					ll_numero		= w_cd_gestion_asignacion_agente.dw_lista.getitemnumber(ll_indi,'numero')
					ll_cod_parque	= w_cd_gestion_asignacion_agente.dw_lista.getitemnumber(ll_indi,'cod_parque')
					
					
					if (ls_estado_reg='I' and ll_estado=1) or (ls_estado_reg='I' and ll_estado=19) or &
						(ls_estado_reg='I' and ll_estado=20) or (ls_estado_reg='I' and ll_estado=32) or &
						(ls_estado_reg='I' and ll_estado=2) or (ls_estado_reg='I' and ll_estado=35) then
						ll_new	= dw_informe.insertrow(0)
						dw_informe.scrolltorow(ll_new)
						dw_informe.setitem(ll_new,'codigo_agente',ls_age)
						dw_informe.setitem(ll_new,'codigo_supervisor',ls_sup)
						dw_informe.setitem(ll_new,'codigo_jefe',ls_jefe)
						dw_informe.setitem(ll_new,'fecha',ldt_fecha)
						dw_informe.setitem(ll_new,'base',ls_base)
						dw_informe.setitem(ll_new,'serie',ls_serie)
						dw_informe.setitem(ll_new,'numero',ll_numero)
					end if
				next
			end if
			if is_opcion='I' and isvalid(w_cd_gestion_folio) then //Individual
				ll_row			= w_cd_gestion_folio.dw_lista.getrow()
				if ls_age='' or isnull(ls_age) then
					ls_glosa	= 'SE ASIGNA CONTRATO '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")+' AL SUPERVISOR: '+ls_sup+'  '+ls_nom_com_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
				else
					ls_glosa	= 'SE ASIGNA CONTRATO '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")+' AL AGENTE: '+ls_age+'  '+ls_nom_com_age+', SUPERVISOR: '+ls_sup+'  '+ls_nom_com_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
				end if
				if gs_depto='V' or gs_depto='O' or gs_depto='H' or gs_depto='R' or gs_depto='X' or (gs_depto='E' and (is_base='G' or is_base='V')) then
//					if ll_ulimo_estado_cd=2 then
//						ll_ult_estado	= 3
//					else
						ll_ult_estado	= 2
//					end if
				elseif gs_depto='O' or (gs_depto='E' and (is_base<>'G' and is_base<>'V')) then
					ll_ult_estado	= 21
				end if
				if is_base <> 'F' and is_base<>'G' and is_base <> 'V' then
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'ult_estado',ll_ult_estado)
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'ult_fecha_estado',ldt_fecha)
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'ult_glosa_estado',ls_glosa)
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'ult_memo','-')
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'ult_referencia_memo','-')
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'ult_usuario_gestion',gs_user)
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'cod_agente',ls_age)
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'cod_supervisor',ls_sup)
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'cod_jefe_venta',ls_jefe)
					w_cd_gestion_folio.dw_lista.setitem(ll_row,'cod_parque',ll_cod_parque)
					
					w_cd_gestion_folio.dw_lista.accepttext()
					if w_cd_gestion_folio.dw_lista.update()=1 then
						commit;
						INSERT INTO "CD_FOLIO_DETALLE"  
									("BASE",   	"SERIE",  "NUMERO",	"FECHA_CREA",	"USUARIO_CREA",	"ESTADO",   	"FECHA_ESTADO",	"GLOSA",		"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"COD_PARQUE")  
						VALUES	(:is_base,	:is_serie,	:il_numero,	:ldt_fecha,			:gs_user,   			:ll_ult_estado,	:ldt_fecha,   		:ls_glosa,	'-' ,		:ls_age,				:ls_sup,					:ls_jefe,					'-',								:ll_cod_parque)  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							messagebox("Grabar","Grabación Exitosa")
							is_depto_age=''
							is_depto_sup=''
							is_depto_jef=''
							if isvalid(w_cd_asignar_agente) then
								if (is_base = 'F' or is_base='G' or is_base='V') and isvalid(w_validar_promesa_operaciones) then
									ll_rut_setear			= Long(w_validar_promesa_operaciones.em_rut.text)
									ls_dv_setear			= trim(w_validar_promesa_operaciones.em_dv.text)
									ls_base_setear			= w_validar_promesa_operaciones.dw_base.getitemstring(1,'base')
									ls_serie_setear			= trim(w_validar_promesa_operaciones.ddlb_serie.text)
									ll_numero_setear		= Double(w_validar_promesa_operaciones.em_numero.text)
									w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'rut',ll_rut_setear)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'dv',ls_dv_setear)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'base',ls_base_setear)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'serie',ls_serie_setear)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'numero',ll_numero_setear)
									if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
								end if
								if isvalid(w_validar_promesa_operaciones) then w_validar_promesa_operaciones.setfocus()
								close(w_cd_asignar_agente)
								
							end if
						else
							rollback;
						end if
					else
						rollback;
						messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				else
					ll_cd_funcion			= f_cd_folio_funeraria(is_base,is_serie,il_numero,ldt_fecha,ll_ult_estado,ldt_fecha,ls_age,ls_sup,ls_jefe,ll_cod_parque)
					if ll_cd_funcion = 1 then
						messagebox("Grabar","Grabación Exitosa")
						is_depto_age=''
						is_depto_sup=''
						is_depto_jef=''
						if isvalid(w_cd_asignar_agente) then
							if (is_base = 'F' or is_base='G' or is_base='V') and isvalid(w_validar_promesa_operaciones) then
								ll_rut_setear			= Long(w_validar_promesa_operaciones.em_rut.text)
								ls_dv_setear			= trim(w_validar_promesa_operaciones.em_dv.text)
								ls_base_setear			= w_validar_promesa_operaciones.dw_base.getitemstring(1,'base')
								ls_serie_setear			= trim(w_validar_promesa_operaciones.ddlb_serie.text)
								ll_numero_setear		= Double(w_validar_promesa_operaciones.em_numero.text)
								w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'rut',ll_rut_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'dv',ls_dv_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'base',ls_base_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'serie',ls_serie_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'numero',ll_numero_setear)
								if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
							end if
							if isvalid(w_validar_promesa_operaciones) then w_validar_promesa_operaciones.setfocus()
							close(w_cd_asignar_agente)
						end if
					end if
				end if
			elseif is_opcion='I' and isvalid(w_cd_gestion_asignacion_agente) then //Individual
				

				ll_row			= w_cd_gestion_asignacion_agente.dw_lista.getrow()
				if ls_age='' or isnull(ls_age) then
					ls_glosa	= 'SE ASIGNA CONTRATO '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")+' AL SUPERVISOR: '+ls_sup+'  '+ls_nom_com_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
				else
					ls_glosa	= 'SE ASIGNA CONTRATO '+is_base+'-'+is_serie+'-'+string(il_numero,"###,###,###,###")+' AL AGENTE: '+ls_age+'  '+ls_nom_com_age+', SUPERVISOR: '+ls_sup+'  '+ls_nom_com_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
				end if
				if gs_depto='V' or gs_depto='O' or gs_depto='H' or gs_depto='R' or gs_depto='X' or gs_depto='I' or (gs_depto='E' and (is_base='G' or is_base='V')) then
//					if ll_ulimo_estado_cd = 2 then
//						ll_ult_estado	= 3
//					else
						ll_ult_estado	= 2
//					end if
				elseif gs_depto='O' or (gs_depto='E' and (is_base<>'G' and is_base<>'V')) then
					ll_ult_estado	= 21
				end if
				if is_base <> 'F' and is_base<>'G' and is_base<>'V' then
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'ult_estado',ll_ult_estado)
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'ult_fecha_estado',ldt_fecha)
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'ult_glosa_estado',ls_glosa)
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'ult_memo','-')
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'ult_referencia_memo','-')
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'ult_usuario_gestion',gs_user)
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'cod_agente',ls_age)
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'cod_supervisor',ls_sup)
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'cod_jefe_venta',ls_jefe)
					w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_row,'cod_parque',ll_cod_parque)
					w_cd_gestion_asignacion_agente.dw_lista.accepttext()
					if w_cd_gestion_asignacion_agente.dw_lista.update()=1 then
						commit;
						INSERT INTO "CD_FOLIO_DETALLE"  
									("BASE",   	"SERIE",  "NUMERO",	"FECHA_CREA",  	"USUARIO_CREA",	"ESTADO",   	"FECHA_ESTADO",	"GLOSA",		"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO",	"COD_PARQUE" )  
						VALUES	(:is_base,	:is_serie,	:il_numero,	:ldt_fecha,			:gs_user,   			:ll_ult_estado,	:ldt_fecha,   		:ls_glosa,	'-' ,		:ls_age,				:ls_sup,					:ls_jefe,					'-',								:ll_cod_parque)  
						USING		sqlca;
						if sqlca.sqlcode=0 then
							commit;
							messagebox("Grabar","Grabación Exitosa")
							is_depto_age=''
							is_depto_sup=''
							is_depto_jef=''
							if isvalid(w_cd_asignar_agente) then 
								if (is_base = 'F' or is_base='G' or is_base = 'V') and isvalid(w_validar_promesa_operaciones) then
									ll_rut_setear			= Long(w_validar_promesa_operaciones.em_rut.text)
									ls_dv_setear			= trim(w_validar_promesa_operaciones.em_dv.text)
									ls_base_setear			= w_validar_promesa_operaciones.dw_base.getitemstring(1,'base')
									ls_serie_setear			= trim(w_validar_promesa_operaciones.ddlb_serie.text)
									ll_numero_setear		= Double(w_validar_promesa_operaciones.em_numero.text)
									w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'rut',ll_rut_setear)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'dv',ls_dv_setear)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'base',ls_base_setear)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'serie',ls_serie_setear)
									w_validar_promesa_operaciones.dw_revision.setitem(1,'numero',ll_numero_setear)
									if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
								end if
								if isvalid(w_validar_promesa_operaciones) then w_validar_promesa_operaciones.setfocus()
								close(w_cd_asignar_agente)
							end if
						else
							rollback;
						end if
					else
						rollback;
						messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
					end if
				else
					ll_cd_funcion			= f_cd_folio_funeraria(is_base,is_serie,il_numero,ldt_fecha,ll_ult_estado,ldt_fecha,ls_age,ls_sup,ls_jefe,ll_cod_parque)
					if ll_cd_funcion = 1 then
						messagebox("Grabar","Grabación Exitosa")
						is_depto_age=''
						is_depto_sup=''
						is_depto_jef=''
						if isvalid(w_cd_asignar_agente) then 
							if (is_base = 'F' or is_base='G' or is_base = 'V') and isvalid(w_validar_promesa_operaciones) then
								ll_rut_setear			= Long(w_validar_promesa_operaciones.em_rut.text)
								ls_dv_setear			= trim(w_validar_promesa_operaciones.em_dv.text)
								ls_base_setear			= w_validar_promesa_operaciones.dw_base.getitemstring(1,'base')
								ls_serie_setear			= trim(w_validar_promesa_operaciones.ddlb_serie.text)
								ll_numero_setear		= Double(w_validar_promesa_operaciones.em_numero.text)
								w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'rut',ll_rut_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'dv',ls_dv_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'base',ls_base_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'serie',ls_serie_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'numero',ll_numero_setear)
								if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
							end if
							if isvalid(w_validar_promesa_operaciones) then w_validar_promesa_operaciones.setfocus()
							close(w_cd_asignar_agente)
						end if
					end if
				end if
			
			elseif is_opcion='G' and isvalid(w_cd_gestion_folio) Then // Grupal
				ls_age						= dw_asignar.getitemstring(1,'cod_agente')
				ls_sup						= dw_asignar.getitemstring(1,'cod_supervisor')
				ls_jefe						= dw_asignar.getitemstring(1,'cod_jefe_venta')
				if ( gs_depto='V' or gs_depto='O' or gs_depto='I' or gs_depto='H' or gs_depto='E' or gs_depto='X' or (not isnull(ls_age) and (gs_depto='R' or gs_depto='B' or gs_depto='X') ) ) and not isnull(ls_sup) and not isnull(ls_jefe) then
					ll_tot_reg				= w_cd_gestion_folio.dw_lista.rowcount()
					for ll_indi=1 to ll_tot_reg
						ls_estado_reg		= w_cd_gestion_folio.dw_lista.getitemstring(ll_indi,'estado_reg')
						ll_estado				= w_cd_gestion_folio.dw_lista.getitemNumber(ll_indi,'ult_estado')
						if (ls_estado_reg='I' and ll_estado=1) or (ls_estado_reg='I' and ll_estado=19) or &
							(ls_estado_reg='I' and ll_estado=20) or (ls_estado_reg='I' and ll_estado=32) or &
							(ls_estado_reg='I' and ll_estado=2) or (ls_estado_reg='I' and ll_estado=35) then
							
							ll_sw_pasa ++
							ls_base			= w_cd_gestion_folio.dw_lista.getitemstring(ll_indi,'base')
							ls_serie			= w_cd_gestion_folio.dw_lista.getitemstring(ll_indi,'serie')
							ll_numero		= w_cd_gestion_folio.dw_lista.getitemnumber(ll_indi,'numero')
							ls_age_ant		= w_cd_gestion_folio.dw_lista.getitemstring(ll_indi,'cod_agente')
							ls_sup_ant		= w_cd_gestion_folio.dw_lista.getitemstring(ll_indi,'cod_supervisor')
							ls_jefe_ant		= w_cd_gestion_folio.dw_lista.getitemstring(ll_indi,'cod_jefe_venta')
							ll_cod_parque	= w_cd_gestion_folio.dw_lista.getitemnumber(ll_indi,'cod_parque')
							
							if ls_age='' or isnull(ls_age) then
								ls_glosa	= 'SE ASIGNA CONTRATO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' AL SUPERVISOR: '+ls_sup+'  '+ls_nom_com_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
							else
								ls_glosa	= 'SE ASIGNA CONTRATO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' AL AGENTE: '+ls_age+'  '+ls_nom_com_age+', SUPERVISOR: '+ls_sup+'  '+ls_nom_com_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
							end if
							if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ll_numero) then
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'cod_agente',ls_age)
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'cod_supervisor',ls_sup)
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'cod_jefe_venta',ls_jefe)
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa)
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'ult_memo','-')
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'ult_referencia_memo','-')
								if gs_depto='V' or gs_depto='O' or gs_depto='H' or gs_depto='R' or gs_depto='X' then
//									if ll_ulimo_estado_cd=2 then
//										ll_ult_estado	= 3
//									else
										ll_ult_estado	= 2
//									end if
								elseif gs_depto='O' or gs_depto='E' then
									ll_ult_estado	= 21
								end if
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'ult_estado',ll_ult_estado)
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'ult_fecha_estado',ldt_fecha)
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'estado_reg','I')
								w_cd_gestion_folio.dw_lista.setitem(ll_indi,'cod_parque',ll_cod_parque)
								
								if ls_base<> 'F' and ls_base<>'G' and ls_base <> 'V' then
									INSERT INTO "CD_FOLIO_DETALLE"  
											(	"BASE",   	"SERIE",   	"NUMERO",   "FECHA_CREA",  "USUARIO_CREA",   "ESTADO",   		"FECHA_ESTADO",   "GLOSA",   	"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO" )  
									VALUES 
											( 	:ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha,   	:gs_user,   		:ll_ult_estado,	:ldt_fecha,   		:ls_glosa,	'-' ,		:ls_age	,		:ls_sup,				:ls_jefe,			'-')  
									USING		sqlca;
								else
									ll_cd_funcion			= f_cd_folio_funeraria(ls_base,ls_serie,ll_numero,ldt_fecha,ll_ult_estado,ldt_fecha,ls_age,ls_sup,ls_jefe,ll_cod_parque)
								end if
							end if
						end if
					next
					if ll_sw_pasa > 0 then
						if ls_base <> 'F' and ls_base<>'G' and ls_base <> 'V' then
							if w_cd_gestion_folio.dw_lista.update()=1 then
								commit using sqlca;
							else
								rollback;
								messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if	
						w_cd_gestion_folio.dw_lista.scrolltorow(1)
						messagebox("Grabar","Grabación Exitosa")
						is_depto_age=''
						is_depto_sup=''
						is_depto_jef=''
						if isvalid(w_cd_asignar_agente) then 
							if (is_base = 'F' or is_base='G' or is_base = 'V') and isvalid(w_validar_promesa_operaciones) then
								ll_rut_setear			= Long(w_validar_promesa_operaciones.em_rut.text)
								ls_dv_setear			= trim(w_validar_promesa_operaciones.em_dv.text)
								ls_base_setear			= w_validar_promesa_operaciones.dw_base.getitemstring(1,'base')
								ls_serie_setear			= trim(w_validar_promesa_operaciones.ddlb_serie.text)
								ll_numero_setear		= Double(w_validar_promesa_operaciones.em_numero.text)
								w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'rut',ll_rut_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'dv',ls_dv_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'base',ls_base_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'serie',ls_serie_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'numero',ll_numero_setear)
								if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
							end if
							if isvalid(w_validar_promesa_operaciones) then w_validar_promesa_operaciones.setfocus()
							close(w_cd_asignar_agente)
						end if
					end if
				end if
				
			elseif is_opcion='G' and isvalid(w_cd_gestion_asignacion_agente) Then // Grupal
				ls_age							= dw_asignar.getitemstring(1,'cod_agente')
				ls_sup							= dw_asignar.getitemstring(1,'cod_supervisor')
				ls_jefe							= dw_asignar.getitemstring(1,'cod_jefe_venta')
				if ( gs_depto='V' or gs_depto='O' or gs_depto='I' or gs_depto='H' or gs_depto='E' or gs_depto='X' or (not isnull(ls_age) and (gs_depto='R' or gs_depto='B' or gs_depto='X') ) ) and not isnull(ls_sup) and not isnull(ls_jefe) then
					ll_tot_reg					= w_cd_gestion_asignacion_agente.dw_lista.rowcount()
					for ll_indi=1 to ll_tot_reg
						ls_estado_reg			= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'estado_reg')
						ll_estado					= w_cd_gestion_asignacion_agente.dw_lista.getitemNumber(ll_indi,'ult_estado')
						if (ls_estado_reg='I' and ll_estado=1) or (ls_estado_reg='I' and ll_estado=19) or &
							(ls_estado_reg='I' and ll_estado=20) or (ls_estado_reg='I' and ll_estado=32) or &
							(ls_estado_reg='I' and ll_estado=2) or (ls_estado_reg='I' and ll_estado=35) then
						
							ll_sw_pasa ++
							ls_base				= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'base')
							ls_serie				= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'serie')
							ll_numero			= w_cd_gestion_asignacion_agente.dw_lista.getitemnumber(ll_indi,'numero')
							ls_age_ant			= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'cod_agente')
							ls_sup_ant			= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'cod_supervisor')
							ls_jefe_ant			= w_cd_gestion_asignacion_agente.dw_lista.getitemstring(ll_indi,'cod_jefe_venta')
							ll_cod_parque		= w_cd_gestion_asignacion_agente.dw_lista.getitemnumber(ll_indi,'cod_parque')
							
							if ls_age='' or isnull(ls_age) then
								ls_glosa	= 'SE ASIGNA CONTRATO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' AL SUPERVISOR: '+ls_sup+'  '+ls_nom_com_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
							else
								ls_glosa	= 'SE ASIGNA CONTRATO '+ls_base+'-'+ls_serie+'-'+string(ll_numero,"###,###,###,###")+' AL AGENTE: '+ls_age+'  '+ls_nom_com_age+', SUPERVISOR: '+ls_sup+'  '+ls_nom_com_sup+', JEFE VENTA: '+ls_jefe+'  '+ls_nom_com_jef+' EL DIA '+string(ldt_fecha,"dd/mm/yyyy")
							end if
							if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ll_numero) then
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'ult_usuario_gestion',gs_user)
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'cod_agente',ls_age)
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'cod_supervisor',ls_sup)
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'cod_jefe_venta',ls_jefe)
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'ult_glosa_estado',ls_glosa)
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'ult_memo','-')
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'ult_referencia_memo','-')
								if gs_depto='V' or gs_depto='O' or gs_depto='H' or gs_depto='R' or gs_depto='X' then
//									if ll_ulimo_estado_cd=2 then
//										ll_ult_estado	= 3
//									else
										ll_ult_estado	= 2
//									end if
								elseif gs_depto='O' or gs_depto='E' then
									ll_ult_estado	= 21
								end if
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'ult_estado',ll_ult_estado)
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'ult_fecha_estado',ldt_fecha)
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'estado_reg','I')
								w_cd_gestion_asignacion_agente.dw_lista.setitem(ll_indi,'cod_parque',ll_cod_parque)
								
								if ls_base <> 'F' and ls_base<>'G' and ls_base <> 'V' then
									INSERT INTO "CD_FOLIO_DETALLE"  
											(	"BASE",   	"SERIE",   	"NUMERO",   "FECHA_CREA",  "USUARIO_CREA",   "ESTADO",   		"FECHA_ESTADO",   "GLOSA",   	"MEMO",	"COD_AGENTE",	"COD_SUPERVISOR",	"COD_JEFE_VENTA",	"REFERENCIA_MEMO" )  
									VALUES 
											( 	:ls_base,	:ls_serie,	:ll_numero,	:ldt_fecha,   	:gs_user,   		:ll_ult_estado, 	:ldt_fecha,   		:ls_glosa,	'-' ,		:ls_age	,		:ls_sup,				:ls_jefe,			'-')  
									USING		sqlca;
								else
									ll_cd_funcion			= f_cd_folio_funeraria(ls_base,ls_serie,ll_numero,ldt_fecha,ll_ult_estado,ldt_fecha,ls_age,ls_sup,ls_jefe,ll_cod_parque)
								end if
							end if
						end if
					next
					if ll_sw_pasa > 0 then
						if ls_base <> 'F' and ls_base<>'G' and ls_base <> 'V' then
							if w_cd_gestion_asignacion_agente.dw_lista.update()=1 then
								commit using sqlca;
							else
								rollback;
								messagebox("Error","Error al Grabar SQL: "+sqlca.sqlerrtext)
							end if
						end if
						w_cd_gestion_asignacion_agente.dw_lista.scrolltorow(1)
						messagebox("Grabar","Grabación Exitosa")
						is_depto_age=''
						is_depto_sup=''
						is_depto_jef=''
						if isvalid(w_cd_asignar_agente) then
							if (is_base = 'F' or is_base='G' or is_base = 'V') and isvalid(w_validar_promesa_operaciones) then
								ll_rut_setear			= Long(w_validar_promesa_operaciones.em_rut.text)
								ls_dv_setear			= trim(w_validar_promesa_operaciones.em_dv.text)
								ls_base_setear			= w_validar_promesa_operaciones.dw_base.getitemstring(1,'base')
								ls_serie_setear			= trim(w_validar_promesa_operaciones.ddlb_serie.text)
								ll_numero_setear		= Double(w_validar_promesa_operaciones.em_numero.text)
								w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'rut',ll_rut_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'dv',ls_dv_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'base',ls_base_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'serie',ls_serie_setear)
								w_validar_promesa_operaciones.dw_revision.setitem(1,'numero',ll_numero_setear)
								if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
							end if
							if isvalid(w_validar_promesa_operaciones) then w_validar_promesa_operaciones.setfocus()
							close(w_cd_asignar_agente)
						end if
					end if
				end if
			end if
		else
			if (isnull(ls_age) or ls_age='') and (gs_depto='R' or gs_depto='B') then
				messagebox("Advertencia","Agente Inválido")
				dw_asignar.setfocus()
				dw_asignar.setcolumn('cod_agente')
			elseif isnull(ls_sup) or ls_sup='' then
				messagebox("Advertencia","Supervisor Inválido")
				dw_asignar.setfocus()
				dw_asignar.setcolumn('cod_supervisor')
			elseif isnull(ls_jefe) or ls_jefe='' then
				messagebox("Advertencia","Jefe Venta Inválido")
				dw_asignar.setfocus()
				dw_asignar.setcolumn('cod_jefe_venta')
			end if
		end if
	else
		if ll_res <> 1 then
			if (gs_depto='V' or gs_depto='H') and (is_depto_age<>'K' and  is_depto_age<>'K') then
				messagebox("Advertencia","Agente NO Corresponde a la Unidad de Ventas")
			elseif (gs_depto='V' or gs_depto='H') and is_depto_sup<>'R' then
				messagebox("Advertencia","Supervisor NO Corresponde a la Unidad de Ventas")
			elseif (gs_depto='V' or gs_depto='H') and is_depto_jef<>'B' then
				messagebox("Advertencia","Jefe Venta NO Corresponde a la Unidad en Ventas")
			elseif (gs_depto='O' or gs_depto='E') and is_depto_age<>'E' then
				messagebox("Advertencia","Ejecutivo NO Corresponde al Depto. Atención Terreno")
			elseif (gs_depto='O' or gs_depto='E') and is_depto_sup<>'E' then
				messagebox("Advertencia","Supervisor NO Corresponde al Depto. Atención Terreno")
			elseif (gs_depto='O' or gs_depto='E') and is_depto_jef<>'E' then
				messagebox("Advertencia","Jefe Venta NO Corresponde al Depto. Atención Terreno")
			elseif gs_depto='X' and is_depto_age<>'X' then
				messagebox("Advertencia","Ejecutivo NO Corresponde a la Unidad Generadora de Negocios")
			elseif gs_depto='X' and is_depto_sup<>'X' then
				messagebox("Advertencia","Supervisor NO Corresponde a la Unidad Generadora de Negocios")
			elseif gs_depto='X' and is_depto_jef<>'X' then
				messagebox("Advertencia","Jefe Venta NO Corresponde a la Unidad Generadora de Negocios")	
			end if
		end if
		dw_asignar.setfocus()
	end if
else
	messagebox("Advertencia","No Registra Cambios para Actualizar")
	dw_asignar.setfocus()
end if
end event

type cb_1 from commandbutton within w_cd_asignar_agente
integer x = 1609
integer y = 764
integer width = 357
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;if gs_depto='O' and gl_proceso=4 then
	SELECT	"DEPTO"  
   	INTO 		:gs_depto  
    	FROM 	"ENCARGADOS"  
   	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user
	USING	sqlca;
end if

if (is_base = 'F' or is_base='G' or is_base = 'V') and isvalid(w_validar_promesa_operaciones) then
	w_validar_promesa_operaciones.cb_limpiar.triggerevent(clicked!)
end if
if isvalid(w_cd_gestion_asignacion_agente) then close(w_cd_gestion_asignacion_agente)
close(w_cd_asignar_agente)
end event

type dw_asignar from datawindow within w_cd_asignar_agente
integer x = 41
integer y = 32
integer width = 1970
integer height = 680
integer taborder = 10
string title = "none"
string dataobject = "dw_asignar_agente_cd"
boolean border = false
boolean livescroll = true
end type

event clicked;String		ls_opcion,ls_columna,ls_age,ls_sup

ls_columna	= dwo.name
if ls_columna='p_1' or ls_columna='p_2' or ls_columna='p_3' then
	il_sw_pasa++
	ls_age	= this.getitemstring(1,'cod_agente')
	ls_sup	= this.getitemstring(1,'cod_supervisor')
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ls_opcion	= 'A'
		CASE 'p_2'
			ls_opcion	= 'S'
		CASE 'p_3'
			ls_opcion	= 'J'
	END CHOOSE
	if ls_columna='p_1' then 
		if isvalid(w_lista_codigos) then close(w_lista_codigos)
		openwithparm(w_lista_codigos,ls_opcion)
	elseif ls_columna='p_2' and not isnull(ls_age) and ls_age<>'' then	
		if isvalid(w_lista_codigos) then close(w_lista_codigos)
		openwithparm(w_lista_codigos,ls_opcion)
	elseif ls_columna='p_3' and not isnull(ls_age) and ls_age<>'' and not isnull(ls_sup) and ls_sup<>'' then	
		if isvalid(w_lista_codigos) then close(w_lista_codigos)
		openwithparm(w_lista_codigos,ls_opcion)
	end if
end if
end event

event itemchanged;String	ls_age, ls_sup, ls_jefe,ls_columna,ls_estado,ls_sup_aux,ls_jefe_aux,ls_pasa,ls_nulo

setnull(ls_nulo)
ls_pasa					= 'S'
ls_columna				= dwo.name
this.accepttext()
CHOOSE CASE ls_columna
	CASE 'cod_agente'
		il_sw_pasa++
		ls_age			= dw_asignar.getitemstring(1,'cod_agente')
		SELECT	"AGENTES"."DEPTO"  
		INTO		:is_depto_age  
		FROM		"AGENTES"  
		WHERE	"AGENTES"."COD_AGE" = :ls_age
		USING	sqlca;
		if gs_depto='E' then		//or gs_depto='O' 
			if is_depto_age<>'E' and is_depto_age<>'O' then
				if is_depto_age='E' then
					messagebox("Advertencia","Agente No Pertenece Unidad en Terreno")
				elseif is_depto_age='O' then
					messagebox("Advertencia","Agente No Pertenece Unidad Cobranza Telefónica")
				end if
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if
		elseif gs_depto='V' or gs_depto='H' then
			if is_depto_age<>'K' and is_depto_age<>'M' and is_depto_age<>'X' and is_depto_age<>'H' then
				messagebox("Advertencia","Agente No Pertenece Unidad de Ventas")
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if
		elseif gs_depto='X' then
			if is_depto_age<>'X' and is_depto_age<>'K' then
				messagebox("Advertencia","Agente No Pertenece Unidad Generadora de Negocios")
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if
		end if
		if ls_pasa='S' then
			is_pasa	= ls_pasa
			ls_sup	= dw_asignar.getitemstring(1,'cod_supervisor')
			ls_jefe	= dw_asignar.getitemstring(1,'cod_jefe_venta')
			if not isnull(ls_age) and ls_age<>'' then
				SELECT	"AGENTES"."ESTADO",   
							"AGENTES"."COD_SUP",   
							"SUPERVISOR"."COD_JEFE"  
				INTO 		:ls_estado,   
							:ls_sup_aux,   
							:ls_jefe_aux
				FROM 		"AGENTES",   
							"SUPERVISOR"  
				WHERE  ( "SUPERVISOR"."COD_SUP" = "AGENTES"."COD_SUP" ) and  
						 ( "AGENTES"."COD_AGE" = :ls_age )  
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","No Existe Agente "+ls_age)
					dw_asignar.reset()
					if is_opcion='I' then
						dw_asignar.retrieve(is_base,is_serie,il_numero)
						dw_asignar.object.t_titulo.text	= 'Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero)
					elseif is_opcion='G' then
						if isvalid(w_cd_gestion_folio) then
							dw_asignar.insertrow(0)
							dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_folio.em_numero_fin.text)
						elseif isvalid(w_cd_gestion_asignacion_agente) then
							dw_asignar.insertrow(0)
							dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_asignacion_agente.em_numero_fin.text)
						end if
					end if
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_agente')
				else
					if ls_estado='A' then
						if not isnull(ls_sup) and ls_sup<>"" and ls_sup<>'' then
							dw_asignar.setitem(1,'cod_supervisor',ls_sup)
						else
							dw_asignar.setitem(1,'cod_supervisor',ls_sup_aux)
						end if
						if not isnull(ls_jefe) and ls_jefe<>"" and ls_jefe<>'' then
							dw_asignar.setitem(1,'cod_jefe_venta',ls_jefe)
						else
							dw_asignar.setitem(1,'cod_jefe_venta',ls_jefe_aux)
						end if
					elseif ls_estado='I' then
						dw_asignar.reset()
						if is_opcion='I' then
							dw_asignar.retrieve(is_base,is_serie,il_numero)
							dw_asignar.object.t_titulo.text	= 'Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero)
						elseif is_opcion='G' then
							if isvalid(w_cd_gestion_folio) then
								dw_asignar.insertrow(0)
								dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_folio.em_numero_fin.text)
							elseif isvalid(w_cd_gestion_asignacion_agente) then
								dw_asignar.insertrow(0)
								dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_asignacion_agente.em_numero_fin.text)
							end if
						end if
						messagebox("Advertencia","Agente "+ls_age+" Inactivo")
						dw_asignar.setfocus()
						dw_asignar.setcolumn('cod_agente')
					end if
					dw_asignar.accepttext()
				end if
			end if
		end if

	CASE 'cod_supervisor'
		il_sw_pasa++
		ls_age				= dw_asignar.getitemstring(1,'cod_agente')
		ls_sup				= dw_asignar.getitemstring(1,'cod_supervisor')
		SELECT	"AGENTES"."DEPTO"  
		INTO		:is_depto_age  
		FROM		"AGENTES"  
		WHERE	"AGENTES"."COD_AGE" = :ls_age
		USING	sqlca;
		SELECT	"SUPERVISOR"."DEPTO"  
		INTO		:is_depto_sup  
		FROM		"SUPERVISOR"  
		WHERE	"SUPERVISOR"."COD_SUP" = :ls_sup
		USING	sqlca;
		if gs_depto='E' then		//or gs_depto='O'
			if (is_depto_age<>'E' or is_depto_sup<>'E') and (is_depto_age<>'O' or is_depto_sup<>'O') then
				if is_depto_age='E' then
					messagebox("Advertencia","Supervisor No Pertenece Unidad en Terreno")
				elseif is_depto_age='O' then
					messagebox("Advertencia","Supervisor No Pertenece Unidad Cobranza Telefónica")
				end if
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if
		elseif gs_depto='V' or gs_depto='H' then
			if is_depto_sup<>'R' and is_depto_sup<>'X' and is_depto_sup<>'H' then
				messagebox("Advertencia","Supervisor No Pertenece Unidad de Ventas")
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if
		elseif gs_depto='X' then
			if is_depto_sup<>'X' and is_depto_sup<>'K' then
				messagebox("Advertencia","Supervisor No Pertenece Unidad Generadora de Negocios")
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if	
		end if
		if ls_pasa='S' then
			is_pasa	= ls_pasa
			ls_jefe	= dw_asignar.getitemstring(1,'cod_jefe_venta')
			if not isnull(ls_sup) and ls_sup<>'' then
				SELECT 	"SUPERVISOR"."ESTADO",
							"SUPERVISOR"."COD_JEFE"
				INTO 		:ls_estado,
							:ls_jefe_aux
				FROM 		"SUPERVISOR"  
				WHERE 	"SUPERVISOR"."COD_SUP" = :ls_sup   
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","No Existe Supervisor "+ls_sup)
					dw_asignar.reset()
					if is_opcion='I' then
						dw_asignar.retrieve(is_base,is_serie,il_numero)
						dw_asignar.object.t_titulo.text	= 'Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero)
					elseif is_opcion='G' then
						if isvalid(w_cd_gestion_folio) then
							dw_asignar.insertrow(0)
							dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_folio.em_numero_fin.text)
						elseif isvalid(w_cd_gestion_asignacion_agente) then
							dw_asignar.insertrow(0)
							dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_asignacion_agente.em_numero_fin.text)
						end if
					end if
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_supervisor')
				else
					if ls_estado='A' then
						if not isnull(ls_jefe) and ls_jefe<>"" and ls_jefe<>'' then
							dw_asignar.setitem(1,'cod_jefe_venta',ls_jefe)
						else
							dw_asignar.setitem(1,'cod_jefe_venta',ls_jefe_aux)
						end if
					elseif ls_estado='I' then
						dw_asignar.reset()
						if is_opcion='I' then
							dw_asignar.retrieve(is_base,is_serie,il_numero)
							dw_asignar.object.t_titulo.text	= 'Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero)
						elseif is_opcion='G' then
							if isvalid(w_cd_gestion_folio) then
								dw_asignar.insertrow(0)
								dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_folio.em_numero_fin.text)
							elseif isvalid(w_cd_gestion_asignacion_agente) then
								dw_asignar.insertrow(0)
								dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_asignacion_agente.em_numero_fin.text)
							end if
						end if
						messagebox("Advertencia","Supervisor "+ls_sup+" Inactivo")
						dw_asignar.setfocus()
						dw_asignar.setcolumn('cod_supervisor')
					end if
					dw_asignar.accepttext()
				end if
			end if
		end if
		
	CASE 'cod_jefe_venta'
		il_sw_pasa++
		ls_age	= dw_asignar.getitemstring(1,'cod_agente')
		ls_sup	= dw_asignar.getitemstring(1,'cod_supervisor')
		ls_jefe	= dw_asignar.getitemstring(1,'cod_jefe_venta')
		SELECT	"AGENTES"."DEPTO"  
		INTO		:is_depto_age  
		FROM		"AGENTES"  
		WHERE	"AGENTES"."COD_AGE" = :ls_age
		USING	sqlca;
		SELECT	"SUPERVISOR"."DEPTO"  
		INTO		:is_depto_sup  
		FROM		"SUPERVISOR"  
		WHERE	"SUPERVISOR"."COD_SUP" = :ls_sup
		USING	sqlca;
		SELECT	"JEFE_VENTAS"."DEPTO"  
		INTO		:is_depto_jef  
		FROM		"JEFE_VENTAS"  
		WHERE	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe
		USING	sqlca;
		
		if gs_depto='E' then		//or gs_depto='O'
			if (is_depto_age<>'E' or is_depto_sup<>'E' or is_depto_jef<>'E') and (is_depto_age<>'O' or is_depto_sup<>'O' or is_depto_jef<>'O') then
				if is_depto_age='E' then
					messagebox("Advertencia","Jefe No Pertenece Unidad en Terreno")
				elseif is_depto_age='O' then
					messagebox("Advertencia","Jefe No Pertenece Unidad Cobranza Telefónica")
				end if
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if
		elseif gs_depto='V' or gs_depto='H' then
			if is_depto_jef<>'B' and is_depto_jef<>'X' and is_depto_jef<>'H' then
				messagebox("Advertencia","Jefe No Pertenece Unidad de Ventas")
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if
		elseif gs_depto='X' then
			if is_depto_jef<>'X' and is_depto_jef<>'K' then
				messagebox("Advertencia","Jefe No Pertenece Unidad Generadora de Negocios")
				ls_pasa		= 'N'
				is_pasa		= ls_pasa
			end if	
		end if
		if ls_pasa='S' then
			is_pasa= ls_pasa
			if not isnull(ls_jefe) and ls_jefe<>'' then
				SELECT	"JEFE_VENTAS"."ESTADO"  
				INTO 		:ls_estado  
				FROM 		"JEFE_VENTAS"  
				WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :ls_jefe   
				USING		sqlca;
				if sqlca.sqlcode<>0 then
					messagebox("Advertencia","No Existe Jefe Venta "+ls_jefe)
					dw_asignar.reset()
					if is_opcion='I' then
						dw_asignar.retrieve(is_base,is_serie,il_numero)
						dw_asignar.object.t_titulo.text	= 'Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero)
					elseif is_opcion='G' then
						if isvalid(w_cd_gestion_folio) then
							dw_asignar.insertrow(0)
							dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_folio.em_numero_fin.text)
						elseif isvalid(w_cd_gestion_asignacion_agente) then
							dw_asignar.insertrow(0)
							dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_asignacion_agente.em_numero_fin.text)
						end if
					end if
					dw_asignar.setfocus()
					dw_asignar.setcolumn('cod_jefe_venta')
				else
					if ls_estado='A' then
						dw_asignar.accepttext()
					elseif ls_estado='I' then
						dw_asignar.reset()
						if is_opcion='I' then
							dw_asignar.retrieve(is_base,is_serie,il_numero)
							dw_asignar.object.t_titulo.text	= 'Contrato Nº '+is_base+'-'+is_serie+'-'+string(il_numero)
						elseif is_opcion='G' then
							if isvalid(w_cd_gestion_folio) then
								dw_asignar.insertrow(0)
								dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_folio.em_numero_fin.text)
							elseif isvalid(w_cd_gestion_asignacion_agente) then
								dw_asignar.insertrow(0)
								dw_asignar.object.t_titulo.text	= 'Rango Contrato desde '+string(il_numero)+' hasta '+string(w_cd_gestion_asignacion_agente.em_numero_fin.text)
							end if
						end if
						messagebox("Advertencia","Jefe Venta "+ls_jefe+" Inactivo")
						dw_asignar.setfocus()
						dw_asignar.setcolumn('cod_jefe_venta')
					end if
				end if
			end if
		end if
END CHOOSE
end event

event itemfocuschanged;string	ls_nulo
setnull(ls_nulo)
if is_pasa='N' then
	dw_asignar.setitem(1,'cod_agente',ls_nulo)
	dw_asignar.setfocus()
	dw_asignar.setcolumn('cod_agente')
	dw_asignar.accepttext()
end if
end event

