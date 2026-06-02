forward
global type w_resolver_contratos from window
end type
type cb_filtrar from commandbutton within w_resolver_contratos
end type
type cb_2 from commandbutton within w_resolver_contratos
end type
type cb_1 from commandbutton within w_resolver_contratos
end type
type cb_print from commandbutton within w_resolver_contratos
end type
type cb_marcar from commandbutton within w_resolver_contratos
end type
type cb_5 from commandbutton within w_resolver_contratos
end type
type cb_ver_cuenta_corriente from commandbutton within w_resolver_contratos
end type
type p_2 from picture within w_resolver_contratos
end type
type em_final from editmask within w_resolver_contratos
end type
type st_2 from statictext within w_resolver_contratos
end type
type p_1 from picture within w_resolver_contratos
end type
type em_desde from editmask within w_resolver_contratos
end type
type st_1 from statictext within w_resolver_contratos
end type
type cb_resolver from commandbutton within w_resolver_contratos
end type
type cb_cerrar from commandbutton within w_resolver_contratos
end type
type hpb_1 from hprogressbar within w_resolver_contratos
end type
type st_porc from statictext within w_resolver_contratos
end type
type pb_procesar from picturebutton within w_resolver_contratos
end type
type dw_seleccion from datawindow within w_resolver_contratos
end type
type dw_lista from datawindow within w_resolver_contratos
end type
type st_fondo from statictext within w_resolver_contratos
end type
type gb_1 from groupbox within w_resolver_contratos
end type
end forward

global type w_resolver_contratos from window
integer width = 3177
integer height = 2192
boolean titlebar = true
string title = "Resolver Contratos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
cb_2 cb_2
cb_1 cb_1
cb_print cb_print
cb_marcar cb_marcar
cb_5 cb_5
cb_ver_cuenta_corriente cb_ver_cuenta_corriente
p_2 p_2
em_final em_final
st_2 st_2
p_1 p_1
em_desde em_desde
st_1 st_1
cb_resolver cb_resolver
cb_cerrar cb_cerrar
hpb_1 hpb_1
st_porc st_porc
pb_procesar pb_procesar
dw_seleccion dw_seleccion
dw_lista dw_lista
st_fondo st_fondo
gb_1 gb_1
end type
global w_resolver_contratos w_resolver_contratos

type variables
String	is_base,is_fallecido,is_factura
Datetime	idt_fecha_hoy
Long		il_row
end variables

on w_resolver_contratos.create
this.cb_filtrar=create cb_filtrar
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_print=create cb_print
this.cb_marcar=create cb_marcar
this.cb_5=create cb_5
this.cb_ver_cuenta_corriente=create cb_ver_cuenta_corriente
this.p_2=create p_2
this.em_final=create em_final
this.st_2=create st_2
this.p_1=create p_1
this.em_desde=create em_desde
this.st_1=create st_1
this.cb_resolver=create cb_resolver
this.cb_cerrar=create cb_cerrar
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.pb_procesar=create pb_procesar
this.dw_seleccion=create dw_seleccion
this.dw_lista=create dw_lista
this.st_fondo=create st_fondo
this.gb_1=create gb_1
this.Control[]={this.cb_filtrar,&
this.cb_2,&
this.cb_1,&
this.cb_print,&
this.cb_marcar,&
this.cb_5,&
this.cb_ver_cuenta_corriente,&
this.p_2,&
this.em_final,&
this.st_2,&
this.p_1,&
this.em_desde,&
this.st_1,&
this.cb_resolver,&
this.cb_cerrar,&
this.hpb_1,&
this.st_porc,&
this.pb_procesar,&
this.dw_seleccion,&
this.dw_lista,&
this.st_fondo,&
this.gb_1}
end on

on w_resolver_contratos.destroy
destroy(this.cb_filtrar)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.cb_marcar)
destroy(this.cb_5)
destroy(this.cb_ver_cuenta_corriente)
destroy(this.p_2)
destroy(this.em_final)
destroy(this.st_2)
destroy(this.p_1)
destroy(this.em_desde)
destroy(this.st_1)
destroy(this.cb_resolver)
destroy(this.cb_cerrar)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.pb_procesar)
destroy(this.dw_seleccion)
destroy(this.dw_lista)
destroy(this.st_fondo)
destroy(this.gb_1)
end on

event open;Long	ll_new
Date	ld_fec_ini
gf_centrar(w_resolver_contratos)
if gs_depto='I' then
	cb_filtrar.visible	= true
else
	cb_filtrar.visible	= false
end if
dw_lista.settransobject(sqlca)
dw_seleccion.settransobject(sqlca)
ll_new						= dw_seleccion.insertrow(0)
dw_seleccion.setitem(ll_new,'base','O')
dw_seleccion.setitem(ll_new,'fallecido','S')
dw_seleccion.setitem(ll_new,'porce_factura','>')
idt_fecha_hoy				= datetime(date(gdt_fec_sistema),time('00:00:00'))
ld_fec_ini					= RelativeDate(date(idt_fecha_hoy),  - 180)
em_desde.text				= string(ld_fec_ini,"dd/mm/yyyy")
em_final.text				= string(idt_fecha_hoy,"dd/mm/yyyy")

end event

type cb_filtrar from commandbutton within w_resolver_contratos
integer x = 2313
integer y = 1932
integer width = 242
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()

end event

type cb_2 from commandbutton within w_resolver_contratos
integer x = 2025
integer y = 1932
integer width = 242
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
if dw_lista.rowcount()>0 then
	dw_paso	= dw_lista
	if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end if
end event

type cb_1 from commandbutton within w_resolver_contratos
integer x = 1531
integer y = 1932
integer width = 242
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_print from commandbutton within w_resolver_contratos
integer x = 1778
integer y = 1932
integer width = 242
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	dw_lista.object.datawindow.zoom	= 75
	f_Print( dw_lista )
	dw_lista.object.datawindow.zoom	= 100
end if
end event

type cb_marcar from commandbutton within w_resolver_contratos
integer x = 329
integer y = 1928
integer width = 421
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Marcar Todo"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_fila
String	ls_pagos

ll_tot_reg				= dw_lista.rowcount()
dw_lista.accepttext()
if ll_tot_reg>0 then
	if cb_marcar.text = 'Marcar Todo' then
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'estado_reg',0)
		next
		cb_marcar.text	= 'Desmarcar Todo'
	elseif cb_marcar.text = 'Desmarcar Todo' then
		for ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,'estado_reg',1)
		next
		cb_marcar.text	= 'Marcar Todo'
	end if
	dw_lista.accepttext()
	dw_lista.scrolltorow(1)
end if
end event

type cb_5 from commandbutton within w_resolver_contratos
integer x = 786
integer y = 1928
integer width = 256
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.rowcount()>0 then
	gs_base 					= dw_lista.GetItemString(il_row, "cadena_codigo")
	gs_serie 				= dw_lista.GetItemString(il_row, "cadena_serie")
	gi_numero 				= dw_lista.GetItemNumber(il_row, "cadena_numero")
	gi_rut 					= dw_lista.GetItemNumber(il_row, "cliente_rut")
	gs_apellido_paterno	= dw_lista.GetItemString(il_row, "cliente_a_paterno")
	gs_apellido_materno	= dw_lista.GetItemString(il_row, "cliente_a_materno")
	gs_nombres				= dw_lista.GetItemString(il_row, "cliente_nombre")
	gs_dv						= dw_lista.GetItemString(il_row, "cliente_dv")
	gs_estado				= dw_lista.GetItemString(il_row, "cadena_estado")
	gl_cod_parque_cta		= dw_lista.GetItemNumber(il_row, "cadena_cod_parque")
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_ver_cuenta_corriente from commandbutton within w_resolver_contratos
integer x = 1079
integer y = 1928
integer width = 407
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;if dw_lista.rowcount()>0 then
	gs_base 									= dw_lista.GetItemString(il_row, "cadena_codigo")
	gs_serie 								= dw_lista.GetItemString(il_row, "cadena_serie")
	gi_numero 								= dw_lista.GetItemNumber(il_row, "cadena_numero")
	gi_rut 									= dw_lista.GetItemNumber(il_row, "cliente_rut")
	gs_apellido_paterno					= dw_lista.GetItemString(il_row, "cliente_a_paterno")
	gs_apellido_materno					= dw_lista.GetItemString(il_row, "cliente_a_materno")
	gs_nombres								= dw_lista.GetItemString(il_row, "cliente_nombre")
	gs_dv										= dw_lista.GetItemString(il_row, "cliente_dv")
	gs_estado								= dw_lista.GetItemString(il_row, "cadena_estado")
	gl_cod_parque_cta					= dw_lista.GetItemNumber(il_row, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		CHOOSE CASE gs_base
			CASE "O" 	// Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" 	// Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "P" 	// Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" 	// Contrato ISA
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" 	// Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" 	// Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
			CASE "A"		// Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria)
		END CHOOSE
	end if
end if
end event

type p_2 from picture within w_resolver_contratos
integer x = 672
integer y = 128
integer width = 78
integer height = 88
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

type em_final from editmask within w_resolver_contratos
integer x = 311
integer y = 128
integer width = 352
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_2 from statictext within w_resolver_contratos
integer x = 18
integer y = 144
integer width = 288
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fec.hasta:"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_resolver_contratos
integer x = 672
integer y = 28
integer width = 78
integer height = 88
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

type em_desde from editmask within w_resolver_contratos
integer x = 311
integer y = 28
integer width = 352
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type st_1 from statictext within w_resolver_contratos
integer x = 18
integer y = 44
integer width = 288
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fec.Inicial:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_resolver from commandbutton within w_resolver_contratos
integer x = 41
integer y = 1928
integer width = 251
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Resolver"
end type

event clicked;String	ls_base,ls_serie
long		ll_fila,ll_tot_reg,ll_indi,ll_estado,ll_sum_item,ll_sum_graba
Datetime	ldt_fecha
Double	ll_numero
ldt_fecha					= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_tot_reg					= dw_lista.rowcount()
if ll_tot_reg>0 then
	ll_fila					= dw_lista.Find("estado_reg = 0", 1, ll_tot_reg)
	if ll_fila=0 then
		messagebox("Advertencia","Debe Marcar Contrato a Resolver")
	elseif ll_fila>0 then
		ll_sum_item			= 0
		ll_sum_graba		= 0
		for ll_indi=ll_fila to ll_tot_reg
			ll_estado		= dw_lista.getitemnumber(ll_indi,'estado_reg')
			if ll_estado=1 then
				ll_sum_item ++
				ls_base		= dw_lista.getitemstring(ll_indi,'cadena_codigo')
				ls_serie		= dw_lista.getitemstring(ll_indi,'cadena_serie')
				ll_numero	= dw_lista.getitemnumber(ll_indi,'cadena_numero')
				UPDATE	"CADENA"  
				SET 		"ESTADO" = 'R',   
							"FECHA_RES" = :ldt_fecha  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero )   
				USING		sqlca;
				if sqlca.sqlcode = 0 then
					ll_sum_graba ++
				end if
			end if
		next
		if ll_sum_item = ll_sum_graba then
			commit;
			if ll_sum_item = 1 then
				messagebox("Grabar","Grabación Exitosa, Fue Resuelto 1 Contrato")
			else
				messagebox("Grabar","Grabación Exitosa, Fueron Resueltos "+string(ll_sum_item,"###,###,###,###,###")+' Contratos')
			end if
			pb_procesar.triggerevent(clicked!)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar SQL:  "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_resolver_contratos
integer x = 2766
integer y = 1928
integer width = 325
integer height = 92
integer taborder = 140
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_resolver_contratos)
end event

type hpb_1 from hprogressbar within w_resolver_contratos
boolean visible = false
integer x = 914
integer y = 1040
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_resolver_contratos
boolean visible = false
integer x = 1454
integer y = 964
integer width = 233
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_procesar from picturebutton within w_resolver_contratos
integer x = 2944
integer y = 64
integer width = 146
integer height = 124
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date		ld_fecha_ini,ld_fecha_fin
Long		ll_tot_porc,ll_tot_porc_aux,ll_tot_reg,ll_indi,ll_count
String	ls_base,ls_serie,ls_glosa,ls_filtro,ls_titulo
Double	ldb_porce_pago,ll_numero

SetPointer(HourGlass!)
dw_seleccion.accepttext()
is_base										= dw_seleccion.getitemstring(1,'base')
is_fallecido								= dw_seleccion.getitemstring(1,'fallecido')
is_factura									= dw_seleccion.getitemstring(1,'porce_factura')
ld_fecha_ini								= date(em_desde.text)
ld_fecha_fin								= date(em_final.text)
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	if not isnull(is_base) and not isnull(is_fallecido) and not isnull(is_factura) then
		ls_filtro							= ''
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
		ll_tot_porc							= 0
		ll_tot_porc_aux					= 0			
		ll_tot_reg	= dw_lista.retrieve(is_base)
		hpb_1.Position						= ll_tot_porc
		if ll_tot_reg>0 then
			st_fondo.visible				= true
			hpb_1.visible 					= true
			st_porc.visible 				= true
			for ll_indi=1 to ll_tot_reg
				dw_lista.setitem(ll_indi,'estado_reg',1)
				ls_base						= dw_lista.getitemstring(ll_indi,'cadena_codigo')
				ls_serie						= dw_lista.getitemstring(ll_indi,'cadena_serie')
				ll_numero					= dw_lista.getitemnumber(ll_indi,'cadena_numero')
				SELECT	COUNT("INGRESO"."FOLIO")  
				INTO 		:ll_count  
				FROM 		"INGRESO"  
				WHERE  ( "INGRESO"."FECHA_PAGO" >= :ld_fecha_ini ) AND  
						 ( "INGRESO"."FECHA_PAGO" <= :ld_fecha_fin ) AND  
						 ( "INGRESO"."BASE" = :ls_base ) AND  
						 ( "INGRESO"."SERIE" = :ls_serie ) AND  
						 ( "INGRESO"."CONTRATO" = :ll_numero )   
				USING		sqlca;
				if ll_count>0 then
					dw_lista.setitem(ll_indi,'tiene_pagos','Si')
				else
					dw_lista.setitem(ll_indi,'tiene_pagos','No')
				end if
				SELECT	"FACTURA_OFERTA"."PORCENTAJE_PAGO"  
				INTO 		:ldb_porce_pago  
				FROM 		"FACTURA_OFERTA"  
				WHERE	 (	"FACTURA_OFERTA"."BASE" = :ls_base AND  
							"FACTURA_OFERTA"."SERIE" = :ls_serie AND  
							"FACTURA_OFERTA"."NUMERO" = :ll_numero AND  
							"FACTURA_OFERTA"."FECHA_CIERRE" = ( SELECT	MAX("FACTURA_OFERTA"."FECHA_CIERRE") 
																			FROM 		"FACTURA_OFERTA" 
																			WHERE  ( "FACTURA_OFERTA"."BASE" = :ls_base ) AND 
																					 ( "FACTURA_OFERTA"."SERIE" = :ls_serie ) AND 
																					 ( "FACTURA_OFERTA"."NUMERO" = :ll_numero ))) AND  
						 ( "FACTURA_OFERTA"."ESTADO" = 'N' OR  
							"FACTURA_OFERTA"."ESTADO" = 'S' OR  
							"FACTURA_OFERTA"."ESTADO" = 'R')   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					dw_lista.setitem(ll_indi,'porce_facturado',ldb_porce_pago)
				else
					dw_lista.setitem(ll_indi,'porce_facturado',0)
				end if
				SELECT	Count("ATENCION_LOG"."RUT")  
				INTO 		:ll_count  
				FROM 		"ATENCION_LOG"  
				WHERE  ( "ATENCION_LOG"."BASE" = :ls_base ) AND  
						 ( "ATENCION_LOG"."SERIE" = :ls_serie ) AND  
						 ( "ATENCION_LOG"."NUMERO" = :ll_numero ) AND  
						 ( "ATENCION_LOG"."FECHA" >= :ld_fecha_ini ) AND  
						 ( "ATENCION_LOG"."FECHA" <= :ld_fecha_fin )   
				USING		sqlca;
				if ll_count>0 then
					if ll_count=1 then
						SELECT	"ATENCION_LOG"."GLOSA"  
						INTO 		:ls_glosa  
						FROM 		"ATENCION_LOG"  
						WHERE  ( "ATENCION_LOG"."BASE" = :ls_base ) AND  
								 ( "ATENCION_LOG"."SERIE" = :ls_serie ) AND  
								 ( "ATENCION_LOG"."NUMERO" = :ll_numero ) AND  
								 ( "ATENCION_LOG"."FECHA" = (	SELECT	MAX( "ATENCION_LOG"."FECHA" ) 
																		FROM 		"ATENCION_LOG" 
																		WHERE  ( "ATENCION_LOG"."BASE" = :ls_base ) AND 
																				 ( "ATENCION_LOG"."SERIE" = :ls_serie ) AND 
																				 ( "ATENCION_LOG"."NUMERO" = :ll_numero ) ) )   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							dw_lista.setitem(ll_indi,'tiene_at_cliente',ls_glosa)
						end if
					else
						dw_lista.setitem(ll_indi,'tiene_at_cliente','Tiene '+string(ll_count)+' Registros')
					end if
				else
					dw_lista.setitem(ll_indi,'tiene_at_cliente','No Tiene')
				end if
				dw_lista.scrolltorow(ll_indi)
				if ll_tot_porc <> ll_tot_porc_aux then 
					st_porc.text			= string(ll_tot_porc)+" %"
					ll_tot_porc_aux		= ll_tot_porc
				end if
				ll_tot_porc					= (ll_indi / ll_tot_reg) * 100
				hpb_1.Position 			= ll_tot_porc
			next
			dw_lista.accepttext()
			st_fondo.visible				= false
			hpb_1.visible 					= false
			st_porc.visible 				= false
			dw_lista.scrolltorow(1)
			CHOOSE CASE is_base
				CASE 'O'
					ls_titulo				= 'Promesas Resueltas al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
				CASE 'L'
					ls_titulo				= 'Liberadores Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
				CASE 'A'
					ls_titulo				= 'Aumento Cap. Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
				CASE 'R'
					ls_titulo				= 'Reprog.de Ctas.Mant. Resueltas al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
				CASE 'P'
					ls_titulo				= 'Pagaré Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
				CASE 'D'
					ls_titulo				= 'Derecho Especial Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
			END CHOOSE
			if ll_tot_reg>0 then
				if is_fallecido='S' and is_factura='>' then
					ls_titulo				= ls_titulo+', con Fallecidos y % Fact. Mayor al 8'
					ls_filtro				= 'cadena_mora_fallecidos > 0 and porce_facturado > 8 and tiene_pagos = "No"'
				elseif is_fallecido='S' and is_factura='<' then
					ls_titulo				= ls_titulo+', con Fallecidos y % Fact. Menor al 8'
					ls_filtro				= 'cadena_mora_fallecidos > 0 and porce_facturado <= 8 and tiene_pagos = "No"'
				elseif is_fallecido='N' and is_factura='>' then
					ls_titulo				= ls_titulo+', sin Fallecido y % Fact. Mayor al 8'
					ls_filtro				= 'cadena_mora_fallecidos = 0 and porce_facturado > 8 and tiene_pagos = "No"'
				elseif is_fallecido='N' and is_factura='<' then
					ls_titulo				= ls_titulo+', sin Fallecido y % Fact. Menor al 8'
					ls_filtro				= 'cadena_mora_fallecidos = 0 and porce_facturado <= 8 and tiene_pagos = "No"'
				end if
				dw_lista.object.t_titulo.text	= ls_titulo
				dw_lista.object.t_rango_fecha.text	= 'Fecha del ' +string(em_desde.text)+' al '+string(em_final.text)
				dw_lista.SETfilter(ls_filtro)
				dw_lista.filter()
				dw_lista.accepttext()
				if dw_lista.rowcount()=0 then	
					dw_lista.object.t_registro.text	= 'No Registra Dato'
				else
					dw_lista.object.t_registro.text	= ''
				end if
			end if
		end if
	else
		if isnull(is_base) or is_base='' then
			messagebox("Advertencia","Debe Seleccionar Base")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('base')
		elseif isnull(is_fallecido) or is_fallecido='' then
			messagebox("Advertencia","Debe Seleccionar Con o Sin Fallecido")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('fallecido')
		elseif isnull(is_factura) or is_factura='' then
			messagebox("Advertencia","Debe Seleccionar Mayor o Menor al 8% Facturado")
			dw_seleccion.setfocus()
			dw_seleccion.setcolumn('porce_factura')
		end if
	end if
end if
SetPointer(Arrow!)
end event

type dw_seleccion from datawindow within w_resolver_contratos
integer x = 800
integer y = 4
integer width = 2126
integer height = 216
integer taborder = 30
string dataobject = "dwe_select_resolver_ctto"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_fallecido,ls_porce_factura,ls_filtro,ls_base,ls_titulo
Long		ll_tot_reg

dw_seleccion.accepttext()
ls_columna				= dwo.name
if ls_columna='base' then
	dw_lista.reset()

elseif ls_columna='fallecido' then
	ls_filtro			= ''
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.accepttext()
	ll_tot_reg			= dw_lista.rowcount()
	ls_fallecido		= data
	ls_porce_factura	= dw_seleccion.getitemstring(1,'porce_factura')
	ls_base				= dw_seleccion.getitemstring(1,'base')
	CHOOSE CASE ls_base
		CASE 'O'
			ls_titulo	= 'Promesas Resueltas al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'L'
			ls_titulo	= 'Liberadores Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'A'
			ls_titulo	= 'Aumento Cap. Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'R'
			ls_titulo	= 'Reprog.de Ctas.Mant. Resueltas al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'P'
			ls_titulo	= 'Pagaré Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'D'
			ls_titulo	= 'Derecho Especial Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
	END CHOOSE
	if ll_tot_reg>0 then
		if ls_fallecido='S' and ls_porce_factura='>' then
			ls_titulo	= ls_titulo+', con Fallecidos y % Fact. Mayor al 8'
			ls_filtro	= 'cadena_mora_fallecidos > 0 and porce_facturado > 8 and tiene_pagos = "No"'
		elseif ls_fallecido='S' and ls_porce_factura='<' then
			ls_titulo	= ls_titulo+', con Fallecidos y % Fact. Menor al 8'
			ls_filtro	= 'cadena_mora_fallecidos > 0 and porce_facturado <= 8 and tiene_pagos = "No"'
		elseif ls_fallecido='N' and ls_porce_factura='>' then
			ls_titulo	= ls_titulo+', sin Fallecido y % Fact. Mayor al 8'
			ls_filtro	= 'cadena_mora_fallecidos = 0 and porce_facturado > 8 and tiene_pagos = "No"'
		elseif ls_fallecido='N' and ls_porce_factura='<' then
			ls_titulo	= ls_titulo+', sin Fallecido y % Fact. Menor al 8'
			ls_filtro	= 'cadena_mora_fallecidos = 0 and porce_facturado <= 8 and tiene_pagos = "No"'
		end if
		dw_lista.object.t_titulo.text	= ls_titulo
		dw_lista.object.t_rango_fecha.text	= 'Fecha del ' +string(em_desde.text)+' al '+string(em_final.text)
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
		if dw_lista.rowcount()=0 then	
			dw_lista.object.t_registro.text	= 'No Registra Dato'
		else
			dw_lista.object.t_registro.text	= ''
		end if
	end if

elseif ls_columna='porce_factura' then
	ls_filtro			= ''
	dw_lista.SETfilter(ls_filtro)
	dw_lista.filter()
	dw_lista.accepttext()
	ll_tot_reg			= dw_lista.rowcount()
	ls_fallecido		= dw_seleccion.getitemstring(1,'fallecido')
	ls_porce_factura	= data
	ls_base				= dw_seleccion.getitemstring(1,'base')
	CHOOSE CASE ls_base
		CASE 'O'
			ls_titulo	= 'Promesas Resueltas al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'L'
			ls_titulo	= 'Liberadores Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'A'
			ls_titulo	= 'Aumento Cap. Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'R'
			ls_titulo	= 'Reprog.de Ctas.Mant. Resueltas al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'P'
			ls_titulo	= 'Pagaré Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
		CASE 'D'
			ls_titulo	= 'Derecho Especial Resueltos al día '+string(idt_fecha_hoy,"dd/mm/yyyy")
	END CHOOSE
	if ll_tot_reg>0 then
		if ls_fallecido='S' and ls_porce_factura='>' then
			ls_titulo	= ls_titulo+', con Fallecidos y % Fact. Mayor al 8'
			ls_filtro	= 'cadena_mora_fallecidos > 0 and porce_facturado > 8 and tiene_pagos = "No"'
		elseif ls_fallecido='S' and ls_porce_factura='<' then
			ls_titulo	= ls_titulo+', con Fallecidos y % Fact. Menor al 8'
			ls_filtro	= 'cadena_mora_fallecidos > 0 and porce_facturado <= 8 and tiene_pagos = "No"'
		elseif ls_fallecido='N' and ls_porce_factura='>' then
			ls_titulo	= ls_titulo+', sin Fallecido y % Fact. Mayor al 8'
			ls_filtro	= 'cadena_mora_fallecidos = 0 and porce_facturado > 8 and tiene_pagos = "No"'
		elseif ls_fallecido='N' and ls_porce_factura='<' then
			ls_titulo	= ls_titulo+', sin Fallecido y % Fact. Menor al 8'
			ls_filtro	= 'cadena_mora_fallecidos = 0 and porce_facturado <= 8 and tiene_pagos = "No"'
		end if
		dw_lista.object.t_titulo.text	= ls_titulo
		dw_lista.object.t_rango_fecha.text	= 'Fecha del ' +string(em_desde.text)+' al '+string(em_final.text)
		dw_lista.SETfilter(ls_filtro)
		dw_lista.filter()
		dw_lista.accepttext()
		if dw_lista.rowcount()=0 then	
			dw_lista.object.t_registro.text	= 'No Registra Dato'
		else
			dw_lista.object.t_registro.text	= ''
		end if
	end if
end if
end event

type dw_lista from datawindow within w_resolver_contratos
integer x = 41
integer y = 240
integer width = 3049
integer height = 1636
integer taborder = 50
string dataobject = "dw_lista_para_resolver"
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

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event doubleclicked;if row>0 then
	il_row	= row
	cb_5.triggerevent(clicked!)
end if
end event

type st_fondo from statictext within w_resolver_contratos
boolean visible = false
integer x = 882
integer y = 936
integer width = 1431
integer height = 192
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 12632256
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_resolver_contratos
integer x = 1509
integer y = 1884
integer width = 782
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

