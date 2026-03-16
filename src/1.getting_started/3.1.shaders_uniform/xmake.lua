target("1.3.1", function()
	set_kind("binary")
	add_packages("opengl", "glfw", "assimp", "stb")
	add_deps("utils")

	add_files("**.cpp")
	set_targetdir("$(projectdir)/package/bin")
end)
