forward
global type w_lista_fallecidos from window
end type
type st_1 from statictext within w_lista_fallecidos
end type
type ddlb_filtro from dropdownlistbox within w_lista_fallecidos
end type
type cb_5 from commandbutton within w_lista_fallecidos
end type
type cb_4 from commandbutton within w_lista_fallecidos
end type
type cb_3 from commandbutton within w_lista_fallecidos
end type
type cb_2 from commandbutton within w_lista_fallecidos
end type
type cb_cta_cte from commandbutton within w_lista_fallecidos
end type
type cb_todos from commandbutton within w_lista_fallecidos
end type
type cb_buscar from commandbutton within w_lista_fallecidos
end type
type cb_cerrar from commandbutton within w_lista_fallecidos
end type
type cb_actualizar from commandbutton within w_lista_fallecidos
end type
type cb_editar from commandbutton within w_lista_fallecidos
end type
type cb_ingresar from commandbutton within w_lista_fallecidos
end type
type dw_listado_fallecidos from datawindow within w_lista_fallecidos
end type
type cb_1 from commandbutton within w_lista_fallecidos
end type
type gb_1 from groupbox within w_lista_fallecidos
end type
end forward

global type w_lista_fallecidos from window
integer x = 206
integer y = 424
integer width = 3685
integer height = 1564
boolean titlebar = true
string title = "Listado de Fallecidos"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 79741120
event carga pbm_custom01
st_1 st_1
ddlb_filtro ddlb_filtro
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_cta_cte cb_cta_cte
cb_todos cb_todos
cb_buscar cb_buscar
cb_cerrar cb_cerrar
cb_actualizar cb_actualizar
cb_editar cb_editar
cb_ingresar cb_ingresar
dw_listado_fallecidos dw_listado_fallecidos
cb_1 cb_1
gb_1 gb_1
end type
global w_lista_fallecidos w_lista_fallecidos

type variables
datawindow	idw_paso
end variables

on w_lista_fallecidos.create
this.st_1=create st_1
this.ddlb_filtro=create ddlb_filtro
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_cta_cte=create cb_cta_cte
this.cb_todos=create cb_todos
this.cb_buscar=create cb_buscar
this.cb_cerrar=create cb_cerrar
this.cb_actualizar=create cb_actualizar
this.cb_editar=create cb_editar
this.cb_ingresar=create cb_ingresar
this.dw_listado_fallecidos=create dw_listado_fallecidos
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.ddlb_filtro,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_cta_cte,&
this.cb_todos,&
this.cb_buscar,&
this.cb_cerrar,&
this.cb_actualizar,&
this.cb_editar,&
this.cb_ingresar,&
this.dw_listado_fallecidos,&
this.cb_1,&
this.gb_1}
end on

on w_lista_fallecidos.destroy
destroy(this.st_1)
destroy(this.ddlb_filtro)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_cta_cte)
destroy(this.cb_todos)
destroy(this.cb_buscar)
destroy(this.cb_cerrar)
destroy(this.cb_actualizar)
destroy(this.cb_editar)
destroy(this.cb_ingresar)
destroy(this.dw_listado_fallecidos)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event resize;gf_ajustar_a_ventana(w_lista_fallecidos, dw_listado_fallecidos)
end event

event open;string serie,estado,base,ls_usuario
long i,numero,ll_cod_parque

SetPointer(HourGlass!)
//gf_centrar(w_lista_fallecidos)

ll_cod_parque								= gl_cod_parque
ls_usuario									= gs_user

if gs_depto='I' then
	dw_listado_fallecidos.dataobject	= 'd_listado_fallecidos_general_informatica'
else
	dw_listado_fallecidos.dataobject	= 'd_listado_fallecidos_general'
end if
dw_listado_fallecidos.SetTransObject(SQLCA)
if gs_depto='I' then
	dw_listado_fallecidos.Retrieve('E')
else
	SELECT	"ENCARGADOS"."COD_PARQUE"  
	INTO 		:ll_cod_parque  
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if ll_cod_parque = 9999 then
			dw_listado_fallecidos.dataobject	= 'd_listado_fallecidos_general_informatica'
			dw_listado_fallecidos.SetTransObject(SQLCA)
			dw_listado_fallecidos.Retrieve('E')
		elseif 	ll_cod_parque = 103 then
			dw_listado_fallecidos.dataobject	= 'd_listado_fallecidos_general_santiago'
			dw_listado_fallecidos.SetTransObject(SQLCA)
			dw_listado_fallecidos.Retrieve('E')
		else
			gl_cod_parque				= ll_cod_parque
			dw_listado_fallecidos.Retrieve('E',ll_cod_parque)
		end if
	else
		messagebox("Advertencia","Usuario No Tiene Parque Asociado")
		Setnull(gl_cod_parque);Setnull(ll_cod_parque)
	end if
end if
SetPointer(Arrow!)
ddlb_filtro.text = 'E - No Existe'
end event

type st_1 from statictext within w_lista_fallecidos
integer x = 389
integer y = 156
integer width = 521
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Seleccione Estado Ctto."
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_filtro from dropdownlistbox within w_lista_fallecidos
integer x = 923
integer y = 136
integer width = 800
integer height = 892
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"C - Cancelado","P - Nulo x Reprogramación","N - Resciliada","R - Resuelta","V - Vigente","E - No existe","T - Todos","F - Fosa Común","G - Vigente No Gestionado"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;long	ll_cod_parque
string	ls_usuario,ls_nombre,ls_nombre_usr


//cb_6.triggerevent (clicked!)

ll_cod_parque								= gl_cod_parque
ls_usuario									= gs_user
ls_nombre									= gs_nom_cod_parque
ls_nombre_usr								= gs_nom_comp_usuario


SetPointer(HourGlass!)
CHOOSE CASE mid(ddlb_filtro.text,1,1)
	CASE 'C'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('C')
		else
			dw_listado_fallecidos.retrieve('C',gl_cod_parque)
		end if
	CASE 'P'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('P')
		else
			dw_listado_fallecidos.retrieve('P',gl_cod_parque)
		end if
	CASE 'N'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('N')
		else
			dw_listado_fallecidos.retrieve('N',gl_cod_parque)
		end if
	CASE 'R'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('R')
		else
			dw_listado_fallecidos.retrieve('R',gl_cod_parque)
		end if
	CASE 'V'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('V')
		else
			dw_listado_fallecidos.retrieve('V',gl_cod_parque)
		end if
	CASE 'E'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('E')
		else
			dw_listado_fallecidos.retrieve('E',gl_cod_parque)
		end if
	CASE 'T'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('%')
		else
			dw_listado_fallecidos.retrieve('%',gl_cod_parque)
		end if
	CASE 'F'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('F')
		else
			dw_listado_fallecidos.retrieve('F',gl_cod_parque)
		end if
	CASE 'G'
		if gs_depto='I' then
			dw_listado_fallecidos.retrieve('G')
		else
			dw_listado_fallecidos.retrieve('G',gl_cod_parque)
		end if
END CHOOSE
SetPointer(Arrow!)

end event

type cb_5 from commandbutton within w_lista_fallecidos
integer x = 41
integer y = 136
integer width = 320
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Elimina Reg."
end type

event clicked;string 	indice_elimina,LS_VAR,ls_estado_ctto
Long		ll_res,ll_llave,ll_folio,ll_edad,ll_cod_parque,ll_n_l,ll_n_m,ll_rut,ll_llave_anterior_s,ll_folio_encuesta_s,ll_covid_s,ll_ubicacion_cuerpo_s
datetime	ldt_fec_sep,ldt_fec_nac,ldt_fec_fall,ldt_fecha_ult_mod_s,ldt_fecha_exhum_s,ldt_fecha_inhuma_s,ldt_fecha_ti_s,ldt_fecha_te_s,ldt_fecha_re_s,ldt_fecha_tr_s,&
			ldt_fecha_crem_s,ldt_fecha_crea_s
String	ls_nombre,ls_ap_pat,ls_ap_mat,ls_base,ls_serie,ls_sector,ls_n_sep,ls_est,ls_op,ls_dv,ls_sexo,ls_periodo,ls_pase,ls_reg_civil,ls_causa_fall,ls_enf_obl,ls_funeraria,ls_boleta,ls_carta_aut,&
			ls_rg_est,ls_n_tec,ls_nivel,ls_vta,ls_obs,ls_est_ctto,ls_resol_tras,ls_otorgado,ls_cementerio_ori,ls_nro_sarcofago_s,ls_cod_usuario_s,ls_usuario_ult_mod,&
			ls_estado_exhum_s,ls_estado_inhuma_s,ls_estado_ti_s,ls_estado_te_s,ls_estado_re_s,ls_estado_tr_s,ls_estado_crem_s,ls_estado_reg_s,ls_estado_fall_s,ls_base_dest_s,ls_serie_dest_s,&
			ls_usuario_crea_s,ls_tipo_ficha_s
Double	ll_numero,ll_numero_dest_s
indice_elimina	= string(dw_listado_fallecidos.getitemnumber(dw_listado_fallecidos.getrow(),'llave'),'###,###,###')
ll_llave			= dw_listado_fallecidos.getitemnumber(dw_listado_fallecidos.getrow(),'llave')
ls_estado_ctto	= dw_listado_fallecidos.getitemstring(dw_listado_fallecidos.getrow(),'estado')
if ls_estado_ctto='F' then
	messagebox("Advertencia","No Es Posible Eliminar Fallecido de FOSA COMUN")
else
	open (w_eliminar)
	LS_VAR 			= Message.StringParm
	if LS_VAR <> 'XX1' then return

	if messagebox('Inactivar Registro','Desea Inactivar Llave Nº :'+ indice_elimina,information!,yesNo!,2) = 1 then
		SELECT DISTINCT	"FALLECIDOS"."FOLIO",	"FALLECIDOS"."N_L",	"FALLECIDOS"."N_M",	"FALLECIDOS"."BASE",	"FALLECIDOS"."SS",	"FALLECIDOS"."CONTRATO",	"FALLECIDOS"."SECTOR",	"FALLECIDOS"."N_SEP",	"FALLECIDOS"."NOMBRES",	"FALLECIDOS"."AP_PATERNO",	"FALLECIDOS"."AP_MATERNO",	"FALLECIDOS"."FEC_SEP",	"FALLECIDOS"."EST",	"FALLECIDOS"."OP",	"FALLECIDOS"."RUT",	"FALLECIDOS"."DV",	"FALLECIDOS"."SEXO",	"FALLECIDOS"."EDAD",	"FALLECIDOS"."PERIODO",	"FALLECIDOS"."FEC_NAC",	"FALLECIDOS"."FEC_FALL",	"FALLECIDOS"."PASE",	"FALLECIDOS"."REG_CIVIL",	"FALLECIDOS"."CAUSA_FALL",	"FALLECIDOS"."ENF_OBL",	"FALLECIDOS"."FUNERARIA",	"FALLECIDOS"."BOLETA",	"FALLECIDOS"."CARTA_AUT",	"FALLECIDOS"."RG_EST",	"FALLECIDOS"."N_TEC",	"FALLECIDOS"."NIVEL",	"FALLECIDOS"."VTA",	"FALLECIDOS"."OBSERVACIONES",	"FALLECIDOS"."ESTADO_CONTRATO",	"FALLECIDOS"."RESOLUCION_TRASLADO_NRO",	"FALLECIDOS"."OTORGADO_POR",	"FALLECIDOS"."CEMENTERIO_ORIGEN",	"FALLECIDOS"."COD_PARQUE",		"FALLECIDOS"."LLAVE_ANTERIOR",	"FALLECIDOS"."NRO_SARCOFAGO",	"FALLECIDOS"."COD_USUARIO",	"FALLECIDOS"."USUARIO_ULT_MOD",		"FALLECIDOS"."FECHA_ULT_MOD",		"FALLECIDOS"."FOLIO_ENCUESTA",	"FALLECIDOS"."COVID",		"FALLECIDOS"."UBICACION_CUERPO",	"FALLECIDOS"."ESTADO_EXHUMACION",		"FALLECIDOS"."FECHA_EXHUMACION",		"FALLECIDOS"."ESTADO_INHUMACION",		"FALLECIDOS"."FECHA_INHUMACION",	"FALLECIDOS"."ESTADO_TRASLADO_INTERNO",	"FALLECIDOS"."FECHA_TRASLADO_INTERNO",		"FALLECIDOS"."ESTADO_TRASLADO_EXTERNO",	"FALLECIDOS"."FECHA_TRASLADO_EXTERNO",		"FALLECIDOS"."ESTADO_REDUCCION",	"FALLECIDOS"."FECHA_REDUCCION",	"FALLECIDOS"."ESTADO_EN_TRANSITO",	"FALLECIDOS"."FECHA_EN_TRANSITO",		"FALLECIDOS"."ESTADO_CREMATORIO",		"FALLECIDOS"."FECHA_CREMATORIO",	"FALLECIDOS"."ESTADO_REG",		"FALLECIDOS"."ESTADO_FALLECIDO",	"FALLECIDOS"."BASE_DESTINO",	"FALLECIDOS"."SERIE_DESTINO",		"FALLECIDOS"."NUMERO_DESTINO",		"FALLECIDOS"."USUARIO_CREA",		"FALLECIDOS"."FECHA_CREA",		"FALLECIDOS"."TIPO_FICHA"
		INTO					:ll_folio,						:ll_n_l,					:ll_n_m,					:ls_base,						:ls_serie,					:ll_numero,							:ls_sector,						:ls_n_sep,					:ls_nombre,						:ls_ap_pat,							:ls_ap_mat,							:ldt_fec_sep,					:ls_est, 					:ls_op,					:ll_rut,					:ls_dv,					:ls_sexo,						:ll_edad,						:ls_periodo,						:ldt_fec_nac,					:ldt_fec_fall,   					:ls_pase,						:ls_reg_civil,					:ls_causa_fall,						:ls_enf_obl,						:ls_funeraria,						:ls_boleta,						:ls_carta_aut,						:ls_rg_est,						:ls_n_tec,					:ls_nivel,						:ls_vta,					:ls_obs, 										:ls_est_ctto,										:ls_resol_tras,												:ls_otorgado,							:ls_cementerio_ori,							:ll_cod_parque,							:ll_llave_anterior_s,						:ls_nro_sarcofago_s,						:ls_cod_usuario_s,						:ls_usuario_ult_mod,							:ldt_fecha_ult_mod_s,						:ll_folio_encuesta_s,						:ll_covid_s,						:ll_ubicacion_cuerpo_s,						:ls_estado_exhum_s,								:ldt_fecha_exhum_s,								:ls_estado_inhuma_s,								:ldt_fecha_inhuma_s,							:ls_estado_ti_s,											:ldt_fecha_ti_s,												:ls_estado_te_s,											:ldt_fecha_te_s,											:ls_estado_re_s,								:ldt_fecha_re_s,							:ls_estado_tr_s,									:ldt_fecha_tr_s,									:ls_estado_crem_s,								:ldt_fecha_crem_s,							:ls_estado_reg_s,						:ls_estado_fall_s,								:ls_base_dest_s,						:ls_serie_dest_s,							:ll_numero_dest_s,							:ls_usuario_crea_s,						:ldt_fecha_crea_s,						:ls_tipo_ficha_s
		FROM 	"FALLECIDOS"  
		WHERE 	"FALLECIDOS"."LLAVE" = :ll_llave   
		USING	sqlca;
		if sqlca.sqlcode=0 then
			INSERT INTO "LOG_FALLECIDOS"  
						 ( "LLAVE",	"FOLIO",	"N_L",		"N_M",	"BASE",	"SS",		"CONTRATO",	"SECTOR",	"N_SEP",		"NOMBRES",	"AP_PATERNO",	"AP_MATERNO",	"FEC_SEP",		"EST",	"OP",		"RUT",	"DV",		"SEXO",		"EDAD",		"PERIODO",		"FEC_NAC",		"FEC_FALL",		"PASE",		"REG_CIVIL",	"CAUSA_FALL",		"ENF_OBL",		"FUNERARIA",	"BOLETA",	"CARTA_AUT",	"RG_EST",	"N_TEC",		"NIVEL",		"VTA",	"OBSERVACIONES",	"ESTADO_CONTRATO",	"RESOLUCION_TRASLADO_NRO",	"OTORGADO_POR",	"CEMENTERIO_ORIGEN",	"COD_PARQUE",	"USUARIO_CREA",		"MOTIVO_CREA",	"LLAVE_ANTERIOR",	"NRO_SARCOFAGO",	"COD_USUARIO",		"USUARIO_ULT_MOD",	"FECHA_ULT_MOD",		"FOLIO_ENCUESTA",	"COVID",		"UBICACION_CUERPO",	"ESTADO_EXHUMACION",		"FECHA_EXHUMACION",		"ESTADO_INHUMACION",		"FECHA_INHUMACION",	"ESTADO_TRASLADO_INTERNO",	"FECHA_TRASLADO_INTERNO",	"ESTADO_TRASLADO_EXTERNO",	"FECHA_TRASLADO_EXTERNO",	"ESTADO_REDUCCION",	"FECHA_REDUCCION",	"ESTADO_EN_TRANSITO",	"FECHA_EN_TRANSITO",		"ESTADO_CREMATORIO",		"FECHA_CREMATORIO",	"ESTADO_REG",		"ESTADO_FALLECIDO",	"BASE_DESTINO",	"SERIE_DESTINO",		"NUMERO_DESTINO",		"FECHA_CREA",		"TIPO_FICHA" )  
			VALUES 	 ( :ll_llave,	:ll_folio,	:ll_n_l,	:ll_n_m,	:ls_base,	:ls_serie,	:ll_numero,		:ls_sector,	:ls_n_sep,	:ls_nombre,	:ls_ap_pat,			:ls_ap_mat,			:ldt_fec_sep,	:ls_est, 	:ls_op,	:ll_rut,	:ls_dv,	:ls_sexo,		:ll_edad,		:ls_periodo,		:ldt_fec_nac,	:ldt_fec_fall, 	:ls_pase,		:ls_reg_civil,	:ls_causa_fall,		:ls_enf_obl,		:ls_funeraria,	:ls_boleta,	:ls_carta_aut,	:ls_rg_est,	:ls_n_tec,	:ls_nivel,		:ls_vta,	:ls_obs, 					:ls_est_ctto,					:ls_resol_tras,							:ls_otorgado,			:ls_cementerio_ori,		:ll_cod_parque,		:gs_user,				'I',						:ll_llave_anterior_s,	:ls_nro_sarcofago_s,	:ls_cod_usuario_s,		:ls_usuario_ult_mod,		:ldt_fecha_ult_mod_s,	:ll_folio_encuesta_s,	:ll_covid_s,	:ll_ubicacion_cuerpo_s,	:ls_estado_exhum_s,				:ldt_fecha_exhum_s,			:ls_estado_inhuma_s,				:ldt_fecha_inhuma_s,		:ls_estado_ti_s,						:ldt_fecha_ti_s,							:ls_estado_te_s,						:ldt_fecha_te_s,						:ls_estado_re_s,			:ldt_fecha_re_s,			:ls_estado_tr_s,				:ldt_fecha_tr_s,				:ls_estado_crem_s,				:ldt_fecha_crem_s,		:ls_estado_reg_s,		:ls_estado_fall_s,			:ls_base_dest_s,	:ls_serie_dest_s,		:ll_numero_dest_s,		:ldt_fecha_crea_s,		'M' )  
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
				messagebox("Error Grabar","Error al Grabar Log_Fallecido SQL: "+sqlca.sqlerrtext)
			end if
		else
			messagebox("Advertencia","No Existe Fallecido LLave Nº "+string(ll_llave,'###,###,###,###,###'))
		end if
		dw_listado_fallecidos.setitem(dw_listado_fallecidos.getrow(),'estado_reg','I')
		dw_listado_fallecidos.accepttext()
//		dw_listado_fallecidos.deleterow(dw_listado_fallecidos.getrow())
		if dw_listado_fallecidos.update()=1 then
			commit;
			messagebox("Eliminar Fallecido","Eliminación Fallecido Exitoso")
		else
			rollback;
		end if
	end if
end if
end event

type cb_4 from commandbutton within w_lista_fallecidos
integer x = 2176
integer y = 136
integer width = 274
integer height = 92
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "* &Rut"
end type

event clicked;gi_rut				= 0
gs_base     		= dw_listado_fallecidos.getitemstring(dw_listado_fallecidos.getrow(),'base')
gs_serie    		= dw_listado_fallecidos.getitemstring(dw_listado_fallecidos.getrow(),'ss')
gi_numero 			= dw_listado_fallecidos.getitemnumber(dw_listado_fallecidos.getrow(),'contrato')
SELECT	"CADENA"."RUT"  
into 		:gi_rut   
from 		"CADENA"
WHERE  ( "CADENA"."CODIGO" = :gs_base) AND  
		 ( "CADENA"."SERIE" = :gs_serie) AND  
		 ( "CADENA"."NUMERO" = :gi_numero )   ;
gi_tipo_busqueda	= 1
open(w_listado_contratos_2)
end event

type cb_3 from commandbutton within w_lista_fallecidos
integer x = 2967
integer y = 140
integer width = 265
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;//SaveAsType TipoArchivo
//string	Archivo
//boolean 	encabezado
//integer 	ret
//TipoArchivo	= excel8!
//Archivo 		= 'sepultado.xlsx'
//If FileExists(Archivo) Then
//	Ret 		= MessageBox("Archivo Existe", "Desea Reemplazar el Archivo Existente?", Exclamation!, YesNo!, 2)
//	If Ret = 2 Then
//		Close(Parent)
//		Return
//	End If
//End If
//Ret 			= dw_listado_fallecidos.SaveAs( Archivo,TipoArchivo, true)
//If Ret < 0  Then
//	MessageBox("Operación sin Exito", "No fue posible Grabar Contenido de la DataWindow en un Archivo.", Exclamation!)
//End If

dw_listado_fallecidos.accepttext()
idw_paso 			= dw_listado_fallecidos
f_DWToExcel( idw_paso)
end event

type cb_2 from commandbutton within w_lista_fallecidos
integer x = 2757
integer y = 140
integer width = 206
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtro"
end type

event clicked;string nulo
Setnull (nulo)
dw_listado_fallecidos.setfilter(nulo)
dw_listado_fallecidos.filter()


end event

type cb_cta_cte from commandbutton within w_lista_fallecidos
integer x = 1833
integer y = 136
integer width = 338
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuen&ta Cte."
end type

event clicked;IF gi_numero > 0 AND gs_base <> "" AND gs_serie <> "" THEN
	CHOOSE CASE gs_base
		CASE "O","U" // Oferta
			Open(w_cuenta_corriente_oferta)
		CASE "L" // Anexo Liberador
			Open(w_cuenta_corriente_liberador)
		CASE "P" // Pagaré
			Open(w_cuenta_corriente_pagare)
		CASE "C" // Contrato ISA	
			Open(w_cuenta_corriente_contrato_isa)
		CASE "D" // Derecho Especial
			Open(w_cuenta_corriente_derecho)
		CASE "A"
			Open(w_cuenta_corriente_aumento_capacidad)
		CASE "R"
			Open(w_cuenta_corriente_repactar_cta_mant)
	END CHOOSE
END IF

end event

type cb_todos from commandbutton within w_lista_fallecidos
boolean visible = false
integer x = 1833
integer y = 36
integer width = 338
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Todos"
end type

event clicked;
//gi_tipo_busqueda = 4
//gs_apellido_paterno =  "%"
//gs_apellido_materno =  "%"
//gs_nombres =  "%"
//gs_sector =  "%"
//gs_sepultura =  "%"
//gi_rut = 0
//
//dw_listado_fallecidos.Retrieve(gi_rut,gs_apellido_paterno,gs_apellido_materno,gs_nombres,gs_sector,gs_sepultura)
//
end event

type cb_buscar from commandbutton within w_lista_fallecidos
boolean visible = false
integer x = 1385
integer y = 36
integer width = 338
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "C&onsultar"
end type

event clicked;Open(w_consultar_x_fallecido)
//dw_listado_fallecidos.Retrieve(gi_rut,gs_apellido_paterno,gs_apellido_materno,gs_nombres,gs_sector,gs_sepultura)
//dw_listado_fallecidos.retrieve('%')
end event

type cb_cerrar from commandbutton within w_lista_fallecidos
integer x = 3319
integer y = 136
integer width = 279
integer height = 92
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;Close(w_lista_fallecidos)
end event

type cb_actualizar from commandbutton within w_lista_fallecidos
boolean visible = false
integer x = 2176
integer y = 36
integer width = 274
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Actualiza"
end type

event clicked;
//dw_listado_fallecidos.Retrieve(gi_rut,gs_apellido_paterno,gs_apellido_materno,gs_nombres,gs_sector,gs_sepultura)
end event

type cb_editar from commandbutton within w_lista_fallecidos
integer x = 366
integer y = 36
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&ditar"
end type

event clicked;IF dw_listado_fallecidos.getrow() > 0 THEN
	gi_llave 		= dw_listado_fallecidos.GetItemNumber(dw_listado_fallecidos.getrow(), "llave")
	gs_base 		= dw_listado_fallecidos.GetItemString(dw_listado_fallecidos.getrow(), "base")
	gs_serie 		= dw_listado_fallecidos.GetItemString(dw_listado_fallecidos.getrow(), "ss")
	gi_numero 	= dw_listado_fallecidos.GetItemNumber(dw_listado_fallecidos.getrow(), "contrato")
END IF
Open(w_ingreso_fallecimiento)
end event

type cb_ingresar from commandbutton within w_lista_fallecidos
integer x = 41
integer y = 36
integer width = 320
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ingresar"
end type

event clicked;gi_llave = 0
Open(w_ingreso_fallecimiento)
end event

type dw_listado_fallecidos from datawindow within w_lista_fallecidos
integer x = 32
integer y = 268
integer width = 3561
integer height = 1108
integer taborder = 110
string dataobject = "d_listado_fallecidos_general"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(Row, TRUE)
	gi_llave		= This.GetItemNumber(row, "llave")
	gs_base 		= This.GetItemString(row, "base")
	gs_serie 	= This.GetItemString(row, "ss")
	gi_numero 	= This.GetItemNumber(row, "contrato")
END IF
end event

event doubleclicked;IF gi_llave > 0 and row > 0 THEN 
	cb_editar.TriggerEvent(Clicked!)
END IF
end event

event rowfocuschanged;IF this.getrow() > 0 THEN
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	gi_llave 	= This.GetItemNumber(getrow(), "llave")
	gs_base 		= This.GetItemString(getrow(), "base")
	gs_serie 	= This.GetItemString(getrow(), "ss")
	gi_numero 	= This.GetItemNumber(getrow(), "contrato")
END IF
end event

type cb_1 from commandbutton within w_lista_fallecidos
integer x = 2546
integer y = 140
integer width = 206
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
setnull(nulo)
dw_listado_fallecidos.setsort(nulo)
dw_listado_fallecidos.sort()
end event

type gb_1 from groupbox within w_lista_fallecidos
integer x = 2519
integer y = 88
integer width = 741
integer height = 156
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

