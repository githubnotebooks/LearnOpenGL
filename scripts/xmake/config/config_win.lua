function config_win()
    if is_plat("windows") then
        set_runtimes("MD")
        add_defines("_CRT_SECURE_NO_WARNINGS")
        add_links("User32", "Shell32")
        set_exceptions("cxx")
        set_encodings("utf-8")
    end
end
