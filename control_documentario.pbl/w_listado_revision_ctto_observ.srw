forward
global type w_listado_revision_ctto_observ from window
end type
type st_cuenta from statictext within w_listado_revision_ctto_observ
end type
type hpb_1 from hprogressbar within w_listado_revision_ctto_observ
end type
type st_porc from statictext within w_listado_revision_ctto_observ
end type
type st_1 from statictext within w_listado_revision_ctto_observ
end type
type dw_observ from datawindow within w_listado_revision_ctto_observ
end type
type dw_periodo from datawindow within w_listado_revision_ctto_observ
end type
type rb_periodo from radiobutton within w_listado_revision_ctto_observ
end type
type rb_cierre from radiobutton within w_listado_revision_ctto_observ
end type
type dw_fecha_cierre from datawindow within w_listado_revision_ctto_observ
end type
type cb_ordenar from commandbutton within w_listado_revision_ctto_observ
end type
type cb_limpiar from commandbutton within w_listado_revision_ctto_observ
end type
type cb_imprimir from commandbutton within w_listado_revision_ctto_observ
end type
type cb_cta_cte from commandbutton within w_listado_revision_ctto_observ
end type
type pb_aceptar from picturebutton within w_listado_revision_ctto_observ
end type
type cb_cerrar from commandbutton within w_listado_revision_ctto_observ
end type
type gb_3 from groupbox within w_listado_revision_ctto_observ
end type
type gb_1 from groupbox within w_listado_revision_ctto_observ
end type
type gb_seleccion from groupbox within w_listado_revision_ctto_observ
end type
type st_fondo from statictext within w_listado_revision_ctto_observ
end type
type dw_lista_obs from datawindow within w_listado_revision_ctto_observ
end type
end forward

global type w_listado_revision_ctto_observ from window
integer width = 3415
integer height = 1928
boolean titlebar = true
string title = "Lista Observaciones Revisión Contratos"
boolean controlmenu = true
boolean minbox = true
long backcolor = 81324524
st_cuenta st_cuenta
hpb_1 hpb_1
st_porc st_porc
st_1 st_1
dw_observ dw_observ
dw_periodo dw_periodo
rb_periodo rb_periodo
rb_cierre rb_cierre
dw_fecha_cierre dw_fecha_cierre
cb_ordenar cb_ordenar
cb_limpiar cb_limpiar
cb_imprimir cb_imprimir
cb_cta_cte cb_cta_cte
pb_aceptar pb_aceptar
cb_cerrar cb_cerrar
gb_3 gb_3
gb_1 gb_1
gb_seleccion gb_seleccion
st_fondo st_fondo
dw_lista_obs dw_lista_obs
end type
global w_listado_revision_ctto_observ w_listado_revision_ctto_observ

type variables
Long	il_mes,il_ano,il_row
end variables

on w_listado_revision_ctto_observ.create
this.st_cuenta=create st_cuenta
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.st_1=create st_1
this.dw_observ=create dw_observ
this.dw_periodo=create dw_periodo
this.rb_periodo=create rb_periodo
this.rb_cierre=create rb_cierre
this.dw_fecha_cierre=create dw_fecha_cierre
this.cb_ordenar=create cb_ordenar
this.cb_limpiar=create cb_limpiar
this.cb_imprimir=create cb_imprimir
this.cb_cta_cte=create cb_cta_cte
this.pb_aceptar=create pb_aceptar
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.gb_1=create gb_1
this.gb_seleccion=create gb_seleccion
this.st_fondo=create st_fondo
this.dw_lista_obs=create dw_lista_obs
this.Control[]={this.st_cuenta,&
this.hpb_1,&
this.st_porc,&
this.st_1,&
this.dw_observ,&
this.dw_periodo,&
this.rb_periodo,&
this.rb_cierre,&
this.dw_fecha_cierre,&
this.cb_ordenar,&
this.cb_limpiar,&
this.cb_imprimir,&
this.cb_cta_cte,&
this.pb_aceptar,&
this.cb_cerrar,&
this.gb_3,&
this.gb_1,&
this.gb_seleccion,&
this.st_fondo,&
this.dw_lista_obs}
end on

on w_listado_revision_ctto_observ.destroy
destroy(this.st_cuenta)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.st_1)
destroy(this.dw_observ)
destroy(this.dw_periodo)
destroy(this.rb_periodo)
destroy(this.rb_cierre)
destroy(this.dw_fecha_cierre)
destroy(this.cb_ordenar)
destroy(this.cb_limpiar)
destroy(this.cb_imprimir)
destroy(this.cb_cta_cte)
destroy(this.pb_aceptar)
destroy(this.cb_cerrar)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.gb_seleccion)
destroy(this.st_fondo)
destroy(this.dw_lista_obs)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_mes_ini,ll_ano_ini
datetime	ldt_fecha_termino

gf_centrar(w_listado_revision_ctto_observ)
dw_periodo.visible														= false
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)
dw_periodo.dataobject												='dwe_lista_periodo_docto_pend'
dw_periodo.settransobject(sqlca)

dw_observ.dataobject												='dwe_lista_tipo_observ'
dw_observ.settransobject(sqlca)
dw_observ.insertrow(0)

if gl_proceso<4 then
	messagebox("Advertencia","No Tiene Acceso")
	close(w_docto_pendiente_estructura)
end if

end event

type st_cuenta from statictext within w_listado_revision_ctto_observ
boolean visible = false
integer x = 978
integer y = 876
integer width = 1371
integer height = 72
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

type hpb_1 from hprogressbar within w_listado_revision_ctto_observ
boolean visible = false
integer x = 978
integer y = 804
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_listado_revision_ctto_observ
boolean visible = false
integer x = 1554
integer y = 732
integer width = 233
integer height = 68
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

type st_1 from statictext within w_listado_revision_ctto_observ
integer x = 1783
integer y = 80
integer width = 293
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Observación"
boolean focusrectangle = false
end type

type dw_observ from datawindow within w_listado_revision_ctto_observ
integer x = 2075
integer y = 64
integer width = 1065
integer height = 88
integer taborder = 40
string title = "none"
string dataobject = "dwe_lista_tipo_observ"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista_obs.reset()
end event

type dw_periodo from datawindow within w_listado_revision_ctto_observ
integer x = 823
integer y = 60
integer width = 946
integer height = 96
integer taborder = 50
string title = "none"
string dataobject = "dwe_lista_periodo_docto_pend"
boolean border = false
boolean livescroll = true
end type

event itemchanged;dw_lista_obs.reset()
end event

type rb_periodo from radiobutton within w_listado_revision_ctto_observ
integer x = 494
integer y = 76
integer width = 274
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Período"
end type

event clicked;long	ll_new,ll_ano,ll_mes

dw_lista_obs.reset()
dw_fecha_cierre.visible									= false
dw_periodo.visible											= true
ll_new														= dw_periodo.insertrow(0)
SELECT DISTINCT MAX("CD_FOLIO"."ANO_CIERRE")
INTO		:ll_ano  
FROM		"CD_FOLIO"  
USING	sqlca;
if sqlca.sqlcode=0 then
	SELECT DISTINCT MAX("CD_FOLIO"."MES_CIERRE")
	INTO 		:ll_mes  
	FROM		"CD_FOLIO"  
	WHERE	"CD_FOLIO"."ANO_CIERRE" = :ll_ano
	USING	sqlca;
end if
if isnull(ll_mes) or ll_mes=0 then ll_mes=month(date(gdt_fec_sistema))
if isnull(ll_ano) or ll_ano=0 then ll_ano=year(date(gdt_fec_sistema))
dw_periodo.setitem(ll_new,'mes',ll_mes)
dw_periodo.setitem(ll_new,'ano',ll_ano)
dw_periodo.accepttext()
dw_periodo.setfocus()
end event

type rb_cierre from radiobutton within w_listado_revision_ctto_observ
integer x = 78
integer y = 76
integer width = 421
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cierre Ventas"
boolean checked = true
end type

event clicked;dw_lista_obs.reset()
dw_fecha_cierre.visible									= true
dw_periodo.visible											= false
dw_fecha_cierre.settransobject(sqlca)
dw_fecha_cierre.getchild('cierre_ventas',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve(datetime(date(string('01/10/2010'))))=0 then
	idw_detalle3.insertrow(0)
end if
dw_fecha_cierre.insertrow(0)
end event

type dw_fecha_cierre from datawindow within w_listado_revision_ctto_observ
integer x = 923
integer y = 64
integer width = 841
integer height = 88
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dwe_cierre_venta"
boolean border = false
boolean livescroll = true
end type

event clicked;dw_lista_obs.reset()

end event

event itemchanged;dw_lista_obs.reset()

end event

type cb_ordenar from commandbutton within w_listado_revision_ctto_observ
integer x = 1312
integer y = 1692
integer width = 261
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_lista_obs.rowcount() > 0 then
	setnull (nulo)
	dw_lista_obs.SETSORT(NULO)
	dw_lista_obs.SORT()
end if
end event

type cb_limpiar from commandbutton within w_listado_revision_ctto_observ
integer x = 1957
integer y = 1692
integer width = 261
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;w_listado_revision_ctto_observ.triggerevent(open!)
end event

type cb_imprimir from commandbutton within w_listado_revision_ctto_observ
event ue_mousemove pbm_mousemove
integer x = 1573
integer y = 1692
integer width = 261
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista_obs.rowcount()>0 then
	f_Print( dw_lista_obs )
end if
end event

type cb_cta_cte from commandbutton within w_listado_revision_ctto_observ
integer x = 41
integer y = 1676
integer width = 453
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cuent&a Corriente"
end type

event clicked;string	ls_base,ls_serie
Double	ll_numero

if dw_lista_obs.rowcount() > 0 then
	if il_row>0 then
		gs_base				= dw_lista_obs.getitemstring(il_row,'vista_clasifica_promesa_codigo')
		gs_serie				= dw_lista_obs.getitemstring(il_row,'vista_clasifica_promesa_serie')
		gi_numero			= dw_lista_obs.getitemnumber(il_row,'vista_clasifica_promesa_numero')
		gi_rut					= dw_lista_obs.getitemnumber(il_row,'vista_clasifica_promesa_rut')	
		CHOOSE CASE gs_base
			CASE "O","U" // Oferta
				if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
				Open(w_cuenta_corriente_oferta)
			CASE "L" // Anexo Liberador
				if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
				Open(w_cuenta_corriente_liberador)
			CASE "A" // Aumento Capacidad
				if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
				Open(w_cuenta_corriente_aumento_capacidad)
			CASE "P" // Pagaré
				if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
				Open(w_cuenta_corriente_pagare)
			CASE "C" // Contrato ISA	
				if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
				Open(w_cuenta_corriente_contrato_isa)
			CASE "D" // Derecho Especial
				if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
				Open(w_cuenta_corriente_derecho)
			CASE "R" //Repactación Ctas.Mantencion
				if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
				Open(w_cuenta_corriente_repactar_cta_mant)
		END CHOOSE
	end if
end if
end event

type pb_aceptar from picturebutton within w_listado_revision_ctto_observ
integer x = 3186
integer y = 36
integer width = 151
integer height = 132
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
alignment htextalign = left!
end type

event clicked;string		ls_pasa='S',ls_for_pag,ls_base,ls_serie,ls_sigla,ls_obs_cal,ls_obs_rev,ls_obs
long		ll_observ,ll_tot_reg,ll_mes,ll_ano,ll_indi,ll_edad
datetime	ldt_fec_cierre
date		ld_fec_ctto,ld_fec_nac
double	ldb_tot_porc,ldb_tot_porc_aux,ll_numero

dw_lista_obs.reset()
dw_fecha_cierre.accepttext()
dw_periodo.accepttext()
ll_observ																	= dw_observ.getitemnumber(1,'cod_observ')
if isnull(ll_observ) or ll_observ=0 then
	messagebox("Advertencia", "Debe Ingresar Tipo Observación")
	dw_lista_obs.setfocus()
	dw_lista_obs.setcolumn('cod_observ')
	ls_pasa																= 'N'
else
	if rb_cierre.checked=true then
		ldt_fec_cierre													= dw_fecha_cierre.getitemdatetime(1,'cierre_ventas')
		if isnull(ldt_fec_cierre) then
			messagebox("Advertencia", "Debe Ingresar Fecha Cierre Ventas")
			dw_fecha_cierre.setfocus()
			dw_fecha_cierre.setcolumn('cierre_ventas')
			ls_pasa														= 'N'
		end if
	elseif rb_periodo.checked=true then	
		ll_mes															= dw_periodo.getitemnumber(1,'mes')
		ll_ano																= dw_periodo.getitemnumber(1,'ano')
		ldt_fec_cierre													= f_fecha_fin(ll_mes,ll_ano)	
		if isnull(ll_mes) or ll_mes=0  then
			messagebox("Advertencia", "Debe Ingresar Mes Período")
			dw_periodo.setfocus()
			dw_periodo.setcolumn('mes')
			ls_pasa														= 'N'
		elseif isnull(ll_ano) or ll_ano=0  then
			messagebox("Advertencia", "Debe Ingresar Mes Período")
			dw_periodo.setfocus()
			dw_periodo.setcolumn('ano')
			ls_pasa														= 'N'
		end if
	end if
	if ls_pasa = 'S' then		
		dw_lista_obs.dataobject										='dw_detalle_observ_rev_ctto'
		dw_lista_obs.settransobject(sqlca)
		if ll_observ=1 then
			ls_obs														= 'Declaración Personal de Salud (DPS)'
			dw_lista_obs.object.t_rev.text							= '(DPS)~rRevis.Ctto'
			dw_lista_obs.object.t_cal.text							= '(DPS)~rCalculo'
		elseif ll_observ=2 then
			ls_obs														= 'Necesita AVAL'
			dw_lista_obs.object.t_rev.text							= '(Aval)~rRevis.Ctto'
			dw_lista_obs.object.t_cal.text							= '(Aval)~rCalculo'
		end if
		
		SELECT 	"SIGLA"	
		INTO		:ls_sigla
		FROM		"REVISION_CONTRATOS_OBS_CODIGO"  
		WHERE	( "REVISION_CONTRATOS_OBS_CODIGO"."CODIGO" = :ll_observ ) AND  
					( "REVISION_CONTRATOS_OBS_CODIGO"."ESTADO" = 'V' )
		USING	sqlca;
		
		ll_tot_reg													= dw_lista_obs.retrieve(ldt_fec_cierre,ll_observ)
		if ll_tot_reg > 0 then
			dw_lista_obs.object.usuario.text					= gs_user
			dw_lista_obs.object.titulo2_t.text					= 'Cierre ventas Finalizado Con Fecha: '+string(ldt_fec_cierre,'dd/mm/yyyy')
			SetPointer(HourGlass!)
			st_fondo.visible											= true
			st_cuenta.visible										= true
			hpb_1.visible 											= true
			st_porc.visible 											= true
			ldb_tot_porc												= 0
			ldb_tot_porc_aux										= 0			
			hpb_1.Position											= ldb_tot_porc
			for ll_indi=1 to ll_tot_reg
				ls_base												= dw_lista_obs.getitemstring(ll_indi,'vista_clasifica_promesa_codigo')
				ls_serie												= dw_lista_obs.getitemstring(ll_indi,'vista_clasifica_promesa_serie')
				ll_numero											= dw_lista_obs.getitemnumber(ll_indi,'vista_clasifica_promesa_numero')
				ld_fec_ctto											= date(dw_lista_obs.getitemdatetime(ll_indi,'vista_clasifica_promesa_fecha'))
				ld_fec_nac											= date(dw_lista_obs.getitemdatetime(ll_indi,'vista_clasifica_promesa_fecha_nac'))
				ls_for_pag											= dw_lista_obs.getitemstring(ll_indi,'vista_clasifica_promesa_forma_pago')
				ll_edad												= f_edad(ld_fec_ctto,ld_fec_nac )
				SELECT DISTINCT "OBSERVACION"	
				INTO		:ls_obs_rev
				FROM		"REVISION_CONTRATOS_OBSERVACION"  
				WHERE	( "REVISION_CONTRATOS_OBSERVACION"."BASE" = :ls_base ) AND  
							( "REVISION_CONTRATOS_OBSERVACION"."SERIE" = :ls_serie ) AND  
							( "REVISION_CONTRATOS_OBSERVACION"."NUMERO" = :ll_numero ) AND  
							( "REVISION_CONTRATOS_OBSERVACION"."CODIGO_OBS" = :ll_observ )
				USING	sqlca;
				if sqlca.sqlcode=0 then
					if not isnull(ls_obs_rev) and ls_obs_rev<>'' then
						ls_obs_rev									= ls_sigla
					else
						ls_obs_rev									= ''
					end if
				else
					ls_obs_rev										= ''
				end if
				ls_obs_cal											= (f_rev_ctto_observacion(string(ll_edad),1))
				if ls_obs_cal=ls_obs then
					ls_obs_cal										= ls_sigla
				else
					ls_obs_cal										= ''
				end if
				dw_lista_obs.setitem(ll_indi,'edad',ll_edad)
				dw_lista_obs.setitem(ll_indi,'dps_rev',ls_obs_rev)
				dw_lista_obs.setitem(ll_indi,'dps_cal',ls_obs_cal)
				dw_lista_obs.accepttext()
				if ldb_tot_porc <> ldb_tot_porc_aux then 
					st_porc.text										= string(ldb_tot_porc,'#0.##')+" %"
					ldb_tot_porc_aux								= ldb_tot_porc
				end if
				ldb_tot_porc											= (ll_indi / ll_tot_reg) * 100
				hpb_1.Position 										= ldb_tot_porc
				st_cuenta.text 										= 'Total Reg. '+string(ll_tot_reg,'###,###,###')+'    Reg. Validados '+string(ll_indi,'###,###,###')+' ( '+string((ll_indi*100)/ll_tot_reg,'#0.00')+'% )'
				dw_lista_obs.accepttext()
			next
			st_fondo.visible											= false
			st_cuenta.visible										= false
			hpb_1.visible 											= false
			st_porc.visible 											= false
			dw_lista_obs.setFilter("dps_cal = '"+ls_sigla+"' or dps_rev='"+ls_sigla+"'" )
			dw_lista_obs.filter()
			dw_lista_obs.accepttext()
			SetPointer(Arrow!)
		else
			messagebox("Advertencia","No Registra Documentos Pendientes")
		end if
	end if	
end if

end event

type cb_cerrar from commandbutton within w_listado_revision_ctto_observ
integer x = 3090
integer y = 1676
integer width = 261
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_listado_revision_ctto_observ)
end event

type gb_3 from groupbox within w_listado_revision_ctto_observ
integer x = 1280
integer y = 1648
integer width = 969
integer height = 152
integer taborder = 100
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_listado_revision_ctto_observ
integer x = 32
integer y = 8
integer width = 759
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Tipo Busqueda"
end type

type gb_seleccion from groupbox within w_listado_revision_ctto_observ
integer x = 809
integer y = 8
integer width = 2363
integer height = 160
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Selección"
end type

type st_fondo from statictext within w_listado_revision_ctto_observ
boolean visible = false
integer x = 951
integer y = 708
integer width = 1431
integer height = 268
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

type dw_lista_obs from datawindow within w_listado_revision_ctto_observ
integer x = 37
integer y = 188
integer width = 3314
integer height = 1456
integer taborder = 70
string title = "none"
string dataobject = "dw_detalle_observ_rev_ctto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	il_row	= row
	This.SelectRow(0, false)
	This.SelectRow(il_row, true)
end if

this.accepttext()

close(w_cuenta_corriente_oferta)
close(w_cuenta_corriente_liberador)

end event

event doubleclicked;if dw_lista_obs.RowCount() > 0 then
	cb_cta_cte.triggerevent(clicked!)
end if

end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

