includes("depend_assimp.lua")
includes("depend_boost.lua")
includes("depend_cli11.lua")
includes("depend_cpptrace.lua")
includes("depend_eigen.lua")
includes("depend_ffmpeg.lua")
includes("depend_fmt.lua")
includes("depend_freetype.lua")
includes("depend_gbenchmark.lua")
includes("depend_glew.lua")
includes("depend_glfw.lua")
includes("depend_glm.lua")
includes("depend_gtest.lua")
includes("depend_opencv.lua")
includes("depend_opengl.lua")
includes("depend_sdl2.lua")
includes("depend_sdl3.lua")
includes("depend_spdlog.lua")
includes("depend_stb.lua")

function default_depends()
    depend_cli11();
    depend_cpptrace();
    depend_fmt();
    depend_gbenchmark();
    depend_gtest();
    depend_spdlog();
end
