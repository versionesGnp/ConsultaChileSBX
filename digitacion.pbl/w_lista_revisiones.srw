forward
global type w_lista_revisiones from window
end type
type st_1 from statictext within w_lista_revisiones
end type
type st_2 from statictext within w_lista_revisiones
end type
type em_fec_ini from editmask within w_lista_revisiones
end type
type em_fec_fin from editmask within w_lista_revisiones
end type
type pb_aceptar from picturebutton within w_lista_revisiones
end type
type p_1 from picture within w_lista_revisiones
end type
type p_2 from picture within w_lista_revisiones
end type
type cb_4 from commandbutton within w_lista_revisiones
end type
type cb_2 from commandbutton within w_lista_revisiones
end type
type cb_3 from commandbutton within w_lista_revisiones
end type
type cb_aceptar from commandbutton within w_lista_revisiones
end type
type cb_cerrar from commandbutton within w_lista_revisiones
end type
type dw_lista from datawindow within w_lista_revisiones
end type
type gb_1 from groupbox within w_lista_revisiones
end type
end forward

global type w_lista_revisiones from window
integer width = 3296
integer height = 1904
boolean titlebar = true
string title = "Listado Revisión Contratos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_1 st_1
st_2 st_2
em_fec_ini em_fec_ini
em_fec_fin em_fec_fin
pb_aceptar pb_aceptar
p_1 p_1
p_2 p_2
cb_4 cb_4
cb_2 cb_2
cb_3 cb_3
cb_aceptar cb_aceptar
cb_cerrar cb_cerrar
dw_lista dw_lista
gb_1 gb_1
end type
global w_lista_revisiones w_lista_revisiones

on w_lista_revisiones.create
this.st_1=create st_1
this.st_2=create st_2
this.em_fec_ini=create em_fec_ini
this.em_fec_fin=create em_fec_fin
this.pb_aceptar=create pb_aceptar
this.p_1=create p_1
this.p_2=create p_2
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_aceptar=create cb_aceptar
this.cb_cerrar=create cb_cerrar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.st_2,&
this.em_fec_ini,&
this.em_fec_fin,&
this.pb_aceptar,&
this.p_1,&
this.p_2,&
this.cb_4,&
this.cb_2,&
this.cb_3,&
this.cb_aceptar,&
this.cb_cerrar,&
this.dw_lista,&
this.gb_1}
end on

on w_lista_revisiones.destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_fec_ini)
destroy(this.em_fec_fin)
destroy(this.pb_aceptar)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_aceptar)
destroy(this.cb_cerrar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;gf_centrar(w_lista_revisiones)
em_fec_ini.text	= string(date(gdt_fec_sistema),"dd/mm/yyyy")
em_fec_fin.text	= string(date(gdt_fec_sistema),"dd/mm/yyyy")
if gs_depto<>'R' then
	dw_lista.dataobject	= 'dw_lista_revisiones_cttos'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(today(),today())
else
	dw_lista.dataobject	= 'dw_lista_revisiones_cttos_super'
	dw_lista.settransobject(sqlca)
	dw_lista.retrieve(today(),today(),gs_user)
end if

end event

type st_1 from statictext within w_lista_revisiones
integer x = 37
integer y = 72
integer width = 475
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rango Fecha Desde:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_lista_revisiones
integer x = 951
integer y = 76
integer width = 197
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fec_ini from editmask within w_lista_revisiones
integer x = 512
integer y = 60
integer width = 343
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_fec_fin from editmask within w_lista_revisiones
integer x = 1170
integer y = 60
integer width = 343
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type pb_aceptar from picturebutton within w_lista_revisiones
integer x = 1678
integer y = 32
integer width = 169
integer height = 148
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;date	ld_fec_ini,ld_fec_fin

ld_fec_ini	= date(em_fec_ini.text)
ld_fec_fin	= date(em_fec_fin.text)
if ld_fec_ini>ld_fec_fin or isnull(ld_fec_ini) or isnull(ld_fec_fin) then
	messagebox("Advertencia","Rango de Fecha Inválida")
else
	if gs_depto<>'R' then
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin)=0 then 
			messagebox("Advertencia","No registra datos")
		end if
	else
		if dw_lista.retrieve(ld_fec_ini,ld_fec_fin,gs_depto)=0 then 
			messagebox("Advertencia","No registra datos")
		end if
	end if
end if
end event

type p_1 from picture within w_lista_revisiones
integer x = 859
integer y = 60
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
ls_fecha					= trim(em_fec_ini.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_ini.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_ini.text	= string(ls_fecha)
END IF
em_fec_ini.setfocus()
end event

type p_2 from picture within w_lista_revisiones
integer x = 1518
integer y = 60
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
ls_fecha					= trim(em_fec_fin.text)
if isnull(ls_fecha) then ls_fecha = string(date(gdt_fec_sistema),"dd/mm/yyyy")
if f_valida_fecha(ls_fecha)=-1 then 
	em_fec_fin.text	= string(date(gdt_fec_sistema))
	return
end if
OpenWithParm(w_calendar,ls_fecha)
IF not isnull(Message.StringParm) THEN
	ls_fecha				= trim(Message.StringParm)
	em_fec_fin.text	= string(ls_fecha)
END IF
em_fec_fin.setfocus()
end event

type cb_4 from commandbutton within w_lista_revisiones
integer x = 1285
integer y = 1672
integer width = 224
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setsort(nulo)
dw_lista.sort()




end event

type cb_2 from commandbutton within w_lista_revisiones
integer x = 1518
integer y = 1672
integer width = 238
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
Setnull (nulo)
dw_lista.setfilter(nulo)
dw_lista.filter()
end event

type cb_3 from commandbutton within w_lista_revisiones
integer x = 1765
integer y = 1672
integer width = 229
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Exportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )

end event

type cb_aceptar from commandbutton within w_lista_revisiones
integer x = 37
integer y = 1664
integer width = 293
integer height = 104
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
end type

event clicked;String		ls_base,ls_serie,ls_dv,ls_base_asoc,ls_estado,ls_moneda,ls_uso,ls_origen_venta
Long		ll_rut,ll_row,ll_new,ll_count,ll_cod_seguro,ll_estado_reg,ll_reg,ll_cod_parque,ll_tot_reg,ll_indi,ll_tipo_servicio,ll_count_serv,ll_ult_estado
Double	ldb_monto,ldb_suma,lld_uf,ll_numero,ldb_iva

if dw_lista.getrow() > 0 then
	ll_row				= dw_lista.getrow()
	ls_base			= dw_lista.getitemstring(ll_row,'base')
	ls_serie			= dw_lista.getitemstring(ll_row,'serie')
	ll_numero		= dw_lista.getitemnumber(ll_row,'numero')
	gs_base			= ls_base
	gs_serie			= ls_serie
	gi_numero		= ll_numero
	ll_rut				= dw_lista.getitemnumber(ll_row,'rut')
	ls_dv				= dw_lista.getitemstring(ll_row,'dv')
	ll_cod_parque	= dw_lista.getitemnumber(ll_row,'cod_parque')
	ls_estado		= dw_lista.getitemstring(ll_row,'estado_revision')
	ls_uso			= dw_lista.getitemstring(ll_row,'uso')
	ls_moneda		= dw_lista.getitemstring(ll_row,'moneda')
	ll_tipo_servicio	= dw_lista.getitemnumber(ll_row,'revision_contratos_codigo_servicio')
	ll_ult_estado	= dw_lista.getitemnumber(ll_row,'cd_folio_ult_estado')
	if isvalid(w_validar_promesa_operaciones) then
		if ls_base='O' or ls_base='U' or ls_base='M' then
			if ls_base = 'O' then
				gs_cod_prod		= 'SE'
			elseif ls_base = 'U' then
				gs_cod_prod		= 'CO'
			end if
//			if not isnull(ls_cod_prod) then
//				if idw_detalle2.retrieve(ll_cod_parque, ls_cod_prod)=0 then
//					idw_detalle2.insertrow(0)
//				end if
//				
//			end if
			w_validar_promesa_operaciones.dw_revision.dataobject	= 'dw_revision_contratos_promesa'
			w_validar_promesa_operaciones.dw_revision.settransobject(sqlca)
			w_validar_promesa_operaciones.dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
			//if idw_detalle12.retrieve('M')=0 then
				idw_detalle12.reset()
				idw_detalle12.insertrow(0)
			//end if
			w_validar_promesa_operaciones.dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			
			
			w_validar_promesa_operaciones.dw_revision.getchild('tipo_producto',idw_detalle4)
			idw_detalle4.settransobject(sqlca)
			
			if idw_detalle2.retrieve(ll_cod_parque,gs_cod_prod)=0 then
				idw_detalle2.insertrow(0)
			end if
			if idw_detalle4.retrieve( gs_cod_prod)=0 then
				idw_detalle4.insertrow(0)
			end if
//			ll_new																	= w_validar_promesa_operaciones.dw_revision.insertrow(0)
			w_validar_promesa_operaciones.dw_seguro.reset()
			w_validar_promesa_operaciones.dw_seguro.retrieve(ll_cod_parque, ls_base)
//			w_validar_promesa_operaciones.dw_revision.setitem(ll_new,'pie',0)
			ll_tot_reg																= w_validar_promesa_operaciones.dw_seguro.rowcount()
			for ll_indi=1 to ll_tot_reg
				w_validar_promesa_operaciones.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
			next
			w_validar_promesa_operaciones.dw_seguro.accepttext()
			SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),
							SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
			INTO			:ll_count,
							:ldb_suma
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
			if ll_count > 0 then
				DECLARE x20 CURSOR FOR  
				SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
								"SEGURO_ASOCIADOS"."ESTADO_REG"  
				FROM 		"SEGURO_ASOCIADOS"  
				WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING		sqlca;
				open x20;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						Fetch x20 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
						if not isnull(ll_cod_seguro) then
							if ll_estado_reg = 0 then
								ll_reg = w_validar_promesa_operaciones.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_validar_promesa_operaciones.dw_seguro.RowCount())
								if ll_reg > 0 then
									w_validar_promesa_operaciones.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
								end if
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x20;
			end if
		elseif ls_base='L' then
			ls_base_asoc															= dw_lista.getitemstring(ll_row,'revision_contratos_base_asoc')
			w_validar_promesa_operaciones.dw_revision.dataobject	= 'dw_revision_contratos_liberador'
			w_validar_promesa_operaciones.dw_revision.settransobject(sqlca)
			
			w_validar_promesa_operaciones.dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
//			if idw_detalle12.retrieve('M')=0 then
				idw_detalle12.reset()
				idw_detalle12.insertrow(0)
//			end if
			
			w_validar_promesa_operaciones.dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(ll_cod_parque)=0 then
				idw_detalle2.insertrow(0)
			end if
			
			w_validar_promesa_operaciones.dw_revision.getchild('serie_asoc',idw_detalle)
			idw_detalle.settransobject(sqlca)
			if idw_detalle.retrieve(ls_base_asoc)=0 then
				idw_detalle.insertrow(0)
			end if
			w_validar_promesa_operaciones.dw_seguro.reset()
			w_validar_promesa_operaciones.dw_seguro.retrieve(ll_cod_parque, ls_base)
//			ll_new																	= w_validar_promesa_operaciones.dw_revision.insertrow(0)
//			w_validar_promesa_operaciones.dw_revision.setitem(ll_new,'pie',0)
			ll_tot_reg																= w_validar_promesa_operaciones.dw_seguro.rowcount()
			for ll_indi=1 to ll_tot_reg
				w_validar_promesa_operaciones.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
			next
			w_validar_promesa_operaciones.dw_seguro.accepttext()
			
			SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),
							SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
			INTO			:ll_count,
							:ldb_suma
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
			if ll_count > 0 then
				DECLARE x10 CURSOR FOR  
				SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
								"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
								"SEGURO_ASOCIADOS"."ESTADO_REG"  
				FROM 		"SEGURO_ASOCIADOS"  
				WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
							  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
							  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
							  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
				USING		sqlca;
				open x10;
				if sqlca.sqlcode=0 then
					do while sqlca.sqlcode=0
						Fetch x10 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
						if not isnull(ll_cod_seguro) then
							if ll_estado_reg = 0 then
								ll_reg = w_validar_promesa_operaciones.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_validar_promesa_operaciones.dw_seguro.RowCount())
								if ll_reg > 0 then
									w_validar_promesa_operaciones.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
								end if
							end if
						end if
						setnull(ll_cod_seguro)
					loop
				end if
				close x10;
				
//				w_validar_promesa_operaciones.dw_seguro.accepttext()
//				if isnull(ldb_suma) then ldb_suma=0
//				if ldb_suma > 0 then
//					lld_uf			= w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'uf_fecha_ctto')
//					ls_moneda	= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'moneda')
//					if ls_moneda='1' then
//						ldb_suma	= round(ldb_suma * lld_uf,4)
//					end if
//				end if
//				w_validar_promesa_operaciones.dw_revision.setitem(1,'c_total_cuota',ldb_suma)
				w_validar_promesa_operaciones.dw_revision.accepttext()
			end if
		elseif ls_base='F' or ls_base='V' or ls_base='G' then
			w_validar_promesa_operaciones.dw_revision.dataobject	= 'dw_revision_contratos_producto'
			w_validar_promesa_operaciones.dw_revision.settransobject(sqlca)
			
			w_validar_promesa_operaciones.dw_revision.getchild('tipo_venta_subcat',idw_detalle12)
			idw_detalle12.settransobject(sqlca)
			idw_detalle12.reset()
			idw_detalle12.insertrow(0)
			
			w_validar_promesa_operaciones.dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(ll_cod_parque)=0 then
				idw_detalle2.insertrow(0)
			end if
			if w_validar_promesa_operaciones.dw_revision.dataobject='dw_revision_contratos_producto' then
				w_validar_promesa_operaciones.dw_revision.getchild('sw_activa_servicio_1',idw_detalle1)
				idw_detalle1.settransobject(sqlca)
				if idw_detalle1.retrieve(ls_base,ls_serie,ll_numero)=0 then
					idw_detalle1.insertrow(0)
				end if
			end if
			w_validar_promesa_operaciones.dw_revision.getchild('codigo_servicio',idw_detalle3)
			idw_detalle3.settransobject(sqlca)
			if idw_detalle3.retrieve(ll_cod_parque,ls_uso,ls_serie,ls_moneda)=0 then
				idw_detalle3.insertrow(0)
			end if
			ll_new																	= w_validar_promesa_operaciones.dw_revision.insertrow(0)
		end if
		w_validar_promesa_operaciones.em_rut.text						= string(ll_rut,"###,###,###,###,###")
		w_validar_promesa_operaciones.em_dv.text						= trim(ls_dv)
		w_validar_promesa_operaciones.dw_base.setitem(1,'base',ls_base)
		w_validar_promesa_operaciones.wf_ddlb_serie(ls_base)
		w_validar_promesa_operaciones.ddlb_serie.text					= trim(ls_serie)
		w_validar_promesa_operaciones.em_numero.text					= string(ll_numero,"###,###,###,###,###")
		if ls_base = 'O' or ls_base = 'U' then
			w_validar_promesa_operaciones.dw_revision.getchild('area',idw_detalle2)
			idw_detalle2.settransobject(sqlca)
			if idw_detalle2.retrieve(ll_cod_parque,gs_cod_prod)=0 then
				idw_detalle2.insertrow(0)
			end if
			
			w_validar_promesa_operaciones.dw_revision.getchild('tipo_producto',idw_detalle4)
			idw_detalle4.settransobject(sqlca)
			if idw_detalle4.retrieve( gs_cod_prod)=0 then
				idw_detalle4.insertrow(0)
			end if
		end if
		if w_validar_promesa_operaciones.dw_revision.retrieve(ll_rut,ls_base,ls_serie,ll_numero,gs_depto) > 0 then
			ls_origen_venta		= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'origen_venta')
			if ls_base = 'F' or ls_base='G' then 
				w_validar_promesa_operaciones.cb_aceptar.enabled		= true
			else
				w_validar_promesa_operaciones.cb_aceptar.enabled		= false
			end if 
			if idw_detalle12.retrieve(ls_origen_venta) = 0 then
				 w_validar_promesa_operaciones.dw_revision.modify("tipo_venta_subcat.visible='0'")
				 w_validar_promesa_operaciones.dw_revision.modify("t_subcat.visible='0'")
				 idw_detalle12.insertrow(0)
			else
				w_validar_promesa_operaciones.dw_revision.modify("t_subcat.visible='1'")
				w_validar_promesa_operaciones.dw_revision.modify("tipo_venta_subcat.visible='1'")
			end if
		end if
		w_validar_promesa_operaciones.dw_lista_obs.retrieve(ll_rut,ls_base,ls_serie,ll_numero)
		w_validar_promesa_operaciones.dw_ctto_asoc.retrieve(ll_rut)
		w_validar_promesa_operaciones.dw_lista_rezagos.retrieve(ll_rut)
		w_validar_promesa_operaciones.dw_seguro.reset()
		w_validar_promesa_operaciones.dw_seguro.retrieve(ll_cod_parque, ls_base)
		ll_tot_reg																= w_validar_promesa_operaciones.dw_seguro.rowcount()
		for ll_indi=1 to ll_tot_reg
			w_validar_promesa_operaciones.dw_seguro.setitem(ll_indi,'c_estado_reg',1)
		next
		w_validar_promesa_operaciones.dw_seguro.accepttext()
		
		ll_tipo_servicio			= dw_lista.getitemnumber(1,'revision_contratos_codigo_servicio')
		if ls_base='F' and ll_tipo_servicio >= 670 and ll_tipo_servicio <= 674 then
			SELECT 	Count("PRODUCTO_GESTION_SERVICIO"."BASE")
			INTO 		:ll_count_serv  
			FROM 	"PRODUCTO_GESTION_SERVICIO"  
			WHERE 	( "PRODUCTO_GESTION_SERVICIO"."BASE" = :ls_base ) AND  
						( "PRODUCTO_GESTION_SERVICIO"."SERIE" = :ls_serie ) AND  
						( "PRODUCTO_GESTION_SERVICIO"."NUMERO" = :ll_numero )   ;
			if ll_count_serv > 0 then
				gs_base														= ls_base
				gs_serie														= ls_serie
				gi_numero													= ll_numero
//				w_validar_promesa_operaciones.dw_revision.object.sw_activa_servicio.visible		= false
				w_validar_promesa_operaciones.dw_revision.object.sw_activa_servicio_1.visible	= true
				gs_mant_serv												= 'S'
			else
//				w_validar_promesa_operaciones.dw_revision.object.sw_activa_servicio.visible		= true
				w_validar_promesa_operaciones.dw_revision.object.sw_activa_servicio_1.visible	= false
			end if
		end if
		w_validar_promesa_operaciones.dw_revision.accepttext()
		SELECT		COUNT("SEGURO_ASOCIADOS"."COD_SEGURO"),
						SUM("SEGURO_ASOCIADOS"."MONTO_PRIMA")
		INTO			:ll_count,
						:ldb_suma
		FROM 		"SEGURO_ASOCIADOS"  
		WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
					  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
					  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
					  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   ;
		if ll_count > 0 then
			DECLARE x1 CURSOR FOR  
			SELECT		"SEGURO_ASOCIADOS"."COD_SEGURO",   
							"SEGURO_ASOCIADOS"."MONTO_PRIMA",   
							"SEGURO_ASOCIADOS"."ESTADO_REG"  
			FROM 		"SEGURO_ASOCIADOS"  
			WHERE 	  ( "SEGURO_ASOCIADOS"."BASE" = :ls_base ) AND  
						  ( "SEGURO_ASOCIADOS"."SERIE" = :ls_serie ) AND  
						  ( "SEGURO_ASOCIADOS"."NUMERO" = :ll_numero ) AND  
						  ( "SEGURO_ASOCIADOS"."ESTADO_SEGURO" = 'A' )   
			USING		sqlca;
			open x1;
			if sqlca.sqlcode=0 then
				do while sqlca.sqlcode=0
					Fetch x1 into :ll_cod_seguro, :ldb_monto, :ll_estado_reg;
					if not isnull(ll_cod_seguro) then
						if ll_estado_reg = 0 then
							ll_reg = w_validar_promesa_operaciones.dw_seguro.Find("codigo = "+string(ll_cod_seguro), 1, w_validar_promesa_operaciones.dw_seguro.RowCount())
							if ll_reg > 0 then
								w_validar_promesa_operaciones.dw_seguro.setitem(ll_reg,'c_estado_reg',0)
							end if
						end if
					end if
					setnull(ll_cod_seguro)
				loop
			end if
			close x1;
			w_validar_promesa_operaciones.dw_seguro.accepttext()
//			if isnull(ldb_suma) then ldb_suma=0
//			if ldb_suma > 0 then
//				lld_uf			= w_validar_promesa_operaciones.dw_revision.getitemnumber(1,'uf_fecha_ctto')
//				ls_moneda	= w_validar_promesa_operaciones.dw_revision.getitemstring(1,'moneda')
//				if ls_moneda='1' then
//					ldb_suma	= round(ldb_suma * lld_uf,4)
//				end if
//			end if
//			w_validar_promesa_operaciones.dw_revision.setitem(1,'c_total_cuota',ldb_suma)
			w_validar_promesa_operaciones.dw_revision.accepttext()
		end if
		if ls_estado='V' then
			w_validar_promesa_operaciones.dw_seguro.enabled			= true
		else
			w_validar_promesa_operaciones.dw_seguro.enabled			= false
		end if
		if ls_base='V' then
			w_validar_promesa_operaciones.cb_ingreso_benef.visible	= false
		else
			w_validar_promesa_operaciones.cb_ingreso_benef.visible	= true
		end if
		SELECT 	iva		INTO :ldb_iva	FROM tasa;
		if ls_base <> 'G' and ls_base<>'F' then ldb_iva=0
		if ls_base <> 'M' and ls_base<>'O' and ls_base <>'A' and ls_base<>'D' and ls_base<>'P' and ls_base<>'R' then
			w_validar_promesa_operaciones.dw_revision.setitem(1,'iva_cuota',ldb_iva) 
			w_validar_promesa_operaciones.dw_revision.setitem(1,'iva_pie',ldb_iva)
		end if
		w_validar_promesa_operaciones.dw_revision.accepttext()
//		if ls_base='V' then
			w_validar_promesa_operaciones.dw_revision.enabled		= true
			w_validar_promesa_operaciones.dw_seguro.visible			= true
			w_validar_promesa_operaciones.dw_base.enabled			= false
			w_validar_promesa_operaciones.ddlb_serie.enabled			= false
			w_validar_promesa_operaciones.em_numero.enabled		= false
			w_validar_promesa_operaciones.em_rut.enabled				= false
			w_validar_promesa_operaciones.em_dv.enabled				= false
//			w_validar_promesa_operaciones.em_numero.triggerevent(modified!)
			w_validar_promesa_operaciones.em_numero.setfocus()
			cb_cerrar.triggerevent(clicked!)
//		else
////			w_validar_promesa_operaciones.em_numero.triggerevent(modified!)
//			w_validar_promesa_operaciones.dw_revision.enabled		= true
//			w_validar_promesa_operaciones.dw_base.enabled			= false
//			w_validar_promesa_operaciones.ddlb_serie.enabled			= false
//			w_validar_promesa_operaciones.em_numero.enabled		= false
//			w_validar_promesa_operaciones.em_rut.enabled				= true
//			w_validar_promesa_operaciones.em_dv.enabled				= true
//			w_validar_promesa_operaciones.dw_revision.setfocus()
//			cb_cerrar.triggerevent(clicked!)
//		end if
	end if
end if
end event

type cb_cerrar from commandbutton within w_lista_revisiones
integer x = 2949
integer y = 1664
integer width = 293
integer height = 104
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_lista_revisiones)
end event

type dw_lista from datawindow within w_lista_revisiones
integer x = 37
integer y = 212
integer width = 3205
integer height = 1412
integer taborder = 40
string title = "none"
string dataobject = "dw_lista_revisiones_cttos_super"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if
end event

event doubleclicked;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
	cb_aceptar.triggerevent(clicked!)
end if
end event

type gb_1 from groupbox within w_lista_revisiones
integer x = 1262
integer y = 1624
integer width = 754
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

