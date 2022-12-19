TARGET_EXEC := Vulkan_Test

SHELL := /bin/bash
STB_INCLUDE_PATH = /home/xdx/stb

CFLAGS := -std=c++17 -O2 -I$(STB_INCLUDE_PATH)
LDFLAGS := -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

BUILD_DIR := ./build
SRC_DIRS := ./src

SHADER_DIRS := ./shader

SRC := $(shell find $(SRC_DIRS) -name '*.cpp')

makeComplete: todocompile
	@echo "making complete!!!"

todocompile: clean shaders
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CFLAGS) -g -o $(BUILD_DIR)/$(TARGET_EXEC) $(SRC) $(LDFLAGS)
	
run: $(BUILD_DIR)/$(TARGET_EXEC)
	$(BUILD_DIR)/$(TARGET_EXEC)
shaders:
	@cd $(SHADER_DIRS) && source clean.sh &&echo "compile shader" && source compile.sh

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

