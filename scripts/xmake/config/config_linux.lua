function config_linux()
    if is_plat("linux") then
        if get_config("toolchain") == "clang" then
            set_policy("build.c++.modules.std", false)
            add_cxxflags("-stdlib=libstdc++", { force = true })
            add_ldflags("-stdlib=libstdc++", { force = true })
            add_ldflags("-lstdc++", { force = true })
            add_ldflags("-lgcc_s", { force = true })
        end
    end
end
