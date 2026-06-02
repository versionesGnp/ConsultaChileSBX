forward
global type w_actualizar_direccion_cliente from window
end type
type cb_ordenar from commandbutton within w_actualizar_direccion_cliente
end type
type cb_procesar_bkp from commandbutton within w_actualizar_direccion_cliente
end type
type cb_1 from commandbutton within w_actualizar_direccion_cliente
end type
type cb_cerrar from commandbutton within w_actualizar_direccion_cliente
end type
type cb_grabar from commandbutton within w_actualizar_direccion_cliente
end type
type cb_procesar from commandbutton within w_actualizar_direccion_cliente
end type
type dw_lista from datawindow within w_actualizar_direccion_cliente
end type
end forward

global type w_actualizar_direccion_cliente from window
integer width = 3470
integer height = 1512
boolean titlebar = true
string title = "Actualizar Dirección Cliente"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_ordenar cb_ordenar
cb_procesar_bkp cb_procesar_bkp
cb_1 cb_1
cb_cerrar cb_cerrar
cb_grabar cb_grabar
cb_procesar cb_procesar
dw_lista dw_lista
end type
global w_actualizar_direccion_cliente w_actualizar_direccion_cliente

on w_actualizar_direccion_cliente.create
this.cb_ordenar=create cb_ordenar
this.cb_procesar_bkp=create cb_procesar_bkp
this.cb_1=create cb_1
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.cb_procesar=create cb_procesar
this.dw_lista=create dw_lista
this.Control[]={this.cb_ordenar,&
this.cb_procesar_bkp,&
this.cb_1,&
this.cb_cerrar,&
this.cb_grabar,&
this.cb_procesar,&
this.dw_lista}
end on

on w_actualizar_direccion_cliente.destroy
destroy(this.cb_ordenar)
destroy(this.cb_procesar_bkp)
destroy(this.cb_1)
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.cb_procesar)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_actualizar_direccion_cliente)
dw_lista.settransobject(sqlca)


end event

type cb_ordenar from commandbutton within w_actualizar_direccion_cliente
integer x = 1870
integer y = 1288
integer width = 315
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETSORT(NULO)
dw_lista.SORT()
end event

type cb_procesar_bkp from commandbutton within w_actualizar_direccion_cliente
boolean visible = false
integer x = 558
integer y = 1440
integer width = 384
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Procesar BKP"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_pos,ll_pos_aux,ll_numero,ll_pos_ini,ll_pos_1,ll_pos_2,&
			ll_largo
String	ls_dire,ls_tipo_via,ls_dire_aux,ls_direccion,ls_numero,ls_sw,ls_string,ls_resto_dir
SetPointer(HourGlass!)
ll_tot_reg							= dw_lista.retrieve()
for ll_indi=1 to ll_tot_reg
	dw_lista.scrolltorow(ll_indi)
	setnull(ls_tipo_via);setnull(ls_dire_aux);setnull(ls_dire);setnull(ll_pos);setnull(ll_pos_ini)
	setnull(ls_direccion);setnull(ll_largo);setnull(ls_string)
	setnull(ls_numero)
	ls_dire							= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
	dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
	dw_lista.accepttext()
	if ls_dire <> '-' then
				ll_pos						= Pos(ls_dire,' NRO.')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' Nº '+trim(mid(ls_dire,(ll_pos + 5)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,' NRO ')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' Nº '+trim(mid(ls_dire,(ll_pos + 5)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,' N.')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' Nº '+trim(mid(ls_dire,(ll_pos + 3)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,' DP ')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' D/ '+trim(mid(ls_dire,(ll_pos + 4)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,' DP.')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' D/ '+trim(mid(ls_dire,(ll_pos + 4)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,'D/')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' D/ '+trim(mid(ls_dire,(ll_pos + 2)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,'DEPTO.')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' D/ '+trim(mid(ls_dire,(ll_pos + 6)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,' DEPTO ')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' D/ '+trim(mid(ls_dire,(ll_pos + 7)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,'DEPTO')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' D/ '+trim(mid(ls_dire,(ll_pos + 5)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,'DEP.')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' D/ '+trim(mid(ls_dire,(ll_pos + 4)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,' BL ')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' B/ '+trim(mid(ls_dire,(ll_pos + 4)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,' BL.')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' B/ '+trim(mid(ls_dire,(ll_pos + 4)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
		ll_pos						= Pos(ls_dire,'BLOCK')
		if ll_pos>0 then
			ls_dire	= trim(mid(ls_dire,1,(ll_pos - 1)))+' B/ '+trim(mid(ls_dire,(ll_pos + 5)))
			if len(ls_dire)>40 then ls_dire=trim(mid(ls_dire,1,40))
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
			dw_lista.accepttext()
			ls_dire					= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		end if
	//	////// Opcion Nº
	//	ll_pos							= Pos(ls_dire,'Nº')
	//	ll_pos_ini						= ll_pos
	//	if ll_pos_ini>0 then
	//		ll_pos						= ll_pos + 2
	//		ls_dire_aux					= trim(mid(ls_dire,ll_pos))
	//		ls_dire_aux					= trim(ls_dire_aux)
	//		ll_pos_aux					= Pos(ls_dire_aux, " ")
	//		if ll_pos_aux>0 then
	//			ll_numero				= long(trim(mid(ls_dire_aux,1,ll_pos_aux)))
	//			ls_numero				= trim(mid(ls_dire_aux,1,ll_pos_aux))
	//			if ll_numero>0 then
	//				ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)+' '+mid(ls_dire_aux,ll_pos_aux)
	//				messagebox("1 direccion + Nº",ls_direccion+ ' + '+ls_numero)
	//			end if
	//		else
	//			ll_numero				= long(trim(ls_dire_aux))
	//			if ll_numero>0 then
	//				ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)
	//				ls_numero			= trim(ls_dire_aux)
	//				messagebox("1 direccion + Nº",ls_direccion+ ' + '+ls_numero)
	//			end if
	//		end if
	//	end if
	//	////// Opcion N°
	//	ll_pos							= Pos(ls_dire,'N°')
	//	ll_pos_ini						= ll_pos
	//	if ll_pos_ini>0 then
	//		ll_pos						= ll_pos + 2
	//		ls_dire_aux					= trim(mid(ls_dire,ll_pos))
	//		ls_dire_aux					= trim(ls_dire_aux)
	//		ll_pos_aux					= Pos(ls_dire_aux, " ")
	//		if ll_pos_aux>0 then
	//			ll_numero				= long(trim(mid(ls_dire_aux,1,ll_pos_aux)))
	//			ls_numero				= trim(mid(ls_dire_aux,1,ll_pos_aux))
	//			if ll_numero>0 then
	//				ls_direccion		= trim(mid(ls_dire,1,ll_pos_ini - 1))+' '+trim(mid(ls_dire_aux,ll_pos_aux))
	//				messagebox("2 direccion + Nº",ls_direccion+ ' + '+ls_numero)
	//			end if
	//		else
	//			ll_numero				= long(trim(ls_dire_aux))
	//			if ll_numero>0 then
	//				ls_direccion		= trim(mid(ls_dire,1,ll_pos_ini - 1))
	//				ls_numero			= trim(ls_dire_aux)
	//				messagebox("2 direccion + N°",ls_direccion+ ' + '+ls_numero)
	//			end if
	//		end if
	//	end if
//		////// Opcion sin Nº / N°
//		ll_pos_1						= Pos(ls_dire,'N°')
//		ll_pos_2						= Pos(ls_dire,'Nº')
//		if ll_pos_1>0 or ll_pos_2>0 then
//		else
//			ll_largo						= len(ls_dire)
//			ll_pos_ini					= Pos(ls_dire, " ")
//			ls_string					= trim(mid(ls_dire,1,ll_pos_ini))
//			ls_direccion				= ls_string
//			if long(ls_string)>0 then
//				DO WHILE ll_pos_ini>0 and ll_pos_ini<=ll_largo
//					ls_dire_aux			= trim(mid(ls_dire,ll_pos_ini))
//					ll_pos_ini			= Pos(ls_dire_aux, " ")
//					ls_resto_dir		= trim(mid(ls_dire_aux,ll_pos_ini))
//					if ll_pos_ini=0 and len(ls_dire_aux)>0 then ll_pos_ini=len(ls_dire_aux)
//					ls_string			= trim(mid(ls_dire_aux,1,ll_pos_ini))
//					if long(ls_string)>0 then
//						ls_numero		= ls_string
//						ll_pos_ini		= 0
//						if ls_resto_dir = ls_numero then ls_resto_dir=''
//					else
//						ls_direccion	= ls_direccion+' '+ls_string
//						ls_numero		= ls_string
//					end if
//					ls_dire				= ls_dire_aux
//					ll_largo				= len(ls_dire)
//				LOOP
//				if len(ls_resto_dir)>0 then ls_direccion = ls_direccion+' '+ls_resto_dir
//				messagebox("",ls_direccion +' + '+ls_numero)
//			else
//				DO WHILE ll_pos_ini>0 and ll_pos_ini<=ll_largo
//					ls_dire_aux			= trim(mid(ls_dire,ll_pos_ini))
//					ll_pos_ini			= Pos(ls_dire_aux, " ")
//					ls_resto_dir		= trim(mid(ls_dire_aux,ll_pos_ini))
//					if ll_pos_ini=0 and len(ls_dire_aux)>0 then ll_pos_ini=len(ls_dire_aux)
//					ls_string			= trim(mid(ls_dire_aux,1,ll_pos_ini))
//					if long(ls_string)>0 then
//						ls_numero		= ls_string
//						ll_pos_ini		= 0
//						if ls_resto_dir = ls_numero then ls_resto_dir=''
//					else
//						ls_direccion	= ls_direccion+' '+ls_string
//						ls_numero		= ls_string
//					end if
//					ls_dire				= ls_dire_aux
//					ll_largo				= len(ls_dire)
//				LOOP
//				if len(ls_resto_dir)>0 then ls_direccion = ls_direccion+' '+ls_resto_dir
//				messagebox("",ls_direccion +' + '+ls_numero)
//			end if
//		end if


////		////// Opcion depto 	FALTA
//		ll_pos							= Pos(ls_dire,'Nº')
//		ll_pos_ini						= ll_pos
//		if ll_pos_ini>0 then
//			ll_pos						= ll_pos + 2
//			ls_dire_aux					= trim(mid(ls_dire,ll_pos))
//			ls_dire_aux					= trim(ls_dire_aux)
//			ll_pos_aux					= Pos(ls_dire_aux, " ")
//			if ll_pos_aux>0 then
//				ll_numero				= long(trim(mid(ls_dire_aux,1,ll_pos_aux)))
//				ls_numero				= trim(mid(ls_dire_aux,1,ll_pos_aux))
//				if ll_numero>0 then
//					ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)+' '+mid(ls_dire_aux,ll_pos_aux)
//					messagebox("1 direccion + Nº",ls_direccion+ ' + '+ls_numero)
//				end if
//			else
//				ll_numero				= long(trim(ls_dire_aux))
//				if ll_numero>0 then
//					ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)
//					ls_numero			= trim(ls_dire_aux)
//					messagebox("1 direccion + Nº",ls_direccion+ ' + '+ls_numero)
//				end if
//			end if
//		end if

	end if
next
dw_lista.accepttext()
SetPointer(Arrow!)
end event

type cb_1 from commandbutton within w_actualizar_direccion_cliente
boolean visible = false
integer x = 443
integer y = 1556
integer width = 343
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Proceso 1"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_pos
String	ls_dire,ls_tipo_via,ls_dire_aux
SetPointer(HourGlass!)
ll_tot_reg	= dw_lista.retrieve()
for ll_indi=1 to ll_tot_reg
	dw_lista.scrolltorow(ll_indi)
	setnull(ls_tipo_via);setnull(ls_dire_aux);setnull(ls_dire)
	ls_dire	= dw_lista.getitemstring(ll_indi,'direccion_p')
	ll_pos	= Pos(ls_dire, " ")
//	if mid(ls_dire,1,2)='A ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,3)
//	elseif mid(ls_dire,1,2)='A.' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,3)
//	elseif mid(ls_dire,1,3)='A.V' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,4)
//	elseif mid(ls_dire,1,4)='AAV ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,5)='AVDA ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,6)='AAVDA ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,7)
//	elseif mid(ls_dire,1,3)='AV ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,4)
//	elseif mid(ls_dire,1,3)='AV.' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,4)
//	elseif mid(ls_dire,1,4)='AV. ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,4)='AVD.' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,3)='AVD' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,4)
//	elseif mid(ls_dire,1,5)='AVDA ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,5)='AVDA.' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,6)='AVDA. ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,7)
//	elseif mid(ls_dire,1,8)='AVENIDA ' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,9)
//	elseif mid(ls_dire,1,8)='AVENIDA.' then
//		ls_tipo_via	= 'A'
//		ls_dire_aux	= mid(ls_dire,9)
//		
//	elseif mid(ls_dire,1,2)='C.' then
//		ls_tipo_via	= 'C'
//		ls_dire_aux	= mid(ls_dire,3)
//	elseif mid(ls_dire,1,2)='C/' then
//		ls_tipo_via	= 'C'
//		ls_dire_aux	= mid(ls_dire,3)
//	elseif mid(ls_dire,1,2)='C ' then
//		ls_tipo_via	= 'C'
//		ls_dire_aux	= mid(ls_dire,3)
//	elseif mid(ls_dire,1,6)='CALLE ' then
//		ls_tipo_via	= 'C'
//		ls_dire_aux	= mid(ls_dire,7)
//	elseif mid(ls_dire,1,6)='CALLE-' then
//		ls_tipo_via	= 'C'
//		ls_dire_aux	= mid(ls_dire,7)
//		
//	elseif mid(ls_dire,1,9)='CALLEJON ' then
//		ls_tipo_via	= 'E'
//		ls_dire_aux	= mid(ls_dire,10)
//		
//	elseif mid(ls_dire,1,4)='CAM ' then
//		ls_tipo_via	= 'M'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,4)='CAM.' then
//		ls_tipo_via	= 'M'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,7)='CAMINO ' then
//		ls_tipo_via	= 'M'
//		ls_dire_aux	= mid(ls_dire,8)
//		
//	elseif mid(ls_dire,1,8)='CASILLA ' then
//		ls_tipo_via	= 'I'
//		ls_dire_aux	= mid(ls_dire,9)
//		
//	elseif mid(ls_dire,1,4)='PAJ.' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,5)='PAJE ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,5)='PAJE.' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,6)='PAJE. ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,7)
//	elseif mid(ls_dire,1,4)='PAS ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,4)='PAS.' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,7)='PASAJE ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,8)
//	elseif mid(ls_dire,1,8)='PASAJE  ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,9)
//	elseif mid(ls_dire,1,6)='PASAJ ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,7)
//		
//	elseif mid(ls_dire,1,6)='PASEO ' then
//		ls_tipo_via	= 'S'
//		ls_dire_aux	= mid(ls_dire,7)
//		
//	elseif mid(ls_dire,1,5)='PASJ ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,5)='PASJ.' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,6)='PASJE.' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,7)
//	elseif mid(ls_dire,1,7)='PASJE. ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,8)
//	elseif mid(ls_dire,1,3)='PJ ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,4)
//	elseif mid(ls_dire,1,4)='PJ  ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,3)='PJ.' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,4)
//	elseif mid(ls_dire,1,4)='PJ. ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,4)='PJE ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,4)='PJE.' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,5)='PJE. ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,4)='PSJ ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,5)
//	elseif mid(ls_dire,1,5)='PSJE ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,6)
//	elseif mid(ls_dire,1,6)='PSJE. ' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,7)
//	elseif mid(ls_dire,1,5)='PSJE.' then
//		ls_tipo_via	= 'P'
//		ls_dire_aux	= mid(ls_dire,6)
//	end if
//	
//	if not isnull(ls_tipo_via) then
//		dw_lista.setitem(ll_indi,'tipo_via',ls_tipo_via)
//		dw_lista.setitem(ll_indi,'direccion_p',ls_dire_aux)
//	else
//		ls_tipo_via	= '0'
//		dw_lista.setitem(ll_indi,'tipo_via',ls_tipo_via)
//	end if
next
SetPointer(Arrow!)
end event

type cb_cerrar from commandbutton within w_actualizar_direccion_cliente
integer x = 3072
integer y = 1288
integer width = 315
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_actualizar_direccion_cliente)
end event

type cb_grabar from commandbutton within w_actualizar_direccion_cliente
integer x = 951
integer y = 1288
integer width = 315
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;dw_lista.accepttext()
if dw_lista.update()=1 then
	commit;
	messagebox("Grabar","Grabación Exitosa")
else
	rollback;
	messagebox("Error Grabar","Error al Grabar SQL: "+sqlca.sqlerrtext)
end if
end event

type cb_procesar from commandbutton within w_actualizar_direccion_cliente
integer x = 32
integer y = 1288
integer width = 315
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Procesar"
end type

event clicked;Long		ll_tot_reg,ll_indi,ll_pos,ll_pos_aux,ll_pos_ini,ll_pos_1,ll_pos_2,&
			ll_largo,ll_pos_real,ll_numero
String		ls_dire,ls_tipo_via,ls_dire_aux,ls_direccion,ls_numero,ls_sw,ls_string,ls_resto_dir,&
			ls_depto,ls_block

SetPointer(HourGlass!)
ll_tot_reg							= dw_lista.retrieve()
for ll_indi=1 to ll_tot_reg
	dw_lista.scrolltorow(ll_indi)
	setnull(ls_tipo_via);setnull(ls_dire_aux);setnull(ls_dire);setnull(ll_pos);setnull(ll_pos_ini)
	setnull(ls_direccion);setnull(ll_largo);setnull(ls_string);setnull(ls_numero);setnull(ll_pos_real)
	ls_dire							= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
	ls_tipo_via						= trim(dw_lista.getitemstring(ll_indi,'tipo_via'))
	dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
	dw_lista.accepttext()
	if ls_dire <> '-' and ls_tipo_via<>'I' then
		// Opcion sin Nº / N°
		ll_pos_1						= Pos(ls_dire,'N°')
		ll_pos_2						= Pos(ls_dire,'Nº')
		if ll_pos_1>0 or ll_pos_2>0 then
		else
			ll_largo						= len(ls_dire)
			ll_pos_ini					= Pos(ls_dire, " ")
			ls_string					= trim(mid(ls_dire,1,ll_pos_ini))
			ls_direccion				= ls_string
			if long(ls_string)>0 then
				DO WHILE ll_pos_ini>0 and ll_pos_ini<=ll_largo
					ls_dire_aux			= trim(mid(ls_dire,ll_pos_ini))
					ll_pos_ini			= Pos(ls_dire_aux, " ")
					ll_pos_real			= ll_pos_ini
					ls_resto_dir		= trim(mid(ls_dire_aux,ll_pos_ini))
					if ll_pos_ini=0 and len(ls_dire_aux)>0 then ll_pos_ini=len(ls_dire_aux)
					ls_string			= trim(mid(ls_dire_aux,1,ll_pos_ini))
					if long(ls_string)>0 then
						ls_numero		= ls_string
						ll_pos_ini		= 0
						if ls_resto_dir = ls_numero then ls_resto_dir=''
					else
						ls_direccion	= ls_direccion+' '+ls_string
						ls_numero		= ls_string
						if ll_pos_real=0 or isnull(ll_pos_real) then 
							if trim(ls_numero) = trim(ls_resto_dir) then
								ls_numero		= ''
								ls_resto_dir	= ''
								exit
							end if
						end if
					end if
					ls_dire				= ls_dire_aux
					ll_largo				= len(ls_dire)
				LOOP
				if len(ls_resto_dir)>0 then ls_direccion = ls_direccion+' '+ls_resto_dir
				dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
				dw_lista.setitem(ll_indi,'numero_particular',ls_numero)
			else
				DO WHILE ll_pos_ini>0 and ll_pos_ini<=ll_largo
					ls_dire_aux			= trim(mid(ls_dire,ll_pos_ini))
					ll_pos_ini			= Pos(ls_dire_aux, " ")
					ls_resto_dir		= trim(mid(ls_dire_aux,ll_pos_ini))
					if ll_pos_ini=0 and len(ls_dire_aux)>0 then ll_pos_ini=len(ls_dire_aux)
					ls_string			= trim(mid(ls_dire_aux,1,ll_pos_ini))
					if long(ls_string)>0 then
						ls_numero		= ls_string
						ll_pos_ini			= 0
						if ls_resto_dir = ls_numero then ls_resto_dir=''
					else
						ls_direccion	= ls_direccion+' '+ls_string
						ls_numero		= ls_string
						if ll_pos_real=0 or isnull(ll_pos_real) then 
							if trim(ls_numero) = trim(ls_resto_dir) then
								ls_numero		= ''
								ls_resto_dir	= ''
								exit
							end if
						end if
					end if
					ls_dire				= ls_dire_aux
					ll_largo				= len(ls_dire)
				LOOP
				if len(ls_resto_dir)>0 then ls_direccion = ls_direccion+' '+ls_resto_dir
				dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
				dw_lista.setitem(ll_indi,'numero_particular',ls_numero)
			end if
		end if
	// Opcion Nº
		dw_lista.accepttext()
		ls_dire							= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		ll_pos							= Pos(ls_dire,'Nº')
		ll_pos_ini						= ll_pos
		if ll_pos_ini>0 then
			ll_pos						= ll_pos + 2
			ls_dire_aux					= trim(mid(ls_dire,ll_pos))
			ls_dire_aux					= trim(ls_dire_aux)
			ll_pos_aux					= Pos(ls_dire_aux, " ")
			if ll_pos_aux>0 then
				ll_numero				= Long(trim(mid(ls_dire_aux,1,ll_pos_aux)))
				ls_numero				= trim(mid(ls_dire_aux,1,ll_pos_aux))
				if ll_numero>0 or len(ls_numero)>0 then
					ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)+' '+mid(ls_dire_aux,ll_pos_aux)
					dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
					dw_lista.setitem(ll_indi,'numero_particular',ls_numero)
				end if
			else
				ll_numero				= long(trim(ls_dire_aux))
				if ll_numero>0 then
					ls_direccion			= mid(ls_dire,1,ll_pos_ini - 1)
					ls_numero			= trim(ls_dire_aux)
					dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
					dw_lista.setitem(ll_indi,'numero_particular',ls_numero)
				end if
			end if
		end if
		dw_lista.accepttext()
		ls_dire							= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
	// Opcion N°
		ll_pos							= Pos(ls_dire,'N°')
		ll_pos_ini						= ll_pos
		if ll_pos_ini>0 then
			ll_pos						= ll_pos + 2
			ls_dire_aux					= trim(mid(ls_dire,ll_pos))
			ls_dire_aux					= trim(ls_dire_aux)
			ll_pos_aux					= Pos(ls_dire_aux, " ")
			if ll_pos_aux>0 then
				ll_numero				= long(trim(mid(ls_dire_aux,1,ll_pos_aux)))
				ls_numero				= trim(mid(ls_dire_aux,1,ll_pos_aux))
				if ll_numero>0 or len(ls_numero)>0 then
					ls_direccion		= trim(mid(ls_dire,1,ll_pos_ini - 1))+' '+trim(mid(ls_dire_aux,ll_pos_aux))
					dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
					dw_lista.setitem(ll_indi,'numero_particular',ls_numero)
				end if
			else
				ll_numero				= long(trim(ls_dire_aux))
				if ll_numero>0 then
					ls_direccion			= trim(mid(ls_dire,1,ll_pos_ini - 1))
					ls_numero			= trim(ls_dire_aux)
					dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
					dw_lista.setitem(ll_indi,'numero_particular',ls_numero)
				end if
			end if
		end if
		dw_lista.accepttext()
		ls_dire							= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		//	Opcion depto
		ll_pos							= Pos(ls_dire,'D/')
		ll_pos_ini						= ll_pos
		if ll_pos_ini>0 then
			ll_pos						= ll_pos + 2
			ls_dire_aux					= trim(mid(ls_dire,ll_pos))
			ls_dire_aux					= trim(ls_dire_aux)
			ll_pos_aux					= Pos(ls_dire_aux, " ")
			if ll_pos_aux>0 then
				ll_numero				= long(trim(mid(ls_dire_aux,1,ll_pos_aux)))
				ls_numero				= trim(mid(ls_dire_aux,1,ll_pos_aux))
				if ll_numero>0 or len(ls_numero)>0 then
					ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)+' '+mid(ls_dire_aux,ll_pos_aux)
					dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
					dw_lista.setitem(ll_indi,'depto_particular',ls_numero)
				end if
			else
				ll_numero				= long(trim(ls_dire_aux))
				if ll_numero>0 then
					ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)
					ls_numero			= trim(ls_dire_aux)
					dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
					dw_lista.setitem(ll_indi,'depto_particular',ls_numero)
				end if
			end if
		end if
		//	Opcion Block
		dw_lista.accepttext()
		ls_dire							= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		ll_pos							= Pos(ls_dire,'B/')
		ll_pos_ini						= ll_pos
		if ll_pos_ini>0 then
			ll_pos						= ll_pos + 2
			ls_dire_aux					= trim(mid(ls_dire,ll_pos))
			ls_dire_aux					= trim(ls_dire_aux)
			ll_pos_aux					= Pos(ls_dire_aux, " ")
			if ll_pos_aux>0 then
				ll_numero				= long(trim(mid(ls_dire_aux,1,ll_pos_aux)))
				ls_numero				= trim(mid(ls_dire_aux,1,ll_pos_aux))
				if ll_numero>0 or len(ls_numero)>0 then
					ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)+' '+mid(ls_dire_aux,ll_pos_aux)
					dw_lista.setitem(ll_indi,'block_particular',ls_numero)
					dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
				end if
			else
				ll_numero				= long(trim(ls_dire_aux))
				if ll_numero>0 then
					ls_direccion		= mid(ls_dire,1,ll_pos_ini - 1)
					ls_numero			= trim(ls_dire_aux)
					dw_lista.setitem(ll_indi,'block_particular',ls_numero)
					dw_lista.setitem(ll_indi,'direccion_p',ls_direccion)
				end if
			end if
		end if
		dw_lista.accepttext()
		ls_dire							= trim(dw_lista.getitemstring(ll_indi,'direccion_p'))
		ls_numero						= trim(dw_lista.getitemstring(ll_indi,'numero_particular'))
		ls_block							= trim(dw_lista.getitemstring(ll_indi,'block_particular'))
		ls_depto							= trim(dw_lista.getitemstring(ll_indi,'depto_particular'))
		if ls_dire = ls_numero then
			ls_dire						= '-'
			dw_lista.setitem(ll_indi,'direccion_p',ls_dire)
		end if
		if isnull(ls_block) or ls_block='' then dw_lista.setitem(ll_indi,'block_particular','-')
		if isnull(ls_depto) or ls_depto='' then dw_lista.setitem(ll_indi,'depto_particular','-')
	end if
next
dw_lista.accepttext()
SetPointer(Arrow!)
end event

type dw_lista from datawindow within w_actualizar_direccion_cliente
integer x = 32
integer y = 32
integer width = 3355
integer height = 1220
integer taborder = 10
string title = "none"
string dataobject = "dw_actualiza_direccion_cliente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

