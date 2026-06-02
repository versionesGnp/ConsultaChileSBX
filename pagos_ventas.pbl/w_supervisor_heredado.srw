forward
global type w_supervisor_heredado from window
end type
type p_1 from picture within w_supervisor_heredado
end type
type st_usuario from statictext within w_supervisor_heredado
end type
type cb_aceptar from commandbutton within w_supervisor_heredado
end type
type cb_1 from commandbutton within w_supervisor_heredado
end type
type dw_sup_heredado from datawindow within w_supervisor_heredado
end type
type gb_1 from groupbox within w_supervisor_heredado
end type
type gb_2 from groupbox within w_supervisor_heredado
end type
end forward

global type w_supervisor_heredado from window
integer width = 2423
integer height = 808
boolean titlebar = true
string title = "Revisión Grupo Ventas Heredado"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
p_1 p_1
st_usuario st_usuario
cb_aceptar cb_aceptar
cb_1 cb_1
dw_sup_heredado dw_sup_heredado
gb_1 gb_1
gb_2 gb_2
end type
global w_supervisor_heredado w_supervisor_heredado

on w_supervisor_heredado.create
this.p_1=create p_1
this.st_usuario=create st_usuario
this.cb_aceptar=create cb_aceptar
this.cb_1=create cb_1
this.dw_sup_heredado=create dw_sup_heredado
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.p_1,&
this.st_usuario,&
this.cb_aceptar,&
this.cb_1,&
this.dw_sup_heredado,&
this.gb_1,&
this.gb_2}
end on

on w_supervisor_heredado.destroy
destroy(this.p_1)
destroy(this.st_usuario)
destroy(this.cb_aceptar)
destroy(this.cb_1)
destroy(this.dw_sup_heredado)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string	ls_cod,ls_nombre,ls_a_pater,ls_mater
long	ll_cta

gf_centrar(w_supervisor_heredado)
if gs_conexion = "Parque El Prado" then
	if gl_cod_parque=1 then
		p_1.picturename 	= 'logo_e.bmp'
	elseif gl_cod_parque=102 then
		p_1.picturename 	= 'logo_manantial.bmp'
	elseif gl_cod_parque=103 then
		p_1.picturename 	= 'logo_parque_stgo.bmp'
	else
		p_1.picturename 	= 'logo_e.bmp'
	end if
elseif gs_conexion = "Parque La Foresta" then
	p_1.picturename 	= 'logo_e_s.bmp'
elseif gs_conexion = "Parque Santiago" then
	p_1.picturename 	= 'logo_parque_stgo.bmp'
elseif gs_conexion = "Parque Concepción" then
	p_1.picturename 	= 'logo_parque_conce.jpg'
end if
if gs_depto='R' or gs_depto='B' or gs_depto='X' or gs_depto='I' or gs_depto='G' then
	if gs_depto='R' or gs_depto='B' then
		SELECT	count("SUPERVISOR_HEREDADO"."COD_SUP")  
    		INTO 		:ll_cta  
    		FROM		"SUPERVISOR_HEREDADO"  
   		WHERE	"SUPERVISOR_HEREDADO"."COD_SUP" = :gs_user
		USING	sqlca;
		if isnull(ll_cta) or ll_cta=0 then ll_cta=0
		if ll_cta>0 then
			if gs_depto='R' then
				SELECT	"COD_SUP",	"NOMBRE",	"A_PATERNO",	"A_MATERNO"  
				INTO		:ls_cod,		:ls_nombre,	:ls_a_pater,		:ls_mater
				FROM		"SUPERVISOR"  
				WHERE	"SUPERVISOR"."COD_SUP" =:gs_user
				USING	sqlca;
			elseif gs_depto='B' then
				SELECT	"JEFE_VENTAS",	"NOMBRE",	"A_PATERNO",	"A_MATERNO"  
				INTO		:ls_cod,				:ls_nombre,	:ls_a_pater,	:ls_mater
				FROM		"JEFE_VENTAS"  
				WHERE	"JEFE_VENTAS"."JEFE_VENTAS" =:gs_user
				USING	sqlca;
			end if
			if sqlca.sqlcode=0 then
				if not isnull(ls_cod) and ls_cod<>'' then
					ls_nombre					= ls_cod+' - '+ls_nombre+' '+ls_a_pater+' '+ls_mater
					st_usuario.text				= ls_nombre
					dw_sup_heredado.getchild('cod_sup',idw_detalle)
					idw_detalle.settransobject(sqlca)
					if idw_detalle.retrieve(ls_cod)=0 then
						idw_detalle.insertrow(0)
					end if
					dw_sup_heredado.insertrow(0)
				end if
			end if
		else
			messagebox("Advertencia","No Registra Grupo de Venta Heredado")
			close(w_supervisor_heredado)
		end if
	end if
else
	messagebox("Advertencia","Usuario No autorizado")
	close(w_supervisor_heredado)
end if


end event

type p_1 from picture within w_supervisor_heredado
integer x = 64
integer y = 68
integer width = 402
integer height = 444
string picturename = "logo_red_s.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_usuario from statictext within w_supervisor_heredado
integer x = 608
integer y = 124
integer width = 1669
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_aceptar from commandbutton within w_supervisor_heredado
integer x = 576
integer y = 536
integer width = 357
integer height = 120
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;string	ls_codigo,ls_nombre
long	ll_res

dw_sup_heredado.accepttext()
ls_codigo						= dw_sup_heredado.getitemstring(1,'cod_sup')
if not isnull(ls_codigo) and ls_codigo<>'' then
	SELECT	"ENCARGADOS"."NOMBRE"  
	INTO 		:ls_nombre  
	FROM 	"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_codigo  
	USING	sqlca;
	if gs_nombre_usuario <> ls_nombre then
		ll_res					= messageBox("Advertencia", 'Desea Revisar Contratos y Listados, "Grupo de Ventas Heredado"', Exclamation!, YesNo!, 2)
	else
		ll_res					= 1
	end if
	if ll_res=1 then
		gs_user				= ls_codigo
		close(w_supervisor_heredado)
	end if
else
	if isnull(ls_codigo) or ls_codigo='' then
		messagebox("Advertencia","Debe Seleccionar Grupo de Ventas Heredado")
		dw_sup_heredado.setfocus()
	end if
end if




end event

type cb_1 from commandbutton within w_supervisor_heredado
integer x = 1966
integer y = 536
integer width = 357
integer height = 120
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_supervisor_heredado)
end event

type dw_sup_heredado from datawindow within w_supervisor_heredado
integer x = 608
integer y = 380
integer width = 1696
integer height = 92
integer taborder = 10
string dataobject = "dwe_supervisor_heredado"
boolean border = false
boolean hsplitscroll = true
boolean livescroll = true
end type

type gb_1 from groupbox within w_supervisor_heredado
integer x = 576
integer y = 44
integer width = 1742
integer height = 204
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuario"
end type

type gb_2 from groupbox within w_supervisor_heredado
integer x = 576
integer y = 300
integer width = 1742
integer height = 204
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo Ventas a Revisar"
end type

