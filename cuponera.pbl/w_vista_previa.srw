forward
global type w_vista_previa from window
end type
type dw_1 from datawindow within w_vista_previa
end type
type cb_imprimir from commandbutton within w_vista_previa
end type
type cb_cancelar from commandbutton within w_vista_previa
end type
type dw_cuponeras from datawindow within w_vista_previa
end type
end forward

global type w_vista_previa from window
integer x = 142
integer y = 148
integer width = 3392
integer height = 2032
boolean titlebar = true
string title = "Vista Previa"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 79741120
dw_1 dw_1
cb_imprimir cb_imprimir
cb_cancelar cb_cancelar
dw_cuponeras dw_cuponeras
end type
global w_vista_previa w_vista_previa

on w_vista_previa.create
this.dw_1=create dw_1
this.cb_imprimir=create cb_imprimir
this.cb_cancelar=create cb_cancelar
this.dw_cuponeras=create dw_cuponeras
this.Control[]={this.dw_1,&
this.cb_imprimir,&
this.cb_cancelar,&
this.dw_cuponeras}
end on

on w_vista_previa.destroy
destroy(this.dw_1)
destroy(this.cb_imprimir)
destroy(this.cb_cancelar)
destroy(this.dw_cuponeras)
end on

event open;LONG   il_job,i,j
string codigo,serie,ls_string
Double   numero,numero_pro

gf_centrar(w_vista_previa)
gs_ventana		= 'w_vista_previa'
f_valida_objeto()
Pointer			= 'Arrow!'
if gs_cuponera_aviso = '0' then//Cuponera ==> 0
	for i = 1 to 2
		dw_cuponeras.SetTransObject(SQLCA)
		dw_cuponeras.OBJECT.RPT_AVISO_MANTENCION.DATAOBJECT = "d_aviso_mantencion2"
		il_job 			= PrintOpen("AVISO") 
		if dw_cuponeras.RETRIEVE('0',gs_user)>0 then
			PrintDataWindow(il_job, dw_cuponeras) 
			PrintClose(il_job)
		end if
	next
	dw_cuponeras.SetTransObject(SQLCA)
	dw_cuponeras.OBJECT.RPT_AVISO_MANTENCION.DATAOBJECT = "d_datos_cupon"
	dw_cuponeras.Retrieve(gs_nombre_parque,gs_user)
	dw_1.SetTransObject(SQLCA)
	dw_1.Retrieve(gs_user)
	if w_crear_cuponeras.il_registro > 0 then
		w_vista_previa.cb_imprimir.triggerevent (clicked!)
	end if
else//Aviso Mantencion ==> 1
	dw_cuponeras.dataobject = "d_cupon_aviso_mantencion"
	dw_cuponeras.SetTransObject(SQLCA)
	dw_cuponeras.Retrieve(gs_nombre_parque,gs_user)
	dw_1.SetTransObject(SQLCA)
	dw_1.Retrieve(gs_user)
	if w_crear_cuponeras.il_registro > 0 then
		w_vista_previa.cb_imprimir.triggerevent (clicked!)
	end if
end if
end event

type dw_1 from datawindow within w_vista_previa
boolean visible = false
integer x = 987
integer y = 1772
integer width = 677
integer height = 156
string dataobject = "dw_cupon"
boolean livescroll = true
end type

type cb_imprimir from commandbutton within w_vista_previa
integer x = 2533
integer y = 1800
integer width = 398
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;long 		il_job,i,rut,ll_cant,j = 0, ll_filas,cod_accion
string	codigo,serie
Double	numero

if gs_cuponera_aviso = '0' then
	cod_accion = 6
else
	cod_accion = 4
end if	
Open(w_espera)
il_job 		= PrintOpen("Cuponeras") 
PrintDataWindow(il_job, dw_cuponeras) 
PrintClose(il_job)
ll_filas		= dw_1.rowcount()
for i = 1 to ll_filas
	codigo	= dw_1.getitemstring(i,'codigo')
	serie		= dw_1.getitemstring(i,'serie')
	numero	= dw_1.getitemnumber(i,'numero')
	rut		= dw_1.getitemnumber(i,'rut')
	UPDATE "CADENA"  
   SET    "EST_CUP" = 1  
   WHERE ( "CADENA"."CODIGO" = :codigo ) AND  
         ( "CADENA"."SERIE" = :serie ) AND  
         ( "CADENA"."NUMERO" = :numero )   
	Using	sqlca;
	if sqlca.sqlcode = 0 then
		commit;
		SELECT max(CORRELATIVO)+1 INTO :ll_cant FROM CARTA_LOG 
		using	sqlca;
		if sqlca.sqlcode = 0 then
			
			INSERT INTO "CARTA_LOG"  
					 ( "BASE" ,"SERIE" ,"NUMERO","RUT","COD_ENVIO","ESTADO_ENV","FECHA_CARTA"              ,"MORA","COD_ACCION","CORRELATIVO","MORA_MANT","CLASIFICACION","USUARIO" )  
			VALUES ( :codigo,:serie  ,:numero ,:rut ,:codigo    ,0	        ,to_date(to_char(sysdate  )),null  ,:cod_accion ,:ll_cant     ,null       ,null           ,:gs_user  )  
			Using	sqlca;
			if sqlca.sqlcode = 0 then
				commit;
			else
				ROLLBACK;
			end if
		end if	
	elseif sqlca.sqlcode=100 then
		messagebox("Advertencia","No Existe Base: "+codigo+" / Serie: "+serie+ " / Número: "+string(numero))
		ROLLBACK;
	elseif sqlca.sqlcode=-1 then
		messagebox("Error","Error Base: "+codigo+" / Serie: "+serie+ " / Número: "+string(numero)+", "+sqlca.sqlerrtext )
		ROLLBACK;
	end if
next
//gf_actualizar_datos()// Deje la actualizacion para el momento de crear los cupones.
if 1 = MessageBox('Actualización de Estado', 'La impresión está correcta~n~r~r(Para actualizar el estado de Cuponeras).~n',Question!, YesNo!, 2) then
	gf_actualizar_datos_estado('V')
else
	gf_actualizar_datos_estado('N')
end if
gf_borrar_cuponera()
//DELETE FROM "BLOQUEA_CUPON"  ;
//if sqlca.sqlcode = 0 then
//	commit;
//else
//	rollback;
//end if
//--------------------------------------------------------------------------------------------------------------
Close(w_espera)
//if isvalid(w_crear_cuponeras) then w_crear_cuponeras.cb_limpiar.triggerevent(clicked!)
Close(w_vista_previa)
end event

type cb_cancelar from commandbutton within w_vista_previa
integer x = 2935
integer y = 1800
integer width = 393
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;gf_borrar_cuponera()
Close(w_vista_previa)
end event

type dw_cuponeras from datawindow within w_vista_previa
integer x = 46
integer y = 36
integer width = 3278
integer height = 1716
string dataobject = "d_aviso_mantencion2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

