forward
global type w_imprimir_cartas from window
end type
type cb_print from commandbutton within w_imprimir_cartas
end type
type dw_print_carta from datawindow within w_imprimir_cartas
end type
type cb_guardar from commandbutton within w_imprimir_cartas
end type
type cb_cerrar from commandbutton within w_imprimir_cartas
end type
type dw_visual from datawindow within w_imprimir_cartas
end type
end forward

global type w_imprimir_cartas from window
integer width = 3625
integer height = 2868
boolean titlebar = true
string title = "Impresion de Cartas"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_print cb_print
dw_print_carta dw_print_carta
cb_guardar cb_guardar
cb_cerrar cb_cerrar
dw_visual dw_visual
end type
global w_imprimir_cartas w_imprimir_cartas

type variables
String		is_tipo
Long		il_folio,il_rut	,il_mod
end variables

forward prototypes
public function string wf_valida_largo (long al_largo, string as_columna)
public function string wf_validar_letras (string as_letras, string as_columna)
end prototypes

public function string wf_valida_largo (long al_largo, string as_columna);string ls_fono,ls_nulo,ls_pasa='S'

Setnull(ls_nulo)
//if il_sw > 0 then
if dw_visual.dataobject = 'dw_fc_servico_adquirido' then
	ls_fono			= dw_visual.getitemstring(1,'fono')
	if al_largo > 9 and as_columna='fono' then
		//messagebox('Advertencia','No puede Ingresar más de 9 Digitos en Telefono, Ingrese solo números',stopsign!)
//		dw_visual.setitem(1,'fono','')
//		dw_visual.setfocus()
//		dw_visual.setcolumn('fono')
		ls_pasa	= 'N'
//		il_sw		= 0
	elseif	al_largo < 9 and as_columna='fono' then
		//messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Telefono, Ingrese solo números',stopsign!)
//		dw_visual.setitem(1,'fono','')
//		dw_visual.setfocus()
//		dw_visual.setcolumn('fono')
		ls_pasa	= 'N'
//		il_sw		= 0
	end if	
	dw_visual.accepttext()
end if
return ls_pasa
end function

public function string wf_validar_letras (string as_letras, string as_columna);string ls_pasa='S',ls_nulo

Setnull(ls_nulo)
if dw_visual.dataobject='dw_fc_servico_adquirido' then
	if Match(as_letras, "[A-Z]+") and as_columna='fono' then
	//	messagebox('Advertencia','Solo debe Ingresar Números en Telefono Contacto',stopsign!)
//		dw_visual.setitem(1,'fono','')
		ls_pasa	= 'N'
	end if
	dw_visual.accepttext()
end if
return ls_pasa
end function

on w_imprimir_cartas.create
this.cb_print=create cb_print
this.dw_print_carta=create dw_print_carta
this.cb_guardar=create cb_guardar
this.cb_cerrar=create cb_cerrar
this.dw_visual=create dw_visual
this.Control[]={this.cb_print,&
this.dw_print_carta,&
this.cb_guardar,&
this.cb_cerrar,&
this.dw_visual}
end on

on w_imprimir_cartas.destroy
destroy(this.cb_print)
destroy(this.dw_print_carta)
destroy(this.cb_guardar)
destroy(this.cb_cerrar)
destroy(this.dw_visual)
end on

event open;STRING 	ls_nombres_fallecido,ls_apellido_paterno_fallecido,ls_apellido_materno_fallecido,ls_dv_fallecido,ls_nombres_prelacion,ls_apellido_paterno_prelacion,ls_apellido_materno_prelacion,ls_nombres_responsables,&
		   	ls_apellido_paterno_responsable,ls_apellido_materno_responsable,ls_hora_retiro_cenizas,ls_tipo_servicio,ls_minuto_retiro_cenizas,ls_nombre_titular,ls_apellido_paterno_titular,ls_apellido_materno_titular,&
		   	ls_dv_titular,ls_codigo_otro,ls_dv_prelacion,ls_nombre_prelacion,ls_direccion_prelacion,ls_numero_prelacion,ls_comuna,ls_ciudad,ls_estado_civil,ls_parentesco,ls_sexo,ls_causa_fallecimiento,ls_enfermedad_obligatoria,&
		   	ls_minuto_cineracion,ls_hora_cineracion,ls_nombre_fallecido,ls_direccion_fallecido,ls_numero_fallecido,ls_origen_cuerpo,ls_cod_parque_a_nombre,ls_cod_parque_a_ciudad,ls_cod_parque_b_nombre,ls_cod_parque_b_ciudad,&
		   	ls_codigo_parque,ls_cod_parque_nombre,ls_cod_parque_comuna,ls_cod_parque_ciudad,ls_cod_parque_direccion,ls_cod_parque_ori_nombre,ls_cod_parque_ori_direccion,ls_cod_parque_ori_comuna,ls_cod_parque_ori_ciudad,ls_cod_parque_des_nombre,ls_cod_parque_des_direccion,&
		   	ls_cod_parque_des_comuna,ls_cod_parque_des_ciudad,ls_visualizar,ls_visualiza_Servicio,ls_nulo,ls_edad_fallecido,ls_hora_ingreso_cinerario,ls_minuto_ingreso_cinerario,ls_dv_responsable,ls_base,&
			ls_serie,ls_estado_civil_prelacion

LONG	   	ll_rut_fallecido,ll_folio_crematorio,ll_rut_titular,ll_rut_prelacion,ll_origen_cuerpo,ll_codigo_parque,ll_cod_parque_a_nombre,ll_cod_parque_a_ciudad,ll_cod_parque_b_nombre,ll_cod_parque_b_ciudad,ll_hora_retiro_cenizas,ll_minuto_retiro_cenizas,ll_new,ll_destino_cenizasm,ll_rut_responsable,ll_destino_cenizas,&
			ll_nacionalidad,ll_destino_cuerpo,ll_cod_parque_nombre,ll_cod_parque_comuna,ll_cod_parque_ciudad,ll_cod_parque_direccion,ll_cod_parque_ori_nombre,ll_cod_parque_ori_direccion,ll_cod_parque_ori_comuna,ll_cod_parque_ori_ciudad,ll_cod_parque_des_nombre,ll_cod_parque_des_direccion,ll_cod_parque_des_comuna,&
			ll_cod_parque_des_ciudad,ll_codigo_religion
Double	ll_numero
DATE	   	ld_fecha_cineracion,ld_fecha_retiro_cenizas,ld_fecha_defuncion,ld_fecha_nacimiento_fallecido,ld_fecha_ingreso_cinerario
il_mod 		= 0
is_tipo		= substr(1,1, Message.StringParm)
il_folio		= Long(substr(1,2, Message.StringParm))
il_rut			= Long(substr(1,3, Message.StringParm))
Setnull(ls_nulo)

CHOOSE CASE is_tipo
	CASE 'servicio_cremacion'
		dw_visual.dataobject			= 'fc_carta_servicio_cremacion'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'Resumen Servicio Cremacion'
		if dw_visual.retrieve(il_folio) = 0 then
		  SELECT "FC_TITULAR"."NOMBRES",   
					"FC_TITULAR"."APELLIDO_PATERNO",   
					"FC_TITULAR"."APELLIDO_MATERNO",   
					"FC_TITULAR"."RUT_TITULAR",   
					"FC_TITULAR"."DV_TITULAR",
					"FC_ARANCEL"."CODIGO_OTRO",   
					"FC_FALLECIDO"."NOMBRES",   
					"FC_FALLECIDO"."APELLIDO_PATERNO",   
					"FC_FALLECIDO"."APELLIDO_MATERNO",   
					"FC_FALLECIDO"."RUT_FALLECIDO",   
					"FC_FALLECIDO"."DV_FALLECIDO",   
					"FC_FALLECIDO"."FECHA_NACIMIENTO",   
					"FC_FALLECIDO"."FECHA_DEFUNCION",   
					"FC_FALLECIDO"."EDAD_NUMERO",
					"FC_CEREMONIA"."CODIGO_RELIGION"
		  INTO	:ls_nombre_titular,
					:ls_apellido_paterno_titular,
					:ls_apellido_materno_titular,
					:ll_rut_titular,
					:ls_dv_titular,
					:ls_codigo_otro,
					:ls_nombres_fallecido,
					:ls_apellido_paterno_fallecido,
					:ls_apellido_materno_fallecido,
					:ll_rut_fallecido,
					:ls_dv_fallecido,
					:ld_fecha_nacimiento_fallecido,
					:ld_fecha_defuncion,
					:ls_edad_fallecido,
					:ll_codigo_religion
		 FROM 	"FC_ARANCEL",   
					"FC_CABECERA",   
					"FC_CEREMONIA",   
					"FC_FALLECIDO",   
					"FC_TITULAR"  
		WHERE 	( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_ARANCEL"."FOLIO_CREMATORIO" ) 	and  
					( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_CEREMONIA"."FOLIO_CREMATORIO" ) and  
					( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) 	and  
					( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_TITULAR"."FOLIO_CREMATORIO" ) 		and  
					( ( "FC_ARANCEL"."FOLIO_CREMATORIO" = :il_folio ) ) 
		USING	sqlca;
		if sqlca.sqlcode=0 then
			dw_visual.setitem(ll_new,'folio_crematorio', il_folio)
			dw_visual.setitem(ll_new,'nombres_contacto_cliente',ls_nombre_titular )
			dw_visual.setitem(ll_new,'apellido_paterno_cliente',ls_apellido_paterno_titular )
			dw_visual.setitem(ll_new,'apellido_materno_cliente',ls_apellido_materno_titular )
			dw_visual.setitem(ll_new,'rut_fallecido',ll_rut_titular )
			dw_visual.setitem(ll_new,'apellido_materno_fallecido',ls_dv_titular )
			dw_visual.setitem(ll_new,'servicio_contratado',ls_codigo_otro )
			dw_visual.setitem(ll_new,'nombre_fallecido',ls_nombres_fallecido )
			dw_visual.setitem(ll_new,'apellido_paterno_fallecido',ls_apellido_paterno_fallecido )
			dw_visual.setitem(ll_new,'apellido_materno_fallecido',ls_apellido_materno_fallecido )
			dw_visual.setitem(ll_new,'rut_fallecido',ll_rut_fallecido )
			dw_visual.setitem(ll_new,'dv_fallecido',ls_dv_fallecido )
			dw_visual.setitem(ll_new,'fecha_nacimiento',ld_fecha_nacimiento_fallecido )
			dw_visual.setitem(ll_new,'fecha_defuncion',ld_fecha_defuncion )
			dw_visual.setitem(ll_new,'edad',ls_edad_fallecido )
			dw_visual.setitem(ll_new,'religion',ll_codigo_religion)
			dw_visual.accepttext()
		else
			messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Titular / Fallecido / Arancel / Destino Cuerpo)")
			close(w_imprimir_cartas)
		end if
	end if
		
	CASE 'registro_fallecido'
		dw_visual.dataobject			= 'dw_registro_fallecido_cinerario'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'Registro Fallecido (Anexo)'
		if dw_visual.retrieve(il_folio) = 0 then
			SELECT  "FC_FALLECIDO"."NOMBRES",   
						"FC_FALLECIDO"."APELLIDO_PATERNO",   
						"FC_FALLECIDO"."APELLIDO_MATERNO",   
						"FC_FALLECIDO"."RUT_FALLECIDO",   
						"FC_FALLECIDO"."DV_FALLECIDO",   
						"FC_FALLECIDO"."SEXO",   
						"FC_FALLECIDO"."FECHA_DEFUNCION",   
						"FC_FALLECIDO"."CAUSA_FALLECIMIENTO",   
						"FC_FALLECIDO"."ENFERMEDAD_OBLIGATORIA",   
						"FC_CABECERA"."FECHA_CINERACION",   
						"FC_CABECERA"."HORA_CINERACION",   
						"FC_CABECERA"."MINUTO_CINERACION",   
						"FC_CABECERA"."FECHA_INGRESO_CINERARIO",  
						"FC_CABECERA"."HORA_INGRESO_CINERARIO",
						"FC_CABECERA"."FECHA_INGRESO_CINERARIO",
						"FC_RESPONSABLE_RETIRO"."FECHA_RETIRO_CENIZA",   
						"FC_RESPONSABLE_RETIRO"."HORA_RETIRO_CENIZA",   
						"FC_RESPONSABLE_RETIRO"."MINUTO_RETIRO_CENIZA",   
						"FC_RESPONSABLE_RETIRO"."VISUALIZAR_SERVICIO",   
						"FC_DESTINO_CUERPO"."CODIGO_DESTINO"
			INTO		:ls_nombres_fallecido,
						:ls_apellido_paterno_fallecido,
						:ls_apellido_materno_fallecido,
						:ll_rut_fallecido,
						:ls_dv_fallecido,
						:ls_sexo,
						:ld_fecha_defuncion,
						:ls_causa_fallecimiento,
						:ls_enfermedad_obligatoria,
						:ld_fecha_cineracion,
						:ls_hora_cineracion,
						:ls_minuto_cineracion,
						:ld_fecha_ingreso_cinerario,
						:ls_hora_ingreso_cinerario,
						:ls_minuto_ingreso_cinerario,
						:ld_fecha_retiro_cenizas,
						:ll_hora_retiro_cenizas,
						:ll_minuto_retiro_cenizas,
						:ls_visualiza_Servicio,
						:ll_destino_cenizas
			 FROM 	"FC_CABECERA",   
						"FC_FALLECIDO",   
						"FC_RESPONSABLE_RETIRO",   
						"FC_DESTINO_CUERPO"  
			WHERE	( "FC_DESTINO_CUERPO"."CODIGO_DESTINO" = "FC_CABECERA"."DESTINO_CUERPO" ) and  
						( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
						( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_RESPONSABLE_RETIRO"."FOLIO_CREMATORIO" ) and  
						( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) )    
			USING	sqlca;
			if sqlca.sqlcode=0 then
				ll_new		= dw_visual.insertrow(0)
				dw_visual.setitem(ll_new,'folio_crematorio', il_folio)
				dw_visual.setitem(ll_new,'nombres_fallecido',ls_nombres_fallecido )
				dw_visual.setitem(ll_new,'apellido_paterno_fallecido',ls_apellido_paterno_fallecido )
				dw_visual.setitem(ll_new,'apellido_materno_fallecido',ls_apellido_materno_fallecido )
				dw_visual.setitem(ll_new,'rut_fallecido',ll_rut_fallecido )
				dw_visual.setitem(ll_new,'dv_fallecido',ls_dv_fallecido )
				dw_visual.setitem(ll_new,'sexo_fallecido',ls_sexo )
				dw_visual.setitem(ll_new,'fecha_defuncion',ld_fecha_defuncion )
				dw_visual.setitem(ll_new,'causa_fallecimiento',ls_causa_fallecimiento )
				if isnull(ls_enfermedad_obligatoria) then
					dw_visual.setitem(ll_new,'enfermedad_obligatoria',ls_nulo )
				else
					dw_visual.setitem(ll_new,'enfermedad_obligatoria','S' )
				end if
				dw_visual.setitem(ll_new,'fecha_cineracion',ld_fecha_cineracion )
				dw_visual.setitem(ll_new,'hora_cineracion',ls_hora_cineracion )
				dw_visual.setitem(ll_new,'minuto_cineracion',ls_minuto_cineracion )
				
				dw_visual.setitem(ll_new,'fecha_ingreso_cinerario',ld_fecha_ingreso_cinerario )
				dw_visual.setitem(ll_new,'hora_ingreso_cinerario',ls_minuto_cineracion )
				dw_visual.setitem(ll_new,'minuto_ingreso_cinerario',ls_minuto_ingreso_cinerario )
				
				dw_visual.setitem(ll_new,'fecha_cineracion',ld_fecha_retiro_cenizas )
				dw_visual.setitem(ll_new,'hora_cineracion',ll_hora_retiro_cenizas )
				dw_visual.setitem(ll_new,'minuto_cineracion',ll_minuto_retiro_cenizas )
				dw_visual.setitem(ll_new,'sw_visualiza_servicio',ls_visualiza_Servicio )
				dw_visual.setitem(ll_new,'retiro_cenizas',ll_destino_cenizas )
				dw_visual.setitem(ll_new,'minuto_entrega_cenizas',ls_minuto_retiro_cenizas)
				dw_visual.setitem(ll_new,'sw_tiene_implante','N')
				dw_visual.setitem(ll_new,'sw_extraccion','N')
				dw_visual.accepttext()
			else
				messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Ficha / Fallecido / Responsable Retiro-Destino Cuerpo)")
				close(w_imprimir_cartas)
			end if
		end if

	CASE 'jurada_notarial'
		dw_visual.dataobject	= 'dw_jurada_notarial'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'Declaracion Jurada Notarial'
		if dw_visual.retrieve(il_folio) = 0 then
			  SELECT "FC_PRELACION"."NOMBRES",   
						"FC_PRELACION"."APELLIDO_PATERNO",   
						"FC_PRELACION"."APELLIDO_MATERNO",   
						"FC_PRELACION"."RUT",   
						"FC_PRELACION"."DV",   
						"FC_PRELACION"."DIRECCION",   
						"FC_PRELACION"."NUMERO_DIREC",   
						"FC_FALLECIDO"."NOMBRES",   
						"FC_FALLECIDO"."APELLIDO_PATERNO",   
						"FC_FALLECIDO"."APELLIDO_MATERNO",   
						"FC_FALLECIDO"."RUT_FALLECIDO",   
						"FC_FALLECIDO"."DV_FALLECIDO",   
						"FC_FALLECIDO"."FECHA_DEFUNCION",   
						"COMUNA"."CODIGO_COMUNA",   
						"CIUDAD"."CODIGO_CIUDAD",   
						"CODIGO_ESTADO_CIVIL"."CODIGO_ESTADO",   
						"CODIGO_NACIONALIDAD"."CODIGO",   
						"COD_PARQ_A"."CODIGO",     	//nombre
						"COD_PARQ_A"."CODIGO",   	// ciudad
						"FC_ORIGEN_CUERPO"."CODIGO_ORIGEN_CUERPO",   
						"PARENTESCO"."CODIGO",   
						"COD_PARQ_B"."CODIGO",   	//nombre
						"COD_PARQ_B"."CODIGO",		//ciudad
						"FC_PRELACION"."ESTADO_CIVIL"
				INTO  :ls_nombres_prelacion,
						:ls_apellido_paterno_prelacion,
						:ls_apellido_materno_prelacion,
						:ll_rut_prelacion,
						:ls_dv_prelacion,
						:ls_direccion_prelacion,
						:ls_numero_prelacion,
						:ls_nombres_fallecido,
						:ls_apellido_paterno_fallecido,
						:ls_apellido_materno_fallecido,
						:ll_rut_fallecido,
						:ls_dv_fallecido,
						:ld_fecha_defuncion,
						:ls_comuna,
						:ls_ciudad,
						:ls_estado_civil,
						:ll_nacionalidad,
						:ll_cod_parque_a_nombre,
						:ll_cod_parque_a_ciudad,
						:ll_origen_cuerpo,
						:ls_parentesco,
						:ll_cod_parque_b_nombre,
						:ll_cod_parque_b_ciudad,
						:ls_estado_civil_prelacion
				FROM "FC_CABECERA",   
						"FC_FALLECIDO",   
						"FC_PRELACION",   
						"PARENTESCO",  
						"COMUNA",   
						"CIUDAD",   
						"CODIGO_ESTADO_CIVIL",   
						"CODIGO_NACIONALIDAD",   
						"COD_PARQ" "COD_PARQ_A",   
						"FC_ORIGEN_CUERPO",   
						"COD_PARQ" "COD_PARQ_B"  
			WHERE ( "FC_PRELACION"."FOLIO_CREMATORIO" = "FC_CABECERA"."FOLIO_CREMATORIO" ) and  
						( "COMUNA"."CODIGO_COMUNA" = "FC_PRELACION"."COMUNA" ) and  
						( "CIUDAD"."CODIGO_CIUDAD" = "FC_PRELACION"."CIUDAD" ) and  
						( "FC_FALLECIDO"."RUT_FALLECIDO" = "FC_CABECERA"."RUT_FALLECIDO" ) and  
						( "CODIGO_ESTADO_CIVIL"."CODIGO_ESTADO" = "FC_FALLECIDO"."ESTADO_CIVIL" ) and  
						( "CODIGO_NACIONALIDAD"."CODIGO" = "FC_PRELACION"."NACIONALIDAD" ) and  
						( "FC_ORIGEN_CUERPO"."CODIGO_ORIGEN_CUERPO" = "FC_FALLECIDO"."CODIGO_ORIGEN_CUERPO" ) and  
						( "PARENTESCO"."COD_PARQUE" = "FC_FALLECIDO"."COD_PARQUE" ) and  
						( "PARENTESCO"."CODIGO" = "FC_PRELACION"."PARENTESCO" ) and  
						( "CODIGO_ESTADO_CIVIL"."CODIGO_ESTADO" = "FC_FALLECIDO"."ESTADO_CIVIL" ) and  
						( "COD_PARQ_A"."CODIGO" = "FC_FALLECIDO"."COD_PARQUE" ) and  
						( "COD_PARQ_B"."CODIGO" = "FC_CABECERA"."COD_PARQUE_DESTINO" ) and  
						( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) AND  
						( "FC_CABECERA"."ESTADO_REG" <> 'A' ) )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				ll_new		= dw_visual.insertrow(0)
				dw_visual.setitem(ll_new,'nombres_prelacion',ls_nombres_prelacion )
				dw_visual.setitem(ll_new,'apellido_paterno_prelacion',ls_apellido_paterno_prelacion )
				dw_visual.setitem(ll_new,'apellido_materno_prelacion',ls_apellido_materno_prelacion )
				dw_visual.setitem(ll_new,'rut_prelacion',ll_rut_prelacion )
				dw_visual.setitem(ll_new,'dv_prelacion',ls_dv_prelacion )
				dw_visual.setitem(ll_new,'direccion_prelacion',ls_direccion_prelacion )
				dw_visual.setitem(ll_new,'numero_prelacion',ls_numero_prelacion )
				dw_visual.setitem(ll_new,'nombres_fallecido',ls_nombres_fallecido )
				dw_visual.setitem(ll_new,'apellido_paterno_fallecido',ls_apellido_paterno_fallecido )
				dw_visual.setitem(ll_new,'apellido_materno_fallecido',ls_apellido_materno_fallecido )
				dw_visual.setitem(ll_new,'rut_fallecido',ll_rut_fallecido )
				dw_visual.setitem(ll_new,'dv_fallecido',ls_dv_fallecido )
				dw_visual.setitem(ll_new,'fecha_defuncion',ld_fecha_defuncion )
				dw_visual.setitem(ll_new,'comuna_prelacion',ls_comuna )
				dw_visual.setitem(ll_new,'ciudad_prelacion',ls_ciudad )
				dw_visual.setitem(ll_new,'estado_civil_fallecido',ls_estado_civil )
				dw_visual.setitem(ll_new,'estado_civil_prelacion',ls_estado_civil_prelacion)
				dw_visual.setitem(ll_new,'nacionalidad_prelacion',ll_nacionalidad )
				dw_visual.setitem(ll_new,'cod_parque',ll_cod_parque_a_nombre )
				dw_visual.setitem(ll_new,'cod_parque_1',ll_cod_parque_a_ciudad )
				dw_visual.setitem(ll_new,'codigo_origen_cuerpo',ll_origen_cuerpo )
				dw_visual.setitem(ll_new,'parentesco_prelacion',ls_parentesco )
				dw_visual.setitem(ll_new,'cod_parque_2',ll_cod_parque_b_nombre )
				dw_visual.setitem(ll_new,'cod_parque_3',ll_cod_parque_b_ciudad )
				dw_visual.setitem(ll_new,'cod_parq_destino',142)
				dw_visual.accepttext()
			else
				messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Ficha / Fallecido-Origen Cuerpo / Prelación)")
				close(w_imprimir_cartas)
			end if
		end if

	CASE 'jurada_simple'
		dw_visual.dataobject	= 'dw_declaracion_jurada_simple'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'Declaracion Jurada Simple'
		if dw_visual.retrieve(il_folio,il_rut) = 0 then
			SELECT "FC_PRELACION"."NOMBRES",   
						"FC_PRELACION"."APELLIDO_PATERNO",   
						"FC_PRELACION"."APELLIDO_MATERNO",   
						"CODIGO_NACIONALIDAD"."CODIGO",   
						"FC_PRELACION"."RUT",   
						"FC_PRELACION"."DV",   
						"FC_PRELACION"."DIRECCION",   
						"FC_PRELACION"."NUMERO_DIREC",   
						"CIUDAD"."CODIGO_CIUDAD",   
						"COMUNA"."CODIGO_COMUNA",   
						"PARENTESCO"."CODIGO",   
						"FC_FALLECIDO"."NOMBRES",   
						"FC_FALLECIDO"."APELLIDO_PATERNO",   
						"FC_FALLECIDO"."APELLIDO_MATERNO",   
						"FC_FALLECIDO"."RUT_FALLECIDO",   
						"FC_FALLECIDO"."DV_FALLECIDO",   
						"FC_FALLECIDO"."FECHA_DEFUNCION",   
						"FC_FALLECIDO"."DIRECCION_FALLECIDO",   
						"FC_FALLECIDO"."NUMERO_FALLECIDO",   
						"CODIGO_ESTADO_CIVIL"."CODIGO_ESTADO",   
						"COD_PARQ"."CODIGO"
			 INTO		:ls_nombres_prelacion,
						:ls_apellido_paterno_prelacion,
						:ls_apellido_materno_prelacion,
						:ll_nacionalidad,
						:ll_rut_prelacion,
						:ls_dv_prelacion,
						:ls_direccion_prelacion,
						:ls_numero_prelacion,
						:ls_ciudad,
						:ls_comuna,
						:ls_parentesco,
						:ls_nombre_fallecido,
						:ls_apellido_paterno_fallecido,
						:ls_apellido_materno_fallecido,
						:ll_rut_fallecido,
						:ls_dv_fallecido,
						:ld_fecha_defuncion,
						:ls_direccion_fallecido,
						:ls_numero_fallecido,
						:ls_estado_civil,
						:ll_codigo_parque
			 FROM 	"FC_CABECERA",   
						"FC_PRELACION",   
						"FC_FALLECIDO",   
						"CODIGO_NACIONALIDAD",   
						"CIUDAD",   
						"COMUNA",   
						"PARENTESCO",   
						"CODIGO_ESTADO_CIVIL",   
						"COD_PARQ"  
			WHERE 	( "FC_PRELACION"."FOLIO_CREMATORIO" = "FC_CABECERA"."FOLIO_CREMATORIO" ) and  
						( "FC_FALLECIDO"."FOLIO_CREMATORIO" = "FC_PRELACION"."FOLIO_CREMATORIO" ) and  
						( "CODIGO_NACIONALIDAD"."CODIGO" = "FC_PRELACION"."NACIONALIDAD" ) and  
						( "CIUDAD"."CODIGO_CIUDAD" = "FC_PRELACION"."CIUDAD" ) and  
						( "COMUNA"."CODIGO_COMUNA" = "FC_PRELACION"."COMUNA" ) and  
						( "PARENTESCO"."COD_PARQUE" = "FC_FALLECIDO"."COD_PARQUE" ) and  
						( "CODIGO_ESTADO_CIVIL"."CODIGO_ESTADO" = "FC_FALLECIDO"."ESTADO_CIVIL" ) and  
						( "COD_PARQ"."CODIGO" = "FC_CABECERA"."COD_PARQUE_ORIGEN" ) and  
						( "PARENTESCO"."CODIGO" = "FC_PRELACION"."PARENTESCO" ) and  
						( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) AND  
						( "FC_PRELACION"."RUT" = :il_rut ) )   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				ll_new		= dw_visual.insertrow(0)
				dw_visual.setitem(ll_new,'folio_creamatorio', il_folio)
				dw_visual.setitem(ll_new,'nombres_prelacion',ls_nombres_prelacion )
				dw_visual.setitem(ll_new,'apellido_paterno_prelacion',ls_apellido_paterno_prelacion )
				dw_visual.setitem(ll_new,'apellido_materno_prelacion',ls_apellido_materno_prelacion )
				dw_visual.setitem(ll_new,'nacionalidad_prelacion',ll_nacionalidad )
				dw_visual.setitem(ll_new,'rut_prelacion',ll_rut_prelacion )
				dw_visual.setitem(ll_new,'dv_prelacion',ls_dv_prelacion )
				dw_visual.setitem(ll_new,'direccion_prelacion',ls_direccion_prelacion )
				dw_visual.setitem(ll_new,'numero_direccion_prelacion',ls_numero_prelacion )
				dw_visual.setitem(ll_new,'ciudad_prelacion',ls_ciudad )
				dw_visual.setitem(ll_new,'comuna_prelacion',ls_comuna )
				dw_visual.setitem(ll_new,'parentesco_prelacion',ls_parentesco )
				dw_visual.setitem(ll_new,'nombres_fallecidos',ls_nombre_fallecido )
				dw_visual.setitem(ll_new,'apellido_paterno_fallecido',ls_apellido_paterno_fallecido )
				dw_visual.setitem(ll_new,'apellido_materno_fallecido',ls_apellido_materno_fallecido )
				dw_visual.setitem(ll_new,'rut_fallecido',ll_rut_fallecido )
				dw_visual.setitem(ll_new,'dv_fallecido',ls_dv_fallecido )
				dw_visual.setitem(ll_new,'fecha_defuncion',ld_fecha_defuncion )
				dw_visual.setitem(ll_new,'direccion_fallecido',ls_direccion_fallecido )
				dw_visual.setitem(ll_new,'numero_direccion_fallecido',ls_numero_fallecido )
				dw_visual.setitem(ll_new,'estado_civil_fallecido',ls_estado_civil )
				dw_visual.setitem(ll_new,'codigo_parque',ll_codigo_parque )
				dw_visual.accepttext()
			else
				messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Ficha / Fallecido / Prelación)")
				close(w_imprimir_cartas)
			end if
		end if
		
	CASE 'devolucion_articulos'
		dw_visual.dataobject	= 'dw_fc_dev_articulos'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'No devolucion de articulos de valor y responsabilidad por daños'
		if dw_visual.retrieve(il_folio,il_rut) = 0 then
			SELECT  "FC_FALLECIDO"."NOMBRES",   
						"FC_FALLECIDO"."APELLIDO_PATERNO",   
						"FC_FALLECIDO"."APELLIDO_MATERNO",   
						"FC_PRELACION"."RUT",   
						"FC_PRELACION"."DV",   
						"FC_PRELACION"."NOMBRES",   
						"FC_PRELACION"."APELLIDO_PATERNO",   
						"FC_PRELACION"."APELLIDO_MATERNO"  
			INTO		:ls_nombres_fallecido,
						:ls_apellido_paterno_fallecido,
						:ls_apellido_materno_fallecido,
						:ll_rut_prelacion,
						:ls_dv_prelacion,
						:ls_nombre_prelacion,
						:ls_apellido_paterno_prelacion,
						:ls_apellido_materno_prelacion
			FROM     "FC_CABECERA",   
						"FC_FALLECIDO",   
						"FC_PRELACION"  
			WHERE   ( "FC_PRELACION"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
						( "FC_FALLECIDO"."FOLIO_CREMATORIO" = "FC_CABECERA"."FOLIO_CREMATORIO" ) and  
						( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) AND  
						( "FC_PRELACION"."RUT" = :il_rut ) )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				ll_new		= dw_visual.insertrow(0)
				dw_visual.setitem(ll_new,'folio_crematorio', il_folio)
				dw_visual.setitem(ll_new,'nombres_fallecido',ls_nombres_fallecido )
				dw_visual.setitem(ll_new,'apellido_paterno_fallecido',ls_apellido_paterno_fallecido )
				dw_visual.setitem(ll_new,'apellido_materno_fallecido',ls_apellido_materno_fallecido )
				dw_visual.setitem(ll_new,'rut_prelacion',ll_rut_prelacion )
				dw_visual.setitem(ll_new,'dv_prelacion',ls_dv_prelacion )
				dw_visual.setitem(ll_new,'nombres_prelacion',ls_nombre_prelacion )
				dw_visual.setitem(ll_new,'apellido_paterno_prelacion',ls_apellido_paterno_prelacion )
				dw_visual.setitem(ll_new,'apellido_materno_prelacion',ls_apellido_materno_prelacion )
				dw_visual.accepttext()
			else
				messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Ficha / Fallecido / Prelación)")
				close(w_imprimir_cartas)
			end if
		end if

	CASE 'servicio_adquirido'
		dw_visual.dataobject	= 'dw_fc_servico_adquirido'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'Informacion del servicio adquirido'
		if dw_visual.retrieve(il_folio) = 0 then
			  SELECT "FC_TITULAR"."NOMBRES",   
						 "FC_TITULAR"."APELLIDO_PATERNO",   
						 "FC_TITULAR"."APELLIDO_MATERNO",   
						 "FC_TITULAR"."RUT_TITULAR",   
						 "FC_TITULAR"."DV_TITULAR",   
						 "FC_FALLECIDO"."RUT_FALLECIDO",   
						 "FC_FALLECIDO"."DV_FALLECIDO",   
						 "FC_FALLECIDO"."NOMBRES",   
						 "FC_FALLECIDO"."APELLIDO_PATERNO",   
						 "FC_FALLECIDO"."APELLIDO_MATERNO",   
						 "FC_ARANCEL"."CODIGO_OTRO",   
						 "FC_DESTINO_CUERPO"."CODIGO_DESTINO",
						 "FC_RESPONSABLE_RETIRO"."VISUALIZAR_SERVICIO"
			 INTO		 :ls_nombre_titular,
						 :ls_apellido_paterno_titular,
						 :ls_apellido_materno_titular,
						 :ll_rut_titular,
						 :ls_dv_titular,
						 :ll_rut_fallecido,
						 :ls_dv_fallecido,
						 :ls_nombres_fallecido,
						 :ls_apellido_paterno_fallecido,
						 :ls_apellido_materno_fallecido,
						 :ls_codigo_otro,
						 :ll_destino_cuerpo,
						 :ls_visualizar
			 FROM 	"FC_ARANCEL",   
						"FC_CABECERA",   
						"FC_DESTINO_CUERPO",   
						"FC_FALLECIDO",   
						"FC_TITULAR",
						"FC_RESPONSABLE_RETIRO"
			WHERE 	( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_ARANCEL"."FOLIO_CREMATORIO" ) and  
						( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
						( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_TITULAR"."FOLIO_CREMATORIO" ) and  
						( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_RESPONSABLE_RETIRO"."FOLIO_CREMATORIO" ) AND
						( "FC_DESTINO_CUERPO"."CODIGO_DESTINO" = "FC_CABECERA"."DESTINO_CUERPO" ) and  
						( ( "FC_ARANCEL"."FOLIO_CREMATORIO" = :il_folio ) )  
			USING	sqlca;
			if sqlca.sqlcode=0 then
				ll_new		= dw_visual.insertrow(0)
				dw_visual.setitem(ll_new,'folio_crematorio', il_folio)
				dw_visual.setitem(ll_new,'nombres_titular',ls_nombre_titular )
				dw_visual.setitem(ll_new,'apellido_paterno_titular',ls_apellido_paterno_titular )
				dw_visual.setitem(ll_new,'apellido_materno_titular',ls_apellido_materno_titular )
				dw_visual.setitem(ll_new,'rut_titular',ll_rut_titular )
				dw_visual.setitem(ll_new,'dv_titular',ls_dv_titular )
				dw_visual.setitem(ll_new,'rut_fallecido',ll_rut_fallecido )
				dw_visual.setitem(ll_new,'dv_fallecido',ls_dv_fallecido )
				dw_visual.setitem(ll_new,'nombres_fallecido',ls_nombres_fallecido )
				dw_visual.setitem(ll_new,'apellido_paterno_fallecido',ls_apellido_paterno_fallecido )
				dw_visual.setitem(ll_new,'apellido_materno_fallecido',ls_apellido_materno_fallecido )
				dw_visual.setitem(ll_new,'codigo_otro',ls_codigo_otro )
				dw_visual.setitem(ll_new,'destino_cuerpo',ll_destino_cuerpo )
				dw_visual.setitem(ll_new,'anfora_sellada','N')
				dw_visual.setitem(ll_new,'visualizar_servicio','N')
				dw_visual.accepttext()
			else
				messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Titular / Fallecido / Arancel / Destino Cuerpo)")
				close(w_imprimir_cartas)
			end if
		end if

	CASE 'acta_cenizas'
		dw_visual.dataobject	= 'dw_fc_acta_entrega_cenizas'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'Acta de entrega de cenizas'
		if dw_visual.retrieve(il_folio) = 0 then
			SELECT "FC_FALLECIDO"."FOLIO_CREMATORIO",   
						"FC_FALLECIDO"."NOMBRES",   
						"FC_FALLECIDO"."APELLIDO_PATERNO",   
						"FC_FALLECIDO"."APELLIDO_MATERNO", 
						"FC_FALLECIDO"."RUT_FALLECIDO",   
						"FC_FALLECIDO"."DV_FALLECIDO",   
						"FC_CABECERA"."FECHA_CINERACION",   
						"FC_RESPONSABLE_RETIRO"."FECHA_RETIRO_CENIZA",   
						"FC_RESPONSABLE_RETIRO"."NOMBRE",   
						"FC_RESPONSABLE_RETIRO"."APELLIDO_PATERNO",   
						"FC_RESPONSABLE_RETIRO"."APELLIDO_MATERNO", 
						"FC_RESPONSABLE_RETIRO"."RUT_RESPONSABLE",
						"FC_RESPONSABLE_RETIRO"."DV_RESPONSABLE",  
						"FC_DESTINO_CUERPO"."CODIGO_DESTINO",   
						"FC_RESPONSABLE_RETIRO"."HORA_RETIRO_CENIZA",   
						"FC_ARANCEL"."CODIGO_OTRO",   
						"FC_RESPONSABLE_RETIRO"."MINUTO_RETIRO_CENIZA"  
			 INTO		 :ll_folio_crematorio,
						 :ls_nombres_fallecido,
						 :ls_apellido_paterno_fallecido,
						 :ls_apellido_materno_fallecido,
						 :ll_rut_fallecido,
						 :ls_dv_fallecido,
						 :ld_fecha_cineracion,
						 :ld_fecha_retiro_cenizas,
						 :ls_nombres_responsables,
						 :ls_apellido_paterno_responsable,
						 :ls_apellido_materno_responsable,
						 :ll_rut_responsable,
						 :ls_dv_responsable,						 
						 :ll_destino_cuerpo,
						 :ll_hora_retiro_cenizas,
						 :ls_tipo_servicio,
						 :ll_minuto_retiro_cenizas
			FROM     "FC_CABECERA",
						"FC_FALLECIDO",
						"FC_RESPONSABLE_RETIRO",
						"FC_DESTINO_CUERPO",
						"FC_ARANCEL"
			WHERE ( "FC_FALLECIDO"."FOLIO_CREMATORIO" = "FC_CABECERA"."FOLIO_CREMATORIO" ) and
						( "FC_RESPONSABLE_RETIRO"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and
						( "FC_DESTINO_CUERPO"."CODIGO_DESTINO" = "FC_RESPONSABLE_RETIRO"."DESTINO_CUERPO" ) and
						( "FC_ARANCEL"."FOLIO_CREMATORIO" = "FC_CABECERA"."FOLIO_CREMATORIO" ) and
						( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) ) 
	
			USING	sqlca;
			if sqlca.sqlcode=0 then
				ll_new		= dw_visual.insertrow(0)
				dw_visual.setitem(ll_new,'folio_crematorio', il_folio)
				dw_visual.setitem(ll_new,'nombres_fallecido',ls_nombres_fallecido )
				dw_visual.setitem(ll_new,'apellido_paterno_fallecido',ls_apellido_paterno_fallecido )
				dw_visual.setitem(ll_new,'apellido_materno_fallecido',ls_apellido_materno_fallecido )
				dw_visual.setitem(ll_new,'rut_fallecido',ll_rut_fallecido )
				dw_visual.setitem(ll_new,'dv_fallecido',ls_dv_fallecido )
				dw_visual.setitem(ll_new,'folio_crematorio',il_folio )
				dw_visual.setitem(ll_new,'nombres_responsables',ls_nombres_responsables )
				dw_visual.setitem(ll_new,'apellido_parterno_responsable',ls_apellido_paterno_responsable )
				dw_visual.setitem(ll_new,'apellido_materno_responsable',ls_apellido_materno_responsable )
				dw_visual.setitem(ll_new,'rut_resposable',ll_rut_responsable )
				dw_visual.setitem(ll_new,'dv_resposnable',ls_dv_responsable )
				dw_visual.setitem(ll_new,'destino_cuerpo',ll_destino_cuerpo )
				dw_visual.setitem(ll_new,'hora_retiro_cenizas',ll_hora_retiro_cenizas )
				dw_visual.setitem(ll_new,'tipo_servicio',ls_tipo_servicio )
				dw_visual.setitem(ll_new,'minuto_retiro_cenizas',ll_minuto_retiro_cenizas )
				dw_visual.setitem(ll_new,'fecha_retiro_ceniza',ld_fecha_retiro_cenizas )
				dw_visual.setitem(ll_new,'fecha_cineracion',ld_fecha_cineracion )
				dw_visual.accepttext()
			else
				messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Ficha / Fallecido / Arancel / Destino Cuerpo)")
				close(w_imprimir_cartas)
			end if
		end if

	CASE 'ext_art_electricos'
			dw_visual.dataobject	= 'dw_extraccion_implantes_electronicos'
			dw_visual.settransobject(sqlca)
			w_imprimir_cartas.title		= 'Extraccion de implantes electronicos'
			if dw_visual.retrieve(il_folio) = 0 then
				SELECT  "FC_FALLECIDO"."RUT_FALLECIDO",
							"FC_FALLECIDO"."DV_FALLECIDO",
							"FC_FALLECIDO"."NOMBRES",
							"FC_FALLECIDO"."APELLIDO_PATERNO",
							"FC_FALLECIDO"."APELLIDO_MATERNO"
				INTO	 :ll_rut_fallecido,
						 :ls_dv_fallecido,
						 :ls_nombres_fallecido,
						 :ls_apellido_paterno_fallecido,
						 :ls_apellido_materno_fallecido

				FROM "FC_CABECERA",   
						 "FC_FALLECIDO"  
				WHERE ( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
							( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) )
				USING	sqlca;
				if sqlca.sqlcode=0 then
					ll_new		= dw_visual.insertrow(0)
					dw_visual.setitem(ll_new,'numero_crematorio', il_folio)
					dw_visual.setitem(ll_new,'rut_fallecido',ll_rut_fallecido )
					dw_visual.setitem(ll_new,'dv_fallecido',ls_dv_fallecido )
					dw_visual.setitem(ll_new,'nombre_fallecido',ls_nombres_fallecido )
					dw_visual.setitem(ll_new,'ap_paterno_fallecido',ls_apellido_paterno_fallecido )
					dw_visual.setitem(ll_new,'ap_materno_fallecido',ls_apellido_materno_fallecido )
					dw_visual.setitem(ll_new,'numero_crematorio', il_folio )
					dw_visual.setitem(ll_new,'fecha_extraccion',date(gdt_fec_sistema))
					dw_visual.accepttext()
				else
					messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Fallecido)")
					close(w_imprimir_cartas)
				end if
			end if
			
	CASE 'carta_73'
		dw_visual.dataobject	= 'dw_fc_carta_73'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'Documento Numero 73'
		if dw_visual.retrieve(il_folio) = 0 then
			SELECT "FC_PRELACION"."NOMBRES",
						"FC_PRELACION"."APELLIDO_PATERNO",
						"FC_PRELACION"."APELLIDO_MATERNO",
						"FC_PRELACION"."RUT",
						"FC_PRELACION"."DV",
						"FC_PRELACION"."DIRECCION",
						"FC_PRELACION"."NUMERO_DIREC",
						"COMUNA"."CODIGO_COMUNA",
						"CIUDAD"."CODIGO_CIUDAD",
						"FC_FALLECIDO"."NOMBRES",
						"FC_FALLECIDO"."APELLIDO_PATERNO",
						"FC_FALLECIDO"."APELLIDO_MATERNO",
						"FC_FALLECIDO"."RUT_FALLECIDO",
						"FC_FALLECIDO"."DV_FALLECIDO",
						"COD_PARQ"."CODIGO",		//NOMBRE
						"COD_PARQ"."CODIGO",		//COMUNA
						"COD_PARQ"."CODIGO",		//CIUDAD
						"COD_PARQ"."CODIGO"	//DIRECCION
			 INTO 	:ls_nombre_prelacion,
						:ls_apellido_paterno_prelacion,
						:ls_apellido_materno_prelacion,
						:ll_rut_prelacion,
						:ls_dv_prelacion,
						:ls_direccion_prelacion,
						:ls_numero_prelacion,
						:ls_comuna,
						:ls_ciudad,
						:ls_nombre_fallecido,
						:ls_apellido_paterno_fallecido,
						:ls_apellido_materno_fallecido,
						:ll_rut_fallecido,
						:ls_dv_fallecido,
						:ll_cod_parque_nombre,
						:ll_cod_parque_comuna,
						:ll_cod_parque_ciudad,
						:ll_cod_parque_direccion
			 FROM    "FC_CABECERA",
						"FC_FALLECIDO",
						"FC_PRELACION", 
						"COMUNA",
						"CIUDAD",
						"COD_PARQ"
			WHERE ( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and
						( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_PRELACION"."FOLIO_CREMATORIO" ) and
						( "COMUNA"."CODIGO_COMUNA" = "FC_PRELACION"."COMUNA" ) and
						( "CIUDAD"."CODIGO_CIUDAD" = "FC_PRELACION"."CIUDAD" ) and
						( "COD_PARQ"."CODIGO" = "FC_FALLECIDO"."COD_PARQUE" ) and
						( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) AND
						( "FC_PRELACION"."RUT" = :il_rut ) )
			USING	sqlca;
			if sqlca.sqlcode=0 then
				ll_new		= dw_visual.insertrow(0)
				dw_visual.setitem(ll_new,'folio_cremacion', il_folio)
				dw_visual.setitem(ll_new,'nombres_prelacion',ls_nombre_prelacion)
				dw_visual.setitem(ll_new,'apellido_paterno_prelacion',ls_apellido_paterno_prelacion)
				dw_visual.setitem(ll_new,'apellido_materno_prelacion',ls_apellido_materno_prelacion)
				dw_visual.setitem(ll_new,'rut_prelacion',ll_rut_prelacion)
				dw_visual.setitem(ll_new,'dv_prelacion',ls_dv_prelacion)
				dw_visual.setitem(ll_new,'direccion_prelacion', ls_direccion_prelacion)
				dw_visual.setitem(ll_new,'numero_prelacion', ls_numero_prelacion)
				dw_visual.setitem(ll_new,'comuna_prelacion', ls_comuna)
				dw_visual.setitem(ll_new,'ciudad_prelacion', ls_ciudad)
				dw_visual.setitem(ll_new,'nombres_fallecido', ls_nombre_fallecido)
				dw_visual.setitem(ll_new,'apellido_paterno_fallecido', ls_apellido_paterno_fallecido)
				dw_visual.setitem(ll_new,'apellido_materno_fallecido', ls_apellido_materno_fallecido)
				dw_visual.setitem(ll_new,'rut_fallecido', ll_rut_fallecido)
				dw_visual.setitem(ll_new,'dv_fallecido', ls_dv_fallecido)
				dw_visual.setitem(ll_new,'nombre_parque', ll_cod_parque_nombre)
				dw_visual.setitem(ll_new,'comuna_parque', ll_cod_parque_comuna)
				dw_visual.setitem(ll_new,'ciudad_parque', ll_cod_parque_ciudad)
				dw_visual.setitem(ll_new,'direccion_parque', ll_cod_parque_direccion)
				dw_visual.accepttext()
			else
				messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Ficha / Fallecido / Prelación)")
				close(w_imprimir_cartas)
			end if
		end if
			
	CASE 'carta_74'
			dw_visual.dataobject	= 'dw_fc_carta_74'
			dw_visual.settransobject(sqlca)
			w_imprimir_cartas.title		= 'Documento Numero 74'
			if dw_visual.retrieve(il_folio) = 0 then
				SELECT 	"FC_FALLECIDO"."NOMBRES",   
							"FC_FALLECIDO"."APELLIDO_PATERNO",   
							"FC_FALLECIDO"."APELLIDO_MATERNO",   
							"FC_FALLECIDO"."RUT_FALLECIDO",   
							"FC_FALLECIDO"."DV_FALLECIDO",   
							"FC_FALLECIDO"."BASE", 
							"FC_FALLECIDO"."SERIE", 
							"FC_FALLECIDO"."NUMERO", 
							"COD_PARQ_B"."CODIGO",   	//NOMBRE
							"COD_PARQ_B"."CODIGO",   //DIRECCION
							"COD_PARQ_B"."CODIGO",   	//COMUNA
							"COD_PARQ_B"."CODIGO",   	//CIUDAD
							"COD_PARQ_A"."CODIGO",   	//NOMBRE
							"COD_PARQ_A"."CODIGO",   //DIRECCION
							"COD_PARQ_A"."CODIGO",   	//COMUNA
							"COD_PARQ_A"."CODIGO"  		//CIUDAD
				 INTO 	:ls_nombre_fallecido,
							:ls_apellido_paterno_fallecido,
							:ls_apellido_materno_fallecido,
							:ll_rut_fallecido,
							:ls_dv_fallecido,
							:ls_base,
							:ls_serie,
							:ll_numero,
							:ll_cod_parque_ori_nombre,
							:ll_cod_parque_ori_direccion,
							:ll_cod_parque_ori_comuna,
							:ll_cod_parque_ori_ciudad,
							:ll_cod_parque_des_nombre,
							:ll_cod_parque_des_direccion,
							:ll_cod_parque_des_comuna,
							:ll_cod_parque_des_ciudad
				 FROM 	"COD_PARQ" "COD_PARQ_A",   
							"FC_CABECERA",   
							"FC_FALLECIDO",   
							"COD_PARQ" "COD_PARQ_B"  
				WHERE 	( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
							( "COD_PARQ_B"."CODIGO" = "FC_FALLECIDO"."COD_PARQUE" ) and  
							( "COD_PARQ_A"."CODIGO" = "FC_CABECERA"."COD_PARQUE_DESTINO" ) and  
							( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) )   
				USING	sqlca;
				if sqlca.sqlcode=0 then
					ll_new		= dw_visual.insertrow(0)
					dw_visual.setitem(ll_new,'folio_crematorio', il_folio)
					dw_visual.setitem(ll_new,'base', ls_base)
					dw_visual.setitem(ll_new,'serie', ls_serie)
					dw_visual.setitem(ll_new,'numero', ll_numero)
					dw_visual.setitem(ll_new,'nombre_fallecido', ls_nombre_fallecido)
					dw_visual.setitem(ll_new,'app_fallecido', ls_apellido_paterno_fallecido)
					dw_visual.setitem(ll_new,'apm_fallecido', ls_apellido_materno_fallecido)
					dw_visual.setitem(ll_new,'rut_fallecido', ll_rut_fallecido)
					dw_visual.setitem(ll_new,'dv_fallecido', ls_dv_fallecido)
					dw_visual.setitem(ll_new,'cod_parq_origen', ll_cod_parque_ori_nombre)
					dw_visual.setitem(ll_new,'cod_parq_destino', ll_cod_parque_des_nombre)
					dw_visual.accepttext()
				else
					messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Ficha-Parque Destino / Fallecido)")
					close(w_imprimir_cartas)
				end if
			end if
				
	CASE 'declaracion_marcapaso'
		dw_visual.dataobject			= 'dw_carta_declaracion_marcapasos'
		dw_visual.settransobject(sqlca)
		w_imprimir_cartas.title		= 'Declaracion Marcapaso'
		if dw_visual.retrieve(il_folio) = 0 then
			SELECT "FC_FALLECIDO"."NOMBRES",   
						"FC_FALLECIDO"."APELLIDO_PATERNO",   
						"FC_FALLECIDO"."APELLIDO_MATERNO",   
						"FC_TITULAR"."NOMBRES",   
						"FC_TITULAR"."APELLIDO_PATERNO",   
						"FC_TITULAR"."APELLIDO_MATERNO"  
			INTO		:ls_nombre_fallecido,
						:ls_apellido_paterno_fallecido,
						:ls_apellido_materno_fallecido,
						:ls_nombre_titular,
						:ls_apellido_paterno_titular,
						:ls_apellido_materno_titular
			FROM 	"FC_CABECERA",   
						"FC_FALLECIDO",   
						"FC_TITULAR"  
			WHERE 	( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_FALLECIDO"."FOLIO_CREMATORIO" ) and  
						( "FC_CABECERA"."FOLIO_CREMATORIO" = "FC_TITULAR"."FOLIO_CREMATORIO" ) and  
						( ( "FC_CABECERA"."FOLIO_CREMATORIO" = :il_folio ) ) 
			USING	sqlca;
			if sqlca.sqlcode=0 then
				ll_new		= dw_visual.insertrow(0)
				dw_visual.setitem(ll_new,'folio_crematorio', il_folio)
				dw_visual.setitem(ll_new,'sw_tiene_marcapaso', 'N')
				dw_visual.setitem(ll_new,'nombres_fallecido', ls_nombre_fallecido)
				dw_visual.setitem(ll_new,'apellido_paterno_fallecido', ls_apellido_paterno_fallecido)
				dw_visual.setitem(ll_new,'apellido_materno_fallecido', ls_apellido_materno_fallecido)
				dw_visual.setitem(ll_new,'nombres_titular',ls_nombre_titular )
				dw_visual.setitem(ll_new,'apellido_paterno_titular',ls_apellido_paterno_titular )
				dw_visual.setitem(ll_new,'apellido_materno_titular',ls_apellido_materno_titular )
				dw_visual.accepttext()
			else
				messagebox("Advertencia","Debe Ingresar y Grabar Antecedentes en Ficha (Ficha / Fallecido / Ttular)")
				close(w_imprimir_cartas)
			end if
		end if
END CHOOSE
end event

type cb_print from commandbutton within w_imprimir_cartas
integer x = 416
integer y = 2632
integer width = 311
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;Long		ll_resp

if il_mod > 0 then
	messagebox("Advertencia","Antes de Imprimir debe Grabar Cambios")
	ll_resp		= 0
else
	ll_resp		= 1
end if
if ll_resp = 1 then
	CHOOSE CASE is_tipo
		CASE 'registro_fallecido'
			dw_print_carta.dataobject = 'dw_registro_fallecido_cinerario_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'jurada_notarial'
			dw_print_carta.dataobject = 'dw_jurada_notarial_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'jurada_simple'
			dw_print_carta.dataobject = 'dw_declaracion_jurada_simple_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'servicio_adquirido'
			dw_print_carta.dataobject = 'dw_fc_servico_adquirido_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'acta_cenizas'
			dw_print_carta.dataobject = 'dw_fc_acta_entrega_cenizas_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'devolucion_articulos'
			dw_print_carta.dataobject = 'dw_fc_dev_articulos_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio,il_rut) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'ext_art_electricos'
			dw_print_carta.dataobject = 'dw_extraccion_implantes_electronicos_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'carta_73'
			dw_print_carta.dataobject = 'dw_fc_carta_73_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'carta_74'
			dw_print_carta.dataobject = 'dw_fc_carta_74_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
				
		CASE 'declaracion_marcapaso'
			dw_print_carta.dataobject = 'dw_carta_declaracion_marcapasos_print'
			dw_print_carta.settransobject(sqlca)
				if dw_print_carta.retrieve(il_folio) > 0 then 
					f_printdlg(dw_print_carta,gstr_print,w_imprimir_cartas)
				else
					messagebox("Advertencia","Para Imprimir, Antes debe Grabar Documento")
				end if
	END CHOOSE
end if
end event

type dw_print_carta from datawindow within w_imprimir_cartas
boolean visible = false
integer x = 1559
integer y = 2620
integer width = 667
integer height = 132
string title = "none"
string dataobject = "dw_fc_carta_73_print"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_guardar from commandbutton within w_imprimir_cartas
integer x = 41
integer y = 2632
integer width = 311
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Guardar"
end type

event clicked;String ls_pasa = 'S',ls_nom_tanatologo,ls_nom_fallecido,ls_app_fallecido,ls_apm_fallecido,ls_dv_fallecido,ls_observacion,ls_tipo_servicio,ls_nom_respon,ls_app_respon,ls_apm_respon,ls_nom_prelacion,&
		 ls_app_prelacion,ls_apm_prelacion,ls_dv_prelacion,ls_nom_titular,ls_app_titular,ls_apm_titular,dv_titular,ls_sexo_fallecido,ls_causa_fallecimiento,ls_enfermedad_obligatoria,ls_sw_marcapaso,ls_hora_cineracion,&
		 ls_minuto_cineracion,ls_direccion_prelacion,ls_numero_prelacionls_comuna_prelacion,ls_ciudad_prelacion,ls_nombre_parque,ls_direccion_parque,ls_comuna_parque,ls_ciudad_parque,ls_numero_prelacion,&
		 ls_comuna_prelacion,ls_parentesco_prelacion,ls_direccion_fallecido,ls_numero_direccion_fallecido,ls_estado_civil_fallecido,ls_codigo_parque,ls_nacionalidad_prelacion,ls_numero_direccion_prelacion,&
		 ls_estado_anfora,ls_estado_visualiza,ls_fono,ls_correo,ls_obs,ls_responsable_retiro_dispo,ls_disposicion,ls_nro_resol_seremi
		
LONG ll_rut_jefe,ll_numero_crematorio,ll_rut_fallecido,ll_minuto_entrega_cenizas,ll_hora_entrega_cenizas,ll_destino_cenizas,ll_rut_prelacion,ll_rut_titular,ll_destino_cuerpo,ll_hora_cineracion,ll_minuto_cineracion,ll_cantidad_hijos,&
		ll_hora_ingreso,ll_min_ingreso,ll_hora_retiro_dispo,ll_min_retiro_dispo,ll_modelo_anfora

DATE ld_fecha_extraccion,ld_fecha_creamacion,ld_fecha_entrega_cenizas,ld_fecha_actual,ld_fecha_defuncion,ld_fecha_cineracion,ldt_fecha_ingreso,ldt_fecha_retiro_dispo

il_mod											= 0
CHOOSE CASE is_tipo
		CASE 'jurada_simple'
			ls_nom_prelacion 					= dw_visual.getItemString(1,'nombres_prelacion')
			ls_app_prelacion 					= dw_visual.getItemString(1,'apellido_paterno_prelacion')
			ls_apm_prelacion 					= dw_visual.getItemString(1,'apellido_materno_prelacion')
			ls_nacionalidad_prelacion 		= dw_visual.getItemString(1,'nacionalidad_prelacion')
			ll_rut_prelacion 					= dw_visual.getItemNumber(1,'rut_prelacion')
			ls_dv_prelacion 					= dw_visual.getItemString(1,'dv_prelacion')
			ls_direccion_prelacion 			= dw_visual.getItemString(1,'direccion_prelacion')
			ls_numero_direccion_prelacion = dw_visual.getItemString(1,'numero_direccion_prelacion')
			ls_comuna_prelacion 				= dw_visual.getItemString(1,'comuna_prelacion')
			ls_ciudad_prelacion 				= dw_visual.getItemString(1,'ciudad_prelacion')
			ls_parentesco_prelacion 			= dw_visual.getItemString(1,'parentesco_prelacion')
			ls_nom_fallecido 					= dw_visual.getItemString(1,'nombres_fallecidos')
			ls_app_fallecido 					= dw_visual.getItemString(1,'apellido_paterno_fallecido')
			ls_apm_fallecido 					= dw_visual.getItemString(1,'apellido_materno_fallecido')
			ll_rut_fallecido 						= dw_visual.getItemNumber(1,'rut_fallecido')
			ls_dv_fallecido 						= dw_visual.getItemString(1,'dv_fallecido')
			ld_fecha_defuncion 				= date(dw_visual.getItemDatetime(1,'fecha_defuncion'))
			ls_direccion_fallecido 				= dw_visual.getItemString(1,'direccion_fallecido')
			ls_numero_direccion_fallecido 	= dw_visual.getItemString(1,'numero_direccion_fallecido')
			ls_estado_civil_fallecido 			= dw_visual.getItemString(1,'estado_civil_fallecido')
			ls_codigo_parque 					= dw_visual.getItemString(1,'codigo_parque')
			ll_cantidad_hijos					= dw_visual.getItemNumber(1,'cantidad_hijos')
			
			if isnull(ll_cantidad_hijos) or ll_cantidad_hijos = 0 then
				messagebox("Advertencia","Debe Ingresar La Cantidad de Hijos")
				ls_pasa = 'N'
				dw_visual.setFocus()
				dw_visual.setcolumn('canitdad_hijos')
			end if

	CASE 'ext_art_electricos'
		ll_numero_crematorio 			= dw_visual.getItemNumber(1,'numero_crematorio')
		ll_rut_jefe 							= dw_visual.getItemNumber(1,'rut_jefe_parque')
		ls_nom_tanatologo 				= dw_visual.getItemString(1,'nombre_tanatologo')
		ld_fecha_extraccion 				= date(dw_visual.getitemdatetime(1,'fecha_extraccion'))
		ls_nom_fallecido 					= dw_visual.getItemString(1,'nombre_fallecido')
		ls_app_fallecido 					= dw_visual.getItemString(1,'ap_paterno_fallecido')
		ls_apm_fallecido 					= dw_visual.getItemString(1,'ap_materno_fallecido')
		ll_rut_fallecido 						= dw_visual.getItemNumber(1,'rut_fallecido')
		ls_dv_fallecido 						= dw_visual.getItemString(1,'dv_fallecido')
		ls_observacion 						= dw_visual.getItemString(1,'observacion')
		
		if isnull(ll_rut_jefe) or ll_rut_jefe = 0 then
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('rut_jefe_parque')
		elseif isnull(ls_nom_tanatologo) or ls_nom_tanatologo = '' then
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('nombre_tanatologo')
		elseif isnull(ld_fecha_extraccion) then
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('fecha_extraccion')
		elseif isnull(ls_observacion) or ls_observacion = '' then
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('observacion')
		end if
		
	CASE 'acta_cenizas'
		ls_nom_fallecido 				= dw_visual.getItemString(1,'nombres_fallecido')
		ls_app_fallecido 				= dw_visual.getItemString(1,'apellido_paterno_fallecido')
		ls_apm_fallecido 				= dw_visual.getItemString(1,'apellido_materno_fallecido')
		ld_fecha_cineracion 			= date(dw_visual.getItemDatetime(1,'fecha_cineracion'))
		ls_tipo_servicio 				= dw_visual.getItemString(1,'tipo_servicio')
		ll_numero_crematorio 		= dw_visual.getItemNumber(1,'folio_crematorio')
		ls_nom_respon 				= dw_visual.getItemString(1,'nombres_responsables')
		ls_app_respon 					= dw_visual.getItemString(1,'apellido_parterno_responsable')
		ls_apm_respon 				= dw_visual.getItemString(1,'apellido_materno_responsable')
		ld_fecha_entrega_cenizas 	= date(dw_visual.getItemDatetime(1,'fecha_retiro_ceniza'))
		ll_hora_entrega_cenizas 		= dw_visual.getItemNumber(1,'hora_retiro_cenizas')
		ll_minuto_entrega_cenizas 	= dw_visual.getItemNumber(1,'minuto_retiro_cenizas')
		ll_destino_cenizas 				= dw_visual.getItemNumber(1,'destino_cuerpo')
		
	CASE 'devolucion_articulos'
		ls_nom_fallecido 		= dw_visual.getItemString(1,'nombres_fallecido')
		ls_app_fallecido 		= dw_visual.getItemString(1,'apellido_paterno_fallecido')
		ls_apm_fallecido 		= dw_visual.getItemString(1,'apellido_materno_fallecido')
		ls_nom_prelacion 		= dw_visual.getItemString(1,'nombres_prelacion')
		ls_app_prelacion 		= dw_visual.getItemString(1,'apellido_paterno_prelacion')
		ls_apm_prelacion 		= dw_visual.getItemString(1,'apellido_materno_prelacion')
		ll_rut_prelacion 		= dw_visual.getItemNumber(1,'rut_prelacion')
		ls_dv_prelacion 		= dw_visual.getItemString(1,'dv_prelacion')
		ld_fecha_actual 		= date(dw_visual.getItemDatetime(1,'fecha_actual'))
		
	CASE 'servicio_adquirido'
		ls_nom_titular 			= dw_visual.getItemString(1,'nombres_titular')
		ls_app_titular 			= dw_visual.getItemString(1,'apellido_paterno_titular')
		ls_apm_titular 			= dw_visual.getItemString(1,'apellido_materno_titular')
		ll_rut_titular 			= dw_visual.getItemNumber(1,'rut_titular')
		dv_titular  				= dw_visual.getItemString(1,'dv_titular')
		ls_nom_fallecido 		= dw_visual.getItemString(1,'nombres_fallecido')
		ls_app_fallecido 		= dw_visual.getItemString(1,'apellido_paterno_fallecido')
		ls_apm_fallecido 		= dw_visual.getItemString(1,'apellido_materno_fallecido')
		ll_rut_fallecido 			= dw_visual.getItemNumber(1,'rut_fallecido')
		ls_dv_fallecido 			= dw_visual.getItemString(1,'dv_fallecido')
		ls_tipo_servicio 		= dw_visual.getItemString(1,'codigo_otro')
		ll_destino_cuerpo 		= dw_visual.getItemNumber(1,'destino_cuerpo')
		ls_estado_anfora		= dw_visual.getItemString(1,'anfora_sellada')
		ls_estado_visualiza	= dw_visual.getItemString(1,'visualizar_servicio')
		ls_fono					= dw_visual.getItemString(1,'fono')
		ls_correo					= dw_visual.getItemString(1,'correo_electronico')
		if isnull(ls_estado_anfora) then
			messagebox("Advertencia","Debe Ingresar Estado Anfora")
			ls_pasa 				= 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('anfora_sellada')
		elseif isnull(ls_estado_visualiza) then
			messagebox("Advertencia","Debe Ingresar Estado Visulaización Servicio")
			ls_pasa 				= 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('visualizar_servicio')	
		end if
		if ls_estado_visualiza = 'S' then
			if isnull(ls_fono) or ls_fono='' then
				messagebox("Advertencia","Debe Ingresar Teléfono")
				ls_pasa 				= 'N'
				dw_visual.setFocus()
				dw_visual.setcolumn('fono')	
			elseif isnull(ls_correo) or ls_correo='' then
				messagebox("Advertencia","Debe Ingresar Correo Electrónico")
				ls_pasa 				= 'N'
				dw_visual.setFocus()
				dw_visual.setcolumn('correo_electronico')	
		end if
	end if
	CASE 'registro_fallecido'
		ls_nom_fallecido 				= dw_visual.getItemString(1,'nombres_fallecido')
		ls_app_fallecido 				= dw_visual.getItemString(1,'apellido_paterno_fallecido')
		ls_apm_fallecido 				= dw_visual.getItemString(1,'apellido_materno_fallecido')
		ll_rut_fallecido 					= dw_visual.getItemNumber(1,'rut_fallecido')
		ls_dv_fallecido 					= dw_visual.getItemString(1,'dv_fallecido')
		ls_sexo_fallecido 				= dw_visual.getItemString(1,'sexo_fallecido')
		ld_fecha_defuncion 			= date(dw_visual.getItemDatetime(1,'fecha_defuncion'))
		ld_fecha_cineracion 			= date(dw_visual.getItemDatetime(1,'fecha_cineracion'))
		ls_hora_cineracion 			=  dw_visual.getItemString(1,'hora_cineracion')
		ls_minuto_cineracion 			=  dw_visual.getItemString(1,'minuto_cineracion')
		ls_causa_fallecimiento 		= dw_visual.getItemString(1,'causa_fallecimiento')
		ls_enfermedad_obligatoria 	= dw_visual.getItemString(1,'enfermedad_obligatoria')
		
		ldt_fecha_ingreso				= date(dw_visual.getItemdatetime(1,'fecha_ingreso_cinerario'))
		ll_hora_ingreso					= dw_visual.getItemNumber(1,'hora_ingreso_cinerario')
		ll_min_ingreso					= dw_visual.getItemNumber(1,'minuto_ingreso_cinerario')
		ls_obs							= dw_visual.getItemString(1,'observacion')
		ldt_fecha_retiro_dispo		= date(dw_visual.getItemdatetime(1,'fecha_retiro_dispositivo'))
		ll_hora_retiro_dispo			= dw_visual.getItemNumber(1,'hora_retiro_dispositivo')
		ll_min_retiro_dispo			= dw_visual.getItemNumber(1,'minuto_retiro_dispositivo')
		ls_responsable_retiro_dispo	= dw_visual.getItemString(1,'responsable_retiro_dispositivo')
		ls_disposicion					= dw_visual.getItemString(1,'disposicion_dispositivo')
		ls_nro_resol_seremi			= dw_visual.getItemString(1,'numero_resol_seremi_cremacion')
		ll_modelo_anfora				= dw_visual.getItemNumber(1,'modelo_anfora')
		if isnull(ldt_fecha_ingreso) then
			messagebox("Advertencia","Debe Ingresar Fecha Ingreso a Cinerario")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('fecha_ingreso_cinerario')
		elseif ld_fecha_cineracion > ldt_fecha_ingreso then
			messagebox("Advertencia","Fecha Ingreso Cinerario Invalida, No debe ser mayor a Fecha Crematorio")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('fecha_ingreso_cinerario')
		elseif ldt_fecha_ingreso < ld_fecha_defuncion then
			messagebox("Advertencia","Fecha Ingreso Cinerario Invalida, No debe ser menor a Fecha Defunción")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('fecha_ingreso_cinerario')
		elseif isnull(ll_hora_ingreso) then
			messagebox("Advertencia","Debe Ingresar Hora Ingreso a Cinerario")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('hora_ingreso_cinerario')
		elseif isnull(ll_min_ingreso) then
			messagebox("Advertencia","Debe Ingresar Minuto Ingreso a Cinerario")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('minuto_ingreso_cinerario')
		elseif isnull(ls_obs) then
			messagebox("Advertencia","Debe Ingresar Observación")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('observacion')
		elseif isnull(ldt_fecha_retiro_dispo) then
			messagebox("Advertencia","Debe Ingresar Fecha Retiro Dispositivo")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('fecha_retiro_dispositivo')
		elseif isnull(ll_hora_retiro_dispo) then
			messagebox("Advertencia","Debe Ingresar Hora Retiro Dispositivo")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('hora_retiro_dispositivo')	
		elseif isnull(ll_min_retiro_dispo) then
			messagebox("Advertencia","Debe Ingresar Minuto Retiro Dispositivo")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('minuto_retiro_dispositivo')		
		elseif isnull(ls_responsable_retiro_dispo) then
			messagebox("Advertencia","Debe Ingresar Responsable Retiro Dispositivo")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('responsable_retiro_dispositivo')		
		elseif isnull(ls_disposicion) then
			messagebox("Advertencia","Debe Ingresar Disposición final del dispositivo")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('disposicion_dispositivo')		
		elseif isnull(ls_nro_resol_seremi) then
			messagebox("Advertencia","Debe Ingresar Núnmero Resolución SEREMI")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('numero_resol_seremi_cremacion')
		elseif isnull(ll_modelo_anfora) then
			messagebox("Advertencia","Debe Ingresar Modelo Anfora")
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('modelo_anfora')		
		end if
		
	CASE 'declaracion_marcapaso'
		ls_nom_fallecido 		= dw_visual.getItemString(1,'nombres_fallecido')
		ls_app_fallecido 		= dw_visual.getItemString(1,'apellido_paterno_fallecido')
		ls_apm_fallecido 		= dw_visual.getItemString(1,'apellido_materno_fallecido')
		ls_nom_titular 			= dw_visual.getItemString(1,'nombres_titular')
		ls_app_titular 			= dw_visual.getItemString(1,'apellido_paterno_titular')
		ls_apm_titular 			= dw_visual.getItemString(1,'apellido_materno_titular')
		ls_sw_marcapaso 		= dw_visual.getItemString(1,'sw_tiene_marcapaso')
		
		if isnull(ls_sw_marcapaso) or ls_sw_marcapaso = '' then
			ls_pasa = 'N'
			dw_visual.setFocus()
			dw_visual.setcolumn('ls_sw_marcapaso')
		end if
CASE 'carta_73'
	ls_nom_prelacion 			= dw_visual.getItemString(1,'nombres_prelacion')
	ls_app_prelacion 			= dw_visual.getItemString(1,'apellido_paterno_prelacion')
	ls_apm_prelacion 			= dw_visual.getItemString(1,'apellido_materno_prelacion')
	ll_rut_prelacion 			= dw_visual.getItemNumber(1,'rut_prelacion')
	ls_dv_prelacion 			= dw_visual.getItemString(1,'dv_prelacion')
	ls_direccion_prelacion 	= dw_visual.getItemString(1,'direccion_prelacion')
	ls_numero_prelacion 		= dw_visual.getItemString(1,'numero_prelacion')
	ls_comuna_prelacion 		= dw_visual.getItemString(1,'comuna_prelacion')
	ls_ciudad_prelacion 		= dw_visual.getItemString(1,'ciudad_prelacion')
	ls_nom_fallecido 			= dw_visual.getItemString(1,'nombres_fallecido')
	ls_app_fallecido 			= dw_visual.getItemString(1,'apellido_paterno_fallecido')
	ls_apm_fallecido 			= dw_visual.getItemString(1,'apellido_materno_fallecido')
	ll_rut_fallecido 				= dw_visual.getItemNumber(1,'rut_fallecido')
	ls_dv_fallecido 				= dw_visual.getItemString(1,'dv_fallecido')
	ls_nombre_parque 		= dw_visual.getItemString(1,'nombre_parque')
	ls_direccion_parque 		= dw_visual.getItemString(1,'direccion_parque')
	ls_comuna_parque 		= dw_visual.getItemString(1,'comuna_parque')
	ls_ciudad_parque 			= dw_visual.getItemString(1,'ciudad_parque')
	ll_cantidad_hijos 			= dw_visual.getItemNumber(1,'cantidad_hijos')
	if isNull(ll_cantidad_hijos) then
		messagebox("Advertencia","Debe Ingresar Cantidad de Hijos")
		ls_pasa = 'N'
		dw_visual.setFocus()
		dw_visual.setcolumn('cantidad_hijos')
	end if
	
END CHOOSE

if ls_pasa = 'S' then
	if dw_visual.update()=1 then
		commit;
		messagebox("Grabar","Grabacion Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Carta SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_cerrar from commandbutton within w_imprimir_cartas
integer x = 3218
integer y = 2620
integer width = 311
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_imprimir_cartas)
end event

type dw_visual from datawindow within w_imprimir_cartas
integer x = 32
integer y = 36
integer width = 3525
integer height = 2540
integer taborder = 10
string title = "none"
string dataobject = "dw_fc_carta_73"
boolean controlmenu = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;String		ls_columna,ls_fono,ls_correo,ls_pasa_p,ls_pasa_letras,ls_visualiza
Long		ll_fono_p_largo,ll_hora_ingreso_cinerario,ll_minuto_ingreso_cinerario

dw_visual.accepttext()
ls_columna								= dwo.name
il_mod ++
if dw_visual.dataobject = 'dw_fc_servico_adquirido' then
	if ls_columna = 'visualizar_servicio' then
		ls_visualiza						= data
		if ls_visualiza = 'S' then
			dw_visual.setcolumn('fono')
		end if
	elseif ls_columna = 'fono' then
		ls_fono							= dw_visual.getitemstring(1,'fono')
		ll_fono_p_largo					= len(ls_fono)
		if ll_fono_p_largo > 0 and ls_fono <> '-' and ls_fono <>'' and not isnull(ls_fono) then 
			if ls_fono <> '' and ls_fono <> '-' and not isnull(ls_fono) then
				ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular')
				if ls_pasa_p='N' then
					dw_visual.scrolltorow(1)
					messagebox('Advertencia','Teléfono debe tener 9 Digitos',stopsign!)
					dw_visual.setitem(1,'fono','')
					dw_visual.setfocus()
					dw_visual.setcolumn('fono')
				else
					ls_pasa_letras 		= wf_validar_letras(ls_fono,'fono')
					if ls_pasa_letras = 'N' then
						dw_visual.scrolltorow(1)
						messagebox('Advertencia','Ingrese solo números',stopsign!)
						dw_visual.setitem(1,'fono','')
						dw_visual.accepttext()
						dw_visual.setfocus()
						dw_visual.setcolumn('fono')
					end if
				end if
			end if
		end if
	elseif ls_columna='correo_electronico' then
		ls_correo		= dw_visual.getitemstring(1,'correo_electronico')
		if ls_correo <> '' and ls_correo <> '-' and not isnull(ls_correo) then
			if Match(ls_correo, "@") then
			else
				messagebox('Advertencia','El Correo Electronico no es Válido',stopsign!)
				dw_visual.setitem(1,'correo_electronico','')
				dw_visual.accepttext()
				dw_visual.setfocus()
				dw_visual.setcolumn('correo_electronico')
			end if
		end if
	end if
end if

//HORA INGRESO CINERARIO
if dw_visual.dataobject = 'dw_registro_fallecido_cinerario' then
	if ls_columna = 'hora_ingreso_cinerario' then
		ll_hora_ingreso_cinerario = dw_visual.getitemNumber(1,'hora_ingreso_cinerario')
			if ll_hora_ingreso_cinerario < 9 OR ll_hora_ingreso_cinerario > 18 then
				messagebox('Advertencia','Esta fuera del rango de horario',stopsign!)
				dw_visual.setitem(1,'hora_ingreso_cinerario','')
				dw_visual.setfocus()
				dw_visual.setcolumn('hora_ingreso_cinerario')
			else
		end if
	elseif ls_columna = 'minuto_ingreso_cinerario' then
		ll_minuto_ingreso_cinerario = dw_visual.getitemNumber(1,'minuto_ingreso_cinerario')
			if ll_minuto_ingreso_cinerario > 59 then
				messagebox('Advertencia','Esta fuera del rango de horario',stopsign!)
				dw_visual.setitem(1,'minuto_ingreso_cinerario','')
				dw_visual.setfocus()
				dw_visual.setcolumn('minuto_ingreso_cinerario')
			else
		end if
	end if
	
//HORA RETIRO DISPOSITIVO
	if ls_columna = 'hora_retiro_dispositivo' then
		ll_hora_ingreso_cinerario = dw_visual.getitemNumber(1,'hora_retiro_dispositivo')
			if ll_hora_ingreso_cinerario < 9 OR ll_hora_ingreso_cinerario > 18 then
				messagebox('Advertencia','Esta fuera del rango de horario',stopsign!)
				dw_visual.setitem(1,'hora_retiro_dispositivo','')
				dw_visual.setfocus()
				dw_visual.setcolumn('hora_retiro_dispositivo')
			end if
	elseif ls_columna = 'minuto_retiro_dispositivo' then
		ll_minuto_ingreso_cinerario = dw_visual.getitemNumber(1,'minuto_retiro_dispositivo')
			if ll_minuto_ingreso_cinerario > 59 then
				messagebox('Advertencia','Esta fuera del rango de horario',stopsign!)
				dw_visual.setitem(1,'minuto_retiro_dispositivo','')
				dw_visual.setfocus()
				dw_visual.setcolumn('minuto_retiro_dispositivo')
			end if
	end if
end if
dw_visual.accepttext()
end event

event itemfocuschanged;String		ls_columna,ls_fono,ls_correo,ls_pasa_p,ls_pasa_letras
Long		ll_fono_p_largo,ll_hora_ingreso_cinerario,ll_minuto_ingreso_cinerario

dw_visual.accepttext()
//ls_columna							= dwo.name
if dw_visual.dataobject = 'dw_fc_servico_adquirido' then
	ls_fono							= dw_visual.getitemstring(1,'fono')
	ll_fono_p_largo					= len(ls_fono)
	if ll_fono_p_largo > 0 and ls_fono <> '-' and ls_fono <>'' and not isnull(ls_fono) then 
		if ls_fono <> '' and ls_fono <> '-' and not isnull(ls_fono) then
			ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular')
			if ls_pasa_p='N' then
				dw_visual.scrolltorow(1)
				dw_visual.setitem(1,'fono','')
				dw_visual.setfocus()
				dw_visual.setcolumn('fono')
			else
				ls_pasa_letras 		= wf_validar_letras(ls_fono,'fono')
				if ls_pasa_letras = 'N' then
					dw_visual.setitem(1,'fono','')
					dw_visual.accepttext()
					dw_visual.setfocus()
					dw_visual.setcolumn('fono')
				end if	
			end if
		end if
	end if
	ls_correo		= dw_visual.getitemstring(1,'correo_electronico')
	if len(ls_correo) > 0 then
		if Match(ls_correo, "@") then
		else
			dw_visual.setitem(1,'correo_electronico','')
			dw_visual.accepttext()
			dw_visual.setfocus()
			dw_visual.setcolumn('correo_electronico')
		end if	
	end if	
end if

if dw_visual.dataobject = 'dw_registro_fallecido_cinerario' then
//	if ls_columna = 'hora_ingreso_cinerario' then
		ll_hora_ingreso_cinerario = dw_visual.getitemNumber(1,'hora_ingreso_cinerario')
			if ll_hora_ingreso_cinerario < 9 or ll_hora_ingreso_cinerario > 18 then
//				messagebox('Advertencia','Esta fuera del rango de horario',stopsign!)
				dw_visual.setitem(1,'hora_ingreso_cinerario','')
				dw_visual.setfocus()
				dw_visual.setcolumn('hora_ingreso_cinerario')
			else
		end if
//	elseif ls_columna = 'minuto_ingreso_cinerario' then
		ll_minuto_ingreso_cinerario = dw_visual.getitemNumber(1,'minuto_ingreso_cinerario')
			if ll_minuto_ingreso_cinerario > 59 then
//				messagebox('Advertencia','Esta fuera del rango de horario',stopsign!)
				dw_visual.setitem(1,'minuto_ingreso_cinerario','')
				dw_visual.setfocus()
				dw_visual.setcolumn('minuto_ingreso_cinerario')
			else
		end if
//	end if
end if
dw_visual.accepttext()
end event

