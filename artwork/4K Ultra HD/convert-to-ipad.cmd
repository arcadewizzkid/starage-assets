set inpath=png
set outpath=ipad-png

xcopy %inpath%\*.png %outpath%\*.png
cd %outpath%
for %%i in (*.png) do ren %%i ipad-%%i
