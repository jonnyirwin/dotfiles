return {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
        { 'github/copilot.vim' },
        { 'nvim-lua/plenary.nvim', branch = "master" },
    },
		lazy = false,
    opts = {
			vim.keymap.set('n', '<leader>cc', '<CMD>CopilotChatToggle<CR>', { desc = 'Copilot Chat' }),
			vim.keymap.set('n', '<leader>cm', '<CMD>CopilotChatModels<CR>', { desc = 'Copilot Chat Models' }),
			vim.keymap.set('n', '<leader>ce', '<CMD>Copilot enable<CR>', { desc = 'Copilot enable' }),
			vim.keymap.set('n', '<leader>cd', '<CMD>Copilot disable<CR>', { desc = 'Copilot disable' }),
			vim.keymap.set('n', '<leader>cs', '<CMD>Copilot setup<CR>', { desc = 'Copilot setup' }),
			vim.keymap.set('n', '<leader>c?', '<CMD>Copilot status<CR>', { desc = 'Copilot status' }),
    },
}
