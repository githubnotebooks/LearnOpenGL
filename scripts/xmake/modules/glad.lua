function detect_or_download_glad(glad_dir, gl_version)
    import("lib.detect.find_program")
    local python = find_program("python")
    if not python then
        raise("python not found")
    end

    local ok = os.execv(python, {
        "-c",
        "import glad"
    }, { stdout = false, stderr = false })

    if ok ~= 0 then
        raise("glad python module not found")
    end

    if not os.isdir(glad_dir) then
        os.mkdir(glad_dir)
    end
    if not os.isfile(glad_dir .. "/src/glad.c") then
        os.exec("glad --profile core --api gl=%s --generator c --out-path %s", gl_version, glad_dir)
    end

    local gitignore_path = path.join(glad_dir, ".gitignore")
    if not os.isfile(gitignore_path) then
        io.writefile(gitignore_path, "*\n")
    end
end
