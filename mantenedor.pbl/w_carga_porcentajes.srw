forward
global type w_carga_porcentajes from window
end type
type cb_6 from commandbutton within w_carga_porcentajes
end type
type cb_5 from commandbutton within w_carga_porcentajes
end type
type cb_4 from commandbutton within w_carga_porcentajes
end type
type dw_porcentaje_edit from datawindow within w_carga_porcentajes
end type
type cb_1 from commandbutton within w_carga_porcentajes
end type
type dw_porc_des from datawindow within w_carga_porcentajes
end type
end forward

global type w_carga_porcentajes from window
integer x = 1189
integer y = 884
integer width = 4160
integer height = 1712
boolean titlebar = true
string title = "Mantenedor de Porcentajes de Descuento"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
dw_porcentaje_edit dw_porcentaje_edit
cb_1 cb_1
dw_porc_des dw_porc_des
end type
global w_carga_porcentajes w_carga_porcentajes

type variables
	string ls_SECTOR,ls_CANAL,ls_T_SEPULT, ls_tipo_cons
	int li_COD_PARQUE, li_TIPO_PRODUCTO,li_CAPACIDAD, li_COD_PARQUE_ORIG
	datetime ld_fec_vig
	
	datawindowchild idw_parque
end variables

forward prototypes
public subroutine f_muestra (integer row)
public function integer f_valida_existencia ()
end prototypes

public subroutine f_muestra (integer row);
if dw_porc_des.rowcount()>0 then
//	dw_porcentaje_edit.RESET()
//	dw_porcentaje_edit.insertrow(0)
//	dw_porcentaje_edit.setitem(1,'id_porcentaje', dw_porc_des.getitemnumber(row,'id_porcentaje'))
//	dw_porcentaje_edit.setitem(1,'FECHA_CREACION', dw_porc_des.getitemdatetime(row,'FECHA_CREACION'))
//	dw_porcentaje_edit.setitem(1,'PORCENTAJE', dw_porc_des.getitemnumber(row,'PORCENTAJE'))
//	dw_porcentaje_edit.setitem(1,'USUARIO_CREA', dw_porc_des.getitemstring(row,'USUARIO_CREA'))
//	dw_porcentaje_edit.setitem(1,'ESTADO', dw_porc_des.getitemstring(row,'ESTADO'))
//	dw_porcentaje_edit.setitem(1,'FECHA_CAMBIO_ESTADO', dw_porc_des.getitemdatetime(row,'FECHA_CAMBIO_ESTADO'))
//	dw_porcentaje_edit.setitem(1,'USUARIO_MODIFICA', dw_porc_des.getitemstring(row,'USUARIO_MODIFICA'))

      dw_porcentaje_edit.modify('PORCENTAJE.protect=1')
	 
end if

dw_porcentaje_edit.enabled=true
dw_porcentaje_edit.setfocus()
		
end subroutine

public function integer f_valida_existencia ();int li_contador , li_contador2

select count(*) into :li_contador from lista_precio where 
SECTOR =   :ls_SECTOR and 
CAPACIDAD =  :li_CAPACIDAD and 
CANAL =  :ls_CANAL and 
T_CONST =  :ls_tipo_cons and 
T_SEPULT =  :ls_T_SEPULT and 
COD_PARQUE =  :li_COD_PARQUE and 
TIPO_PRODUCTO = :li_TIPO_PRODUCTO  
and TO_DATE(FECHA_VIGENCIA) = TO_DATE(:ld_fec_vig)	;

if li_contador >0 then
	return 1 
else
	return 0
end if 	
end function

on w_carga_porcentajes.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.dw_porcentaje_edit=create dw_porcentaje_edit
this.cb_1=create cb_1
this.dw_porc_des=create dw_porc_des
this.Control[]={this.cb_6,&
this.cb_5,&
this.cb_4,&
this.dw_porcentaje_edit,&
this.cb_1,&
this.dw_porc_des}
end on

on w_carga_porcentajes.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.dw_porcentaje_edit)
destroy(this.cb_1)
destroy(this.dw_porc_des)
end on

event open;INTEGER FILA

gf_centrar (w_carga_porcentajes)
dw_porc_des.SetTransObject(SQLCA)
dw_porc_des.retrieve()

dw_porcentaje_edit.SetTransObject(SQLCA)
dw_porcentaje_edit.insertrow(0)
//f_valida_objeto()
end event

type cb_6 from commandbutton within w_carga_porcentajes
integer x = 1285
integer y = 1452
integer width = 338
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;dw_porcentaje_edit.RESET()
dw_porcentaje_edit.insertrow(1)
dw_porcentaje_edit.enabled = false
dw_porc_des.setfocus()

end event

type cb_5 from commandbutton within w_carga_porcentajes
integer x = 850
integer y = 1452
integer width = 430
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Graba Porcentaje"
end type

event clicked;integer li_porcentaje, li_edita

li_edita = 0 
if dw_porc_des.rowcount() > 0 then
		if dw_porc_des.getitemnumber(dw_porc_des.getrow(),'ID_PORCENTAJE') = dw_porcentaje_edit.getitemnumber(1,'ID_PORCENTAJE') then
		
			if dw_porc_des.getitemstring(dw_porc_des.getrow(),'ESTADO') = dw_porcentaje_edit.getitemstring(1,'ESTADO') then
				messagebox('Atencion','Estado del descuento no fue cambiado.',Exclamation! )
				return
			else
				li_edita = 1 
			end if 
		end if 
end if 


if li_edita = 0 then
		dw_porcentaje_edit.AcceptText()
		li_porcentaje = dw_porcentaje_edit.getitemnumber(1,'porcentaje') 
		
		if isnull(li_porcentaje) then
			li_porcentaje = 0 
		end if 
		 
		
		if li_porcentaje = 0 then
			messagebox('Atencion','Debe ingresar un valor para porcentaje',Exclamation! )
			return
		end if 
end if 

if li_edita= 1 then 
	dw_porcentaje_edit.setitem(1,'FECHA_CAMBIO_ESTADO',gdt_fec_sistema )
	dw_porcentaje_edit.setitem(1,'USUARIO_MODIFICA', gs_user)	
end if 

dw_porcentaje_edit.AcceptText()

If dw_porcentaje_edit.Update () = 1 Then
	COMMIT Using SQLCA;
    dw_porc_des.retrieve()
	dw_porcentaje_edit.RESET()
	dw_porcentaje_edit.insertrow(0)
	MessageBox("Aviso", "Descuento cargado correctamente.")	
Else
	ROLLBACK Using SQLCA;
	MessageBox("Error", "No se pudo ingresar el Descuento.")
End If
dw_porcentaje_edit.enabled = false





end event

type cb_4 from commandbutton within w_carga_porcentajes
integer x = 421
integer y = 1452
integer width = 434
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo Porcentaje"
end type

event clicked;integer li_maximo
dw_porcentaje_edit.RESET()
dw_porcentaje_edit.insertrow(1)
//------------------------------------

select max(id_porcentaje) into :li_maximo from MENSAJES_DESCUENTO_PORCENTAJES
USING	sqlca;

if isnull(li_maximo) or li_maximo = 0 then
	li_maximo = 0
end if 

DATETIME ldt_fecha

SELECT sysdate
INTO :ldt_fecha
FROM dual
USING	sqlca;

//DATE(ldt_fecha)
//------------------------------------
dw_porcentaje_edit.setitem(1,'id_porcentaje',li_maximo + 1)
dw_porcentaje_edit.setitem(1,'fecha_creacion',gdt_fec_sistema)
dw_porcentaje_edit.setitem(1,'usuario_crea',gs_user)
dw_porcentaje_edit.setfocus()
dw_porcentaje_edit.enabled = true

dw_porcentaje_edit.modify('PORCENTAJE.protect=0')

end event

type dw_porcentaje_edit from datawindow within w_carga_porcentajes
integer x = 402
integer y = 948
integer width = 3008
integer height = 460
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_porcentaje_descuento_edit"
borderstyle borderstyle = stylelowered!
end type

event editchanged;
dw_porcentaje_edit.AcceptText()

IF Dwo.name = "porcentaje" THEN
	if dw_porcentaje_edit.getitemnumber(row,'porcentaje') >100 then
		MessageBox("Error","El valor ingresado para porcentaje no es valido.",StopSign!)
		dw_porcentaje_edit.setitem(row,'porcentaje', 0 )
		dw_porcentaje_edit.AcceptText()
	end if 
END IF


end event

type cb_1 from commandbutton within w_carga_porcentajes
integer x = 3104
integer y = 1456
integer width = 297
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_carga_porcentajes)
end event

type dw_porc_des from datawindow within w_carga_porcentajes
integer x = 37
integer y = 24
integer width = 4059
integer height = 880
integer taborder = 10
string title = "Lista de Precio"
string dataobject = "dw_porcentaje_descuento"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	f_muestra(row)
	dw_porcentaje_edit.retrieve(this.getitemnumber(row,'ID_PORCENTAJE'))
end if

end event

