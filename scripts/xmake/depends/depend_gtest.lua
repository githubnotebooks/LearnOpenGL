function depend_gtest()
    if is_plat("windows") then
        add_requires("gtest", { configs = { toolchains = "msvc" } })
    else
        add_requires("gtest")
    end
end
