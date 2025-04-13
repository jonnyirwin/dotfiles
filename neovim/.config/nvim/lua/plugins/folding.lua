-- Advanced folding configuration using nvim-ufo

return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufReadPost",
    keys = {
      {
        "zR",
        function() require("ufo").openAllFolds() end,
        desc = "Open all folds"
      },
      {
        "zM",
        function() require("ufo").closeAllFolds() end,
        desc = "Close all folds"
      },
      {
        "zr",
        function() require("ufo").openFoldsExceptKinds() end,
        desc = "Open folds except kinds"
      },
      {
        "zm",
        function() require("ufo").closeFoldsWith() end,
        desc = "Close folds with"
      },
      {
        "zp",
        function() require("ufo").peekFoldedLinesUnderCursor() end,
        desc = "Peek folded lines"
      },
    },
    config = function()
      local ufo = require("ufo")
      
      -- Using treesitter and LSP for fold providers
      -- Order matters: the first provider that returns a valid fold will be used
      ufo.setup({
        open_fold_hl_timeout = 150,
        provider_selector = function(bufnr, filetype, buftype)
          -- For some filetypes use specific providers
          local ft_providers = {
            -- Use treesitter for these filetypes
            ['lua'] = {'treesitter', 'indent'},
            ['ruby'] = {'treesitter', 'indent'},
            ['typescript'] = {'treesitter', 'indent'},
            ['javascript'] = {'treesitter', 'indent'},
            ['python'] = {'treesitter', 'indent'},
            ['c_sharp'] = {'treesitter', 'indent'},
          }
          
          -- Use predefined providers for specific filetypes
          if ft_providers[filetype] then
            return ft_providers[filetype]
          end
          
          -- Default: try LSP first, then treesitter, then indent
          return {'lsp', 'treesitter', 'indent'}
        end,
        
        -- Customize the appearance of folds
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local totalLines = endLnum - lnum
          local foldedLines = ("🔽 %d lines "):format(totalLines)
          local suffix = (' 󰦸 %d '):format(totalLines)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, {chunkText, hlGroup})
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              -- str width returned from truncate() may less than 2nd argument, add padding
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            
            curWidth = curWidth + chunkWidth
          end
          
          -- Add fold count and icon at the end
          table.insert(newVirtText, {'⋯ ', 'Comment'})
          table.insert(newVirtText, {suffix, 'MoreMsg'})
          
          return newVirtText
        end,
        
        preview = {
          win_config = {
            border = 'rounded',
            winblend = 0,
            winhighlight = 'Normal:Normal',
          },
          mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
          }
        },
      })
      
      -- Set folding options
      vim.o.foldlevel = 99  -- Open all folds by default
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      
      -- Set fold method to manual, as nvim-ufo will handle folding
      vim.o.foldmethod = "manual"
      vim.o.foldcolumn = "1"  -- Show fold column for better visibility
      
      -- Register with which-key
      local wk = require("which-key")
      wk.register({
        ["z"] = {
          name = "Folds",
          R = "Open all folds",
          M = "Close all folds",
          r = "Open one level of folds",
          m = "Close one level of folds",
          p = "Peek folded lines",
          a = "Toggle fold",
        }
      })
    end
  }
}
