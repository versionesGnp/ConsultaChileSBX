forward
global type w_encargados from window
end type
type cb_caja from commandbutton within w_encargados
end type
type cb_4 from commandbutton within w_encargados
end type
type st_1 from statictext within w_encargados
end type
type em_usuario from editmask within w_encargados
end type
type cb_exportar from commandbutton within w_encargados
end type
type cb_filtrar from commandbutton within w_encargados
end type
type cb_ordenar from commandbutton within w_encargados
end type
type cb_5 from commandbutton within w_encargados
end type
type cb_3 from commandbutton within w_encargados
end type
type cb_1 from commandbutton within w_encargados
end type
type dw_1 from datawindow within w_encargados
end type
type cb_2 from commandbutton within w_encargados
end type
end forward

global type w_encargados from window
integer x = 832
integer y = 360
integer width = 3634
integer height = 2092
boolean titlebar = true
string title = "Administrador de Usuarios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 80269524
cb_caja cb_caja
cb_4 cb_4
st_1 st_1
em_usuario em_usuario
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_5 cb_5
cb_3 cb_3
cb_1 cb_1
dw_1 dw_1
cb_2 cb_2
end type
global w_encargados w_encargados

type variables
string 	is_banda_new,is_campo,is_banda_old,ls_cod,is_string_text
Long		il_row
Date		idt_fecha_hoy
end variables

forward prototypes
public subroutine wf_sort (string as_banda)
end prototypes

public subroutine wf_sort (string as_banda);is_banda_new			=	as_banda
CHOOSE CASE as_banda
	CASE "a_codigo_usuario"
		is_campo	=	'codigo_usuario'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_password"
		is_campo	=	'password'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_nombre"
		is_campo	=	'nombre'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_acceso"
		is_campo	=	'acceso'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_depto"
		is_campo	=	'depto'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_company"
		is_campo	=	'company'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new
	CASE "a_fecha_termino"
		is_campo	=	'fecha_termino'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new	
	CASE "a_fecha_ingreso"
		is_campo	=	'fecha_ingreso'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new	
		
	CASE "t_operaciones"
		is_campo	=	'opera'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new	
	CASE "t_consulta"
		is_campo	=	'cons_general'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new	
	CASE "t_solicitudes"
		is_campo	=	'solicitudes'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new	
	CASE "t_digitacion"
		is_campo	=	'digitacion'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new	
	CASE "t_expiracion"
		is_campo	=	'fecha_expiracion'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new	
	CASE "t_estado"
		is_campo	=	'estado'
		f_ordena_columnas(dw_1,is_banda_old,is_banda_new,MID(as_banda,3)+' A')
		is_banda_old	=	is_banda_new	
END CHOOSE
end subroutine

on w_encargados.create
this.cb_caja=create cb_caja
this.cb_4=create cb_4
this.st_1=create st_1
this.em_usuario=create em_usuario
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.Control[]={this.cb_caja,&
this.cb_4,&
this.st_1,&
this.em_usuario,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_5,&
this.cb_3,&
this.cb_1,&
this.dw_1,&
this.cb_2}
end on

on w_encargados.destroy
destroy(this.cb_caja)
destroy(this.cb_4)
destroy(this.st_1)
destroy(this.em_usuario)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.cb_2)
end on

event open;gf_centrar(w_encargados)
idt_fecha_hoy	= date(gdt_fec_sistema)
dw_1.settransobject(sqlca)
dw_1.retrieve()
if gs_empresa='El Prado' then
	dw_1.object.t_titulo.text	= 'Parque El Prado'
elseif gs_empresa='La Foresta' then
	dw_1.object.t_titulo.text	= 'Parque La Foresta'
elseif gs_empresa='Concepción' then
	dw_1.object.t_titulo.text	= 'Parque Concepción'
end if
end event

type cb_caja from commandbutton within w_encargados
integer x = 1303
integer y = 1832
integer width = 375
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean enabled = false
string text = "Acce&so Caja"
end type

event clicked;String	ls_nombre
Long		ll_count_tcp_ip
if il_row>0 then
	ls_nombre		= dw_1.getitemstring(il_row,'nombre')
	SELECT	count("TCP_IP_PARQUE"."TCP_IP")
	INTO 		:ll_count_tcp_ip
	FROM 		"TCP_IP_PARQUE"  
	WHERE 	"TCP_IP_PARQUE"."USUARIO" = :ls_nombre   
	USING		sqlca;
	if ll_count_tcp_ip>0 then
		ls_nombre	= ls_nombre
		openwithparm(w_asociar_ip_caja,ls_nombre)
	else
		messagebox("Advertencia","Recuerde antes de Acceso a Caja, debe Asociar IP")
	end if
end if
end event

type cb_4 from commandbutton within w_encargados
integer x = 923
integer y = 1832
integer width = 347
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Asociar IP"
end type

event clicked;String	ls_nombre
if il_row>0 then
	ls_nombre	= trim(dw_1.getitemstring(il_row,'nombre'))
	openwithparm(w_asociar_ip,ls_nombre)
end if
end event

type st_1 from statictext within w_encargados
integer x = 64
integer y = 32
integer width = 379
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar Codigo:"
boolean focusrectangle = false
end type

type em_usuario from editmask within w_encargados
integer x = 443
integer y = 20
integer width = 571
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!"
end type

event modified;STRING	ls_string
long		ll_row,ll_largo,ll_tot_reg
if trim(em_usuario.text)<>'' then
	ll_tot_reg				= dw_1.RowCount()
	gs_codigo				= trim(em_usuario.text)
	ll_largo					= len(gs_codigo)
	ls_string				= "mid(codigo_usuario,1,"+string(ll_largo)+") ='"+trim(em_usuario.text)+"'"
	ll_row 					= dw_1.Find(ls_string, 1, ll_tot_reg )
	IF ll_row > 0 THEN
		dw_1.ScrollToRow( ll_row )
		dw_1.setfocus()
	ELSE
		MessageBox("Advertencia", "Usuario Inexistente")
		em_usuario.text	= ''
		setnull(gs_codigo)
	END IF
end if
end event

type cb_exportar from commandbutton within w_encargados
integer x = 2318
integer y = 1832
integer width = 261
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xporta"
end type

event clicked;SaveAsType TipoArchivo
datawindow dw_paso
dw_paso	= dw_1
if dw_1.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_filtrar from commandbutton within w_encargados
integer x = 2053
integer y = 1832
integer width = 261
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_1.SETfilter(NULO)
dw_1.filter()

end event

type cb_ordenar from commandbutton within w_encargados
integer x = 1787
integer y = 1832
integer width = 261
integer height = 108
integer taborder = 60
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

end event

type cb_5 from commandbutton within w_encargados
integer x = 2583
integer y = 1832
integer width = 261
integer height = 108
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type cb_3 from commandbutton within w_encargados
integer x = 402
integer y = 1832
integer width = 347
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Eliminar"
end type

event clicked;long		ll_row
String	ls_estado
ll_row					= dw_1.getrow()
if ll_row>0 then
	gs_codigo 		= dw_1.getitemstring(ll_row,'codigo_usuario')
	gs_password 	= dw_1.getitemstring(ll_row,'password')
	ls_estado		= dw_1.getitemstring(ll_row,'estado')
	if ls_estado='A' then
		if messagebox("Eliminar",'Esta Seguro de Eliminar Usuario '+gs_codigo,Exclamation!,YesNo!,2) = 1 then
			UPDATE	"ENCARGADOS"  
			SET 		"ESTADO" = 'I'  
			WHERE  ( "ENCARGADOS"."CODIGO_USUARIO" = :gs_codigo ) 
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				dw_1.setitem(ll_row,'estado','I')
				dw_1.setitem(ll_row,'fecha_termino',datetime(date(gdt_fec_sistema),time('00:00:00')))
				dw_1.accepttext()
				if dw_1.update()=1 then
					commit;
				else
					rollback;
				end if
				MessageBox("Elimiar",'Registro Inactivo',INFORMATION!)
			else
				rollback;
				MessageBox("Eliminar","DataBase Error!.~n~n"+sqlca.sqlerrtext,INFORMATION!)
			end if
			if isvalid(w_perfil_usuario) then w_perfil_usuario.dw_encargados.retrieve()
		end if
	elseif ls_estado='I' then
		if messagebox("Eliminar",'Usuario '+gs_codigo+' INACTIVO, está Seguro de Eliminar Definitivamente',Exclamation!,YesNo!,2) = 1 then
			DELETE FROM "ENCARGADOS"  
			WHERE "ENCARGADOS"."CODIGO_USUARIO" = :gs_codigo   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				commit;
				DELETE FROM "PERFIL_USUARIO"  
				WHERE 		"PERFIL_USUARIO"."USUARIO" = :gs_codigo   
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
				end if
				dw_1.retrieve()
				if isvalid(w_perfil_usuario) then w_perfil_usuario.dw_encargados.retrieve()
			else
				rollback;
			end if
		end if
	end if
	em_usuario.text	= ''
end if
end event

type cb_1 from commandbutton within w_encargados
integer x = 27
integer y = 1832
integer width = 347
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "&Nuevo"
end type

event clicked;em_usuario.text	= ''
OpenWithParm(w_vista_encargados, 'N')

end event

type dw_1 from datawindow within w_encargados
integer x = 27
integer y = 132
integer width = 3557
integer height = 1672
integer taborder = 20
string dataobject = "dw_encargados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_depto,ls_nombre
Long		ll_count_tcp_ip
//em_usuario.text				= ''
IF row > 0 THEN
	il_row						= row
	SelectRow(0, FALSE)
	SelectRow(il_row, TRUE)
	ls_columna					= dwo.name
	ls_depto						= dw_1.getitemstring(il_row,'depto')
	ls_nombre					= dw_1.getitemstring(il_row,'nombre')
	SELECT	Count("TCP_IP_PARQUE"."TCP_IP")
	INTO 		:ll_count_tcp_ip  
	FROM 		"ENCARGADOS",   
				"TCP_IP_PARQUE"  
	WHERE  ( "ENCARGADOS"."NOMBRE" = "TCP_IP_PARQUE"."USUARIO" ) and  
			 (("ENCARGADOS"."DEPTO" = :ls_depto ) AND  
			 ( "ENCARGADOS"."NOMBRE" = :ls_nombre ) AND  
			 ( "ENCARGADOS"."ESTADO" = 'A' ) )   
	USING		sqlca;
	if ll_count_tcp_ip>0 then
		if ls_depto='T' or ls_depto='J' or ls_depto='I' then
			cb_caja.enabled	= true
		else
			cb_caja.enabled	= false
		end if
	else
		cb_caja.enabled		= false
	end if
ELSE
	wf_sort(STRING(dwo.name))
	ls_columna					= dwo.name
	if ls_columna='t_amarillo1' or ls_columna='t_amarillo2' then
		if len(is_string_text)=0 or isnull(is_string_text) or is_string_text='' then
			is_string_text		= 'date("'+string(idt_fecha_hoy,"dd/mm/yyyy")+'") >= fecha_a10_dias and date("'+string(idt_fecha_hoy,"dd/mm/yyyy") +'") < fecha_expiracion and estado ="A"'
		else
			if is_string_text	= 'date("'+string(idt_fecha_hoy,"dd/mm/yyyy")+'") >= fecha_a10_dias and date("'+string(idt_fecha_hoy,"dd/mm/yyyy") +'") < fecha_expiracion and estado ="A"' then
				is_string_text	= ''
			else
				is_string_text	= 'date("'+string(idt_fecha_hoy,"dd/mm/yyyy")+'") >= fecha_a10_dias and date("'+string(idt_fecha_hoy,"dd/mm/yyyy") +'") < fecha_expiracion and estado ="A"'
			end if
		end if
		dw_1.SETfilter(is_string_text)
		dw_1.filter()
	end if
	if ls_columna='t_rojo1' or ls_columna='t_rojo2' then
		if len(is_string_text)=0 or isnull(is_string_text) or is_string_text='' then
			is_string_text		= 'date("'+string(idt_fecha_hoy,"dd/mm/yyyy")+'") >= fecha_expiracion and estado ="A"'
		else
			if is_string_text	= 'date("'+string(idt_fecha_hoy,"dd/mm/yyyy")+'") >= fecha_expiracion and estado ="A"' then
				is_string_text	= ''
			else
				is_string_text	= 'date("'+string(idt_fecha_hoy,"dd/mm/yyyy")+'") >= fecha_expiracion and estado ="A"'
			end if
		end if
		dw_1.SETfilter(is_string_text)
		dw_1.filter()
	end if
	if ls_columna='t_negro1' or ls_columna='t_negro2' then
		if len(is_string_text)=0 or isnull(is_string_text) or is_string_text='' then
			is_string_text		= 'estado ="I"'
		else
			if is_string_text	= 'estado ="I"' then
				is_string_text	= ''
			else
				is_string_text	= 'estado ="I"'
			end if
		end if
		dw_1.SETfilter(is_string_text)
		dw_1.filter()
	end if
	if ls_columna='t_todo' then
		is_string_text			= ''
		dw_1.SETfilter(is_string_text)
		dw_1.filter()
	end if
END IF
end event

event rowfocuschanged;String	ls_columna,ls_depto,ls_nombre
Long		ll_count_tcp_ip
IF this.getrow() > 0 THEN
//	em_usuario.text				= ''
	il_row							= this.getrow()
	SelectRow(0, FALSE)
	SelectRow(il_row, TRUE)
	ls_columna						= this.GetColumnName()
	ls_depto						= dw_1.getitemstring(il_row,'depto')
	ls_nombre					= dw_1.getitemstring(il_row,'nombre')
	SELECT	Count("TCP_IP_PARQUE"."TCP_IP")
	INTO 		:ll_count_tcp_ip  
	FROM 		"ENCARGADOS",   
				"TCP_IP_PARQUE"  
	WHERE  ( "ENCARGADOS"."NOMBRE" = "TCP_IP_PARQUE"."USUARIO" ) and  
			 (("ENCARGADOS"."DEPTO" = :ls_depto ) AND  
			 ( "ENCARGADOS"."NOMBRE" = :ls_nombre ) AND  
			 ( "ENCARGADOS"."ESTADO" = 'A' ) )   
	USING		sqlca;
	if ll_count_tcp_ip>0 then
		if ls_depto='T' or ls_depto='J' or ls_depto='I' then
			cb_caja.enabled	= true
		else
			cb_caja.enabled	= false
		end if
	else
		cb_caja.enabled		= false
	end if
end if
end event

event doubleclicked;if row>0 then
//	em_usuario.text	= ''
	il_row				= row
	SelectRow(0, FALSE)
	SelectRow(il_row, TRUE)
	gs_codigo 			=	getitemstring(il_row,'codigo_usuario')
	gs_password 		=	getitemstring(il_row,'password')
	OpenWithParm(w_vista_encargados, 'M')
end if
end event

type cb_2 from commandbutton within w_encargados
integer x = 3232
integer y = 1832
integer width = 347
integer height = 108
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_encargados)
end event

