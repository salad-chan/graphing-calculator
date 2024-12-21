workspace "MyRaylibProject"
    configurations { "Debug", "Release" }
    location "build"  -- Output for generated project files

project "Application"
    kind "ConsoleApp"
    language "C"
    targetdir "bin/%{cfg.buildcfg}"  -- Output binaries directory

    -- Include and Library directories for Raylib
    includedirs { "external/raylib/include" }
    libdirs { "external/raylib/lib" }

    -- Source files
    files { "src/**.c" }

    -- Link Raylib library
    links { "raylib" }

    -- Platform-specific settings for w64devkit (GCC on Windows)
    filter "system:windows"
        defines { "PLATFORM_DESKTOP" }
        links { "winmm", "gdi32", "opengl32" }  -- Windows dependencies for Raylib

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
