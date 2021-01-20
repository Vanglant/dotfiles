local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use { 'editorconfig/editorconfig-vim' }
    use { 'glepnir/galaxyline.nvim', branch = 'main' }
    use { 'jiangmiao/auto-pairs' }
    use { 'godlygeek/tabular' }
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/completion-nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use {  
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'npxbr/gruvbox.nvim', requires = 'tjdevries/colorbuddy.nvim' }
    use { 'nvim-treesitter/nvim-treesitter' }
end)
