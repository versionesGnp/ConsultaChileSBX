forward
global type w_vista_encargados from window
end type
type cb_2 from commandbutton within w_vista_encargados
end type
type cb_1 from commandbutton within w_vista_encargados
end type
type dw_ingreso from datawindow within w_vista_encargados
end type
end forward

global type w_vista_encargados from window
integer x = 832
integer y = 360
integer width = 3314
integer height = 1652
boolean titlebar = true
string title = "Mantenedor Usuario"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_2 cb_2
cb_1 cb_1
dw_ingreso dw_ingreso
end type
global w_vista_encargados w_vista_encargados

type variables
string	is_opcion
end variables

on w_vista_encargados.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_ingreso=create dw_ingreso
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_ingreso}
end on

on w_vista_encargados.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_ingreso)
end on

event open;long		ll_new,ll_mes_fec,ll_dia_fec
Date		ld_fecha_exp
String	ls_sw='S',ls_dia_fer,ls_descrip,ls_dia_nom
gf_centrar(w_vista_encargados)
connect using Trans_1;
this.title	= 'Administrar Usuario'
is_opcion	= Message.StringParm
dw_ingreso.settransobject(sqlca)
//dw_ingreso.getchild('reclamo',idw_detalle2)
//idw_detalle2.settransobject(sqlca)
//if idw_detalle2.rowcount()=0 then
//	idw_detalle2.insertrow(0)
//end if
CHOOSE CASE is_opcion
	CASE 'N'
		ll_new	= dw_ingreso.insertrow(0)
		dw_ingreso.setfocus()
		dw_ingreso.scrolltorow(ll_new)
		dw_ingreso.setitem(ll_new,'fecha_ingreso',date(gdt_fec_sistema))
		dw_ingreso.setitem(ll_new,'solicitudes','0')
		dw_ingreso.setitem(ll_new,'cons_general','0')
		dw_ingreso.setitem(ll_new,'opera','0')
		dw_ingreso.setitem(ll_new,'digitacion','0')
		dw_ingreso.setitem(ll_new,'acceso','0')
		dw_ingreso.setitem(ll_new,'estado','A')
		dw_ingreso.setitem(ll_new,'modo','N')
		ld_fecha_exp	= RelativeDate(date(gdt_fec_sistema), 60)
		CHOOSE CASE DayName(ld_fecha_exp)
			CASE 'Saturday','Sabado'
				ld_fecha_exp	= RelativeDate(ld_fecha_exp, 2)
			CASE 'Sunday','Domingo'
				ld_fecha_exp	= RelativeDate(ld_fecha_exp, 1)		
		END CHOOSE
		
		DO WHILE ls_sw='S'
			ll_mes_fec					= Month(ld_fecha_exp)
			ll_dia_fec					= day(ld_fecha_exp)
			ls_dia_fer					= string(ll_dia_fec,"00")+string(ll_mes_fec,"00")
			SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
			INTO 		:ls_descrip  
			FROM 		"PER_DIAS_FESTIVOS"  
			WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_dia_fer   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ld_fecha_exp			= RelativeDate(ld_fecha_exp,1)
				ls_dia_nom				= UPPER(DayName(ld_fecha_exp))
				if ls_dia_nom = 'SABADO' or ls_dia_nom = 'SATURDAY' then
					ld_fecha_exp		= RelativeDate(ld_fecha_exp,2)
				elseif ls_dia_nom = 'DOMINGO' or ls_dia_nom = 'SUNDAY' then
					ld_fecha_exp		= RelativeDate(ld_fecha_exp,1)
				end if
			else
				ls_sw						= 'N'
			end if
		LOOP
		dw_ingreso.setitem(ll_new,'fecha_expiracion',ld_fecha_exp)
		dw_ingreso.accepttext()
	CASE 'M'
		if dw_ingreso.retrieve(gs_codigo)=0 then
			
			dw_ingreso.insertrow(0)
			messagebox("Advertencia","No Existe Usuario")
			cb_1.triggerevent(clicked!)
		else
			dw_ingreso.setitem(1,'modo','M')
			dw_ingreso.setcolumn('nombre')
		end if
END CHOOSE
end event

event close;disconnect using Trans_1;
end event

type cb_2 from commandbutton within w_vista_encargados
integer x = 37
integer y = 1416
integer width = 366
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;String		ls_usuario,ls_password,ls_nombre,ls_acceso,ls_depto,ls_company,&
			ls_solicitud,ls_consulta,ls_operacion,ls_digitacion,ls_string,ls_anexos,&
			ls_link
Date		ld_fecha_ingreso,ld_fecha_termino,ld_fecha_expirar
Long		ll_cont_reg,ll_row,ll_rut,ll_cod_parque,ll_depto,ll_corr_obj,ll_max_reg

ls_usuario			= dw_ingreso.getitemstring(1,'codigo_usuario')
ls_password			= dw_ingreso.getitemstring(1,'password')
ls_nombre			= dw_ingreso.getitemstring(1,'nombre')
ls_acceso			= dw_ingreso.getitemstring(1,'acceso')
ls_depto				= dw_ingreso.getitemstring(1,'depto')
ls_company			= dw_ingreso.getitemstring(1,'company')
ld_fecha_ingreso	= date(dw_ingreso.getitemdatetime(1,'fecha_ingreso'))
ld_fecha_termino	= date(dw_ingreso.getitemdatetime(1,'fecha_termino'))
ld_fecha_expirar	= date(dw_ingreso.getitemdatetime(1,'fecha_expiracion'))
ls_solicitud			= dw_ingreso.getitemstring(1,'solicitudes')
ls_consulta			= dw_ingreso.getitemstring(1,'cons_general')
ls_operacion		= dw_ingreso.getitemstring(1,'opera')
ls_digitacion			= dw_ingreso.getitemstring(1,'digitacion')
ll_rut					= dw_ingreso.getitemnumber(1,'rut')
ls_anexos			= dw_ingreso.getitemstring(1,'anexos')
ll_cod_parque		= dw_ingreso.getitemnumber(1,'cod_parque')
ls_link					= dw_ingreso.getitemstring(1,'link')
if isnull(ls_usuario) then
	messagebox("Advertencia","Falta ingresar Usuario")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('codigo_usuario')
elseif isnull(ls_password) then
	messagebox("Advertencia","Falta ingresar PassWord")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('password')
elseif isnull(ls_nombre) then
	messagebox("Advertencia","Falta ingresar Nombre")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('nombre')
elseif isnull(ls_acceso) then
	messagebox("Advertencia","Falta ingresar Acceso")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('acceso')
elseif isnull(ls_depto) then
	messagebox("Advertencia","Falta ingresar Departamento")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('depto')
elseif isnull(ls_company) then
	messagebox("Advertencia","Falta ingresar Empresa")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('company')
elseif isnull(ld_fecha_ingreso) then
	messagebox("Advertencia","Falta ingresar Fecha de Ingreso")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_ingreso')
elseif isnull(ld_fecha_expirar) then
	messagebox("Advertencia","Falta ingresar Fecha Expiración")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('fecha_expiracion')
elseif isnull(ls_link) then
	messagebox("Advertencia","Falta ingresar Link Obituario")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('link')
elseif isnull(ls_solicitud) then
	messagebox("Advertencia","Falta ingresar Estado Solicitud")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('solicitudes')
elseif isnull(ls_consulta) then
	messagebox("Advertencia","Falta ingresar Estado Consulta")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('cons_general')
elseif isnull(ls_operacion) then
	messagebox("Advertencia","Falta ingresar Estado Operaciones")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('opera')
elseif isnull(ls_digitacion) then
	messagebox("Advertencia","Falta ingresar Estado Digitación")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('digitacion')
elseif isnull(ll_rut) then
	messagebox("Advertencia","Falta ingresar Rut")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('rut')
elseif isnull(ls_anexos) then
	messagebox("Advertencia","Falta ingresar Anexo")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('anexos')
elseif isnull(ll_cod_parque) then
	messagebox("Advertencia","Falta ingresar Parque")
	dw_ingreso.setfocus()
	dw_ingreso.setcolumn('cod_parque')
else
	ld_fecha_expirar			= date(dw_ingreso.getitemdatetime(1,'fecha_expiracion'))
	CHOOSE CASE DayName(ld_fecha_expirar)
		CASE 'Saturday'
			ld_fecha_expirar	= RelativeDate(ld_fecha_expirar, 3)
		CASE 'Sunday'
			ld_fecha_expirar	= RelativeDate(ld_fecha_expirar, 2)		
	END CHOOSE
	dw_ingreso.setitem(1,'fecha_expiracion',ld_fecha_expirar)
	if dw_ingreso.update()=1 then
		commit;
		DELETE FROM "PERFIL_USUARIO"  
		WHERE 			"PERFIL_USUARIO"."USUARIO" = :ls_usuario   
		USING			sqlca;
		if sqlca.sqlcode=0 then
			commit;
		else
			rollback;
		end if
		if ls_depto='A' then	ll_depto=12
		if ls_depto='C' then	ll_depto=4
		if ls_depto='D' then	ll_depto=7
		if ls_depto='E' then	ll_depto=17
		if ls_depto='G' then	ll_depto=1
		if ls_depto='I' then		ll_depto=5
		if ls_depto='H' then	ll_depto=25
		if ls_depto='J' then	ll_depto=14
		if ls_depto='M' then	ll_depto=13
		if ls_depto='N' then	ll_depto=9
		if ls_depto='O' then	ll_depto=3
		if ls_depto='P' then	ll_depto=8
		if ls_depto='Q' then	ll_depto=10
		if ls_depto='R' then	ll_depto=15
		if ls_depto='S' then	ll_depto=16
		if ls_depto='T' then	ll_depto=2
		if ls_depto='U' then	ll_depto=11
		if ls_depto='V' then	ll_depto=6
		if ls_depto='L' then	ll_depto=18
		if ls_depto='F' then	ll_depto=19
		if ls_depto='B' then	ll_depto=20
		if ls_depto='2' then	ll_depto=1
		if ls_depto='X' then	ll_depto=22
		if ls_depto='Z' then	ll_depto=1
		
		SELECT 	MAX("PERFIL_USUARIO"."CORRELATIVO")
		INTO 		:ll_max_reg  
		FROM 		"PERFIL_USUARIO"  
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ll_max_reg) or ll_max_reg=0 then
				ll_max_reg	= 1
			else
				ll_max_reg++
			end if
		else
			ll_max_reg	= 1
		end if
		DECLARE x1 CURSOR FOR  
		SELECT	"PERFIL_OBJETO_DEPTO"."CORRELATIVO_OBJETO"  
		FROM 	"PERFIL_OBJETO_DEPTO"  
		WHERE 	"PERFIL_OBJETO_DEPTO"."CODIGO_DEPTO" = :ll_depto   
		USING	Trans_1;
		open x1;
		DO WHILE Trans_1.sqlcode=0
			fetch x1 into :ll_corr_obj;
			if ll_corr_obj>0 and not isnull(ll_corr_obj) then
				INSERT INTO "PERFIL_USUARIO"  
							( "CORRELATIVO",	"USUARIO",		"CORRELATIVO_OBJETO" )  
				VALUES 	( :ll_max_reg,		:ls_usuario,	:ll_corr_obj )  
				USING		sqlca;
				if sqlca.sqlcode=0 then
					commit;
					ll_max_reg ++
				else
					rollback;
				end if
			end if
			setnull(ll_corr_obj)
		LOOP
		close x1;
		if ls_usuario = gs_user AND ls_password=gs_clave then
			SELECT	"ENCARGADOS"."ACCESO",	"ENCARGADOS"."NOMBRE",	"ENCARGADOS"."OPERA",	"ENCARGADOS"."SOLICITUDES","ENCARGADOS"."FECHA_TERMINO",	"ENCARGADOS"."DEPTO"	,	"ENCARGADOS"."CONS_GENERAL", "ENCARGADOS"."PERSONAL_INTERNO",	"ENCARGADOS"."DIGITACION"
			INTO 		:gs_acceso,					:gs_nombre_usuario,		:gs_opera,					:gs_solicitudes,				:gd_fec_termino,					:gs_depto,					:gs_cons_general				, :gs_personal_interno,					:gs_digita
			FROM 	"ENCARGADOS"  
			WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user and
						"ENCARGADOS"."PASSWORD" = :gs_clave
			USING	sqlca;    
		end if
		if isvalid(w_encargados) then 
			w_encargados.dw_1.retrieve()
		end if
		if isvalid(w_perfil_usuario) then 
			w_perfil_usuario.dw_encargados.retrieve()
			w_perfil_usuario.dw_lista_obj.getchild('perfil_usuario_correlativo_objeto',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.rowcount()=0 then
				idw_detalle.insertrow(0)
			end if
			w_perfil_usuario.dw_lista_obj.retrieve(ls_usuario)
			w_perfil_usuario.dw_lista_obj.object.t_titulo.text='Objetos Inabilitados para Usuario: '+ls_usuario
			//w_perfil_usuario.dw_lista_obj.retrieve(ls_usuario)
			if is_opcion='N' then
				w_perfil_usuario.em_usuario.text	= ''
				w_perfil_usuario.em_usuario.text	= ls_usuario
			end if
			w_perfil_usuario.em_usuario.enabled	= true
//			if is_opcion='N' then w_perfil_usuario.em_usuario.enabled	= false
			if trim(w_perfil_usuario.em_usuario.text)<>'' then
				ls_string	= "codigo_usuario='"+trim(w_perfil_usuario.em_usuario.text)+"'"
				ll_row 		= w_perfil_usuario.dw_encargados.Find(ls_string, 1, w_perfil_usuario.dw_encargados.RowCount() )
				IF ll_row > 0 THEN
					w_perfil_usuario.dw_encargados.ScrollToRow( ll_row )
					w_perfil_usuario.dw_encargados.SelectRow(0, FALSE)
					w_perfil_usuario.dw_encargados.SelectRow(ll_row, TRUE)
				ELSE
					MessageBox("Advertencia", "Usuario Inexistente")
				END IF
			end if
		end if
		messagebox("Grabar","Grabación Exitosa")
	else
		rollback;
		MessageBox("Error Grabar","DataBase Error SQL: "+sqlca.sqlerrtext,INFORMATION!)
	END IF
	close(w_vista_encargados)	
	if isvalid(w_encargados) then close(w_encargados)
end if
end event

type cb_1 from commandbutton within w_vista_encargados
integer x = 2889
integer y = 1416
integer width = 366
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_vista_encargados)
end event

type dw_ingreso from datawindow within w_vista_encargados
integer x = 37
integer y = 32
integer width = 3255
integer height = 1348
integer taborder = 10
string dataobject = "dw_mantenedor_por_usuario"
boolean border = false
boolean livescroll = true
end type

event clicked;string	ls_columna,ls_fecha,ls_codigo,ls_clave,ls_estado

ls_columna	= dwo.name
ls_codigo	= dw_ingreso.getitemstring(1,'codigo_usuario')
ls_clave		= dw_ingreso.getitemstring(1,'password')
ls_estado	= dw_ingreso.getitemstring(1,'estado')

if not isnull(ls_codigo) and not isnull(ls_clave) and ls_estado='A' then
	CHOOSE CASE ls_columna
		CASE 'p_1' //fecha_ingreso
			ls_fecha					= string(date(dw_ingreso.getitemdatetime(1,'fecha_ingreso')))
			if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso.setitem(1,'fecha_ingreso',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso.setitem(1,'fecha_ingreso',date(ls_fecha))
			END IF
			dw_ingreso.setcolumn('fecha_ingreso')
			
		CASE 'p_2' //fecha_termino
			ls_fecha					= string(date(dw_ingreso.getitemdatetime(1,'fecha_termino')))
			if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso.setitem(1,'fecha_termino',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso.setitem(1,'fecha_termino',date(ls_fecha))
			END IF
			dw_ingreso.setcolumn('fecha_termino')
			
		CASE 'p_3' //fecha_expiracion
			ls_fecha					= string(date(dw_ingreso.getitemdatetime(1,'fecha_expiracion')))
			if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_ingreso.setitem(1,'fecha_expiracion',datetime(string(date(gdt_fec_sistema),"dd/mm/yyyy")))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_ingreso.setitem(1,'fecha_expiracion',date(ls_fecha))
			END IF
			dw_ingreso.setcolumn('fecha_expiracion')
			
	END CHOOSE
end if
end event

event itemchanged;string		ls_columna,ls_codigo,ls_estado,ls_sw='S',ls_dia_fer,ls_descrip,ls_dia_nom
Long		ll_new,ll_mes_fec,ll_dia_fec
Date		ld_fecha_exp,ld_fecha

this.accepttext()
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'codigo_usuario'
		ls_codigo	= this.getitemstring(1,'codigo_usuario')
		SELECT	"ENCARGADOS"."ESTADO"  
		INTO 		:ls_estado  
		FROM 		"ENCARGADOS"  
		WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :ls_codigo   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ls_estado='I' then
				messagebox("Advertencia",'Usuario Existente "Estado : INACTIVO"')
			else
				messagebox("Advertencia","Usuario Existente")
			end if
			dw_ingreso.reset()
			ll_new	= dw_ingreso.insertrow(0)
			dw_ingreso.setfocus()
			dw_ingreso.scrolltorow(ll_new)
			dw_ingreso.setitem(ll_new,'fecha_ingreso',date(gdt_fec_sistema))
			dw_ingreso.setitem(ll_new,'solicitudes','0')
			dw_ingreso.setitem(ll_new,'cons_general','0')
			dw_ingreso.setitem(ll_new,'opera','0')
			dw_ingreso.setitem(ll_new,'digitacion','0')
			dw_ingreso.setitem(ll_new,'acceso','0')
			dw_ingreso.setitem(ll_new,'estado','A')
			dw_ingreso.setitem(ll_new,'modo','N')
			dw_ingreso.setitem(ll_new,'fecha_expiracion',RelativeDate(date(gdt_fec_sistema), 60))
			dw_ingreso.accepttext()
			dw_ingreso.setfocus()
			dw_ingreso.setcolumn('codigo_usuario')
		end if

	CASE 'fecha_expiracion'
		ld_fecha			= date(dw_ingreso.getitemdatetime(1,'fecha_expiracion'))
		ld_fecha_exp	= RelativeDate(ld_fecha, 60)
		CHOOSE CASE DayName(ld_fecha_exp)
			CASE 'Saturday'
				ld_fecha_exp	= RelativeDate(ld_fecha_exp, 2)
			CASE 'Sunday'
				ld_fecha_exp	= RelativeDate(ld_fecha_exp, 1)		
		END CHOOSE
		DO WHILE ls_sw='S'
			ll_mes_fec					= Month(ld_fecha_exp)
			ll_dia_fec					= day(ld_fecha_exp)
			ls_dia_fer					= string(ll_dia_fec,"00")+string(ll_mes_fec,"00")
			SELECT	"PER_DIAS_FESTIVOS"."DESCRIPCION"  
			INTO 		:ls_descrip  
			FROM 		"PER_DIAS_FESTIVOS"  
			WHERE 	"PER_DIAS_FESTIVOS"."FECHA" = :ls_dia_fer   
			USING		sqlca;
			if sqlca.sqlcode=0 then
				ld_fecha_exp			= RelativeDate(ld_fecha_exp,1)
				ls_dia_nom				= UPPER(DayName(ld_fecha_exp))
				if ls_dia_nom = 'SABADO' or ls_dia_nom = 'SATURDAY' then
					ld_fecha_exp		= RelativeDate(ld_fecha_exp,2)
				elseif ls_dia_nom = 'DOMINGO' or ls_dia_nom = 'SUNDAY' then
					ld_fecha_exp		= RelativeDate(ld_fecha_exp,1)
				end if
			else
				ls_sw						= 'N'
			end if
		LOOP
		dw_ingreso.setitem(1,'fecha_expiracion',ld_fecha_exp)

END CHOOSE
//ll_cod_parque	= dw_ingreso.getitemnumber(1,'cod_parque')
//ls_depto			= dw_ingreso.getitemstring(1,'depto')
//if not isnull(ls_depto) and ll_cod_parque>0 then idw_detalle2.retrieve(ls_depto,ll_cod_parque)
end event

