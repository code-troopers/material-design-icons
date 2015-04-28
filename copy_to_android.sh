#!/usr/bin/env bash

function copy(){
	#Directory of the res folder in the project
	#ex : PROJECT_RES="/Users/bcousin/workspace/Festroopers-Android/app/src/main/res"
	PROJECT_RES=$1
	#Filename of the wanted icon
	#ex : NAME="ic_phone_black_24dp"
	NAME=$2
	#Wanted resolution
	RES="drawable-hdpi\|drawable-mdpi\|drawable-xhdpi\|drawable-xxhdpi"

	echo "Finding $NAME file and copy to $PROJECT_RES"
	for src in $(find . | grep "$RES" | grep "$NAME")
	do 
	dest="$PROJECT_RES/${src#*\/*\/}"
	echo "Copy $src to $dest"
	cp $src $dest 
done
}

if [ $# != 2 ]
	then
		echo "Please fill the arguments"
	else
		copy $1 $2
fi

