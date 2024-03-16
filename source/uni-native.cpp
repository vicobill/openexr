#include <string>

#include "uni-native/uni-native.hpp"

exported_class::exported_class()
    : m_name {"uni-native"}
{
}

auto exported_class::name() const -> char const*
{
  return m_name.c_str();
}
