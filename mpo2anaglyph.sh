
#!/bin/bash
LEFT=/tmp/$RANDOM
RIGHT=/tmp/$RANDOM
OUTPUT=`dirname $1`/`basename -s '.MPO' $1`_stereo.jpg

exiftool -trailer:all= $1 -o $RIGHT
SIZE=`identify $RIGHT | cut -f 3 -d ' '`

exiftool $1 -mpimage2 -b > $LEFT

composite -stereo $SIZE $LEFT $RIGHT $OUTPUT

rm $LEFT
rm $RIGHT
