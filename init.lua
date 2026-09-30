vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

require("config.settings")
require("config.maps") -- key bindings
require("config.lazy") -- plugin manager
