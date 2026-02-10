
mkdir joined

montage output/emp-tower*.png -tile 9x9  -geometry +0+0  joined/emp-tower.png
montage output/rocket-tower*.png -tile 9x9  -geometry +0+0  joined/rocket-tower.png
montage output/singularity*.png -tile 9x9  -geometry +0+0  joined/singularity.png
montage output/wormhole*.png -tile 9x9  -geometry +0+0  joined/wormhole.png
montage output/gun-tower*.png -tile 12x12  -geometry +0+0  joined/gun-tower.png
montage output/laser-tower*.png -tile 12x12  -geometry +0+0  joined/laser-tower.png
montage output/rockets*.png -tile 12x12  -geometry +0+0  joined/rockets.png
