forward
global type w_incobrabilidad_contratos from window
end type
type st_parque_dd from statictext within w_incobrabilidad_contratos
end type
type ddlb_parque_pag from dropdownlistbox within w_incobrabilidad_contratos
end type
type rb_p_no_licit_resc from radiobutton within w_incobrabilidad_contratos
end type
type rb_p_no_licitados from radiobutton within w_incobrabilidad_contratos
end type
type dw_escala from datawindow within w_incobrabilidad_contratos
end type
type cb_imprimir from commandbutton within w_incobrabilidad_contratos
end type
type cb_2 from commandbutton within w_incobrabilidad_contratos
end type
type cb_limpiar from commandbutton within w_incobrabilidad_contratos
end type
type gb_4 from groupbox within w_incobrabilidad_contratos
end type
type cb_cerrar from commandbutton within w_incobrabilidad_contratos
end type
type dw_lista from datawindow within w_incobrabilidad_contratos
end type
type pb_aceptar from picturebutton within w_incobrabilidad_contratos
end type
type rb_pagare from radiobutton within w_incobrabilidad_contratos
end type
type rb_promesas from radiobutton within w_incobrabilidad_contratos
end type
type dw_fech_cierre from datawindow within w_incobrabilidad_contratos
end type
type rb_reprogramado from radiobutton within w_incobrabilidad_contratos
end type
type rb_lista_pagare from radiobutton within w_incobrabilidad_contratos
end type
type rb_p_licitados from radiobutton within w_incobrabilidad_contratos
end type
type rb_p_licit_resc from radiobutton within w_incobrabilidad_contratos
end type
type rb_p_resciliado from radiobutton within w_incobrabilidad_contratos
end type
type gb_1 from groupbox within w_incobrabilidad_contratos
end type
type gb_pagare from groupbox within w_incobrabilidad_contratos
end type
type gb_fec_cierre from groupbox within w_incobrabilidad_contratos
end type
type ddlb_parque_prom from dropdownlistbox within w_incobrabilidad_contratos
end type
type st_1 from statictext within w_incobrabilidad_contratos
end type
type rb_nuevo from radiobutton within w_incobrabilidad_contratos
end type
type cbx_resciliados from checkbox within w_incobrabilidad_contratos
end type
type gb_parque from groupbox within w_incobrabilidad_contratos
end type
end forward

global type w_incobrabilidad_contratos from window
integer width = 3602
integer height = 2080
boolean titlebar = true
string title = "Incobrabilidad"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
st_parque_dd st_parque_dd
ddlb_parque_pag ddlb_parque_pag
rb_p_no_licit_resc rb_p_no_licit_resc
rb_p_no_licitados rb_p_no_licitados
dw_escala dw_escala
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
rb_lista_pagare rb_lista_pagare
rb_p_licitados rb_p_licitados
rb_p_licit_resc rb_p_licit_resc
rb_p_resciliado rb_p_resciliado
gb_1 gb_1
gb_pagare gb_pagare
gb_fec_cierre gb_fec_cierre
ddlb_parque_prom ddlb_parque_prom
st_1 st_1
rb_nuevo rb_nuevo
cbx_resciliados cbx_resciliados
gb_parque gb_parque
end type
global w_incobrabilidad_contratos w_incobrabilidad_contratos

on w_incobrabilidad_contratos.create
this.st_parque_dd=create st_parque_dd
this.ddlb_parque_pag=create ddlb_parque_pag
this.rb_p_no_licit_resc=create rb_p_no_licit_resc
this.rb_p_no_licitados=create rb_p_no_licitados
this.dw_escala=create dw_escala
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
this.rb_lista_pagare=create rb_lista_pagare
this.rb_p_licitados=create rb_p_licitados
this.rb_p_licit_resc=create rb_p_licit_resc
this.rb_p_resciliado=create rb_p_resciliado
this.gb_1=create gb_1
this.gb_pagare=create gb_pagare
this.gb_fec_cierre=create gb_fec_cierre
this.ddlb_parque_prom=create ddlb_parque_prom
this.st_1=create st_1
this.rb_nuevo=create rb_nuevo
this.cbx_resciliados=create cbx_resciliados
this.gb_parque=create gb_parque
this.Control[]={this.st_parque_dd,&
this.ddlb_parque_pag,&
this.rb_p_no_licit_resc,&
this.rb_p_no_licitados,&
this.dw_escala,&
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
this.rb_lista_pagare,&
this.rb_p_licitados,&
this.rb_p_licit_resc,&
this.rb_p_resciliado,&
this.gb_1,&
this.gb_pagare,&
this.gb_fec_cierre,&
this.ddlb_parque_prom,&
this.st_1,&
this.rb_nuevo,&
this.cbx_resciliados,&
this.gb_parque}
end on

on w_incobrabilidad_contratos.destroy
destroy(this.st_parque_dd)
destroy(this.ddlb_parque_pag)
destroy(this.rb_p_no_licit_resc)
destroy(this.rb_p_no_licitados)
destroy(this.dw_escala)
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
destroy(this.rb_lista_pagare)
destroy(this.rb_p_licitados)
destroy(this.rb_p_licit_resc)
destroy(this.rb_p_resciliado)
destroy(this.gb_1)
destroy(this.gb_pagare)
destroy(this.gb_fec_cierre)
destroy(this.ddlb_parque_prom)
destroy(this.st_1)
destroy(this.rb_nuevo)
destroy(this.cbx_resciliados)
destroy(this.gb_parque)
end on

event open;gf_centrar(w_incobrabilidad_contratos)
Connect Using Trans_2;
gb_parque.visible 	= false
//dw_parque.visible = false
//dw_parque.settransobject(sqlca)
//dw_parque.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
//dw_escala.settransobject(sqlca)
//dw_escala.insertrow(0)
dw_escala.getchild('cod_sup',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('','')=0 then
	idw_detalle.insertrow(0)
end if
dw_escala.insertrow(0)
gb_pagare.visible 						= false
cbx_resciliados.visible					= false
rb_lista_pagare.visible				= false
rb_p_resciliado.visible				= false
rb_p_licitados.visible					= false
rb_p_licit_resc.visible					= false
rb_nuevo.visible						= false
rb_reprogramado.visible				= false
rb_promesas.TriggerEvent(Clicked!)
rb_promesas.setfocus()

end event

event close;Disconnect Using Trans_2;
end event

type st_parque_dd from statictext within w_incobrabilidad_contratos
boolean visible = false
integer x = 485
integer y = 128
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

type ddlb_parque_pag from dropdownlistbox within w_incobrabilidad_contratos
boolean visible = false
integer x = 695
integer y = 120
integer width = 539
integer height = 352
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string	ls_parque
long	ll_pos

dw_lista.reset()

ll_pos			= Pos(trim(ddlb_parque_pag.text), "-")
ls_parque	= trim(mid(ddlb_parque_pag.text,1,(ll_pos - 1)))
if isnull(ls_parque) or ls_parque='' then
	messagebox("Advertencia","Debe Seleccionar Parque")
	ddlb_parque_pag.setfocus()
else
	if ls_parque = '1' or ls_parque = '11' or ls_parque = 'O'  or ls_parque = '103' then		
		rb_nuevo.visible						= false
		rb_reprogramado.visible				= false
		gb_pagare.visible 						= true
		rb_lista_pagare.visible				= true
		rb_p_resciliado.visible				= true
		rb_p_licitados.visible					= true
		rb_p_licit_resc.visible					= true
		rb_p_no_licitados.visible				= true
		rb_p_no_licit_resc.visible				= true
		gb_pagare.text 						= 'Tipos de Pagare' 	
		gb_pagare.x 							= 1266 //1376
		gb_pagare.y 							= 56  
		gb_pagare.width						= 1111 //1170
		gb_pagare.height						= 272 //252
//	elseif ls_parque = '103'  or ls_parque = '105' then
//		rb_nuevo.visible						= false
//		rb_reprogramado.visible				= false
//		gb_pagare.visible 						= true
//		rb_lista_pagare.visible				= true
//		rb_p_resciliado.visible				= true
//		rb_p_licitados.visible					= false
//		rb_p_licit_resc.visible					= false
//		rb_p_no_licitados.visible				= true
//		rb_p_no_licit_resc.visible				= true
//		gb_pagare.text 						= 'Tipos de Pagare' 	
//		gb_pagare.x 							= 1266 //1376
//		gb_pagare.y 							= 56  
//		gb_pagare.width						= 745
//		gb_pagare.height						= 272
	elseif ls_parque = '102' or ls_parque = '104' or ls_parque='801' then
//		rb_nuevo.visible						= false
//		rb_reprogramado.visible				= false
		gb_pagare.visible 						= false
		rb_lista_pagare.visible				= false
		rb_p_resciliado.visible				= false
		rb_p_licitados.visible					= false
		rb_p_licit_resc.visible					= false
		rb_p_no_licitados.visible				= false
		rb_p_no_licit_resc.visible				= false
		messagebox("Advertencia","Este Parque No Paneja Pagares")	
	end if
end if	


end event

type rb_p_no_licit_resc from radiobutton within w_incobrabilidad_contratos
boolean visible = false
integer x = 1938
integer y = 224
integer width = 421
integer height = 72
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Licitados Resc."
end type

event clicked;dw_lista.reset()
end event

type rb_p_no_licitados from radiobutton within w_incobrabilidad_contratos
boolean visible = false
integer x = 1938
integer y = 132
integer width = 315
integer height = 72
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Licitados"
end type

event clicked;dw_lista.reset()
end event

type dw_escala from datawindow within w_incobrabilidad_contratos
integer x = 2400
integer y = 108
integer width = 731
integer height = 92
integer taborder = 40
string title = "none"
string dataobject = "dwe_escala_incob"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_lista.reset()
end event

type cb_imprimir from commandbutton within w_incobrabilidad_contratos
integer x = 398
integer y = 1864
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

type cb_2 from commandbutton within w_incobrabilidad_contratos
integer x = 27
integer y = 1864
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

type cb_limpiar from commandbutton within w_incobrabilidad_contratos
integer x = 1659
integer y = 1864
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

event clicked;dw_fech_cierre.reset()
dw_lista.reset()

dw_fech_cierre.insertrow(0)

gb_pagare.visible 						= false
rb_lista_pagare.visible				= false
rb_p_resciliado.visible				= false
rb_p_licitados.visible					= false
rb_p_licit_resc.visible					= false
rb_nuevo.visible						= false
rb_reprogramado.visible				= false
cbx_resciliados.visible					= false


rb_promesas.checked 				= false
rb_pagare.checked 					= false
rb_nuevo.checked						= false
rb_reprogramado.checked			= false
cbx_resciliados.checked				= false
gb_parque.visible 						= false
dw_fech_cierre.visible				= false
gb_fec_cierre.visible 					= false
rb_promesas.setfocus()
ddlb_parque_prom.visible 			= false
st_1.visible								= false
ddlb_parque_prom.visible 			= true
st_1.visible								= true





end event

type gb_4 from groupbox within w_incobrabilidad_contratos
integer x = 32
integer y = 56
integer width = 411
integer height = 272
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

type cb_cerrar from commandbutton within w_incobrabilidad_contratos
integer x = 3296
integer y = 1864
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

type dw_lista from datawindow within w_incobrabilidad_contratos
integer x = 27
integer y = 352
integer width = 3534
integer height = 1480
integer taborder = 60
string title = "none"
string dataobject = "dwe_incobrabilidad_pagares"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within w_incobrabilidad_contratos
integer x = 3387
integer y = 140
integer width = 174
integer height = 164
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

event clicked;string 	ls_contrato,ls_ctas,ls_estado_ini,ls_estado_fin,ls_est_comi,ls_condicion,ls_tipo,ls_usuario,ls_parque,ls_nom_parque,&
			ls_base,ls_mora_desc,ls_porcen_desc
long 		ll_parque,ll_new,ll_tot_reg,ll_num_prom,ll_mora_ini,ll_mora_fin,ll_ctas_mora,ll_monto_mora,ll_pos,ll_escala
double	ll_sum_capital,ll_sum_capital_cp,ll_porcen,ll_prov_incob,ll_tot_cobrar,ll_cobrar_cp,ll_cobrar_lp,ll_pag_monto_mora,&
			ll_pag_capital,ll_pag_capital_cp,ll_pag_tot_cob,ll_prov_cp,ll_prov_lp,ll_tot_prov
date		ld_fech_cierre

setnull(ls_estado_ini); setnull(ls_estado_fin);setnull(ll_sum_capital);setnull(ll_sum_capital_cp);setnull(ll_porcen);
setnull(ll_prov_incob);setnull(ll_tot_cobrar);setnull(ll_cobrar_cp);setnull(ll_cobrar_lp);setnull(ll_pag_monto_mora);

dw_lista.reset()
ls_usuario									= gs_user
ld_fech_cierre= dw_fech_cierre.getitemdate(1,'fec_cierre')
if isnull(ld_fech_cierre) or ld_fech_cierre = date('00/00/0000') then
	messagebox("Advertencia","Debe Seleccionar Fecha de Cierre")
	dw_fech_cierre.setfocus()
else
	ll_escala			= dw_escala.getitemnumber(1,'cod_escala')
	if isnull(ll_escala) or ll_escala = 0 then
		messagebox("Advertencia","Debe Seleccionar Escala")
		dw_escala.setfocus()
	else	
		if rb_promesas.checked = true then   // Promesas
			ls_base = 'O'
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
				DECLARE x1 CURSOR FOR  
				SELECT 	"ESCALA_PORCEN_CONTAB"."CTAS_MORA_INI",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_FIN",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_DESC",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD_DESC"  
				FROM 	"ESCALA_PORCEN_CONTAB"  
				WHERE 	( "ESCALA_PORCEN_CONTAB"."BASE" = :ls_base ) AND  
							( "ESCALA_PORCEN_CONTAB"."COD_ESCALA" = :ll_escala )
				USING	Trans_2;
				open x1;
					DO WHILE Trans_2.sqlcode=0
					fetch x1 into :ll_mora_ini, :ll_mora_fin, :ls_mora_desc, :ll_porcen, :ls_porcen_desc;
						if not isnull(ll_mora_ini) and not isnull(ll_mora_fin) and not isnull(ls_mora_desc) then 
							SELECT	 count("FACTURA_OFERTA"."NUMERO")   //nº promesas
							INTO 		:ll_num_prom  
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
										"FACTURA_OFERTA"."SERIE" <> 'R' AND
										( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR"FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
										"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
										( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
							USING	sqlca;
					
							SELECT	 sum("FACTURA_OFERTA"."MORA")   //nº cuotas mora
							INTO 		:ll_ctas_mora 
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
										"FACTURA_OFERTA"."SERIE" <> 'R' AND
										( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
										"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
										( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
							USING	sqlca;
							
							SELECT	 sum("FACTURA_OFERTA"."MONTO_MORA")   //sum monto mora
							INTO 		:ll_monto_mora  
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
										"FACTURA_OFERTA"."SERIE" <> 'R' AND
										( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
										"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
										( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
							USING	sqlca;
										  
							SELECT 	sum("FACTURA_OFERTA"."CAPITAL")  //sum capital
							INTO		:ll_sum_capital  
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
										"FACTURA_OFERTA"."SERIE" <> 'R' AND
										( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
										"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre  AND
										"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
										( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini  AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
							USING	sqlca;
							
							SELECT 	sum("FACTURA_OFERTA"."CAPITAL_CP")  //sum capital corto plazo
							INTO		:ll_sum_capital_cp
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
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
							ll_new					= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,'incobrabilidad',ll_porcen)
							dw_lista.setitem(ll_new,'promesas',ll_num_prom)
							if ll_prov_incob > 0 then
								dw_lista.setitem(ll_new,'provision_incob',ll_prov_incob)
							else
								dw_lista.setitem(ll_new,'provision_incob',0)
							end if	
							if ll_ctas_mora >= 0 then
								dw_lista.setitem(ll_new,'capital',ll_sum_capital)
							else
								dw_lista.setitem(ll_new,'capital',0)
							end if	
							if ll_sum_capital_cp >= 0 then
								dw_lista.setitem(ll_new,'capital_plazo',ll_sum_capital_cp)
							else	
								dw_lista.setitem(ll_new,'capital_plazo',0)
							end if
							if ll_ctas_mora >= 0 then 
								dw_lista.setitem(ll_new,'cuotas_mora',ll_ctas_mora)
							else
								dw_lista.setitem(ll_new,'cuotas_mora',0)
							end if	
							if ll_monto_mora >= 0 then 
								dw_lista.setitem(ll_new,'monto_mora',ll_monto_mora)
							else
								dw_lista.setitem(ll_new,'monto_mora',0)
							end if	
							if ll_tot_cobrar >= 0 then 
								dw_lista.setitem(ll_new,'total_x_cobrar',ll_tot_cobrar)
							else	
								dw_lista.setitem(ll_new,'total_x_cobrar',0)
							end if
							if cbx_resciliados.checked = false then 
								dw_lista.setitem(ll_new,'monto_p',ll_cobrar_cp)
								dw_lista.setitem(ll_new,'monto_lp',ll_cobrar_lp)
								dw_lista.setitem(ll_new,'provision_p',ll_prov_cp)
								dw_lista.setitem(ll_new,'provision_lp',ll_prov_lp)
							end if	
							dw_lista.setitem(ll_new,'tipo_contrato',ls_tipo)
							dw_lista.setitem(ll_new,'texto_mora',ls_mora_desc)
							dw_lista.setitem(ll_new,'usuario',ls_usuario)
							dw_lista.setitem(ll_new,"fecha",ld_fech_cierre)
						end if
						setnull(ll_mora_ini);setnull(ll_mora_fin);setnull(ls_mora_desc);setnull(ll_porcen);setnull(ls_porcen_desc)
					LOOP
				close x1;
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
				DECLARE x2 CURSOR FOR  
				SELECT 	"ESCALA_PORCEN_CONTAB"."CTAS_MORA_INI",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_FIN",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_DESC",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD_DESC"  
				FROM 	"ESCALA_PORCEN_CONTAB"  
				WHERE 	( "ESCALA_PORCEN_CONTAB"."BASE" = :ls_base ) AND  
							( "ESCALA_PORCEN_CONTAB"."COD_ESCALA" = :ll_escala )
				USING	Trans_2;
				open x2;
					DO WHILE Trans_2.sqlcode=0
					fetch x2 into :ll_mora_ini, :ll_mora_fin, :ls_mora_desc, :ll_porcen, :ls_porcen_desc;
						if not isnull(ll_mora_ini) and not isnull(ll_mora_fin) and not isnull(ls_mora_desc) then 
							SELECT	 count("FACTURA_OFERTA"."NUMERO")   //nº promesas
							INTO 		:ll_num_prom  
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
										"FACTURA_OFERTA"."SERIE" = 'R' AND
										( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR"FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
										"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
										( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
							USING	sqlca;
					
							SELECT	 sum("FACTURA_OFERTA"."MORA")   //nº cuotas mora
							INTO 		:ll_ctas_mora 
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
										"FACTURA_OFERTA"."SERIE" = 'R' AND
										( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
										"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
										( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
							USING	sqlca;
							
							SELECT	 sum("FACTURA_OFERTA"."MONTO_MORA")   //sum monto mora
							INTO 		:ll_monto_mora  
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
										"FACTURA_OFERTA"."SERIE" = 'R' AND
										( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
										"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
										( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
							USING	sqlca;
										  
							SELECT 	sum("FACTURA_OFERTA"."CAPITAL")  //sum capital
							INTO		:ll_sum_capital  
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
										"FACTURA_OFERTA"."SERIE" = 'R' AND
										( "FACTURA_OFERTA"."ESTADO" = :ls_estado_ini OR "FACTURA_OFERTA"."ESTADO" = :ls_estado_fin ) AND
										"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_fech_cierre  AND
										"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque  AND
										( "FACTURA_OFERTA"."MORA" >= :ll_mora_ini  AND "FACTURA_OFERTA"."MORA" <= :ll_mora_fin )   
							USING	sqlca;
							
							SELECT 	sum("FACTURA_OFERTA"."CAPITAL_CP")  //sum capital corto plazo
							INTO		:ll_sum_capital_cp
							FROM 	"FACTURA_OFERTA"  
							WHERE 	"FACTURA_OFERTA"."BASE" = :ls_base AND  
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
							ll_new					= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							dw_lista.setitem(ll_new,'incobrabilidad',ll_porcen)
							dw_lista.setitem(ll_new,'promesas',ll_num_prom)
							if ll_prov_incob > 0 then
								dw_lista.setitem(ll_new,'provision_incob',ll_prov_incob)
							else
								dw_lista.setitem(ll_new,'provision_incob',0)
							end if	
							if ll_ctas_mora >= 0 then
								dw_lista.setitem(ll_new,'capital',ll_sum_capital)
							else
								dw_lista.setitem(ll_new,'capital',0)
							end if	
							if ll_sum_capital_cp >= 0 then
								dw_lista.setitem(ll_new,'capital_plazo',ll_sum_capital_cp)
							else	
								dw_lista.setitem(ll_new,'capital_plazo',0)
							end if
							if ll_ctas_mora >= 0 then 
								dw_lista.setitem(ll_new,'cuotas_mora',ll_ctas_mora)
							else
								dw_lista.setitem(ll_new,'cuotas_mora',0)
							end if	
							if ll_monto_mora >= 0 then 
								dw_lista.setitem(ll_new,'monto_mora',ll_monto_mora)
							else
								dw_lista.setitem(ll_new,'monto_mora',0)
							end if	
							if ll_tot_cobrar >= 0 then 
								dw_lista.setitem(ll_new,'total_x_cobrar',ll_tot_cobrar)
							else	
								dw_lista.setitem(ll_new,'total_x_cobrar',0)
							end if
							if cbx_resciliados.checked = false then 
								dw_lista.setitem(ll_new,'monto_p',ll_cobrar_cp)
								dw_lista.setitem(ll_new,'monto_lp',ll_cobrar_lp)
								dw_lista.setitem(ll_new,'provision_p',ll_prov_cp)
								dw_lista.setitem(ll_new,'provision_lp',ll_prov_lp)
							end if	
							dw_lista.setitem(ll_new,'tipo_contrato',ls_tipo)
							dw_lista.setitem(ll_new,'texto_mora',ls_mora_desc)
							dw_lista.setitem(ll_new,'usuario',ls_usuario)
							dw_lista.setitem(ll_new,"fecha",ld_fech_cierre)
						end if
						setnull(ll_mora_ini);setnull(ll_mora_fin);setnull(ls_mora_desc);setnull(ll_porcen);setnull(ls_porcen_desc)
					LOOP
				close x2;
			else
				messagebox('Advertencia','No ha Selecionado Tipo de Promesa')
				setfocus(rb_nuevo)
			end if			
		elseif rb_pagare.checked = true then
			ls_base = 'P'
			dw_lista.dataobject	 = 'dwe_incobrabilidad_pagares'
			ll_pos			= Pos(trim(ddlb_parque_pag.text), "-")
			ls_parque	= trim(mid(ddlb_parque_pag.text,1,(ll_pos - 1)))
			if isnull(ls_parque) or ls_parque='' then
				messagebox("Advertencia","Debe Seleccionar Parque")
				ddlb_parque_pag.setfocus()
			end if
			SetPointer(HourGlass!)
			if rb_lista_pagare.checked = true or rb_p_licitados.checked = true then
				ls_estado_ini			 = 'N'
				ls_estado_fin			 = 'S'
				if rb_lista_pagare.checked = true then
					ls_tipo				= 'P'
				elseif rb_p_licitados.checked = true	then
					ls_tipo				= 'PL'
				end if
			elseif rb_p_resciliado.checked = true  or rb_p_licit_resc.checked = true then
				ls_estado_ini			 = 'R'
				ls_estado_fin			 = 'R'
				if rb_p_resciliado.checked = true then
					ls_tipo				= 'R'
				elseif rb_p_licit_resc.checked = true	then
					ls_tipo				= 'RL'
				end if
			elseif	rb_p_no_licitados.checked = true then
				ls_tipo					= 'NL'
			elseif	rb_p_no_licit_resc.checked = true then
				ls_tipo					= 'NR'	
			end if		
			if ls_parque = '1' then
				ls_est_comi				= 'P' 
			elseif ls_parque= '11' or ls_parque = '103' then
				ls_est_comi				= 'S' 
			elseif ls_parque = '102' then
				messagebox("Advertencia","Este Parque No Maneja Pagares")
				ls_est_comi				= '' 
			elseif ls_parque = '801' then
				messagebox("Advertencia","Este Parque No Maneja Pagares")
				ls_est_comi				= '' 
			elseif ls_parque = '104' then
				messagebox("Advertencia","Este Parque No Maneja Pagares")
				ls_est_comi				= 'M'
			elseif ls_parque = 'O' then
				ls_est_comi				= 'O'
			end if	
			if rb_lista_pagare.checked = true or rb_p_resciliado.checked = true then	
				DECLARE x3 CURSOR FOR  
				SELECT 	"ESCALA_PORCEN_CONTAB"."CTAS_MORA_INI",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_FIN",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_DESC",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD_DESC"  
				FROM 	"ESCALA_PORCEN_CONTAB"  
				WHERE 	( "ESCALA_PORCEN_CONTAB"."BASE" = :ls_base ) AND  
							( "ESCALA_PORCEN_CONTAB"."COD_ESCALA" = :ll_escala )
				USING	Trans_2;
				open x3;
					DO WHILE Trans_2.sqlcode=0
					fetch x3 into :ll_mora_ini, :ll_mora_fin, :ls_mora_desc, :ll_porcen, :ls_porcen_desc;
						if not isnull(ll_mora_ini) and not isnull(ll_mora_fin) and not isnull(ls_mora_desc) then 	
							SELECT 	sum("FACTURA_PAGARE"."MONTO_MORA")  
							INTO		:ll_pag_monto_mora  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
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
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
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
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
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
							ll_new					= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							
							dw_lista.setitem(ll_new,'incobrabilidad',ll_porcen)
							if ll_prov_incob > 0 then
								dw_lista.setitem(ll_new,'provision_incob',ll_prov_incob)
							else
								dw_lista.setitem(ll_new,'provision_incob',0)
							end if	
							if ll_ctas_mora >= 0 then
								dw_lista.setitem(ll_new,'capital',ll_pag_capital)
							else
								dw_lista.setitem(ll_new,'capital',0)
							end if	
							if ll_pag_capital_cp >= 0 then
								dw_lista.setitem(ll_new,'capital_plazo',ll_pag_capital_cp)
							else	
								dw_lista.setitem(ll_new,'capital_plazo',0)
							end if
							if ll_pag_monto_mora >= 0 then 
								dw_lista.setitem(ll_new,'monto_mora',ll_pag_monto_mora)
							else
								dw_lista.setitem(ll_new,'monto_mora',0)
							end if	
							if ll_tot_cobrar >= 0 then 
								dw_lista.setitem(ll_new,'total_x_cobrar',ll_tot_cobrar)
							else	
								dw_lista.setitem(ll_new,'total_x_cobrar',0)
							end if
						//	if cbx_resciliados.checked = false then 
							dw_lista.setitem(ll_new,'monto_p',ll_cobrar_cp)
							dw_lista.setitem(ll_new,'monto_lp',ll_cobrar_lp)
							dw_lista.setitem(ll_new,'provision_p',ll_prov_cp)
							dw_lista.setitem(ll_new,'provision_lp',ll_prov_lp)
							dw_lista.setitem(ll_new,'tot_provision',ll_tot_prov)
						//	end if	
							dw_lista.setitem(ll_new,'tipo_contrato',ls_tipo)
							dw_lista.setitem(ll_new,'texto_mora',ls_mora_desc)
							dw_lista.setitem(ll_new,"cod_parque",ls_parque)
							dw_lista.setitem(ll_new,"fecha",ld_fech_cierre)
							dw_lista.setitem(ll_new,'usuario',ls_usuario)
						end if
						setnull(ll_mora_ini);setnull(ll_mora_fin);setnull(ls_mora_desc);setnull(ll_porcen);setnull(ls_porcen_desc)
					LOOP
				close x3;
			elseif rb_p_licitados.checked = true or rb_p_licit_resc.checked = true then
				DECLARE x4 CURSOR FOR  
				SELECT 	"ESCALA_PORCEN_CONTAB"."CTAS_MORA_INI",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_FIN",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_DESC",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD_DESC"  
				FROM 	"ESCALA_PORCEN_CONTAB"  
				WHERE 	( "ESCALA_PORCEN_CONTAB"."BASE" = :ls_base ) AND  
							( "ESCALA_PORCEN_CONTAB"."COD_ESCALA" = :ll_escala )
				USING	Trans_2;
				open x4;
					DO WHILE Trans_2.sqlcode=0
					fetch x4 into :ll_mora_ini, :ll_mora_fin, :ls_mora_desc, :ll_porcen, :ls_porcen_desc;
						if not isnull(ll_mora_ini) and not isnull(ll_mora_fin) and not isnull(ls_mora_desc) then 
							SELECT 	sum("FACTURA_PAGARE"."MONTO_MORA")  
							INTO		:ll_pag_monto_mora  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										  "PAGARE"."DUENO" = 'L' 
							USING	sqlca;
							
							SELECT 	sum("FACTURA_PAGARE"."CAPITAL")  
							INTO		:ll_pag_capital  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										  "PAGARE"."DUENO" = 'L' 
							USING	sqlca;
							
							SELECT 	sum("FACTURA_PAGARE"."CAPITAL_CP")
							INTO		:ll_pag_capital_cp  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										( "FACTURA_PAGARE"."ESTADO" = :ls_estado_ini OR "FACTURA_PAGARE"."ESTADO" = :ls_estado_fin) AND  
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										  "PAGARE"."DUENO" = 'L' 
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
							ll_new					= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							
							dw_lista.setitem(ll_new,'incobrabilidad',ll_porcen)
							if ll_prov_incob > 0 then
								dw_lista.setitem(ll_new,'provision_incob',ll_prov_incob)
							else
								dw_lista.setitem(ll_new,'provision_incob',0)
							end if	
							if ll_ctas_mora >= 0 then
								dw_lista.setitem(ll_new,'capital',ll_pag_capital)
							else
								dw_lista.setitem(ll_new,'capital',0)
							end if	
							if ll_pag_capital_cp >= 0 then
								dw_lista.setitem(ll_new,'capital_plazo',ll_pag_capital_cp)
							else	
								dw_lista.setitem(ll_new,'capital_plazo',0)
							end if
							if ll_pag_monto_mora >= 0 then 
								dw_lista.setitem(ll_new,'monto_mora',ll_pag_monto_mora)
							else
								dw_lista.setitem(ll_new,'monto_mora',0)
							end if	
							if ll_tot_cobrar >= 0 then 
								dw_lista.setitem(ll_new,'total_x_cobrar',ll_tot_cobrar)
							else	
								dw_lista.setitem(ll_new,'total_x_cobrar',0)
							end if
						//	if cbx_resciliados.checked = false then 
							dw_lista.setitem(ll_new,'monto_p',ll_cobrar_cp)
							dw_lista.setitem(ll_new,'monto_lp',ll_cobrar_lp)
							dw_lista.setitem(ll_new,'provision_p',ll_prov_cp)
							dw_lista.setitem(ll_new,'provision_lp',ll_prov_lp)
							dw_lista.setitem(ll_new,'tot_provision',ll_tot_prov)
						//	end if	
							dw_lista.setitem(ll_new,'tipo_contrato',ls_tipo)
							dw_lista.setitem(ll_new,'texto_mora',ls_mora_desc)
							dw_lista.setitem(ll_new,"cod_parque",ls_parque)
							dw_lista.setitem(ll_new,"fecha",ld_fech_cierre)
							dw_lista.setitem(ll_new,'usuario',ls_usuario)
						end if
						setnull(ll_mora_ini);setnull(ll_mora_fin);setnull(ls_mora_desc);setnull(ll_porcen);setnull(ls_porcen_desc)
					LOOP
				close x4;
			elseif  rb_p_no_licitados.checked = true then
				DECLARE x5 CURSOR FOR  
				SELECT 	"ESCALA_PORCEN_CONTAB"."CTAS_MORA_INI",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_FIN",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_DESC",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD_DESC"  
				FROM 	"ESCALA_PORCEN_CONTAB"  
				WHERE 	( "ESCALA_PORCEN_CONTAB"."BASE" = :ls_base ) AND  
							( "ESCALA_PORCEN_CONTAB"."COD_ESCALA" = :ll_escala )
				USING	Trans_2;
				open x5;
					DO WHILE Trans_2.sqlcode=0
					fetch x5 into :ll_mora_ini, :ll_mora_fin, :ls_mora_desc, :ll_porcen, :ls_porcen_desc;
						if not isnull(ll_mora_ini) and not isnull(ll_mora_fin) and not isnull(ls_mora_desc) then 
							SELECT 	sum("FACTURA_PAGARE"."MONTO_MORA")  
							INTO		:ll_pag_monto_mora  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										("FACTURA_PAGARE"."ESTADO" = 'N' or "FACTURA_PAGARE"."ESTADO" = 'S' )AND  
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										  "PAGARE"."DUENO" <> 'L' 
							USING	sqlca;
							
							SELECT 	sum("FACTURA_PAGARE"."CAPITAL")  
							INTO		:ll_pag_capital  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										("FACTURA_PAGARE"."ESTADO" = 'N' or "FACTURA_PAGARE"."ESTADO" = 'S' )AND  
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										  "PAGARE"."DUENO" <> 'L' 
							USING	sqlca;
							
							SELECT 	sum("FACTURA_PAGARE"."CAPITAL_CP")
							INTO		:ll_pag_capital_cp  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										("FACTURA_PAGARE"."ESTADO" = 'N' or "FACTURA_PAGARE"."ESTADO" = 'S' )AND  
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										 "PAGARE"."DUENO" <> 'L' 
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
							ll_new					= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							
							dw_lista.setitem(ll_new,'incobrabilidad',ll_porcen)
							if ll_prov_incob > 0 then
								dw_lista.setitem(ll_new,'provision_incob',ll_prov_incob)
							else
								dw_lista.setitem(ll_new,'provision_incob',0)
							end if	
							if ll_ctas_mora >= 0 then
								dw_lista.setitem(ll_new,'capital',ll_pag_capital)
							else
								dw_lista.setitem(ll_new,'capital',0)
							end if	
							if ll_pag_capital_cp >= 0 then
								dw_lista.setitem(ll_new,'capital_plazo',ll_pag_capital_cp)
							else	
								dw_lista.setitem(ll_new,'capital_plazo',0)
							end if
							if ll_pag_monto_mora >= 0 then 
								dw_lista.setitem(ll_new,'monto_mora',ll_pag_monto_mora)
							else
								dw_lista.setitem(ll_new,'monto_mora',0)
							end if	
							if ll_tot_cobrar >= 0 then 
								dw_lista.setitem(ll_new,'total_x_cobrar',ll_tot_cobrar)
							else	
								dw_lista.setitem(ll_new,'total_x_cobrar',0)
							end if
						//	if cbx_resciliados.checked = false then 
							dw_lista.setitem(ll_new,'monto_p',ll_cobrar_cp)
							dw_lista.setitem(ll_new,'monto_lp',ll_cobrar_lp)
							dw_lista.setitem(ll_new,'provision_p',ll_prov_cp)
							dw_lista.setitem(ll_new,'provision_lp',ll_prov_lp)
							dw_lista.setitem(ll_new,'tot_provision',ll_tot_prov)
						//	end if	
							dw_lista.setitem(ll_new,'tipo_contrato',ls_tipo)
							dw_lista.setitem(ll_new,'texto_mora',ls_mora_desc)
							dw_lista.setitem(ll_new,"cod_parque",ls_parque)
							dw_lista.setitem(ll_new,"fecha",ld_fech_cierre)
							dw_lista.setitem(ll_new,'usuario',ls_usuario)
						end if
						setnull(ll_mora_ini);setnull(ll_mora_fin);setnull(ls_mora_desc);setnull(ll_porcen);setnull(ls_porcen_desc)
					LOOP
				close x5;
			elseif  rb_p_no_licit_resc.checked = true then
				DECLARE x6 CURSOR FOR  
				SELECT 	"ESCALA_PORCEN_CONTAB"."CTAS_MORA_INI",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_FIN",   
							"ESCALA_PORCEN_CONTAB"."CTAS_MORA_DESC",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD",   
							"ESCALA_PORCEN_CONTAB"."PORCE_INCOBRABILIDAD_DESC"  
				FROM 	"ESCALA_PORCEN_CONTAB"  
				WHERE 	( "ESCALA_PORCEN_CONTAB"."BASE" = :ls_base ) AND  
							( "ESCALA_PORCEN_CONTAB"."COD_ESCALA" = :ll_escala )
				USING	Trans_2;
				open x6;
					DO WHILE Trans_2.sqlcode=0
					fetch x6 into :ll_mora_ini, :ll_mora_fin, :ls_mora_desc, :ll_porcen, :ls_porcen_desc;
						if not isnull(ll_mora_ini) and not isnull(ll_mora_fin) and not isnull(ls_mora_desc) then 
							SELECT 	sum("FACTURA_PAGARE"."MONTO_MORA")  
							INTO		:ll_pag_monto_mora  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_PAGARE"."ESTADO" = 'R'  AND  
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										  "PAGARE"."DUENO" <> 'L' 
							USING	sqlca;
							
							SELECT 	sum("FACTURA_PAGARE"."CAPITAL")  
							INTO		:ll_pag_capital  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_PAGARE"."ESTADO" = 'R' AND  
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										  "PAGARE"."DUENO" <> 'L' 
							USING	sqlca;
							
							SELECT 	sum("FACTURA_PAGARE"."CAPITAL_CP")
							INTO		:ll_pag_capital_cp  
							FROM		"FACTURA_PAGARE","PAGARE"  
							WHERE 	"FACTURA_PAGARE"."SERIE" = "PAGARE"."SERIE_P" and  
										"FACTURA_PAGARE"."NUMERO" = "PAGARE"."NRO_PAGARE" and  
										"FACTURA_PAGARE"."BASE" = :ls_base AND  
										/*	"FACTURA_PAGARE"."COD_PARQUE" = :ll_parque AND*/ "FACTURA_PAGARE"."ESTADO_COMI" = :ls_est_comi AND
										"FACTURA_PAGARE"."FECHA_CIERRE" = :ld_fech_cierre AND
										"FACTURA_PAGARE"."ESTADO" = 'R' AND 
										( "FACTURA_PAGARE"."MORA" >= :ll_mora_ini AND "FACTURA_PAGARE"."MORA" <= :ll_mora_fin) AND  
										 "PAGARE"."DUENO" <> 'L' 
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
							ll_new					= dw_lista.insertrow(0)
							dw_lista.scrolltorow(ll_new)
							
							dw_lista.setitem(ll_new,'incobrabilidad',ll_porcen)
							if ll_prov_incob > 0 then
								dw_lista.setitem(ll_new,'provision_incob',ll_prov_incob)
							else
								dw_lista.setitem(ll_new,'provision_incob',0)
							end if	
							if ll_ctas_mora >= 0 then
								dw_lista.setitem(ll_new,'capital',ll_pag_capital)
							else
								dw_lista.setitem(ll_new,'capital',0)
							end if	
							if ll_pag_capital_cp >= 0 then
								dw_lista.setitem(ll_new,'capital_plazo',ll_pag_capital_cp)
							else	
								dw_lista.setitem(ll_new,'capital_plazo',0)
							end if
							if ll_pag_monto_mora >= 0 then 
								dw_lista.setitem(ll_new,'monto_mora',ll_pag_monto_mora)
							else
								dw_lista.setitem(ll_new,'monto_mora',0)
							end if	
							if ll_tot_cobrar >= 0 then 
								dw_lista.setitem(ll_new,'total_x_cobrar',ll_tot_cobrar)
							else	
								dw_lista.setitem(ll_new,'total_x_cobrar',0)
							end if
						//	if cbx_resciliados.checked = false then 
							dw_lista.setitem(ll_new,'monto_p',ll_cobrar_cp)
							dw_lista.setitem(ll_new,'monto_lp',ll_cobrar_lp)
							dw_lista.setitem(ll_new,'provision_p',ll_prov_cp)
							dw_lista.setitem(ll_new,'provision_lp',ll_prov_lp)
							dw_lista.setitem(ll_new,'tot_provision',ll_tot_prov)
						//	end if	
							dw_lista.setitem(ll_new,'tipo_contrato',ls_tipo)
							dw_lista.setitem(ll_new,'texto_mora',ls_mora_desc)
							dw_lista.setitem(ll_new,"cod_parque",ls_parque)
							dw_lista.setitem(ll_new,"fecha",ld_fech_cierre)
							dw_lista.setitem(ll_new,'usuario',ls_usuario)
						end if
						setnull(ll_mora_ini);setnull(ll_mora_fin);setnull(ls_mora_desc);setnull(ll_porcen);setnull(ls_porcen_desc)
					LOOP
				close x6;
			end if	
			SetPointer(Arrow!)	
		end if	
	end if
end if
end event

type rb_pagare from radiobutton within w_incobrabilidad_contratos
integer x = 64
integer y = 224
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

event clicked;string ls_string,ls_nom_parque
long	ll_cod_parque

gb_pagare.visible						= false
rb_nuevo.visible 						= false
rb_reprogramado.visible				= false
cbx_resciliados.visible					= false

gb_1.x									= 2391
dw_escala.x								= 2400

dw_fech_cierre.visible				= false
dw_fech_cierre.visible				= true
ddlb_parque_prom.visible 			= false

st_1.visible								= false
gb_fec_cierre.visible					= false
gb_pagare.visible						= false
gb_parque.visible 						= true
rb_nuevo.checked						= false
rb_reprogramado.checked			= false
cbx_resciliados.checked				= false
ddlb_parque_pag.visible 				= true
st_parque_dd.visible					= true
ddlb_parque_pag.reset()
gb_pagare.text 						= 'Tipos de Pagare' 
dw_fech_cierre.visible				= true
dw_fech_cierre.x						= 471 //517
dw_fech_cierre.y						= 224
dw_lista.reset()
dw_fech_cierre.reset()
//dw_parque.settransobject(sqlca)
//dw_parque.insertrow(0)
if ddlb_parque_pag.visible = true then
	DECLARE x2 CURSOR FOR  
	SELECT 		"COD_PARQ"."CODIGO",   
					"COD_PARQ"."NOMBRE"  
	FROM 		"COD_PARQ"  
	WHERE 		"COD_PARQ"."GRUPO" = 1
	ORDER BY	"COD_PARQ"."CODIGO" ASC  
	USING		sqlca;
	Open x2;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0 
			Fetch x2 into :ll_cod_parque, :ls_nom_parque;
			if  not isnull(ll_cod_parque) and ll_cod_parque > 0 then
				ls_string	= string(ll_cod_parque)+' - '+UPPER(ls_nom_parque)
				ddlb_parque_pag.additem(ls_string)
			end if
			Setnull(ll_cod_parque)
		LOOP
	end if
	ls_string					= 'O - OTROS PARQUES'
	ddlb_parque_pag.additem(ls_string)
	Close x2;
end if

dw_fech_cierre.settransobject(sqlca)
dw_fech_cierre.insertrow(0)
dw_escala.reset()
dw_escala.insertrow(0)
if rb_promesas.checked = true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve('O','w_incobrabilidad_contratos')=0 then
	end if
elseif rb_pagare.checked= true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve('P','w_incobrabilidad_contratos')=0 then
	end if
end if
//
//rb_lista_pagare.visible		= true
//rb_p_resciliado.visible		= true
//rb_p_licitados.visible			= true
//rb_p_licit_resc.visible			= true
//rb_p_no_licitados.visible		= true
//rb_p_no_licit_resc.visible		= true
//ddlb_parque_pag.visible 		= true
//st_parque_dd.visible			= true

end event

type rb_promesas from radiobutton within w_incobrabilidad_contratos
integer x = 64
integer y = 132
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
boolean checked = true
end type

event clicked;string ls_nom_parque,ls_string
long	ll_cod_parque
	
gb_parque.visible				= false
rb_lista_pagare.visible		= false
rb_p_resciliado.visible		= false
rb_p_licitados.visible			= false
rb_p_licit_resc.visible			= false
rb_p_no_licitados.visible		= false
rb_p_no_licit_resc.visible		= false
ddlb_parque_pag.visible 		= false
st_parque_dd.visible			= false

gb_1.x							= 2085
dw_escala.x						= 2094

gb_fec_cierre.visible			= true
gb_fec_cierre.x					= 1266//1376
gb_fec_cierre.y					= 56
gb_pagare.visible				= true
gb_pagare.x						= 453 //498
gb_pagare.y						= 56
gb_pagare.width				= 800
gb_pagare.height				= 248
rb_nuevo.visible 				= true
rb_nuevo.checked				= true
rb_reprogramado.visible		= true
cbx_resciliados.visible			= true
dw_fech_cierre.visible		= true
dw_fech_cierre.x				= 1294 //1408
dw_fech_cierre.y				= 108 // 208
gb_pagare.text 				= 'Tipos de Contratos'
dw_fech_cierre.reset()
dw_fech_cierre.settransobject(sqlca)
dw_fech_cierre.insertrow(0)
dw_lista.reset()
ddlb_parque_pag.visible 	= false
ddlb_parque_prom.visible 	= true
ddlb_parque_prom.reset()
st_1.visible						= true
dw_escala.reset()
dw_escala.insertrow(0)
if rb_promesas.checked = true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve('O','w_incobrabilidad_contratos')=0 then
	end if
elseif rb_pagare.checked= true then
	dw_escala.getchild('cod_escala',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve('P','w_incobrabilidad_contratos')=0 then
	end if
end if

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
end event

type dw_fech_cierre from datawindow within w_incobrabilidad_contratos
integer x = 471
integer y = 224
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

type rb_reprogramado from radiobutton within w_incobrabilidad_contratos
integer x = 489
integer y = 216
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

type rb_lista_pagare from radiobutton within w_incobrabilidad_contratos
integer x = 1285
integer y = 132
integer width = 265
integer height = 72
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagares"
boolean checked = true
end type

event clicked;dw_lista.reset()
end event

type rb_p_licitados from radiobutton within w_incobrabilidad_contratos
integer x = 1586
integer y = 132
integer width = 352
integer height = 72
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Licitados"
end type

event clicked;dw_lista.reset()
end event

type rb_p_licit_resc from radiobutton within w_incobrabilidad_contratos
integer x = 1586
integer y = 224
integer width = 357
integer height = 72
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Licitados Res."
end type

event clicked;dw_lista.reset()
end event

type rb_p_resciliado from radiobutton within w_incobrabilidad_contratos
integer x = 1285
integer y = 224
integer width = 306
integer height = 72
integer textsize = -7
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

type gb_1 from groupbox within w_incobrabilidad_contratos
integer x = 2391
integer y = 56
integer width = 759
integer height = 160
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Escala"
end type

type gb_pagare from groupbox within w_incobrabilidad_contratos
integer x = 1266
integer y = 56
integer width = 1111
integer height = 272
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

type gb_fec_cierre from groupbox within w_incobrabilidad_contratos
integer x = 1266
integer y = 56
integer width = 809
integer height = 252
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

type ddlb_parque_prom from dropdownlistbox within w_incobrabilidad_contratos
integer x = 1522
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

type st_1 from statictext within w_incobrabilidad_contratos
integer x = 1303
integer y = 208
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

type rb_nuevo from radiobutton within w_incobrabilidad_contratos
integer x = 489
integer y = 120
integer width = 256
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nuevo"
boolean checked = true
end type

event clicked;dw_lista.reset()
end event

type cbx_resciliados from checkbox within w_incobrabilidad_contratos
integer x = 905
integer y = 120
integer width = 325
integer height = 72
integer taborder = 30
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

type gb_parque from groupbox within w_incobrabilidad_contratos
integer x = 453
integer y = 56
integer width = 800
integer height = 272
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

