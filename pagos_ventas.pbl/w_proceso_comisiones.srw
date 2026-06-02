forward
global type w_proceso_comisiones from window
end type
type em_uf_cierre from editmask within w_proceso_comisiones
end type
type st_uf_cierre from statictext within w_proceso_comisiones
end type
type pb_procesar from picturebutton within w_proceso_comisiones
end type
type dw_lista from datawindow within w_proceso_comisiones
end type
type st_desde from statictext within w_proceso_comisiones
end type
type st_final from statictext within w_proceso_comisiones
end type
type em_final from editmask within w_proceso_comisiones
end type
type p_1 from picture within w_proceso_comisiones
end type
type p_2 from picture within w_proceso_comisiones
end type
type em_desde from editmask within w_proceso_comisiones
end type
type cb_trasp_com_at from commandbutton within w_proceso_comisiones
end type
type cb_trasp_com_age from commandbutton within w_proceso_comisiones
end type
type cb_act_anexo_lib from commandbutton within w_proceso_comisiones
end type
type cb_act_promesas from commandbutton within w_proceso_comisiones
end type
type cb_pre_reprog from commandbutton within w_proceso_comisiones
end type
type cb_pre_1_sup from commandbutton within w_proceso_comisiones
end type
type cb_pre_jefe from commandbutton within w_proceso_comisiones
end type
type cb_cal_at_terreno from commandbutton within w_proceso_comisiones
end type
type cb_cal_prom_cast from commandbutton within w_proceso_comisiones
end type
type cb_cal_prom_ch_fec from commandbutton within w_proceso_comisiones
end type
type cb_cal_tipo_comi from commandbutton within w_proceso_comisiones
end type
type cb_cal_ver_rescomi from commandbutton within w_proceso_comisiones
end type
type cb_cal_liberador from commandbutton within w_proceso_comisiones
end type
type cb_cal_promesas from commandbutton within w_proceso_comisiones
end type
type cb_cerrar from commandbutton within w_proceso_comisiones
end type
type gb_1 from groupbox within w_proceso_comisiones
end type
type gb_2 from groupbox within w_proceso_comisiones
end type
type gb_3 from groupbox within w_proceso_comisiones
end type
type gb_4 from groupbox within w_proceso_comisiones
end type
type gb_5 from groupbox within w_proceso_comisiones
end type
end forward

global type w_proceso_comisiones from window
integer width = 3552
integer height = 2112
boolean titlebar = true
string title = "Proceso Comisiones"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
em_uf_cierre em_uf_cierre
st_uf_cierre st_uf_cierre
pb_procesar pb_procesar
dw_lista dw_lista
st_desde st_desde
st_final st_final
em_final em_final
p_1 p_1
p_2 p_2
em_desde em_desde
cb_trasp_com_at cb_trasp_com_at
cb_trasp_com_age cb_trasp_com_age
cb_act_anexo_lib cb_act_anexo_lib
cb_act_promesas cb_act_promesas
cb_pre_reprog cb_pre_reprog
cb_pre_1_sup cb_pre_1_sup
cb_pre_jefe cb_pre_jefe
cb_cal_at_terreno cb_cal_at_terreno
cb_cal_prom_cast cb_cal_prom_cast
cb_cal_prom_ch_fec cb_cal_prom_ch_fec
cb_cal_tipo_comi cb_cal_tipo_comi
cb_cal_ver_rescomi cb_cal_ver_rescomi
cb_cal_liberador cb_cal_liberador
cb_cal_promesas cb_cal_promesas
cb_cerrar cb_cerrar
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
end type
global w_proceso_comisiones w_proceso_comisiones

type variables
Long	il_opcion
end variables

on w_proceso_comisiones.create
this.em_uf_cierre=create em_uf_cierre
this.st_uf_cierre=create st_uf_cierre
this.pb_procesar=create pb_procesar
this.dw_lista=create dw_lista
this.st_desde=create st_desde
this.st_final=create st_final
this.em_final=create em_final
this.p_1=create p_1
this.p_2=create p_2
this.em_desde=create em_desde
this.cb_trasp_com_at=create cb_trasp_com_at
this.cb_trasp_com_age=create cb_trasp_com_age
this.cb_act_anexo_lib=create cb_act_anexo_lib
this.cb_act_promesas=create cb_act_promesas
this.cb_pre_reprog=create cb_pre_reprog
this.cb_pre_1_sup=create cb_pre_1_sup
this.cb_pre_jefe=create cb_pre_jefe
this.cb_cal_at_terreno=create cb_cal_at_terreno
this.cb_cal_prom_cast=create cb_cal_prom_cast
this.cb_cal_prom_ch_fec=create cb_cal_prom_ch_fec
this.cb_cal_tipo_comi=create cb_cal_tipo_comi
this.cb_cal_ver_rescomi=create cb_cal_ver_rescomi
this.cb_cal_liberador=create cb_cal_liberador
this.cb_cal_promesas=create cb_cal_promesas
this.cb_cerrar=create cb_cerrar
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.Control[]={this.em_uf_cierre,&
this.st_uf_cierre,&
this.pb_procesar,&
this.dw_lista,&
this.st_desde,&
this.st_final,&
this.em_final,&
this.p_1,&
this.p_2,&
this.em_desde,&
this.cb_trasp_com_at,&
this.cb_trasp_com_age,&
this.cb_act_anexo_lib,&
this.cb_act_promesas,&
this.cb_pre_reprog,&
this.cb_pre_1_sup,&
this.cb_pre_jefe,&
this.cb_cal_at_terreno,&
this.cb_cal_prom_cast,&
this.cb_cal_prom_ch_fec,&
this.cb_cal_tipo_comi,&
this.cb_cal_ver_rescomi,&
this.cb_cal_liberador,&
this.cb_cal_promesas,&
this.cb_cerrar,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4,&
this.gb_5}
end on

on w_proceso_comisiones.destroy
destroy(this.em_uf_cierre)
destroy(this.st_uf_cierre)
destroy(this.pb_procesar)
destroy(this.dw_lista)
destroy(this.st_desde)
destroy(this.st_final)
destroy(this.em_final)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.em_desde)
destroy(this.cb_trasp_com_at)
destroy(this.cb_trasp_com_age)
destroy(this.cb_act_anexo_lib)
destroy(this.cb_act_promesas)
destroy(this.cb_pre_reprog)
destroy(this.cb_pre_1_sup)
destroy(this.cb_pre_jefe)
destroy(this.cb_cal_at_terreno)
destroy(this.cb_cal_prom_cast)
destroy(this.cb_cal_prom_ch_fec)
destroy(this.cb_cal_tipo_comi)
destroy(this.cb_cal_ver_rescomi)
destroy(this.cb_cal_liberador)
destroy(this.cb_cal_promesas)
destroy(this.cb_cerrar)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;Long	ll_uf_dia
Date	ld_fecha
gf_centrar(w_proceso_comisiones)
w_proceso_comisiones.title	= 'Proceso Calculo Comisiones Promesas'
dw_lista.dataobject	= 'dw_total_ofertas'
dw_lista.settransobject(sqlca)
il_opcion				= 1
st_desde.visible		= true
em_desde.visible		= true
p_1.visible				= true
st_final.visible		= false
em_final.visible		= false
p_2.visible				= false
em_desde.text			= string('15/'+string(month(date(gdt_fec_sistema)),'00')+'/'+string(year(date(gdt_fec_sistema)),'0000'))
ld_fecha					= date(em_desde.text)
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ll_uf_dia  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ld_fecha 
USING		sqlca;
if sqlca.sqlcode=0 then
	em_uf_cierre.text	= string(ll_uf_dia,"###,###,###,###,###")
else
	em_uf_cierre.text	= ''
end if

end event

type em_uf_cierre from editmask within w_proceso_comisiones
integer x = 2071
integer y = 164
integer width = 411
integer height = 96
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,##0"
end type

type st_uf_cierre from statictext within w_proceso_comisiones
integer x = 1655
integer y = 172
integer width = 389
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "U.F. Cierre"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_procesar from picturebutton within w_proceso_comisiones
integer x = 2546
integer y = 140
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;Datetime	ldt_fecha

SetPointer(HourGlass!)
CHOOSE CASE il_opcion
	CASE 1
		ldt_fecha						= datetime(date(em_desde.text),time('23:59:59'))
		if dw_lista.retrieve(ldt_fecha)=0 then
			messagebox("Advertencia","No Registra Dato")
		else
//			double 	i,monto,precio,contrato,total,total_sup,total_jefe,cont = 0
//			double 	porcentaje,porc_ing,porc_sup,uf,rut_age,rut_sup,rut_jefe,porc_jefe,monto_venc
//			string 	fech,moneda,agente,mes,serie,estado_comi,supervisor,haber,cod_contable,jefe, &
//					 	estado_age,estado_sup,estado_jefe,tipo_cont,estado_comi_sup
//			long 		malos = 0
//			date 		fecha_ingreso
//			datetime fecha_premio
//			
//			if f_valida_fecha(em_fecha_cierre.text)=-1 then 
//				em_fecha_cierre.text = string(today(),gs_formato_fecha)
//				em_fecha_cierre.setfocus()
//				return
//			end if
//			haber        = 'H'
//			cod_contable = '023'
//			fech         = em_fecha_cierre.text
//			fecha        = datetime(date(fech),time('00:00:00'))
//			mes          = string(Month(date(fecha)))
//			dw_1.settransobject(sqlca)
//			if dw_1.retrieve(date(fecha)) = 0 then
//				messagebox(gs_app_name,'No existe valor de U.F. al dia '+em_fecha_cierre.text+'.~n~rFavor de avisar al administrador del sistemas',stopsign!)
//				RETURN
//			else
//				em_uf_cierre.text = string(dw_1.getitemnumber(1,'valor_uf'))
//				uf = dw_1.getitemnumber(1,'valor_uf')
//			end if
//			if messagebox(gs_app_name,'El proceso de calculo de comisiones, se tardara algunos minutos.~n~r¿ Desea continuar ?',information!,yesno!,1) = 1 then
//				setpointer(HourGlass!)
//			//	DELETE FROM "RES_COMI"  
//			//   WHERE ( "RES_COMI"."FECHA" = :fecha ) AND  
//			//         ( "RES_COMI"."SERIE" = 'M' or "RES_COMI"."SERIE" = 'I' or "RES_COMI"."SERIE" = 'R'  or "RES_COMI"."SERIE" = 'S'  )  ;
//			//	if sqlca.sqlcode = -1 then
//			//		messagebox(gs_app_name,'Dar Aviso al administrador de sistemas,~r~n por el siguiente problema :~r~n'+sqlca.SQLErrText,stopsign!)
//			//		ROLLBACK;
//			//		return
//			//	else
//			//		commit;
//			//	end if
//				this.enabled = false
//				w_comisiones_ofertas.controlmenu = false
//				cb_cancelar.enabled = false
//				cb_imprimir.enabled = false
//				fecha = datetime(date(em_fecha_cierre.text),time('00:00:00'))
//				if dw_2.rowcount() >0 then
//					hpb_1.minposition = 0
//					hpb_1.maxposition = dw_2.rowcount()
//					hpb_1.setstep = 10
//					for i = 1 to dw_2.rowcount() step 1
//						dw_2.setitem(i,'uf',double(em_uf_cierre.text))
//						st_registros.text = string(i,'###,###,###,##0')+' '
//						monto             = round(dw_2.getitemnumber(i,'total'),0)
//						serie             = dw_2.getitemstring(i,'serie')	
//						contrato          = dw_2.getitemnumber(i,'contrato')	
//						moneda            = dw_2.getitemstring(i,'pago_oferta_moneda')
//			//---------------------------------------13-08-2007---------------------------------------
//			//			monto_venc        = f_monto('O',serie,contrato,moneda,fecha)
//			//			IF monto_venc > 0 THEN monto = monto_venc
//			//----------------------------------------------------------------------------------------
//						moneda            = dw_2.getitemstring(i,'pago_oferta_moneda')
//						precio            = dw_2.getitemnumber(i,'pago_oferta_precio')
//						agente            = dw_2.getitemstring(i,'oferta_v_cod_age')
//						jefe              = dw_2.getitemstring(i,'oferta_v_cod_jef')
//						supervisor        = dw_2.getitemstring(i,'oferta_v_cod_sup')	
//						estado_comi       = dw_2.getitemstring(i,'oferta_v_estado_comi')	
//						porc_ing          = dw_2.getitemnumber(i,'oferta_v_porce_venta')	
//						
//						porc_sup          = dw_2.getitemnumber(i,'supervisor_porc_supervisor')//oferta_v_porce_sup')
//						rut_age           = dw_2.getitemnumber(i,'agentes_rut')
//						rut_sup           = dw_2.getitemnumber(i,'supervisor_rut')
//						rut_jefe          = dw_2.getitemnumber(i,'jefe_ventas_rut')
//						porc_jefe         = dw_2.getitemnumber(i,'jefe_ventas_porc_jefe_vta')
//						estado_age        = dw_2.getitemSTRING(i,'agentes_estado')
//						estado_sup        = dw_2.getitemSTRING(i,'supervisor_estado')
//						estado_jefe       = dw_2.getitemSTRING(i,'jefe_ventas_estado')
//						tipo_cont         = dw_2.getitemSTRING(i,'agentes_tipo_cont')
//						fecha_ingreso     = date(dw_2.getitemdatetime(i,'oferta_v_fecha'))
//						estado_comi_sup   = dw_2.getitemstring(i,'oferta_v_estado_comi_sup')	
//						fecha_premio      = dw_2.getitemdatetime(i,'oferta_v_cierre_venta')
//						dw_2.setitem(i,'oferta_v_por_ingre',porcentaje)
//			//			SELECT max(FECHA) INTO :fecha_premio FROM RES_COMI WHERE COD_CONTABLE = '024' ;
//						dw_2.AcceptText()
//						if not isnull(fecha_premio) then
//			//---------- contratos antiguos 1 ------------------------			
//			//				if tipo_cont = '1' then
//			//					if moneda   = '1' then
//			//						porcentaje = round((double(monto)*100)/double(precio),0)
//			//						total      = round(  ((precio*porc_ing)/100)/1.25   ,0)
//			//						total_sup  = round(  ((precio*porc_sup)/100)   ,0)
//			//						total_jefe = round(  ((precio*porc_jefe)/100)  ,0)
//			//					else
//			//						porcentaje = round((double(monto)*100)/((double(precio)*double(em_uf_cierre.text))),0)
//			//						total      = round(  (((precio*double(em_uf_cierre.text))*porc_ing)/100)/1.25   ,0)
//			//						total_sup  = round(  (((precio*double(em_uf_cierre.text))*porc_sup)/100)   ,0)
//			//						total_jefe = round(  (((precio*double(em_uf_cierre.text))*porc_jefe)/100) ,0)
//			//					end if
//			//					if porcentaje >= 7 and (estado_comi = 'N' or estado_comi = 'U' or estado_comi = 'C') then
//			//						//Supervisores
//			//						if f_graba_res_comi(supervisor,rut_sup,monto,cod_contable,mes,fecha,contrato,serie,porcentaje,porc_sup,precio,total_sup,uf,haber,moneda,'P',estado_sup)= -1 then
//			//							malos = malos + 1					
//			//						else
//			//							cont = cont +1
//			//						end if			
//			//						//Jefes
//			//						if f_graba_res_comi(jefe,rut_jefe,monto,cod_contable,mes,fecha,contrato,serie,porcentaje,porc_jefe,precio,total_jefe,uf,haber,moneda,'P',estado_jefe)= -1 then
//			//							malos = malos + 1					
//			//						else
//			//							cont = cont + 1
//			//						end if		
//			//						SELECT "AGENTES"."COD_AGE"  
//			//						INTO :agente  
//			//						FROM "AGENTES"  
//			//						WHERE ( "AGENTES"."FECHA_INI" >= TO_DATE('8-May-2000 00:00:00','DD-MON-YYYY HH24:MI:SS') ) AND  
//			//								( "AGENTES"."ESTADO" = 'I' )  and "AGENTES"."COD_AGE" = :agente  ;
//			//						if sqlca.sqlcode <> 0 then
//			//							//Agentes
//			//							if estado_comi = 'N' then
//			//								if porcentaje >= 100 then
//			//									if moneda  = '1' then
//			//										total   = round((precio*(porc_ing)/100)*1.2,0)
//			//									else
//			//										total   = round(((((precio*double(em_uf_cierre.text))*porc_ing)/100) * 1.2),0)					
//			//									end if
//			//									if f_graba_res_comi(agente,rut_age,monto,cod_contable,mes,fecha,contrato,serie,porcentaje,(porc_ing*1.2),precio,total,uf,haber,moneda,'P',estado_age)= -1 then
//			//										malos = malos + 1					
//			//									else
//			//										cont = cont + 1
//			//									end if			
//			//								else	
//			//									if f_graba_res_comi(agente,rut_age,monto,cod_contable,mes,fecha,contrato,serie,porcentaje,porc_ing,precio,total,uf,haber,moneda,'P',estado_age)= -1 then
//			//										malos = malos + 1					
//			//									else
//			//										cont = cont + 1
//			//									end if			
//			//								end if	
//			//							end if	
//			//						end if
//			//					end if	
//			//				elseif tipo_cont = '2' then
//				//--------- contratos nuevos 2 ------------------------
//								if moneda   = '1' then
//									porcentaje = (double(monto)*100)/double(precio)
//									total      = round(  ((precio*porc_ing)/100),0)
//									total_sup  = round(  ((precio*porc_sup)/100),0)
//									total_jefe = round(  ((precio*porc_jefe)/100),0)
//								else
//									porcentaje = (double(monto)*100)/((double(precio)*double(em_uf_cierre.text)))
//									total      = round(  (((precio*double(em_uf_cierre.text))*porc_ing)/100),0)
//									total_sup  = round(  (((precio*double(em_uf_cierre.text))*porc_sup)/100),0)
//									total_jefe = round(  (((precio*double(em_uf_cierre.text))*porc_jefe)/100),0)
//								end if	
//								if porcentaje >= gd_porcentaje and (estado_comi = 'N' or estado_comi = 'U' or estado_comi = 'C') then
//									if estado_comi = 'N' then
//										SELECT "AGENTES"."COD_AGE"  
//										INTO :agente  
//										FROM "AGENTES"  
//										WHERE ( "AGENTES"."FECHA_INI" >= TO_DATE('8-May-2000 00:00:00','DD-MON-YYYY HH24:MI:SS') ) AND  
//												( "AGENTES"."ESTADO" = 'I' )  and "AGENTES"."COD_AGE" = :agente  ;
//										if sqlca.sqlcode <> 0 then
//											//Agentes
//			//								if porcentaje >= 100 then
//			//									if moneda  = '1' then
//			//										total   = round((precio*(porc_ing)/100),0)//round((precio*(porc_ing)/100)*1.2,0)
//			//									else
//			//										total   = round(((((precio*double(em_uf_cierre.text))*porc_ing)/100)),0)//round(((((precio*double(em_uf_cierre.text))*porc_ing)/100) * 1.2),0)
//			//									end if
//			//									if f_graba_res_comi(agente,rut_age,monto,cod_contable,mes,fecha,contrato,serie,porcentaje,(porc_ing*1.2),precio,total,uf,haber,moneda,'P',estado_age)= -1 then
//			//										malos = malos + 1					
//			//									else
//			//										cont = cont + 1
//			//									end if			
//			//								else	
//												if f_graba_res_comi(agente,rut_age,monto,cod_contable,mes,fecha,contrato,serie,porcentaje,porc_ing,precio,total,uf,haber,moneda,'P',estado_age)= -1 then
//													malos = malos + 1					
//												else
//													cont = cont + 1
//												end if			
//			//								end if
//										end if
//									end if	
//									if estado_comi_sup = 'N' then
//										//Supervisores
//										if f_graba_res_comi(supervisor,rut_sup,monto,cod_contable,mes,fecha,contrato,serie,porcentaje,porc_sup,precio,total_sup,uf,haber,moneda,'P',estado_sup)= -1 then
//											malos = malos + 1					
//										else
//											cont  = cont + 1
//										end if			
//										//Jefes
//										if f_graba_res_comi(jefe,rut_jefe,monto,cod_contable,mes,fecha,contrato,serie,porcentaje,porc_jefe,precio,total_jefe,uf,haber,moneda,'P',estado_jefe)= -1 then
//											malos = malos + 1					
//										else
//											cont  = cont + 1
//										end if
//									end if
//								end if	
//			//				end if
//						end if
//						hpb_1.position = i
//					next
//				else	
//				end if
//				this.enabled = true
//				w_comisiones_ofertas.controlmenu=true
//				cb_cancelar.enabled = true
//				cb_imprimir.enabled = true
//				st_registros.text = ''
//				hpb_1.position = 0
//				setpointer(Arrow!)
//				messagebox(gs_app_name,'Proceso terminado :~r~n'+string(cont,'###,###,##0')+' registros grabados con exito~r~n'+&
//								'y '+string(malos,'###,###,##0')+' registros con problemas.',information!)
//			end if
			cb_cal_promesas.italic	= true
			
		end if
END CHOOSE
SetPointer(Arrow!)
end event

type dw_lista from datawindow within w_proceso_comisiones
integer x = 41
integer y = 400
integer width = 2734
integer height = 1556
integer taborder = 80
string title = "none"
string dataobject = "dw_total_ofertas"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_desde from statictext within w_proceso_comisiones
integer x = 78
integer y = 164
integer width = 238
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inicial"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_final from statictext within w_proceso_comisiones
integer x = 837
integer y = 164
integer width = 256
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_final from editmask within w_proceso_comisiones
integer x = 1125
integer y = 164
integer width = 398
integer height = 96
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type p_1 from picture within w_proceso_comisiones
integer x = 750
integer y = 164
integer width = 78
integer height = 96
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_desde.text)='00/00/0000' or trim(em_desde.text)='' or &
	isnull(trim(em_desde.text)) then	
	
	em_desde.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_desde.text)=-1 then 
	em_desde.text=string(today(),gs_formato_fecha)
	em_desde.setfocus()
	return
end if	
if trim(em_desde.text)<>'00/00/0000' and not isnull(trim(em_desde.text)) and &
	trim(em_desde.text)<>'' then
	ls_fecha = em_desde.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type p_2 from picture within w_proceso_comisiones
integer x = 1531
integer y = 164
integer width = 78
integer height = 96
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_final.text)='00/00/0000' or trim(em_final.text)='' or &
	isnull(trim(em_final.text)) then	
	
	em_final.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_final.text)=-1 then 
	em_final.text=string(today(),gs_formato_fecha)
	em_final.setfocus()
	return
end if	
if trim(em_final.text)<>'00/00/0000' and not isnull(trim(em_final.text)) and &
	trim(em_final.text)<>'' then
	ls_fecha = em_final.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_final.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_final.text = Message.StringParm
end event

type em_desde from editmask within w_proceso_comisiones
integer x = 343
integer y = 164
integer width = 398
integer height = 96
integer taborder = 10
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type cb_trasp_com_at from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 1696
integer width = 599
integer height = 92
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&omisión At. Terreno"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Traspaso Comisiones Atención Terreno'
il_opcion						= 14
end event

type cb_trasp_com_age from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 1600
integer width = 599
integer height = 92
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Comisión A&gentes"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Traspaso Comisiones Agente'
il_opcion						= 13
end event

type cb_act_anexo_lib from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 1384
integer width = 599
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ane&xo Liberador"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Actualización Anexo Liberador'
il_opcion						= 12
end event

type cb_act_promesas from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 1288
integer width = 599
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Pro&mesas"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Actualización Promesas'
il_opcion						= 11
end event

type cb_pre_reprog from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 1080
integer width = 599
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Reprogramaciones"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Premios Incentivos Reprogramaciones'
il_opcion						= 10
end event

type cb_pre_1_sup from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 984
integer width = 599
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1% &Supervisor"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Premios Incentivos 1% Supervisor'
il_opcion						= 9
end event

type cb_pre_jefe from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 888
integer width = 599
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Jefe Venta"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Premios Incentivos Jefe Venta'
il_opcion						= 8
end event

type cb_cal_at_terreno from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 680
integer width = 599
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "At&ención Terreno"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Calculo Comisiones Atención Terreno'
il_opcion						= 7
end event

type cb_cal_prom_cast from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 584
integer width = 599
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Promesas Ca&stigadas"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Calculo Promesas Castigadas'
il_opcion						= 6
end event

type cb_cal_prom_ch_fec from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 488
integer width = 599
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Promesas CH.a &Fecha"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Calculo Promesas con Cheques a Fecha'
il_opcion						= 5
end event

type cb_cal_tipo_comi from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 392
integer width = 599
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Tipo Comisiones"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Calculo Tipo Comisiones'
il_opcion						= 4
end event

type cb_cal_ver_rescomi from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 296
integer width = 599
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Verificar RES-COMI"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Verificar RES-COMI'
il_opcion						= 3
end event

type cb_cal_liberador from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 200
integer width = 599
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Anexo Liberador"
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Calculo Comisiones Anexo Liberador'
il_opcion						= 2
end event

type cb_cal_promesas from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 104
integer width = 599
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Promesas"
boolean default = true
end type

event clicked;w_proceso_comisiones.title	= 'Proceso Calculo Comisiones Promesas'
dw_lista.dataobject			= 'dw_total_ofertas'
dw_lista.settransobject(sqlca)
il_opcion						= 1
st_desde.visible				= true
em_desde.visible				= true
p_1.visible						= true
st_final.visible				= false
em_final.visible				= false
p_2.visible						= false
em_desde.setfocus()
end event

type cb_cerrar from commandbutton within w_proceso_comisiones
integer x = 2853
integer y = 1852
integer width = 599
integer height = 104
integer taborder = 190
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_proceso_comisiones)
end event

type gb_1 from groupbox within w_proceso_comisiones
integer x = 2816
integer y = 32
integer width = 672
integer height = 772
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Calculos Comisiones"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_proceso_comisiones
integer x = 2816
integer y = 816
integer width = 672
integer height = 388
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Premios Incentivos"
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_proceso_comisiones
integer x = 2816
integer y = 1216
integer width = 672
integer height = 296
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actualizar"
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_proceso_comisiones
integer x = 2816
integer y = 1528
integer width = 672
integer height = 296
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Traspaso"
borderstyle borderstyle = stylelowered!
end type

type gb_5 from groupbox within w_proceso_comisiones
integer x = 41
integer y = 16
integer width = 2734
integer height = 352
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Fecha Cierre"
borderstyle borderstyle = stylelowered!
end type

