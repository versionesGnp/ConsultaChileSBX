forward
global type w_5_porciento_ofertas from window
end type
type p_1 from picture within w_5_porciento_ofertas
end type
type em_fecha_cierre from editmask within w_5_porciento_ofertas
end type
type st_7 from statictext within w_5_porciento_ofertas
end type
type st_4 from statictext within w_5_porciento_ofertas
end type
type hpb_1 from hprogressbar within w_5_porciento_ofertas
end type
type st_3 from statictext within w_5_porciento_ofertas
end type
type cb_actualiza from commandbutton within w_5_porciento_ofertas
end type
type st_2 from statictext within w_5_porciento_ofertas
end type
type st_1 from statictext within w_5_porciento_ofertas
end type
type sle_clave from singlelineedit within w_5_porciento_ofertas
end type
type sle_usuario from singlelineedit within w_5_porciento_ofertas
end type
type cb_aceptar from commandbutton within w_5_porciento_ofertas
end type
type cb_cancelar from commandbutton within w_5_porciento_ofertas
end type
type ln_1 from line within w_5_porciento_ofertas
end type
type ln_2 from line within w_5_porciento_ofertas
end type
type gb_1 from groupbox within w_5_porciento_ofertas
end type
end forward

global type w_5_porciento_ofertas from window
integer x = 832
integer y = 360
integer width = 1701
integer height = 492
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
p_1 p_1
em_fecha_cierre em_fecha_cierre
st_7 st_7
st_4 st_4
hpb_1 hpb_1
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
end type
global w_5_porciento_ofertas w_5_porciento_ofertas

type variables
datetime fecha
end variables

forward prototypes
public function integer wf_actualizar (string fecha_cierre)
end prototypes

public function integer wf_actualizar (string fecha_cierre);datetime fecha1

fecha1 = datetime(date(fecha_cierre),time('00:00:00'))
DELETE FROM "FACTURA_OFERTA"  
WHERE ( "FACTURA_OFERTA"."BASE" = 'O' ) AND  
      ( "FACTURA_OFERTA"."FECHA_CIERRE" = :FECHA1 ) ;
If sqlca.sqlcode < 0 Then
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_actualiza()")
	ROLLBACK;
ELSE
	COMMIT;
end if	
DELETE FROM "FACTURA_OFERTA_DV"  
WHERE ( "FACTURA_OFERTA_DV"."BASE" = 'O' ) AND  
      ( "FACTURA_OFERTA_DV"."FECHA_CIERRE" = :FECHA1 ) ;
If sqlca.sqlcode < 0 Then
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_actualiza()")
	ROLLBACK;
ELSE
	COMMIT;
end if
DELETE FROM "FACTURA_OFERTA_DV_M"  
WHERE ( "FACTURA_OFERTA_DV_M"."BASE" = 'O' ) AND  
      ( "FACTURA_OFERTA_DV_M"."FECHA_CIERRE" = :FECHA1 ) ;
If sqlca.sqlcode < 0 Then
	MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_actualiza()")
	ROLLBACK;
ELSE
	COMMIT;
end if	
return 1
end function

on w_5_porciento_ofertas.create
this.p_1=create p_1
this.em_fecha_cierre=create em_fecha_cierre
this.st_7=create st_7
this.st_4=create st_4
this.hpb_1=create hpb_1
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
this.Control[]={this.p_1,&
this.em_fecha_cierre,&
this.st_7,&
this.st_4,&
this.hpb_1,&
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
this.gb_1}
end on

on w_5_porciento_ofertas.destroy
destroy(this.p_1)
destroy(this.em_fecha_cierre)
destroy(this.st_7)
destroy(this.st_4)
destroy(this.hpb_1)
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
end on

event open;this.x = ( gl_width - this.width)/2
this.y = ( gl_height - this.height)/2
this.title = gs_app_name+' - ( Buscando Ingresos )'
em_fecha_cierre.text = string(today(),'dd/mm/yyyy')


end event

type p_1 from picture within w_5_porciento_ofertas
integer x = 955
integer y = 576
integer width = 82
integer height = 88
string picturename = "c:boton.bmp"
boolean focusrectangle = false
end type

event clicked;string ls_fecha,fech
long uf

if f_valida_fecha(em_fecha_cierre.text)=-1 then 
	em_fecha_cierre.text=string(today(),gs_formato_fecha)
	em_fecha_cierre.setfocus()
	return
end if	
if em_fecha_cierre.text<>'00/00/0000' then
	ls_fecha = em_fecha_cierre.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)

IF Message.StringParm <> ls_fecha THEN
	em_fecha_cierre.text = Message.StringParm
end if	
end event

type em_fecha_cierre from editmask within w_5_porciento_ofertas
integer x = 571
integer y = 572
integer width = 361
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
string mask = "[date]"
string displaydata = ""
end type

event modified;//string fech
//long uf
//datetime fecha
//
//fech = em_fecha_cierre.text
//fecha = datetime(date(fech),time('23:59:59'))
//select valor_uf into :uf from tab_uf where fecha_uf=:fecha;
//CHOOSE CASE sqlca.sqlcode
//	case -1
//		messagebox(gs_app_name,sqlca.SQLErrText,information!)
//		RETURN
//	case 100	
//		messagebox(gs_app_name,'No existe valor de U.F. al dia '+em_fecha_cierre.text+'.~n~rFavor de avisar al administrador del sistemas',stopsign!)
//		RETURN
//END CHOOSE
end event

type st_7 from statictext within w_5_porciento_ofertas
integer x = 155
integer y = 888
integer width = 1376
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_5_porciento_ofertas
integer x = 155
integer y = 828
integer width = 1376
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_5_porciento_ofertas
integer x = 155
integer y = 964
integer width = 1376
integer height = 108
unsignedinteger maxposition = 100
integer setstep = 10
end type

type st_3 from statictext within w_5_porciento_ofertas
integer x = 233
integer y = 40
integer width = 1106
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Ingrese su nombre de usuario y clave personal"
boolean focusrectangle = false
end type

type cb_actualiza from commandbutton within w_5_porciento_ofertas
integer x = 155
integer y = 716
integer width = 1376
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "~'Ingresos &Promesas~'"
end type

event clicked;integer ret,dia
string fecha1,base,serie,moneda, mes, año
long numero,precio,i,j,h,monto,facturado
date fecha_pago,fecha_traspaso
date fecha_cierre//, fecha_ant
datetime fecha_cierre_paso, fecha_ant_paso
double total_pagado, total_pag, porcentaje,valor_uf, porc,valor_uf_cierre
datastore ds_promesas,ds_ingresos


fecha_cierre 									= date(em_fecha_cierre.text)
ds_promesas = Create DataStore
ds_promesas.DataObject = "dw_porcentaje_factura_oferta"
ds_promesas.SetTransObject(sqlca)
ret = messagebox(gs_app_name,'          ¿ Esta seguro que desea Actualizar los Ingresos de Promesas. ?',Question!,YesNoCancel! ,3)
this.enabled = false
SetPointer ( HourGlass! )
if ret = 1 then
	if ds_promesas.retrieve(fecha_cierre) > 0 then
		hpb_1.minposition = 0
		hpb_1.maxposition = ds_promesas.rowcount()
		hpb_1.position = 0
		hpb_1.setstep = 10
		for i = 1 to ds_promesas.rowcount()
			hpb_1.position = i
			st_4.text = 'Reg. N° '+string(i,'###,###,###')+' de '+string(ds_promesas.rowcount(),'###,###,###')+' ( '+string((i*100)/ds_promesas.rowcount(),'#0.##')+'% )'
			base   = ds_promesas.getitemstring(i,'base')
			serie  = ds_promesas.getitemstring(i,'serie')
			numero = ds_promesas.getitemnumber(i,'numero')
			porcentaje = ds_promesas.getitemnumber(i,'porcentaje')
//-------------------------------------------------------------------------------------------------------------------------------
			UPDATE "FACTURA_OFERTA"  
			SET "PORCENTAJE_PAGO" = :porcentaje   
			WHERE ( "FACTURA_OFERTA"."BASE" = :base ) AND  
			( "FACTURA_OFERTA"."SERIE" = :serie ) AND  
			( "FACTURA_OFERTA"."NUMERO" = :numero ) AND  
			( "FACTURA_OFERTA"."FECHA_CIERRE" = :fecha_cierre ) AND  
			("FACTURA_OFERTA"."ESTADO" = 'N' OR "FACTURA_OFERTA"."ESTADO" = 'S' OR "FACTURA_OFERTA"."ESTADO" = 'R' OR "FACTURA_OFERTA"."ESTADO" = 'V') ;
//-------------------------------------------------------------------------------------------------------------------------------
			if sqlca.sqlcode < 0 then
				messagebox('Error de Procedimiento',SQLCA.SQLErrText)
				ROLLBACK;
			else
				commit;
				h++
				st_7.text = string(h,'###,###,###')+' Reg. Actualizados'+' ( '+string((h*100)/ds_promesas.rowcount(),'#0.##')+'% )'
			end if
		next
	end if
end if

DECLARE x1 PROCEDURE FOR SP_PRIMERA_FACTURACION ;
execute x1;
if sqlca.sqlcode < 0 then
	messagebox('Error de Procedimiento',SQLCA.SQLErrText+' (SP_PRIMERA_FACTURACION)')
end if



SetPointer ( Arrow! )
messagebox(gs_app_name,'Proceso terminado',information!)
this.enabled = true
end event

type st_2 from statictext within w_5_porciento_ofertas
integer x = 155
integer y = 252
integer width = 192
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Clave:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_5_porciento_ofertas
integer x = 96
integer y = 148
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type sle_clave from singlelineedit within w_5_porciento_ofertas
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

type sle_usuario from singlelineedit within w_5_porciento_ofertas
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

type cb_aceptar from commandbutton within w_5_porciento_ofertas
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

SELECT 	"ENCARGADOS"."PASSWORD",   
			"ENCARGADOS"."ACCESO",
			"ENCARGADOS"."NOMBRE"
INTO 		:is_clave,   
			:is_acceso,
			:gs_nombre_usuario
FROM 	"ENCARGADOS"  
WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :is_usuario;    

IF is_clave = Upper(sle_clave.text) and sle_clave.text<>'' THEN
	gi_nivel_acceso = 1
	
	IF LEN(gs_nombre_usuario) > 5 THEN 
		gs_nombre_usuario = Mid(gs_nombre_usuario,1,5)
	END IF
	w_5_porciento_ofertas.height=1320
	this.enabled = false
	sle_clave.enabled = false
	sle_usuario.enabled = false
	sle_clave.displayonly = false
	sle_usuario.displayonly = false	
	sle_clave.text = ''
	sle_usuario.text = ''

ELSE
	MessageBox(gs_app_name, "El usuario no se encuentra o su clave es incorrecta.")
	sle_clave.text = ""
	sle_clave.SetFocus( )
END IF
this.enabled = false
end event

type cb_cancelar from commandbutton within w_5_porciento_ofertas
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

event clicked;close(w_5_porciento_ofertas)
end event

type ln_1 from line within w_5_porciento_ofertas
integer linethickness = 9
integer beginx = 110
integer beginy = 436
integer endx = 1586
integer endy = 436
end type

type ln_2 from line within w_5_porciento_ofertas
long linecolor = 16777215
integer linethickness = 9
integer beginx = 114
integer beginy = 444
integer endx = 1591
integer endy = 444
end type

type gb_1 from groupbox within w_5_porciento_ofertas
integer x = 96
integer y = 468
integer width = 1495
integer height = 676
integer taborder = 60
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Buscando Ingresos ( Cadena_Factura )"
end type

