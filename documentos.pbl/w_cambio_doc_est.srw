forward
global type w_cambio_doc_est from window
end type
type cb_modificar from commandbutton within w_cambio_doc_est
end type
type p_1 from picture within w_cambio_doc_est
end type
type st_3 from statictext within w_cambio_doc_est
end type
type em_1 from editmask within w_cambio_doc_est
end type
type st_2 from statictext within w_cambio_doc_est
end type
type st_1 from statictext within w_cambio_doc_est
end type
type mle_1 from multilineedit within w_cambio_doc_est
end type
type ddlb_1 from dropdownlistbox within w_cambio_doc_est
end type
type cb_1 from commandbutton within w_cambio_doc_est
end type
type dw_1 from uo_datawindow within w_cambio_doc_est
end type
type gb_1 from groupbox within w_cambio_doc_est
end type
type gb_2 from groupbox within w_cambio_doc_est
end type
type cb_2 from commandbutton within w_cambio_doc_est
end type
end forward

global type w_cambio_doc_est from window
integer x = 837
integer y = 588
integer width = 2066
integer height = 1588
boolean titlebar = true
string title = "Cambia de Estado"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_modificar cb_modificar
p_1 p_1
st_3 st_3
em_1 em_1
st_2 st_2
st_1 st_1
mle_1 mle_1
ddlb_1 ddlb_1
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
cb_2 cb_2
end type
global w_cambio_doc_est w_cambio_doc_est

type variables
String		is_estado_cheque, is_base, is_serie
Double	il_numero
end variables

on w_cambio_doc_est.create
this.cb_modificar=create cb_modificar
this.p_1=create p_1
this.st_3=create st_3
this.em_1=create em_1
this.st_2=create st_2
this.st_1=create st_1
this.mle_1=create mle_1
this.ddlb_1=create ddlb_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.cb_2=create cb_2
this.Control[]={this.cb_modificar,&
this.p_1,&
this.st_3,&
this.em_1,&
this.st_2,&
this.st_1,&
this.mle_1,&
this.ddlb_1,&
this.cb_1,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.cb_2}
end on

on w_cambio_doc_est.destroy
destroy(this.cb_modificar)
destroy(this.p_1)
destroy(this.st_3)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.ddlb_1)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.cb_2)
end on

event open;LONG 		FOLIO,N_CHEQUE,COD_BANCO,MONTO,NUM_CHEQUES,i
DATETIME FECHA_VENC,FECHA_PAGO,FECHA_ESTADO_CH
STRING 	COD_PAGO,TIPO_COB,REZAGO,COD_CAJA,ESTADO_CH,GLOSA_CH,ls_estado_ch,&
			ls_descrip,ls_estado_comp

gf_centrar(w_cambio_doc_est)

if isvalid(w_listados_x_subtotales) then dw_1.DataObject = st_param_dcto.datawindows
if isvalid(w_listados_x_subtotales_rezago) then dw_1.DataObject = st_param_dcto.datawindows
if isvalid(w_listado_documentos_por_nro_cheque) then dw_1.DataObject = st_param_dcto.datawindows //nuevo
dw_1.settransobject(sqlca)
if dw_1.retrieve(st_param_dcto.folio, st_param_dcto.rut, st_param_dcto.num_cheque) > 0 then
	FOLIO       		= dw_1.getitemnumber(1,'documentos_folio')
	TIPO_COB    	= dw_1.getitemstring(1,'DOCUMENTOS_TIPO_COB')
	N_CHEQUE    	= dw_1.getitemnumber(1,'DOCUMENTOS_N_CHEQUE')
	COD_BANCO   	= dw_1.getitemnumber(1,'DOCUMENTOS_COD_BANCO')
	MONTO       	= dw_1.getitemnumber(1,'DOCUMENTOS_MONTO')
	FECHA_VENC  	= dw_1.getitemdatetime(1,'DOCUMENTOS_FECHA_VENC')
	COD_PAGO    	= dw_1.getitemstring(1,'DOCUMENTOS_COD_PAGO')
	NUM_CHEQUES	= dw_1.getitemnumber(1,'DOCUMENTOS_NUM_CHEQUES')
	REZAGO      		= dw_1.getitemstring(1,'DOCUMENTOS_REZAGO')
	FECHA_PAGO  	= dw_1.getitemdatetime(1,'DOCUMENTOS_FECHA_PAGO')
	COD_CAJA    	= dw_1.getitemstring(1,'DOCUMENTOS_COD_CAJA')
	dw_1.accepttext()
	SELECT DISTINCT "INGRESO"."BASE",  	"INGRESO"."SERIE",  	"INGRESO"."CONTRATO"  
	INTO 					:is_base,   				:is_serie,   				:il_numero  
	FROM 	"INGRESO"  
	WHERE ( "INGRESO"."TIPO_COB" = :TIPO_COB ) AND  
			  ( "INGRESO"."FOLIO" = :FOLIO ) AND  
			  ( "INGRESO"."FECHA_PAGO" = :FECHA_PAGO )   
	USING	sqlca;
	
	SELECT 	"DOCUMENTOS"."ESTADO_CH",   
				"DOCUMENTOS"."GLOSA_CH" , 
				"DOCUMENTOS"."FECHA_ESTADO_CH"  
	INTO 		:ESTADO_CH,   
				:GLOSA_CH , 
				:FECHA_ESTADO_CH
	FROM 	"DOCUMENTOS"  
	WHERE  ( "DOCUMENTOS"."FOLIO"       = :FOLIO       ) AND  
			 ( "DOCUMENTOS"."TIPO_COB"    = :TIPO_COB    ) AND  
			 ( "DOCUMENTOS"."N_CHEQUE"    = :N_CHEQUE    ) AND  
			 ( "DOCUMENTOS"."COD_BANCO"   = :COD_BANCO   ) AND  
			 ( "DOCUMENTOS"."MONTO"       = :MONTO       ) AND  
			 ( "DOCUMENTOS"."FECHA_VENC"  = :FECHA_VENC  ) AND  
			 ( "DOCUMENTOS"."COD_PAGO"    = :COD_PAGO    ) AND  
			 ( "DOCUMENTOS"."NUM_CHEQUES" = :NUM_CHEQUES ) AND  
			 ( "DOCUMENTOS"."REZAGO"      = :REZAGO      ) AND  
			 ( "DOCUMENTOS"."FECHA_PAGO"  = :FECHA_PAGO  ) AND  
			 ( "DOCUMENTOS"."COD_CAJA"    = :COD_CAJA    )   
	USING		sqlca;
	is_estado_cheque	= ESTADO_CH
	DECLARE 	x1 CURSOR FOR  
	SELECT 	"ESTADO_CHEQUE"."ESTADO_CH",   
				"ESTADO_CHEQUE"."DESCRIPCION"  
	FROM 	"ESTADO_CHEQUE"  
	USING	sqlca;
	if sqlca.sqlcode=0 then
		open x1;
		DO WHILE sqlca.sqlcode=0 
			fetch x1 into :ls_estado_ch, :ls_descrip;
			if not isnull(ls_estado_ch) then
				ls_estado_comp	= ls_estado_ch + ' - '+ls_descrip
				ddlb_1.additem(ls_estado_comp)
			end if
			setnull(ls_estado_ch)
		LOOP
		close x1;
	end if
end if
for i = 1 to ddlb_1.totalitems ()
	if mid(ddlb_1.text(i),1,1) = ESTADO_CH then
		ddlb_1.SelectItem(i)
	end if
next
mle_1.text = GLOSA_CH
IF ISNULL(FECHA_ESTADO_CH) THEN
	SELECT DISTINCT sysdate INTO :FECHA_ESTADO_CH FROM "AGENTES"  ;
	em_1.TEXT = STRING(DATE(FECHA_ESTADO_CH),'dd/mm/yyyy')
	st_3.text = 'Fecha Servidor'
ELSE
	em_1.TEXT = STRING(DATE(FECHA_ESTADO_CH),'dd/mm/yyyy')
END IF
if is_estado_cheque='C' then
	if gs_depto='I' then
		ddlb_1.enabled	= true
	else
		ddlb_1.enabled	= false
	end if
else
	ddlb_1.enabled		= true
end if
end event

type cb_modificar from commandbutton within w_cambio_doc_est
integer x = 777
integer y = 1332
integer width = 507
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reemplazar Cheque"
end type

event clicked;Long		folio
Double	ll_numero
String	tipo_cob,ls_string,ls_base,ls_serie
Datetime	fecha_pago
FOLIO       		= dw_1.getitemnumber  (1,'documentos_folio')
TIPO_COB    		= dw_1.getitemstring  (1,'documentos_tipo_cob')
FECHA_PAGO  		= dw_1.getitemdatetime(1,'documentos_fecha_pago')
SELECT DISTINCT 	"INGRESO"."BASE",   
						"INGRESO"."SERIE",   
						"INGRESO"."CONTRATO"  
INTO 					:ls_base,   
						:ls_serie,   
						:ll_numero  
FROM 					"INGRESO"  
WHERE  			 ( "INGRESO"."TIPO_COB" = :TIPO_COB ) AND  
					 ( "INGRESO"."FOLIO" = :FOLIO ) AND  
					 ( "INGRESO"."FECHA_PAGO" = :FECHA_PAGO )   
USING					sqlca;
//if ll_numero>0 then
	ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+TIPO_COB+'~t'+string(FOLIO)+'~t'+string(FECHA_PAGO)
	if isvalid(w_reeplazar_documentos) then close(w_reeplazar_documentos)
	openwithparm(w_reeplazar_documentos,ls_string)
//end if
end event

type p_1 from picture within w_cambio_doc_est
integer x = 1856
integer y = 1152
integer width = 82
integer height = 96
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf
//datetime fecha

if f_valida_fecha(em_1.text)=-1 then 
	em_1.text=string(today(),gs_formato_fecha)
	em_1.setfocus()
	return
end if	
if em_1.text<>'00/00/0000' then
	ls_fecha = em_1.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_1.text = Message.StringParm
	st_3.text = 'Fecha de Estado'
end if	
//fech = em_2.text
//fecha = datetime(date(fech),time('00:00:00'))
end event

type st_3 from statictext within w_cambio_doc_est
integer x = 974
integer y = 1164
integer width = 503
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Fecha de Estado"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_1 from editmask within w_cambio_doc_est
integer x = 1481
integer y = 1152
integer width = 370
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "Ì"
end type

type st_2 from statictext within w_cambio_doc_est
integer x = 133
integer y = 1164
integer width = 187
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Estado"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cambio_doc_est
integer x = 133
integer y = 572
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "Glosa :"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_cambio_doc_est
integer x = 133
integer y = 628
integer width = 1810
integer height = 504
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_1 from dropdownlistbox within w_cambio_doc_est
integer x = 338
integer y = 1152
integer width = 631
integer height = 552
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_cambio_doc_est
integer x = 1746
integer y = 1332
integer width = 265
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cambio_doc_est)
end event

type dw_1 from uo_datawindow within w_cambio_doc_est
integer x = 91
integer y = 84
integer width = 1888
integer height = 416
integer taborder = 0
string dataobject = "dw_documentos_x_fecha_rezago"
boolean hscrollbar = false
boolean vscrollbar = false
end type

type gb_1 from groupbox within w_cambio_doc_est
integer x = 50
integer y = 16
integer width = 1957
integer height = 500
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

type gb_2 from groupbox within w_cambio_doc_est
integer x = 50
integer y = 520
integer width = 1957
integer height = 768
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
end type

type cb_2 from commandbutton within w_cambio_doc_est
integer x = 50
integer y = 1332
integer width = 261
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;LONG		FOLIO,N_CHEQUE,COD_BANCO,MONTO,NUM_CHEQUES,ll_count
DATETIME FECHA_VENC,FECHA_PAGO,FECHA_ESTADO_CH
STRING 	COD_PAGO,TIPO_COB,REZAGO,COD_CAJA,ESTADO_CH,GLOSA_CH,ls_string,ls_estado_ori, ls_estado_fac,ls_estado_factura,ls_estado_ctto

ESTADO_CH 						= mid(ddlb_1.text,1,1)
if ESTADO_CH <> is_estado_cheque and not isnull(ESTADO_CH) and ESTADO_CH <> '' then
	if len(ddlb_1.text) = 0 then
		messagebox('Estado','Debe seleccionar Estado',information!)
		ddlb_1.setfocus()
		return
	else
		if len(mle_1.text) = 0 then
			messagebox('Glosa','Debe Escribir Glosa',information!)
			mle_1.setfocus()
			return
		else
			if messagebox('Grabar','Desea Grabar los Cambios',Question!,YesNo!) = 1 then
				FOLIO       			= dw_1.getitemnumber  (1,'DOCUMENTOS_FOLIO')
				TIPO_COB    		= dw_1.getitemstring  (1,'DOCUMENTOS_TIPO_COB')
				N_CHEQUE    		= dw_1.getitemnumber  (1,'DOCUMENTOS_N_CHEQUE')
				COD_BANCO   		= dw_1.getitemnumber  (1,'DOCUMENTOS_COD_BANCO')
				MONTO       		= dw_1.getitemnumber  (1,'DOCUMENTOS_MONTO')
				FECHA_VENC  		= dw_1.getitemdatetime(1,'DOCUMENTOS_FECHA_VENC')
				COD_PAGO    		= dw_1.getitemstring  (1,'DOCUMENTOS_COD_PAGO')
				NUM_CHEQUES 	= dw_1.getitemnumber  (1,'DOCUMENTOS_NUM_CHEQUES')
				REZAGO      			= dw_1.getitemstring  (1,'DOCUMENTOS_REZAGO')
				FECHA_PAGO  		= dw_1.getitemdatetime(1,'DOCUMENTOS_FECHA_PAGO')
				COD_CAJA    		= dw_1.getitemstring  (1,'DOCUMENTOS_COD_CAJA')
				GLOSA_CH  			= mle_1.text
				FECHA_ESTADO_CH	= DATETIME(DATE(em_1.TEXT),TIME('00:00:00'))
				SELECT DISTINCT	"CADENA"."ESTADO", 	"ESTADO"."ESTADO_FACTURACION"  
				INTO 					:ls_estado_ctto  ,			:ls_estado_factura
				FROM 	"CADENA"  , "ESTADO"
				WHERE 	( "CADENA"."CODIGO" = :is_base ) AND  
							( "CADENA"."SERIE" = :is_serie ) AND  
							( "CADENA"."NUMERO" = :il_numero )  AND
							( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" )
				USING	sqlca;
				if mid(ddlb_1.text,1,1) = 'D' then
					open(w_modifica_fech_venc)
					if not isnull(Message.StringParm) then
						FECHA_VENC	= datetime(date(Message.StringParm),time('00:00:00'))
					end if
	//			elseif mid(ddlb_1.text,1,1) = 'R' then
	//				ls_string	= ls_base+'~t'+ls_serie+'~t'+string(ll_numero)+'~t'+TIPO_COB+'~t'+string(FOLIO)+'~t'+string(FECHA_PAGO)
	//				if isvalid(w_reeplazar_documentos) then close(w_reeplazar_documentos)
	//				openwithparm(w_reeplazar_documentos,ls_string)
	//				open(w_update_documento)
	//				if not isnull(Message.StringParm) then
	//					FECHA_VENC	= datetime(date(Message.StringParm),time('00:00:00'))
	//				end if
				end if
				UPDATE	"DOCUMENTOS"  
				SET   	"ESTADO_CH" = :ESTADO_CH,   
							"GLOSA_CH" = :GLOSA_CH ,
							"FECHA_VENC" = :FECHA_VENC,
							"FECHA_ESTADO_CH" = :FECHA_ESTADO_CH
				WHERE  ( "DOCUMENTOS"."FOLIO" = :FOLIO) AND  
						 ( "DOCUMENTOS"."TIPO_COB" = :TIPO_COB) AND  
						 ( "DOCUMENTOS"."N_CHEQUE" = :N_CHEQUE) AND  
						 ( "DOCUMENTOS"."COD_BANCO" = :COD_BANCO) AND  
						 ( "DOCUMENTOS"."MONTO" = :MONTO) AND  
						 ( "DOCUMENTOS"."COD_PAGO" = :COD_PAGO) AND  
						 ( "DOCUMENTOS"."NUM_CHEQUES" = :NUM_CHEQUES) AND  
						 ( "DOCUMENTOS"."REZAGO" = :REZAGO) AND  
						 ( "DOCUMENTOS"."FECHA_PAGO" = :FECHA_PAGO) AND  
						 ( "DOCUMENTOS"."COD_CAJA" = :COD_CAJA) 
				USING		sqlca;
				if sqlca.sqlcode = 0 then
					commit using sqlca;
					if ESTADO_CH <> is_estado_cheque then
						if il_numero > 0 then
							if (is_estado_cheque = 'P' or is_estado_cheque = 'T') and ESTADO_CH <> 'P' and ESTADO_CH <> 'T' then
								SELECT	Count("DOCUMENTOS"."ESTADO_CH")  
								INTO 		:ll_count  
								FROM 	"DOCUMENTOS",   
											"INGRESO"  
								WHERE  (( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
										 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
										 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
										 ( "INGRESO"."BASE" = :is_base AND  
											"INGRESO"."SERIE" = :is_serie AND  
											"INGRESO"."CONTRATO" = :il_numero AND  
											"DOCUMENTOS"."ESTADO_CH" = 'T')) OR  
										 (( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
										 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
										 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and 
										 ( "INGRESO"."BASE" = :is_base AND  
											"INGRESO"."SERIE" = :is_serie AND  
											"INGRESO"."CONTRATO" = :il_numero AND  
											"DOCUMENTOS"."ESTADO_CH" = 'P'))
								USING		sqlca;
								if ll_count > 0 then
									messagebox("Advertencia","No es Posible dejar Contrato en Estado Vigente por Tener "+string(ll_count)+' Cheque(s) en Estado P-PROTESTO o T-CASTIGADO')
								else
									if ls_estado_factura <> 'R' and ls_estado_ctto <> 'C' then
										UPDATE	"CADENA"  
										SET 		"ESTADO" = 'V'
										WHERE  ( "CADENA"."CODIGO" = :is_base ) AND  
												 ( "CADENA"."SERIE" = :is_serie ) AND  
												 ( "CADENA"."NUMERO" = :il_numero )   
										using		SQLCA;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
											messagebox('Error Grabar','Error al grabar SQL '+sqlca.sqlerrtext)
										end if
									end if
								end if

							elseif ESTADO_CH = 'R' then
								ls_string	= is_base+'~t'+is_serie+'~t'+string(il_numero)+'~t'+TIPO_COB+'~t'+string(FOLIO)+'~t'+string(FECHA_PAGO)
								if isvalid(w_reeplazar_documentos) then close(w_reeplazar_documentos)
								openwithparm(w_reeplazar_documentos,ls_string)

							elseif ESTADO_CH = 'P' or ESTADO_CH = 'T' then
//								SELECT 	"CADENA"."ESTADO", 	"ESTADO"."ESTADO_FACTURACION"  
//								INTO 		:ls_estado_ori,   			:ls_estado_fac  
//								FROM 	"CADENA",  		"ESTADO"  
//								WHERE ( "CADENA"."ESTADO" = "ESTADO"."COD_ESTADO" ) and  
//										   ( "CADENA"."CODIGO" = :is_base ) AND  
//										   ( "CADENA"."SERIE" = :is_serie ) AND  
//										   ( "CADENA"."NUMERO" = :il_numero )    ;
//								if ls_estado_fac = 'R' or ls_estado_ori = 'C' then
//									// No se debe Modificar Estado Contrato
//								else
									if ls_estado_factura <> 'R' and ls_estado_ctto <> 'C' then
										UPDATE	"CADENA"  
										SET 		"ESTADO" = 'T'
										WHERE  ( "CADENA"."CODIGO" = :is_base ) AND  
												 ( "CADENA"."SERIE" = :is_serie ) AND  
												 ( "CADENA"."NUMERO" = :il_numero )   
										using		SQLCA;
										if sqlca.sqlcode=0 then
											commit;
										else
											rollback;
											messagebox('Error Grabar','Error al grabar SQL '+sqlca.sqlerrtext)
										end if
									end if
//								end if
							end if
						end if
					end if
				else
					ROLLBACK using sqlca;
					messagebox('Error','Se produjo un error al grabar el estado SQL '+sqlca.sqlerrtext)
				end if
				close(w_cambio_doc_est)
			end if
		end if
	end if
end if
end event

