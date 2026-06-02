forward
global type w_ingreso_deudores_terceros from window
end type
type cb_grabar from commandbutton within w_ingreso_deudores_terceros
end type
type cb_cerrar from commandbutton within w_ingreso_deudores_terceros
end type
type dw_ingreso from datawindow within w_ingreso_deudores_terceros
end type
end forward

global type w_ingreso_deudores_terceros from window
integer width = 2514
integer height = 1916
boolean titlebar = true
string title = "Ingreso Deudores"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_ingreso dw_ingreso
end type
global w_ingreso_deudores_terceros w_ingreso_deudores_terceros

type variables
string	is_base,is_serie,is_opcion
Long		il_rut_titular,il_correlativo
Date		idt_fecha_hoy
Double	il_numero
end variables

on w_ingreso_deudores_terceros.create
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_grabar,&
this.cb_cerrar,&
this.dw_ingreso}
end on

on w_ingreso_deudores_terceros.destroy
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso)
end on

event open;long		ll_new
string	ls_nombre,ls_ap_pat,ls_ap_mat,ls_ciudad

idt_fecha_hoy					= date(gdt_fec_sistema)
gf_centrar(w_ingreso_deudores_terceros)
dw_ingreso.settransobject(sqlca)
dw_ingreso.getchild('comuna',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
is_base 							= substr(1,1,Message.StringParm)
is_serie							= substr(1,2,Message.StringParm)
il_numero						= Double(substr(1,3,Message.StringParm))
il_rut_titular					= Long(substr(1,4,Message.StringParm))
il_correlativo					= Long(substr(1,5,Message.StringParm))
is_opcion						= substr(1,6,Message.StringParm)
if dw_ingreso.retrieve(il_rut_titular,is_base,is_serie,il_numero,il_correlativo)=0 then
	ll_new	= dw_ingreso.insertrow(0)
	dw_ingreso.scrolltorow(ll_new)
	dw_ingreso.setitem(ll_new,'sexo','M')
	dw_ingreso.setitem(ll_new,'fecha_ingr',idt_fecha_hoy)
	dw_ingreso.setitem(ll_new,'esta_civil','C')
	dw_ingreso.setitem(ll_new,'total_rent',0)
	dw_ingreso.setitem(ll_new,'grupo_f',0)
	dw_ingreso.setitem(ll_new,'estado_cobranza','0')
	dw_ingreso.setitem(ll_new,'fecha_cobranza',datetime(idt_fecha_hoy,time("00:00:00")))
	dw_ingreso.setitem(ll_new,'base',is_base)
	dw_ingreso.setitem(ll_new,'serie',is_serie)
	dw_ingreso.setitem(ll_new,'numero',il_numero)
	dw_ingreso.setitem(ll_new,'correlativo',il_correlativo)
	dw_ingreso.setitem(ll_new,'rut_titular',il_rut_titular)
	dw_ingreso.setitem(ll_new,'estado_deudor','A')
	dw_ingreso.setitem(ll_new,'glosa_cobranza','-')
	dw_ingreso.setitem(ll_new,'usuario',gs_user)
end if
SELECT	"CLIENTE"."NOMBRE",   
			"CLIENTE"."A_PATERNO",   
			"CLIENTE"."A_MATERNO"  
INTO 		:ls_nombre,   
			:ls_ap_pat,   
			:ls_ap_mat  
FROM 		"CLIENTE"  
WHERE 	"CLIENTE"."RUT" = :il_rut_titular   
USING		sqlca;
if sqlca.sqlcode=0 then
	dw_ingreso.object.t_17.text	= ls_ap_pat+' '+ls_ap_mat+' '+ls_nombre
end if
if is_opcion<>"N" then 
	cb_grabar.enabled 	= false
	dw_ingreso.enabled 	= false
else
	cb_grabar.enabled 	= true
	dw_ingreso.enabled 	= true
end if
ls_ciudad	= dw_ingreso.getitemstring(1,'ciudad')
if not isnull(ls_ciudad) and ls_ciudad<>'' then
	idw_detalle.retrieve(ls_ciudad)
end if
end event

type cb_grabar from commandbutton within w_ingreso_deudores_terceros
integer x = 46
integer y = 1684
integer width = 306
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ll_rut
string	ls_dv,ls_nom,ls_a_pat,ls_a_mat,ls_dir,ls_tipo_via,ls_nro_part,&
			ls_sec,ls_pob,ls_com,ls_ciu,ls_fono_p,ls_dir_c,ls_fono_c

ll_rut		= dw_ingreso.getitemnumber(1,'rut')
ls_dv			= dw_ingreso.getitemstring(1,'dv')
ls_nom		= dw_ingreso.getitemstring(1,'nombre')
ls_a_pat		= dw_ingreso.getitemstring(1,'a_paterno')
ls_a_mat		= dw_ingreso.getitemstring(1,'a_materno')
ls_dir		= dw_ingreso.getitemstring(1,'direccion_p')
ls_nro_part	= dw_ingreso.getitemstring(1,'numero_particular')
ls_tipo_via	= dw_ingreso.getitemstring(1,'tipo_via')

ls_sec		= dw_ingreso.getitemstring(1,'sector')
ls_pob		= dw_ingreso.getitemstring(1,'poblacion')
ls_com		= dw_ingreso.getitemstring(1,'comuna')
ls_ciu		= dw_ingreso.getitemstring(1,'ciudad')
ls_fono_p	= dw_ingreso.getitemstring(1,'fono_p')
ls_dir_c		= dw_ingreso.getitemstring(1,'domicilio_c')
ls_fono_c	= dw_ingreso.getitemstring(1,'fono_c')

if isnull(ls_sec) or trim(ls_sec)='' then dw_ingreso.setitem(1,'sector','-')
if isnull(ls_pob) or trim(ls_pob)='' then dw_ingreso.setitem(1,'poblacion','-')
if isnull(ls_com) or trim(ls_com)='' then dw_ingreso.setitem(1,'comuna','-')
if isnull(ls_ciu) or trim(ls_ciu)='' then dw_ingreso.setitem(1,'ciudad','-')
if isnull(ls_fono_p) or trim(ls_fono_p)='' then dw_ingreso.setitem(1,'fono_p','-')
if isnull(ls_dir_c) or trim(ls_dir_c)='' then 	dw_ingreso.setitem(1,'domicilio_c','-')
if isnull(ls_fono_c) or trim(ls_fono_c)='' then dw_ingreso.setitem(1,'fono_c','-')

if not isnull(ll_rut) and not isnull(ls_dv) and not isnull(ls_nom) and &
	not isnull(ls_a_pat) and not isnull(ls_a_mat) and not isnull(ls_dir) and &
	not isnull(ls_tipo_via) and not isnull(ls_nro_part) then
	if dw_ingreso.update()=1 then
		commit;
		messagebox("Grabar","Grabación Exitosa")
		if isvalid(w_repacta_mora_mantencion) then w_repacta_mora_mantencion.cb_terceros.italic	= true
		if isvalid(w_repacta_mora_mantencion_reprog) then w_repacta_mora_mantencion_reprog.cb_terceros.italic	= true
		close(w_ingreso_deudores_terceros)
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar Deudor SQL: "+sqlca.sqlerrtext)
	end if
else
	messagebox("Advertencia","Falta ingresar datos del Deudor")
	dw_ingreso.setcolumn('rut')
end if
end event

type cb_cerrar from commandbutton within w_ingreso_deudores_terceros
integer x = 2139
integer y = 1684
integer width = 306
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_ingreso_deudores_terceros)
end event

type dw_ingreso from datawindow within w_ingreso_deudores_terceros
integer x = 46
integer y = 24
integer width = 2405
integer height = 1636
integer taborder = 10
string dataobject = "dw_ingreso_deudor_tercero"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_columna,ls_fecha
Long		ll_rut

ls_columna	= dwo.name
ll_rut	= this.getitemnumber(1,'rut')
if not isnull(ll_rut) and ll_rut>0 then
	CHOOSE CASE ls_columna
		CASE 'p_fec_nac'
			ls_fecha	= string(date(this.getitemdatetime(1,'fecha_nac')))
			if isnull(ls_fecha) then ls_fecha = string(idt_fecha_hoy,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				this.setitem(1,'fecha_nac',date(string(idt_fecha_hoy,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				this.setitem(1,'fecha_nac',date(ls_fecha))
			END IF
			
		CASE 'p_fec_ingre'
			ls_fecha	= string(date(this.getitemdatetime(1,'fecha_ingr')))
			if isnull(ls_fecha) then ls_fecha = string(idt_fecha_hoy,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				this.setitem(1,'fecha_ingr',date(string(idt_fecha_hoy,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				this.setitem(1,'fecha_ingr',date(ls_fecha))
			END IF
	END CHOOSE
end if
end event

event itemchanged;string	ls_columna,ls_nombre,ls_ap_pat,ls_ap_mat,ls_dir_p,ls_pobla,   &
			ls_sector,ls_comuna,ls_ciudad, ls_fono_p,ls_sexo,ls_est_civil,ls_dom_c,   &
			ls_fono_c,ls_dv,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
datetime	ldt_fec_nac,ldt_fec_ing
Long		ll_rut,ll_grupo_f,ll_total_renta
ls_columna	= dwo.name
this.accepttext()
CHOOSE CASE ls_columna
	CASE 'rut'
		ll_rut	= this.getitemnumber(1,'rut')
		SELECT	"CLIENTE"."FECHA_INGR",	"CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."SEXO",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."GRUPO_F",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."DV",	"CLIENTE"."TIPO_VIA",	"CLIENTE"."NUMERO_PARTICULAR",	"CLIENTE"."DEPTO_PARTICULAR",	"CLIENTE"."BLOCK_PARTICULAR"
		INTO 		:ldt_fec_ing,				:ls_nombre,   			:ls_ap_pat,   				 :ls_ap_mat,   			  :ls_dir_p,   				  :ls_pobla,   				:ls_sector,   			 :ls_comuna,   		  :ls_ciudad,   			:ls_fono_p,   			 :ls_sexo,   			:ldt_fec_nac,   			 :ls_est_civil,   			:ls_dom_c,   					:ls_fono_c,   			 :ll_grupo_f,   			:ll_total_renta,   		  :ls_dv  ,				:ls_tipo_via				:ls_nro_part,							:ls_depto_part,					:ls_block_part	
		FROM 		"CLIENTE"  
		WHERE 	"CLIENTE"."RUT" = :ll_rut   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			messagebox("Advertencia","Rut Existente")
			this.setitem(1,'nombre',ls_nombre)
			this.setitem(1,'a_paterno',ls_ap_pat)
			this.setitem(1,'a_materno',ls_ap_mat)
			this.setitem(1,'direccion_p',ls_dir_p)
			this.setitem(1,'tipo_via',ls_tipo_via)
			this.setitem(1,'numero_particular',ls_nro_part)
			this.setitem(1,'depto_particular',ls_depto_part)
			this.setitem(1,'block_particular',ls_block_part)
			this.setitem(1,'poblacion',ls_pobla)
			this.setitem(1,'sector',ls_sector)
			this.setitem(1,'comuna',ls_comuna)
			this.setitem(1,'ciudad',ls_ciudad)
			this.setitem(1,'fono_p',ls_fono_p)
			this.setitem(1,'sexo',ls_sexo)
			this.setitem(1,'fecha_nac',ldt_fec_nac)
			this.setitem(1,'esta_civil',ls_est_civil)
			this.setitem(1,'domicilio_c',ls_dom_c)
			this.setitem(1,'fono_c',ls_fono_c)
			this.setitem(1,'grupo_f',ll_grupo_f)
			this.setitem(1,'total_rent',ll_total_renta)
			this.setitem(1,'dv',ls_dv)
			this.setitem(1,'fecha_ingr',ldt_fec_ing)
		else
			setnull(ldt_fec_ing);setnull(ls_nombre);setnull(ls_ap_pat);setnull(ls_ap_mat);setnull(ls_dir_p)
			setnull(ls_pobla);setnull(ls_sector);setnull(ls_comuna);setnull(ls_ciudad);setnull(ls_fono_p)
			setnull(ls_sexo);setnull(ldt_fec_nac);setnull(ls_est_civil);setnull(ls_dom_c);setnull(ls_fono_c)
			setnull(ll_grupo_f);setnull(ll_total_renta);setnull(ls_dv)
//			this.setitem(1,'rut',0)
			this.setitem(1,'nombre',ls_nombre)
			this.setitem(1,'a_paterno',ls_ap_pat)
			this.setitem(1,'a_materno',ls_ap_mat)
			this.setitem(1,'direccion_p',ls_dir_p)
			this.setitem(1,'tipo_via',ls_tipo_via)
			this.setitem(1,'numero_particular',ls_nro_part)
			this.setitem(1,'depto_particular',ls_depto_part)
			this.setitem(1,'block_particular',ls_block_part)
			this.setitem(1,'poblacion',ls_pobla)
			this.setitem(1,'sector',ls_sector)
			this.setitem(1,'comuna',ls_comuna)
			this.setitem(1,'ciudad',ls_ciudad)
			this.setitem(1,'fono_p',ls_fono_p)
			this.setitem(1,'sexo',ls_sexo)
			this.setitem(1,'fecha_nac',ldt_fec_nac)
			this.setitem(1,'esta_civil',ls_est_civil)
			this.setitem(1,'domicilio_c',ls_dom_c)
			this.setitem(1,'fono_c',ls_fono_c)
			this.setitem(1,'grupo_f',ll_grupo_f)
			this.setitem(1,'total_rent',ll_total_renta)
			this.setitem(1,'dv',ls_dv)
			this.setitem(1,'fecha_ingr',ldt_fec_ing)
		end if
		this.accepttext()
		
	CASE 'ciudad'
		ls_ciudad	= this.getitemstring(1,'ciudad')
		if not isnull(ls_ciudad) and ls_ciudad<>'' then
			idw_detalle.retrieve(ls_ciudad)
		end if
END CHOOSE

end event

