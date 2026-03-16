function depend_cli11()
    if is_plat("windows") then
        add_requires("cli11", { configs = { toolchains = "msvc" } })
    else
        add_requires("cli11")
    end
end
