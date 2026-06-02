forward
global type dw_ingreso_cliente_tercero_at from window
end type
type cb_cerrar from commandbutton within dw_ingreso_cliente_tercero_at
end type
type cb_grabar from commandbutton within dw_ingreso_cliente_tercero_at
end type
type dw_lista from datawindow within dw_ingreso_cliente_tercero_at
end type
end forward

global type dw_ingreso_cliente_tercero_at from window
integer width = 3625
integer height = 1412
boolean titlebar = true
string title = "Cliente Terceros"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_lista dw_lista
end type
global dw_ingreso_cliente_tercero_at dw_ingreso_cliente_tercero_at

type variables
long	il_sw,il_resp
string	is_fono_particular,is_celular
end variables

forward prototypes
public function string wf_validar_letras (string as_letras, string as_columna)
public function string wf_valida_largo (long al_largo, string as_columna)
end prototypes

public function string wf_validar_letras (string as_letras, string as_columna);string ls_pasa='S'

if il_sw > 0 then
	if Match(as_letras, "[A-Z]+") and as_columna='fono_particular' then
		messagebox('Advertencia','Solo debe Ingresar Números en Telefono Particular')
		dw_lista.setitem(1,'fono_particular',is_fono_particular)
		ls_pasa	= 'N'
		il_sw		= 0
	elseif Match(as_letras, "[A-Z]+") and as_columna='celular' then
		messagebox('Advertencia','Solo debe Ingresar Números en Celular')
		dw_lista.setitem(1,'celular',is_celular)
		ls_pasa	= 'N'
		il_sw		= 0
	end if
	dw_lista.accepttext()
end if
return ls_pasa
end function

public function string wf_valida_largo (long al_largo, string as_columna);string ls_pasa='S'

if il_sw > 0 then
	if al_largo > 9 and as_columna='fono_particular' then
		messagebox('Advertencia','No puede Ingresar más de 9 Digitos en Telefono Particular, Ingrese solo números')
		dw_lista.setitem(1,'fono_particular',is_fono_particular)
		dw_lista.setfocus()
		dw_lista.setcolumn('fono_particular')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='fono_particular' then
		messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Telefono Particular, Ingrese solo números')
		dw_lista.setitem(1,'fono_particular',is_fono_particular)
		dw_lista.setfocus()
		dw_lista.setcolumn('fono_particular')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif al_largo > 9 and as_columna='celular' then
		messagebox('Advertencia','No puede Ingresar más de 9 Digitos en Celular, Ingrese solo números')
		dw_lista.setitem(1,'celular',is_celular)
		dw_lista.setfocus()
		dw_lista.setcolumn('celular')
		ls_pasa	= 'N'
		il_sw		= 0
	elseif	al_largo < 9 and as_columna='celular' then
		messagebox('Advertencia','No puede Ingresar menos de 9 Digitos en Celular, Ingrese solo números')
		dw_lista.setitem(1,'celular',is_celular)
		dw_lista.setfocus()
		dw_lista.setcolumn('celular')
		ls_pasa	= 'N'
		il_sw		= 0
	end if	
	dw_lista.accepttext()
end if
return ls_pasa
end function

on dw_ingreso_cliente_tercero_at.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_lista=create dw_lista
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.dw_lista}
end on

on dw_ingreso_cliente_tercero_at.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_lista)
end on

event open;double	ll_numero
long		ll_fila,ll_rut_tit,ll_max,ll_max_aux
String		ls_ciudad,ls_nombre,ls_ap_pat,ls_ap_mat,ls_direc,ls_comuna,ls_parentesco,ls_tipo_via,ls_dir_part,&
			ls_numero_part,ls_fono,ls_dv,ls_depto,ls_block,ls_pobla,ls_sector,ls_celular,ls_email,ls_nom_new,&
			ls_ap_pat_new,ls_ap_mat_new,ls_dir_part_new,ls_comuna_part_new,ls_ciudad_part_new,ls_fono_part_new,ls_dv_new,ls_base,ls_serie,ls_dv_tit,&
			ls_rut_tercero,ls_dv_tercero,ls_nombre_ant,ls_ap_pat_ant,ls_ap_mat_ant,ls_tercero_anterior
			
				
gf_centrar(dw_ingreso_cliente_tercero_at)
ls_base 					= trim(substr(1,1,Message.StringParm))
ls_serie					= trim(substr(1,2,Message.StringParm))
ll_numero				= double(substr(1,3,Message.StringParm))
ll_rut_tit					= long(substr(1,4,Message.StringParm))
ls_dv_tit					= trim(substr(1,5,Message.StringParm))
dw_lista.SetTransObject(SQLCA)
dw_lista.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
dw_lista.SetTransObject(SQLCA)
dw_lista.getchild('c_cliente',idw_detalle2)
idw_detalle2.settransobject(sqlca)
if idw_detalle2.rowcount()=0 then
	idw_detalle2.insertrow(0)
end if
//dw_lista.getchild('comuna',idw_detalle2)
//idw_detalle2.settransobject(sqlca)
//if idw_detalle2.rowcount()=0 then
//	idw_detalle2.insertrow(0)
//end if
dw_lista.object.t_23.visible			= false
dw_lista.object.c_cliente.visible		= false
SELECT max("CLIENTE_TERCEROS"."CORRELATIVO_INGRESO") 
INTO 		:ll_max  
FROM 	"CLIENTE_TERCEROS"  
WHERE 	"CLIENTE_TERCEROS"."BASE" = :ls_base AND  
			"CLIENTE_TERCEROS"."SERIE" = :ls_serie AND  
			"CLIENTE_TERCEROS"."NUMERO" = :ll_numero
USING	sqlca;
if ll_max > 0  then 
	il_resp	= MessageBox("Advertencia", "¿Desea Ingresar nuevo Cliente tercero?",Exclamation!, YesNo!, 2)
	if il_resp = 1 then
		dw_lista.insertrow(0)
		dw_lista.setitem(1,'rut_titular',ll_rut_tit)
		dw_lista.setitem(1,'dv_titular',ls_dv_tit)
		dw_lista.setitem(1,'base',ls_base)
		dw_lista.setitem(1,'serie',ls_serie)
		dw_lista.setitem(1,'numero',ll_numero)
		dw_lista.setitem(1,'comuna',0)
		dw_lista.accepttext()
	else
		if ll_max = 1 then
			dw_lista.retrieve(ls_base,ls_serie,ll_numero,ll_max)
		elseif ll_max > 1 then
			dw_lista.object.t_23.visible			= true
			dw_lista.object.c_cliente.visible		= true
			dw_lista.retrieve(ls_base,ls_serie,ll_numero,ll_max)
			dw_lista.getchild('c_cliente',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			idw_detalle2.retrieve(ls_base,ls_serie,ll_numero)
		end if		
	end if	
else	
	dw_lista.insertrow(0)
	dw_lista.setitem(1,'correlativo_ingreso',1)
	dw_lista.setitem(1,'rut_titular',ll_rut_tit)
	dw_lista.setitem(1,'rut_titular',ll_rut_tit)
	dw_lista.setitem(1,'dv_titular',ls_dv_tit)
	dw_lista.setitem(1,'base',ls_base)
	dw_lista.setitem(1,'serie',ls_serie)
	dw_lista.setitem(1,'numero',ll_numero)
	dw_lista.setitem(1,'comuna',0)
	dw_lista.accepttext()
end if

//			SELECT 	"CLIENTE_TERCEROS"."RUT_TERCERO","CLIENTE_TERCEROS"."DV_RUT","CLIENTE_TERCEROS"."NOMBRES_TERCERO", "CLIENTE_TERCEROS"."APELLIDO_P_TERCERO", "CLIENTE_TERCEROS"."APELLIDO_M_TERCERO","CLIENTE_TERCEROS"."PARENTESCO", "CLIENTE_TERCEROS"."TIPO_VIA","CLIENTE_TERCEROS"."DIRECCION", "CLIENTE_TERCEROS"."NUMERO_PARTICULAR", "CLIENTE_TERCEROS"."DEPTO_TERCERO","CLIENTE_TERCEROS"."BLOCK_PARTICULAR","CLIENTE_TERCEROS"."POBLACION","CLIENTE_TERCEROS"."SECTOR","CLIENTE_TERCEROS"."COMUNA","CLIENTE_TERCEROS"."CIUDAD","CLIENTE_TERCEROS"."FONO_PARTICULAR", "CLIENTE_TERCEROS"."CELULAR","CLIENTE_TERCEROS"."EMAIL"
//			INTO 		:ls_rut_tercero,												:ls_dv_tercero,							:ls_nombre,														:ls_ap_pat,														:ls_ap_mat,										:ls_parentesco,								:ls_tipo_via,											:ls_dir_part,										:ls_numero_part,									:ls_depto,										:ls_block,										:ls_pobla,									:ls_sector,									:ls_comuna,									:ls_ciudad,						:ls_fono,											:ls_celular,							:ls_email
//			FROM 	"CLIENTE_TERCEROS"  
//			WHERE 	"CLIENTE_TERCEROS"."BASE" = :ls_base AND  
//						"CLIENTE_TERCEROS"."SERIE" = :ls_serie AND  
//						"CLIENTE_TERCEROS"."NUMERO" = :ll_numero AND
//						"CLIENTE_TERCEROS"."CORRELATIVO_INGRESO" = :ll_max
//			USING	sqlca;	
//			dw_lista.insertrow(0)
//			dw_lista.setitem(1,'rut_titular',ll_rut_tit)
//			dw_lista.setitem(1,'dv_titular',ls_dv_tit)
//			dw_lista.setitem(1,'base',ls_base)
//			dw_lista.setitem(1,'serie',ls_serie)
//			dw_lista.setitem(1,'numero',ll_numero)
//			dw_lista.setitem(1,'rut_tercero',long(ls_rut_tercero))
//			dw_lista.setitem(1,'dv_rut',ls_dv_tercero)
//			dw_lista.setitem(1,'nombres_tercero',ls_nombre)
//			dw_lista.setitem(1,'apellido_p_tercero',ls_ap_pat)
//			dw_lista.setitem(1,'apellido_m_tercero',ls_ap_mat)
//			dw_lista.setitem(1,'parentesco',long(ls_parentesco))
//			dw_lista.setitem(1,'tipo_via',ls_tipo_via)
//			dw_lista.setitem(1,'direccion',ls_dir_part)
//			dw_lista.setitem(1,'numero_particular',ls_numero_part)
//			dw_lista.setitem(1,'depto_tercero',ls_depto)
//			dw_lista.setitem(1,'block_particular',ls_block)
//			dw_lista.setitem(1,'poblacion',ls_pobla)
//			dw_lista.setitem(1,'sector',ls_sector)
//			dw_lista.setitem(1,'ciudad',ls_ciudad)
//			dw_lista.setitem(1,'fono_particular',ls_fono)
//			dw_lista.setitem(1,'celular',ls_celular)
//			dw_lista.setitem(1,'email',ls_email)
//			dw_lista.setitem(1,'comuna',ls_comuna)
//			dw_lista.accepttext()

	//		SELECT 	"CLIENTE_TERCEROS"."RUT_TERCERO","CLIENTE_TERCEROS"."DV_RUT","CLIENTE_TERCEROS"."NOMBRES_TERCERO", "CLIENTE_TERCEROS"."APELLIDO_P_TERCERO", "CLIENTE_TERCEROS"."APELLIDO_M_TERCERO","CLIENTE_TERCEROS"."PARENTESCO", "CLIENTE_TERCEROS"."TIPO_VIA","CLIENTE_TERCEROS"."DIRECCION", "CLIENTE_TERCEROS"."NUMERO_PARTICULAR", "CLIENTE_TERCEROS"."DEPTO_TERCERO","CLIENTE_TERCEROS"."BLOCK_PARTICULAR","CLIENTE_TERCEROS"."POBLACION","CLIENTE_TERCEROS"."SECTOR","CLIENTE_TERCEROS"."COMUNA","CLIENTE_TERCEROS"."CIUDAD","CLIENTE_TERCEROS"."FONO_PARTICULAR", "CLIENTE_TERCEROS"."CELULAR","CLIENTE_TERCEROS"."EMAIL"
	//		INTO 		:ls_rut_tercero,												:ls_dv_tercero,							:ls_nombre,														:ls_ap_pat,														:ls_ap_mat,										:ls_parentesco,								:ls_tipo_via,											:ls_dir_part,										:ls_numero_part,									:ls_depto,										:ls_block,										:ls_pobla,									:ls_sector,									:ls_comuna,									:ls_ciudad,						:ls_fono,											:ls_celular,							:ls_email
	//		FROM 	"CLIENTE_TERCEROS"  
	//		WHERE 	"CLIENTE_TERCEROS"."BASE" = :ls_base AND  
	//					"CLIENTE_TERCEROS"."SERIE" = :ls_serie AND  
	//					"CLIENTE_TERCEROS"."NUMERO" = :ll_numero AND
	//					"CLIENTE_TERCEROS"."CORRELATIVO_INGRESO" = :ll_max
	//		USING	sqlca;	
	//		dw_lista.insertrow(0)
	//		dw_lista.setitem(1,'rut_titular',ll_rut_tit)
	//		dw_lista.setitem(1,'dv_titular',ls_dv_tit)
	//		dw_lista.setitem(1,'base',ls_base)
	//		dw_lista.setitem(1,'serie',ls_serie)
	//		dw_lista.setitem(1,'numero',ll_numero)
	//		dw_lista.setitem(1,'rut_tercero',long(ls_rut_tercero))
	//		dw_lista.setitem(1,'dv_rut',ls_dv_tercero)
	//		dw_lista.setitem(1,'nombres_tercero',ls_nombre)
	//		dw_lista.setitem(1,'apellido_p_tercero',ls_ap_pat)
	//		dw_lista.setitem(1,'apellido_m_tercero',ls_ap_mat)
	//		dw_lista.setitem(1,'parentesco',long(ls_parentesco))
	//		dw_lista.setitem(1,'tipo_via',ls_tipo_via)
	//		dw_lista.setitem(1,'direccion',ls_dir_part)
	//		dw_lista.setitem(1,'numero_particular',ls_numero_part)
	//		dw_lista.setitem(1,'depto_tercero',ls_depto)
	//		dw_lista.setitem(1,'block_particular',ls_block)
	//		dw_lista.setitem(1,'poblacion',ls_pobla)
	//		dw_lista.setitem(1,'sector',ls_sector)
	//		dw_lista.setitem(1,'ciudad',ls_ciudad)
	//		dw_lista.setitem(1,'fono_particular',ls_fono)
	//		dw_lista.setitem(1,'celular',ls_celular)
	//		dw_lista.setitem(1,'email',ls_email)
	//		dw_lista.setitem(1,'comuna',ls_comuna)
	//		
	//		ll_max_aux		= ll_max -1
	//		
	//		dw_lista.object.t_23.visible			= true
	//		dw_lista.object.c_cliente.visible		= true
	//		
	//		SELECT 	"CLIENTE_TERCEROS"."NOMBRES_TERCERO", "CLIENTE_TERCEROS"."APELLIDO_P_TERCERO", "CLIENTE_TERCEROS"."APELLIDO_M_TERCERO"
	//		INTO 		:ls_nombre_ant,:ls_ap_pat_ant,:ls_ap_mat_ant
	//		FROM 	"CLIENTE_TERCEROS"  
	//		WHERE 	"CLIENTE_TERCEROS"."BASE" = :ls_base AND  
	//					"CLIENTE_TERCEROS"."SERIE" = :ls_serie AND  
	//					"CLIENTE_TERCEROS"."NUMERO" = :ll_numero AND
	//					"CLIENTE_TERCEROS"."CORRELATIVO_INGRESO" = :ll_max_aux
	//		USING	sqlca;	
	//		
	//		ls_tercero_anterior	= ls_nombre_ant + ' '+ ls_ap_pat_ant + ' ' +ls_ap_mat_ant
	//		
	//		dw_lista.setitem(1,'c_cliente',ls_tercero_anterior)
	//		dw_lista.accepttext()		


end event

type cb_cerrar from commandbutton within dw_ingreso_cliente_tercero_at
integer x = 3218
integer y = 1192
integer width = 357
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

event clicked;close(dw_ingreso_cliente_tercero_at)
end event

type cb_grabar from commandbutton within dw_ingreso_cliente_tercero_at
integer x = 23
integer y = 1192
integer width = 357
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_dv_ter,ls_nombres,ls_ap_pat,ls_ap_mat,ls_tipo_via,ls_direc,ls_numero_part,ls_block,ls_sector,&
			ls_poblacion,ls_comuna,ls_ciudad,ls_fono,ls_celular,ls_email,ls_pasa	= 'S',ls_dv_tit,ll_parentesco
double	ll_numero,ls_rut_ter,ll_rut_tit
long		ll_corr
datetime	ldt_fecha_hoy

dw_lista.accepttext()
ldt_fecha_hoy		= gdt_fec_sistema
ls_base				= dw_lista.getitemstring(1,'base')
ls_serie				= dw_lista.getitemstring(1,'serie')
ll_numero			= dw_lista.getitemnumber(1,'numero')
ll_rut_tit				= dw_lista.getitemnumber(1,'rut_titular')
ls_dv_tit				= dw_lista.getitemstring(1,'dv_titular')
ls_rut_ter 			= dw_lista.getitemnumber(1,'rut_tercero')
ls_dv_ter				= dw_lista.getitemstring(1,'dv_rut')
ls_nombres			= dw_lista.getitemstring(1,'nombres_tercero')
ls_ap_pat			= dw_lista.getitemstring(1,'apellido_p_tercero')
ls_ap_mat			= dw_lista.getitemstring(1,'apellido_m_tercero')
ls_tipo_via			= dw_lista.getitemstring(1,'tipo_via')
ls_direc				= dw_lista.getitemstring(1,'direccion')
ls_numero_part	= dw_lista.getitemstring(1,'numero_particular')
ls_block				= dw_lista.getitemstring(1,'block_particular')
ls_sector				= dw_lista.getitemstring(1,'sector')
ls_poblacion			= dw_lista.getitemstring(1,'poblacion')
ls_ciudad				= dw_lista.getitemstring(1,'ciudad')
ls_comuna			= dw_lista.getitemstring(1,'ciudad')
ls_fono				= dw_lista.getitemstring(1,'fono_particular')
ls_celular			= dw_lista.getitemstring(1,'celular')
ls_email				= dw_lista.getitemstring(1,'email')
//ll_parentesco		= dw_lista.getitemnumber(1,'parentesco')
ll_parentesco		= dw_lista.getitemstring(1,'parentesco')
dw_lista.accepttext()
if ls_rut_ter = 0 or isnull(ls_rut_ter) then
	messagebox("Advertencia","Falta ingresar Rut ")
	dw_lista.setfocus()
	dw_lista.setcolumn('rut_tercero')
	ls_pasa	= 'N'
end if	
if isnull(ls_dv_ter) or len(trim(ls_dv_ter))=0 then
	messagebox("Advertencia","Falta ingresar Dígito Verificador del Cliente")
	dw_lista.setfocus()
	dw_lista.setcolumn('dv_rut')
	ls_pasa = 'N'
end if
if isnull(ls_nombres) or len(trim(ls_nombres))=0 then
	messagebox("Advertencia","Falta ingresar Nombres")
	dw_lista.setfocus()
	dw_lista.setcolumn('nombres_tercero')
	ls_pasa = 'N'
end if
if isnull(ll_parentesco)  then
	messagebox("Advertencia","Falta ingresar Parentesco ")
	dw_lista.setfocus()
	dw_lista.setcolumn('parentesco')
	ls_pasa	= 'N'
end if	
if isnull(ls_email)  then
	messagebox("Advertencia","Falta ingresar e-mail ")
	dw_lista.setfocus()
	dw_lista.setcolumn('email')
	ls_pasa	= 'N'
end if	
//if isnull(ls_fono) then
//	messagebox("Advertencia","Falta ingresar Fono Particular ")
//	dw_lista.setfocus()
//	dw_lista.setcolumn('fono_particular')
//	ls_pasa	= 'N'
//end if	
if il_resp = 1 then
	SELECT max("CLIENTE_TERCEROS"."CORRELATIVO_INGRESO") 
	INTO 		:ll_corr  
	FROM 	"CLIENTE_TERCEROS"  
	WHERE 	"CLIENTE_TERCEROS"."BASE" = :ls_base AND  
				"CLIENTE_TERCEROS"."SERIE" = :ls_serie AND  
				"CLIENTE_TERCEROS"."NUMERO" = :ll_numero
	USING	sqlca;
	if ll_corr = 0 or isnull(ll_corr) then 
		ll_corr 	= 1
	else	
		ll_corr	= ll_corr+1
	end if
else	
	ll_corr		= dw_lista.getitemnumber(1,'correlativo_ingreso')
end if
dw_lista.setitem(1,'correlativo_ingreso',ll_corr)
if isnull(dw_lista.getitemstring(1,'apellido_m_tercero')) or dw_lista.getitemstring(1,'apellido_m_tercero')=''	then dw_lista.setitem(1,'apellido_m_tercero','-')
if isnull(dw_lista.getitemstring(1,'tipo_via')) or dw_lista.getitemstring(1,'tipo_via')=''	then dw_lista.setitem(1,'tipo_via','-')
if isnull(dw_lista.getitemstring(1,'direccion')) or dw_lista.getitemstring(1,'direccion')=''	then dw_lista.setitem(1,'direccion','-')
if isnull(dw_lista.getitemstring(1,'numero_particular')) or dw_lista.getitemstring(1,'numero_particular')=''	then dw_lista.setitem(1,'numero_particular','-')
if isnull(dw_lista.getitemstring(1,'block_particular')) or dw_lista.getitemstring(1,'block_particular')=''	then dw_lista.setitem(1,'block_particular','-')
if isnull(dw_lista.getitemstring(1,'sector')) or dw_lista.getitemstring(1,'sector')=''	then dw_lista.setitem(1,'sector','-')
if isnull(dw_lista.getitemstring(1,'poblacion')) or dw_lista.getitemstring(1,'poblacion')=''	then dw_lista.setitem(1,'poblacion','-')
if isnull(dw_lista.getitemstring(1,'email')) or dw_lista.getitemstring(1,'email')='' then dw_lista.setitem(1,'email','-')
if isnull(dw_lista.getitemstring(1,'celular')) or dw_lista.getitemstring(1,'celular')=''	then dw_lista.setitem(1,'celular','-')
if isnull(dw_lista.getitemstring(1,'fono_particular')) or dw_lista.getitemstring(1,'fono_particular')=''	then dw_lista.setitem(1,'fono_particular','-')
dw_lista.accepttext()
if ls_pasa= 'S' then
	if il_resp = 1 then
		INSERT INTO "CLIENTE_TERCEROS"  
					( "BASE", "SERIE", "NUMERO","CORRELATIVO_INGRESO",  "RUT_TITULAR", "DV_TITULAR", "RUT_TERCERO", "DV_RUT", "NOMBRES_TERCERO", "APELLIDO_P_TERCERO","APELLIDO_M_TERCERO", "TIPO_VIA", "DIRECCION", "NUMERO_PARTICULAR", "BLOCK_PARTICULAR", "POBLACION","SECTOR","COMUNA", "CIUDAD", "FONO_PARTICULAR", "CELULAR","OBSERVACION","FECHA_SISTEMA","PARENTESCO", "EMAIL" )  
		VALUES 	( :ls_base, :ls_serie, :ll_numero,		 :ll_corr,					:ll_rut_tit, 			:ls_dv_tit,  		:ls_rut_ter,  	:ls_dv_ter,  		:ls_nombres,   				:ls_ap_pat,  				:ls_ap_mat, 		:ls_tipo_via,  		:ls_direc,   	:ls_numero_part,   		:ls_block,  			:ls_poblacion,   	:ls_sector, :ls_comuna,  :ls_ciudad,  :ls_fono,  			:ls_celular,   		null,   		:ldt_fecha_hoy,   				:ll_parentesco,  :ls_email );
		if sqlca.sqlcode = 0 then
			commit;
			messagebox("Advertencia","Grabacion Exitosa")
			close(dw_ingreso_cliente_tercero_at)
		else
			rollback;
			messagebox("Advertencia","Error al Grabar Datos")
		end if	
	else
		if dw_lista.Update() = 1 then
			commit;
			messagebox("Grabar","Grabación Exitosa")
			close(dw_ingreso_cliente_tercero_at)
		else
			rollback;
			messagebox("Error Grabar","Error en Actualizar Datos: "+sqlca.sqlerrtext)
		end if
	end if
end if	

end event

type dw_lista from datawindow within dw_ingreso_cliente_tercero_at
event e_valida_tecla pbm_dwnkey
integer x = 32
integer y = 36
integer width = 3543
integer height = 1120
integer taborder = 10
string dataobject = "dw_cliente_tercero"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event e_valida_tecla;string ls_columna,ls_numero,ls_fono_p,ls_pasa_letras

dw_lista.accepttext()
CHOOSE CASE key
CASE Key0! 
CASE key1!
CASE key2!
CASE key3!
CASE key4!
CASE key5!
CASE key6!
CASE key7!
CASE key8!
CASE key9!	
CASE keynumpad0!
CASE keynumpad1!
CASE keynumpad2!
CASE keynumpad3!
CASE keynumpad4!
CASE keynumpad5!
CASE keynumpad6!
CASE keynumpad7!
CASE keynumpad8!
CASE keynumpad9!
CASE keyback!
CASE keytab!
CASE keyenter!
CASE keyrightarrow!
CASE keyleftarrow!
CASE keyuparrow!
CASE keydownarrow!
CASE keydelete!
CASE ELSE
	ls_columna 							= dw_lista.GetColumnName()
	CHOOSE CASE ls_columna
		CASE 'fono_particular'	
//			this.accepttext()
			ls_fono_p					= dw_lista.getitemstring(1,'fono_particular')
			ls_pasa_letras 				= wf_validar_letras(ls_fono_p,ls_columna)
			if ls_pasa_letras='N' then
				messagebox('Advertencia',' Solo Puede Ingresar Números')
				dw_lista.setitem(1,"fono_particular",is_fono_particular)
				dw_lista.setfocus()
				dw_lista.setcolumn('fono_particular')
			end if
		CASE 'celular'
//			this.accepttext()
			ls_fono_p					= dw_lista.getitemstring(1,'celular')
			ls_pasa_letras 				= wf_validar_letras(ls_fono_p,ls_columna)
			if ls_pasa_letras='N' then
				messagebox('Advertencia',' Solo Puede Ingresar Números')
				dw_lista.setitem(1,"celular",is_celular)
				dw_lista.setfocus()
				dw_lista.setcolumn('celular')
			end if
	END CHOOSE
END CHOOSE
dw_lista.accepttext()

end event

event itemchanged;string	ls_ciudad,ls_columna,ls_fecha,ls_dv,ls_nulo,ls_base,ls_serie
long	ll_rut,ll_fila,ll_corr,ll_numero

dw_lista.accepttext()
ll_rut		= this.getitemnumber(1,'rut_tercero')
ll_fila		= row
if ll_rut >= 1 then
	ls_columna	= dwo.name
	CHOOSE CASE ls_columna
			CASE 'dv_rut'
		//	SetNull(ld_null);SetNull(ls_null);SetNull(ll_null)
			SetNull(ls_nulo)
			ls_dv				= dw_lista.getitemstring(ll_fila,'dv_rut')
			dw_lista.accepttext()
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es valido',stopsign!)
				cb_grabar.enabled					= false
				dw_lista.SetItem(ll_fila, "dv_rut",ls_nulo)
				dw_lista.accepttext()
				dw_lista.setcolumn('dv_rut')
				dw_lista.setfocus()
			else
				cb_grabar.enabled					= true
				dw_lista.SetItem(1, "dv_rut",1)
			end if
		CASE 'ciudad'
			dw_lista.accepttext()
			ls_ciudad	= dw_lista.getitemstring(1,'ciudad')
			dw_lista.SetItem(1, "comuna",ls_nulo)
			if not isnull(ls_ciudad) and ls_ciudad<>'' then
				dw_lista.getchild('comuna',idw_detalle)
				idw_detalle.settransobject(sqlca)
				idw_detalle.retrieve(ls_ciudad)
			end if
			if ls_ciudad='999' then
				dw_lista.setitem(1,'comuna','999')
			end if
			if ls_ciudad='0' then
				dw_lista.setitem(1,'comuna','0')
			end if	
		CASE 'fono_particular'
			dw_lista.accepttext()
			il_sw ++
		CASE 'celular'
			dw_lista.accepttext()
			il_sw ++
		CASE 'c_cliente'
			dw_lista.accepttext()	
			ls_base		= this.getitemstring(ll_fila,'base')
			ls_serie		= this.getitemstring(ll_fila,'serie')
			ll_numero	= this.getitemnumber(ll_fila,'numero')
			ll_corr		= long(this.getitemstring(ll_fila,'c_cliente'))		
			dw_lista.retrieve(ls_base,ls_serie,ll_numero,ll_corr)			
	END CHOOSE
end if
end event

event itemfocuschanged;//string	ls_ciudad,ls_columna,ls_fecha,ls_dv
//long	ll_rut,ll_fila
//
//dw_lista.accepttext()
//ll_rut		= this.getitemnumber(1,'rut_tercero')
//ll_fila						= row
//if ll_rut >= 1 then
//	ls_columna	= dwo.name
//	CHOOSE CASE ls_columna
//		CASE 'dv_rut'
//		//	SetNull(ld_null);SetNull(ls_null);SetNull(ll_null)
//			ls_dv				= dw_lista.getitemstring(ll_fila,'dv_rut')
//			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
//		//		messagebox('Error','El Rut no es valido',stopsign!)
//		//		cb_grabar.enabled					= false
//				dw_lista.SetItem(ll_fila, "dv_rut",0)
//				dw_lista.accepttext()
//				dw_lista.setcolumn('dv_rut')
//				dw_lista.setfocus()
//			else
//				cb_grabar.enabled					= true
//				dw_lista.SetItem(ll_fila, "dv_rut",1)
//			//	dw_lista.setcolumn('nombre_c')
//			end if			
////		CASE 'comuna'
////			ls_ciudad	= dw_lista.getitemstring(1,'ciudad')
////			if not isnull(ls_ciudad) and ls_ciudad<>'' then
////				idw_detalle.retrieve(ls_ciudad)
////			end if
////			if ls_ciudad='999' then
////				dw_lista.setitem(1,'comuna','999')
////			end if
////			if ls_ciudad='0' then
////				dw_lista.setitem(1,'comuna','0')
////			end if
//		CASE 'comuna'
//			dw_lista.accepttext()
//			ls_ciudad	= dw_lista.getitemstring(1,'ciudad')
//			if not isnull(ls_ciudad) and ls_ciudad<>'' then
//				dw_lista.getchild('comuna',idw_detalle)
//				idw_detalle.settransobject(sqlca)
//				idw_detalle.retrieve(ls_ciudad)
//			end if
//			if ls_ciudad='999' then
//				dw_lista.setitem(1,'comuna','999')
//			end if
//			if ls_ciudad='0' then
//				dw_lista.setitem(1,'comuna','0')
//			end if	
//	END CHOOSE
//end if
end event

event losefocus;string ls_obs_mensaje,ls_fono_p,ls_celu,ls_pasa_p,ls_pasa_letras
long	ll_resp,ll_mod_mensaje,ll_fono_p_largo
date	ld_fecha_hoy

this.accepttext()
if il_sw > 0 then
	ls_fono_p					= dw_lista.getitemstring(1,'fono_particular')
	ls_celu						= dw_lista.getitemstring(1,'celular')
	if ls_fono_p <> '' and ls_fono_p <> '-' then
		ll_fono_p_largo			= len(ls_fono_p)
		ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'fono_particular')
		if ls_pasa_p='N' then
			dw_lista.setitem(1,'fono_particular',is_fono_particular)
			dw_lista.setfocus()
			dw_lista.setcolumn('fono_particular')
		else
			ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'fono_particular')
		end if
	end if
	if ls_celu <> '' and ls_celu <> '-' then
		ll_fono_p_largo			= len(ls_celu)
		ls_pasa_p 				= wf_valida_largo(ll_fono_p_largo,'celular')	
		if ls_pasa_p='N' then
			dw_lista.setitem(1,'celular',is_celular)
			dw_lista.setfocus()
			dw_lista.setcolumn('celular')
		else
			ls_pasa_letras 		= wf_validar_letras(ls_fono_p,'celular')
		end if
	end if
end if
end event

