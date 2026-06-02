@ECHO OFF
echo Actualizando Aplicacion Consulta ...
echo No cierre esta ventana y espere que termine para ejecutar Consulta
cd c:\mod_cp\consulta
svn cleanup
svn up --username cargaremota --password estado.,360 -q --non-interactive