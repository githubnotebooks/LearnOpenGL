function depend_gbenchmark()
    if is_plat("windows") then
        add_requires("benchmark", { configs = { toolchains = "msvc" } })
    else
        add_requires("benchmark")
    end
end
