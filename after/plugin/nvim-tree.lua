vim.keymap.set('n', '<leader>e', "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
vim.keymap.set('n', '<leader>o', function()
    if vim.bo.filetype == "NvimTree" then
      vim.api.nvim_input "<C-w>l"
    else
      vim.cmd "NvimTreeFocus"
    end
  end,
  { desc = "Toggle Explorer Focus" }
)
