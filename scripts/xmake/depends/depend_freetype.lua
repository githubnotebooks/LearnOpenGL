function depend_freetype()
    if is_plat("windows") then
        add_requires("freetype", { configs = { toolchains = "msvc" } })
    else
        add_requires("freetype")
    end
end
