forward
global type w_fallecimiento from window
end type
type st_2 from statictext within w_fallecimiento
end type
type st_1 from statictext within w_fallecimiento
end type
type dw_fallecido from datawindow within w_fallecimiento
end type
type cb_aceptar from commandbutton within w_fallecimiento
end type
type cb_cancelar from commandbutton within w_fallecimiento
end type
end forward

global type w_fallecimiento from window
integer x = 1088
integer y = 608
integer width = 2569
integer height = 1868
boolean titlebar = true
string title = "Fallecimiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
st_2 st_2
st_1 st_1
dw_fallecido dw_fallecido
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
end type
global w_fallecimiento w_fallecimiento

on w_fallecimiento.create
this.st_2=create st_2
this.st_1=create st_1
this.dw_fallecido=create dw_fallecido
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.Control[]={this.st_2,&
this.st_1,&
this.dw_fallecido,&
this.cb_aceptar,&
this.cb_cancelar}
end on

on w_fallecimiento.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_fallecido)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
end on

event open;long fila

gf_centrar(w_fallecimiento)
dw_fallecido.SetTransObject(SQLCA)
If gi_llave > 0 THEN
	dw_fallecido.Retrieve(gi_llave)
ELSE
	// Realizar un insert...
	gi_llave = gf_llave_fallecidos()
	fila = dw_fallecido.InsertRow(0)
	dw_fallecido.SetItem(fila, "llave", gi_llave)
	dw_fallecido.SetItem(fila, "fec_sep", DateTime(today()))
//	dw_fallecido.SetItem(fila, "estado_contrato", gs_estado)
END IF
	
end event

type st_2 from statictext within w_fallecimiento
integer x = 251
integer y = 1636
integer width = 1024
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "** Con tecla TAB avanza campos **"
boolean focusrectangle = false
end type

type st_1 from statictext within w_fallecimiento
integer x = 73
integer y = 28
integer width = 1458
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 79741120
boolean enabled = false
string text = "Información del Fallecimiento"
boolean focusrectangle = false
end type

type dw_fallecido from datawindow within w_fallecimiento
integer x = 59
integer y = 156
integer width = 2496
integer height = 1428
integer taborder = 10
string dataobject = "d_fallecido"
boolean border = false
boolean livescroll = true
end type

event itemchanged;
string ls_columna, ls_base_contrato, ls_serie_contrato, ls_estado,base,serie,estado
Double ll_nro, ll_nro_contrato,numero
long fila,i

ls_columna = GetColumnName()

AcceptText()
IF ls_columna = "contrato" THEN
	ls_base_contrato = GetItemString(1,"base")
	ls_serie_contrato = GetItemString(1,"ss")
	ll_nro = GetItemNumber(1,"contrato")
	SELECT cadena.numero, cadena.estado
	INTO :ll_nro_contrato, :ls_estado
	FROM cadena
	WHERE (cadena.codigo = :ls_base_contrato) and 
	      (cadena.serie = :ls_serie_contrato) and
			(cadena.numero = :ll_nro);
	IF ll_nro <> ll_nro_contrato THEN
		Beep(1)
		MessageBox("Fallecimiento" , "No existe el contrato asociado !!!")
      gs_estado="E"
//      dw_fallecido.SetItem(fila, "estado_contrato", gs_estado)
	ELSE
		MessageBox("Fallecimiento" , "Contrato OK!")	
		gs_estado=ls_estado
//		dw_fallecido.SetItem(fila, "estado_contrato", gs_estado)
	END IF
//-------------------------------------------------------------------------------------------
	 AcceptText()
	 base   = dw_fallecido.getitemstring(1,'base')
	 serie  = dw_fallecido.getitemstring(1,'ss')
	 numero = dw_fallecido.getitemnumber(1,'contrato')
	 SELECT "CADENA"."ESTADO"  
	 INTO :estado  
	 FROM "CADENA"  
	 WHERE ( "CADENA"."CODIGO" = :base ) AND  
			 ( "CADENA"."SERIE" = :serie ) AND  
			 ( "CADENA"."NUMERO" = :numero )   ;
	if sqlca.sqlcode = 0 then
		dw_fallecido.setitem(1,'estado_contrato',estado)
	else
		dw_fallecido.setitem(1,'estado_contrato','E')
	end if
//-------------------------------------------------------------------------------------------	
END IF


end event

type cb_aceptar from commandbutton within w_fallecimiento
integer x = 1797
integer y = 1624
integer width = 329
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;int ret

ret = MessageBox("Actualizar", "Desea grabar los cambios ?", Question!, YesNo!, 1)
IF ret = 1 THEN
	dw_fallecido.AcceptText()
	dw_fallecido.SetItem(dw_fallecido.GetRow(), "dv", dw_fallecido.GetItemString(dw_fallecido.GetRow(),"c_dv"))
	ret = dw_fallecido.Update()
	IF ret <> -1 THEN 
		Commit Using SQLCA;
	ELSE
		RollBack Using SQLCA;
	END IF
END IF
close(w_fallecimiento)
end event

type cb_cancelar from commandbutton within w_fallecimiento
integer x = 2130
integer y = 1624
integer width = 329
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;
Rollback Using SQLCA;
close(w_fallecimiento)
end event

