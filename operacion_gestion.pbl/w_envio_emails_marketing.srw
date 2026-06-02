forward
global type w_envio_emails_marketing from window
end type
type cb_1 from commandbutton within w_envio_emails_marketing
end type
type cb_3 from commandbutton within w_envio_emails_marketing
end type
type cb_imprimir from commandbutton within w_envio_emails_marketing
end type
type cb_limpiar from commandbutton within w_envio_emails_marketing
end type
type dw_importar from datawindow within w_envio_emails_marketing
end type
type cb_ortografia from commandbutton within w_envio_emails_marketing
end type
type cb_cerrar from commandbutton within w_envio_emails_marketing
end type
type cb_enviar from commandbutton within w_envio_emails_marketing
end type
type cb_buscar from commandbutton within w_envio_emails_marketing
end type
type gb_1 from groupbox within w_envio_emails_marketing
end type
type dw_detalle from datawindow within w_envio_emails_marketing
end type
type dw_grupo from datawindow within w_envio_emails_marketing
end type
type st_fondo from statictext within w_envio_emails_marketing
end type
type hpb_1 from hprogressbar within w_envio_emails_marketing
end type
type st_cuenta from statictext within w_envio_emails_marketing
end type
type st_porc from statictext within w_envio_emails_marketing
end type
end forward

global type w_envio_emails_marketing from window
integer width = 3182
integer height = 1824
boolean titlebar = true
string title = "Envio de E-mails Marketing"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_1 cb_1
cb_3 cb_3
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
dw_importar dw_importar
cb_ortografia cb_ortografia
cb_cerrar cb_cerrar
cb_enviar cb_enviar
cb_buscar cb_buscar
gb_1 gb_1
dw_detalle dw_detalle
dw_grupo dw_grupo
st_fondo st_fondo
hpb_1 hpb_1
st_cuenta st_cuenta
st_porc st_porc
end type
global w_envio_emails_marketing w_envio_emails_marketing

type variables
string named
end variables

on w_envio_emails_marketing.create
this.cb_1=create cb_1
this.cb_3=create cb_3
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.dw_importar=create dw_importar
this.cb_ortografia=create cb_ortografia
this.cb_cerrar=create cb_cerrar
this.cb_enviar=create cb_enviar
this.cb_buscar=create cb_buscar
this.gb_1=create gb_1
this.dw_detalle=create dw_detalle
this.dw_grupo=create dw_grupo
this.st_fondo=create st_fondo
this.hpb_1=create hpb_1
this.st_cuenta=create st_cuenta
this.st_porc=create st_porc
this.Control[]={this.cb_1,&
this.cb_3,&
this.cb_imprimir,&
this.cb_limpiar,&
this.dw_importar,&
this.cb_ortografia,&
this.cb_cerrar,&
this.cb_enviar,&
this.cb_buscar,&
this.gb_1,&
this.dw_detalle,&
this.dw_grupo,&
this.st_fondo,&
this.hpb_1,&
this.st_cuenta,&
this.st_porc}
end on

on w_envio_emails_marketing.destroy
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.dw_importar)
destroy(this.cb_ortografia)
destroy(this.cb_cerrar)
destroy(this.cb_enviar)
destroy(this.cb_buscar)
destroy(this.gb_1)
destroy(this.dw_detalle)
destroy(this.dw_grupo)
destroy(this.st_fondo)
destroy(this.hpb_1)
destroy(this.st_cuenta)
destroy(this.st_porc)
end on

event open;String	ls_usuario,ls_email

SELECT	"SOL_PERMISOS_USUARIO"."USUARIO"  
INTO		:ls_usuario  
FROM		"SOL_PERMISOS_USUARIO"
WHERE	"SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'MM' and
			"SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user
USING 	sqlca;
if sqlca.sqlcode=0 then
	SELECT	"ENCARGADOS"."EMAIL"  
   INTO		:ls_email  
   FROM		"ENCARGADOS"  
   WHERE	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
   USING		sqlca;
	if sqlca.sqlcode=0 then
		gf_centrar(w_envio_emails_marketing)
		dw_importar.settransobject(sqlca)
		dw_grupo.settransobject(sqlca)
		dw_grupo.insertrow(0)
		dw_grupo.setitem(1,"fecha_creacion",gdt_fec_sistema)
		dw_grupo.setitem(1,"correo_email_remitente",ls_email)
		dw_grupo.setitem(1,'cod_prioridad','B')
		dw_grupo.setitem(1,'tipo_email','IN')
		dw_grupo.setitem(1,'texto_cuerpo',' ')
		dw_grupo.setitem(1,'parrafo_3','')
		dw_grupo.setitem(1,'parrafo_4',' ')
		dw_grupo.accepttext()
		dw_detalle.settransobject(sqlca)
		cb_enviar.enabled			= false
		cb_ortografia.enabled		= false
	else	
	end if	
else
	messagebox("Advertencia","Usted NO tiene Acceso para mandar E-mail Marketing")
	close(w_envio_emails_marketing)
end if
end event

type cb_1 from commandbutton within w_envio_emails_marketing
integer x = 1458
integer y = 1592
integer width = 238
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_detalle.rowcount() > 0 then
	setnull (nulo)
	dw_detalle.SETSORT(NULO)
	dw_detalle.SORT()
end if
end event

type cb_3 from commandbutton within w_envio_emails_marketing
integer x = 1691
integer y = 1592
integer width = 215
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fi&ltrar"
end type

event clicked;string nulo
setnull (nulo)
dw_detalle.SETfilter(NULO)
dw_detalle.filter()

end event

type cb_imprimir from commandbutton within w_envio_emails_marketing
integer x = 1902
integer y = 1592
integer width = 265
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_detalle.rowcount() > 0 then
	f_Print( dw_detalle )
end if
end event

type cb_limpiar from commandbutton within w_envio_emails_marketing
integer x = 2162
integer y = 1592
integer width = 261
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limipiar"
end type

event clicked;dw_importar.reset()
dw_grupo.reset()
dw_detalle.reset()
w_envio_emails_marketing.triggerevent(open!)
	
end event

type dw_importar from datawindow within w_envio_emails_marketing
boolean visible = false
integer x = 3145
integer y = 760
integer width = 731
integer height = 1104
string title = "none"
string dataobject = "dwe_importar_contratos_envio_email"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_ortografia from commandbutton within w_envio_emails_marketing
integer x = 46
integer y = 1580
integer width = 443
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ortografia"
end type

event clicked;Long		ll_tot_reg,ll_fila
dw_grupo.accepttext()
dw_detalle.accepttext()
ll_tot_reg						= dw_detalle.rowcount()
ll_fila 							= dw_detalle.Find("estado_registro = 0", 1, ll_tot_reg)
if ll_fila > 0 then
	if dw_grupo.getitemstring(1,'asunto') = "" or isnull(dw_grupo.getitemstring(1,'asunto')) then
		messagebox("AVISO","Debe ingresar palabras en el campo asunto")
		return
	else
		if dw_grupo.getitemstring(1,'texto_cuerpo') = "" or isnull(dw_grupo.getitemstring(1,'texto_cuerpo')) then
			messagebox("AVISO","Debe ingresar palabras en el parrafo 1")
		else
			dw_grupo.setitem(1,'asunto',f_ortografia(dw_grupo.getitemstring(1,'asunto')))
			dw_grupo.setitem(1,'texto_cuerpo',f_ortografia(dw_grupo.getitemstring(1,'texto_cuerpo')))
			dw_grupo.setitem(1,'parrafo_2',f_ortografia(dw_grupo.getitemstring(1,'parrafo_2')))
			dw_grupo.setitem(1,'parrafo_3',f_ortografia(dw_grupo.getitemstring(1,'parrafo_3')))
			dw_grupo.setitem(1,'parrafo_4',f_ortografia(dw_grupo.getitemstring(1,'parrafo_4')))
			cb_enviar.enabled	= true
		end if
	end if
else
	messagebox("Advertencia","Debe Seleccionar por lo Menos 1 Registro a Enviar Email")
end if
end event

type cb_cerrar from commandbutton within w_envio_emails_marketing
integer x = 2734
integer y = 1580
integer width = 370
integer height = 100
integer taborder = 110
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_envio_emails_marketing)
end event

type cb_enviar from commandbutton within w_envio_emails_marketing
integer x = 617
integer y = 1580
integer width = 443
integer height = 100
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enviar Email"
end type

event clicked;string		ls_res,ls_email_de,ls_asunto,ls_cuerpo_email,ls_email_para,ls_remit,ls_prioridad,ls_gestion,&
         	ls_parrafo_2,ls_parrafo_3,ls_base,ls_serie,ls_parrafo_4,ls_nomb,ls_a_pater,ls_a_mater,ls_tipo_email
long		ll_tot_reg,ll_indi,ll_graba,ll_cod_parq,ll_regis,ll_grupo,ll_fila,ll_rut,ll_mora_cred,ll_corr,ll_mora_mant
datetime	ldt_fech_crea
Double	ll_numero
ll_graba								= 0
ll_tot_reg							= dw_detalle.rowcount()
ll_fila 									= dw_detalle.Find("estado_registro = 0", 1, ll_tot_reg)
if ll_fila > 0 then
	if ll_tot_reg > 0 then
		ll_cod_parq					= dw_grupo.getitemnumber(1,"cod_parque")
		ls_email_de					= dw_grupo.getitemstring(1,"correo_email_remitente")			
		ls_asunto					= dw_grupo.getitemstring(1,"asunto")
		ls_cuerpo_email			= dw_grupo.getitemstring(1,"texto_cuerpo")
		ls_parrafo_2				= dw_grupo.getitemstring(1,"parrafo_2")
		ls_parrafo_3				= dw_grupo.getitemstring(1,"parrafo_3")
		ls_parrafo_4				= dw_grupo.getitemstring(1,"parrafo_4")
		ls_tipo_email				= dw_grupo.getitemstring(1,"tipo_email")
		ldt_fech_crea				= dw_grupo.getitemdatetime(1,"fecha_creacion")
		if not isnull(ls_email_de) and ls_email_de<>'' and not isnull(ls_asunto) and ls_asunto<>'' and not isnull(ls_cuerpo_email) and ls_cuerpo_email<>'' then
			for ll_indi=1 to ll_tot_reg
				ll_regis				= dw_detalle.getitemnumber(ll_indi,"estado_registro")
				if ll_regis = 0 then
					ls_email_para		= dw_detalle.getitemstring(ll_indi,"correo_email_cliente")
					ll_rut					= dw_detalle.getitemnumber(ll_indi,"rut_cliente")
					ls_base	 			= dw_detalle.getitemstring(ll_indi,"base")
					ls_serie				= dw_detalle.getitemstring(ll_indi,"serie")
					ll_numero		 	= dw_detalle.getitemnumber(ll_indi,"numero")
					ls_nomb		 		= dw_detalle.getitemstring(ll_indi,"nombre")
					ls_a_pater	 		= dw_detalle.getitemstring(ll_indi,"a_paterno")
					ls_a_mater	 		= dw_detalle.getitemstring(ll_indi,"a_materno")
					SELECT	MAX("CARTA_LOG"."CORRELATIVO")  
					INTO 		:ll_corr  
					FROM 	"CARTA_LOG"
					USING 	sqlca;
					if isnull(ll_corr) or ll_corr=0 then ll_corr=0
					ll_corr ++
					if ls_email_para<>'' and ls_email_para<>'-' and ls_email_para<>'NO TIENE' then
						SELECT	F_EMAIL_MARKETING(:ll_cod_parq,:ls_tipo_email,:ls_email_de,:ls_email_para,:ls_asunto,:ls_cuerpo_email,:ls_parrafo_2,:ls_parrafo_3,:ls_parrafo_4,:ll_numero,:ls_nomb,:ls_a_pater,:ls_a_mater) 
						INTO 		:ls_res
						FROM 		DUAL;
						if ls_res='OK' then
							ll_graba++
							dw_detalle.setitem(ll_indi,"estado_gestion",'Gestionado')
//							INSERT INTO "CARTA_LOG"  
//      		 				    ( "BASE",	"SERIE",   "NUMERO",   "RUT",   "COD_ENVIO",   "ESTADO_ENV",   "FECHA_CARTA",		"MORA",	"COD_ACCION",  "CORRELATIVO", "MORA_MANT",   "CLASIFICACION",  "USUARIO" )  
//							VALUES ( :ls_base,:ls_serie, :ll_numero, :ll_rut, :ls_base ,     '0',      		:ldt_fech_crea, 	null,    35,          	:ll_corr,     	null,      		'0',             	:gs_user )  
//							USING		sqlca;
//							if sqlca.sqlcode=0 then
//								commit;
//							else
//								rollback;
//								messagebox("Error Grabar","Error Grabar CARTA_LOG SQL: "+sqlca.sqlerrtext)
//							end if
						end if
					end if
				end if	
			next
			if ll_tot_reg = ll_graba then
				messagebox("E-Mail","Envio E-Mail Exitoso")
				SELECT	MAX("GESTION_VIA_GRUPO_EMAIL"."GRUPO") 
				INTO 		:ll_grupo 
				FROM 		"GESTION_VIA_GRUPO_EMAIL" 
				USING		sqlca;
				if isnull(ll_grupo) or ll_grupo=0 then ll_grupo=0
				ll_grupo ++
				if ll_grupo > 0 then
					dw_grupo.setitem(1,'grupo',ll_grupo)
					dw_grupo.accepttext()
					for ll_indi=1 to ll_tot_reg
						dw_detalle.setitem(ll_indi,'grupo',ll_grupo)
					next
					dw_detalle.accepttext()
				end if
				if dw_grupo.update() = 1 then
					commit;
					if dw_detalle.update() = 1 then
						commit;
						dw_grupo.reset()
						dw_detalle.reset()
						close(w_envio_emails_marketing)
					else
						rollback;
						messagebox("Error Grabar Detalle","Error Grabar Detalle SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback;
					messagebox("Error Grabar Grupo","Error Grabar Grupo SQL: "+sqlca.sqlerrtext)
				end if
			elseif ll_graba > 0 then
				messagebox("E-Mail","Recuerde se Envio "+string(ll_graba)+" E-Mail Exitoso")
				SELECT	MAX("GESTION_VIA_GRUPO_EMAIL"."GRUPO") 
				INTO 		:ll_grupo 
				FROM 		"GESTION_VIA_GRUPO_EMAIL" 
				USING		sqlca;
				if isnull(ll_grupo) or ll_grupo=0 then ll_grupo=0
				ll_grupo ++
				if ll_grupo > 0 then
					dw_grupo.setitem(1,'grupo',ll_grupo)
					dw_grupo.accepttext()
					for ll_indi=1 to ll_tot_reg
						ll_regis			=  dw_detalle.getitemnumber(ll_indi,"estado_registro")	
						if ll_regis = 0 then
							dw_detalle.setitem(ll_indi,'grupo',ll_grupo)
						end if
					next
					dw_detalle.accepttext()
				end if
				if dw_grupo.update() = 1 then
					commit;
					if dw_detalle.update() = 1 then
						commit;
						dw_grupo.reset()
						dw_detalle.reset()
						close(w_envio_emails_marketing)
					else
						rollback;
						messagebox("Error Grabar Detalle","Error Grabar Detalle SQL: "+sqlca.sqlerrtext)
					end if
				else
					rollback;
					messagebox("Error Grabar Grupo","Error Grabar Grupo SQL: "+sqlca.sqlerrtext)
				end if
			end if
		else
			if isnull(ls_email_de) or ls_email_de='' then
				messagebox("Advertencia", "Debe Ingresar Usuario Envia E-Mail")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('correo_email_remitente')
			elseif isnull(ls_asunto) or ls_asunto='' then
				messagebox("Advertencia", "Debe Ingresar Asunto")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('asunto')
			elseif isnull(ls_cuerpo_email) or ls_cuerpo_email='' then
				messagebox("Advertencia", "Debe Ingresar Parrafo E-Mail 1")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('texto_cuerpo')
			elseif isnull(ls_tipo_email) or ls_tipo_email='' then
				messagebox("Advertencia", "Debe Ingresar Tipo E-mail")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('tipo_email')		
			end if
		end if
	else
		messagebox("Advertencia","Archivo Importado No Registra Datos")
	end if
else
	messagebox("Advertencia","Debe Seleccionar por lo Menos 1 Registro a Enviar Email")
end if	
end event

type cb_buscar from commandbutton within w_envio_emails_marketing
integer x = 32
integer y = 516
integer width = 443
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Archivo"
end type

event clicked;integer 	value
string	docname,ls_asunto,ls_cuerpo_email,ls_prioridad,ls_orbserv,ls_remit,ls_lista_nom,&
			ls_gestion,ls_res,null_str,ls_base,ls_serie,ls_cli_email,ls_nom_arch,ls_cod_usu,&
			ls_parrafo_2,ls_parrafo_3,ls_parrafo_4,ls_nomb,ls_a_pater,ls_a_mater,ls_tipo_email
long		ll_cod_parq,ll_tot_reg,ll_indi,ll_tot_reg2,ll_max_grupo,ll_rut,ll_new,ll_grupo
datetime ldt_fech_crea
double	ldb_tot_porc,ldb_tot_porc_aux,ll_numero

dw_detalle.reset()
dw_importar.reset()
SELECT	"SOL_PERMISOS_USUARIO"."USUARIO"  
INTO		:ls_cod_usu  
FROM		"SOL_PERMISOS_USUARIO"
WHERE	"SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'MM' and
			"SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user
USING 	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ls_cod_usu) and ls_cod_usu<>'' then
		SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1   ;
		dw_grupo.setitem(1,"grupo",ll_grupo)
		ll_cod_parq						= dw_grupo.getitemnumber(1,"cod_parque")
		ls_remit							= dw_grupo.getitemstring(1,"correo_email_remitente")
		ls_prioridad						= dw_grupo.getitemstring(1,'cod_prioridad')
		ls_gestion						= 'No Gestionado'		
		ls_asunto						= dw_grupo.getitemstring(1,"asunto")
		ldt_fech_crea					= dw_grupo.getitemdatetime(1,"fecha_creacion")
		ls_cuerpo_email				= dw_grupo.getitemstring(1,"texto_cuerpo")
		ls_parrafo_2					= dw_grupo.getitemstring(1,"parrafo_2")
		ls_parrafo_3					= dw_grupo.getitemstring(1,"parrafo_3")
		ls_parrafo_4					= dw_grupo.getitemstring(1,"parrafo_4")
		ls_tipo_email					= dw_grupo.getitemstring(1,"tipo_email")
		if not isnull(ls_remit) and ls_remit<>'' and not isnull(ll_cod_parq) and ll_cod_parq>0 and &
			not isnull(ls_asunto) and ls_asunto<>'' and not isnull(ll_grupo) /*and ll_grupo>0*/and not isnull(ldt_fech_crea) and not isnull(ls_cuerpo_email) and ls_cuerpo_email<>'' then
			value 						= GetFileOpenName("Seleccione Archivo", docname, named, "DOC", + "Archivos de Texto (*.TXT),*.TXT")//," + "Archivos Doc (*.DOC),*.DOC")
			SetPointer(HourGlass!)
			dw_importar.ImportFile(docname)
			ls_nom_arch					= UPPER(named)
			ll_tot_reg2					= dw_importar.rowcount()
			dw_grupo.setitem(1,"nom_archivo",ls_nom_arch)
			if ll_tot_reg2 > 0 then
				SetPointer(HourGlass!)
				st_fondo.visible																= true
				st_cuenta.visible															= true
				hpb_1.visible 																= true
				st_porc.visible 																= true
				ldb_tot_porc																	= 0
				ldb_tot_porc_aux															= 0			
				hpb_1.Position																= ldb_tot_porc
				for ll_indi=1 to ll_tot_reg2
					ls_base	 		=	dw_importar.getitemstring(ll_indi,"base")
					ls_serie	 		=	dw_importar.getitemstring(ll_indi,"serie")
					ll_numero 		=	dw_importar.getitemnumber(ll_indi,"numero")
					if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' and not isnull(ll_numero) and ll_numero>0 then
						SELECT	"CLIENTE"."EMAIL","CLIENTE"."NOMBRE","CLIENTE"."A_PATERNO","CLIENTE"."A_MATERNO",	"CADENA"."RUT"
						INTO		:ls_cli_email, 	:ls_nomb,			 :ls_a_pater,           :ls_a_mater,         	 :ll_rut
						FROM		"CADENA","CLIENTE"  
						WHERE	"CADENA"."RUT" = "CLIENTE"."RUT" and  
									"CADENA"."CODIGO" = :ls_base AND  
									"CADENA"."SERIE" = :ls_serie AND  
									"CADENA"."NUMERO" = :ll_numero
						USING		sqlca;
						if sqlca.sqlcode=0 then
							if not isnull(ls_cli_email) and ls_cli_email<>'' then
								ls_cli_email				= ls_cli_email
							else
								ls_cli_email				= ''
							end if
						else
							ls_cli_email					= ''
						end if	
					end if		
					ll_new													= dw_detalle.insertrow(0)
					dw_detalle.scrolltorow(ll_new)
					dw_detalle.setitem(ll_new,"correo_email_cliente",ls_cli_email)
					dw_detalle.setitem(ll_new,"base",ls_base)
					dw_detalle.setitem(ll_new,"serie",ls_serie)
					dw_detalle.setitem(ll_new,"numero",ll_numero)
					dw_detalle.setitem(ll_new,"rut_cliente",ll_rut)
					dw_detalle.setitem(ll_new,"nombre",ls_nomb)
					dw_detalle.setitem(ll_new,"a_paterno",ls_a_pater)
					dw_detalle.setitem(ll_new,"a_materno",ls_a_mater)
					dw_detalle.setitem(ll_new,"estado_gestion",'No Gestionado')
					dw_detalle.setitem(ll_new,"fecha_creacion",ldt_fech_crea)
					dw_detalle.setitem(ll_new,"estado_registro",1)
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text						= string(ldb_tot_porc,'#0.##')+" %"
						ldb_tot_porc_aux					= ldb_tot_porc
					end if
					ldb_tot_porc							= (ll_indi / ll_tot_reg2) * 100
					hpb_1.Position 						= ldb_tot_porc
					st_cuenta.text 						= 'Total Reg. '+string(ll_tot_reg2,'###,###,###')+'    Reg. Cálculados '+string(ll_indi,'###,###,###')+' ( '+string((ll_indi*100)/ll_tot_reg2,'#0.##')+'% )'
				next
				dw_detalle.accepttext()
				st_fondo.visible							= false
				st_cuenta.visible							= false
				hpb_1.visible 								= false
				st_porc.visible 							= false
				SetPointer(Arrow!)
				cb_ortografia.enabled					= true
			else
				messagebox("Advertencia","Archivo Importado No Registra Datos")
			end if
		else
			if isnull(ls_asunto) or ls_asunto='' then
				messagebox("Advertencia", "Debe Ingresar Asunto E-mail")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('asunto')
			elseif isnull(ls_cuerpo_email) or ls_cuerpo_email='' then
				messagebox("Advertencia", "Debe Ingresar Parrafo E-Mail 1")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('texto_cuerpo')
			elseif isnull(ldt_fech_crea) then
				messagebox("Advertencia", "Debe ingresar fecha creación")
			elseif isnull(ls_prioridad) or ls_prioridad='' then
				messagebox("Advertencia", "Debe seleccionar Urgencia")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('cod_prioridad')
			elseif isnull(ls_remit) or ls_remit='' then
				messagebox("Advertencia", "Debe Ingresar Remitente")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('correo_email_remitente')
			elseif isnull(ll_cod_parq) or ll_cod_parq=0 then
				messagebox("Advertencia", "Debe Ingresar Parque")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('cod_parque')
			elseif isnull(ls_tipo_email) or ls_tipo_email='' then
				messagebox("Advertencia", "Debe Ingresar Tipo Email")
				dw_grupo.setfocus()
				dw_grupo.setcolumn('tipo_email')	
			end if
		end if
	end if
else
	messagebox("Error","Usted NO tiene Acceso para mandar E-mail")
end if	
end event

type gb_1 from groupbox within w_envio_emails_marketing
integer x = 1440
integer y = 1536
integer width = 1010
integer height = 168
integer taborder = 50
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_detalle from datawindow within w_envio_emails_marketing
integer x = 37
integer y = 640
integer width = 3086
integer height = 884
integer taborder = 30
string dataobject = "dw_gestion_email_detalle"
boolean minbox = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna

Long		ll_tot_reg,ll_indi
ls_columna	= dwo.name
if row > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
else
	ll_tot_reg	= dw_detalle.rowcount()
	if ls_columna='t_marcar' then
		if dw_detalle.object.t_marcar.text = 'Marcar Todo' then
			for ll_indi=1 to ll_tot_reg
				dw_detalle.setitem(ll_indi,'estado_registro',0)
			next
			dw_detalle.object.t_marcar.text	= 'Desmarcar Todo'
		elseif dw_detalle.object.t_marcar.text = 'Desmarcar Todo' then
			for ll_indi=1 to ll_tot_reg
				dw_detalle.setitem(ll_indi,'estado_registro',1)
			next
			dw_detalle.object.t_marcar.text	= 'Marcar Todo'
		end if
	end if
end if
end event

event rowfocuschanged;if getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type dw_grupo from datawindow within w_envio_emails_marketing
integer x = 18
integer y = 16
integer width = 3099
integer height = 468
integer taborder = 10
string title = "none"
string dataobject = "dw_grupo_email_marketing"
boolean border = false
boolean livescroll = true
end type

type st_fondo from statictext within w_envio_emails_marketing
boolean visible = false
integer x = 901
integer y = 1364
integer width = 1431
integer height = 268
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_envio_emails_marketing
boolean visible = false
integer x = 937
integer y = 1552
integer width = 1371
integer height = 56
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_cuenta from statictext within w_envio_emails_marketing
boolean visible = false
integer x = 937
integer y = 1472
integer width = 1371
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 80269524
long backcolor = 80269524
string text = "none"
boolean focusrectangle = false
end type

type st_porc from statictext within w_envio_emails_marketing
boolean visible = false
integer x = 1550
integer y = 1468
integer width = 233
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
alignment alignment = center!
boolean focusrectangle = false
end type

