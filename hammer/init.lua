hs.loadSpoon("SpoonInstall")
hs.loadSpoon("AppLauncher")

spoon.SpoonInstall:andUse("AppLauncher", {
	hotkeys = {
		c = "Google Chrome Dev",
		k = "Kitty",
		z = "Zoom.us",
		i = "IntelliJ IDEA",
		v = "Visual Studio Code - Insiders",
		s = "Slack",
		e = "Microsoft Edge",
		o = "Microsoft Outlook",
	},
})
