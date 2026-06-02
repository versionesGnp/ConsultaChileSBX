forward
global type w_estadistica_ventas_resumen from window
end type
type dw_parque from datawindow within w_estadistica_ventas_resumen
end type
type cb_1 from commandbutton within w_estadistica_ventas_resumen
end type
type dw_grupo from datawindow within w_estadistica_ventas_resumen
end type
type cb_imprimir from commandbutton within w_estadistica_ventas_resumen
end type
type cb_detalle from commandbutton within w_estadistica_ventas_resumen
end type
type pb_ok from picturebutton within w_estadistica_ventas_resumen
end type
type p_fin from picture within w_estadistica_ventas_resumen
end type
type st_3 from statictext within w_estadistica_ventas_resumen
end type
type p_ini from picture within w_estadistica_ventas_resumen
end type
type em_fec_ini from editmask within w_estadistica_ventas_resumen
end type
type st_4 from statictext within w_estadistica_ventas_resumen
end type
type em_fec_fin from editmask within w_estadistica_ventas_resumen
end type
type cb_cerrar from commandbutton within w_estadistica_ventas_resumen
end type
type dw_lista from datawindow within w_estadistica_ventas_resumen
end type
end forward

global type w_estadistica_ventas_resumen from window
integer width = 3301
integer height = 2072
boolean titlebar = true
string title = "Informe Estadistica por Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
dw_parque dw_parque
cb_1 cb_1
dw_grupo dw_grupo
cb_imprimir cb_imprimir
cb_detalle cb_detalle
pb_ok pb_ok
p_fin p_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_4 st_4
em_fec_fin em_fec_fin
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_estadistica_ventas_resumen w_estadistica_ventas_resumen

type variables
long	il_row
end variables

on w_estadistica_ventas_resumen.create
this.dw_parque=create dw_parque
this.cb_1=create cb_1
this.dw_grupo=create dw_grupo
this.cb_imprimir=create cb_imprimir
this.cb_detalle=create cb_detalle
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_4=create st_4
this.em_fec_fin=create em_fec_fin
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.dw_parque,&
this.cb_1,&
this.dw_grupo,&
this.cb_imprimir,&
this.cb_detalle,&
this.pb_ok,&
this.p_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_4,&
this.em_fec_fin,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_estadistica_ventas_resumen.destroy
destroy(this.dw_parque)
destroy(this.cb_1)
destroy(this.dw_grupo)
destroy(this.cb_imprimir)
destroy(this.cb_detalle)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_4)
destroy(this.em_fec_fin)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;connect using Trans_1;
connect using Trans_2;

gf_centrar(w_estadistica_ventas_resumen)
dw_lista.dataobject						= 'dwe_estadistica_ventas'
dw_lista.settransobject(sqlca)
dw_grupo.dataobject						= 'dw_estadistica_ventas'
dw_grupo.settransobject(sqlca)
dw_parque.dataobject						= 'dwe_seleccionar_parque'
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)


em_fec_ini.text 							= string(gdt_fec_sistema,'dd/mm/yyyy')
em_fec_fin.text 							= string(gdt_fec_sistema,'dd/mm/yyyy')


end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type dw_parque from datawindow within w_estadistica_ventas_resumen
integer x = 59
integer y = 44
integer width = 891
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccionar_parque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type cb_1 from commandbutton within w_estadistica_ventas_resumen
boolean visible = false
integer x = 3461
integer y = 548
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Respaldo"
end type

event clicked;//DECLARE x7 CURSOR FOR
//				SELECT DISTINCT	"AGENTES"."COD_AGE","AGENTES"."NOMBRE","AGENTES"."A_PATERNO","AGENTES"."A_MATERNO"  
//				FROM		"AGENTES","OFERTA_V"  
//				WHERE 	( "OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" ) AND
//							( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
//							( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin )
//				ORDER BY	"AGENTES"."COD_AGE" ASC
//				USING		sqlca;
//				open x7;
//				if sqlca.sqlcode=0 then
//					DO WHILE sqlca.sqlcode=0
//					fetch x7 INTO	:ls_cod_age,:ls_nombre,:ls_a_paterno,:ls_a_materno;
//						ll_grupo											= 7
//						ls_descrip										= ls_cod_age+' - '+ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
//						if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ls_nombre) and ls_nombre<>'' and not isnull(ls_a_paterno) and ls_a_paterno<>'' and not isnull(ls_a_materno) and ls_a_materno<>'' then
//							SELECT	count("OFERTA_V"."SERIE")  
//							INTO 		:ll_cuenta_x  
//							FROM		"OFERTA_V"  
//							WHERE 	( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
//										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) AND  
//										( "OFERTA_V"."COD_AGE" = :ls_cod_age ) 
//							USING		Trans_1;
//							if Trans_1.sqlcode=0 then
//								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
//									ll_cuenta_x							= ll_cuenta_x
//								else
//									ll_cuenta_x							= 0
//								end if
//							else
//								ll_cuenta_x								= 0
//							end if
//							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
//							ll_new										= dw_lista.insertrow(0)
//							dw_lista.scrolltorow(ll_new)
//							dw_lista.setitem(ll_new,"cod_parque",gl_cod_parque_cta)
//							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
//							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
//							dw_lista.setitem(ll_new,"grupo",ll_grupo)
//							dw_lista.setitem(ll_new,"cod_buscar",ls_cod_age)
//							dw_lista.setitem(ll_new,"item",ls_descrip)
//							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
//							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
//							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
//							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
//							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
//							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
//							dw_lista.setitem(ll_new,"forma",'0')
//						end if
//					setnull(ls_cod_age);setnull(ls_nombre);setnull(ls_a_paterno);setnull(ls_a_materno)
//					LOOP
//				end if
//				close x7;
end event

type dw_grupo from datawindow within w_estadistica_ventas_resumen
boolean visible = false
integer x = 3333
integer y = 148
integer width = 549
integer height = 152
string title = "none"
string dataobject = "dw_estadistica_ventas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_estadistica_ventas_resumen
integer x = 1582
integer y = 1812
integer width = 274
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then 
	f_Print( dw_lista )
end if
end event

type cb_detalle from commandbutton within w_estadistica_ventas_resumen
integer x = 41
integer y = 1812
integer width = 539
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle Contratos"
end type

event clicked;string	ls_cod_busca,ls_string,ls_forma
long		ll_grupo,ll_tot_reg,ll_cod_parque
datetime	ldt_fecha_ini,ldt_fecha_fin

dw_lista.accepttext()
if dw_lista.rowcount() > 0 then
	if il_row>0 then
		ldt_fecha_ini			= dw_lista.getitemdatetime(il_row,'fecha_ini')
		ldt_fecha_fin			= dw_lista.getitemdatetime(il_row,'fecha_fin')
		ls_cod_busca			= dw_lista.getitemstring(il_row,'cod_buscar')
		ll_grupo					= dw_lista.getitemnumber(il_row,'grupo')
		ls_forma					= dw_lista.getitemstring(il_row,'forma')
		ll_tot_reg				= dw_lista.getitemnumber(il_row,'cuenta_05')
		ll_cod_parque			= dw_parque.getitemnumber(1,'parque')
		ls_string				= string(ldt_fecha_ini,'dd/mm/yyyy')+'~t'+string(ldt_fecha_fin,'dd/mm/yyyy')+'~t'+ls_cod_busca+'~t'+string(ll_grupo)+'~t'+ls_forma+'~t'+string(ll_tot_reg)+'~t'+string(ll_cod_parque)
		if isvalid(w_estadistica_ventas_detalle) then close(w_estadistica_ventas_detalle)
			OpenWithParm(w_estadistica_ventas_detalle, ls_string)
	end if
end if
end event

type pb_ok from picturebutton within w_estadistica_ventas_resumen
event ue_mousemove pbm_mousemove
integer x = 2464
integer y = 28
integer width = 128
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_cod_age,ls_nombre,ls_a_paterno,ls_a_materno,ls_forma_pago,ls_descrip,ls_des,ls_sector,&
			ls_sexo,ls_canal,ls_cod_busca,ls_cod_jef,ls_cod_comuna,ls_comuna,ls_cod_est_civil,ls_descrip_civil;
long		ll_new,ll_tot_reg,ll_cta_vta_a,ll_cta_vta_b,ll_cta_vta_c,ll_grupo,ll_cta_vta,ll_cuenta_x,ll_capac,ll_tot_grupo,&
			ll_indi,ll_anos,ll_meses,ll_cta_age,ll_cod_parque
datetime	ldt_fec_ini,ldt_fec_fin,ldt_fecha_nac
double	ldb_promedio,ldb_tot_precio

dw_lista.reset()
dw_grupo.reset()
dw_lista.dataobject													= 'dwe_estadistica_ventas'
dw_lista.settransobject(sqlca)
dw_grupo.dataobject													= 'dw_estadistica_ventas'
dw_grupo.settransobject(sqlca)

ll_cod_parque															= dw_parque.getitemnumber(1,'parque')
ldt_fec_ini																= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fec_fin																= datetime(date(em_fec_fin.text),time('00:00:00'))
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ldt_fec_ini>ldt_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			ll_tot_grupo												= dw_grupo.retrieve(ldt_fec_ini,ldt_fec_fin,ll_cod_parque)
			SELECT	count("OFERTA_V"."SERIE")  
			INTO 		:ll_cta_vta_a
			FROM		"OFERTA_V","CADENA" 
			WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
						( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
						( "CADENA"."CODIGO" = 'O' ) AND  
						( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
						( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
						( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) AND
						( "OFERTA_V"."CLASIFICA_VENTA" = 'A' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ll_cta_vta_a) or ll_cta_vta_a>0 then
					ll_cta_vta_a										= ll_cta_vta_a
				else
					ll_cta_vta_a										= 0
				end if
			else
				ll_cta_vta_a											= 0
			end if
			SELECT	count("OFERTA_V"."SERIE")  
			INTO 		:ll_cta_vta_b 
			FROM		"OFERTA_V","CADENA" 
			WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
						( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
						( "CADENA"."CODIGO" = 'O' ) AND  
						( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
						( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
						( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) AND
						( "OFERTA_V"."CLASIFICA_VENTA" = 'B' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ll_cta_vta_b) or ll_cta_vta_b>0 then
					ll_cta_vta_b										= ll_cta_vta_b
				else
					ll_cta_vta_b										= 0
				end if
			else
				ll_cta_vta_b											= 0
			end if
			SELECT	count("OFERTA_V"."SERIE")  
			INTO 		:ll_cta_vta_c 
			FROM		"OFERTA_V","CADENA" 
			WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
						( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
						( "CADENA"."CODIGO" = 'O' ) AND  
						( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
						( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
						( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) AND
						( "OFERTA_V"."CLASIFICA_VENTA" = 'C' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if not isnull(ll_cta_vta_c) or ll_cta_vta_c>0 then
					ll_cta_vta_c										= ll_cta_vta_c
				else
					ll_cta_vta_c										= 0
				end if
			else
				ll_cta_vta_c											= 0
			end if
			ll_cta_vta													= ll_cta_vta_a + ll_cta_vta_b + ll_cta_vta_c
			if ll_cta_vta>0 then
				dw_lista.object.usuario.text						= gs_user
				//Grupo01
				SELECT count( DISTINCT	"AGENTES"."COD_AGE")
				INTO		:ll_cta_age
				FROM		"AGENTES","OFERTA_V","CADENA"  
				WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
							( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
							( "CADENA"."CODIGO" = 'O' ) AND  
							( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
							( "OFERTA_V"."COD_AGE" = "AGENTES"."COD_AGE" ) AND
							( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
							( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin )
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ll_cta_age) or ll_cta_age>0 then
						ll_cta_age										= ll_cta_age
					else
						ll_cta_age										= 0
					end if
				else
					ll_cta_age											= 0
				end if
				ll_grupo													= 1
				ll_cuenta_x												= ll_cta_age
				ls_descrip												= 'PROMEDIO POR EJECUTIVO'
				ldb_promedio											= round( ll_cta_vta / ll_cuenta_x ,2)
				ls_cod_busca											= ''
				ll_new													= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.setitem(ll_new,"grupo",ll_grupo)
				dw_lista.setitem(ll_new,"cod_buscar",ls_cod_busca)
				dw_lista.setitem(ll_new,"item",ls_descrip)
				dw_lista.setitem(ll_new,"cuenta_01",ll_cta_vta)
				dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
				dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
				dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
				dw_lista.setitem(ll_new,"cuenta_05",ll_cuenta_x)
				dw_lista.setitem(ll_new,"promedio",ldb_promedio)
				dw_lista.setitem(ll_new,"forma",'1')
				dw_lista.accepttext()
				setnull(ll_grupo);setnull(ll_cuenta_x);setnull(ls_descrip);setnull(ldb_promedio);setnull(ls_cod_busca)
				
				SELECT	SUM (CASE WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO"
							WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN ROUND( ( "PAGO_OFERTA"."PRECIO" / "TAB_UF"."VALOR_UF") , 2 ) END )
				INTO		:ldb_tot_precio
				FROM    	"OFERTA_V","PAGO_OFERTA","TAB_UF","CADENA"   
				WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND
							"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND
							"CADENA"."CODIGO" = 'O' AND  
							"CADENA"."COD_PARQUE" = :ll_cod_parque AND
							"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"OFERTA_V"."CIERRE_VENTA" = "TAB_UF"."FECHA_UF" and
							"OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini and  
							"OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ldb_tot_precio) and ldb_tot_precio>0 then
						ldb_tot_precio									= ldb_tot_precio
					else
						ldb_tot_precio									= 0
					end if
				else
					ldb_tot_precio										= 0
				end if
				ll_grupo													= 1
				ll_cuenta_x												= ldb_tot_precio
				ls_descrip												= 'PROMEDIO POR PRECIO VENTAS'
				ldb_promedio											= round( ll_cuenta_x / ll_cta_vta,2)
				ls_cod_busca											= ''
				ll_new													= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.setitem(ll_new,"grupo",ll_grupo)
				dw_lista.setitem(ll_new,"cod_buscar",ls_cod_busca)
				dw_lista.setitem(ll_new,"item",ls_descrip)
				dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
				dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
				dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
				dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
				dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
				dw_lista.setitem(ll_new,"promedio",ldb_promedio)
				dw_lista.setitem(ll_new,"forma",'2')
				dw_lista.accepttext()
				setnull(ll_grupo);setnull(ll_cuenta_x);setnull(ls_descrip);setnull(ldb_promedio);setnull(ls_cod_busca)
				
				SELECT	sum (CASE WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO"
							WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN ROUND( ( "PAGO_OFERTA"."PRECIO" / "TAB_UF"."VALOR_UF") , 4 ) END )
				INTO		:ldb_tot_precio
				FROM    	"OFERTA_V","PAGO_OFERTA","TAB_UF","CADENA"   
				WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" AND
							"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" AND
							"CADENA"."CODIGO" = 'O' AND  
							"CADENA"."COD_PARQUE" = :ll_cod_parque AND
							"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"OFERTA_V"."CIERRE_VENTA" = "TAB_UF"."FECHA_UF" and
							"OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini and  
							"OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin and 
							"OFERTA_V"."FORMA_PAGO" <> '2' 
				USING		sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ldb_tot_precio) and ldb_tot_precio>0 then
						ldb_tot_precio									= ldb_tot_precio
					else
						ldb_tot_precio									= 0
					end if
				else
					ldb_tot_precio										= 0
				end if
				ll_grupo													= 1
				ll_cuenta_x												= ldb_tot_precio
				ls_descrip												= 'PROMEDIO POR PRECIO VENTAS CONTADO'
				ldb_promedio											= round( ll_cuenta_x / ll_cta_vta,2)
				ls_cod_busca											= ''
				ll_new													= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.setitem(ll_new,"grupo",ll_grupo)
				dw_lista.setitem(ll_new,"cod_buscar",ls_cod_busca)
				dw_lista.setitem(ll_new,"item",ls_descrip)
				dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
				dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
				dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
				dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
				dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
				dw_lista.setitem(ll_new,"promedio",ldb_promedio)
				dw_lista.setitem(ll_new,"forma",'4')
				dw_lista.accepttext()
				setnull(ll_grupo);setnull(ll_cuenta_x);setnull(ls_descrip);setnull(ldb_promedio);setnull(ls_cod_busca)
				
				ll_grupo													= 1
				ll_cuenta_x												= dw_grupo.getitemnumber(1,'c_sum_pie_credito')
				ls_descrip												= 'PIE CONTRATO CREDITO'
				ldb_promedio											= round( ll_cuenta_x / ll_cta_vta,2)
				ls_cod_busca											= '2'
				ll_new													= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.setitem(ll_new,"grupo",ll_grupo)
				dw_lista.setitem(ll_new,"cod_buscar",ls_cod_busca)
				dw_lista.setitem(ll_new,"item",ls_descrip)
				dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
				dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
				dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
				dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
				dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
				dw_lista.setitem(ll_new,"promedio",ldb_promedio)
				dw_lista.setitem(ll_new,"forma",'5')
				dw_lista.accepttext()
				setnull(ll_grupo);setnull(ll_cuenta_x);setnull(ls_descrip);setnull(ldb_promedio);setnull(ls_cod_busca)
				
				ll_grupo													= 1
				ll_cuenta_x												= dw_grupo.getitemnumber(1,'c_plazo_tot')
				ls_descrip												= 'PLAZO CONTRATO CREDITO + CONTADO'
				ldb_promedio											= round( ll_cuenta_x / ll_cta_vta,2)
				ls_cod_busca											= ''
				ll_new													= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.setitem(ll_new,"grupo",ll_grupo)
				dw_lista.setitem(ll_new,"cod_buscar",ls_cod_busca)
				dw_lista.setitem(ll_new,"item",ls_descrip)
				dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
				dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
				dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
				dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
				dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
				dw_lista.setitem(ll_new,"promedio",ldb_promedio)
				dw_lista.setitem(ll_new,"forma",'6')
				dw_lista.accepttext()
				setnull(ll_grupo);setnull(ll_cuenta_x);setnull(ls_descrip);setnull(ldb_promedio);setnull(ls_cod_busca)
				
				ll_grupo													= 1
				ll_cuenta_x												= dw_grupo.getitemnumber(1,'c_sum_valor_cuota_credito')
				ls_descrip												= 'VALOR CUOTA MES CONTRATO CREDITO'
				ldb_promedio											= round( ll_cuenta_x / ll_cta_vta,2)
				ls_cod_busca											= '2'
				ll_new													= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.setitem(ll_new,"grupo",ll_grupo)
				dw_lista.setitem(ll_new,"cod_buscar",ls_cod_busca)
				dw_lista.setitem(ll_new,"item",ls_descrip)
				dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
				dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
				dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
				dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
				dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
				dw_lista.setitem(ll_new,"promedio",ldb_promedio)
				dw_lista.setitem(ll_new,"forma",'7')
				dw_lista.accepttext()
				setnull(ll_grupo);setnull(ll_cuenta_x);setnull(ls_descrip);setnull(ldb_promedio);setnull(ls_cod_busca)
					
				
				ll_cuenta_x												= 0
				for ll_indi=1 to ll_tot_grupo
					ldt_fecha_nac										= dw_grupo.getitemdatetime(ll_indi,'cliente_fecha_nac')
					ll_meses												= f_calculo_meses(ldt_fecha_nac,ldt_fec_fin)
					if ll_meses>0 then
						ll_anos											= ll_meses	/ 12
					else
						ll_anos											= 0
					end if
					dw_grupo.setitem(ll_indi,"c_anos",ll_anos)
					ll_cuenta_x											= ll_cuenta_x + ll_anos
				next
				ll_grupo													= 1
				ls_descrip												= 'EDAD PROMEDIO CLIENTE'
				ldb_promedio											= round( ll_cuenta_x / ll_cta_vta,2)
				ls_cod_busca											= ''
				ll_new													= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.setitem(ll_new,"grupo",ll_grupo)
				dw_lista.setitem(ll_new,"cod_buscar",ls_cod_busca)
				dw_lista.setitem(ll_new,"item",ls_descrip)
				dw_lista.setitem(ll_new,"cuenta_01",ldb_promedio)
				dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
				dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
				dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
				dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
				dw_lista.setitem(ll_new,"promedio",ldb_promedio)
				dw_lista.setitem(ll_new,"forma",'8')
				dw_lista.accepttext()
				setnull(ll_grupo);setnull(ll_cuenta_x);setnull(ls_descrip);setnull(ldb_promedio);setnull(ls_cod_busca)
				
				ll_grupo													= 1
				ll_cuenta_x												= dw_grupo.getitemnumber(1,'c_suma_renta')
				ls_descrip												= 'MONTO RENTA PROMEDIO'
				ldb_promedio											= round( ll_cuenta_x / ll_cta_vta,2)
				ls_cod_busca											= ''
				ll_new													= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
				dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
				dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
				dw_lista.setitem(ll_new,"grupo",ll_grupo)
				dw_lista.setitem(ll_new,"cod_buscar",ls_cod_busca)
				dw_lista.setitem(ll_new,"item",ls_descrip)
				dw_lista.setitem(ll_new,"cuenta_01",ldb_promedio)
				dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
				dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
				dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
				dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
				dw_lista.setitem(ll_new,"promedio",ldb_promedio)
				dw_lista.setitem(ll_new,"forma",'9')
				dw_lista.accepttext()
				setnull(ll_grupo);setnull(ll_cuenta_x);setnull(ls_descrip);setnull(ldb_promedio);setnull(ls_cod_busca)
				//Grupo02
				DECLARE x2 CURSOR FOR
				SELECT DISTINCT "CLIENTE"."SEXO"  
    			FROM		"CLIENTE"
				ORDER BY	"CLIENTE"."SEXO" ASC
				USING		sqlca;
				open x2;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x2 INTO	:ls_sexo;
						if not isnull(ls_sexo) and ls_sexo<>'' then
							ll_grupo										= 2
							if ls_sexo='F' then
								ls_descrip								= 'CLIENTES MUJERES'
							elseif ls_sexo='M'  then
								ls_descrip								= 'CLIENTES HOMBRES'
							else
								ls_descrip								= 'CLIENTES EMPRESAS'
							end if
							SELECT	count("OFERTA_V"."SERIE")  
							INTO 		:ll_cuenta_x  
							FROM 		"OFERTA_V","CLIENTE","CADENA"  
							WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."RUT" = "CLIENTE"."RUT" ) and  
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) and  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) and
										( "CLIENTE"."SEXO" = :ls_sexo )
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",ls_sexo)
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ls_sexo)
					LOOP
				end if
				close x2;
				//Grupo03
				DECLARE x3 CURSOR FOR
				SELECT DISTINCT	"PAGO_OFERTA"."AREA" 
				FROM 		"OFERTA_V","PAGO_OFERTA","CADENA"  
				WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
							( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
							( "CADENA"."CODIGO" = 'O' ) AND  
							( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
							( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and   
							( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) and  
							( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin )
				ORDER BY	"PAGO_OFERTA"."AREA"  ASC
				USING		sqlca;
				open x3;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x3 INTO	:ls_sector;
						if not isnull(ls_sector) and ls_sector<>'' then
							ll_grupo										= 3
							ls_descrip									= 'AREA '+ls_sector
							SELECT	count("OFERTA_V"."SERIE")  
							INTO 		:ll_cuenta_x  
							FROM 		"OFERTA_V","PAGO_OFERTA","CADENA"  
							WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and   
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) and  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) and
										( "PAGO_OFERTA"."AREA" = :ls_sector )
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",ls_sector)
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ls_sector)
					LOOP
				end if
				close x3;
				//Grupo04
				DECLARE x4 CURSOR FOR
				SELECT DISTINCT	"LISTA_PRECIO"."CANAL"  
    			FROM		"LISTA_PRECIO"
				ORDER BY	"LISTA_PRECIO"."CANAL" ASC
				USING		sqlca;
				open x4;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x4 INTO	:ls_canal;
						if not isnull(ls_canal) and ls_canal<>'' then
							ll_grupo										= 4
							ls_descrip									= 'USO SEPULTURA '+ls_canal
							SELECT	count("OFERTA_V"."SERIE")  
							INTO 		:ll_cuenta_x  
							FROM 		"OFERTA_V","CADENA"
							WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) and  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) and
										( "OFERTA_V"."USO" = :ls_canal )
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",ls_canal)
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ls_canal)
					LOOP
				end if
				close x4;
				//Grupo05
				DECLARE x5 CURSOR FOR
				SELECT DISTINCT "INVENTARIO_PLANI"."CAPACIDAD"  
    			FROM		"INVENTARIO_PLANI"
				WHERE		"INVENTARIO_PLANI"."CAPACIDAD" <> 999 
				ORDER BY	"INVENTARIO_PLANI"."CAPACIDAD" ASC
				USING		sqlca;
				open x5;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x5 INTO	:ll_capac;
						if not isnull(ll_capac) and ll_capac >0 then
							ll_grupo										= 5
							if ll_capac<=1 then
								ls_des									= 'CAPACIDAD'
							else
								ls_des									= 'CAPACIDADES'
							end if
							ls_descrip									= 'SEPULTURAS DE '+string(ll_capac)+' - '+ls_des
							SELECT	count("OFERTA_V"."SERIE")  
							INTO 		:ll_cuenta_x  
							FROM 		"OFERTA_V","PAGO_OFERTA","CADENA"  
							WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and   
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) and  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) and
										( "PAGO_OFERTA"."CAPACIDAD" = :ll_capac )
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",string(ll_capac))
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ll_capac)
					LOOP
				end if
				close x5;	
				//Grupo06
				DECLARE x6 CURSOR FOR
				SELECT	"FORMA_PAGO",	"DESCRIPCION"  
				FROM		"TIPO_FORMA_PAGO"
				ORDER BY	"TIPO_FORMA_PAGO"."FORMA_PAGO" ASC
				USING		sqlca;
				open x6;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x6 INTO	:ls_forma_pago,:ls_descrip;
						if not isnull(ls_forma_pago) and ls_forma_pago<>'' then
							ll_grupo										= 6
							ls_descrip									= ls_forma_pago+' - '+ls_descrip
							SELECT	count("OFERTA_V"."SERIE")  
							INTO 		:ll_cuenta_x  
							FROM		"OFERTA_V","CADENA"  
							WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) AND
										( "OFERTA_V"."FORMA_PAGO" = :ls_forma_pago )
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else	
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",ls_forma_pago)
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ls_forma_pago);setnull(ls_descrip)
					LOOP
				end if
				close x6;	
				//Grupo07
				DECLARE x7 CURSOR FOR
				SELECT DISTINCT	"JEFE_VENTAS"."JEFE_VENTAS","JEFE_VENTAS"."NOMBRE","JEFE_VENTAS"."A_PATERNO","JEFE_VENTAS"."A_MATERNO"  
				FROM		"JEFE_VENTAS","OFERTA_V","CADENA"  
				WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
							( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
							( "CADENA"."CODIGO" = 'O' ) AND  
							( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
							( "OFERTA_V"."COD_JEF" = "JEFE_VENTAS"."JEFE_VENTAS" ) AND
							( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
							( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin )
				ORDER BY	"JEFE_VENTAS"."JEFE_VENTAS" ASC
				USING		sqlca;
				open x7;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x7 INTO	:ls_cod_jef,:ls_nombre,:ls_a_paterno,:ls_a_materno;
						ll_grupo											= 7
						ls_descrip										= ls_cod_jef+' - '+ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
						if not isnull(ls_cod_jef) and ls_cod_jef<>'' and not isnull(ls_nombre) and ls_nombre<>'' and not isnull(ls_a_paterno) and ls_a_paterno<>'' and not isnull(ls_a_materno) and ls_a_materno<>'' then
							SELECT	count("OFERTA_V"."SERIE")  
							INTO 		:ll_cuenta_x  
							FROM		"OFERTA_V","CADENA"  
							WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) AND  
										( "OFERTA_V"."COD_JEF" = :ls_cod_jef ) 
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",gl_cod_parque_cta)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",ls_cod_jef)
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ls_cod_age);setnull(ls_nombre);setnull(ls_a_paterno);setnull(ls_a_materno)
					LOOP
				end if
				close x7;
				//Grupo08
				DECLARE x8 CURSOR FOR
				SELECT DISTINCT	"SUPERVISOR"."COD_SUP","SUPERVISOR"."NOMBRE","SUPERVISOR"."A_PATERNO","SUPERVISOR"."A_MATERNO"  
				FROM		"SUPERVISOR","OFERTA_V","CADENA"  
				WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
							( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
							( "CADENA"."CODIGO" = 'O' ) AND  
							( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
							( "OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" ) AND
							( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
							( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin )
				ORDER BY	"SUPERVISOR"."COD_SUP" ASC
				USING		sqlca;
				open x8;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x8 INTO	:ls_cod_age,:ls_nombre,:ls_a_paterno,:ls_a_materno;
						ll_grupo											= 8
						ls_descrip										= ls_cod_age+' - '+ls_nombre+' '+ls_a_paterno+' '+ls_a_materno
						if not isnull(ls_cod_age) and ls_cod_age<>'' and not isnull(ls_nombre) and ls_nombre<>'' and not isnull(ls_a_paterno) and ls_a_paterno<>'' and not isnull(ls_a_materno) and ls_a_materno<>'' then
							SELECT	count("OFERTA_V"."SERIE")  
							INTO 		:ll_cuenta_x  
							FROM		"OFERTA_V","CADENA"  
							WHERE 	( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) AND  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) AND  
										( "OFERTA_V"."COD_SUP" = :ls_cod_age ) 
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",ls_cod_age)
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ls_cod_age);setnull(ls_nombre);setnull(ls_a_paterno);setnull(ls_a_materno)
					LOOP
				end if
				close x8;
				//Grupo09
				DECLARE x9 CURSOR FOR
				SELECT DISTINCT	"COMUNA"."CODIGO_COMUNA","COMUNA"."COMUNA"  
				FROM 		"OFERTA_V","PAGO_OFERTA","CADENA","CLIENTE","COMUNA"  
				WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
							( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
							( "CADENA"."CODIGO" = 'O' ) AND  
							( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
							( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
							( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
							( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and   
							( "CADENA"."RUT" = "CLIENTE"."RUT" ) AND
							( "CLIENTE"."COMUNA" = "COMUNA"."CODIGO_COMUNA" ) AND
							( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) and  
							( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin )
				ORDER BY	"COMUNA"."COMUNA" ASC
				USING		sqlca;
				open x9;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x9 INTO	:ls_cod_comuna,:ls_comuna;
						ll_grupo											= 9
						ls_descrip										= ls_comuna
						if not isnull(ls_cod_comuna) and ls_cod_comuna<>'' and not isnull(ls_comuna) and ls_comuna<>'' then
							SELECT count("CADENA"."SERIE")
							INTO 		:ll_cuenta_x  
							FROM 		"OFERTA_V","PAGO_OFERTA","CADENA","CLIENTE"  
							WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and   
										( "CADENA"."RUT" = "CLIENTE"."RUT" ) AND
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) and  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) and
										( "CLIENTE"."COMUNA" = :ls_cod_comuna )
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",ls_cod_comuna)
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ls_cod_comuna);setnull(ls_comuna)
					LOOP
				end if
				close x9;
				//Grupo10
				DECLARE x10 CURSOR FOR
				SELECT	"CODIGO_ESTADO",	"DESCRIPCION"  
    			FROM 		"CODIGO_ESTADO_CIVIL"
				ORDER BY	"CODIGO_ESTADO" ASC
				USING		sqlca;
				open x10;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x10 INTO	:ls_cod_est_civil,:ls_descrip_civil;
						ll_grupo											= 10
						ls_descrip										= Upper(ls_descrip_civil)
						if not isnull(ls_cod_est_civil) and ls_cod_est_civil<>'' and not isnull(ls_descrip_civil) and ls_descrip_civil<>'' then
							SELECT count("CADENA"."SERIE")
							INTO 		:ll_cuenta_x  
							FROM 		"OFERTA_V","PAGO_OFERTA","CADENA","CLIENTE"  
							WHERE		( "CADENA"."SERIE" = "OFERTA_V"."SERIE" ) AND
										( "CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" ) AND
										( "CADENA"."CODIGO" = 'O' ) AND  
										( "CADENA"."COD_PARQUE" = :ll_cod_parque ) AND
										( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
										( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
										( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and   
										( "CADENA"."RUT" = "CLIENTE"."RUT" ) AND
										( "OFERTA_V"."CIERRE_VENTA" >= :ldt_fec_ini ) and  
										( "OFERTA_V"."CIERRE_VENTA" <= :ldt_fec_fin ) and
										( "CLIENTE"."ESTA_CIVIL" = :ls_cod_est_civil )
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								if not isnull(ll_cuenta_x) or ll_cuenta_x>0 then
									ll_cuenta_x							= ll_cuenta_x
								else
									ll_cuenta_x							= 0
								end if
							else
								ll_cuenta_x								= 0
							end if
							ldb_promedio								= round( ll_cuenta_x / ll_cta_vta * 100,2)
							ll_new										= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,"cod_parque",ll_cod_parque)
							dw_lista.setitem(ll_new,"fecha_ini",ldt_fec_ini)
							dw_lista.setitem(ll_new,"fecha_fin",ldt_fec_fin)
							dw_lista.setitem(ll_new,"grupo",ll_grupo)
							dw_lista.setitem(ll_new,"cod_buscar",ls_cod_est_civil)
							dw_lista.setitem(ll_new,"item",ls_descrip)
							dw_lista.setitem(ll_new,"cuenta_01",ll_cuenta_x)
							dw_lista.setitem(ll_new,"cuenta_02",ll_cta_vta_a)
							dw_lista.setitem(ll_new,"cuenta_03",ll_cta_vta_b)
							dw_lista.setitem(ll_new,"cuenta_04",ll_cta_vta_c)
							dw_lista.setitem(ll_new,"cuenta_05",ll_cta_vta)
							dw_lista.setitem(ll_new,"promedio",ldb_promedio)
							dw_lista.setitem(ll_new,"forma",'0')
						end if
					setnull(ls_cod_est_civil);setnull(ls_descrip_civil)
					LOOP
				end if
				close x10;
			else
				messagebox("Advertencia","No registra Datos")
			end if
		end if
	end if
end if
end event

type p_fin from picture within w_estadistica_ventas_resumen
integer x = 2368
integer y = 52
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_lista.reset()
string ls_fecha,fech

if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)<DATE(em_fec_ini.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de final debe ser mayor a la inicial.',stopsign!)
		em_fec_fin.setfocus()
		return
	else	
		em_fec_fin.text = Message.StringParm
	end if	
END IF
end event

type st_3 from statictext within w_estadistica_ventas_resumen
integer x = 1824
integer y = 56
integer width = 169
integer height = 72
integer textsize = -8
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

type p_ini from picture within w_estadistica_ventas_resumen
integer x = 1742
integer y = 52
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_lista.reset()
string ls_fecha,fech

if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_fec_ini.setfocus()
	return
end if	
if em_fec_ini.text<>'00/00/0000' then
	ls_fecha = em_fec_ini.text
else
	ls_fecha = string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_estadistica_ventas_resumen
event ue_keypress pbm_keydown
integer x = 1385
integer y = 52
integer width = 352
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()

end event

type st_4 from statictext within w_estadistica_ventas_resumen
integer x = 987
integer y = 56
integer width = 389
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango    Fecha"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_fec_fin from editmask within w_estadistica_ventas_resumen
integer x = 2011
integer y = 52
integer width = 347
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()

end event

type cb_cerrar from commandbutton within w_estadistica_ventas_resumen
integer x = 2898
integer y = 1812
integer width = 329
integer height = 100
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_estadistica_ventas_resumen)
end event

type dw_lista from datawindow within w_estadistica_ventas_resumen
integer x = 41
integer y = 148
integer width = 3186
integer height = 1624
integer taborder = 60
string title = "none"
string dataobject = "dwe_estadistica_ventas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event rowfocuschanged;//if getrow()>0 then
//	il_row	= getrow()
//	This.SelectRow(0, false)
//	This.SelectRow(il_row, true)
//end if
end event

event doubleclicked;if dw_lista.RowCount() > 0 then
	cb_detalle.triggerevent(clicked!)
end if
end event

