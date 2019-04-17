@echo off
chcp 65001
setlocal

set args=0
for %%I in (%*) do (call :KEBABIFY %%I)
goto end

:KEBABIFY
set ofile=%~dnxp1
set oext=%~x1
set filepath=%~dp1
set fstring=%~n1
set dkfstring=%fstring: =-%
set dkfstring=%dkfstring:æ=ae%
set dkfstring=%dkfstring:ø=oe%
set dkfstring=%dkfstring:å=aa%
set dkfstring=%dkfstring:Æ=Ae%
set dkfstring=%dkfstring:Ø=Oe%
set dkfstring=%dkfstring:Å=Aa%
set newfilename=%dkfstring%%oext%
ren "%ofile%" "%newfilename%"
goto eof

:end
pause
endlocal

:eof
