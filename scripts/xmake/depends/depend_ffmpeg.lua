function depend_ffmpeg()
    if is_plat("windows") then
        add_requires("ffmpeg", { configs = { toolchains = "msvc" } })
    else
        add_requires("ffmpeg")
    end
end
