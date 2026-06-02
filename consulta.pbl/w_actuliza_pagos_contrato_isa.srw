forward
global type w_actuliza_pagos_contrato_isa from window
end type
type cb_2 from commandbutton within w_actuliza_pagos_contrato_isa
end type
type dw_2 from datawindow within w_actuliza_pagos_contrato_isa
end type
type dw_1 from datawindow within w_actuliza_pagos_contrato_isa
end type
type cb_1 from commandbutton within w_actuliza_pagos_contrato_isa
end type
end forward

global type w_actuliza_pagos_contrato_isa from window
integer width = 3305
integer height = 1708
boolean titlebar = true
string title = "Modificación de Contratos I.S.A."
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_2 cb_2
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
end type
global w_actuliza_pagos_contrato_isa w_actuliza_pagos_contrato_isa

type variables
long il_folio,il_row
string is_tipo_cob
end variables

on w_actuliza_pagos_contrato_isa.create
this.cb_2=create cb_2
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.dw_2,&
this.dw_1,&
this.cb_1}
end on

on w_actuliza_pagos_contrato_isa.destroy
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;string ls_opera

gf_centrar (w_actuliza_pagos_contrato_isa)
SELECT "ENCARGADOS"."OPERA"  
 INTO :ls_opera  
 FROM "ENCARGADOS"  
WHERE ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_user ) AND  
		( "ENCARGADOS"."PASSWORD" = :gs_clave )   ;
if ls_opera < '2' then
	messagebox('Sin Acceso','Usted no tiene acceso para modificar.',information!)
	close(w_actuliza_pagos_contrato_isa)
else
	dw_1.settransobject (sqlca)
	dw_2.settransobject (sqlca)
	dw_1.retrieve(gs_serie,gi_numero)
	dw_2.retrieve(gs_serie,gi_numero,gs_base)
	il_row = 0
	il_folio = 0
end if
gs_ventana	= 'w_actuliza_pagos_contrato_isa'
f_valida_objeto()
end event

type cb_2 from commandbutton within w_actuliza_pagos_contrato_isa
integer x = 2889
integer y = 492
integer width = 329
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;integer  ret
long     folio,monto,cuotas_pag,contrato,valor_uf,rut,cta_pag_la,cta_pag_isa,cta_pag_m
string   tipo_cob ,tipo_mov,serie,cod_caja,base,usuario
datetime fecha_pago

ret = messagebox('Actualizar','Desea Actualizar El Contrato : '+gs_serie+' - '+string(gi_numero,'###,###,###,###'),Exclamation!, OKCancel!, 2)
if ret = 1 then
	
	dw_1.update()
	if sqlca.sqlcode = 0 then
		commit;
	else
		ROLLBACK;
	end if
	cta_pag_la  = dw_1.getitemnumber(1,'cta_pag_la')
	cta_pag_isa = dw_1.getitemnumber(1,'cta_pag_isa')
	cta_pag_m   = dw_1.getitemnumber(1,'cta_pag_m')
	base        = gs_base
	serie       = gs_serie
	contrato    = gi_numero
	INSERT INTO "LOG_CONTRATO"  
			( "SERIE_C"  ,"NRO_CONTRATO","CTA_PAG_LA","CTA_PAG_ISA","CTA_PAG_M","USUARIO","FECHA" ,"BASE" )  
	VALUES ( :gs_serie ,:gi_numero    ,:cta_pag_la ,:cta_pag_isa ,:cta_pag_m ,:gs_user ,sysdate ,:gs_base )  ;
	if sqlca.sqlcode = 0 then
		commit;
	else
		ROLLBACK;
	end if
end if
if il_folio > 0  and il_row > 0 then
	ret = messagebox('Eliminar','Desea Eliminar El Folio : '+string(il_folio,'###,###,###,###')+', del Contrato : '+gs_serie+' - '+string(gi_numero,'###,###,###,###'),Exclamation!, OKCancel!, 2)
	if ret = 1 then
		folio      = dw_2.getitemnumber(il_row,'folio')
		monto      = dw_2.getitemnumber(il_row,'monto')
		cuotas_pag = dw_2.getitemnumber(il_row,'cuotas_pag')
		valor_uf   = dw_2.getitemnumber(il_row,'valor_uf')
		rut        = dw_2.getitemnumber(il_row,'ingreso_rut')
		tipo_cob   = dw_2.getitemstring(il_row,'tipo_cob')
		tipo_mov   = dw_2.getitemstring(il_row,'tipo_mov')
		cod_caja   = dw_2.getitemstring(il_row,'ingreso_cod_caja')
		fecha_pago = dw_2.getitemdatetime(il_row,'fecha_pago')

		INSERT INTO "LOG_INGRESO"  
				( "FOLIO","TIPO_COB","FECHA_PAGO","TIPO_MOV","MONTO","CUOTAS_PAG","SERIE","CONTRATO","COD_CAJA","VALOR_UF","BASE","RUT","USUARIO","FECHA" )  
		VALUES ( :folio ,:tipo_cob ,:fecha_pago ,:tipo_mov ,:monto ,:cuotas_pag ,:serie ,:contrato ,:cod_caja ,:valor_uf ,:base ,:rut ,:gs_user ,sysdate )  ;
		if sqlca.sqlcode = 0 then
			commit;
		else
			ROLLBACK;
		end if
		dw_2.deleterow(il_row)
		dw_2.update()
		if sqlca.sqlcode = 0 then
			commit;
		else
			ROLLBACK;
		end if
	end if
end if
end event

type dw_2 from datawindow within w_actuliza_pagos_contrato_isa
integer x = 78
integer y = 488
integer width = 2770
integer height = 1052
integer taborder = 20
string title = "none"
string dataobject = "d_listado_cuenta_cte_man_actualiza"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clicked;IF row > 0 THEN
	il_row = row
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	il_folio = GetItemNumber(row, 'folio')
	is_tipo_cob = GetItemString(row, 'tipo_cob')
else
	il_row = 0
END IF
end event

type dw_1 from datawindow within w_actuliza_pagos_contrato_isa
integer x = 64
integer y = 60
integer width = 1929
integer height = 420
integer taborder = 10
string title = "none"
string dataobject = "dw_contrato_isa_update"
boolean border = false
boolean livescroll = true
end type

type cb_1 from commandbutton within w_actuliza_pagos_contrato_isa
integer x = 2889
integer y = 1440
integer width = 329
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
boolean default = true
end type

event clicked;close(w_actuliza_pagos_contrato_isa)

end event

