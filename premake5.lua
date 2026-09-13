project "GLFW"
    location "src"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "../include/GLFW/**.h",
        "internal.h","platform.h", "mappings.h",
         "context.c",  "init.c", "input.c",  "monitor.c", "platform.c"," vulkan.c" , "window.c",
          " egl_context.c", "osmesa_context.c", "null_platform.h", "null_joystick.h",
         "null_init.c" ,"null_monitor.c" ,"null_window.c" ,"null_joystick.c",
    }

   


    

    filter "system:windows"
        buildoption {"-std=c11","-lgdi32"}
        staticruntime "On"
        systemversion "latest"

        files
{
  "win32_time.h"," win32_thread.h" ,"win32_module.c",
                                "win32_time.c", "win32_thread.c",
  "win32_platform.h" ,"win32_joystick.h" ,"win32_init.c",
                                "win32_joystick.c" ,"win32_monitor.c", "win32_window.c",
                                "wgl_context.c",
}
defines
{
  "_GLFW_WIN32",
  "_CRT_SECURE_NO_WARNINGS"
}



    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
