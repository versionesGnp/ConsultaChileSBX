forward
global type w_liberar_cartera_cob from window
end type
type cb_asocia_rut from commandbutton within w_liberar_cartera_cob
end type
type mle_filtro from multilineedit within w_liberar_cartera_cob
end type
type cb_historico from commandbutton within w_liberar_cartera_cob
end type
type cb_ctacte from commandbutton within w_liberar_cartera_cob
end type
type hpb_1 from hprogressbar within w_liberar_cartera_cob
end type
type st_porc from statictext within w_liberar_cartera_cob
end type
type cb_1 from commandbutton within w_liberar_cartera_cob
end type
type cb_grabar from commandbutton within w_liberar_cartera_cob
end type
type cb_exportar from commandbutton within w_liberar_cartera_cob
end type
type cb_filtrar from commandbutton within w_liberar_cartera_cob
end type
type cb_ordenar from commandbutton within w_liberar_cartera_cob
end type
type st_4 from statictext within w_liberar_cartera_cob
end type
type st_liberar from statictext within w_liberar_cartera_cob
end type
type st_5 from statictext within w_liberar_cartera_cob
end type
type st_3 from statictext within w_liberar_cartera_cob
end type
type st_asig from statictext within w_liberar_cartera_cob
end type
type st_2 from statictext within w_liberar_cartera_cob
end type
type st_tot_cart from statictext within w_liberar_cartera_cob
end type
type cb_cerrar from commandbutton within w_liberar_cartera_cob
end type
type gb_3 from groupbox within w_liberar_cartera_cob
end type
type st_fondo from statictext within w_liberar_cartera_cob
end type
type dw_lista from datawindow within w_liberar_cartera_cob
end type
end forward

global type w_liberar_cartera_cob from window
integer width = 3378
integer height = 2116
boolean titlebar = true
string title = "Detalle Liberar Asignación"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
cb_asocia_rut cb_asocia_rut
mle_filtro mle_filtro
cb_historico cb_historico
cb_ctacte cb_ctacte
hpb_1 hpb_1
st_porc st_porc
cb_1 cb_1
cb_grabar cb_grabar
cb_exportar cb_exportar
cb_filtrar cb_filtrar
cb_ordenar cb_ordenar
st_4 st_4
st_liberar st_liberar
st_5 st_5
st_3 st_3
st_asig st_asig
st_2 st_2
st_tot_cart st_tot_cart
cb_cerrar cb_cerrar
gb_3 gb_3
st_fondo st_fondo
dw_lista dw_lista
end type
global w_liberar_cartera_cob w_liberar_cartera_cob

type variables
string	is_cartera,is_filtro
long 	il_new, il_row,il_ind_cart
datetime	idt_fecha=datetime(date(string('31/12/2099')),time('00:00:00'))
end variables

forward prototypes
public subroutine wf_cargar ()
end prototypes

public subroutine wf_cargar ();long		ll_tot_reg,ll_tot_filtro,ll_indi,ll_tot_liberar
double	ll_tot_porc=0,ll_tot_porc_aux=0

dw_lista.accepttext()
if not isnull(is_cartera) and is_cartera<>'' and not isnull(il_ind_cart) and il_ind_cart>0 then
	ll_tot_reg								= dw_lista.retrieve(is_cartera,il_ind_cart,idt_fecha)
	if ll_tot_reg=0 then
		messagebox("Advertencia","No Registra Cartera Asignada")
	else
		SetPointer(HourGlass!)
		st_tot_cart.text						= string(ll_tot_reg,'###,###,##0')		
		SELECT	"FILTRO_ASIGNACION"
		INTO		:is_filtro
    		FROM 	"GESTION_PORCE_COMIS"  
   		WHERE	"GESTION_PORCE_COMIS"."CARTERA_COBRANZA" = :is_cartera AND  
         			"GESTION_PORCE_COMIS"."INDICE_CARTERA" = :il_ind_cart AND  
         			"GESTION_PORCE_COMIS"."ESTADO" = 'V'
		USING	sqlca;
		if isnull(is_filtro) then is_filtro=''
		if not isnull(is_filtro) then
			mle_filtro.text					= is_filtro
			dw_lista.setFilter(is_filtro)
			dw_lista.filter()
			dw_lista.accepttext()
			ll_tot_filtro						= dw_lista.rowcount()
			if ll_tot_filtro=0 then
				messagebox("Advertencia","No Registra Contratos Para Liberar Asignación")
			else
				st_asig.text					= string(ll_tot_filtro,'###,###,##0')
				for ll_indi=1 to ll_tot_filtro
					dw_lista.setitem(ll_indi,"filtro",1)
				next
				dw_lista.accepttext()
				dw_lista.setFilter('filtro = 0')
				dw_lista.filter()
				dw_lista.accepttext()
				ll_tot_liberar				= dw_lista.rowcount()
				st_liberar.text				= string(ll_tot_liberar,'###,###,##0')
				if ll_tot_liberar=0 then
					messagebox("Advertencia","No Registra Contratos Para Liberar Asignación")
				end if
			end if
		else
			messagebox("Advertencia","Cartera Seleccionada No Registra Filtro Asignado")
		end if
		SetPointer(Arrow!)
	end if
end if


end subroutine

on w_liberar_cartera_cob.create
this.cb_asocia_rut=create cb_asocia_rut
this.mle_filtro=create mle_filtro
this.cb_historico=create cb_historico
this.cb_ctacte=create cb_ctacte
this.hpb_1=create hpb_1
this.st_porc=create st_porc
this.cb_1=create cb_1
this.cb_grabar=create cb_grabar
this.cb_exportar=create cb_exportar
this.cb_filtrar=create cb_filtrar
this.cb_ordenar=create cb_ordenar
this.st_4=create st_4
this.st_liberar=create st_liberar
this.st_5=create st_5
this.st_3=create st_3
this.st_asig=create st_asig
this.st_2=create st_2
this.st_tot_cart=create st_tot_cart
this.cb_cerrar=create cb_cerrar
this.gb_3=create gb_3
this.st_fondo=create st_fondo
this.dw_lista=create dw_lista
this.Control[]={this.cb_asocia_rut,&
this.mle_filtro,&
this.cb_historico,&
this.cb_ctacte,&
this.hpb_1,&
this.st_porc,&
this.cb_1,&
this.cb_grabar,&
this.cb_exportar,&
this.cb_filtrar,&
this.cb_ordenar,&
this.st_4,&
this.st_liberar,&
this.st_5,&
this.st_3,&
this.st_asig,&
this.st_2,&
this.st_tot_cart,&
this.cb_cerrar,&
this.gb_3,&
this.st_fondo,&
this.dw_lista}
end on

on w_liberar_cartera_cob.destroy
destroy(this.cb_asocia_rut)
destroy(this.mle_filtro)
destroy(this.cb_historico)
destroy(this.cb_ctacte)
destroy(this.hpb_1)
destroy(this.st_porc)
destroy(this.cb_1)
destroy(this.cb_grabar)
destroy(this.cb_exportar)
destroy(this.cb_filtrar)
destroy(this.cb_ordenar)
destroy(this.st_4)
destroy(this.st_liberar)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_asig)
destroy(this.st_2)
destroy(this.st_tot_cart)
destroy(this.cb_cerrar)
destroy(this.gb_3)
destroy(this.st_fondo)
destroy(this.dw_lista)
end on

event open;gf_centrar(w_liberar_cartera_cob)
dw_lista.settransobject(sqlca)
is_cartera									= substr(1,1,Message.StringParm)
il_ind_cart									= long(substr(1,2,Message.StringParm))
wf_cargar()
end event

type cb_asocia_rut from commandbutton within w_liberar_cartera_cob
integer x = 1239
integer y = 1860
integer width = 329
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Asociar * Rut"
end type

event clicked;dw_lista.accepttext()
if il_row>0 then
	gi_rut    					= dw_lista.getitemnumber(il_row,'rut')
	gi_tipo_busqueda = 1
	open(w_listado_contratos)
end if


end event

type mle_filtro from multilineedit within w_liberar_cartera_cob
integer x = 425
integer y = 1584
integer width = 2894
integer height = 244
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type cb_historico from commandbutton within w_liberar_cartera_cob
event ue_mousemove pbm_dwnmousemove
integer x = 1568
integer y = 1860
integer width = 270
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Co&branza"
end type

event clicked;if dw_lista.getrow()>0 then
	gs_base				= dw_lista.getitemstring(il_row,'codigo')
	gs_serie				= dw_lista.getitemstring(il_row,'serie')
	gi_numero			= dw_lista.getitemnumber(il_row,'numero')
	gi_rut					= dw_lista.getitemnumber(il_row,'rut')
	if isvalid(w_cobranza_historica) then close(w_cobranza_historica)
	open(w_cobranza_historica)
end if
end event

type cb_ctacte from commandbutton within w_liberar_cartera_cob
integer x = 823
integer y = 1860
integer width = 416
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "C&uenta Corriente"
end type

event clicked;string param
if il_row > 0 then
	gs_base  				= dw_lista.getitemstring(il_row,'codigo' )
	gs_serie  				= dw_lista.getitemstring(il_row,'serie')
	gi_numero 				= dw_lista.getitemnumber(il_row,'numero' )
	gi_rut    					= dw_lista.getitemnumber(il_row,'rut')
	param     = gs_base+'~t'+gs_serie+'~t'+string(gi_numero)+'~t'+string(gi_rut)
	CHOOSE CASE gs_base
		CASE "O" // Oferta
			if isvalid(w_cuenta_corriente_oferta) then close(w_cuenta_corriente_oferta)
			OpenWithParm(w_cuenta_corriente_oferta,param)
		CASE "L" // Anexo Liberador
			if isvalid(w_cuenta_corriente_liberador) then close(w_cuenta_corriente_liberador)
			OpenWithParm(w_cuenta_corriente_liberador,param)		
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
		CASE "A"
			if isvalid(w_cuenta_corriente_aumento_capacidad) then close(w_cuenta_corriente_aumento_capacidad)
			OpenWithParm(w_cuenta_corriente_aumento_capacidad,param)
		CASE "F"
				if isvalid(w_cuenta_corriente_funeraria) then close(w_cuenta_corriente_funeraria)
				open(w_cuenta_corriente_funeraria) 
	END CHOOSE
else
	messagebox('Seleción','Seleciones un contrato.',information!)
end if
end event

type hpb_1 from hprogressbar within w_liberar_cartera_cob
boolean visible = false
integer x = 1042
integer y = 668
integer width = 1371
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type st_porc from statictext within w_liberar_cartera_cob
boolean visible = false
integer x = 1618
integer y = 596
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

type cb_1 from commandbutton within w_liberar_cartera_cob
integer x = 475
integer y = 1860
integer width = 347
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Filtro &Cartera"
end type

event clicked;string	ls_filtro				
ls_filtro			= ''
dw_lista.setFilter(ls_filtro)
dw_lista.filter()
dw_lista.accepttext()
wf_cargar()
end event

type cb_grabar from commandbutton within w_liberar_cartera_cob
integer x = 41
integer y = 1856
integer width = 297
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_base,ls_serie,ls_ejec_ult_asig,ls_filtro
long		ll_tot_reg,ll_fila,ll_res,ll_indi,ll_grupo,ll_mes,ll_anno,ll_graba=0,ll_rut
double	ldb_tot_porc=0,ldb_tot_porc_aux=0,ldb_numero
datetime	ldt_fec_term,ldt_fec_ult_asig,ldt_prox_llam
date		ldt_fecha

dw_lista.accepttext()
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 	"TASA"
WHERE 	"TASA"."LOOK" = 1;
ldt_fecha									= RelativeDate(date(gdt_fec_sistema), -1)
ll_tot_reg								= dw_lista.rowcount()
if ll_tot_reg>0 then
	ll_fila 									= dw_lista.Find("marca = 1",1, ll_tot_reg)
	if ll_fila=0 then
		messagebox("Advertencia","Debe Seleccionar Registros A Liberar")
	else
		ll_res								= messageBox("Grabar","¿Desea Liberar Asignación de Contratos Seleccionados?", Exclamation!, YesNo!, 2)		
		if ll_res=1 then
			ll_mes						= long(month(date(gdt_fec_sistema)))
			ll_anno						= long(year(date(gdt_fec_sistema))) 
			if ll_mes=1 then
				ll_mes					= ll_mes + 11
				ll_anno					= ll_anno - 1
			else
				ll_mes					= ll_mes - 1
				ll_anno					= ll_anno
			end if
			ldt_fec_term				= f_fecha_fin(ll_mes,ll_anno)
			dw_lista.setFilter('marca = 1')
			dw_lista.filter()
			dw_lista.accepttext()
			ll_tot_reg					= dw_lista.rowcount()
			if ll_tot_reg>0 then
				st_fondo.visible			= true
				hpb_1.visible 			= true
				st_porc.visible 			= true
				hpb_1.Position			= ldb_tot_porc
				for ll_indi=1 to ll_tot_reg
					ls_base				= dw_lista.getitemstring(ll_indi,'codigo')
					ls_serie				= dw_lista.getitemstring(ll_indi,'serie')
					ldb_numero			= dw_lista.getitemnumber(ll_indi,'numero')
					ll_grupo				= dw_lista.getitemnumber(ll_indi,'codigo_grupo')
					ll_rut					= dw_lista.getitemnumber(ll_indi,'rut')
					ls_ejec_ult_asig	= dw_lista.getitemstring(ll_indi,'usuario_asignado')
					ldt_fec_ult_asig		= dw_lista.getitemdatetime(ll_indi,'fecha_asignacion') 
					ldt_prox_llam		= dw_lista.getitemdatetime(ll_indi,'fecha_prox_llamado') 
					
					UPDATE	"CLIENTE"  
					SET 		"FECHA_PROX_LLAMADO" = :ldt_fecha,  
								"ASIGNADO_COBRANZA" = 'N'
					WHERE 	"CLIENTE"."RUT" = :ll_rut   
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_graba++	
					else
						rollback;
						messagebox("Error Grabar","Error al Grabar Cliente "+string(ll_rut,'###,###,###,###')+" SQL: "+sqlca.sqlerrtext)
					end if
						
					INSERT INTO 	"LOG_ELIMINAR_CARTERA"  
								( "BASE",		"SERIE",	"NUMERO",		"FECHA_ELIMINACION",	"COD_EJECUTIVO",	"FECHA_ULT_ASIG",	"USUARIO",	"FEC_PROX_LLAMADO", "COD_GRUPO"	 )  
					VALUES	( :ls_base,	:ls_serie,	:ldb_numero,	:gdt_fec_sistema,			:ls_ejec_ult_asig,		:ldt_fec_ult_asig,		:gs_user,	:ldt_prox_llam,				:ll_grupo )  
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_graba++	
					else
						rollback;
					end if
					UPDATE	"GESTION_COBRANZA"  
					SET 		"ESTADO_GESTION" = 'G',   
								"FEC_TERMINO_ASIG" = :ldt_fec_term  
					WHERE	( "GESTION_COBRANZA"."BASE" = :ls_base ) AND  
								( "GESTION_COBRANZA"."SERIE" = :ls_serie ) AND  
								( "GESTION_COBRANZA"."NUMERO" = :ldb_numero ) AND  
								( "GESTION_COBRANZA"."CODIGO_GRUPO" = :ll_grupo )
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_graba++
					else
						rollback;
					end if
					
					UPDATE	"CADENA"  
					SET 		"DEPTO_COB_ASIG" = NULL  
					WHERE	( "CADENA"."CODIGO" = :ls_base ) AND  
								( "CADENA"."SERIE" = :ls_serie ) AND  
								( "CADENA"."NUMERO" = :ldb_numero ) 
					USING	sqlca;
					if sqlca.sqlcode=0 then
						commit;
						ll_graba++
					else
						rollback;
					end if
						
					if ldb_tot_porc <> ldb_tot_porc_aux then 
						st_porc.text			= string(ldb_tot_porc,'#0.##')+" %"
						ldb_tot_porc_aux	= ldb_tot_porc
					end if
					ldb_tot_porc				= (ll_indi / ll_tot_reg) * 100
					hpb_1.Position 			= ldb_tot_porc
				next
				st_fondo.visible				= false
				hpb_1.visible 				= false
				st_porc.visible 				= false
				if ll_graba=(ll_tot_reg * 3) then
					messagebox("Grabar","Grabación Exitosa")
					ls_filtro					= ''
					dw_lista.setFilter(ls_filtro)
					dw_lista.filter()
					dw_lista.accepttext()
					wf_cargar()
				end if
			end if
		end if
	end if
end if
end event

type cb_exportar from commandbutton within w_liberar_cartera_cob
integer x = 1979
integer y = 1868
integer width = 238
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "E&xportar"
end type

event clicked;datawindow dw_paso
dw_paso	= dw_lista
if dw_lista.rowcount() > 0 then f_DWToExcel( dw_paso )
end event

type cb_filtrar from commandbutton within w_liberar_cartera_cob
integer x = 2222
integer y = 1868
integer width = 238
integer height = 84
integer taborder = 60
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

type cb_ordenar from commandbutton within w_liberar_cartera_cob
integer x = 2464
integer y = 1868
integer width = 238
integer height = 84
integer taborder = 60
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

type st_4 from statictext within w_liberar_cartera_cob
integer x = 1371
integer y = 1496
integer width = 334
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "Para Liberar:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_liberar from statictext within w_liberar_cartera_cob
integer x = 1714
integer y = 1484
integer width = 261
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_liberar_cartera_cob
integer x = 50
integer y = 1600
integer width = 352
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Filtro Cartera:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liberar_cartera_cob
integer x = 718
integer y = 1496
integer width = 334
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Asignados:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_asig from statictext within w_liberar_cartera_cob
integer x = 1056
integer y = 1484
integer width = 261
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_liberar_cartera_cob
integer x = 69
integer y = 1496
integer width = 343
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Total Cartera:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_tot_cart from statictext within w_liberar_cartera_cob
integer x = 425
integer y = 1484
integer width = 261
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cerrar from commandbutton within w_liberar_cartera_cob
integer x = 3026
integer y = 1856
integer width = 297
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_liberar_cartera_cob)
end event

type gb_3 from groupbox within w_liberar_cartera_cob
integer x = 1961
integer y = 1824
integer width = 759
integer height = 148
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_fondo from statictext within w_liberar_cartera_cob
boolean visible = false
integer x = 1015
integer y = 572
integer width = 1431
integer height = 192
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

type dw_lista from datawindow within w_liberar_cartera_cob
integer x = 41
integer y = 36
integer width = 3269
integer height = 1408
integer taborder = 10
string title = "none"
string dataobject = "dw_libera_asignacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_columna
long	ll_tot_reg,ll_indi

ls_columna	= dwo.name
if row > 0 then
	il_row	= row
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row, TRUE)
end if

ll_tot_reg				= dw_lista.rowcount()
if ll_tot_reg>0 then	
	if ls_columna='t_marcar' then
		for	ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,"marca",1)
			dw_lista.accepttext()
		next
	elseif ls_columna='t_desmarcar' then
		for	ll_indi=1 to ll_tot_reg
			dw_lista.setitem(ll_indi,"marca",0)
			dw_lista.accepttext()
		next
	end if
end if



end event

