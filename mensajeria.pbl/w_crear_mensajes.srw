forward
global type w_crear_mensajes from window
end type
type rb_nro_ctto from radiobutton within w_crear_mensajes
end type
type rb_rut from radiobutton within w_crear_mensajes
end type
type dw_contratos from datawindow within w_crear_mensajes
end type
type cb_limpiar from commandbutton within w_crear_mensajes
end type
type cb_buscar from commandbutton within w_crear_mensajes
end type
type dw_mensajes from datawindow within w_crear_mensajes
end type
type cb_cerrar from commandbutton within w_crear_mensajes
end type
type cb_grabar from commandbutton within w_crear_mensajes
end type
end forward

global type w_crear_mensajes from window
integer width = 2939
integer height = 2036
boolean titlebar = true
string title = "Mensajes"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
rb_nro_ctto rb_nro_ctto
rb_rut rb_rut
dw_contratos dw_contratos
cb_limpiar cb_limpiar
cb_buscar cb_buscar
dw_mensajes dw_mensajes
cb_cerrar cb_cerrar
cb_grabar cb_grabar
end type
global w_crear_mensajes w_crear_mensajes

forward prototypes
public function integer f_valida_grabado ()
public function integer f_valida_existencia_previa_descuentos ()
public subroutine wf_muestra_porcentaje (integer p_muestra)
end prototypes

public function integer f_valida_grabado ();long 		ll_rut,ll_cod_parque
String		ls_estado,ls_base,ls_serie,ls_descrip, ls_dv
//datetime ldt_fecha_fin,ldt_fecha_hoy
Double	ll_numero

		// valida rut
		ll_rut		= dw_mensajes.getitemNumber(1,'rut')
		ls_dv			= dw_mensajes.getitemstring(1,'c_dv')
		if ll_rut>0 and not isnull(ls_dv) then
				if dw_contratos.retrieve(ll_rut)=0 then 
					messagebox("Advertencia","No Registra datos para el RUT ingresado, no se puede grabar el mansaje.",StopSign!)
					dw_mensajes.setcolumn('rut')
					dw_mensajes.setfocus()
					return 0 
				end if
		end if

		// valida contrato
		
		ls_base		= dw_mensajes.GetItemString(1,'base')
		ls_serie		= dw_mensajes.GetItemString(1,'serie')
		ll_numero	= dw_mensajes.GetItemNumber(1,'numero')
		
			if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' &
				and not isnull(ll_numero) and ll_numero>0 then
				SELECT 	"CADENA"."ESTADO",  	"CADENA"."COD_PARQUE"		  
				INTO 		:ls_estado,   			:ll_cod_parque  	
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero)
	  			USING		sqlca;
				if sqlca.sqlcode=0 then
					if ls_estado='V' or ls_estado='C' then
						else
						SELECT	"ESTADO"."NOMBRE_ESTADO"  
						INTO 		:ls_descrip  
						FROM 		"ESTADO"  
						WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							messagebox("Advertencia","No es Posible Ingresar Mensaje por encontrarse Contrato en Estado: "+ls_descrip)
							return 0
						end if
					end if
				else
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###')+' No Existe, no se puede grabar el mensaje.',StopSign!)
					dw_mensajes.setfocus()
					dw_mensajes.setcolumn('numero')
					return 0 
				end if
			end if

return 1
end function

public function integer f_valida_existencia_previa_descuentos ();//
long		ll_rut, ll_contador, ll_correlativo
Double	ll_numero 
//datetime	ldt_fecha_hoy, ldt_fecha_crea,ldt_fecha_fin
string	ls_base,ls_serie

ls_base				= dw_mensajes.GetItemString(1,'base')
ls_serie				= dw_mensajes.GetItemString(1,'serie')
ll_numero			= dw_mensajes.GetItemNumber(1,'numero')
ll_rut					= dw_mensajes.GetItemNumber(1,'rut')
ll_correlativo		= dw_mensajes.GetItemNumber(1,'mensajes_correlativo')
ll_contador           = 0 

if rb_nro_ctto.checked = true then
	select count(*) into :ll_contador
	from mensajes where 
	base = :ls_base and 
	serie = : ls_serie and 
	numero = :ll_numero and
	correlativo <> :ll_correlativo and
	ESTADO_GESTION = 'A' and
	descuento > 0
  	USING	SQLCA;
else
	select count(*) into :ll_contador
	from mensajes where 
	rut = :ll_rut and 
	ESTADO_GESTION = 'A' and
	descuento > 0 and 
	correlativo <> :ll_correlativo 
  	USING	SQLCA;
end if

return  ll_contador
end function

public subroutine wf_muestra_porcentaje (integer p_muestra);
if p_muestra = 0 then
	dw_mensajes.Object.gb_3.Visible = 0
	dw_mensajes.Object.t_15.Visible = 0
	dw_mensajes.Object.t_16.Visible = 0
	dw_mensajes.Object.t_17.Visible = 0
	dw_mensajes.Object.mensajes_aplica_a.Visible = 0
	dw_mensajes.Object.mensajes_descuento.Visible = 0
	dw_mensajes.Object.mensajes_descuento.Visible = 0
else
	dw_mensajes.Object.gb_3.Visible = 1
	dw_mensajes.Object.t_15.Visible = 1
	dw_mensajes.Object.t_16.Visible = 1
	dw_mensajes.Object.t_17.Visible = 1
	dw_mensajes.Object.mensajes_aplica_a.Visible = 1
	dw_mensajes.Object.mensajes_descuento.Visible = 1
end if 






end subroutine

on w_crear_mensajes.create
this.rb_nro_ctto=create rb_nro_ctto
this.rb_rut=create rb_rut
this.dw_contratos=create dw_contratos
this.cb_limpiar=create cb_limpiar
this.cb_buscar=create cb_buscar
this.dw_mensajes=create dw_mensajes
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.Control[]={this.rb_nro_ctto,&
this.rb_rut,&
this.dw_contratos,&
this.cb_limpiar,&
this.cb_buscar,&
this.dw_mensajes,&
this.cb_cerrar,&
this.cb_grabar}
end on

on w_crear_mensajes.destroy
destroy(this.rb_nro_ctto)
destroy(this.rb_rut)
destroy(this.dw_contratos)
destroy(this.cb_limpiar)
destroy(this.cb_buscar)
destroy(this.dw_mensajes)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
end on

event open;long		ll_new,ll_count,ll_rut
datetime ldt_fecha_hoy
String		ls_dv,ls_mensaje

dw_mensajes.settransobject(sqlca)
dw_contratos.settransobject(sqlca)
gf_centrar(w_crear_mensajes)

dw_mensajes.settransobject(sqlca)
dw_mensajes.getchild('serie',idw_detalle)
idw_detalle.settransobject(sqlca)
idw_detalle.insertrow(0)
ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
ll_new					= dw_mensajes.insertrow(0)
dw_mensajes.setitem(ll_new,'sw_mensaje','R')
dw_mensajes.setitem(ll_new,'fecha_creacion',ldt_fecha_hoy)
dw_mensajes.setitem(ll_new,'fecha_fin',ldt_fecha_hoy)
dw_mensajes.setitem(ll_new,'mensajes_fecha_gestion',ldt_fecha_hoy)
dw_mensajes.setitem(ll_new,'autor',gs_user)
if isvalid(w_ingreso_individual_cobranza) then
	ll_rut					= w_ingreso_individual_cobranza.dw_lista.getitemnumber(w_ingreso_individual_cobranza.dw_lista.getrow(),'gestion_cobranza_rut')
	ls_dv					= w_ingreso_individual_cobranza.dw_lista.getitemstring(w_ingreso_individual_cobranza.dw_lista.getrow(),'gestion_cobranza_dv')
	ls_mensaje			= w_ingreso_individual_cobranza.dw_lista.getitemstring(w_ingreso_individual_cobranza.dw_lista.getrow(),'gestion_cobranza_glosa_cobranza')
	dw_mensajes.setitem(1,'rut',ll_rut)
	dw_mensajes.setitem(1,'c_dv',ls_dv)
	dw_mensajes.setitem(1,'mensajes_mensaje',ls_mensaje)
end if
SELECT		MAX("MENSAJES"."CORRELATIVO")  
INTO 			:ll_count  
FROM 		"MENSAJES"  
USING		sqlca;
if ll_count=0 or isnull(ll_count) then
	ll_count				= 1
else
	ll_count ++
end if
dw_mensajes.setitem(1,'mensajes_correlativo',ll_count)
dw_mensajes.accepttext()
rb_rut.triggerevent(clicked!)



end event

type rb_nro_ctto from radiobutton within w_crear_mensajes
integer x = 1024
integer y = 144
integer width = 617
integer height = 84
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Nº Contrato"
end type

event clicked;Long		ll_nulo

Setnull(ll_nulo)
if dw_mensajes.rowcount()>0 then
	dw_mensajes.setitem(1,'sw_mensaje','C')
	dw_mensajes.setitem(1,'rut',ll_nulo)
	dw_mensajes.setfocus()
	dw_mensajes.setcolumn('base')

	dw_mensajes.accepttext()
end if

wf_muestra_porcentaje(1)			// vhfb

end event

type rb_rut from radiobutton within w_crear_mensajes
integer x = 119
integer y = 144
integer width = 402
integer height = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Rut"
boolean checked = true
end type

event clicked;String	ls_nulo
Long		ll_nulo

Setnull(ls_nulo);Setnull(ll_nulo)
if dw_mensajes.rowcount()>0 then
	dw_mensajes.setitem(1,'sw_mensaje','R')
	dw_mensajes.setitem(1,'base',ls_nulo)
	dw_mensajes.setitem(1,'serie',ls_nulo)
	dw_mensajes.setitem(1,'numero',ll_nulo)
	dw_mensajes.setfocus()
	dw_mensajes.setcolumn('rut')
	dw_mensajes.accepttext()
end if

wf_muestra_porcentaje(0)			// vhfb
end event

type dw_contratos from datawindow within w_crear_mensajes
integer x = 274
integer y = 360
integer width = 462
integer height = 168
integer taborder = 40
string title = "none"
string dataobject = "dw_contratos_por_rut"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type cb_limpiar from commandbutton within w_crear_mensajes
integer x = 1047
integer y = 1780
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;long 		ll_new,ll_resp, ll_count
datetime	ldt_fecha_hoy 

ll_resp				= messagebox("ADVERTENCIA","Esta seguro que desea limpiar los datos",Question!, YesNo!, 2)
if ll_resp=1 then
	dw_mensajes.reset()
	dw_mensajes.insertrow(0)
	dw_contratos.reset()
	ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
	dw_mensajes.setitem(1,'fecha_creacion',ldt_fecha_hoy)
	dw_mensajes.setitem(1,'fecha_fin',ldt_fecha_hoy)
	dw_mensajes.setitem(1,'autor',gs_user)
	rb_nro_ctto.checked=false
	rb_rut.checked= true
	
	SELECT		MAX("MENSAJES"."CORRELATIVO")  
	INTO 			:ll_count  
	FROM 		"MENSAJES"  
	USING		sqlca;
	if ll_count=0 or isnull(ll_count) then
		ll_count				= 1
	else
		ll_count ++
	end if
	dw_mensajes.setitem(1,'mensajes_correlativo',ll_count)
	dw_mensajes.accepttext()
	rb_rut.triggerevent(clicked!)
	
end if
end event

type cb_buscar from commandbutton within w_crear_mensajes
integer x = 539
integer y = 1780
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
end type

event clicked;if isvalid(w_buscar_mensajes) then close(w_buscar_mensajes)
open (w_buscar_mensajes) 
end event

type dw_mensajes from datawindow within w_crear_mensajes
integer x = 37
integer y = 28
integer width = 2825
integer height = 1724
integer taborder = 10
string title = "none"
string dataobject = "dw_crear_mensaje"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long 		ll_rut,ll_cod_parque, ll_nulo
String		ls_columna,ls_estado,ls_base,ls_serie,ls_sw_mensaje,ls_descrip, ls_nulo,ls_dv, ls_aplica
datetime ldt_fecha_fin,ldt_fecha_hoy
Double	ll_numero, ll_descuento

this.accepttext()
Setnull(ll_nulo) ; setnull(ls_nulo)
ls_columna			= dwo.name
CHOOSE CASE ls_columna
	CASE 'mensajes_aplica_a'	
			ls_aplica			= dw_mensajes.getitemstring(1,'mensajes_aplica_a')
			if ls_aplica = 'N'  then
				dw_mensajes.setitem(1,'mensajes_descuento',0)
				dw_mensajes.setfocus()	
			end if 
	
	CASE 'sw_mensaje'
		ls_sw_mensaje	= trim(data)
		if ls_sw_mensaje = 'R'then
			dw_mensajes.scrolltorow(1)
			dw_mensajes.setcolumn('rut')
			dw_mensajes.setfocus()
		elseif ls_sw_mensaje = 'C' then
			dw_mensajes.scrolltorow(1)
			dw_mensajes.setcolumn('base')
			dw_mensajes.setfocus()
		end if
		
	CASE 'rut','c_dv'
		ll_rut		= dw_mensajes.getitemNumber(1,'rut')
		ls_dv			= dw_mensajes.getitemstring(1,'c_dv')
		if ll_rut>0 and not isnull(ls_dv) then
			if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
				messagebox('Error','El Rut no es Válido',stopsign!)
				this.setitem(1,'c_dv',ls_nulo)
				this.setfocus()
				this.setcolumn('c_dv')
			else
				if dw_contratos.retrieve(ll_rut)=0 then 
					messagebox("Advertencia","No Registra datos")
					dw_mensajes.setcolumn('rut')
					dw_mensajes.setfocus()
				end if
			end if
		end if
		
	CASE 'base','serie','numero'
		ls_base		= dw_mensajes.GetItemString(1,'base')
		ls_serie		= dw_mensajes.GetItemString(1,'serie')
		ll_numero	= dw_mensajes.GetItemNumber(1,'numero')
		if ls_columna='base' and not isnull(ls_base) then
			idw_detalle.retrieve(ls_base)
			dw_mensajes.setitem(1,'serie',ls_nulo) 
			dw_mensajes.setitem(1,'numero',ll_nulo)
		end if
		if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' &
			and not isnull(ll_numero) and ll_numero>0 then
			if ls_columna='base' then
				dw_mensajes.setitem(1,'serie',ls_nulo) 
				dw_mensajes.setitem(1,'numero',ll_nulo)
				setnull(ls_serie);Setnull(ll_numero)
			end if
			if ls_columna='serie' then
				dw_mensajes.setitem(1,'numero',ll_nulo)
				Setnull(ll_numero)
			end if
			if not isnull(ls_base) and ls_base<>'' and not isnull(ls_serie) and ls_serie<>'' &
				and not isnull(ll_numero) and ll_numero>0 then
				SELECT 	"CADENA"."ESTADO",  	"CADENA"."COD_PARQUE"		  
				INTO 		:ls_estado,   			:ll_cod_parque  	
				FROM 		"CADENA"  
				WHERE  ( "CADENA"."CODIGO" = :ls_base ) AND  
						 ( "CADENA"."SERIE" = :ls_serie ) AND  
						 ( "CADENA"."NUMERO" = :ll_numero)
	  			USING		sqlca;
				if sqlca.sqlcode=0 then
					
					//dw_mensajes.setitem(1,'rut',ll_rut) 
					if ls_estado='V' or ls_estado='C' then
						// seguir
						else
						SELECT	"ESTADO"."NOMBRE_ESTADO"  
						INTO 		:ls_descrip  
						FROM 		"ESTADO"  
						WHERE 	"ESTADO"."COD_ESTADO" = :ls_estado   
						USING		sqlca;
						if sqlca.sqlcode=0 then
							messagebox("Advertencia","No es Posible Ingresar Mensaje por encontrarse Contrato en Estado: "+ls_descrip)
						end if
					end if
					
					// vhfb - inicio - 
					integer li_Position, li_Position2
					datawindowchild idw_sector
					dw_mensajes.getchild('mensajes_aplica_a',idw_sector)
					idw_sector.settransobject(sqlca)
					idw_sector.RESET()
					idw_sector.RETRIEVE()
					
					dw_mensajes.SETITEM(1,'mensajes_aplica_a','N')
					dw_mensajes.accepttext()
					
					if li_Position2> 0 then
							idw_sector.DeleteRow(li_Position2)
					end if 
							
					li_Position = POS('ADFGPRL', ls_base)
					if li_Position > 0 then // solo cuotas					

							idw_sector.settransobject(sqlca)
							li_Position2 = idw_sector.find('aplica_a = "M"',1,idw_sector.ROWCOUNT())
							if li_Position2> 0 then
									idw_sector.DeleteRow(li_Position2)
							end if 
							li_Position2 = idw_sector.find('aplica_a = "T"',1,idw_sector.ROWCOUNT())
							if li_Position2> 0 then
									idw_sector.DeleteRow(li_Position2)
							end if 
					end if 
					li_Position = POS('C', ls_base)
					if li_Position > 0 then // solo mantencion					
							idw_sector.settransobject(sqlca)
							li_Position2 = idw_sector.find('aplica_a = "C"',1,idw_sector.ROWCOUNT())
							if li_Position2> 0 then
									idw_sector.DeleteRow(li_Position2)
							end if 
							li_Position2 = idw_sector.find('aplica_a = "T"',1,idw_sector.ROWCOUNT())
							if li_Position2> 0 then
									idw_sector.DeleteRow(li_Position2)
							end if 
					end if 					
					// vhfb - termino - 					
					
					
				else
					messagebox("Advertencia","Contrato Nº "+ls_base+'-'+ls_serie+'-'+string(ll_numero,'###,###,###,###')+' No Existe')
					dw_mensajes.setfocus()
					dw_mensajes.setcolumn('numero')
				end if
			end if
		end if
END CHOOSE
this.accepttext()
//if dw_mensajes.retrieve(ls_base,ls_serie,ll_numero)=0 then
//end if						
					

end event

event clicked;string 	ls_fecha, ls_columna,ls_base,ls_serie
Long		ll_rut
Double	ll_numero

ls_columna						= dwo.name
if ls_columna = 'p_1' then
	ll_rut		= dw_mensajes.getitemnumber(1,'rut')
	ls_base		= dw_mensajes.getitemstring(1,'base')
	ls_serie		= dw_mensajes.getitemstring(1,'serie')
	ll_numero	= dw_mensajes.getitemnumber(1,'numero')
	if (not isnull(ll_rut) and ll_rut>0) or (ls_base<>'' and not isnull(ls_base) and ls_serie<>'' and not isnull(ls_serie) and not isnull(ll_numero) and ll_numero>0) then
		ls_fecha	= string(date(dw_mensajes.getitemdatetime(dw_mensajes.getrow(),'fecha_fin')))
		if isnull(ls_fecha) then ls_fecha = string(today(),"dd/mm/yyyy")
			if f_valida_fecha(ls_fecha)=-1 then 
				dw_mensajes.setitem(dw_mensajes.getrow(),'fecha_fin',datetime(string(today(),gs_formato_fecha)))
				return
			end if
			OpenWithParm(w_calendar,ls_fecha)
		IF not isnull(Message.StringParm) THEN
			ls_fecha				= trim(Message.StringParm)
			dw_mensajes.setitem(dw_mensajes.getrow(),'fecha_fin',date(ls_fecha))
		end if
	end if
end if

end event

event itemfocuschanged;string ls_columna, ls_sw_mensaje, ls_nulo,ls_dv,ls_aplica
long	 ll_nulo,ll_rut,ll_descuento
datetime ldt_fecha_hoy,ldt_fecha_fin

this.accepttext()
Setnull(ll_nulo) ; setnull(ls_nulo)
ldt_fecha_hoy		= datetime(date(gdt_fec_sistema),time('00:00:00'))
ldt_fecha_fin		= dw_mensajes.GetItemDatetime(1,'fecha_fin')
ls_columna			= dw_mensajes.GetColumnName()
if ls_columna='sw_mensaje' or ls_columna<>'sw_mensaje' then
	ls_sw_mensaje	= dw_mensajes.getitemstring(1,'sw_mensaje')
	if ls_sw_mensaje = 'R'then
		dw_mensajes.setitem(1,'base',ls_nulo)
		dw_mensajes.setitem(1,'serie',ls_nulo)
		dw_mensajes.setitem(1,'numero',ll_nulo)
	elseif ls_sw_mensaje = 'C' then
		dw_mensajes.setitem(1,'rut',ll_nulo)
		dw_mensajes.setitem(1,'c_dv',ls_nulo)
		dw_contratos.reset()
	end if
end if

// mirko - inicio
ls_aplica			= dw_mensajes.getitemstring(1,'mensajes_aplica_a')
ll_descuento		= dw_mensajes.getitemNumber(1,'mensajes_descuento')
if ls_aplica<>'N' and ll_descuento >100 then
	messagebox('Error','El porcentaje del descuento no es Válido',stopsign!)
	this.setitem(1,'mensajes_descuento',0)
	this.setcolumn('mensajes_descuento')
end if 
// mirko - termino


ll_rut		= dw_mensajes.getitemNumber(1,'rut')
ls_dv			= dw_mensajes.getitemstring(1,'c_dv')
if ll_rut>0 and not isnull(ls_dv) then
	if String(ls_dv) <> String(gf_obtener_dv(ll_rut)) then
		this.setitem(1,'c_dv',ls_nulo)
		this.setfocus()
		this.setcolumn('c_dv')
	end if
end if
dw_mensajes.accepttext()
end event

event retrieveend;// vhfb - inicio --  codificacion para validar que segun el mensaje seleccionado en buscar 
// refleje el radio correcto
if  isnull(w_crear_mensajes.dw_mensajes.getitemnumber(1,'numero') ) then
	w_crear_mensajes.rb_rut.checked= true
	w_crear_mensajes.rb_nro_ctto.checked= false

else
     w_crear_mensajes.rb_rut.checked= false
	w_crear_mensajes.rb_nro_ctto.checked= true
	w_crear_mensajes.dw_mensajes.setcolumn('base')
	w_crear_mensajes.dw_mensajes.setfocus()
end if  
// vhfb - termino --  codificacion para validar que segun el mensaje seleccionado en buscar 
// refleje el radio correcto
end event

type cb_cerrar from commandbutton within w_crear_mensajes
integer x = 2459
integer y = 1780
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_crear_mensajes)
end event

type cb_grabar from commandbutton within w_crear_mensajes
integer x = 32
integer y = 1780
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;long		ret, ll_resp, ll_rut, ll_count
Double	ll_numero, ll_descuento
datetime	ldt_fecha_hoy, ldt_fecha_crea,ldt_fecha_fin
string	ls_mensaje,ls_usuario, ls_sw='S',ls_base,ls_serie, ls_est_gestion, ls_aplica

// VHFB - inicio - valida rut o contrato valido para grabar
if f_valida_grabado() = 0 then
	return
end if 
// VHFB - termino - valida rut o contrato valido para grabar

// VHFB - inicio - valida rut o contrato ya presenta mensajes activos con descuento definido
if f_valida_existencia_previa_descuentos()>0 and dw_mensajes.getitemNumber(1,'mensajes_descuento')>0  then
	messagebox("Advertencia","Existen mensajes previos activos que ya presentan descuento, no se puede grabar el mensaje.",StopSign!)
	return
end if 
// VHFB - termino - valida rut o contrato ya presenta mensajes activos con descuento definido


dw_mensajes.setitem(1,'mensajes_estado_gestion','A')
dw_mensajes.accepttext()

// VHFB - inicio - valida que si aplica descuento se ingrese el valor del descuento
ls_aplica			= dw_mensajes.getitemstring(1,'mensajes_aplica_a')
ll_descuento		= dw_mensajes.getitemNumber(1,'mensajes_descuento')
if ls_aplica<>'N' and (ll_descuento =0 or isnull(ll_descuento)) then
	messagebox('Error','Debe ingresar un porcentaje de descuento a aplicar',stopsign!)
	return
end if 
string ls_estado_descuento
select estado into :ls_estado_descuento from MENSAJES_DESCUENTO_PORCENTAJES 
where porcentaje = :ll_descuento
USING	sqlca;
if sqlca.sqlcode=0 then
	if ls_aplica<>'N' and ls_estado_descuento = 'N'  then
		messagebox('Error','El porcentaje no se encuentra VIGENTE por lo que no se puede asignar.',stopsign!)
		return
	end if 
end if 
// VHFB - termino - valida que si aplica descuento se ingrese el valor del descuento


ldt_fecha_hoy		= datetime(date(gdt_fec_sistema),time('00:00:00'))
ls_base				= dw_mensajes.GetItemString(1,'base')
ls_serie				= dw_mensajes.GetItemString(1,'serie')
ll_numero			= dw_mensajes.GetItemNumber(1,'numero')
ll_rut					= dw_mensajes.GetItemNumber(1,'rut')
ldt_fecha_crea		= dw_mensajes.GetItemDatetime(1,'fecha_creacion')
ldt_fecha_fin		= dw_mensajes.GetItemDatetime(1,'fecha_fin')
ls_mensaje			= dw_mensajes.GetItemString(1,'mensajes_mensaje')
ls_est_gestion		= dw_mensajes.GetItemString(1,'mensajes_estado_gestion')


if ldt_fecha_fin <= ldt_fecha_hoy then
	messagebox('Advertencia','La Fecha de Expiración No puede ser Menor o Igual a la Fecha Actual')
	dw_mensajes.setitem(1,'fecha_fin',ldt_fecha_hoy)
	dw_mensajes.setfocus()
	dw_mensajes.setcolumn('fecha_fin')
	ls_sw		= 'N'
end if


  SELECT "CADENA"."RUT"  
    INTO :ll_rut  
    FROM "CADENA"  
   WHERE ( "CADENA"."CODIGO" = :ls_base ) AND  
         ( "CADENA"."SERIE" = :ls_serie ) AND  
         ( "CADENA"."NUMERO" = :ll_numero )   
  USING	SQLCA;
	if sqlca.sqlcode=0 then
		dw_mensajes.setitem(1,'rut',ll_rut)   
	end if

if isnull(ls_mensaje) or ls_mensaje='' then
	messagebox('Advertencia','Debe Ingresar Mensaje')
	dw_mensajes.setfocus()
	dw_mensajes.setcolumn('mensajes_mensaje')
	ls_sw		= 'N'
	
elseif isnull(ldt_fecha_crea) then
	messagebox('Advertencia','Debe Ingresar Fecha de Creación')
	dw_mensajes.setfocus()
	dw_mensajes.setcolumn('fecha_creacion')
	ls_sw		= 'N'

elseif isnull(ldt_fecha_fin) then
	messagebox('Advertencia','Debe Ingresar Fecha de Caducación')
	dw_mensajes.setfocus()
	dw_mensajes.setcolumn('fecha_fin')
	ls_sw		= 'N'

elseif isnull(ll_rut) or ll_rut=0 then
	messagebox('Advertencia','Debe Ingresar RUT')
	dw_mensajes.setfocus()
	dw_mensajes.setcolumn('rut')
	ls_sw		= 'N'
	
elseif isnull(ls_est_gestion) or ls_est_gestion='' then
	messagebox('Advertencia','Debe Ingresar Estado Gestión')
	dw_mensajes.setfocus()
	dw_mensajes.setcolumn('mensajes_estado_gestion')
	ls_sw		= 'N'
end if

if ls_sw='S' then
	dw_mensajes.setitem(1,'rut',ll_rut)
	dw_mensajes.setitem(1,'fecha_creacion',ldt_fecha_crea)
	dw_mensajes.setitem(1,'fecha_fin',ldt_fecha_fin)
	dw_mensajes.setitem(1,'mensajes_mensaje',ls_mensaje)
		
	SELECT	MAX("MENSAJES"."CORRELATIVO")  
	INTO 		:ll_count  
	FROM 		"MENSAJES"  
	USING		sqlca;
	if ll_count=0 or isnull(ll_count) then
		ll_count	= 1
	else
		ll_count ++
	end if
	dw_mensajes.setitem(1,'mensajes_correlativo',ll_count)

		ret	= MessageBox('Actualizar', "Desea Grabar MENSAJE", Question!, YesNo!, 2)
	IF ret = 1 THEN
		if dw_mensajes.update()=1 then
			commit;
			
			string ls_aplica_a_nulo
			Setnull(ls_aplica_a_nulo)
			update mensajes set aplica_a = :ls_aplica_a_nulo where aplica_a = 'N'   
			USING	sqlca;
			if sqlca.sqlcode=0 then
				commit;
			end if 
					
			
			dw_mensajes.setitem(1,'c_estado','G')
			ll_resp					= messagebox("Grabar","Grabación Exitosa, desea Limpiar Pantalla",Exclamation!,YesNo!,2)
			if ll_resp = 1 then
				dw_mensajes.reset()
				dw_mensajes.insertrow(0)
				dw_contratos.reset()
				ldt_fecha_hoy			= datetime(date(gdt_fec_sistema),time('00:00:00'))
				dw_mensajes.setitem(1,'fecha_creacion',ldt_fecha_hoy)
				dw_mensajes.setitem(1,'fecha_fin',ldt_fecha_hoy)
				dw_mensajes.setitem(1,'autor',gs_user)
				
					SELECT		MAX("MENSAJES"."CORRELATIVO")  
					INTO 			:ll_count  
					FROM 		"MENSAJES"  
					USING		sqlca;
					if ll_count=0 or isnull(ll_count) then
						ll_count				= 1
					else
						ll_count ++
					end if
					dw_mensajes.setitem(1,'mensajes_correlativo',ll_count)
					dw_mensajes.accepttext()
					rb_rut.triggerevent(clicked!)
			end if	
		else
			rollback;
			messagebox("Error Grabar","Error al Grabar MENSAJE SQL: "+sqlca.sqlerrtext)
		end if
	end if
end if
end event

