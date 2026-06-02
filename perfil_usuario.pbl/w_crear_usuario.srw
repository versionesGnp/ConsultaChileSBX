forward
global type w_crear_usuario from window
end type
type cb_exportar from commandbutton within w_crear_usuario
end type
type cb_filtrar from commandbutton within w_crear_usuario
end type
type cb_ordenar from commandbutton within w_crear_usuario
end type
type st_eliminar from statictext within w_crear_usuario
end type
type st_nuevo from statictext within w_crear_usuario
end type
type cb_cerrar from commandbutton within w_crear_usuario
end type
type cb_grabar from commandbutton within w_crear_usuario
end type
type dw_ingreso from datawindow within w_crear_usuario
end type
end forward

global type w_crear_usuario from window
integer width = 3397
integer height = 1712
boolean titlebar = true
string title = "Administrar Usuarios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
st_eliminar st_eliminar
st_nuevo st_nuevo
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_ingreso dw_ingreso
end type
global w_crear_usuario w_crear_usuario

type variables
long	il_row,il_sw=0
end variables

on w_crear_usuario.create
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.st_eliminar=create st_eliminar
this.st_nuevo=create st_nuevo
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.st_eliminar,&
this.st_nuevo,&
this.cb_cerrar,&
this.cb_grabar,&
this.dw_ingreso}
end on

on w_crear_usuario.destroy
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.st_eliminar)
destroy(this.st_nuevo)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_ingreso)
end on

event open;gf_centrar(w_crear_usuario)
dw_ingreso.settransobject(sqlca)
dw_ingreso.setfocus()
dw_ingreso.setcolumn('codigo_usuario')
if gs_conexion	= "Parque El Prado" then
	dw_ingreso.object.t_parque.text	= 'Parque El Prado'
elseif gs_conexion	= "Parque La Foresta" then
	dw_ingreso.object.t_parque.text	= 'Parque La Foresta'
elseif gs_conexion	= "Parque Concepción" then
	dw_ingreso.object.t_parque.text	= 'Parque Concepción'
end if

end event

type cb_exportar from commandbutton within w_crear_usuario
integer x = 1842
integer y = 1468
integer width = 343
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_ingreso
if dw_ingreso.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_crear_usuario
integer x = 1495
integer y = 1468
integer width = 343
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_ingreso.SETfilter(NULO)
dw_ingreso.filter()
end event

type cb_ordenar from commandbutton within w_crear_usuario
integer x = 1147
integer y = 1468
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_ingreso.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_ingreso.SETSORT(NULO)
	dw_ingreso.SORT()
end if
end event

type st_eliminar from statictext within w_crear_usuario
integer x = 1915
integer y = 1344
integer width = 425
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean underline = true
long textcolor = 255
long backcolor = 80269524
string text = "&Eliminar"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long		ll_resp,ll_row
string	ls_codigo_usuario,ls_password,ls_nombre,ls_acceso,ls_depto,ls_company,ls_opera,&
			ls_cons_general,ls_solicitudes,ls_usuario
date		ld_fecha_termino

ll_row	= dw_ingreso.getrow()
if ll_row>0 then
	ls_codigo_usuario	= dw_ingreso.getitemstring(ll_row,'codigo_usuario')
	ls_password			= dw_ingreso.getitemstring(ll_row,'password')
	ls_nombre			= dw_ingreso.getitemstring(ll_row,'nombre')
	ls_acceso			= dw_ingreso.getitemstring(ll_row,'acceso')
	ls_depto				= dw_ingreso.getitemstring(ll_row,'depto')
	ls_company			= dw_ingreso.getitemstring(ll_row,'company')
	ld_fecha_termino	= date(dw_ingreso.getitemdatetime(ll_row,'fecha_termino'))
	ls_opera				= dw_ingreso.getitemstring(ll_row,'opera')
	ls_cons_general	= dw_ingreso.getitemstring(ll_row,'cons_general')
	ls_solicitudes		= dw_ingreso.getitemstring(ll_row,'solicitudes')
	if isnull(ls_codigo_usuario) and isnull(ls_codigo_usuario) and isnull(ls_password) and &
		isnull(ls_nombre) and isnull(ls_acceso) and isnull(ls_depto) and isnull(ls_company) and &
		isnull(ls_opera) and isnull(ls_cons_general) and isnull(ls_solicitudes) and isnull(ld_fecha_termino) then

		dw_ingreso.deleterow(ll_row)
		if dw_ingreso.update()=1 then
			commit;
			if isvalid(w_perfil_usuario) then w_perfil_usuario.dw_encargados.retrieve()
		else
			rollback;
		end if
	else
		ls_usuario	= dw_ingreso.getitemstring(ll_row,'codigo_usuario')
		SELECT	"ENCARGADOS"."NOMBRE"  
		INTO 		:ls_nombre  
		FROM 		"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_usuario
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ll_resp	= MessageBox("Advertencia", 'Está seguro de Eliminar Usuario '+ls_usuario, &
					Exclamation!, YesNo!, 2)
			IF ll_resp = 1 THEN
				dw_ingreso.deleterow(ll_row)
				if dw_ingreso.update()=1 then
					commit;
					if isvalid(w_perfil_usuario) then w_perfil_usuario.dw_encargados.retrieve()
					DELETE FROM "PERFIL_USUARIO" WHERE "PERFIL_USUARIO"."USUARIO"=:ls_usuario   
					USING		sqlca;
					if sqlca.sqlcode=0 then
						commit;
					else
						rollback;
					end if
				else
					rollback;
				end if
				dw_ingreso.setfocus()
				il_sw	= 1
			END IF
		else
			messagebox("Advertencia","Usuario NO Existe")
		end if
	end if
else
	messagebox("Advertencia","Debe seleccionar Usuario")
end if
end event

type st_nuevo from statictext within w_crear_usuario
integer x = 1166
integer y = 1344
integer width = 425
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean underline = true
long textcolor = 255
long backcolor = 80269524
string text = "&Nuevo"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long		ll_new,ll_tot_reg,ll_indi,ll_sw_pasa=0
string	ls_codigo_usuario,ls_password,ls_nombre,ls_acceso,ls_depto,ls_company,ls_opera,ls_cons_general,ls_solicitudes
date		ld_fecha_termino

ll_tot_reg	= dw_ingreso.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_codigo_usuario	= dw_ingreso.getitemstring(ll_indi,'codigo_usuario')
	ls_password			= dw_ingreso.getitemstring(ll_indi,'password')
	ls_nombre			= dw_ingreso.getitemstring(ll_indi,'nombre')
	ls_acceso			= dw_ingreso.getitemstring(ll_indi,'acceso')
	ls_depto				= dw_ingreso.getitemstring(ll_indi,'depto')
	ls_company			= dw_ingreso.getitemstring(ll_indi,'company')
	ld_fecha_termino	= date(dw_ingreso.getitemdatetime(ll_indi,'fecha_termino'))
	ls_opera				= dw_ingreso.getitemstring(ll_indi,'opera')
	ls_cons_general	= dw_ingreso.getitemstring(ll_indi,'cons_general')
	ls_solicitudes		= dw_ingreso.getitemstring(ll_indi,'solicitudes')
	if isnull(ls_codigo_usuario) or isnull(ls_codigo_usuario) or isnull(ls_password) or &
		isnull(ls_nombre) or isnull(ls_acceso) or isnull(ls_depto) or isnull(ls_company) or &
		isnull(ls_opera) or isnull(ls_cons_general) or isnull(ls_solicitudes) or isnull(ld_fecha_termino) then
		messagebox("Advertencia","Dato Inválido en Registro Nº "+string(ll_indi)+' Usuario: '+ls_codigo_usuario)
		dw_ingreso.scrolltorow(ll_indi)
		dw_ingreso.setcolumn('codigo_usuario')
		ll_sw_pasa++
		exit
	end if
next
if ll_sw_pasa=0 then
	ll_new	= dw_ingreso.insertrow(0)
	dw_ingreso.scrolltorow(ll_new)
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('codigo_usuario')
	il_sw	= 1
end if
end event

type cb_cerrar from commandbutton within w_crear_usuario
integer x = 2967
integer y = 1468
integer width = 343
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;long		ll_tot_reg,ll_indi,ll_sw_pasa=0,ll_resp
string	ls_codigo_usuario,ls_password,ls_nombre,ls_acceso,ls_depto,ls_company,ls_opera,ls_cons_general,ls_solicitudes
date		ld_fecha_termino
if il_sw=0 then
	close(parent)
else
	ll_resp	= messagebox("Advertencia","Desea Grabar cambios resalizados",Exclamation!,YesNo!,2)
	if ll_resp=1 then
		ll_tot_reg	= dw_ingreso.rowcount()
		for ll_indi=1 to ll_tot_reg
			ls_codigo_usuario	= dw_ingreso.getitemstring(ll_indi,'codigo_usuario')
			ls_password			= dw_ingreso.getitemstring(ll_indi,'password')
			ls_nombre			= dw_ingreso.getitemstring(ll_indi,'nombre')
			ls_acceso			= dw_ingreso.getitemstring(ll_indi,'acceso')
			ls_depto				= dw_ingreso.getitemstring(ll_indi,'depto')
			ls_company			= dw_ingreso.getitemstring(ll_indi,'company')
			ld_fecha_termino	= date(dw_ingreso.getitemdatetime(ll_indi,'fecha_termino'))
			ls_opera				= dw_ingreso.getitemstring(ll_indi,'opera')
			ls_cons_general	= dw_ingreso.getitemstring(ll_indi,'cons_general')
			ls_solicitudes		= dw_ingreso.getitemstring(ll_indi,'solicitudes')
			if isnull(ls_codigo_usuario) or isnull(ls_codigo_usuario) or isnull(ls_password) or &
				isnull(ls_nombre) or isnull(ls_acceso) or isnull(ls_depto) or isnull(ls_company) or &
				isnull(ls_opera) or isnull(ls_cons_general) or isnull(ls_solicitudes) or isnull(ld_fecha_termino) then
				messagebox("Advertencia","Dato Inválido en Registro Nº "+string(ll_indi)+' Usuario: '+ls_codigo_usuario)
				dw_ingreso.scrolltorow(ll_indi)
				dw_ingreso.setcolumn('codigo_usuario')
				ll_sw_pasa++
				exit
			end if
		next
		if ll_sw_pasa=0 then
			if dw_ingreso.update()=1 then
				commit;
				il_sw	= 0
				if isvalid(w_perfil_usuario) then w_perfil_usuario.dw_encargados.retrieve()
				messagebox("Grabar","Grabación Exitosa")
				close(w_crear_usuario)
			else
				rollback;
				messagebox("Error al Grabar","SQL Error al Grabar "+SQLCA.SQLErrText)
			end if
		end if
	ELSE
		close(parent)
	end if
end if
end event

type cb_grabar from commandbutton within w_crear_usuario
integer x = 27
integer y = 1468
integer width = 343
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_tot_reg,ll_indi,ll_sw_pasa=0
string	ls_codigo_usuario,ls_password,ls_nombre,ls_acceso,ls_depto,ls_company,ls_opera,ls_cons_general,ls_solicitudes
date		ld_fecha_termino
ll_tot_reg	= dw_ingreso.rowcount()
for ll_indi=1 to ll_tot_reg
	ls_codigo_usuario	= dw_ingreso.getitemstring(ll_indi,'codigo_usuario')
	ls_password			= dw_ingreso.getitemstring(ll_indi,'password')
	ls_nombre			= dw_ingreso.getitemstring(ll_indi,'nombre')
	ls_acceso			= dw_ingreso.getitemstring(ll_indi,'acceso')
	ls_depto				= dw_ingreso.getitemstring(ll_indi,'depto')
	ls_company			= dw_ingreso.getitemstring(ll_indi,'company')
	ld_fecha_termino	= date(dw_ingreso.getitemdatetime(ll_indi,'fecha_termino'))
	ls_opera				= dw_ingreso.getitemstring(ll_indi,'opera')
	ls_cons_general	= dw_ingreso.getitemstring(ll_indi,'cons_general')
	ls_solicitudes		= dw_ingreso.getitemstring(ll_indi,'solicitudes')
	if isnull(ls_codigo_usuario) and isnull(ls_codigo_usuario) and isnull(ls_password) and &
		isnull(ls_nombre) and isnull(ls_acceso) and isnull(ls_depto) and isnull(ls_company) and &
		isnull(ls_opera) and isnull(ls_cons_general) and isnull(ls_solicitudes) and isnull(ld_fecha_termino) then
		dw_ingreso.deleterow(ll_indi)
		ll_tot_reg	= ll_tot_reg - 1
	end if
	if isnull(ls_codigo_usuario) or isnull(ls_codigo_usuario) or isnull(ls_password) or &
		isnull(ls_nombre) or isnull(ls_acceso) or isnull(ls_depto) or isnull(ls_company) or &
		isnull(ls_opera) or isnull(ls_cons_general) or isnull(ls_solicitudes) or isnull(ld_fecha_termino) then
		messagebox("Advertencia","Dato Inválido en Registro Nº "+string(ll_indi)+' Usuario: '+ls_codigo_usuario)
		dw_ingreso.setfocus()
		dw_ingreso.scrolltorow(ll_indi)
		dw_ingreso.setcolumn('codigo_usuario')
		ll_sw_pasa++
		exit
	end if
next
if ll_sw_pasa=0 then
	if dw_ingreso.update()=1 then
		commit;
		il_sw	= 0
		if isvalid(w_perfil_usuario) then w_perfil_usuario.dw_encargados.retrieve()
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		messagebox("Error al Grabar","SQL Error al Grabar "+SQLCA.SQLErrText)
	end if
end if
end event

type dw_ingreso from datawindow within w_crear_usuario
integer x = 27
integer y = 32
integer width = 3282
integer height = 1400
integer taborder = 10
string title = "none"
string dataobject = "dw_ingresar_encargados"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event rowfocuschanged;if this.getrow()>0 then
	il_row				= this.getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

event itemchanged;il_sw	= 1
end event

