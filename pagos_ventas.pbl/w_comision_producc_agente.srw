forward
global type w_comision_producc_agente from window
end type
type st_cuenta from statictext within w_comision_producc_agente
end type
type cb_detalle from commandbutton within w_comision_producc_agente
end type
type cb_ordenar from commandbutton within w_comision_producc_agente
end type
type hpb_1 from hprogressbar within w_comision_producc_agente
end type
type st_porc from statictext within w_comision_producc_agente
end type
type st_fondo from statictext within w_comision_producc_agente
end type
type cb_filtrar from commandbutton within w_comision_producc_agente
end type
type cb_exportar from commandbutton within w_comision_producc_agente
end type
type cb_imprimir from commandbutton within w_comision_producc_agente
end type
type dw_fecha_cierre from datawindow within w_comision_producc_agente
end type
type st_promesa from statictext within w_comision_producc_agente
end type
type pb_buscar from picturebutton within w_comision_producc_agente
end type
type em_agente from editmask within w_comision_producc_agente
end type
type usuario_t from statictext within w_comision_producc_agente
end type
type st_usuario from statictext within w_comision_producc_agente
end type
type cb_grabar from commandbutton within w_comision_producc_agente
end type
type pb_aceptar from picturebutton within w_comision_producc_agente
end type
type cb_cerrar from commandbutton within w_comision_producc_agente
end type
type dw_producc from datawindow within w_comision_producc_agente
end type
type gb_3 from groupbox within w_comision_producc_agente
end type
end forward

global type w_comision_producc_agente from window
integer width = 3662
integer height = 2172
boolean titlebar = true
string title = "Resumen Producción por Agentes"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_cuenta st_cuenta
cb_detalle cb_detalle
cb_ordenar cb_ordenar
hpb_1 hpb_1
st_porc st_porc
st_fondo st_fondo
cb_filtrar cb_filtrar
cb_exportar cb_exportar
cb_imprimir cb_imprimir
dw_fecha_cierre dw_fecha_cierre
st_promesa st_promesa
pb_buscar pb_buscar
em_agente em_agente
usuario_t usuario_t
st_usuario st_usuario
cb_grabar cb_grabar
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
dw_producc dw_producc
gb_3 gb_3
end type
global w_comision_producc_agente w_comision_producc_agente

type variables
long il_row
end variables

on w_comision_producc_agente.create
this.st_cuenta=create st_cuenta
this.cb_detalle=create cb_detalle
this.cb_ordenar=create cb_ordenar
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_fondo=create st_fondo
this.cb_filtrar=create cb_filtrar
this.cb_exportar=create cb_exportar
this.cb_imprimir=create cb_imprimir
this.dw_fecha_cierre=create dw_fecha_cierre
this.st_promesa=create st_promesa
this.pb_buscar=create pb_buscar
this.em_agente=create em_agente
this.usuario_t=create usuario_t
this.st_usuario=create st_usuario
this.cb_grabar=create cb_grabar
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_producc=create dw_producc
this.gb_3=create gb_3
this.Control[]={this.st_cuenta,&
this.cb_detalle,&
this.cb_ordenar,&
this.hpb_1,&
this.st_porc,&
this.st_fondo,&
this.cb_filtrar,&
this.cb_exportar,&
this.cb_imprimir,&
this.dw_fecha_cierre,&
this.st_promesa,&
this.pb_buscar,&
this.em_agente,&
this.usuario_t,&
this.st_usuario,&
this.cb_grabar,&
this.pb_aceptar,&
this.cb_cerrar,&
this.dw_producc,&
this.gb_3}
end on

on w_comision_producc_agente.destroy
destroy(this.st_cuenta)
destroy(this.cb_detalle)
destroy(this.cb_ordenar)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_fondo)
destroy(this.cb_filtrar)
destroy(this.cb_exportar)
destroy(this.cb_imprimir)
destroy(this.dw_fecha_cierre)
destroy(this.st_promesa)
destroy(this.pb_buscar)
destroy(this.em_agente)
destroy(this.usuario_t)
destroy(this.st_usuario)
destroy(this.cb_grabar)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_producc)
destroy(this.gb_3)
end on

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

event open;long		ll_new
date		ld_fecha
datetime	ldt_fecha

connect using Trans_1;
connect using Trans_2;

gf_centrar(w_comision_producc_agente)

ld_fecha								= date(substr(1,1,Message.StringParm))
ldt_fecha							= datetime(ld_fecha,time('00:00:00'))

dw_fecha_cierre.dataobject	= 'dwe_lista_cierre_venta'
dw_fecha_cierre.settransobject(sqlca)
ll_new								= dw_fecha_cierre.insertrow(0)
dw_fecha_cierre.scrolltorow(ll_new)
dw_fecha_cierre.setitem(ll_new,"cierre_ventas",ldt_fecha)


dw_producc.dataobject			= 'dw_producc_agente'
dw_producc.settransobject(sqlca)
st_usuario.text		= string(gs_user)

if gl_proceso = 1 then
	cb_grabar.enabled				= true
elseif gl_proceso = 0 then
	cb_grabar.enabled				= false
else
	messagebox("Advertencia"," Usuario No autorizado")
	close(w_comision_producc_agente)
end if


end event

type st_cuenta from statictext within w_comision_producc_agente
boolean visible = false
integer x = 1088
integer y = 1132
integer width = 1371
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
string text = "none"
boolean focusrectangle = false
end type

type cb_detalle from commandbutton within w_comision_producc_agente
boolean visible = false
integer x = 425
integer y = 1932
integer width = 526
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Detalle de Ventas"
end type

event clicked;string	ls_codigo,ls_string
datetime	ldt_fecha

dw_producc.accepttext()
if dw_producc.dataobject='dw_producc_agente' and dw_producc.rowcount() > 0 then
	ldt_fecha			= dw_producc.getitemdatetime(il_row,'fecha_cierre')
	ls_codigo			= dw_producc.getitemstring(il_row,'cod_agente')
end if
if not isnull(ls_codigo) and ls_codigo<>''  then
	ls_string			= string(ldt_fecha,'dd/mm/yyyy')+'~t'+ls_codigo
	if isvalid(w_detalle_ventas_mensual) then close(w_detalle_ventas_mensual)
	OpenWithParm (w_detalle_ventas_mensual,ls_string)
end if
end event

type cb_ordenar from commandbutton within w_comision_producc_agente
integer x = 1664
integer y = 1940
integer width = 238
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

event clicked;if dw_producc.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_producc.SETSORT(NULO)
	dw_producc.SORT()
end if
end event

type hpb_1 from hprogressbar within w_comision_producc_agente
boolean visible = false
integer x = 1088
integer y = 1060
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_comision_producc_agente
boolean visible = false
integer x = 1664
integer y = 988
integer width = 233
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

type st_fondo from statictext within w_comision_producc_agente
boolean visible = false
integer x = 1061
integer y = 964
integer width = 1431
integer height = 268
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_filtrar from commandbutton within w_comision_producc_agente
integer x = 1422
integer y = 1940
integer width = 238
integer height = 84
integer taborder = 90
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
dw_producc.SETfilter(NULO)
dw_producc.filter()
end event

type cb_exportar from commandbutton within w_comision_producc_agente
integer x = 1179
integer y = 1940
integer width = 238
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_producc
if dw_producc.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_imprimir from commandbutton within w_comision_producc_agente
integer x = 1961
integer y = 1940
integer width = 238
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_producc.rowcount() > 0 then f_Print( dw_producc )
end event

type dw_fecha_cierre from datawindow within w_comision_producc_agente
integer x = 46
integer y = 48
integer width = 1449
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dwe_lista_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//this.accepttext()
//messagebox("Inicial - final", string(this.getitemdatetime(1,'cierre_ventas_1'),'dd/mm/yyyy')+'  /  '+string(this.getitemdatetime(1,'cierre_ventas'),'dd/mm/yyyy'))
dw_producc.reset()
end event

type st_promesa from statictext within w_comision_producc_agente
integer x = 2414
integer y = 1952
integer width = 389
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Agente :"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_buscar from picturebutton within w_comision_producc_agente
integer x = 3163
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "LUPA.BMP"
end type

event clicked;long		ll_tot_reg,ll_fila
string	ls_string,ls_age

ls_age						= trim(em_agente.text)
ll_tot_reg					= dw_producc.rowcount()
if dw_producc.rowcount() > 0 and not isnull(ls_age) then
	ls_string				= "cod_agente = '"+ls_age+"'"
	ll_fila 					= dw_producc.find(ls_string, 1, ll_tot_reg)
	if ll_fila>0 then
		dw_producc.scrolltorow(ll_fila)
		dw_producc.SelectRow(0, false)
		dw_producc.SelectRow(ll_fila, true)
	else
		messagebox("Advertencia","No Existe Agente en la Lista")
		dw_producc.scrolltorow(1)
	end if
end if
end event

type em_agente from editmask within w_comision_producc_agente
integer x = 2816
integer y = 1936
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!"
end type

event modified;if string(em_agente.text)<>'' then pb_buscar.triggerevent(clicked!)
end event

type usuario_t from statictext within w_comision_producc_agente
integer x = 3045
integer y = 20
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Usuario:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_usuario from statictext within w_comision_producc_agente
integer x = 3301
integer y = 20
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
boolean focusrectangle = false
end type

type cb_grabar from commandbutton within w_comision_producc_agente
integer x = 50
integer y = 1932
integer width = 288
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long			ll_tot_reg,ll_res
datetime		ldt_fecha_cierre,ldt_fecha

if dw_producc.rowcount() > 0 then
	ldt_fecha_cierre	= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
	
	SELECT DISTINCT	"CIERRE_PROD_AGENTE"."FECHA_CIERRE"  
	INTO		:ldt_fecha  
	FROM		"CIERRE_PROD_AGENTE"  
	WHERE		"CIERRE_PROD_AGENTE"."FECHA_CIERRE" = :ldt_fecha_cierre
	USING		sqlca;
	if sqlca.sqlcode=0 then
		messagebox("Advertencia","Proceso Cierre de Ventas del :"+string(ldt_fecha_cierre,"dd/mm/yyyy")+' Ya Fue Grabado')
	else
		ll_tot_reg		= dw_producc.rowcount()
		if ll_tot_reg>0 then
			ll_res	= MessageBox("Advertencia", 'Esta Seguro de Grabar Registro(s)', Exclamation!, YesNo!, 2)
			if ll_res = 1 then
				if dw_producc.update() = 1 then
					commit;
					messagebox("Grabar","Grabación Exitosa")
					dw_producc.reset()
				else
					rollback;
				end if
			end if
		else
			messagebox('Advertencia', 'No Registra Datos Para Grabar')
		end if
	end if
end if
	

end event

type pb_aceptar from picturebutton within w_comision_producc_agente
integer x = 1518
integer y = 24
integer width = 133
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string	ls_cod_age,ls_estado_age,ls_cod_jefe,ls_moneda_promesa,ls_cod_sup,ls_moneda_liberador,ls_moneda_aumento
long		ll_tot_reg,ll_new,ll_cant_promesa_acu,ll_cant_promesa,ll_cant_liberador_acu,ll_cant_aumento_acu,&
			ll_cuenta_prom,ll_cuenta_liber,ll_cuenta_aume,ll_tot_lista
datetime	ldt_fecha_cierre,ldt_fecha,ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_ini_age,ldt_fecha_fin_age
double	ldb_valor_uf,ldb_precio_promesa,ldb_precio_uf_promesa,ldb_precio_uf_promesa_acu,ldb_precio_uf_liberador_acu,&
			ldb_precio_liberador,ldb_precio_uf_liberador,ldb_precio_uf_aumento_acu,ldb_precio_aumento,ldb_precio_uf_aumento,&
			ldb_tot_porc,ldb_tot_porc_aux

dw_fecha_cierre.accepttext()
ldt_fecha_cierre																		= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
dw_producc.reset()
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf  
FROM		"TAB_UF"  
WHERE		"TAB_UF"."FECHA_UF" = :ldt_fecha_cierre
USING		sqlca;
if sqlca.sqlcode=100 then
	if isnull(ldb_valor_uf) or ldb_valor_uf=0 then
		messagebox("Advertencia","No Exite Valor U.F. del :"+string(ldt_fecha_cierre,"dd/mm/yyyy"))
	end if
else
	SELECT DISTINCT	"CIERRE_PROD_AGENTE"."FECHA_CIERRE"
	INTO		:ldt_fecha
	FROM 		"CIERRE_PROD_AGENTE"  
	WHERE		"CIERRE_PROD_AGENTE"."FECHA_CIERRE" = :ldt_fecha_cierre   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if not isnull(ldt_fecha) then
			cb_grabar.enabled															= false
			dw_producc.dataobject = 'dw_producc_agente'
			dw_producc.settransobject(sqlca)
			ll_tot_reg						= dw_producc.retrieve(ldt_fecha_cierre)
		end if
	else
		cb_grabar.enabled																= true
		SetPointer(HourGlass!)
		st_fondo.visible																= true
		st_cuenta.visible																= true
		hpb_1.visible 																	= true
		st_porc.visible 																= true
		ldb_tot_porc																	= 0
		ldb_tot_porc_aux																= 0			
		hpb_1.Position																	= ldb_tot_porc
		SELECT	"CIERRE_VENTA_INI",	"CIERRE_VENTA"  
		INTO		:ldt_fecha_ini,		:ldt_fecha_fin  
		FROM		"CIERRE_VENTA"  
		WHERE		"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if not isnull(ldt_fecha_fin) then
				SELECT	COUNT("AGENTES"."COD_AGE")    
				INTO		:ll_tot_lista
				FROM 		"AGENTES"  
				WHERE		( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini ) AND		
							( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin )  
				USING		Trans_1 ;
				if Trans_1.sqlcode=0 then
					if not isnull(ll_tot_lista) then
					end if
				end if
				DECLARE x1 CURSOR FOR
				SELECT	"AGENTES"."COD_AGE",	"AGENTES"."FECHA_INI",	"AGENTES"."FECHA_FIN",	"AGENTES"."ESTADO",	"AGENTES"."COD_SUP"    
				FROM 		"AGENTES"  
				WHERE		( "AGENTES"."FECHA_FIN" >= :ldt_fecha_ini ) AND		
							( "AGENTES"."FECHA_INI" <= :ldt_fecha_fin ) AND
							( "AGENTES"."DEPTO" = 'M' OR "AGENTES"."DEPTO" = 'K' )
				USING		Trans_1 ;
				open x1;
					if Trans_1.sqlcode=0 then
						DO WHILE Trans_1.sqlcode=0
							fetch x1 INTO	:ls_cod_age,	:ldt_fecha_ini_age,	:ldt_fecha_fin_age,	:ls_estado_age,	:ls_cod_sup;
							if not isnull(ls_cod_age) or ls_cod_age <> '' then
								SELECT	COUNT("PAGO_OFERTA"."PRECIO")  
								INTO		:ll_cuenta_prom
								FROM		"OFERTA_V",	"PAGO_OFERTA"  
								WHERE		( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
											( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
											( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
											( ( "OFERTA_V"."COD_AGE" = :ls_cod_age ) AND  
											( "OFERTA_V"."CIERRE_VENTA" = :ldt_fecha_cierre ) )
								USING		Trans_2;
								if Trans_2.sqlcode=0 then
									ll_cant_promesa_acu 								= ll_cuenta_prom
								end if
								ldb_precio_uf_promesa_acu							= 0
								DECLARE x2 CURSOR FOR
								SELECT	"PAGO_OFERTA"."MONEDA",	"PAGO_OFERTA"."PRECIO"  
								FROM		"OFERTA_V",	"PAGO_OFERTA"  
								WHERE		( "OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" ) and  
											( "OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" ) and  
											( "OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" ) and  
											( ( "OFERTA_V"."COD_AGE" = :ls_cod_age ) AND  
											( "OFERTA_V"."CIERRE_VENTA" = :ldt_fecha_cierre ) )
								USING		Trans_2;
								open x2;
								if Trans_2.sqlcode=0 then
									DO WHILE Trans_2.sqlcode=0
									fetch x2 INTO	:ls_moneda_promesa,	:ldb_precio_promesa;
										if not isnull(ls_moneda_promesa) or ls_moneda_promesa <> '' then
											if ls_moneda_promesa = '1' then
												ldb_precio_uf_promesa			= round(ldb_precio_promesa / ldb_valor_uf , 2) 
											elseif ls_moneda_promesa = '2' then 
												ldb_precio_uf_promesa			= round(ldb_precio_promesa, 2)
											end if
											ldb_precio_uf_promesa_acu			= ldb_precio_uf_promesa_acu + ldb_precio_uf_promesa
										end if
										setnull(ls_moneda_promesa)
									LOOP
								end if
								close x2;
								
								SELECT	COUNT("PAGO_LIBERADOR"."PRECIO")
								INTO		:ll_cuenta_liber
    							FROM		"ANEXO_LIBERADOR",	"PAGO_LIBERADOR"  
								WHERE		( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											( ( "ANEXO_LIBERADOR"."COD_AGENTE" = :ls_cod_age ) AND  
											( "ANEXO_LIBERADOR"."CIERRE_VENTA" = :ldt_fecha_cierre) )
								USING		Trans_2;
								if Trans_2.sqlcode=0 then
									ll_cant_liberador_acu 							= ll_cuenta_liber
								end if
								ldb_precio_uf_liberador_acu						= 0
								DECLARE x3 CURSOR FOR
								SELECT	"PAGO_LIBERADOR"."MONEDA",	"PAGO_LIBERADOR"."PRECIO"  
    							FROM		"ANEXO_LIBERADOR",	"PAGO_LIBERADOR"  
								WHERE		( "ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" ) and  
											( "ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" ) and  
											( "ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" ) and  
											( ( "ANEXO_LIBERADOR"."COD_AGENTE" = :ls_cod_age ) AND  
											( "ANEXO_LIBERADOR"."CIERRE_VENTA" = :ldt_fecha_cierre) )
								USING		Trans_2;
								open x3;
									if Trans_2.sqlcode=0 then
										DO WHILE Trans_2.sqlcode=0
											fetch x3 INTO	:ls_moneda_liberador,	:ldb_precio_liberador;
											if not isnull(ls_moneda_liberador) or ls_moneda_liberador <> '' then
												if ls_moneda_liberador = '1' then
													ldb_precio_uf_liberador			= round(ldb_precio_liberador / ldb_valor_uf , 2) 
												elseif ls_moneda_liberador = '2' then 
													ldb_precio_uf_liberador			= round(ldb_precio_liberador, 2)
												end if
												ldb_precio_uf_liberador_acu		= ldb_precio_uf_liberador_acu + ldb_precio_uf_liberador
											end if
											setnull(ls_moneda_liberador)
										LOOP
									end if
								close x3;
								
								SELECT	COUNT("PAGO_AUMENTO"."PRECIO")
								INTO		:ll_cuenta_aume
								FROM		"ANEXO_AUMENTO",	"PAGO_AUMENTO"  
   							WHERE		( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
											( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
											( ( "ANEXO_AUMENTO"."COD_AGENTE" = :ls_cod_age ) AND  
											( "ANEXO_AUMENTO"."CIERRE_VENTA" = :ldt_fecha_cierre ) )
								USING		Trans_2;
								if Trans_2.sqlcode=0 then
									ll_cant_aumento_acu 								= ll_cuenta_aume
								end if
								ldb_precio_uf_aumento_acu							= 0
								DECLARE x4 CURSOR FOR
								SELECT	"PAGO_AUMENTO"."MONEDA",	"PAGO_AUMENTO"."PRECIO"  
								FROM		"ANEXO_AUMENTO",	"PAGO_AUMENTO"  
   							WHERE		( "ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" ) and  
											( "ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" ) and  
											( "ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" ) and  
											( ( "ANEXO_AUMENTO"."COD_AGENTE" = :ls_cod_age ) AND  
											( "ANEXO_AUMENTO"."CIERRE_VENTA" = :ldt_fecha_cierre ) )
								USING		Trans_2;
								open x4;
									if Trans_2.sqlcode=0 then
										DO WHILE Trans_2.sqlcode=0
											fetch x4 INTO	:ls_moneda_aumento,	:ldb_precio_aumento;
											if not isnull(ls_moneda_aumento) or ls_moneda_aumento <> '' then
												if ls_moneda_aumento = '1' then
													ldb_precio_uf_aumento			= round(ldb_precio_aumento / ldb_valor_uf , 2) 
												elseif ls_moneda_aumento = '2' then 
													ldb_precio_uf_aumento			= round(ldb_precio_aumento, 2)
												end if
												ldb_precio_uf_aumento_acu			= ldb_precio_uf_aumento_acu + ldb_precio_uf_aumento
											end if
											setnull(ls_moneda_aumento)
										LOOP
									end if
								close x4;
								SELECT	"SUPERVISOR"."COD_JEFE"  
    							INTO		:ls_cod_jefe
								FROM		"SUPERVISOR"  
   							WHERE		"SUPERVISOR"."COD_SUP" = :ls_cod_sup
								USING		Trans_2;
								if Trans_2.sqlcode=0 then
								end if
								ll_new													= dw_producc.insertrow(0)
								dw_producc.scrolltorow(ll_new)
								dw_producc.setitem(ll_new,"fecha_cierre",ldt_fecha_cierre)
								dw_producc.setitem(ll_new,"cod_agente",ls_cod_age)
								dw_producc.setitem(ll_new,"cant_promesa",ll_cant_promesa_acu)
								dw_producc.setitem(ll_new,"uf_promesa",ldb_precio_uf_promesa_acu)
								dw_producc.setitem(ll_new,"cant_liberador",ll_cant_liberador_acu)
								dw_producc.setitem(ll_new,"uf_liberador",ldb_precio_uf_liberador_acu)
								dw_producc.setitem(ll_new,"cant_aumento",ll_cant_aumento_acu)
								dw_producc.setitem(ll_new,"uf_aumento",ldb_precio_uf_aumento_acu)
								dw_producc.setitem(ll_new,"cod_supervisor",ls_cod_sup)
								dw_producc.setitem(ll_new,"cod_jefe",ls_cod_jefe)
							end if
							setnull(ls_cod_age)
							if ldb_tot_porc <> ldb_tot_porc_aux then 
								st_porc.text											= string(ldb_tot_porc,'#0.##')+" %"
								ldb_tot_porc_aux										= ldb_tot_porc
							end if
							ldb_tot_porc												= (ll_new / ll_tot_lista) * 100
							hpb_1.Position 											= ldb_tot_porc
							st_cuenta.text 											= 'Total Reg. '+string(ll_tot_lista,'###,###,###')+'    Reg. Cálculados '+string(ll_new,'###,###,###')+' ( '+string((ll_new*100)/ll_tot_lista,'#0.##')+'% )'
							dw_producc.accepttext()
						LOOP
					end if
				close x1;
				st_fondo.visible														= false
				st_cuenta.visible														= false
				hpb_1.visible 															= false
				st_porc.visible 														= false
				SetPointer(Arrow!)
			end if
		else
			messagebox("Advertencia","El Proceso de cierre de ventas del :"+string(ldt_fecha_cierre,"dd/mm/yyyy")+' No Está Confeccionado')
		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_comision_producc_agente
integer x = 3301
integer y = 1932
integer width = 302
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_comision_producc_agente)
end event

type dw_producc from datawindow within w_comision_producc_agente
integer x = 41
integer y = 172
integer width = 3561
integer height = 1724
integer taborder = 30
string title = "none"
string dataobject = "dw_producc_agente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event doubleclicked;cb_detalle.triggerevent(clicked!)
end event

type gb_3 from groupbox within w_comision_producc_agente
integer x = 1157
integer y = 1892
integer width = 1070
integer height = 156
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

