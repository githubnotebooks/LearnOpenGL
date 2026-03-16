includes("config_win.lua")
includes("config_linux.lua")

function build_config()
    config_win()
    config_linux()
end
