forward
global type w_proceso_traspaso_reg from window
end type
type lb_1 from listbox within w_proceso_traspaso_reg
end type
type st_directorio from statictext within w_proceso_traspaso_reg
end type
type st_3 from statictext within w_proceso_traspaso_reg
end type
type st_2 from statictext within w_proceso_traspaso_reg
end type
type st_1 from statictext within w_proceso_traspaso_reg
end type
type hpb_1 from hprogressbar within w_proceso_traspaso_reg
end type
type dw_3 from datawindow within w_proceso_traspaso_reg
end type
type dw_2 from datawindow within w_proceso_traspaso_reg
end type
type sle_1 from u_sle_rut within w_proceso_traspaso_reg
end type
type cb_2 from commandbutton within w_proceso_traspaso_reg
end type
type cb_1 from commandbutton within w_proceso_traspaso_reg
end type
type dw_1 from datawindow within w_proceso_traspaso_reg
end type
end forward

global type w_proceso_traspaso_reg from window
integer width = 4311
integer height = 2160
boolean titlebar = true
string title = "Carga de registro"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
lb_1 lb_1
st_directorio st_directorio
st_3 st_3
st_2 st_2
st_1 st_1
hpb_1 hpb_1
dw_3 dw_3
dw_2 dw_2
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_proceso_traspaso_reg w_proceso_traspaso_reg

type variables
string ls_sector
end variables

on w_proceso_traspaso_reg.create
this.lb_1=create lb_1
this.st_directorio=create st_directorio
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.hpb_1=create hpb_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.lb_1,&
this.st_directorio,&
this.st_3,&
this.st_2,&
this.st_1,&
this.hpb_1,&
this.dw_3,&
this.dw_2,&
this.sle_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_proceso_traspaso_reg.destroy
destroy(this.lb_1)
destroy(this.st_directorio)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.hpb_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;string null_str,serie,estado,base,dv,sql,sector,n_sep,path
long i,cap,rut,j,contrato,h
Double	numero

dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
gf_centrar(w_proceso_traspaso_reg)
SetNull(null_str)

//dw_1.ImportFile(null_str)

////lb_1.DirList("C:\COMPARTIDO\ultima_veile\corriplano en Gagriel Veiles Planimetria (60.60.60.13)\*.txt", 32,st_directorio )
if gs_empresa = 'El Prado' then
//	lb_1.DirList("C:\COMPARTIDO\ultima_plani\CORRIPLANO\OBSERVACIONES\*.txt", 32,st_directorio )
	lb_1.DirList("C:\migracion7\consulta\*.txt", 32,st_directorio )
	path = st_directorio.text+'\'
else
//	lb_1.DirList("C:\COMPARTIDO\ultima_plani\roy_serena\*.txt", 32,st_directorio )
	lb_1.DirList("C:\migracion7\consulta\*.txt", 32,st_directorio )
	path = st_directorio.text+'\'
end if
//if lb_1.TotalItems() > 0 then
//	for h = 1 to lb_1.TotalItems()
//		dw_1.ImportFile(path+lb_1.text(h))
//		if dw_1.rowcount() > 0 then
//			for i = 1 to dw_1.rowcount()
//				base = dw_1.getitemstring(i,'base')
//				serie = dw_1.getitemstring(i,'serie')
//				if isnull(serie) then 
//					serie = 'I'
//					dw_1.setitem(i,'serie',serie)
//				else
//					dw_1.setitem(i,'serie',upper(serie))
//				end if
//				numero = dw_1.getitemnumber(i,'contrato')
//				if isnull(numero) then 
//					numero = 0
//					dw_1.setitem(i,'estado',null_str)
//				else
//					SELECT ESTADO INTO :estado FROM CADENA	WHERE ( CODIGO = :base ) AND ( SERIE = :serie ) AND ( NUMERO = :numero ) ;
//					if sqlca.sqlcode = 0 then
//						dw_1.setitem(i,'estado',estado)
//					elseif sqlca.sqlcode = -1 then
//						dw_1.setitem(i,'estado','?')
//					end if
//				end if
//				dw_1.setitem(i,'contrato',numero)
//				cap = dw_1.getitemnumber(i,'cap')
//				if isnull(cap) then
//					dw_1.setitem(i,'cap',dw_1.getitemnumber(1,'cap'))
//				end if
//				rut = dw_1.getitemnumber(i,'rut')
//				if isnull(rut) then
//					dw_1.setitem(i,'dv',null_str)
//				else
//					dw_1.setitem(i,'dv',sle_1.calcula_dv(string(rut)))
//				end if
//				sector = dw_1.getitemstring(i,'sector')
//				if isnull(sector) then
//					dw_1.setitem(i,'sector',dw_1.getitemstring(1,'sector'))
//				end if
//				n_sep = dw_1.getitemstring(1,'sepultura')
//				SELECT numero INTO :contrato FROM INVENTARIO_PLANI	WHERE ( SECTOR = :sector ) AND ( SEPULTURA = :n_sep ) ;
//				if sqlca.sqlcode = 0 and contrato = 1000000 then	
//					dw_1.setitem(i,'contrato',contrato)
//				end if
//			next
//		end if
//	next
//end if
//if dw_3.retrieve() > 0 then
//	for j = 1 to dw_3.rowcount()
//		sector = dw_3.getitemstring(j,'sector')
//		if dw_2.retrieve(sector) > 0 then
//			for i = 1 to dw_2.rowcount()
//				dw_2.setitem(i,'correlativo',i)
//			next
//			dw_2.update()
//			commit;
//		end if
//	next
//end if
end event

type lb_1 from listbox within w_proceso_traspaso_reg
integer x = 3685
integer y = 64
integer width = 489
integer height = 1724
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string null_str,serie,estado,base,dv,sql,sector,n_sep,path
long i,cap,rut,contrato,rut_c
Double	numero
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
gf_centrar(w_proceso_traspaso_reg)
SetNull(null_str)
SetNull(ls_sector)
ls_sector =  mid(this.text(index),1,len(this.text(index)) - 4 )
st_2.text = 'Carga de Reg.'
st_3.text = ''
dw_1.reset()
path = st_directorio.text+'\'+this.Text(index)
dw_1.ImportFile(path)
hpb_1.maxposition = dw_1.rowcount()
hpb_1.minposition = 1
if dw_1.rowcount() > 0 then
	for i = 1 to dw_1.rowcount()
		hpb_1.position = i
		dw_1.ScrollToRow(i)
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(i, TRUE)
		st_1.text = string(round(i*100/dw_1.rowcount(),0))+' %'
		base  = dw_1.getitemstring(i,'base')
		serie = dw_1.getitemstring(i,'serie')
		if gs_empresa = 'El Prado' then
			if isnull(serie) then 
				serie = 'I'
				dw_1.setitem(i,'serie',serie)
			else
				dw_1.setitem(i,'serie',upper(serie))
			end if
		elseif gs_empresa = 'La Foresta' then
			if isnull(serie) then 
				serie = 'S'
				dw_1.setitem(i,'serie',serie)
			else
				dw_1.setitem(i,'serie',upper(serie))
			end if
		elseif gs_empresa = 'Concepcion' then
			if isnull(serie) then 
				serie = 'C'
				dw_1.setitem(i,'serie',serie)
			else
				dw_1.setitem(i,'serie',upper(serie))
			end if
		end if
		numero = dw_1.getitemnumber(i,'contrato')
		if isnull(numero) then 
			numero = 0
			dw_1.setitem(i,'estado',null_str)
		else
			SELECT ESTADO,RUT INTO :estado,:rut_c FROM CADENA	WHERE ( CODIGO = :base ) AND ( SERIE = :serie ) AND ( NUMERO = :numero ) ;
			if sqlca.sqlcode = 0 then
				dw_1.setitem(i,'estado',estado)
				dw_1.setitem(i,'rut',rut_c)
			elseif sqlca.sqlcode = -1 then
				dw_1.setitem(i,'estado','?')
			end if
		end if
		dw_1.setitem(i,'contrato',numero)
		cap = dw_1.getitemnumber(i,'cap')
		if isnull(cap) then
			dw_1.setitem(i,'cap',dw_1.getitemnumber(1,'cap'))
		end if
		rut = dw_1.getitemnumber(i,'rut')
		if isnull(rut) then
			dw_1.setitem(i,'dv',null_str)
		else
			dw_1.setitem(i,'dv',sle_1.calcula_dv(string(rut)))
		end if
		sector = dw_1.getitemstring(i,'sector')
		if isnull(sector) or sector = '' then
			dw_1.setitem(i,'sector',dw_1.getitemstring(1,'sector'))
		end if
		n_sep = dw_1.getitemstring(1,'sepultura')
		SELECT numero INTO :contrato FROM INVENTARIO_PLANI	WHERE ( SECTOR = :sector ) AND ( SEPULTURA = :n_sep ) ;
		if sqlca.sqlcode = 0 and contrato = 10000000 then	
			dw_1.setitem(i,'contrato',contrato)
		end if
		st_2.text = 'Carga de Reg.'+string(i,'###,##0')+ ' de '+string(dw_1.rowcount(),'###,##0')
	next
end if
cb_1.triggerevent(clicked!)

//if dw_3.retrieve() > 0 then
//	for j = 1 to dw_3.rowcount()
//		sector = dw_3.getitemstring(j,'sector')
//		if dw_2.retrieve(sector) > 0 then
//			for i = 1 to dw_2.rowcount()
//				dw_2.setitem(i,'correlativo',i)
//			next
//			dw_2.update()
//			commit;
//		end if
//	next
//end if
end event

type st_directorio from statictext within w_proceso_traspaso_reg
integer x = 73
integer y = 2136
integer width = 3566
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_proceso_traspaso_reg
integer x = 1591
integer y = 1940
integer width = 727
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_proceso_traspaso_reg
integer x = 613
integer y = 1940
integer width = 727
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within w_proceso_traspaso_reg
integer x = 2345
integer y = 1856
integer width = 215
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type hpb_1 from hprogressbar within w_proceso_traspaso_reg
integer x = 613
integer y = 1852
integer width = 1705
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_3 from datawindow within w_proceso_traspaso_reg
integer x = 2249
integer y = 2400
integer width = 411
integer height = 432
integer taborder = 50
boolean titlebar = true
string title = "none"
string dataobject = "dw_sectores"
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

type dw_2 from datawindow within w_proceso_traspaso_reg
integer x = 1655
integer y = 2396
integer width = 411
integer height = 432
integer taborder = 20
string title = "none"
string dataobject = "dw_corrige_corr_inv_plani"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from u_sle_rut within w_proceso_traspaso_reg
boolean visible = false
integer x = 1157
integer y = 2208
integer taborder = 40
end type

type cb_2 from commandbutton within w_proceso_traspaso_reg
integer x = 3241
integer y = 1840
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cerrar"
end type

event clicked;close(w_proceso_traspaso_reg)
end event

type cb_1 from commandbutton within w_proceso_traspaso_reg
integer x = 78
integer y = 1840
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aceptar"
end type

event clicked;long i,corr,rut,cap,bien,mal,ret,folio
string base,serie,sector,n_sep,estado,obs,n_tec,usuario
datetime fecha
Double	numero

Ret = MessageBox('Actualización','Desea Actualizar Tabla "inventario_plani".', Exclamation!, OKCancel!, 2)
if ret = 1 then
	DELETE FROM "INVENTARIO_PLANI" WHERE "INVENTARIO_PLANI"."SECTOR" = :ls_sector ;
	commit ;

	hpb_1.maxposition = dw_1.rowcount()
	hpb_1.minposition = 1
	for i = 1 to dw_1.rowcount()
		Setnull(base);Setnull(serie);Setnull(numero);Setnull(rut);Setnull(sector);Setnull(n_sep);Setnull(cap)
		Setnull(estado);Setnull(fecha);Setnull(obs);Setnull(usuario);Setnull(fecha);Setnull(folio);Setnull(n_tec)
		Setnull(sector)
		fecha = datetime(today ())			
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(i, TRUE)
		hpb_1.position = i
		dw_1.ScrollToRow(i)
		st_1.text = string(round(i*100/dw_1.rowcount(),0))+' %'
		base   = dw_1.getitemstring(i,'base')
		serie  = dw_1.getitemstring(i,'serie')
		numero = dw_1.getitemnumber(i,'contrato')
		corr   = dw_1.getitemnumber(i,'corr')
		rut    = dw_1.getitemnumber(i,'rut')
		if isnull(rut) and not isnull(numero) then
			SELECT	"CADENA"."RUT"  
			INTO 		:rut  
			FROM 		"CADENA"  
			WHERE  ( "CADENA"."CODIGO" = :base ) AND  
					 ( "CADENA"."SERIE" = :serie ) AND  
					 ( "CADENA"."NUMERO" = :numero )   ;

//				if sqlca.sqclde = 0 then
//				end if
		end if
		sector = dw_1.getitemstring(i,'sector')
		n_sep  = dw_1.getitemstring(i,'modulo')
		cap    = dw_1.getitemnumber(i,'cap')
		estado = dw_1.getitemstring(i,'estado')
		obs    = dw_1.getitemstring(i,'observaciones')
		if len(obs)>50 then obs	= mid(obs,1,50)
		n_tec  = dw_1.getitemstring(i,'n_tec')
		usuario	='GV1'
		folio		= 0
		INSERT INTO "INVENTARIO_PLANI"  
					( "CORRELATIVO","BASE","SERIE","NUMERO","RUT","SECTOR","SEPULTURA","CAPACIDAD","STATUS","FECHA_STATUS","OBSERVACIONES","LOG_USUARIO","FECHA_LOG","FOLIO_ASIGNACION","NUMERO_TEC","SUB_SECTOR" )  
		  VALUES ( :corr        ,:base ,:serie ,:numero ,:rut ,:sector ,:n_sep     ,:cap       ,:estado ,:fecha        ,:obs           ,:usuario     ,:fecha     ,:folio            ,:n_tec      ,:sector ) USING	sqlca;
		if sqlca.sqlcode = 0 then
			commit USING SQLCA;
			bien ++
		else
			UPDATE	"INVENTARIO_PLANI"  
			SET 		"CORRELATIVO" = :corr,   
						"BASE" = :base,   
						"SERIE" = :serie,   
						"NUMERO" = :numero,   
						"RUT" = :rut,   
						"SECTOR" = :sector,   
						"SEPULTURA" = :n_sep,   
						"CAPACIDAD" = :cap,   
						"STATUS" = :estado,   
						"FECHA_STATUS" = :fecha,   
						"OBSERVACIONES" = :obs,   
						"LOG_USUARIO" = :usuario,   
						"FECHA_LOG" = :fecha,   
						"FOLIO_ASIGNACION" = :folio,   
						"NUMERO_TEC" = :n_tec,   
						"SUB_SECTOR" = :sector  
			WHERE ( "INVENTARIO_PLANI"."SECTOR" = :sector ) AND  
			( "INVENTARIO_PLANI"."SEPULTURA" = :n_sep )   
			USING	sqlca;
			if sqlca.sqlcode = 0 then
				commit USING SQLCA;
				bien ++
			else
				rollback USING SQLCA;
				MESSAGEBOX("ERROR GRABAR","ERROR SQL: "+SQLCA.SQLErrText+'( SECTOR: '+sector+', SEP.: '+n_sep)
				mal ++
			end if
		end if
		st_2.text = 'Nº Reg.Buenos: '+string(bien)
		st_3.text = 'Nº Reg.Malos: '+string(mal)
	next
end if
end event

type dw_1 from datawindow within w_proceso_traspaso_reg
integer x = 78
integer y = 64
integer width = 3566
integer height = 1728
integer taborder = 10
string title = "none"
string dataobject = "dw_proceso_traspaso_reg"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

