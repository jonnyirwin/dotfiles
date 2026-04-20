local c = {
    mauve    = '#cba6f7',
    peach    = '#fab387',
    green    = '#a6e3a1',
    sapphire = '#74c7ec',
    blue     = '#89b4fa',
    red      = '#f38ba8',
    yellow   = '#f9e2af',
    surface0 = '#313244',
    overlay1 = '#7f849c',
    crust    = '#11111b',
    mantle   = '#181825',
}

local function cap_open(bg)
    return { function() return '' end, color = { fg = bg, bg = c.mantle }, padding = 0 }
end
local function cap_close(bg)
    return { function() return '' end, color = { fg = bg, bg = c.mantle }, padding = 0 }
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local theme = {
            normal = {
                -- a: mode pill accent colour
                a = { fg = c.crust, bg = c.mauve },
                -- b: left content pill — bg fills padding between components
                b = { fg = c.text,  bg = c.surface0 },
                -- c/x/z: empty; bg='NONE' keeps the middle transparent
                c = { fg = c.text,  bg = 'NONE' },
                x = { fg = c.text,  bg = 'NONE' },
                -- y: right content pill
                y = { fg = c.text,  bg = c.surface0 },
                z = { fg = c.text,  bg = 'NONE' },
            },
            insert  = { a = { fg = c.crust, bg = c.green  } },
            visual  = { a = { fg = c.crust, bg = c.mauve  } },
            replace = { a = { fg = c.crust, bg = c.red    } },
            command = { a = { fg = c.crust, bg = c.yellow } },
            inactive = {
                a = { fg = c.overlay1, bg = 'NONE' },
                b = { fg = c.overlay1, bg = 'NONE' },
                c = { fg = c.overlay1, bg = 'NONE' },
            },
        }

        require('lualine').setup({
            options = {
                theme                = theme,
                section_separators   = '',
                component_separators = '',
                globalstatus         = true,
            },
            sections = {
                -- Mode pill (mauve) ────────────────────────────────────────────
                lualine_a = {
                    cap_open(c.mauve),
                    { 'mode', color = { fg = c.crust, bg = c.mauve, gui = 'bold' },
                       padding = { left = 1, right = 1 } },
                    cap_close(c.mauve),
                },
                -- Left content pill (surface0) — filename + git ───────────────
                -- Section b bg = surface0 so padding cells stay solid.
                lualine_b = {
                    cap_open(c.surface0),
                    { 'filename', path = 1,
                       color   = { fg = c.peach, bg = c.surface0 },
                       padding = { left = 1, right = 1 } },
                    { 'branch', icon = '',
                       color   = { fg = c.green, bg = c.surface0 },
                       padding = { left = 0, right = 1 } },
                    {
                        'diff',
                        color      = { bg = c.surface0 },
                        symbols    = { added = '+', modified = '~', removed = '-' },
                        diff_color = {
                            added    = { fg = c.green },
                            modified = { fg = c.peach },
                            removed  = { fg = c.red   },
                        },
                        padding = { left = 0, right = 1 },
                    },
                    cap_close(c.surface0),
                },
                lualine_c = {},  -- empty; transparent middle
                -- Right content pill (surface0) — diagnostics + filetype + location
                -- Section y bg = surface0 so padding cells stay solid.
                lualine_x = {},  -- empty; transparent
                lualine_y = {
                    cap_open(c.surface0),
                    {
                        'diagnostics',
                        color             = { bg = c.surface0 },
                        symbols           = { error = '✘ ', warn = '▲ ', info = '● ', hint = '○ ' },
                        diagnostics_color = {
                            error = { fg = c.red      },
                            warn  = { fg = c.yellow   },
                            info  = { fg = c.sapphire },
                            hint  = { fg = c.overlay1 },
                        },
                        padding = { left = 1, right = 1 },
                    },
                    { 'filetype',
                       color   = { fg = c.sapphire, bg = c.surface0 },
                       padding = { left = 0, right = 1 } },
                    { 'location',
                       color   = { fg = c.blue, bg = c.surface0 },
                       padding = { left = 0, right = 1 } },
                    cap_close(c.surface0),
                },
                lualine_z = {},  -- empty; transparent
            },
        })
    end,
}
