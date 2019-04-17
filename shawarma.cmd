@echo off
chcp 65001
setlocal

set ofile=%~nxp1
set oext=%~x1
set fstring=%~n1
set dkfstring=%fstring:ø=oe%
set dkfstring=%dkfstring:Æ=Ae%
set dkfstring=%dkfstring:Ø=Oe%
set dkfstring=%dkfstring:Å=Aa%

echo %dkfstring%

Powershell -NoProfile -Command ^
    $env:dkfstring = $env:dkfstring.replace(' ', '-'); ^
    $env:dkfstring = $env:dkfstring.replace('æ', 'ae'); ^
    $env:dkfstring = $env:dkfstring.replace('å', 'aa'); ^
    $env:dkfstring = $env:dkfstring + $env:oext; ^
    Rename-Item -Path $env:ofile -NewName $env:dkfstring; ^

echo %dkfstring%
pause
endlocal