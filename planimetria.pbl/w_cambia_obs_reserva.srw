forward
global type w_cambia_obs_reserva from window
end type
type pb_3 from picturebutton within w_cambia_obs_reserva
end type
type dw_1 from datawindow within w_cambia_obs_reserva
end type
type pb_2 from picturebutton within w_cambia_obs_reserva
end type
type pb_1 from picturebutton within w_cambia_obs_reserva
end type
end forward

global type w_cambia_obs_reserva from window
integer width = 1664
integer height = 1280
boolean titlebar = true
string title = "Observación Reserva"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
pb_3 pb_3
dw_1 dw_1
pb_2 pb_2
pb_1 pb_1
end type
global w_cambia_obs_reserva w_cambia_obs_reserva

type variables
integer id_parque
end variables

on w_cambia_obs_reserva.create
this.pb_3=create pb_3
this.dw_1=create dw_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.Control[]={this.pb_3,&
this.dw_1,&
this.pb_2,&
this.pb_1}
end on

on w_cambia_obs_reserva.destroy
destroy(this.pb_3)
destroy(this.dw_1)
destroy(this.pb_2)
destroy(this.pb_1)
end on

event open;
id_parque = w_plano_sector_parque.id_parque
gs_ventana = 'w_cambia_obs_reserva'
f_valida_objeto()
gf_centrar(w_cambia_obs_reserva)
dw_1.settransobject(sqlca)
if dw_1.retrieve(gs_sector,gs_sepultura,id_parque) > 0 then
	
else
	
	close(w_cambia_obs_reserva)
end if

end event

type pb_3 from picturebutton within w_cambia_obs_reserva
integer x = 265
integer y = 952
integer width = 192
integer height = 148
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "EditObject!"
string disabledname = "EditObject!"
alignment htextalign = left!
end type

event clicked;dw_1.accepttext ()
if dw_1.getitemstring(1,'observacion') = "" or isnull(dw_1.getitemstring(1,'observacion')) then
	messagebox("AVISO","Debe ingresar palabras")
	dw_1.setfocus()
	return
else
	dw_1.setitem(1,'observacion',f_ortografia(dw_1.getitemstring(1,'observacion')))

end if

end event

type dw_1 from datawindow within w_cambia_obs_reserva
integer x = 59
integer y = 80
integer width = 1536
integer height = 844
integer taborder = 10
string title = "none"
string dataobject = "dw_cambia_obs_reserva"
boolean border = false
boolean livescroll = true
end type

type pb_2 from picturebutton within w_cambia_obs_reserva
integer x = 1390
integer y = 952
integer width = 192
integer height = 148
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
string disabledname = "salir.bmp"
alignment htextalign = left!
end type

event clicked;CloseWithReturn(w_cambia_obs_reserva, "1")
end event

type pb_1 from picturebutton within w_cambia_obs_reserva
integer x = 64
integer y = 952
integer width = 192
integer height = 148
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "grabar.bmp"
string disabledname = "grabar.bmp"
alignment htextalign = left!
end type

event clicked;integer  i,estado,si_no,count_reg,ret,&
         capacidad
long     folio,correlativo,rut
string   sector,sepultura,base,serie,area,nro_tecnico,observacion,cod_age,sepultura_nd,n_sep,sector_sep
datetime	fecha,fecha_log,fecha_sys
Double	numero

if MessageBox("Modificar Observación", '¿ Desea Modificar la Observación ?', Exclamation!, OKCancel!, 2) = 1 then
	SELECT distinct sysdate INTO :fecha_sys FROM "AGENTES" using sqlca ;
	dw_1.accepttext ()
	folio       = dw_1.getitemnumber(1,'folio_reserva')
	estado      = dw_1.getitemnumber(1,'estado')
	area        = dw_1.getitemstring(1,'area')
	sector      = dw_1.getitemstring(1,'sector')
	sepultura   = dw_1.getitemstring(1,'sepultura')
	base        = dw_1.getitemstring(1,'base')
	serie       = dw_1.getitemstring(1,'serie')
	numero      = dw_1.getitemnumber(1,'numero')
	rut         = dw_1.getitemnumber(1,'rut')
	observacion = dw_1.getitemstring(1,'observacion')
	fecha       = dw_1.getitemdatetime(1,'fecha')
	cod_age     = dw_1.getitemstring(1,'cod_agente')
	fecha_log   = dw_1.getitemdatetime(1,'fecha')
	if dw_1.update() = 1 then
		SELECT DISTINCT max(CORRELATIVO)+1 INTO :correlativo FROM LOG_RESERVA_SEPULTURA using sqlca ;
		if isnull(correlativo) then correlativo = correlativo + 1
		INSERT INTO "LOG_RESERVA_SEPULTURA"  
				 ( "CORRELATIVO","AREA","SECTOR","SEPULTURA","BASE","SERIE","NUMERO","FOLIO_RESERVA","RUT","OBSERVACION","FECHA_RESERVA","ESTADO","COD_AGENTE","FECHA_LOG","USUARIO_LOG" ,"COD_PARQUE" )  
		VALUES ( :correlativo ,:area ,:sector ,:sepultura ,:base ,:serie ,:numero ,:folio         ,:rut ,:observacion ,:fecha         ,:estado       ,:cod_age    ,:fecha_log ,:gs_user,:id_parque   )  using sqlca;
		if sqlca.sqlcode = 0 then
			commit using sqlca;
		else
			ROLLBACK using sqlca;
			MessageBox("Error", "Favor dar aviso al Depto. de Informatica (02)",stopsign! )
		end if
	else
		ROLLBACK using sqlca;
		MessageBox("Error", "Favor dar aviso al Depto. de Informatica (01)",stopsign! )
	end if
end if
end event

