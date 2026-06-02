forward
global type w_existencia_sepulturas from window
end type
type cb_exportar from commandbutton within w_existencia_sepulturas
end type
type cb_1 from commandbutton within w_existencia_sepulturas
end type
type dw_cierres from datawindow within w_existencia_sepulturas
end type
type pb_2 from picturebutton within w_existencia_sepulturas
end type
type em_hasta from editmask within w_existencia_sepulturas
end type
type st_3 from statictext within w_existencia_sepulturas
end type
type pb_1 from picturebutton within w_existencia_sepulturas
end type
type em_desde from editmask within w_existencia_sepulturas
end type
type st_2 from statictext within w_existencia_sepulturas
end type
type pb_aceptar from picturebutton within w_existencia_sepulturas
end type
type dw_parque from datawindow within w_existencia_sepulturas
end type
type cb_cerrar from commandbutton within w_existencia_sepulturas
end type
type dw_lista from datawindow within w_existencia_sepulturas
end type
end forward

global type w_existencia_sepulturas from window
integer width = 3570
integer height = 1900
boolean titlebar = true
string title = "Existencia Sepulturas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_exportar cb_exportar
cb_1 cb_1
dw_cierres dw_cierres
pb_2 pb_2
em_hasta em_hasta
st_3 st_3
pb_1 pb_1
em_desde em_desde
st_2 st_2
pb_aceptar pb_aceptar
dw_parque dw_parque
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_existencia_sepulturas w_existencia_sepulturas

on w_existencia_sepulturas.create
this.cb_exportar=create cb_exportar
this.cb_1=create cb_1
this.dw_cierres=create dw_cierres
this.pb_2=create pb_2
this.em_hasta=create em_hasta
this.st_3=create st_3
this.pb_1=create pb_1
this.em_desde=create em_desde
this.st_2=create st_2
this.pb_aceptar=create pb_aceptar
this.dw_parque=create dw_parque
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_exportar,&
this.cb_1,&
this.dw_cierres,&
this.pb_2,&
this.em_hasta,&
this.st_3,&
this.pb_1,&
this.em_desde,&
this.st_2,&
this.pb_aceptar,&
this.dw_parque,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_existencia_sepulturas.destroy
destroy(this.cb_exportar)
destroy(this.cb_1)
destroy(this.dw_cierres)
destroy(this.pb_2)
destroy(this.em_hasta)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.em_desde)
destroy(this.st_2)
destroy(this.pb_aceptar)
destroy(this.dw_parque)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;string	ls_fech_ini,ls_fech_fin
long	ll_mes,ll_anno,ll_mes_1,ll_mes_2

gf_centrar(w_existencia_sepulturas)

dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_lista.settransobject(sqlca)
dw_cierres.settransobject(sqlca)
dw_cierres.insertrow(0)
em_desde.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
em_hasta.text 				= string(gdt_fec_sistema,'dd/mm/yyyy')
end event

type cb_exportar from commandbutton within w_existencia_sepulturas
integer x = 1673
integer y = 1664
integer width = 279
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_1 from commandbutton within w_existencia_sepulturas
integer x = 37
integer y = 1664
integer width = 270
integer height = 100
integer taborder = 60
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

type dw_cierres from datawindow within w_existencia_sepulturas
boolean visible = false
integer x = 3689
integer y = 800
integer width = 686
integer height = 400
string title = "none"
string dataobject = "dw_listado_cierres_costo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_2 from picturebutton within w_existencia_sepulturas
integer x = 1189
integer y = 44
integer width = 96
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ddlb.bmp"
string disabledname = "ddlb.bmp"
alignment htextalign = left!
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_hasta.text)=-1 then 
 em_hasta.text=string(today(),gs_formato_fecha)
 em_hasta.setfocus()
 return
end if 
if em_desde.text<>'00/00/0000' then
 ls_fecha = em_hasta.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(em_hasta.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  em_hasta.setfocus()
  return
 else 
  em_hasta.text = Message.StringParm
 end if 
END IF
end event

type em_hasta from editmask within w_existencia_sepulturas
integer x = 864
integer y = 44
integer width = 320
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_3 from statictext within w_existencia_sepulturas
integer x = 686
integer y = 60
integer width = 165
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_existencia_sepulturas
integer x = 571
integer y = 44
integer width = 96
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ddlb.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_fecha,fech
long 		ll_mes,ll_anno,ll_mes_2,uf
double	ll_mes_1
string		ls_fech_ini,ls_fech_fin

if f_valida_fecha(em_desde.text)=-1 then 
	 em_desde.text=string(today(),gs_formato_fecha)
	 em_desde.setfocus()
	 return
end if 
if em_desde.text<>'00/00/0000' then
	 ls_fecha = em_desde.text
else
	 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)
dw_lista.reset()
IF Message.StringParm <> ls_fecha THEN
	 IF DATE(Message.StringParm)>DATE(em_hasta.TEXT) THEN
		 MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		 em_desde.setfocus()
		 return
	 else 
	  	em_desde.text = Message.StringParm
		ll_mes					= month(date(em_desde.text))
		ll_anno					= year(date(em_desde.text))
		
		if ll_mes = 1 or ll_mes = 3 or ll_mes = 5 or ll_mes = 7 or ll_mes = 8 or ll_mes = 10 or ll_mes = 12 then
			ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		//	ls_fech_fin				= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
		elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
			ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		//	ls_fech_fin				= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
		elseif ll_mes = 2 then
			ll_mes_1			= ll_anno/4
			ll_mes_2			= INT(ll_anno/4)		
			if ll_mes_1 = ll_mes_2 then 
				ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		//		ls_fech_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			else 
				ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		//		ls_fech_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			end if
		end if	
		em_desde.text			= ls_fech_ini
	//	em_hasta.text			= ls_fech_fin
	 end if 
END IF
end event

type em_desde from editmask within w_existencia_sepulturas
integer x = 247
integer y = 44
integer width = 320
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;long 		ll_mes,ll_anno,ll_mes_2
double	ll_mes_1
string		ls_fech_ini,ls_fech_fin

ll_mes					= month(date(em_desde.text))
ll_anno					= year(date(em_desde.text))
dw_lista.reset()
if ll_mes = 1 or ll_mes = 3 or ll_mes = 5 or ll_mes = 7 or ll_mes = 8 or ll_mes = 10 or ll_mes = 12 then
	ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//	ls_fech_fin				= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
	ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//	ls_fech_fin				= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
elseif ll_mes = 2 then
	ll_mes_1			= ll_anno/4
	ll_mes_2			= INT(ll_anno/4)		
	if ll_mes_1 = ll_mes_2 then 
		ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//		ls_fech_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	else 
		ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//		ls_fech_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	end if
end if	

em_desde.text			= ls_fech_ini
//em_hasta.text			= ls_fech_fin

end event

type st_2 from statictext within w_existencia_sepulturas
integer x = 59
integer y = 60
integer width = 174
integer height = 84
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
boolean focusrectangle = false
end type

type pb_aceptar from picturebutton within w_existencia_sepulturas
integer x = 2107
integer y = 24
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long		ll_parque,ll_saldo,ll_saldo_sepul,ll_indi,ll_tot_reg,ll_costo_prom,ll_cant_resc,ll_cant_vta,ll_mes
double	ldb_pmp
date		ld_fech_ini,ld_fech_fin,ld_cierre_fin

ll_parque							= dw_parque.getitemnumber(1,'parque')
gl_cod_parque_cta			= ll_parque
ld_fech_ini 						= date(em_desde.text)
ld_fech_fin 						= date(em_hasta.text)
if isnull(ll_parque) or ll_parque = 0 then
	messagebox('Aviso','Debe Ingresar Parque')
	dw_parque.setfocus()
	return
end if
if isnull(ld_fech_ini) or ld_fech_ini = date('00/00/0000') or ld_fech_fin = date('01/01/1900') then
	messagebox('Aviso','Debe Ingresar Fecha Inicio')
	em_hasta.setfocus()
	return
end if	
if isnull(ld_fech_fin) or ld_fech_fin = date('00/00/0000') or ld_fech_fin = date('01/01/1900') then
	messagebox('Aviso','Debe Ingresar Fecha Fin')
	em_hasta.setfocus()
	return
end if
ll_tot_reg 						= dw_cierres.retrieve(ld_fech_ini,ld_fech_fin,ll_parque)
if ll_tot_reg > 0 then
	dw_lista.retrieve(ld_fech_ini,ld_fech_fin,ll_parque)
	for ll_indi= 1 to ll_tot_reg
		ld_cierre_fin				= date(dw_cierres.getitemdatetime(ll_indi,'hasta'))
		ll_mes    					= Month(ld_cierre_fin)
		SELECT	sum(ROUND(( CASE	WHEN "OFERTA_V"."UNIDAD_COSTO" = 'PORCE' THEN  ("OFERTA_V"."COSTO_VENTA" * "FACTURA_OFERTA"."CAPITAL_INICIAL") / 100 
						WHEN "OFERTA_V"."UNIDAD_COSTO" = 'UF' THEN  ("OFERTA_V"."COSTO_VENTA" * "FACTURA_OFERTA"."VALOR_UF")
					ELSE  "OFERTA_V"."COSTO_VENTA" END),0)) as costo_prom,
						COUNT("FACTURA_OFERTA"."SERIE") as cant_resc	
		INTO  	:ll_costo_prom ,:ll_cant_resc              
		FROM	 	"CADENA",	"FACTURA_OFERTA","OFERTA_V"
		WHERE	"CADENA"."SERIE" = "FACTURA_OFERTA"."SERIE" and
					"CADENA"."NUMERO" = "FACTURA_OFERTA"."NUMERO" and
					"CADENA"."CODIGO" = "FACTURA_OFERTA"."BASE" and
					"FACTURA_OFERTA"."SERIE" = "OFERTA_V"."SERIE" and
					"FACTURA_OFERTA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and
					"FACTURA_OFERTA"."BASE" = 'O' AND
					"FACTURA_OFERTA"."ESTADO" = 'R' AND
					"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_cierre_fin and
					"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque ;
		
		SELECT 	COUNT("FACTURA_OFERTA"."SERIE")
   	  	INTO  	:ll_cant_vta
     	FROM	 	"CADENA",	"FACTURA_OFERTA","OFERTA_V"
		WHERE	"CADENA"."SERIE" = "FACTURA_OFERTA"."SERIE" and
					"CADENA"."NUMERO" = "FACTURA_OFERTA"."NUMERO" and
					"CADENA"."CODIGO" = "FACTURA_OFERTA"."BASE" and
					"FACTURA_OFERTA"."SERIE" = "OFERTA_V"."SERIE" and
					"FACTURA_OFERTA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and
					"FACTURA_OFERTA"."BASE" = 'O' AND
					"FACTURA_OFERTA"."ESTADO" = 'N' AND
					"FACTURA_OFERTA"."FECHA_CIERRE" = :ld_cierre_fin and
					"FACTURA_OFERTA"."COD_PARQUE" = :ll_parque ;
		
		ll_cant_vta				= (ll_cant_vta *-1)
		
		dw_lista.setitem(ll_indi,'mes',ll_mes)
		dw_lista.setitem(ll_indi,'cant_vta',ll_cant_vta)
		dw_lista.setitem(ll_indi,'cant_res',ll_cant_resc)
		dw_lista.setitem(ll_indi,'valor_resc',ll_costo_prom)
		
	next
else
	messagebox('Advertencia','No Registra Dato en Rango Fecha Indicada')
	return
end if
end event

type dw_parque from datawindow within w_existencia_sepulturas
integer x = 1317
integer y = 52
integer width = 773
integer height = 88
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_parque_costos_ventas"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_lista.reset()

end event

type cb_cerrar from commandbutton within w_existencia_sepulturas
integer x = 3269
integer y = 1660
integer width = 251
integer height = 112
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_existencia_sepulturas)
end event

type dw_lista from datawindow within w_existencia_sepulturas
integer x = 37
integer y = 176
integer width = 3483
integer height = 1448
integer taborder = 50
string title = "none"
string dataobject = "dw_costo_venta"
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

