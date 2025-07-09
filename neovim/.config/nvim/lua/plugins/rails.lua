return { 
    { 'tpope/vim-rails' },
    { 'tpope/vim-bundler' },
    { 'tpope/vim-haml' },
    { 'tpope/vim-endwise' },
    { 'tpope/vim-rake', dependencies = { 'tpope/vim-projectionist' } },
    { 'tpope/vim-dispatch' },
    { 'thoughtbot/vim-rspec', 
        config = function()
            -- Configure vim-rspec to use dispatch for async test running
            vim.g.rspec_command = "Dispatch rspec {spec}"
            vim.g.rspec_runner = "os_x_terminal"
        end
    },
    { 'tpope/vim-projectionist' },
}