require("kuta.remap")
require("kuta.set")
require("kuta.sudoWrite")
require("kuta.lazy_init")
ColorTheme()
vim.g.osname = string.sub(string.lower(vim.loop.os_uname().sysname),0,3)
