function depend_fmt()
    if is_plat("windows") then
        add_requires("fmt", { configs = { toolchains = "msvc" } })
    else
        add_requires("fmt")
    end
end
