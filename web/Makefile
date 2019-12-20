PROJECT=index
BUILD_DIR=build
WASM_DIR=$(BUILD_DIR)/wasm
ASMJS_DIR=$(BUILD_DIR)/asmjs

all: clean init build disasm serve

init:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(WASM_DIR)
	mkdir -p $(ASMJS_DIR)

build:
	em++ --bind $(PROJECT).cpp base32.c -s WASM=1 -O3 -o $(WASM_DIR)/$(PROJECT).html
	em++ --bind $(PROJECT).cpp base32.c -s WASM=0 -O3 -o $(ASMJS_DIR)/$(PROJECT).html

clean:
	rm -rf $(BUILD_DIR)/*

disasm:
	wasm-dis $(WASM_DIR)/$(PROJECT).wasm -o $(WASM_DIR)/$(PROJECT).wast

serve:
	emrun --port 8080 .

.PHONY: all build clean init disasm serve
