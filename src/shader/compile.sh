#!/usr/bin/bash
GLSLC=/home/xdx/vulkan/1.2.162.1/x86_64/bin/glslc
SOURCEPATH=/home/xdx/vulkan/1.2.162.1/Vulkan_test/src/shader

$GLSLC $SOURCEPATH/shader.vert -o $SOURCEPATH/vert.spv
$GLSLC $SOURCEPATH/shader.frag -o $SOURCEPATH/frag.spv
