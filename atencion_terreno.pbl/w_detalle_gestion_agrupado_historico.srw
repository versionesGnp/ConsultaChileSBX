forward
global type w_detalle_gestion_agrupado_historico from window
end type
type ddlb_estado from dropdownlistbox within w_detalle_gestion_agrupado_historico
end type
type st_4 from statictext within w_detalle_gestion_agrupado_historico
end type
type st_3 from statictext within w_detalle_gestion_agrupado_historico
end type
type ddlb_ejecutivo from dropdownlistbox within w_detalle_gestion_agrupado_historico
end type
type cb_limpiar from commandbutton within w_detalle_gestion_agrupado_historico
end type
type cb_ctacte from commandbutton within w_detalle_gestion_agrupado_historico
end type
type cb_imprimir from commandbutton within w_detalle_gestion_agrupado_historico
end type
type cb_exportar from commandbutton within w_detalle_gestion_agrupado_historico
end type
type cb_filtrar from commandbutton within w_detalle_gestion_agrupado_historico
end type
type cb_ordenar from commandbutton within w_detalle_gestion_agrupado_historico
end type
type cb_cerrar from commandbutton within w_detalle_gestion_agrupado_historico
end type
type st_1 from statictext within w_detalle_gestion_agrupado_historico
end type
type st_2 from statictext within w_detalle_gestion_agrupado_historico
end type
type em_final from editmask within w_detalle_gestion_agrupado_historico
end type
type p_1 from picture within w_detalle_gestion_agrupado_historico
end type
type p_2 from picture within w_detalle_gestion_agrupado_historico
end type
type em_desde from editmask within w_detalle_gestion_agrupado_historico
end type
type pb_procesar from picturebutton within w_detalle_gestion_agrupado_historico
end type
type dw_lista from datawindow within w_detalle_gestion_agrupado_historico
end type
type gb_1 from groupbox within w_detalle_gestion_agrupado_historico
end type
end forward

global type w_detalle_gestion_agrupado_historico from window
integer width = 3726
integer height = 2140
boolean titlebar = true
string title = "Informe Gestión por Ejecutivo"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
ddlb_estado ddlb_estado
st_4 st_4
st_3 st_3
ddlb_ejecutivo ddlb_ejecutivo
cb_limpiar cb_limpiar
cb_ctacte cb_ctacte
cb_imprimir cb_imprimir
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
cb_cerrar cb_cerrar
st_1 st_1
st_2 st_2
em_final em_final
p_1 p_1
p_2 p_2
em_desde em_desde
pb_procesar pb_procesar
dw_lista dw_lista
gb_1 gb_1
end type
global w_detalle_gestion_agrupado_historico w_detalle_gestion_agrupado_historico

type variables
Long	il_row
end variables

on w_detalle_gestion_agrupado_historico.create
this.ddlb_estado=create ddlb_estado
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_ejecutivo=create ddlb_ejecutivo
this.cb_limpiar=create cb_limpiar
this.cb_ctacte=create cb_ctacte
this.cb_imprimir=create cb_imprimir
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.cb_cerrar=create cb_cerrar
this.st_1=create st_1
this.st_2=create st_2
this.em_final=create em_final
this.p_1=create p_1
this.p_2=create p_2
this.em_desde=create em_desde
this.pb_procesar=create pb_procesar
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.Control[]={this.ddlb_estado,&
this.st_4,&
this.st_3,&
this.ddlb_ejecutivo,&
this.cb_limpiar,&
this.cb_ctacte,&
this.cb_imprimir,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.cb_cerrar,&
this.st_1,&
this.st_2,&
this.em_final,&
this.p_1,&
this.p_2,&
this.em_desde,&
this.pb_procesar,&
this.dw_lista,&
this.gb_1}
end on

on w_detalle_gestion_agrupado_historico.destroy
destroy(this.ddlb_estado)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_ejecutivo)
destroy(this.cb_limpiar)
destroy(this.cb_ctacte)
destroy(this.cb_imprimir)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.cb_cerrar)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_final)
destroy(this.p_1)
destroy(this.p_2)
destroy(this.em_desde)
destroy(this.pb_procesar)
destroy(this.dw_lista)
destroy(this.gb_1)
end on

event open;String	ls_usuario,ls_nombre,ls_descrip
Long		ll_cod_estado

gf_centrar(w_detalle_gestion_agrupado_historico)
em_desde.text			= string(gdt_fec_sistema,"dd/mm/yyyy")
em_final.text			= string(gdt_fec_sistema,"dd/mm/yyyy")
dw_lista.settransobject(sqlca)
DECLARE x1 CURSOR FOR  
SELECT		"ENCARGADOS"."CODIGO_USUARIO",   
				"ENCARGADOS"."NOMBRE"  
FROM 		"ENCARGADOS"  
WHERE 		"ENCARGADOS"."DEPTO" = 'E'   
ORDER BY	"ENCARGADOS"."CODIGO_USUARIO" ASC  
USING		sqlca;
open x1;
DO WHILE sqlca.sqlcode=0
	fetch x1 into :ls_usuario, :ls_nombre;
	if not isnull(ls_usuario) then
		ddlb_ejecutivo.additem(trim(ls_usuario)+' - '+trim(ls_nombre))
	end if
	setnull(ls_usuario)
LOOP
close x1;
ddlb_ejecutivo.additem('All - Todos')

DECLARE x2 CURSOR FOR  
SELECT		"ESTADO_ATENCION"."COD_ESATDO",   
				"ESTADO_ATENCION"."GLOSA_ESTADO"  
FROM 		"ESTADO_ATENCION"  
ORDER BY	"ESTADO_ATENCION"."COD_ESATDO" ASC  
USING		sqlca;
open x2;
DO WHILE sqlca.sqlcode=0
	fetch x2 into :ll_cod_estado, :ls_descrip;
	if not isnull(ll_cod_estado) then
		ddlb_estado.additem(string(ll_cod_estado)+' - '+trim(ls_descrip))
	end if
	setnull(ll_cod_estado)
LOOP
close x2;
ddlb_estado.additem('All - Todos')
ddlb_estado.additem('P - Pendientes')

SELECT	"SOL_PERMISOS_USUARIO"."USUARIO"  
INTO 		:ls_usuario  
FROM 	"SOL_PERMISOS_USUARIO"  
WHERE	( "SOL_PERMISOS_USUARIO"."CODIGO_SOLICITUD" = 'AT' ) AND  
			( "SOL_PERMISOS_USUARIO"."USUARIO" = :gs_user ) AND  
		 	( "SOL_PERMISOS_USUARIO"."ESTADO" = 'A' )   
USING	sqlca;
if sqlca.sqlcode=0 or gs_depto='I' then
	st_3.visible						= true
	ddlb_ejecutivo.visible			= true
else
	st_3.visible						= false
	ddlb_ejecutivo.visible			= false
end if
end event

type ddlb_estado from dropdownlistbox within w_detalle_gestion_agrupado_historico
integer x = 1582
integer y = 44
integer width = 923
integer height = 516
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
boolean autohscroll = true
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type st_4 from statictext within w_detalle_gestion_agrupado_historico
integer x = 1381
integer y = 60
integer width = 192
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_detalle_gestion_agrupado_historico
integer x = 2510
integer y = 56
integer width = 247
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ejecutivo"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_ejecutivo from dropdownlistbox within w_detalle_gestion_agrupado_historico
integer x = 2766
integer y = 44
integer width = 745
integer height = 516
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;dw_lista.reset()
end event

type cb_limpiar from commandbutton within w_detalle_gestion_agrupado_historico
integer x = 1627
integer y = 1920
integer width = 297
integer height = 92
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_lista.reset()
em_desde.text	= string(gdt_fec_sistema,"dd/mm/yyyy")
em_final.text	= string(gdt_fec_sistema,"dd/mm/yyyy")
em_desde.setfocus()
end event

type cb_ctacte from commandbutton within w_detalle_gestion_agrupado_historico
integer x = 32
integer y = 1920
integer width = 407
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string 	ls_base,ls_serie,param
long 	 	ll_rut
Double	ll_numero
if il_row > 0 then
	gs_base		= dw_lista.getitemstring(il_row,'at_gestion_base')
	gs_serie		= dw_lista.getitemstring(il_row,'at_gestion_serie')
	gi_numero	= dw_lista.getitemnumber(il_row,'at_gestion_numero')
	gi_rut		= dw_lista.getitemnumber(il_row,'at_gestion_rut_cliente')	
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O","U","M" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
		CASE "F","G" // Anexo funeraria
			if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
			OpenWithParm(w_cuenta_corriente_funeraria,param)		
		CASE "P" // Pagaré
			if isvalid(w_cuenta_corriente_pagare) then close(w_cuenta_corriente_pagare)
			OpenWithParm(w_cuenta_corriente_pagare,param)		
		CASE "C" // Contrato ISA	
			if isvalid(w_cuenta_corriente_contrato_isa) then close(w_cuenta_corriente_contrato_isa)
			OpenWithParm(w_cuenta_corriente_contrato_isa,param)		
		CASE "D" // Derecho Especial
			if isvalid(w_cuenta_corriente_derecho) then close(w_cuenta_corriente_derecho)
			OpenWithParm(w_cuenta_corriente_derecho,param)		
		CASE "R"
			if isvalid(w_cuenta_corriente_repactar_cta_mant) then close(w_cuenta_corriente_repactar_cta_mant)
			OpenWithParm(w_cuenta_corriente_repactar_cta_mant,param)
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if

end event

type cb_imprimir from commandbutton within w_detalle_gestion_agrupado_historico
event ue_mousemove pbm_mousemove
integer x = 1303
integer y = 1920
integer width = 247
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;if dw_lista.rowcount()>0 then
	f_Print( dw_lista )
end if
end event

type cb_exportar from commandbutton within w_detalle_gestion_agrupado_historico
event ue_mousemove pbm_mousemove
integer x = 1010
integer y = 1920
integer width = 247
integer height = 92
integer taborder = 90
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

type cb_filtrar from commandbutton within w_detalle_gestion_agrupado_historico
event ue_mousemove pbm_mousemove
integer x = 759
integer y = 1920
integer width = 247
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
setnull (nulo)
dw_lista.SETfilter(NULO)
dw_lista.filter()
end event

type cb_ordenar from commandbutton within w_detalle_gestion_agrupado_historico
event ue_mousemove pbm_mousemove
integer x = 507
integer y = 1920
integer width = 247
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;if dw_lista.rowcount() > 0 then
	string nulo
	setnull (nulo)
	dw_lista.SETSORT(NULO)
	dw_lista.SORT()
end if
end event

type cb_cerrar from commandbutton within w_detalle_gestion_agrupado_historico
integer x = 3346
integer y = 1920
integer width = 334
integer height = 92
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_detalle_gestion_agrupado_historico)
end event

type st_1 from statictext within w_detalle_gestion_agrupado_historico
integer x = 37
integer y = 56
integer width = 325
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicial:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_detalle_gestion_agrupado_historico
integer x = 795
integer y = 56
integer width = 155
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "hasta"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_final from editmask within w_detalle_gestion_agrupado_historico
integer x = 951
integer y = 40
integer width = 338
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type p_1 from picture within w_detalle_gestion_agrupado_historico
integer x = 704
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_desde.text)='00/00/0000' or trim(em_desde.text)='' or &
	isnull(trim(em_desde.text)) then	
	
	em_desde.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_desde.text)=-1 then 
	em_desde.text=string(today(),gs_formato_fecha)
	em_desde.setfocus()
	return
end if	
if trim(em_desde.text)<>'00/00/0000' and not isnull(trim(em_desde.text)) and &
	trim(em_desde.text)<>'' then
	ls_fecha = em_desde.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_desde.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_desde.text = Message.StringParm
end event

type p_2 from picture within w_detalle_gestion_agrupado_historico
integer x = 1294
integer y = 40
integer width = 78
integer height = 88
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;String	ls_fecha
if trim(em_final.text)='00/00/0000' or trim(em_final.text)='' or &
	isnull(trim(em_final.text)) then	
	
	em_final.text	= string(today(),"dd/mm/yyyy")
end if
if f_valida_fecha(em_final.text)=-1 then 
	em_final.text=string(today(),gs_formato_fecha)
	em_final.setfocus()
	return
end if	
if trim(em_final.text)<>'00/00/0000' and not isnull(trim(em_final.text)) and &
	trim(em_final.text)<>'' then
	ls_fecha = em_final.text
else
	ls_fecha = string(today(),gs_formato_fecha)
end if	
dw_lista.reset()
em_final.text = ls_fecha
OpenWithParm(w_calendar,ls_fecha)
em_final.text = Message.StringParm
end event

type em_desde from editmask within w_detalle_gestion_agrupado_historico
integer x = 361
integer y = 40
integer width = 338
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event modified;dw_lista.reset()
end event

type pb_procesar from picturebutton within w_detalle_gestion_agrupado_historico
integer x = 3538
integer y = 24
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;Date		ld_fecha_ini,ld_fecha_fin
String		ls_ejecutivo,ls_cod_usu,ls_usu_sel,ls_cod_est,ls_est_sel,ls_estado,ls_base,&
			ls_serie,ls_string
Long		ll_pos,ll_pos_est,ll_tot_reg,ll_indi,ll_count
Double	ll_numero

SetPointer(HourGlass!)
ls_string							= ''
dw_lista.SETfilter(ls_string)
dw_lista.filter()
ld_fecha_ini						= date(em_desde.text)
ld_fecha_fin						= date(em_final.text)
ls_cod_usu						= trim(ddlb_ejecutivo.text)
ll_pos								= Pos(ls_cod_usu, "-")
if ll_pos>0 then
	ll_pos							= ll_pos - 1
	ls_usu_sel					= trim(mid(ls_cod_usu,1,ll_pos))
end if
if ls_usu_sel='All' then
	ls_ejecutivo					= '%'
else
	ls_ejecutivo					= ls_usu_sel
end if
ls_cod_est						= trim(ddlb_estado.text)
ll_pos_est						= Pos(ls_cod_est, "-")
if ll_pos_est>0 then
	ll_pos_est					= ll_pos_est - 1
	ls_est_sel					= trim(mid(ls_cod_est,1,ll_pos_est))
end if
if ls_est_sel='All' or ls_est_sel='P' then
	ls_estado					= '%'
else
	ls_estado					= ls_est_sel
end if
if ddlb_ejecutivo.visible=false then
	ls_ejecutivo					= gs_user
end if
if ld_fecha_ini > ld_fecha_fin then
	Messagebox("Advertencia","Rango de Fecha Inválida")
	em_desde.setfocus()
else
	if not isnull(ls_estado) and ls_estado<>'' then
		if not isnull(ls_ejecutivo) and ls_ejecutivo<>'' then
			ll_tot_reg			= dw_lista.retrieve(ld_fecha_ini,ld_fecha_fin,ls_ejecutivo,ls_estado)
			if ll_tot_reg=0 then
				messagebox("Advertencia","No Registra Dato")
			else
				for ll_indi=1 to ll_tot_reg
					ls_base		= dw_lista.getitemstring(ll_indi,'at_gestion_base')
					ls_serie		= dw_lista.getitemstring(ll_indi,'at_gestion_serie')
					ll_numero	= dw_lista.getitemnumber(ll_indi,'at_gestion_numero')
					SELECT	Count("ATENCION_LOG"."RUT")  
					INTO 		:ll_count  
					FROM 	"ATENCION_LOG","AT_GESTION"  
					WHERE	( "ATENCION_LOG"."BASE" = "AT_GESTION"."BASE" ) and  
								( "ATENCION_LOG"."SERIE" = "AT_GESTION"."SERIE" ) and  
							 	( "ATENCION_LOG"."NUMERO" = "AT_GESTION"."NUMERO" ) and  
							 	( "ATENCION_LOG"."USUARIO" = "AT_GESTION"."USUARIO_ASIGNADO" ) and  
							 	(("ATENCION_LOG"."BASE" = :ls_base ) AND  
							 	( "ATENCION_LOG"."SERIE" = :ls_serie ) AND  
							 	( "ATENCION_LOG"."NUMERO" = :ll_numero ) AND 
							 	(( "ATENCION_LOG"."ESTADO" = '17' ) or ( "ATENCION_LOG"."ESTADO" = '10' ) or ( "ATENCION_LOG"."ESTADO" = '18' )))   
					USING	sqlca;
					if ll_count>0 then
						dw_lista.setitem(ll_indi,'estado_pendiente','N')
					else
						dw_lista.setitem(ll_indi,'estado_pendiente','S')
					end if
				next
				dw_lista.accepttext()
				if ls_est_sel='P' then
					ls_string	= 'estado_pendiente="S"'
					dw_lista.SETfilter(ls_string)
					dw_lista.filter()
				end if
			end if
		else
			messagebox("Advertencia","Debe Seleccionar Ejecutivo")
			ddlb_ejecutivo.setfocus()
		end if
	else
		messagebox("Advertencia","Debe Seleccionar Estado")
			ddlb_estado.setfocus()
	end if
end if
SetPointer(Arrow!)
end event

type dw_lista from datawindow within w_detalle_gestion_agrupado_historico
integer x = 32
integer y = 180
integer width = 3648
integer height = 1692
integer taborder = 50
string title = "none"
string dataobject = "dw_listado_gestion_por_ejecutivo_doc_pen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;String	ls_columna,ls_filtro,ls_cod_est,ls_est_sel
Long		ll_pos_est
if row>0 then
	il_row				= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
else
	ls_columna			= dwo.name
	if ls_columna='t_con_mora' then
		ls_cod_est						= trim(ddlb_estado.text)
		ll_pos_est						= Pos(ls_cod_est, "-")
		if ll_pos_est>0 then
			ll_pos_est					= ll_pos_est - 1
			ls_est_sel					= trim(mid(ls_cod_est,1,ll_pos_est))
		end if
		if dw_lista.object.t_con_mora.text='Mostrar Solo Mora Cred' then
			if ls_est_sel='P' then
				ls_filtro	= 'estado_pendiente="S" and cadena_mora_mora_cred>0'
			else
				ls_filtro	= 'cadena_mora_mora_cred>0'
			end if
			dw_lista.SETfilter(ls_filtro)
			dw_lista.filter()
			dw_lista.object.t_con_mora.text='Mostrar Todo'
		elseif dw_lista.object.t_con_mora.text='Mostrar Todo' then
			if ls_est_sel='P' then
				ls_filtro	= 'estado_pendiente="S"'
			else
				ls_filtro	= ''
			end if
			dw_lista.SETfilter(ls_filtro)
			dw_lista.filter()
			dw_lista.object.t_con_mora.text='Mostrar Solo Mora Cred'
		end if
	end if
end if
end event

event rowfocuschanged;if getrow()>0 then
	il_row	= getrow()
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if
end event

type gb_1 from groupbox within w_detalle_gestion_agrupado_historico
event ue_mousemove pbm_mousemove
integer x = 485
integer y = 1872
integer width = 1093
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

