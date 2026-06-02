forward
global type w_sap_traspaso_arch_pagos from window
end type
type st_3 from statictext within w_sap_traspaso_arch_pagos
end type
type dw_tipo_pago from datawindow within w_sap_traspaso_arch_pagos
end type
type dw_estado from datawindow within w_sap_traspaso_arch_pagos
end type
type st_2 from statictext within w_sap_traspaso_arch_pagos
end type
type hpb_1 from hprogressbar within w_sap_traspaso_arch_pagos
end type
type st_porc from statictext within w_sap_traspaso_arch_pagos
end type
type dw_archivo from datawindow within w_sap_traspaso_arch_pagos
end type
type cb_aceptar from commandbutton within w_sap_traspaso_arch_pagos
end type
type st_1 from statictext within w_sap_traspaso_arch_pagos
end type
type p_1 from picture within w_sap_traspaso_arch_pagos
end type
type em_fecha_comi from editmask within w_sap_traspaso_arch_pagos
end type
type cb_cerrar from commandbutton within w_sap_traspaso_arch_pagos
end type
type gb_1 from groupbox within w_sap_traspaso_arch_pagos
end type
end forward

global type w_sap_traspaso_arch_pagos from window
integer x = 832
integer y = 360
integer width = 1513
integer height = 1032
boolean titlebar = true
string title = "Creación Archivo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_3 st_3
dw_tipo_pago dw_tipo_pago
dw_estado dw_estado
st_2 st_2
hpb_1 hpb_1
st_porc st_porc
dw_archivo dw_archivo
cb_aceptar cb_aceptar
st_1 st_1
p_1 p_1
em_fecha_comi em_fecha_comi
cb_cerrar cb_cerrar
gb_1 gb_1
end type
global w_sap_traspaso_arch_pagos w_sap_traspaso_arch_pagos

on w_sap_traspaso_arch_pagos.create
this.st_3=create st_3
this.dw_tipo_pago=create dw_tipo_pago
this.dw_estado=create dw_estado
this.st_2=create st_2
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.dw_archivo=create dw_archivo
this.cb_aceptar=create cb_aceptar
this.st_1=create st_1
this.p_1=create p_1
this.em_fecha_comi=create em_fecha_comi
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.dw_tipo_pago,&
this.dw_estado,&
this.st_2,&
this.hpb_1,&
this.st_porc,&
this.dw_archivo,&
this.cb_aceptar,&
this.st_1,&
this.p_1,&
this.em_fecha_comi,&
this.cb_cerrar,&
this.gb_1}
end on

on w_sap_traspaso_arch_pagos.destroy
destroy(this.st_3)
destroy(this.dw_tipo_pago)
destroy(this.dw_estado)
destroy(this.st_2)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.dw_archivo)
destroy(this.cb_aceptar)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.em_fecha_comi)
destroy(this.cb_cerrar)
destroy(this.gb_1)
end on

event open;string ls_dia,ls_mes,ls_anno

connect using Trans_1;
connect using Trans_2;
connect using Trans_4;
gf_centrar(w_sap_traspaso_arch_pagos)

dw_tipo_pago.dataobject		= 'dwe_rem_tipo_pago'
dw_tipo_pago.settransobject(sqlca)
dw_tipo_pago.insertrow(0)

dw_estado.dataobject			= 'dwe_estado_personal_vta'
dw_estado.settransobject(sqlca)
dw_estado.insertrow(0)

if gl_proceso >= 4 then
	dw_archivo.dataobject		= 'dwe_archivo_exp'
	dw_archivo.settransobject(sqlca)
	ls_dia 							= '15'
	ls_mes 							= string(Month(today()))
	ls_anno 							= string(year(today()))
	em_fecha_comi.text 			= ls_dia+'/'+ls_mes+'/'+ls_anno 
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_sap_traspaso_arch_pagos)
end if
	



end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
disconnect using Trans_4;
end event

type st_3 from statictext within w_sap_traspaso_arch_pagos
integer x = 279
integer y = 336
integer width = 251
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tipo Pago :"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_tipo_pago from datawindow within w_sap_traspaso_arch_pagos
integer x = 544
integer y = 332
integer width = 869
integer height = 96
integer taborder = 20
string title = "none"
string dataobject = "dwe_rem_tipo_pago"
boolean border = false
boolean livescroll = true
end type

type dw_estado from datawindow within w_sap_traspaso_arch_pagos
integer x = 544
integer y = 440
integer width = 617
integer height = 96
integer taborder = 20
string title = "none"
string dataobject = "dwe_estado_personal_vta"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_sap_traspaso_arch_pagos
integer x = 325
integer y = 452
integer width = 201
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Estado :"
alignment alignment = right!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_sap_traspaso_arch_pagos
boolean visible = false
integer x = 1088
integer y = 1060
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_sap_traspaso_arch_pagos
boolean visible = false
integer x = 1664
integer y = 988
integer width = 233
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_archivo from datawindow within w_sap_traspaso_arch_pagos
integer x = 1563
integer y = 136
integer width = 411
integer height = 432
integer taborder = 40
string title = "none"
string dataobject = "dwe_archivo_exp"
boolean livescroll = true
end type

type cb_aceptar from commandbutton within w_sap_traspaso_arch_pagos
integer x = 78
integer y = 780
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
long		ll_cod_parque,ll_mes,ll_ano,ll_dia,ll_res,ll_rut,ll_suma,ll_new,ll_rut_cta,ll_pago_cta,ll_fec_cta,ll_sap_cta,ll_moneda_cta,ll_descto,ll_tipo_pago
string		ls_cod_sap,ls_cod_contab,ls_pasa='S',ls_descrip,ls_nombre_arch,ls_estado,ls_cod,ls_rut_exp,ls_pago_exp,ls_string,&
			ls_fec_cierre,ls_moneda,ls_descrip_tipo,ls_descrip_estado,ls_empresa,ls_nro
double	ldb_porce_pago
datetime	ldt_fecha,ldt_fec_fin

ldt_fecha										= datetime(date(em_fecha_comi.text),time('00:00:00'))
ll_tipo_pago									= dw_tipo_pago.getitemnumber(1,'tipo_pago') 
ls_estado									= dw_estado.getitemstring(1,'estado') 
ls_moneda									= 'CLP' 

if isnull(ldt_fecha) then
	messagebox("Advertencia","Debe Ingresar Fecha Proceso")
	em_fecha_comi.setfocus()
	ls_pasa									= 'N'	
elseif isnull(ls_estado) or ls_estado='' then
	messagebox("Advertencia","Debe Ingresar Estado del Personal de Ventas")
	dw_estado.setfocus()
	ls_pasa									= 'N'
elseif isnull(ll_tipo_pago) or ll_tipo_pago=0 then
	messagebox("Advertencia","Debe Ingresar Tipo Pago")
	dw_tipo_pago.setfocus()
	ls_pasa									= 'N'		
end if	

if ls_pasa = 'S' then
	SetPointer(HourGlass!)
	
	if gs_empresa = 'El Prado' then
		ls_empresa							= 'PRADO'
	elseif gs_empresa = 'La Foresta' then
		ls_empresa							= 'FORESTA'
	elseif gs_empresa = 'Concepcion' then
		ls_empresa							= 'CONCEPCION'
	end if
	
	if ll_tipo_pago=1 then
		ls_nro									= '01'
	elseif ll_tipo_pago=11 then
		ls_nro									= '03'
	elseif ll_tipo_pago=12 then
		ls_nro									= '04'
	elseif ll_tipo_pago=13 then
		ls_nro									= '05'
	elseif ll_tipo_pago=3 then
		ls_nro									= '06'
	elseif ll_tipo_pago=4 then
		ls_nro									= '07'
	elseif ll_tipo_pago=5 then
		ls_nro									= '07'
	elseif ll_tipo_pago=8 then
		ls_nro									= '08'
	elseif ll_tipo_pago=9 then
		ls_nro									= '09'
	elseif ll_tipo_pago=10 then
		ls_nro									= '10'		
	end if
	SELECT DISTINCT "DESCRIPCION"
	INTO		:ls_descrip_tipo
    	FROM		"PREMIO_TIPO"  
   	WHERE	"PREMIO_TIPO"."COD_PREMIO" = :ll_tipo_pago ;
		
	if ll_tipo_pago=3 OR ll_tipo_pago=4 then
		ll_dia										= day(date(ldt_fecha))
	elseif  ll_tipo_pago=1 or ll_tipo_pago=5 OR ll_tipo_pago=8 OR ll_tipo_pago=10 then
		ll_mes									= month(date(ldt_fecha))
		ll_ano										= year(date(ldt_fecha))
		
		if ll_mes=12 then
			ll_mes								= ll_mes - 11
			ll_ano									= ll_ano + 1
		else
			ll_mes								= ll_mes + 1
			ll_ano									= ll_ano
		end if
		ldt_fec_fin								= f_fecha_fin(ll_mes,ll_ano)
		ll_dia										= day(date(ldt_fec_fin))
	else
		ll_mes									= month(date(ldt_fecha))
		ll_ano										= year(date(ldt_fecha))
	
		ldt_fec_fin								= f_fecha_fin(ll_mes,ll_ano)
		ll_dia										= day(date(ldt_fec_fin))
	end if
	ls_fec_cierre							= string(ll_dia,'00')+string(ll_mes,'00')+string(ll_ano,'0000')
	
	if ls_estado='A' then
		 ls_descrip_estado					= 'ACTIVO'
	else
		 ls_descrip_estado					= 'INACTIVO'
	end if
	
	
	ls_nombre_arch 						= ls_nro+'_'+ls_empresa+'_'+ls_descrip_tipo+'_'+ls_descrip_estado+'_'+ls_fec_cierre
	
	ll_res										= messagebox(gs_app_name,'Archivo quedará en C:\Archivo\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) 
	if ll_res = 1 then
		DECLARE x1 CURSOR FOR
		SELECT	"COD_PARQUE" ,	"CODIGO_SAP",	"COD_CONTAB",	"DESCRIPCION", "PORCE_PAGO"
		FROM 	"SAP_CODIGO_CONTABLE"  
		WHERE	"SAP_CODIGO_CONTABLE"."TIPO_PAGO" = :ll_tipo_pago AND
					"SAP_CODIGO_CONTABLE"."ESTADO" = 'A' 
		USING	Trans_1;
		open x1;
		if Trans_1.sqlcode=0 then
			DO WHILE Trans_1.sqlcode=0
			fetch x1 INTO	:ll_cod_parque,	:ls_cod_sap,:ls_cod_contab,:ls_descrip,:ldb_porce_pago;
				if not isnull(ll_cod_parque) and ll_cod_parque>0 and not isnull(ls_cod_contab) and ls_cod_contab<>'' and not isnull(ls_cod_sap) and ls_cod_sap<>'' and not isnull(ls_descrip) and ls_descrip<>'' then
					if ll_tipo_pago=3 then
						DECLARE x2 CURSOR FOR
						SELECT DISTINCT "RES_COMI"."RUT","RES_COMI"."COD_AGE_SUP"  
						FROM		"RES_COMI","AGENTES"  
						WHERE	"RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" and
									"RES_COMI"."COD_CONTABLE" = :ls_cod_contab AND  
									"RES_COMI"."ESTADO_AGE_SUP" = :ls_estado AND  
									"RES_COMI"."FECHA" = :ldt_fecha AND
									"AGENTES"."PAGOS_VENTA" = 'S' AND
									"RES_COMI"."COD_PARQUE" = :ll_cod_parque and
									"RES_COMI"."PORC_ING_CAJA" = :ldb_porce_pago
						USING	Trans_2;
					else
						DECLARE x3 CURSOR FOR
						SELECT DISTINCT "RES_COMI"."RUT","RES_COMI"."COD_AGE_SUP"  
						FROM		"RES_COMI","AGENTES"  
						WHERE	"RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" and 
									"RES_COMI"."COD_CONTABLE" = :ls_cod_contab AND  
									"RES_COMI"."ESTADO_AGE_SUP" = :ls_estado AND  
									"RES_COMI"."FECHA" = :ldt_fecha AND
									"AGENTES"."PAGOS_VENTA" = 'S' AND
									"AGENTES"."COD_PARQUE" = :ll_cod_parque
						UNION
						SELECT DISTINCT "RES_COMI"."RUT","RES_COMI"."COD_AGE_SUP"  
						FROM		"RES_COMI","SUPERVISOR"  
						WHERE	"RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" and
									"RES_COMI"."COD_CONTABLE" = :ls_cod_contab AND  
									"RES_COMI"."ESTADO_AGE_SUP" = :ls_estado AND  
									"RES_COMI"."FECHA" = :ldt_fecha AND
									"SUPERVISOR"."PAGOS_VENTA" = 'S' AND
									"SUPERVISOR"."COD_PARQUE" = :ll_cod_parque
						UNION
						SELECT DISTINCT "RES_COMI"."RUT","RES_COMI"."COD_AGE_SUP"  
						FROM		"RES_COMI","JEFE_VENTAS"  
						WHERE	"RES_COMI"."COD_AGE_SUP" = "JEFE_VENTAS"."JEFE_VENTAS" and
									"RES_COMI"."COD_CONTABLE" = :ls_cod_contab AND  
									"RES_COMI"."ESTADO_AGE_SUP" = :ls_estado AND  
									"RES_COMI"."FECHA" = :ldt_fecha AND
									"JEFE_VENTAS"."PAGOS_VENTA" = 'S' AND
									"JEFE_VENTAS"."COD_PARQUE" = :ll_cod_parque
						USING	Trans_2;	
					end if
					if ll_tipo_pago=3 then
						open x2;
					else
						open x3;
					end if
					if Trans_2.sqlcode=0 then
						DO WHILE Trans_2.sqlcode=0
							if ll_tipo_pago=3 then
								fetch x2 INTO	:ll_rut,:ls_cod;
							else
								fetch x3 INTO	:ll_rut,:ls_cod;
							end if
							
							if not isnull(ll_rut) and ll_rut > 0 then
								if ll_tipo_pago=3  then
									SELECT	SUM("RES_COMI"."TOTAL_PAGO")
									INTO		:ll_suma
									FROM		"RES_COMI"  
									WHERE 	( "RES_COMI"."COD_AGE_SUP" = :ls_cod ) AND  
												( "RES_COMI"."COD_CONTABLE" = :ls_cod_contab ) AND
												( "RES_COMI"."FECHA" = :ldt_fecha ) and
												( "RES_COMI"."PORC_ING_CAJA" = :ldb_porce_pago ) AND
												( "RES_COMI"."COD_PARQUE" = :ll_cod_parque )
									USING	Trans_4;
									if isnull(ll_suma) then ll_suma=0
								else
									ll_suma					= f_res_comi_consul(ls_cod,ls_cod_contab,ldt_fecha)
								end if	
								
								if ll_tipo_pago=3 OR ll_tipo_pago=4 then
									ll_descto					= ll_suma * 0.20
								else
									ll_descto					= 0
								end if
								ll_suma						= ll_suma - ll_descto
								
								if not isnull(ll_suma) and ll_suma>0 then
									ll_new					= dw_archivo.insertrow(0)
									dw_archivo.scrolltorow(ll_new)
									ll_rut_cta				 	= len(String(ll_rut))
									ls_rut_exp				=trim(string(ll_rut))+ fill(' ',8 - ll_rut_cta)
									
									ll_fec_cta			 	= len(String(ls_fec_cierre))
									ls_fec_cierre			= trim(string(ls_fec_cierre))+fill(' ',8 - ll_fec_cta)
									
									ll_sap_cta			 	= len(String(ls_cod_sap))
									ls_cod_sap				= trim(string(ls_cod_sap))+fill(' ',4 - ll_sap_cta)
									
									ll_pago_cta				= len(string(ll_suma))
									ls_pago_exp				= trim(string(ll_suma))+fill(' ',13 - ll_pago_cta)
									
									ll_moneda_cta			= len(string(ls_moneda))
									ls_moneda				= trim(string(ls_moneda))+fill(' ',3 - ll_moneda_cta)
									
									ls_string					= ls_rut_exp+';'+ls_fec_cierre+';'+ls_cod_sap+';'+ls_pago_exp+';'+ls_moneda
									dw_archivo.setitem(ll_new,"linea",ls_string)
								end if
							end if
							setnull(ll_rut)
						LOOP
					end if
					if ll_tipo_pago=3 then
						close x2;
					else
						close x3;
					end if
				end if
				setnull(ll_cod_parque);setnull(ls_cod_contab);setnull(ls_cod_sap);setnull(ls_descrip)
			LOOP
		end if
		close x1;
		dw_archivo.SaveAs( "C:\Archivo\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
		SetPointer(Arrow!)
	end if
else
	messagebox(gs_app_name,'No existen datos a traspasar; "PRADO_COMIS_AGENTE_VENTA"',stopsign!)
end if
close(w_sap_traspaso_arch_pagos)

end event

type st_1 from statictext within w_sap_traspaso_arch_pagos
integer x = 329
integer y = 240
integer width = 201
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Fecha :"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_sap_traspaso_arch_pagos
integer x = 997
integer y = 224
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

type em_fecha_comi from editmask within w_sap_traspaso_arch_pagos
integer x = 549
integer y = 228
integer width = 448
integer height = 84
integer taborder = 10
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

type cb_cerrar from commandbutton within w_sap_traspaso_arch_pagos
integer x = 1125
integer y = 784
integer width = 302
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_sap_traspaso_arch_pagos)
end event

type gb_1 from groupbox within w_sap_traspaso_arch_pagos
integer x = 78
integer y = 92
integer width = 1349
integer height = 644
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Archivo Traspaso Personal Ventas"
end type

