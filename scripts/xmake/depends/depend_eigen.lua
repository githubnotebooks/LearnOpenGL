function depend_eigen()
    if is_plat("windows") then
        add_requires("eigen", { configs = { toolchains = "msvc" } })
    else
        add_requires("eigen")
    end
end
