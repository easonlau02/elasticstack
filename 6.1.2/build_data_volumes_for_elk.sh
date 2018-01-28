#!/bin/bash

fullPath=$0
relatePath=${fullPath%/*}
echo RelatePath : $relatePath
file=$relatePath/Dockerfile.data-volumes

echo Date: `/usr/bin/date`
echo Starting to build data config volume for elk....
echo Docker file : $file
echo Docker build context directory :$relatePath

echo =================================================
if [ -e $file ]
then
	echo Found docker file : $file
        docker build -t eason02/elk-data-volume:6.1.2 -f $file $relatePath
else
	echo Could not find docker file : $file
fi
echo =================================================
echo Date: `/usr/bin/date`
