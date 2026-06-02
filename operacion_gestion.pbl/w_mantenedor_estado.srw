forward
global type w_mantenedor_estado from window
end type
type dw_estado_nuevo from datawindow within w_mantenedor_estado
end type
type cb_cerrar from commandbutton within w_mantenedor_estado
end type
type cb_grabar from commandbutton within w_mantenedor_estado
end type
type pb_aceptar from picturebutton within w_mantenedor_estado
end type
type ddlb_serie from dropdownlistbox within w_mantenedor_estado
end type
type ddlb_base from dropdownlistbox within w_mantenedor_estado
end type
type st_2 from statictext within w_mantenedor_estado
end type
type st_3 from statictext within w_mantenedor_estado
end type
type st_4 from statictext within w_mantenedor_estado
end type
type em_numero from editmask within w_mantenedor_estado
end type
type gb_1 from groupbox within w_mantenedor_estado
end type
type gb_2 from groupbox within w_mantenedor_estado
end type
type gb_3 from groupbox within w_mantenedor_estado
end type
type dw_estado_ctto from datawindow within w_mantenedor_estado
end type
type dw_cliente from datawindow within w_mantenedor_estado
end type
end forward

global type w_mantenedor_estado from window
integer width = 3579
integer height = 1136
boolean titlebar = true
string title = "Mantenedor Estados Contratos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_estado_nuevo dw_estado_nuevo
cb_cerrar cb_cerrar
cb_grabar cb_grabar
pb_aceptar pb_aceptar
ddlb_serie ddlb_serie
ddlb_base ddlb_base
st_2 st_2
st_3 st_3
st_4 st_4
em_numero em_numero
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
dw_estado_ctto dw_estado_ctto
dw_cliente dw_cliente
end type
global w_mantenedor_estado w_mantenedor_estado

on w_mantenedor_estado.create
this.dw_estado_nuevo=create dw_estado_nuevo
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.pb_aceptar=create pb_aceptar
this.ddlb_serie=create ddlb_serie
this.ddlb_base=create ddlb_base
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.em_numero=create em_numero
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_estado_ctto=create dw_estado_ctto
this.dw_cliente=create dw_cliente
this.Control[]={this.dw_estado_nuevo,&
this.cb_cerrar,&
this.cb_grabar,&
this.pb_aceptar,&
this.ddlb_serie,&
this.ddlb_base,&
this.st_2,&
this.st_3,&
this.st_4,&
this.em_numero,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.dw_estado_ctto,&
this.dw_cliente}
end on

on w_mantenedor_estado.destroy
destroy(this.dw_estado_nuevo)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.pb_aceptar)
destroy(this.ddlb_serie)
destroy(this.ddlb_base)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_numero)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_estado_ctto)
destroy(this.dw_cliente)
end on

event open;String	 ls_base,ls_serie
long	ll_count

dw_estado_ctto.settransobject(sqlca)
dw_estado_ctto.insertrow(0)
dw_cliente.settransobject(sqlca)
dw_cliente.insertrow(0)
dw_estado_nuevo.insertrow(0)	

SELECT count("SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD")
INTO		:ll_count
FROM 	"SOL_PERMISOS_USUARIO"  
WHERE 	( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
			( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' ) AND  
			( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'CE' )
USING	sqlca;

if ll_count > 0 or gs_depto = 'I' then
//	dw_cliente.reset()
//	dw_estado_ctto.reset()
	DECLARE	x1 CURSOR FOR  
	SELECT 	"TIPO_CONTRATO"."CODIGO"  
	FROM 	"TIPO_CONTRATO"  
	USING	 sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		ddlb_base.reset()
		DO WHILE sqlca.sqlcode=0 
			fetch x1 into :ls_base;
			if not isnull(ls_base) and ls_base<>'' then
				ddlb_base.additem(ls_base)
			end if
			setnull(ls_base)
		LOOP
	end if
	close x1;
	ddlb_base.setfocus()
else
	Messagebox('Advertencia','Usuario no Autorizado')
	close(w_mantenedor_estado)
end if
end event

type dw_estado_nuevo from datawindow within w_mantenedor_estado
integer x = 2546
integer y = 344
integer width = 960
integer height = 92
integer taborder = 60
string title = "none"
string dataobject = "dw_estado_nuevo_mant"
boolean border = false
boolean livescroll = true
end type

type cb_cerrar from commandbutton within w_mantenedor_estado
integer x = 3150
integer y = 908
integer width = 361
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Cerrar"
end type

event clicked;close(w_mantenedor_estado)
end event

type cb_grabar from commandbutton within w_mantenedor_estado
integer x = 32
integer y = 908
integer width = 357
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Grabar"
end type

event clicked;long 		ll_rut,ll_correlativo
String		ls_dv,ls_base,ls_serie,ls_estado_original,v,ls_estado_fact,ls_ddlb_estado,ls_estado_ctto
double	ll_numero
date		ld_fecha


if getrow(dw_estado_ctto)>0 and getrow(dw_cliente)>0 then
//	ls_ddlb_estado		= mid(trim(ddlb_estado_mod.text),1,1)
	ls_ddlb_estado		= dw_estado_nuevo.getitemstring(1,'nombre_estado')
	if isnull(ls_ddlb_estado) or ls_ddlb_estado = "" then
		MessageBox('Advertencia','Debe Ingresar Estado Nuevo')
		dw_estado_nuevo.setfocus()
	else	
		ll_rut												= dw_cliente.getitemnumber(1,'rut')
		ls_dv												= dw_cliente.getitemstring(1,'dv')
		ls_base											= dw_estado_ctto.getitemstring(1,'codigo')
		ls_serie											= dw_estado_ctto.getitemstring(1,'serie')
		ll_numero										= dw_estado_ctto.getitemnumber(1,'numero')
		ls_estado_original								= dw_estado_ctto.getitemstring(1,'estado')
		ld_fecha											= date(gdt_fec_sistema)
		SELECT 	MAX("LOG_MENTENEDOR_ESTADO"."CORRELATIVO")
		INTO 		:ll_correlativo  
		FROM 	"LOG_MENTENEDOR_ESTADO"  
		WHERE 	( "LOG_MENTENEDOR_ESTADO"."BASE" = :ls_base ) AND  
					( "LOG_MENTENEDOR_ESTADO"."SERIE" = :ls_serie ) AND  
					( "LOG_MENTENEDOR_ESTADO"."NUMERO" = :ll_numero )
		USING	sqlca;
		if ll_correlativo  = 0 or isnull(ll_correlativo) then
			ll_correlativo   = 1
		else
			ll_correlativo  	= ll_correlativo  + 1
		end if
		SELECT 	"ESTADO"."ESTADO_FACTURACION"  
		INTO 		:ls_estado_ctto  
		FROM 	"ESTADO"  
		WHERE 	"ESTADO"."COD_ESTADO" = :ls_ddlb_estado   ;

		if ls_estado_ctto = 'R' then
			UPDATE 	"CADENA"  
			SET 		"ESTADO" = :ls_ddlb_estado,
						"FECHA_RES" = :gdt_fec_sistema
			WHERE ( "CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero )
			USING	sqlca;
		else
			UPDATE 	"CADENA"  
			SET 		"ESTADO" = :ls_ddlb_estado  
			WHERE ( "CADENA"."CODIGO" = :ls_base ) AND  
						( "CADENA"."SERIE" = :ls_serie ) AND  
						( "CADENA"."NUMERO" = :ll_numero )
			USING	sqlca;
		end if
		if sqlca.sqlcode= 0 then
			commit;
			INSERT INTO "LOG_MENTENEDOR_ESTADO"  
									( "CORRELATIVO",    "BASE", "SERIE",       "NUMERO",   	"ESTADO",  	 "ESTADO_ANTERIOR",  "USUARIO",   "FECHA_SISTEMA", 		"FECHA",   "MOTIVO",   "RUT",   	"DV" )  
			VALUES 		( :ll_correlativo,   :ls_base,   :ls_serie,   :ll_numero,   :ls_ddlb_estado,  :ls_estado_original,  	  :gs_user,   	:gdt_fec_sistema,   :ld_fecha,        null,   		:ll_rut,   :ls_dv )
			USING sqlca;
			if sqlca.sqlcode= 0 then
				commit;
				messagebox('Aviso','Grabación Exitosa')
				dw_estado_ctto.reset()
				dw_cliente.reset()
				ddlb_serie.reset()
				em_numero.text = ''
				ddlb_base.reset()
				dw_estado_nuevo.reset()
				dw_estado_ctto.insertrow(0)
				dw_cliente.insertrow(0)
				dw_estado_nuevo.insertrow(0)	
				DECLARE	x1 CURSOR FOR  
				SELECT 	"TIPO_CONTRATO"."CODIGO"  
				FROM 	"TIPO_CONTRATO"  
				USING	 sqlca;
				open x1;
				if sqlca.sqlcode=0 then
					ddlb_base.reset()
					DO WHILE sqlca.sqlcode=0 
						fetch x1 into :ls_base;
						if not isnull(ls_base) and ls_base<>'' then
							ddlb_base.additem(ls_base)
						end if
						setnull(ls_base)
					LOOP
				end if
				close x1;
				ddlb_base.setfocus()
			else
				rollback;
				messagebox('Error','Error al grabar en Tabla de LOG_MENTENEDOR_ESTADO')
			end if	
		else
			rollback;
			messagebox('Error','Error al Actualizar Tabla CADENA')
		end if	
	end if
end if
end event

type pb_aceptar from picturebutton within w_mantenedor_estado
integer x = 1577
integer y = 88
integer width = 160
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;long 		ll_rut
String		ls_base,ls_serie,ls_estado_original,ls_ddlb_estado,ls_estado_fact
double	ll_numero

ls_base			= trim(ddlb_base.text)
ls_serie			= trim(ddlb_serie.text)
ll_numero		= Double(em_numero.text)

SELECT "CADENA"."RUT"  
INTO 		:ll_rut  
FROM 	"CADENA"  
WHERE 	( "CADENA"."CODIGO" = :ls_base ) AND  
			( "CADENA"."SERIE" = :ls_serie ) AND  
			( "CADENA"."NUMERO" = :ll_numero )
USING sqlca;

if dw_estado_ctto.retrieve(ls_base,ls_serie,ll_numero)=0 then
	messagebox('Advertencia','No Existe Contrato')
	em_numero.text = ''
	em_numero.setfocus()
else
	if dw_cliente.retrieve(ll_rut)=0 then
		messagebox('Advertencia','No se Encuentra rut Asociado a Contrato')
	else
		ls_estado_original	= dw_estado_ctto.getitemstring(1,'estado')
		if not isnull(ls_estado_original) and ls_estado_original<>'' then
			
			dw_estado_nuevo.settransobject(sqlca)	
			dw_estado_nuevo.getchild('nombre_estado',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(ls_estado_original)=0 then
				idw_detalle.insertrow(0)
			end if		
//			SELECT "ESTADO"."ESTADO_FACTURACION"
//			INTO		:ls_estado_fact
//			FROM 	"ESTADO"  
//			WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado_original
//			USING	sqlca;
//			if not isnull(ls_estado_fact) and ls_estado_fact<>'' then
//				DECLARE	x3 CURSOR FOR  
//				SELECT 	"ESTADO"."SIGLA_ESTADO"  
//				FROM 	"ESTADO"  
//				WHERE 	"ESTADO"."ESTADO_FACTURACION" = :ls_estado_fact   and
//							"ESTADO"."COD_ESTADO" <> :ls_estado_original
//				USING		sqlca;
//				open x3;
//				if sqlca.sqlcode=0 then
//					ddlb_estado_mod.reset()
//					DO WHILE sqlca.sqlcode=0 
//						fetch x3 into :ls_ddlb_estado;
//						if not isnull(ls_ddlb_estado) and ls_ddlb_estado<>'' then
//							ddlb_estado_mod.additem(ls_ddlb_estado)
//						end if
//						setnull(ls_ddlb_estado)
//					LOOP
//				end if
//				close x3;
//			end if	
		end if				
	end if	
end if	
end event

type ddlb_serie from dropdownlistbox within w_mantenedor_estado
integer x = 558
integer y = 108
integer width = 206
integer height = 400
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_cliente.reset()
dw_estado_ctto.reset()
dw_estado_nuevo.reset()
dw_estado_ctto.insertrow(0)
dw_cliente.insertrow(0)
dw_estado_nuevo.insertrow(0)
//em_numero.setfocus()
end event

type ddlb_base from dropdownlistbox within w_mantenedor_estado
integer x = 206
integer y = 112
integer width = 206
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String	ls_base,ls_serie
ls_base	= trim(ddlb_base.text)
if not isnull(ls_base) and ls_base<>'' then
	dw_cliente.reset()
	dw_estado_ctto.reset()
	dw_estado_nuevo.reset()
	dw_estado_ctto.insertrow(0)
	dw_cliente.insertrow(0)
	dw_estado_nuevo.insertrow(0)
	DECLARE	x1 CURSOR FOR  
	SELECT 	"TABLA_SERIES"."SERIE"  
	FROM 		"TABLA_SERIES"  
	WHERE 	"TABLA_SERIES"."BASE" = :ls_base   
	USING		sqlca;
	open x1;
	if sqlca.sqlcode=0 then
		ddlb_serie.reset()
		DO WHILE sqlca.sqlcode=0 
			fetch x1 into :ls_serie;
			if not isnull(ls_serie) and ls_serie<>'' then
				ddlb_serie.additem(ls_serie)
			end if
			setnull(ls_serie)
		LOOP
	end if
	close x1;
//	ddlb_serie.setfocus()
end if
end event

type st_2 from statictext within w_mantenedor_estado
integer x = 50
integer y = 124
integer width = 133
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_mantenedor_estado
integer x = 411
integer y = 124
integer width = 133
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Serie"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_mantenedor_estado
integer x = 782
integer y = 124
integer width = 187
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_numero from editmask within w_mantenedor_estado
integer x = 978
integer y = 112
integer width = 558
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###############"
end type

event modified;String	ls_base,ls_serie
Double		ll_numero

dw_estado_ctto.reset()
dw_cliente.reset()
dw_estado_nuevo.reset()
dw_estado_ctto.insertrow(0)
dw_cliente.insertrow(0)
dw_estado_nuevo.insertrow(0)
ls_base		= trim(ddlb_base.text)
ls_serie		= trim(ddlb_serie.text)
ll_numero	= Double(em_numero.text)
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and &
	ls_serie<>'' and ll_numero>0 then
	dw_cliente.reset()
	dw_estado_ctto.reset()
	dw_estado_ctto.insertrow(0)
	dw_cliente.insertrow(0)
	pb_aceptar.triggerevent(clicked!)
end if

end event

type gb_1 from groupbox within w_mantenedor_estado
integer x = 32
integer y = 32
integer width = 1536
integer height = 212
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ingresar Contrato"
end type

type gb_2 from groupbox within w_mantenedor_estado
integer x = 27
integer y = 480
integer width = 3483
integer height = 384
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Datos Cliente"
end type

type gb_3 from groupbox within w_mantenedor_estado
integer x = 32
integer y = 264
integer width = 3483
integer height = 204
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado Contrato"
end type

type dw_estado_ctto from datawindow within w_mantenedor_estado
integer x = 41
integer y = 344
integer width = 2514
integer height = 100
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mant_estado_ctto"
boolean border = false
boolean livescroll = true
end type

type dw_cliente from datawindow within w_mantenedor_estado
integer x = 41
integer y = 544
integer width = 3465
integer height = 300
boolean bringtotop = true
string title = "none"
string dataobject = "dw_clientes_mant_estado"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String		ls_base,ls_serie
Double	ll_numero

dw_cliente.reset()
dw_estado_ctto.reset()
ls_base		= trim(ddlb_base.text)
ls_serie		= trim(ddlb_serie.text)
ll_numero	= Double(em_numero.text)
//gs_base		= ls_base
//gs_serie		= ls_serie
//gi_numero	= ll_numero
if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and &
	ls_serie<>'' and ll_numero>0 then
	if dw_cliente.retrieve(ls_base,ls_serie,ll_numero)=0 then
		messagebox("Advertencia","No Registra Dato")
		em_numero.setfocus()
	else
		if dw_estado_ctto.retrieve(ls_base,ls_serie,ll_numero)=0 then
			messagebox("Advertencia","No Registra Dato")
			em_numero.setfocus()
		end if	
	end if
end if

end event

