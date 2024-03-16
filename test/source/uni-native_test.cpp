#include <string>

#include "uni-native/uni-native.hpp"

auto main() -> int
{
  auto const exported = exported_class {};

  return std::string("uni-native") == exported.name() ? 0 : 1;
}
