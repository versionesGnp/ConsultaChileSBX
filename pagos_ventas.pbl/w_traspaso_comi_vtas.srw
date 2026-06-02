forward
global type w_traspaso_comi_vtas from window
end type
type st_3 from statictext within w_traspaso_comi_vtas
end type
type dw_tipo_pago from datawindow within w_traspaso_comi_vtas
end type
type st_2 from statictext within w_traspaso_comi_vtas
end type
type dw_estado from datawindow within w_traspaso_comi_vtas
end type
type hpb_1 from hprogressbar within w_traspaso_comi_vtas
end type
type st_porc from statictext within w_traspaso_comi_vtas
end type
type dw_archivo from datawindow within w_traspaso_comi_vtas
end type
type cb_aceptar from commandbutton within w_traspaso_comi_vtas
end type
type st_1 from statictext within w_traspaso_comi_vtas
end type
type p_1 from picture within w_traspaso_comi_vtas
end type
type em_fecha_comi from editmask within w_traspaso_comi_vtas
end type
type cb_cerrar from commandbutton within w_traspaso_comi_vtas
end type
type gb_1 from groupbox within w_traspaso_comi_vtas
end type
end forward

global type w_traspaso_comi_vtas from window
integer x = 832
integer y = 360
integer width = 1499
integer height = 968
boolean titlebar = true
string title = "Creación Archivo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_3 st_3
dw_tipo_pago dw_tipo_pago
st_2 st_2
dw_estado dw_estado
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
global w_traspaso_comi_vtas w_traspaso_comi_vtas

on w_traspaso_comi_vtas.create
this.st_3=create st_3
this.dw_tipo_pago=create dw_tipo_pago
this.st_2=create st_2
this.dw_estado=create dw_estado
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
this.st_2,&
this.dw_estado,&
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

on w_traspaso_comi_vtas.destroy
destroy(this.st_3)
destroy(this.dw_tipo_pago)
destroy(this.st_2)
destroy(this.dw_estado)
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
dw_estado.dataobject		= 'dwe_estado_personal_vta'
dw_estado.settransobject(sqlca)
dw_estado.insertrow(0)

dw_tipo_pago.dataobject		= 'dwe_tipo_pago'
dw_tipo_pago.settransobject(sqlca)
dw_tipo_pago.insertrow(0)

gf_centrar(w_traspaso_comi_vtas)
if gl_proceso >= 4 then
	dw_archivo.dataobject		= 'dwe_archivo_exp'
	dw_archivo.settransobject(sqlca)
	ls_dia = '15'
	ls_mes = string(Month(today()))
	ls_anno = string(year(today()))
	em_fecha_comi.text = ls_dia+'/'+ls_mes+'/'+ls_anno 
else
	messagebox("Advertencia","Usuario No Autorizado")
	close(w_traspaso_comi_vtas)
end if
	



end event

event close;disconnect using Trans_1;
end event

type st_3 from statictext within w_traspaso_comi_vtas
integer x = 274
integer y = 352
integer width = 224
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tipo Pago"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_tipo_pago from datawindow within w_traspaso_comi_vtas
integer x = 507
integer y = 340
integer width = 635
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dwe_tipo_pago"
boolean border = false
boolean livescroll = true
end type

type st_2 from statictext within w_traspaso_comi_vtas
integer x = 297
integer y = 472
integer width = 201
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Estado"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_estado from datawindow within w_traspaso_comi_vtas
integer x = 512
integer y = 448
integer width = 617
integer height = 96
integer taborder = 30
string title = "none"
string dataobject = "dwe_estado_personal_vta"
boolean border = false
boolean livescroll = true
end type

type hpb_1 from hprogressbar within w_traspaso_comi_vtas
boolean visible = false
integer x = 1088
integer y = 1060
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_traspaso_comi_vtas
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

type dw_archivo from datawindow within w_traspaso_comi_vtas
integer x = 1563
integer y = 136
integer width = 411
integer height = 432
integer taborder = 40
string title = "none"
string dataobject = "dwe_archivo_exp"
boolean livescroll = true
end type

type cb_aceptar from commandbutton within w_traspaso_comi_vtas
integer x = 119
integer y = 688
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
string		ls_cod_contab,ls_haber,ls_string,ls_nombre_arch,ls_cod,&
			ls_rut_exp,ls_pago_exp,ls_estado,ls_desc_est,ls_tipo_pago
long		ll_rut,ll_suma,ll_new,ll_pago_cta,ll_rut_cta,ll_res
datetime	ldt_fecha

ldt_fecha										= datetime(date(em_fecha_comi.text),time('00:00:00'))
ls_haber										= 'H'
ls_estado									= dw_estado.getitemstring(1,'estado') 
ls_tipo_pago								= dw_tipo_pago.getitemstring(1,'tipo_pago') 
if ls_estado='A' then
	ls_desc_est								= 'ACTIVO'
elseif ls_estado='I' then
	ls_desc_est								= 'INACTIVO'
end if
if not isnull(ls_estado) and ls_estado<>'' then
	SetPointer(HourGlass!)
	if gs_empresa = 'El Prado' then
		if ls_tipo_pago='C' then
			ls_nombre_arch 				= '03_SANTIAGO_COMISIONES_VENTAS'+'_'+ls_desc_est+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
		elseif ls_tipo_pago='P' then
			ls_nombre_arch 				= '04_SANTIAGO_PERSISTENCIA_VENTAS'+'_'+ls_desc_est+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
		end if
	elseif gs_empresa = 'La Foresta' then
		if ls_tipo_pago='C' then
			ls_nombre_arch 				= '03_SERENA_COMISIONES_VENTAS'+'_'+ls_desc_est+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
		elseif ls_tipo_pago='P' then
			ls_nombre_arch 				= '04_SERENA_PERSISTENCIA_VENTAS'+'_'+ls_desc_est+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
		end if
	elseif gs_empresa = 'Concepcion' then
		if ls_tipo_pago='C' then
			ls_nombre_arch 				= '03_CONCE_COMISIONES_VENTAS'+'_'+ls_desc_est+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
		elseif ls_tipo_pago='P' then
			ls_nombre_arch 				= '04_CONCE_PERSISTENCIA_VENTAS'+'_'+ls_desc_est+'_'+mid(em_fecha_comi.text,1,2)+mid(em_fecha_comi.text,4,2)+mid(em_fecha_comi.text,7,4)
		end if
	end if
	ll_res											= messagebox(gs_app_name,'Archivo quedará en C:\Archivo\'+ls_nombre_arch+'.TXT~r~n¿ Desea Continuar ?',information!,YesNo! ,2) 
	if ll_res = 1 then
		DECLARE x1 CURSOR FOR
		SELECT DISTINCT "RES_COMI"."RUT","RES_COMI"."COD_AGE_SUP"  
		FROM		"RES_COMI",	"AGENTES"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "AGENTES"."COD_AGE" and 
					( "RES_COMI"."ESTADO_AGE_SUP" = :ls_estado ) AND  
					( "RES_COMI"."FECHA" = :ldt_fecha ) AND
					"AGENTES"."PAGOS_VENTA" = 'S'
		UNION
		SELECT DISTINCT "RES_COMI"."RUT","RES_COMI"."COD_AGE_SUP"  
		FROM		"RES_COMI",	"SUPERVISOR"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "SUPERVISOR"."COD_SUP" and 
					( "RES_COMI"."ESTADO_AGE_SUP" = :ls_estado ) AND  
					( "RES_COMI"."FECHA" = :ldt_fecha ) AND
					"SUPERVISOR"."PAGOS_VENTA" = 'S'
		UNION
		SELECT DISTINCT "RES_COMI"."RUT","RES_COMI"."COD_AGE_SUP"  
		FROM		"RES_COMI",	"JEFE_VENTAS"  
		WHERE	"RES_COMI"."COD_AGE_SUP" = "JEFE_VENTAS"."JEFE_VENTAS" and 
					( "RES_COMI"."ESTADO_AGE_SUP" = :ls_estado ) AND  
					( "RES_COMI"."FECHA" = :ldt_fecha ) AND
					"JEFE_VENTAS"."PAGOS_VENTA" = 'S'			
		USING	Trans_1;
		open x1;
		if Trans_1.sqlcode=0 then
			DO WHILE Trans_1.sqlcode=0
			fetch x1 INTO	:ll_rut,:ls_cod;
				if not isnull(ll_rut) and ll_rut > 0 then
					if ls_tipo_pago='C' then
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_023)
						ll_suma						= f_res_comi_consul(ls_cod,'023',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				 	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'023'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_037)
						ll_suma						= f_res_comi_consul(ls_cod,'037',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				 	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'037'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_022)
						ll_suma						= f_res_comi_consul(ls_cod,'022',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				   	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'022'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_036)
						ll_suma						= f_res_comi_consul(ls_cod,'036',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				   	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'036'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_089)
						ll_suma						= f_res_comi_consul(ls_cod,'089',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				   	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'089'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_050)
						ll_suma						= f_res_comi_consul(ls_cod,'050',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				   	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'050'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					elseif ls_tipo_pago='P' then
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_090)
						ll_suma						= f_res_comi_consul(ls_cod,'090',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				   	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'090'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_028)
						ll_suma						= f_res_comi_consul(ls_cod,'028',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				   	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'028'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
						//ll_suma						= wf_total_pago(ll_rut,ldt_fecha,ls_cod_contab_053)
						ll_suma						= f_res_comi_consul(ls_cod,'053',ldt_fecha)
						if not isnull(ll_suma) and ll_suma>0 then
							ll_new					= dw_archivo.insertrow(0)
							dw_archivo.scrolltorow(ll_new)
							ll_rut_cta				   	= len(String(ll_rut))
							ls_rut_exp				= fill(' ',10 - ll_rut_cta)+trim(string(ll_rut))
							ll_pago_cta				= len(string(ll_suma))
							ls_pago_exp				= fill(' ',12 - ll_pago_cta)+trim(string(ll_suma))
							ls_string					= ls_haber+'053'+ls_rut_exp+ls_pago_exp
							dw_archivo.setitem(ll_new,"linea",ls_string)
						end if
					end if
				end if
				setnull(ll_rut)
			LOOP
		end if
		close x1;
		dw_archivo.SaveAs( "C:\Archivo\"+ls_nombre_arch+".TXT", CSV!, FALSE)
		dw_archivo.reset()
	else
		if gs_empresa = 'El Prado' then
			messagebox(gs_app_name,'No existen datos a traspasar; "PRADO_COMIS_AGENTE_VENTA"',stopsign!)
		elseif gs_empresa = 'La Foresta' then
			messagebox(gs_app_name,'No existen datos a traspasar; "FORESTA_COMIS_AGENTE_VENTA"',stopsign!)
		elseif gs_empresa = 'Concepcion' then
			messagebox(gs_app_name,'No existen datos a traspasar; "CONCE_COMIS_AGENTE_VENTA"',stopsign!)
		end if
	end if
	SetPointer(Arrow!)
	close(w_traspaso_comi_vtas)
else
	if isnull(ls_estado) or ls_estado='' then
		messagebox("Advertencia","Debe Ingresar Estado del Personal de Ventas")
		dw_estado.setfocus()
	end if
end if
end event

type st_1 from statictext within w_traspaso_comi_vtas
integer x = 297
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
string text = "Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_traspaso_comi_vtas
integer x = 1029
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

type em_fecha_comi from editmask within w_traspaso_comi_vtas
integer x = 517
integer y = 228
integer width = 507
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

type cb_cerrar from commandbutton within w_traspaso_comi_vtas
integer x = 1051
integer y = 688
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

event clicked;close(w_traspaso_comi_vtas)
end event

type gb_1 from groupbox within w_traspaso_comi_vtas
integer x = 119
integer y = 92
integer width = 1234
integer height = 544
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Archivo Traspaso Personal Ventas"
end type

