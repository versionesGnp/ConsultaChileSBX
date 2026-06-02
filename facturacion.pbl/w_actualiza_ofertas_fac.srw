forward
global type w_actualiza_ofertas_fac from window
end type
type p_1 from picture within w_actualiza_ofertas_fac
end type
type em_fecha from editmask within w_actualiza_ofertas_fac
end type
type st_3 from statictext within w_actualiza_ofertas_fac
end type
type cb_actualiza from commandbutton within w_actualiza_ofertas_fac
end type
type st_2 from statictext within w_actualiza_ofertas_fac
end type
type st_1 from statictext within w_actualiza_ofertas_fac
end type
type sle_clave from singlelineedit within w_actualiza_ofertas_fac
end type
type sle_usuario from singlelineedit within w_actualiza_ofertas_fac
end type
type cb_aceptar from commandbutton within w_actualiza_ofertas_fac
end type
type cb_cancelar from commandbutton within w_actualiza_ofertas_fac
end type
type ln_1 from line within w_actualiza_ofertas_fac
end type
type ln_2 from line within w_actualiza_ofertas_fac
end type
type gb_1 from groupbox within w_actualiza_ofertas_fac
end type
type dw_1 from datawindow within w_actualiza_ofertas_fac
end type
end forward

global type w_actualiza_ofertas_fac from window
integer x = 832
integer y = 360
integer width = 1705
integer height = 484
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
p_1 p_1
em_fecha em_fecha
st_3 st_3
cb_actualiza cb_actualiza
st_2 st_2
st_1 st_1
sle_clave sle_clave
sle_usuario sle_usuario
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
ln_1 ln_1
ln_2 ln_2
gb_1 gb_1
dw_1 dw_1
end type
global w_actualiza_ofertas_fac w_actualiza_ofertas_fac

type variables
datetime fecha
end variables

forward prototypes
public function integer wf_actualizar (string fecha_cierre)
end prototypes

public function integer wf_actualizar (string fecha_cierre);string serie,estado
long contrato
datetime fecha1
long		ll_tot_reg,ll_indi


fecha1 					= datetime(date(fecha_cierre),time('00:00:00'))
ll_tot_reg				= dw_1.retrieve(fecha1)
if ll_tot_reg>0 then
	for ll_indi=1 to ll_tot_reg
		serie 	= dw_1.getitemstring(ll_indi,'serie')
		contrato = dw_1.getitemnumber(ll_indi,'numero')
		estado   = dw_1.getitemstring(ll_indi,'estado')
		if estado = 'N' or estado = 'S' then
			UPDATE  PAGO_OFERTA  
				SET  FACTURA  = 99   
			WHERE   SERIE = :serie  AND  
					  NRO_OFERTA = :contrato  ;
			If sqlca.sqlcode < 0 Then
				MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_actualiza()")
				ROLLBACK;
				return -1
			ELSE
				COMMIT;
			end if	
		elseif estado = 'R' then
			UPDATE  PAGO_OFERTA  
				SET  FACTURA  = 0   
			WHERE   SERIE = :serie  AND  
					  NRO_OFERTA = :contrato  ;
			If sqlca.sqlcode < 0 Then
				MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nf_actualiza()")
				ROLLBACK;
				return -1
			ELSE
				COMMIT;
			end if	
		end if	
	next
end if	
return 1
end function

on w_actualiza_ofertas_fac.create
this.p_1=create p_1
this.em_fecha=create em_fecha
this.st_3=create st_3
this.cb_actualiza=create cb_actualiza
this.st_2=create st_2
this.st_1=create st_1
this.sle_clave=create sle_clave
this.sle_usuario=create sle_usuario
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.ln_1=create ln_1
this.ln_2=create ln_2
this.gb_1=create gb_1
this.dw_1=create dw_1
this.Control[]={this.p_1,&
this.em_fecha,&
this.st_3,&
this.cb_actualiza,&
this.st_2,&
this.st_1,&
this.sle_clave,&
this.sle_usuario,&
this.cb_aceptar,&
this.cb_cancelar,&
this.ln_1,&
this.ln_2,&
this.gb_1,&
this.dw_1}
end on

on w_actualiza_ofertas_fac.destroy
destroy(this.p_1)
destroy(this.em_fecha)
destroy(this.st_3)
destroy(this.cb_actualiza)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_clave)
destroy(this.sle_usuario)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name+' - ( Actualiza Oferta Facturación )'
em_fecha.text = string(today(),'dd/mm/yyyy')
dw_1.settransobject(sqlca)
end event

type p_1 from picture within w_actualiza_ofertas_fac
integer x = 1070
integer y = 560
integer width = 82
integer height = 88
string picturename = "boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf,cont
//datetime fecha

if f_valida_fecha(em_fecha.text)=-1 then 
	em_fecha.text=string(today(),gs_formato_fecha)
	em_fecha.setfocus()
	return
end if	
if em_fecha.text<>'00/00/0000' then
	ls_fecha = em_fecha.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fecha.text = Message.StringParm
end if	
fech = em_fecha.text
fecha = datetime(date(fech),time('00:00:00'))
select count(serie) into :cont from factura_oferta where fecha_cierre =:fecha ;
if cont > 0 then
	cb_actualiza.enabled = true
else
	messagebox(gs_app_name,'No existen registros para esta fecha',stopsign!)
	cb_actualiza.enabled = false
end if
end event

type em_fecha from editmask within w_actualiza_ofertas_fac
integer x = 539
integer y = 552
integer width = 512
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = "~r"
end type

type st_3 from statictext within w_actualiza_ofertas_fac
integer x = 233
integer y = 40
integer width = 1106
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Ingrese su nombre de usuario y clave personal"
boolean focusrectangle = false
end type

type cb_actualiza from commandbutton within w_actualiza_ofertas_fac
integer x = 155
integer y = 680
integer width = 1376
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "~'Actualizar &Ofertas~'"
end type

event clicked;integer ret
string fec
ret = messagebox(gs_app_name,'          ¿ Esta seguro que desea actualizar ?~n~r~n~r~n~rLa Actualización cambiará de estado todas las Ofertas,~n~r'+&
		"    dejandolas como 'Facturadas'.",Question!,YesNoCancel! ,3)
if ret = 1 then
	setpointer(HourGlass!)
	fec = trim(em_fecha.text)
	if wf_actualizar(fec) = 1 then messagebox(gs_app_name,'Actualización terminada',information!)
	setpointer(Arrow!)
	close(w_actualiza_ofertas_fac)
elseif ret = 2 then
	close(w_actualiza_ofertas_fac)
end if
end event

type st_2 from statictext within w_actualiza_ofertas_fac
integer x = 155
integer y = 252
integer width = 192
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Clave:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_actualiza_ofertas_fac
integer x = 96
integer y = 148
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type sle_clave from singlelineedit within w_actualiza_ofertas_fac
integer x = 389
integer y = 244
integer width = 672
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
boolean password = true
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_usuario from singlelineedit within w_actualiza_ofertas_fac
integer x = 389
integer y = 140
integer width = 672
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type cb_aceptar from commandbutton within w_actualiza_ofertas_fac
integer x = 1093
integer y = 140
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;string is_acceso, is_clave, is_usuario

is_usuario = Upper(sle_usuario.text)

 SELECT "ENCARGADOS"."PASSWORD",   
         "ENCARGADOS"."ACCESO",
			"ENCARGADOS"."NOMBRE"
    INTO :is_clave,   
         :is_acceso,
			:gs_nombre_usuario
    FROM "ENCARGADOS"  
   WHERE "ENCARGADOS"."CODIGO_USUARIO" = :is_usuario;    

IF is_clave = Upper(sle_clave.text) and sle_clave.text<>'' THEN
	gi_nivel_acceso = 1
	
	IF LEN(gs_nombre_usuario) > 5 THEN 
		gs_nombre_usuario = Mid(gs_nombre_usuario,1,5)
	END IF
	w_actualiza_ofertas.height=1009
	w_actualiza_ofertas.x = 988
	w_actualiza_ofertas.y = 689
	this.enabled = false
	sle_clave.enabled = false
	sle_usuario.enabled = false
	sle_clave.displayonly = false
	sle_usuario.displayonly = false	
	sle_clave.text = ''
	sle_usuario.text = ''
	em_fecha.setfocus()
ELSE
	MessageBox(gs_app_name, "El usuario no se encuentra o su clave es incorrecta.")
	sle_clave.text = ""
	sle_clave.SetFocus( )
END IF
end event

type cb_cancelar from commandbutton within w_actualiza_ofertas_fac
integer x = 1093
integer y = 248
integer width = 402
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(w_actualiza_ofertas_fac)
end event

type ln_1 from line within w_actualiza_ofertas_fac
integer linethickness = 9
integer beginx = 110
integer beginy = 436
integer endx = 1586
integer endy = 436
end type

type ln_2 from line within w_actualiza_ofertas_fac
long linecolor = 16777215
integer linethickness = 9
integer beginx = 110
integer beginy = 444
integer endx = 1586
integer endy = 444
end type

type gb_1 from groupbox within w_actualiza_ofertas_fac
integer x = 96
integer y = 468
integer width = 1499
integer height = 376
integer taborder = 60
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 79741120
string text = "Actualización de Ofertas"
end type

type dw_1 from datawindow within w_actualiza_ofertas_fac
integer x = 1888
integer y = 320
integer width = 494
integer height = 360
integer taborder = 71
boolean bringtotop = true
boolean titlebar = true
string dataobject = "dw_update_ofertas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

