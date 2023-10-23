project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.nam}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/**.c",
		"src/**.h"
	}

	includedirs
	{
		"../GLAD/Include"
	}

	links
	{
		"GLAD",
	}

	filter "system:windows"
		systemversion "latest"
		defines {"_GLFW_WIN32"}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		symbols "Off"
		optimize "On"