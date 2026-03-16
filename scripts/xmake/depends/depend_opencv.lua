function depend_opencv()
    if is_plat("windows") then
        add_requires("opencv", { configs = { toolchains = "msvc" } })
    else
        add_requires("opencv")
    end
end
