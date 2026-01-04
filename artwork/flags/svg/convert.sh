for file in *.svg; do
  sips -s format png -o "${file%.*}.png" "$file"
done

