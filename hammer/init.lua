hs.loadSpoon('SpoonInstall')                 -- initialize the plugin

spoon.SpoonInstall:andUse("AppLauncher", {
  hotkeys = {
    c = "Google Chrome Dev",
    f = "Firefox Developer Edition",
    n = "Notes",
    k = "Kitty",
    z = "Zoom.us",
    i = "IntelliJ IDEA CE",
    m = "YouTube Music",
    s = "Safari",
  }
})
