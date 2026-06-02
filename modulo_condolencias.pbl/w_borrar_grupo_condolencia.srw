forward
global type w_borrar_grupo_condolencia from window
end type
type cb_borrar_cli from commandbutton within w_borrar_grupo_condolencia
end type
type cb_cerrar from commandbutton within w_borrar_grupo_condolencia
end type
type cb_borrar from commandbutton within w_borrar_grupo_condolencia
end type
type dw_grupo_detalle from datawindow within w_borrar_grupo_condolencia
end type
type pb_aceptar from picturebutton within w_borrar_grupo_condolencia
end type
type st_1 from statictext within w_borrar_grupo_condolencia
end type
type sle_grupo from singlelineedit within w_borrar_grupo_condolencia
end type
type dw_grupo from datawindow within w_borrar_grupo_condolencia
end type
type gb_2 from groupbox within w_borrar_grupo_condolencia
end type
type gb_1 from groupbox within w_borrar_grupo_condolencia
end type
end forward

global type w_borrar_grupo_condolencia from window
integer width = 2167
integer height = 2156
boolean titlebar = true
string title = "Borrar Grupo Condolencias"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_borrar_cli cb_borrar_cli
cb_cerrar cb_cerrar
cb_borrar cb_borrar
dw_grupo_detalle dw_grupo_detalle
pb_aceptar pb_aceptar
st_1 st_1
sle_grupo sle_grupo
dw_grupo dw_grupo
gb_2 gb_2
gb_1 gb_1
end type
global w_borrar_grupo_condolencia w_borrar_grupo_condolencia

type variables
Long	il_grupo,il_row
end variables

on w_borrar_grupo_condolencia.create
this.cb_borrar_cli=create cb_borrar_cli
this.cb_cerrar=create cb_cerrar
this.cb_borrar=create cb_borrar
this.dw_grupo_detalle=create dw_grupo_detalle
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.sle_grupo=create sle_grupo
this.dw_grupo=create dw_grupo
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_borrar_cli,&
this.cb_cerrar,&
this.cb_borrar,&
this.dw_grupo_detalle,&
this.pb_aceptar,&
this.st_1,&
this.sle_grupo,&
this.dw_grupo,&
this.gb_2,&
this.gb_1}
end on

on w_borrar_grupo_condolencia.destroy
destroy(this.cb_borrar_cli)
destroy(this.cb_cerrar)
destroy(this.cb_borrar)
destroy(this.dw_grupo_detalle)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.sle_grupo)
destroy(this.dw_grupo)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;gf_centrar(w_borrar_grupo_condolencia)

dw_grupo.settransobject(sqlca)
dw_grupo.insertrow(0)

dw_grupo_detalle.settransobject(sqlca)
dw_grupo_detalle.insertrow(0)

il_grupo			= Long(Message.StringParm)
sle_grupo.text	= String(il_grupo)
pb_aceptar.triggerevent(clicked!)
end event

type cb_borrar_cli from commandbutton within w_borrar_grupo_condolencia
integer x = 882
integer y = 1912
integer width = 375
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Borrar cliente"
end type

event clicked;datetime	ldt_fech_sepul,ldt_fech_ingreso
string		ls_nombre_falle,ls_a_pat_falle,ls_a_mat_falle,ls_nombre_cli,ls_a_pat_cli,ls_a_mat_cli,ls_dv_falle,ls_base,ls_serie, &
			ls_cod_sup,ls_cod_age,ls_cod_mc,ls_nom_cliente,ls_a_pat_cliente,ls_a_mat_cliente,ls_fono_p_cliente,ls_celular_cliente,&
			ls_usuario
long		ll_grupo,ll_rut_falle,ll_parque,ll_corr_cliente,ll_indi,tot_reg
Double	ll_numero
ll_grupo		= long(sle_grupo.text)
ls_usuario	= gs_user
if ll_grupo > 0 then

	if MessageBox("Advertencia", "Desea Eliminar Cliente?", Question!, YesNo! ) = 1 then		
			
	ls_nombre_falle	= dw_grupo.getitemstring(1,"nombre_fallecido")
	ls_a_pat_falle		= dw_grupo.getitemstring(1,"a_paterno_fallecido")
	ls_a_mat_falle		= dw_grupo.getitemstring(1,"a_materno_fallecido")
	ll_rut_falle			= dw_grupo.getitemnumber(1,"rut_fallecido")
	ls_dv_falle			= dw_grupo.getitemstring(1,"dv")
	ls_base				= dw_grupo.getitemstring(1,"base")
	ls_serie				= dw_grupo.getitemstring(1,"serie")
	ll_numero			= dw_grupo.getitemnumber(1,"numero")
	ll_parque				= dw_grupo.getitemnumber(1,"parque")
	ldt_fech_sepul		= dw_grupo.getitemdatetime(1,"fecha_sepultacion")
	ldt_fech_ingreso	= dw_grupo.getitemdatetime(1,"fecha_ingreso")
	ls_cod_sup			= dw_grupo.getitemstring(1,"cod_sup")
	ls_cod_age			= dw_grupo.getitemstring(1,"cod_age")
	ls_cod_mc			= dw_grupo.getitemstring(1,"usuario_creador")
		
		ll_corr_cliente		= dw_grupo_detalle.getitemnumber(il_row,"correlativo")
		ls_nom_cliente		= dw_grupo_detalle.getitemstring(il_row,"nombre")
		ls_a_pat_cliente	= dw_grupo_detalle.getitemstring(il_row,"a_paterno")
		ls_a_mat_cliente	= dw_grupo_detalle.getitemstring(il_row,"a_materno")
		ls_fono_p_cliente	= dw_grupo_detalle.getitemstring(il_row,"fono_p")
		ls_celular_cliente	= dw_grupo_detalle.getitemstring(il_row,"celular")
		
		INSERT INTO "UGN_CONDOLENCIAS_LOG"  
					( "USUARIO","GRUPO","NOMBRE_FALLECIDO","A_PATERNO_FALLECIDO","A_MATERNO_FALLECIDO","RUT_FALLECIDO","DV_FALLECIDO","BASE","SERIE","NUMERO","PARQUE","FECHA_SEPULTACION","COD_AGENTE","COD_SUP","COD_MAESTRO_C","NOMBRE_CLIENTE","A_PATERNO_CLIENTE","A_MATERNO_CLIENTE","FONO_P_CLIENTE","CELULAR_CLIENTE" )  
		VALUES 	( :gs_user, 	 :ll_grupo,	:ls_nombre_falle,		:ls_a_pat_falle,						:ls_a_mat_falle,				:ll_rut_falle,		:ls_dv_falle,	 :ls_base,:ls_serie,:ll_numero,:ll_parque,	:ldt_fech_sepul,		:ls_cod_age,	:ls_cod_sup, :ls_cod_mc,			:ls_nom_cliente,	:ls_a_pat_cliente,			:ls_a_mat_cliente,		:ls_fono_p_cliente,	:ls_celular_cliente )
		USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
				DELETE FROM "UGN_CLIENTE"  
				WHERE "UGN_CLIENTE"."GRUPO" = :ll_grupo and
							"UGN_CLIENTE"."CORRELATIVO" = :ll_corr_cliente
				USING   sqlca;
				if sqlca.sqlcode=0 then
					commit;
					messagebox("AVISO","Se Elimino el Registro Exitosamente")
					close(w_borrar_grupo_condolencia)
				else
					rollback;
				end if		
			else
				rollback;
				messagebox("Error Grabar","Error Grabar UGN_CONDOLENCIAS_LOG SQL: "+sqlca.sqlerrtext)
			end if
		else
		end if		
end if
end event

type cb_cerrar from commandbutton within w_borrar_grupo_condolencia
integer x = 1737
integer y = 1912
integer width = 375
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_borrar_grupo_condolencia)
end event

type cb_borrar from commandbutton within w_borrar_grupo_condolencia
integer x = 32
integer y = 1912
integer width = 375
integer height = 100
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Borrar Grupo"
end type

event clicked;datetime	ldt_fech_sepul,ldt_fech_ingreso
string		ls_nombre_falle,ls_a_pat_falle,ls_a_mat_falle,ls_nombre_cli,ls_a_pat_cli,ls_a_mat_cli,ls_dv_falle,ls_base,ls_serie, &
			ls_cod_sup,ls_cod_age,ls_cod_mc,ls_nom_cliente,ls_a_pat_cliente,ls_a_mat_cliente,ls_fono_p_cliente,ls_celular_cliente,&
			ls_usuario
long		ll_grupo,ll_rut_falle,ll_parque,ll_corr_cliente,ll_indi,ll_tot_reg
Double	ll_numero
ll_grupo		= long(sle_grupo.text)
ls_usuario	= gs_user
if ll_grupo > 0 then
	if MessageBox("Advertencia", "Desea Eliminar Grupo?", Question!, YesNo! ) = 1 then				
	ls_nombre_falle	= dw_grupo.getitemstring(1,"nombre_fallecido")
	ls_a_pat_falle		= dw_grupo.getitemstring(1,"a_paterno_fallecido")
	ls_a_mat_falle		= dw_grupo.getitemstring(1,"a_materno_fallecido")
	ll_rut_falle			= dw_grupo.getitemnumber(1,"rut_fallecido")
	ls_dv_falle			= dw_grupo.getitemstring(1,"dv")
	ls_base				= dw_grupo.getitemstring(1,"base")
	ls_serie				= dw_grupo.getitemstring(1,"serie")
	ll_numero			= dw_grupo.getitemnumber(1,"numero")
	ll_parque				= dw_grupo.getitemnumber(1,"parque")
	ldt_fech_sepul		= dw_grupo.getitemdatetime(1,"fecha_sepultacion")
	ldt_fech_ingreso	= dw_grupo.getitemdatetime(1,"fecha_ingreso")
	ls_cod_sup			= dw_grupo.getitemstring(1,"cod_sup")
	ls_cod_age			= dw_grupo.getitemstring(1,"cod_age")
	ls_cod_mc			= dw_grupo.getitemstring(1,"usuario_creador")
	
	ll_tot_reg					= dw_grupo_detalle.rowcount()
	
	for ll_indi= 1 to ll_tot_reg
		ls_nom_cliente		= dw_grupo_detalle.getitemstring(ll_indi,"nombre")
		ls_a_pat_cliente	= dw_grupo_detalle.getitemstring(ll_indi,"a_paterno")
		ls_a_mat_cliente	= dw_grupo_detalle.getitemstring(ll_indi,"a_materno")
		ls_fono_p_cliente	= dw_grupo_detalle.getitemstring(ll_indi,"fono_p")
		ls_celular_cliente	= dw_grupo_detalle.getitemstring(ll_indi,"celular")
		
		INSERT INTO "UGN_CONDOLENCIAS_LOG"  
					( "USUARIO","GRUPO","NOMBRE_FALLECIDO","A_PATERNO_FALLECIDO","A_MATERNO_FALLECIDO","RUT_FALLECIDO","DV_FALLECIDO","BASE","SERIE","NUMERO","PARQUE","FECHA_SEPULTACION","COD_AGENTE","COD_SUP","COD_MAESTRO_C","NOMBRE_CLIENTE","A_PATERNO_CLIENTE","A_MATERNO_CLIENTE","FONO_P_CLIENTE","CELULAR_CLIENTE" )  
		VALUES 	( :gs_user, 	 :ll_grupo,	:ls_nombre_falle,		:ls_a_pat_falle,						:ls_a_mat_falle,				:ll_rut_falle,		:ls_dv_falle,	 :ls_base,:ls_serie,:ll_numero,:ll_parque,	:ldt_fech_sepul,		:ls_cod_age,	:ls_cod_sup, :ls_cod_mc,			:ls_nom_cliente,	:ls_a_pat_cliente,			:ls_a_mat_cliente,		:ls_fono_p_cliente,	:ls_celular_cliente )
		USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			else
				rollback;
				messagebox("Error Grabar","Error Grabar UGN_CONDOLENCIAS_LOG SQL: "+sqlca.sqlerrtext)
			end if
	next
		DELETE FROM "UGN_CLIENTE"  
		WHERE "UGN_CLIENTE"."GRUPO" = :ll_grupo
		USING   sqlca;
		if sqlca.sqlcode=0 then
			commit;
			DELETE FROM "UGN_CLIENTE_ASIGNAR_FALLE"  
				WHERE "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = :ll_grupo   
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit;
				messagebox("AVISO","Se Elimino el Grupo Exitosamente")
				dw_grupo.reset()
				close(w_borrar_grupo_condolencia)
			else
				rollback;
			end if	
		else
			rollback;
		end if
	else
	end if
end if
end event

type dw_grupo_detalle from datawindow within w_borrar_grupo_condolencia
integer x = 41
integer y = 952
integer width = 2062
integer height = 864
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_borrar_grupo_condolencias"
boolean vscrollbar = true
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if
end event

type pb_aceptar from picturebutton within w_borrar_grupo_condolencia
boolean visible = false
integer x = 837
integer y = 32
integer width = 155
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long	ll_grupo,ll_count_grupo

ll_grupo	= long(sle_grupo.text)

if not isnull(ll_grupo) and ll_grupo <> 0 then
	SELECT	 count("UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO")  
	INTO 		:ll_count_grupo  
	FROM 	"UGN_CLIENTE_ASIGNAR_FALLE"  
	WHERE	 "UGN_CLIENTE_ASIGNAR_FALLE"."GRUPO" = :ll_grupo
	USING	sqlca;
	if ll_count_grupo > 0 then
		dw_grupo.retrieve(ll_grupo)
		dw_grupo_detalle.retrieve(ll_grupo)
		cb_borrar.enabled	= true
	else
		messagebox("Advertencia","Nº de Grupo No Existe")
		dw_grupo.reset()
		dw_grupo_detalle.reset()
		dw_grupo.insertrow(0)
		dw_grupo_detalle.insertrow(0)
	end if	
else
	messagebox("Advertencia","No ha Ingresado un Numero de Grupo")	
end if	
end event

type st_1 from statictext within w_borrar_grupo_condolencia
integer x = 46
integer y = 68
integer width = 311
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº de Grupo"
boolean focusrectangle = false
end type

type sle_grupo from singlelineedit within w_borrar_grupo_condolencia
integer x = 366
integer y = 68
integer width = 402
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type dw_grupo from datawindow within w_borrar_grupo_condolencia
integer x = 41
integer y = 232
integer width = 2062
integer height = 560
integer taborder = 20
string title = "none"
string dataobject = "dw_borrar_grupos_condolencias"
boolean border = false
boolean livescroll = true
end type

type gb_2 from groupbox within w_borrar_grupo_condolencia
integer x = 37
integer y = 892
integer width = 2075
integer height = 944
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle grupo"
end type

type gb_1 from groupbox within w_borrar_grupo_condolencia
integer x = 37
integer y = 176
integer width = 2075
integer height = 628
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos grupo"
end type

