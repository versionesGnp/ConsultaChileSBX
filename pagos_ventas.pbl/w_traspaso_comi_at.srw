forward
global type w_traspaso_comi_at from window
end type
type cb_vtas_asig from commandbutton within w_traspaso_comi_at
end type
type cb_vtas_new from commandbutton within w_traspaso_comi_at
end type
type dw_archivo from datawindow within w_traspaso_comi_at
end type
type cb_resp from commandbutton within w_traspaso_comi_at
end type
type st_1 from statictext within w_traspaso_comi_at
end type
type p_1 from picture within w_traspaso_comi_at
end type
type em_fecha_comi from editmask within w_traspaso_comi_at
end type
type cb_cerrar from commandbutton within w_traspaso_comi_at
end type
type gb_1 from groupbox within w_traspaso_comi_at
end type
end forward

global type w_traspaso_comi_at from window
integer x = 832
integer y = 360
integer width = 1490
integer height = 860
boolean titlebar = true
string title = "Creación Archivo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_vtas_asig cb_vtas_asig
cb_vtas_new cb_vtas_new
dw_archivo dw_archivo
cb_resp cb_resp
st_1 st_1
p_1 p_1
em_fecha_comi em_fecha_comi
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_traspaso_comi_at w_traspaso_comi_at

on w_traspaso_comi_at.create
this.cb_vtas_asig=create cb_vtas_asig
this.cb_vtas_new=create cb_vtas_new
this.dw_archivo=create dw_archivo
this.cb_resp=create cb_resp
this.st_1=create st_1
this.p_1=create p_1
this.em_fecha_comi=create em_fecha_comi
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.cb_vtas_asig,&
this.cb_vtas_new,&
this.dw_archivo,&
this.cb_resp,&
this.st_1,&
this.p_1,&
this.em_fecha_comi,&
this.cb_cerrar,&
this.gb_1}
end on

on w_traspaso_comi_at.destroy
destroy(this.cb_vtas_asig)
destroy(this.cb_vtas_new)
destroy(this.dw_archivo)
destroy(this.cb_resp)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.em_fecha_comi)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;long		ll_mes,ll_ano
datetime	ldt_fec_comi

connect using Trans_1;
connect using Trans_2;
if gl_proceso >= 4 then
	gf_centrar(w_traspaso_comi_at)
	dw_archivo.dataobject		= 'dwe_archivo_exp'
	dw_archivo.settransobject(sqlca)
	
	SELECT MAX("RES_COMI"."FECHA")
	INTO		:ldt_fec_comi
	FROM		"RES_COMI"  
	WHERE	("RES_COMI"."COD_CONTABLE" = '070' or "RES_COMI"."COD_CONTABLE" = '072' or "RES_COMI"."COD_CONTABLE" = '077')
	USING	sqlca;
	if isnull(ldt_fec_comi) then ldt_fec_comi = gdt_fec_sistema
		
	ll_mes												= month(date(ldt_fec_comi))
	ll_ano													= year(date(ldt_fec_comi))
	ldt_fec_comi										= f_fecha_fin(ll_mes,ll_ano)
	em_fecha_comi.text 								= string(ldt_fec_comi,'dd/mm/yyyy')
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_traspaso_comi_at)
end if
	



end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_vtas_asig from commandbutton within w_traspaso_comi_at
integer x = 713
integer y = 404
integer width = 599
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Arch. Ventas Asignadas"
end type

event clicked;integer	li_FileNum
string	ls_cod_contab,ls_haber,ls_string,ls_nombre_arch,ls_haber_exp,ls_cod_contab_exp,&
			ls_rut_exp,ls_pago_exp,ls_cod_contab_020
long		ll_cod_parque,ll_rut,ll_suma,ll_new,ll_haber_cta,ll_cod_contab_cta,ll_rut_cta,ll_pago_cta
datetime	ldt_fecha

ldt_fecha													= datetime(date(em_fecha_comi.text),time('00:00:00'))
ls_haber													= 'H'

if gs_empresa = 'El Prado' then
/**/ls_cod_contab_020								= '020'
	ls_nombre_arch 									= '03 PRADO_BONO_VTA_ASIG_020'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x1 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_020)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp		= trim(ls_cod_contab_020)
							ll_rut_cta				   		= len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string						= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x1;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "PRADO_BONO_VTA_ASIG_020"',stopsign!)
	end if
elseif gs_empresa = 'La Foresta' then
/**/ls_cod_contab_020								= '020'
	ls_nombre_arch 									= '03 FORESTA_BONO_VTA_ASIG_020'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x7 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x7;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x7 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_020)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp		= trim(ls_cod_contab_020)
							ll_rut_cta				   		= len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string						= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x7;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "FORESTA_BONO_VTA_ASIG_020"',stopsign!)
	end if
elseif gs_empresa = 'Concepcion' then
/**/ls_cod_contab_020								= '020'
	ls_nombre_arch 									= '03 CONCE_BONO_VTA_ASIG_020'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x8 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x8;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x7 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_020)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp		= trim(ls_cod_contab_020)
							ll_rut_cta				   		= len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string						= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x8;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "CONCE_BONO_VTA_ASIG_020"',stopsign!)
	end if
end if
close(w_traspaso_comi_at)
end event

type cb_vtas_new from commandbutton within w_traspaso_comi_at
integer x = 169
integer y = 404
integer width = 539
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Arch. Ventas Nuevas"
end type

event clicked;integer	li_FileNum
string		ls_haber,ls_cod_contab,ls_nombre_arch,ls_rut_exp,ls_pago_exp,ls_string,ls_parque
long		ll_res,ll_rut,ll_suma,ll_new,ll_rut_cta,ll_pago_cta,ll_cod_parque
datetime	ldt_fecha

ldt_fecha													= datetime(date(em_fecha_comi.text),time('00:00:00'))
ls_haber													= 'H'
ll_res														= MessageBox("Advertencia","Desea Generar Archivo Remuneraciones",information!,YesNo! ,2)												
if ll_res = 1 then
	DECLARE x1 CURSOR FOR
	SELECT		"CODIGO"
    	FROM			"COD_PARQ"  
   	WHERE 		"COD_PARQ"."GRUPO" = 1
	ORDER BY	"CODIGO"
	USING	sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ll_cod_parque;
			if not isnull(ll_cod_parque) and ll_cod_parque > 0 then
				if ll_cod_parque=1 or ll_cod_parque=101 or ll_cod_parque=11 then
					ls_cod_contab						= '070'
					if ll_cod_parque=1 then
						ls_parque						= 'PRADO'
					elseif ll_cod_parque=101 then
						ls_parque						= 'CANAAN'
					elseif ll_cod_parque=11 then
						ls_parque						= 'FORESTA'
					end if
				elseif ll_cod_parque=102 then
					ls_cod_contab						= '072'
					ls_parque							= 'MANANTIAL'
				elseif ll_cod_parque=103 then
					ls_cod_contab						= '077'
					ls_parque							= 'SANTIAGO'
				end if
				ls_nombre_arch						= '02_'+ls_parque+'_COMIS_VTA_NUEVA_'+ls_cod_contab
				ls_nombre_arch 						= ls_nombre_arch+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
				ll_res										= MessageBox(gs_app_name,'Archivo quedará en C:\Archivo\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2)
				if ll_res = 1 then
					DECLARE x2 CURSOR FOR
					SELECT	"AGENTES"."RUT"  
					FROM		"AGENTES"  
					WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
								( "AGENTES"."ESTADO" = 'A' )   
					USING	Trans_1;
					open x2;
					if Trans_1.sqlcode=0 then
						DO WHILE Trans_1.sqlcode=0
						fetch x2 INTO	:ll_rut;
							if not isnull(ll_rut) and ll_rut > 0 then
								if (ll_cod_parque = 1 or ll_cod_parque=101) and ls_cod_contab='070' then
									SELECT	SUM("RES_COMI"."TOTAL_PAGO")
									INTO		:ll_suma
									FROM		"RES_COMI"  
									WHERE	( "RES_COMI"."RUT" = :ll_rut ) AND  
												( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
												( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab) AND
												( "RES_COMI"."COD_PARQUE" = :ll_cod_parque)   
									USING	Trans_2;
								else
									SELECT	SUM("RES_COMI"."TOTAL_PAGO")
									INTO		:ll_suma
									FROM		"RES_COMI"  
									WHERE	( "RES_COMI"."RUT" = :ll_rut ) AND  
												( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
												( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab)
									USING	Trans_2;
								end if
								if isnull(ll_suma) then ll_suma=0
								if ll_suma>0 then
									ll_new						= dw_archivo.insertrow(0)
									dw_archivo.scrolltorow(ll_new)
									ll_rut_cta				  		= len(String(ll_rut))
									ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
									ll_pago_cta					= len(string(ll_suma))
									ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
									ls_string						= ls_haber+ls_cod_contab+ls_rut_exp+ls_pago_exp
									dw_archivo.setitem(ll_new,"linea",ls_string)
									dw_archivo.accepttext()
								end if
							end if
							setnull(ll_rut)
						LOOP
					end if
					close x2;
					dw_archivo.SaveAs( "C:\Archivo\"+ls_nombre_arch+".TXT", CSV!, FALSE)
					dw_archivo.reset()
				else 
					messagebox(gs_app_name,'No existen datos a traspasar; "PRADO_COMIS_VTA_NUEVA_070"',stopsign!)
				end if
			end if
			setnull(ll_cod_parque)
		LOOP
	end if
	close x1;
end if
close(w_traspaso_comi_at)
end event

type dw_archivo from datawindow within w_traspaso_comi_at
integer x = 1563
integer y = 136
integer width = 411
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dwe_archivo_exp"
boolean livescroll = true
end type

type cb_resp from commandbutton within w_traspaso_comi_at
boolean visible = false
integer x = 1102
integer y = 812
integer width = 302
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;integer	li_FileNum
string	ls_cod_contab,ls_haber,ls_string,ls_nombre_arch,ls_haber_exp,ls_cod_contab_exp,&
			ls_rut_exp,ls_pago_exp,ls_cod_contab_069,ls_cod_contab_071,ls_cod_contab_070,ls_cod_contab_072,&
			ls_cod_contab_076,ls_cod_contab_077
long		ll_cod_parque,ll_rut,ll_suma,ll_new,ll_haber_cta,ll_cod_contab_cta,ll_rut_cta,ll_pago_cta
datetime	ldt_fecha

ldt_fecha												= datetime(date(em_fecha_comi.text),time('00:00:00'))
ls_haber													= 'H'

if gs_empresa = 'El Prado' then
/**/ls_cod_contab_069								= '069'
	ls_nombre_arch 									= '03 PRADO_COMIS_VTA_ASIG_069'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x1 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x1;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x1 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_069)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new							= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_069)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x1;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "PRADO_COMIS_VTA_ASIG_069"',stopsign!)
	end if
/**/ls_cod_contab_071								= '071'
	ls_nombre_arch 									= '03 MANANTIAL_COMIS_VTA_ASIG_071'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x2 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x2;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x2 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_071)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new							= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_071)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x2;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "MANANTIAL_COMIS_VTA_ASIG_071"',stopsign!)
	end if
	
/**/ls_cod_contab_076								= '076'
	ls_nombre_arch 									= '03 SANTIAGO_COMIS_VTA_ASIG_076'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x5 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x5;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x5 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_076)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new							= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_076)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x5;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "SANTIAGO_COMIS_VTA_ASIG_071"',stopsign!)
	end if	
/**/ls_cod_contab_070								= '070'
	ls_nombre_arch 									= '04 PRADO_COMIS_VTA_NUEVA_070'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x3 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x3;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x3 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_070)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_070)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x3;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "PRADO_COMIS_VTA_NUEVA_070"',stopsign!)
	end if
/**/ls_cod_contab_072								= '072'
	ls_nombre_arch 									= '04 MANANTIAL_COMIS_VTA_NUEVA_072'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x4 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x4;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x4 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_072)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_072)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x4;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "MANANTIAL_COMIS_VTA_NUEVA_072"',stopsign!)
	end if
/**/ls_cod_contab_077								= '077'
	ls_nombre_arch 									= '04 SANTIAGO_COMIS_VTA_NUEVA_077'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x8 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x8;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x8 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_077)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_077)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x8;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "SANTIAGO_COMIS_VTA_NUEVA_077"',stopsign!)
	end if	
	
elseif gs_empresa = 'La Foresta' then
/**/ls_cod_contab_069								= '069'
	ls_nombre_arch 									= '03 FORESTA_COMIS_VTA_ASIG_069'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x7 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x7;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x7 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_069)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_069)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x7;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "FORESTA_COMIS_VTA_ASIG_069"',stopsign!)
	end if
/**/ls_cod_contab_070								= '070'
	ls_nombre_arch 									= '04 FORESTA_COMIS_VTA_NUEVA_070'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x6 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x6;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x6 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_070)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_070)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x6;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "FORESTA_COMIS_VTA_NUEVA_070"',stopsign!)
	end if
	
elseif gs_empresa = 'Concepcion' then
/**/ls_cod_contab_069								= '069'
	ls_nombre_arch 									= '03 CONCE_COMIS_VTA_ASIG_069'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x10 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x10;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x10 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_069)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_069)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x10;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "CONCE_COMIS_VTA_ASIG_069"',stopsign!)
	end if
/**/ls_cod_contab_070								= '070'
	ls_nombre_arch 									= '04 CONCE_COMIS_VTA_NUEVA_070'+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
	if MessageBox(gs_app_name,'Archivo quedará en C:\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) = 1 then
		DECLARE x11 CURSOR FOR
		SELECT	"AGENTES"."RUT"  
		FROM		"AGENTES"  
		WHERE 	( "AGENTES"."DEPTO" = 'E' ) AND  
					( "AGENTES"."ESTADO" = 'A' )   
		USING		sqlca;
		open x11;
			if sqlca.sqlcode=0 then
				DO WHILE sqlca.sqlcode=0
				fetch x11 INTO	:ll_rut;
					if not isnull(ll_rut) and ll_rut > 0 then
						SELECT	SUM("RES_COMI"."TOTAL_PAGO")
						INTO		:ll_suma
						FROM		"RES_COMI"  
						WHERE		( "RES_COMI"."RUT" = :ll_rut ) AND  
									( "RES_COMI"."FECHA" = :ldt_fecha ) AND  
									( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab_070)   
						USING		Trans_1;
						if Trans_1.sqlcode=0 and ll_suma>= 0 then
							ll_new						= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ls_haber_exp				= trim(ls_haber)
							ls_cod_contab_exp			= trim(ls_cod_contab_070)
							ll_rut_cta				   = len(String(ll_rut))
							ls_rut_exp					= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta					= len(string(ll_suma))
							ls_pago_exp					= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber_exp+ls_cod_contab_exp+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
					setnull(ll_rut)
				LOOP
			end if
		close x11;
		dw_archivo.SaveAs( "C:\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else 
		messagebox(gs_app_name,'No existen datos a traspasar; "CONCE_COMIS_VTA_NUEVA_070"',stopsign!)
	end if
end if
close(w_traspaso_comi_at)
end event

type st_1 from statictext within w_traspaso_comi_at
integer x = 297
integer y = 260
integer width = 201
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_traspaso_comi_at
integer x = 997
integer y = 244
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fecha_comi.text)=-1 then 
	em_fecha_comi.text=string(today(),gs_formato_fecha)
	em_fecha_comi.setfocus()
	return
end if	
if em_fecha_comi.text<>'00/00/0000' then
	ls_fecha = em_fecha_comi.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
IF Message.StringParm <> ls_fecha THEN
	em_fecha_comi.text = Message.StringParm
end if	


end event

type em_fecha_comi from editmask within w_traspaso_comi_at
integer x = 517
integer y = 248
integer width = 475
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type cb_cerrar from commandbutton within w_traspaso_comi_at
integer x = 1051
integer y = 568
integer width = 302
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_traspaso_comi_at)
end event

type gb_1 from groupbox within w_traspaso_comi_at
integer x = 119
integer y = 92
integer width = 1239
integer height = 452
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Archivo Traspaso Comisión"
end type

