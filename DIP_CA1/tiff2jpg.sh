for f in *.tiff
do
    echo "Converting $f"
    convert "$f"  "$(basename "$f" .tiff).jpg"
done
