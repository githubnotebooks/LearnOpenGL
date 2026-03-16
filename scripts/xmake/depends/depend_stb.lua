function depend_stb()
    if is_plat("windows") then
        add_requires("stb", { configs = { toolchains = "msvc" } })
    else
        add_requires("stb")
    end
end
