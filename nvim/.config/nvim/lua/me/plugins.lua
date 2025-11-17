local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end


local packer_status, packer = pcall(require, 'packer')
if not packer_status then
    return
end


return packer.startup(function(use)
    -- plugins
    use 'wbthomason/packer.nvim'
    use 'kvrohit/rasmus.nvim'
    use "blazkowolf/gruber-darker.nvim"
    use "EdenEast/nightfox.nvim"
    use 'nvim-lua/plenary.nvim'
    use 'tpope/vim-fugitive'
    use 'sainnhe/gruvbox-material'
    use 'ThePrimeagen/harpoon'
    use 'rxi/json.lua'
    use 'NvChad/nvim-colorizer.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'mfussenegger/nvim-jdtls'
    use 'romgrk/barbar.nvim'
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use {
        "jay-babu/mason-nvim-dap.nvim",
    }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
    use 'mxsdev/nvim-dap-vscode-js'
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }


    use "rebelot/kanagawa.nvim"
    use 'windwp/nvim-ts-autotag'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-cmdline'
    use "L3MON4D3/LuaSnip"
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use 'ray-x/lsp_signature.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --[[ use { ]]
    --[[     "windwp/nvim-autopairs", ]]
    --[[     event = "InsertEnter", ]]
    --[[     config = function() ]]
    --[[         require("nvim-autopairs").setup {} ]]
    --[[     end ]]
    --[[ } ]]

    use {
        'numToStr/Comment.nvim',
    }

    use 'JoosepAlviste/nvim-ts-context-commentstring'
end)
