
mkdir joined

montage output/ship*.png -tile 16x16 -background black -geometry +0+0  joined/ship.png
montage output/bullet*.png -tile 6x6  -geometry +0+0  joined/bullet.png
montage output/missle*.png -tile 12x12  -geometry +0+0  joined/missle.png
montage output/laser*.png -tile 6x6  -geometry +0+0  joined/laser.png
montage output/exp-big*.png -tile 16x16  -geometry +0+0  joined/exp-big.png
montage output/exp-med*.png -tile 14x14  -geometry +0+0  joined/exp-med.png
montage output/exp-small*.png -tile 10x10  -geometry +0+0  joined/exp-small.png


montage output/cube*.png -tile 8x8  -geometry +0+0  joined/cube.png
montage output/orb*.png -tile 8x8  -geometry +0+0  joined/orb.png
montage output/blob*.png -tile 12x12  -geometry +0+0  joined/blob.png
montage output/cruiser*.png -tile 12x12  -geometry +0+0  joined/cruiser.png
montage output/cship*.png -tile 12x12  -geometry +0+0  joined/cship.png

montage output/gyro*.png -tile 10x10  -geometry +0+0  joined/gyro.png
montage output/station*.png -tile 9x9  -geometry +0+0  joined/station.png

montage output/powerup*.png -tile 8x8  -geometry +0+0  joined/powerup.png

montage output/time-warp*.png -tile 16x16  -geometry +0+0  joined/time-warp.png

montage output/shield*.png -tile 1x1  -geometry +0+0  joined/shield.png

montage output/button*.png -tile 2x2  -geometry +0+0  joined/button.png
montage output/fire-button*.png -tile 2x2  -geometry +0+0  joined/fire-button.png

montage ../nebula*.png -tile 2x2  -geometry +0+0  joined/nebula.png
