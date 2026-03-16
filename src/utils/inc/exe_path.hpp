#pragma once

#include <filesystem>
#include <stdexcept>
#include <string>

#if defined(_WIN32)
#include <windows.h>
#elif defined(__linux__)
#include <limits.h>
#include <unistd.h>
#elif defined(__APPLE__)
#include <limits.h>
#include <mach-o/dyld.h>
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__DragonFly__)
#include <limits.h>
#include <sys/sysctl.h>
#include <sys/types.h>
#include <unistd.h>
#elif defined(__OpenBSD__)
// no specific headers needed
#endif

namespace utils
{

inline std::filesystem::path exe_path(const char *argv0 = nullptr)
{
#if defined(_WIN32)
    char buffer[MAX_PATH];
    DWORD len = GetModuleFileNameA(NULL, buffer, MAX_PATH);
    if (len > 0 && len < MAX_PATH)
    {
        return std::filesystem::path(buffer);
    }

#elif defined(__linux__)
    char buffer[PATH_MAX];
    ssize_t len = readlink("/proc/self/exe", buffer, sizeof(buffer) - 1);
    if (len != -1)
    {
        buffer[len] = '\0';
        return std::filesystem::path(buffer);
    }

#elif defined(__APPLE__)
    char buffer[PATH_MAX];
    uint32_t size = sizeof(buffer);
    if (_NSGetExecutablePath(buffer, &size) == 0)
    {
        return std::filesystem::path(buffer);
    }

#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__DragonFly__)
    char buffer[PATH_MAX];
    size_t size = sizeof(buffer);
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PATHNAME, -1};
    if (sysctl(mib, 4, buffer, &size, NULL, 0) == 0 && size > 0)
    {
        return std::filesystem::path(buffer);
    }

#elif defined(__OpenBSD__)
    // No platform-specific API available
    // fallback to argv[0] below

#endif

    // fallback: try canonical(argv[0]) if platform method failed
    if (argv0 && argv0[0] != '\0')
    {
        return std::filesystem::canonical(argv0);
    }

    throw std::runtime_error("Failed to determine executable path");
}

} // namespace utils
