function depend_glm()
    if is_plat("windows") then
        add_requires("glm", { configs = { toolchains = "msvc" } })
    else
        add_requires("glm")
    end
end
