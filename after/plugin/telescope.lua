local nmap = require('core.keymap').nmap
local builtin = require 'telescope.builtin'

-- Mappings
nmap('<leader>sw', builtin.grep_string, 'Search Word')
nmap('<leader>fd', builtin.diagnostics, 'Find Diagnostics')
nmap('<leader>fr', builtin.resume, 'Resume Last Search')
nmap('<leader>ff', builtin.find_files, 'Find Files')
nmap('<leader>fg', builtin.git_files, 'Find Git Files')
nmap('<leader>fw', builtin.live_grep, 'Live Grep')
nmap('<leader>fb', builtin.buffers, 'Find Buffers')
nmap('<leader>fh', builtin.help_tags, 'Find Help')

-- Config
require('telescope').setup {
  defaults = {
    sorting_strategy = 'descending',
    layout_config = {
      horizontal = { prompt_position = 'bottom', preview_width = 0.55 },
      vertical = { mirror = false },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  },
}
