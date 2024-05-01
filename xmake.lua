target("TempLib")

    set_kind("static")

    add_rules("mode.debug", "mode.release")

    set_arch("x64")

    set_languages("cxx20")

    if is_mode("debug") then
        set_targetdir("Build/Debug")
        set_rundir("Build/Debug")
        set_objectdir("Build/objs/Debug")

    elseif is_mode("release") then
        set_targetdir("Build/Release")
        set_rundir("Build/Release")
        set_objectdir("Build/objs/Release")
    end

    add_files("Source/*.cpp")
    add_headerfiles("Include/*.h")
    add_includedirs("Include")

    if is_mode("debug") then
        add_defines("DEBUG")
        set_optimize("none")

    elseif is_mode("release") then
        add_defines("NDEBUG")
        set_optimize("faster")
    end

    if is_plat("windows") then
        add_defines("PLATFORM_WINDOWS")

    elseif is_plat("linux") then
        add_defines("PLATFORM_LINUX")

    elseif is_plat("macosx") then
        add_defines("PLATFORM_MACOSX")
    end

target("Test")

    set_kind("binary")

    add_rules("mode.debug", "mode.release")

    set_arch("x64")

    set_languages("cxx20")

    if is_mode("debug") then
        set_targetdir("Build/Debug")
        set_rundir("Build/Debug")
        set_objectdir("Build/objs/Debug")

    elseif is_mode("release") then
        set_targetdir("Build/Release")
        set_rundir("Build/Release")
        set_objectdir("Build/objs/Release")
    end

    set_targetdir("Build")
    set_rundir("Build")

    add_files("Test/*.cpp")
    add_includedirs("Include")

    if is_mode("debug") then
        add_defines("DEBUG")
        set_optimize("none")
    elseif is_mode("release") then
        add_defines("NDEBUG")
        set_optimize("faster")
    end

    add_deps("TempLib")