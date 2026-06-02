forward
global type w_listado_precio_mantenedor from window
end type
type cb_6 from commandbutton within w_listado_precio_mantenedor
end type
type cb_5 from commandbutton within w_listado_precio_mantenedor
end type
type cb_4 from commandbutton within w_listado_precio_mantenedor
end type
type dw_precio_edit from datawindow within w_listado_precio_mantenedor
end type
type pb_ok from picturebutton within w_listado_precio_mantenedor
end type
type dw_parque from datawindow within w_listado_precio_mantenedor
end type
type st_1 from statictext within w_listado_precio_mantenedor
end type
type cb_22 from commandbutton within w_listado_precio_mantenedor
end type
type cb_3 from commandbutton within w_listado_precio_mantenedor
end type
type cb_11 from commandbutton within w_listado_precio_mantenedor
end type
type rb_3 from radiobutton within w_listado_precio_mantenedor
end type
type rb_2 from radiobutton within w_listado_precio_mantenedor
end type
type rb_1 from radiobutton within w_listado_precio_mantenedor
end type
type cb_2 from commandbutton within w_listado_precio_mantenedor
end type
type cb_1 from commandbutton within w_listado_precio_mantenedor
end type
type dw_1 from datawindow within w_listado_precio_mantenedor
end type
type gb_1 from groupbox within w_listado_precio_mantenedor
end type
end forward

global type w_listado_precio_mantenedor from window
integer x = 1189
integer y = 884
integer width = 4325
integer height = 2004
boolean titlebar = true
string title = "Mantenedor de Precios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
dw_precio_edit dw_precio_edit
pb_ok pb_ok
dw_parque dw_parque
st_1 st_1
cb_22 cb_22
cb_3 cb_3
cb_11 cb_11
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_listado_precio_mantenedor w_listado_precio_mantenedor

type variables
	string ls_SECTOR,ls_CANAL,ls_T_SEPULT, ls_tipo_cons
	int li_COD_PARQUE, li_TIPO_PRODUCTO,li_CAPACIDAD, li_COD_PARQUE_ORIG
	datetime ld_fec_vig
	
	datawindowchild idw_parque
end variables

forward prototypes
public subroutine f_muestra (integer row)
public function integer f_valida_existencia ()
public subroutine f_bloquea ()
end prototypes

public subroutine f_muestra (integer row);if dw_1.rowcount()>0 then
	dw_precio_edit.RESET()

	
	
	ls_SECTOR = dw_1.getitemstring(row,'sector')
	ls_CANAL = dw_1.getitemstring(row,'canal')
	ls_T_SEPULT = dw_1.getitemstring(row,'t_sepult')	
	ls_tipo_cons = dw_1.getitemstring(row,'t_const')
	
	li_COD_PARQUE = dw_1.getitemnumber(row,'cod_parque')
	
	li_TIPO_PRODUCTO = dw_1.getitemnumber(row,'lista_precio_tipo_producto')
	li_CAPACIDAD = dw_1.getitemnumber(row,'capacidad')
	
	ld_fec_vig = dw_1.getitemdatetime(row,'lista_precio_fecha_vigencia')
	
	dw_precio_edit.getchild('lista_precio_sector',idw_parque)
	idw_parque.settransobject(sqlca)
	idw_parque.retrieve(li_COD_PARQUE)
		
	dw_precio_edit.retrieve( ls_SECTOR,li_CAPACIDAD,ls_CANAL,ls_tipo_cons, ls_T_SEPULT, li_COD_PARQUE,li_TIPO_PRODUCTO ,ld_fec_vig)
	
	f_bloquea()
	
	dw_precio_edit.enabled=true
	dw_1.setfocus()
		
end if 
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

public subroutine f_bloquea ();	// protegemos de edicion a los campos que son clave - inicio
	dw_precio_edit.Modify("lista_precio_cod_parque.Protect=1")
	dw_precio_edit.Modify("lista_precio_capacidad.Protect=1")
	dw_precio_edit.Modify("lista_precio_t_const.Protect=1")
	dw_precio_edit.Modify("lista_precio_tipo_producto.Protect=1")
	dw_precio_edit.Modify("lista_precio_sector.Protect=1")
	dw_precio_edit.Modify("lista_precio_canal.Protect=1")
	dw_precio_edit.Modify("lista_precio_t_sepult.Protect=1")
	dw_precio_edit.Modify("lista_precio_fecha_vigencia.Protect=1")
	// protegemos de edicion a los campos que son clave - termino	
	
	// CAMBIA COLOR DE los campos que son clave - inicio
	dw_precio_edit.Modify("lista_precio_cod_parque.background.color='28377087'")
	dw_precio_edit.Modify("lista_precio_capacidad.background.color='28377087'")
	dw_precio_edit.Modify("lista_precio_t_const.background.color='28377087'")
	dw_precio_edit.Modify("lista_precio_tipo_producto.background.coloR='28377087'")
	dw_precio_edit.Modify("lista_precio_sector.background.coloR='28377087'")
	dw_precio_edit.Modify("lista_precio_canal.background.coloR='28377087'")
	dw_precio_edit.Modify("lista_precio_t_sepult.background.coloR='28377087'")
	dw_precio_edit.Modify("lista_precio_fecha_vigencia.background.coloR='28377087'")	
	dw_precio_edit.Modify("lista_precio_estado.background.coloR='28377087'")
	
	// CAMBIA COLOR DE los campos que son clave - inicio
end subroutine

on w_listado_precio_mantenedor.create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.dw_precio_edit=create dw_precio_edit
this.pb_ok=create pb_ok
this.dw_parque=create dw_parque
this.st_1=create st_1
this.cb_22=create cb_22
this.cb_3=create cb_3
this.cb_11=create cb_11
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_6,&
this.cb_5,&
this.cb_4,&
this.dw_precio_edit,&
this.pb_ok,&
this.dw_parque,&
this.st_1,&
this.cb_22,&
this.cb_3,&
this.cb_11,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_listado_precio_mantenedor.destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.dw_precio_edit)
destroy(this.pb_ok)
destroy(this.dw_parque)
destroy(this.st_1)
destroy(this.cb_22)
destroy(this.cb_3)
destroy(this.cb_11)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;INTEGER FILA

gf_centrar (w_listado_precio_mantenedor)
dw_1.SetTransObject(SQLCA)

dw_precio_edit.SetTransObject(SQLCA)
dw_precio_edit.insertrow(1)

dw_precio_edit.enabled=false

dw_parque.SetTransObject(SQLCA)
dw_parque.insertrow(0)

if gs_conexion	= "Parque El Prado" then
	dw_parque.setitem(1,'cod_parque',1)
elseif gs_conexion = "Parque La Foresta" then
	dw_parque.setitem(1,'cod_parque',11)
elseif gs_conexion = "Parque Concepción" then
	dw_parque.setitem(1,'cod_parque',801)
end if
dw_parque.accepttext()
pb_ok.triggerevent(clicked!)
gs_ventana	= 'w_listado_precio_mantenedor'


dw_precio_edit.getchild('lista_precio_cod_parque',idw_parque)
FILA=idw_parque.Find( "TRIM(NOMBRE)='TODOS'  ",  1, idw_parque.RowCount())
IF FILA>0 THEN 
		idw_parque.DeleteRow(FILA)
END IF 

f_valida_objeto()
end event

type cb_6 from commandbutton within w_listado_precio_mantenedor
integer x = 2048
integer y = 1784
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

event clicked;
// protegemos de edicion a los campos que son clave - inicio
dw_precio_edit.Modify("lista_precio_cod_parque.Protect=1")
dw_precio_edit.Modify("lista_precio_capacidad.Protect=1")
dw_precio_edit.Modify("lista_precio_t_const.Protect=1")
dw_precio_edit.Modify("lista_precio_tipo_producto.Protect=1")
dw_precio_edit.Modify("lista_precio_sector.Protect=1")
dw_precio_edit.Modify("lista_precio_canal.Protect=1")
dw_precio_edit.Modify("lista_precio_t_sepult.Protect=1")
dw_precio_edit.Modify("lista_precio_fecha_vigencia.Protect=1")
// protegemos de edicion a los campos que son clave - termino	

// CAMBIA COLOR DE los campos que son clave - inicio
dw_precio_edit.Modify("lista_precio_cod_parque.background.color='28377087'")
dw_precio_edit.Modify("lista_precio_capacidad.background.color='28377087'")
dw_precio_edit.Modify("lista_precio_t_const.background.color='28377087'")
dw_precio_edit.Modify("lista_precio_tipo_producto.background.coloR='28377087'")
dw_precio_edit.Modify("lista_precio_sector.background.coloR='28377087'")
dw_precio_edit.Modify("lista_precio_canal.background.coloR='28377087'")
dw_precio_edit.Modify("lista_precio_t_sepult.background.coloR='28377087'")
dw_precio_edit.Modify("lista_precio_fecha_vigencia.background.coloR='28377087'")	
dw_precio_edit.Modify("lista_precio_estado.background.coloR='28377087'")

// CAMBIA COLOR DE los campos que son clave - inicio


dw_precio_edit.RESET()
dw_precio_edit.insertrow(1)
dw_precio_edit.enabled = false
dw_1.setfocus()
int li_row 
li_row= dw_1.GetSelectedRow(0)
if li_row > 0 then
	f_muestra(li_row)
end if 

end event

type cb_5 from commandbutton within w_listado_precio_mantenedor
integer x = 1701
integer y = 1784
integer width = 338
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Graba Precio"
end type

event clicked;double ld_valor 
String ls_error
ls_error=''

dw_precio_edit.AcceptText()

ls_SECTOR = dw_precio_edit.getitemstring(1,'lista_precio_sector')
ls_CANAL = dw_precio_edit.getitemstring(1,'lista_precio_canal')
ls_T_SEPULT = dw_precio_edit.getitemstring(1,'lista_precio_t_sepult')	
ls_tipo_cons = dw_precio_edit.getitemstring(1,'lista_precio_t_const')

li_COD_PARQUE = dw_precio_edit.getitemnumber(1,'lista_precio_cod_parque')
li_TIPO_PRODUCTO = dw_precio_edit.getitemnumber(1,'lista_precio_tipo_producto')
li_CAPACIDAD = dw_precio_edit.getitemnumber(1,'lista_precio_capacidad')

ld_fec_vig = dw_precio_edit.getitemdatetime(1,'lista_precio_fecha_vigencia')

ld_valor = dw_precio_edit.getitemnumber(1,'lista_precio_valor')

if isnull(ls_SECTOR) or len(trim(ls_SECTOR)) = 0 then
   ls_error=ls_error+ ' Sector '		+ '~r~n'
end if 
if isnull(ls_CANAL) or len(trim(ls_CANAL)) = 0 then
   ls_error=ls_error+ ' Canal '	+ '~r~n'
end if 
if isnull(ls_T_SEPULT) or len(trim(ls_T_SEPULT)) = 0 then
   ls_error=ls_error+ ' Tipo de Sepultura '	+ '~r~n'
end if 
if isnull(ls_tipo_cons) or len(trim(ls_tipo_cons)) = 0 then
   ls_error=ls_error+ ' Tipo deConstrucción '	+ '~r~n'
end if 
if isnull(li_COD_PARQUE) or li_COD_PARQUE = 0 then
   ls_error=ls_error+ ' Parque '	+ '~r~n'
end if 
if isnull(li_TIPO_PRODUCTO) or li_TIPO_PRODUCTO = 0 then
   ls_error=ls_error+ ' Tipo de Producto '	+ '~r~n'
end if 
if isnull(li_CAPACIDAD) or li_CAPACIDAD = 0 then
   ls_error=ls_error+ ' Capacidad '	+ '~r~n'
end if 
if isnull(ld_fec_vig)  then
   ls_error=ls_error+ ' Fecha de Vigencia '	+ '~r~n'
end if 
if isnull(ld_valor) or ld_valor = 0 then
   ls_error=ls_error+ ' Valor '	+ '~r~n'
end if 

	
	
if len(trim(ls_error))>0 then
	messagebox('','Debe ingresar el(los) los siguiente(s) valor(es) : ' + '~r~n' + '~r~n'  + '~r~n'  +ls_error )
	return
end if 

if  dw_precio_edit.Describe("lista_precio_cod_parque.Protect") = '0'   then
	int li_existe
	li_existe = f_valida_existencia()
	if li_existe >0 then
		messagebox('Advertencia','Campos clave del Registro ya existen, no se puede ingresar los nuevos valores. ' ,Exclamation!) 
		return
	end if 
end if 

dw_precio_edit.setitem(1,'lista_precio_usuario_crea',gs_user)

IF dw_precio_edit.update() > 0 THEN	
		commit;
		messagebox("Grabar","Grabación Exitosa")
ELSE	
		ROLLBACK;
		MessageBox("Error Grabar","DataBase Error SQL: "+sqlca.sqlerrtext,INFORMATION!)
END IF

li_COD_PARQUE_ORIG = dw_parque.getitemnumber(1,'cod_parque')

IF li_COD_PARQUE = li_COD_PARQUE_ORIG THEN 
		pb_ok.triggerevent(clicked!)
END IF 

dw_precio_edit.RESET()
dw_precio_edit.insertrow(1)
f_bloquea()









end event

type cb_4 from commandbutton within w_listado_precio_mantenedor
integer x = 1358
integer y = 1784
integer width = 338
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo Precio"
end type

event clicked;// desprotegemos de edicion a los campos que son clave - inicio
dw_precio_edit.Modify("lista_precio_cod_parque.Protect=0")
dw_precio_edit.Modify("lista_precio_capacidad.Protect=0")
dw_precio_edit.Modify("lista_precio_t_const.Protect=0")
dw_precio_edit.Modify("lista_precio_tipo_producto.Protect=0")
dw_precio_edit.Modify("lista_precio_sector.Protect=0")
dw_precio_edit.Modify("lista_precio_canal.Protect=0")
dw_precio_edit.Modify("lista_precio_t_sepult.Protect=0")
dw_precio_edit.Modify("lista_precio_fecha_vigencia.Protect=0")
// desprotegemos de edicion a los campos que son clave - termino

// CAMBIA COLOR DE los campos que son clave - inicio
dw_precio_edit.Modify("lista_precio_cod_parque.background.color='16777215'")
dw_precio_edit.Modify("lista_precio_capacidad.background.color='16777215'")
dw_precio_edit.Modify("lista_precio_t_const.background.color='16777215'")
dw_precio_edit.Modify("lista_precio_tipo_producto.background.coloR='16777215'")
dw_precio_edit.Modify("lista_precio_sector.background.coloR='16777215'")
dw_precio_edit.Modify("lista_precio_canal.background.coloR='16777215'")
dw_precio_edit.Modify("lista_precio_t_sepult.background.coloR='16777215'")
dw_precio_edit.Modify("lista_precio_fecha_vigencia.background.coloR='16777215'")	
dw_precio_edit.Modify("lista_precio_estado.background.coloR='16777215'")

// CAMBIA COLOR DE los campos que son clave - TERMINO
	
dw_precio_edit.RESET()
dw_precio_edit.insertrow(1)
dw_precio_edit.setitem(1,'lista_precio_estado','A')
//------------------------------------
DATETIME ldt_fecha

SELECT sysdate
INTO :ldt_fecha
FROM dual;

DATE(ldt_fecha)
//------------------------------------
dw_precio_edit.setitem(1,'lista_precio_fecha_vigencia',DATE(ldt_fecha))
dw_precio_edit.setitem(1,'lista_precio_usuario_crea',gs_user)
dw_precio_edit.setfocus()
dw_precio_edit.enabled = true



end event

type dw_precio_edit from datawindow within w_listado_precio_mantenedor
integer x = 37
integer y = 1120
integer width = 4210
integer height = 600
integer taborder = 20
string title = "none"
string dataobject = "d_listado_precio_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;datawindowchild idw_sector
IF Dwo.name = "lista_precio_cod_parque" THEN
	dw_precio_edit.getchild('lista_precio_sector',idw_sector)
	idw_sector.settransobject(sqlca)
	idw_sector.retrieve(integer(data))
END IF


end event

type pb_ok from picturebutton within w_listado_precio_mantenedor
integer x = 1943
integer y = 24
integer width = 178
integer height = 156
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;Long		ll_cod_parque
String	ls_filtro
dw_parque.accepttext()
ll_cod_parque	= dw_parque.getitemnumber(1,'cod_parque')
if not isnull(ll_cod_parque) then
	dw_1.Retrieve(ll_cod_parque)
	if rb_1.checked=true then
		ls_filtro		= ''
	elseif rb_2.checked=true then
		ls_filtro		= "canal = '"+ "NI" +" '"
	elseif rb_3.checked=true then
		ls_filtro		= "canal = '"+ "NF" +" '"
	end if
	dw_1.setfilter(ls_filtro)
	dw_1.filter()
	dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
	dw_1.sort()
	//------------------------------------
	dw_precio_edit.RESET()
	dw_precio_edit.insertrow(1)
	dw_precio_edit.setitem(1,'lista_precio_estado','A')
end if

end event

type dw_parque from datawindow within w_listado_precio_mantenedor
integer x = 311
integer y = 56
integer width = 599
integer height = 104
integer taborder = 60
string title = "none"
string dataobject = "dwe_lista_codigo_parque_nuestro"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_1.reset()
pb_ok.triggerevent(clicked!)
end event

type st_1 from statictext within w_listado_precio_mantenedor
integer x = 64
integer y = 68
integer width = 242
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parque"
boolean focusrectangle = false
end type

type cb_22 from commandbutton within w_listado_precio_mantenedor
integer x = 786
integer y = 1784
integer width = 261
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;SaveAsType TipoArchivo

datawindow dw_paso
dw_paso	= dw_1
if dw_1.rowcount() > 0 then f_DWToExcel( dw_paso )


end event

type cb_3 from commandbutton within w_listado_precio_mantenedor
integer x = 521
integer y = 1784
integer width = 261
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_1.SETfilter(NULO)
dw_1.filter()
dw_1.filter()
end event

type cb_11 from commandbutton within w_listado_precio_mantenedor
integer x = 256
integer y = 1784
integer width = 261
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_1.SETSORT(NULO)
dw_1.SORT()
dw_1.sort()
end event

type rb_3 from radiobutton within w_listado_precio_mantenedor
integer x = 1641
integer y = 64
integer width = 183
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NF"
end type

event clicked;//dw_1.setfilter(("canal = '"+ "NF" +" '"))
//dw_1.filter()
//dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
//dw_1.sort()
dw_1.reset()
pb_ok.triggerevent(clicked!)
end event

type rb_2 from radiobutton within w_listado_precio_mantenedor
integer x = 1399
integer y = 64
integer width = 169
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NI"
end type

event clicked;dw_1.reset()
//dw_1.setfilter(("canal = '"+ "NI" +" '"))
//dw_1.filter()
//dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
//dw_1.sort()
pb_ok.triggerevent(clicked!)
end event

type rb_1 from radiobutton within w_listado_precio_mantenedor
integer x = 1051
integer y = 64
integer width = 274
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;////dw_1.reset()
////dw_1.Retrieve()
////dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
////dw_1.sort()
//
////dw_1.SetTransObject(SQLCA)
////dw_1.Retrieve()
//dw_1.setfilter("")
//dw_1.filter()
//dw_1.setsort("t_sepult A, sector A, Capacidad A, Canal A")
//dw_1.sort()
dw_1.reset()
pb_ok.triggerevent(clicked!)
end event

type cb_2 from commandbutton within w_listado_precio_mantenedor
integer x = 27
integer y = 1784
integer width = 224
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount()>0 then dw_1.print()
end event

type cb_1 from commandbutton within w_listado_precio_mantenedor
integer x = 2597
integer y = 1784
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

event clicked;close(w_listado_precio_MANTENEDOR)
end event

type dw_1 from datawindow within w_listado_precio_mantenedor
integer x = 32
integer y = 196
integer width = 4206
integer height = 880
integer taborder = 10
string title = "Lista de Precio"
string dataobject = "d_listado_precio_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	f_muestra(row)
end if

end event

type gb_1 from groupbox within w_listado_precio_mantenedor
integer x = 1010
integer y = 12
integer width = 859
integer height = 148
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

