require("kuta.statusline")
require("kuta.remap")
require("kuta.set")
require("kuta.lazy_init")
ColorTheme()
vim.opt.termguicolors = true
vim.g.osname = string.sub(string.lower(vim.loop.os_uname().sysname),0,3)
