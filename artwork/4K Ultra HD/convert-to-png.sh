# rm -rf png
# mkdir png

cd joined

for f in *.png;
do
    n=$(basename "$f" .png);
	convert $n.png -fuzz 5% -transparent black ../png/$n.png
done
