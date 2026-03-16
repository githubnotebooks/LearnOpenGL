add_rules("mode.debug", "mode.release")
set_defaultmode("debug")

option("gl_version", function()
	set_default("4.5")
	set_showmenu(true)
	set_description("Specify OpenGL version")
end)

includes("scripts/xmake")
default_config()
default_depends()

includes("src")
