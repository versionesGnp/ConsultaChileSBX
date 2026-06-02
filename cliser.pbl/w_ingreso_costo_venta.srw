forward
global type w_ingreso_costo_venta from window
end type
type cb_historico from commandbutton within w_ingreso_costo_venta
end type
type cb_consultar from commandbutton within w_ingreso_costo_venta
end type
type dw_lista from datawindow within w_ingreso_costo_venta
end type
type cb_limpiar from commandbutton within w_ingreso_costo_venta
end type
type cb_cerrar from commandbutton within w_ingreso_costo_venta
end type
type cb_grabar from commandbutton within w_ingreso_costo_venta
end type
type pb_2 from picturebutton within w_ingreso_costo_venta
end type
type pb_1 from picturebutton within w_ingreso_costo_venta
end type
type st_5 from statictext within w_ingreso_costo_venta
end type
type ddlb_moneda from dropdownlistbox within w_ingreso_costo_venta
end type
type st_4 from statictext within w_ingreso_costo_venta
end type
type em_monto from editmask within w_ingreso_costo_venta
end type
type st_3 from statictext within w_ingreso_costo_venta
end type
type st_2 from statictext within w_ingreso_costo_venta
end type
type em_hasta from editmask within w_ingreso_costo_venta
end type
type em_desde from editmask within w_ingreso_costo_venta
end type
type st_1 from statictext within w_ingreso_costo_venta
end type
type ddlb_parque from dropdownlistbox within w_ingreso_costo_venta
end type
type gb_1 from groupbox within w_ingreso_costo_venta
end type
type gb_2 from groupbox within w_ingreso_costo_venta
end type
end forward

global type w_ingreso_costo_venta from window
integer width = 1966
integer height = 1744
boolean titlebar = true
string title = "Ingreso Costos de Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_historico cb_historico
cb_consultar cb_consultar
dw_lista dw_lista
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
cb_grabar cb_grabar
pb_2 pb_2
pb_1 pb_1
st_5 st_5
ddlb_moneda ddlb_moneda
st_4 st_4
em_monto em_monto
st_3 st_3
st_2 st_2
em_hasta em_hasta
em_desde em_desde
st_1 st_1
ddlb_parque ddlb_parque
gb_1 gb_1
gb_2 gb_2
end type
global w_ingreso_costo_venta w_ingreso_costo_venta

on w_ingreso_costo_venta.create
this.cb_historico=create cb_historico
this.cb_consultar=create cb_consultar
this.dw_lista=create dw_lista
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_5=create st_5
this.ddlb_moneda=create ddlb_moneda
this.st_4=create st_4
this.em_monto=create em_monto
this.st_3=create st_3
this.st_2=create st_2
this.em_hasta=create em_hasta
this.em_desde=create em_desde
this.st_1=create st_1
this.ddlb_parque=create ddlb_parque
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_historico,&
this.cb_consultar,&
this.dw_lista,&
this.cb_limpiar,&
this.cb_cerrar,&
this.cb_grabar,&
this.pb_2,&
this.pb_1,&
this.st_5,&
this.ddlb_moneda,&
this.st_4,&
this.em_monto,&
this.st_3,&
this.st_2,&
this.em_hasta,&
this.em_desde,&
this.st_1,&
this.ddlb_parque,&
this.gb_1,&
this.gb_2}
end on

on w_ingreso_costo_venta.destroy
destroy(this.cb_historico)
destroy(this.cb_consultar)
destroy(this.dw_lista)
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_5)
destroy(this.ddlb_moneda)
destroy(this.st_4)
destroy(this.em_monto)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_hasta)
destroy(this.em_desde)
destroy(this.st_1)
destroy(this.ddlb_parque)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;long		ll_mes,ll_anno,ll_cod_parque
double	ll_mes_1,ll_mes_2
string		ls_fech_ini,ls_fech_fin,ls_nom_parque,ls_string

gf_centrar(w_ingreso_costo_venta)

ll_mes					= month(date(gdt_fec_sistema))
ll_anno					= year(date(gdt_fec_sistema))

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
			ddlb_parque.additem(ls_string)
		end if
		Setnull(ll_cod_parque)
	LOOP
end if
close x1;	
if gs_conexion	= "Parque El Prado" then	
	ddlb_parque.text		= string('1 - EL PRADO')
elseif gs_conexion	= "Parque La Foresta" then
	ddlb_parque.text		= string('11 - LA FORESTA')
elseif gs_conexion	= "Parque Concepción" then
	ddlb_parque.text		= string('801 - CONCEPCION')
end if	
if ll_mes = 1 or ll_mes = 3 or ll_mes = 5 or ll_mes = 7 or ll_mes = 8 or ll_mes = 10 or ll_mes = 12 then
	ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	ls_fech_fin				= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
	ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	ls_fech_fin				= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
elseif ll_mes = 2 then
	ll_mes_1			= ll_anno/4
	ll_mes_2			= INT(ll_anno/4)		
	if ll_mes_1 = ll_mes_2 then 
		ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		ls_fech_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	else 
		ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		ls_fech_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	end if
end if	
em_desde.text			= ls_fech_ini
em_hasta.text			= ls_fech_fin

dw_lista.settransobject(sqlca)	

end event

type cb_historico from commandbutton within w_ingreso_costo_venta
integer x = 384
integer y = 1508
integer width = 288
integer height = 104
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Historico"
end type

event clicked;if isvalid(w_listado_costos_ventas)then close(w_listado_costos_ventas)
open(w_listado_costos_ventas)
end event

type cb_consultar from commandbutton within w_ingreso_costo_venta
integer x = 1623
integer y = 88
integer width = 265
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Consultar"
end type

event clicked;long 	ll_pos,ll_parque,ll_mes,ll_anno,ll_anno_1,ll_anno_2
string	ls_parque,ls_fech_ini,ls_fech_fin
date	ld_fech_ini,ld_fech_fin

ls_parque                        						= ddlb_parque.text
ll_pos                           							= POS (ls_parque,'-')
if ll_pos > 0 then ll_pos = ll_pos - 1
	ll_parque                      						=long(trim(mid(ls_parque,1,ll_pos)))
if ll_parque > 0 and not isnull(ll_parque)  then
	if trim(em_desde.text)='00/00/0000' or isnull(em_desde.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_desde.setfocus()
	else
		if trim(em_hasta.text)='00/00/0000' or isnull(em_hasta.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_hasta.setfocus()
		else
//			ll_mes					= month(date(em_desde.text))
//			ll_anno					= year(date(em_desde.text))
//			if ll_mes = 1 or ll_mes = 3 or ll_mes = 5 or ll_mes = 7 or ll_mes = 8 or ll_mes = 10 or ll_mes = 12 then
//				ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//				ls_fech_fin				= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
//			elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
//				ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//				ls_fech_fin				= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
//			elseif ll_mes = 2 then
//				ll_anno_1			= ll_anno/4
//				ll_anno_2			= INT(ll_anno/4)		
//				if ll_anno_1 = ll_anno_2 then 
//					ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//					ls_fech_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//				else 
//					ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//					ls_fech_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//				end if
//			end if	
//			ld_fech_ini			= date(ls_fech_ini)
//			ld_fech_fin			= date(ls_fech_fin)
			ld_fech_ini			= date(em_desde.text)
			ld_fech_fin			= date(em_hasta.text)
			dw_lista.retrieve(ll_parque,ld_fech_ini,ld_fech_fin)
			cb_grabar.enabled	= true
		end if	
	end if	
else
	messagebox('Advertencia','Falta Ingresar Parque')		
end if




end event

type dw_lista from datawindow within w_ingreso_costo_venta
integer x = 27
integer y = 560
integer width = 1888
integer height = 904
integer taborder = 60
string title = "none"
string dataobject = "dw_listado_costo_ventas"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_limpiar from commandbutton within w_ingreso_costo_venta
integer x = 832
integer y = 1508
integer width = 274
integer height = 104
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;long 		ll_mes,ll_anno
double	ll_mes_1,ll_mes_2
string		ls_fech_ini,ls_fech_fin

em_monto.text 		= ''
ddlb_parque.text		= ''
ddlb_moneda.text 		= ''
dw_lista.reset()
cb_grabar.enabled		= false

ll_mes					= month(date(gdt_fec_sistema))
ll_anno					= year(date(gdt_fec_sistema))

if ll_mes = 1 or ll_mes = 3 or ll_mes = 5 or ll_mes = 7 or ll_mes = 8 or ll_mes = 10 or ll_mes = 12 then
	ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	ls_fech_fin				= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
	ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	ls_fech_fin				= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
elseif ll_mes = 2 then
	ll_mes_1			= ll_anno/4
	ll_mes_2			= INT(ll_anno/4)		
	if ll_mes_1 = ll_mes_2 then 
		ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		ls_fech_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	else 
		ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		ls_fech_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	end if
end if	
em_desde.text			= ls_fech_ini
em_hasta.text			= ls_fech_fin

if gs_conexion				= "Parque El Prado" then
	ddlb_parque.text		= string('1 - EL PRADO')
elseif gs_conexion			= "Parque La Foresta" then
	ddlb_parque.text		= string('11 - LA FORESTA')
elseif gs_conexion			= "Parque Concepción" then
	ddlb_parque.text		= string('801 - CONCEPCION')
end if	
end event

type cb_cerrar from commandbutton within w_ingreso_costo_venta
integer x = 1641
integer y = 1508
integer width = 274
integer height = 104
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_ingreso_costo_venta)
end event

type cb_grabar from commandbutton within w_ingreso_costo_venta
integer x = 27
integer y = 1508
integer width = 274
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Grabar"
end type

event clicked;string		ls_parque,ls_moneda,ls_tipo
long		ll_pos,ll_pos2,ll_moneda,ll_parque,ll_count,ll_res
date		ld_fech_ini, ld_fech_fin
double	ldb_monto

ll_pos				= Pos(trim(ddlb_parque.text), "-")
ls_parque		= trim(mid(ddlb_parque.text,1,(ll_pos - 1)))
ldb_monto		= double(em_monto.text)
//ll_pos2			= Pos(trim(ddlb_moneda.text), "-")
//ls_moneda		= trim(mid(ddlb_moneda.text,1,(ll_pos2 - 1)))
if trim(em_desde.text)='00/00/0000' or isnull(em_desde.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_desde.setfocus()
else
	if trim(em_hasta.text)='00/00/0000' or isnull(em_hasta.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_hasta.setfocus()
	else
		ld_fech_ini		= date(em_desde.text)	
		ld_fech_fin		= date(em_hasta.text)		
		SELECT 	count("COSTO_VENTA"."COD_PARQUE")  
		INTO 		:ll_count  
		FROM 	"COSTO_VENTA"  
		WHERE 	"COSTO_VENTA"."COD_PARQUE" = :ll_parque AND  
					"COSTO_VENTA"."DESDE" = :ld_fech_ini AND  
					"COSTO_VENTA"."HASTA" = :ld_fech_fin
		USING	sqlca;
		if sqlca.sqlcode = 0 then
			if ll_count = 0 then
			//	ll_moneda		= long(ls_moneda)
				ll_parque			= long(ls_parque)
				ls_tipo			= mid(ddlb_moneda.text,1,2)
				if isnull(ldb_monto) or ldb_monto = 0  then
					messagebox('Advertencia','Debe Ingresar Monto')
				else
					if isnull(ls_tipo) or ls_tipo = '' then
						messagebox('Advertencia','Tipo de Moneda No existe')
					else
						if not isnull(ll_parque) OR ll_parque <> 0 then
							ll_res 		= messagebox('Actulizar','Seguro de Grabar Costo de Venta por: '+string(ldb_monto,'###,###,###,###.##')+' en moneda: '+ls_tipo+'.',Question!,YesNo!,2)
							if ll_res = 1 then
								INSERT INTO "COSTO_VENTA"  
												 ( "COD_PARQUE", "DESDE", "HASTA", 	"MONTO",	"TIPO" )  
								VALUES 		 ( :ll_parque,  	:ld_fech_ini, :ld_fech_fin,:ldb_monto, :ls_tipo )  
								USING		sqlca;
								if sqlca.sqlcode = 0 then
									commit;
									messagebox('Atencion','Grabacion Exitosa')
								//	close(w_ingreso_costo_venta)
									dw_lista.reset()
									cb_consultar.TriggerEvent(Clicked!)
								else
									messagebox('Advertencia','No se ha Grabado, Parque y Fecha ya Ingresados')
									rollback;
								end if
							end if
						else
							messagebox('Advertencia','Debe Ingresar Parque')
							ddlb_parque.setfocus()
						end if	
					end if
				end if	
			else
				messagebox('Advertencia','Parque y Fecha ya Ingresados')
			end if	
		else
			messagebox('Advertencia','Parque y Fecha ya Ingresados')
		end if	
	end if
end if	
end event

type pb_2 from picturebutton within w_ingreso_costo_venta
integer x = 1458
integer y = 184
integer width = 96
integer height = 92
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
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

type pb_1 from picturebutton within w_ingreso_costo_venta
integer x = 1458
integer y = 88
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
//	 IF DATE(Message.StringParm)>DATE(em_hasta.TEXT) THEN
//		 MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
//		 em_desde.setfocus()
//		 return
//	 else 
	  	em_desde.text = Message.StringParm
		ll_mes					= month(date(em_desde.text))
		ll_anno					= year(date(em_desde.text))
		
		if ll_mes = 1 or ll_mes = 3 or ll_mes = 5 or ll_mes = 7 or ll_mes = 8 or ll_mes = 10 or ll_mes = 12 then
			ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			ls_fech_fin				= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
		elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
			ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			ls_fech_fin				= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
		elseif ll_mes = 2 then
			ll_mes_1			= ll_anno/4
			ll_mes_2			= INT(ll_anno/4)		
			if ll_mes_1 = ll_mes_2 then 
				ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
				ls_fech_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			else 
				ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
				ls_fech_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
			end if
		end if	
		em_desde.text			= ls_fech_ini
		em_hasta.text			= ls_fech_fin
//	 end if 
END IF
end event

type st_5 from statictext within w_ingreso_costo_venta
integer x = 901
integer y = 400
integer width = 219
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Moneda"
boolean focusrectangle = false
end type

type ddlb_moneda from dropdownlistbox within w_ingreso_costo_venta
integer x = 1134
integer y = 396
integer width = 480
integer height = 344
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
string item[] = {"PS - Pesos","UF - UF","US - Dolar"}
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_ingreso_costo_venta
integer x = 64
integer y = 400
integer width = 219
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Monto:"
boolean focusrectangle = false
end type

type em_monto from editmask within w_ingreso_costo_venta
integer x = 293
integer y = 396
integer width = 480
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 28377087
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###.##"
end type

type st_3 from statictext within w_ingreso_costo_venta
integer x = 955
integer y = 200
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

type st_2 from statictext within w_ingreso_costo_venta
integer x = 946
integer y = 104
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

type em_hasta from editmask within w_ingreso_costo_venta
integer x = 1134
integer y = 184
integer width = 320
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_desde from editmask within w_ingreso_costo_venta
integer x = 1134
integer y = 88
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

event modified;long 		ll_mes,ll_anno,ll_mes_2
double	ll_mes_1
string		ls_fech_ini,ls_fech_fin

ll_mes					= month(date(em_desde.text))
ll_anno					= year(date(em_desde.text))
dw_lista.reset()
if ll_mes = 1 or ll_mes = 3 or ll_mes = 5 or ll_mes = 7 or ll_mes = 8 or ll_mes = 10 or ll_mes = 12 then
	ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	ls_fech_fin				= '31/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
	ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	ls_fech_fin				= '30/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')	
elseif ll_mes = 2 then
	ll_mes_1			= ll_anno/4
	ll_mes_2			= INT(ll_anno/4)		
	if ll_mes_1 = ll_mes_2 then 
		ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		ls_fech_fin				= '29/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	else 
		ls_fech_ini				= '01/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
		ls_fech_fin				= '28/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
	end if
end if	

em_desde.text			= ls_fech_ini
em_hasta.text			= ls_fech_fin

end event

type st_1 from statictext within w_ingreso_costo_venta
integer x = 73
integer y = 104
integer width = 219
integer height = 88
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque:"
boolean focusrectangle = false
end type

type ddlb_parque from dropdownlistbox within w_ingreso_costo_venta
integer x = 311
integer y = 88
integer width = 581
integer height = 396
integer taborder = 10
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
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type gb_1 from groupbox within w_ingreso_costo_venta
integer x = 18
integer y = 28
integer width = 1902
integer height = 272
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos"
end type

type gb_2 from groupbox within w_ingreso_costo_venta
integer x = 18
integer y = 324
integer width = 1897
integer height = 196
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingreso Monto"
end type

