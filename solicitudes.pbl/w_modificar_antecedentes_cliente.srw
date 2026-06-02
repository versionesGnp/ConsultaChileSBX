forward
global type w_modificar_antecedentes_cliente from window
end type
type cb_limpiar from commandbutton within w_modificar_antecedentes_cliente
end type
type cb_copiar from commandbutton within w_modificar_antecedentes_cliente
end type
type cb_imprimir from commandbutton within w_modificar_antecedentes_cliente
end type
type cb_grabar from commandbutton within w_modificar_antecedentes_cliente
end type
type cb_cerrar from commandbutton within w_modificar_antecedentes_cliente
end type
type dw_datos from datawindow within w_modificar_antecedentes_cliente
end type
end forward

global type w_modificar_antecedentes_cliente from window
integer width = 3200
integer height = 2012
boolean titlebar = true
string title = "Modificación Antecedentes del Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_limpiar cb_limpiar
cb_copiar cb_copiar
cb_imprimir cb_imprimir
cb_grabar cb_grabar
cb_cerrar cb_cerrar
dw_datos dw_datos
end type
global w_modificar_antecedentes_cliente w_modificar_antecedentes_cliente

type variables
long	il_sw_grabar=0
Date	idt_fecha_hoy
end variables

on w_modificar_antecedentes_cliente.create
this.cb_limpiar=create cb_limpiar
this.cb_copiar=create cb_copiar
this.cb_imprimir=create cb_imprimir
this.cb_grabar=create cb_grabar
this.cb_cerrar=create cb_cerrar
this.dw_datos=create dw_datos
this.Control[]={this.cb_limpiar,&
this.cb_copiar,&
this.cb_imprimir,&
this.cb_grabar,&
this.cb_cerrar,&
this.dw_datos}
end on

on w_modificar_antecedentes_cliente.destroy
destroy(this.cb_limpiar)
destroy(this.cb_copiar)
destroy(this.cb_imprimir)
destroy(this.cb_grabar)
destroy(this.cb_cerrar)
destroy(this.dw_datos)
end on

event open;long			ll_new
String		ls_nombre,ls_a_pat,ls_a_mat,ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,&
				ls_est_civil,ls_domi_c,ls_fono_c,ls_dv,ls_est_cob  
Datetime		ldt_fec_nac
Long			ll_tot_renta, ll_grupo_f

idt_fecha_hoy	= date(gdt_fec_sistema)
gf_centrar(w_modificar_antecedentes_cliente)
dw_datos.settransobject(sqlca)
dw_datos.getchild('comuna_original',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.rowcount()=0 then
	idw_detalle.insertrow(0)
end if
gs_ventana	= 'w_modificar_antecedentes_cliente'
f_valida_objeto()
if dw_datos.retrieve(gi_rut)=0 then
	ll_new	= dw_datos.insertrow(0)
	dw_datos.scrolltorow(ll_new) 
	
	SELECT	"CLIENTE"."NOMBRE",   "CLIENTE"."A_PATERNO",   "CLIENTE"."A_MATERNO",   "CLIENTE"."DIRECCION_P",   "CLIENTE"."POBLACION",   "CLIENTE"."SECTOR",   "CLIENTE"."COMUNA",   "CLIENTE"."CIUDAD",   "CLIENTE"."FONO_P",   "CLIENTE"."FECHA_NAC",   "CLIENTE"."ESTA_CIVIL",   "CLIENTE"."DOMICILIO_C",   "CLIENTE"."FONO_C",   "CLIENTE"."TOTAL_RENT",   "CLIENTE"."GRUPO_F",   "CLIENTE"."DV",   "CLIENTE"."ESTADO_COBRANZA"  
   INTO 		:ls_nombre,   			 :ls_a_pat,   				  :ls_a_mat,   				:ls_dir_p,   					:ls_pob,   					 :ls_sector,   		  :ls_comuna,   			:ls_ciudad,   			 :ls_fono_p,   		  :ldt_fec_nac,   			:ls_est_civil,   			  :ls_domi_c,   				  :ls_fono_c,   			:ll_tot_renta,   			  :ll_grupo_f,   			 :ls_dv,   			 :ls_est_cob  
   FROM 		"CLIENTE"  
   WHERE 	"CLIENTE"."RUT" = :gi_rut   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		if len(trim(ls_a_pat))>15 then
			ls_a_pat	= mid(trim(ls_a_pat),1,15)
		end if
		if len(trim(ls_a_mat))>15 then
			ls_a_mat	= mid(trim(ls_a_mat),1,15)
		end if
		if len(trim(ls_nombre))>20 then
			ls_nombre	= mid(trim(ls_nombre),1,20)
		end if
		if len(trim(ls_dv))>1 then
			ls_dv	= mid(trim(ls_dv),1,1)
		end if
		if len(trim(ls_dir_p))>40 then
			ls_dir_p	= mid(trim(ls_dir_p),1,40)
		end if
		if len(trim(ls_pob))>41 then
			ls_pob	= mid(trim(ls_pob),1,41)
		end if
		if len(trim(ls_sector))>20 then
			ls_sector= mid(trim(ls_sector),1,20)
		end if
		if len(trim(ls_comuna))>20 then
			ls_comuna	= mid(trim(ls_comuna),1,20)
		end if
		if len(trim(ls_ciudad))>15 then
			ls_ciudad	= mid(trim(ls_ciudad),1,15)
		end if
		if len(trim(ls_fono_p))>25 then
			ls_fono_p	= mid(trim(ls_fono_p),1,25)
		end if
		if len(trim(ls_domi_c))>40 then
			ls_domi_c	= mid(trim(ls_domi_c),1,40)
		end if
		if len(trim(ls_fono_c))>25 then
			ls_fono_c	= mid(trim(ls_fono_c),1,25)
		end if
		if len(trim(ls_est_cob))>2 then
			ls_est_cob	= mid(trim(ls_est_cob),1,2)
		end if
		if len(trim(ls_est_civil))>1 then
			ls_est_civil= mid(trim(ls_est_civil),1,1)
		end if
		if len(trim(ls_est_cob))>2 then
			ls_est_cob	= mid(trim(ls_est_cob),1,2)
		end if
		dw_datos.setitem(ll_new,'rut',gi_rut)
		dw_datos.setitem(ll_new,'dv',ls_dv)
		dw_datos.setitem(ll_new,'nombres',ls_nombre)
		dw_datos.setitem(ll_new,'ap_paterno',ls_a_pat)
		dw_datos.setitem(ll_new,'ap_materno',ls_a_mat)
		dw_datos.setitem(ll_new,'fecha',idt_fecha_hoy)
		dw_datos.setitem(ll_new,'usuario',gs_user)
		dw_datos.setitem(ll_new,'direcion_p_original',ls_dir_p)
		dw_datos.setitem(ll_new,'poblacion_original',ls_pob)
		dw_datos.setitem(ll_new,'sector_original',ls_sector)
 		dw_datos.setitem(ll_new,'ciudad_original',ls_ciudad)
		ls_ciudad	= dw_datos.getitemstring(ll_new,'ciudad_original')
		if not isnull(ls_ciudad) and ls_ciudad<>'' then
			idw_detalle.retrieve(ls_ciudad)
		end if
 		dw_datos.setitem(ll_new,'comuna_original',ls_comuna)
		dw_datos.setitem(ll_new,'fono_p_original',ls_fono_p)
		dw_datos.setitem(ll_new,'fecha_nac_original',ldt_fec_nac)
		dw_datos.setitem(ll_new,'estado_civil_original',ls_est_civil)
		dw_datos.setitem(ll_new,'domicilio_c_original',ls_domi_c)
		dw_datos.setitem(ll_new,'fono_c_original',ls_fono_c)
		dw_datos.setitem(ll_new,'total_renta_original',ll_tot_renta)
		dw_datos.setitem(ll_new,'grupo_f_original',ll_grupo_f)
		dw_datos.setitem(ll_new,'estado_cob_original',ls_est_cob)
		dw_datos.setitem(ll_new,'nombre_original',ls_nombre)
		dw_datos.setitem(ll_new,'ap_paterno_original',ls_a_pat)
		dw_datos.setitem(ll_new,'ap_materno_original',ls_a_mat)
	else
		messagebox("Advertencia","No Existe Cliente")
	end if
end if
end event

type cb_limpiar from commandbutton within w_modificar_antecedentes_cliente
integer x = 1175
integer y = 1792
integer width = 558
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar Antecedentes"
end type

event clicked;String	ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,&
			ls_est_civil,ls_domi_c,ls_fono_c,ls_dv,ls_est_cob,ls_nom,ls_a_pat,ls_a_mat,&
			ls_dir_p2,ls_pob2,ls_sector2,ls_comuna2,ls_ciudad2,ls_fono_p2,ls_nom2,ls_a_pat2,ls_a_mat2,&
			ls_est_civil2,ls_domi_c2,ls_fono_c2,ls_est_cob2,ls_tipo_via,ls_nro_part,ls_depto_part,&
			ls_block_part,ls_tipo_via2,ls_nro_part2,ls_depto_part2,ls_block_part2
Datetime	ldt_fec_nac,ldt_fec_nac2
Long		ll_tot_renta, ll_grupo_f,ll_tot_renta2, ll_grupo_f2
long		ll_resp,ll_rut

SELECT	"SOL_MOD_ANTECE"."RUT"  
INTO 		:ll_rut  
FROM 		"SOL_MOD_ANTECE"  
WHERE 	"SOL_MOD_ANTECE"."RUT" = :gi_rut   
USING		sqlca ;
if sqlca.sqlcode=0 then
	ll_resp = MessageBox("Advertencia", "Está Seguro de Limpiar Antecedentes del Cliente", &
			Exclamation!, YesNo!, 2)
	IF ll_resp = 1 THEN
		ls_nom			= ''
		ls_a_pat			= ''
		ls_a_mat			= ''
		ls_dir_p			= ''
		ls_pob			= ''
		ls_sector		= ''
		ls_comuna		= ''
		ls_ciudad		= ''
		ls_fono_p		= ''
		setnull(ldt_fec_nac)
		ls_est_civil	= ''
		ls_domi_c		= ''
		ls_fono_c		= ''
		setnull(ll_tot_renta)
		setnull(ll_grupo_f)
		ls_est_cob		= ''
		ls_tipo_via		= ''
		ls_nro_part		= ''
		ls_depto_part	= ''
		ls_block_part	= ''
		dw_datos.setitem(1,'direccion_p_nueva',ls_dir_p)
		dw_datos.setitem(1,'poblacion_nueva',ls_pob)
		dw_datos.setitem(1,'sector_nueva',ls_sector)
		dw_datos.setitem(1,'comuna_nueva',ls_comuna)
		dw_datos.setitem(1,'ciudad_nueva',ls_ciudad)
		dw_datos.setitem(1,'fono_p_nueva',ls_fono_p)
		dw_datos.setitem(1,'fecha_nac_nueva',ldt_fec_nac)
		dw_datos.setitem(1,'estado_civil_nueva',ls_est_civil)
		dw_datos.setitem(1,'domicilio_c_nueva',ls_domi_c)
		dw_datos.setitem(1,'fono_c_nueva',ls_fono_c)
		dw_datos.setitem(1,'total_renta_nueva',ll_tot_renta)
		dw_datos.setitem(1,'grupo_f_nueva',ll_grupo_f)
		dw_datos.setitem(1,'estado_cob_nueva',ls_est_cob)
		dw_datos.setitem(1,'nombre_nueva',ls_nom)
		dw_datos.setitem(1,'ap_paterno_nueva',ls_a_pat)
		dw_datos.setitem(1,'ap_materno_nueva',ls_a_mat)
		dw_datos.setitem(1,'tipo_via_nueva',ls_tipo_via)
		dw_datos.setitem(1,'numero_particular_nueva',ls_nro_part)
		dw_datos.setitem(1,'depto_nueva',ls_depto_part)
		dw_datos.setitem(1,'block_nueva',ls_block_part)
		dw_datos.setitem(1,'estatus_mod',1)
		ls_dir_p2		= dw_datos.getitemstring(1,'direcion_p_original')
		ls_pob2			= dw_datos.getitemstring(1,'poblacion_original')
		ls_sector2		= dw_datos.getitemstring(1,'sector_original')
		ls_comuna2		= dw_datos.getitemstring(1,'comuna_original')
		ls_ciudad2		= dw_datos.getitemstring(1,'ciudad_original')
		ls_fono_p2		= dw_datos.getitemstring(1,'fono_p_original')
		ldt_fec_nac2	= dw_datos.getitemdatetime(1,'fecha_nac_original')
		ls_est_civil2	= dw_datos.getitemstring(1,'estado_civil_original')
		ls_domi_c2		= dw_datos.getitemstring(1,'domicilio_c_original')
		ls_fono_c2		= dw_datos.getitemstring(1,'fono_c_original')
		ll_tot_renta2	= dw_datos.getitemnumber(1,'total_renta_original')
		ll_grupo_f2		= dw_datos.getitemnumber(1,'grupo_f_original')
		ls_est_cob2		= dw_datos.getitemstring(1,'estado_cob_original')
		ls_nom2			= dw_datos.getitemstring(1,'nombre_original')
		ls_a_pat2		= dw_datos.getitemstring(1,'ap_paterno_original')
		ls_a_mat2		= dw_datos.getitemstring(1,'ap_materno_original')
		ls_tipo_via2	= dw_datos.getitemstring(1,'tipo_via_original')
		ls_nro_part2	= dw_datos.getitemstring(1,'numero_particular_original')
		ls_depto_part2	= dw_datos.getitemstring(1,'depto_original')
		ls_block_part2	= dw_datos.getitemstring(1,'block_original')
		dw_datos.accepttext()
		UPDATE	"CLIENTE"  
		SET 		"DIRECCION_P" = :ls_dir_p2,  
					"TIPO_VIA" = :ls_tipo_via2,
					"NUMERO_PARTICULAR" = :ls_nro_part2,
					"DEPTO_PARTICULAR" = :ls_depto_part2,
					"BLOCK_PARTICULAR" = :ls_block_part2,
					"POBLACION" = :ls_pob2,   
					"SECTOR" = :ls_sector2,   
					"COMUNA" = :ls_comuna2,   
					"CIUDAD" = :ls_ciudad2,   
					"FONO_P" = :ls_fono_p2,   
					"FECHA_NAC" = :ldt_fec_nac2,   
					"ESTA_CIVIL" = :ls_est_civil2,   
					"DOMICILIO_C" = :ls_domi_c2,   
					"FONO_C" = :ls_fono_c2,   
					"TOTAL_RENT" = :ll_tot_renta2,   
					"GRUPO_F" = :ll_grupo_f2,   
					"NOMBRE" = :ls_nom2,
					"A_PATERNO" = :ls_a_pat2,
					"A_MATERNO" = :ls_a_mat2,
					"ESTADO_COBRANZA" = :ls_est_cob2  
		WHERE 	"CLIENTE"."RUT" = :gi_rut 
		USING		sqlca ;
		if sqlca.sqlcode=0 then
			commit;
			if dw_datos.update()=1 then
				commit;
			else
				rollback;
			end if
		else
			rollback;
		end if
		dw_datos.accepttext()
	END IF
else
	messagebox("Advertencia","Antes de Limpiar debe Grabar Formulario")
end if
end event

type cb_copiar from commandbutton within w_modificar_antecedentes_cliente
integer x = 1737
integer y = 1792
integer width = 617
integer height = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copiar &Antecedentes"
end type

event clicked;String	ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,&
			ls_est_civil,ls_domi_c,ls_fono_c,ls_dv,ls_est_cob,ls_nombre,ls_ap_pat,ls_ap_mat,&
			ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part
Datetime	ldt_fec_nac
Long		ll_tot_renta, ll_grupo_f

long	ll_resp

ll_resp 	= MessageBox("Advertencia", "Está seguro de Copiar Antecedentes del Cliente", &
		Exclamation!, YesNo!, 2)
IF ll_resp = 1 THEN
	il_sw_grabar	= 1
	ls_dir_p			= dw_datos.getitemstring(1,'direcion_p_original')
	ls_pob			= dw_datos.getitemstring(1,'poblacion_original')
	ls_sector		= dw_datos.getitemstring(1,'sector_original')
	ls_comuna		= dw_datos.getitemstring(1,'comuna_original')
	ls_ciudad		= dw_datos.getitemstring(1,'ciudad_original')
	ls_fono_p		= dw_datos.getitemstring(1,'fono_p_original')
	ldt_fec_nac		= dw_datos.getitemdatetime(1,'fecha_nac_original')
	ls_est_civil	= dw_datos.getitemstring(1,'estado_civil_original')
	ls_domi_c		= dw_datos.getitemstring(1,'domicilio_c_original')
	ls_fono_c		= dw_datos.getitemstring(1,'fono_c_original')
	ll_tot_renta	= dw_datos.getitemnumber(1,'total_renta_original')
	ll_grupo_f		= dw_datos.getitemnumber(1,'grupo_f_original')
	ls_est_cob		= dw_datos.getitemstring(1,'estado_cob_original')
	ls_nombre		= dw_datos.getitemstring(1,'nombres')
	ls_ap_pat		= dw_datos.getitemstring(1,'ap_paterno')
	ls_ap_mat		= dw_datos.getitemstring(1,'ap_materno')
	ls_tipo_via		= dw_datos.getitemstring(1,'tipo_via_original')
	ls_nro_part		= dw_datos.getitemstring(1,'numero_particular_original')
	ls_depto_part	= dw_datos.getitemstring(1,'depto_original')
	ls_block_part	= dw_datos.getitemstring(1,'block_original')
	dw_datos.setitem(1,'direccion_p_nueva',ls_dir_p)
	dw_datos.setitem(1,'poblacion_nueva',ls_pob)
	dw_datos.setitem(1,'sector_nueva',ls_sector)
	dw_datos.setitem(1,'comuna_nueva',ls_comuna)
	dw_datos.setitem(1,'ciudad_nueva',ls_ciudad)
	dw_datos.setitem(1,'fono_p_nueva',ls_fono_p)
	dw_datos.setitem(1,'fecha_nac_nueva',ldt_fec_nac)
	dw_datos.setitem(1,'estado_civil_nueva',ls_est_civil)
	dw_datos.setitem(1,'domicilio_c_nueva',ls_domi_c)
	dw_datos.setitem(1,'fono_c_nueva',ls_fono_c)
	dw_datos.setitem(1,'total_renta_nueva',ll_tot_renta)
	dw_datos.setitem(1,'grupo_f_nueva',ll_grupo_f)
	dw_datos.setitem(1,'estado_cob_nueva',ls_est_cob)
	dw_datos.setitem(1,'nombre_nueva',ls_nombre)
	dw_datos.setitem(1,'ap_paterno_nueva',ls_ap_pat)
	dw_datos.setitem(1,'ap_materno_nueva',ls_ap_mat)
	dw_datos.setitem(1,'tipo_via_original',ls_tipo_via)
	dw_datos.setitem(1,'numero_particular_original',ls_nro_part)
	dw_datos.setitem(1,'depto_original',ls_depto_part)
	dw_datos.setitem(1,'block_original',ls_block_part)
	dw_datos.accepttext()
END IF
end event

type cb_imprimir from commandbutton within w_modificar_antecedentes_cliente
integer x = 325
integer y = 1792
integer width = 293
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long	ll_rut
if dw_datos.rowcount()>0 and gi_rut>0 then
	SELECT	"SOL_MOD_ANTECE"."RUT"  
   INTO 		:ll_rut  
   FROM 		"SOL_MOD_ANTECE"  
   WHERE 	"SOL_MOD_ANTECE"."RUT" = :gi_rut   
   USING		sqlca ;
	if sqlca.sqlcode=0 then
		f_Print( dw_datos )
	else
		messagebox("Advertencia","Debe Grabar Modificacion de Antecedentes antes de Imprimir")
	end if
end if
end event

type cb_grabar from commandbutton within w_modificar_antecedentes_cliente
integer x = 32
integer y = 1792
integer width = 293
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String	ls_dir_p,ls_pob,ls_sector,ls_comuna,ls_ciudad,ls_fono_p,&
			ls_est_civil,ls_domi_c,ls_fono_c,ls_dv,ls_est_cob,&
			ls_dir_p2,ls_pob2,ls_sector2,ls_comuna2,ls_ciudad2,ls_fono_p2,&
			ls_est_civil2,ls_domi_c2,ls_fono_c2,ls_dv2,ls_est_cob2,ls_nom,ls_ap_pat,ls_ap_mat,&
			ls_nom2,ls_ap_pat2,ls_ap_mat2,ls_tipo_via,ls_nro_part,ls_depto_part,ls_block_part,&
			ls_tipo_via2,ls_nro_part2,ls_depto_part2,ls_block_part2
Datetime	ldt_fec_nac,ldt_fec_nac2
Long		ll_tot_renta, ll_grupo_f,ll_tot_renta2, ll_grupo_f2,ll_rut

setnull(ls_dir_p);setnull(ls_pob);setnull(ls_sector);setnull(ls_comuna)
setnull(ls_ciudad);setnull(ls_fono_p);setnull(ldt_fec_nac);setnull(ls_est_civil)
setnull(ls_domi_c);setnull(ls_fono_c);setnull(ll_tot_renta);setnull(ll_grupo_f)
setnull(ls_est_cob);setnull(ll_rut);setnull(ls_nom);setnull(ls_ap_pat);setnull(ls_ap_mat)
dw_datos.accepttext()
ll_rut			= dw_datos.getitemnumber(1,'rut')
ls_dir_p			= trim(dw_datos.getitemstring(1,'direccion_p_nueva'))
ls_pob			= trim(dw_datos.getitemstring(1,'poblacion_nueva'))
ls_sector		= trim(dw_datos.getitemstring(1,'sector_nueva'))
ls_comuna		= trim(dw_datos.getitemstring(1,'comuna_nueva'))
ls_ciudad		= trim(dw_datos.getitemstring(1,'ciudad_nueva'))
ls_fono_p		= trim(dw_datos.getitemstring(1,'fono_p_nueva'))
ldt_fec_nac		= dw_datos.getitemdatetime(1,'fecha_nac_nueva')
ls_est_civil	= trim(dw_datos.getitemstring(1,'estado_civil_nueva'))
ls_domi_c		= trim(dw_datos.getitemstring(1,'domicilio_c_nueva'))
ls_fono_c		= trim(dw_datos.getitemstring(1,'fono_c_nueva'))
ll_tot_renta	= dw_datos.getitemnumber(1,'total_renta_nueva')
ll_grupo_f		= dw_datos.getitemnumber(1,'grupo_f_nueva')
ls_est_cob		= trim(dw_datos.getitemstring(1,'estado_cob_nueva'))
ls_nom			= trim(dw_datos.getitemstring(1,'nombre_nueva'))
ls_ap_pat		= trim(dw_datos.getitemstring(1,'ap_paterno_nueva'))
ls_ap_mat		= trim(dw_datos.getitemstring(1,'ap_materno_nueva'))
ls_tipo_via		= trim(dw_datos.getitemstring(1,'tipo_via_nueva'))
ls_nro_part		= trim(dw_datos.getitemstring(1,'numero_particular_nueva'))
ls_depto_part	= trim(dw_datos.getitemstring(1,'depto_nueva'))
ls_block_part	= trim(dw_datos.getitemstring(1,'block_nueva'))

ls_dir_p2		= trim(dw_datos.getitemstring(1,'direcion_p_original'))
ls_pob2			= trim(dw_datos.getitemstring(1,'poblacion_original'))
ls_sector2		= trim(dw_datos.getitemstring(1,'sector_original'))
ls_comuna2		= trim(dw_datos.getitemstring(1,'comuna_original'))
ls_ciudad2		= trim(dw_datos.getitemstring(1,'ciudad_original'))
ls_fono_p2		= trim(dw_datos.getitemstring(1,'fono_p_original'))
ldt_fec_nac2	= dw_datos.getitemdatetime(1,'fecha_nac_original')
ls_est_civil2	= trim(dw_datos.getitemstring(1,'estado_civil_original'))
ls_domi_c2		= trim(dw_datos.getitemstring(1,'domicilio_c_original'))
ls_fono_c2		= trim(dw_datos.getitemstring(1,'fono_c_original'))
ll_tot_renta2	= dw_datos.getitemnumber(1,'total_renta_original')
ll_grupo_f2		= dw_datos.getitemnumber(1,'grupo_f_original')
ls_est_cob2		= trim(dw_datos.getitemstring(1,'estado_cob_original'))
ls_nom2			= trim(dw_datos.getitemstring(1,'nombre_original'))
ls_ap_pat2		= trim(dw_datos.getitemstring(1,'ap_paterno_original'))
ls_ap_mat2		= trim(dw_datos.getitemstring(1,'ap_materno_original'))
ls_tipo_via2	= trim(dw_datos.getitemstring(1,'tipo_via_original'))
ls_nro_part2	= trim(dw_datos.getitemstring(1,'numero_particular_original'))
ls_depto_part2	= trim(dw_datos.getitemstring(1,'depto_original'))
ls_block_part2	= trim(dw_datos.getitemstring(1,'block_original'))
	
if ((isnull(ls_dir_p) or ls_dir_p='') and (isnull(ls_pob) or ls_pob='') and &
	(isnull(ls_nom) or ls_nom='') and (isnull(ls_ap_pat) or ls_ap_pat='') and (isnull(ls_ap_mat) or ls_ap_mat='') and &
	(isnull(ls_sector) or ls_sector='') and (isnull(ls_comuna) or ls_comuna='') and &
	(isnull(ls_ciudad) or ls_ciudad='') and (isnull(ls_fono_p) or ls_fono_p='') and &
	isnull(ldt_fec_nac) and (isnull(ls_est_civil) or ls_est_civil='') and &
	(isnull(ls_domi_c) or ls_domi_c='') and (isnull(ls_fono_c) or ls_fono_c='') and &
	isnull(ll_tot_renta) and isnull(ll_grupo_f) and (isnull(ls_est_cob) or ls_est_cob='') and &
	(isnull(ls_nro_part) or ls_nro_part='')) then
	messagebox("Advertencia","No Registra Modificaciones Antecedentes del Cliente")
else
	dw_datos.setitem(1,'estatus_mod',0)
	dw_datos.accepttext()
	if dw_datos.update()=1 then
		UPDATE	"CLIENTE"  
     	SET 		"DIRECCION_P" = :ls_dir_p,   
		  			"TIPO_VIA" = :ls_tipo_via,
					"NUMERO_PARTICULAR" = :ls_nro_part,
					"DEPTO_PARTICULAR" = :ls_depto_part,
					"BLOCK_PARTICULAR" = :ls_block_part,
					"POBLACION" = :ls_pob,   
					"SECTOR" = :ls_sector,   
					"COMUNA" = :ls_comuna,   
					"CIUDAD" = :ls_ciudad,   
					"FONO_P" = :ls_fono_p,   
					"FECHA_NAC" = :ldt_fec_nac,   
					"DOMICILIO_C" = :ls_domi_c,   
					"ESTA_CIVIL" = :ls_est_civil,   
					"FONO_C" = :ls_fono_c,   
					"TOTAL_RENT" = :ll_tot_renta,   
					"GRUPO_F" = :ll_grupo_f,   
					"NOMBRE" = :ls_nom,
					"A_PATERNO" = :ls_ap_pat,
					"A_MATERNO" = :ls_ap_mat,
					"ESTADO_COBRANZA" = :ls_est_cob  
   	WHERE 	"CLIENTE"."RUT" = :ll_rut   
      USING		sqlca ;
		if sqlca.sqlcode=0 then
			commit;
			il_sw_grabar	= 0
			if isvalid(w_cuenta_corriente_contrato_isa) then
				w_cuenta_corriente_contrato_isa.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
			elseif isvalid(w_cuenta_corriente_derecho) then
				w_cuenta_corriente_derecho.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
			elseif isvalid(w_cuenta_corriente_liberador) then
				w_cuenta_corriente_liberador.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
			elseif isvalid(w_cuenta_corriente_oferta) then
				w_cuenta_corriente_oferta.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
			elseif isvalid(w_cuenta_corriente_pagare) then
				w_cuenta_corriente_pagare.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
			elseif isvalid(w_cuenta_corriente_repactar_cta_mant) then
				w_cuenta_corriente_repactar_cta_mant.dw_encabezado_cuenta_cte_detalle.retrieve(gs_base,gs_serie,gi_numero)
			elseif isvalid(w_cuenta_corriente_aumento_capacidad) then
				w_cuenta_corriente_aumento_capacidad.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
			elseif isvalid(w_cuenta_corriente_funeraria) then
				w_cuenta_corriente_funeraria.dw_encabezado_cuenta_cte.Retrieve(gs_serie, gi_numero)
			end if
		else
			rollback;
		end if
		messagebox("Grabar","Grabación Exitosa")
		close(w_modificar_antecedentes_cliente)
	else
		messagebox("Error","Error al Grabar: "+SQLCA.SQLErrText)
	end if
end if
end event

type cb_cerrar from commandbutton within w_modificar_antecedentes_cliente
integer x = 2834
integer y = 1792
integer width = 306
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;long	ll_resp
if il_sw_grabar = 1 then
	ll_resp	= messagebox("Advertencia","Desea Grabar Antecedente antes de Salir",Exclamation!, YesNo!, 2)
	if ll_resp=1 then 
		cb_grabar.triggerevent(clicked!)
	else
		il_sw_grabar = 0
		close(w_modificar_antecedentes_cliente)
	end if
else
	close(w_modificar_antecedentes_cliente)
end if
end event

type dw_datos from datawindow within w_modificar_antecedentes_cliente
integer x = 32
integer y = 32
integer width = 3118
integer height = 1724
integer taborder = 10
string dataobject = "dw_modifica_antecedentes_cliente"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_ciudad
il_sw_grabar	= 1
this.accepttext()
ls_columna		= dwo.name
CHOOSE CASE ls_columna
	CASE 'ciudad'
		ls_ciudad	= dw_datos.getitemstring(1,'ciudad')
		if not isnull(ls_ciudad) and ls_ciudad<>'' then
			idw_detalle.retrieve(ls_ciudad)
		end if
END CHOOSE
end event

event losefocus;this.accepttext()
end event

