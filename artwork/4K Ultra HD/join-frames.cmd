set inpath=output
set outpath=gif

montage %inpath%\ship*.png -tile 8x8 -background black -geometry +0+0  %outpath%\ship.gif
montage %inpath%\bullet*.png -tile 3x3  -geometry +0+0  %outpath%\bullet.gif
montage %inpath%\missle*.png -tile 6x6  -geometry +0+0  %outpath%\missle.gif
montage %inpath%\exp-big*.png -tile 8x8  -geometry +0+0  %outpath%\exp-big.gif
montage %inpath%\exp-med*.png -tile 7x7  -geometry +0+0  %outpath%\exp-med.gif
montage %inpath%\exp-small*.png -tile 5x5  -geometry +0+0  %outpath%\exp-small.gif


montage %inpath%\cube*.png -tile 4x4  -geometry +0+0  %outpath%\cube.gif
montage %inpath%\orb*.png -tile 4x4  -geometry +0+0  %outpath%\orb.gif
montage %inpath%\blob*.png -tile 6x6  -geometry +0+0  %outpath%\blob.gif
montage %inpath%\cruiser*.png -tile 6x6  -geometry +0+0  %outpath%\cruiser.gif
montage %inpath%\cship*.png -tile 6x6  -geometry +0+0  %outpath%\cship.gif

montage %inpath%\gyro*.png -tile 5x5  -geometry +0+0  %outpath%\gyro.gif

montage %inpath%\powerup*.png -tile 4x4  -geometry +0+0  %outpath%\powerup.gif

montage %inpath%\time-warp*.png -tile 8x8  -geometry +0+0  %outpath%\time-warp.gif

montage %inpath%\shield*.png -tile 1x1  -geometry +0+0  %outpath%\shield.gif

montage %inpath%\button*.png -tile 2x2  -geometry +0+0  %outpath%\button.gif
