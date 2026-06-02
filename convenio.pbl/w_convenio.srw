forward
global type w_convenio from window
end type
type dw_imprimir_convenio_conv from datawindow within w_convenio
end type
type cb_prin_conv from commandbutton within w_convenio
end type
type cb_mantenedor from commandbutton within w_convenio
end type
type p_ini from picture within w_convenio
end type
type em_fecha from editmask within w_convenio
end type
type st_2 from statictext within w_convenio
end type
type rb_parque_santiago from radiobutton within w_convenio
end type
type dw_imprimir_convenio from datawindow within w_convenio
end type
type cb_imprimir_carta from commandbutton within w_convenio
end type
type cb_grabar from commandbutton within w_convenio
end type
type cb_exportar from commandbutton within w_convenio
end type
type cb_2 from commandbutton within w_convenio
end type
type cb_3 from commandbutton within w_convenio
end type
type cb_4 from commandbutton within w_convenio
end type
type rb_promesa from radiobutton within w_convenio
end type
type rb_pagare from radiobutton within w_convenio
end type
type cb_procesar from commandbutton within w_convenio
end type
type cb_cerrar from commandbutton within w_convenio
end type
type dw_convenio from datawindow within w_convenio
end type
type gb_2 from groupbox within w_convenio
end type
end forward

global type w_convenio from window
integer width = 4005
integer height = 2276
boolean titlebar = true
string title = "Convenio"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
dw_imprimir_convenio_conv dw_imprimir_convenio_conv
cb_prin_conv cb_prin_conv
cb_mantenedor cb_mantenedor
p_ini p_ini
em_fecha em_fecha
st_2 st_2
rb_parque_santiago rb_parque_santiago
dw_imprimir_convenio dw_imprimir_convenio
cb_imprimir_carta cb_imprimir_carta
cb_grabar cb_grabar
cb_exportar cb_exportar
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
rb_promesa rb_promesa
rb_pagare rb_pagare
cb_procesar cb_procesar
cb_cerrar cb_cerrar
dw_convenio dw_convenio
gb_2 gb_2
end type
global w_convenio w_convenio

type variables
long	il_row
end variables

on w_convenio.create
this.dw_imprimir_convenio_conv=create dw_imprimir_convenio_conv
this.cb_prin_conv=create cb_prin_conv
this.cb_mantenedor=create cb_mantenedor
this.p_ini=create p_ini
this.em_fecha=create em_fecha
this.st_2=create st_2
this.rb_parque_santiago=create rb_parque_santiago
this.dw_imprimir_convenio=create dw_imprimir_convenio
this.cb_imprimir_carta=create cb_imprimir_carta
this.cb_grabar=create cb_grabar
this.cb_exportar=create cb_exportar
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.rb_promesa=create rb_promesa
this.rb_pagare=create rb_pagare
this.cb_procesar=create cb_procesar
this.cb_cerrar=create cb_cerrar
this.dw_convenio=create dw_convenio
this.gb_2=create gb_2
this.Control[]={this.dw_imprimir_convenio_conv,&
this.cb_prin_conv,&
this.cb_mantenedor,&
this.p_ini,&
this.em_fecha,&
this.st_2,&
this.rb_parque_santiago,&
this.dw_imprimir_convenio,&
this.cb_imprimir_carta,&
this.cb_grabar,&
this.cb_exportar,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.rb_promesa,&
this.rb_pagare,&
this.cb_procesar,&
this.cb_cerrar,&
this.dw_convenio,&
this.gb_2}
end on

on w_convenio.destroy
destroy(this.dw_imprimir_convenio_conv)
destroy(this.cb_prin_conv)
destroy(this.cb_mantenedor)
destroy(this.p_ini)
destroy(this.em_fecha)
destroy(this.st_2)
destroy(this.rb_parque_santiago)
destroy(this.dw_imprimir_convenio)
destroy(this.cb_imprimir_carta)
destroy(this.cb_grabar)
destroy(this.cb_exportar)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.rb_promesa)
destroy(this.rb_pagare)
destroy(this.cb_procesar)
destroy(this.cb_cerrar)
destroy(this.dw_convenio)
destroy(this.gb_2)
end on

event open;date		ldt_fecha_hoy
double	ldb_valor_uf_dia
Long		ll_mes,ll_dia_fin,ll_anno,ll_dia

cb_grabar.enabled			= false
gf_centrar(w_convenio)
dw_convenio.dataobject	= 'dw_convenio'
dw_convenio.settransobject(sqlca)
dw_imprimir_convenio.settransobject(sqlca)
dw_imprimir_convenio_conv.settransobject(sqlca)
rb_pagare.checked 	= true
ldt_fecha_hoy			= date(gdt_fec_sistema)
ll_anno					= year(ldt_fecha_hoy)
ll_mes					= month(ldt_fecha_hoy)
ll_dia					= day(ldt_fecha_hoy)
if ll_mes = 2 then
	if int(ll_anno/4) = (ll_anno/4) then 
		ll_dia		= 29
	else
		ll_dia      = 28
	end if
elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
	ll_dia			= 30
else
	ll_dia			= 31
end if
em_fecha.text		= string(ll_dia,'00')+'/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
//CHOOSE CASE ll_mes
//	CASE 1
//		ll_dia_fin	= 31
//	CASE 2
//		ll_dia_fin	= 28
//	CASE 3
//		ll_dia_fin	= 31
//	CASE 4
//		ll_dia_fin	= 30
//	CASE 5
//		ll_dia_fin	= 31
//	CASE 6
//		ll_dia_fin	= 30
//	CASE 7
//		ll_dia_fin	= 31
//	CASE 8
//		ll_dia_fin	= 31
//	CASE 9
//		ll_dia_fin	= 30
//	CASE 10
//		ll_dia_fin	= 31
//	CASE 11
//		ll_dia_fin	= 30
//	CASE 12
//		ll_dia_fin	= 31
//END CHOOSE
//
//
end event

type dw_imprimir_convenio_conv from datawindow within w_convenio
boolean visible = false
integer x = 1143
integer y = 2092
integer width = 571
integer height = 100
string title = "none"
string dataobject = "dw_imprimir_convenio_detalle"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_prin_conv from commandbutton within w_convenio
integer x = 1280
integer y = 1964
integer width = 485
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir * Convenio"
end type

event clicked;long 		ll_cod_convenio, ll_tot_reg
string 	ls_estado_impresion
datetime ldt_fecha_pago

ll_tot_reg					= dw_convenio.RowCount()
if ll_tot_reg > 0 then
	ldt_fecha_pago			= datetime(date(em_fecha.text))
	if dw_convenio.dataobject='dw_lista_convenio_existente' then
		ll_cod_convenio	= dw_convenio.getitemnumber(il_row,'cod_convenio')
	elseif dw_convenio.dataobject='dw_convenio' then
		ll_cod_convenio	= dw_convenio.getitemnumber(il_row,'convenio_retiro_cod_convenio')
	end if
	
	
	if dw_imprimir_convenio_conv.retrieve(ldt_fecha_pago,ll_cod_convenio) > 0 then
		f_Print( dw_imprimir_convenio_conv )
		UPDATE	"CONVENIO"  
		SET 		"ESTADO_IMPRESION" = 'I'  
		WHERE 	"CONVENIO"."COD_CONVENIO" = :ll_cod_convenio and
					"CONVENIO"."FECHA_PAGO" = :ldt_fecha_pago  
		USING   sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
		else
			rollback using sqlca;
		end if
	else
		messagebox("Advertencia","No registra Dato, recuerde Grabar antes de Imprimir")
	end if
else
	messagebox('Advertencia','No Registra Dato')
end if
end event

type cb_mantenedor from commandbutton within w_convenio
integer x = 1865
integer y = 1964
integer width = 503
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Mantenedor Convenio"
end type

event clicked;if isvalid(w_mantenedor_convenio_stgo) then close(w_mantenedor_convenio_stgo)
open(w_mantenedor_convenio_stgo)
end event

type p_ini from picture within w_convenio
integer x = 795
integer y = 48
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
Date		ldt_fecha_hoy
Long		ll_anno,ll_mes,ll_dia_fin,ll_dia

ls_fecha					= trim(em_fecha.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fecha.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
dw_convenio.reset()
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	ldt_fecha_hoy		= date(ls_fecha)
	ll_anno				= year(ldt_fecha_hoy)
	ll_mes				= month(ldt_fecha_hoy)
	ll_dia				= day(ldt_fecha_hoy)
	if ll_mes = 2 then
		if int(ll_anno/4) = (ll_anno/4) then 
			ll_dia		= 29
		else
		  	ll_dia      = 28
		end if
	elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
		ll_dia			= 30
	else
		ll_dia			= 31
	end if
	em_fecha.text		= string(ll_dia,'00')+'/'+string(ll_mes,'00')+'/'+string(ll_anno,'0000')
END IF
em_fecha.setfocus()
//	CHOOSE CASE ll_mes
//		CASE 1
//			ll_dia_fin	= 31
//		CASE 2
//			ll_dia_fin	= 28
//		CASE 3
//			ll_dia_fin	= 31
//		CASE 4
//			ll_dia_fin	= 30
//		CASE 5
//			ll_dia_fin	= 31
//		CASE 6
//			ll_dia_fin	= 30
//		CASE 7
//			ll_dia_fin	= 31
//		CASE 8
//			ll_dia_fin	= 31
//		CASE 9
//			ll_dia_fin	= 30
//		CASE 10
//			ll_dia_fin	= 31
//		CASE 11
//			ll_dia_fin	= 30
//		CASE 12
//			ll_dia_fin	= 31
//	END CHOOSE

end event

type em_fecha from editmask within w_convenio
integer x = 421
integer y = 48
integer width = 370
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_2 from statictext within w_convenio
integer x = 46
integer y = 60
integer width = 370
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Proceso"
boolean focusrectangle = false
end type

type rb_parque_santiago from radiobutton within w_convenio
boolean visible = false
integer x = 2912
integer y = 60
integer width = 1010
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Convenio Parque Santiago"
boolean automatic = false
end type

event clicked;dw_convenio.reset()
end event

type dw_imprimir_convenio from datawindow within w_convenio
boolean visible = false
integer x = 430
integer y = 2096
integer width = 571
integer height = 100
string title = "none"
string dataobject = "dw_imprimir_convenio"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir_carta from commandbutton within w_convenio
integer x = 786
integer y = 1964
integer width = 393
integer height = 112
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir Carta"
end type

event clicked;long 		ll_cod_convenio, ll_tot_reg
string 	ls_estado_impresion
datetime ldt_fecha_pago

ll_tot_reg				= dw_convenio.RowCount()
if ll_tot_reg > 0 then
	ldt_fecha_pago		= datetime(date(em_fecha.text))
	if dw_imprimir_convenio.retrieve(ldt_fecha_pago) > 0 then
		f_Print( dw_imprimir_convenio)
		UPDATE	"CONVENIO"  
		SET 		"ESTADO_IMPRESION" = 'I'  
		WHERE 	"CONVENIO"."FECHA_PAGO" = :ldt_fecha_pago  
		USING   sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
		else
			rollback using sqlca;
		end if
	else
		messagebox("Advertencia","No registra Dato, recuerde Grabar antes de Imprimir")
	end if
else
	messagebox('Advertencia','No Registra Dato')
end if
end event

type cb_grabar from commandbutton within w_convenio
integer x = 407
integer y = 1964
integer width = 279
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string ls_nombre,ls_apellido_pat,ls_apellido_mat,ls_serie,ls_fecha,ls_est_grabacion
long  		ll_rut,ll_valor_cuota,ll_cod_convenio,ll_resp,tot_reg,ll_indi,ll_cod_parque,ll_plazo,&
			ll_coutas_pag,ll_cuotas_pag_isa,ll_cuotas_pag_la,ll_dia,ll_mes,ll_anno,ll_meses,ll_dia_fin,&
			ll_cta_pag
datetime ldt_fecha_hoy,ldt_fecha_pago,ldt_fecha_cobro,ldt_fecha_prim
date		ld_fecha
Double	ll_numero

tot_reg					= dw_convenio.RowCount()
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
if tot_reg > 0 then
	ll_resp = MessageBox('Actualizar', "Desea Grabar Convenios", Question!, YesNo!, 2)
	if ll_resp = 1 THEN
		for ll_indi = 1 to tot_reg
			ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
			ll_anno					= year(date(ldt_fecha_hoy))
			ll_mes					= month(date(gdt_fec_sistema))
			ll_dia					= day(date(ldt_fecha_hoy))
			
			if ll_mes = 2 then
				if int(ll_anno/4) = (ll_anno/4) then 
					ll_dia		= 29
				else
					ll_dia      = 28
				end if
			elseif ll_mes = 4 or ll_mes = 6 or ll_mes = 9 or ll_mes = 11 then
				ll_dia			= 30
			else
				ll_dia			= 31
			end if
					
			ls_serie					= dw_convenio.GetItemString(ll_indi,'pagare_serie_p')
			ll_numero				= dw_convenio.GetItemNumber(ll_indi,'pagare_nro_pagare')
			ll_rut					= dw_convenio.GetItemNumber(ll_indi,'contrato_rut')
			ls_nombre				= dw_convenio.GetItemString(ll_indi,'cliente_nombre')
			ls_apellido_pat		= dw_convenio.GetItemString(ll_indi,'cliente_a_paterno')
			ls_apellido_mat		= dw_convenio.GetItemString(ll_indi,'cliente_a_materno')
			ll_valor_cuota			= dw_convenio.GetItemNumber(ll_indi,'c_valor_cuota')
			ldt_fecha_pago			= dw_convenio.GetItemdatetime(ll_indi,'c_fecha_vcto')
			ldt_fecha_prim			= dw_convenio.GetItemdatetime(ll_indi,'pagare_fecha_prim')
			//ll_meses					= dw_convenio.GetItemnumber(ll_indi,'c_n_cuota')
			ll_cta_pag				= dw_convenio.GetItemnumber(ll_indi,'c_n_cuota')
			
			ls_fecha 				= (string(ll_dia,'00')+'/'+ string(ll_mes,'00')+'/'+ string(ll_anno,'0000'))
			ldt_fecha_cobro		= datetime(date(ls_fecha))
			ll_cod_convenio		= dw_convenio.GetItemNumber(ll_indi,'convenio_retiro_cod_convenio')
			ll_cod_parque			= dw_convenio.GetItemNumber(ll_indi,'contrato_parque')
			ll_plazo					= dw_convenio.GetItemNumber(ll_indi,'pagare_plazo')
			ll_cuotas_pag_isa		= dw_convenio.GetItemNumber(ll_indi,'c_cuotas_isa_la')
			ls_est_grabacion		= 'S'

			INSERT INTO "CONVENIO"  
						( "SERIE",		"NUMERO",	"RUT",	"NOMBRE",	"AP_PATERNO",		"AP_MATERNO",		"FECHA_PAGO",		"VALOR_CUOTA",		"COD_CONVENIO",		"FECHA_ENVIO_CARTA", "COD_PARQUE",		"PLAZO",		"CUOTAS_PAG", "ESTADO_GRABACION",	"USUARIO")  
			VALUES 	( :ls_serie,	:ll_numero,	:ll_rut,	:ls_nombre,	:ls_apellido_pat,	:ls_apellido_mat,	:ldt_fecha_pago,	:ll_valor_cuota,	:ll_cod_convenio,		:ldt_fecha_hoy,		:ll_cod_parque,	:ll_plazo,	:ll_cta_pag,		:ls_est_grabacion,	:gs_user)	
			USING   sqlca;
		next
		if sqlca.sqlcode = 0 then
			commit using sqlca;
			messagebox("Grabar","Grabación Exitosa",Exclamation!)
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Convenio SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if


end event

type cb_exportar from commandbutton within w_convenio
integer x = 2674
integer y = 1984
integer width = 219
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;if dw_convenio.rowcount() > 0 then
	f_DWToExcel( dw_convenio)
end if
end event

type cb_2 from commandbutton within w_convenio
integer x = 2894
integer y = 1984
integer width = 210
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_convenio.SETSORT(NULO)
dw_convenio.SORT()

end event

type cb_3 from commandbutton within w_convenio
integer x = 3104
integer y = 1984
integer width = 169
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string ls_texto
setnull (ls_texto)
dw_convenio.SETfilter(ls_texto)
dw_convenio.filter()
end event

type cb_4 from commandbutton within w_convenio
integer x = 3273
integer y = 1984
integer width = 201
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

event clicked;if dw_convenio.rowcount() > 0 then 
	f_Print( dw_convenio )
end if
end event

type rb_promesa from radiobutton within w_convenio
boolean visible = false
integer x = 2322
integer y = 60
integer width = 402
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Promesa"
boolean automatic = false
end type

event clicked;dw_convenio.reset()
end event

type rb_pagare from radiobutton within w_convenio
boolean visible = false
integer x = 1733
integer y = 60
integer width = 402
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Pagare"
boolean automatic = false
end type

event clicked;dw_convenio.reset()
end event

type cb_procesar from commandbutton within w_convenio
integer x = 27
integer y = 1964
integer width = 279
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar"
end type

event clicked;long		tot_reg,ll_indi,ll_plazo,ll_meses,ll_count,ll_res,ll_meses_cal,ll_nulo,ll_cta_pag,ll_cta_pag_isa,ll_cta_pag_la
datetime ldt_fecha_hoy,ldt_fecha_prim,ldt_fecha_max
double	ldb_valor_uf_dia,ldb_prima,ldb_valor_cta,ll_suma_cta,ldb_count,ll_numero
String		ls_pasa,ls_serie,ls_base,ls_moneda_ctto,ls_moneda_p

Setnull(ll_nulo)
dw_convenio.reset()
ldt_fecha_hoy	= datetime(date(em_fecha.text),time('00:00:00'))
ls_pasa			= 'S'
SELECT	MAX("CONVENIO"."FECHA_PAGO")  
INTO 		:ldt_fecha_max  
FROM 	"CONVENIO"  ;

if ldt_fecha_hoy >= ldt_fecha_max then
	SELECT	Count("CONVENIO"."SERIE")  
	INTO 		:ll_count  
	FROM 	"CONVENIO"  
	WHERE 	"CONVENIO"."FECHA_PAGO" = :ldt_fecha_hoy   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		if ll_count > 0 then
			ll_res	= messagebox("Advertencia","Fecha Proceso "+string(ldt_fecha_hoy,'dd/mm/yyyy')+ ", Ya Existe... Desea Re-Procesar",Exclamation!,YesNo!,2)
			if ll_res = 1 then
				DELETE FROM "CONVENIO"  
				WHERE			"CONVENIO"."FECHA_PAGO" = :ldt_fecha_hoy   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ls_pasa	= 'S'
				else
					ls_pasa	= 'N'
					rollback;
					messagebox("Error Eliminar","Error al Eliminar Proceso del "+string(ldt_fecha_hoy,'dd/mm/yyyy')+" SQL: "+sqlca.sqlerrtext )
				end if
			else
				ls_pasa	= 'N'
				dw_convenio.dataobject	= 'dw_lista_convenio_existente'
				dw_convenio.settransobject(sqlca)
				dw_convenio.retrieve(ldt_fecha_hoy,gdt_fec_sistema)
			end if
		end if
	end if
	if ls_pasa='S' then
		cb_grabar.enabled			= true
		SELECT		MAX("TAB_UF"."VALOR_UF")  
		INTO 			:ldb_valor_uf_dia  
		FROM 		"TAB_UF"  
		WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy
		USING		sqlca;
		if sqlca.sqlcode<>0 or isnull(ldb_valor_uf_dia) or ldb_valor_uf_dia=0 then
			SELECT		MAX("TAB_UF"."VALOR_UF")  
			INTO 			:ldb_valor_uf_dia  
			FROM 		"TAB_UF"  
			USING		sqlca;
		end if
		if rb_pagare.checked=true then
			dw_convenio.dataobject	= 'dw_convenio'
			dw_convenio.settransobject(sqlca)
			tot_reg					= dw_convenio.retrieve(ldb_valor_uf_dia,ldt_fecha_hoy,gdt_fec_sistema)
			if tot_reg > 0 then
				dw_imprimir_convenio.retrieve(ldt_fecha_hoy,gdt_fec_sistema)
				for ll_indi = 1 to tot_reg
					ls_serie			= dw_convenio.GetItemstring(ll_indi,'pagare_serie_p')
					ll_numero		= dw_convenio.GetItemNumber(ll_indi,'pagare_nro_pagare')
					ldt_fecha_prim	= dw_convenio.GetItemdatetime(ll_indi,'pagare_fecha_prim')
					ll_plazo			= dw_convenio.GetItemNumber(ll_indi,'pagare_plazo')
					
//					ll_meses_cal  	= f_calculo_meses(ldt_fecha_prim,ldt_fecha_hoy)
//					if ll_meses_cal > ll_plazo then
//						ll_meses		= 0
//					else
//						ll_meses		= ll_meses_cal + 1
////						if ls_serie='T' and ll_numero=159845 then //excepcion
////							ll_meses	= ll_meses - 1
////						end if
//						if ll_meses > ll_plazo then
//							ll_meses	= ll_plazo
//						else
//							ll_meses	= ll_meses
//						end if
//					end if
					ls_base				= dw_convenio.getitemstring(ll_indi,'c_base')
					ls_moneda_p		= dw_convenio.getitemstring(ll_indi,'pagare_moneda')
					ldb_valor_cta		= dw_convenio.getitemnumber(ll_indi,'pagare_valor_cuo')
					
					SELECT 	SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
					INTO 		:ldb_count  
					FROM     "SEGURO_ASOCIADOS"  
					WHERE 	( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
								( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
								( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
								( "SEGURO_ASOCIADOS"."ESTADO_REG" = 0 ) AND  
								( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )  AND 
								 ( "SEGURO_ASOCIADOS"."MONTO_PRIMA" > 0 )
					USING	sqlca;
					if ldb_count > 0 then
						ll_suma_cta					= ldb_count + ldb_valor_cta
						dw_convenio.setitem(ll_indi,'pagare_valor_cuo',ll_suma_cta)
						dw_convenio.accepttext()
					end if
					if ls_base = 'O' then
						SELECT 	"OFERTA_V"."CTA_PAG_S"  
						INTO 		:ll_cta_pag  
						FROM 	"OFERTA_V"  
						WHERE 	( "OFERTA_V"."BASE" = :ls_base ) AND  
									( "OFERTA_V"."SERIE" = :ls_serie ) AND  
									( "OFERTA_V"."NRO_OFERTA" = :ll_numero )
						USING	sqlca;
					elseif ls_base = 'P' then
						SELECT 	"PAGARE"."CTA_PAG_ISA",   
									"PAGARE"."CTA_PAG_LA"  
						INTO 		:ll_cta_pag_isa,:ll_cta_pag_la  
						FROM		"PAGARE"  
						WHERE 	( "PAGARE"."SERIE_P" = :ls_serie ) AND  
									( "PAGARE"."NRO_PAGARE" = :ll_numero )
						USING	sqlca;
						ll_cta_pag	= ll_cta_pag_isa + ll_cta_pag_la
					elseif ls_base = 'F' then	
					end if
					if isnull(ll_cta_pag) then ll_cta_pag = 0
					ll_cta_pag = ll_cta_pag +1	
					dw_convenio.setitem(ll_indi,'c_n_cuota',ll_cta_pag)
					//dw_convenio.setitem(ll_indi,'c_n_cuota',ll_meses)
				next
				dw_convenio.accepttext()
				dw_convenio.SetFilter('c_n_cuota > 0')
				dw_convenio.Filter( )
			end if
			if dw_convenio.rowcount() = 0 then
				messagebox("Advertencia","No Registra datos")
			end if
		elseif rb_promesa.checked=true then
			dw_convenio.dataobject	= 'dw_convenio_promesas'
			dw_convenio.settransobject(sqlca)
			if dw_convenio.retrieve()=0 then 
				messagebox("Advertencia","No Registra datos")
			end if
		elseif rb_parque_santiago.checked= true then
			dw_convenio.dataobject = 'dw_convenio_santiago'
			dw_convenio.settransobject(sqlca)
			if dw_convenio.retrieve() = 0 then
				messagebox("Advertencia","No Registra datos")
			end if
		end if
	end if
else
	messagebox("Advertencia","No es Posible realizar esta Operación Fecha Ultimo Proceso fue el "+string(ldt_fecha_max,'dd/mm/yyyy'))
end if
end event

type cb_cerrar from commandbutton within w_convenio
integer x = 3584
integer y = 1964
integer width = 343
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_convenio)
end event

type dw_convenio from datawindow within w_convenio
integer x = 27
integer y = 156
integer width = 3899
integer height = 1752
integer taborder = 20
string title = "none"
string dataobject = "dw_convenio"
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event clicked;if row > 0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
	
end if
end event

type gb_2 from groupbox within w_convenio
integer x = 2651
integer y = 1932
integer width = 850
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
end type

