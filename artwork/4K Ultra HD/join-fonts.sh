
mkdir joined

# montage %inpath%/font-header*.png -tile 56x4  -geometry +0+0  %outpath%/font-header.gif
# montage %inpath%/font-body*.png -tile 56x4  -geometry +0+0  %outpath%/font-body.gif
# montage %inpath%/font-tiny*.png -tile 56x4  -geometry +0+0  %outpath%/font-tiny.gif

# montage %inpath%/font-body*.png -tile 96x  -geometry +0+0  %outpath%/font-body.gif

# montage %inpath%/font-body*.png -tile 224x  -geometry +0+0  %outpath%/font-body.gif


montage output/font-body*.png -tile 10x10  -geometry +0+0  joined/font-body.png
