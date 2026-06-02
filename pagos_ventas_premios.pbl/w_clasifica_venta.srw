forward
global type w_clasifica_venta from window
end type
type cb_docto_pendiente from commandbutton within w_clasifica_venta
end type
type cb_cerrar from commandbutton within w_clasifica_venta
end type
type dw_clasifica_venta from datawindow within w_clasifica_venta
end type
end forward

global type w_clasifica_venta from window
integer width = 2094
integer height = 1784
boolean titlebar = true
string title = "Clasificación Ventas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_docto_pendiente cb_docto_pendiente
cb_cerrar cb_cerrar
dw_clasifica_venta dw_clasifica_venta
end type
global w_clasifica_venta w_clasifica_venta

on w_clasifica_venta.create
this.cb_docto_pendiente=create cb_docto_pendiente
this.cb_cerrar=create cb_cerrar
this.dw_clasifica_venta=create dw_clasifica_venta
this.Control[]={this.cb_docto_pendiente,&
this.cb_cerrar,&
this.dw_clasifica_venta}
end on

on w_clasifica_venta.destroy
destroy(this.cb_docto_pendiente)
destroy(this.cb_cerrar)
destroy(this.dw_clasifica_venta)
end on

event open;string		ls_base,ls_serie,ls_clasif,ls_forma_pago,ls_clasif_promesa,ls_docto_pend
long		ll_new,ll_plazo,ll_renta,ll_dicom,ll_punto_ingr,ll_punto_plazo,ll_cta_pat,&
			ll_punto_renta,ll_punto_dicom,ll_contr_ped,ll_valor_pat
datetime	ldt_fecha_cierre,ldt_fecha_max_clas_vta,ldt_fecha_max_clasifica,ldt_fec_docto
double	ldb_numero,ldb_ingr,ldb_pondera_ingr,ldb_valor_vta_ingr,ldb_pondera_plazo,ldb_valor_vta_plazo,ldb_pondera_renta,&
			ldb_valor_vta_renta,ldb_pondera_dicom,ldb_valor_vta_dicom,ldb_valor_total

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_clasifica_venta)
ls_base											= substr(1,1,Message.StringParm)
ls_serie											= substr(1,2,Message.StringParm)
ldb_numero										= double(substr(1,3,Message.StringParm))
dw_clasifica_venta.dataobject				= 'dwe_clasifica_venta'
dw_clasifica_venta.settransobject(sqlca)

SELECT	"CODIGO",	"SERIE",		"NUMERO",	"PORCE_ING_CIERRE",	"NRO_CUOTAS",	"TIPO_CLASIFICA_RENTA",	"DICOM_SCORE",	"CIERRE_VENTA",		"FORMA_PAGO",		"CLASIFICA_VENTA"  
INTO		:ls_base,	:ls_serie,	:ldb_numero,	:ldb_ingr,				:ll_plazo,		:ll_renta,					:ll_dicom,		:ldt_fecha_cierre,	:ls_forma_pago,	:ls_clasif_promesa
FROM		"VISTA_CLASIFICA_PROMESA"
WHERE 	( "VISTA_CLASIFICA_PROMESA"."CODIGO" = :ls_base ) AND  
			( "VISTA_CLASIFICA_PROMESA"."SERIE" = :ls_serie ) AND  
			( "VISTA_CLASIFICA_PROMESA"."NUMERO" = :ldb_numero ) 
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ls_base) and  ls_base <> '' and not isnull(ls_serie) and  ls_serie <> '' and not isnull(ldb_numero) and  ldb_numero > 0 then
		if ldt_fecha_cierre < datetime(date(string('01/01/2011'))) then
			messagebox("Advertencia","Promesa No Registra Detalle Clasifición Venta")
			close(w_clasifica_venta)
		else
			
			SELECT	MAX("FECHA")
			INTO 		:ldt_fecha_max_clas_vta  
			FROM		"CLASIFICA_VENTAS"  
			WHERE	( "CLASIFICA_VENTAS"."FECHA" <= :ldt_fecha_cierre )
			USING	Trans_1;
			if Trans_1.sqlcode=0 then
				if not isnull(ldt_fecha_max_clas_vta) then
				end if
			end if
			
			SELECT	"CIERRE_VENTA"."FEC_DOCTO_PENDIENTE"
			INTO		:ldt_fec_docto
			FROM 	"CIERRE_VENTA"  
			WHERE 	"CIERRE_VENTA"."CIERRE_VENTA" = :ldt_fecha_cierre
			USING	Trans_1;
			if Trans_1.sqlcode=0 then
				if not isnull(ldt_fec_docto) then
					ldt_fec_docto							= ldt_fec_docto
				else
					ldt_fec_docto							= gdt_fec_sistema
				end if
			else
				ldt_fec_docto								= gdt_fec_sistema
			end if
			
			ll_new									= dw_clasifica_venta.insertrow(0)
			dw_clasifica_venta.scrolltorow(ll_new)
			dw_clasifica_venta.setitem(ll_new,"base",ls_base)
			dw_clasifica_venta.setitem(ll_new,"serie",ls_serie)
			dw_clasifica_venta.setitem(ll_new,"numero",ldb_numero)
			dw_clasifica_venta.setitem(ll_new,"forma_pago",ls_forma_pago)
			dw_clasifica_venta.setitem(ll_new,"porce_ingre",ldb_ingr)
			dw_clasifica_venta.setitem(ll_new,"plazo",ll_plazo)
			dw_clasifica_venta.setitem(ll_new,"renta",ll_renta)
			dw_clasifica_venta.setitem(ll_new,"fec_cierre",ldt_fecha_cierre)
			dw_clasifica_venta.setitem(ll_new,"fec_docto_pend",ldt_fec_docto)
			dw_clasifica_venta.setitem(ll_new,"dicom",ll_dicom)
			dw_clasifica_venta.setitem(ll_new,"clasif_promesa",ls_clasif_promesa)
			SELECT	"PUNTOS",			"PONDERA",				"VALOR_VENTA"  
			INTO 		:ll_punto_ingr,	:ldb_pondera_ingr,	:ldb_valor_vta_ingr  
			FROM		"CLASIFICA_VENTAS"  
			WHERE		( "CLASIFICA_VENTAS"."CODIGO" = 1 ) AND  
						( "CLASIFICA_VENTAS"."RANDO_INICIO" <= :ldb_ingr ) AND  
						( "CLASIFICA_VENTAS"."RANGO_FIN" > :ldb_ingr ) AND
						( "CLASIFICA_VENTAS"."FECHA" = :ldt_fecha_max_clas_vta ) 
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				ll_punto_ingr						= ll_punto_ingr
				ldb_pondera_ingr					= ldb_pondera_ingr
				ldb_valor_vta_ingr  				= ldb_valor_vta_ingr
			else
				ll_punto_ingr						= 0
				ldb_pondera_ingr					= 0
				ldb_valor_vta_ingr	  				= 0
			end if
			dw_clasifica_venta.setitem(ll_new,"puntos_ingr",ll_punto_ingr)
			dw_clasifica_venta.setitem(ll_new,"pondera_ing",ldb_pondera_ingr)
			dw_clasifica_venta.setitem(ll_new,"suma_ingr",ldb_valor_vta_ingr)
			SELECT	"PUNTOS",			"PONDERA",				"VALOR_VENTA"  
			INTO 		:ll_punto_plazo,	:ldb_pondera_plazo,	:ldb_valor_vta_plazo  
			FROM		"CLASIFICA_VENTAS"  
			WHERE		( "CLASIFICA_VENTAS"."CODIGO" = 2 ) AND  
						( "CLASIFICA_VENTAS"."RANDO_INICIO" < :ll_plazo ) AND  
						( "CLASIFICA_VENTAS"."RANGO_FIN" >= :ll_plazo ) AND
						( "CLASIFICA_VENTAS"."FECHA" = :ldt_fecha_max_clas_vta )
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				ll_punto_plazo						= ll_punto_plazo
				ldb_pondera_plazo				= ldb_pondera_plazo
				ldb_valor_vta_plazo  				= ldb_valor_vta_plazo
			else
				ll_punto_plazo						= 0
				ldb_pondera_plazo				= 0
				ldb_valor_vta_plazo  				= 0
			end if
			dw_clasifica_venta.setitem(ll_new,"puntos_plazo",ll_punto_plazo)
			dw_clasifica_venta.setitem(ll_new,"pondera_plazo",ldb_pondera_plazo)
			dw_clasifica_venta.setitem(ll_new,"suma_plazo",ldb_valor_vta_plazo)
			SELECT	"PUNTOS",			"PONDERA",				"VALOR_VENTA"  
			INTO 		:ll_punto_renta,	:ldb_pondera_renta,	:ldb_valor_vta_renta  
			FROM		"CLASIFICA_VENTAS"  
			WHERE		( "CLASIFICA_VENTAS"."CODIGO" = 3 ) AND  
						( "CLASIFICA_VENTAS"."RANDO_INICIO" = :ll_renta ) AND  
						( "CLASIFICA_VENTAS"."RANGO_FIN" = :ll_renta ) AND
						( "CLASIFICA_VENTAS"."FECHA" = :ldt_fecha_max_clas_vta )
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				ll_punto_renta						= ll_punto_renta
				ldb_pondera_renta				= ldb_pondera_renta
				ldb_valor_vta_renta  				= ldb_valor_vta_renta
			else
				ll_punto_renta						= 0
				ldb_pondera_renta				= 0
				ldb_valor_vta_renta  				= 0
			end if
			dw_clasifica_venta.setitem(ll_new,"puntos_renta",ll_punto_renta)
			dw_clasifica_venta.setitem(ll_new,"pondera_renta",ldb_pondera_renta)
			dw_clasifica_venta.setitem(ll_new,"suma_renta",ldb_valor_vta_renta)
			SELECT	"PUNTOS",			"PONDERA",				"VALOR_VENTA"  
			INTO 		:ll_punto_dicom,	:ldb_pondera_dicom,	:ldb_valor_vta_dicom  
			FROM		"CLASIFICA_VENTAS"  
			WHERE		( "CLASIFICA_VENTAS"."CODIGO" = 4 ) AND  
						( "CLASIFICA_VENTAS"."RANDO_INICIO" = :ll_dicom ) AND  
						( "CLASIFICA_VENTAS"."RANGO_FIN" = :ll_dicom ) AND
						( "CLASIFICA_VENTAS"."FECHA" = :ldt_fecha_max_clas_vta ) 
			USING		Trans_1;
			if Trans_1.sqlcode=0 then
				ll_punto_dicom						= ll_punto_dicom
				ldb_pondera_dicom				= ldb_pondera_dicom
				ldb_valor_vta_dicom  				= ldb_valor_vta_dicom
			else
				ll_punto_dicom						= 0
				ldb_pondera_dicom				= 0
				ldb_valor_vta_dicom  				= 0
			end if
			dw_clasifica_venta.setitem(ll_new,"puntos_dicom",ll_punto_dicom)
			dw_clasifica_venta.setitem(ll_new,"pondera_dicom",ldb_pondera_dicom)
			dw_clasifica_venta.setitem(ll_new,"suma_dicom",ldb_valor_vta_dicom)
			
			if ldt_fecha_cierre < datetime(date(string('31/08/2011'))) then
				ll_valor_pat							= 0
			else
				SELECT	count("SOL_ESTATUS"."BASE")  
    				INTO		:ll_cta_pat  
    				FROM		"SOL_PAT","SOL_ESTATUS"  
   				WHERE 	"SOL_ESTATUS"."BASE" = "SOL_PAT"."BASE" and  
         					"SOL_ESTATUS"."SERIE" = "SOL_PAT"."SERIE" and  
         					"SOL_ESTATUS"."NUMERO" = "SOL_PAT"."NUMERO" and  
         					"SOL_PAT"."BASE" = :ls_base AND  
         					"SOL_PAT"."SERIE" = :ls_serie AND  
         					"SOL_PAT"."NUMERO" = :ldb_numero AND  
         					"SOL_PAT"."ESTATUS_OPERACION" = 0 AND  
         					"SOL_PAT"."ESTATUS_OPERACION" = 0 AND  
         					"SOL_ESTATUS"."CODIGO_SOLICITUD" = '21' AND  
         					"SOL_ESTATUS"."ESTADO_REG" = 'A'
				USING	Trans_1;
				if Trans_1.sqlcode=0 then
					if not isnull(ll_cta_pat) and ll_cta_pat>0 then
						ll_valor_pat						= 1
					else
						ll_valor_pat						= 0
					end if
				else
					ll_valor_pat							= 0
				end if
			end if
			dw_clasifica_venta.setitem(ll_new,"valor_pat",ll_valor_pat)
			dw_clasifica_venta.accepttext()
			ldb_valor_total								= ldb_valor_vta_ingr + ldb_valor_vta_plazo + ldb_valor_vta_renta + ldb_valor_vta_dicom + ll_valor_pat
			if ls_forma_pago = '1' or ls_forma_pago = '2' or ls_forma_pago = '3' or ls_forma_pago = '4' then
				ls_clasif 									= f_clas_promesa(ls_base,ls_serie,ldb_numero)
			end if
			ll_contr_ped									= f_docto_pend(ls_base,ls_serie,ldb_numero,ldt_fecha_cierre)
			if ll_contr_ped>0 then
				ls_docto_pend							= 'Docto Pendiente'
			end if
			dw_clasifica_venta.setitem(ll_new,"docto_pend",ls_docto_pend)
			dw_clasifica_venta.setitem(ll_new,"valor_venta_tot",ldb_valor_total)
			dw_clasifica_venta.setitem(ll_new,"clasifica",ls_clasif)
		end if
		if ls_clasif = ls_clasif_promesa then
			dw_clasifica_venta.object.clasifica.visible		= 0
		//	dw_clasifica_venta.object.c_valida.visible		= 0
		end if
	end if
end if
end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type cb_docto_pendiente from commandbutton within w_clasifica_venta
integer x = 50
integer y = 1536
integer width = 434
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Docto. Pendiente"
end type

event clicked;string		ls_base,ls_serie,ls_string
double	ldb_numero
datetime	ldt_fec_docto

dw_clasifica_venta.accepttext()
if dw_clasifica_venta.rowcount() > 0 then
	ls_base				= dw_clasifica_venta.getitemstring(1,'base')
	ls_serie				= dw_clasifica_venta.getitemstring(1,'serie')
	ldb_numero			= dw_clasifica_venta.getitemnumber(1,'numero')
	ldt_fec_docto		= dw_clasifica_venta.getitemdatetime(1,'fec_docto_pend')
	if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie)  and ls_serie<>'' and not isnull(ldb_numero) and ldb_numero >0 then
		ls_string			= ls_base+'~t'+ls_serie+'~t'+string(ldb_numero)+'~t'+string(ldt_fec_docto,'dd/mm/yyyy')
		if isvalid(w_docto_pendiente_promesa) then close(w_docto_pendiente_promesa)
		OpenWithParm (w_docto_pendiente_promesa,ls_string)
	end if
end if
end event

type cb_cerrar from commandbutton within w_clasifica_venta
integer x = 1728
integer y = 1536
integer width = 288
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_clasifica_venta)
end event

type dw_clasifica_venta from datawindow within w_clasifica_venta
integer x = 27
integer y = 16
integer width = 2016
integer height = 1500
integer taborder = 10
string dataobject = "dwe_clasifica_venta"
boolean border = false
boolean hsplitscroll = true
boolean livescroll = true
end type

event doubleclicked;string	ls_columna

ls_columna = dwo.name
if ls_columna = 'docto_pend' then
	cb_docto_pendiente.triggerevent(Clicked!)
end if	
end event

