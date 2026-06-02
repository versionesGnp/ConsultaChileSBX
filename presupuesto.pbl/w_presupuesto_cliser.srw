forward
global type w_presupuesto_cliser from window
end type
type cb_exportar from commandbutton within w_presupuesto_cliser
end type
type em_anno from editmask within w_presupuesto_cliser
end type
type st_4 from statictext within w_presupuesto_cliser
end type
type ddlb_parque from dropdownlistbox within w_presupuesto_cliser
end type
type cb_vista_anual from commandbutton within w_presupuesto_cliser
end type
type cb_vista from commandbutton within w_presupuesto_cliser
end type
type st_3 from statictext within w_presupuesto_cliser
end type
type pb_ok from picturebutton within w_presupuesto_cliser
end type
type st_2 from statictext within w_presupuesto_cliser
end type
type ddlb_empresa from dropdownlistbox within w_presupuesto_cliser
end type
type st_1 from statictext within w_presupuesto_cliser
end type
type cb_cerrar from commandbutton within w_presupuesto_cliser
end type
type ddlb_mes from dropdownlistbox within w_presupuesto_cliser
end type
type dw_lista from datawindow within w_presupuesto_cliser
end type
end forward

global type w_presupuesto_cliser from window
integer width = 3538
integer height = 2240
boolean titlebar = true
string title = "Presupuesto"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_exportar cb_exportar
em_anno em_anno
st_4 st_4
ddlb_parque ddlb_parque
cb_vista_anual cb_vista_anual
cb_vista cb_vista
st_3 st_3
pb_ok pb_ok
st_2 st_2
ddlb_empresa ddlb_empresa
st_1 st_1
cb_cerrar cb_cerrar
ddlb_mes ddlb_mes
dw_lista dw_lista
end type
global w_presupuesto_cliser w_presupuesto_cliser

event open;String		ls_cod,ls_nom_emp,ls_string,ls_nom_parque,ls_nivel
Long		ll_max_anno,ll_max_mes,ll_cod_parque,ll_parq,ll_max_mes2,ll_parque_enc

gf_centrar(w_presupuesto_cliser)
Connect Using Trans_3;
dw_lista.settransobject(Trans_3)
ddlb_empresa.reset()
ddlb_parque.reset()
ll_parq				= 0

SELECT	"PRADO"."ENCARGADOS"."COD_PARQUE","PRADO"."ENCARGADOS"."PRESUPUESTO_NIVEL"
INTO		:ll_parque_enc,:ls_nivel  
FROM		"PRADO"."ENCARGADOS"
WHERE	"PRADO"."ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING 	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_parque_enc)  then
		if ls_nivel = "G" or ls_nivel = "I" or ls_nivel= "A" or ls_nivel = '1'  or ls_nivel = '2' or ls_nivel = '3' or ls_nivel = '4' or ls_nivel = '5'  or ls_nivel = '6'  or &
		   ls_nivel = 'S' then
			ll_parque_enc = 0
		else
			ll_parque_enc	= ll_parque_enc
		end if
	end if
end if

SELECT 	MAX(to_number("PRESUPUESTO_PERIODO"."MES"))    
INTO 		:ll_max_mes
FROM 	"PRESUPUESTO_PERIODO"  
WHERE	"PRESUPUESTO_PERIODO"."ANNO" = ( SELECT MAX("PRESUPUESTO_PERIODO"."ANNO") FROM "PRESUPUESTO_PERIODO" )  
USING	Trans_3;

SELECT 	MAX("PRESUPUESTO_PERIODO"."ANNO")    
INTO 		:ll_max_anno
FROM 	"PRESUPUESTO_PERIODO"  
USING	Trans_3;
if ll_max_mes > 0 and ll_max_anno > 0 then
	ll_max_mes2	=  ll_max_mes + 1
	if ll_max_mes2 > 12 then
		ll_max_mes	= 1
		ll_max_anno ++
	end if
else
	ll_max_mes		= month(date(gdt_fec_sistema))
	ll_max_anno	= year(date(gdt_fec_sistema))
end if
ll_max_mes			= ll_max_mes2

ddlb_mes.text		= string(ll_max_mes,'00')
em_anno.text		= string(ll_max_anno,'0000')
DECLARE x1 CURSOR FOR  
SELECT		"CLISER"."GRL_EMPRES"."COD_EMPRES",   
				"CLISER"."GRL_EMPRES"."NOM_EMPRES"  
FROM 		"CLISER"."GRL_EMPRES"  
USING		Trans_3;
Open x1;
if Trans_3.sqlcode=0 then
	DO WHILE Trans_3.sqlcode=0 
		Fetch x1 into :ls_cod, :ls_nom_emp;
		if not isnull(ls_cod) and not isnull(ls_nom_emp) then
			ls_string	= UPPER(ls_cod)+' - '+UPPER(ls_nom_emp)
			ddlb_empresa.additem(ls_string)
		end if
		Setnull(ls_cod);Setnull(ls_nom_emp)
	LOOP
end if
close x1;
ddlb_parque.reset()
if ll_parque_enc = 0 then
//	if gs_conexion				= "Parque El Prado" then
		DECLARE x2 CURSOR FOR  
		SELECT 		"PRADO"."COD_PARQ"."CODIGO",   
						"PRADO"."COD_PARQ"."NOMBRE"  
		FROM 		"PRADO"."COD_PARQ"  
		WHERE 		"PRADO"."COD_PARQ"."GRUPO" = 1
		ORDER BY	"PRADO"."COD_PARQ"."CODIGO" ASC  
		USING		sqlca;
		Open x2;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0 
				Fetch x2 into :ll_cod_parque, :ls_nom_parque;
				if  not isnull(ll_cod_parque) and ll_cod_parque > 0 then
					ls_string	= string(ll_cod_parque)+' - '+UPPER(ls_nom_parque)
					ddlb_parque.additem(ls_string)
				end if
				Setnull(ll_cod_parque)
			LOOP
		end if
		ls_string					= 'TODOS - TODOS'
		ddlb_parque.additem(ls_string)
		close x2;	
//	else
		DECLARE x4 CURSOR FOR  
		SELECT 		"FORESTA"."COD_PARQ"."CODIGO",   
						"FORESTA"."COD_PARQ"."NOMBRE"  
		FROM 		"FORESTA"."COD_PARQ"  
		WHERE 		"FORESTA"."COD_PARQ"."GRUPO" = 1
		ORDER BY	"FORESTA"."COD_PARQ"."CODIGO" ASC  
		USING		sqlca;
		Open x4;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0 
				Fetch x4 into :ll_cod_parque, :ls_nom_parque;
				if  not isnull(ll_cod_parque) and ll_cod_parque > 0 then
					ls_string	= string(ll_cod_parque)+' - '+UPPER(ls_nom_parque)
					ddlb_parque.additem(ls_string)
				end if
				Setnull(ll_cod_parque)
			LOOP
		end if
//		ls_string					= 'TODOS - TODOS'
//		ddlb_parque.additem(ls_string)
		close x4;	
//	end if	
else 
	//if gs_conexion				= "Parque El Prado" then
		DECLARE x3 CURSOR FOR  
		SELECT 		"PRADO"."COD_PARQ"."CODIGO",   
						"PRADO"."COD_PARQ"."NOMBRE"  
		FROM 		"PRADO"."COD_PARQ"  
		WHERE 		"PRADO"."COD_PARQ"."CODIGO" = :ll_parque_enc
		ORDER BY	"PRADO"."COD_PARQ"."CODIGO" ASC  
		USING		sqlca;
		Open x3;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0 
				Fetch x3 into :ll_cod_parque, :ls_nom_parque;
				if  not isnull(ll_cod_parque) and ll_cod_parque > 0 then
					ls_string	= string(ll_cod_parque)+' - '+UPPER(ls_nom_parque)
					ddlb_parque.additem(ls_string)
				end if
				Setnull(ll_cod_parque)
			LOOP
		end if
		close x3;	
//	else
		DECLARE x5 CURSOR FOR  
		SELECT 		"FORESTA"."COD_PARQ"."CODIGO",   
						"FORESTA"."COD_PARQ"."NOMBRE"  
		FROM 		"FORESTA"."COD_PARQ"  
		WHERE 		"FORESTA"."COD_PARQ"."GRUPO" = 1
		ORDER BY	"FORESTA"."COD_PARQ"."CODIGO" ASC  
		USING		sqlca;
		Open x5;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0 
				Fetch x5 into :ll_cod_parque, :ls_nom_parque;
				if  not isnull(ll_cod_parque) and ll_cod_parque > 0 then
					ls_string	= string(ll_cod_parque)+' - '+UPPER(ls_nom_parque)
					ddlb_parque.additem(ls_string)
				end if
				Setnull(ll_cod_parque)
			LOOP
		end if
//		ls_string					= 'TODOS - TODOS'
//		ddlb_parque.additem(ls_string)
		close x5;	
//	end if	
end if	
//em_anno.text			= String(year(Date(gdt_fec_sistema)),'0000')
end event

on w_presupuesto_cliser.create
this.cb_exportar=create cb_exportar
this.em_anno=create em_anno
this.st_4=create st_4
this.ddlb_parque=create ddlb_parque
this.cb_vista_anual=create cb_vista_anual
this.cb_vista=create cb_vista
this.st_3=create st_3
this.pb_ok=create pb_ok
this.st_2=create st_2
this.ddlb_empresa=create ddlb_empresa
this.st_1=create st_1
this.cb_cerrar=create cb_cerrar
this.ddlb_mes=create ddlb_mes
this.dw_lista=create dw_lista
this.Control[]={this.cb_exportar,&
this.em_anno,&
this.st_4,&
this.ddlb_parque,&
this.cb_vista_anual,&
this.cb_vista,&
this.st_3,&
this.pb_ok,&
this.st_2,&
this.ddlb_empresa,&
this.st_1,&
this.cb_cerrar,&
this.ddlb_mes,&
this.dw_lista}
end on

on w_presupuesto_cliser.destroy
destroy(this.cb_exportar)
destroy(this.em_anno)
destroy(this.st_4)
destroy(this.ddlb_parque)
destroy(this.cb_vista_anual)
destroy(this.cb_vista)
destroy(this.st_3)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.ddlb_empresa)
destroy(this.st_1)
destroy(this.cb_cerrar)
destroy(this.ddlb_mes)
destroy(this.dw_lista)
end on

event close;Disconnect Using Trans_3;
end event

type cb_exportar from commandbutton within w_presupuesto_cliser
integer x = 1591
integer y = 1968
integer width = 338
integer height = 112
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type em_anno from editmask within w_presupuesto_cliser
integer x = 2912
integer y = 64
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type st_4 from statictext within w_presupuesto_cliser
integer x = 1239
integer y = 76
integer width = 192
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_parque from dropdownlistbox within w_presupuesto_cliser
integer x = 1458
integer y = 64
integer width = 631
integer height = 612
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string text = "none"
boolean vscrollbar = true
string item[] = {"1 - Prado","102 - Santiago","103 - Manantial","11 - La Foresta"}
borderstyle borderstyle = stylelowered!
end type

event modified;dw_lista.reset()
end event

type cb_vista_anual from commandbutton within w_presupuesto_cliser
integer x = 475
integer y = 1968
integer width = 338
integer height = 112
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Vista &Anual"
end type

event clicked;String	ls_cod,ls_string,ls_parque
Long		ll_mes,ll_anno,ll_cod_parque,ll_pos

ll_pos				= Pos(trim(ddlb_parque.text), "-")
ll_cod_parque	= long(mid(ddlb_parque.text,1,(ll_pos - 1)))
ls_cod			= mid(ddlb_empresa.text,1,3)
ll_mes			= long(mid(ddlb_mes.text,1,2))
ll_anno			= Long(em_anno.text)
if ls_parque='TODOS' then ll_cod_parque=0
ls_string	= ls_cod+'~t'+string(ll_mes)+'~t'+string(ll_anno)+'~t'+string(ll_cod_parque)
if ll_mes > 0 and ll_anno > 0 and not isnull(ls_cod) and not isnull(ll_cod_parque) then
	openwithparm(w_vista_presupuesto_anual,ls_string)
else
	messagebox("Advertencia","Debe Ingresar Dato")
end if

end event

type cb_vista from commandbutton within w_presupuesto_cliser
integer x = 41
integer y = 1968
integer width = 338
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Vista Mensual"
end type

event clicked;String		ls_cod,ls_string,ls_parque
Long		ll_mes,ll_anno,ll_cod_parque,ll_pos

ll_pos				= Pos(trim(ddlb_parque.text), "-")
ls_parque		= mid(ddlb_parque.text,1,(ll_pos - 1))
ll_cod_parque	= long(mid(ddlb_parque.text,1,(ll_pos - 1)))
ls_cod			= mid(ddlb_empresa.text,1,3)
ll_mes			= long(mid(ddlb_mes.text,1,2))
ll_anno			= Long(em_anno.text)
if ls_parque='TODOS' then ll_cod_parque=0
ls_string			= ls_cod+'~t'+string(ll_mes)+'~t'+string(ll_anno)+'~t'+string(ll_cod_parque)
if ll_mes > 0 and ll_anno > 0 and not isnull(ls_cod) and not isnull(ll_cod_parque) then
	openwithparm(w_vista_presupuesto,ls_string)
else
	messagebox("Advertencia","Debe Ingresar Dato")
end if
end event

type st_3 from statictext within w_presupuesto_cliser
integer x = 2094
integer y = 76
integer width = 133
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_presupuesto_cliser
integer x = 3305
integer y = 36
integer width = 178
integer height = 156
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;String		ls_cod,ls_fecha,ls_nom_empresa,ls_mes,ls_pasa='N',ls_parque,ls_mes_prg,ls_mes_per,ls_nivel,ls_nom_parque
Long		ll_anno,ll_mes,ll_count,ll_res,ll_count_periodo,ll_parque,ll_pos,ll_anno_prg,ll_anno_per,ll_mes_prg,ll_mes_per,ll_mes_corr,ll_anno_corr,ll_parque_enc

setnull(ll_mes_corr)
setnull(ll_anno_corr)

ls_cod		= mid(ddlb_empresa.text,1,3)
ll_mes		= long(mid(ddlb_mes.text,1,2))
ll_anno		= Long(em_anno.text)

ll_pos			= Pos(trim(ddlb_parque.text), "-")
ls_parque	= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
if isnull(ls_parque) or ls_parque='' then
	messagebox("Advertencia","Debe Seleccionar Parque")
	ddlb_parque.setfocus()
end if	
ll_parque		= long(mid(ddlb_parque.text,1,(ll_pos - 1)))

SELECT	"PRADO"."ENCARGADOS"."PRESUPUESTO_NIVEL"
INTO		:ls_nivel  
FROM		"PRADO"."ENCARGADOS"
WHERE	"PRADO"."ENCARGADOS"."CODIGO_USUARIO" = :gs_user
USING 	sqlca;

if ls_parque = 'TODOS' then
	dw_lista.dataobject	= 'dw_lista_presupuesto_por_periodo'
else
	dw_lista.dataobject	= 'dw_lista_presupuesto_por_periodo_parque'
end if
dw_lista.settransobject(Trans_3)

CHOOSE CASE ls_parque		
	CASE '1'
			ls_nom_parque = 'EL PRADO'
	CASE '102'
			ls_nom_parque = 'EL MANANTIAL'
	CASE '103'
			ls_nom_parque = 'SANTIAGO'
	CASE '11'
			ls_nom_parque = 'LA FORESTA'
	CASE 'TODOS'	
			ls_nom_parque = 'TODOS'
END CHOOSE	

if isnull(ll_mes) then ll_mes=0
if isnull(ls_cod) or ls_cod='' then
	messagebox("Advertencia","Debe Seleccionar Empresa")
	ddlb_empresa.setfocus()
elseif ll_mes < 1 or ll_mes > 12 then
	messagebox("Advertencia","Debe Seleccionar Mes a Consultar")
	ddlb_mes.setfocus()
elseif isnull(ll_anno) or ll_anno=0 then
	messagebox("Advertencia","Debe Ingresar Año a Consultar")
	em_anno.setfocus()
else
	SetPointer(HourGlass!)
	if ls_parque = 'TODOS' then
		SELECT	COUNT("PRESUPUESTO_CONSULTA"."COD_EMP")  
		INTO 		:ll_count  
		FROM 		"PRESUPUESTO_CONSULTA"  
		WHERE  	( "PRESUPUESTO_CONSULTA"."COD_EMP" = :ls_cod ) AND  
					( "PRESUPUESTO_CONSULTA"."ANNO" = :ll_anno ) AND  
					( "PRESUPUESTO_CONSULTA"."MES" = :ll_mes ) 
		USING		Trans_3;
	else
		SELECT	COUNT("PRESUPUESTO_CONSULTA"."COD_EMP")  
		INTO 		:ll_count  
		FROM 		"PRESUPUESTO_CONSULTA"  
		WHERE  	( "PRESUPUESTO_CONSULTA"."COD_EMP" = :ls_cod ) AND  
					( "PRESUPUESTO_CONSULTA"."ANNO" = :ll_anno ) AND  
					( "PRESUPUESTO_CONSULTA"."MES" = :ll_mes ) AND
					( "PRESUPUESTO_CONSULTA"."COD_PARQUE" = :ll_parque ) 
		USING		Trans_3;
	end if
	if ll_count > 0 then
		CHOOSE CASE ll_mes
			CASE 1
				ls_fecha					= 'Enero'
			CASE 2
				ls_fecha					= 'Febrero'
			CASE 3
				ls_fecha					= 'Marzo'
			CASE 4
				ls_fecha					= 'Abril'
			CASE 5
				ls_fecha					= 'Mayo'
			CASE 6
				ls_fecha					= 'Junio'
			CASE 7
				ls_fecha					= 'Julio'
			CASE 8
				ls_fecha					= 'Agosto'
			CASE 9
				ls_fecha					= 'Septiembre'
			CASE 10
				ls_fecha					= 'Octubre'
			CASE 11
				ls_fecha					= 'Noviembre'
			CASE 12
				ls_fecha					= 'Diciembre'
		END CHOOSE
		
		SELECT "GRL_EMPRES"."NOM_EMPRES"  
		INTO 	 :ls_nom_empresa  
		FROM 	 "GRL_EMPRES"  
		WHERE  "GRL_EMPRES"."COD_EMPRES" = :ls_cod
		USING	 Trans_3;
		ll_res	= messagebox("Advertencia","Periodo Presupuesto a Consultar "+ls_fecha+" Año "+string(ll_anno)+" Empresa "+ls_nom_empresa+ " Parque "+ls_nom_parque +" Ya Existe, desea Desplegar",Exclamation!,YesNo!,2)
		if ll_res=1 then
			if ls_parque = 'TODOS' then
				if dw_lista.retrieve(ls_cod,ll_anno,ll_mes,gs_user) = 0 then
					messagebox("Advertencia","No Registra Dato Presupuesto Año "+String(ll_anno))
				end if
			else
				if dw_lista.retrieve(ls_cod,ll_anno,ll_mes,ll_parque,gs_user) = 0 then
					messagebox("Advertencia","No Registra Dato Presupuesto Año "+String(ll_anno))
				end if
			end if
		end if
	else	
		if ls_nivel = 'A' then 
			ls_mes		= string(ll_mes,'00')
			SELECT 	MAX(to_number("PRESUPUESTO_PERIODO"."MES"))    
			INTO 		:ll_mes_per
			FROM 	"PRESUPUESTO_PERIODO"  
			WHERE	"PRESUPUESTO_PERIODO"."ANNO" = ( SELECT MAX("PRESUPUESTO_PERIODO"."ANNO") FROM "PRESUPUESTO_PERIODO" )  
			USING	Trans_3;
	
			SELECT 	MAX("PRESUPUESTO_PERIODO"."ANNO")    
			INTO 		:ll_anno_per
			FROM 	"PRESUPUESTO_PERIODO"  
			USING	Trans_3;	
			ll_mes_corr		= ll_mes_per + 1
			ll_anno_corr		= ll_anno
			if ll_mes_corr > 12 then
				ll_mes_corr = 1
				ll_anno_corr = ll_anno_per +1
			end if	
			if 	ll_mes <= ll_mes_corr and ll_anno <= ll_anno_corr then	
				SELECT 	Count("PRESUPUESTO_PERIODO"."MES")   
				INTO 		:ll_count_periodo
				FROM 	"PRESUPUESTO_PERIODO", "PRG_REAL_PRES"  
				WHERE	( "PRESUPUESTO_PERIODO"."ANNO" = "PRG_REAL_PRES"."PRG_NUM_PERIODO" ) and  
							( "PRESUPUESTO_PERIODO"."MES" = "PRG_REAL_PRES"."COD_MES" ) and  
							( "PRG_REAL_PRES"."PRG_NUM_PERIODO" = :ll_anno ) AND  
							( "PRG_REAL_PRES"."COD_MES" = :ls_mes )    
				USING	Trans_3;
				if ll_count_periodo=0 then
					INSERT INTO   "PRESUPUESTO_PERIODO"  
									( "MES",		"ANNO" )  
					VALUES 		( :ls_mes,	:ll_anno )  
					USING		Trans_3;
					if Trans_3.sqlcode=0 then
						commit using Trans_3;
						ls_pasa	= 'S'
					else
						rollback using Trans_3;
						messagebox("Error Grabar","Error al Grabar Periodo "+ls_mes+" Año "+string(ll_anno)+" Tabla PRESUPUESTO_PERIODO SQL: "+trans_3.sqlerrtext)
					end if
				end if
			else
				messagebox("Advertencia","Periodo a Procesar es "+string(ll_mes_corr)+' / '+string(ll_anno_corr))
				ls_pasa	= 'N'
			end if		
			if ls_pasa = 'S' then
				DECLARE sp_presupuesto PROCEDURE FOR cliser.presupuesto(:ls_cod,:ll_anno,:ll_mes);
				EXECUTE sp_presupuesto;
				if ls_parque = 'TODOS' then
					if dw_lista.retrieve(ls_cod,ll_anno,ll_mes,gs_user) = 0 then
						messagebox("Advertencia","No Registra Dato Presupuesto Año "+String(ll_anno))
					end if
				else
					if dw_lista.retrieve(ls_cod,ll_anno,ll_mes,ll_parque,gs_user) = 0 then
						messagebox("Advertencia","No Registra Dato Presupuesto Año "+String(ll_anno))
					end if
				end if
			end if
		else
			messagebox("Advertencia","Aun No Se Ha Generado Este Mes")
		end if	
	end if
	SetPointer(Arrow!)
end if
end event

type st_2 from statictext within w_presupuesto_cliser
integer x = 2770
integer y = 76
integer width = 123
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_empresa from dropdownlistbox within w_presupuesto_cliser
integer x = 261
integer y = 64
integer width = 978
integer height = 612
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_presupuesto_cliser
integer x = 18
integer y = 76
integer width = 215
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empresa"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_presupuesto_cliser
integer x = 3095
integer y = 1968
integer width = 389
integer height = 112
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_presupuesto_cliser)
end event

type ddlb_mes from dropdownlistbox within w_presupuesto_cliser
integer x = 2249
integer y = 64
integer width = 507
integer height = 604
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string text = "none"
boolean vscrollbar = true
string item[] = {"01 - Enero","02 - Febrero","03 - Marzo","04 - Abril","05 - Mayo","06 - Junio","07 - Julio","08 - Agosto","09 - Septiembre","10 - Octubre","11 - Noviembre","12 - Diciembre"}
borderstyle borderstyle = stylelowered!
end type

event modified;dw_lista.reset()
end event

type dw_lista from datawindow within w_presupuesto_cliser
integer x = 41
integer y = 224
integer width = 3442
integer height = 1692
integer taborder = 60
string title = "none"
string dataobject = "dw_lista_presupuesto_por_periodo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

