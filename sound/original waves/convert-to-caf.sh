chmod 777 *
echo Converting WAVs to CAFs...
afconvert -d LEI16@44100 -f 'caff' blip.wav blip.caf
afconvert -d ima4 -f 'caff' exp1.wav exp1.caf
afconvert -d ima4 -f 'caff' exp2.wav exp2.caf
afconvert -d ima4 -f 'caff' exp3.wav exp3.caf
afconvert -d ima4 -f 'caff' extra.wav extra.caf
afconvert -d ima4 -f 'caff' laser1.wav laser1.caf
afconvert -d ima4 -f 'caff' laser2.wav laser2.caf
afconvert -d ima4 -f 'caff' powerup.wav powerup.caf
afconvert -d ima4 -f 'caff' smart.wav smart.caf
afconvert -d ima4 -f 'caff' warp-a.wav warp-a.caf
afconvert -d ima4 -f 'caff' warp-b.wav warp-b.caf

afconvert -d aac -f 'caff' andromeda.wav andromeda.caf
afconvert -d aac -f 'caff' quantum-lite.wav quantum-lite.caf

echo Copying CAFs to Resource directory...
cp *.caf ../../Resources/music/
echo Done
