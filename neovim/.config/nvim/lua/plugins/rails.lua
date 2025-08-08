return { 
    {
        'tpope/vim-rails',
        config = function()
            -- Rails convenience mappings to match documentation
            vim.keymap.set('n', '<leader>rv', ':R<CR>', { desc = 'Rails: related (controller/view/model/etc.)' })
            vim.keymap.set('n', '<leader>rm', ':Rmodel<CR>', { desc = 'Rails: jump to model' })
            vim.keymap.set('n', '<leader>rg', ':Rmigration<CR>', { desc = 'Rails: jump to migration' })
            vim.keymap.set('n', '<leader>rV', ':Rails routes<CR>', { desc = 'Rails: routes' })
            vim.keymap.set('n', '<leader>rS', ':edit db/schema.rb<CR>', { desc = 'Rails: schema.rb' })
        end,
    },
    { 'tpope/vim-bundler' },
    { 'tpope/vim-haml' },
    { 'tpope/vim-endwise' },
    { 'tpope/vim-rake', dependencies = { 'tpope/vim-projectionist' } },
    { 'tpope/vim-dispatch' },
    { 'thoughtbot/vim-rspec', 
        config = function()
            -- Configure vim-rspec to use dispatch for async test running
            vim.g.rspec_command = "Dispatch rspec {spec}"
        end
    },
    { 'tpope/vim-projectionist' },
}