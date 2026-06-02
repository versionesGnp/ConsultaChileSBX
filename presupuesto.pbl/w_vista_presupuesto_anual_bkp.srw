forward
global type w_vista_presupuesto_anual_bkp from window
end type
type cb_cerrar from commandbutton within w_vista_presupuesto_anual_bkp
end type
type cb_imprimir from commandbutton within w_vista_presupuesto_anual_bkp
end type
type dw_lista from datawindow within w_vista_presupuesto_anual_bkp
end type
type cb_1 from commandbutton within w_vista_presupuesto_anual_bkp
end type
end forward

global type w_vista_presupuesto_anual_bkp from window
integer width = 3552
integer height = 2520
boolean titlebar = true
string title = "Presupuesto Anual"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_cerrar cb_cerrar
cb_imprimir cb_imprimir
dw_lista dw_lista
cb_1 cb_1
end type
global w_vista_presupuesto_anual_bkp w_vista_presupuesto_anual_bkp

type variables
String		is_empresa
Long		il_anno,il_mes,il_parque
end variables

on w_vista_presupuesto_anual_bkp.create
this.cb_cerrar=create cb_cerrar
this.cb_imprimir=create cb_imprimir
this.dw_lista=create dw_lista
this.cb_1=create cb_1
this.Control[]={this.cb_cerrar,&
this.cb_imprimir,&
this.dw_lista,&
this.cb_1}
end on

on w_vista_presupuesto_anual_bkp.destroy
destroy(this.cb_cerrar)
destroy(this.cb_imprimir)
destroy(this.dw_lista)
destroy(this.cb_1)
end on

event open;string 	ls_descrip,ls_cod_mes,ls_grupo,ls_cod_grupo,ls_emp,ls_fecha,ls_nivel
long	 	ll_cod_parque,ll_cod_grupo,ll_new,ll_indi,ll_tot_reg,ll_ppto_x_mes,ll_ppto_tot_mes,ll_count,ll_num,ll_anno, & 
			ll_ppto_x_mes_01,ll_ppto_x_mes_02,ll_ppto_x_mes_03,ll_ppto_x_mes_04,ll_ppto_x_mes_05,ll_ppto_x_mes_06,ll_ppto_x_mes_07, &
			ll_ppto_x_mes_08,ll_ppto_x_mes_09,ll_ppto_x_mes_10,ll_ppto_x_mes_11,ll_ppto_x_mes_12,ll_real_mes_01,ll_real_mes_02,&
			ll_real_mes_03,ll_real_mes_04,ll_real_mes_05,ll_real_mes_06,ll_real_mes_07,ll_real_mes_08,ll_real_mes_09,ll_real_mes_10,&
			ll_real_mes_11,ll_real_mes_12
			
gf_centrar(w_vista_presupuesto_anual)
Connect Using Trans_3;
SetPointer(HourGlass!)
dw_lista.settransobject(Trans_3)

is_empresa					= substr(1,1,Message.StringParm)
//il_mes						= Long(substr(1,2,Message.StringParm))
il_anno						= Long(substr(1,3,Message.StringParm))
il_parque						= Long(substr(1,4,Message.StringParm))
ll_cod_parque				= il_parque

SELECT	"PRADO"."ENCARGADOS"."PRESUPUESTO_NIVEL"
INTO		:ls_nivel
FROM		"PRADO"."ENCARGADOS"
WHERE	"PRADO"."ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING 	sqlca;


SELECT		"GRL_EMPRES"."NOM_EMPRES"  
INTO	 		:ls_descrip  
FROM	 		"GRL_EMPRES"  
WHERE	 	"GRL_EMPRES"."COD_EMPRES" = :is_empresa;
if not isnull(ls_descrip) then
	w_vista_presupuesto_anual.title	= 'Vista Previa Presupuesto Anual '+ls_descrip+' Periodo de '+ string(il_anno)//+ ' Parque '+string(il_parque)
else
	w_vista_presupuesto_anual.title	= 'Vista Previa Presupuesto Periodo de '+ string(il_anno)
end if

if ll_cod_parque=0 then
	DECLARE x1 CURSOR FOR
	SELECT DISTINCT "PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"  
	FROM 		"PRESUPUESTO_CONSULTA"
	ORDER BY	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"
	USING		Trans_3;
else
	DECLARE x2 CURSOR FOR
	SELECT DISTINCT "PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"// ,"PRESUPUESTO_ACCESO"."CODIGO_ACCESO"
	FROM 		"PRESUPUESTO_CONSULTA"//,"PRESUPUESTO_ACCESO"
	WHERE		"PRESUPUESTO_CONSULTA"."COD_PARQUE"= :ll_cod_parque// and
	//				"PRESUPUESTO_ACCESO"."CODIGO_ACCESO" = :ls_nivel and
	//				"PRESUPUESTO_ACCESO"."COD_GRUPO"= "PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"
	ORDER BY	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"
	USING		Trans_3;
end if
if ll_cod_parque = 0 then
	open x1;
else 
	open x2;
end if
if Trans_3.sqlcode=0 then
	DO WHILE Trans_3.sqlcode=0
	if ll_cod_parque = 0 then
		fetch x1 INTO	:ll_cod_grupo;	
	else
		fetch x2 INTO	:ll_cod_grupo;	
	end if
	if not isnull(ll_cod_grupo) then
		if ll_cod_parque=0 then
			DECLARE x3 CURSOR FOR
			SELECT DISTINCT "PRESUPUESTO_CONSULTA"."GRUPO"  
			FROM 		"PRESUPUESTO_CONSULTA"
			WHERE		"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo
			ORDER BY	"PRESUPUESTO_CONSULTA"."GRUPO" DESC
			USING		Trans_3;
		else
			DECLARE x4 CURSOR FOR
			SELECT DISTINCT "PRESUPUESTO_CONSULTA"."GRUPO"  
			FROM 		"PRESUPUESTO_CONSULTA"
			WHERE		"PRESUPUESTO_CONSULTA"."COD_PARQUE"= :ll_cod_parque AND
							"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo
			ORDER BY	"PRESUPUESTO_CONSULTA"."GRUPO" DESC
			USING		Trans_3;
		end if
		if ll_cod_parque = 0 then
			open x3;
		else 
			open x4;
		end if
		if Trans_3.sqlcode=0 then
			DO WHILE Trans_3.sqlcode=0
			if ll_cod_parque = 0 then
				fetch x3 INTO	:ls_grupo;	
			else
				fetch x4 INTO	:ls_grupo;	
			end if	
				if not isnull(ls_grupo) then
					ll_new								= dw_lista.insertrow(0)
					dw_lista.scrolltorow(ll_new)
					SELECT "PRESUPUESTO_AGRUPACION"."DESCRIPCION"  
					INTO :ls_cod_grupo  
					FROM "PRESUPUESTO_AGRUPACION"  
					WHERE "PRESUPUESTO_AGRUPACION"."CODIGO" = :ll_cod_grupo   
					USING Trans_3;
					if Trans_3.sqlcode=0 then
						dw_lista.setitem(ll_new,"cod_grupo",ll_cod_grupo)
						dw_lista.setitem(ll_new,"grupo",ls_grupo)
						dw_lista.accepttext()
					end if
				end if
				setnull(ls_grupo)
			LOOP
		end if
		if ll_cod_parque = 0 then
			close x3;
		else 
			close x4;
		end if
	end if
	setnull(ll_cod_grupo)
	LOOP
end if
if ll_cod_parque = 0 then
	close x1;
else 
	close x2;
end if
ll_tot_reg								= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	ll_cod_grupo						=	dw_lista.getitemnumber(ll_indi,'cod_grupo')
	ls_grupo								=	dw_lista.getitemstring(ll_indi,'grupo')	
	ls_fecha								= 'Enero'
	ls_cod_mes							= '01'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_01, :ll_real_mes_01
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes ) AND
					(	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo) AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
				USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_01, :ll_real_mes_01
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes ) AND
					(	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo) AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_01) and not isnull(ll_real_mes_01) then
			ll_ppto_x_mes_01						= ll_ppto_x_mes_01
			ll_real_mes_01							= ll_real_mes_01
		else
			ll_ppto_x_mes_01						= 0
			ll_real_mes_01							= 0
		end if
	else
		ll_ppto_x_mes_01							= 0
		ll_real_mes_01								= 0
	end if	
	ls_fecha					= 'Febrero'
	ls_cod_mes				= '02'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_02, :ll_real_mes_02
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes ) AND
					(	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo) AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_02, :ll_real_mes_02
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes ) AND
					(	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo) AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_02) and not isnull(ll_real_mes_02) then
			ll_ppto_x_mes_02						= ll_ppto_x_mes_02
			ll_real_mes_02							= ll_real_mes_02	
		else
			ll_ppto_x_mes_02						= 0
			ll_real_mes_02							= 0
		end if
	else
		ll_ppto_x_mes_02							= 0
		ll_real_mes_02								= 0
	end if
	
	ls_fecha											= 'Marzo'
	ls_cod_mes										= '03'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_03, :ll_real_mes_03
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes ) AND
					( 	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo) AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_03, :ll_real_mes_03
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes ) AND
					(	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo) AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_03) and not isnull(ll_real_mes_03) then
			ll_ppto_x_mes_03						= ll_ppto_x_mes_03
			ll_real_mes_03							= ll_real_mes_03	
		else
			ll_ppto_x_mes_03						= 0
			ll_real_mes_03							= 0
		end if
	else
		ll_ppto_x_mes_03							= 0
		ll_real_mes_03								= 0
	end if
		
	ls_fecha					= 'Abril'
	ls_cod_mes				= '04'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_04, :ll_real_mes_04
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_04, :ll_real_mes_04
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_04) and not isnull(ll_real_mes_04) then
			ll_ppto_x_mes_04						= ll_ppto_x_mes_04
			ll_real_mes_04							= ll_real_mes_04
		else
			ll_ppto_x_mes_04						= 0
			ll_real_mes_04							= 0
		end if
	else
		ll_ppto_x_mes_04							= 0
		ll_real_mes_04								= 0
	end if	
		
	ls_fecha					= 'Mayo'
	ls_cod_mes				= '05'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_05, :ll_real_mes_05
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_05, :ll_real_mes_05
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_05) and not isnull(ll_real_mes_05) then
			ll_ppto_x_mes_05						= ll_ppto_x_mes_05
			ll_real_mes_05							= ll_real_mes_05
		else
			ll_ppto_x_mes_05						= 0
			ll_real_mes_05							= 0
		end if
	else
		ll_ppto_x_mes_05							= 0
		ll_real_mes_05								= 0
	end if
		
	ls_fecha					= 'Junio'
	ls_cod_mes				= '06'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_06, :ll_real_mes_06
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_06, :ll_real_mes_06
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_06) and not isnull(ll_real_mes_06) then
			ll_ppto_x_mes_06						= ll_ppto_x_mes_06
			ll_real_mes_06							= ll_real_mes_06		
		else
			ll_ppto_x_mes_06						= 0
			ll_real_mes_06							= 0
		end if
	else
		ll_ppto_x_mes_06							= 0
		ll_real_mes_06								= 0
	end if
	
	ls_fecha					= 'Julio'
	ls_cod_mes				= '07'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_07, :ll_real_mes_07
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_07, :ll_real_mes_07
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_07) and not isnull(ll_real_mes_07) then
			ll_ppto_x_mes_07						= ll_ppto_x_mes_07
			ll_real_mes_07							= ll_real_mes_07
		else
			ll_ppto_x_mes_07						= 0
			ll_real_mes_07							= 0
		end if
	else
		ll_ppto_x_mes_07							= 0
		ll_real_mes_07								= 0
	end if
		
	ls_fecha					= 'Agosto'
	ls_cod_mes				= '08'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_08, :ll_real_mes_08
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_08, :ll_real_mes_08
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_08) and not isnull(ll_real_mes_08) then
			ll_ppto_x_mes_08						= ll_ppto_x_mes_08
			ll_real_mes_08							= ll_real_mes_08		
		else
			ll_ppto_x_mes_08						= 0
			ll_real_mes_08							= 0
		end if
	else
		ll_ppto_x_mes_08							= 0
		ll_real_mes_08								= 0
	end if
		
	ls_fecha					= 'Septiembre'
	ls_cod_mes				= '09'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_09, :ll_real_mes_09
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_09, :ll_real_mes_09
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_09) and not isnull(ll_real_mes_09) then
			ll_ppto_x_mes_09						= ll_ppto_x_mes_09
			ll_real_mes_09							= ll_real_mes_09		
		else
			ll_ppto_x_mes_09						= 0
			ll_real_mes_09							= 0
		end if
	else
		ll_ppto_x_mes_09							= 0
		ll_real_mes_09								= 0
	end if
		
	ls_fecha					= 'Octubre'
	ls_cod_mes				= '10'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_10, :ll_real_mes_10
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_10, :ll_real_mes_10
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_10) and not isnull(ll_real_mes_10) then
			ll_ppto_x_mes_10						= ll_ppto_x_mes_10
			ll_real_mes_10							= ll_real_mes_10		
		else
			ll_ppto_x_mes_10						= 0
			ll_real_mes_10							= 0
		end if
	else
		ll_ppto_x_mes_10							= 0
		ll_real_mes_10								= 0
	end if
		
	ls_fecha					= 'Noviembre'
	ls_cod_mes				= '11'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_11, :ll_real_mes_11
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_11, :ll_real_mes_11
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_11) and not isnull(ll_real_mes_11) then
			ll_ppto_x_mes_11						= ll_ppto_x_mes_11
			ll_real_mes_11							= ll_real_mes_11		
		else
			ll_ppto_x_mes_11						= 0
			ll_real_mes_11							= 0
		end if
	else
		ll_ppto_x_mes_11							= 0
		ll_real_mes_11								= 0
	end if		
		
	ls_fecha					= 'Diciembre'
	ls_cod_mes				= '12'
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_12, :ll_real_mes_12
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES"), sum("PRESUPUESTO_CONSULTA"."REAL_MES")
		INTO		:ll_ppto_x_mes_12, :ll_real_mes_12
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
		if not isnull(ll_ppto_x_mes_12) and not isnull(ll_real_mes_12) then
			ll_ppto_x_mes_12						= ll_ppto_x_mes_12
			ll_real_mes_12							= ll_real_mes_12
		else
			ll_ppto_x_mes_12						= 0
			ll_real_mes_12							= 0
		end if
	else
		ll_ppto_x_mes_12							= 0
		ll_real_mes_12								= 0
	end if
	
	If ll_cod_parque=0 then
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")
		INTO		:ll_ppto_tot_mes
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
					(	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo)
		USING	Trans_3;
	else
		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")
		INTO		:ll_ppto_tot_mes
		FROM		"PRESUPUESTO_CONSULTA"
		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
		USING	Trans_3;
	end if
	if Trans_3.sqlcode=0 then
			if not isnull(ll_ppto_tot_mes) then
				ll_ppto_tot_mes						= ll_ppto_tot_mes
			else
				ll_ppto_tot_mes						= 0
			end if
	else
		ll_ppto_tot_mes							= 0
	end if
	dw_lista.setitem(ll_indi,"empresa",is_empresa)
	dw_lista.setitem(ll_indi,"anno",il_anno)
	dw_lista.setitem(ll_indi,"cod_parque",ll_cod_parque)
	
	dw_lista.setitem(ll_indi,"ppto_mes_1",ll_ppto_x_mes_01)
	dw_lista.setitem(ll_indi,"real_mes_1",ll_real_mes_01)
					
	dw_lista.setitem(ll_indi,"ppto_mes_2",ll_ppto_x_mes_02)
	dw_lista.setitem(ll_indi,"real_mes_2",ll_real_mes_02)
	
	dw_lista.setitem(ll_indi,"ppto_mes_3",ll_ppto_x_mes_03)
	dw_lista.setitem(ll_indi,"real_mes_3",ll_real_mes_03)
	
	dw_lista.setitem(ll_indi,"ppto_mes_4",ll_ppto_x_mes_04)
	dw_lista.setitem(ll_indi,"real_mes_4",ll_real_mes_04)
	
	dw_lista.setitem(ll_indi,"ppto_mes_5",ll_ppto_x_mes_05)
	dw_lista.setitem(ll_indi,"real_mes_5",ll_real_mes_05)
	
	dw_lista.setitem(ll_indi,"ppto_mes_6",ll_ppto_x_mes_06)
	dw_lista.setitem(ll_indi,"real_mes_6",ll_real_mes_06)
	
	dw_lista.setitem(ll_indi,"ppto_mes_7",ll_ppto_x_mes_07)
	dw_lista.setitem(ll_indi,"real_mes_7",ll_real_mes_07)
	
	dw_lista.setitem(ll_indi,"ppto_mes_8",ll_ppto_x_mes_08)
	dw_lista.setitem(ll_indi,"real_mes_8",ll_real_mes_08)
	
	dw_lista.setitem(ll_indi,"ppto_mes_9",ll_ppto_x_mes_09)
	dw_lista.setitem(ll_indi,"real_mes_9",ll_real_mes_09)
	
	dw_lista.setitem(ll_indi,"ppto_mes_10",ll_ppto_x_mes_10)
	dw_lista.setitem(ll_indi,"real_mes_10",ll_real_mes_10)
	
	dw_lista.setitem(ll_indi,"ppto_mes_11",ll_ppto_x_mes_11)
	dw_lista.setitem(ll_indi,"real_mes_11",ll_real_mes_11)
	
	dw_lista.setitem(ll_indi,"ppto_mes_12",ll_ppto_x_mes_12)
	dw_lista.setitem(ll_indi,"real_mes_12",ll_real_mes_12)
next
dw_lista.ScrollToRow(1)
end event

event close;//Disconnect Using Trans_3;
end event

type cb_cerrar from commandbutton within w_vista_presupuesto_anual_bkp
integer x = 3136
integer y = 2288
integer width = 361
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_vista_presupuesto_anual)
end event

type cb_imprimir from commandbutton within w_vista_presupuesto_anual_bkp
integer x = 50
integer y = 2288
integer width = 361
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	dw_lista.object.datawindow.Print.Preview	= true
	dw_lista.object.datawindow.zoom				= 35
	f_printdlg(dw_lista,gstr_print,w_vista_presupuesto_anual)
	dw_lista.object.datawindow.Print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type dw_lista from datawindow within w_vista_presupuesto_anual_bkp
integer x = 50
integer y = 40
integer width = 3447
integer height = 2188
integer taborder = 10
string title = "none"
string dataobject = "dwe_anual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_vista_presupuesto_anual_bkp
integer x = 553
integer y = 80
integer width = 256
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//string		ls_grupo,ls_cod_mes
//long		ll_cod_parque,ll_cod_grupo,ll_new,ll_tot_reg,ll_indi,ll_ppto_x_mes
//
//ll_cod_parque			= dw_lista.getitemnumber(1,'cod_parque')
//
//if ll_cod_parque=0 then
//	DECLARE x1 CURSOR FOR
//	SELECT DISTINCT "PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"  
//	FROM 		"PRESUPUESTO_CONSULTA"
//	ORDER BY	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"
//	USING		Trans_3;
//else
//	DECLARE x2 CURSOR FOR
//	SELECT DISTINCT "PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"  
//	FROM 		"PRESUPUESTO_CONSULTA"
//	WHERE		"PRESUPUESTO_CONSULTA"."COD_PARQUE"= :ll_cod_parque
//	ORDER BY	"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"
//	USING		Trans_3;
//end if
//if ll_cod_parque = 0 then
//	open x1;
//else 
//	open x2;
//end if
//if Trans_3.sqlcode=0 then
//	DO WHILE Trans_3.sqlcode=0
//	if ll_cod_parque = 0 then
//		fetch x1 INTO	:ll_cod_grupo;	
//	else
//		fetch x2 INTO	:ll_cod_grupo;	
//	end if
//	if not isnull(ll_cod_grupo) then
//		if ll_cod_parque=0 then
//			DECLARE x3 CURSOR FOR
//			SELECT DISTINCT "PRESUPUESTO_CONSULTA"."GRUPO"  
//			FROM 		"PRESUPUESTO_CONSULTA"
//			WHERE		"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo
//			ORDER BY	"PRESUPUESTO_CONSULTA"."GRUPO"
//			USING		Trans_3;
//		else
//			DECLARE x4 CURSOR FOR
//			SELECT DISTINCT "PRESUPUESTO_CONSULTA"."GRUPO"  
//			FROM 		"PRESUPUESTO_CONSULTA"
//			WHERE		"PRESUPUESTO_CONSULTA"."COD_PARQUE"= :ll_cod_parque AND
//							"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo
//			ORDER BY	"PRESUPUESTO_CONSULTA"."GRUPO"
//			USING		Trans_3;
//		end if
//		if ll_cod_parque = 0 then
//			open x3;
//		else 
//			open x4;
//		end if
//		if Trans_3.sqlcode=0 then
//			DO WHILE Trans_3.sqlcode=0
//			if ll_cod_parque = 0 then
//				fetch x3 INTO	:ls_grupo;	
//			else
//				fetch x4 INTO	:ls_grupo;	
//			end if	
//				if not isnull(ls_grupo) then
//					ll_new								= dw_lista.insertrow(0)
//					dw_lista.scrolltorow(ll_new)
//					dw_lista.setitem(ll_new,"cod_grupo",ll_cod_grupo)
//					dw_lista.setitem(ll_new,"grupo",ls_grupo)
//					dw_lista.accepttext()
//				end if
//				setnull(ls_grupo)
//			LOOP
//		end if
//		if ll_cod_parque = 0 then
//			close x3;
//		else 
//			close x4;
//		end if
//	end if
//	setnull(ll_cod_grupo)
//	LOOP
//end if
//if ll_cod_parque = 0 then
//	close x1;
//else 
//	close x2;
//end if
//
//ll_tot_reg										= dw_lista.rowcount()
//for ll_indi=1 to ll_tot_reg
//	If ll_cod_parque=0 then
//		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")
//		INTO		:ll_ppto_x_mes
//		FROM		"PRESUPUESTO_CONSULTA"
//		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
//					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
//					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
//					"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
//					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) 
//		USING	Trans_3;
//	else
//		SELECT 	sum("PRESUPUESTO_CONSULTA"."PPTO_MES")
//		INTO		:ll_ppto_x_mes
//		FROM		"PRESUPUESTO_CONSULTA"
//		WHERE 	(	"PRESUPUESTO_CONSULTA"."ANNO" = :il_anno) AND
//					(	"PRESUPUESTO_CONSULTA"."COD_EMP" = :is_empresa) AND
//					(	"PRESUPUESTO_CONSULTA"."COD_MES" = :ls_cod_mes )AND
//						"PRESUPUESTO_CONSULTA"."CODIGO_GRUPO"= :ll_cod_grupo AND
//					(	"PRESUPUESTO_CONSULTA"."GRUPO" = :ls_grupo ) AND
//					(	"PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_cod_parque )
//		USING	Trans_3;
//	end if
//	if Trans_3.sqlcode=0 then
//		if not isnull(ll_ppto_x_mes) then
//			ll_ppto_x_mes						= ll_ppto_x_mes
//		else
//			ll_ppto_x_mes						= 0
//		end if
//	else
//		ll_ppto_x_mes							= 0
//	end if
//next
//		
//	
end event

