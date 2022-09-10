 echo off

 set m1=%1
 cd %m1%
 %m1%

 mkdir  %m1%\vedmesky.i21
 mkdir %m1%\vedmesky.i21\vdi1
 mkdir %m1%\vedmesky.i21\vdi2
 mkdir %m1%\vedmesky.i21\vdi3

 cd %m1%\vedmesky.i21
 echo Vvedite fail
 copy con %m1%\vedmesky.i21\vdi1\denis.txt

 if not exist %m1%\vedmesky.i21\vdi1\denis.txt goto error
 copy %m1%\vedmesky.i21\vdi1\denis.txt %m1%\vedmesky.i21\vdi2\denis.txt
 cd %m1%\vedmesky.i21\vdi2

 if not exist %m1%\vedmesky.i21\vdi2\denis.txt goto error
 ren denis.txt sined.txt
 cd..

 echo Kakoe imya ispolsovat
 choice /c:12
 if errorlevel 2 goto 2oe
 copy vdi1\denis.txt+vdi2\sined.txt vdi3\denis.doc
 copy %m1%\vedmesky.i21\vdi3\denis.doc %m1%\vedmesky.i21\denis.doc
 type denis.doc
 goto end



:2oe
copy vdi1\denis.txt+vdi2\denis.txt vdi3\sined.doc
copy %m1%\vedmesky.i21\vdi3\sined.doc %m1%\vedmesky.i21\sined.doc
type sined.doc
goto end


:error
echo Takogo fayla net!!!
goto end

:end
exit