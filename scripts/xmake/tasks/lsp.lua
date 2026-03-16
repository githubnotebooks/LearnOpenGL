task("lsp", function()
	set_category("action")
	set_menu({
		usage = "xmake lsp -- [arguments]",
		description = "Generate LSP configuration (compile_commands.json) for IDE/language server support",
		options = {
			{ nil, "args", "vs", nil, "Build arguments and targets to pass to xmake build" },
		},
	})
	on_run(function()
		-- Backup current .xmake if exists
		local xmake_dir = ".xmake"
		local backup_dir = ".xmake.backup"
		os.tryrm(backup_dir)
		if os.isdir(xmake_dir) then
			os.mv(xmake_dir, backup_dir)
		end

		-- Set LSP mode and configure
		os.setenv("XMAKE_LSP_MODE", "1")
		os.exec("xmake f -o build/.lsp_build")
		import("core.base.option")
		local args = option.get("args")
		local args_str = ""
		if args and type(args) == "table" and #args > 0 then
			args_str = table.concat(args, " ")
		elseif args and type(args) == "string" and args ~= "" then
			args_str = args
		end
		-- os.exec("xmake build " .. args_str)
		os.exec("xmake project -k compile_commands build")

		-- Clean LSP artifacts and restore original config
		os.tryrm(xmake_dir)
		if os.isdir(backup_dir) then
			os.mv(backup_dir, xmake_dir)
		end

		-- Clear environment variable
		os.setenv("XMAKE_LSP_MODE", nil)

		print("LSP configuration complete.")
	end)
end)
