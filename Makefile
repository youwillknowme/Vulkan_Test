TARGET_EXEC := Vulkan_Test

SHELL := /bin/bash
CFLAGS := -std=c++17 -O2
LDFLAGS := -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

BUILD_DIR := ./build
SRC_DIRS := ./src
SHADER_DIRS :=$(SRC_DIRS)/shader

SRC := $(shell find $(SRC_DIRS) -name '*.cpp')

makeComplete: compile
	@echo "making complete!!!"

compile: clean shaders
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CFLAGS) -g -o $(BUILD_DIR)/$(TARGET_EXEC) $(SRC) $(LDFLAGS)
	
run: $(BUILD_DIR)/$(TARGET_EXEC)
	$(BUILD_DIR)/$(TARGET_EXEC)
shaders:
	@source $(SHADER_DIRS)/clean.sh
	@echo "clean shader"
	@source $(SHADER_DIRS)/compile.sh
	@echo "compile shader"

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
