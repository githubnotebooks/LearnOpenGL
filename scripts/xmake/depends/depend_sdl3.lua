function depend_sdl3()
    if is_nix_env() then
        add_requires("sdl3", { alias = "libsdl3" })
        add_requires("SDL3_image", { alias = "libsdl3_image" })
        add_requires("SDL3_ttf", { alias = "libsdl3_ttf" })
    elseif is_plat("windows") then
        add_requires("libsdl3", { configs = { toolchains = "msvc" } })
        add_requires("libsdl3_image", { configs = { toolchains = "msvc" } })
        add_requires("libsdl3_ttf", { configs = { toolchains = "msvc" } })
    else
        add_requires("libsdl3", "libsdl3_image", "libsdl3_ttf")
    end
end
