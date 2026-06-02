forward
global type w_busqueda_grafica from window
end type
type pb_2 from picturebutton within w_busqueda_grafica
end type
type pb_1 from picturebutton within w_busqueda_grafica
end type
type dw_1 from datawindow within w_busqueda_grafica
end type
end forward

global type w_busqueda_grafica from window
integer width = 2139
integer height = 1488
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 67108864
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_busqueda_grafica w_busqueda_grafica

type variables
integer id_parque
end variables

forward prototypes
public function integer wf_insertar_dw (ref datawindow dw_paso, string select_string, string tipo, string sep)
public function integer wf_insertar_dw_paint (ref datawindow dw_paso, string select_string, string tipo)
public subroutine wf_sql (integer i, integer j, ref string sql, ref string sql1, string tabla, string tabla1)
end prototypes

public function integer wf_insertar_dw (ref datawindow dw_paso, string select_string, string tipo, string sep);long   campo1 ,campo2 ,campo3 ,campo4 ,campo5 ,campo6 ,campo7
string campo11,campo22,campo33,campo44,campo55,campo66,campo77	

if tipo = '0' then
	PREPARE sqlsa FROM :select_string;
	DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
	OPEN DYNAMIC dyn_cursor;  
	IF sqlca.sqlcode < 0 THEN
		MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_busqueda_grafica(1)")
		Return -1
	END IF
	dw_paso.Reset( )
	
	Do While sqlca.sqlcode = 0
		Fetch dyn_cursor into :campo1,:campo2,:campo3,:campo4,:campo5,:campo6,:campo7;
		If sqlca.sqlcode = 0 Then
			dw_paso.insertrow(0)
			dw_paso.setitem(dw_paso.rowcount(),'campo1',campo1)
			dw_paso.setitem(dw_paso.rowcount(),'campo2',campo2)
			dw_paso.setitem(dw_paso.rowcount(),'campo3',campo3)
			dw_paso.setitem(dw_paso.rowcount(),'campo4',campo4)
			dw_paso.setitem(dw_paso.rowcount(),'campo5',campo5)
			dw_paso.setitem(dw_paso.rowcount(),'campo6',campo6)
			dw_paso.setitem(dw_paso.rowcount(),'campo7',campo7)
			dw_paso.setitem(dw_paso.rowcount(),'sep',long(sep))
		ElseIf sqlca.sqlcode < 0 Then
			MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_busqueda_grafica(2)")
			Return -1
		Else
			Exit
		End If
	Loop
	Close dyn_cursor;
	Return 1
else
	PREPARE sqlsa FROM :select_string;
	DECLARE dyn_cursor1 DYNAMIC CURSOR FOR sqlsa;
	OPEN DYNAMIC dyn_cursor1;  
	IF sqlca.sqlcode < 0 THEN
		MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_busqueda_grafica(3)")
		Return -1
	END IF
	dw_paso.Reset( )
	
	Do While sqlca.sqlcode = 0
		Fetch dyn_cursor1 into :campo11,:campo22,:campo33,:campo44,:campo55,:campo66,:campo77;
		If sqlca.sqlcode = 0 Then
			dw_paso.insertrow(0)
			dw_paso.setitem(dw_paso.rowcount(),'campo1',campo11)
			dw_paso.setitem(dw_paso.rowcount(),'campo2',campo22)
			dw_paso.setitem(dw_paso.rowcount(),'campo3',campo33)
			dw_paso.setitem(dw_paso.rowcount(),'campo4',campo44)
			dw_paso.setitem(dw_paso.rowcount(),'campo5',campo55)
			dw_paso.setitem(dw_paso.rowcount(),'campo6',campo66)
			dw_paso.setitem(dw_paso.rowcount(),'campo7',campo77)
			dw_paso.setitem(dw_paso.rowcount(),'sep',sep)
		ElseIf sqlca.sqlcode < 0 Then
			MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_busqueda_grafica(4)")
			Return -1
		Else
			Exit
		End If
	Loop
	Close dyn_cursor1;
	Return 1
end if
end function

public function integer wf_insertar_dw_paint (ref datawindow dw_paso, string select_string, string tipo);long   campo1 ,campo2 ,campo3 ,campo4 ,campo5 ,campo6 ,campo7,i
long   campo11,campo22,campo33,campo44,campo55,campo66,campo77	
i = 0
if tipo = '0' then
	PREPARE sqlsa FROM :select_string;
	DECLARE dyn_cursor DYNAMIC CURSOR FOR sqlsa;
	OPEN DYNAMIC dyn_cursor;  
	IF sqlca.sqlcode < 0 THEN
		MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_busqueda_grafica_paint(1)")
		Return -1
	END IF
	
	Do While sqlca.sqlcode = 0
		Fetch dyn_cursor into :campo1,:campo2,:campo3,:campo4,:campo5,:campo6,:campo7;
		If sqlca.sqlcode = 0 Then
			i ++
			dw_paso.setitem(i,'campo11',campo1)
			dw_paso.setitem(i,'campo22',campo2)
			dw_paso.setitem(i,'campo33',campo3)
			dw_paso.setitem(i,'campo44',campo4)
			dw_paso.setitem(i,'campo55',campo5)
			dw_paso.setitem(i,'campo66',campo6)
			dw_paso.setitem(i,'campo77',campo7)
		ElseIf sqlca.sqlcode < 0 Then
			MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_busqueda_grafica_paint(2)")
			Return -1
		Else
			Exit
		End If
	Loop
	Close dyn_cursor;
	Return 1
else
	PREPARE sqlsa FROM :select_string;
	DECLARE dyn_cursor1 DYNAMIC CURSOR FOR sqlsa;
	OPEN DYNAMIC dyn_cursor1;  
	IF sqlca.sqlcode < 0 THEN
		MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_busqueda_grafica_paint(3)")
		Return -1
	END IF
	
	Do While sqlca.sqlcode = 0
		Fetch dyn_cursor1 into :campo11,:campo22,:campo33,:campo44,:campo55,:campo66,:campo77;
		If sqlca.sqlcode = 0 Then
			i ++
			dw_paso.setitem(i,'campo11',campo11)
			dw_paso.setitem(i,'campo22',campo22)
			dw_paso.setitem(i,'campo33',campo33)
			dw_paso.setitem(i,'campo44',campo44)
			dw_paso.setitem(i,'campo55',campo55)
			dw_paso.setitem(i,'campo66',campo66)
			dw_paso.setitem(i,'campo77',campo77)
		ElseIf sqlca.sqlcode < 0 Then
			MessageBox(gs_app_name,"DataBase Error!.~n~n"+sqlca.sqlerrtext+".~n~nwf_busqueda_grafica_paint(4)")
			Return -1
		Else
			Exit
		End If
	Loop
	Close dyn_cursor1;
	Return 1
end if
end function

public subroutine wf_sql (integer i, integer j, ref string sql, ref string sql1, string tabla, string tabla1);if i >= 4 and j >= 4 then// hacia el centro
	sql 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
				  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
				  ', campo'+string(j + 3)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
				  'correlativo >= '+string(i - 3) +' and correlativo <= '+string(i + 3) 
				  
	sql1 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
				  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
				  ', campo'+string(j + 3)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
				  'correlativo >= '+string(i - 3) +' and correlativo <= '+string(i + 3) 
elseif i < 4 and j >= 4 then// margen superior
	if i = 3 then
		sql 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 2) +' and correlativo <= '+string(i + 4) 
					  
		sql1 = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 2) +' and correlativo <= '+string(i + 4) 				  
	elseif i = 2 then
		sql 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
					  
		sql1 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 				  
	elseif i = 1 then
		sql 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6) 
					  
		sql1 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6) 				  
	end if
elseif i >= 4 and j < 4 then//margen inferior
	if j = 3 then
		sql 	   = 'select campo'+string(j - 2)+', campo'+string(j - 1)+', campo'+string(j)+&
					  ', campo'+string(j + 1)    +', campo'+string(j + 2)+', campo'+string(j + 3)+&
					  ', campo'+string(j + 4)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 3) +' and correlativo <= '+string(i + 3) 
					  
		sql1 	   = 'select campo'+string(j - 2)+', campo'+string(j - 1)+', campo'+string(j)+&
					  ', campo'+string(j + 1)    +', campo'+string(j + 2)+', campo'+string(j + 3)+&
					  ', campo'+string(j + 4)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 3) +' and correlativo <= '+string(i + 3) 
	elseif j = 2 then
		sql  	   = 'select campo'+string(j - 1)+', campo'+string(j)+', campo'+string(j + 1)+&
					  ', campo'+string(j + 2)    +', campo'+string(j + 3)+', campo'+string(j + 4)+&
					  ', campo'+string(j + 5)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 3) +' and correlativo <= '+string(i + 3) 
					  
		sql1 	   = 'select campo'+string(j - 1)+', campo'+string(j)+', campo'+string(j + 1)+&
					  ', campo'+string(j + 2)    +', campo'+string(j + 3)+', campo'+string(j + 4)+&
					  ', campo'+string(j + 5)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 3) +' and correlativo <= '+string(i + 3) 
	elseif j = 1 then
		sql 	   = 'select campo'+string(j)+', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)    +', campo'+string(j + 4)+', campo'+string(j + 5)+&
					  ', campo'+string(j + 6)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 3) +' and correlativo <= '+string(i + 3) 
					  
		sql1 	   = 'select campo'+string(j)+', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)    +', campo'+string(j + 4)+', campo'+string(j + 5)+&
					  ', campo'+string(j + 6)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 3) +' and correlativo <= '+string(i + 3) 
	end if
elseif i = 3 and j < 4 then//margen derecho y margen superior
	if j = 3 then
		sql 	   = 'select campo'+string(j - 2)+', campo'+string(j - 1)+', campo'+string(j )+&
					  ', campo'+string(j + 1)    +', campo'+string(j + 2)+', campo'+string(j + 3)+&
					  ', campo'+string(j + 4)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 2) +' and correlativo <= '+string(i + 4) 
					  
		sql1 	   = 'select campo'+string(j - 2)+', campo'+string(j - 1)+', campo'+string(j )+&
					  ', campo'+string(j + 1)    +', campo'+string(j + 2)+', campo'+string(j + 3)+&
					  ', campo'+string(j + 4)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 2) +' and correlativo <= '+string(i + 4) 
	elseif j = 2 then
		sql 	   = 'select campo'+string(j - 1)+', campo'+string(j)+', campo'+string(j + 1)+&
					  ', campo'+string(j + 2)    +', campo'+string(j + 3)+', campo'+string(j + 4)+&
					  ', campo'+string(j + 5)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 2) +' and correlativo <= '+string(i + 4) 
					  
		sql1 	   = 'select campo'+string(j - 1)+', campo'+string(j)+', campo'+string(j + 1)+&
					  ', campo'+string(j + 2)    +', campo'+string(j + 3)+', campo'+string(j + 4)+&
					  ', campo'+string(j + 5)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 2) +' and correlativo <= '+string(i + 4) 
	elseif j = 1 then
		sql 	   = 'select campo'+string(j)+', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)    +', campo'+string(j + 4)+', campo'+string(j + 5)+&
					  ', campo'+string(j + 6)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 2) +' and correlativo <= '+string(i + 4) 
					  
		sql1 	   = 'select campo'+string(j)+', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)    +', campo'+string(j + 4)+', campo'+string(j + 5)+&
					  ', campo'+string(j + 6)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 2) +' and correlativo <= '+string(i + 4) 
	end if
elseif i = 2 and j <= 4 then
	if j = 4 then
		sql 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
					  
		sql1 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
	elseif j = 3 then
		sql 	   = 'select campo'+string(j - 2)+', campo'+string(j - 1)+', campo'+string(j )+&
					  ', campo'+string(j + 1)    +', campo'+string(j + 2)+', campo'+string(j + 3)+&
					  ', campo'+string(j + 4)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
					  
		sql1 	   = 'select campo'+string(j - 2)+', campo'+string(j - 1)+', campo'+string(j )+&
					  ', campo'+string(j + 1)    +', campo'+string(j + 2)+', campo'+string(j + 3)+&
					  ', campo'+string(j + 4)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
	elseif j = 2 then
		sql 	   = 'select campo'+string(j - 1)+', campo'+string(j)+', campo'+string(j + 1)+&
					  ', campo'+string(j + 2)    +', campo'+string(j + 3)+', campo'+string(j + 4)+&
					  ', campo'+string(j + 5)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
					  
		sql1 	   = 'select campo'+string(j - 1)+', campo'+string(j)+', campo'+string(j + 1)+&
					  ', campo'+string(j + 2)    +', campo'+string(j + 3)+', campo'+string(j + 4)+&
					  ', campo'+string(j + 5)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
	elseif j = 1 then
		sql 	   = 'select campo'+string(j)+', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)    +', campo'+string(j + 4)+', campo'+string(j + 5)+&
					  ', campo'+string(j + 6)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
					  
		sql1 	   = 'select campo'+string(j)+', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)    +', campo'+string(j + 4)+', campo'+string(j + 5)+&
					  ', campo'+string(j + 6)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i - 1) +' and correlativo <= '+string(i + 5) 
				end if
elseif i = 1 and j <= 4 then
	if j = 4 then
		sql 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6) 
					  
		sql1 	   = 'select campo'+string(j - 3)+', campo'+string(j - 2)+', campo'+string(j - 1)+&
					  ', campo'+string(j)    +', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6) 
	elseif j = 3 then
		sql 	   = 'select campo'+string(j - 2)+', campo'+string(j - 1)+', campo'+string(j )+&
					  ', campo'+string(j + 1)    +', campo'+string(j + 2)+', campo'+string(j + 3)+&
					  ', campo'+string(j + 4)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6) 
					  
		sql1 	   = 'select campo'+string(j - 2)+', campo'+string(j - 1)+', campo'+string(j )+&
					  ', campo'+string(j + 1)    +', campo'+string(j + 2)+', campo'+string(j + 3)+&
					  ', campo'+string(j + 4)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6) 
	elseif j = 2 then
		sql 	   = 'select campo'+string(j - 1)+', campo'+string(j)+', campo'+string(j + 1)+&
					  ', campo'+string(j + 2)    +', campo'+string(j + 3)+', campo'+string(j + 4)+&
					  ', campo'+string(j + 5)+ ' from '+tabla+ " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6) 
					  
		sql1 	   = 'select campo'+string(j - 1)+', campo'+string(j)+', campo'+string(j + 1)+&
					  ', campo'+string(j + 2)    +', campo'+string(j + 3)+', campo'+string(j + 4)+&
					  ', campo'+string(j + 5)+ ' from '+tabla1+ " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6) 
	elseif j = 1 then
		sql 	   = 'select campo'+string(j)+', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)    +', campo'+string(j + 4)+', campo'+string(j + 5)+&
					  ', campo'+string(j + 6)+ ' from '+tabla + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6)
					  
		sql1 	   = 'select campo'+string(j)+', campo'+string(j + 1)+', campo'+string(j + 2)+&
					  ', campo'+string(j + 3)    +', campo'+string(j + 4)+', campo'+string(j + 5)+&
					  ', campo'+string(j + 6)+ ' from '+tabla1 + " where sector = '"+gs_sector+"' and cod_parque = "+ string(id_parque)+' and '+&
					  'correlativo >= '+string(i) +' and correlativo <= '+string(i + 6)
	end if
end if
end subroutine

on w_busqueda_grafica.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_busqueda_grafica.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;integer corr,i,j
string tipo,sql,tabla,sql1,tabla1,sep, nombre_parque
gf_centrar(w_busqueda_grafica)

id_parque	= integer(w_plano_sector_parque.st_parque.text)

i    			= integer(substr(1,1,Message.StringParm))
j    			= integer(substr(1,2,Message.StringParm)) - 2
corr 			= integer(substr(1,3,Message.StringParm))
tipo 			= substr(1,4,Message.StringParm)
sep  			= substr(1,5,Message.StringParm)

if tipo = '0' then
	dw_1.dataobject 	= 'dw_busqueda_grafica_tierra'
	tabla 					= 'plano_parque'
	tabla1 				= 'plano_parque_paint'
else
	dw_1.dataobject 	= 'dw_busqueda_grafica_const'
	tabla 					= 'plano_parque_const'
	tabla1 				= 'plano_parque_const_paint'
end if
wf_sql(i,j,sql,sql1,tabla,tabla1)

sql  						= sql  + ' order by correlativo asc'
sql1 						= sql1 + ' order by correlativo asc'
wf_insertar_dw(dw_1,sql,tipo,sep)
wf_insertar_dw_paint(dw_1,sql1,tipo)
dw_1.object.t_1.text 	= 'Sepultura '+sep+' (Sector:'+gs_sector+')'
SELECT "COD_PARQ"."NOMBRE" into :nombre_parque FROM "COD_PARQ"  WHERE "COD_PARQ"."CODIGO" = :id_parque  ;

dw_1.object.t_2.text	= '( '+nombre_parque+' )'
end event

type pb_2 from picturebutton within w_busqueda_grafica
integer x = 1888
integer y = 1228
integer width = 169
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "salir.bmp"
alignment htextalign = left!
end type

event clicked;close(w_busqueda_grafica)
end event

type pb_1 from picturebutton within w_busqueda_grafica
integer x = 1691
integer y = 1228
integer width = 169
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print.bmp"
alignment htextalign = left!
end type

event clicked;if dw_1.rowcount() > 0 then
	f_Print( dw_1 )
end if
end event

type dw_1 from datawindow within w_busqueda_grafica
integer x = 59
integer y = 32
integer width = 1998
integer height = 1160
integer taborder = 10
string title = "none"
string dataobject = "dw_busqueda_grafica_tierra"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

