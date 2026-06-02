forward
global type w_convenio_mantenedor from window
end type
type cb_1 from commandbutton within w_convenio_mantenedor
end type
type dw_imprimir from datawindow within w_convenio_mantenedor
end type
type cb_imprimir from commandbutton within w_convenio_mantenedor
end type
type cb_buscar from commandbutton within w_convenio_mantenedor
end type
type cb_limpiar from commandbutton within w_convenio_mantenedor
end type
type dw_lista from datawindow within w_convenio_mantenedor
end type
type cb_grabar from commandbutton within w_convenio_mantenedor
end type
type cb_ingreso_beneficio from commandbutton within w_convenio_mantenedor
end type
type cb_cerrar from commandbutton within w_convenio_mantenedor
end type
type gb_2 from groupbox within w_convenio_mantenedor
end type
type gb_1 from groupbox within w_convenio_mantenedor
end type
type dw_convenios from datawindow within w_convenio_mantenedor
end type
end forward

global type w_convenio_mantenedor from window
integer width = 2542
integer height = 2532
boolean titlebar = true
string title = "Mantenedor Convenios"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_imprimir dw_imprimir
cb_imprimir cb_imprimir
cb_buscar cb_buscar
cb_limpiar cb_limpiar
dw_lista dw_lista
cb_grabar cb_grabar
cb_ingreso_beneficio cb_ingreso_beneficio
cb_cerrar cb_cerrar
gb_2 gb_2
gb_1 gb_1
dw_convenios dw_convenios
end type
global w_convenio_mantenedor w_convenio_mantenedor

type variables
long	il_row,il_cod_beneficio,il_modif
end variables

forward prototypes
public subroutine wf_itemchanged (long al_cod_conv, string as_columna)
end prototypes

public subroutine wf_itemchanged (long al_cod_conv, string as_columna);string ls_dv_empresa,ls_dv_contacto,ls_glosa,ls_direccion,ls_fono,ls_notas,ls_vigen_desc,&
		ls_vigen_cod,ls_contacto,ls_estado,ls_email_contacto,ls_cod_aux,ls_superv,ls_nulo
long	ll_rut_empresa,ll_rut_contacto,ll_cont,ll_tot_reg,ll_indi,ll_cod_aux,ll_row,ll_max,ll_cod_benef_det,ll_cont_beneficios,ll_nivel,ll_new,ll_res
date	ld_fecha_ctto,ld_fec_vigen

dw_convenios.AcceptText()
setnull(ll_tot_reg);
CHOOSE CASE as_columna
	CASE 'cod_convenio'
		if dw_convenios.retrieve(al_cod_conv) > 0 then
			dw_lista.enabled		= true
			ll_tot_reg				= dw_lista.rowcount()
			for ll_indi=1 to ll_tot_reg
				dw_lista.setitem(ll_indi,'estado_reg',1)
			next
			SELECT MAX("CONVENIO_RETIRO_DET"."COD_BENEFICIO_DET")
			INTO	:ll_max  
			FROM 	"CONVENIO_RETIRO_DET"  
			WHERE ( "CONVENIO_RETIRO_DET"."COD_CONVENIO" = :al_cod_conv ) AND  
					  ( "CONVENIO_RETIRO_DET"."COD_BENEFICIO" = :il_cod_beneficio )   
			USING sqlca;
			for ll_indi= 1 to ll_max
				SELECT 	count("CONVENIO_RETIRO_DET"."COD_BENEFICIO_DET")
				INTO 		:ll_cod_benef_det  
				FROM 	"CONVENIO_RETIRO_DET"  
				WHERE 	"CONVENIO_RETIRO_DET"."COD_CONVENIO" = :al_cod_conv AND  
							"CONVENIO_RETIRO_DET"."COD_BENEFICIO" = :il_cod_beneficio AND
							"CONVENIO_RETIRO_DET"."COD_BENEFICIO_DET"  = :ll_indi
				USING	sqlca;
				if ll_cod_benef_det <> 0 then
					dw_lista.setitem(ll_indi,'estado_reg',0)
				end if
			next			
		else
			ll_new					= dw_convenios.insertrow(0)
			dw_convenios.setitem(ll_new,'cod_convenio',al_cod_conv)
			ll_res						= messagebox("Advertencia","Desea Crear Convenio "+string(al_cod_conv),Exclamation!,YesNo!,2)
			if ll_res=1 then
				dw_convenios.setitem(ll_new,'cod_convenio',al_cod_conv)
				dw_convenios.setitem(ll_new,'c_estado','S')
				dw_convenios.accepttext()
			else
				cb_limpiar.triggerevent(clicked!)
			end if
		end if
		ld_fec_vigen				= date('31/12/2099')
		dw_convenios.setitem(1,'vigencia_convenio',ld_fec_vigen)
		ls_superv								= dw_convenios.getitemstring(1,'cod_sup')
		dw_convenios.getchild('cod_agente',idw_detalle)
		idw_detalle.settransobject(sqlca)
		dw_convenios.accepttext()
		if idw_detalle.retrieve(ls_superv) = 0 then
			idw_detalle.insertrow(0)
		end if	
		dw_convenios.accepttext()
	CASE 'dv_empresa','rut_empresa'
		ll_rut_empresa				= dw_convenios.getitemnumber(1,'rut_empresa')
		ls_dv_empresa				= dw_convenios.getitemstring(1,'dv_empresa')
		if not isnull(ll_rut_empresa) and not isnull(ls_dv_empresa) then
			if String(trim(ls_dv_empresa)) <> String(gf_obtener_dv(long(trim(string(ll_rut_empresa))))) then
				messagebox('Error','El Rut Empresa no es valido',stopsign!)
				dw_convenios.Setitem(1,'dv_empresa','')
				dw_convenios.accepttext()
				dw_convenios.setfocus()
				dw_convenios.setcolumn('dv_empresa')
				return
			end if
		end if	
	CASE 'dv_contacto','rut_contacto'
		ll_rut_contacto				= dw_convenios.getitemnumber(1,'rut_contacto')
		ls_dv_contacto				= dw_convenios.getitemstring(1,'dv_contacto')
		if not isnull(ll_rut_contacto) and not isnull(ls_dv_contacto) then
			if String(trim(ls_dv_contacto)) <> String(gf_obtener_dv(long(trim(string(ll_rut_contacto))))) then
				messagebox('Error','El Rut Contacto no es valido',stopsign!)
				dw_convenios.Setitem(1,'dv_contacto','')
				dw_convenios.accepttext()
				dw_convenios.setfocus()
				dw_convenios.setcolumn('dv_contacto')
				return
			end if
		end if	
	CASE 'cod_nivel'	
		SELECT count(*)
		INTO	:ll_cont_beneficios
		FROM "BENEFICIOS_COMPLEMENTARIO",   
				"BENEFICIOS_COMPLEMENTARIO_DET",   
				"CONVENIO_RETIRO_DET"  
		WHERE ( "BENEFICIOS_COMPLEMENTARIO"."CODIGO" = "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" ) and  
				( "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" = "CONVENIO_RETIRO_DET"."COD_BENEFICIO" ) and  
				( "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO_BENEFICIO" = "CONVENIO_RETIRO_DET"."COD_BENEFICIO_DET" ) and  
				( ( "BENEFICIOS_COMPLEMENTARIO_DET"."CODIGO" = :il_cod_beneficio ) AND  
				( "CONVENIO_RETIRO_DET"."COD_CONVENIO" = :al_cod_conv ) )  
		USING sqlca; 
		if ll_cont_beneficios = 0 then
			ll_nivel			= dw_convenios.getitemnumber(1,'cod_nivel')
			ll_tot_reg	= dw_lista.rowcount()
			for ll_indi=1 to ll_tot_reg
				dw_lista.setitem(ll_indi,'estado_reg',1)
			next	
			if ll_nivel = 1 then
				dw_lista.setitem(1,'estado_reg',0)
				dw_lista.setitem(4,'estado_reg',0)
				dw_lista.setitem(7,'estado_reg',0)
				dw_lista.setitem(10,'estado_reg',0)
				dw_lista.setitem(12,'estado_reg',0)
				dw_lista.setitem(13,'estado_reg',0)
				dw_lista.setitem(14,'estado_reg',0)
				dw_lista.setitem(15,'estado_reg',0)
				dw_lista.setitem(16,'estado_reg',0)
				dw_lista.setitem(17,'estado_reg',0)
			elseif ll_nivel = 2 then
				dw_lista.setitem(2,'estado_reg',0)
				dw_lista.setitem(5,'estado_reg',0)
				dw_lista.setitem(8,'estado_reg',0)
				dw_lista.setitem(10,'estado_reg',0)
				dw_lista.setitem(12,'estado_reg',0)
				dw_lista.setitem(13,'estado_reg',0)
				dw_lista.setitem(14,'estado_reg',0)
				dw_lista.setitem(15,'estado_reg',0)
				dw_lista.setitem(16,'estado_reg',0)
				dw_lista.setitem(17,'estado_reg',0)
			elseif ll_nivel = 3 then
				dw_lista.setitem(3,'estado_reg',0)
				dw_lista.setitem(6,'estado_reg',0)
				dw_lista.setitem(9,'estado_reg',0)
				dw_lista.setitem(10,'estado_reg',0)
				dw_lista.setitem(11,'estado_reg',0)
				dw_lista.setitem(12,'estado_reg',0)
				dw_lista.setitem(13,'estado_reg',0)
				dw_lista.setitem(14,'estado_reg',0)
				dw_lista.setitem(15,'estado_reg',0)
				dw_lista.setitem(16,'estado_reg',0)
				dw_lista.setitem(17,'estado_reg',0)
			end if	
		end if
	CASE 'cod_sup'	
		dw_convenios.setitem(1,'cod_agente',ls_nulo)
		dw_convenios.accepttext()
		ls_superv								= dw_convenios.getitemstring(1,'cod_sup')
		if idw_detalle.retrieve(ls_superv) = 0 then
			idw_detalle.insertrow(0)
		end if	
		dw_convenios.accepttext()
	CASE 'cod_agente'	
			dw_convenios.accepttext()
END CHOOSE

end subroutine

on w_convenio_mantenedor.create
this.cb_1=create cb_1
this.dw_imprimir=create dw_imprimir
this.cb_imprimir=create cb_imprimir
this.cb_buscar=create cb_buscar
this.cb_limpiar=create cb_limpiar
this.dw_lista=create dw_lista
this.cb_grabar=create cb_grabar
this.cb_ingreso_beneficio=create cb_ingreso_beneficio
this.cb_cerrar=create cb_cerrar
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_convenios=create dw_convenios
this.Control[]={this.cb_1,&
this.dw_imprimir,&
this.cb_imprimir,&
this.cb_buscar,&
this.cb_limpiar,&
this.dw_lista,&
this.cb_grabar,&
this.cb_ingreso_beneficio,&
this.cb_cerrar,&
this.gb_2,&
this.gb_1,&
this.dw_convenios}
end on

on w_convenio_mantenedor.destroy
destroy(this.cb_1)
destroy(this.dw_imprimir)
destroy(this.cb_imprimir)
destroy(this.cb_buscar)
destroy(this.cb_limpiar)
destroy(this.dw_lista)
destroy(this.cb_grabar)
destroy(this.cb_ingreso_beneficio)
destroy(this.cb_cerrar)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_convenios)
end on

event open;long ll_tot_reg,ll_indi
string	ls_per_usuario

gf_centrar(w_convenio_mantenedor)
il_modif							= 0
dw_convenios.settransobject(sqlca)
//dw_convenios.insertrow(0)
dw_lista.settransobject(sqlca)
dw_lista.insertrow(0)
dw_imprimir.settransobject(sqlca)
dw_imprimir.insertrow(0)
il_cod_beneficio				= 6
dw_lista.retrieve(il_cod_beneficio)
ll_tot_reg	= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	dw_lista.setitem(ll_indi,'estado_reg',1)
next
dw_convenios.getchild('cod_sup',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.reset()
if idw_detalle2.retrieve()=0 then
	idw_detalle2.insertrow(0)
end if
//if idw_detalle2.retrieve(gs_user)=0 then
//	idw_detalle2.insertrow(0)
//end if
//dw_convenios.getchild('cod_agente',idw_detalle)
//idw_detalle.settransobject(sqlca)
//if idw_detalle.retrieve('')=0 then idw_detalle.insertrow(0)
dw_convenios.getchild('cod_agente',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.reset()
if idw_detalle.retrieve('')=0 then
	idw_detalle.insertrow(0)
end if
dw_convenios.insertrow(0)
dw_convenios.accepttext()

SELECT "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD"
INTO 		:ls_per_usuario  
FROM	 	"SOL_PERMISOS_USUARIO"  
WHERE 	( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
			( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )
USING	sqlca;
if ls_per_usuario = 'CN' or gs_depto = 'I' then
else
	Messagebox('Aviso','No Tiene Permisos Para Esta Aplicacion')
	Close(w_convenio_mantenedor)
end if	
end event

type cb_1 from commandbutton within w_convenio_mantenedor
integer x = 1353
integer y = 2312
integer width = 494
integer height = 104
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ver Tabla Convenio"
end type

event clicked;if isvalid(w_convenio_imprimir_general) then close(w_convenio_imprimir_general)
open(w_convenio_imprimir_general)
end event

type dw_imprimir from datawindow within w_convenio_mantenedor
integer x = 50
integer y = 2692
integer width = 686
integer height = 504
string title = "none"
string dataobject = "dw_imprimir_codigos_beneficios"
boolean border = false
boolean livescroll = true
end type

type cb_imprimir from commandbutton within w_convenio_mantenedor
integer x = 1047
integer y = 2312
integer width = 302
integer height = 104
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;long ll_cod_convenio,ll_cont_beneficios

ll_cod_convenio		= dw_convenios.getitemnumber(1,'cod_convenio')
SELECT	count(*)
INTO		:ll_cont_beneficios
FROM 	"CONVENIO_RETIRO_DET"  
WHERE	( "CONVENIO_RETIRO_DET"."COD_CONVENIO" = :ll_cod_convenio ) AND  
			( "CONVENIO_RETIRO_DET"."COD_BENEFICIO" = :il_cod_beneficio )
USING sqlca;
if ll_cod_convenio > 0  then
	if il_modif > 0 then
		messagebox('Aviso','Debe Guardar Cambios Beneficios del Convenio')
		return
	end if	
	if ll_cont_beneficios > 0 then
		dw_imprimir.retrieve(ll_cod_convenio)
		if dw_imprimir.rowcount()>0 then
			dw_imprimir.object.t_usuario.text	= gs_user
			dw_imprimir.accepttext()
			f_Print( dw_imprimir )
		end if
	else
		messagebox('Aviso','Debe Guardar Beneficios del Convenio')
	end if	
end if	
end event

type cb_buscar from commandbutton within w_convenio_mantenedor
integer x = 393
integer y = 2312
integer width = 302
integer height = 104
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;if isvalid(w_lista_convenios) then close(w_lista_convenios)
open(w_lista_convenios)
end event

type cb_limpiar from commandbutton within w_convenio_mantenedor
integer x = 695
integer y = 2312
integer width = 302
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;long ll_tot_reg,ll_indi

il_modif			= 0
//dw_convenios.settransobject(sqlca)
dw_convenios.reset()
dw_convenios.insertrow(0)
//dw_lista.settransobject(sqlca)
dw_lista.reset()
dw_lista.insertrow(0)
dw_lista.retrieve(il_cod_beneficio)
ll_tot_reg	= dw_lista.rowcount()
for ll_indi=1 to ll_tot_reg
	dw_lista.setitem(ll_indi,'estado_reg',1)
next	
dw_lista.enabled	= false
end event

type dw_lista from datawindow within w_convenio_mantenedor
integer x = 59
integer y = 840
integer width = 2423
integer height = 1412
integer taborder = 20
string title = "none"
string dataobject = "dw_convenio_beneficios_detalle"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clicked;if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;string		ls_glosa,ls_direccion,ls_fono,ls_notas,ls_vigen_desc,ls_vigen_cod,ls_contacto,ls_estado,&
			ls_dv_empresa,ls_dv_contacto,ls_email_contacto
long		ll_cod_convenio,ll_rut_empresa,ll_rut_contacto,ll_nivel
date		ld_fecha_ctto

dw_lista.accepttext()
if row>0 then 
	il_row						= row
	ll_cod_convenio		= dw_lista.getitemnumber(il_row,'cod_convenio')
//	rb_editar.checked		= true
//	rb_editar.triggerEvent(clicked!)
	SELECT "CONVENIO_RETIRO"."GLOSA","CONVENIO_RETIRO"."DIRECCION","CONVENIO_RETIRO"."FONO","CONVENIO_RETIRO"."NOTAS",
			"CONVENIO_RETIRO"."VIGENCIA_DESCRIPCION",  "CONVENIO_RETIRO"."VIGENCIA_CODIGO","CONVENIO_RETIRO"."CONTACTO",   
			"CONVENIO_RETIRO"."ESTADO","CONVENIO_RETIRO"."RUT_EMPRESA","CONVENIO_RETIRO"."DV_EMPRESA","CONVENIO_RETIRO"."RUT_CONTACTO",   
			"CONVENIO_RETIRO"."DV_CONTACTO","CONVENIO_RETIRO"."EMAIL_CONTACTO","CONVENIO_RETIRO"."FECHA_CTTO","CONVENIO_RETIRO"."COD_NIVEL"  
	INTO 	:ls_glosa, :ls_direccion, :ls_fono, :ls_notas,   
			:ls_vigen_desc, :ls_vigen_cod, :ls_contacto,
			:ls_estado,:ll_rut_empresa,:ls_dv_empresa,:ll_rut_contacto,   
			:ls_dv_contacto,:ls_email_contacto,:ld_fecha_ctto,:ll_nivel  
	FROM "CONVENIO_RETIRO"  
	WHERE "CONVENIO_RETIRO"."COD_CONVENIO" = :ll_cod_convenio   
	USING	sqlca;
	
	dw_convenios.setitem(1,'cod_convenio',ll_cod_convenio)
	dw_convenios.setitem(1,'glosa',ls_glosa)
	dw_convenios.setitem(1,'direccion',ls_direccion)
	dw_convenios.setitem(1,'fono',ls_fono)
	dw_convenios.setitem(1,'notas',ls_notas)
	dw_convenios.setitem(1,'vigencia_descripcion',ls_vigen_desc)
	dw_convenios.setitem(1,'vigencia_codigo',ls_vigen_cod)
	dw_convenios.setitem(1,'contacto',ls_contacto)
	dw_convenios.setitem(1,'estado',ls_estado)
	dw_convenios.setitem(1,'rut_empresa',ll_rut_empresa)
	dw_convenios.setitem(1,'dv_empresa',ls_dv_empresa)
	dw_convenios.setitem(1,'rut_contacto',ll_rut_contacto)
	dw_convenios.setitem(1,'dv_contacto',ls_dv_contacto)
	dw_convenios.setitem(1,'email_contacto',ls_email_contacto)
	dw_convenios.setitem(1,'fecha_ctto',ld_fecha_ctto)
	dw_convenios.setitem(1,'cod_nivel',ll_nivel)		
end if

end event

event itemchanged;String		ls_columna

ls_columna	= dwo.name
if ls_columna='estado_reg' then
	il_modif ++
end if
end event

type cb_grabar from commandbutton within w_convenio_mantenedor
integer x = 37
integer y = 2312
integer width = 302
integer height = 104
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string ls_string,ls_glosa,ls_dv_emp,ls_contacto,ls_dv_contacto,ls_telefono,ls_email,ls_estado,ls_pasa = 'N',ls_graba,ls_descrip,ls_cod_sup,ls_cod_age
long	ll_cod_convenio,ll_cod_nivel,ll_rut_emp,ll_rut_contacto,ll_res,ll_cont,ll_tot_reg,ll_indi,ll_est_reg,ll_cod_beneficio,ll_beneficio_det,ll_cont_beneficios

dw_convenios.accepttext()
ll_cod_convenio		= dw_convenios.getitemnumber(1,'cod_convenio')
ls_glosa					= dw_convenios.getitemstring(1,'glosa')
ll_cod_nivel				= dw_convenios.getitemnumber(1,'cod_nivel')
ls_estado				= dw_convenios.getitemstring(1,'estado')
ll_rut_emp				= dw_convenios.getitemnumber(1,'rut_empresa')
ls_dv_emp				= dw_convenios.getitemstring(1,'dv_empresa')
ls_contacto				= dw_convenios.getitemstring(1,'contacto')
ll_rut_contacto			= dw_convenios.getitemnumber(1,'rut_contacto')
ls_dv_contacto			= dw_convenios.getitemstring(1,'dv_contacto')
ls_telefono				= dw_convenios.getitemstring(1,'fono')
ls_email					= dw_convenios.getitemstring(1,'email_contacto')
ls_cod_sup				= dw_convenios.getitemstring(1,'cod_sup')
ls_cod_age				= dw_convenios.getitemstring(1,'cod_agente')
			
if isnull(ll_cod_convenio) or ll_cod_convenio = 0 then
	messagebox('Aviso','Debe Ingresar Código Convenio')
	ls_pasa = 'N'
	return
else
	ls_pasa = 'S'
end if
if isnull(ls_cod_sup) then
	messagebox('Aviso','Debe Ingresar Supervisor Asignado')
	ls_pasa = 'N'
	dw_convenios.setfocus()
	dw_convenios.setcolumn('cod_sup')
	return
else
	ls_pasa = 'S'
end if
if isnull(ls_cod_age) then
	messagebox('Aviso','Debe Ingresar Agente')
	ls_pasa = 'N'
	dw_convenios.setfocus()
	dw_convenios.setcolumn('cod_agente')
	return
else
	ls_pasa = 'S'
end if
if isnull(ls_glosa) then
	messagebox('Aviso','Debe Ingresar Glosa Convenio')
	ls_pasa = 'N'
	dw_convenios.setfocus()
	dw_convenios.setcolumn('glosa')
	return
else
	ls_pasa = 'S'
end if
if isnull(ll_cod_nivel) or ll_cod_nivel = 0 then
	messagebox('Aviso','Debe Ingresar Nivel Convenio')
	ls_pasa = 'N'
	dw_convenios.setfocus()
	dw_convenios.setcolumn('cod_nivel')
	return
else
	ls_pasa = 'S'
end if
if ls_pasa = 'S' then
	ll_res					= messagebox("Grabar","Está seguro Grabar Convenio",Exclamation!,YesNo!,2)
	if ll_res=1 then
		if dw_convenios.update() = 1 then	
			commit;
			ll_tot_reg						= dw_lista.rowcount()
			SELECT	count(*)
			INTO		:ll_cont_beneficios
			FROM 	"CONVENIO_RETIRO_DET"  
			WHERE	( "CONVENIO_RETIRO_DET"."COD_CONVENIO" = :ll_cod_convenio ) AND  
						( "CONVENIO_RETIRO_DET"."COD_BENEFICIO" = :il_cod_beneficio )
			USING sqlca;
			if ll_cont_beneficios > 0 then
				DELETE FROM "CONVENIO_RETIRO_DET"  
				WHERE 	( "CONVENIO_RETIRO_DET"."COD_CONVENIO" = :ll_cod_convenio ) AND  
							( "CONVENIO_RETIRO_DET"."COD_BENEFICIO" = :il_cod_beneficio )
				USING	sqlca;
				if sqlca.sqlcode = 0 then
					commit;
				else
					rollback;
					messagebox("Error Eliminar","Error Eliminar CONVENIO_RETIRO_DET Sql: "+sqlca.sqlerrtext)
				end if
			end if
			for ll_indi = 1 to ll_tot_reg
				ll_est_reg					= dw_lista.getitemnumber(ll_indi,'estado_reg')
				if ll_est_reg = 0 then
					ll_cod_beneficio		= dw_lista.getitemnumber(ll_indi,'beneficios_complementario_codigo')
					ll_beneficio_det			= dw_lista.getitemnumber(ll_indi,'beneficios_complementario_det_codigo_beneficio')
					ls_descrip				= dw_lista.getitemstring(ll_indi,'beneficios_complementario_det_descripcion')
					INSERT INTO "CONVENIO_RETIRO_DET"  
								("COD_CONVENIO","COD_BENEFICIO","COD_BENEFICIO_DET", "COD_NIVEL","DESCRIPCION" )  
					VALUES ( :ll_cod_convenio,:il_cod_beneficio,:ll_beneficio_det,:ll_cod_nivel,:ls_descrip )  
					USING	sqlca;
					if sqlca.sqlcode = 0 then
						commit;
						ls_graba	= 'S'
					else
						rollback;
						ls_graba	= 'N'
					end if
				end if
			next
			INSERT INTO "CONVENIO_RETIRO_LOG_ASIGNACION"  
						( "COD_CONVENIO", "FECHA_ASIGNACION", "COD_SUP", "COD_AGENTE", "USUARIO" )  
			VALUES 	( :ll_cod_convenio,  :gdt_fec_sistema , :ls_cod_sup, :ls_cod_age, :gs_user )
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit;
			else
				rollback;
			end if	
			if ls_graba = 'S' then
				messagebox("Grabar","Grabación Exitosa")
				cb_limpiar.triggerevent(clicked!)
			elseif ls_graba = 'N' then
				messagebox('Error','Error al Grabar Beneficios SQL: '+sqlca.sqlerrtext)	
			end if
		else
			rollback;
			messagebox("Error Grabar","Error Grabar Convenio SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if	
end event

type cb_ingreso_beneficio from commandbutton within w_convenio_mantenedor
boolean visible = false
integer x = 1074
integer y = 2744
integer width = 366
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Ingresar Benef"
end type

event clicked;//string ls_string,ls_glosa,ls_dv_emp,ls_contacto,ls_dv_contacto,ls_telefono,ls_email,ls_estado,ls_pasa = 'N'
//long	ll_cod_convenio,ll_cod_nivel,ll_rut_emp,ll_rut_contacto,ll_res,ll_cont
//
//ll_cod_convenio		= dw_convenios.getitemnumber(1,'cod_convenio')
//ls_glosa					= dw_convenios.getitemstring(1,'glosa')
//ll_cod_nivel				= dw_convenios.getitemnumber(1,'cod_nivel')
//ls_estado				= dw_convenios.getitemstring(1,'estado')
//ll_rut_emp				= dw_convenios.getitemnumber(1,'rut_empresa')
//ls_dv_emp				= dw_convenios.getitemstring(1,'dv_empresa')
//ls_contacto				= dw_convenios.getitemstring(1,'contacto')
//ll_rut_contacto			= dw_convenios.getitemnumber(1,'rut_contacto')
//ls_dv_contacto			= dw_convenios.getitemstring(1,'dv_contacto')
//ls_telefono				= dw_convenios.getitemstring(1,'fono')
//ls_email					= dw_convenios.getitemstring(1,'email_contacto')
//
//if isnull(ll_cod_convenio) then
//	messagebox('Aviso','Falta Codigo Convenio')
//	ls_pasa = 'N'
//	dw_convenios.setfocus()
//	dw_convenios.setcolumn('cod_convenio')
//	return
//else	
//	if isnull(ls_glosa) then
//		messagebox('Aviso','Falta Glosa Convenio')
//		ls_pasa = 'N'
//		dw_convenios.setfocus()
//		dw_convenios.setcolumn('glosa')
//		return
//	else
//		ls_pasa = 'S'
//	end if
//	if isnull(ll_cod_nivel) or ll_cod_nivel = 0 then
//		messagebox('Aviso','Falta Nivel Convenio')
//		ls_pasa = 'N'
//		dw_convenios.setfocus()
//		dw_convenios.setcolumn('cod_nivel')
//		return
//	else
//		ls_pasa = 'S'
//	end if
//	SELECT 	count(*)
//	INTO 		:ll_cont  
//	FROM 	"CONVENIO_RETIRO"  
//	WHERE 	"CONVENIO_RETIRO"."COD_CONVENIO" = :ll_cod_convenio   
//	USING sqlca;
//	if ll_cont = 1 then
//		ls_pasa = 'S'
//	elseif ll_cont = 0 then
//		messagebox('Advertencia','Debe Grabar Convenio')
//		ls_pasa = 'N'
//		cb_grabar.setfocus()
//	end if	
//end if
//if ls_pasa = 'S' then
//	ls_string		= string(ll_cod_convenio)+'~t'+string(ll_cod_nivel)+'~t'+string(il_cod_beneficio)
//	if isvalid(w_convenio_beneficios) then close(w_convenio_beneficios)
//	openwithparm(w_convenio_beneficios,ls_string)		
//end if
//
////if isnull(ls_glosa) then
////	messagebox('Aviso','Falta Glosa Convenio')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if isnull(ll_cod_nivel) or ll_cod_nivel = 0 then
////	messagebox('Aviso','Falta Nivel Convenio')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if isnull(ls_estado) then
////	messagebox('Aviso','Falta Estado ')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if isnull(ll_rut_emp) or ll_rut_emp = 0 then
////	messagebox('Aviso','Falta Rut Empresa')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if isnull(ls_dv_emp) then
////	messagebox('Aviso','Falta Digito Verificador Empresa')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if String(trim(ls_dv_emp)) <> String(gf_obtener_dv(long(trim(string(ll_rut_emp))))) then
////	messagebox('Error','El Rut no es valido',stopsign!)
////	dw_convenios.object.rut_empresa.setfocus()
////	return
////end if
////if isnull(ls_contacto) then
////	messagebox('Aviso','Falta Contacto')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if isnull(ll_rut_contacto) or ll_rut_contacto = 0 then
////	messagebox('Aviso','Falta Rut Contacto')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if isnull(ls_dv_emp) then
////	messagebox('Aviso','Falta Digito Verificador Contacto')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if isnull(ls_telefono) then
////	messagebox('Aviso','Falta Telefono Contacto')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
////if isnull(ls_email) then
////	messagebox('Aviso','Falta E-mail Contacto')
////	ls_pasa = 'N'
////	return
////else
////	ls_pasa = 'S'
////end if
end event

type cb_cerrar from commandbutton within w_convenio_mantenedor
integer x = 2194
integer y = 2312
integer width = 302
integer height = 104
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;Long		ll_res

if il_modif > 0 then
	ll_res		= messagebox("Advertencia","Desea Actualizar los Cambios",Exclamation!,YesNo!,2)
	if ll_res = 1 then
		cb_grabar.triggerevent(clicked!)
	else
		close(w_convenio_mantenedor)
	end if
else
	close(w_convenio_mantenedor)
end if
end event

type gb_2 from groupbox within w_convenio_mantenedor
integer x = 32
integer y = 780
integer width = 2464
integer height = 1500
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de Beneficios"
end type

type gb_1 from groupbox within w_convenio_mantenedor
integer x = 379
integer y = 2272
integer width = 635
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_convenios from datawindow within w_convenio_mantenedor
integer x = 37
integer y = 28
integer width = 2469
integer height = 744
integer taborder = 10
string title = "none"
string dataobject = "dw_convenio_benef_nuevo"
boolean border = false
boolean livescroll = true
end type

event clicked;string ls_fecha,ls_columna,ls_superv,ls_nulo
date	ld_fecha_hoy,ld_fec_vigen

Setnull(ls_nulo)
ld_fecha_hoy 	= date(gdt_fec_sistema)
ls_columna		= dwo.name	
if ls_columna='p_1' then
	ls_fecha					= string(date(dw_convenios.getitemdatetime(1,'fecha_ctto')))	
	if isnull(ls_fecha) then ls_fecha = string(ld_fecha_hoy,"dd/mm/yyyy")
	if f_valida_fecha(ls_fecha)=-1 then 
		dw_convenios.setitem(1,'fecha_ctto',datetime(string(ld_fecha_hoy,gs_formato_fecha)))
		return
	end if
	OpenWithParm(w_calendar,ls_fecha)
	IF not isnull(Message.StringParm) THEN
		ls_fecha				= trim(Message.StringParm)
		dw_convenios.setitem(1,'fecha_ctto',date(ls_fecha))
	END IF
	
	dw_convenios.setfocus()
	dw_convenios.setcolumn('fecha_ctto')
//if ls_columna = 'cod_sup' then
//	dw_convenios.setitem(1,'cod_ejecutivo',ls_nulo)
//	dw_convenios.accepttext()
//	ls_superv								= dw_convenios.getitemstring(1,'cod_sup')
//	idw_detalle.retrieve(ls_superv)
//	dw_convenios.accepttext()
end if
//if ls_columna = 'cod_sup' then
//	dw_convenios.accepttext()
//	ls_superv	= dw_convenios.getitemstring(1,'cod_sup')
//	dw_convenios.getchild('cod_agente',idw_detalle)
//	idw_detalle.settransobject(sqlca)
//	idw_detalle.reset()
//	dw_convenios.setitem(1,'cod_agente',ls_nulo)
//	idw_detalle.settransobject(sqlca)
//	if idw_detalle.retrieve(ls_superv)=0 then
//		idw_detalle.insertrow(0)
//	end if
//	dw_convenios.accepttext()
//end if	
if ls_columna = 'cod_agente' then	
	dw_convenios.accepttext()
end if
end event

event itemchanged;string ls_columna
Long	ll_cod_convenio

dw_convenios.AcceptText()
ls_columna	= dwo.name
ll_cod_convenio			= dw_convenios.getitemnumber(1,'cod_convenio') 
if ll_cod_convenio > 0 then 	wf_itemchanged(ll_cod_convenio,ls_columna)
end event

event itemfocuschanged;Long		ll_rut_empresa,ll_rut_contacto
String		ls_dv_empresa,ls_dv_contacto

	ll_rut_empresa				= dw_convenios.getitemnumber(1,'rut_empresa')
	ls_dv_empresa				= dw_convenios.getitemstring(1,'dv_empresa')
	if not isnull(ll_rut_empresa) and not isnull(ls_dv_empresa) then
		if String(trim(ls_dv_empresa)) <> String(gf_obtener_dv(long(trim(string(ll_rut_empresa))))) then
			dw_convenios.Setitem(1,'dv_empresa','')
			dw_convenios.accepttext()
			dw_convenios.setfocus()
			dw_convenios.setcolumn('dv_empresa')
			return
		end if
	end if	
	ll_rut_contacto				= dw_convenios.getitemnumber(1,'rut_contacto')
	ls_dv_contacto				= dw_convenios.getitemstring(1,'dv_contacto')
	if not isnull(ll_rut_contacto) and not isnull(ls_dv_contacto) then
		if String(trim(ls_dv_contacto)) <> String(gf_obtener_dv(long(trim(string(ll_rut_contacto))))) then
			dw_convenios.Setitem(1,'dv_contacto','')
			dw_convenios.accepttext()
			dw_convenios.setfocus()
			dw_convenios.setcolumn('dv_contacto')
			return
		end if
	end if	
end event

