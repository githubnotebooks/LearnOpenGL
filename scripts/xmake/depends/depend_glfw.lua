function depend_glfw()
    if is_plat("windows") then
        add_requires("glfw", { configs = { toolchains = "msvc" } })
    else
        add_requires("glfw")
    end
end
