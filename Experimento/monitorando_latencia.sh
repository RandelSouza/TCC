#!/bin/bash

# $1 arquivo onde reside os resultados do experimento.
# medias.txt será o arquivo que conterá as médias.

media=0;
arquivo=$1;

cat medias.txt > /dev/null 2> /dev/null;

if [ $? -eq 1 ]
then
    sudo touch medias.txt;
    sudo chmod 777 medias.txt;
fi

cat $arquivo | grep rtt | cut -d" " -f4 | cut -d"/" -f2 > medias.txt;

while read avg_rtt
do
    media=$( echo "scale=3; "$media" + "$avg_rtt"" | bc );
done < medias.txt

echo $media;

echo "scale=3; "$media" / "$( sudo cat medias.txt | wc -l )"" | bc;
