forward
global type w_conexion_bkp_antigua from window
end type
type rb_parque_stgo from radiobutton within w_conexion_bkp_antigua
end type
type st_1 from statictext within w_conexion_bkp_antigua
end type
type mle_1 from multilineedit within w_conexion_bkp_antigua
end type
type rb_serena from radiobutton within w_conexion_bkp_antigua
end type
type rb_santiago from radiobutton within w_conexion_bkp_antigua
end type
type cb_2 from commandbutton within w_conexion_bkp_antigua
end type
type cb_1 from commandbutton within w_conexion_bkp_antigua
end type
type gb_1 from groupbox within w_conexion_bkp_antigua
end type
end forward

global type w_conexion_bkp_antigua from window
integer x = 1134
integer y = 852
integer width = 1481
integer height = 816
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
long backcolor = 80269524
rb_parque_stgo rb_parque_stgo
st_1 st_1
mle_1 mle_1
rb_serena rb_serena
rb_santiago rb_santiago
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_conexion_bkp_antigua w_conexion_bkp_antigua

event open;gf_centrar(w_conexion)

this.title	= gs_app_name
SELECT	sysdate
INTO 		:gdt_fec_sistema
FROM 		"TASA"
USING		sqlca;
gs_ventana	= 'w_conexion'
f_valida_objeto()
end event

on w_conexion_bkp_antigua.create
this.rb_parque_stgo=create rb_parque_stgo
this.st_1=create st_1
this.mle_1=create mle_1
this.rb_serena=create rb_serena
this.rb_santiago=create rb_santiago
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.rb_parque_stgo,&
this.st_1,&
this.mle_1,&
this.rb_serena,&
this.rb_santiago,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_conexion_bkp_antigua.destroy
destroy(this.rb_parque_stgo)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.rb_serena)
destroy(this.rb_santiago)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

type rb_parque_stgo from radiobutton within w_conexion_bkp_antigua
integer x = 105
integer y = 368
integer width = 704
integer height = 92
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = turkishcharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial TUR"
long backcolor = 80269524
string text = "Santiago"
boolean lefttext = true
end type

type st_1 from statictext within w_conexion_bkp_antigua
integer x = 882
integer y = 404
integer width = 530
integer height = 104
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 80269524
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_conexion_bkp_antigua
integer x = 882
integer y = 72
integer width = 530
integer height = 312
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 80269524
string text = "Elija la conexión a la que usted necesita acceder."
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type rb_serena from radiobutton within w_conexion_bkp_antigua
integer x = 105
integer y = 252
integer width = 704
integer height = 92
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = turkishcharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial TUR"
long backcolor = 80269524
string text = "Foresta"
boolean lefttext = true
end type

type rb_santiago from radiobutton within w_conexion_bkp_antigua
integer x = 105
integer y = 136
integer width = 704
integer height = 92
integer taborder = 10
integer textsize = -11
integer weight = 700
fontcharset fontcharset = turkishcharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial TUR"
long backcolor = 80269524
string text = "Prado / Manantial"
boolean checked = true
boolean lefttext = true
end type

type cb_2 from commandbutton within w_conexion_bkp_antigua
integer x = 1047
integer y = 552
integer width = 366
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;halt
end event

type cb_1 from commandbutton within w_conexion_bkp_antigua
integer x = 59
integer y = 552
integer width = 366
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;string is_dbms, is_logpass, is_servername, is_logid, is_dbparam

if rb_santiago.checked = true then
	gs_conexion				= "Parque El Prado"
	gs_empresa 				= 'El Prado'
	gi_poliza 				= 5733
	gs_nombre_parque 		= "INMOBILIARIA PARQUE LA FLORIDA SpA"
	setpointer(HourGlass!)
	DISCONNECT USING sqlca ;
	is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O73 ORACLE v7.3")
	is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","@prueba")
	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","@prado_8i")
	is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","prado")
	is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	Trans_1					= CREATE transaction
	Trans_2					= CREATE transaction
	Trans_3					= CREATE transaction
	Trans_4					= CREATE transaction
	// Profile cliser
	Trans_3.DBMS 			= "O73 ORACLE 7.3"
	Trans_3.LogPass 		= "estado1"
	Trans_3.ServerName 	= "@contab"
	Trans_3.LogId 			= "cliser"
	Trans_3.DBParm 		= "PBCatalogOwner='cliser'"
	gs_usuario_1 			= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 			= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 			= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 			= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 			= profilestring("INMOB.INI","Usuario","usuario5","" )
	Trans_1.DBMS 			= is_dbms
	Trans_1.LogPass 		= is_logpass
	Trans_1.ServerName 	= is_servername
	Trans_1.LogId 			= is_logid
	Trans_1.dbParm 		= is_dbparam
	Trans_2.DBMS 			= is_dbms
	Trans_2.LogPass 		= is_logpass
	Trans_2.ServerName 	= is_servername
	Trans_2.LogId 			= is_logid
	Trans_2.dbParm 		= is_dbparam
	Trans_4.DBMS 			= is_dbms
	Trans_4.LogPass 		= is_logpass
	Trans_4.ServerName 	= is_servername
	Trans_4.LogId 			= is_logid
	Trans_4.dbParm 		= is_dbparam
	SQLCA.DBMS 				= is_dbms
	SQLCA.LogPass 			= is_logpass
	SQLCA.ServerName 		= is_servername
	SQLCA.LogId 			= is_logid
	SQLCA.dbParm 			= is_dbparam
	st_1.text				= ' Buscando Conexión.'
	connect using sqlca;
	IF SQLCA.SQLCODE <> 0 THEN
		DISCONNECT USING sqlca ;
		is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O84 ORACLE 8.0.4")
		is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
		is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","prado8")
		is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","prado")
		is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
		Trans_1					= CREATE transaction
		Trans_2					= CREATE transaction
		Trans_1.DBMS 			= is_dbms
		Trans_1.LogPass 		= is_logpass
		Trans_1.ServerName 	= is_servername
		Trans_1.LogId 			= is_logid
		Trans_1.dbParm 		= is_dbparam
		Trans_2.DBMS 			= is_dbms
		Trans_2.LogPass 		= is_logpass
		Trans_2.ServerName 	= is_servername
		Trans_2.LogId 			= is_logid
		Trans_2.dbParm 		= is_dbparam
		Trans_4.DBMS 			= is_dbms
		Trans_4.LogPass 		= is_logpass
		Trans_4.ServerName 	= is_servername
		Trans_4.LogId 			= is_logid
		Trans_4.dbParm 		= is_dbparam
		SQLCA.DBMS 				= is_dbms
		SQLCA.LogPass 			= is_logpass
		SQLCA.ServerName 		= is_servername
		SQLCA.LogId 			= is_logid
		SQLCA.dbParm 			= is_dbparam
		st_1.text				= ' Buscando Conexión.'
		connect using sqlca;
		IF SQLCA.SQLCODE <> 0 THEN
			messagebox(gs_app_name,SQLCA.SQLERRTEXT,EXCLAMATION!)
			return
		end if
	end if
	gs_formato_fecha 	= F_FORMATO_FECHA()
	Open(w_presentacion)
	gb_presentacion	= TRUE
	Timer(3,w_presentacion)
	DO WHILE gb_presentacion = TRUE
		Yield()
	LOOP
	Close(w_presentacion)
	open(w_logon)
	if gi_nivel_acceso=1 then
		Open(w_principal)
	end if	
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Prado/Manantial )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Parque: '+gs_nom_cod_parque+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
elseif rb_serena.checked = true then
	setpointer(HourGlass!)
   gs_conexion				= "Parque La Foresta"
	gs_empresa 				= 'La Foresta'
	gi_poliza 				= 5734
	gs_nombre_parque 		= "INMOBILIARIA PARQUE LA SERENA SpA"
	DISCONNECT USING sqlca ;
	is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O73 ORACLE v7.3")
	is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","@foresta_8i")
	is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
	is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	Trans_1					= CREATE transaction
	Trans_2					= CREATE transaction
	Trans_4					= CREATE transaction
	gs_usuario_1 			= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 			= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 			= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 			= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 			= profilestring("INMOB.INI","Usuario","usuario5","" )
	Trans_1.DBMS 			= is_dbms
	Trans_1.LogPass 		= is_logpass
	Trans_1.ServerName 	= is_servername
	Trans_1.LogId 			= is_logid
	Trans_1.dbParm 		= is_dbparam
	Trans_2.DBMS 			= is_dbms
	Trans_2.LogPass 		= is_logpass
	Trans_2.ServerName 	= is_servername
	Trans_2.LogId 			= is_logid
	Trans_2.dbParm 		= is_dbparam
	Trans_4.DBMS 			= is_dbms
	Trans_4.LogPass 		= is_logpass
	Trans_4.ServerName 	= is_servername
	Trans_4.LogId 			= is_logid
	Trans_4.dbParm 		= is_dbparam
	sqlca.DBMS 				= is_dbms
	sqlca.LogPass 			= is_logpass
	sqlca.ServerName 		= is_servername
	sqlca.LogId 			= is_logid
	sqlca.dbParm 			= is_dbparam
	st_1.text				= ' Buscando Conexión.'	
	connect using sqlca;
	IF sqlca.SQLCODE <> 0 THEN
		DISCONNECT USING sqlca ;
		is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O84 ORACLE 8.0.4")
		is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
		is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","foresta8")
		is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
		is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
		Trans_1					= CREATE transaction
		Trans_2					= CREATE transaction
		Trans_1.DBMS 			= is_dbms
		Trans_1.LogPass 		= is_logpass
		Trans_1.ServerName 	= is_servername
		Trans_1.LogId 			= is_logid
		Trans_1.dbParm 		= is_dbparam
		Trans_2.DBMS 			= is_dbms
		Trans_2.LogPass 		= is_logpass
		Trans_2.ServerName 	= is_servername
		Trans_2.LogId 			= is_logid
		Trans_2.dbParm 		= is_dbparam
		Trans_4.DBMS 			= is_dbms
		Trans_4.LogPass 		= is_logpass
		Trans_4.ServerName 	= is_servername
		Trans_4.LogId 			= is_logid
		Trans_4.dbParm 		= is_dbparam
		SQLCA.DBMS 				= is_dbms
		SQLCA.LogPass 			= is_logpass
		SQLCA.ServerName 		= is_servername
		SQLCA.LogId 			= is_logid
		SQLCA.dbParm 			= is_dbparam
		st_1.text				= ' Buscando Conexión.'
		connect using sqlca;
		IF SQLCA.SQLCODE <> 0 THEN
			messagebox(gs_app_name,sqlca.SQLERRTEXT,EXCLAMATION!)
			return
		end if
	end if
	gs_formato_fecha 			= F_FORMATO_FECHA()
	Open(w_presentacion)
	gb_presentacion			= TRUE
	Timer(3,w_presentacion)
	DO WHILE gb_presentacion = TRUE
		Yield()
	LOOP
	Close(w_presentacion)
	open(w_logon)
	if gi_nivel_acceso=1 then
		Open(w_principal)
	end if
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Parque: '+gs_nom_cod_parque+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
elseif rb_parque_stgo.checked=true then
	gs_conexion				= "Parque Santiago"
	gs_empresa 				= 'Santiago'
	gi_poliza 				= 5733
	gs_nombre_parque 		= "EL RETIRO INMOBILIARIA E INVERSIONES SpA"
	setpointer(HourGlass!)
	DISCONNECT USING sqlca ;
	is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O73 ORACLE v7.3")
	is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","santiago")
	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","@santiago_8i")	
	is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","santiago")
	
	is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	Trans_1					= CREATE transaction
	Trans_2					= CREATE transaction
	Trans_3					= CREATE transaction
	Trans_4					= CREATE transaction
	// Profile cliser
	Trans_3.DBMS 			= "O73 ORACLE 7.3"
	Trans_3.LogPass 		= "estado1"
	Trans_3.ServerName 	= "@contab"
	Trans_3.LogId 			= "cliser"
	Trans_3.DBParm 		= "PBCatalogOwner='cliser'"
	gs_usuario_1 			= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 			= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 			= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 			= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 			= profilestring("INMOB.INI","Usuario","usuario5","" )
	Trans_1.DBMS 			= is_dbms
	Trans_1.LogPass 		= is_logpass
	Trans_1.ServerName 	= is_servername
	Trans_1.LogId 			= is_logid
	Trans_1.dbParm 		= is_dbparam
	Trans_2.DBMS 			= is_dbms
	Trans_2.LogPass 		= is_logpass
	Trans_2.ServerName 	= is_servername
	Trans_2.LogId 			= is_logid
	Trans_2.dbParm 		= is_dbparam
	Trans_4.DBMS 			= is_dbms
	Trans_4.LogPass 		= is_logpass
	Trans_4.ServerName 	= is_servername
	Trans_4.LogId 			= is_logid
	Trans_4.dbParm 		= is_dbparam
	SQLCA.DBMS 				= is_dbms
	SQLCA.LogPass 			= is_logpass
	SQLCA.ServerName 		= is_servername
	SQLCA.LogId 			= is_logid
	SQLCA.dbParm 			= is_dbparam
	st_1.text				= ' Buscando Conexión.'
	connect using sqlca;
	IF SQLCA.SQLCODE <> 0 THEN
		DISCONNECT USING sqlca ;
		is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O84 ORACLE 8.0.4")
		is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","santiago")
		is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","santiago8")
		is_logid 				= profilestring("INMOB.INI", "Conexión", "LogId","santiago")
		is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
		Trans_1					= CREATE transaction
		Trans_2					= CREATE transaction
		Trans_1.DBMS 			= is_dbms
		Trans_1.LogPass 		= is_logpass
		Trans_1.ServerName 	= is_servername
		Trans_1.LogId 			= is_logid
		Trans_1.dbParm 		= is_dbparam
		Trans_2.DBMS 			= is_dbms
		Trans_2.LogPass 		= is_logpass
		Trans_2.ServerName 	= is_servername
		Trans_2.LogId 			= is_logid
		Trans_2.dbParm 		= is_dbparam
		Trans_4.DBMS 			= is_dbms
		Trans_4.LogPass 		= is_logpass
		Trans_4.ServerName 	= is_servername
		Trans_4.LogId 			= is_logid
		Trans_4.dbParm 		= is_dbparam
		SQLCA.DBMS 				= is_dbms
		SQLCA.LogPass 			= is_logpass
		SQLCA.ServerName 		= is_servername
		SQLCA.LogId 			= is_logid
		SQLCA.dbParm 			= is_dbparam
		st_1.text				= ' Buscando Conexión.'
		connect using sqlca;
		IF SQLCA.SQLCODE <> 0 THEN
			messagebox(gs_app_name,SQLCA.SQLERRTEXT,EXCLAMATION!)
			return
		end if
	end if
	gs_formato_fecha 	= F_FORMATO_FECHA()
	Open(w_presentacion)
	gb_presentacion	= TRUE
	Timer(3,w_presentacion)
	DO WHILE gb_presentacion = TRUE
		Yield()
	LOOP
	Close(w_presentacion)
	open(w_logon)
	if gi_nivel_acceso=1 then
		Open(w_principal)
	end if	
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Santiago )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Parque: '+gs_nom_cod_parque+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
end if	
close(w_conexion)
end event

type gb_1 from groupbox within w_conexion_bkp_antigua
integer x = 59
integer y = 40
integer width = 805
integer height = 472
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 80269524
string text = "Conexión Parque"
end type

