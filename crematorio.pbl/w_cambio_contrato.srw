forward
global type w_cambio_contrato from window
end type
type em_nuevo_contrato from editmask within w_cambio_contrato
end type
type st_7 from statictext within w_cambio_contrato
end type
type st_6 from statictext within w_cambio_contrato
end type
type st_5 from statictext within w_cambio_contrato
end type
type st_4 from statictext within w_cambio_contrato
end type
type st_1 from statictext within w_cambio_contrato
end type
type cb_2 from commandbutton within w_cambio_contrato
end type
type st_3 from statictext within w_cambio_contrato
end type
type st_numero from statictext within w_cambio_contrato
end type
type st_serie from statictext within w_cambio_contrato
end type
type st_base from statictext within w_cambio_contrato
end type
type cb_cerrar from commandbutton within w_cambio_contrato
end type
end forward

global type w_cambio_contrato from window
integer width = 1691
integer height = 900
boolean titlebar = true
string title = "Reasignación de contrato"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_nuevo_contrato em_nuevo_contrato
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_1 st_1
cb_2 cb_2
st_3 st_3
st_numero st_numero
st_serie st_serie
st_base st_base
cb_cerrar cb_cerrar
end type
global w_cambio_contrato w_cambio_contrato

on w_cambio_contrato.create
this.em_nuevo_contrato=create em_nuevo_contrato
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_1=create st_1
this.cb_2=create cb_2
this.st_3=create st_3
this.st_numero=create st_numero
this.st_serie=create st_serie
this.st_base=create st_base
this.cb_cerrar=create cb_cerrar
this.Control[]={this.em_nuevo_contrato,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_1,&
this.cb_2,&
this.st_3,&
this.st_numero,&
this.st_serie,&
this.st_base,&
this.cb_cerrar}
end on

on w_cambio_contrato.destroy
destroy(this.em_nuevo_contrato)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.st_3)
destroy(this.st_numero)
destroy(this.st_serie)
destroy(this.st_base)
destroy(this.cb_cerrar)
end on

event open;gf_centrar(w_cambio_contrato)

st_numero.text =string( w_ficha_crematorio.tab_crematorio.tabpage_1.dw_ficha.getitemnumber(1,'numero'))


end event

type em_nuevo_contrato from editmask within w_cambio_contrato
integer x = 859
integer y = 456
integer width = 731
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

type st_7 from statictext within w_cambio_contrato
integer x = 64
integer y = 328
integer width = 1033
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nuevo Contrato : "
boolean focusrectangle = false
end type

type st_6 from statictext within w_cambio_contrato
integer x = 64
integer y = 68
integer width = 1033
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contrato Original :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_cambio_contrato
integer x = 613
integer y = 456
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "G"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_cambio_contrato
integer x = 736
integer y = 456
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "I"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cambio_contrato
integer x = 64
integer y = 468
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contrato :"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_cambio_contrato
integer x = 215
integer y = 644
integer width = 681
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aplica Cambio Contrato"
end type

event clicked;long ld_valor_original
integer LI_SERV_CONTRATADOS, LI_SERV_USADOS, li_respuesta, li_error
string ls_estado, LS_ESTADO_CTO, ls_error
double ld_cto, LD_CTO_ORIGINAL,LD_CTO_NUEVO
boolean lb_autocommit_orig

ld_cto = double(em_nuevo_contrato.text)

 IF IsNull(ld_cto) OR Trim(String(ld_cto)) = "" THEN
	  MessageBox("Validación", "El campo 'Numero de contrato' no puede quedar vacío.",StopSign!)
	  RETURN 
 END IF
 
select ESTADO INTO :LS_ESTADO_CTO from cadena where codigo = 'G' AND SERIE = 'I' AND NUMERO =:ld_cto;

 IF IsNull(LS_ESTADO_CTO) OR Trim(String(LS_ESTADO_CTO)) = "" THEN
	  MessageBox("Validación", "El campo 'Numero de contrato' no fue encontrado.",StopSign!)
	  RETURN 
 END IF	

IF LS_ESTADO_CTO <> 'V' AND LS_ESTADO_CTO <> 'C' THEN	
	select nombre_estado  INTO :ls_estado from estado where cod_estado =:LS_ESTADO_CTO;
	 MessageBox("Validación", "El estado del contrato ingresado es " + ls_estado + " que no es valido para ser asignado.",StopSign!)
	 RETURN 	
END IF	

 
// VHFB - VALIDA QUE NUEVO CONTRATO CUENTE CON SERVICIOS DISPONIBLES - INICIO
select CAPACIDAD INTO :LI_SERV_CONTRATADOS from PRODUCTO_PAGO where BASE = 'G' AND SERIE = 'I' AND NUMERO =:ld_cto;

select COUNT("FC_CABECERA"."BASE")   INTO :LI_SERV_USADOS FROM "FC_CABECERA" where BASE = 'G' AND SERIE = 'I'  AND NUMERO =:ld_cto;

if LI_SERV_CONTRATADOS <= LI_SERV_USADOS then
	MessageBox("Validación", "El contrato ingresado no puede ser usado puesto que los servicios contratados ya se encuentran usados. " ,StopSign!)	
	return 
end if 	
// VHFB - VALIDA QUE NUEVO CONTRATO CUENTE CON SERVICIOS DISPONIBLES - TERMINO

li_respuesta	= messagebox("Actualizar","El contrato ingresado 'GI"+TRIM(em_nuevo_contrato.TEXT)+"'  cumple con los requicitos para reemplazar el contrato 'GI"+TRIM(st_numero.TEXT)+"', desea continuar ?",Question!,YesNo!,2)

IF li_respuesta = 1 THEN
    integer  ll_i
    string ls_tablas[], ls_sql

    LD_CTO_ORIGINAL = double(st_numero.Text)
    LD_CTO_NUEVO    = double(em_nuevo_contrato.Text)
    li_error = 0

    // Lista de tablas a actualizar (puedes agregar más sin tocar el código principal)
    ls_tablas[1]  = "FC_AGENDA_CAPILLA"
    ls_tablas[2]  = "FC_AGENDA_CREMATORIO"
    ls_tablas[3]  = "FC_AGENDA_ING_PARQUE"
    ls_tablas[4]  = "FC_AGENDA_PERGOLA"
    ls_tablas[5]  = "FC_AGENDA_VISUALIZA"
    ls_tablas[6]  = "FC_ARANCEL"
    ls_tablas[7]  = "FC_CABECERA"
    ls_tablas[8]  = "FC_CARTA_74"
    ls_tablas[9]  = "FC_CEREMONIA"
    ls_tablas[10] = "FC_DOCUMENTOS_DETALLE"
    ls_tablas[11] = "FC_ESTADO_PAGO"
    ls_tablas[12] = "FC_FALLECIDO"
    ls_tablas[13] = "FC_PRELACION"
    ls_tablas[14] = "FC_PRODUCTO"
    ls_tablas[15] = "FC_RESPONSABLE_RETIRO"
    ls_tablas[16] = "FC_TITULAR"
    // ls_tablas[17] = "FC_FICHA_TRASLADO" // si deseas incluir esta, descomenta

    // Desactivar autocommit para manejar la transacción manualmente
	lb_autocommit_orig = SQLCA.AutoCommit	 
    SQLCA.AutoCommit = False

	//----------------------------------------------------------------------
    // Ejecutar updates en todas las tablas de crematorio
	//----------------------------------------------------------------------
    FOR ll_i = 1 TO UpperBound(ls_tablas)
		
		ls_sql = "UPDATE " + ls_tablas[ll_i] + " SET NUMERO = " + String(LD_CTO_NUEVO) +  " WHERE BASE = 'G' AND SERIE = 'I' AND  NUMERO = " + String(LD_CTO_ORIGINAL)

    		EXECUTE IMMEDIATE :ls_sql;

        IF SQLCA.SQLCode <> 0 THEN
            li_error = 1
            ls_error = "Error en tabla: " + ls_tablas[ll_i] + "~r~n" + SQLCA.SQLErrText
            EXIT
        END IF
    NEXT

	//----------------------------------------------------------------------
    // Ejecutar update tabla de fallecidos
	//----------------------------------------------------------------------
	UPDATE FALLECIDOS SET CONTRATO = :LD_CTO_NUEVO  WHERE BASE = 'G' AND SS = 'I'  AND ESTADO_REG = 'A' AND  CONTRATO = :LD_CTO_ORIGINAL;
	
	IF SQLCA.SQLCode <> 0 THEN
		li_error = 1
		ls_error = "Error en tabla: FALLECIDOS " + "~r~n" + SQLCA.SQLErrText
	END IF

	
	//----------------------------------------------------------------------
    // Ejecutar update tabla de cadena para estado_gestion_crematorio
	//----------------------------------------------------------------------
	INTEGER LI_ESTADO_GESTION_CREMATORIO
	
	SELECT ESTADO_GESTION_CREMATORIO INTO :LI_ESTADO_GESTION_CREMATORIO FROM CADENA WHERE NUMERO = :LD_CTO_ORIGINAL AND CODIGO = 'G' AND SERIE = 'I';
	
	UPDATE CADENA SET ESTADO_GESTION_CREMATORIO = :LI_ESTADO_GESTION_CREMATORIO WHERE NUMERO = :LD_CTO_NUEVO AND CODIGO = 'G' AND SERIE = 'I';
	
	IF SQLCA.SQLCode <> 0 THEN
		li_error = 1
		ls_error = "Error en tabla: CADENA " + "~r~n" + SQLCA.SQLErrText
	END IF

	//----------------------------------------------------------------------	
    // Confirmar o revertir transacción
	//----------------------------------------------------------------------
    IF li_error = 0 THEN
        COMMIT USING SQLCA;
        IF SQLCA.SQLCode <> 0 THEN
            li_error = 1
            ls_error = "Error al hacer COMMIT: " + SQLCA.SQLErrText
        END IF
    END IF

    // Mensaje final al usuario
    IF li_error = 0 THEN
        MessageBox("Éxito", "El nuevo contrato fue asignado correctamente.")
		//cb_limpiar
		w_ficha_crematorio.cb_limpiar.triggerevent(clicked!)
    ELSE
        ROLLBACK USING SQLCA;
        MessageBox("Error", "Se produjo un error y se revirtieron los cambios." + "~r~n" + ls_error, StopSign!)
    END IF
END IF

SQLCA.AutoCommit = lb_autocommit_orig

close(w_cambio_contrato)

end event

type st_3 from statictext within w_cambio_contrato
integer x = 64
integer y = 188
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contrato :"
boolean focusrectangle = false
end type

type st_numero from statictext within w_cambio_contrato
integer x = 859
integer y = 176
integer width = 731
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_serie from statictext within w_cambio_contrato
integer x = 731
integer y = 176
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "I"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_base from statictext within w_cambio_contrato
integer x = 608
integer y = 176
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "G"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_cambio_contrato
integer x = 919
integer y = 644
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_cambio_contrato)
end event

