mkdir -p converted
for f in *.wav; do sox "$f" "converted/${f%%.wav}.mp3"; done

