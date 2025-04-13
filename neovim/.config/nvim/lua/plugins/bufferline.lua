-- Barbar buffer tabs

return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- Enables/disable clickable tabs
    clickable = true,
    -- Hide inactive buffers and file extensions
    hide = {extensions = true, inactive = false},
    -- Disable highlighting alternate buffers
    highlight_alternate = false,
    -- Disable highlighting file icons in inactive buffers
    highlight_inactive_file_icons = false,
    -- Enable highlighting visible buffers
    highlight_visible = true,
    icons = {
      -- Configure the base icons on the bufferline
      buffer_index = false,
      buffer_number = false,
      button = '',
      -- Enables / disables diagnostic symbols
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
        [vim.diagnostic.severity.WARN] = {enabled = true, icon = ' '},
        [vim.diagnostic.severity.INFO] = {enabled = true, icon = ' '},
        [vim.diagnostic.severity.HINT] = {enabled = true, icon = ' '},
      },
      filetype = {
        -- Sets the icon's highlight group.
        -- If false, will use nvim-web-devicons colors
        custom_colors = false,
        -- Requires `nvim-web-devicons` if `true`
        enabled = true,
      },
      separator = {left = '▎', right = ''},
      -- Configure the icons on the bufferline when modified or pinned.
      -- Supports all the base icon options.
      modified = {button = '●'},
      pinned = {button = '', filename = true},
      -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
      preset = 'default',
      -- Configure the icons on the bufferline based on the visibility of a buffer.
      -- Supports all the base icon options, plus `modified` and `pinned`.
      alternate = {filetype = {enabled = false}},
      current = {buffer_index = true},
      inactive = {button = '×'},
      visible = {modified = {buffer_number = false}},
    },
    -- If true, new buffers will be inserted at the start/end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = false,
    insert_at_start = false,
    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,
    -- Sets the minimum padding width with which to surround each tab
    minimum_padding = 1,
    -- Sets the maximum buffer name length.
    maximum_length = 30,
    -- Sets the minimum buffer name length.
    minimum_length = 0,
    -- If set, the letters for each buffer in buffer-pick mode will be
    -- assigned based on their name. Otherwise or in case all letters are
    -- already assigned, the behavior is to assign letters in order of
    -- usability (see order below)
    semantic_letters = true,
    -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
      -- Use the default values: ['nvim-tree', 'neo-tree', 'Outline']
      NvimTree = {text = 'File Explorer'},
      undotree = {text = 'Undo History'},
      ['oil'] = {text = 'File Explorer'},
    },
    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustment
    -- for other layouts.
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
    -- where X is the buffer number. But only a static string is accepted here.
    no_name_title = nil,
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
  config = function(_, opts)
    require('barbar').setup(opts)
    
    -- Map keys for buffer navigation
    local map = vim.api.nvim_set_keymap
    local options = { noremap = true, silent = true }
    
    -- Move to previous/next
    map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', options)
    map('n', '<A-.>', '<Cmd>BufferNext<CR>', options)
    
    -- Re-order to previous/next
    map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', options)
    map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', options)
    
    -- Goto buffer in position...
    map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', options)
    map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', options)
    map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', options)
    map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', options)
    map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', options)
    map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', options)
    map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', options)
    map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', options)
    map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', options)
    map('n', '<A-0>', '<Cmd>BufferLast<CR>', options)
    
    -- Close buffer
    map('n', '<A-c>', '<Cmd>BufferClose<CR>', options)
    
    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', options)
    
    -- Register bindings with which-key
    local wk = require("which-key")
    wk.register({
      ["<leader>b"] = {
        name = "Buffer",
        c = { "<cmd>BufferClose<cr>", "Close buffer" },
        p = { "<cmd>BufferPin<cr>", "Pin buffer" },
        s = { "<cmd>BufferPick<cr>", "Pick buffer" },
      }
    })
  end,
}
