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
    use { 'jiangmiao/auto-pairs' }
    use { 'godlygeek/tabular' }
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/completion-nvim' }
    use {  
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
     use {
    'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function() require'eviline' end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use { 'npxbr/gruvbox.nvim', requires = 'tjdevries/colorbuddy.nvim' }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'mhinz/vim-startify' }
end)
