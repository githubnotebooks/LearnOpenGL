function depend_sdl2()
    if is_nix_env() then
        add_requires("SDL2", { alias = "libsdl2" })
        add_requires("SDL2_image", { alias = "libsdl2_image" })
        add_requires("SDL2_gfx", { alias = "libsdl2_gfx" })
        add_requires("SDL2_net", { alias = "libsdl2_net" })
        add_requires("SDL2_mixer", { alias = "libsdl2_mixer" })
        add_requires("SDL2_ttf", { alias = "libsdl2_ttf" })
    elseif is_plat("windows") then
        add_requires("libsdl2", { configs = { toolchains = "msvc" } })
        add_requires("libsdl2_image", { configs = { toolchains = "msvc" } })
        add_requires("libsdl2_gfx", { configs = { toolchains = "msvc" } })
        add_requires("libsdl2_net", { configs = { toolchains = "msvc" } })
        add_requires("libsdl2_mixer", { configs = { toolchains = "msvc" } })
        add_requires("libsdl2_ttf", { configs = { toolchains = "msvc" } })
    else
        add_requires("libsdl2", "libsdl2_image", "libsdl2_gfx", "libsdl2_net", "libsdl2_mixer", "libsdl2_ttf")
    end
end
