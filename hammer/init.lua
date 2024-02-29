hs.loadSpoon("SpoonInstall")
hs.loadSpoon("AppLauncher")

spoon.SpoonInstall:andUse("AppLauncher", {
	hotkeys = {
		c = "Google Chrome Dev",
		k = "Kitty",
		z = "Zoom.us",
		i = "InteliJ IDEA",
		v = "Visual Studio Code - Insiders",
	},
})
