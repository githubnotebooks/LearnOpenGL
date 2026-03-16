target("1.4.3", function()
	set_kind("binary")
	add_packages("opengl", "glfw", "assimp", "stb")
	add_deps("utils")

	set_targetdir("$(projectdir)/package/bin")

	on_config(function(target)
		import("core.base.option")
		import("lib.detect.find_tool")
		local sourcedir = target:scriptdir()
		local main_file = path.join(sourcedir, "tmp", "main.cpp")

		if not os.exists(main_file) then
			local source_file = path.join(sourcedir, "../4.2.textures_combined/textures_combined.cpp")
			local content = io.readfile(source_file)
			if not content then
				raise("Unabled to read source file: " .. source_file)
			end

			content = content:gsub('"4.2.texture.fs"', '"textures_exercise1.fs"')

			os.mkdir("$(scriptdir)/tmp")
			io.writefile(main_file, content)
			local git_ignore = path.join(sourcedir, "tmp", ".gitignore")
			io.writefile(git_ignore, "*")
		end

		target:add("files", main_file)
	end)
	after_build(function(target)
		local projectdir = os.projectdir()
		local sourcedir = target:scriptdir()
		local target_dir = path.join(projectdir, "package/shaders")
		os.mkdir(target_dir)
		os.cp(path.join(sourcedir, "*.vs"), target_dir)
		os.cp(path.join(sourcedir, "*.fs"), target_dir)
	end)
	after_clean(function(target)
		os.tryrm("$(scriptdir)/tmp")
		os.tryrm("$(projectdir)/package/shaders/textures_exercise1.fs")
	end)
end)
