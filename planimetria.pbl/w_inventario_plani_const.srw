forward
global type w_inventario_plani_const from window
end type
type cb_3 from commandbutton within w_inventario_plani_const
end type
type cb_2 from commandbutton within w_inventario_plani_const
end type
type cb_1 from commandbutton within w_inventario_plani_const
end type
type dw_inventario_plani from datawindow within w_inventario_plani_const
end type
end forward

global type w_inventario_plani_const from window
integer width = 2327
integer height = 1296
boolean titlebar = true
string title = "Asignación de Sepulturas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_inventario_plani dw_inventario_plani
end type
global w_inventario_plani_const w_inventario_plani_const

on w_inventario_plani_const.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_inventario_plani=create dw_inventario_plani
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_inventario_plani}
end on

on w_inventario_plani_const.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_inventario_plani)
end on

event open;string estado,base,serie,status,base_fall,serie_fall,numero,sub_sector
Double	contrato
DataWindowChild idw_promesas

numero = Message.StringParm

SELECT "INVENTARIO_PLANI"."SUB_SECTOR"  
INTO :sub_sector  
FROM "INVENTARIO_PLANI"  
WHERE ( "INVENTARIO_PLANI"."SECTOR" =:gs_sector  ) AND ( "INVENTARIO_PLANI"."SEPULTURA" =:numero  )   ;
gs_ventana = 'w_inventario_plani_const'
f_valida_objeto()
dw_inventario_plani.settransobject(sqlca)
//dw_n_sep------> dddw para el campo numero
//if gs_sector = '2ND82II' or gs_sector = '2ND82I' then
//	dw_inventario_plani.getchild('numero',idw_promesas)
//	idw_promesas.settransobject(sqlca)
//	idw_promesas.retrieve(sub_sector)
//else
//	dw_inventario_plani.getchild('numero',idw_promesas)
//	idw_promesas.settransobject(sqlca)
//	idw_promesas.retrieve(gs_sector)
//end if	

if dw_inventario_plani.retrieve(gs_base,gs_serie,gi_numero) = 0 then
	close(w_inventario_plani_const)
else
	base         = dw_inventario_plani.getitemstring(1,'base')
	serie        = dw_inventario_plani.getitemstring(1,'serie')
	contrato     = dw_inventario_plani.getitemnumber(1,'numero')
	status       = dw_inventario_plani.getitemstring(1,'status')
	sub_sector   = dw_inventario_plani.getitemstring(1,'sub_sector')

	base     = dw_inventario_plani.getitemstring(1,'base')
	serie    = dw_inventario_plani.getitemstring(1,'serie')
	contrato = dw_inventario_plani.getitemnumber(1,'numero')
	status = dw_inventario_plani.getitemstring(1,'status')
	SELECT "CADENA"."ESTADO"  
	INTO :estado  
	FROM "CADENA"  
	WHERE ( "CADENA"."CODIGO" = :base ) AND ( "CADENA"."SERIE" = :serie ) AND ( "CADENA"."NUMERO" = :contrato )   ;
	this.title = 'Promesa :'+gs_base+' - '+gs_serie+' - '+string(gi_numero,'###,###,##0')+'                 ( Estado: '+estado+' ).' 
	if isnull(estado) or estado = '' then
		dw_inventario_plani.object.t_1.color = rgb(0,0,255)
		dw_inventario_plani.object.t_1.text = 'Sepultura No Asignada.'
	elseif status <> estado then
		dw_inventario_plani.object.t_1.text = 'El Estado de la Promesa es Diferente'
	else
		dw_inventario_plani.object.t_1.text = ''
	end if
end if
end event

type cb_3 from commandbutton within w_inventario_plani_const
integer x = 507
integer y = 1024
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cta.Cte."
end type

event clicked;gs_base   = dw_inventario_plani.getitemstring(1,'base')
gs_serie  = dw_inventario_plani.getitemstring(1,'serie')
gi_numero = dw_inventario_plani.getitemnumber(1,'numero')
gi_tipo_busqueda = 8
Open(w_listado_contratos)
end event

type cb_2 from commandbutton within w_inventario_plani_const
integer x = 101
integer y = 1024
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;integer  ret,capacidad
datetime fecha_sys
string   area,sector,sub_sector,sepultura_nd,n_sep,sector_sep
long     sepultura,nro_tecnico


gs_base   = dw_inventario_plani.getitemstring(1,'base')
gs_serie  = dw_inventario_plani.getitemstring(1,'serie')
gi_numero = dw_inventario_plani.getitemnumber(1,'numero')

SELECT "INVENTARIO_PLANI"."SEPULTURA","INVENTARIO_PLANI"."SECTOR"  
INTO :n_sep,:sector_sep 
FROM "INVENTARIO_PLANI"  
WHERE ( "INVENTARIO_PLANI"."BASE"   = :gs_base ) AND  
	   ( "INVENTARIO_PLANI"."SERIE"  = :gs_serie ) AND  
	   ( "INVENTARIO_PLANI"."NUMERO" = :gi_numero )   ;
if sqlca.sqlcode = 0 then
	if MessageBox("Contrato Asignado", ' Este Contrato esta asignado en el Sector: '+sector_sep+' y Sepultura: '+n_sep+&
					  '~n~n~n~n¿ Desea Actualizar ?',Question!, OKCancel!, 2) = 2 then
		return
	end if
end if
if MessageBox("Grabar Cambios", "¿ Desea grabar los cambios ?",Exclamation!, OKCancel!, 2) = 1 then
	SELECT distinct sysdate INTO :fecha_sys FROM "AGENTES"  ;
	dw_inventario_plani.setitem(1,'log_usuario',gs_user)
	dw_inventario_plani.setitem(1,'fecha_log',fecha_sys)
	dw_inventario_plani.setitem(1,'fecha_status',fecha_sys)
	dw_inventario_plani.accepttext ()
	SELECT "BASE_PLANI"."AREA" INTO :area FROM "BASE_PLANI" WHERE "BASE_PLANI"."SECTOR" = :gs_sector ;
	capacidad    = dw_inventario_plani.getitemnumber(1,'capacidad')
	sector       = dw_inventario_plani.getitemstring(1,'sector')
	sub_sector   = dw_inventario_plani.getitemstring(1,'sub_sector')
	nro_tecnico  = dw_inventario_plani.getitemnumber(1,'numero_tec')
	if isnull(dw_inventario_plani.getitemnumber(1,'numero')) and &
	   isnull(dw_inventario_plani.getitemstring(1,'base')) and &
		isnull(dw_inventario_plani.getitemstring(1,'serie')) then
		setnull(capacidad)
		setnull(sector)
		setnull(area)
		setnull(sub_sector)
		setnull(sepultura_nd)
		setnull(nro_tecnico)
	end if
	if gs_sector <> '2ND82II' or gs_sector <> '2ND82I' then
		sepultura_nd = dw_inventario_plani.getitemstring(1,'sepultura')
		ret    = dw_inventario_plani.update()
		if ret = 1 then
			UPDATE "PAGO_OFERTA"  
			SET "CAPACIDAD"   = :capacidad,   
				 "AREA"        = :area,   
				 "SECTOR"      = :sector,   
				 "SEPULTURA"   = :sepultura_nd,   
				 "NRO_TECNICO" = :nro_tecnico  
			WHERE ( "PAGO_OFERTA"."SERIE"      = :gs_serie ) AND  
					( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) ;
			if sqlca.sqlcode = 0 then
				commit;
				if MessageBox("Plano Sector (O)", "¿ Desea Actualizar plano sector ?",Question!, OKCancel!, 2) = 1 then
					w_plano_sector_parque.wf_pinta_sector(w_plano_sector_parque.dw_plano_sector_parque)
					close(w_inventario_plani)
				end if
			else
				UPDATE "CONTRATO"  
				SET "SECTOR" = :sector,   
				"SEPULTURA"  = :sepultura_nd,   
				"ZONA"       = :area, 
				"CAPACIDAD"  = :capacidad, 
				"NRO_TEC"    = :nro_tecnico  
				WHERE ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
				( "CONTRATO"."NRO_CONTRATO"  = :gi_numero )   ;
				if sqlca.sqlcode = 0 then
					commit;
					if MessageBox("Plano Sector (C)", "¿ Desea Actualizar plano sector ?",Question!, OKCancel!, 2) = 1 then
					w_plano_sector_parque.wf_pinta_sector(w_plano_sector_parque.dw_plano_sector_parque)
						close(w_inventario_plani)
					end if
				else
					ROLLBACK;
					MessageBox("Error", "Favor dar aviso al Depto. de Informatica (01)",stopsign! )
					close(w_inventario_plani)
				end if
			end if
		else
			ROLLBACK;
				MessageBox("Error", "Favor dar aviso al Depto. de Informatica (02)",stopsign! )
				close(w_inventario_plani)
		end if
	else
		sepultura_nd   = dw_inventario_plani.getitemstring(1,'sepultura')
		ret = dw_inventario_plani.update()
		if ret = 1 then
			UPDATE "PAGO_OFERTA"  
			SET "CAPACIDAD"   = :capacidad,   
				 "AREA"        = :area,   
				 "SECTOR"      = :sub_sector,   
				 "SEPULTURA"   = :sepultura_nd,   
				 "NRO_TECNICO" = :nro_tecnico  
			WHERE ( "PAGO_OFERTA"."SERIE"      = :gs_serie ) AND  
					( "PAGO_OFERTA"."NRO_OFERTA" = :gi_numero ) ;
			if sqlca.sqlcode = 0 then
				commit;
				if MessageBox("Plano Sector (O)", "¿ Desea Actualizar plano sector ?",Question!, OKCancel!, 2) = 1 then
					w_plano_sector_parque.wf_pinta_sector(w_plano_sector_parque.dw_plano_sector_parque)
					close(w_inventario_plani)
				end if
			else
				UPDATE "CONTRATO"  
				SET "SECTOR" = :sub_sector,   
				"SEPULTURA"  = :sepultura_nd,   
				"ZONA"       = :area, 
				"CAPACIDAD"  = :capacidad, 
				"NRO_TEC"    = :nro_tecnico  
				WHERE ( "CONTRATO"."SERIE_C" = :gs_serie ) AND  
				( "CONTRATO"."NRO_CONTRATO"  = :gi_numero )   ;
				if sqlca.sqlcode = 0 then
					commit;
					if MessageBox("Plano Sector (C)", "¿ Desea Actualizar plano sector ?",Question!, OKCancel!, 2) = 1 then
						w_plano_sector_parque.wf_pinta_sector(w_plano_sector_parque.dw_plano_sector_parque)
						close(w_inventario_plani)
					end if
				else
					ROLLBACK;
					MessageBox("Error", "Favor dar aviso al Depto. de Informatica (01)",stopsign! )
					close(w_inventario_plani)
				end if
			end if
		else
			ROLLBACK;
				MessageBox("Error", "Favor dar aviso al Depto. de Informatica (02)",stopsign! )
				close(w_inventario_plani)
		end if
	end if
end if
end event

type cb_1 from commandbutton within w_inventario_plani_const
integer x = 1815
integer y = 1024
integer width = 402
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

event clicked;close(w_inventario_plani_const)
end event

type dw_inventario_plani from datawindow within w_inventario_plani_const
integer x = 114
integer y = 56
integer width = 2103
integer height = 860
integer taborder = 10
string title = "none"
string dataobject = "dw_inventario_plani_const"
boolean border = false
boolean livescroll = true
end type

event itemchanged;datetime fecha_sys
string status,nulo_char
long nulo_long

setnull(nulo_char)
setnull(nulo_long)

SELECT distinct sysdate INTO :fecha_sys FROM "AGENTES"  ;
setitem(1,'log_usuario',gs_user)
setitem(1,'fecha_log',fecha_sys)
setitem(1,'fecha_status',fecha_sys)
accepttext ()
status =  getitemstring(1,'status')
if status = 'P' or status = 'N' or status = 'R' or status = '1' then
	setitem(1,'base'  ,nulo_char)
	setitem(1,'serie' ,nulo_char)
	setitem(1,'numero',nulo_long)
	setitem(1,'rut'   ,nulo_long)
	accepttext ()	
else
	setitem(1,'base'  ,gs_base)
	setitem(1,'serie' ,gs_serie)
	setitem(1,'numero',gi_numero)
	setitem(1,'rut'   ,gi_rut)
	accepttext ()	
end if
end event

