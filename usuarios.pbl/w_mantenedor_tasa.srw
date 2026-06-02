forward
global type w_mantenedor_tasa from window
end type
type cb_limpiar from commandbutton within w_mantenedor_tasa
end type
type cb_cerrar from commandbutton within w_mantenedor_tasa
end type
type cb_buscar from commandbutton within w_mantenedor_tasa
end type
type cb_grabar from commandbutton within w_mantenedor_tasa
end type
type cb_nuevo from commandbutton within w_mantenedor_tasa
end type
type dw_lista from datawindow within w_mantenedor_tasa
end type
end forward

global type w_mantenedor_tasa from window
integer width = 1568
integer height = 1340
boolean titlebar = true
string title = "Mantenedor de Tasa"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_limpiar cb_limpiar
cb_cerrar cb_cerrar
cb_buscar cb_buscar
cb_grabar cb_grabar
cb_nuevo cb_nuevo
dw_lista dw_lista
end type
global w_mantenedor_tasa w_mantenedor_tasa

type variables
Date		id_fecha_dia
end variables

on w_mantenedor_tasa.create
this.cb_limpiar=create cb_limpiar
this.cb_cerrar=create cb_cerrar
this.cb_buscar=create cb_buscar
this.cb_grabar=create cb_grabar
this.cb_nuevo=create cb_nuevo
this.dw_lista=create dw_lista
this.Control[]={this.cb_limpiar,&
this.cb_cerrar,&
this.cb_buscar,&
this.cb_grabar,&
this.cb_nuevo,&
this.dw_lista}
end on

on w_mantenedor_tasa.destroy
destroy(this.cb_limpiar)
destroy(this.cb_cerrar)
destroy(this.cb_buscar)
destroy(this.cb_grabar)
destroy(this.cb_nuevo)
destroy(this.dw_lista)
end on

event open;Date		ldt_fecha_max
gf_centrar(w_mantenedor_tasa)
dw_lista.settransobject(sqlca)
id_fecha_dia		= date(gdt_fec_sistema)
dw_lista.insertrow(0)
SELECT 	MAX("LOG_TASA"."FECHA"  )
INTO 		:ldt_fecha_max  
FROM 	"LOG_TASA"  
WHERE 	"LOG_TASA"."ESTADO_REG" = 'A'  
USING	sqlca;
if sqlca.sqlcode=0 then
	if dw_lista.retrieve(ldt_fecha_max)=0 then
		dw_lista.reset()
		dw_lista.insertrow(0)
		messagebox("Advertencia","No registra TASA Vigente")
	end if
end if
end event

type cb_limpiar from commandbutton within w_mantenedor_tasa
integer x = 901
integer y = 1068
integer width = 247
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpiar"
end type

event clicked;dw_lista.reset()
dw_lista.insertrow(0)
end event

type cb_cerrar from commandbutton within w_mantenedor_tasa
integer x = 1207
integer y = 1068
integer width = 247
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_mantenedor_tasa)
end event

type cb_buscar from commandbutton within w_mantenedor_tasa
integer x = 590
integer y = 1068
integer width = 247
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;if isvalid(w_buscar_lista_tasas) then close(w_buscar_lista_tasas)
open(w_buscar_lista_tasas)
end event

type cb_grabar from commandbutton within w_mantenedor_tasa
integer x = 325
integer y = 1068
integer width = 247
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar"
end type

event clicked;datetime		ldt_fecha
Double		ldb_tasa,ldb_tasa_peso

ldt_fecha			= dw_lista.getitemdatetime(1,'fecha')
ldb_tasa			= dw_lista.getitemnumber(1,'tasa')
ldb_tasa_peso	= dw_lista.getitemnumber(1,'tasa_peso')
if isnull( ldt_fecha ) then
	messagebox("Advertencia","Debe Ingresar Fecha")
	dw_lista.setfocus()
	dw_lista.setcolumn('fecha')
elseif isnull( ldb_tasa ) or ldb_tasa = 0 then
	messagebox("Advertencia","Debe Ingresar Tasa")
	dw_lista.setfocus()
	dw_lista.setcolumn('tasa')
elseif isnull( ldb_tasa_peso ) or ldb_tasa_peso = 0 then
	messagebox("Advertencia","Debe Ingresar Tasa Peso")
	dw_lista.setfocus()
	dw_lista.setcolumn('tasa_peso')
else
	dw_lista.setitem(1,'estado_reg','A')
	dw_lista.setitem(1,'usuario',gs_user)
	if dw_lista.update() = 1 then
		commit;
		UPDATE 	"LOG_TASA"  
		SET 		"ESTADO_REG" = 'I'  
		WHERE	"LOG_TASA"."FECHA" <> :ldt_fecha  
		USING	sqlca;
		if sqlca.sqlcode=0 then
			commit;
			UPDATE 	"TASA"  
			SET 		"TASA_INT_UF" = :ldb_tasa,   
						"TASA_INT_P" = :ldb_tasa_peso 
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
				cb_limpiar.triggerevent(clicked!)
			else
				rollback;
				messagebox("Error Grabar","Error al Actualizar TASA SQL: "+sqlca.sqlerrtext)
			end if
		else
			rollback;
			messagebox("Error Grabar","Error al Actualizar LOG_TASA SQL: "+sqlca.sqlerrtext)
		end if
		
	else
		rollback;
		messagebox("Error Grabar","Error al Grabar LOG_TASA SQL: "+sqlca.sqlerrtext)
	end if
end if
end event

type cb_nuevo from commandbutton within w_mantenedor_tasa
integer x = 59
integer y = 1068
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Nuevo"
end type

event clicked;Long		ll_new
String		ls_fecha
Date		ldt_fecha

dw_lista.reset()
ll_new		= dw_lista.insertrow(0)
dw_lista.setitem(ll_new,'usuario',gs_user)
dw_lista.setitem(ll_new,'estado_reg','A')
ls_fecha		= string(date(gdt_fec_sistema),'dd/mm/yyyy')
ls_fecha		= '15'+mid(ls_fecha,3)
ldt_fecha		= date(ls_fecha)
dw_lista.setitem(1,'fecha',ldt_fecha)
dw_lista.accepttext()
end event

type dw_lista from datawindow within w_mantenedor_tasa
integer x = 64
integer y = 56
integer width = 1399
integer height = 968
integer taborder = 10
string title = "none"
string dataobject = "dw_mantenedor_tasa"
boolean border = false
boolean livescroll = true
end type

event clicked;String		ls_columna,ls_fecha,ls_estado_reg,ls_estado_reg_ret,ls_descrip
Datetime	ldt_fecha
Double	ldb_tasa,ldt_tasa_ret,ldt_tasa_peso_ret
Long		ll_res

dw_lista.accepttext()
ls_columna		= dwo.name
ls_estado_reg	= dw_lista.getitemstring(1,'estado_reg')
if ls_estado_reg = 'A' then
	CHOOSE CASE ls_columna
		CASE 'p_1'
			ls_fecha					= string(date(dw_lista.getitemdatetime(1,'fecha')))
			if isnull(ls_fecha) then ls_fecha = string(id_fecha_dia,"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_lista.setitem(1,'fecha',datetime(string(id_fecha_dia,gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
			IF not isnull(Message.StringParm) THEN
				ls_fecha				= trim(Message.StringParm)
				dw_lista.setitem(1,'fecha',date(ls_fecha))
			END IF
			dw_lista.setfocus()
			dw_lista.setcolumn('fecha')
			dw_lista.accepttext()
			ldt_fecha			= dw_lista.getitemdatetime(1,'fecha')
			ldb_tasa			= dw_lista.getitemnumber(1,'tasa')
			if not isnull(ldt_fecha) then		// and (isnull(ldb_tasa) or ldb_tasa=0)
				SELECT	"LOG_TASA"."ESTADO_REG", 	"LOG_TASA"."TASA",		  	"LOG_TASA"."TASA_PESO"
				INTO 		:ls_estado_reg_ret,   					:ldt_tasa_ret,   				:ldt_tasa_peso_ret
				FROM 	"LOG_TASA"  
				WHERE 	"LOG_TASA"."FECHA" = :ldt_fecha 
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if isnull(ldt_tasa_ret) then ldt_tasa_ret=0
					if isnull(ldt_tasa_peso_ret) then ldt_tasa_peso_ret=0
					if ls_estado_reg_ret = 'I' then
						ls_descrip		= 'Inactivo'
					else
						ls_descrip		= 'Activo'
					end if
					ll_res					= messagebox("Advertencia","Fecha Ingresada Registra TASA UF: "+string(ldt_tasa_ret,'###,###,##0.0#') +' / TASA Peso '+ string(ldt_tasa_peso_ret,'###,###,##0.0#') +' está en Estado '+ls_estado_reg_ret+'-'+ls_descrip+ ', desea Mostrar Datos',Exclamation!,YesNo!,2)
					if ll_res = 1 then
						dw_lista.retrieve(date(ldt_fecha))
					else
						cb_limpiar.triggerevent(clicked!)
					end if
				end if
			end if
	END CHOOSE
end if
end event

event itemchanged;String		ls_columna,ls_estado_reg_ret,ls_descrip
datetime	ldt_fecha
Double	ldb_tasa,ldt_tasa_ret,ldt_tasa_peso_ret
Long		ll_res

dw_lista.accepttext()
ls_columna			= dwo.name
if ls_columna='fecha' then
	ldt_fecha			= dw_lista.getitemdatetime(1,'fecha')
	ldb_tasa			= dw_lista.getitemnumber(1,'tasa')
	if not isnull(ldt_fecha) then		//and (isnull(ldb_tasa) or ldb_tasa=0) 
		
		SELECT	"LOG_TASA"."ESTADO_REG", 	"LOG_TASA"."TASA",		  	"LOG_TASA"."TASA_PESO"
		INTO 		:ls_estado_reg_ret,   					:ldt_tasa_ret,   				:ldt_tasa_peso_ret
		FROM 	"LOG_TASA"  
		WHERE 	"LOG_TASA"."FECHA" = :ldt_fecha 
		USING	sqlca;
		if sqlca.sqlcode=0 then
			if isnull(ldt_tasa_ret) then ldt_tasa_ret=0
			if isnull(ldt_tasa_peso_ret) then ldt_tasa_peso_ret=0
			if ls_estado_reg_ret = 'I' then
				ls_descrip		= 'Inactivo'
			else
				ls_descrip		= 'Activo'
			end if
			ll_res					= messagebox("Advertencia","Fecha Ingresada Registra TASA UF: "+string(ldt_tasa_ret,'###,###,##0.0#') +' / TASA Peso '+ string(ldt_tasa_peso_ret,'###,###,##0.0#') +' está en Estado '+ls_estado_reg_ret+'-'+ls_descrip+ ', desea Mostrar Datos',Exclamation!,YesNo!,2)
			if ll_res = 1 then
				dw_lista.retrieve(date(ldt_fecha))
			else
				cb_limpiar.triggerevent(clicked!)
			end if
		end if
	end if
end if
end event

