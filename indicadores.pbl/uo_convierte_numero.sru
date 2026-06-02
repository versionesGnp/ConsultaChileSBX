forward
global type uo_convierte_numero from singlelineedit
end type
end forward

global type uo_convierte_numero from singlelineedit
integer width = 864
integer height = 92
integer taborder = 1
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
end type
global uo_convierte_numero uo_convierte_numero

type variables
string unidad[29],decenas[9],centenas[10],unidades_de_mil[10],decenas_de_mil[10],centenas_de_mil[10],&
		 millones[10],decenas_de_millon[10]
end variables

forward prototypes
public subroutine uo_llena_numeros ()
public function string uo_convertir_numero (string numero)
public function string uo_unidades (string numero)
public function string uo_centenas (string numero)
public function string uo_unidades_de_mil (string numero)
public function string uo_decenas_de_mil (string numero)
public function string uo_centenas_de_mil (string numero)
public function string uo_millon (string numero)
end prototypes

public subroutine uo_llena_numeros ();//--------------unidades---------------
unidad[1] = 'uno'
unidad[2] = 'dos'
unidad[3] = 'tres'
unidad[4] = 'cuatro'
unidad[5] = 'cinco'
unidad[6] = 'seis'
unidad[7] = 'siete'
unidad[8] = 'ocho'
unidad[9] = 'nueve'
unidad[10] = 'diez'
unidad[11] = 'once'
unidad[12] = 'doce'
unidad[13] = 'trece'
unidad[14] = 'catorce'
unidad[15] = 'quince'
unidad[16] = 'dieciseis'
unidad[17] = 'diecisiete'
unidad[18] = 'dieciocho'
unidad[19] = 'diecinueve'
unidad[20] = 'veinte'
unidad[21] = 'veintiuno'
unidad[22] = 'veintidos'
unidad[23] = 'veintitres'
unidad[24] = 'veinticuatro'
unidad[25] = 'veinticinco'
unidad[26] = 'veintisies'
unidad[27] = 'veintisiete'
unidad[28] = 'veintiocho'
unidad[29] = 'veintinueve'
//--------------decenas---------------
decenas[3] = 'treinta'
decenas[4] = 'cuarenta'
decenas[5] = 'cincuenta'
decenas[6] = 'sesenta'
decenas[7] = 'setenta'
decenas[8] = 'ochenta'
decenas[9] = 'noventa'
//--------------centenas---------------
centenas[1] = 'cien'
centenas[2] = 'doscientos'
centenas[3] = 'trescientos'
centenas[4] = 'cuatrocientos'
centenas[5] = 'quinientos'
centenas[6] = 'seiscientos'
centenas[7] = 'setecientos'
centenas[8] = 'ochocientos'
centenas[9] = 'novecientos'


end subroutine

public function string uo_convertir_numero (string numero);integer i
string  ret

uo_llena_numeros()
if long(numero) <= 99 then
	ret = uo_unidades(mid(numero,len(numero) - 2))
elseif long(numero) >= 100 and long(numero) <= 999 then
	ret = uo_centenas(mid(numero,len(numero) - 3))
elseif long(numero) >= 1000 and long(numero) <= 9999 then
	ret = uo_unidades_de_mil(mid(numero,len(numero) - 4))
elseif long(numero) >= 10000 and long(numero) <= 99999 then
	ret = uo_decenas_de_mil(mid(numero,len(numero) - 5))
elseif long(numero) >= 100000 and long(numero) <= 999999 then
	ret = uo_centenas_de_mil(mid(numero,len(numero) - 6))
elseif long(numero) >= 1000000 and long(numero) <= 9999999 then
	ret = uo_millon(mid(numero,len(numero) - 7))
end if
if mid(ret,len(ret) - 1) = ', ' then ret = mid(ret,1,len(ret) - 2) 
if isnull(ret) then ret=''
return ret
end function

public function string uo_unidades (string numero);integer i
string ret
if len (numero) <= 2 and long(numero) <= 29 then
	for i = 1 to 29 
		if long(numero) = i then return unidad[i]
	next
end if
if len (numero) = 2 and (long(numero) >= 30 and long(numero) <= 99 ) then
	for i = 3 to 9 
		if long(mid(numero,1,1)) = i then ret = decenas[i]
	next
	for i = 1 to 9 
		if long(mid(numero,2,1)) = i then ret = ret +' y '+unidad[i]
	next
	return ret
end if
if isnull(ret) then ret=''
return ''
end function

public function string uo_centenas (string numero);integer i
string ret

if len (numero) = 3 and (long(numero) >= 100 and long(numero) <= 999 ) then
	for i = 1 to 9
		if long(mid(numero,1,1)) = i then ret = centenas[i]
	next
	if long(numero) >= 101 and long(numero) <= 199 then ret = ret + 'to'
//	if long(mid(numero,1,1)) = 1 then ret = ret + 'to'
	if long(mid(numero,2)) >= 10 and long(mid(numero,2)) <= 29 then 
		for i = 10 to 29
			if long(mid(numero,2)) = i then 	ret = ret +' '+ unidad[i]
		next
	elseif ( long(mid(numero,2)) >= 1 and long(mid(numero,2)) <= 9 ) or long(mid(numero,2)) >= 30 then 
		for i = 3 to 9 
			if long(mid(numero,2,1)) = i then 
				ret = ret + ' '+decenas[i]
			end if
		next
		for i = 1 to 9 
			if long(mid(numero,3,1)) = i and long(mid(numero,2,1)) >= 1 then 
				ret = ret +' y '+unidad[i]
			elseif long(mid(numero,2,1)) = 0 and long(mid(numero,3,1)) = i then
				ret = ret +' '+unidad[i]
			end if 
		next
	end if
	if isnull(ret) then ret=''
	return ret
end if
end function

public function string uo_unidades_de_mil (string numero);integer i
string ret

ret = uo_unidades(mid(numero,len(numero) - 4,1))
if ret = '' or isnull(ret) or ret=' ' then ret=''
if ret = 'uno' then ret = 'un'
if ret <> '' then ret = ret +' mil '
if mid(numero,2,3) <> '000' then
	ret = ret +', '
	if long(mid(numero,2,1)) > 0 then
		ret = ret + uo_centenas(mid(numero,len(numero) - 2,3))
	else
		ret = ret + uo_unidades(mid(numero,len(numero) - 1,2))
	end if
end if
return ret
end function

public function string uo_decenas_de_mil (string numero);integer i
string  ret

if long(mid(numero,1,2)) >= 1 and long(mid(numero,1,2)) <= 99 then
	ret = uo_unidades(mid(numero,len(numero) - 5,2))
	ret = ret +' mil'
	if long(mid(numero,len(numero) - 2,1)) = 0 and long(mid(numero,len(numero) - 2)) > 0 then
		ret = ret +', '
		ret = ret + uo_unidades(mid(numero,len(numero) - 1))
	elseif long(mid(numero,len(numero) - 2,1)) > 0 then
		ret = ret +', '
		ret = ret + uo_centenas(mid(numero,len(numero) - 2))
	end if
	return ret
else
	return ''
end if
end function

public function string uo_centenas_de_mil (string numero);integer i,j
string  ret

ret = uo_centenas(mid(numero,1,3))
if mid(ret,len(ret) - 2) = 'uno' then ret = mid(ret,1,pos(ret,'uno',1) + 1)
ret = ret + ' mil'
if len(mid(numero,4)) <> 0 then
	ret = ret + ', '
	if long(mid(numero,4)) >= 100 then 
		ret = ret + uo_centenas(mid(numero,len(numero) - 2))
	elseif long(mid(numero,4)) < 100 then 
		ret = ret + uo_unidades(mid(numero,len(numero) - 1))
	end if
end if
if isnull(ret) or ret=' mil ' then ret=''
return ret
end function

public function string uo_millon (string numero);integer i
string  ret

ret = uo_unidades(mid(numero,len(numero) - 6,1))
if long(mid(numero,len(numero) - 6,1)) = 1 then
	ret = mid(ret,1,2) + ' millon,'
elseif long(mid(numero,len(numero) - 6,1)) > 1 then
	ret = ret + ' millones,'
end if
if long(mid(numero,2,1)) = 0 then
	ret = ret +' '+uo_decenas_de_mil(mid(numero,3))
end if
if long(mid(numero,2,1)) = 0 and long(mid(numero,3,1)) = 0 then
	ret = ret +' '+uo_unidades_de_mil(mid(numero,4))
end if
if long(mid(numero,2,1)) = 0 and long(mid(numero,3,1)) = 0 and long(mid(numero,4,1)) = 0  then
	if long(mid(numero,5)) > 0 then	
		ret = ret +' '+uo_centenas(mid(numero,5))
	end if
end if
if long(mid(numero,2,1)) > 0 then
	ret = ret +' '+uo_centenas_de_mil(mid(numero,2))
end if
//if long(mid(numero,2,1)) = 0 then
//	ret = ret +' '+uo_decenas_de_mil(mid(numero,3))
//elseif long(mid(numero,2,1)) = 0 and long(mid(numero,3,1)) = 0 then
//	ret = ret +' '+uo_unidades_de_mil(mid(numero,4))
//elseif long(mid(numero,2,1)) = 0 and long(mid(numero,3,1)) = 0 and long(mid(numero,4,1)) = 0  then
//	ret = ret +' '+uo_centenas(mid(numero,5))
//elseif long(mid(numero,2,1)) > 0 then
//	ret = ret +' '+uo_centenas_de_mil(mid(numero,2))
//end if

if isnull(ret) then ret=''
return ret
end function

event modified;string i
i = uo_convertir_numero(this.text)
this.text = i
end event

on uo_convierte_numero.create
end on

on uo_convierte_numero.destroy
end on

