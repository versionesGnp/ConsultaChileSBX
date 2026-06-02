forward
global type w_cotizaciones from window
end type
type rb_concepcion from radiobutton within w_cotizaciones
end type
type rb_santiago from radiobutton within w_cotizaciones
end type
type st_help from statictext within w_cotizaciones
end type
type pb_autoriza from picturebutton within w_cotizaciones
end type
type cb_buscar from commandbutton within w_cotizaciones
end type
type cb_imprimir from commandbutton within w_cotizaciones
end type
type cb_limpiar from commandbutton within w_cotizaciones
end type
type cb_guardar from commandbutton within w_cotizaciones
end type
type rb_foresta from radiobutton within w_cotizaciones
end type
type rb_manantial from radiobutton within w_cotizaciones
end type
type rb_prado from radiobutton within w_cotizaciones
end type
type cb_cerrar from commandbutton within w_cotizaciones
end type
type dw_ingreso_cotizacion from datawindow within w_cotizaciones
end type
end forward

global type w_cotizaciones from window
integer width = 3543
integer height = 2860
boolean titlebar = true
string title = "Cotización"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
rb_concepcion rb_concepcion
rb_santiago rb_santiago
st_help st_help
pb_autoriza pb_autoriza
cb_buscar cb_buscar
cb_imprimir cb_imprimir
cb_limpiar cb_limpiar
cb_guardar cb_guardar
rb_foresta rb_foresta
rb_manantial rb_manantial
rb_prado rb_prado
cb_cerrar cb_cerrar
dw_ingreso_cotizacion dw_ingreso_cotizacion
end type
global w_cotizaciones w_cotizaciones

type variables
Long	il_cta_max_plazo
datawindowchild idw_detalle5  
end variables

on w_cotizaciones.create
this.rb_concepcion=create rb_concepcion
this.rb_santiago=create rb_santiago
this.st_help=create st_help
this.pb_autoriza=create pb_autoriza
this.cb_buscar=create cb_buscar
this.cb_imprimir=create cb_imprimir
this.cb_limpiar=create cb_limpiar
this.cb_guardar=create cb_guardar
this.rb_foresta=create rb_foresta
this.rb_manantial=create rb_manantial
this.rb_prado=create rb_prado
this.cb_cerrar=create cb_cerrar
this.dw_ingreso_cotizacion=create dw_ingreso_cotizacion
this.Control[]={this.rb_concepcion,&
this.rb_santiago,&
this.st_help,&
this.pb_autoriza,&
this.cb_buscar,&
this.cb_imprimir,&
this.cb_limpiar,&
this.cb_guardar,&
this.rb_foresta,&
this.rb_manantial,&
this.rb_prado,&
this.cb_cerrar,&
this.dw_ingreso_cotizacion}
end on

on w_cotizaciones.destroy
destroy(this.rb_concepcion)
destroy(this.rb_santiago)
destroy(this.st_help)
destroy(this.pb_autoriza)
destroy(this.cb_buscar)
destroy(this.cb_imprimir)
destroy(this.cb_limpiar)
destroy(this.cb_guardar)
destroy(this.rb_foresta)
destroy(this.rb_manantial)
destroy(this.rb_prado)
destroy(this.cb_cerrar)
destroy(this.dw_ingreso_cotizacion)
end on

event open;Long		ll_new,ll_cod_parque,ll_cod_parque_sup
Double	ldb_valor_uf_dia
datetime	ldt_fecha_hoy
String	ls_canal_sup,ls_fono,ls_celular,ls_email  

dw_ingreso_cotizacion.setitem(1,'dscto_uso_anticipado',0)
ldt_fecha_hoy					= datetime(date(gdt_fec_sistema),time('00:00:00'))
gf_centrar(w_cotizaciones)
if gs_conexion	= "Parque El Prado" then
	ll_cod_parque				= 1
	rb_foresta.enabled		= false
	rb_prado.checked			= true
	rb_prado.enabled			= true
	rb_manantial.enabled		= true
	rb_santiago.enabled		= true
	rb_concepcion.enabled	= false
elseif gs_conexion = "Parque La Foresta" then
	ll_cod_parque				= 11
	rb_foresta.enabled		= true
	rb_foresta.checked		= true
	rb_prado.enabled			= false
	rb_manantial.enabled		= false
	rb_santiago.enabled		= false
	rb_concepcion.enabled	= false
elseif gs_conexion = "Parque Concepción" then
	ll_cod_parque				= 801
	rb_foresta.enabled		= false
	rb_prado.enabled			= false
	rb_manantial.enabled		= false
	rb_santiago.enabled		= false
	rb_concepcion.enabled	= true
	rb_concepcion.checked	= true
end if
pb_autoriza.enabled 			= false
dw_ingreso_cotizacion.settransobject(sqlca)
dw_ingreso_cotizacion.getchild('sector',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.retrieve(ll_cod_parque)
dw_ingreso_cotizacion.getchild('capacidad',idw_detalle2)
idw_detalle2.settransobject(sqlca)
idw_detalle2.insertrow(0)
dw_ingreso_cotizacion.getchild('tipo_sepultura',idw_detalle3)
idw_detalle3.settransobject(sqlca)
idw_detalle3.insertrow(0)
dw_ingreso_cotizacion.getchild('uso',idw_detalle4)
idw_detalle4.settransobject(sqlca)
idw_detalle4.insertrow(0)
dw_ingreso_cotizacion.getchild('numero_reducciones',idw_detalle5)
idw_detalle5.settransobject(sqlca)
idw_detalle5.insertrow(0)
SELECT	MAX("INTERES_CUOTAS"."NRO_CUOTAS")
INTO 		:il_cta_max_plazo  
FROM 		"INTERES_CUOTAS"  ;
cb_imprimir.enabled	= false
ll_new					= dw_ingreso_cotizacion.insertrow(0)
SELECT	"TAB_UF"."VALOR_UF"  
INTO 		:ldb_valor_uf_dia  
FROM 		"TAB_UF"  
WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
USING		sqlca;
if sqlca.sqlcode=0 then
	dw_ingreso_cotizacion.setitem(ll_new,'uf_dia',ldb_valor_uf_dia)
end if
st_help.visible					= false
dw_ingreso_cotizacion.setitem(ll_new,'cod_parque',ll_cod_parque)
dw_ingreso_cotizacion.setitem(ll_new,'moneda','2')
dw_ingreso_cotizacion.setitem(ll_new,'cod_ejecutivo',gs_user)
dw_ingreso_cotizacion.setitem(ll_new,'fecha',ldt_fecha_hoy)

SELECT	"SUPERVISOR"."COD_PARQUE",   
			"SUPERVISOR"."CANAL"  
INTO 		:ll_cod_parque_sup,   
			:ls_canal_sup  
FROM 		"SUPERVISOR"  
WHERE	 ( "SUPERVISOR"."COD_SUP" = :gs_user ) AND  
		 ( "SUPERVISOR"."ESTADO" = 'A' )   
USING		sqlca;
if sqlca.sqlcode=0 then
	pb_autoriza.enabled = true
	SELECT	"ENCARGADOS"."FONO",	"ENCARGADOS"."CELULAR",	"ENCARGADOS"."EMAIL"  
	INTO 		:ls_fono,   			:ls_celular,				:ls_email  
	FROM 		"ENCARGADOS"  
	WHERE 	"ENCARGADOS"."CODIGO_USUARIO" = :gs_user   
	USING		sqlca;
	if sqlca.sqlcode=0 then
		dw_ingreso_cotizacion.setitem(ll_new,'fono_ejecutivo',ls_fono)
		dw_ingreso_cotizacion.setitem(ll_new,'celular_ejecutivo',ls_celular)
		dw_ingreso_cotizacion.setitem(ll_new,'mail',ls_email)
	end if	
	if ls_canal_sup='NF' then
		if ll_cod_parque_sup=1 then
			rb_prado.enabled			= true
			rb_prado.checked			= true
			rb_manantial.enabled		= false
			rb_manantial.checked		= false
			rb_foresta.enabled		= false
			rb_foresta.checked		= false
			rb_santiago.checked		= false
			rb_santiago.enabled		= false
			rb_concepcion.checked	= false
			rb_concepcion.enabled	= false
			ll_cod_parque				= 1
		elseif ll_cod_parque_sup=102 then
			rb_prado.enabled			= false
			rb_prado.checked			= false
			rb_manantial.enabled		= true
			rb_manantial.checked		= true
			rb_foresta.enabled		= false
			rb_foresta.checked		= false
			rb_santiago.checked		= false
			rb_santiago.enabled		= false
			rb_concepcion.checked	= false
			rb_concepcion.enabled	= false
			ll_cod_parque				= 102
		elseif ll_cod_parque_sup=103 then
			rb_prado.enabled			= false
			rb_prado.checked			= false
			rb_manantial.enabled		= false
			rb_manantial.checked		= false
			rb_foresta.enabled		= false
			rb_foresta.checked		= false
			rb_santiago.checked		= true
			rb_santiago.enabled		= true
			rb_concepcion.checked	= false
			rb_concepcion.enabled	= false
			ll_cod_parque				= 103
		elseif ll_cod_parque_sup=11 then
			rb_prado.enabled			= false
			rb_prado.checked			= false
			rb_manantial.enabled		= false
			rb_manantial.checked		= false
			rb_foresta.enabled		= true
			rb_foresta.checked		= true
			rb_santiago.checked		= false
			rb_santiago.enabled		= false
			rb_concepcion.checked	= false
			rb_concepcion.enabled	= false
			ll_cod_parque				= 11
		elseif ll_cod_parque_sup=801 then
			rb_prado.enabled			= false
			rb_prado.checked			= false
			rb_manantial.enabled		= false
			rb_manantial.checked		= false
			rb_foresta.enabled		= false
			rb_foresta.checked		= false
			rb_santiago.checked		= false
			rb_santiago.enabled		= false
			rb_concepcion.checked	= true
			rb_concepcion.enabled	= true
			ll_cod_parque				= 801
		end if
	end if
end if
gs_ventana	= 'w_cotizaciones'
f_valida_objeto2()
dw_ingreso_cotizacion.accepttext()
end event

event mousemove;st_help.visible	= false
end event

type rb_concepcion from radiobutton within w_cotizaciones
event ue_mousemove pbm_mousemove
integer x = 2734
integer y = 40
integer width = 535
integer height = 96
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Concepción"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;Long		ll_nulo
String	ls_nulo
Setnull(ll_nulo);setnull(ls_nulo)
if this.checked=true then
	dw_ingreso_cotizacion.setitem(1,'cod_parque',801)
	dw_ingreso_cotizacion.accepttext()
	idw_detalle.retrieve(801)
	dw_ingreso_cotizacion.setitem(1,'capacidad',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'tipo_sepultura',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'uso',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'dscto_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_nf',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_cuota',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_mantencion_anual',ll_nulo)
end if
end event

type rb_santiago from radiobutton within w_cotizaciones
event ue_mousemove pbm_mousemove
integer x = 2286
integer y = 40
integer width = 434
integer height = 96
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Santiago"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;Long		ll_nulo
String	ls_nulo
Setnull(ll_nulo);setnull(ls_nulo)
if this.checked=true then
	dw_ingreso_cotizacion.setitem(1,'cod_parque',103)
	dw_ingreso_cotizacion.accepttext()
	idw_detalle.retrieve(103)
	dw_ingreso_cotizacion.setitem(1,'capacidad',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'tipo_sepultura',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'uso',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'dscto_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_nf',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_cuota',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_mantencion_anual',ll_nulo)
end if
end event

type st_help from statictext within w_cotizaciones
event ue_mousemove pbm_mousemove
integer x = 3109
integer y = 176
integer width = 398
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long backcolor = 15793151
string text = "Autorizar Parque"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_mousemove;st_help.visible	= false
end event

type pb_autoriza from picturebutton within w_cotizaciones
event ue_mousemove pbm_mousemove
integer x = 3301
integer y = 24
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
string picturename = "Aclaraciones (o).BMP"
string disabledname = "Aclaraciones (o) off.bmp"
alignment htextalign = left!
end type

event ue_mousemove;st_help.visible	= true
end event

event clicked;if isvalid(w_logon_autoriza_cotizacion) then close(w_logon_autoriza_cotizacion)
open(w_logon_autoriza_cotizacion)
end event

type cb_buscar from commandbutton within w_cotizaciones
integer x = 1307
integer y = 2604
integer width = 512
integer height = 108
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar Cotización"
end type

event clicked;if isvalid(w_busca_cotizaciones) then close(w_busca_cotizaciones)
open(w_busca_cotizaciones)
end event

type cb_imprimir from commandbutton within w_cotizaciones
integer x = 2085
integer y = 2604
integer width = 370
integer height = 108
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimir"
end type

event clicked;if dw_ingreso_cotizacion.getitemstring(1,'nombre_cotizante')<>'' and &
	not isnull(dw_ingreso_cotizacion.getitemstring(1,'nombre_cotizante')) then
	dw_ingreso_cotizacion.object.cod_parque.visible	= true
	dw_ingreso_cotizacion.Modify("DataWindow.Header.Height=440")
	dw_ingreso_cotizacion.Modify("DataWindow.Datail.Height=3352")
	f_Print( dw_ingreso_cotizacion )
	dw_ingreso_cotizacion.Modify("DataWindow.Header.Height=0")
	dw_ingreso_cotizacion.Modify("DataWindow.Datail.Height=2524")
	dw_ingreso_cotizacion.object.cod_parque.visible	= false
end if
end event

type cb_limpiar from commandbutton within w_cotizaciones
integer x = 672
integer y = 2604
integer width = 370
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;Long		ll_resp
string	ls_tabpage
Double	ldb_valor_uf_dia
Datetime	ldt_fecha_hoy

ll_resp				= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	dw_ingreso_cotizacion.reset()
	dw_ingreso_cotizacion.InsertRow(0)
	ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
	dw_ingreso_cotizacion.setitem(1,'fecha',ldt_fecha_hoy)
	dw_ingreso_cotizacion.setitem(1,'cod_ejecutivo',gs_user)
	if rb_prado.checked=true then
		dw_ingreso_cotizacion.setitem(1,'cod_parque',1)
	elseif rb_manantial.checked=true then
		dw_ingreso_cotizacion.setitem(1,'cod_parque',102)
	elseif rb_foresta.checked=true then
		dw_ingreso_cotizacion.setitem(1,'cod_parque',11)
	elseif rb_santiago.checked=true then
		dw_ingreso_cotizacion.setitem(1,'cod_parque',103)
	elseif rb_concepcion.checked=true then
		dw_ingreso_cotizacion.setitem(1,'cod_parque',801)
	end if
	dw_ingreso_cotizacion.setitem(1,'moneda','2')
	cb_imprimir.enabled	= false
	SELECT	"TAB_UF"."VALOR_UF"  
	INTO 		:ldb_valor_uf_dia  
	FROM 	"TAB_UF"  
	WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
	USING	sqlca;
	if sqlca.sqlcode=0 then
		dw_ingreso_cotizacion.setitem(1,'uf_dia',ldb_valor_uf_dia)
	end if
end if
dw_ingreso_cotizacion.setcolumn('nombre_cotizante')

end event

type cb_guardar from commandbutton within w_cotizaciones
integer x = 37
integer y = 2604
integer width = 370
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string ls_sw='S',ls_nombre_cotizante,ls_ap_pat_cotizante,ls_ap_mat_cotizante,ls_dv,ls_fono_cotizante,ls_moneda,ls_sector, &
		 ls_tipo_sepultura,ls_fono_ejecutivo
long		 ll_rut,ll_capacidad, ret,ll_count,ll_correlativo_int,ll_resp
datetime ldt_fecha

ls_nombre_cotizante	= dw_ingreso_cotizacion.GetItemString(1,'nombre_cotizante')
ls_ap_pat_cotizante	= dw_ingreso_cotizacion.GetItemString(1,'ap_paterno_cotizante')
ls_ap_mat_cotizante	= dw_ingreso_cotizacion.GetItemString(1,'ap_materno_cotizante')
ll_rut					= dw_ingreso_cotizacion.GetItemNumber(1,'rut_cotizante')
ls_dv						= dw_ingreso_cotizacion.GetItemString(1,'dv_cotizante')
ls_fono_cotizante		= dw_ingreso_cotizacion.GetItemString(1,'fono_cotizante')
ls_moneda				= dw_ingreso_cotizacion.GetItemString(1,'moneda')
ls_sector				= dw_ingreso_cotizacion.GetItemString(1,'sector')
ll_capacidad			= dw_ingreso_cotizacion.GetItemNumber(1,'capacidad')
ls_tipo_sepultura		= dw_ingreso_cotizacion.GetItemString(1,'tipo_sepultura')
ls_fono_ejecutivo		= dw_ingreso_cotizacion.GetItemString(1,'fono_ejecutivo')
ldt_fecha				= dw_ingreso_cotizacion.GetItemDatetime(1,'fecha')


if isnull(ls_nombre_cotizante) or ls_nombre_cotizante='' then
	messagebox('Advertencia','Debe Ingresar NOMBRE COTIZANTE')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('nombre_cotizante')
	ls_sw		= 'N'
	
elseif isnull(ldt_fecha) then
	messagebox('Advertencia','Debe Ingresar FECHA DE COTIZACIÓN')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('fecha')
	ls_sw		= 'N'
	
elseif isnull(ls_ap_pat_cotizante) or ls_ap_pat_cotizante='' then
	messagebox('Advertencia','Debe Ingresar APELLIDO PATERNO COTIZANTE')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('ap_paterno_cotizante')
	ls_sw		= 'N'
	
elseif isnull(ls_ap_mat_cotizante) or ls_ap_mat_cotizante='' then
	messagebox('Advertencia','Debe Ingresar APELLIDO MATERNO COTIZANTE')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('ap_materno_cotizante')
	ls_sw		= 'N'
	
elseif isnull(ll_rut) or ll_rut=0 then
	messagebox('Advertencia','Debe Ingresar RUT COTIZANTE')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('rut_cotizante')
	ls_sw		= 'N'

elseif isnull(ls_dv) or ls_dv='' then
	messagebox('Advertencia','Debe Ingresar DIGITO VERIFICADOR')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('dv_cotizante')
	ls_sw		= 'N'

elseif isnull(ls_fono_cotizante) or ls_fono_cotizante='' then
	messagebox('Advertencia','Debe Ingresar FONO COTIZANTE')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('fono_cotizante')
	ls_sw		= 'N'
	
elseif isnull(ls_moneda) or ls_moneda='' then
	messagebox('Advertencia','Debe Ingresar MONEDA')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('moneda')
	ls_sw		= 'N'
	
elseif isnull(ls_sector) or ls_sector='' then
	messagebox('Advertencia','Debe Ingresar SECTOR')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('sector')
	ls_sw		= 'N'	
	
elseif isnull(ll_capacidad) or ll_capacidad=0 then
	messagebox('Advertencia','Debe Ingresar CAPACIDAD')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('capacidad')
	ls_sw		= 'N'		
	
elseif isnull(ls_tipo_sepultura) or ls_tipo_sepultura='' then
	messagebox('Advertencia','Debe Ingresar TIPO DE SEPULTURA')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('tipo_sepultura')
	ls_sw		= 'N'	

elseif isnull(ls_fono_ejecutivo) or ls_fono_ejecutivo='' then
	messagebox('Advertencia','Debe Ingresar FONO EJECUTIVO')
	dw_ingreso_cotizacion.setfocus()
	dw_ingreso_cotizacion.setcolumn('fono_ejecutivo')
	ls_sw		= 'N'	
end if
if ls_sw='S' then
	dw_ingreso_cotizacion.setitem(1,'nombre_cotizante',ls_nombre_cotizante)
	dw_ingreso_cotizacion.setitem(1,'ap_paterno_cotizante',ls_ap_pat_cotizante)
	dw_ingreso_cotizacion.setitem(1,'ap_materno_cotizante',ls_ap_mat_cotizante)
	dw_ingreso_cotizacion.setitem(1,'rut_cotizante',ll_rut)
	dw_ingreso_cotizacion.setitem(1,'dv_cotizante',ls_dv)
	dw_ingreso_cotizacion.setitem(1,'fono_cotizante',ls_fono_cotizante)
	dw_ingreso_cotizacion.setitem(1,'moneda',ls_moneda)
	dw_ingreso_cotizacion.setitem(1,'sector',ls_sector)
	dw_ingreso_cotizacion.setitem(1,'capacidad',ll_capacidad)
	dw_ingreso_cotizacion.setitem(1,'tipo_sepultura',ls_tipo_sepultura)
	dw_ingreso_cotizacion.setitem(1,'fono_ejecutivo',ls_fono_ejecutivo)
	SELECT	MAX("COTIZACIONES"."CORRELATIVO_INTERNO")  
	INTO 		:ll_count  
	FROM 		"COTIZACIONES"  
	USING		sqlca;
	if ll_count=0 or isnull(ll_count) then
		ll_count	= 1
	else
		ll_count ++
	end if
	
	dw_ingreso_cotizacion.setitem(1,'correlativo_interno',ll_count)

	ret	= MessageBox('Actualizar', "Desea Grabar Ficha De Cotización", Question!, YesNo!, 2)
	IF ret = 1 THEN
		if dw_ingreso_cotizacion.update()=1 then
			commit;
			cb_imprimir.enabled	= true
			ll_resp					= messagebox("Grabar","Grabación Exitosa, desea Limpiar Pantalla",Exclamation!,YesNo!,2)
			if ll_resp = 1 then
				dw_ingreso_cotizacion.reset()
				dw_ingreso_cotizacion.InsertRow(0)
				dw_ingreso_cotizacion.setitem(1,'cod_ejecutivo',gs_user)
				dw_ingreso_cotizacion.setitem(1,'moneda','2')
				dw_ingreso_cotizacion.setcolumn('nombre_cotizante')
				dw_ingreso_cotizacion.setitem(1,'fecha',ldt_fecha)
			end if	
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar Ficha Sepultación SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
		
	
end event

type rb_foresta from radiobutton within w_cotizaciones
event ue_mousemove pbm_mousemove
integer x = 1769
integer y = 40
integer width = 535
integer height = 96
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "La Foresta"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;Long		ll_nulo
String	ls_nulo
Setnull(ll_nulo);setnull(ls_nulo)
if this.checked=true then
	dw_ingreso_cotizacion.setitem(1,'cod_parque',11)
	dw_ingreso_cotizacion.accepttext()
	idw_detalle.retrieve(11)
	dw_ingreso_cotizacion.setitem(1,'capacidad',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'tipo_sepultura',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'uso',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'dscto_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_nf',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_cuota',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_mantencion_anual',ll_nulo)
end if
end event

type rb_manantial from radiobutton within w_cotizaciones
event ue_mousemove pbm_mousemove
integer x = 1207
integer y = 40
integer width = 567
integer height = 96
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "El Manantial"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;Long		ll_nulo
String	ls_nulo
Setnull(ll_nulo);setnull(ls_nulo)
if this.checked=true then
	dw_ingreso_cotizacion.setitem(1,'cod_parque',102)
	dw_ingreso_cotizacion.accepttext()
	idw_detalle.retrieve(102)
	dw_ingreso_cotizacion.setitem(1,'capacidad',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'tipo_sepultura',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'uso',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'dscto_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_nf',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_cuota',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_mantencion_anual',ll_nulo)
end if
end event

type rb_prado from radiobutton within w_cotizaciones
event ue_mousemove pbm_mousemove
integer x = 763
integer y = 40
integer width = 448
integer height = 96
integer taborder = 10
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "El Prado"
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;Long		ll_nulo
String	ls_nulo
Setnull(ll_nulo);setnull(ls_nulo)
if this.checked=true then
	dw_ingreso_cotizacion.setitem(1,'cod_parque',1)
	dw_ingreso_cotizacion.accepttext()
	idw_detalle.retrieve(1)
	dw_ingreso_cotizacion.setitem(1,'capacidad',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'tipo_sepultura',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'uso',ls_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'dscto_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_nf',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_cuota',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_mantencion_anual',ll_nulo)
end if
end event

type cb_cerrar from commandbutton within w_cotizaciones
integer x = 3090
integer y = 2604
integer width = 370
integer height = 108
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_cotizaciones)
end event

type dw_ingreso_cotizacion from datawindow within w_cotizaciones
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 20
integer width = 3442
integer height = 2560
integer taborder = 70
string title = "none"
string dataobject = "dw_ingreso_cotizacion"
boolean border = false
boolean livescroll = true
end type

event ue_mousemove;st_help.visible	= false
end event

event clicked;String	ls_estado,ls_columna,ls_fecha
Datetime	ldt_fecha_fall
ls_columna	= dwo.name
if ls_columna = 'p_1' then
 		ls_fecha	= string(date(dw_ingreso_cotizacion.getitemdatetime(dw_ingreso_cotizacion.getrow(),'fecha')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
		if f_valida_fecha(ls_fecha)=-1 then 
			dw_ingreso_cotizacion.setitem(dw_ingreso_cotizacion.getrow(),'fecha',datetime(string(today(),gs_formato_fecha)))
			return
		end if
		OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_ingreso_cotizacion.setitem(dw_ingreso_cotizacion.getrow(),'fecha',date(ls_fecha))
		END IF
	end if
end event

event itemchanged;datetime ldt_fecha_hoy,ldt_fecha
double   ldb_valor_uf_dia,ldb_valor,ldb_derecho,ldb_mant,ldb_lib,ldb_pie_min,ldb_factor_cta,ldb_factor_gto,&
			ldb_gasto,ldb_cuota,ldb_val_cuota,ldb_uf_dia,ldb_descuento
string   ls_nombre,ls_columna,ls_dv,ls_sector,ls_tipo_sepultura,ls_uso,ls_nombre_cotizante,ls_ap_pat_cotizante,&
			ls_ap_mat_cotizante,ls_rut,ls_moneda,ls_nulo,ls_ejecutivo,ls_fono_cotizante,ls_tipo_sepult
long     ll_new,ll_rut,ll_capacidad,ll_parque,ll_valor_uso_ni,ll_reduc,ll_plazo,ll_cuota,ll_nulo,ll_count,ll_res,&
			ll_count_cot,ll_cod_parque

this.accepttext()
ls_columna		= dwo.name  
Setnull(ll_nulo);setnull(ls_nulo)
ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
if ls_columna = 'rut_cotizante' then
	ll_rut		= long(data)
	if not isnull(ll_rut) and ll_rut >0 then
		SELECT	Count("COTIZACIONES"."COD_EJECUTIVO")   
		INTO		:ll_count_cot
		FROM 		"COTIZACIONES"  
		WHERE 	"COTIZACIONES"."RUT_COTIZANTE" = :ll_rut   
		USING		sqlca;
		if ll_count_cot>0 then
			ll_res	= messagebox("Advertencia","Existe(n) "+string(ll_count_cot)+" Cotizacion(es) Para este Rut, desea Ver Detalle",Exclamation!,YesNo!,2)
			if ll_res=1 then
				OpenWithParm(w_cotizaciones_guardadas, string(ll_rut))
			end if
		end if
		SELECT	"TAB_UF"."VALOR_UF"  
		INTO 		:ldb_valor_uf_dia  
		FROM 		"TAB_UF"  
		WHERE 	"TAB_UF"."FECHA_UF" = :ldt_fecha_hoy   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			dw_ingreso_cotizacion.setitem(dw_ingreso_cotizacion.getrow(),'uf_dia',ldb_valor_uf_dia)
		end if
	end if
end if
if ls_columna='sector' then
	this.setitem(1,'capacidad',ll_nulo)
	this.setitem(1,'tipo_sepultura',ls_nulo)
	this.setitem(1,'uso',ls_nulo)
	this.setitem(1,'numero_reducciones',ll_nulo)
end if
if ls_columna='tipo_sepultura' then
	this.setitem(1,'capacidad',ll_nulo)
	this.setitem(1,'uso',ls_nulo)
	this.setitem(1,'numero_reducciones',ll_nulo)
end if
if ls_columna='capacidad' then
	this.setitem(1,'uso',ls_nulo)
	this.setitem(1,'numero_reducciones',ll_nulo)
end if
if ls_columna='uso' then
	this.setitem(1,'numero_reducciones',ll_nulo)
end if

if ls_columna='sector' or ls_columna='tipo_sepultura' or ls_columna='capacidad' or ls_columna='uso' then
	ll_cod_parque	= this.getitemnumber(1,'cod_parque')
	ls_sector		= this.getitemstring(1,'sector')
	ls_tipo_sepult	= this.getitemstring(1,'tipo_sepultura')
	ll_capacidad	= this.getitemnumber(1,'capacidad')
	ls_uso			= this.getitemstring(1,'uso')
	if not isnull(ls_sector) and not isnull(ls_tipo_sepult) and ll_capacidad>0 and not isnull(ls_uso) then
		SELECT	"LISTA_PRECIO"."REDUCCION"  
		INTO		:ll_reduc
		FROM 		"LISTA_PRECIO"  
		WHERE  ( "LISTA_PRECIO"."SECTOR" = :ls_sector ) AND  
				 ( "LISTA_PRECIO"."T_SEPULT" = :ls_tipo_sepult ) AND  
				 ( "LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad ) AND  
				 ( "LISTA_PRECIO"."COD_PARQUE" = :ll_cod_parque ) AND  
				 ( "LISTA_PRECIO"."CANAL" = :ls_uso )    
		USING		sqlca;
		if sqlca.sqlcode=0 then
			this.setitem(1,'numero_reducciones',ll_reduc)
		else
			this.setitem(1,'numero_reducciones',ll_nulo)
		end if
	end if
end if
dw_ingreso_cotizacion.accepttext()
if ls_columna='rut_cotizante' or ls_columna='dv_cotizante' then
	ll_rut				= this.getitemnumber(this.getrow(),'rut_cotizante')
	ls_dv					= this.getitemstring(this.getrow(),'dv_cotizante')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then 
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			messagebox('Error','El Rut no es Válido',stopsign!)
			this.setfocus()
			this.setcolumn('dv_cotizante')
			this.setitem(1,'c_estado','N')
		else
			SELECT 	"CLIENTE"."NOMBRE",   
						"CLIENTE"."A_PATERNO",   
						"CLIENTE"."A_MATERNO",
						"CLIENTE"."FONO_P"
			INTO 		:ls_nombre_cotizante,   
						:ls_ap_pat_cotizante,   
						:ls_ap_mat_cotizante,
						:ls_fono_cotizante
			FROM 		"CLIENTE"  
			WHERE 	"CLIENTE"."RUT" = :ll_rut   
			USING		sqlca;
			if sqlca.sqlcode<>0 then
				SELECT distinct "COTIZACIONES"."NOMBRE_COTIZANTE",   
									 "COTIZACIONES"."AP_PATERNO_COTIZANTE",   
									 "COTIZACIONES"."AP_MATERNO_COTIZANTE",
									 "COTIZACIONES"."FONO_COTIZANTE"
				INTO 				 :ls_nombre_cotizante,   
									 :ls_ap_pat_cotizante,   
									 :ls_ap_mat_cotizante, 
									 :ls_fono_cotizante
				FROM 				 "COTIZACIONES"  
				WHERE 			 "COTIZACIONES"."RUT_COTIZANTE" = :ll_rut
				USING sqlca;
			end if
			if sqlca.sqlcode=0 then
				this.setitem(1,'nombre_cotizante',ls_nombre_cotizante)   
				this.setitem(1,'ap_paterno_cotizante',ls_ap_pat_cotizante)   
				this.setitem(1,'ap_materno_cotizante',ls_ap_mat_cotizante)
				this.setitem(1,'fono_cotizante',ls_fono_cotizante)
				this.accepttext()
			end if
			this.setitem(1,'c_estado','S')
		end if 
	end if
end if
if ls_columna='plazo' then
	ll_plazo		= this.getitemnumber(1,'plazo')
	ll_capacidad	= this.getitemnumber(1,'capacidad')
	if ll_capacidad=1 and ll_plazo>36 then
		messagebox("Advertencia","Plazo NO debe ser Mayor a 36 Cuotas")
	else
		if ll_plazo>il_cta_max_plazo then
			messagebox("Advertencia","Error en Nº Cuotas Plazo, No debe ser Mayor a "+string(il_cta_max_plazo))
		end if
	end if
end if
if ls_columna='sector' or ls_columna='capacidad' or ls_columna='tipo_sepultura' or ls_columna='uso' then
	dw_ingreso_cotizacion.setitem(1,'valor_uso_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_ni',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'dscto_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_uso_anticipado',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'pie_minimo_nf',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_cuota',ll_nulo)
	dw_ingreso_cotizacion.setitem(1,'valor_mantencion_anual',ll_nulo)
	dw_ingreso_cotizacion.accepttext()
	if rb_prado.checked=true then
		ll_parque	= 1
	elseif rb_manantial.checked=true then
		ll_parque	= 102
	elseif rb_foresta.checked=true then
		ll_parque	= 11
	end if
	ls_sector  				= dw_ingreso_cotizacion.getitemstring(1,'sector')
	if not isnull(ls_sector) and ls_sector<>'' then
		idw_detalle3.retrieve(ls_sector,ll_parque)
		dw_ingreso_cotizacion.setitem(1,'dscto_uso_anticipado',0)
	end if
	ll_capacidad  			= dw_ingreso_cotizacion.getitemNumber(1,'capacidad')
	ls_tipo_sepultura 	= dw_ingreso_cotizacion.getitemstring(1,'tipo_sepultura')
	ls_uso					= dw_ingreso_cotizacion.getitemstring(1,'uso')
	ll_capacidad			= dw_ingreso_cotizacion.getitemnumber(1,'capacidad')
	ls_nombre_cotizante	= dw_ingreso_cotizacion.getItemString(1,'nombre_cotizante')
	ls_ap_pat_cotizante	= dw_ingreso_cotizacion.getItemString(1,'ap_paterno_cotizante')
	ls_ap_mat_cotizante	= dw_ingreso_cotizacion.getItemString(1,'ap_materno_cotizante')
	ls_moneda				= dw_ingreso_cotizacion.getItemString(1,'moneda')
	ldb_uf_dia				= dw_ingreso_cotizacion.getitemnumber(1,'uf_dia')
	ll_plazo					= dw_ingreso_cotizacion.getitemnumber(1,'plazo')
	idw_detalle2.retrieve(ls_sector,ls_tipo_sepultura,ll_parque)
	idw_detalle4.retrieve(ls_sector,ls_tipo_sepultura,ll_capacidad,ll_parque)
	idw_detalle5.retrieve(ls_sector,ls_tipo_sepultura,ll_capacidad,ll_parque,ls_uso)
	if not isnull(ls_sector) and ll_capacidad>0 and not isnull(ls_tipo_sepultura) and not isnull(ls_uso) then
		SELECT	"LISTA_PRECIO"."VALOR",   
					"LISTA_PRECIO"."DERECHO",   
					"LISTA_PRECIO"."MANTENCION",   
					"LISTA_PRECIO"."LIBERADOR",   
					"LISTA_PRECIO"."PIE_MINIMO",   
					"LISTA_PRECIO"."REDUCCION"  
		INTO 		:ldb_valor,   
					:ldb_derecho,   
					:ldb_mant,   
					:ldb_lib,   
					:ldb_pie_min,   
					:ll_reduc  
		FROM 		"LISTA_PRECIO"  
		WHERE  ( "LISTA_PRECIO"."SECTOR" = :ls_sector ) AND  
				 ( "LISTA_PRECIO"."CAPACIDAD" = :ll_capacidad ) AND  
				 ( "LISTA_PRECIO"."CANAL" = :ls_uso ) AND  
				 ( "LISTA_PRECIO"."T_SEPULT" = :ls_tipo_sepultura ) AND  
				 ( "LISTA_PRECIO"."COD_PARQUE" = :ll_parque )   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			if ls_uso='NI' then
				if ls_moneda='1' then
					dw_ingreso_cotizacion.setitem(1,'valor_uso_ni',round(ldb_valor * ldb_uf_dia,0))
					dw_ingreso_cotizacion.setitem(1,'pie_minimo_ni',round(ldb_pie_min * ldb_uf_dia,0))
				else
					dw_ingreso_cotizacion.setitem(1,'valor_uso_ni',ldb_valor)
					dw_ingreso_cotizacion.setitem(1,'pie_minimo_ni',ldb_pie_min)
				end if
			else
				if ls_moneda='1' then
					dw_ingreso_cotizacion.setitem(1,'valor_uso_anticipado',round(ldb_valor * ldb_uf_dia,0))
					dw_ingreso_cotizacion.setitem(1,'pie_minimo_nf',round(ldb_pie_min * ldb_uf_dia,0))
				else
					dw_ingreso_cotizacion.setitem(1,'valor_uso_anticipado',ldb_valor)
					dw_ingreso_cotizacion.setitem(1,'pie_minimo_nf',ldb_pie_min)
				end if
			end if
			dw_ingreso_cotizacion.setitem(1,'valor_mantencion_anual',ldb_mant)
		end if
	end if	
end if
if ls_columna='moneda' then
	ls_moneda	= data
	ldb_uf_dia	= this.getitemnumber(1,'uf_dia')
	if ldb_uf_dia>0 then
		if ls_moneda='1' then
			this.setitem(1,'valor_uso_ni',round(this.getitemnumber(1,'valor_uso_ni') * ldb_uf_dia,0))
			this.setitem(1,'pie_minimo_ni',round(this.getitemnumber(1,'pie_minimo_ni') * ldb_uf_dia,0))
			this.setitem(1,'dscto_uso_anticipado',round(this.getitemnumber(1,'dscto_uso_anticipado') * ldb_uf_dia,0))
			this.setitem(1,'valor_uso_anticipado',round(this.getitemnumber(1,'valor_uso_anticipado') * ldb_uf_dia,0))
			this.setitem(1,'pie_minimo_nf',round(this.getitemnumber(1,'pie_minimo_nf') * ldb_uf_dia,0))
			this.setitem(1,'valor_cuota',round(this.getitemnumber(1,'valor_cuota') * ldb_uf_dia,0))
		else
			this.setitem(1,'valor_uso_ni',round(this.getitemnumber(1,'valor_uso_ni') / ldb_uf_dia,4))
			this.setitem(1,'pie_minimo_ni',round(this.getitemnumber(1,'pie_minimo_ni') / ldb_uf_dia,4))
			this.setitem(1,'dscto_uso_anticipado',round(this.getitemnumber(1,'dscto_uso_anticipado') / ldb_uf_dia,4))
			this.setitem(1,'valor_uso_anticipado',round(this.getitemnumber(1,'valor_uso_anticipado') / ldb_uf_dia,4))
			this.setitem(1,'pie_minimo_nf',round(this.getitemnumber(1,'pie_minimo_nf') / ldb_uf_dia,4))
			this.setitem(1,'valor_cuota',round(this.getitemnumber(1,'valor_cuota') / ldb_uf_dia,4))
		end if
		this.accepttext()
	else
		messagebox("Advertencia","Debe Ingresar UF Día")
	end if
end if

if ls_columna='plazo' or ls_columna='valor_uso_ni' or ls_columna='uso' or ls_columna='pie_minimo_ni' or&
	ls_columna='valor_uso_anticipado' or ls_columna='pie_minimo_nf' or ls_columna ='dscto_uso_anticipado' then
	ll_plazo		= this.getitemnumber(1,'plazo')
	ls_moneda	= this.getitemstring(1,'moneda')
	if isnull(ls_moneda) or ls_moneda='' then
		messagebox("Advertencia","Debe Ingresar Tipo Moneda")
	else
		if ll_plazo>0 then
			SELECT DISTINCT "FACTORES"."FACTOR",   
						"FACTORES"."FACTOR_GASTO_ADM"  
			INTO		:ldb_factor_cta,
						:ldb_factor_gto
			FROM 		"FACTORES"  
			WHERE  ( :ll_plazo >= "FACTORES"."NRO_CUOTAS_INICIAL" ) AND  
					 ( :ll_plazo <= "FACTORES"."NRO_CUOTAS_FINAL" ) AND  
					 ( "FACTORES"."MONEDA" = :ls_moneda ) AND  
					 ( "FACTORES"."ESTADO_VIGENCIA" = 'V' ) AND  
					 ( "FACTORES"."BASE" = 'O' )    
			USING		sqlca;
			if sqlca.sqlcode=0 then
				if ll_plazo > 17 then
					ls_uso				= dw_ingreso_cotizacion.getitemstring(1,'uso')
					if ls_uso='NI' then
						ldb_valor		= dw_ingreso_cotizacion.getitemnumber(1,'valor_uso_ni')
						ldb_pie_min		= dw_ingreso_cotizacion.getitemnumber(1,'pie_minimo_ni')
						ldb_descuento 	= dw_ingreso_cotizacion.getitemnumber(1,'dscto_uso_anticipado')
					else
						ldb_valor		= dw_ingreso_cotizacion.getitemnumber(1,'valor_uso_anticipado')
						ldb_pie_min		= dw_ingreso_cotizacion.getitemnumber(1,'pie_minimo_nf')
						ldb_descuento 	= dw_ingreso_cotizacion.getitemnumber(1,'dscto_uso_anticipado')
					end if
					if ls_moneda='1' then
						ldb_gasto		= round(ll_plazo * ldb_factor_gto,0)
						ldb_cuota		= ((ldb_valor - ldb_pie_min) - ldb_descuento) + ldb_gasto
						ldb_val_cuota	= round(ldb_cuota * ldb_factor_cta,0)
					else
						ldb_gasto		= round(ll_plazo * ldb_factor_gto,4)
						ldb_cuota		= ((ldb_valor - ldb_pie_min) - ldb_descuento) + ldb_gasto
						ldb_val_cuota	= round(ldb_cuota * ldb_factor_cta,4)
					end if
					dw_ingreso_cotizacion.setitem(1,'valor_cuota',ldb_val_cuota)
					dw_ingreso_cotizacion.accepttext()
				elseif ll_plazo>0 and ll_plazo<18 then
					ls_uso			= dw_ingreso_cotizacion.getitemstring(1,'uso')
					if ls_uso='NI' then
						ldb_valor	= dw_ingreso_cotizacion.getitemnumber(1,'valor_uso_ni')
						ldb_pie_min	= dw_ingreso_cotizacion.getitemnumber(1,'pie_minimo_ni')
						ldb_descuento 	= dw_ingreso_cotizacion.getitemnumber(1,'dscto_uso_anticipado')
					else
						ldb_valor	= dw_ingreso_cotizacion.getitemnumber(1,'valor_uso_anticipado')
						ldb_pie_min	= dw_ingreso_cotizacion.getitemnumber(1,'pie_minimo_nf')
						ldb_descuento 	= dw_ingreso_cotizacion.getitemnumber(1,'dscto_uso_anticipado')
					end if
					if ls_moneda='1' then
						ldb_cuota		= (ldb_valor - ldb_pie_min) - ldb_descuento
						ldb_val_cuota	= round(ldb_cuota / ll_plazo,0)
					else
						ldb_cuota		= (ldb_valor - ldb_pie_min) - ldb_descuento
						ldb_val_cuota	= round(ldb_cuota / ll_plazo,4)
					end if
					dw_ingreso_cotizacion.setitem(1,'valor_cuota',ldb_val_cuota)
					dw_ingreso_cotizacion.accepttext()
				end if
			else
				messagebox("Advertencia","No Existe Factor con Plazo Indicado")
			 end if
		end if
	end if
end if
this.accepttext()
end event

event itemfocuschanged;String	ls_columna,ls_dv
Long		ll_rut,ll_plazo,ll_capacidad

ls_columna	= dwo.name
if ls_columna<>'rut_cotizante' and ls_columna<>'dv_cotizante' then
	ll_rut				= this.getitemnumber(this.getrow(),'rut_cotizante')
	ls_dv					= this.getitemstring(this.getrow(),'dv_cotizante')
	if ll_rut>0 and ls_dv<>'' and not isnull(ls_dv) then
		if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
			this.setfocus()
			this.setcolumn('dv_cotizante')
		end if 
	end if
end if
if ls_columna<>'plazo' or ls_columna='plazo' then
	ll_plazo		= this.getitemnumber(1,'plazo')
	if ll_plazo>il_cta_max_plazo then
		this.setitem(1,'plazo',0)
		this.setitem(1,'valor_cuota',0)
	else
		ll_capacidad	= this.getitemnumber(1,'capacidad')
		if ll_capacidad=1 and ll_plazo>36 then
			this.setitem(1,'plazo',0)
			this.setitem(1,'valor_cuota',0)
		end if
	end if
end if
this.accepttext()
end event

