forward
global type w_35_porciento_pagare from window
end type
type st_7 from statictext within w_35_porciento_pagare
end type
type st_4 from statictext within w_35_porciento_pagare
end type
type dw_ifrs from datawindow within w_35_porciento_pagare
end type
type p_1 from picture within w_35_porciento_pagare
end type
type em_fecha_cierre from editmask within w_35_porciento_pagare
end type
type hpb_1 from hprogressbar within w_35_porciento_pagare
end type
type st_3 from statictext within w_35_porciento_pagare
end type
type cb_actualiza from commandbutton within w_35_porciento_pagare
end type
type st_2 from statictext within w_35_porciento_pagare
end type
type st_1 from statictext within w_35_porciento_pagare
end type
type sle_clave from singlelineedit within w_35_porciento_pagare
end type
type sle_usuario from singlelineedit within w_35_porciento_pagare
end type
type cb_aceptar from commandbutton within w_35_porciento_pagare
end type
type cb_cancelar from commandbutton within w_35_porciento_pagare
end type
type ln_1 from line within w_35_porciento_pagare
end type
type ln_2 from line within w_35_porciento_pagare
end type
type gb_1 from groupbox within w_35_porciento_pagare
end type
end forward

global type w_35_porciento_pagare from window
integer x = 832
integer y = 360
integer width = 1646
integer height = 492
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_7 st_7
st_4 st_4
dw_ifrs dw_ifrs
p_1 p_1
em_fecha_cierre em_fecha_cierre
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
global w_35_porciento_pagare w_35_porciento_pagare

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

on w_35_porciento_pagare.create
this.st_7=create st_7
this.st_4=create st_4
this.dw_ifrs=create dw_ifrs
this.p_1=create p_1
this.em_fecha_cierre=create em_fecha_cierre
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
this.Control[]={this.st_7,&
this.st_4,&
this.dw_ifrs,&
this.p_1,&
this.em_fecha_cierre,&
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

on w_35_porciento_pagare.destroy
destroy(this.st_7)
destroy(this.st_4)
destroy(this.dw_ifrs)
destroy(this.p_1)
destroy(this.em_fecha_cierre)
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

event open;connect using Trans_1;

this.x 												= ( gl_width - this.width)/2
this.y 												= ( gl_height - this.height)/2
this.title 											= gs_app_name+' - ( Buscando Ingresos )'
em_fecha_cierre.text 							= string(today(),'dd/mm/yyyy')
dw_ifrs.dataobject								= 'dwe_ifrs'
dw_ifrs.settransobject(sqlca)



end event

event close;disconnect using Trans_1;
end event

type st_7 from statictext within w_35_porciento_pagare
integer x = 155
integer y = 904
integer width = 1376
integer height = 68
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

type st_4 from statictext within w_35_porciento_pagare
integer x = 155
integer y = 832
integer width = 1376
integer height = 68
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

type dw_ifrs from datawindow within w_35_porciento_pagare
integer x = 1714
integer y = 56
integer width = 1385
integer height = 1092
integer taborder = 80
string title = "none"
string dataobject = "dwe_ifrs"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_35_porciento_pagare
integer x = 937
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

type em_fecha_cierre from editmask within w_35_porciento_pagare
integer x = 571
integer y = 572
integer width = 361
integer height = 92
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

event modified;cb_actualiza.enabled 			= true
end event

type hpb_1 from hprogressbar within w_35_porciento_pagare
integer x = 155
integer y = 988
integer width = 1376
integer height = 108
unsignedinteger maxposition = 100
integer setstep = 10
end type

type st_3 from statictext within w_35_porciento_pagare
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

type cb_actualiza from commandbutton within w_35_porciento_pagare
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
string text = "~'Ingresos &Pagare~'"
end type

event clicked;string	ls_base,ls_serie,ls_estado
long		ll_res,ll_numero,ll_new,ll_tot_reg
datetime	ldt_fecha_cierre,ldt_fecha
double	ldb_porcentaje

ldt_fecha_cierre						= datetime(date(em_fecha_cierre.text),time('00:00:00'))
ls_estado								= 'S'
SELECT	MAX("FACTURA_PAGARE"."FECHA_CIERRE")  
INTO 		:ldt_fecha  
FROM 		"FACTURA_PAGARE"  
WHERE 	"FACTURA_PAGARE"."FECHA_CIERRE" = :ldt_fecha_cierre
USING		sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ldt_fecha) then
		ll_res 							= messagebox("Actualizar","¿ Esta seguro que desea Actualizar los Ingresos de Págare ?",Question!,YesNoCancel! ,3)
		this.enabled 					= true
		if ll_res = 1 then
			SetPointer ( HourGlass! )
			SELECT	COUNT("FACTURA_PAGARE"."BASE")
			INTO		:ll_tot_reg
			FROM		"FACTURA_PAGARE",	"CADENA"  
			WHERE 	( "FACTURA_PAGARE"."BASE" = "CADENA"."CODIGO" ) and  
						( "FACTURA_PAGARE"."NUMERO" = "CADENA"."NUMERO" ) and  
						( "FACTURA_PAGARE"."SERIE" = "CADENA"."SERIE" ) and 
						( "FACTURA_PAGARE"."BASE" = 'P' ) AND  
						( "FACTURA_PAGARE"."PORCENTAJE_PAGO" >= 35 ) AND  
						( "CADENA"."ESTADO_IFRS" = 'N' ) AND
						( "FACTURA_PAGARE"."ESTADO" = 'N' OR "FACTURA_PAGARE"."ESTADO" = 'S' ) AND
						( "FACTURA_PAGARE"."FECHA_CIERRE" = :ldt_fecha_cierre) AND
						( "CADENA"."FECHA_IFRS" is null )
			USING		sqlca;
			if sqlca.sqlcode=0 then
			end if
				
			DECLARE x1 CURSOR FOR
			SELECT	"FACTURA_PAGARE"."BASE",	"FACTURA_PAGARE"."SERIE",	"FACTURA_PAGARE"."NUMERO",	"FACTURA_PAGARE"."PORCENTAJE_PAGO"  
			FROM		"FACTURA_PAGARE",	"CADENA"  
			WHERE 	( "FACTURA_PAGARE"."BASE" = "CADENA"."CODIGO" ) and  
						( "FACTURA_PAGARE"."NUMERO" = "CADENA"."NUMERO" ) and  
						( "FACTURA_PAGARE"."SERIE" = "CADENA"."SERIE" ) and 
						( "FACTURA_PAGARE"."BASE" = 'P' ) AND  
						( "FACTURA_PAGARE"."PORCENTAJE_PAGO" >= 35 ) AND  
						( "CADENA"."ESTADO_IFRS" = 'N' ) AND
						( "FACTURA_PAGARE"."ESTADO" = 'N' OR "FACTURA_PAGARE"."ESTADO" = 'S' ) AND
						( "FACTURA_PAGARE"."FECHA_CIERRE" = :ldt_fecha_cierre) AND
						( "CADENA"."FECHA_IFRS" is null )
			ORDER BY	"FACTURA_PAGARE"."NUMERO" DESC
			USING		sqlca;
			open x1;
				if sqlca.sqlcode=0 then
					DO WHILE sqlca.sqlcode=0
					fetch x1 INTO	:ls_base,	:ls_serie,	:ll_numero,	:ldb_porcentaje;
						if not isnull(ls_base) and ls_base <> '' and not isnull(ls_serie) and ls_serie <> '' and not isnull(ll_numero) and ll_numero > 0 then
							ll_new										= dw_ifrs.insertrow(0)
							dw_ifrs.scrolltorow(ll_new)
							st_4.text 									= 'Reg. N° '+string(ll_new,'###,###,###')+' de '+string(ll_tot_reg,'###,###,###')+' ( '+string((ll_new*100)/ll_tot_reg,'#0.##')+'% )'
							dw_ifrs.setitem(ll_new,"base",ls_base)
							dw_ifrs.setitem(ll_new,"serie",ls_serie)
							dw_ifrs.setitem(ll_new,"numero",ll_numero)
							dw_ifrs.setitem(ll_new,"porce",ldb_porcentaje)
							dw_ifrs.setitem(ll_new,"estado_ifrs",'S')
							dw_ifrs.setitem(ll_new,"fecha_ifrs",ldt_fecha_cierre)
							
							UPDATE	"CADENA"  
     						SET		"ESTADO_IFRS" = :ls_estado,   
         							"FECHA_IFRS" = :ldt_fecha_cierre  
							WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
										( "CADENA"."SERIE" = :ls_serie ) AND  
										( "CADENA"."NUMERO" = :ll_numero )
							USING		Trans_1;
							if Trans_1.sqlcode=0 then
								commit using Trans_1;
							else
								rollback using Trans_1;
								messagebox("Error Grabar","Error al Grabar SQL: "+Trans_1.sqlerrtext)
							end if
						end if
						setnull(ls_base);setnull(ls_serie);setnull(ll_numero)
						st_7.text 										= string(ll_new,'###,###,###')+' Reg. Actualizados'+' ( '+string((ll_new*100)/ll_tot_reg,'#0.##')+'% )'
					LOOP
				end if
			close x1;
			SetPointer(Arrow!)
		else
			messagebox("Advertencia","Proceso de Actualización Cancelado")
		end if
	else
		messagebox("Advertencia","No Registra Cierre Facturación Con Fecha "+string(ldt_fecha_cierre,'dd/mm/yyyy'))
		this.enabled = false
	end if
end if
end event

type st_2 from statictext within w_35_porciento_pagare
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

type st_1 from statictext within w_35_porciento_pagare
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

type sle_clave from singlelineedit within w_35_porciento_pagare
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

type sle_usuario from singlelineedit within w_35_porciento_pagare
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

type cb_aceptar from commandbutton within w_35_porciento_pagare
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

is_usuario 										= Upper(sle_usuario.text)

 SELECT "ENCARGADOS"."PASSWORD",   
         "ENCARGADOS"."ACCESO",
			"ENCARGADOS"."NOMBRE"
    INTO :is_clave,   
         :is_acceso,
			:gs_nombre_usuario
    FROM "ENCARGADOS"  
   WHERE "ENCARGADOS"."CODIGO_USUARIO" = :is_usuario;    

IF is_clave = Upper(sle_clave.text) and sle_clave.text<>'' THEN
	gi_nivel_acceso 							= 1
	
	IF LEN(gs_nombre_usuario) > 5 THEN 
		gs_nombre_usuario 					= Mid(gs_nombre_usuario,1,5)
	END IF
	w_35_porciento_pagare.height			= 1320
	this.enabled 								= false
	sle_clave.enabled 						= false
	sle_usuario.enabled 						= false
	sle_clave.displayonly 					= false
	sle_usuario.displayonly 				= false	
	sle_clave.text 							= ''
	sle_usuario.text 							= ''

ELSE
	MessageBox(gs_app_name, "El usuario no se encuentra o su clave es incorrecta.")
	sle_clave.text = ""
	sle_clave.SetFocus( )
END IF
this.enabled = false
end event

type cb_cancelar from commandbutton within w_35_porciento_pagare
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

event clicked;close(w_35_porciento_ofertas)
end event

type ln_1 from line within w_35_porciento_pagare
integer linethickness = 9
integer beginx = 110
integer beginy = 436
integer endx = 1586
integer endy = 436
end type

type ln_2 from line within w_35_porciento_pagare
long linecolor = 16777215
integer linethickness = 9
integer beginx = 114
integer beginy = 444
integer endx = 1591
integer endy = 444
end type

type gb_1 from groupbox within w_35_porciento_pagare
integer x = 96
integer y = 468
integer width = 1495
integer height = 672
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

