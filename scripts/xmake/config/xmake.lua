includes("setup_lsp_build.lua")
includes("build_config.lua")

function default_config()
    set_languages("c++23")
    set_warnings("all")

    if os.getenv("XMAKE_LSP_MODE") then
        setup_lsp_build()
    else
        build_config()
    end
end
