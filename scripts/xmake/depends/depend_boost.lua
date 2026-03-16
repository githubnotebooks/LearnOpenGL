function depend_boost()
    if is_plat("windows") then
        add_requires("boost", {
            system = false,
            configs = {
                shared = true,
                cmake = true,
            }
        })
    elseif is_nix_env() then
        add_requires("boost", {
            system = true,
            configs = {
                shared = true,
                cmake = false,
            }
        })
    else
        add_requires("boost", {
            system = true,
            configs = {
                shared = true,
                cmake = false,
            }
        })
    end
end
