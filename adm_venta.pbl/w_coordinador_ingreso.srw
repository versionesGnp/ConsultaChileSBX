forward
global type w_coordinador_ingreso from window
end type
type p_ini from picture within w_coordinador_ingreso
end type
type st_2 from statictext within w_coordinador_ingreso
end type
type em_inicio from editmask within w_coordinador_ingreso
end type
type st_1 from statictext within w_coordinador_ingreso
end type
type dw_coord from datawindow within w_coordinador_ingreso
end type
type dw_lista from datawindow within w_coordinador_ingreso
end type
type pb_eliminar from picturebutton within w_coordinador_ingreso
end type
type pb_agregar from picturebutton within w_coordinador_ingreso
end type
type cb_grabar from commandbutton within w_coordinador_ingreso
end type
type cb_limpiar from commandbutton within w_coordinador_ingreso
end type
type pb_aceptar from picturebutton within w_coordinador_ingreso
end type
type cb_2 from commandbutton within w_coordinador_ingreso
end type
type cb_imprimir from commandbutton within w_coordinador_ingreso
end type
type dw_seleccion from datawindow within w_coordinador_ingreso
end type
type gb_1 from groupbox within w_coordinador_ingreso
end type
type dw_destino from datawindow within w_coordinador_ingreso
end type
end forward

global type w_coordinador_ingreso from window
integer width = 3973
integer height = 2120
boolean titlebar = true
string title = "Ingreso Coordinadores"
boolean controlmenu = true
long backcolor = 67108864
p_ini p_ini
st_2 st_2
em_inicio em_inicio
st_1 st_1
dw_coord dw_coord
dw_lista dw_lista
pb_eliminar pb_eliminar
pb_agregar pb_agregar
cb_grabar cb_grabar
cb_limpiar cb_limpiar
pb_aceptar pb_aceptar
cb_2 cb_2
cb_imprimir cb_imprimir
dw_seleccion dw_seleccion
gb_1 gb_1
dw_destino dw_destino
end type
global w_coordinador_ingreso w_coordinador_ingreso

type variables
long il_row,il_row_origen,il_row_destino,il_tot_filas,il_fila
DragObject control_dw, control_dw2
end variables

forward prototypes
public function long wf_tot_reg (datetime adt_fecha_act)
end prototypes

public function long wf_tot_reg (datetime adt_fecha_act);long	ll_tot_reg,ll_tot_reg_peso,ll_tot_reg_uf

//wf_tot_reg(adt_fecha_act)
SELECT	count("CADENA"."CODIGO")
INTO		:ll_tot_reg_peso
FROM		"CADENA","OFERTA_V","PAGO_OFERTA","SUPERVISOR"  
WHERE		"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
			"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
			"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
			"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
			"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
			"OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" and  
			"CADENA"."CODIGO" = 'O' AND
			"CADENA"."SERIE" <> 'R' AND    
			("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
			"PAGO_OFERTA"."MONEDA" = '1' AND  
			"SUPERVISOR"."ESTADO" = 'A' AND  
			"SUPERVISOR"."CANAL" = 'NF' AND
			"CADENA"."PREMIO_ING_CAJA" = 1 AND
			//"OFERTA_V"."CIERRE_VENTA" <= :adt_fecha_act AND  
			ROUND(((	SELECT	SUM("INGRESO"."MONTO")  
						FROM 		"INGRESO"  
						WHERE 	"INGRESO"."BASE" = "CADENA"."CODIGO" AND  
									"INGRESO"."SERIE" = "CADENA"."SERIE" AND  
									"INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND  
									("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E') AND  
									"INGRESO"."FECHA_PAGO" <= :adt_fecha_act) * 100) / (("PAGO_OFERTA"."NRO_CUOTAS" * "PAGO_OFERTA"."VALOR_CUOTA") + "PAGO_OFERTA"."PIE_PAGADO"),2) >= 15
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_tot_reg_peso) and ll_tot_reg_peso>0 then
		ll_tot_reg_peso		= ll_tot_reg_peso
	else
		ll_tot_reg_peso		= 0
	end if
else
	ll_tot_reg_peso			= 0
end if
	 
 
SELECT	count("CADENA"."CODIGO")
INTO		:ll_tot_reg_uf
FROM		"CADENA","OFERTA_V","PAGO_OFERTA","SUPERVISOR","TAB_UF"  
WHERE		"OFERTA_V"."SERIE" = "PAGO_OFERTA"."SERIE" and  
			"OFERTA_V"."NRO_OFERTA" = "PAGO_OFERTA"."NRO_OFERTA" and  
			"OFERTA_V"."ULT_FOLIO" = "PAGO_OFERTA"."FOLIO" and  
			"CADENA"."SERIE" = "OFERTA_V"."SERIE" and  
			"CADENA"."NUMERO" = "OFERTA_V"."NRO_OFERTA" and  
			"OFERTA_V"."COD_SUP" = "SUPERVISOR"."COD_SUP" and  
			"CADENA"."CODIGO" = 'O' AND
			"CADENA"."SERIE" <> 'R' AND    
			("CADENA"."ESTADO" = 'V' OR "CADENA"."ESTADO" = 'C') AND  
			"PAGO_OFERTA"."MONEDA" = '2' AND  
			"SUPERVISOR"."ESTADO" = 'A' AND  
			"SUPERVISOR"."CANAL" = 'NF' AND
			"CADENA"."PREMIO_ING_CAJA" = 1 AND  
			//"OFERTA_V"."CIERRE_VENTA" <= :adt_fecha_act AND 
			"TAB_UF"."FECHA_UF" = :adt_fecha_act AND 
			ROUND((((SELECT	SUM("INGRESO"."MONTO")
						FROM 		"INGRESO"
						WHERE 	"INGRESO"."BASE" = "CADENA"."CODIGO" AND
									"INGRESO"."SERIE" = "CADENA"."SERIE" AND  
									"INGRESO"."CONTRATO" = "CADENA"."NUMERO" AND  
									("INGRESO"."TIPO_MOV" = 'A' OR "INGRESO"."TIPO_MOV" = 'E') AND  
									"INGRESO"."FECHA_PAGO" <= :adt_fecha_act) / "TAB_UF"."VALOR_UF") * 100) / (("PAGO_OFERTA"."NRO_CUOTAS" * "PAGO_OFERTA"."VALOR_CUOTA")+("PAGO_OFERTA"."PIE_PAGADO" / "TAB_UF"."VALOR_UF")),2) >= 15
USING	sqlca;
if sqlca.sqlcode=0 then
	if not isnull(ll_tot_reg_uf) and ll_tot_reg_uf>0 then
		ll_tot_reg_uf			= ll_tot_reg_uf
	else
		ll_tot_reg_uf			= 0
	end if
else
	ll_tot_reg_uf				= 0
end if
ll_tot_reg						= ll_tot_reg_peso+ll_tot_reg_uf
if isnull(ll_tot_reg) then ll_tot_reg=0
return 		ll_tot_reg

end function

on w_coordinador_ingreso.create
this.p_ini=create p_ini
this.st_2=create st_2
this.em_inicio=create em_inicio
this.st_1=create st_1
this.dw_coord=create dw_coord
this.dw_lista=create dw_lista
this.pb_eliminar=create pb_eliminar
this.pb_agregar=create pb_agregar
this.cb_grabar=create cb_grabar
this.cb_limpiar=create cb_limpiar
this.pb_aceptar=create pb_aceptar
this.cb_2=create cb_2
this.cb_imprimir=create cb_imprimir
this.dw_seleccion=create dw_seleccion
this.gb_1=create gb_1
this.dw_destino=create dw_destino
this.Control[]={this.p_ini,&
this.st_2,&
this.em_inicio,&
this.st_1,&
this.dw_coord,&
this.dw_lista,&
this.pb_eliminar,&
this.pb_agregar,&
this.cb_grabar,&
this.cb_limpiar,&
this.pb_aceptar,&
this.cb_2,&
this.cb_imprimir,&
this.dw_seleccion,&
this.gb_1,&
this.dw_destino}
end on

on w_coordinador_ingreso.destroy
destroy(this.p_ini)
destroy(this.st_2)
destroy(this.em_inicio)
destroy(this.st_1)
destroy(this.dw_coord)
destroy(this.dw_lista)
destroy(this.pb_eliminar)
destroy(this.pb_agregar)
destroy(this.cb_grabar)
destroy(this.cb_limpiar)
destroy(this.pb_aceptar)
destroy(this.cb_2)
destroy(this.cb_imprimir)
destroy(this.dw_seleccion)
destroy(this.gb_1)
destroy(this.dw_destino)
end on

event open;string	ls_nulo,ls_jefe
long		ll_parque,ll_tot_reg

connect using Trans_1;
connect using Trans_2;
gf_centrar(w_coordinador_ingreso)
dw_coord.reset()
dw_destino.reset()
dw_coord.settransobject(sqlca)
dw_coord.getchild('coordinador',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve('')=0 then
	idw_detalle3.insertrow(0)
end if
em_inicio.text														= string(gdt_fec_sistema,'dd/mm/yyyy')
dw_coord.insertrow(0)
if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque													= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque													= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque													= 801
	end if
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.getchild('supervisor',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ll_parque,'')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_lista.reset()
	dw_seleccion.accepttext()
	
elseif gl_proceso=3 then
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,gs_user)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		end if
	dw_lista.reset()
	dw_seleccion.accepttext()

elseif gl_proceso=2 then
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 	"SUPERVISOR"."COD_JEFE"  
   INTO		:ll_parque,   
         	:ls_jefe  
   FROM 		"SUPERVISOR"  
   WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.object.supervisor.protect				= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
	end if
	dw_lista.reset()
	dw_seleccion.accepttext()
else
	messagebox("Advertencia","No Tiene Acceso")
	close(w_coordinador_ingreso)
end if

end event

event close;disconnect using Trans_1;
disconnect using Trans_2;
end event

type p_ini from picture within w_coordinador_ingreso
integer x = 640
integer y = 124
integer width = 78
integer height = 80
string picturename = "DDLB.BMP"
boolean focusrectangle = false
end type

event clicked;dw_lista.reset()
string ls_fecha,fech

if f_valida_fecha(em_inicio.text)=-1 then 
	em_inicio.text=string(gdt_fec_sistema,gs_formato_fecha)
	em_inicio.setfocus()
	return
end if	
if em_inicio.text<>'00/00/0000' then
	ls_fecha 			= em_inicio.text
else
	ls_fecha 			= string(gdt_fec_sistema,gs_formato_fecha)
end if	
OpenWithParm(w_calendar,ls_fecha)
em_inicio.text 		= Message.StringParm

end event

type st_2 from statictext within w_coordinador_ingreso
integer x = 23
integer y = 136
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicio:"
boolean focusrectangle = false
end type

type em_inicio from editmask within w_coordinador_ingreso
integer x = 315
integer y = 120
integer width = 320
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~r"
end type

type st_1 from statictext within w_coordinador_ingreso
integer x = 2560
integer y = 44
integer width = 411
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Coordinador"
boolean focusrectangle = false
end type

type dw_coord from datawindow within w_coordinador_ingreso
integer x = 2555
integer y = 112
integer width = 1362
integer height = 84
integer taborder = 40
string title = "none"
string dataobject = "dwe_coordinador"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string	ls_coord,ls_nombre,ls_cod_age,ls_cod_age2
long	ll_tot_coor,ll_tot_reg,ll_indi,ll_cta,ll_res,ll_tot_lista,ll_indi2,ll_rev,ll_indi3

dw_coord.accepttext()
dw_destino.reset()
ll_tot_coor										= dw_coord.rowcount()
if ll_tot_coor>0 then
	ls_coord										= dw_coord.getitemstring(1,'coordinador')
	if not isnull(ls_coord) and ls_coord<>'' then
		ll_tot_lista								= dw_lista.rowcount()
		if ll_tot_lista>0 then
			for ll_indi2=1 to ll_tot_lista
				dw_lista.setitem(ll_indi2,'modifica',0)
			next
			dw_lista.accepttext()
		end if
		
		SELECT 	("NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO")
 		INTO		:ls_nombre  
 		FROM 	"AGENTES"  
   		WHERE	"AGENTES"."COD_AGE" = :ls_coord
		USING	sqlca;	
		
		SELECT	count("COD_COORDINADOR")  
		INTO		:ll_cta
   		FROM 	"AGENTES_COORDINADOR"  
   		WHERE 	( "AGENTES_COORDINADOR"."COD_COORDINADOR" = :ls_coord ) AND  
         			( "AGENTES_COORDINADOR"."ESTADO" = 'A' )
		USING	sqlca;
		if isnull(ll_cta) then ll_cta=0
		if ll_cta>0 then
			ll_res									= messagebox("Advertencia",'Existe Grupo Vigente Asignado Coordinador '+ls_coord+'-'+ls_nombre+' ~r~n'+&
													' Desea Mostrar Grupo Vigente'	, Exclamation!, YesNo!, 2)
			if ll_res=1 then
				dw_destino.dataobject		= 'dw_lista_age_coordinador_existe'
				dw_destino.settransobject(sqlca)
				ll_tot_reg						= dw_destino.retrieve(ls_coord)
				if ll_tot_reg>0 then
					for ll_indi=1 to ll_tot_reg
						ls_cod_age				= dw_destino.getitemstring(ll_indi,'cod_age') 
						ll_rev						= dw_lista.rowcount()
						if ll_rev>0 then
							for	ll_indi3=1 to ll_rev
								ls_cod_age2		= dw_destino.getitemstring(ll_indi,'cod_age') 
								if ls_cod_age=ls_cod_age2 then
									dw_lista.setitem(ll_indi3,'modifica',0)
								end if
							next
						end if
					next
				end if
				
			else
				dw_destino.dataobject		= 'dw_lista_age_coordinador_dest'
				dw_destino.settransobject(sqlca)
				ll_tot_reg						= dw_destino.rowcount()
				if ll_tot_reg>0 then
					for ll_indi=1 to ll_tot_reg
						dw_destino.setitem(ll_indi,'cod_coordinador',ls_coord)
					next
					dw_destino.accepttext()
				end if
			end if
		end if
	end if
end if
end event

type dw_lista from datawindow within w_coordinador_ingreso
event ue_keypress ( )
integer x = 37
integer y = 228
integer width = 1710
integer height = 1572
integer taborder = 60
string dragicon = "Exclamation!"
boolean bringtotop = true
string dataobject = "dw_lista_age_coordinador"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_cod_age,ls_cod_age_aux,ls_columna,ls_marca
long	ll_estado,ll_tot_reg,ll_indi,ll_tot_lista,ll_indi2

ls_columna 		= dwo.name
il_row_origen	= row
il_row				= getrow()

if ls_columna = 't_marcar' then
	ls_marca				= dw_lista.object.t_marcar.text
	if ls_marca='Marcar Todos' then
		ll_tot_lista		= dw_lista.rowcount()
		for ll_indi2=1 to ll_tot_lista
			dw_lista.setitem(ll_indi2,'marca',1)
			dw_lista.SelectRow(ll_indi2, TRUE)
			dw_lista.accepttext()
			dw_lista.object.t_marcar.text		= 'Desmarcar Todos'
		next
	elseif ls_marca='Desmarcar Todos' then
		ll_tot_lista		= dw_lista.rowcount()
		for ll_indi2=1 to ll_tot_lista
			dw_lista.setitem(ll_indi2,'marca',0)
			dw_lista.SelectRow(ll_indi2, FALSE)
			dw_lista.accepttext()
			dw_lista.object.t_marcar.text		= 'Marcar Todos'
		next
		dw_destino.reset()
	end if
end if


if il_row_origen>0 then
	ll_estado						= this.getitemnumber(il_row_origen,'marca')
	ls_cod_age					= this.getitemstring(il_row_origen,'cod_age')
	this.accepttext()
	if ll_estado = 0 or isnull(ll_estado) then
		this.setitem(il_row_origen,'marca',1)
		This.SelectRow(il_row_origen, TRUE)
	else
		this.setitem(il_row_origen,'marca',0)
		This.SelectRow(il_row_origen, FALSE)
		ll_tot_reg				= dw_destino.rowcount()
		if ll_tot_reg>0 then
			for ll_indi=1 to 	ll_tot_reg
				ls_cod_age_aux	= dw_destino.getitemstring(ll_indi,'cod_age')
				if ls_cod_age=ls_cod_age_aux then
					dw_destino.deleterow(ll_indi)
					dw_destino.scrolltorow(1)
					ll_tot_reg		= ll_tot_reg - 1	
				end if
			next	
		end if
	end if
	this.Drag(Begin!)
end if
end event

event dragdrop;String	ls_codigo
control_dw = DraggedObject()
if control_dw = dw_destino and il_row_destino > 0 then
	dw_destino.deleterow(il_row_destino)
	if dw_destino.rowcount() = 0 then 
		cb_grabar.enabled	= false
	else
		cb_grabar.enabled	= True
	end if
end if
end event

event rowfocuschanged;//if this.getrow()>0 then
//	This.SelectRow(0, FALSE)
//	This.SelectRow(this.getrow(), TRUE)
//end if
end event

type pb_eliminar from picturebutton within w_coordinador_ingreso
integer x = 1774
integer y = 1140
integer width = 197
integer height = 180
integer taborder = 60
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Eliminar"
string picturename = "Inicio.jpg"
alignment htextalign = left!
end type

event clicked;string	ls_cod_age,ls_nombre
Long	ll_res,ll_tot_reg

il_fila					= dw_destino.getrow()
if il_fila > 0 then
	ls_cod_age		= dw_destino.getitemstring(il_fila,'cod_age')
	SELECT 	"NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"  
	INTO		:ls_nombre
	FROM 	"AGENTES"  
	WHERE	"AGENTES"."COD_AGE" = :ls_cod_age
	USING	sqlca;
	if isnull(ls_nombre) then ls_nombre=''
	
	ll_res				= MessageBox("Eliminar", "Está seguro de Eliminar, Agentes "+ls_cod_age+'-'+ls_nombre+' De La Lista', Exclamation!, YesNo!, 2)
	IF ll_res = 1 THEN
		dw_destino.deleterow(il_fila)
		dw_destino.scrolltorow(1)
		ll_tot_reg				= dw_lista.rowcount()
		if ll_tot_reg>0 then
			il_fila 					= dw_lista.Find("marca = 0",1, ll_tot_reg)
			dw_lista.SelectRow(il_fila, FALSE)
		end if
	END IF
	if dw_destino.rowcount() = 0 then 
		cb_grabar.enabled	= false
	else
		cb_grabar.enabled	= True
	end if
end if
end event

type pb_agregar from picturebutton within w_coordinador_ingreso
integer x = 1774
integer y = 676
integer width = 197
integer height = 180
integer taborder = 50
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Agregar"
string picturename = "Final.jpg"
alignment htextalign = left!
end type

event clicked;string		ls_cod_age,ls_nombre,ls_estado,ls_cod_sup,ls_cod_jef,ls_pasa='S',ls_coord,ls_insert='S',ls_cons_coord,ls_nom_coord
long		ll_tot_reg,ll_indi,ll_new,ll_estado,ll_tot_coor,ll_cta,ll_res,ll_modif,ll_marca
datetime	ldt_fecha_ini

dw_seleccion.accepttext()
dw_coord.accepttext()
dw_destino.dataobject						= 'dw_lista_age_coordinador_dest'
dw_destino.settransobject(sqlca)

//gdt_fec_sistema								= datetime(date(string('02/02/2015')))
SELECT sysdate INTO :gdt_fec_sistema FROM "TASA" WHERE "TASA"."LOOK" = 1;

ll_tot_coor										= dw_coord.rowcount()
if ll_tot_coor>0 then
	ls_coord										= dw_coord.getitemstring(1,'coordinador')
	if isnull(ls_coord) or ls_coord='' then
		messagebox("Advertencia","Debe Ingresar Coordinador Asignado")
		dw_coord.setfocus()
		dw_coord.setcolumn('coordinador')
	else
		ll_tot_reg								= dw_lista.rowcount()
		dw_destino.reset()
		for ll_indi = 1 to ll_tot_reg
			ll_estado								= dw_lista.getitemnumber(ll_indi,'marca')
			if ll_estado=1 then
				ls_cod_age						= dw_lista.getitemstring(ll_indi,'cod_age')
				ll_marca							= dw_lista.getitemnumber(ll_indi,'modifica')
				SELECT		count("COD_AGE")
				INTO			:ll_cta
   				FROM 		"AGENTES_COORDINADOR"
				WHERE		( "AGENTES_COORDINADOR"."COD_AGE" = :ls_cod_age) AND  
								( "AGENTES_COORDINADOR"."ESTADO" = 'A' )
				USING	sqlca;
				if isnull(ll_cta) then ll_cta=0
				if ll_cta>0 then
					SELECT		"COD_COORDINADOR"
					INTO			:ls_cons_coord
					FROM 		"AGENTES_COORDINADOR"
					WHERE		( "AGENTES_COORDINADOR"."COD_AGE" = :ls_cod_age) AND  
									( "AGENTES_COORDINADOR"."ESTADO" = 'A' )
					USING	sqlca;
					if isnull(ls_cons_coord) then ls_cons_coord=''
					
					SELECT		("AGENTES"."NOMBRE"||' '||"AGENTES"."A_PATERNO"||' '||"AGENTES"."A_MATERNO")
					INTO			:ls_nom_coord
					FROM 		"AGENTES"  
					WHERE		( "AGENTES"."COD_AGE" = :ls_cons_coord) AND  
									( "AGENTES"."ESTADO" = 'A' )
					USING	sqlca;
					
					SELECT 	"NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"  
					INTO		:ls_nombre
					FROM 	"AGENTES"  
					WHERE	"AGENTES"."COD_AGE" = :ls_cod_age
					USING	sqlca;
					if isnull(ls_nombre) then ls_nombre=''
					if ll_marca=0 then
						ll_res							= messagebox("Advertencia",'	Agente Seleccionado '+ls_cod_age+'-'+ls_nombre+' ~r~n'+&
																			'Pertenece a Grupo Vigente '+ls_cons_coord+'-'+ls_nom_coord+' ~r~n'+&
																			'		Desea Modificar Grupo'	, Exclamation!, YesNo!, 2)
						if ll_res=1 then
							ls_insert					= 'S'
							ll_modif					= 1
						else
							ls_insert					= 'N'
							ll_modif					= 0
						end if
					else
						ls_insert						= 'S'
						ll_modif						= 1
					end if
				end if
				dw_lista.setitem(ll_indi,'modifica',ll_modif)
				dw_lista.accepttext()
				
				if ls_insert='S' then
					ls_estado					= dw_lista.getitemstring(ll_indi,'estado')
					ls_cod_jef					= dw_seleccion.getitemstring(1,'jefe')
					ls_cod_sup					= dw_seleccion.getitemstring(1,'supervisor')
					ldt_fecha_ini				= datetime(date(em_inicio.text),time('00:00:00'))
					if ls_pasa='S' then
						ll_new					= dw_destino.insertrow(0)
						dw_destino.scrolltorow(ll_new)
						dw_destino.setitem(ll_new,'cod_coordinador',ls_coord)
						dw_destino.setitem(ll_new,'cod_age',ls_cod_age)
						SELECT 	"NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO"  
						INTO		:ls_nombre
						FROM 	"AGENTES"  
						WHERE	"AGENTES"."COD_AGE" = :ls_cod_age
						USING	sqlca;
						if isnull(ls_nombre) then ls_nombre=''
						dw_destino.setitem(ll_new,'nombre',ls_nombre)
						dw_destino.setitem(ll_new,'estado',ls_estado)
						dw_destino.setitem(ll_new,'cod_sup',ls_cod_sup)
						dw_destino.setitem(ll_new,'cod_jef',ls_cod_jef)
						dw_destino.setitem(ll_new,'fecha_ini',ldt_fecha_ini)
						dw_destino.setitem(ll_new,'fecha_crea',gdt_fec_sistema)
						dw_destino.setitem(ll_new,'usuario_crea',gs_user)
						dw_destino.accepttext()
					end if
				end if
			end if
		next
		if dw_destino.rowcount() > 0 then 
			cb_grabar.enabled					= true
		else
			cb_grabar.enabled					= False
		end if
	end if
end if
end event

type cb_grabar from commandbutton within w_coordinador_ingreso
integer x = 1989
integer y = 1848
integer width = 283
integer height = 104
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Grabar"
end type

event clicked;string		ls_coord,ls_nombre,ls_cod_age,ls_grab_det,ls_grab_tab
long		ll_res,ll_tot_reg,ll_indi,ll_existe,ll_graba=0
datetime	ldt_fec_ini

dw_coord.accepttext()
dw_destino.accepttext()
ls_coord										= dw_coord.getitemstring(1,'coordinador')
if isnull(ls_coord) or ls_coord='' then
	messagebox("Advertencia","Debe Ingresar Coordinador Asignado")
	dw_coord.setfocus()
	dw_coord.setcolumn('coordinador')
else
	ll_tot_reg								= dw_destino.rowcount()
	if ll_tot_reg=0 then
		messagebox("Advertencia","Debe Ingresar Al Menos un Agente")
	else
		SELECT 	("NOMBRE"||' '||"A_PATERNO"||' '||"A_MATERNO")
 		INTO		:ls_nombre  
 		FROM 	"AGENTES"  
   		WHERE	"AGENTES"."COD_AGE" = :ls_coord
		USING	sqlca;
		ll_res									= messagebox("Grabar","¿Desea Grabar Grupo Asignado Coordinador "+ls_coord+"-"+ls_nombre+"?", Exclamation!, YesNo!, 2)
		if ll_res=1 then
			ll_res								= messagebox("Advertencia","¿Fecha Incio Se Encuentra Bien Ingresada?", Exclamation!, YesNo!, 2)
			if ll_res=1 then
				for ll_indi=1 to ll_tot_reg
					ls_cod_age					= dw_destino.getitemstring(ll_indi,'cod_age')
					SELECT	count("COD_AGE")
					INTO		:ll_existe
					FROM		"AGENTES_COORDINADOR"  
					WHERE	( "AGENTES_COORDINADOR"."COD_AGE" = :ls_cod_age) AND  
								( "AGENTES_COORDINADOR"."ESTADO" = 'A' )
					USING	sqlca;
					if isnull(ll_existe) then ll_existe=0
					if ll_existe>0 then
						UPDATE	"AGENTES_COORDINADOR"  
						SET		"ESTADO" = 'I',
									"USUARIO_ELIMINA" = :gs_user,
									"FECHA_ELIMINA" = :gdt_fec_sistema 
							WHERE	( "AGENTES_COORDINADOR"."COD_AGE" = :ls_cod_age ) AND  
										( "AGENTES_COORDINADOR"."ESTADO" = 'A' )
						USING	sqlca;
						if sqlca.sqlcode=0 then
							commit;
							ll_graba++
						else
							rollback;
						end if
					else
						ll_graba++
					end if
				next
				if ll_tot_reg=ll_graba then
					ls_grab_det					= 'S'
				end if
				
				if dw_destino.update() = 1 then
					commit using sqlca;
					ls_grab_tab					= 'S'
				else
					rollback using sqlca;
					messagebox("Error Grabar","Error Grabar Grupo Asignado Coordinador "+ls_coord+"-"+ls_nombre+"?"+sqlca.sqlerrtext)
				end if
				if ls_grab_det='S' and ls_grab_tab='S' then
					messagebox("Grabar","Grabación Exitosa")
					cb_limpiar.triggerevent(Clicked!)
				end if
			end if
		end if
	end if
end if




end event

type cb_limpiar from commandbutton within w_coordinador_ingreso
integer x = 2779
integer y = 1860
integer width = 233
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

event clicked;string	ls_nulo,ls_jefe
long	ll_parque

setnull(ls_nulo)
dw_destino.reset()
dw_lista.reset()
dw_coord.reset()
dw_seleccion.reset()
dw_coord.getchild('coordinador',idw_detalle3)
idw_detalle3.settransobject(sqlca)
if idw_detalle3.retrieve('')=0 then
	idw_detalle3.insertrow(0)
end if
dw_coord.insertrow(0)

if gl_proceso>=4 then
	if gs_conexion	= "Parque El Prado" then
		ll_parque													= 1
	elseif gs_conexion	= "Parque La Foresta" then
		ll_parque													= 11
	elseif gs_conexion	= "Parque Concepción" then
		ll_parque													= 801
	end if
	dw_seleccion.settransobject(sqlca)
	dw_seleccion.getchild('jefe',idw_detalle)
	idw_detalle.settransobject(sqlca)
	if idw_detalle.retrieve(ll_parque)=0 then
		idw_detalle.insertrow(0)
	end if
	dw_seleccion.getchild('supervisor',idw_detalle2)
	idw_detalle2.settransobject(sqlca)
	if idw_detalle2.retrieve(ll_parque,'')=0 then
		idw_detalle2.insertrow(0)
	end if
	dw_seleccion.insertrow(0)
	dw_seleccion.setitem(1,'supervisor',ls_nulo)
	dw_seleccion.setitem(1,'jefe',ls_nulo)
	dw_lista.reset()
	dw_seleccion.accepttext()
	
elseif gl_proceso=3 then
	SELECT	"JEFE_VENTAS"."COD_PARQUE"  
   INTO 		:ll_parque  
   FROM 		"JEFE_VENTAS"  
   WHERE 	"JEFE_VENTAS"."JEFE_VENTAS" = :gs_user 
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,gs_user)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',gs_user)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		end if
	dw_lista.reset()
	dw_seleccion.accepttext()

elseif gl_proceso=2 then
	SELECT	"SUPERVISOR"."COD_PARQUE",   
        	 		"SUPERVISOR"."COD_JEFE"  
   	INTO		:ll_parque,   
         		:ls_jefe  
   	FROM		"SUPERVISOR"  
   	WHERE 	"SUPERVISOR"."COD_SUP" = :gs_user
	USING		 sqlca;
	if sqlca.sqlcode=0 then
		dw_seleccion.object.parque.protect					= 1
		dw_seleccion.object.jefe.protect						= 1
		dw_seleccion.object.supervisor.protect				= 1
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.settransobject(sqlca)
		dw_seleccion.insertrow(0)
		dw_seleccion.setitem(1,'parque',ll_parque)
		dw_seleccion.setitem(1,'jefe',ls_jefe)
		dw_seleccion.setitem(1,'supervisor',gs_user)
	end if
	dw_lista.reset()
	dw_seleccion.accepttext()
end if



end event

type pb_aceptar from picturebutton within w_coordinador_ingreso
integer x = 2254
integer y = 80
integer width = 137
integer height = 120
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ok.bmp"
end type

event clicked;string	ls_cod_jef,ls_cod_sup,ls_pasa='S'
long	ll_cod_parque,ll_tot_reg,ll_tot_coor

dw_seleccion.accepttext()
dw_lista.settransobject(sqlca)
dw_destino.settransobject(sqlca)
ll_cod_parque						= dw_seleccion.getitemnumber(1,'parque')
ls_cod_jef							= dw_seleccion.getitemstring(1,'jefe')
ls_cod_sup							= dw_seleccion.getitemstring(1,'supervisor')
if isnull(ll_cod_parque) or ll_cod_parque=0 then
	messagebox("Advertencia", "Debe Ingresar Parque")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('parque')
	ls_pasa										= 'N'
elseif isnull(ls_cod_jef) or ls_cod_jef='' then
	messagebox("Advertencia", "Debe Ingresar Jefe Ventas")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('jefe')
	ls_pasa										= 'N'
elseif isnull(ls_cod_sup) or ls_cod_sup='' then
	messagebox("Advertencia", "Debe Ingresar Supervisor Ventas")
	dw_seleccion.setfocus()
	dw_seleccion.setcolumn('supervisor')
	ls_pasa										= 'N'
end if
if ls_pasa='S' then
	ll_tot_coor									= idw_detalle3.retrieve(ls_cod_sup)
	ll_tot_reg									= dw_lista.retrieve(ls_cod_sup)
	if ll_tot_reg=0 then
		messagebox("Advertencia", "No Registra Datos")
		pb_agregar.enabled					= false
		pb_eliminar.enabled					= false
	else
		dw_lista.object.t_marcar.text		= 'Marcar Todos'
		pb_agregar.enabled					= true
		pb_eliminar.enabled					= true
	end if
end if
end event

type cb_2 from commandbutton within w_coordinador_ingreso
integer x = 3611
integer y = 1848
integer width = 283
integer height = 104
integer taborder = 120
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;close(w_coordinador_ingreso)
end event

type cb_imprimir from commandbutton within w_coordinador_ingreso
integer x = 3013
integer y = 1860
integer width = 233
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long		ll_tipo_premio,ll_cod_parque
datetime	ldt_fecha_consul,ldt_fecha_fin

ll_cod_parque								= dw_seleccion.getitemnumber(1,'parque')
ll_tipo_premio								= 9
SELECT DISTINCT	"FECHA_TERMINO"
INTO		:ldt_fecha_consul
FROM		"CIERRE_PAGOS_VENTAS"
WHERE		"CIERRE_PAGOS_VENTAS"."TIPO_PREMIO" = :ll_tipo_premio AND
			"CIERRE_PAGOS_VENTAS"."FECHA_TERMINO" = :ldt_fecha_fin AND
			"CIERRE_PAGOS_VENTAS"."COD_PARQUE" = :ll_cod_parque
USING		sqlca;
if sqlca.sqlcode = 0 then
	if not isnull(ldt_fecha_consul) then
		if dw_lista.rowcount() >0 then 
			f_Print( dw_lista )
//			f_printdlg(dw_lista,gstr_print,w_premios_sup_uno_x_cien_pagos)
		end if
	end if
else
	messagebox("Advertencia","Debe Grabar El Proceso de Premio Ingreso Caja Supervisor")
end if
end event

type dw_seleccion from datawindow within w_coordinador_ingreso
integer x = 37
integer y = 32
integer width = 2208
integer height = 184
integer taborder = 10
string title = "none"
string dataobject = "dwe_seleccion_opcion"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

event itemfocuschanged;String	ls_columna,ls_jefe,ls_supervisor,ls_agente,ls_nulo
Long		ll_parque

Setnull(ls_nulo)
ls_columna	= dwo.name
CHOOSE CASE ls_columna
	CASE 'parque'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		dw_seleccion.getchild('jefe',idw_detalle)
		idw_detalle.settransobject(sqlca)
		idw_detalle.reset()
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'jefe',ls_nulo)
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle.retrieve(ll_parque)=0 then
			idw_detalle.insertrow(0)
		end if
		dw_seleccion.accepttext()
	CASE 'jefe'
		dw_seleccion.accepttext()
		dw_lista.reset()
		ll_parque				= dw_seleccion.getitemnumber(1,'parque')
		ls_jefe					= dw_seleccion.getitemstring(1,'jefe')
		dw_seleccion.getchild('supervisor',idw_detalle2)
		idw_detalle2.settransobject(sqlca)
		idw_detalle2.reset()
		dw_seleccion.setitem(1,'supervisor',ls_nulo)
		dw_seleccion.setitem(1,'agente',ls_nulo)
		if idw_detalle2.retrieve(ll_parque,ls_jefe)=0 then
			idw_detalle2.insertrow(0)
		end if
		dw_seleccion.accepttext()
		
	CASE 'supervisor'
		dw_seleccion.accepttext()
		dw_lista.reset()
END CHOOSE
end event

type gb_1 from groupbox within w_coordinador_ingreso
integer x = 2757
integer y = 1812
integer width = 512
integer height = 164
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_destino from datawindow within w_coordinador_ingreso
integer x = 1998
integer y = 228
integer width = 1906
integer height = 1572
integer taborder = 70
string dragicon = "Hand!"
boolean bringtotop = true
string dataobject = "dw_lista_age_coordinador_dest"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;il_row_destino	= row
if il_row_destino > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(il_row_destino, TRUE)
	this.Drag(Begin!)
end if
end event

event doubleclicked;long	ll_indi
il_tot_filas	= dw_lista.rowcount()
if il_tot_filas>0 then
	for ll_indi = 1 to il_tot_filas
		dw_lista.setitem(ll_indi,'marca',1)
		dw_lista.SelectRow(ll_indi, true)
	next
	dw_lista.accepttext()
end if
end event

event dragdrop;control_dw2 = DraggedObject()
if control_dw2 = dw_lista then
	pb_agregar.triggerevent(clicked!)
end if

end event

event rowfocuschanged;if this.getrow() > 0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(this.getrow(), TRUE)
end if
end event

