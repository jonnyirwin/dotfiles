return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Basic DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_auto_execute_table_helpers = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_win_position = 'left'
    vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
    
    -- Prevent tree from collapsing
    vim.g.db_ui_winwidth = 30
    vim.g.db_ui_use_nvim_notify = 1
    
    -- Safe Rails database auto-detection
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local cwd = vim.fn.getcwd()
        local db_config = cwd .. '/config/database.yml'
        
        -- Only proceed if database.yml exists
        if vim.fn.filereadable(db_config) == 0 then
          return
        end
        
        -- Verify this is actually a Rails project
        local is_rails_project = vim.fn.filereadable(cwd .. '/Gemfile') == 1 or
                                vim.fn.filereadable(cwd .. '/config/application.rb') == 1 or
                                vim.fn.isdirectory(cwd .. '/app') == 1
        
        if not is_rails_project then
          return
        end
        
        local connections = {}
        
        -- Check for SQLite files
        local dev_sqlite = cwd .. '/storage/development.sqlite3'
        local dev_sqlite_db = cwd .. '/db/development.sqlite3'
        local test_sqlite = cwd .. '/storage/test.sqlite3'
        local test_sqlite_db = cwd .. '/db/test.sqlite3'
        
        if vim.fn.filereadable(dev_sqlite) == 1 then
          connections['Rails Development'] = 'sqlite:' .. dev_sqlite
        elseif vim.fn.filereadable(dev_sqlite_db) == 1 then
          connections['Rails Development'] = 'sqlite:' .. dev_sqlite_db
        end
        
        if vim.fn.filereadable(test_sqlite) == 1 then
          connections['Rails Test'] = 'sqlite:' .. test_sqlite
        elseif vim.fn.filereadable(test_sqlite_db) == 1 then
          connections['Rails Test'] = 'sqlite:' .. test_sqlite_db
        end
        
        -- Basic PostgreSQL/MySQL detection if no SQLite found
        if vim.tbl_isempty(connections) then
          local content = vim.fn.readfile(db_config)
          local dev_db = nil
          local test_db = nil
          local adapter = nil
          
          for _, line in ipairs(content) do
            if line:match('adapter:%s*postgresql') then
              adapter = 'postgresql'
            elseif line:match('adapter:%s*mysql') then
              adapter = 'mysql'
            elseif line:match('database:%s*(%S+)') then
              local db_name = line:match('database:%s*(%S+)')
              if not dev_db then
                dev_db = db_name
              elseif not test_db then
                test_db = db_name
              end
            end
          end
          
          if adapter and dev_db then
            if adapter == 'postgresql' then
              connections['Rails Development'] = 'postgresql://localhost:5432/' .. dev_db
              if test_db then
                connections['Rails Test'] = 'postgresql://localhost:5432/' .. test_db
              end
            elseif adapter == 'mysql' then
              connections['Rails Development'] = 'mysql://localhost:3306/' .. dev_db
              if test_db then
                connections['Rails Test'] = 'mysql://localhost:3306/' .. test_db
              end
            end
          end
        end
        
        -- Only set connections if we found any and this is definitely a Rails project
        if not vim.tbl_isempty(connections) then
          vim.g.dbs = connections
        end
      end,
    })
    
    -- Minimal tree collapse prevention
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dbui",
      callback = function()
        vim.opt_local.foldmethod = "manual"
        vim.opt_local.foldenable = false
      end,
    })
    
    -- Save cursor position when leaving DBUI
    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "dbui" then
          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          vim.b.dbui_cursor_pos = cursor_pos
        end
      end,
    })
    
    -- Restore cursor position when entering DBUI
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "dbui" and vim.b.dbui_cursor_pos then
          vim.api.nvim_win_set_cursor(0, vim.b.dbui_cursor_pos)
        end
      end,
    })
  end,
}