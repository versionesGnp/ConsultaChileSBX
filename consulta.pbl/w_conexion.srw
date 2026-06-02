forward
global type w_conexion from window
end type
type cb_3 from commandbutton within w_conexion
end type
type rb_parque_conce from radiobutton within w_conexion
end type
type st_1 from statictext within w_conexion
end type
type mle_1 from multilineedit within w_conexion
end type
type rb_serena from radiobutton within w_conexion
end type
type rb_santiago from radiobutton within w_conexion
end type
type cb_2 from commandbutton within w_conexion
end type
type cb_1 from commandbutton within w_conexion
end type
type gb_1 from groupbox within w_conexion
end type
end forward

global type w_conexion from window
integer x = 1134
integer y = 852
integer width = 2117
integer height = 712
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
long backcolor = 80269524
integer animationtime = 50
cb_3 cb_3
rb_parque_conce rb_parque_conce
st_1 st_1
mle_1 mle_1
rb_serena rb_serena
rb_santiago rb_santiago
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_conexion w_conexion

event open;gf_centrar(w_conexion)

this.title		= gs_app_name
SELECT	sysdate,		"IVA"
INTO 		:gdt_fec_sistema,	:gdb_iva
FROM 		"TASA"
USING		sqlca;
gs_ventana	= 'w_conexion'
f_valida_objeto()

end event

on w_conexion.create
this.cb_3=create cb_3
this.rb_parque_conce=create rb_parque_conce
this.st_1=create st_1
this.mle_1=create mle_1
this.rb_serena=create rb_serena
this.rb_santiago=create rb_santiago
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_3,&
this.rb_parque_conce,&
this.st_1,&
this.mle_1,&
this.rb_serena,&
this.rb_santiago,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_conexion.destroy
destroy(this.cb_3)
destroy(this.rb_parque_conce)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.rb_serena)
destroy(this.rb_santiago)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

type rb_parque_conce from radiobutton within w_conexion
boolean visible = false
integer x = 375
integer y = 696
integer width = 1010
integer height = 92
integer textsize = -11
integer weight = 700
fontcharset fontcharset = turkishcharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial TUR"
long backcolor = 80269524
string text = "Concepción"
boolean lefttext = true
end type

type st_1 from statictext within w_conexion
integer x = 1522
integer y = 336
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

type mle_1 from multilineedit within w_conexion
integer x = 1522
integer y = 72
integer width = 530
integer height = 236
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

type rb_serena from radiobutton within w_conexion
integer x = 105
integer y = 288
integer width = 1289
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

type rb_santiago from radiobutton within w_conexion
integer x = 105
integer y = 160
integer width = 1289
integer height = 92
integer taborder = 10
integer textsize = -11
integer weight = 700
fontcharset fontcharset = turkishcharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial TUR"
long backcolor = 80269524
string text = "Prado / Manantial / Santiago / Canaán"
boolean checked = true
boolean lefttext = true
end type

type cb_2 from commandbutton within w_conexion
integer x = 1687
integer y = 476
integer width = 366
integer height = 108
integer taborder = 40
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

type cb_1 from commandbutton within w_conexion
integer x = 59
integer y = 476
integer width = 443
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar SBX"
boolean default = true
end type

event clicked;	string is_dbms, is_logpass, is_servername, is_logid, is_dbparam

gl_contar_logon					= 0
if rb_santiago.checked = true then
	gs_conexion						= "Parque El Prado" 
	gs_empresa 					= 'El Prado'
	gi_poliza 						= 5733
	gs_nombre_parque 			= "INMOBILIARIA PARQUE LA FLORIDA SpA"
	setpointer(HourGlass!)
	DISCONNECT USING sqlca ;
	is_dbms 							= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
	is_logpass 						= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","qa_prado")
	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","prado_sandbox_qa")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","prado_8g")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","desarrollo")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","resp_prado8i")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","prado_8g")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","prado_19")
	gs_servername					= is_servername
	is_logid 							= profilestring("INMOB.INI", "Conexión", "LogId","prado")
	is_dbparam 						= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	
	Trans_1							= CREATE transaction
	Trans_2							= CREATE transaction
	Trans_3							= CREATE transaction
	Trans_4							= CREATE transaction
	Trans_5							= CREATE transaction
	Trans_6							= CREATE transaction
	Trans_7							= CREATE transaction
//	Trans_hana						= CREATE transaction

//	Trans_3.DBMS 					= "O10 Oracle 10g"
//	Trans_3.LogPass 				= "estado1"
//	Trans_3.ServerName 		= "contab"
//	Trans_3.LogId 					= "cliser"
//	Trans_3.DBParm 				= "PBCatalogOwner='cliser'"

//	Trans_hana.DBMS 			= "ODBC"
//	Trans_hana.AutoCommit 	= False
//	Trans_hana.DBParm			= "ConnectString='DSN=Sap;UID=INTELLEGO_CON;PWD=Intellego2015'"
//	Trans_hana.DBParm			= "ConnectString='DSN=Sap;UID=INTELLEGO_GNP;PWD=NPDhana215'"

	gs_usuario_1 					= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 					= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 					= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 					= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 					= profilestring("INMOB.INI","Usuario","usuario5","" )
	
	gs_caja 							= profilestring("C:\mod_cp\consulta\INMOB.INI","Caja","Caja","" )
	
	Trans_1.DBMS 					= is_dbms
	Trans_1.LogPass 				= is_logpass
	Trans_1.ServerName			= is_servername
	Trans_1.LogId 					= is_logid
	Trans_1.dbParm 				= is_dbparam
	Trans_2.DBMS 					= is_dbms
	Trans_2.LogPass 				= is_logpass
	Trans_2.ServerName			= is_servername
	Trans_2.LogId 					= is_logid
	Trans_2.dbParm 				= is_dbparam
	
	Trans_3.DBMS 					= is_dbms
	Trans_3.LogPass 				= is_logpass
	Trans_3.ServerName			= is_servername
	Trans_3.LogId 					= is_logid
	Trans_3.dbParm 				= is_dbparam
	
	Trans_4.DBMS 					= is_dbms
	Trans_4.LogPass 				= is_logpass
	Trans_4.ServerName 		= is_servername
	Trans_4.LogId 					= is_logid
	Trans_4.dbParm 				= is_dbparam
	
	Trans_5.DBMS 					= is_dbms
	Trans_5.LogPass 				= is_logpass
	Trans_5.ServerName			= is_servername
	Trans_5.LogId 					= is_logid
	Trans_5.dbParm 				= is_dbparam
	
	Trans_6.DBMS 					= is_dbms
	Trans_6.LogPass 				= is_logpass
	Trans_6.ServerName			= is_servername
	Trans_6.LogId 					= is_logid
	Trans_6.dbParm 				= is_dbparam
	
	Trans_7.DBMS 					= is_dbms
	Trans_7.LogPass 				= is_logpass
	Trans_7.ServerName			= is_servername
	Trans_7.LogId 					= is_logid
	Trans_7.dbParm 				= is_dbparam
	
	SQLCA.DBMS 					= is_dbms
	SQLCA.LogPass 				= is_logpass
	SQLCA.ServerName 			= is_servername
	SQLCA.LogId 					= is_logid
	SQLCA.dbParm 				= is_dbparam
	st_1.text							= ' Buscando Conexión.'
	connect using sqlca;
	
	SELECT 		"USUARIO",			"DATA_SOURCE_NAME",		"CLAVE",				"CONEXION_SAP",		"MANDATARIO_SAP"
	INTO      		:gs_user_odbc, 	:gs_data_name, 				:gs_clave_odbc,	:gs_sap_conex, 		:gs_mandatario                               
	FROM     	"SAP_ODBC"  
	WHERE 		"SAP_ODBC"."SERVERNAME" = :is_servername
	USING  		sqlca;
	 Trans_hana  					= CREATE transaction
	 Trans_hana.DBMS             	= "ODBC"
	 Trans_hana.AutoCommit    = False
	 Trans_hana.DBParm          	= "ConnectString='DSN="+gs_data_name+";UID="+gs_user_odbc+";PWD="+gs_clave_odbc+"'"
	 
	gs_formato_fecha 				= F_FORMATO_FECHA()
	Open(w_presentacion)
	gb_presentacion				= TRUE
	Timer(3,w_presentacion)
	DO WHILE gb_presentacion = TRUE
		Yield()
	LOOP
	Close(w_presentacion)
	open(w_logon)
	if gi_nivel_acceso=1 then
		if gl_val_1 = 1 then
			close(w_logon)
			close(w_principal)
		else
			Open(w_principal)
		end if
	end if	
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Prado/Manantial/Santiago/Canaán )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
	
elseif rb_serena.checked = true then
	setpointer(HourGlass!)
	gs_conexion				= "Parque La Foresta"
	gs_empresa 			= 'La Foresta'
	gi_poliza 				= 5734
	gs_nombre_parque 	= "INMOBILIARIA PARQUE LA SERENA SpA"
	DISCONNECT USING sqlca ;
	is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
	is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","qa_foresta")
	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_sandbox_qa")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","desarrollo_foresta")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","resp_prado_253")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_8g")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_19")
	gs_servername			= is_servername
	is_logid 					= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
	is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	Trans_1					= CREATE transaction
	Trans_2					= CREATE transaction
	Trans_3					= CREATE transaction
	Trans_4					= CREATE transaction
	Trans_5					= CREATE transaction
	Trans_6					= CREATE transaction
	Trans_7					= CREATE transaction
//	Trans_hana				= CREATE transaction
	
//	Trans_hana.DBMS 			= "ODBC"
//	Trans_hana.AutoCommit 	= False
//	Trans_hana.DBParm			= "ConnectString='DSN=Sap;UID=INTELLEGO_CON;PWD=Intellego2015'"
//	Trans_hana.DBParm			= "ConnectString='DSN=Sap;UID=INTELLEGO_GNP;PWD=NPDhana215'"
	
	gs_usuario_1 			= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 			= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 			= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 			= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 			= profilestring("INMOB.INI","Usuario","usuario5","" )
	
	gs_caja 					= profilestring("C:\mod_cp\consulta\INMOB.INI","Caja","Caja","" )
	
	Trans_1.DBMS 			= is_dbms
	Trans_1.LogPass 		= is_logpass
	Trans_1.ServerName = is_servername
	Trans_1.LogId 			= is_logid
	Trans_1.dbParm 		= is_dbparam
	
	Trans_2.DBMS 			= is_dbms
	Trans_2.LogPass 		= is_logpass
	Trans_2.ServerName = is_servername
	Trans_2.LogId 			= is_logid
	Trans_2.dbParm 		= is_dbparam
	
	Trans_3.DBMS 			= is_dbms
	Trans_3.LogPass 		= is_logpass
	Trans_3.ServerName = is_servername
	Trans_3.LogId 			= is_logid
	Trans_3.dbParm 		= is_dbparam
	
	Trans_4.DBMS 			= is_dbms
	Trans_4.LogPass 		= is_logpass
	Trans_4.ServerName = is_servername
	Trans_4.LogId 			= is_logid
	Trans_4.dbParm 		= is_dbparam
	
	Trans_5.DBMS 			= is_dbms
	Trans_5.LogPass 		= is_logpass
	Trans_5.ServerName = is_servername
	Trans_5.LogId 			= is_logid
	Trans_5.dbParm 		= is_dbparam
	
	Trans_6.DBMS 			= is_dbms
	Trans_6.LogPass 		= is_logpass
	Trans_6.ServerName = is_servername
	Trans_6.LogId 			= is_logid
	Trans_6.dbParm 		= is_dbparam
	
	Trans_7.DBMS 			= is_dbms
	Trans_7.LogPass 		= is_logpass
	Trans_7.ServerName = is_servername
	Trans_7.LogId 			= is_logid
	Trans_7.dbParm 		= is_dbparam
	sqlca.DBMS 				= is_dbms
	sqlca.LogPass 			= is_logpass
	sqlca.ServerName 	= is_servername
	sqlca.LogId 				= is_logid
	sqlca.dbParm 			= is_dbparam
	st_1.text					= ' Buscando Conexión.'	
	connect using sqlca;
	
	SELECT 		"USUARIO",			"DATA_SOURCE_NAME",		"CLAVE",				"CONEXION_SAP",		"MANDATARIO_SAP"
	INTO      		:gs_user_odbc, 	:gs_data_name, 				:gs_clave_odbc,	:gs_sap_conex, 		:gs_mandatario                               
	FROM     	"SAP_ODBC"  
	WHERE 		"SAP_ODBC"."SERVERNAME" = :is_servername
	USING  		sqlca;
	 Trans_hana  						= CREATE transaction
	 Trans_hana.DBMS              	= "ODBC"
	 Trans_hana.AutoCommit       	= False
	 Trans_hana.DBParm           	= "ConnectString='DSN="+gs_data_name+";UID="+gs_user_odbc+";PWD="+gs_clave_odbc+"'"
	 
	gs_formato_fecha 					= F_FORMATO_FECHA()
	Open(w_presentacion)
	gb_presentacion					= TRUE
	Timer(3,w_presentacion)
	DO WHILE gb_presentacion 		= TRUE
		Yield()
	LOOP
	Close(w_presentacion)
	open(w_logon)
	if gi_nivel_acceso=1 then
		if gl_val_1 = 1 then
			close(w_logon)
			close(w_principal)
		else
			Open(w_principal)
		end if
	end if
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
	if gl_cod_parque = 0 or isnull(gl_cod_parque) then
		close(w_logon)
		close(w_principal)
	end if

end if	
close(w_conexion)
end event

type gb_1 from groupbox within w_conexion
integer x = 59
integer y = 40
integer width = 1413
integer height = 400
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

type cb_3 from commandbutton within w_conexion
integer x = 667
integer y = 476
integer width = 489
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar PROD"
boolean default = true
end type

event clicked;	string is_dbms, is_logpass, is_servername, is_logid, is_dbparam

gl_contar_logon					= 0
if rb_santiago.checked = true then
	gs_conexion						= "Parque El Prado" 
	gs_empresa 					= 'El Prado'
	gi_poliza 						= 5733
	gs_nombre_parque 			= "INMOBILIARIA PARQUE LA FLORIDA SpA"
	setpointer(HourGlass!)
	DISCONNECT USING sqlca ;
	is_dbms 							= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
	is_logpass 						= profilestring("INMOB.INI", "Conexión", "LogPass","prado")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","qa_prado")
	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","prado_sandbox_qa")
	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","prado_8g")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","desarrollo")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","resp_prado8i")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","prado_8g")
//	is_servername 					= profilestring("INMOB.INI", "Conexión", "ServerName","prado_19")
	gs_servername					= is_servername
	is_logid 							= profilestring("INMOB.INI", "Conexión", "LogId","prado")
	is_dbparam 						= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	
	Trans_1							= CREATE transaction
	Trans_2							= CREATE transaction
	Trans_3							= CREATE transaction
	Trans_4							= CREATE transaction
	Trans_5							= CREATE transaction
	Trans_6							= CREATE transaction
	Trans_7							= CREATE transaction
//	Trans_hana						= CREATE transaction

//	Trans_3.DBMS 					= "O10 Oracle 10g"
//	Trans_3.LogPass 				= "estado1"
//	Trans_3.ServerName 		= "contab"
//	Trans_3.LogId 					= "cliser"
//	Trans_3.DBParm 				= "PBCatalogOwner='cliser'"

//	Trans_hana.DBMS 			= "ODBC"
//	Trans_hana.AutoCommit 	= False
//	Trans_hana.DBParm			= "ConnectString='DSN=Sap;UID=INTELLEGO_CON;PWD=Intellego2015'"
//	Trans_hana.DBParm			= "ConnectString='DSN=Sap;UID=INTELLEGO_GNP;PWD=NPDhana215'"

	gs_usuario_1 					= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 					= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 					= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 					= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 					= profilestring("INMOB.INI","Usuario","usuario5","" )
	
	gs_caja 							= profilestring("C:\mod_cp\consulta\INMOB.INI","Caja","Caja","" )
	
	Trans_1.DBMS 					= is_dbms
	Trans_1.LogPass 				= is_logpass
	Trans_1.ServerName			= is_servername
	Trans_1.LogId 					= is_logid
	Trans_1.dbParm 				= is_dbparam
	Trans_2.DBMS 					= is_dbms
	Trans_2.LogPass 				= is_logpass
	Trans_2.ServerName			= is_servername
	Trans_2.LogId 					= is_logid
	Trans_2.dbParm 				= is_dbparam
	
	Trans_3.DBMS 					= is_dbms
	Trans_3.LogPass 				= is_logpass
	Trans_3.ServerName			= is_servername
	Trans_3.LogId 					= is_logid
	Trans_3.dbParm 				= is_dbparam
	
	Trans_4.DBMS 					= is_dbms
	Trans_4.LogPass 				= is_logpass
	Trans_4.ServerName 		= is_servername
	Trans_4.LogId 					= is_logid
	Trans_4.dbParm 				= is_dbparam
	
	Trans_5.DBMS 					= is_dbms
	Trans_5.LogPass 				= is_logpass
	Trans_5.ServerName			= is_servername
	Trans_5.LogId 					= is_logid
	Trans_5.dbParm 				= is_dbparam
	
	Trans_6.DBMS 					= is_dbms
	Trans_6.LogPass 				= is_logpass
	Trans_6.ServerName			= is_servername
	Trans_6.LogId 					= is_logid
	Trans_6.dbParm 				= is_dbparam
	
	Trans_7.DBMS 					= is_dbms
	Trans_7.LogPass 				= is_logpass
	Trans_7.ServerName			= is_servername
	Trans_7.LogId 					= is_logid
	Trans_7.dbParm 				= is_dbparam
	
	SQLCA.DBMS 					= is_dbms
	SQLCA.LogPass 				= is_logpass
	SQLCA.ServerName 			= is_servername
	SQLCA.LogId 					= is_logid
	SQLCA.dbParm 				= is_dbparam
	st_1.text							= ' Buscando Conexión.'
	connect using sqlca;
	
	SELECT 		"USUARIO",			"DATA_SOURCE_NAME",		"CLAVE",				"CONEXION_SAP",		"MANDATARIO_SAP"
	INTO      		:gs_user_odbc, 	:gs_data_name, 				:gs_clave_odbc,	:gs_sap_conex, 		:gs_mandatario                               
	FROM     	"SAP_ODBC"  
	WHERE 		"SAP_ODBC"."SERVERNAME" = :is_servername
	USING  		sqlca;
	 Trans_hana  					= CREATE transaction
	 Trans_hana.DBMS             	= "ODBC"
	 Trans_hana.AutoCommit    = False
	 Trans_hana.DBParm          	= "ConnectString='DSN="+gs_data_name+";UID="+gs_user_odbc+";PWD="+gs_clave_odbc+"'"
	 
	gs_formato_fecha 				= F_FORMATO_FECHA()
	Open(w_presentacion)
	gb_presentacion				= TRUE
	Timer(3,w_presentacion)
	DO WHILE gb_presentacion = TRUE
		Yield()
	LOOP
	Close(w_presentacion)
	open(w_logon)
	if gi_nivel_acceso=1 then
		if gl_val_1 = 1 then
			close(w_logon)
			close(w_principal)
		else
			Open(w_principal)
		end if
	end if	
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Prado/Manantial/Santiago/Canaán )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
	
elseif rb_serena.checked = true then
	setpointer(HourGlass!)
	gs_conexion				= "Parque La Foresta"
	gs_empresa 			= 'La Foresta'
	gi_poliza 				= 5734
	gs_nombre_parque 	= "INMOBILIARIA PARQUE LA SERENA SpA"
	DISCONNECT USING sqlca ;
	is_dbms 					= profilestring("INMOB.INI", "Conexión", "DBMS","O10 Oracle 10g")
	is_logpass 				= profilestring("INMOB.INI", "Conexión", "LogPass","foresta")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","qa_foresta")
	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_sandbox_qa")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","desarrollo_foresta")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","resp_prado_253")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_8g")
//	is_servername 			= profilestring("INMOB.INI", "Conexión", "ServerName","foresta_19")
	gs_servername			= is_servername
	is_logid 					= profilestring("INMOB.INI", "Conexión", "LogId","foresta")
	is_dbparam 				= profilestring("INMOB.INI", "Conexión", "dbParm","DecimalSeparator = '.';Delimitidentifier = 'Yes';PBDBMS = 0")
	Trans_1					= CREATE transaction
	Trans_2					= CREATE transaction
	Trans_3					= CREATE transaction
	Trans_4					= CREATE transaction
	Trans_5					= CREATE transaction
	Trans_6					= CREATE transaction
	Trans_7					= CREATE transaction
//	Trans_hana				= CREATE transaction
	
//	Trans_hana.DBMS 			= "ODBC"
//	Trans_hana.AutoCommit 	= False
//	Trans_hana.DBParm			= "ConnectString='DSN=Sap;UID=INTELLEGO_CON;PWD=Intellego2015'"
//	Trans_hana.DBParm			= "ConnectString='DSN=Sap;UID=INTELLEGO_GNP;PWD=NPDhana215'"
	
	gs_usuario_1 			= profilestring("INMOB.INI","Usuario","usuario1","" )
	gs_usuario_2 			= profilestring("INMOB.INI","Usuario","usuario2","" )
	gs_usuario_3 			= profilestring("INMOB.INI","Usuario","usuario3","" )
	gs_usuario_4 			= profilestring("INMOB.INI","Usuario","usuario4","" )
	gs_usuario_5 			= profilestring("INMOB.INI","Usuario","usuario5","" )
	
	gs_caja 					= profilestring("C:\mod_cp\consulta\INMOB.INI","Caja","Caja","" )
	
	Trans_1.DBMS 			= is_dbms
	Trans_1.LogPass 		= is_logpass
	Trans_1.ServerName = is_servername
	Trans_1.LogId 			= is_logid
	Trans_1.dbParm 		= is_dbparam
	
	Trans_2.DBMS 			= is_dbms
	Trans_2.LogPass 		= is_logpass
	Trans_2.ServerName = is_servername
	Trans_2.LogId 			= is_logid
	Trans_2.dbParm 		= is_dbparam
	
	Trans_3.DBMS 			= is_dbms
	Trans_3.LogPass 		= is_logpass
	Trans_3.ServerName = is_servername
	Trans_3.LogId 			= is_logid
	Trans_3.dbParm 		= is_dbparam
	
	Trans_4.DBMS 			= is_dbms
	Trans_4.LogPass 		= is_logpass
	Trans_4.ServerName = is_servername
	Trans_4.LogId 			= is_logid
	Trans_4.dbParm 		= is_dbparam
	
	Trans_5.DBMS 			= is_dbms
	Trans_5.LogPass 		= is_logpass
	Trans_5.ServerName = is_servername
	Trans_5.LogId 			= is_logid
	Trans_5.dbParm 		= is_dbparam
	
	Trans_6.DBMS 			= is_dbms
	Trans_6.LogPass 		= is_logpass
	Trans_6.ServerName = is_servername
	Trans_6.LogId 			= is_logid
	Trans_6.dbParm 		= is_dbparam
	
	Trans_7.DBMS 			= is_dbms
	Trans_7.LogPass 		= is_logpass
	Trans_7.ServerName = is_servername
	Trans_7.LogId 			= is_logid
	Trans_7.dbParm 		= is_dbparam
	sqlca.DBMS 				= is_dbms
	sqlca.LogPass 			= is_logpass
	sqlca.ServerName 	= is_servername
	sqlca.LogId 				= is_logid
	sqlca.dbParm 			= is_dbparam
	st_1.text					= ' Buscando Conexión.'	
	connect using sqlca;
	
	SELECT 		"USUARIO",			"DATA_SOURCE_NAME",		"CLAVE",				"CONEXION_SAP",		"MANDATARIO_SAP"
	INTO      		:gs_user_odbc, 	:gs_data_name, 				:gs_clave_odbc,	:gs_sap_conex, 		:gs_mandatario                               
	FROM     	"SAP_ODBC"  
	WHERE 		"SAP_ODBC"."SERVERNAME" = :is_servername
	USING  		sqlca;
	 Trans_hana  						= CREATE transaction
	 Trans_hana.DBMS              	= "ODBC"
	 Trans_hana.AutoCommit       	= False
	 Trans_hana.DBParm           	= "ConnectString='DSN="+gs_data_name+";UID="+gs_user_odbc+";PWD="+gs_clave_odbc+"'"
	 
	gs_formato_fecha 					= F_FORMATO_FECHA()
	Open(w_presentacion)
	gb_presentacion					= TRUE
	Timer(3,w_presentacion)
	DO WHILE gb_presentacion 		= TRUE
		Yield()
	LOOP
	Close(w_presentacion)
	open(w_logon)
	if gi_nivel_acceso=1 then
		if gl_val_1 = 1 then
			close(w_logon)
			close(w_principal)
		else
			Open(w_principal)
		end if
	end if
	if isvalid(w_principal) then w_principal.title=gs_app_name+fill(' ',5)+'( Conexión Foresta )'+fill(' ',5)+'Usuario: '+gs_nom_comp_usuario+fill(' ',5)+'Fecha Hoy: '+string(gdt_fec_sistema,"dd/mm/yyyy")+'  UF: '+string(gd_uf_dia,"###,###,##0.0###")
	if gl_cod_parque = 0 or isnull(gl_cod_parque) then
		close(w_logon)
		close(w_principal)
	end if

end if	
close(w_conexion)
end event

