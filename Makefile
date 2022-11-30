CFLAGS = -std=c++17 -O2 -g -W -Wall -I$(STB_INCLUDE_PATH) -I$(TINYOBJ_INCLUDE_PATH)
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi
BUILD_DIR = ./build
SRC_DIR = ./src
STB_INCLUDE_PATH = /usr/include/stb
TINYOBJ_INCLUDE_PATH = /usr/include/tinyloader
SRC = $(shell find $(SRC_DIR) -name *.cpp)
SHADER_DIR = ./shaders
SHADER_OBJ = frag.spv vert.spv

VulkanTest:clean $(SHADER_OBJ)
	mkdir -p $(BUILD_DIR)
	@g++ $(CFLAGS) -o $(BUILD_DIR)/VulkanTest $(SRC) $(LDFLAGS)
.PHONY: run clean

run: $(SHADER_DIR) 
	$(BUILD_DIR)/VulkanTest
%.spv:
	@glslc $(SHADER_DIR)/shader.$(subst .spv, ,$@) -o $@
clean:
	rm -rf $(BUILD_DIR) *.spv
