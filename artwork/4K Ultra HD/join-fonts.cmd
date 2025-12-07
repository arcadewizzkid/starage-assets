set inpath=output
set outpath=gif

rem montage %inpath%\font-header*.png -tile 56x4  -geometry +0+0  %outpath%\font-header.gif
rem montage %inpath%\font-body*.png -tile 56x4  -geometry +0+0  %outpath%\font-body.gif
rem montage %inpath%\font-tiny*.png -tile 56x4  -geometry +0+0  %outpath%\font-tiny.gif

rem montage %inpath%\font-body*.png -tile 96x  -geometry +0+0  %outpath%\font-body.gif

rem montage %inpath%\font-body*.png -tile 224x  -geometry +0+0  %outpath%\font-body.gif


montage %inpath%\font-body*.png -tile 10x10  -geometry +0+0  %outpath%\font-body.gif
