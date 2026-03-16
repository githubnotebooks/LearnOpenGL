function depend_opengl()
    if is_plat("windows") then
        add_requires("opengl", { configs = { toolchains = "msvc" } })
    else
        add_requires("opengl")
    end
end
