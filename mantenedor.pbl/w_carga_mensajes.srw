forward
global type w_carga_mensajes from window
end type
type cb_6 from commandbutton within w_carga_mensajes
end type
type cb_2 from commandbutton within w_carga_mensajes
end type
type cb_limpiar from commandbutton within w_carga_mensajes
end type
type st_archivo_carga from statictext within w_carga_mensajes
end type
type cb_1 from commandbutton within w_carga_mensajes
end type
type cb_5 from commandbutton within w_carga_mensajes
end type
type dw_mensajes_cargados from datawindow within w_carga_mensajes
end type
type cb_4 from commandbutton within w_carga_mensajes
end type
type st_2 from statictext within w_carga_mensajes
end type
type gb_1 from groupbox within w_carga_mensajes
end type
end forward

global type w_carga_mensajes from window
integer width = 4165
integer height = 2328
boolean titlebar = true
string title = "Buscar Mensaje"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
cb_6 cb_6
cb_2 cb_2
cb_limpiar cb_limpiar
st_archivo_carga st_archivo_carga
cb_1 cb_1
cb_5 cb_5
dw_mensajes_cargados dw_mensajes_cargados
cb_4 cb_4
st_2 st_2
gb_1 gb_1
end type
global w_carga_mensajes w_carga_mensajes

type variables
long		ret, ll_resp, ll_rut, ll_count
Double	ll_numero, ll_descuento
datetime	ldt_fecha_hoy, ldt_fecha_crea,ldt_fecha_fin
string	ls_mensaje,ls_usuario, ls_sw='S',ls_base,ls_serie, ls_est_gestion, ls_aplica
string ls_pathname, ls_filename
end variables

forward prototypes
public function integer wf_valida_carga ()
end prototypes

public function integer wf_valida_carga ();integer t , li_contador, li_val_1, li_val_2, li_val_3, li_val_4, li_val_5, li_val_6
string ls_error, ls_validacion

SetPointer(HourGlass!)

if dw_mensajes_cargados.rowcount()> 0 then

		// validamos  no existan registros previamente cargados
		select count(*)  INTO :li_contador  from 
		MENSAJES_carga a ,
		mensajes b
		where 		a.MENSAJE = b.MENSAJE and a.BASE = b.BASE and 	a.SERIE = b.SERIE and 	a.NUMERO = b.NUMERO and 
		a.RUT = b.RUT and 	a.FECHA_FIN = b.FECHA_FIN and 	a.APLICA_A = b.APLICA_A and a.DESCUENTO = b.DESCUENTO		
		USING	sqlca;
		if sqlca.sqlcode=0 then				
			if li_contador >0  then
				 ls_error=ls_error+ ' - Existen registros previamente ya cargados. '	+ '~r~n'	+ '~r~n'
			end if 											
		end if 


		// validamos  QUE EL CONTRATO EXISTA en cadena
		SELECT COUNT(*) INTO :li_contador FROM MENSAJES_CARGA A
		WHERE NOT exists 
		(SELECT 1 FROM cadena B WHERE A.BASE = B.CODIGO AND A.SERIE = B.SERIE AND A.NUMERO = B.NUMERO )		
		USING	sqlca;
		if sqlca.sqlcode=0 then				
			if li_contador >0  then
				 ls_error=ls_error+ ' - Contratos que no existen. '	+ '~r~n'	+ '~r~n'
			end if 											
		end if 


		// validamos que contrato a cargar con descuento no exista con descuento activo
		SELECT COUNT(*)  INTO :li_contador  FROM MENSAJES_CARGA A
		WHERE exists 
		(SELECT 1 FROM mensajes B WHERE A.BASE = B.base AND A.SERIE = B.SERIE AND A.NUMERO = B.NUMERO and b.estado_gestion = 'A'
		and b.aplica_a is not null and b.aplica_a <> 'N' and b.descuento is not null)
		and a.aplica_a is not null and a.aplica_a <> 'N' and a.descuento is not null
		USING	sqlca;
		if sqlca.sqlcode=0 then				
			if li_contador >0  then
				 ls_error=ls_error+ ' - Existen mensajes a cargar con contratos con descuento activo que presentan mensajes previamente cargados con descuento tambien activo. '	+ '~r~n'	+ '~r~n'
			end if 
		end if 

		// validamos que VALIDAR QUE EL rut  EXISTA en cadena
		SELECT COUNT(*)  INTO :li_contador
		FROM MENSAJES_CARGA A
		WHERE NOT exists 
		(SELECT 1 FROM cadena B WHERE A.RUT = B.RUT )
		USING	sqlca;
		if sqlca.sqlcode=0 then				
			if li_contador >0  then
				 ls_error=ls_error+ ' - Rut que no existen. '	+ '~r~n'	+ '~r~n'
			end if 
		end if 

	

		// validamos que la fecha de fin no sea igual que la fecha actual
		
		SELECT COUNT(*)   INTO :li_contador
		FROM MENSAJES_CARGA A
		WHERE A.FECHA_FIN < :gdt_fec_sistema
		USING	sqlca;
		if sqlca.sqlcode=0 then				
			if li_contador >0 then
				ls_error=ls_error+ ' - Fechas fin que son  menor o igual a la fecha actual. '	+ '~r~n'	+ '~r~n'
			end if 
		end if 



		// validamos que la aplica sea en los valores validos
		
		SELECT COUNT(*)   INTO :li_contador
		FROM MENSAJES_CARGA A
		WHERE A.APLICA_A IS NOT NULL  AND 
		NOT exists(SELECT 1 FROM MENSAJES_DESCUENTO B WHERE A.APLICA_A = B.APLICA_A )	
		USING	sqlca;
		if sqlca.sqlcode=0 then	
			if li_contador >0 then
					 ls_error=ls_error+ ' - Tipo aplica no validos. '	+ '~r~n'	+ '~r~n'
			end if 
		end if 


				
		// validamos que la aplica sea CMT y que NO presenta valor de descuento

		SELECT COUNT(*)   INTO :li_contador
		FROM MENSAJES_CARGA A
		WHERE A.APLICA_A IS NOT NULL  AND (A.DESCUENTO = 0 OR A.DESCUENTO IS NULL) AND 
		NOT exists(SELECT 1 FROM MENSAJES_DESCUENTO B WHERE A.APLICA_A = B.APLICA_A )
		USING	sqlca;
		if sqlca.sqlcode=0 then	
			if li_contador >0 then			
					 ls_error=ls_error+ ' - Existen Tipo aplica que no presenta porcentaje de descuento. '	+ '~r~n'	+ '~r~n'
			end if  
		end if  


		// validamos que valor descuento sea una de los definidos en MENSAJES_DESCUENTO_PORCENTAJES
		SELECT COUNT(*)    INTO :li_contador
		FROM MENSAJES_CARGA A
		WHERE A.DESCUENTO > 0 AND 
		NOT exists(SELECT 1 FROM MENSAJES_DESCUENTO_PORCENTAJES B WHERE A.DESCUENTO = B.PORCENTAJE AND B.ESTADO = 'V')
		USING	sqlca;
		if sqlca.sqlcode=0 then	
			if li_contador> 0  then
				 ls_error=ls_error+ ' - Existen descuento con valores no validos. '	+ '~r~n'	+ '~r~n'
			end if 		
		end if 		
		
		// validamos que NO EXISTAN REGISTROS DUPLICADOS
		SELECT count(*)   INTO :li_contador
		FROM (
			SELECT NUMERO, MENSAJE,
					 ROW_NUMBER() OVER (PARTITION BY MENSAJE, BASE, SERIE,NUMERO,RUT,PARQUE, FECHA_FIN, APLICA_A, DESCUENTO ORDER BY ROWID) AS rn
			FROM MENSAJES_CARGA
		)
		WHERE rn > 1
		USING	sqlca;
		if sqlca.sqlcode=0 then	
			if li_contador> 0  then
				 ls_error=ls_error+ ' - Existen registros repetidos en la planilla. '	+ '~r~n'	+ '~r~n'
			end if 		
		end if 		

	if len(trim(ls_error))>0 then
		messagebox('','La carga presenta  el(los) los siguiente(s) error(es) : ' + '~r~n' + '~r~n'  + '~r~n'  +ls_error )
		return 0
	end if 


end if 

SetPointer(Arrow!)
return 1

end function

on w_carga_mensajes.create
this.cb_6=create cb_6
this.cb_2=create cb_2
this.cb_limpiar=create cb_limpiar
this.st_archivo_carga=create st_archivo_carga
this.cb_1=create cb_1
this.cb_5=create cb_5
this.dw_mensajes_cargados=create dw_mensajes_cargados
this.cb_4=create cb_4
this.st_2=create st_2
this.gb_1=create gb_1
this.Control[]={this.cb_6,&
this.cb_2,&
this.cb_limpiar,&
this.st_archivo_carga,&
this.cb_1,&
this.cb_5,&
this.dw_mensajes_cargados,&
this.cb_4,&
this.st_2,&
this.gb_1}
end on

on w_carga_mensajes.destroy
destroy(this.cb_6)
destroy(this.cb_2)
destroy(this.cb_limpiar)
destroy(this.st_archivo_carga)
destroy(this.cb_1)
destroy(this.cb_5)
destroy(this.dw_mensajes_cargados)
destroy(this.cb_4)
destroy(this.st_2)
destroy(this.gb_1)
end on

event open;gf_centrar (w_carga_mensajes)
dw_mensajes_cargados.settransobject(sqlca)

end event

type cb_6 from commandbutton within w_carga_mensajes
integer x = 1696
integer y = 2036
integer width = 201
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Filtrar"
end type

event clicked;string nulo
if dw_mensajes_cargados.rowcount() > 0 then
	setnull (nulo)
	dw_mensajes_cargados.SETfilter(NULO)
	dw_mensajes_cargados.filter()
end if 
end event

type cb_2 from commandbutton within w_carga_mensajes
integer x = 1463
integer y = 2036
integer width = 229
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ordenar"
end type

event clicked;string nulo
if dw_mensajes_cargados.rowcount() > 0 then
	setnull (nulo)
	dw_mensajes_cargados.SETSORT(NULO)
	dw_mensajes_cargados.SORT()
end if
end event

type cb_limpiar from commandbutton within w_carga_mensajes
integer x = 1902
integer y = 2036
integer width = 233
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Limpiar"
end type

event clicked;dw_mensajes_cargados.reset()
st_archivo_carga.text	= ''
end event

type st_archivo_carga from statictext within w_carga_mensajes
integer x = 581
integer y = 60
integer width = 3451
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_carga_mensajes
integer x = 3671
integer y = 2028
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Salir"
end type

event clicked;close(w_carga_mensajes)
end event

type cb_5 from commandbutton within w_carga_mensajes
integer x = 768
integer y = 2028
integer width = 526
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Grabar Mensajes "
end type

event clicked;integer T , li_max_corel_carga
long li_max_corel,ll_cant
string ls_ws_mensaje


IF dw_mensajes_cargados.ROWCOUNT() = 0 THEN
	messagebox("Error","No existen mensajes a procesar.")
	return
END IF 

if wf_valida_carga() = 1 then	
		
		// vhfb - inicio - rescata maximo correlativo de mensajes
		select max(correlativo) into :li_max_corel from mensajes
		Using		sqlca ;
		// vhfb - termino - rescata maximo correlativo de mensajes
		
		// VHFB - INICIO - actualizamos reg cargados con el correlativo respectivo
		update mensajes_carga set correlativo = rownum + :li_max_corel
		Using		sqlca ;
		if sqlca.sqlcode<>0 then
			rollback;
			messagebox("Error","Error al actualizar correlativo de  mensajes cargados.")
			return
		ELSE
			commit;
		end if	
		// VHFB - TERMINO - actualizamos reg cargados con el correlativo respectivo
		
		
		ldt_fecha_hoy	= datetime(date(gdt_fec_sistema),time('00:00:00'))
		
		// VHFB - INICIO - actualizamos MENSAJES
		
		INSERT INTO MENSAJES  (
					RUT,
					FECHA_CREACION,
					FECHA_FIN,
					AUTOR,
					MENSAJE,
					ESTADO,
					USUARIO_FIN,
					BASE,
					SERIE,
					NUMERO,
					CLASIFICACION_MENSAJE,
					SW_MENSAJE,
					CORRELATIVO,
					FECHA_GESTION,
					ESTADO_GESTION,
					APLICA_A,
					DESCUENTO
					)
		SELECT 
					RUT,
					:gdt_fec_sistema,
					FECHA_FIN,
					:GS_USER,
					MENSAJE,
					null,
					null,
					BASE,
					SERIE,
					NUMERO,
					null,
					CASE WHEN NUMERO IS NULL THEN 'R' WHEN NUMERO > 0 THEN 'C' END,
					CORRELATIVO,
					:gdt_fec_sistema,
					'A',
					APLICA_A,
					DESCUENTO
		FROM mensajes_carga
		Using		sqlca ;
		
		if sqlca.sqlcode<>0 then
			rollback;
			messagebox("Error","Error al Grabar mensajes de la carga.")
			return
		ELSE
			commit;
			messagebox("Grabar","Grabación Exitosa")
			
			select max(ID) into :li_max_corel_carga from MENSAJES_FILE_CARGADOS
			Using		sqlca ;
			
			if isnull(li_max_corel_carga) then
				li_max_corel_carga = 1 
			end if 
			
			
			INSERT INTO MENSAJES_FILE_CARGADOS (ID,NOMBRE_FILE,FECHA_CARGA,USUARIO) 
			 VALUES (:li_max_corel_carga+1,:ls_filename, :gdt_fec_sistema, :gs_user )
			 Using		sqlca ;
			commit;
			dw_mensajes_cargados.reset()
		end if	
	end if 

end event

type dw_mensajes_cargados from datawindow within w_carga_mensajes
integer x = 64
integer y = 200
integer width = 3986
integer height = 1732
integer taborder = 50
string title = "none"
string dataobject = "dw_carga_mensajes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(row, TRUE)
end if

end event

event rowfocuschanged;if getrow()>0 then
	This.SelectRow(0, FALSE)
	This.SelectRow(getrow(), TRUE)
end if
end event

type cb_4 from commandbutton within w_carga_mensajes
integer x = 329
integer y = 2028
integer width = 421
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carga Archivo"
end type

event clicked;string ls_ruta, ls_nombre_archivo,s_path1, ls_miorden, ls_usuario_carga
date ld_fecha_carga
integer ll_result,li_rtn, ll_cnt, I, li_contador
boolean lb_sheet_rtn

long ll_rc
oleobject loo_excel,excel

IF GetFileOpenName ( "Open File", ls_pathname, ls_filename, "XLSX", "Excel Files(*.xlsx),*.xlsx" ) < 1 THEN Return


st_archivo_carga.text = ls_pathname

ls_filename = trim(ls_filename)

select fecha_carga , usuario into :ld_fecha_carga,  :ls_usuario_carga
from MENSAJES_FILE_CARGADOS where 
upper(trim(NOMBRE_FILE)) = trim(upper(:ls_filename) )
Using		sqlca ;

if isnull(ls_usuario_carga) then
	ls_usuario_carga = ''
end if 

if len(trim(ls_usuario_carga)) > 0 then
	MessageBox('Error','El file "' + ls_filename + '" ya fue procesado el ' + string(ld_fecha_carga)+ ' por ' +ls_usuario_carga + ', se suspende la carga.')
	return
end if 

dw_mensajes_cargados.reset()

// VHFB -- INICIO --BORRAMOS LA TABLA DE PASO
ls_miorden = "truncate TABLE MENSAJES_CARGA"
EXECUTE IMMEDIATE :ls_miorden ;
// VHFB -- TERMINO -- BORRAMOS LA TABLA DE PASO

excel = create OLEObject

li_rtn = excel.ConnectToNewObject("excel.application")
IF li_rtn <> 0 THEN
	MessageBox('Excel error','No puede conectarse a Excel')
	DESTROY excel
	RETURN 0
END IF

SetPointer(HourGlass!)

excel.WorkBooks.Open( ls_pathname )
excel.Application.Visible = true
excel.windowstate = 2 // 1 : Normal, 2 : Minimize, 3 : Maximize

lb_sheet_rtn = excel.worksheets(1).Activate
excel.Worksheets(1).Range("A1:I70000").Copy // copiar al clipboard
sleep(1)

dw_mensajes_cargados.SETREDRAW(FALSE)

//Copiar desde la segunda fila de Excel

dw_mensajes_cargados.Modify("DataWindow.NoUserPrompt=yes")

ll_cnt = dw_mensajes_cargados.importclipboard(2)

dw_mensajes_cargados.Modify("DataWindow.NoUserPrompt=no")

IF ll_cnt < 1 THEN
		Messagebox("Importación fallida", "No se pudo importar file seleccionado. Formato incorrecto.")
		excel.Worksheets(1).Range("Z10000:Z10000").Copy //reset clipboard
		excel.Application.Quit
		excel.DisConnectObject()
		DESTROY excel
		SetPointer(Arrow!)
		dw_mensajes_cargados.reset()
		return
END IF

excel.Worksheets(1).Range("Z10000:Z10000").Copy //reset clipboard
excel.Application.Quit
excel.DisConnectObject()
DESTROY excel

SetFilter(dw_mensajes_cargados, "ISNULL(MENSAJE)")
dw_mensajes_cargados.Filter()

FOR i = 1 TO  dw_mensajes_cargados.ROWCOUNT ()
     dw_mensajes_cargados.DELETERow(i)
	  i = i - 1  // Ajustar el índice después de eliminar
NEXT 
SetFilter(dw_mensajes_cargados, "")
dw_mensajes_cargados.Filter()
dw_mensajes_cargados.SETREDRAW(TRUE)

If dw_mensajes_cargados.Update () = 1 Then
	COMMIT Using SQLCA;
Else
	ROLLBACK Using SQLCA;
	MessageBox("Error", "No se Actualizo la Base")
End If


SetPointer(Arrow!)



//-------------------Fin-------------------

end event

type st_2 from statictext within w_carga_mensajes
integer x = 78
integer y = 72
integer width = 494
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Archivo a cargar : "
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_carga_mensajes
integer x = 1435
integer y = 1992
integer width = 763
integer height = 188
integer taborder = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

