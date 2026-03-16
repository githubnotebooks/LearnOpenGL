function depend_assimp()
    if is_plat("windows") then
        add_requires("assimp", { configs = { toolchains = "msvc" } })
    else
        add_requires("assimp")
    end
end
