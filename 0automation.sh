#!/bin/bash

# view http://IPADDR:18080/pvr to determine what videos are available

echo {00001..01207} | tr ' ' '\n' | xargs -I % sh -c 'echo  wget http://192.168.86.25:18080/pvr/41997/segs/%.ts; wget http://192.168.86.25:18080/pvr/42596/segs/%.ts'

echo {00001..01207} | sed -e 's/ /\.ts /g' | sed -e 's/$/\.ts/' |  xargs -I % sh -c 'cat % > 1combo.ts'

rm 0*.ts

ffmpeg -i 1combo.ts -bsf:a aac_adtstoasc -c copy "0FILENAME.mp4"
