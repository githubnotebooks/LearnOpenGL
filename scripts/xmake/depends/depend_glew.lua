function depend_glew()
    if is_plat("windows") then
        add_requires("glew", { configs = { toolchains = "msvc" } })
    else
        add_requires("glew")
    end
end
