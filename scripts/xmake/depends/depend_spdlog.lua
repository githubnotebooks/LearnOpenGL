function depend_spdlog()
    if is_plat("windows") then
        add_requires("spdlog", { configs = { toolchains = "msvc" } })
    else
        add_requires("spdlog")
    end
    if is_mode("debug") then
        add_defines("SPDLOG_ACTIVE_LEVEL=SPDLOG_LEVEL_TRACE")
    elseif is_mode("release") then
        add_defines("SPDLOG_ACTIVE_LEVEL=SPDLOG_LEVEL_OFF")
    end
end
