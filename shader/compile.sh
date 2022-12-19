#!/usr/bin/bash
GLSLC=/bin/glslc
SOURCEPATH=$(pwd)
echo $SOURCEPATH
$GLSLC $SOURCEPATH/shader.vert -o $SOURCEPATH/vert.spv
$GLSLC $SOURCEPATH/shader.frag -o $SOURCEPATH/frag.spv
