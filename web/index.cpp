#include <emscripten/bind.h>
#include "base32.h"

using namespace emscripten;

std::string api_encode(std::string label) {
  const char* in = label.c_str();
  char buffer[64];
  base32_encode((uint8_t *)in, sizeof(in), buffer, sizeof(buffer), BASE32_ALPHABET_RFC4648);
  std::string labelEnc(buffer);
  return buffer;
}

EMSCRIPTEN_BINDINGS(my_module) {
    function("api_encode", &api_encode);
}
