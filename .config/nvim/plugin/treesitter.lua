vim.pack.add({"https://github.com/OrfeasANikolaou/nvim-treesitter"})

require('nvim-treesitter').setup({
  auto_install = false

})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
