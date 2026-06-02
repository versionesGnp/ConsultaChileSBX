forward
global type w_incobrabilidad_contratos_bkp from window
end type
type st_3 from statictext within w_incobrabilidad_contratos_bkp
end type
type st_2 from statictext within w_incobrabilidad_contratos_bkp
end type
type cbx_otros_parques from checkbox within w_incobrabilidad_contratos_bkp
end type
type cb_imprimir from commandbutton within w_incobrabilidad_contratos_bkp
end type
type cb_2 from commandbutton within w_incobrabilidad_contratos_bkp
end type
type cb_limpiar from commandbutton within w_incobrabilidad_contratos_bkp
end type
type gb_4 from groupbox within w_incobrabilidad_contratos_bkp
end type
type cb_cerrar from commandbutton within w_incobrabilidad_contratos_bkp
end type
type dw_lista from datawindow within w_incobrabilidad_contratos_bkp
end type
type pb_aceptar from picturebutton within w_incobrabilidad_contratos_bkp
end type
type rb_pagare from radiobutton within w_incobrabilidad_contratos_bkp
end type
type rb_promesas from radiobutton within w_incobrabilidad_contratos_bkp
end type
type dw_fech_cierre from datawindow within w_incobrabilidad_contratos_bkp
end type
type rb_reprogramado from radiobutton within w_incobrabilidad_contratos_bkp
end type
type rb_nuevo from radiobutton within w_incobrabilidad_contratos_bkp
end type
type cbx_resciliados from checkbox within w_incobrabilidad_contratos_bkp
end type
type dw_parque from datawindow within w_incobrabilidad_contratos_bkp
end type
type gb_parque from groupbox within w_incobrabilidad_contratos_bkp
end type
type rb_lista_pagare from radiobutton within w_incobrabilidad_contratos_bkp
end type
type rb_p_licitados from radiobutton within w_incobrabilidad_contratos_bkp
end type
type rb_p_licit_resc from radiobutton within w_incobrabilidad_contratos_bkp
end type
type rb_p_resciliado from radiobutton within w_incobrabilidad_contratos_bkp
end type
type gb_fec_cierre from groupbox within w_incobrabilidad_contratos_bkp
end type
type ddlb_parque_prom from dropdownlistbox within w_incobrabilidad_contratos_bkp
end type
type st_1 from statictext within w_incobrabilidad_contratos_bkp
end type
type gb_pagare from groupbox within w_incobrabilidad_contratos_bkp
end type
type gb_otros_parques from groupbox within w_incobrabilidad_contratos_bkp
end type
end forward

global type w_incobrabilidad_contratos_bkp from window
integer width = 3109
integer height = 2064
boolean titlebar = true
string title = "Incobrabilidad"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
st_3 st_3
st_2 st_2
cbx_otros_parques cbx_otros_parques
cb_imprimir cb_imprimir
cb_2 cb_2
cb_limpiar cb_limpiar
gb_4 gb_4
cb_cerrar cb_cerrar
dw_lista dw_lista
pb_aceptar pb_aceptar
rb_pagare rb_pagare
rb_promesas rb_promesas
dw_fech_cierre dw_fech_cierre
rb_reprogramado rb_reprogramado
rb_nuevo rb_nuevo
cbx_resciliados cbx_resciliados
dw_parque dw_parque
gb_parque gb_parque
rb_lista_pagare rb_lista_pagare
rb_p_licitados rb_p_licitados
rb_p_licit_resc rb_p_licit_resc
rb_p_resciliado rb_p_resciliado
gb_fec_cierre gb_fec_cierre
ddlb_parque_prom ddlb_parque_prom
st_1 st_1
gb_pagare gb_pagare
gb_otros_parques gb_otros_parques
end type
global w_incobrabilidad_contratos_bkp w_incobrabilidad_contratos_bkp

on w_incobrabilidad_contratos_bkp.create
this.st_3=create st_3
this.st_2=create st_2
this.cbx_otros_parques=create cbx_otros_parques
this.cb_imprimir=create cb_imprimir
this.cb_2=create cb_2
this.cb_limpiar=create cb_limpiar
this.gb_4=create gb_4
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.pb_aceptar=create pb_aceptar
this.rb_pagare=create rb_pagare
this.rb_promesas=create rb_promesas
this.dw_fech_cierre=create dw_fech_cierre
this.rb_reprogramado=create rb_reprogramado
this.rb_nuevo=create rb_nuevo
this.cbx_resciliados=create cbx_resciliados
this.dw_parque=create dw_parque
this.gb_parque=create gb_parque
this.rb_lista_pagare=create rb_lista_pagare
this.rb_p_licitados=create rb_p_licitados
this.rb_p_licit_resc=create rb_p_licit_resc
this.rb_p_resciliado=create rb_p_resciliado
this.gb_fec_cierre=create gb_fec_cierre
this.ddlb_parque_prom=create ddlb_parque_prom
this.st_1=create st_1
this.gb_pagare=create gb_pagare
this.gb_otros_parques=create gb_otros_parques
this.Control[]={this.st_3,&
this.st_2,&
this.cbx_otros_parques,&
this.cb_imprimir,&
this.cb_2,&
this.cb_limpiar,&
this.gb_4,&
this.cb_cerrar,&
this.dw_lista,&
this.pb_aceptar,&
this.rb_pagare,&
this.rb_promesas,&
this.dw_fech_cierre,&
this.rb_reprogramado,&
this.rb_nuevo,&
this.cbx_resciliados,&
this.dw_parque,&
this.gb_parque,&
this.rb_lista_pagare,&
this.rb_p_licitados,&
this.rb_p_licit_resc,&
this.rb_p_resciliado,&
this.gb_fec_cierre,&
this.ddlb_parque_prom,&
this.st_1,&
this.gb_pagare,&
this.gb_otros_parques}
end on

on w_incobrabilidad_contratos_bkp.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cbx_otros_parques)
destroy(this.cb_imprimir)
destroy(this.cb_2)
destroy(this.cb_limpiar)
destroy(this.gb_4)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.pb_aceptar)
destroy(this.rb_pagare)
destroy(this.rb_promesas)
destroy(this.dw_fech_cierre)
destroy(this.rb_reprogramado)
destroy(this.rb_nuevo)
destroy(this.cbx_resciliados)
destroy(this.dw_parque)
destroy(this.gb_parque)
destroy(this.rb_lista_pagare)
destroy(this.rb_p_licitados)
destroy(this.rb_p_licit_resc)
destroy(this.rb_p_resciliado)
destroy(this.gb_fec_cierre)
destroy(this.ddlb_parque_prom)
destroy(this.st_1)
destroy(this.gb_pagare)
destroy(this.gb_otros_parques)
end on

event open;gf_centrar(w_incobrabilidad_contratos)

gb_parque.visible 	= false
dw_parque.visible = false
//dw_parque.settransobject(sqlca)
//dw_parque.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
gb_pagare.visible 						= false
cbx_resciliados.visible					= false
rb_lista_pagare.visible				= false
rb_p_resciliado.visible				= false
rb_p_licitados.visible					= false
rb_p_licit_resc.visible					= false
rb_nuevo.visible						= false
rb_reprogramado.visible				= false
rb_promesas.setfocus()

end event

type st_3 from statictext within w_incobrabilidad_contratos_bkp
integer x = 2587
integer y = 148
integer width = 187
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parques"
boolean focusrectangle = false
end type

type st_2 from statictext within w_incobrabilidad_contratos_bkp
integer x = 2615
integer y = 96
integer width = 133
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Otros"
boolean focusrectangle = false
end type

type cbx_otros_parques from checkbox within w_incobrabilidad_contratos_bkp
integer x = 2642
integer y = 216
integer width = 64
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;if cbx_otros_parques.checked = true then
	gb_fec_cierre.visible			= false
	gb_pagare.visible				= false
	rb_lista_pagare.visible		= false
	rb_p_resciliado.visible		= false
	rb_p_licitados.visible			= false
	rb_p_licit_resc.visible			= false	
else
	
end if	
end event

type cb_imprimir from commandbutton within w_incobrabilidad_contratos_bkp
integer x = 398
integer y = 1844
integer width = 265
integer height = 100
integer taborder = 80
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
	dw_lista.object.datawindow.zoom				= 90
	f_Print( dw_lista )
	dw_lista.object.datawindow.Print.Preview	= false
	dw_lista.object.datawindow.zoom				= 100
end if
end event

type cb_2 from commandbutton within w_incobrabilidad_contratos_bkp
integer x = 27
integer y = 1844
integer width = 265
integer height = 100
integer taborder = 70
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

type cb_limpiar from commandbutton within w_incobrabilidad_contratos_bkp
integer x = 1413
integer y = 1844
integer width = 265
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;if rb_promesas.checked = true then
	dw_parque.reset()
elseif rb_pagare.checked = true then
end if	
dw_fech_cierre.reset()
dw_lista.reset()
dw_parque.insertrow(0)
dw_fech_cierre.insertrow(0)

gb_pagare.visible 						= false
rb_lista_pagare.visible				= false
rb_p_resciliado.visible				= false
rb_p_licitados.visible					= false
rb_p_licit_resc.visible					= false
rb_nuevo.visible						= false
rb_reprogramado.visible				= false
cbx_resciliados.visible					= false

st_2.visible								= false
st_3.visible								= false
cbx_otros_parques.visible			= false
gb_otros_parques.visible				= false
cbx_otros_parques.checked			= false

rb_promesas.checked 				= false
rb_pagare.checked 					= false
rb_nuevo.checked						= false
rb_reprogramado.checked			= false
cbx_resciliados.checked				= false
gb_parque.visible 						= false
dw_parque.visible 						= false
dw_fech_cierre.visible				= false
gb_fec_cierre.visible 					= false
rb_promesas.setfocus()
ddlb_parque_prom.visible 			= false
st_1.visible								= false
ddlb_parque_prom.visible 			= true
st_1.visible								= true





end event

type gb_4 from groupbox within w_incobrabilidad_contratos_bkp
integer x = 32
integer y = 56
integer width = 443
integer height = 248
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Documento"
end type

type cb_cerrar from commandbutton within w_incobrabilidad_contratos_bkp
integer x = 2802
integer y = 1844
integer width = 265
integer height = 100
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_incobrabilidad_contratos)
end event

type dw_lista from datawindow within w_incobrabilidad_contratos_bkp
integer x = 27
integer y = 324
integer width = 3040
integer height = 1476
integer taborder = 60
string title = "none"
string dataobject = "dwe_incobrabilidad_pagares"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within w_incobrabilidad_contratos_bkp
integer x = 2862
integer y = 76
integer width = 197
integer height = 176
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string 	ls_contrato,ls_ctas,ls_estado_ini,ls_estado_fin,ls_est_comi,ls_condicion,ls_tipo,ls_usuario,ls_parque,ls_nom_parque
long 		ll_indi,ll_parque,ll_new,ll_tot_reg,ll_num_prom,ll_mora_ini,ll_mora_fin,ll_ctas_mora,ll_monto_mora,ll_pos
double	ll_sum_capital,ll_sum_capital_cp,ll_porcen,ll_prov_incob,ll_tot_cobrar,ll_cobrar_cp,ll_cobrar_lp,ll_pag_monto_mora,&
			ll_pag_capital,ll_pag_capital_cp,ll_pag_tot_cob,ll_prov_cp,ll_prov_lp,ll_tot_prov
date		ld_fech_cierre

setnull(ls_estado_ini); setnull(ls_estado_fin);setnull(ll_sum_capital);setnull(ll_sum_capital_cp);setnull(ll_porcen);
setnull(ll_prov_incob);setnull(ll_tot_cobrar);setnull(ll_cobrar_cp);setnull(ll_cobrar_lp);setnull(ll_pag_monto_mora);

dw_lista.reset()
ld_fech_cierre= dw_fech_cierre.getitemdate(1,'fec_cierre')
if isnull(ld_fech_cierre) or ld_fech_cierre = date('00/00/0000') then
	messagebox("Advertencia","Debe Seleccionar Fecha de Cierre")
	dw_fech_cierre.setfocus()
end if
ls_usuario							= gs_user
if rb_promesas.checked = true then   // Promesas
	if rb_nuevo.checked = true then
		if cbx_resciliados.checked = false then 
			dw_lista.dataobject	 = 'dwe_incobrabilidad_nuevas'
			ls_estado_ini			 = 'N'
			ls_estado_fin			 = 'S'
			ls_tipo					 = 'N'
		elseif cbx_resciliados.checked = true then 	
			dw_lista.dataobject = 'dwe_incobrabilidad_resciliados'
			ls_estado_ini			 = 'R'
			ls_estado_fin			 = 'R'
			ls_tipo					 = 'NR'
		end if
		ls_parque                        						= ddlb_parque_prom.text
		ll_pos                           							= POS (ls_parque,'-')
		if ll_pos > 0 then ll_pos = ll_pos - 1
			ll_parque                      						=long(trim(mid(ls_parque,1,ll_pos)))
		if ll_parque > 0 then	
			SELECT	"COD_PARQ"."NOMBRE"  
			INTO 	  	:ls_nom_parque  
			FROM 	"COD_PARQ"  
			WHERE 	"COD_PARQ"."CODIGO" = :ll_parque   
			USING 	sqlca;
			if sqlca.sqlcode = 0 then
				dw_lista.object.t_titulo.text = 'Parque '+ls_nom_parque
			else
				messagebox("Error","Error conexcion sql")
			end if	
		else
			messagebox("Advertencia","Falta Ingresar Parque")
			ddlb_parque_prom.setfocus()
		end if	
//		if gs_conexion	= "Parque El Prado" then	
//			dw_lista.object.t_titulo.text = 'El Prado - El Manantial - Santiago'
//		elseif gs_conexion	= "Parque La Foresta" then
//			dw_lista.object.t_titulo.text = 'La Foresta'	
//		end if	
		for ll_indi = 1 to 7
			if ll_indi = 1 then
				ll_mora_ini	= 0
				ll_mora_fin	= 0
				ls_ctas		= '0'
				ll_porcen		= 0
			elseif	ll_indi = 2 then
				ll_mora_ini	= 1
				ll_mora_fin	= 3
				ls_ctas	= '1 y 3'
				ll_porcen		= 1
			elseif	ll_indi = 3 then
				ll_mora_ini	= 4
				ll_mora_fin	= 6
				ls_ctas	= '4 y 6'
				ll_porcen		= 5
			elseif	ll_indi = 4 then
				ll_mora_ini	= 7
				ll_mora_fin	= 8
				ls_ctas	= '7 y 8'
				ll_porcen		= 15
			elseif	ll_indi = 5 then
				ll_mora_ini	= 9
				ll_mora_fin	= 10
				ls_ctas	= '9 y 10'
				ll_porcen		= 30
			elseif	ll_indi = 6 then
				ll_mora_ini	= 11
				ll_mora_fin	= 11
				ls_ctas	= '11'
				ll_porcen		= 60
			elseif	ll_indi = 7 then	
				ll_mora_ini	= 12
				ll_mora_fin	= 100000
				ls_ctas		= '12 y más'
				ll_porcen		= 100
			end if
			
			SELECT	 count("FACTURA_OFERTA"."NUMERO")   //nº promesas
			INTO 		:ll_num_prom  
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" <> 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR"FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
	
			SELECT	 sum("FACTURA_OFERTA"."MORA")   //nº cuotas mora
			INTO 		:ll_ctas_mora 
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" <> 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
			
			SELECT	 sum("FACTURA_OFERTA"."MONTO_MORA")   //sum monto mora
			INTO 		:ll_monto_mora  
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" <> 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
						  
			SELECT 	sum("FACTURA_OFERTA"."CAPITAL")  //sum capital
			INTO		:ll_sum_capital  
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" <> 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre  AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini  AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
			
			SELECT 	sum("FACTURA_OFERTA"."CAPITAL_CP")  //sum capital corto plazo
			INTO		:ll_sum_capital_cp
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" <> 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre  AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
			ll_tot_cobrar			= ll_sum_capital
			ll_prov_incob			= round((ll_sum_capital/100)*ll_porcen,2)
			ll_cobrar_cp				= ll_sum_capital_cp	
			ll_prov_cp				= round((ll_sum_capital_cp/100)*ll_porcen,2)		
			ll_cobrar_lp				= (ll_sum_capital - ll_sum_capital_cp)
			ll_prov_lp				= round((ll_cobrar_lp/100)*ll_porcen,2)
			dw_lista.insertrow(0)
			dw_lista.setitem(ll_indi,'incobrabilidad',ll_porcen)
			dw_lista.setitem(ll_indi,'promesas',ll_num_prom)
			if ll_prov_incob > 0 then
				dw_lista.setitem(ll_indi,'provision_incob',ll_prov_incob)
			else
				dw_lista.setitem(ll_indi,'provision_incob',0)
			end if	
			if ll_ctas_mora >= 0 then
				dw_lista.setitem(ll_indi,'capital',ll_sum_capital)
			else
				dw_lista.setitem(ll_indi,'capital',0)
			end if	
			if ll_sum_capital_cp >= 0 then
				dw_lista.setitem(ll_indi,'capital_plazo',ll_sum_capital_cp)
			else	
				dw_lista.setitem(ll_indi,'capital_plazo',0)
			end if
			if ll_ctas_mora >= 0 then 
				dw_lista.setitem(ll_indi,'cuotas_mora',ll_ctas_mora)
			else
				dw_lista.setitem(ll_indi,'cuotas_mora',0)
			end if	
			if ll_monto_mora >= 0 then 
				dw_lista.setitem(ll_indi,'monto_mora',ll_monto_mora)
			else
				dw_lista.setitem(ll_indi,'monto_mora',0)
			end if	
			if ll_tot_cobrar >= 0 then 
				dw_lista.setitem(ll_indi,'total_x_cobrar',ll_tot_cobrar)
			else	
				dw_lista.setitem(ll_indi,'total_x_cobrar',0)
			end if
			if cbx_resciliados.checked = false then 
				dw_lista.setitem(ll_indi,'monto_p',ll_cobrar_cp)
				dw_lista.setitem(ll_indi,'monto_lp',ll_cobrar_lp)
				dw_lista.setitem(ll_indi,'provision_p',ll_prov_cp)
				dw_lista.setitem(ll_indi,'provision_lp',ll_prov_lp)
			end if	
			dw_lista.setitem(ll_indi,'tipo_contrato',ls_tipo)
			dw_lista.setitem(ll_indi,'texto_mora',ls_ctas)
			dw_lista.setitem(ll_indi,'usuario',ls_usuario)
			dw_lista.setitem(ll_indi,"fecha",ld_fech_cierre)
		next
	elseif 	rb_reprogramado.checked = true then
		if cbx_resciliados.checked = false then 
			dw_lista.dataobject	 = 'dwe_incobrabilidad_nuevas'
			ls_estado_ini			 = 'N'
			ls_estado_fin			 = 'S'
			ls_tipo					 = 'R'
		elseif cbx_resciliados.checked = true then 	
			dw_lista.dataobject = 'dwe_incobrabilidad_resciliados'
			ls_estado_ini			 = 'R'
			ls_estado_fin			 = 'R'
			ls_tipo					 = 'RR'
		end if
		ls_parque                        						= ddlb_parque_prom.text
		ll_pos                           							= POS (ls_parque,'-')
		if ll_pos > 0 then ll_pos = ll_pos - 1
			ll_parque                      						=long(trim(mid(ls_parque,1,ll_pos)))
		if ll_parque > 0 then	
			SELECT	"COD_PARQ"."NOMBRE"  
			INTO 	  	:ls_nom_parque  
			FROM 	"COD_PARQ"  
			WHERE 	"COD_PARQ"."CODIGO" = :ll_parque   
			USING 	sqlca;
			if sqlca.sqlcode = 0 then
				dw_lista.object.t_titulo.text = 'Parque '+ls_nom_parque
			else
				messagebox("Error","Error conexcion sql")
			end if	
		else
			messagebox("Advertencia","Falta Ingresar Parque")
			ddlb_parque_prom.setfocus()
		end if	
//		if gs_conexion	= "Parque El Prado" then	
//			dw_lista.object.t_titulo.text = 'El Prado - El Manantial - Santiago'
//		elseif gs_conexion	= "Parque La Foresta" then
//			dw_lista.object.t_titulo.text = 'La Foresta'	
//		end if	
		for ll_indi = 1 to 7
			if ll_indi = 1 then
				ll_mora_ini	= 0
				ll_mora_fin	= 0
				ls_ctas		= '0'
				ll_porcen		= 0
			elseif	ll_indi = 2 then
				ll_mora_ini	= 1
				ll_mora_fin	= 1
				ls_ctas	= '1'
				ll_porcen		= 1
			elseif	ll_indi = 3 then
				ll_mora_ini	= 2
				ll_mora_fin	= 2
				ls_ctas	= '2'
				ll_porcen		= 5
			elseif	ll_indi = 4 then
				ll_mora_ini	= 3
				ll_mora_fin	= 4
				ls_ctas	= '3 y 4'
				ll_porcen		= 25
			elseif	ll_indi = 5 then
				ll_mora_ini	= 5
				ll_mora_fin	= 8
				ls_ctas	= '5 y 8'
				ll_porcen		= 30
			elseif	ll_indi = 6 then
				ll_mora_ini	= 9
				ll_mora_fin	= 11
				ls_ctas	= '9 a 11'
				ll_porcen		= 45
			elseif	ll_indi = 7 then
				ll_mora_ini	= 12
				ll_mora_fin	= 100000
				ls_ctas		= '12 y más'
				ll_porcen		= 100
			end if
			SELECT	 count("FACTURA_OFERTA"."NUMERO")   //nº promesas
			INTO 		:ll_num_prom  
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" = 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
			
			SELECT	 sum("FACTURA_OFERTA"."MORA")   //nº cuotas mora
			INTO 		:ll_ctas_mora 
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" = 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
			
			SELECT	 sum("FACTURA_OFERTA"."MONTO_MORA")   //sum monto mora
			INTO 		:ll_monto_mora  
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" = 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
						  
			SELECT 	sum("FACTURA_OFERTA"."CAPITAL")  //sum capital
			INTO		:ll_sum_capital  
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" = 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre  AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini  AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
			
			SELECT 	sum("FACTURA_OFERTA"."CAPITAL_CP")  //sum capital cp
			INTO		:ll_sum_capital_cp
			FROM 	"FACTURA_OFERTA"  
			WHERE 	"FACTURA_OFERTA"."BASE" = 'O' AND  
						"FACTURA_OFERTA"."SERIE" = 'R' AND
						( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
						"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre  AND
						"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
						( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
			USING	sqlca;
			
			ll_tot_cobrar			= ll_sum_capital
			ll_prov_incob			= round((ll_sum_capital/100)*ll_porcen,2)
			ll_cobrar_cp				= ll_sum_capital_cp	
			ll_prov_cp				= round((ll_sum_capital_cp/100)*ll_porcen,2)		
			ll_cobrar_lp				= (ll_sum_capital - ll_sum_capital_cp)
			ll_prov_lp				= round((ll_cobrar_lp/100)*ll_porcen,2)
			dw_lista.insertrow(0)
			dw_lista.setitem(ll_indi,'incobrabilidad',ll_porcen)
			dw_lista.setitem(ll_indi,'promesas',ll_num_prom)
			if ll_prov_incob > 0 then
				dw_lista.setitem(ll_indi,'provision_incob',ll_prov_incob)
			else
				dw_lista.setitem(ll_indi,'provision_incob',0)
			end if	
			if ll_ctas_mora >= 0 then
				dw_lista.setitem(ll_indi,'capital',ll_sum_capital)
			else
				dw_lista.setitem(ll_indi,'capital',0)
			end if	
			if ll_sum_capital_cp >= 0 then
				dw_lista.setitem(ll_indi,'capital_plazo',ll_sum_capital_cp)
			else	
				dw_lista.setitem(ll_indi,'capital_plazo',0)
			end if
			if ll_ctas_mora >= 0 then 
				dw_lista.setitem(ll_indi,'cuotas_mora',ll_ctas_mora)
			else
				dw_lista.setitem(ll_indi,'cuotas_mora',0)
			end if	
			if ll_monto_mora >= 0 then 
				dw_lista.setitem(ll_indi,'monto_mora',ll_monto_mora)
			else
				dw_lista.setitem(ll_indi,'monto_mora',0)
			end if	
			if ll_tot_cobrar >= 0 then 
				dw_lista.setitem(ll_indi,'total_x_cobrar',ll_tot_cobrar)
			else	
				dw_lista.setitem(ll_indi,'total_x_cobrar',0)
			end if
			if cbx_resciliados.checked = false then 
				dw_lista.setitem(ll_indi,'monto_p',ll_cobrar_cp)
				dw_lista.setitem(ll_indi,'monto_lp',ll_cobrar_lp)
				dw_lista.setitem(ll_indi,'provision_p',ll_prov_cp)
				dw_lista.setitem(ll_indi,'provision_lp',ll_prov_lp)
			end if	
			dw_lista.setitem(ll_indi,'tipo_contrato',ls_tipo)
			dw_lista.setitem(ll_indi,'texto_mora',ls_ctas)
			dw_lista.setitem(ll_indi,'usuario',ls_usuario)
			dw_lista.setitem(ll_indi,"fecha",ld_fech_cierre)
		next
	else
		messagebox('Advertencia','No ha Selecionado Tipo de Promesa')
		setfocus(rb_nuevo)
	end if			
elseif rb_pagare.checked = true then
	if cbx_otros_parques.checked = false then
		SetPointer(HourGlass!)
		ll_parque				= dw_parque.getitemnumber(1,'parque')
		if isnull(ll_parque) or ll_parque = 0 then
		messagebox("Advertencia","Debe Seleccionar Parque")
		dw_parque.setfocus()
		end if	
		if rb_lista_pagare.checked = true or rb_p_licitados.checked = true then 
			dw_lista.dataobject	 = 'dwe_incobrabilidad_pagares'
			ls_estado_ini			 = 'N'
			ls_estado_fin			 = 'S'
			if rb_lista_pagare.checked = true then
				ls_tipo				= 'P'
			elseif rb_p_licitados.checked = true	then
				ls_tipo				= 'PL'
			end if
		elseif rb_p_resciliado.checked = true  or rb_p_licit_resc.checked = true then 	
			dw_lista.dataobject	 = 'dwe_incobrabilidad_pagares'
			ls_estado_ini			 = 'R'
			ls_estado_fin			 = 'R'
			if rb_p_resciliado.checked = true then
				ls_tipo				= 'R'
			elseif rb_p_licit_resc.checked = true	then
				ls_tipo				= 'RL'
			end if
		end if		
		if ll_parque = 1 then
			ls_est_comi				= 'P' 
		elseif ll_parque= 11 or ll_parque = 103 then
			ls_est_comi				= 'S' 
		elseif ll_parque = 102 then
			messagebox("Advertencia","Este Parque No Maneja Pagares")
			ls_est_comi				= '' 
		elseif ll_parque = 104 then
			
		elseif ll_parque = 801 then
		end if	
		if rb_lista_pagare.checked = true or rb_p_resciliado.checked = true then	
			for ll_indi = 1 to 6
				if ll_indi = 1 then
					ll_mora_ini	= 0
					ll_mora_fin	= 0
					ls_ctas		= '0'
					ll_porcen		= 0
				elseif	ll_indi = 2 then
					ll_mora_ini	= 1
					ll_mora_fin	= 1
					ls_ctas		= '1'
					ll_porcen		= 1
				elseif	ll_indi = 3 then
					ll_mora_ini	= 2
					ll_mora_fin	= 2
					ls_ctas		= '2'
					ll_porcen		= 10
				elseif	ll_indi = 4 then
					ll_mora_ini	= 3
					ll_mora_fin	= 4
					ls_ctas		= '3 y 4'
					ll_porcen		= 25
				elseif	ll_indi = 5 then
					ll_mora_ini	= 5
					ll_mora_fin	= 12
					ls_ctas		= '5 a 12'
					ll_porcen		= 45
				elseif	ll_indi = 6 then
					ll_mora_ini	= 13
					ll_mora_fin	= 100000
					ls_ctas		= '13 y más'
					ll_porcen		= 100
				end if
				
				SELECT 	sum("FACTURA_PAGARE"."MONTO_MORA")  
				INTO		:ll_pag_monto_mora  
				FROM		"FACTURA_PAGARE","PAGARE"  
				WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
							"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
							"FACTURA_PAGARE"."BASE" = 'P' AND  
							/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
							"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
							( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
							( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin)
				USING	sqlca;
				
				SELECT 	sum("FACTURA_PAGARE"."CAPITAL")  
				INTO		:ll_pag_capital  
				FROM		"FACTURA_PAGARE","PAGARE"  
				WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
							"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
							"FACTURA_PAGARE"."BASE" = 'P' AND  
							/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
							"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
							( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
							( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin)
				USING	sqlca;
				
				SELECT 	sum("FACTURA_PAGARE"."CAPITAL_CP")
				INTO		:ll_pag_capital_cp  
				FROM		"FACTURA_PAGARE","PAGARE"  
				WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
							"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
							"FACTURA_PAGARE"."BASE" = 'P' AND  
							/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
							"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
							( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
							( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin)
				USING	sqlca;
				if ll_pag_capital > 0 then
					ll_pag_capital 		= ll_pag_capital
				else
					ll_pag_capital		= 0
				end if
				if ll_pag_capital_cp > 0 then
					ll_pag_capital_cp 		= ll_pag_capital_cp
				else
					ll_pag_capital_cp		= 0
				end if
				ll_tot_cobrar			= ll_pag_capital
				ll_prov_incob			= round((ll_pag_capital/100)*ll_porcen,2)
				ll_cobrar_cp				= ll_pag_capital_cp	
				ll_prov_cp				= round((ll_pag_capital_cp/100)*ll_porcen,2)		
				ll_cobrar_lp				= (ll_pag_capital - ll_pag_capital_cp)
				ll_prov_lp				= round((ll_cobrar_lp/100)*ll_porcen,2)
				ll_tot_prov				= round(ll_prov_cp+ll_prov_lp,2)
				
				dw_lista.insertrow(0)
				dw_lista.setitem(ll_indi,'incobrabilidad',ll_porcen)
				if ll_prov_incob > 0 then
					dw_lista.setitem(ll_indi,'provision_incob',ll_prov_incob)
				else
					dw_lista.setitem(ll_indi,'provision_incob',0)
				end if	
				if ll_ctas_mora >= 0 then
					dw_lista.setitem(ll_indi,'capital',ll_pag_capital)
				else
					dw_lista.setitem(ll_indi,'capital',0)
				end if	
				if ll_pag_capital_cp >= 0 then
					dw_lista.setitem(ll_indi,'capital_plazo',ll_pag_capital_cp)
				else	
					dw_lista.setitem(ll_indi,'capital_plazo',0)
				end if
				if ll_pag_monto_mora >= 0 then 
					dw_lista.setitem(ll_indi,'monto_mora',ll_pag_monto_mora)
				else
					dw_lista.setitem(ll_indi,'monto_mora',0)
				end if	
				if ll_tot_cobrar >= 0 then 
					dw_lista.setitem(ll_indi,'total_x_cobrar',ll_tot_cobrar)
				else	
					dw_lista.setitem(ll_indi,'total_x_cobrar',0)
				end if
			//	if cbx_resciliados.checked = false then 
					dw_lista.setitem(ll_indi,'monto_p',ll_cobrar_cp)
					dw_lista.setitem(ll_indi,'monto_lp',ll_cobrar_lp)
					dw_lista.setitem(ll_indi,'provision_p',ll_prov_cp)
					dw_lista.setitem(ll_indi,'provision_lp',ll_prov_lp)
					dw_lista.setitem(ll_indi,'tot_provision',ll_tot_prov)
			//	end if	
				dw_lista.setitem(ll_indi,'tipo_contrato',ls_tipo)
				dw_lista.setitem(ll_indi,'texto_mora',ls_ctas)
				dw_lista.setitem(ll_indi,"cod_parque",string(ll_parque))
				dw_lista.setitem(ll_indi,"fecha",ld_fech_cierre)
				dw_lista.setitem(ll_indi,'usuario',ls_usuario)
			next
		elseif rb_p_licitados.checked = true or rb_p_licit_resc.checked = true then
			for ll_indi = 1 to 6
				if ll_indi = 1 then
					ll_mora_ini	= 0
					ll_mora_fin	= 0
					ls_ctas		= '0'
					ll_porcen		= 0
				elseif	ll_indi = 2 then
					ll_mora_ini	= 1
					ll_mora_fin	= 1
					ls_ctas		= '1'
					ll_porcen		= 1
				elseif	ll_indi = 3 then
					ll_mora_ini	= 2
					ll_mora_fin	= 2
					ls_ctas		= '2'
					ll_porcen		= 10
				elseif	ll_indi = 4 then
					ll_mora_ini	= 3
					ll_mora_fin	= 4
					ls_ctas		= '3 y 4'
					ll_porcen		= 25
				elseif	ll_indi = 5 then
					ll_mora_ini	= 5
					ll_mora_fin	= 12
					ls_ctas		= '5 a 12'
					ll_porcen		= 45
				elseif	ll_indi = 6 then
					ll_mora_ini	= 13
					ll_mora_fin	= 100000
					ls_ctas		= '13 y más'
					ll_porcen		= 100	
				end if
				
				SELECT 	sum("FACTURA_PAGARE"."MONTO_MORA")  
				INTO		:ll_pag_monto_mora  
				FROM		"FACTURA_PAGARE","PAGARE"  
				WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
							"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
							"FACTURA_PAGARE"."BASE" = 'P' AND  
							/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
							"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
							( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
							( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
							  "PAGARE"."ORIGEN" = 'L' 
				USING	sqlca;
				
				SELECT 	sum("FACTURA_PAGARE"."CAPITAL")  
				INTO		:ll_pag_capital  
				FROM		"FACTURA_PAGARE","PAGARE"  
				WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
							"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
							"FACTURA_PAGARE"."BASE" = 'P' AND  
							/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
							"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
							( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
							( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
							  "PAGARE"."ORIGEN" = 'L' 
				USING	sqlca;
				
				SELECT 	sum("FACTURA_PAGARE"."CAPITAL_CP")
				INTO		:ll_pag_capital_cp  
				FROM		"FACTURA_PAGARE","PAGARE"  
				WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
							"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
							"FACTURA_PAGARE"."BASE" = 'P' AND  
							/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
							"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
							( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
							( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
							  "PAGARE"."ORIGEN" = 'L' 
				USING	sqlca;
				if ll_pag_capital > 0 then
					ll_pag_capital 		= ll_pag_capital
				else
					ll_pag_capital		= 0
				end if
				if ll_pag_capital_cp > 0 then
					ll_pag_capital_cp 		= ll_pag_capital_cp
				else
					ll_pag_capital_cp		= 0
				end if
				ll_tot_cobrar			= ll_pag_capital
				ll_prov_incob			= round((ll_pag_capital/100)*ll_porcen,2)
				ll_cobrar_cp				= ll_pag_capital_cp	
				ll_prov_cp				= round((ll_pag_capital_cp/100)*ll_porcen,2)		
				ll_cobrar_lp				= (ll_pag_capital - ll_pag_capital_cp)
				ll_prov_lp				= round((ll_cobrar_lp/100)*ll_porcen,2)
				ll_tot_prov				= round(ll_prov_cp+ll_prov_lp,2)
				
				dw_lista.insertrow(0)
				dw_lista.setitem(ll_indi,'incobrabilidad',ll_porcen)
				if ll_prov_incob > 0 then
					dw_lista.setitem(ll_indi,'provision_incob',ll_prov_incob)
				else
					dw_lista.setitem(ll_indi,'provision_incob',0)
				end if	
				if ll_ctas_mora >= 0 then
					dw_lista.setitem(ll_indi,'capital',ll_pag_capital)
				else
					dw_lista.setitem(ll_indi,'capital',0)
				end if	
				if ll_pag_capital_cp >= 0 then
					dw_lista.setitem(ll_indi,'capital_plazo',ll_pag_capital_cp)
				else	
					dw_lista.setitem(ll_indi,'capital_plazo',0)
				end if
				if ll_pag_monto_mora >= 0 then 
					dw_lista.setitem(ll_indi,'monto_mora',ll_pag_monto_mora)
				else
					dw_lista.setitem(ll_indi,'monto_mora',0)
				end if	
				if ll_tot_cobrar >= 0 then 
					dw_lista.setitem(ll_indi,'total_x_cobrar',ll_tot_cobrar)
				else	
					dw_lista.setitem(ll_indi,'total_x_cobrar',0)
				end if
			//	if cbx_resciliados.checked = false then 
					dw_lista.setitem(ll_indi,'monto_p',ll_cobrar_cp)
					dw_lista.setitem(ll_indi,'monto_lp',ll_cobrar_lp)
					dw_lista.setitem(ll_indi,'provision_p',ll_prov_cp)
					dw_lista.setitem(ll_indi,'provision_lp',ll_prov_lp)
					dw_lista.setitem(ll_indi,'tot_provision',ll_tot_prov)
			//	end if	
				dw_lista.setitem(ll_indi,'tipo_contrato',ls_tipo)
				dw_lista.setitem(ll_indi,'texto_mora',ls_ctas)
				dw_lista.setitem(ll_indi,"cod_parque",STRING(ll_parque))
				dw_lista.setitem(ll_indi,"fecha",ld_fech_cierre)
				dw_lista.setitem(ll_indi,'usuario',ls_usuario)
			next
		end if	
		SetPointer(Arrow!)
	else
		dw_lista.dataobject	= 'dwe_incobrabilidad_pagares'
		ls_estado_ini			= 'N'
		ls_estado_fin			= 'S'
		ls_tipo					= 'P'
		ls_est_comi				= 'O' 
		for ll_indi = 1 to 6
			if ll_indi = 1 then
				ll_mora_ini	= 0
				ll_mora_fin	= 0
				ls_ctas		= '0'
				ll_porcen		= 0
			elseif	ll_indi = 2 then
				ll_mora_ini	= 1
				ll_mora_fin	= 1
				ls_ctas		= '1'
				ll_porcen		= 1
			elseif	ll_indi = 3 then
				ll_mora_ini	= 2
				ll_mora_fin	= 2
				ls_ctas		= '2'
				ll_porcen		= 10
			elseif	ll_indi = 4 then
				ll_mora_ini	= 3
				ll_mora_fin	= 4
				ls_ctas		= '3 y 4'
				ll_porcen		= 25
			elseif	ll_indi = 5 then
				ll_mora_ini	= 5
				ll_mora_fin	= 12
				ls_ctas		= '5 a 12'
				ll_porcen		= 45
			elseif	ll_indi = 6 then
				ll_mora_ini	= 13
				ll_mora_fin	= 100000
				ls_ctas		= '13 y más'
				ll_porcen		= 100
			end if
			
			SELECT 	sum("FACTURA_PAGARE"."MONTO_MORA")  
			INTO		:ll_pag_monto_mora  
			FROM		"FACTURA_PAGARE","PAGARE"  
			WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
						"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
						"FACTURA_PAGARE"."BASE" = 'P' AND  
						/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
						"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
						( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
						( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin)
			USING	sqlca;
			
			SELECT 	sum("FACTURA_PAGARE"."CAPITAL")  
			INTO		:ll_pag_capital  
			FROM		"FACTURA_PAGARE","PAGARE"  
			WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
						"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
						"FACTURA_PAGARE"."BASE" = 'P' AND  
						/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
						"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
						( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
						( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin)
			USING	sqlca;
			
			SELECT 	sum("FACTURA_PAGARE"."CAPITAL_CP")
			INTO		:ll_pag_capital_cp  
			FROM		"FACTURA_PAGARE","PAGARE"  
			WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
						"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
						"FACTURA_PAGARE"."BASE" = 'P' AND  
						/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
						"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
						( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
						( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin)
			USING	sqlca;
			if ll_pag_capital > 0 then
				ll_pag_capital 		= ll_pag_capital
			else
				ll_pag_capital		= 0
			end if
			if ll_pag_capital_cp > 0 then
				ll_pag_capital_cp 		= ll_pag_capital_cp
			else
				ll_pag_capital_cp		= 0
			end if
			ll_tot_cobrar			= ll_pag_capital
			ll_prov_incob			= round((ll_pag_capital/100)*ll_porcen,2)
			ll_cobrar_cp				= ll_pag_capital_cp	
			ll_prov_cp				= round((ll_pag_capital_cp/100)*ll_porcen,2)		
			ll_cobrar_lp				= (ll_pag_capital - ll_pag_capital_cp)
			ll_prov_lp				= round((ll_cobrar_lp/100)*ll_porcen,2)
			ll_tot_prov				= round(ll_prov_cp+ll_prov_lp,2)
			
			dw_lista.insertrow(0)
			dw_lista.setitem(ll_indi,'incobrabilidad',ll_porcen)
			if ll_prov_incob > 0 then
				dw_lista.setitem(ll_indi,'provision_incob',ll_prov_incob)
			else
				dw_lista.setitem(ll_indi,'provision_incob',0)
			end if	
			if ll_ctas_mora >= 0 then
				dw_lista.setitem(ll_indi,'capital',ll_pag_capital)
			else
				dw_lista.setitem(ll_indi,'capital',0)
			end if	
			if ll_pag_capital_cp >= 0 then
				dw_lista.setitem(ll_indi,'capital_plazo',ll_pag_capital_cp)
			else	
				dw_lista.setitem(ll_indi,'capital_plazo',0)
			end if
			if ll_pag_monto_mora >= 0 then 
				dw_lista.setitem(ll_indi,'monto_mora',ll_pag_monto_mora)
			else
				dw_lista.setitem(ll_indi,'monto_mora',0)
			end if	
			if ll_tot_cobrar >= 0 then 
				dw_lista.setitem(ll_indi,'total_x_cobrar',ll_tot_cobrar)
			else	
				dw_lista.setitem(ll_indi,'total_x_cobrar',0)
			end if
		//	if cbx_resciliados.checked = false then 
				dw_lista.setitem(ll_indi,'monto_p',ll_cobrar_cp)
				dw_lista.setitem(ll_indi,'monto_lp',ll_cobrar_lp)
				dw_lista.setitem(ll_indi,'provision_p',ll_prov_cp)
				dw_lista.setitem(ll_indi,'provision_lp',ll_prov_lp)
				dw_lista.setitem(ll_indi,'tot_provision',ll_tot_prov)
		//	end if	
			dw_lista.setitem(ll_indi,'tipo_contrato',ls_tipo)
			dw_lista.setitem(ll_indi,'texto_mora',ls_ctas)
			dw_lista.setitem(ll_indi,"cod_parque",string(ll_parque))
			dw_lista.setitem(ll_indi,"fecha",ld_fech_cierre)
			dw_lista.setitem(ll_indi,'usuario',ls_usuario)
		next	
	end if	
end if	
end event

type rb_pagare from radiobutton within w_incobrabilidad_contratos_bkp
integer x = 64
integer y = 200
integer width = 270
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagares"
end type

event clicked;	gb_pagare.visible						= false
	rb_nuevo.visible 						= false
	rb_reprogramado.visible				= false
	cbx_resciliados.visible					= false
	
	gb_otros_parques.visible				= true
	st_2.visible								= true
	st_3.visible								= true
	cbx_otros_parques.visible			= true
	
	
	dw_fech_cierre.visible				= false
	dw_fech_cierre.visible				= true
	ddlb_parque_prom.visible 			= false
	st_1.visible								= false
	gb_fec_cierre.visible					= false
	gb_pagare.visible						= false
	gb_parque.visible 						= true
	dw_parque.visible 						= true
	rb_nuevo.checked						= false
	rb_reprogramado.checked			= false
	cbx_resciliados.checked				= false
	gb_pagare.text 						= 'Tipos de Pagare' 
	dw_fech_cierre.visible				= true
	dw_fech_cierre.x						= 517
	dw_fech_cierre.y						= 208
	dw_lista.reset()
	dw_fech_cierre.reset()
	dw_parque.settransobject(sqlca)
	dw_parque.insertrow(0)
	dw_fech_cierre.settransobject(sqlca)
	dw_fech_cierre.insertrow(0)
	
////if dw_parque.getitemnumber(1,'parque') > 0 then
////	if dw_parque.getitemnumber(1,'parque') = 1 or dw_parque.getitemnumber(1,'parque') = 11 then
//		rb_nuevo.visible						= false
//		rb_reprogramado.visible				= false
//		gb_pagare.visible 						= true
//		rb_lista_pagare.visible				= true
//		rb_p_resciliado.visible				= true
//		rb_p_licitados.visible					= true
//		rb_p_licit_resc.visible					= true		
//		gb_pagare.text 						= 'Tipos de Pagare' 	
//		gb_pagare.x 							= 1472
//		gb_pagare.y 							= 56 
//		gb_pagare.width						= 1650
//		gb_pagare.height						= 160  
////	elseif dw_parque.getitemnumber(1,'parque') = 103  or dw_parque.getitemnumber(1,'parque') = 105 then
//		rb_nuevo.visible						= false
//		rb_reprogramado.visible				= false
//		gb_pagare.visible 						= true
//		rb_lista_pagare.visible				= true
//		rb_p_resciliado.visible				= true
//		rb_p_licitados.visible					= false
//		rb_p_licit_resc.visible					= false
//		gb_pagare.text 						= 'Tipos de Pagare' 	
//		gb_pagare.x 							= 1472
//		gb_pagare.y 							= 56  
//		gb_pagare.width						= 695
//		gb_pagare.height						= 160
////	elseif dw_parque.getitemnumber(1,'parque') = 102 then
//		rb_nuevo.visible						= false
//		rb_reprogramado.visible				= false
//		gb_pagare.visible 						= false
//		rb_lista_pagare.visible				= false
//		rb_p_resciliado.visible				= false
//		rb_p_licitados.visible					= false
//		rb_p_licit_resc.visible					= false
//		messagebox("Advertencia","Este Parque No Paneja Pagares")	
//		rb_pagare.checked					= false
////	end if
////	rb_nuevo.checked							= false
////	rb_reprogramado.checked				= false
////else
////	messagebox("Advertencia","Debe Seleccionar Parque")
////	dw_parque.setfocus()
////	rb_pagare.checked = false	
////end if	
end event

type rb_promesas from radiobutton within w_incobrabilidad_contratos_bkp
integer x = 64
integer y = 120
integer width = 320
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Promesas"
end type

event clicked;string ls_nom_parque,ls_string
long	ll_cod_parque
	
gb_parque.visible			= false
dw_parque.visible 			= false
rb_lista_pagare.visible	= false
rb_p_resciliado.visible	= false
rb_p_licitados.visible		= false
rb_p_licit_resc.visible		= false

st_2.visible						= false
st_3.visible						= false
cbx_otros_parques.visible	= false
gb_otros_parques.visible		= false
cbx_otros_parques.checked	= false

gb_fec_cierre.visible		= true
gb_fec_cierre.x				= 1376
gb_fec_cierre.y				= 56
gb_pagare.visible			= true
gb_pagare.x					= 498
gb_pagare.y					= 56
gb_pagare.width			= 851
gb_pagare.height			= 248
rb_nuevo.visible 			= true
rb_reprogramado.visible	= true
cbx_resciliados.visible		= true
dw_fech_cierre.visible	= true
dw_fech_cierre.x			= 1408
dw_fech_cierre.y			= 108
gb_pagare.text 			= 'Tipos de Contratos'
dw_fech_cierre.reset()
dw_fech_cierre.settransobject(sqlca)
dw_fech_cierre.insertrow(0)
dw_lista.reset()
dw_parque.reset()

ddlb_parque_prom.visible 			= true
ddlb_parque_prom.reset()
st_1.visible								= true
if ddlb_parque_prom.visible = true then
	DECLARE x1 CURSOR FOR  
	SELECT 		"COD_PARQ"."CODIGO",   
					"COD_PARQ"."NOMBRE"  
	FROM 		"COD_PARQ"  
	WHERE 		"COD_PARQ"."GRUPO" = 1
	ORDER BY	"COD_PARQ"."CODIGO" ASC  
	USING		sqlca;
	Open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0 
			Fetch x1 into :ll_cod_parque, :ls_nom_parque;
			if  not isnull(ll_cod_parque) and ll_cod_parque > 0 then
				ls_string	= string(ll_cod_parque)+' - '+UPPER(ls_nom_parque)
				ddlb_parque_prom.additem(ls_string)
			end if
			Setnull(ll_cod_parque)
		LOOP
	end if
	Close x1;
end if

////if dw_parque.getitemnumber(1,'parque') > 0 then
//	gb_pagare.visible 							= true
//	rb_nuevo.visible							= true
//	rb_reprogramado.visible					= true
//	rb_lista_pagare.visible					= false
//	rb_p_resciliado.visible					= false
//	rb_p_licitados.visible						= false
//	rb_p_licit_resc.visible						= false
//	rb_lista_pagare.checked					= false
//	rb_p_resciliado.checked					= false
//	rb_p_licitados.checked					= false
//	rb_p_licit_resc.checked					= false
//	
//	gb_pagare.text = 'Tipos de Contratos' 	
//	
//	gb_pagare.x = 1472
//	gb_pagare.y = 56
//	
//	gb_pagare.width	= 695
//	gb_pagare.height	= 160
////	
////else
////	messagebox("Advertencia","Debe Seleccionar Parque")
////	dw_parque.setfocus()
////	rb_contrato.checked = false
////end if	
end event

type dw_fech_cierre from datawindow within w_incobrabilidad_contratos_bkp
integer x = 517
integer y = 208
integer width = 773
integer height = 96
integer taborder = 40
string title = "none"
string dataobject = "dwe_fec_cierre"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type rb_reprogramado from radiobutton within w_incobrabilidad_contratos_bkp
integer x = 535
integer y = 200
integer width = 434
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reprogramado"
end type

event clicked;dw_lista.reset()
end event

type rb_nuevo from radiobutton within w_incobrabilidad_contratos_bkp
integer x = 535
integer y = 120
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nuevo"
end type

event clicked;dw_lista.reset()
end event

type cbx_resciliados from checkbox within w_incobrabilidad_contratos_bkp
integer x = 951
integer y = 120
integer width = 325
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resciliados"
end type

event clicked;dw_lista.reset()
end event

type dw_parque from datawindow within w_incobrabilidad_contratos_bkp
integer x = 517
integer y = 108
integer width = 773
integer height = 96
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_parque_costos_ventas"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if 	dw_parque.visible = true then
	if dw_parque.getitemnumber(1,'parque') > 0 then
		if dw_parque.getitemnumber(1,'parque') = 1 or dw_parque.getitemnumber(1,'parque') = 11 or dw_parque.getitemnumber(1,'parque') = 104 then		
			rb_nuevo.visible						= false
			rb_reprogramado.visible				= false
			gb_pagare.visible 						= true
			rb_lista_pagare.visible				= true
			rb_p_resciliado.visible				= true
			rb_p_licitados.visible					= true
			rb_p_licit_resc.visible					= true
			gb_pagare.text 						= 'Tipos de Pagare' 
			gb_pagare.x 							= 1376
			gb_pagare.y 							= 56  
			gb_pagare.width						= 1170
			gb_pagare.height						= 252
		elseif dw_parque.getitemnumber(1,'parque') = 103  or dw_parque.getitemnumber(1,'parque') = 105 then
			rb_nuevo.visible						= false
			rb_reprogramado.visible				= false
			gb_pagare.visible 						= true
			rb_lista_pagare.visible				= true
			rb_p_resciliado.visible				= true
			rb_p_licitados.visible					= false
			rb_p_licit_resc.visible					= false
			gb_pagare.text 						= 'Tipos de Pagare' 	
			gb_pagare.x 							= 1376
			gb_pagare.y 							= 56  
			gb_pagare.width						= 530
			gb_pagare.height						= 252
		elseif dw_parque.getitemnumber(1,'parque') = 102 then
			rb_nuevo.visible						= false
			rb_reprogramado.visible				= false
			gb_pagare.visible 						= false
			rb_lista_pagare.visible				= false
			rb_p_resciliado.visible				= false
			rb_p_licitados.visible					= false
			rb_p_licit_resc.visible					= false
			messagebox("Advertencia","Este Parque No Paneja Pagares")	
		end if
	else
	//	messagebox("Advertencia","Debe Seleccionar Parque")
	//	dw_parque.setfocus()
	//	rb_pagare.checked = false	
	end if	
end if
end event

event itemchanged;dw_lista.reset()
dw_parque.AcceptText()
if dw_parque.getitemnumber(1,'parque') > 0 then
	if dw_parque.getitemnumber(1,'parque') = 1 or dw_parque.getitemnumber(1,'parque') = 11 then		
		rb_nuevo.visible						= false
		rb_reprogramado.visible				= false
		gb_pagare.visible 						= true
		rb_lista_pagare.visible				= true
		rb_p_resciliado.visible				= true
		rb_p_licitados.visible					= true
		rb_p_licit_resc.visible					= true
		gb_pagare.text 						= 'Tipos de Pagare' 	
		gb_pagare.x 							= 1376
		gb_pagare.y 							= 56  
		gb_pagare.width						= 1170
		gb_pagare.height						= 252
	elseif dw_parque.getitemnumber(1,'parque') = 103  or dw_parque.getitemnumber(1,'parque') = 105 then
		rb_nuevo.visible						= false
		rb_reprogramado.visible				= false
		gb_pagare.visible 						= true
		rb_lista_pagare.visible				= true
		rb_p_resciliado.visible				= true
		rb_p_licitados.visible					= false
		rb_p_licit_resc.visible					= false
		gb_pagare.text 						= 'Tipos de Pagare' 	
		gb_pagare.x 							= 1376
		gb_pagare.y 							= 56  
		gb_pagare.width						= 530
		gb_pagare.height						= 252
	elseif dw_parque.getitemnumber(1,'parque') = 102 or dw_parque.getitemnumber(1,'parque') = 104 then
		rb_nuevo.visible						= false
		rb_reprogramado.visible				= false
		gb_pagare.visible 						= false
		rb_lista_pagare.visible				= false
		rb_p_resciliado.visible				= false
		rb_p_licitados.visible					= false
		rb_p_licit_resc.visible					= false
		messagebox("Advertencia","Este Parque No Paneja Pagares")	
	end if
else
//	messagebox("Advertencia","Debe Seleccionar Parque")
//	dw_parque.setfocus()
//	rb_pagare.checked = false	
end if	
cbx_otros_parques.checked					= false
gb_otros_parques.visible						= false
st_2.visible										= false
st_3.visible										= false
cbx_otros_parques.visible					= false


end event

type gb_parque from groupbox within w_incobrabilidad_contratos_bkp
integer x = 498
integer y = 56
integer width = 818
integer height = 248
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Cierre y Parque"
end type

type rb_lista_pagare from radiobutton within w_incobrabilidad_contratos_bkp
integer x = 1408
integer y = 120
integer width = 265
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagare"
boolean checked = true
end type

event clicked;dw_lista.reset()
end event

type rb_p_licitados from radiobutton within w_incobrabilidad_contratos_bkp
integer x = 1915
integer y = 120
integer width = 352
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "P. Licitados"
end type

event clicked;dw_lista.reset()
end event

type rb_p_licit_resc from radiobutton within w_incobrabilidad_contratos_bkp
integer x = 1915
integer y = 200
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "P. Licitados Resciliados"
end type

event clicked;dw_lista.reset()
end event

type rb_p_resciliado from radiobutton within w_incobrabilidad_contratos_bkp
integer x = 1408
integer y = 200
integer width = 407
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "P. Resciliados"
end type

event clicked;dw_lista.reset()
end event

type gb_fec_cierre from groupbox within w_incobrabilidad_contratos_bkp
integer x = 1376
integer y = 56
integer width = 832
integer height = 248
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Cierre y Parque"
end type

type ddlb_parque_prom from dropdownlistbox within w_incobrabilidad_contratos_bkp
integer x = 1637
integer y = 208
integer width = 535
integer height = 372
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type st_1 from statictext within w_incobrabilidad_contratos_bkp
integer x = 1417
integer y = 216
integer width = 210
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque:"
boolean focusrectangle = false
end type

type gb_pagare from groupbox within w_incobrabilidad_contratos_bkp
integer x = 1376
integer y = 56
integer width = 1170
integer height = 248
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo pagare"
end type

type gb_otros_parques from groupbox within w_incobrabilidad_contratos_bkp
integer x = 2555
integer y = 56
integer width = 247
integer height = 248
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

