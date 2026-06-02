forward
global type w_ejecutivo_cabecera_ugn_bkp from window
end type
type cb_cerrar from commandbutton within w_ejecutivo_cabecera_ugn_bkp
end type
type cb_grabar from commandbutton within w_ejecutivo_cabecera_ugn_bkp
end type
type dw_ejecutivo_cabecera from datawindow within w_ejecutivo_cabecera_ugn_bkp
end type
end forward

global type w_ejecutivo_cabecera_ugn_bkp from window
integer width = 2679
integer height = 1548
boolean titlebar = true
string title = "Grabar Asignación"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
event ue_cargar pbm_custom01
cb_cerrar cb_cerrar
cb_grabar cb_grabar
dw_ejecutivo_cabecera dw_ejecutivo_cabecera
end type
global w_ejecutivo_cabecera_ugn_bkp w_ejecutivo_cabecera_ugn_bkp

event ue_cargar;date		ldt_fec_asigna
Long		ll_new,ll_cod_parque,ll_convenio,ll_res
String	ls_descrip

dw_ejecutivo_cabecera.getchild('cod_ejecutivo',idw_detalle)
idw_detalle.settransobject(sqlca)
if idw_detalle.retrieve('')=0 then idw_detalle.insertrow(0)
//dw_ejecutivo_cabecera.insertrow(0)
//dw_ejecutivo_cabecera.accepttext()

ll_new				= dw_ejecutivo_cabecera.insertrow(0)
ldt_fec_asigna		= Date(gdt_fec_sistema)
ll_cod_parque		= w_ejecutivo_ugn.dw_parque.getitemnumber(1,'parque')
dw_ejecutivo_cabecera.setitem(ll_new,'parque',ll_cod_parque)
dw_ejecutivo_cabecera.setitem(ll_new,'fecha_asignacion',ldt_fec_asigna)
dw_ejecutivo_cabecera.setitem(ll_new,'estado_registro','B')
dw_ejecutivo_cabecera.setitem(ll_new,'usuario_asignador',gs_user)
if isvalid(w_ejecutivo_ugn) then
	ll_convenio		= w_ejecutivo_ugn.dw_lista_ejecutivo.getitemnumber(1,'ugn_cliente_asignar_falle_codigo_conveni')
	if not isnull(ll_convenio) then 
		SELECT	"CONVENIO_RETIRO"."GLOSA"  
		INTO		:ls_descrip  
		FROM		"CONVENIO_RETIRO"  
		WHERE		"CONVENIO_RETIRO"."COD_CONVENIO" = :ll_convenio   
		USING		sqlca;
		if sqlca.sqlcode=0 then
			ll_res		= messagebox("Advertencia","Desea Asignar Convenio Codigo: "+string(ll_convenio,'###,###,###,##0')+' - '+ls_descrip,Exclamation!,YesNo!,2)
			if ll_res=1 then
				dw_ejecutivo_cabecera.setitem(ll_new,'codigo_convenio',ll_convenio)
			end if
		end if
	end if
end if



dw_ejecutivo_cabecera.accepttext()
end event

on w_ejecutivo_cabecera_ugn_bkp.create
this.cb_cerrar=create cb_cerrar
this.cb_grabar=create cb_grabar
this.dw_ejecutivo_cabecera=create dw_ejecutivo_cabecera
this.Control[]={this.cb_cerrar,&
this.cb_grabar,&
this.dw_ejecutivo_cabecera}
end on

on w_ejecutivo_cabecera_ugn_bkp.destroy
destroy(this.cb_cerrar)
destroy(this.cb_grabar)
destroy(this.dw_ejecutivo_cabecera)
end on

event open;gf_centrar(w_ejecutivo_cabecera_ugn)
dw_ejecutivo_cabecera.settransobject(SQLCA)

PostEvent('ue_cargar')



end event

type cb_cerrar from commandbutton within w_ejecutivo_cabecera_ugn_bkp
integer x = 2254
integer y = 1300
integer width = 361
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
end type

event clicked;close(w_ejecutivo_cabecera_ugn)
end event

type cb_grabar from commandbutton within w_ejecutivo_cabecera_ugn_bkp
integer x = 50
integer y = 1300
integer width = 297
integer height = 112
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string 	ls_pasa='S',ls_ejecutivo,ls_obervacion,ls_est_reg,ls_ult_glosa,ls_est_registro,&
			ls_ult_est_gestion,ls_cod_sup
long	 	ll_grupo,ll_tot_reg,ll_indi,ll_grupo_cli,ll_corre_cli
Date		ldt_ult_fec_gestion	

dw_ejecutivo_cabecera.accepttext()
if dw_ejecutivo_cabecera.rowcount()>0 then
	ls_obervacion		= dw_ejecutivo_cabecera.getitemstring(1,'observacion')
//	ls_ejecutivo		= dw_ejecutivo_cabecera.getitemstring(1,'cod_ejecutivo')
	ls_cod_sup		= dw_ejecutivo_cabecera.getitemstring(1,'cod_sup')
	if isnull(ls_cod_sup) or ls_cod_sup=''then
		messagebox("Advertencia","Falta ingresar Supervisor ")
		ls_pasa			= 'N'
		dw_ejecutivo_cabecera.setfocus()
		dw_ejecutivo_cabecera.setcolumn('parque')
	elseif isnull(ls_obervacion) or ls_obervacion=''then
		messagebox("Advertencia","Falta ingresar Observación ")
		ls_pasa			= 'N'
		dw_ejecutivo_cabecera.setfocus()
		dw_ejecutivo_cabecera.setcolumn('observacion')
	end if
	if ls_pasa = 'S'	then
		ll_grupo				= 0
		SELECT distinct MAX("UGN_EJECUTIVO"."GRUPO")
		INTO 	 :ll_grupo
		FROM 	 "UGN_EJECUTIVO"
		USING	 sqlca;
		if sqlca.sqlcode = 0 then
			if not isnull(ll_grupo) and ll_grupo>0 then
				ll_grupo	++
			else
				ll_grupo			= 1
			end if
		else
			ll_grupo				= 1
		end if
		dw_ejecutivo_cabecera.setitem(1,'grupo',ll_grupo)
		dw_ejecutivo_cabecera.accepttext()
		if dw_ejecutivo_cabecera.update()=1 then
			commit;
			ll_tot_reg					= w_ejecutivo_detalle_ugn.dw_lista_asig.rowcount()
			ls_est_registro			= dw_ejecutivo_cabecera.getitemstring(1,'estado_registro')
			ls_ult_est_gestion		= '0'
			ldt_ult_fec_gestion		= date(gdt_fec_sistema)
			for ll_indi=1 to ll_tot_reg
				w_ejecutivo_detalle_ugn.dw_lista_asig.setitem(ll_indi,'grupo',ll_grupo)
			//	w_ejecutivo_detalle_ugn.dw_lista_asig.setitem(ll_indi,'usuario',ls_ejecutivo)
				w_ejecutivo_detalle_ugn.dw_lista_asig.setitem(ll_indi,'usuario',ls_cod_sup)
				ls_ult_glosa			= 'ASIGNACION CARTERA UGN EL DIA '+string(ldt_ult_fec_gestion,'dd/mm/yyyy')+' POR '+gs_user
				ll_grupo_cli			= w_ejecutivo_detalle_ugn.dw_lista_asig.getitemnumber(ll_indi,'grupo_cliente')
				ll_corre_cli			= w_ejecutivo_detalle_ugn.dw_lista_asig.getitemnumber(ll_indi,'correlativo_cliente')
				UPDATE	"UGN_CLIENTE"  
				SET 		"ULT_ESTADO_GESTION" = :ls_ult_est_gestion,   
							"ULT_FECHA_GESTION" = :ldt_ult_fec_gestion,   
							"ULT_GLOSA_GESTION" = :ls_ult_glosa,   
							"PROX_LLAMADO_COB" = null,   
							"ESTADO_REGISTRO" = 'B',   
							"ESTADO_GRUPO" = 'G'  
				WHERE  ( "UGN_CLIENTE"."GRUPO" = :ll_grupo_cli ) AND  
						 ( "UGN_CLIENTE"."CORRELATIVO" = :ll_corre_cli )   
				USING		sqlca;				
				if sqlca.sqlcode=0 then
					commit;
				else
					rollback;
					Messagebox("Error","Error al Grabar Ultima Gestión en Tabla UGN_CLIENTE SQL: "+sqlca.sqlerrtext)
				end if
			next	
			w_ejecutivo_detalle_ugn.dw_lista_asig.accepttext()
			if w_ejecutivo_detalle_ugn.dw_lista_asig.update() = 1 then
				commit;
				messagebox("Grabar","Grabación Exitosa")
				close(w_ejecutivo_cabecera_ugn)
				close(w_ejecutivo_detalle_ugn)
				w_ejecutivo_ugn.pb_aceptar.triggerevent(clicked!)
				w_ejecutivo_ugn.setfocus()
			else
				rollback;
				Messagebox("Error","Error al Grabar Tabla UGN_EJECUTIVO_DETALLE SQL: "+sqlca.sqlerrtext)
			end if
		else
			rollback;
			messagebox("Error","Error al Grabar Tabla UGN_EJECUTIVO "+SQLCA.SQLErrText)
		end if
	end if	
end if
end event

type dw_ejecutivo_cabecera from datawindow within w_ejecutivo_cabecera_ugn_bkp
integer x = 27
integer y = 32
integer width = 2624
integer height = 1228
integer taborder = 10
string title = "none"
string dataobject = "dw_ejecutivo_cab"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string		ls_superv,ls_nulo,ls_columna

Setnull(ls_nulo)
ls_columna											= dwo.name
dw_ejecutivo_cabecera.accepttext()

if ls_columna = 'cod_sup' then
	dw_ejecutivo_cabecera.setitem(1,'cod_ejecutivo',ls_nulo)
	dw_ejecutivo_cabecera.accepttext()
	ls_superv								= dw_ejecutivo_cabecera.getitemstring(1,'cod_sup')
	idw_detalle.retrieve(ls_superv)
	dw_ejecutivo_cabecera.accepttext()
END IF	






end event

event itemfocuschanged;//string		ls_superv,ls_nulo
//
//dw_ejecutivo_cabecera.accepttext()
//Setnull(ls_nulo)
//dw_ejecutivo_cabecera.setitem(1,'cod_ejecutivo',ls_nulo)
//dw_ejecutivo_cabecera.accepttext()
//ls_superv								= dw_ejecutivo_cabecera.getitemstring(1,'cod_sup')
//idw_detalle.retrieve(ls_superv)
//dw_ejecutivo_cabecera.accepttext()
end event

