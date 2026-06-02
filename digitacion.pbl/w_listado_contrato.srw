forward
global type w_listado_contrato from window
end type
type cb_3 from commandbutton within w_listado_contrato
end type
type cb_2 from commandbutton within w_listado_contrato
end type
type cb_1 from commandbutton within w_listado_contrato
end type
type p_2 from picture within w_listado_contrato
end type
type p_1 from picture within w_listado_contrato
end type
type pb_aceptar from picturebutton within w_listado_contrato
end type
type em_fec_fin from editmask within w_listado_contrato
end type
type em_fec_ini from editmask within w_listado_contrato
end type
type st_2 from statictext within w_listado_contrato
end type
type st_1 from statictext within w_listado_contrato
end type
type pb_cerrar from picturebutton within w_listado_contrato
end type
type dw_lista from datawindow within w_listado_contrato
end type
end forward

global type w_listado_contrato from window
integer width = 3099
integer height = 2068
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
p_2 p_2
p_1 p_1
pb_aceptar pb_aceptar
em_fec_fin em_fec_fin
em_fec_ini em_fec_ini
st_2 st_2
st_1 st_1
pb_cerrar pb_cerrar
dw_lista dw_lista
end type
global w_listado_contrato w_listado_contrato

type variables
string	is_base
end variables

on w_listado_contrato.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.p_2=create p_2
this.p_1=create p_1
this.pb_aceptar=create pb_aceptar
this.em_fec_fin=create em_fec_fin
this.em_fec_ini=create em_fec_ini
this.st_2=create st_2
this.st_1=create st_1
this.pb_cerrar=create pb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.p_2,&
this.p_1,&
this.pb_aceptar,&
this.em_fec_fin,&
this.em_fec_ini,&
this.st_2,&
this.st_1,&
this.pb_cerrar,&
this.dw_lista}
end on

on w_listado_contrato.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.pb_aceptar)
destroy(this.em_fec_fin)
destroy(this.em_fec_ini)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_cerrar)
destroy(this.dw_lista)
end on

event open;date	ld_fec_ini,ld_fec_fin
gf_centrar(w_listado_contrato)
is_base							= Message.StringParm
em_fec_ini.text					= string(date(gdt_fec_sistema))
em_fec_fin.text					= string(date(gdt_fec_sistema))
ld_fec_ini						= date(gdt_fec_sistema)
ld_fec_fin						= date(gdt_fec_sistema)
CHOOSE CASE is_base
	CASE 'O'
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_o'
		this.title					= 'Lista de Contrato Promesas ( BASE "O" )'
	CASE 'U'
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_u'
		this.title					= 'Lista de Contrato Columbario ( BASE "U" )'
	CASE 'C'
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_c'
		this.title					= 'Lista de Contrato IsaCruz ( BASE "C" )'
	CASE 'P'
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_p'
		this.title					= 'Lista de Contrato Pagaré ( BASE "P" )'
	CASE 'L'
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_l'
		this.title					= 'Lista de Contrato Anexo Liberadores ( BASE "L" )'
	CASE 'D'
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_d'
		this.title					= 'Lista de Contrato Derechos Especiales ( BASE "D" )'
	CASE 'A'
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_a'
		this.title					= 'Lista de Contrato Aumento Capacidad ( BASE "A" )'
	CASE 'F'
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_f'
		this.title					= 'Lista de Contrato Funeraria ( BASE "F" )'
	CASE "G"
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_f'
		this.title					= 'Lista de Contrato Crematorio ( BASE "G" )'
	CASE "V"
		dw_lista.dataobject	= 'dw_listado_rango_fecha_base_f'
		this.title					= 'Lista de Contrato de Servicios ( BASE "V" )'
END CHOOSE
dw_lista.settransobject(sqlca)
if is_base='F' or is_base='G' or is_base='V' then
	dw_lista.retrieve(ld_fec_ini,ld_fec_fin,is_base)
else
	dw_lista.retrieve(ld_fec_ini,ld_fec_fin)
end if
end event

type cb_3 from commandbutton within w_listado_contrato
integer x = 2455
integer y = 1820
integer width = 229
integer height = 92
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

type cb_2 from commandbutton within w_listado_contrato
integer x = 2208
integer y = 1820
integer width = 238
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_1 from commandbutton within w_listado_contrato
integer x = 1975
integer y = 1820
integer width = 224
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setsort(nulo)
dw_lista.sort()




end event

type p_2 from picture within w_listado_contrato
integer x = 1518
integer y = 1820
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
ls_fecha					= trim(em_fec_fin.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_fin.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_fin.text	= string(ls_fecha)
END IF
em_fec_fin.setfocus()
end event

type p_1 from picture within w_listado_contrato
integer x = 859
integer y = 1820
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
ls_fecha					= trim(em_fec_ini.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_ini.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_ini.text	= string(ls_fecha)
END IF
em_fec_ini.setfocus()
end event

type pb_aceptar from picturebutton within w_listado_contrato
integer x = 1646
integer y = 1792
integer width = 169
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;date	ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if ld_fec_ini>ld_fec_fin or isnull(ld_fec_ini) or isnull(ld_fec_fin) then
	messagebox("Advertencia","Rango de Fecha Inválida")
else
	if is_base='F' or is_base='G' or is_base='V' then
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,is_base)=0 then
			messagebox("Advertencia","No registra datos")
		end if
	else
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then 
			messagebox("Advertencia","No registra datos")
		end if
	end if
	
end if
end event

type em_fec_fin from editmask within w_listado_contrato
integer x = 1170
integer y = 1820
integer width = 343
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

type em_fec_ini from editmask within w_listado_contrato
integer x = 512
integer y = 1820
integer width = 343
integer height = 88
integer taborder = 10
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

type st_2 from statictext within w_listado_contrato
integer x = 951
integer y = 1836
integer width = 197
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_listado_contrato
integer x = 37
integer y = 1832
integer width = 475
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha Desde:"
boolean focusrectangle = false
end type

type pb_cerrar from picturebutton within w_listado_contrato
integer x = 2866
integer y = 1792
integer width = 169
integer height = 148
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_listado_contrato)
end event

type dw_lista from datawindow within w_listado_contrato
integer x = 37
integer y = 32
integer width = 2999
integer height = 1728
integer taborder = 30
string dataobject = "dw_listado_rango_fecha_base_f"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

end event

event rowfocuschanged;if this.getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if

end event

event doubleclicked;String		ls_modifica,ls_uso,ls_moneda
Long		ll_count_reg,ll_tot_reg,ll_indi,ll_count,ll_cod_seguro,ll_estado_reg,ll_reg,ll_cod_parque,ll_cod_benef
Double	ldb_monto

setnull(gs_serie);setnull(gs_base);setnull(gi_numero);setnull(gs_age)
setnull(gs_sup);setnull(gs_jefe)
if row>0 then
	if isvalid(w_ingresar_oferta) then //promesas
		w_ingresar_oferta.dw_oferta_v.getchild('oferta_v_beneficio_complementario',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		w_ingresar_oferta.dw_oferta_v.getchild('pago_oferta_codigo_tipo_seguro',idw_detalle4)
		idw_detalle4.settransobject(sqlca)
		if idw_detalle2.rowcount()=0 then
			idw_detalle2.insertrow(0)
		end if
		gs_serie			= dw_lista.getitemstring(dw_lista.getrow(),'oferta_v_serie')
		gs_base			= dw_lista.getitemstring(dw_lista.getrow(),'cadena_codigo')
		gi_numero		= dw_lista.getitemnumber(dw_lista.getrow(),'oferta_v_nro_oferta')
		ll_cod_parque	= dw_lista.getitemnumber(dw_lista.getrow(),'cadena_cod_parque')
		if not isnull(gs_serie) and not isnull(gi_numero) and gi_numero>0 then
			idw_detalle2.retrieve(ll_cod_parque)
			idw_detalle4.retrieve(ll_cod_parque,gs_base)	//'O'
			gs_age		= dw_lista.getitemstring(dw_lista.getrow(),'oferta_v_cod_age')
			gs_sup		= dw_lista.getitemstring(dw_lista.getrow(),'oferta_v_cod_sup')
			gs_jefe		= dw_lista.getitemstring(dw_lista.getrow(),'oferta_v_cod_jef')
			w_ingresar_oferta.dw_oferta_v.Retrieve(gs_serie,gi_numero)
			ll_cod_benef					= w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'oferta_v_beneficio_complementario')
			if ll_cod_benef > 0 then
				w_ingresar_oferta.pb_promociones.enabled	= true
			else
				w_ingresar_oferta.pb_promociones.enabled	= false
			end if
			gs_nueva_oferta				= 'N'
			w_ingresar_oferta.dw_agente.setitem(1,'agente',gs_age)
			w_ingresar_oferta.dw_supervisor.setitem(1,'supervisores',gs_sup)
			w_ingresar_oferta.dw_jefe.setitem(1,'jefes',gs_jefe)
			SELECT	Count("PAGARE_V"."SERIE")  
			INTO 		:ll_count_reg  
			FROM 		"PAGARE_V"  
			WHERE  ( "PAGARE_V"."SERIE" = :gs_serie ) AND  
					 ( "PAGARE_V"."NUMERO" = :gi_numero )   
			Using		sqlca;
			if ll_count_reg>0 then 
				w_ingresar_oferta.st_pagare.italic			= true
			else
				w_ingresar_oferta.st_pagare.italic			= false
			end if
			w_ingresar_oferta.cb_aceptar.text 			= "Actualizar"
			gi_rut 												= Long(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut"))
			w_ingresar_oferta.dw_clientes.Retrieve(gi_rut)
	//		w_ingresar_oferta.dw_beneficiarios.Retrieve(gs_serie,gi_numero)
			w_ingresar_oferta.dw_oferta_v.SetItem(1,"compute",upper(w_ingresar_oferta.dw_clientes.GetItemstring(1,"dv")))
			w_ingresar_oferta.em_serie.text				= gs_serie
			w_ingresar_oferta.em_numero.text			= string(gi_numero)
			w_ingresar_oferta.em_rut.text					= string(gi_rut)
			w_ingresar_oferta.em_dv.text					= string(upper(w_ingresar_oferta.dw_clientes.GetItemstring(1,"dv")))
			w_ingresar_oferta.em_rut.enabled			= false
			w_ingresar_oferta.em_dv.enabled				= false
			w_ingresar_oferta.dw_oferta_v.enabled		= true
			w_ingresar_oferta.dw_agente.enabled		= true
			w_ingresar_oferta.dw_supervisor.enabled	= true
			w_ingresar_oferta.dw_jefe.enabled			= true
	//		w_ingresar_oferta.dw_beneficiarios.enabled= true
			if w_ingresar_oferta.dw_oferta_v.GetItemstring(1, "tipo_venta") = '6' then
				w_ingresar_oferta.dw_oferta_v.Object.rut_institucional.TabSequence	= 130
				w_ingresar_oferta.dw_oferta_v.Object.compute_0050.TabSequence 		= 140
			else
				w_ingresar_oferta.dw_oferta_v.Object.rut_institucional.TabSequence 	= 0
				w_ingresar_oferta.dw_oferta_v.Object.compute_0050.TabSequence 		= 0
			end if
			w_ingresar_oferta.dw_oferta_v.setitem(1,'compute_0050',gf_obtener_dv(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut_institucional")))
			w_ingresar_oferta.dw_oferta_v.setitem(1,'compute_0053',gf_obtener_dv(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut_aval")))
			w_ingresar_oferta.dw_oferta_v.setitem(1,'compute_0055',gf_obtener_dv(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut_funeraria")))
			w_ingresar_oferta.dw_oferta_v.setitem(1,'compute',gf_obtener_dv(w_ingresar_oferta.dw_oferta_v.GetItemNumber(1, "rut")))
			ll_tot_reg					= w_ingresar_oferta.dw_seguro.retrieve(ll_cod_parque,gs_base)
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					w_ingresar_oferta.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				next
				w_ingresar_oferta.dw_seguro.accepttext()
			end if
			SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO")
			INTO			:ll_count
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
			if ll_count > 0 then
				DECLARE x1 CURSOR FOR  
				SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
								"SEGURO_ASOCIADOS"."ESTADO_REG"  
				FROM 		"SEGURO_ASOCIADOS"  
				WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING		sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						Fetch x1 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
						if not isnull(ll_cod_seguro) then
							if ll_estado_reg = 0 then
								ll_reg = w_ingresar_oferta.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_ingresar_oferta.dw_seguro.RowCount())
								if ll_reg > 0 then
									w_ingresar_oferta.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
								end if
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x1;
				w_ingresar_oferta.dw_seguro.accepttext()
			end if
			if w_ingresar_oferta.dw_oferta_v.getitemnumber(1,'pago_oferta_factura') = 99 then
				w_ingresar_oferta.cb_aceptar.enabled	= false
			else
				w_ingresar_oferta.cb_aceptar.enabled	= true
			end if
			w_ingresar_oferta.dw_seguro.enabled		= true
			
			w_ingresar_oferta.dw_oferta_v.setfocus()
			pb_cerrar.triggerevent(clicked!)
		end if
		
	elseif isvalid(w_ingresar_contrato) then //Contrato Isacruz
		gs_base			= 'C'
		gs_serie			= dw_lista.getitemstring(dw_lista.getrow(),'contrato_serie_c') 
		gi_numero		= dw_lista.getitemnumber(dw_lista.getrow(),'contrato_nro_contrato')
		setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
		if not isnull(gs_serie) and not isnull(gi_numero) and gi_numero>0 then
	//		w_ingresar_contrato.dw_beneficiarios.reset()
			if w_ingresar_contrato.dw_ingreso_contrato.retrieve(gs_serie,gi_numero)>0 then
				w_ingresar_contrato.cb_aceptar.text		= "Actualizar"
				gi_rut	= dw_lista.getitemnumber(dw_lista.getrow(),'cliente_rut')
				w_ingresar_contrato.dw_ingreso_contrato.setitem(1,'estado_contrato',1)
				if isnull(w_ingresar_contrato.dw_ingreso_contrato.getitemstring(1,'usuario')) then w_ingresar_contrato.dw_ingreso_contrato.setitem(1,'usuario',gs_user)
				if w_ingresar_contrato.dw_clientes.retrieve(gi_rut)>0 then
					w_ingresar_contrato.dw_ingreso_contrato.SetItem(1,"compute",upper(w_ingresar_contrato.dw_clientes.GetItemstring(1,"dv")))
					w_ingresar_contrato.dw_ingreso_contrato.setitem(1,'estado_rut',1)
				else
					w_ingresar_contrato.dw_ingreso_contrato.setitem(1,'estado_rut',0)
				end if
	//			w_ingresar_contrato.dw_beneficiarios.retrieve(gs_serie,gi_numero)
			end if
			w_ingresar_contrato.dw_ingreso_contrato.setfocus()
			pb_cerrar.triggerevent(clicked!)	
		end if
		
	elseif isvalid(w_ingresar_derecho) then //Derecho
		String	ls_serie2
		gs_base			= 'D'
		gs_serie			= dw_lista.getitemstring(dw_lista.getrow(),'derecho_serie_p')
		gi_numero		= dw_lista.getitemnumber(dw_lista.getrow(),'derecho_nro_pagare')
		ll_cod_parque	= dw_lista.getitemnumber(dw_lista.getrow(),'cadena_cod_parque')
		setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
		if not isnull(gs_serie) and not isnull(gi_numero) and gi_numero>0 then
			ll_tot_reg	= w_ingresar_derecho.dw_seguro.retrieve(ll_cod_parque,gs_base)
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					w_ingresar_derecho.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				next
				w_ingresar_derecho.dw_seguro.accepttext()
			end if
			SELECT	"CADENA"."SERIE" 
			INTO 		:ls_serie2
			FROM 		"CADENA"  
			WHERE  ( "CADENA"."SERIE" = :gs_serie) AND
					 ( "CADENA"."NUMERO" = :gi_numero) AND
					 ( "CADENA"."CODIGO" = 'D' )
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if w_ingresar_derecho.dw_derecho.retrieve(gs_serie,gi_numero)>0 then
					if isnull(w_ingresar_derecho.dw_derecho.getitemstring(1,'usuario')) or w_ingresar_derecho.dw_derecho.getitemstring(1,'usuario')='' then w_ingresar_derecho.dw_derecho.setitem(1,'usuario',gs_user)
					w_ingresar_derecho.cb_aceptar.text = "Actualizar"
					gi_rut = Long(dw_lista.GetItemNumber(dw_lista.getrow(), "cliente_rut"))
					w_ingresar_derecho.dw_derecho.setitem(1,'estado_rut',1)
					w_ingresar_derecho.dw_derecho.setitem(1,'estado_pagare',1)
					w_ingresar_derecho.dw_derecho.setitem(1,'estado_contrato',1)
					if w_ingresar_derecho.dw_clientes.Retrieve(gi_rut)>0 then w_ingresar_derecho.dw_derecho.SetItem(1,"compute",upper(w_ingresar_derecho.dw_clientes.GetItemstring(1,"dv")))
				end if
			END IF
			SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO")
			INTO			:ll_count
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
			if ll_count > 0 then
				DECLARE x3 CURSOR FOR  
				SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
								"SEGURO_ASOCIADOS"."ESTADO_REG"  
				FROM 		"SEGURO_ASOCIADOS"  
				WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING		sqlca;
				open x3;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						Fetch x3 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
						if not isnull(ll_cod_seguro) then
							if ll_estado_reg = 0 then
								ll_reg = w_ingresar_derecho.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_ingresar_derecho.dw_seguro.RowCount())
								if ll_reg > 0 then
									w_ingresar_derecho.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
								end if
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x3;
				w_ingresar_derecho.dw_seguro.accepttext()
			end if
			w_ingresar_derecho.dw_seguro.enabled				= true
			if w_ingresar_derecho.dw_derecho.getitemnumber(1,'nro_resc') = 99 then
				w_ingresar_derecho.cb_aceptar.enabled			= false
			else
				w_ingresar_derecho.cb_aceptar.enabled			= true
			end if
			w_ingresar_derecho.dw_derecho.setfocus()
			pb_cerrar.triggerevent(clicked!)	
		end if
	
	elseif isvalid(w_ingresar_liberador) then //Anexo Liberador
		gi_numero															= dw_lista.getitemnumber(dw_lista.getrow(),'anexo_liberador_nro_liberador')
		gs_serie 																= dw_lista.getitemstring(dw_lista.getrow(),'anexo_liberador_serie_m')
		gs_base 																= "L"
		ll_cod_parque														= dw_lista.getitemnumber(dw_lista.getrow(),'cadena_cod_parque')
		setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
		if w_ingresar_liberador.dw_anexo_liberador.Retrieve(gs_serie,gi_numero)>0 then
			gs_age															= w_ingresar_liberador.dw_anexo_liberador.getitemstring(1,'cod_agente')
			gs_sup															= w_ingresar_liberador.dw_anexo_liberador.getitemstring(1,'cod_super')
			gs_jefe															= w_ingresar_liberador.dw_anexo_liberador.getitemstring(1,'cod_jef')
			w_ingresar_liberador.cb_aceptar.text 					= "Actualizar"
			gi_rut 															= Long(dw_lista.GetItemNumber(dw_lista.getrow(), "cliente_rut"))
			w_ingresar_liberador.dw_anexo_liberador.SetItem(1, 'estado_rut',0)
			w_ingresar_liberador.dw_anexo_liberador.setitem(1, 'estado_contrato',0)
			if w_ingresar_liberador.dw_clientes.Retrieve(gi_rut)=0 then w_ingresar_liberador.dw_clientes.insertrow(0)
			w_ingresar_liberador.dw_anexo_liberador.SetItem(1,"compute",upper(w_ingresar_liberador.dw_clientes.GetItemstring(1,"dv")))
			w_ingresar_liberador.em_dv.text							= upper(w_ingresar_liberador.dw_clientes.GetItemstring(1,"dv"))
			w_ingresar_liberador.em_rut.text							= string(gi_rut)
			w_ingresar_liberador.em_numero.text					= string(gi_numero)
			w_ingresar_liberador.em_serie.text						= gs_serie
			w_ingresar_liberador.em_rut.enabled					= false
			w_ingresar_liberador.em_dv.enabled						= false
			w_ingresar_liberador.dw_anexo_liberador.enabled	= true
			w_ingresar_liberador.dw_anexo_liberador.setfocus()
			gs_nueva_oferta												= 'N'
			w_ingresar_liberador.dw_agente.setitem(1,'agente',gs_age)
			w_ingresar_liberador.dw_supervisor.setitem(1,'supervisores',gs_sup)
			w_ingresar_liberador.dw_jefe.setitem(1,'jefes',gs_jefe)
			ll_tot_reg														= w_ingresar_liberador.dw_seguro.retrieve(ll_cod_parque,gs_base)
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					w_ingresar_liberador.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				next
				w_ingresar_liberador.dw_seguro.accepttext()
			end if
			SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO")
			INTO			:ll_count
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
			if ll_count > 0 then
				DECLARE x2 CURSOR FOR  
				SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
								"SEGURO_ASOCIADOS"."ESTADO_REG"  
				FROM 		"SEGURO_ASOCIADOS"  
				WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING		sqlca;
				open x2;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						Fetch x2 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
						if not isnull(ll_cod_seguro) then
							if ll_estado_reg = 0 then
								ll_reg = w_ingresar_liberador.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_ingresar_liberador.dw_seguro.RowCount())
								if ll_reg > 0 then
									w_ingresar_liberador.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
								end if
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x2;
				w_ingresar_liberador.dw_seguro.accepttext()
			end if
			w_ingresar_liberador.dw_seguro.enabled			= true
			if w_ingresar_liberador.dw_anexo_liberador.getitemnumber(1,'nro_resc') = 99 then
				//w_ingresar_liberador.cb_aceptar.enabled		= false
				ls_modifica			= 'N'
				w_ingresar_liberador.dw_anexo_liberador.setitem(1,'modifica',ls_modifica)
				w_ingresar_liberador.dw_anexo_liberador.accepttext()
			else
				w_ingresar_liberador.cb_aceptar.enabled		= true
			end if
			w_ingresar_liberador.dw_anexo_liberador.setfocus()
			pb_cerrar.triggerevent(clicked!)	
		END IF
	elseif isvalid(w_ingresar_aumento_capacidad) then //Aumento Capacidad
		gi_numero							= dw_lista.getitemnumber(dw_lista.getrow(),'anexo_aumento_nro_aumento')
		gs_serie 								= dw_lista.getitemstring(dw_lista.getrow(),'anexo_aumento_serie_m')
		gs_base 								= "A"
		ll_cod_parque						= dw_lista.getitemnumber(dw_lista.getrow(),'cadena_cod_parque')
		setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
		if w_ingresar_aumento_capacidad.dw_aumento_capacidad.Retrieve(gs_serie,gi_numero)>0 then
			gs_age							= w_ingresar_aumento_capacidad.dw_aumento_capacidad.getitemstring(1,'anexo_aumento_cod_agente')
			gs_sup							= w_ingresar_aumento_capacidad.dw_aumento_capacidad.getitemstring(1,'anexo_aumento_cod_super')
			gs_jefe							= w_ingresar_aumento_capacidad.dw_aumento_capacidad.getitemstring(1,'anexo_aumento_cod_jef')
			w_ingresar_aumento_capacidad.cb_aceptar.text 				= "Actualizar"
			gi_rut 							= Long(dw_lista.GetItemNumber(dw_lista.getrow(), "cliente_rut"))
			w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1, 'estado_rut',0)
			w_ingresar_aumento_capacidad.dw_aumento_capacidad.setitem(1, 'estado_contrato',0)
			if w_ingresar_aumento_capacidad.dw_clientes.Retrieve(gi_rut)=0 then w_ingresar_aumento_capacidad.dw_clientes.insertrow(0)
			w_ingresar_aumento_capacidad.dw_aumento_capacidad.SetItem(1,"compute",upper(w_ingresar_aumento_capacidad.dw_clientes.GetItemstring(1,"dv")))
			w_ingresar_aumento_capacidad.em_dv.text							= upper(w_ingresar_aumento_capacidad.dw_clientes.GetItemstring(1,"dv"))
			w_ingresar_aumento_capacidad.em_rut.text							= string(gi_rut)
			w_ingresar_aumento_capacidad.em_numero.text						= string(gi_numero)
			w_ingresar_aumento_capacidad.em_serie.text							= gs_serie
			w_ingresar_aumento_capacidad.em_rut.enabled						= false
			w_ingresar_aumento_capacidad.em_dv.enabled						= false
			w_ingresar_aumento_capacidad.dw_aumento_capacidad.enabled	= true
			w_ingresar_aumento_capacidad.dw_aumento_capacidad.setfocus()
			gs_nueva_oferta	= 'N'
			w_ingresar_aumento_capacidad.dw_agente.setitem(1,'agente',gs_age)
			w_ingresar_aumento_capacidad.dw_supervisor.setitem(1,'supervisores',gs_sup)
			w_ingresar_aumento_capacidad.dw_jefe.setitem(1,'jefes',gs_jefe)
			ll_tot_reg					= w_ingresar_aumento_capacidad.dw_seguro.retrieve(ll_cod_parque,gs_base)
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					w_ingresar_aumento_capacidad.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				next
				w_ingresar_aumento_capacidad.dw_seguro.accepttext()
			end if
			SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO")
			INTO			:ll_count
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
			if ll_count > 0 then
				DECLARE x4 CURSOR FOR  
				SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
								"SEGURO_ASOCIADOS"."ESTADO_REG"  
				FROM 		"SEGURO_ASOCIADOS"  
				WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING		sqlca;
				open x4;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						Fetch x4 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
						if not isnull(ll_cod_seguro) then
							if ll_estado_reg = 0 then
								ll_reg = w_ingresar_aumento_capacidad.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_ingresar_aumento_capacidad.dw_seguro.RowCount())
								if ll_reg > 0 then
									w_ingresar_aumento_capacidad.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
								end if
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x4;
				w_ingresar_aumento_capacidad.dw_seguro.accepttext()
			end if
			w_ingresar_aumento_capacidad.dw_seguro.enabled					= true
			if w_ingresar_aumento_capacidad.dw_aumento_capacidad.getitemnumber(1,'anexo_aumento_nro_resc') = 99 then				
				ls_modifica			= 'N'
				w_ingresar_aumento_capacidad.dw_aumento_capacidad.setitem(1,'modifica',ls_modifica)
				w_ingresar_aumento_capacidad.dw_aumento_capacidad.accepttext()
//				w_ingresar_aumento_capacidad.cb_aceptar.enabled				= false
			else
				w_ingresar_aumento_capacidad.cb_aceptar.enabled				= true
			end if
			w_ingresar_aumento_capacidad.dw_aumento_capacidad.setfocus()
			pb_cerrar.triggerevent(clicked!)	
		END IF
	elseif isvalid(w_ingresar_pagare) then //Pagare
		gi_numero				= dw_lista.getitemnumber(dw_lista.getrow(),'pagare_nro_pagare')
		gs_serie 					= dw_lista.getitemstring(dw_lista.getrow(),'pagare_serie_p')
		gs_base 					= "P"
		ll_cod_parque			= dw_lista.getitemnumber(dw_lista.getrow(),'cadena_cod_parque')
		setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
		if w_ingresar_pagare.dw_pagare.Retrieve(gs_serie,gi_numero)>0 then
			if isnull(w_ingresar_pagare.dw_pagare.getitemstring(1,'usuario')) or w_ingresar_pagare.dw_pagare.getitemstring(1,'usuario')='' then w_ingresar_pagare.dw_pagare.setitem(1,'usuario',gs_user)
			w_ingresar_pagare.cb_aceptar.text = "Actualizar"
			gi_rut = Long(dw_lista.GetItemNumber(dw_lista.getrow(), "cliente_rut"))
			if w_ingresar_pagare.dw_clientes.Retrieve(gi_rut)>0 then w_ingresar_pagare.dw_pagare.SetItem(1,"compute",upper(w_ingresar_pagare.dw_clientes.GetItemstring(1,"dv")))
			w_ingresar_pagare.dw_pagare.setitem(1,'estado_rut',1)
			w_ingresar_pagare.dw_pagare.setitem(1,'estado_pagare',1)
			w_ingresar_pagare.dw_pagare.setitem(1,'estado_contrato',1)
			
			ll_tot_reg					= w_ingresar_pagare.dw_seguro.retrieve(ll_cod_parque,gs_base)
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					w_ingresar_pagare.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				next
				w_ingresar_pagare.dw_seguro.accepttext()
			end if
			SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO")
			INTO			:ll_count
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
			if ll_count > 0 then
				DECLARE x5 CURSOR FOR  
				SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
								"SEGURO_ASOCIADOS"."ESTADO_REG"  
				FROM 		"SEGURO_ASOCIADOS"  
				WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING		sqlca;
				open x5;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						Fetch x5 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
						if not isnull(ll_cod_seguro) then
							if ll_estado_reg = 0 then
								ll_reg = w_ingresar_pagare.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_ingresar_pagare.dw_seguro.RowCount())
								if ll_reg > 0 then
									w_ingresar_pagare.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
								end if
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x5;
				w_ingresar_pagare.dw_seguro.accepttext()
			end if
			w_ingresar_pagare.dw_seguro.enabled				= true
			if w_ingresar_pagare.dw_pagare.getitemnumber(1,'nro_resc') = 99 then
				w_ingresar_pagare.cb_aceptar.enabled			= false
			else
				w_ingresar_pagare.cb_aceptar.enabled			= true
			end if
			w_ingresar_pagare.dw_pagare.setfocus()
			pb_cerrar.triggerevent(clicked!)	
		end if
//	end if
	
	elseif isvalid(w_ingresar_funeraria) then //Funeraria
		gi_numero															= dw_lista.getitemnumber(dw_lista.getrow(),'producto_anexo_numero')
		gs_serie 																= dw_lista.getitemstring(dw_lista.getrow(),'producto_anexo_serie')
		gs_base 																= dw_lista.getitemstring(dw_lista.getrow(),'cadena_codigo')
		gl_cod_parque														= dw_lista.getitemnumber(dw_lista.getrow(),'cadena_cod_parque')
		ls_uso																= dw_lista.getitemstring(dw_lista.getrow(),'producto_anexo_uso')
		ls_moneda															= dw_lista.getitemstring(dw_lista.getrow(),'producto_pago_moneda')
		idw_detalle2.retrieve(gl_cod_parque,ls_uso,gs_serie,ls_moneda)
		
		setnull(gs_age);setnull(gs_sup);setnull(gs_jefe)
		
		if w_ingresar_funeraria.dw_anexo_funeraria.Retrieve(gs_base,gs_serie,gi_numero)>0 then
			gs_age															= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_cod_agente')
			gs_sup															= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_cod_super')
			gs_jefe															= w_ingresar_funeraria.dw_anexo_funeraria.getitemstring(1,'producto_anexo_cod_jefe')
			w_ingresar_funeraria.cb_aceptar.text 					= "Actualizar"
			gi_rut 															= Long(dw_lista.GetItemNumber(dw_lista.getrow(), "cliente_rut"))
			w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1, 'estado_rut',0)
			w_ingresar_funeraria.dw_anexo_funeraria.setitem(1, 'estado_contrato',0)
			if w_ingresar_funeraria.dw_clientes.Retrieve(gi_rut)=0 then w_ingresar_funeraria.dw_clientes.insertrow(0)
			w_ingresar_funeraria.dw_anexo_funeraria.SetItem(1,"dv",upper(w_ingresar_funeraria.dw_clientes.GetItemstring(1,"dv")))
			w_ingresar_funeraria.em_dv.text							= upper(w_ingresar_funeraria.dw_clientes.GetItemstring(1,"dv"))
			w_ingresar_funeraria.em_rut.text							= string(gi_rut)
			w_ingresar_funeraria.em_numero.text					= string(gi_numero)
			w_ingresar_funeraria.em_serie.text						= gs_serie
			w_ingresar_funeraria.em_rut.enabled					= false
			w_ingresar_funeraria.em_dv.enabled						= false
			w_ingresar_funeraria.dw_anexo_funeraria.enabled	= true
			w_ingresar_funeraria.dw_anexo_funeraria.setfocus()
			gs_nueva_oferta												= 'N'
			w_ingresar_funeraria.dw_agente.setitem(1,'agente',gs_age)
			w_ingresar_funeraria.dw_supervisor.setitem(1,'supervisores',gs_sup)
			w_ingresar_funeraria.dw_jefe.setitem(1,'jefes',gs_jefe)
			ll_tot_reg														= w_ingresar_funeraria.dw_seguro.retrieve(ll_cod_parque,gs_base)
			if ll_tot_reg > 0 then
				for ll_indi=1 to ll_tot_reg
					w_ingresar_funeraria.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
				next
				w_ingresar_funeraria.dw_seguro.accepttext()
			end if
			SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO")
			INTO			:ll_count
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
			if ll_count > 0 then
				DECLARE x44 CURSOR FOR  
				SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
								"SEGURO_ASOCIADOS"."ESTADO_REG"  
				FROM 		"SEGURO_ASOCIADOS"  
				WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :gs_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :gs_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :gi_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING		sqlca;
				open x44;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						Fetch x44 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
						if not isnull(ll_cod_seguro) then
							if ll_estado_reg = 0 then
								ll_reg = w_ingresar_funeraria.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_ingresar_funeraria.dw_seguro.RowCount())
								if ll_reg > 0 then
									w_ingresar_funeraria.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
								end if
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x44;
				w_ingresar_funeraria.dw_seguro.accepttext()
			end if
			w_ingresar_funeraria.dw_seguro.enabled					= true
			if w_ingresar_funeraria.dw_anexo_funeraria.getitemnumber(1,'producto_anexo_nro_resc') = 99 then				
				ls_modifica			= 'N'
				w_ingresar_funeraria.dw_anexo_funeraria.setitem(1,'modifica',ls_modifica)
				w_ingresar_funeraria.dw_anexo_funeraria.accepttext()
//				w_ingresar_funeraria.cb_aceptar.enabled				= false
			else
				w_ingresar_funeraria.cb_aceptar.enabled				= true
			end if
			w_ingresar_funeraria.dw_anexo_funeraria.setfocus()
			pb_cerrar.triggerevent(clicked!)	
		END IF
	end if
end if
end event

