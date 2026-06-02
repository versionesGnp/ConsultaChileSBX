//objectcomments Objeto Validad Rut, Single Line Edit
forward
global type u_sle_rut from singlelineedit
end type
end forward

global type u_sle_rut from singlelineedit
integer width = 535
integer height = 84
integer taborder = 1
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 13
borderstyle borderstyle = stylelowered!
event keydown pbm_keydown
event keyup pbm_keyup
event keypress pbm_custom01
end type
global u_sle_rut u_sle_rut

type variables
Boolean TeclaKeyBack=True, Maximo=True, Teclas_Validas=False
//String Rut=''

end variables

forward prototypes
public function string leer_rut ()
public function character leer_dv ()
public function integer valida_rut ()
public function integer rut_ok (string ci)
public subroutine reset_rut ()
public function string leer_rutdv ()
public function integer poner_rut (string ci)
public function string replaceall (string strtemp, string original, string reemplazo)
public function string entrega_dv (string rut)
public function long entrega_rut (string rut)
public function string entrega_rut_dv_str (string rut)
public function string entrega_rut_dv (string rut)
public function string limpiarrut (string rut_local)
public function string calcula_dv (string ci)
private function string formatrut (string rut_local)
end prototypes

on keydown;//teclas_validas= (keydown(Key0!) or keydown(Key1!) or keydown(Key2!) or keydown(Key3!) or &
//	keydown(Key4!) or keydown(Key5!) or keydown(Key6!) or keydown(Key7!) or &
//	keydown(Key8!) or keydown(Key9!) or keydown(KeyK!) or keydown(KeyEnter!) or keydown(KeyBack!) or &
//	keydown(KeyNumpad0!) or	keydown(KeyNumpad1!) or keydown(KeyNumpad2!) or keydown(KeyNumpad3!) or &
//	keydown(KeyNumpad4!) or keydown(KeyNumpad5!) or keydown(KeyNumpad6!) or keydown(KeyNumpad7!) or &
//	keydown(KeyNumpad8!) or keydown(KeyNumpad9!))
//
//TeclaKeyBack= keydown(KeyBack!)
//
//If Teclas_Validas then
//	If keydown(keyenter!)  then
//		If valida_rut()=-1 And Trim(this.text)<>'' then
//			messagebox("Valida Rut","Rut Ingresado Invalido")
//		End If
//		maximo= false
		this.postevent("KeyPress")
//		return
//	Elseif len(this.selectedtext())>0 Then
//		maximo= false
//		if this.selectedtext()=this.text  then
//			rut=''
//			maximo= true
//		end if
////		this.postevent("KeyPress")
////		return
//	Else
//		Maximo = True
////		this.postevent("KeyPress")
////		return
//	end if
//	this.postevent("KeyPress")
//	return
//else
////	this.text =''
//
//	this.text = Mid(this.text, 1, len(this.text) - 1)
//	this.SelectText(len(this.text)+1,0)
//
//	Return
//End If
end on

event keyup;//STRING RUT
//If Not Teclas_Validas  Then
//	this.text = Mid(this.text, 1, len(this.text) - 1)
//	this.SelectText(len(this.text)+1,0)
//End If
//
//if NOT(TeclaKeyBack) And Maximo then
//	if len(this.text)<3 then
//		rut= Upper(this.text)
//	elseif len(this.text)>3  then
//		rut= Upper(rut+mid(this.text,len(this.text),1))
//	end if
//end if
//
//if TeclaKeyBack then
//	rut = Mid(rut,1,len(rut)-1)
//	maximo= true
//end if
//
//if Not maximo  then
//	GOTO Continua
//End If
//
//// FORMATEA EL RUT CON PUNTOS Y DIGITO VERIFICADOR
////FormatRut()
////Deja el Cursor en Posicion de Insercion
//this.SelectText(len(this.text)+1,0)
//
//
//CONTINUA:
//
//
////No deja ingresar mas de 12 caracteres, activa flag maximo
//if len(this.text)>=12 then
//	maximo=false
//else
//	maximo=true
//end if
end event

event keypress;String Str, Str_Valido, Str_Ret
Integer I, Inicio, Largo_Str,Posicion,PosInvalida, Diferencia

Str_Valido = '1234567890K'
Str = Upper(This.Text)

//messagebox("Str",Str)
//messagebox("len(Str)",len(Str))

Str_Ret = LimpiarRut(Str)
Diferencia = Len(Str) - Len(Str_Ret)
Str = Str_Ret
Str_Ret = ''

Posicion = Position() - Diferencia

// VALIDA QUE SOLO SE INGRESEN UN RUT DE OCHO CARACTERES
If Len(Str)>9  Then
	CHOOSE CASE Posicion
	CASE 1 TO 2
		Str_Ret = Mid(Str,1,Posicion + 1) + Mid(Str,Posicion + 3)
	CASE 3 TO 6
		Str_Ret = Mid(Str,1,Posicion) + Mid(Str,Posicion + 2)
	CASE 7 TO 10
		Str_Ret = Mid(Str,1,Posicion - 1) + Mid(Str,Posicion + 1)
	CASE 11
		Str_Ret = Mid(Str,1,Posicion - 2) + Mid(Str,Posicion)
	CASE ELSE
		Str_Ret = Mid(Str,1,Posicion - 2) + Mid(Str,Posicion)
	END CHOOSE

	Str = FormatRut(Str_Ret)
	Diferencia = Len(Str) - Len(Str_Ret)
	Str_Ret = Str

	This.Text = Str_Ret
	SelectText(Posicion + Diferencia - 1,0)
	Return 
End If

Largo_Str = Len(Str)
Inicio = 1

PosInvalida = Pos(Str_Valido,Mid(Str,Posicion - 1,1),1)
IF PosInvalida=0  Then
	Str_Ret = Mid(Str,1,Posicion - 2) + Mid(Str,Posicion)
Else
	Str_Ret = Str
End IF

Str = Str_Ret

PosInvalida = Pos(Str_Valido,Mid(Str,Posicion - 2,1),1)
IF PosInvalida=0  Then
	Str_Ret = Mid(Str,1,Posicion - 3) + Mid(Str,Posicion - 1)
Else
	Str_Ret = Str
End IF

//messagebox("ANTES str_ret",str_ret)
//messagebox("len(Str_ret)",len(Str_ret))

Str = FormatRut(Str_Ret)
Diferencia = Len(Str) - Len(Str_Ret)
Str_Ret = Str

//messagebox("str_ret",str_ret)

This.Text = Str_Ret
SelectText(Posicion + Diferencia,0)



//No deja ingresar mas de 12 caracteres, activa flag maximo
//if len(this.text)>=13 then
//	this.text = Mid(this.text, 1, len(this.text) - 1)
//	this.SelectText(len(this.text)+1,0)
//	maximo=false
//else
//	maximo=true
//end if
//
//if NOT(TeclaKeyBack) And Maximo then
//	if len(this.text)<3 then
//		rut= Upper(this.text)
//	elseif len(this.text)>3  then
//		rut= Upper(rut+mid(this.text,len(this.text),1))
//	end if
//end if
//
//if TeclaKeyBack then
//	rut = Mid(rut,1,len(rut)-1)
//	maximo= true
//end if
//
// FORMATEA EL RUT CON PUNTOS Y DIGITO VERIFICADOR
//FormatRut()
//Deja el Cursor en Posicion de Insercion
//this.SelectText(len(this.text)+1,0)

//No deja ingresar mas de 12 caracteres, activa flag maximo
//if len(this.text)>=12 then
//	maximo=false
//	beep(1)
//else
//	maximo=true
//end if
end event

public function string leer_rut ();//FUNCION : Lee_Rut
// Parametros :  NINGUNO
// Funcionalidad : Devuelve el rut ingresado en le objeto, sin el 
//						 Digito Verificador, sin Guion, sin puntos
//						 Ej: '11979928'


// Declaracion de Variables
String Rut,RutDv

RutDv = LimpiarRut(Upper(This.Text))
Rut   = Mid(RutDv, 1, Len(RutDv) - 1)

If Trim(Rut)<>'' Then
	Return Right('000000000'+Rut,9)
Else
	return ''
End If
end function

public function character leer_dv ();//FUNCION : Leer_dv
// Parametros :  NINGUNO
// Funcionalidad : Devuelve el dv ingresado en le objeto


// Declaracion de Variables
String RutDv, Dv

RutDv = LimpiarRut(Upper(This.Text))
Dv = Right(RutDv, 1)

If Trim(Dv)<>'' Then
	return Dv
Else
	return ''
End If
end function

public function integer valida_rut ();//FUNCION: Valida_Rut
// Parametro :	RUT: Rut completo de tipo string con el 
//					digito verificador pero sin el guin ni los puntos
//					Ej: '119799287'

//Declaracion de Variables
Integer Suma,Factor,I
String Valid_dv,Rut

//Inicializa Variables para Validar el RUT
suma=0
factor=2
Rut = LimpiarRut(Upper(this.text))

//Verifica RUT Valido
FOR i= Len(rut) - 1 to 1 STEP -1
	If IsNumber(Mid(rut,i,1)) then
		suma= suma+ factor*integer(mid(rut,i,1))
		factor= factor+1
		if factor >7  then
			factor=2
		end if
	else
		return -1
	end if
NEXT

factor = 11-(suma - (11*int(suma/11)))

valid_dv= string(factor)
If factor=10  Then
	valid_dv='K'
elseif factor=11  then
	valid_dv='0'
end if

if valid_dv <> upper(mid(rut,len(rut),1))  then
	return -1
else
	return 0
end if
end function

public function integer rut_ok (string ci);//FUNCION: Valida_Rut
// Parametro :	RUT: Rut completo de tipo string con el 
//					digito verificador pero sin el guin ni los puntos
//					Ej: '119799287'

//Declaracion de Variables
Integer Suma,Factor,I
String Valid_dv

//Inicializa Variables para Validar el RUT
suma=0
factor=2


//Verifica RUT Valido

FOR i= len(ci)-1 to 1 STEP -1
	If IsNumber(Mid(ci,i,1)) then
		suma= suma+ factor*integer(mid(ci,i,1))
		factor= factor+1
		if factor >7  then
			factor=2
		end if
	else
		return -1
	end if
NEXT

factor = 11-(suma - (11*int(suma/11)))


valid_dv= string(factor)

If factor=10  Then
	valid_dv='K'
elseif factor=11  then
	valid_dv='0'
end if

if valid_dv <> upper(mid(ci,len(ci),1))  then
	return -1
else
	return 0
end if
end function

public subroutine reset_rut ();//Deja Inicializado todas las variables y el SLE para volver a leer un RUT

this.text= ''

end subroutine

public function string leer_rutdv ();Return leer_rut()+leer_dv()
end function

public function integer poner_rut (string ci);//FUNCION: Poner_Rut
// Parametro :	CI: Rut completo de tipo string con el 
//					digito verificador pero sin el guion ni los puntos
//					Ej: '119799287'


// FORMATEA EL RUT CON PUNTOS Y DIGITO VERIFICADOR
Ci = FormatRut(Ci)
this.text = Ci

//Deja el Cursor en Posicion de Insercion
this.SelectText(Len(Ci) + 1, 0)

Return 0


end function

public function string replaceall (string strtemp, string original, string reemplazo);Long PosIni=1

// ENCUENTRA LA PRIMERA OCURRENCIA
posini = Pos(strtemp, original, posini)

// SI EXISTE EL STRING ORIGINAL CONTINUA
DO WHILE posini > 0
	// REEMPLAZA EL STRING ORIGINAL POR EL REEMPLAZO
	strtemp = Replace(strtemp, posini, Len(original), reemplazo)

	// ENCUENTRA LA PROXIMA OCURRENCIA DEL STRING ORIGINAL
	posini = Pos(strtemp, original, posini+Len(reemplazo))
LOOP

Return StrTemp
end function

public function string entrega_dv (string rut);Return Leer_Dv()
end function

public function long entrega_rut (string rut);Return Long(Leer_Rut())
end function

public function string entrega_rut_dv_str (string rut);Return Leer_RutDv()
end function

public function string entrega_rut_dv (string rut);Return Leer_RutDv()
end function

public function string limpiarrut (string rut_local);Rut_Local = ReplaceAll(Rut_Local,'-','')
Rut_Local = ReplaceAll(Rut_Local,'.','')

Return Rut_Local


//if len(Rut_Local)<=2  then
//	Return Rut_Local
//elseif len(Rut_Local) = 3 then
//	Return mid(Rut_Local,1,1)+mid(Rut_Local,3,1)
//elseif len(Rut_Local) = 4 then
//	Return mid(Rut_Local,1,2)+mid(Rut_Local,4,1)
//elseif len(Rut_Local) = 5 then
//	Return mid(Rut_Local,1,3)+mid(Rut_Local,5,1)
//elseif len(Rut_Local) = 7 then
//	Return mid(Rut_Local,1,1)+mid(Rut_Local,3,3)+mid(Rut_Local,7,1)
//elseif len(Rut_Local) = 8 then
//	Return mid(Rut_Local,1,2)+mid(Rut_Local,4,3)+mid(Rut_Local,8,1)
//elseif len(Rut_Local) = 9 then
//	Return mid(Rut_Local,1,3)+mid(Rut_Local,5,3)+mid(Rut_Local,9,1)
//elseif len(Rut_Local) = 11 then
//	Return mid(Rut_Local,1,1)+mid(Rut_Local,3,3)+mid(Rut_Local,8,3)+mid(Rut_Local,11,1)
//elseif len(Rut_Local) = 12 then
//	Return mid(Rut_Local,1,2)+mid(Rut_Local,4,3)+mid(Rut_Local,8,3)+mid(Rut_Local,12,1)
//end if
end function

public function string calcula_dv (string ci);//FUNCION: Valida_Rut
// Parametro :	RUT: Rut completo de tipo string con el 
//					digito verificador pero sin el guin ni los puntos
//					Ej: '119799287'

//Declaracion de Variables
Integer Suma,Factor,I
String Valid_dv

//Inicializa Variables para Validar el RUT
suma=0
factor=2


//Verifica RUT Valido
ci = ci +' '
FOR i= len(ci)-1 to 1 STEP -1
	If IsNumber(Mid(ci,i,1)) then
		suma= suma+ factor*integer(mid(ci,i,1))
		factor= factor+1
		if factor >7  then
			factor=2
		end if
	else
		return ''
	end if
NEXT

factor = 11-(suma - (11*int(suma/11)))


valid_dv= string(factor)

If factor=10  Then
	valid_dv='K'
elseif factor=11  then
	valid_dv='0'
end if

return valid_dv

//if valid_dv <> upper(mid(ci,len(ci),1))  then
//	return -1
//else
//	return 0
//end if
end function

private function string formatrut (string rut_local);if len(Rut_Local)<=1  then
	Return  Rut_Local
elseif len(Rut_Local) = 2 then
	Return mid(Rut_Local,1,1)+"-"+mid(Rut_Local,2,1)
elseif len(Rut_Local) = 3 then
	Return mid(Rut_Local,1,2)+"-"+mid(Rut_Local,3,1)
elseif len(Rut_Local) = 4 then
	Return mid(Rut_Local,1,3)+"-"+mid(Rut_Local,4,1)
elseif len(Rut_Local) = 5 then
	Return mid(Rut_Local,1,1)+"."+mid(Rut_Local,2,3)+"-"+mid(Rut_Local,5,1)
elseif len(Rut_Local) = 6 then
	Return mid(Rut_Local,1,2)+"."+mid(Rut_Local,3,3)+"-"+mid(Rut_Local,6,1)
elseif len(Rut_Local) = 7 then
	Return mid(Rut_Local,1,3)+"."+mid(Rut_Local,4,3)+"-"+mid(Rut_Local,7,1)
elseif len(Rut_Local) = 8 then
	Return mid(Rut_Local,1,1)+"."+mid(Rut_Local,2,3)+"."+mid(Rut_Local,5,3)+"-"+mid(Rut_Local,8,1)
elseif len(Rut_Local) = 9 then
	Return mid(Rut_Local,1,2)+"."+mid(Rut_Local,3,3)+"."+mid(Rut_Local,6,3)+"-"+mid(Rut_Local,9,1)
else
	
	Return Rut_Local
end if
end function

on getfocus;this.selecttext(1,len(this.text))
maximo= False
end on

on losefocus;//If valida_rut()=-1  then
//	messagebox("Valida Rut","Rut Ingresado Invalido")
//End If
end on

on u_sle_rut.create
end on

on u_sle_rut.destroy
end on

