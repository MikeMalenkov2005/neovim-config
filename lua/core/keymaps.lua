vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs --
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- uuid generator --

local random = math.random;

local function uuid()
  local template = 'xxxxxxxx-xxxx-4xxx-vxxx-xxxxxxxxxxxx'
  return template:gsub('[xv]', function (c)
    return string.format('%x', (c == 'x') and random(0, 0xf) or random(8, 0xb))
  end)
end

vim.keymap.set('n', '<leader>ids', function ()
  return 'a\"' .. uuid() .. '\"<ESC>'
end, { expr = true })

vim.keymap.set('n', '<leader>idb', function ()
  local s = uuid();
  return 'a{ 0x' .. s:sub(1, 2) .. ', 0x' .. s:sub(3, 4) .. ', 0x' ..
    s:sub(5, 6) .. ', 0x' .. s:sub(7, 8) .. ', 0x' .. s:sub(10, 11) ..
    ', 0x' .. s:sub(12, 13) .. ', 0x' .. s:sub(15, 16) .. ', 0x' ..
    s:sub(17, 18) .. ', 0x' .. s:sub(20, 21) .. ', 0x' .. s:sub(22, 23) ..
    ', 0x' .. s:sub(25, 26) .. ', 0x' .. s:sub(27, 28) .. ', 0x' ..
    s:sub(29, 30) .. ', 0x' .. s:sub(31, 32) .. ', 0x' .. s:sub(33, 34) ..
    ', 0x' .. s:sub(35, 36) .. ' }<ESC>'
end, { expr = true })

-- file formats --

vim.cmd('set cc=80')

vim.cmd('au BufNewFile,BufRead *.h set ft=c')
vim.cmd('au BufNewFile,BufRead *.S set ft=gas')
vim.cmd('au BufNewFile,BufRead *.asm set ft=nasm')
vim.cmd('au BufNewFile,BufRead *.ASM set ft=fasm')
vim.cmd('au BufNewFile,BufRead *.inc set ft=nasm')
vim.cmd('au BufNewFile,BufRead *.INC set ft=fasm')

vim.cmd('au BufNewFile,BufRead *.z80 set ft=z80')
vim.cmd('au BufNewFile,BufRead *.z80 set syntax=z80')

vim.cmd('au BufNewFile,BufRead *.a65 set ft=a65')
vim.cmd('au BufNewFile,BufRead *.a65 set syntax=asm_ca65')

