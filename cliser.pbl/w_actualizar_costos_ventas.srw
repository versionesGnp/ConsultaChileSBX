forward
global type w_actualizar_costos_ventas from window
end type
type cb_historico from commandbutton within w_actualizar_costos_ventas
end type
type cb_grabar from commandbutton within w_actualizar_costos_ventas
end type
type pb_ok from picturebutton within w_actualizar_costos_ventas
end type
type cb_actualizar from commandbutton within w_actualizar_costos_ventas
end type
type cb_cerrar from commandbutton within w_actualizar_costos_ventas
end type
type pb_2 from picturebutton within w_actualizar_costos_ventas
end type
type em_fec_fin from editmask within w_actualizar_costos_ventas
end type
type st_3 from statictext within w_actualizar_costos_ventas
end type
type pb_1 from picturebutton within w_actualizar_costos_ventas
end type
type em_fec_ini from editmask within w_actualizar_costos_ventas
end type
type st_2 from statictext within w_actualizar_costos_ventas
end type
type dw_parque from datawindow within w_actualizar_costos_ventas
end type
type cb_limpiar from commandbutton within w_actualizar_costos_ventas
end type
type dw_lista from datawindow within w_actualizar_costos_ventas
end type
end forward

global type w_actualizar_costos_ventas from window
integer width = 2455
integer height = 1876
boolean titlebar = true
string title = "Actualizar Costo de Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
cb_historico cb_historico
cb_grabar cb_grabar
pb_ok pb_ok
cb_actualizar cb_actualizar
cb_cerrar cb_cerrar
pb_2 pb_2
em_fec_fin em_fec_fin
st_3 st_3
pb_1 pb_1
em_fec_ini em_fec_ini
st_2 st_2
dw_parque dw_parque
cb_limpiar cb_limpiar
dw_lista dw_lista
end type
global w_actualizar_costos_ventas w_actualizar_costos_ventas

on w_actualizar_costos_ventas.create
this.cb_historico=create cb_historico
this.cb_grabar=create cb_grabar
this.pb_ok=create pb_ok
this.cb_actualizar=create cb_actualizar
this.cb_cerrar=create cb_cerrar
this.pb_2=create pb_2
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.pb_1=create pb_1
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.dw_parque=create dw_parque
this.cb_limpiar=create cb_limpiar
this.dw_lista=create dw_lista
this.Control[]={this.cb_historico,&
this.cb_grabar,&
this.pb_ok,&
this.cb_actualizar,&
this.cb_cerrar,&
this.pb_2,&
this.em_fec_fin,&
this.st_3,&
this.pb_1,&
this.em_fec_ini,&
this.st_2,&
this.dw_parque,&
this.cb_limpiar,&
this.dw_lista}
end on

on w_actualizar_costos_ventas.destroy
destroy(this.cb_historico)
destroy(this.cb_grabar)
destroy(this.pb_ok)
destroy(this.cb_actualizar)
destroy(this.cb_cerrar)
destroy(this.pb_2)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.dw_parque)
destroy(this.cb_limpiar)
destroy(this.dw_lista)
end on

event open;long 		ll_mes,ll_anno,ll_mes_2
double	ll_mes_1
string		ls_fech_ini,ls_fech_fin

gf_centrar(w_actualizar_costos_ventas)
dw_parque.settransobject(sqlca)
dw_parque.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
if gs_conexion	= "Parque El Prado" then	
	dw_parque.setitem(1,'parque',1)
elseif gs_conexion	= "Parque La Foresta" then
	dw_parque.setitem(1,'parque',11)
elseif gs_conexion	= "Parque Concepción" then
	dw_parque.setitem(1,'parque',801)	
end if	
dw_parque.accepttext()
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

em_fec_ini.text			= ls_fech_ini
em_fec_fin.text			= ls_fech_fin

end event

type cb_historico from commandbutton within w_actualizar_costos_ventas
integer x = 1595
integer y = 1664
integer width = 288
integer height = 104
integer taborder = 80
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

type cb_grabar from commandbutton within w_actualizar_costos_ventas
integer x = 416
integer y = 1664
integer width = 311
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Grabar"
end type

event clicked;long ll_res
ll_res	= messagebox('Advertencia','Desea Grabar Costos de Ventas',Exclamation!, YesNo!, 2)
if ll_res = 1 then
	if dw_lista.update() = 1 then
		commit;
		messagebox("Aviso","Grabación Exitosa")
		//close(w_actualizar_costos_ventas)
		dw_lista.reset()
	else
		messagebox("Error Grabar Detalle","Error Grabar Costo de Ventas SQL: "+sqlca.sqlerrtext)
		rollback;
	end if	
else
end if	
end event

type pb_ok from picturebutton within w_actualizar_costos_ventas
integer x = 2263
integer y = 28
integer width = 146
integer height = 132
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_usuario_mc,ls_nombre_falle,ls_ap_falle,ls_nombre
long		ll_ctto_prado,ll_prom_prado,ll_tot_venc_prado,ll_cod_parque,ll_pag_prado
date		ld_fec_ini,ld_fec_fin

dw_lista.reset()
ll_cod_parque															= dw_parque.getitemnumber(1,'parque')
if  ll_cod_parque = 0 or isnull(ll_cod_parque) then
	messagebox("Advertencia","Debe Ingresar Parque")
else
	if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
		messagebox("Advertencia","Fecha Inicial Inválida")
		em_fec_ini.setfocus()
	else
		if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
			messagebox("Advertencia","Fecha Término Inválida")
			em_fec_fin.setfocus()
		else
			ld_fec_ini														= date(em_fec_ini.text)//,time('00:00:00')
			ld_fec_fin														= date(em_fec_fin.text)//,time('00:00:00')
			if ld_fec_ini>ld_fec_fin then
				messagebox("Advertencia","Rango de Fecha Incorrecta")
				em_fec_ini.setfocus()
			else
				dw_lista.retrieve(ll_cod_parque,ld_fec_ini,ld_fec_fin)
				dw_lista.object.t_rango_fechas.text					='Período del '+string(ld_fec_ini,'dd/mm/yyyy')+' al '+string( ld_fec_fin,'dd/mm/yyyy')
				cb_actualizar.enabled = true
			end if
		end if
	end if	
end if	
end event

type cb_actualizar from commandbutton within w_actualizar_costos_ventas
integer x = 32
integer y = 1664
integer width = 311
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Actualizar"
end type

event clicked;string 	ls_base,ls_serie,ls_tipo
long		ll_new,ll_num,ll_tot_reg,ll_parque
datetime ldt_fec_ini,ldt_fec_fin,ldt_fecha
double	ldb_monto

ll_tot_reg									= dw_lista.rowcount()
ll_parque										= dw_parque.getitemnumber(1,'parque')
ldt_fec_ini									= datetime(date(em_fec_ini.text),time('00:00:00'))
ldt_fec_fin									= datetime(date(em_fec_fin.text),time('00:00:00'))

SELECT 	"COSTO_VENTA"."MONTO","COSTO_VENTA"."TIPO"  
INTO 		:ldb_monto,:ls_tipo  
FROM 	"COSTO_VENTA"
WHERE 	"COSTO_VENTA"."COD_PARQUE" = :ll_parque AND  
			"COSTO_VENTA"."DESDE" >= :ldt_fec_ini AND  
			"COSTO_VENTA"."HASTA" <= :ldt_fec_fin
USING	sqlca;
if sqlca.sqlcode = 0 then	
	if ldb_monto > 0 and not isnull(ls_tipo) then
		if ll_tot_reg > 0 and not isnull(ll_tot_reg) then
			for ll_new= 1 to ll_tot_reg
				dw_lista.setitem(ll_new,"oferta_v_costo_venta",ldb_monto)
				dw_lista.setitem(ll_new,"oferta_v_unidad_costo",ls_tipo)
			next
			cb_grabar.enabled 		= true
		end if
	end if	
else
	messagebox('Advertencia','Costo de Venta no Ingresado Para el Parque y Mes Seleccionado')	
end if	
end event

type cb_cerrar from commandbutton within w_actualizar_costos_ventas
integer x = 2094
integer y = 1664
integer width = 311
integer height = 104
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_actualizar_costos_ventas)
end event

type pb_2 from picturebutton within w_actualizar_costos_ventas
integer x = 1915
integer y = 52
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

if f_valida_fecha(em_fec_fin.text)=-1 then 
 em_fec_fin.text=string(today(),gs_formato_fecha)
 em_fec_fin.setfocus()
 return
end if 
if em_fec_ini.text<>'00/00/0000' then
 ls_fecha = em_fec_fin.text
else
 ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
 IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
  em_fec_fin.setfocus()
  return
 else 
  em_fec_fin.text = Message.StringParm
 end if 
END IF
end event

type em_fec_fin from editmask within w_actualizar_costos_ventas
integer x = 1600
integer y = 52
integer width = 311
integer height = 92
integer textsize = -9
integer weight = 700
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

type st_3 from statictext within w_actualizar_costos_ventas
integer x = 1463
integer y = 60
integer width = 151
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_actualizar_costos_ventas
integer x = 1353
integer y = 52
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

event clicked;string 	ls_fecha,fech
long		uf,ll_mes,ll_anno,ll_mes_2
double	ll_mes_1
string		ls_fech_ini,ls_fech_fin

dw_lista.reset()
if f_valida_fecha(em_fec_ini.text)=-1 then 
	em_fec_ini.text=string(today(),gs_formato_fecha)
 	em_fec_ini.setfocus()
	return
end if 
if em_fec_ini.text<>'00/00/0000' then
 	ls_fecha = em_fec_ini.text
else
 	ls_fecha = string(today(),gs_formato_fecha)
end if 
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
//	 IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
//		  MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
//		  em_fec_ini.setfocus()
//	  return
//	 else 
	 	 em_fec_ini.text = Message.StringParm

		ll_mes					= month(date(em_fec_ini.text))
		ll_anno					= year(date(em_fec_ini.text))
		
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
		em_fec_ini.text			= ls_fech_ini
		em_fec_fin.text			= ls_fech_fin
//	 end if 
END IF
end event

type em_fec_ini from editmask within w_actualizar_costos_ventas
integer x = 1038
integer y = 52
integer width = 311
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 700
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

ll_mes					= month(date(em_fec_ini.text))
ll_anno					= year(date(em_fec_ini.text))
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

em_fec_ini.text			= ls_fech_ini
em_fec_fin.text			= ls_fech_fin

end event

type st_2 from statictext within w_actualizar_costos_ventas
integer x = 891
integer y = 60
integer width = 142
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
boolean focusrectangle = false
end type

type dw_parque from datawindow within w_actualizar_costos_ventas
integer x = 32
integer y = 56
integer width = 837
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dwe_parque_costos_ventas"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista.reset()
end event

type cb_limpiar from commandbutton within w_actualizar_costos_ventas
integer x = 1061
integer y = 1664
integer width = 311
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;long 		ll_mes,ll_anno,ll_mes_1
double	ll_mes_2
string		ls_fech_ini,ls_fech_fin

dw_lista.reset()
dw_parque.reset()
dw_parque.insertrow(0)
if gs_conexion	= "Parque El Prado" then	
	dw_parque.setitem(1,'parque',1)
elseif gs_conexion	= "Parque La Foresta" then
	dw_parque.setitem(1,'parque',11)
elseif gs_conexion	= "Parque Concepción" then
	dw_parque.setitem(1,'parque',801)
end if	
dw_parque.accepttext()
cb_actualizar.enabled 		= false
cb_grabar.enabled 			= false

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

em_fec_ini.text			= ls_fech_ini
em_fec_fin.text			= ls_fech_fin
end event

type dw_lista from datawindow within w_actualizar_costos_ventas
integer x = 32
integer y = 184
integer width = 2373
integer height = 1448
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lista_sin_costo_venta"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

