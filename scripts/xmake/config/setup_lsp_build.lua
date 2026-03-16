includes("is_nix_env.lua")

local setup_lsp_for_nix_env = function()
	set_policy("build.c++.modules.std", false)
end

function setup_lsp_build()
	-- add_rules("plugin.compile_commands.autoupdate", { outputdir = "build" })
	-- set_toolchains("clang")
	after_load(function(target)
		target:set("kind", "object")
	end)

	if is_plat("windows") then
		set_runtimes("MD")
	elseif is_nix_env() then
		setup_lsp_for_nix_env()
	end
end
