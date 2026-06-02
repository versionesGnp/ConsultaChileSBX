forward
global type w_mantenedor_estado_contratos from window
end type
type ddlb_base from dropdownlistbox within w_mantenedor_estado_contratos
end type
type st_1 from statictext within w_mantenedor_estado_contratos
end type
type cb_datos_contrato from commandbutton within w_mantenedor_estado_contratos
end type
type em_contrato from editmask within w_mantenedor_estado_contratos
end type
type st_2 from statictext within w_mantenedor_estado_contratos
end type
type dw_listado from datawindow within w_mantenedor_estado_contratos
end type
type cb_6 from commandbutton within w_mantenedor_estado_contratos
end type
type cb_5 from commandbutton within w_mantenedor_estado_contratos
end type
type pb_ok from picturebutton within w_mantenedor_estado_contratos
end type
type cb_1 from commandbutton within w_mantenedor_estado_contratos
end type
end forward

global type w_mantenedor_estado_contratos from window
integer x = 1189
integer y = 884
integer width = 3849
integer height = 1300
boolean titlebar = true
string title = "Anulación de Contratos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79741120
ddlb_base ddlb_base
st_1 st_1
cb_datos_contrato cb_datos_contrato
em_contrato em_contrato
st_2 st_2
dw_listado dw_listado
cb_6 cb_6
cb_5 cb_5
pb_ok pb_ok
cb_1 cb_1
end type
global w_mantenedor_estado_contratos w_mantenedor_estado_contratos

type variables
	string ls_SECTOR,ls_CANAL,ls_T_SEPULT, ls_tipo_cons
	int li_COD_PARQUE, li_TIPO_PRODUCTO,li_CAPACIDAD, li_COD_PARQUE_ORIG
	datetime ld_fec_vig
	Long	il_row2
	datawindowchild idw_parque
end variables

forward prototypes
public subroutine f_graba_log ()
public subroutine f_graba_log (string p_base, string p_serie, double p_numero, string p_estado_original)
end prototypes

public subroutine f_graba_log ();
end subroutine

public subroutine f_graba_log (string p_base, string p_serie, double p_numero, string p_estado_original);	insert into log_anulacion_contrato (BASE,SERIE,NUMERO,FECHA_ANULACION,ESTADO_ORIGINAL,USUARIO) 
	values (:p_BASE,:p_SERIE,:p_NUMERO,sysdate,:p_ESTADO_ORIGINAL,:gs_user)
	USING sqlca;
	if sqlca.sqlcode=0 then
		Commit using sqlca;
		messagebox("Grabar","Anulación Exitosa")
	else
		rollback;
		messagebox("Grabar","No fue Posible anular el contrato")		
	end if	
end subroutine

on w_mantenedor_estado_contratos.create
this.ddlb_base=create ddlb_base
this.st_1=create st_1
this.cb_datos_contrato=create cb_datos_contrato
this.em_contrato=create em_contrato
this.st_2=create st_2
this.dw_listado=create dw_listado
this.cb_6=create cb_6
this.cb_5=create cb_5
this.pb_ok=create pb_ok
this.cb_1=create cb_1
this.Control[]={this.ddlb_base,&
this.st_1,&
this.cb_datos_contrato,&
this.em_contrato,&
this.st_2,&
this.dw_listado,&
this.cb_6,&
this.cb_5,&
this.pb_ok,&
this.cb_1}
end on

on w_mantenedor_estado_contratos.destroy
destroy(this.ddlb_base)
destroy(this.st_1)
destroy(this.cb_datos_contrato)
destroy(this.em_contrato)
destroy(this.st_2)
destroy(this.dw_listado)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.pb_ok)
destroy(this.cb_1)
end on

event open;gf_centrar (w_mantenedor_estado_contratos)

dw_listado.SetTransObject(SQLCA)

gs_ventana	= 'w_mantenedor_estado_contrato'

f_valida_objeto()


		STRING LS_TIPO_CONTRATO
		DECLARE C_TIPO_CONTRATO CURSOR FOR  
		SELECT "TIPO_CONTRATO"."DESCRIPCION_CUENTA" FROM "TIPO_CONTRATO" 
		USING	sqlca;
		OPEN C_TIPO_CONTRATO;
			do while sqlca.sqlcode=0 
				fetch C_TIPO_CONTRATO into :LS_TIPO_CONTRATO;
				IF LEFT(LS_TIPO_CONTRATO,1) = 'A' OR  LEFT(LS_TIPO_CONTRATO,1) = 'L' OR  LEFT(LS_TIPO_CONTRATO,1) = 'O' OR  LEFT(LS_TIPO_CONTRATO,1) = 'U' THEN 
					ddlb_base.ADDITEM(LS_TIPO_CONTRATO)
				END IF 
			loop
		Close C_TIPO_CONTRATO;
end event

type ddlb_base from dropdownlistbox within w_mantenedor_estado_contratos
integer x = 521
integer y = 28
integer width = 873
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_mantenedor_estado_contratos
integer x = 50
integer y = 48
integer width = 453
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base contrato"
boolean focusrectangle = false
end type

type cb_datos_contrato from commandbutton within w_mantenedor_estado_contratos
integer x = 805
integer y = 1048
integer width = 393
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver C&ontrato"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	gs_base 									= dw_listado.GetItemString(il_row2, "cadena_codigo")
	gs_serie 									= dw_listado.GetItemString(il_row2, "cadena_serie")
	gi_numero 								= dw_listado.GetItemNumber(il_row2, "cadena_numero")
	gi_rut 									= dw_listado.GetItemNumber(il_row2, "cliente_rut")
	gs_apellido_paterno					= dw_listado.GetItemString(il_row2, "cliente_a_paterno")
	gs_apellido_materno					= dw_listado.GetItemString(il_row2, "cliente_a_materno")
	gs_nombres								= dw_listado.GetItemString(il_row2, "cliente_nombre")
	gs_dv										= dw_listado.GetItemString(il_row2, "cliente_dv")
	gs_estado								= dw_listado.GetItemString(il_row2, "cadena_estado")
	gl_cod_parque_cta					= dw_listado.GetItemNumber(il_row2, "cadena_cod_parque")
	if not isnull(gs_base) and gi_numero>0 then
		
		//dw_1.visible 						= false
		
		if isvalid(w_datos_contrato_oferta) then close(w_datos_contrato_oferta)		
		if isvalid(w_datos_contrato_liberador) then close(w_datos_contrato_liberador)		
		if isvalid(w_datos_contrato_pagare) then close(w_datos_contrato_pagare)		
		if isvalid(w_datos_contrato_isa) then close(w_datos_contrato_isa)		
		if isvalid(w_datos_contrato_derecho) then close(w_datos_contrato_derecho)		
		if isvalid(w_datos_contrato_reprogramacion_cta_mant) then close(w_datos_contrato_reprogramacion_cta_mant)
		if isvalid(w_datos_contrato_aumento_capacidad) then close(w_datos_contrato_aumento_capacidad)
		if isvalid(w_datos_contrato_funeraria) then close(w_datos_contrato_funeraria)
		
		CHOOSE CASE gs_base
			CASE "O","U" // Oferta
				Open(w_datos_contrato_oferta)
			CASE "L" // Anexo Liberador
				Open(w_datos_contrato_liberador)
			CASE "P" // Pagaré
				Open(w_datos_contrato_pagare)
			CASE "C" // Contrato ISA	
				Open(w_datos_contrato_isa)
			CASE "D" // Derecho Especial
				Open(w_datos_contrato_derecho)	
			CASE "R" // Reprogramacion Cta. Mant.
				open(w_datos_contrato_reprogramacion_cta_mant)
			CASE "A" // Aumento Capacidad
				open(w_datos_contrato_aumento_capacidad)
			CASE "F","G","V" // Anexo Funeraria
				Open(w_datos_contrato_funeraria)
		END CHOOSE
	end if
end if

end event

type em_contrato from editmask within w_mantenedor_estado_contratos
integer x = 2025
integer y = 28
integer width = 782
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

type st_2 from statictext within w_mantenedor_estado_contratos
integer x = 1481
integer y = 48
integer width = 544
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número Contrato :"
boolean focusrectangle = false
end type

type dw_listado from datawindow within w_mantenedor_estado_contratos
integer x = 41
integer y = 192
integer width = 3717
integer height = 832
integer taborder = 40
string title = "Contratos"
string dataobject = "d_cont_resultado_busqueda_x_numero"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
	il_row2									= row
	cb_datos_contrato.enabled 			= TRUE
end if

end event

type cb_6 from commandbutton within w_mantenedor_estado_contratos
integer x = 498
integer y = 1048
integer width = 297
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event clicked;dw_listado.RESET()
em_contrato.text=""

ddlb_base.SelectItem ( 0 )

ddlb_base.setfocus()


end event

type cb_5 from commandbutton within w_mantenedor_estado_contratos
integer x = 50
integer y = 1048
integer width = 439
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Anula Contrato"
end type

event clicked;if il_row2>0 and dw_listado.rowcount()>0 then
	string ls_base, ls_serie, ls_estado, ls_desc_estado
	double ln_numero
	long	ll_resp, ll_cant_print

	ls_base = dw_listado.getitemstring(il_row2,'cadena_codigo')
	ls_serie = dw_listado.getitemstring(il_row2, 'cadena_serie')
	ln_numero = dw_listado.getitemnumber(il_row2,'cadena_numero')
	ls_estado = dw_listado.getitemstring(il_row2, 'cadena_estado')
	
		SELECT 	upper(mid("ESTADO"."NOMBRE_ESTADO",3)) into :ls_desc_estado
		FROM "ESTADO"   
		WHERE COD_ESTADO = :ls_estado;

	if ls_estado = 'A' then
		MessageBox("Anulación ", "El contrato ya se encuentra anulado")
		return
	end if
	
	if ls_estado <> 'V' then
		MessageBox("Anulación ", "El contrato se encuentra " + ls_desc_estado + ", solo puede ser anulado si su estado actual es VIGENTE.")
		return
	end if	
	
	
	ll_resp = MessageBox("Anulación ", "Desea Anular el contrato : " + ls_base + ls_serie + trim(string(ln_numero))	 ,Question!, YesNo!, 2)
	IF ll_resp = 2 THEN
		return
	end if
	
	update cadena set 
		estado = 'A',
		fecha_res = sysdate
	WHERE 	
		codigo = :ls_base and 
		serie = :ls_serie and 
		numero = : ln_numero
	USING sqlca;
	
	f_graba_log(ls_base,ls_serie,ln_numero,ls_estado)	
	
	pb_ok.triggerevent(clicked!)
end if 

end event

type pb_ok from picturebutton within w_mantenedor_estado_contratos
integer x = 2894
integer y = 8
integer width = 178
integer height = 156
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;String	ls_filtro
String ls_error
ls_error=''

dw_listado.RESET()
dw_listado.setfilter('')		
dw_listado.filter()	
	
if len(trim(string(em_contrato.text))) > 0 AND LEN(ddlb_base.TEXT) > 0 then
	dw_listado.SetRedraw(FALSE)

	
	dw_listado.retrieve(DOUBLE(em_contrato.text))
	
	ls_filtro		= "cadena_codigo = '"+ left(ddlb_base.text,1) +" '"

	dw_listado.setfilter(ls_filtro)		
	dw_listado.filter()		
	
	if dw_listado.rowcount() = 0 then 
		MessageBox("Anulación ", "No se encuentran contratos asociados a base/número ingresado.")
		return
	end if 
	
	dw_listado.SetRedraw(TRUE)
	return
end if

if LEN(ddlb_base.TEXT) = 0 then
   ls_error=ls_error+ ' Base '		+ '~r~n'
END IF 
if len(trim(string(em_contrato.text))) = 0 then
   ls_error=ls_error+ ' Contrato '		+ '~r~n'
END IF 
if len(trim(ls_error))>0 then
	messagebox('','Debe ingresar el(los) los siguiente(s) parámetro(e) : ' + '~r~n' + '~r~n'  + '~r~n'  +ls_error )
	return
end if 
end event

type cb_1 from commandbutton within w_mantenedor_estado_contratos
integer x = 1243
integer y = 1048
integer width = 297
integer height = 96
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_mantenedor_estado_contratos)
end event

