function depend_cpptrace()
    if is_plat("windows") then
        add_requires("cpptrace", { configs = { toolchains = "msvc" } })
    else
        add_requires("cpptrace")
    end
end
