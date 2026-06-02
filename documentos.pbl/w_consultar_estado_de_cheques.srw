forward
global type w_consultar_estado_de_cheques from window
end type
type st_castigado from statictext within w_consultar_estado_de_cheques
end type
type st_protesto from statictext within w_consultar_estado_de_cheques
end type
type cb_imprimir from commandbutton within w_consultar_estado_de_cheques
end type
type cb_3 from commandbutton within w_consultar_estado_de_cheques
end type
type cb_2 from commandbutton within w_consultar_estado_de_cheques
end type
type cb_1 from commandbutton within w_consultar_estado_de_cheques
end type
type cb_cerrar from commandbutton within w_consultar_estado_de_cheques
end type
type dw_lista from datawindow within w_consultar_estado_de_cheques
end type
end forward

global type w_consultar_estado_de_cheques from window
integer width = 3529
integer height = 1676
boolean titlebar = true
string title = "Estado de Cheques"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
st_castigado st_castigado
st_protesto st_protesto
cb_imprimir cb_imprimir
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cerrar cb_cerrar
dw_lista dw_lista
end type
global w_consultar_estado_de_cheques w_consultar_estado_de_cheques

type variables
Long		il_row
Double	il_numero
String	is_base,is_serie
end variables

on w_consultar_estado_de_cheques.create
this.st_castigado=create st_castigado
this.st_protesto=create st_protesto
this.cb_imprimir=create cb_imprimir
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.Control[]={this.st_castigado,&
this.st_protesto,&
this.cb_imprimir,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cerrar,&
this.dw_lista}
end on

on w_consultar_estado_de_cheques.destroy
destroy(this.st_castigado)
destroy(this.st_protesto)
destroy(this.cb_imprimir)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
end on

event open;String		ls_tipo_cob
Long		ll_folio,ll_serie,ll_monto,ll_count
Datetime	ldt_fecha_venc

gf_centrar(w_consultar_estado_de_cheques)
dw_lista.settransobject(sqlca)
is_base 		= substr(1,1,Message.StringParm)
is_serie 		= substr(1,2,Message.StringParm)
il_numero	= Double(substr(1,3,Message.StringParm))
if dw_lista.retrieve(is_base,is_serie,il_numero)=0 then
	messagebox("Advertencia","No Existe Pago con Cheque")
	cb_cerrar.triggerevent(clicked!)
else
	SELECT	COUNT("DOCUMENTOS"."FOLIO")  
	INTO 		:ll_count  
	FROM 	"DOCUMENTOS",   
				"INGRESO"  
	WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
			 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
			 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
			 ( "INGRESO"."BASE" = :is_base ) AND  
			 ( "INGRESO"."SERIE" = :is_serie ) AND  
			 ( "INGRESO"."CONTRATO" = :il_numero ) AND
			 ( "DOCUMENTOS"."ESTADO_CH" = 'P' ) ;
	if ll_count>0 then
		DECLARE	x1 CURSOR FOR  	
		SELECT 	"DOCUMENTOS"."TIPO_COB",   
					"DOCUMENTOS"."FOLIO",   
					"DOCUMENTOS"."N_CHEQUE",   
					"DOCUMENTOS"."MONTO",   
					"DOCUMENTOS"."FECHA_VENC"  
		FROM 	"DOCUMENTOS",   
					"INGRESO"  
		WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
				 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
				 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
				 ( "INGRESO"."BASE" = :is_base ) AND  
				 ( "INGRESO"."SERIE" = :is_serie ) AND  
				 ( "INGRESO"."CONTRATO" = :il_numero ) AND
				 ( "DOCUMENTOS"."ESTADO_CH" = 'P' )   
		ORDER BY "DOCUMENTOS"."FECHA_PAGO" DESC,   
					"DOCUMENTOS"."FECHA_VENC" DESC  
		USING		SQLCA;
		open		x1;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				Fetch x1 into :ls_tipo_cob,:ll_folio,:ll_serie,:ll_monto,:ldt_fecha_venc;
				if ll_folio>0 then
					if ll_count>1 then
						st_protesto.text	= 'Tiene Cheque(s) PROTESTADO el Primero es del '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
					else
						st_protesto.text	= 'Tiene Cheque PROTESTADO el '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
					end if
					exit
				end if
				setnull(ll_folio)
			LOOP
		end if
		close x1;
	end if

	SELECT	COUNT("DOCUMENTOS"."FOLIO")  
	INTO 		:ll_count  
	FROM 	"DOCUMENTOS",   
				"INGRESO"  
	WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
			 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
			 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
			 ( "INGRESO"."BASE" = :is_base ) AND  
			 ( "INGRESO"."SERIE" = :is_serie ) AND  
			 ( "INGRESO"."CONTRATO" = :il_numero ) AND
			 ( "DOCUMENTOS"."ESTADO_CH" = 'T' ) ;
	if ll_count>0 then
		DECLARE	x2 CURSOR FOR  	
		SELECT 	"DOCUMENTOS"."TIPO_COB",   
					"DOCUMENTOS"."FOLIO",   
					"DOCUMENTOS"."N_CHEQUE",   
					"DOCUMENTOS"."MONTO",   
					"DOCUMENTOS"."FECHA_VENC"  
		FROM 	"DOCUMENTOS",   
					"INGRESO"  
		WHERE  ( "DOCUMENTOS"."FOLIO" = "INGRESO"."FOLIO" ) and  
				 ( "DOCUMENTOS"."TIPO_COB" = "INGRESO"."TIPO_COB" ) and  
				 ( "DOCUMENTOS"."FECHA_PAGO" = "INGRESO"."FECHA_PAGO" ) and  
				 ( "INGRESO"."BASE" = :is_base ) AND  
				 ( "INGRESO"."SERIE" = :is_serie ) AND  
				 ( "INGRESO"."CONTRATO" = :il_numero ) AND
				 ( "DOCUMENTOS"."ESTADO_CH" = 'T' )   
		ORDER BY "DOCUMENTOS"."FECHA_PAGO" DESC,   
					"DOCUMENTOS"."FECHA_VENC" DESC  
		USING	SQLCA;
		open		x2;
		if sqlca.sqlcode=0 then
			DO WHILE sqlca.sqlcode=0
				Fetch x2 into :ls_tipo_cob,:ll_folio,:ll_serie,:ll_monto,:ldt_fecha_venc;
				if ll_folio>0 then
					if ll_count>1 then
						st_castigado.text	= 'Tiene Cheque(s) CASTIGADO el Primero es del '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
					else
						st_castigado.text	= 'Tiene Cheque CASTIGADO el '+string(ldt_fecha_venc,"dd/mm/yyyy")+' por '+string(ll_monto,"###,###,###,###,###")
					end if
					exit
				end if
				setnull(ll_folio)
			LOOP
		end if
		close x2;
	end if
end if
end event

type st_castigado from statictext within w_consultar_estado_de_cheques
integer x = 32
integer y = 124
integer width = 3438
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_protesto from statictext within w_consultar_estado_de_cheques
integer x = 32
integer y = 24
integer width = 3438
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_imprimir from commandbutton within w_consultar_estado_de_cheques
integer x = 709
integer y = 1456
integer width = 219
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount() > 0 then f_Print( dw_lista )
end event

type cb_3 from commandbutton within w_consultar_estado_de_cheques
integer x = 261
integer y = 1456
integer width = 219
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltro"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_2 from commandbutton within w_consultar_estado_de_cheques
integer x = 485
integer y = 1456
integer width = 219
integer height = 100
integer taborder = 40
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

type cb_1 from commandbutton within w_consultar_estado_de_cheques
integer x = 37
integer y = 1456
integer width = 219
integer height = 100
integer taborder = 20
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

type cb_cerrar from commandbutton within w_consultar_estado_de_cheques
integer x = 3145
integer y = 1456
integer width = 325
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_consultar_estado_de_cheques)
end event

type dw_lista from datawindow within w_consultar_estado_de_cheques
integer x = 32
integer y = 228
integer width = 3438
integer height = 1188
integer taborder = 10
string title = "none"
string dataobject = "dw_consultar_estado_cheque"
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

