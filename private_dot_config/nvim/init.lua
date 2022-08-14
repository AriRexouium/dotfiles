------------------------------------------------------------------------------------------------------------------------
-- Options can be found at:
-- https://neovim.io/doc/user/options.html

-- More extentions can be found at:
-- https://github.com/rockerBOO/awesome-neovim

-- Configuration heavily dependent on:
-- https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/nvim/init.lua
-- https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim/
-- https://youtu.be/Kx-SDJwL01o
------------------------------------------------------------------------------------------------------------------------

-- Local ---------------------------------------------------------------------------------------------------------------
local fn = vim.fn
local o = vim.o

local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- Bootstrap Packer ----------------------------------------------------------------------------------------------------
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Configuration -------------------------------------------------------------------------------------------------------
-- Enable line numbers. --------------------------------------------------------
o.number = true
o.relativenumber = false
o.numberwidth = 2

-- Space handing thing. --------------------------------------------------------
o.expandtab = true
o.softtabstop = 2
o.shiftwidth = 2

-- Set White space characters. -------------------------------------------------
o.list = true
o.listchars = 'space:·,tab:→ ,trail:·,eol:¬,precedes:◂,extends:▸,nbsp:◇'
-- o.listchars = 'space:·,tab:» ,trail:·,eol:¤,precedes:⌐,extends:¬,conceal:▽,nbsp:◇'

-- Miscellaneous ---------------------------------------------------------------
o.clipboard = 'unnamedplus' -- Better clipboard.
o.colorcolumn = '40,80,120' -- Missed feature from Atom.
o.cursorline = true -- Highlight the current line.
o.mouse = 'a' -- Allow mouse control.
o.showmode = false -- Remove duplicate information from statusline.
o.scrolloff = 8 -- Minimum number of lines above and below the cursor.

-- Key Remappings ------------------------------------------------------------------------------------------------------
map('v', 'J', ':move \'>+1<CR>gv-gv')
map('v', 'K', ':move \'<-2<CR>gv-gv')

map('n', '<Space>e', '<Cmd>NvimTreeToggle<CR>')
map('n', '<Space>t', '<Cmd>ToggleTerm<CR>')
map('t', '<esc>', '<c-\\><c-n>')

-- Plugins -------------------------------------------------------------------------------------------------------------
return require('packer').startup(function(use)
  -- Atom One Dark theme. ------------------------------------------------------
  use {
    'navarasu/onedark.nvim',
    config = function() require('onedark').load() end
  }

  -- Bottom statusline. --------------------------------------------------------
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('lualine').setup{
      options = {
        theme = 'onedark'
      }
    } end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Better syntax highlighting. -----------------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
  }

  -- Tabbed buffers like in VSCode. --------------------------------------------
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    config = function () require('bufferline').setup() end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- `Ctrl + /` in VSCode. -----------------------------------------------------
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  -- File Manager --------------------------------------------------------------
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('nvim-tree').setup() end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Terminal Manager ----------------------------------------------------------
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
    config = function() require("toggleterm").setup() end
  }

  -- Autopair completion. ------------------------------------------------------
  use {
    'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup() end
  }

  -- Twilight ------------------------------------------------------------------
  use {
    'folke/twilight.nvim',
    config = function() require('twilight').setup{
      inactive = true
    } end
  }

  -- Packer Bootstrap ----------------------------------------------------------
  use 'wbthomason/packer.nvim'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
