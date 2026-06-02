forward
global type w_aviso_mensajes from window
end type
type cb_aplica from commandbutton within w_aviso_mensajes
end type
type pb_fin from picturebutton within w_aviso_mensajes
end type
type pb_antes from picturebutton within w_aviso_mensajes
end type
type pb_sigue from picturebutton within w_aviso_mensajes
end type
type pb_primer from picturebutton within w_aviso_mensajes
end type
type cb_guardar from commandbutton within w_aviso_mensajes
end type
type cb_cerrar from commandbutton within w_aviso_mensajes
end type
type st_1 from statictext within w_aviso_mensajes
end type
type dw_lista from datawindow within w_aviso_mensajes
end type
type gb_1 from groupbox within w_aviso_mensajes
end type
end forward

global type w_aviso_mensajes from window
integer width = 2779
integer height = 1416
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_aplica cb_aplica
pb_fin pb_fin
pb_antes pb_antes
pb_sigue pb_sigue
pb_primer pb_primer
cb_guardar cb_guardar
cb_cerrar cb_cerrar
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
end type
global w_aviso_mensajes w_aviso_mensajes

type variables
String	is_opcion, is_estado_gestion
end variables

forward prototypes
public subroutine f_valida_cambio_fila ()
public subroutine f_open_pantalla ()
end prototypes

public subroutine f_valida_cambio_fila ();// -- vhfb - inicio
if dw_lista.rowcount()>0 then
	is_estado_gestion = dw_lista.getitemstring(dw_lista.getrow(),'estado_gestion')
	
	if is_estado_gestion = 'A' and dw_lista.getitemnumber(dw_lista.getrow(),'descuento') > 0 then
		cb_aplica.enabled=true
	else		
		cb_aplica.enabled=false
	end if 
		
end if
// -- vhfb - termino
end subroutine

public subroutine f_open_pantalla ();datetime	ldt_fecha_hoy
decimal ldec_descuento

ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))

if gs_depto = 'F' or gs_depto = 'P' or gs_depto = 'O' or gs_depto = 'I' or ( gs_depto='E' and gs_digita = '1' ) then
	cb_guardar.enabled	= true
else
	cb_guardar.enabled	= false
end if

if is_opcion='R' then
	this.title				= 'Lista de Mensajes Asociado al Rut  '+string(gi_rut,'###,###,###,###')+'-'+gs_dv
	dw_lista.dataobject	= 'dw_mostrar_mensajes_por_rut'
	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(gi_rut)=0 then
		close(w_aviso_mensajes)
		return
	end if
elseif is_opcion='C' then
	this.title				= 'Lista de Mensajes Asociado al Contrato Nº  '+gs_base+'-'+gs_serie+'-'+string(gi_numero,'###,###,###,###')
	dw_lista.dataobject	= 'dw_mostrar_mensajes_por_contrato'
	dw_lista.settransobject(sqlca)
	if dw_lista.retrieve(gs_base,gs_serie,gi_numero)=0 then
		close(w_aviso_mensajes)
		return
	end if
end if

// -- vhfb - inicio - determina si el registro en pantalla presenta descuento para que boton aplicar descuento este disponible


// -- vhfb - 20251014 - se cambia el origen del descuento para que lo saque desde DESCUENTOS WEB - inicio

SELECT
       C.VALOR_dESCUENTO
      into :ldec_descuento
FROM CADENA A
JOIN WEB_DESCUENTOS_DETALLE B 
  ON A.CODIGO = B.BASE
 AND A.SERIE  = B.SERIE
 AND A.NUMERO = B.NUMERO
 AND A.CODIGO_TRAMO = B.CODIGO_TRAMO
JOIN WEB_DESCUENTOS_TRAMO C
  ON C.CODIGO_TRAMO = B.CODIGO_TRAMO
WHERE 
C.ESTADO = 'A' AND 
B.ESTADO_REG = 'V'
AND 
A.NUMERO = :gi_numero
and A.serie = :gs_serie
AND CODIGO =:gs_base ;

if dw_lista.rowcount()> 0 then
   if isnull(ldec_descuento) then
		 ldec_descuento = 0 
   else 		
   		 ldec_descuento = ldec_descuento	
end if
	
   dw_lista.setitem(1,'descuento', ldec_descuento)
		if dw_lista.getitemnumber(1,'descuento') > 0  then
			cb_aplica.enabled = true
		else 
			cb_aplica.enabled = false	
		end if 
end if 
	
// -- vhfb - 20251014 - se cambia el origen del descuento para que lo saque desde DESCUENTOS WEB - termino



if dw_lista.getitemnumber(1,'descuento') > 0  then
	cb_aplica.enabled = true
else 
	cb_aplica.enabled = false	
end if 	
// -- vhfb - termino - determina si el registro en pantalla presenta descuento para que boton aplicar descuento este disponible

















end subroutine

on w_aviso_mensajes.create
this.cb_aplica=create cb_aplica
this.pb_fin=create pb_fin
this.pb_antes=create pb_antes
this.pb_sigue=create pb_sigue
this.pb_primer=create pb_primer
this.cb_guardar=create cb_guardar
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.cb_aplica,&
this.pb_fin,&
this.pb_antes,&
this.pb_sigue,&
this.pb_primer,&
this.cb_guardar,&
this.cb_cerrar,&
this.st_1,&
this.dw_lista,&
this.gb_1}
end on

on w_aviso_mensajes.destroy
destroy(this.cb_aplica)
destroy(this.pb_fin)
destroy(this.pb_antes)
destroy(this.pb_sigue)
destroy(this.pb_primer)
destroy(this.cb_guardar)
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;long		ll_new
datetime	ldt_fecha_hoy
BOOLEAN lb_aplica

gf_centrar(w_aviso_mensajes)
dw_lista.settransobject(sqlca)

is_opcion					= Trim(Message.StringParm)

// -- vhfb - inicio
lb_aplica = false

if len(is_opcion) = 2 then
	is_opcion = left(is_opcion,1)
	lb_aplica = true
end if 
// -- vhfb - TERMINO

f_open_pantalla()

// -- vhfb - inicio
//if dw_lista.rowcount()>0 then
//	
//	// - VALIDAMOS SI EXITE ALGUN MENSAJE CON DESCUENTO ACTIVO - INICIO
//	long ll_row_found
//	
//	ll_row_found = dw_lista.Find("DESCUENTO > 0",1, dw_lista.RowCount())	
//	
//	if ll_row_found > 0 and dw_lista.rowcount()>0 then
//		messagebox('Atención','Existe descuento ingresado en mensaje : ' + string(ll_row_found) + ', para su consideración.')
//	end if 	
//    // - VALIDAMOS SI EXITE ALGUN MENSAJE CON DESCUENTO ACTIVO - TERMINO
//
//	is_estado_gestion = dw_lista.getitemstring(1,'estado_gestion')
//	
//	if dw_lista.getitemnumber(1,'descuento') > 0 and lb_aplica then
//	   cb_aplica.enabled= true
//	   cb_aplica.visible= true
//	end if 
//	
//	if lb_aplica = false then
	   cb_aplica.enabled= false
	   cb_aplica.visible= false
//	end if 	
//	
//end if
//// -- vhfb - termino





end event

type cb_aplica from commandbutton within w_aviso_mensajes
integer x = 3296
integer y = 208
integer width = 539
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Aplicar Descuento"
end type

event clicked;// vhfb - inicio -  rescate del valor del descuento si procede

long ll_row_found, ll_fila
gd_descuento = 0

ll_fila = dw_lista.getRow()

gs_aplica_a =  dw_lista.getitemstring(ll_fila,'aplica_a')

if gs_aplica_a <> 'N' then 
   gd_descuento = dw_lista.getitemnumber(ll_fila,'descuento')
else
	gs_aplica_a = ''
	gd_descuento = 0
end if 
// vhfb - inicio -  rescate del valor del descuento si procede
close(w_aviso_mensajes)
end event

type pb_fin from picturebutton within w_aviso_mensajes
integer x = 1522
integer y = 1200
integer width = 119
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "fin.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(dw_lista.rowcount())
dw_lista.setfocus()
f_valida_cambio_fila()
end event

type pb_antes from picturebutton within w_aviso_mensajes
integer x = 1399
integer y = 1200
integer width = 119
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "sigue.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollNextPage( )
dw_lista.setfocus()
f_valida_cambio_fila()
end event

type pb_sigue from picturebutton within w_aviso_mensajes
integer x = 1275
integer y = 1200
integer width = 119
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "antes.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollPriorPage( )
dw_lista.setfocus()
f_valida_cambio_fila()
end event

type pb_primer from picturebutton within w_aviso_mensajes
integer x = 1152
integer y = 1200
integer width = 119
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "primer.bmp"
alignment htextalign = left!
end type

event clicked;dw_lista.ScrollToRow(1)
dw_lista.setfocus()

f_valida_cambio_fila()

end event

type cb_guardar from commandbutton within w_aviso_mensajes
integer x = 41
integer y = 1188
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Guardar"
end type

event clicked;long		ret
datetime	ldt_fecha_hoy

ret	= MessageBox('Actualizar', "Desea Grabar Mensaje", Question!, YesNo!, 2)
IF ret = 1 THEN
	
	// -- vhfb - inicio - valida cambio de estado de mensaje para paso a gestionado siempre y 
	//                            cuando su estado inicial fuera distinto a gestionado
	if dw_lista.getitemstring(1,'estado_gestion') = 'G' and is_estado_gestion <> 'G' then
			dw_lista.setitem(1,'fecha_fin',gdt_fec_sistema)
			dw_lista.accepttext()
		end if 	
	// -- vhfb - termino
		
	// -- vhfb - inicio - valida cambio de estado de mensaje para paso a inactivo siempre y 
	//                            cuando su estado inicial fuera distinto a inactivo
	if dw_lista.getitemstring(1,'estado_gestion') = 'I' and is_estado_gestion <> 'I' then
			datetime gdt_fec_sistema_2
			gdt_fec_sistema_2	= datetime(RelativeDate(date(gdt_fec_sistema), -1))
			dw_lista.setitem(1,'fecha_fin',gdt_fec_sistema_2)
			dw_lista.accepttext()
		end if 	
	// -- vhfb - termino	
	
	if dw_lista.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Mensaje: "+sqlca.sqlerrtext)
	end if
	
	f_open_pantalla()	
	
end if
end event

type cb_cerrar from commandbutton within w_aviso_mensajes
integer x = 2295
integer y = 1188
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;//// vhfb - inicio -  rescate del valor del descuento si procede
//gs_aplica_a = ''
//gd_descuento = 0
// vhfb - inicio -  rescate del valor del descuento si procede
close(w_aviso_mensajes)
end event

type st_1 from statictext within w_aviso_mensajes
integer x = 50
integer y = 32
integer width = 1207
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Lista de Mensajes"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_aviso_mensajes
integer x = 14
integer y = 136
integer width = 2702
integer height = 980
integer taborder = 10
string title = "none"
string dataobject = "dw_mostrar_mensajes_por_rut"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna
Datetime	ldt_fec_hoy

ldt_fec_hoy		= datetime(date(gdt_fec_sistema),time('00:00:00'))
ls_columna		= this.GetColumnName()
if ls_columna='estado_gestion' then
	this.setitem(this.getrow(),'usuario_fin',gs_user)
	this.setitem(this.getrow(),'fecha_gestion',ldt_fec_hoy)
end if
this.accepttext()
end event

type gb_1 from groupbox within w_aviso_mensajes
integer x = 1120
integer y = 1144
integer width = 553
integer height = 168
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

