#pragma once

#include "exe_path.hpp"

namespace utils
{

class FileSystem
{
  public:
    static std::filesystem::path root()
    {
        return exe_path().parent_path() / "..";
    }

    static std::filesystem::path getPath(const std::filesystem::path &p)
    {
        return root() / p;
    }
};

} // namespace utils
