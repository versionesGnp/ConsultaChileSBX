forward
global type w_buscar_rechazo_seguro from window
end type
type cb_aceptar from commandbutton within w_buscar_rechazo_seguro
end type
type pb_ok from picturebutton within w_buscar_rechazo_seguro
end type
type p_fin from picture within w_buscar_rechazo_seguro
end type
type em_fec_fin from editmask within w_buscar_rechazo_seguro
end type
type st_3 from statictext within w_buscar_rechazo_seguro
end type
type p_ini from picture within w_buscar_rechazo_seguro
end type
type em_fec_ini from editmask within w_buscar_rechazo_seguro
end type
type st_2 from statictext within w_buscar_rechazo_seguro
end type
type cb_cerrar from commandbutton within w_buscar_rechazo_seguro
end type
type dw_lista from datawindow within w_buscar_rechazo_seguro
end type
end forward

global type w_buscar_rechazo_seguro from window
integer width = 2702
integer height = 1556
boolean titlebar = true
string title = "Buscar Rechazos de Seguro Desgravamen"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_aceptar cb_aceptar
pb_ok pb_ok
p_fin p_fin
em_fec_fin em_fec_fin
st_3 st_3
p_ini p_ini
em_fec_ini em_fec_ini
st_2 st_2
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_buscar_rechazo_seguro w_buscar_rechazo_seguro

type variables
Long	il_row
end variables

on w_buscar_rechazo_seguro.create
this.cb_aceptar=create cb_aceptar
this.pb_ok=create pb_ok
this.p_fin=create p_fin
this.em_fec_fin=create em_fec_fin
this.st_3=create st_3
this.p_ini=create p_ini
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_aceptar,&
this.pb_ok,&
this.p_fin,&
this.em_fec_fin,&
this.st_3,&
this.p_ini,&
this.em_fec_ini,&
this.st_2,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_buscar_rechazo_seguro.destroy
destroy(this.cb_aceptar)
destroy(this.pb_ok)
destroy(this.p_fin)
destroy(this.em_fec_fin)
destroy(this.st_3)
destroy(this.p_ini)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_buscar_rechazo_seguro)
dw_lista.settransobject(sqlca)
em_fec_ini.text	= string(today(),"dd/mm/yyyy")
em_fec_fin.text	= string(today(),"dd/mm/yyyy")
//pb_ok.triggerevent(clicked!)
end event

type cb_aceptar from commandbutton within w_buscar_rechazo_seguro
integer x = 41
integer y = 1332
integer width = 297
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String	ls_base,ls_serie,ls_nom,ls_ap_pat,ls_ap_mat,ls_est_titular
Long		ll_cod_compania,ll_rut
Datetime	ldt_fecha
double	ldb_numero

if isvalid(w_mantenedor_rechazo_seguro_desgravamen) then
	if dw_lista.rowcount()>0 and il_row>0 then
		ls_base		= dw_lista.getitemstring(il_row,'base')
		ls_serie		= dw_lista.getitemstring(il_row,'serie')
		ldb_numero	= dw_lista.getitemnumber(il_row,'numero')
		ldt_fecha	= dw_lista.getitemdatetime(il_row,'fecha_crea')
		ll_rut		= dw_lista.getitemnumber(il_row,'rut_cliente')
		if not isnull(ls_base) and not isnull(ls_serie) and not isnull(ldb_numero) then 
			w_mantenedor_rechazo_seguro_desgravamen.dw_ctto.setitem(1,'base',ls_base)
			w_mantenedor_rechazo_seguro_desgravamen.dw_ctto.setitem(1,'serie',ls_serie)
			w_mantenedor_rechazo_seguro_desgravamen.dw_ctto.setitem(1,'numero',ldb_numero)
			w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.retrieve(ls_base,ls_serie,ldb_numero,ldt_fecha)
			w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.enabled	= false// modificado
			ll_cod_compania	= w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.getitemnumber(1,'codigo_compania')
			if not isnull(ll_cod_compania) then
				w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.getchild('contacto_compania',idw_detalle3)
				idw_detalle3.settransobject(sqlca)
				idw_detalle3.retrieve(ll_cod_compania)
			end if
			SELECT	"CLIENTE"."NOMBRE",   
						"CLIENTE"."A_PATERNO",   
						"CLIENTE"."A_MATERNO",   
						"CLIENTE"."ESTADO_TITULAR"
			INTO 		:ls_nom,   
						:ls_ap_pat,   
						:ls_ap_mat,   
						:ls_est_titular
			FROM 		"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.object.t_nombre_cliente.text		= ls_nom+' '+ls_ap_pat+' '+ls_ap_mat
				if ls_est_titular='0' then
					w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.object.t_estado_titular.text	= '0 - Activo'
				elseif ls_est_titular='1' then
					w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.object.t_estado_titular.text	= '1 - Fallecido'
				end if
			end if
			w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.setfocus()
			w_mantenedor_rechazo_seguro_desgravamen.dw_seguro.setcolumn('codigo_compania')
			close(w_buscar_rechazo_seguro)
		end if
	end if
end if
end event

type pb_ok from picturebutton within w_buscar_rechazo_seguro
integer x = 1861
integer y = 24
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = right!
end type

event clicked;Datetime	ld_fec_ini,ld_fec_fin
time		lt_ini=time('00:00:00'), lt_fin=time('23:59:59')
SetPointer(HourGlass!)
ld_fec_ini						= datetime(date(em_fec_ini.text),lt_ini)
ld_fec_fin						= datetime(date(em_fec_fin.text),lt_fin)
if trim(em_fec_ini.text)='00/00/0000' or isnull(em_fec_ini.text) then
	messagebox("Advertencia","Fecha Inicial Inválida")
	em_fec_ini.setfocus()
else
	if trim(em_fec_fin.text)='00/00/0000' or isnull(em_fec_fin.text) then
		messagebox("Advertencia","Fecha Término Inválida")
		em_fec_fin.setfocus()
	else
		if ld_fec_ini>ld_fec_fin then
			messagebox("Advertencia","Rango de Fecha Incorrecta")
			em_fec_ini.setfocus()
		else
			if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then
				messagebox("Advertencia","No Registra Dato")
				em_fec_fin.setfocus()
			end if
		end if
	end if
end if
end event

type p_fin from picture within w_buscar_rechazo_seguro
integer x = 1605
integer y = 52
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

dw_lista.reset()
if f_valida_fecha(em_fec_fin.text)=-1 then 
	em_fec_fin.text	= string(today(),gs_formato_fecha)
	em_fec_fin.setfocus()
	return
end if	
if em_fec_fin.text<>'00/00/0000' then
	ls_fecha 			= em_fec_fin.text
else
	ls_fecha 			= string(today(),gs_formato_fecha)
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

type em_fec_fin from editmask within w_buscar_rechazo_seguro
integer x = 1243
integer y = 52
integer width = 357
integer height = 88
integer taborder = 20
integer textsize = -9
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

type st_3 from statictext within w_buscar_rechazo_seguro
integer x = 1051
integer y = 68
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 700
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

type p_ini from picture within w_buscar_rechazo_seguro
integer x = 937
integer y = 52
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech

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
	IF DATE(Message.StringParm)>DATE(em_fec_fin.TEXT) THEN
		MESSAGEBOX(gs_app_name,'La fecha de inicio no debe ser mayor a la final.',stopsign!)
		em_fec_ini.setfocus()
		return
	else	
		em_fec_ini.text = Message.StringParm
	end if	
END IF
end event

type em_fec_ini from editmask within w_buscar_rechazo_seguro
integer x = 576
integer y = 52
integer width = 357
integer height = 88
integer taborder = 10
integer textsize = -9
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

type st_2 from statictext within w_buscar_rechazo_seguro
integer x = 55
integer y = 68
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha desde"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_buscar_rechazo_seguro
integer x = 2309
integer y = 1332
integer width = 334
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_buscar_rechazo_seguro)
end event

type dw_lista from datawindow within w_buscar_rechazo_seguro
integer x = 32
integer y = 192
integer width = 2610
integer height = 1100
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_buscar_rechazo_seguro"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row	= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_aceptar.triggerevent(clicked!)
end if
end event

