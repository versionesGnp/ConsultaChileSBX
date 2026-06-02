forward
global type w_pre_cierre_valida_cierre from window
end type
type cb_filtrar from commandbutton within w_pre_cierre_valida_cierre
end type
type p_inicio from picture within w_pre_cierre_valida_cierre
end type
type pb_aceptar from picturebutton within w_pre_cierre_valida_cierre
end type
type p_termino from picture within w_pre_cierre_valida_cierre
end type
type em_termino from editmask within w_pre_cierre_valida_cierre
end type
type st_hasta from statictext within w_pre_cierre_valida_cierre
end type
type em_inicio from editmask within w_pre_cierre_valida_cierre
end type
type st_desde from statictext within w_pre_cierre_valida_cierre
end type
type cb_1 from commandbutton within w_pre_cierre_valida_cierre
end type
type cb_2 from commandbutton within w_pre_cierre_valida_cierre
end type
type cb_imprimir from commandbutton within w_pre_cierre_valida_cierre
end type
type cb_cerrar from commandbutton within w_pre_cierre_valida_cierre
end type
type dw_lista from datawindow within w_pre_cierre_valida_cierre
end type
type gb_1 from groupbox within w_pre_cierre_valida_cierre
end type
type gb_2 from groupbox within w_pre_cierre_valida_cierre
end type
end forward

global type w_pre_cierre_valida_cierre from window
integer width = 3872
integer height = 2032
boolean titlebar = true
string title = "Validación Pre-Cierre Venta"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_filtrar cb_filtrar
p_inicio p_inicio
pb_aceptar pb_aceptar
p_termino p_termino
em_termino em_termino
st_hasta st_hasta
em_inicio em_inicio
st_desde st_desde
cb_1 cb_1
cb_2 cb_2
cb_imprimir cb_imprimir
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
gb_2 gb_2
end type
global w_pre_cierre_valida_cierre w_pre_cierre_valida_cierre

type variables
Long	il_mes,il_ano,il_row
end variables

on w_pre_cierre_valida_cierre.create
this.cb_filtrar=create cb_filtrar
this.p_inicio=create p_inicio
this.pb_aceptar=create pb_aceptar
this.p_termino=create p_termino
this.em_termino=create em_termino
this.st_hasta=create st_hasta
this.em_inicio=create em_inicio
this.st_desde=create st_desde
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_filtrar,&
this.p_inicio,&
this.pb_aceptar,&
this.p_termino,&
this.em_termino,&
this.st_hasta,&
this.em_inicio,&
this.st_desde,&
this.cb_1,&
this.cb_2,&
this.cb_imprimir,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1,&
this.gb_2}
end on

on w_pre_cierre_valida_cierre.destroy
destroy(this.cb_filtrar)
destroy(this.p_inicio)
destroy(this.pb_aceptar)
destroy(this.p_termino)
destroy(this.em_termino)
destroy(this.st_hasta)
destroy(this.em_inicio)
destroy(this.st_desde)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;connect using Trans_1;
gf_centrar(w_pre_cierre_valida_cierre)
dw_lista.dataobject			= 'dwe_valida_cierre_ventas'
dw_lista.settransobject(sqlca)
em_inicio.text					= string(gdt_fec_sistema,'dd/mm/yyyy')
em_termino.text				= string(gdt_fec_sistema,'dd/mm/yyyy')
IF gs_user='MARCOS' then
	cb_filtrar.visible		= true
end if

end event

event close;disconnect using Trans_1;
end event

type cb_filtrar from commandbutton within w_pre_cierre_valida_cierre
boolean visible = false
integer x = 1824
integer y = 1776
integer width = 283
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar OK"
end type

event clicked;string ls_filtro

ls_filtro				=  "valida <> 'OK'"
dw_lista.SETfilter(ls_filtro)
dw_lista.filter()
end event

type p_inicio from picture within w_pre_cierre_valida_cierre
integer x = 645
integer y = 76
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(today(),gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if em_inicio.text<>'00/00/0000' then
	ls_fecha = em_inicio.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_inicio.text = Message.StringParm
END IF
end event

type pb_aceptar from picturebutton within w_pre_cierre_valida_cierre
integer x = 1481
integer y = 52
integer width = 146
integer height = 128
integer taborder = 10
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

event clicked;string	ls_pasa,ls_cierre,ls_valida
long		ll_cta_prom,ll_cta_liber,ll_mes,ll_ano,ll_cta_prom_cd,ll_cta_liber_cd,&
			ll_new,ll_cta_prom_cie,ll_cta_lib_cie,ll_cta_aum,ll_cta_aum_cd,ll_cta_aum_cie
datetime	ldt_fecha_ini,ldt_fecha_fin,ldt_fecha_ini_p,ldt_nulo,ldt_fecha_cierre,ldt_ult_cierre_vtas
double	ldb_sum_prom,ldb_sum_liber,ldb_sum_prom_cie,ldb_sum_lib_cie,ldb_sum_aum,ldb_sum_aum_cie

dw_lista.reset()
ldt_fecha_ini											= datetime(date(em_inicio.text),time('00:00:00'))
ldt_fecha_fin											= datetime(date(em_termino.text),time('00:00:00'))
ldt_fecha_ini_p											= datetime(date((string('05/05/2008'))),time('00:00:00'))
ls_pasa													= 'N'
ls_cierre													= 'N'
setnull(ldt_nulo)
if ldt_fecha_ini>=ldt_fecha_fin then
	messagebox("Advertencia","Fecha Inicio No Puede Ser Mayor a la Fecha de Término")
	ls_pasa												= 'N'
else
	ls_pasa												= 'S'
	if ldt_fecha_ini<ldt_fecha_ini_p then
		messagebox("Advertencia","Fecha Inicio No puede Ser Inferior al 05/05/2008, No Existia Control Documentario")
		em_inicio.text									= string(ldt_fecha_ini_p,'dd/mm/yyyy')
		ls_pasa											= 'S'
		ldt_fecha_ini									= ldt_fecha_ini_p
	end if
end if
if ls_pasa='S' then
	DECLARE x1 CURSOR FOR
	SELECT	DISTINCT "CIERRE_VENTA","PROMESA_UNIDAD","PROMESA_UF","LIBERA_UNIDAD","LIBERA_UF","AUMENTO_UNIDAD","AUMENTO_UF"  
   	FROM 	"CIERRE_VENTA"
	WHERE	"CIERRE_VENTA"."CIERRE_VENTA" >= :ldt_fecha_ini and 
				"CIERRE_VENTA"."CIERRE_VENTA" <=:ldt_fecha_fin
	order by	"CIERRE_VENTA"."CIERRE_VENTA" ASC		
	USING	sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		DO WHILE sqlca.sqlcode=0
		fetch x1 INTO	:ldt_fecha_cierre,:ll_cta_prom_cie,:ldb_sum_prom_cie,:ll_cta_lib_cie,:ldb_sum_lib_cie,:ll_cta_aum_cie,:ldb_sum_aum_cie;
			if isnull(ll_cta_prom_cie) then ll_cta_prom_cie=0
			if isnull(ldb_sum_prom_cie) then ldb_sum_prom_cie=0
			if isnull(ll_cta_lib_cie) then ll_cta_lib_cie=0
			if isnull(ldb_sum_lib_cie) then ldb_sum_lib_cie=0
			if isnull(ll_cta_aum_cie) then ll_cta_aum_cie=0
			if isnull(ldb_sum_aum_cie) then ldb_sum_aum_cie=0
			if gl_proceso<>5 then
				dw_lista.object.cta_prom_cierre.protect			= 1
				dw_lista.object.prod_prom_cierre.protect		= 1
				dw_lista.object.cta_liber_cierre.protect			= 1
				dw_lista.object.prod_liber_cierre.protect			= 1
				dw_lista.object.cta_aum_cierre.protect			= 1
				dw_lista.object.prod_aum_cierre.protect			= 1
			end if
			if not isnull(ldt_fecha_cierre) then
				SELECT	count(*) as cta,
							ROUND(sum((CASE	WHEN "PAGO_OFERTA"."MONEDA" = '2' THEN "PAGO_OFERTA"."PRECIO"
														WHEN "PAGO_OFERTA"."MONEDA" = '1' THEN ROUND( ( "PAGO_OFERTA"."PRECIO" / "TAB_UF"."VALOR_UF") , 0 ) END )),0)
				INTO		:ll_cta_prom,:ldb_sum_prom
				FROM    	"OFERTA_V","PAGO_OFERTA","TAB_UF"   
				WHERE	"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
							"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
							"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
							"OFERTA_V"."CIERRE_VENTA" = "TAB_UF"."FECHA_UF" and
							"OFERTA_V"."CIERRE_VENTA" = :ldt_fecha_cierre
				USING	Trans_1;
				if isnull(ll_cta_prom) then ll_cta_prom=0
				if isnull(ldb_sum_prom) then ldb_sum_prom=0
					
				SELECT	count(*),
							ROUND(sum((CASE WHEN "PAGO_LIBERADOR"."MONEDA" = '2' THEN "PAGO_LIBERADOR"."PRECIO"
							WHEN "PAGO_LIBERADOR"."MONEDA" = '1' THEN ROUND( ( "PAGO_LIBERADOR"."PRECIO" / "TAB_UF"."VALOR_UF") , 0 ) END )),0)
				INTO		:ll_cta_liber,:ldb_sum_liber
				FROM    	"ANEXO_LIBERADOR","PAGO_LIBERADOR","TAB_UF"   
				WHERE	"ANEXO_LIBERADOR"."SERIE_M" = "PAGO_LIBERADOR"."SERIE_M" and  
							"ANEXO_LIBERADOR"."NRO_LIBERADOR" = "PAGO_LIBERADOR"."NRO_LIBERADOR" and  
							"ANEXO_LIBERADOR"."ULT_FOLIO" = "PAGO_LIBERADOR"."FOLIO" and  
							"ANEXO_LIBERADOR"."CIERRE_VENTA" = "TAB_UF"."FECHA_UF" and
							"ANEXO_LIBERADOR"."CIERRE_VENTA" = :ldt_fecha_cierre
				USING	Trans_1;
				if isnull(ll_cta_liber) then ll_cta_liber=0
				if isnull(ldb_sum_liber) then ldb_sum_liber=0
				
				SELECT	count(*),
							ROUND(sum((CASE WHEN "PAGO_AUMENTO"."MONEDA" = '2' THEN "PAGO_AUMENTO"."PRECIO"
							WHEN "PAGO_AUMENTO"."MONEDA" = '1' THEN ROUND( ( "PAGO_AUMENTO"."PRECIO" / "TAB_UF"."VALOR_UF") , 0 ) END )),0)
				INTO		:ll_cta_aum,:ldb_sum_aum
				FROM    	"ANEXO_AUMENTO","PAGO_AUMENTO","TAB_UF"   
				WHERE	"ANEXO_AUMENTO"."SERIE_M" = "PAGO_AUMENTO"."SERIE_M" and  
							"ANEXO_AUMENTO"."NRO_AUMENTO" = "PAGO_AUMENTO"."NRO_AUMENTO" and  
							"ANEXO_AUMENTO"."ULT_FOLIO" = "PAGO_AUMENTO"."FOLIO" and  
							"ANEXO_AUMENTO"."CIERRE_VENTA" = "TAB_UF"."FECHA_UF" and
							"ANEXO_AUMENTO"."CIERRE_VENTA" = :ldt_fecha_cierre
				USING	Trans_1;
				if isnull(ll_cta_aum) then ll_cta_aum=0
				if isnull(ldb_sum_aum) then ldb_sum_aum=0
				
				ll_mes									= month(date(ldt_fecha_cierre))
				ll_ano										= year(date(ldt_fecha_cierre))
				SELECT	count("CD_FOLIO"."BASE")
				INTO		:ll_cta_prom_cd
				FROM		"CD_FOLIO"  
				WHERE	( "CD_FOLIO"."MES_CIERRE" = :ll_mes ) AND  
							( "CD_FOLIO"."ANO_CIERRE" = :ll_ano ) AND  
							( "CD_FOLIO"."BASE" = 'O' )
				USING	Trans_1;			
				if isnull(ll_cta_prom_cd) then ll_cta_prom_cd=0
				SELECT	count("CD_FOLIO"."BASE")
				INTO		:ll_cta_liber_cd
				FROM		"CD_FOLIO"  
				WHERE	( "CD_FOLIO"."MES_CIERRE" = :ll_mes ) AND  
							( "CD_FOLIO"."ANO_CIERRE" = :ll_ano ) AND  
							( "CD_FOLIO"."BASE" = 'L' )
				USING	Trans_1;			
				if isnull(ll_cta_liber_cd) then ll_cta_liber_cd=0
				SELECT	count("CD_FOLIO"."BASE")
				INTO		:ll_cta_aum_cd
				FROM		"CD_FOLIO"  
				WHERE	( "CD_FOLIO"."MES_CIERRE" = :ll_mes ) AND  
							( "CD_FOLIO"."ANO_CIERRE" = :ll_ano ) AND  
							( "CD_FOLIO"."BASE" = 'A' )
				USING	Trans_1;			
				if isnull(ll_cta_aum_cd) then ll_cta_aum_cd=0
				
				dw_lista.object.usuario.text			= gs_user
				ll_new									= dw_lista.insertrow(0)
				dw_lista.scrolltorow(ll_new)
				dw_lista.setitem(ll_new,"mes",ll_mes)
				dw_lista.setitem(ll_new,"ano",ll_ano)
				
				dw_lista.setitem(ll_new,"cierre_ventas",ldt_fecha_cierre)
				dw_lista.setitem(ll_new,"cta_prom_cierre",ll_cta_prom_cie)
				dw_lista.setitem(ll_new,"prod_prom_cierre",ldb_sum_prom_cie)
				dw_lista.setitem(ll_new,"cta_liber_cierre",ll_cta_lib_cie)
				dw_lista.setitem(ll_new,"prod_liber_cierre",ldb_sum_lib_cie)
				dw_lista.setitem(ll_new,"cta_aum_cierre",ll_cta_aum_cie)
				dw_lista.setitem(ll_new,"prod_aum_cierre",ldb_sum_aum_cie)
				
				dw_lista.setitem(ll_new,"num_prom_control",ll_cta_prom_cd)
				dw_lista.setitem(ll_new,"num_liber_control",ll_cta_liber_cd)
				dw_lista.setitem(ll_new,"num_aum_control",ll_cta_aum_cd)
				
				dw_lista.setitem(ll_new,"num_prom_oferta_v",ll_cta_prom)
				dw_lista.setitem(ll_new,"prod_prom_oferta_v",ldb_sum_prom)
				dw_lista.setitem(ll_new,"num_liber_anexo",ll_cta_liber)
				dw_lista.setitem(ll_new,"prod_liber_anexo",ldb_sum_liber)
				dw_lista.setitem(ll_new,"num_aum_capac",ll_cta_aum)
				dw_lista.setitem(ll_new,"prod_aum_capac",ldb_sum_aum)
				
				if ll_cta_prom_cie = ll_cta_prom_cd and ll_cta_prom_cie = ll_cta_prom and &
					ll_cta_lib_cie=ll_cta_liber_cd and ll_cta_lib_cie=ll_cta_liber and &
					ll_cta_aum_cie=ll_cta_aum_cd and ll_cta_aum_cie=ll_cta_aum and &
					ldb_sum_prom_cie = ldb_sum_prom and ldb_sum_lib_cie = ldb_sum_liber and ldb_sum_aum_cie = ldb_sum_aum then
					ls_valida						= 'OK'
				else
					ls_valida						= ''
				end if
				dw_lista.setitem(ll_new,"valida",ls_valida)
				dw_lista.accepttext()
				ldt_ult_cierre_vtas				= ldt_fecha_cierre
			end if
			setnull(ldt_fecha_cierre);&
			setnull(ll_cta_prom_cie);setnull(ldb_sum_prom_cie);&
			setnull(ll_cta_lib_cie);setnull(ldb_sum_lib_cie);&
			setnull(ll_cta_aum_cie);setnull(ldb_sum_aum_cie);&
			setnull(ll_cta_prom_cd);setnull(ll_cta_liber_cd);setnull(ll_cta_aum_cd);&
			setnull(ll_cta_prom);setnull(ldb_sum_prom);&
			setnull(ll_cta_liber);setnull(ldb_sum_liber);&
			setnull(ll_cta_aum);setnull(ldb_sum_aum)
		LOOP
	end if
	close x1;
	
	ll_mes									= month(date(ldt_ult_cierre_vtas))
	ll_ano										= year(date(ldt_ult_cierre_vtas))
	if ll_mes=12 then
		ll_mes								= ll_mes - 11
		ll_ano									= ll_ano + 1
	else
		ll_mes								= ll_mes + 1
		ll_ano									= ll_ano
	end if
	SELECT	count("CD_FOLIO"."BASE")
	INTO		:ll_cta_prom_cd
	FROM		"CD_FOLIO"  
	WHERE	( "CD_FOLIO"."MES_CIERRE" = :ll_mes ) AND  
				( "CD_FOLIO"."ANO_CIERRE" = :ll_ano ) AND  
				( "CD_FOLIO"."BASE" = 'O' )
	USING	Trans_1;			
	if isnull(ll_cta_prom_cd) then ll_cta_prom_cd=0
	
	SELECT	count("CD_FOLIO"."BASE")
	INTO		:ll_cta_liber_cd
	FROM		"CD_FOLIO"  
	WHERE	( "CD_FOLIO"."MES_CIERRE" = :ll_mes ) AND  
				( "CD_FOLIO"."ANO_CIERRE" = :ll_ano ) AND  
				( "CD_FOLIO"."BASE" = 'L' )
	USING	Trans_1;			
	if isnull(ll_cta_liber_cd) then ll_cta_liber_cd=0
	
	SELECT	count("CD_FOLIO"."BASE")
	INTO		:ll_cta_aum_cd
	FROM		"CD_FOLIO"  
	WHERE	( "CD_FOLIO"."MES_CIERRE" = :ll_mes ) AND  
				( "CD_FOLIO"."ANO_CIERRE" = :ll_ano ) AND  
				( "CD_FOLIO"."BASE" = 'A' )
	USING	Trans_1;			
	if isnull(ll_cta_aum_cd) then ll_cta_aum_cd=0
	
	ll_new								= dw_lista.insertrow(0)
	dw_lista.scrolltorow(ll_new)
	dw_lista.setitem(ll_new,"mes",ll_mes)
	dw_lista.setitem(ll_new,"ano",ll_ano)
	dw_lista.setitem(ll_new,"cierre_ventas",ldt_nulo)
	dw_lista.setitem(ll_new,"num_prom_oferta_v",0)
	dw_lista.setitem(ll_new,"num_liber_anexo",0)
	dw_lista.setitem(ll_new,"num_prom_control",ll_cta_prom_cd)
	dw_lista.setitem(ll_new,"num_liber_control",ll_cta_liber_cd)
	dw_lista.setitem(ll_new,"num_aum_control",ll_cta_aum_cd)
	
	if ll_cta_prom=ll_cta_prom_cd and  ll_cta_liber=ll_cta_liber_cd and  ll_cta_aum=ll_cta_aum_cd then
		ls_valida						= 'OK'
	else
		ls_valida						= ''
	end if
	dw_lista.setitem(ll_new,"valida",ls_valida)
	dw_lista.accepttext()
end if
end event

type p_termino from picture within w_pre_cierre_valida_cierre
integer x = 1353
integer y = 76
integer width = 87
integer height = 84
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string	ls_fecha

if f_valida_fecha(em_termino.text)=-1 then 
	em_termino.text=string(today(),gs_formato_fecha)
	em_termino.setfocus()
	return
end if	
if em_termino.text<>'00/00/0000' then
	ls_fecha = em_termino.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_termino.text = Message.StringParm
END IF
end event

type em_termino from editmask within w_pre_cierre_valida_cierre
integer x = 969
integer y = 80
integer width = 384
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_hasta from statictext within w_pre_cierre_valida_cierre
integer x = 791
integer y = 88
integer width = 174
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

type em_inicio from editmask within w_pre_cierre_valida_cierre
integer x = 261
integer y = 80
integer width = 384
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = ""
end type

type st_desde from statictext within w_pre_cierre_valida_cierre
integer x = 73
integer y = 88
integer width = 187
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_pre_cierre_valida_cierre
integer x = 55
integer y = 1780
integer width = 219
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Sort"
end type

event clicked;string nulo
if dw_lista.rowcount() > 0 then
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_2 from commandbutton within w_pre_cierre_valida_cierre
integer x = 279
integer y = 1780
integer width = 219
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exporta"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_imprimir from commandbutton within w_pre_cierre_valida_cierre
integer x = 503
integer y = 1780
integer width = 219
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then
	f_Print( dw_lista )
end if
end event

type cb_cerrar from commandbutton within w_pre_cierre_valida_cierre
integer x = 3479
integer y = 1760
integer width = 329
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_pre_cierre_valida_cierre)
end event

type dw_lista from datawindow within w_pre_cierre_valida_cierre
integer x = 32
integer y = 192
integer width = 3776
integer height = 1528
integer taborder = 40
string title = "none"
string dataobject = "dwe_valida_cierre_ventas"
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

type gb_1 from groupbox within w_pre_cierre_valida_cierre
integer x = 32
integer y = 1728
integer width = 718
integer height = 160
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_pre_cierre_valida_cierre
integer x = 32
integer y = 8
integer width = 1435
integer height = 176
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Período"
end type

