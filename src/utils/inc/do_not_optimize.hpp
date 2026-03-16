#pragma once

namespace utils {

template <typename Tp> inline void DoNotOptimize(Tp &value) {
#if defined(_MSC_VER)
  // MSVC: use volatile pointer to prevent optimization
  const auto *volatile p = &value;
  (void)*p;
#elif defined(__clang__)
  asm volatile("" : "+r,m"(value) : : "memory");
#else
  asm volatile("" : "+m,r"(value) : : "memory");
#endif
}

} // namespace utils
