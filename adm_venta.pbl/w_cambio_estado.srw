forward
global type w_cambio_estado from window
end type
type p_1 from picture within w_cambio_estado
end type
type cb_cerrar from commandbutton within w_cambio_estado
end type
type cb_actualizar from commandbutton within w_cambio_estado
end type
type dw_agente from datawindow within w_cambio_estado
end type
type dw_listado from datawindow within w_cambio_estado
end type
type st_2 from statictext within w_cambio_estado
end type
end forward

global type w_cambio_estado from window
integer x = 1074
integer y = 484
integer width = 3296
integer height = 1488
boolean titlebar = true
string title = "Cambio de Estado de Ofertas"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
p_1 p_1
cb_cerrar cb_cerrar
cb_actualizar cb_actualizar
dw_agente dw_agente
dw_listado dw_listado
st_2 st_2
end type
global w_cambio_estado w_cambio_estado

type variables
Date	idt_fecha_hoy
end variables

on w_cambio_estado.create
this.p_1=create p_1
this.cb_cerrar=create cb_cerrar
this.cb_actualizar=create cb_actualizar
this.dw_agente=create dw_agente
this.dw_listado=create dw_listado
this.st_2=create st_2
this.Control[]={this.p_1,&
this.cb_cerrar,&
this.cb_actualizar,&
this.dw_agente,&
this.dw_listado,&
this.st_2}
end on

on w_cambio_estado.destroy
destroy(this.p_1)
destroy(this.cb_cerrar)
destroy(this.cb_actualizar)
destroy(this.dw_agente)
destroy(this.dw_listado)
destroy(this.st_2)
end on

event open;idt_fecha_hoy		= date(gdt_fec_sistema)
gf_centrar(w_cambio_estado)

dw_listado.SetTransObject(SQLCA)


dw_agente.SetTransObject(SQLCA)
dw_agente.InsertRow(0)
end event

type p_1 from picture within w_cambio_estado
integer x = 41
integer y = 36
integer width = 279
integer height = 284
string picturename = "logo_red.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cambio_estado
integer x = 2501
integer y = 1244
integer width = 361
integer height = 108
integer taborder = 3
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;
close(w_cambio_estado)
end event

type cb_actualizar from commandbutton within w_cambio_estado
integer x = 2875
integer y = 1244
integer width = 361
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Actualizar"
end type

event clicked;integer ret
long i
boolean lb_asig_sup

dw_listado.AcceptText()

lb_asig_sup = TRUE
For i = 1 to dw_listado.RowCount()
	IF (dw_listado.GetItemString(i, "Estado") = "V") AND IsNull(dw_listado.GetItemString(i, "cod_sup")) THEN
		lb_asig_sup = False
	END IF
NEXT

IF lb_asig_sup THEN
	ret = dw_listado.Update()
	
	IF ret = 1 Then
		Commit;
		MessageBox("Cambio de Estado", "Se ha modificado el listado con éxito !")
		dw_listado.Retrieve(dw_agente.GetItemString(1,"cod_age"))
	ELSE
		MessageBox("Cambio de Estado", "Ocurrió un error !")
		Rollback;
	END IF
ELSE
	MessageBox("Error", "Una o más de las ofertas que ahora son vigentes, no tienen codigo de supervisor !")
END IF
end event

type dw_agente from datawindow within w_cambio_estado
integer x = 347
integer y = 220
integer width = 1554
integer height = 104
integer taborder = 20
string dataobject = "d_agente"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long i

AcceptText()
dw_listado.Retrieve(GetItemString(1, "cod_age"))

For i = 1 to dw_listado.RowCount() 
	dw_listado.SetItem(i, "fecha_recep", DateTime(idt_fecha_hoy))
NEXT

end event

type dw_listado from datawindow within w_cambio_estado
integer x = 27
integer y = 352
integer width = 3209
integer height = 844
integer taborder = 30
string dataobject = "d_listado_asig_x_agente"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;string ls_sup,ls_jef

ls_sup = getitemstring(row,'cod_sup')
SELECT "SUPERVISOR"."COD_JEFE"  
INTO :ls_jef  
FROM "SUPERVISOR"  
WHERE "SUPERVISOR"."COD_SUP" = :ls_sup   ;
if sqlca.sqlcode = 0 then
	setitem(row,'cod_jef',ls_jef)
end if

end event

event editchanged;string ls_sup,ls_jef

ls_sup = getitemstring(row,'cod_sup')
SELECT "SUPERVISOR"."COD_JEFE"  
INTO :ls_jef  
FROM "SUPERVISOR"  
WHERE "SUPERVISOR"."COD_SUP" = :ls_sup   ;
if sqlca.sqlcode = 0 then
	setitem(row,'cod_jef',ls_jef)
end if

end event

event itemchanged;string ls_sup,ls_jef

ls_sup = getitemstring(row,'cod_sup')
SELECT "SUPERVISOR"."COD_JEFE"  
INTO :ls_jef  
FROM "SUPERVISOR"  
WHERE "SUPERVISOR"."COD_SUP" = :ls_sup   ;
if sqlca.sqlcode = 0 then
	setitem(row,'cod_jef',ls_jef)
end if

end event

type st_2 from statictext within w_cambio_estado
integer x = 398
integer y = 76
integer width = 1806
integer height = 108
integer textsize = -14
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Cambio de Estado de Ofertas Asignadas"
boolean focusrectangle = false
end type

