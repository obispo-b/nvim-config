-- Load treesitter grammar for org
require('orgmode').setup_ts_grammar()

-- Setup orgmode
require('orgmode').setup({
  org_agenda_files = '~/Syncthing/orgfiles/**/*',
  org_default_notes_file = '~/Syncthing/orgfiles/refile.org',
})
