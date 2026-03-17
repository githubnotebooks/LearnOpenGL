task("dist-clean", function()
    set_category("action")
    set_menu({
        usage = "xmake dist-clean",
        description = "Remove intermediate build directories and cache files using custom rm tool.",
        options = {},
    })
    on_run(function()
        local targets = {
            ".xmake",
            ".cache",
            "build",
            "package/bin/*",
            "package/shaders/*",
        }
        local rm = nil
        if os.getenv("OS") and os.getenv("OS"):find("Windows") then
            rm = ".\\tools\\bin\\rm.exe"
        else
            rm = "./tools/bin/rm"
        end
        local use_custom_rm = os.exists(rm)
        for _, j in ipairs(targets) do
            if use_custom_rm then
                os.execv(rm, { j })
            else
                os.tryrm(j)
            end
        end
    end)
end)
