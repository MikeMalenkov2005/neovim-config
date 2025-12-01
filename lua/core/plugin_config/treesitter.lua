require("nvim-treesitter.configs").setup {
  require_installed = { "c", "lua", "rust", "ruby", "vim", "python", "asm", "nasm" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}
