forward
global type w_solicitud_reserva_const from window
end type
type cb_4 from commandbutton within w_solicitud_reserva_const
end type
type dw_3 from datawindow within w_solicitud_reserva_const
end type
type cb_3 from commandbutton within w_solicitud_reserva_const
end type
type cb_2 from commandbutton within w_solicitud_reserva_const
end type
type cb_1 from commandbutton within w_solicitud_reserva_const
end type
type dw_2 from datawindow within w_solicitud_reserva_const
end type
type dw_1 from datawindow within w_solicitud_reserva_const
end type
end forward

global type w_solicitud_reserva_const from window
integer width = 2656
integer height = 2584
boolean titlebar = true
string title = "Reserva de Sepultura Individual"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_4 cb_4
dw_3 dw_3
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
end type
global w_solicitud_reserva_const w_solicitud_reserva_const

type variables
long corre
end variables

on w_solicitud_reserva_const.create
this.cb_4=create cb_4
this.dw_3=create dw_3
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.dw_3,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_2,&
this.dw_1}
end on

on w_solicitud_reserva_const.destroy
destroy(this.cb_4)
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;string estado,base,serie,status,base_fall,serie_fall,numero,sub_sector
long contrato,folio
datetime fecha_reserva
DataWindowChild dw_child_estado_sep

corre = long(Message.StringParm)
gf_centrar(w_solicitud_reserva_const)
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)

dw_1.GetChild('estado', dw_child_estado_sep)
dw_child_estado_sep.SetTransObject(SQLCA)
dw_child_estado_sep.Retrieve()
dw_child_estado_sep.setfilter('codigo <> 3 and codigo <> 2')
dw_child_estado_sep.filter()
SELECT max(FOLIO_RESERVA) INTO :folio FROM RESERVA_SEPULTURA where sector = :gs_sector and sepultura= :gs_sepultura ;
if dw_1.retrieve(folio,gs_sector,gs_sepultura,corre) = 0 then
	SELECT NUMERO INTO :numero FROM INVENTARIO_PLANI_CONST WHERE ( SECTOR = :gs_sector ) AND ( SEPULTURA = :gs_sepultura ) and ( CORRELATIVO = :corre ) ;
	if ( not isnull(gs_sepultura) and gs_sepultura <> '') and( numero = '0' or numero = '1000000' ) then
		select distinct  sysdate into :fecha_reserva from agentes;
		dw_1.insertrow(0)
		dw_1.setitem(dw_1.rowcount(),'reserva_sepultura_corre_inventario',corre)
		dw_1.setitem(dw_1.rowcount(),'fecha',fecha_reserva)
		dw_1.setitem(dw_1.rowcount(),'sepultura',gs_sepultura)
		if isnull( dw_1.getitemnumber(dw_1.rowcount(),'estado')) then dw_1.setitem(dw_1.rowcount(),'estado',0)
		dw_1.setitem(dw_1.rowcount(),'sector',gs_sector)
		dw_1.setitem(dw_1.rowcount(),'area',gs_area)
		SELECT max("RESERVA_SEPULTURA"."FOLIO_RESERVA")+1 INTO :folio FROM "RESERVA_SEPULTURA"  ;
		dw_1.setitem(dw_1.rowcount(),'folio_reserva',folio)
	else
		messagebox('Seleccione sepultura','Para Reservar debe Seleccionar una Sepultura que este Disponible.',stopsign!)
		if MessageBox("Liberar Sepultura", '¿ Desea Liberar la Sepultura'+gs_sepultura+' del sector '+gs_sector+' ?', Question!, OKCancel!, 2) = 1 then
			open(w_libera_sepultura_const)
		end if
		close(w_solicitud_reserva_const)		
	end if
else
	if dw_3.retrieve(gs_sector,gs_sepultura,corre) > 0 then
		dw_3.object.t_1.text = 'Historial de Reservas por Sepultura'
	end if
end if
end event

event close;w_plano_sector_parque.dw_plano_sector_parque.enabled = true
end event

type cb_4 from commandbutton within w_solicitud_reserva_const
integer x = 791
integer y = 1392
integer width = 498
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Actualiza Plano"
end type

event clicked;w_plano_sector_parque.wf_pinta_sector(w_plano_sector_parque.dw_plano_sector_parque)
end event

type dw_3 from datawindow within w_solicitud_reserva_const
integer x = 41
integer y = 1556
integer width = 2523
integer height = 824
integer taborder = 60
string title = "none"
string dataobject = "dw_log_reserv_sepult_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_solicitud_reserva_const
integer x = 2194
integer y = 1392
integer width = 370
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;w_plano_sector_parque.dw_plano_sector_parque.enabled = true
setnull(gs_sepultura)
setnull(gi_numero)
setnull(gs_serie)
setnull(gs_base)
close(w_solicitud_reserva_const)
end event

type cb_2 from commandbutton within w_solicitud_reserva_const
integer x = 416
integer y = 1392
integer width = 370
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

event clicked;integer  ret
long     correlativo,folio,rut,estado
string   observacion,cod_age,base,serie
datetime fecha,fecha_log
Double	numero
if dw_1.ModifiedCount() > 0 then
	estado        		= dw_1.getitemnumber(1,'estado')
	if estado <> 2 then
		SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA  ;
		if isnull(correlativo) then correlativo = 1
		dw_1.accepttext ()
		folio         	= dw_1.getitemnumber(1,'folio_reserva')
		rut           	= dw_1.getitemnumber(1,'rut')
		numero       = dw_1.getitemnumber(1,'numero')
		observacion = dw_1.getitemstring(1,'observacion')
		cod_age      = dw_1.getitemstring(1,'cod_agente')
		base          	= dw_1.getitemstring(1,'base')
		serie         	= dw_1.getitemstring(1,'serie')
		fecha         	= dw_1.getitemdatetime(1,'fecha')
		select distinct  sysdate into :fecha_log from agentes;
		if MessageBox("Guardar Cambios", '¿ Desea Guardar los cambios ?', Question!, OKCancel!, 2) = 1 then
			ret 		= dw_1.update()
			if ret = 1 then
				commit;
				INSERT INTO "LOG_RESERVA_SEPULTURA"  
						 ( "CORRELATIVO","AREA"  ,"SECTOR"  ,"SEPULTURA"  ,"BASE","SERIE","NUMERO","FOLIO_RESERVA","RUT","OBSERVACION","FECHA_RESERVA","ESTADO","COD_AGENTE","FECHA_LOG","USUARIO_LOG","CORRE_RESERVA" )  
				VALUES ( :correlativo ,:gs_area,:gs_sector,:gs_sepultura,:base ,:serie ,:numero ,:folio         ,:rut ,:observacion ,:fecha         ,:estado ,:cod_age    ,:fecha_log ,:gs_user     ,:corre)  ;
				if sqlca.sqlcode = 0 then
					commit;
					if dw_3.retrieve(gs_sector,gs_sepultura,corre) > 0 then
						dw_3.object.t_1.text = 'Historial de Reservas por Sepultura'
					end if
					messagebox('Grabación Exitosa','Se ha guardado exitosamnete el registro. ',information!)
				else
					ROLLBACK;
					messagebox('Error al grabar.','Se ha detectado un error al guardar el registro.(Tabla : log_reserva_sepultura) ',information!)
				end if
			else
				ROLLBACK;
				messagebox('Error al grabar.','Se ha detectado un error al guardar el registro.(Tabla : reserva_sepultura) ',information!)
			end if
		end if
	else
		if MessageBox("Guardar Cambios", '¿ Desea Liberar la Sepultura ?', Question!, OKCancel!, 2) = 1 then
			
		end if
	end if
end if
end event

type cb_1 from commandbutton within w_solicitud_reserva_const
integer x = 41
integer y = 1392
integer width = 370
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimir"
end type

event clicked;long	folio,ll_cod_parque
String	ls_sucursal,  ls_comuna,  ls_parque

folio 				= dw_1.getitemnumber(1,'folio_reserva')
ll_cod_parque	= dw_1.getitemnumber(1,'reserva_sepultura_cod_parque')
if dw_2.retrieve(folio,gs_sector,gs_sepultura,ll_cod_parque) > 0 then
	SELECT	"MEMBRETE_EMPRESA"."SUCURSAL",   
				"MEMBRETE_EMPRESA"."COMUNA",   
				"MEMBRETE_EMPRESA"."PARQUE"  
	INTO 		:ls_sucursal,   
				:ls_comuna,   
				:ls_parque  
	FROM 	"MEMBRETE_EMPRESA"  
	WHERE 	"MEMBRETE_EMPRESA"."COD_PARQUE" = :ll_cod_parque   ;
//	if ll_cod_parque = 1 then
		dw_2.object.t_6.text 	= Upper(ls_sucursal)
		dw_2.object.t_7.text 	= Upper(ls_comuna)
		dw_2.object.t_10.text	='Aprobación Administrador Parque '+ls_parque
//	elseif ll_cod_parque = 11 then
//		dw_2.object.t_6.text		= Upper('Sucursal: Ruta 41 S/N, Sector Aeropuerto, Camino a Vicuña')
//		dw_2.object.t_7.text		= Upper('Fonos: 271 801 - 271 516 Fax: 271 858 La Serena.')
//		dw_2.object.t_10.text	='Aprobación Administrador Parque La Foresta.'
//	elseif ll_cod_parque = 102 then
//		dw_2.object.t_6.text 	= Upper('SUCURSAL: LOS AGRICULTORES 60 - FONOS: 743 24 36')
//		dw_2.object.t_7.text 	= Upper('FAX:  - MAIPU.')
//		dw_2.object.t_10.text	='Aprobación Administrador Parque El Manantial.'
//	elseif ll_cod_parque = 103 or ll_cod_parque = 105 then
//		dw_2.object.t_6.text		= Upper('SUCURSAL: CAMINO LA RINCONADA DEL SALTO 0516 - FONOS: 498 08 00')
//		dw_2.object.t_7.text		= Upper('FAX:  - HUECHURABA.')
//		dw_2.object.t_10.text	='Aprobación Administrador Parque Santiago.'
//	elseif ll_cod_parque = 801 then
//		dw_2.object.t_6.text		= Upper('SUCURSAL: AV. COSTANERA N° 2220 - FONOS: 285 1528 - 285 1535')
//		dw_2.object.t_7.text		= Upper('FAX:  - CONCEPCION.')
//		dw_2.object.t_10.text	='Aprobación Administrador Parque Concepción.'
//	end if
	f_Print( dw_2 )
end if	
end event

type dw_2 from datawindow within w_solicitud_reserva_const
integer x = 2962
integer y = 716
integer width = 411
integer height = 432
boolean titlebar = true
string title = "none"
string dataobject = "dw_solicitud_reserva_imprime"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
boolean righttoleft = true
end type

type dw_1 from datawindow within w_solicitud_reserva_const
integer x = 41
integer y = 56
integer width = 2523
integer height = 1288
integer taborder = 10
string title = "none"
string dataobject = "dw_solicitud_reserva"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

