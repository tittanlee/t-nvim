local km = require('config.keymaps.snacks')
local K = require('config.keymaps')

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  enabled = true,
  dependencies = 'nvim-tree/nvim-web-devicons',

  ---@type snacks.Config
  opts = {
    bigfile = {
      enabled = true,
    },

    bufdelete = {
      enabled = true,
    },

    dashboard = {
      enabled = false,
    },

    debug = {
      enabled = false,
    },

    dim = {
      enabled = false,
    },

    explorer = {
      enabled = true,
    },

    indent = {
      enabled = true,
      indent = {
        -- only show indent where cursor is
        only_scope = false,
      },
      chunk = {
        enabled = true, -- indents are rendered as chunks
        only_current = true,
      },
      animate = {
        enabled = false,
      },
    },

    input = {
      enabled = true,
    },

    picker = {
      enabled = true,
      layout = {
        preset = 'default',
      },

      -- global actions
      actions = {
        cycle_layouts = function(picker)
          local layouts = { 'default', 'sidebar', 'telescope', 'ivy', 'ivy_split', 'dropdown', 'vertical', 'select', 'vscode' }
          local current = picker.opts.layout.preset
          local idx = 1
          for i, layout in ipairs(layouts) do
            if layout == current then
              idx = i % #layouts + 1
              break
            end
          end
          picker:set_layout(layouts[idx])
          picker.opts.layout.preset = layouts[idx]
        end,
        mode = { 'i', 'n' },
      },

      sources = {
        explorer = {
          enabled = false,
          follow_file = true,
          hidden = false,
          ignored = false,
          diagnostics = false,
          diagnostics_open = false,
          git_status = false,
          git_status_open = false,
          git_untracked = false,
          layout = {
            preset = 'sidebar',
            position = 'left',
            width = '25%',
          },
          win = {
            list = {
              keys = {
                -- ['o'] = 'confirm',
              },
            },
          },
        },

        files = {
          hidden = true,
          ignored = true,
          layout = {
            preset = 'ivy',
            hidden = { 'preview' },
          },
          win = {
            input = {
              keys = {
                ['<C-p>'] = { 'toggle_preview', mode = { 'n', 'i' } },
                ['<C-l>'] = { 'cycle_layouts', mode = { 'n', 'i' } },
              },
            },
            list = {
              keys = {
                ['<C-p>'] = 'toggle_preview',
              },
            },
          },
        },

        grep = {
          hidden = true,
          ignored = true,
          layout = {
            preset = 'default',
            size = {
              width = 0.9,
              height = 0.85,
            },
          },
        },

        grep_word = {
          hidden = true,
          ignored = true,
          layout = {
            preset = 'default',
            size = {
              width = 0.9,
              height = 0.85,
            },
          },
        },
      },
    },

    quickfile = {
      enabled = true,
    },

    scope = {
      enabled = true,
    },

    scroll = {
      enabled = false,
      -- faster animation when repeating scroll after delay
      -- animate_repeat = {
      --     delay = 10, -- delay in ms before using the repeat animation
      --     duration = { step = 5, total = 30},
      --     easing = "linear",
      -- },
    },

    statuscolumn = {
      enabled = true,

      folds = {
        open = '', -- when fold is open
        close = '', -- when fold is closed
        space = ' ', -- space when no fold
      },

      numbers = {
        enabled = true,
      },

      signs = {
        enabled = true,
      },
    },

    words = {
      enabled = true,
    },

    notifier = {
      enabled = true,
      timeout = 2000,
    },

    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },

  keys = {
    ------------------------------------------
    -- Find
    ------------------------------------------
    {
      K.key(km.find, 'autocmds'),
      function()
        Snacks.picker.autocmds()
      end,
      desc = K.desc(km.find, 'autocmds'),
    },
    {
      K.key(km.find, 'buffers'),
      function()
        Snacks.picker.buffers()
      end,
      desc = K.desc(km.find, 'buffers'),
    },
    {
      K.key(km.find, 'config'),
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
      end,
      desc = K.desc(km.find, 'config'),
    },
    {
      K.key(km.find, 'command_history'),
      function()
        Snacks.picker.command_history()
      end,
      desc = K.desc(km.find, 'command_history'),
    },
    {
      K.key(km.find, 'commands'),
      function()
        Snacks.picker.commands()
      end,
      desc = K.desc(km.find, 'commands'),
    },
    {
      K.key(km.find, 'diagnostics'),
      function()
        Snacks.picker.diagnostics()
      end,
      desc = K.desc(km.find, 'diagnostics'),
    },
    {
      K.key(km.find, 'diagnostics_buf'),
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = K.desc(km.find, 'diagnostics_buf'),
    },
    {
      K.key(km.find, 'files'),
      function()
        Snacks.picker.files()
      end,
      desc = K.desc(km.find, 'files'),
    },
    {
      K.key(km.find, 'help'),
      function()
        Snacks.picker.help()
      end,
      desc = K.desc(km.find, 'help'),
    },
    {
      K.key(km.find, 'highlights'),
      function()
        Snacks.picker.highlights()
      end,
      desc = K.desc(km.find, 'highlights'),
    },
    {
      K.key(km.find, 'icons'),
      function()
        Snacks.picker.icons()
      end,
      desc = K.desc(km.find, 'icons'),
    },
    {
      K.key(km.find, 'keymaps'),
      function()
        Snacks.picker.keymaps()
      end,
      desc = K.desc(km.find, 'keymaps'),
    },
    {
      K.key(km.find, 'loclist'),
      function()
        Snacks.picker.loclist()
      end,
      desc = K.desc(km.find, 'loclist'),
    },
    {
      K.key(km.find, 'notifier'),
      function()
        Snacks.notifier.show_history()
      end,
      desc = K.desc(km.find, 'notifier'),
    },
    {
      K.key(km.find, 'notifications'),
      function()
        Snacks.picker.notifications()
      end,
      desc = K.desc(km.find, 'notifications'),
    },
    {
      K.key(km.find, 'explorer'),
      function()
        Snacks.picker.explorer()
      end,
      desc = K.desc(km.find, 'explorer'),
    },
    {
      K.key(km.find, 'resume'),
      function()
        Snacks.picker.resume()
      end,
      desc = K.desc(km.find, 'resume'),
    },
    {
      K.key(km.find, 'terminal'),
      function()
        Snacks.terminal()
      end,
      desc = K.desc(km.find, 'terminal'),
    },
    {
      K.key(km.find, 'qflist'),
      function()
        Snacks.picker.qflist()
      end,
      desc = K.desc(km.find, 'qflist'),
    },

    ------------------------------------------
    -- LSP
    ------------------------------------------
    {
      K.key(km.lsp, 'definitions'),
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = K.desc(km.lsp, 'definitions'),
    },
    {
      K.key(km.lsp, 'declarations'),
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = K.desc(km.lsp, 'declarations'),
    },
    {
      K.key(km.lsp, 'references'),
      function()
        Snacks.picker.lsp_references()
      end,
      desc = K.desc(km.lsp, 'references'),
    },
    {
      K.key(km.lsp, 'implementations'),
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = K.desc(km.lsp, 'implementations'),
    },
    {
      K.key(km.lsp, 'type_definitions'),
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = K.desc(km.lsp, 'type_definitions'),
    },
    {
      K.key(km.lsp, 'incoming'),
      function()
        Snacks.picker.lsp_incoming_calls()
      end,
      desc = K.desc(km.lsp, 'incoming'),
    },
    {
      K.key(km.lsp, 'outgoing'),
      function()
        Snacks.picker.lsp_outgoing_calls()
      end,
      desc = K.desc(km.lsp, 'outgoing'),
    },
    {
      K.key(km.lsp, 'symbols'),
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = K.desc(km.lsp, 'symbols'),
    },
    {
      K.key(km.lsp, 'workspace_symbols'),
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = K.desc(km.lsp, 'workspace_symbols'),
    },

    ------------------------------------------
    -- Grep
    ------------------------------------------
    {
      K.key(km.grep, 'buffers'),
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = K.desc(km.grep, 'buffers'),
    },
    {
      K.key(km.grep, 'grep'),
      function()
        Snacks.picker.grep()
      end,
      desc = K.desc(km.grep, 'grep'),
    },
    {
      K.key(km.grep, 'lines'),
      function()
        Snacks.picker.lines()
      end,
      desc = K.desc(km.grep, 'lines'),
    },
    {
      K.key(km.grep, 'word'),
      function()
        Snacks.picker.grep_word()
      end,
      desc = K.desc(km.grep, 'word'),
      mode = K.mode(km.grep, 'word'),
    },

    ------------------------------------------
    -- Git
    ------------------------------------------
    {
      K.key(km.git, 'branches'),
      function()
        Snacks.picker.git_branches()
      end,
      desc = K.desc(km.git, 'branches'),
    },
    {
      K.key(km.git, 'log'),
      function()
        Snacks.picker.git_log()
      end,
      desc = K.desc(km.git, 'log'),
    },
    {
      K.key(km.git, 'status'),
      function()
        Snacks.picker.git_status()
      end,
      desc = K.desc(km.git, 'status'),
    },
    {
      K.key(km.git, 'diff'),
      function()
        Snacks.picker.git_diff()
      end,
      desc = K.desc(km.git, 'diff'),
    },
    {
      K.key(km.git, 'lazy_git'),
      function()
        Snacks.lazygit()
      end,
      desc = K.desc(km.git, 'lazy_git'),
    },

    ------------------------------------------
    -- Toggle
    ------------------------------------------
    {
      K.key(km.toggle, 'zen_mode'),
      function()
        Snacks.zen()
      end,
      desc = K.desc(km.toggle, 'zen_mode'),
    },
    {
      K.key(km.toggle, 'zen_zoom'),
      function()
        Snacks.zen.zoom()
      end,
      desc = K.desc(km.toggle, 'zen_zoom'),
    },

    ------------------------------------------
    -- Other
    ------------------------------------------
    {
      km.buf_del.key,
      function()
        Snacks.bufdelete()
      end,
      desc = km.buf_del.desc,
    },
  },

  -- keys = {
  --   -- Top Pickers & Explorer
  --   {
  --     '<leader><space>',
  --     function()
  --       Snacks.picker.smart()
  --     end,
  --     desc = 'Smart Find Files',
  --   },
  --   {
  --     '<leader>,',
  --     function()
  --       Snacks.picker.buffers()
  --     end,
  --     desc = 'Buffers',
  --   },
  --   {
  --     '<leader>/',
  --     function()
  --       Snacks.picker.grep()
  --     end,
  --     desc = 'Grep',
  --   },
  --   {
  --     '<leader>:',
  --     function()
  --       Snacks.picker.command_history()
  --     end,
  --     desc = 'Command History',
  --   },
  --   {
  --     '<leader>n',
  --     function()
  --       Snacks.picker.notifications()
  --     end,
  --     desc = 'Notification History',
  --   },
  --   {
  --     '<leader>w',
  --     function()
  --       Snacks.explorer()
  --     end,
  --     desc = 'File Explorer',
  --   },
  --
  --   -- find
  --   {
  --     '<leader>fb',
  --     function()
  --       Snacks.picker.buffers()
  --     end,
  --     desc = 'Buffers',
  --   },
  --   {
  --     '<leader>fc',
  --     function()
  --       Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
  --     end,
  --     desc = 'Find Config File',
  --   },
  --   {
  --     '<leader>ff',
  --     function()
  --       Snacks.picker.files()
  --     end,
  --     desc = 'Find Files',
  --   },
  --   {
  --     '<leader>fg',
  --     function()
  --       Snacks.picker.git_files()
  --     end,
  --     desc = 'Find Git Files',
  --   },
  --   {
  --     '<leader>fp',
  --     function()
  --       Snacks.picker.projects()
  --     end,
  --     desc = 'Projects',
  --   },
  --   {
  --     '<leader>fr',
  --     function()
  --       Snacks.picker.recent()
  --     end,
  --     desc = 'Recent',
  --   },
  --
  --   -- git
  --   {
  --     '<leader>gb',
  --     function()
  --       Snacks.picker.git_branches()
  --     end,
  --     desc = 'Git Branches',
  --   },
  --   {
  --     '<leader>gl',
  --     function()
  --       Snacks.picker.git_log()
  --     end,
  --     desc = 'Git Log',
  --   },
  --   {
  --     '<leader>gL',
  --     function()
  --       Snacks.picker.git_log_line()
  --     end,
  --     desc = 'Git Log Line',
  --   },
  --   {
  --     '<leader>gs',
  --     function()
  --       Snacks.picker.git_status()
  --     end,
  --     desc = 'Git Status',
  --   },
  --   {
  --     '<leader>gS',
  --     function()
  --       Snacks.picker.git_stash()
  --     end,
  --     desc = 'Git Stash',
  --   },
  --   {
  --     '<leader>gd',
  --     function()
  --       Snacks.picker.git_diff()
  --     end,
  --     desc = 'Git Diff (Hunks)',
  --   },
  --   {
  --     '<leader>gf',
  --     function()
  --       Snacks.picker.git_log_file()
  --     end,
  --     desc = 'Git Log File',
  --   },
  --
  --   -- gh
  --   {
  --     '<leader>gi',
  --     function()
  --       Snacks.picker.gh_issue()
  --     end,
  --     desc = 'GitHub Issues (open)',
  --   },
  --   {
  --     '<leader>gI',
  --     function()
  --       Snacks.picker.gh_issue({ state = 'all' })
  --     end,
  --     desc = 'GitHub Issues (all)',
  --   },
  --   {
  --     '<leader>gp',
  --     function()
  --       Snacks.picker.gh_pr()
  --     end,
  --     desc = 'GitHub Pull Requests (open)',
  --   },
  --   {
  --     '<leader>gP',
  --     function()
  --       Snacks.picker.gh_pr({ state = 'all' })
  --     end,
  --     desc = 'GitHub Pull Requests (all)',
  --   },
  --
  --   -- Grep
  --   {
  --     '<leader>sb',
  --     function()
  --       Snacks.picker.lines()
  --     end,
  --     desc = 'Buffer Lines',
  --   },
  --   {
  --     '<leader>sB',
  --     function()
  --       Snacks.picker.grep_buffers()
  --     end,
  --     desc = 'Grep Open Buffers',
  --   },
  --   {
  --     '<leader>sg',
  --     function()
  --       Snacks.picker.grep()
  --     end,
  --     desc = 'Grep',
  --   },
  --   {
  --     '<leader>sw',
  --     function()
  --       Snacks.picker.grep_word()
  --     end,
  --     desc = 'Visual selection or word',
  --     mode = { 'n', 'x' },
  --   },
  --
  --   -- search
  --   {
  --     '<leader>s"',
  --     function()
  --       Snacks.picker.registers()
  --     end,
  --     desc = 'Registers',
  --   },
  --   {
  --     '<leader>s/',
  --     function()
  --       Snacks.picker.search_history()
  --     end,
  --     desc = 'Search History',
  --   },
  --   {
  --     '<leader>sa',
  --     function()
  --       Snacks.picker.autocmds()
  --     end,
  --     desc = 'Autocmds',
  --   },
  --   {
  --     '<leader>sb',
  --     function()
  --       Snacks.picker.lines()
  --     end,
  --     desc = 'Buffer Lines',
  --   },
  --   {
  --     '<leader>sc',
  --     function()
  --       Snacks.picker.command_history()
  --     end,
  --     desc = 'Command History',
  --   },
  --   {
  --     '<leader>sC',
  --     function()
  --       Snacks.picker.commands()
  --     end,
  --     desc = 'Commands',
  --   },
  --   {
  --     '<leader>sd',
  --     function()
  --       Snacks.picker.diagnostics()
  --     end,
  --     desc = 'Diagnostics',
  --   },
  --   {
  --     '<leader>sD',
  --     function()
  --       Snacks.picker.diagnostics_buffer()
  --     end,
  --     desc = 'Buffer Diagnostics',
  --   },
  --   {
  --     '<leader>fh',
  --     function()
  --       Snacks.picker.help()
  --     end,
  --     desc = 'Help Pages',
  --   },
  --   {
  --     '<leader>sH',
  --     function()
  --       Snacks.picker.highlights()
  --     end,
  --     desc = 'Highlights',
  --   },
  --   {
  --     '<leader>si',
  --     function()
  --       Snacks.picker.icons()
  --     end,
  --     desc = 'Icons',
  --   },
  --   {
  --     '<leader>sj',
  --     function()
  --       Snacks.picker.jumps()
  --     end,
  --     desc = 'Jumps',
  --   },
  --   {
  --     '<leader>sk',
  --     function()
  --       Snacks.picker.keymaps()
  --     end,
  --     desc = 'Keymaps',
  --   },
  --   {
  --     '<leader>sl',
  --     function()
  --       Snacks.picker.loclist()
  --     end,
  --     desc = 'Location List',
  --   },
  --   {
  --     '<leader>sm',
  --     function()
  --       Snacks.picker.marks()
  --     end,
  --     desc = 'Marks',
  --   },
  --   {
  --     '<leader>sM',
  --     function()
  --       Snacks.picker.man()
  --     end,
  --     desc = 'Man Pages',
  --   },
  --   {
  --     '<leader>sp',
  --     function()
  --       Snacks.picker.lazy()
  --     end,
  --     desc = 'Search for Plugin Spec',
  --   },
  --   {
  --     '<leader>sq',
  --     function()
  --       Snacks.picker.qflist()
  --     end,
  --     desc = 'Quickfix List',
  --   },
  --   {
  --     '<leader>sR',
  --     function()
  --       Snacks.picker.resume()
  --     end,
  --     desc = 'Resume',
  --   },
  --   {
  --     '<leader>su',
  --     function()
  --       Snacks.picker.undo()
  --     end,
  --     desc = 'Undo History',
  --   },
  --   {
  --     '<leader>uC',
  --     function()
  --       Snacks.picker.colorschemes()
  --     end,
  --     desc = 'Colorschemes',
  --   },
  --
  --   -- LSP
  --   {
  --     'gd',
  --     function()
  --       Snacks.picker.lsp_definitions()
  --     end,
  --     desc = 'Goto Definition',
  --   },
  --   {
  --     'gD',
  --     function()
  --       Snacks.picker.lsp_declarations()
  --     end,
  --     desc = 'Goto Declaration',
  --   },
  --   {
  --     'gr',
  --     function()
  --       Snacks.picker.lsp_references()
  --     end,
  --     nowait = true,
  --     desc = 'References',
  --   },
  --   {
  --     'gI',
  --     function()
  --       Snacks.picker.lsp_implementations()
  --     end,
  --     desc = 'Goto Implementation',
  --   },
  --   {
  --     'gy',
  --     function()
  --       Snacks.picker.lsp_type_definitions()
  --     end,
  --     desc = 'Goto T[y]pe Definition',
  --   },
  --   {
  --     'gai',
  --     function()
  --       Snacks.picker.lsp_incoming_calls()
  --     end,
  --     desc = 'C[a]lls Incoming',
  --   },
  --   {
  --     'gao',
  --     function()
  --       Snacks.picker.lsp_outgoing_calls()
  --     end,
  --     desc = 'C[a]lls Outgoing',
  --   },
  --   {
  --     '<leader>ss',
  --     function()
  --       Snacks.picker.lsp_symbols()
  --     end,
  --     desc = 'LSP Symbols',
  --   },
  --   {
  --     '<leader>sS',
  --     function()
  --       Snacks.picker.lsp_workspace_symbols()
  --     end,
  --     desc = 'LSP Workspace Symbols',
  --   },
  --
  --   -- Other
  --   {
  --     '<leader>z',
  --     function()
  --       Snacks.zen()
  --     end,
  --     desc = 'Toggle Zen Mode',
  --   },
  --   {
  --     '<leader>Z',
  --     function()
  --       Snacks.zen.zoom()
  --     end,
  --     desc = 'Toggle Zoom',
  --   },
  --   {
  --     '<leader>.',
  --     function()
  --       Snacks.scratch()
  --     end,
  --     desc = 'Toggle Scratch Buffer',
  --   },
  --   {
  --     '<leader>S',
  --     function()
  --       Snacks.scratch.select()
  --     end,
  --     desc = 'Select Scratch Buffer',
  --   },
  --   {
  --     '<leader>n',
  --     function()
  --       Snacks.notifier.show_history()
  --     end,
  --     desc = 'Notification History',
  --   },
  --   {
  --     '<M-w>',
  --     function()
  --       Snacks.bufdelete()
  --     end,
  --     desc = 'Delete Buffer',
  --   },
  --   {
  --     '<leader>cR',
  --     function()
  --       Snacks.rename.rename_file()
  --     end,
  --     desc = 'Rename File',
  --   },
  --   {
  --     '<leader>gB',
  --     function()
  --       Snacks.gitbrowse()
  --     end,
  --     desc = 'Git Browse',
  --     mode = { 'n', 'v' },
  --   },
  --   {
  --     '<leader>gg',
  --     function()
  --       Snacks.lazygit()
  --     end,
  --     desc = 'Lazygit',
  --   },
  --   {
  --     '<leader>un',
  --     function()
  --       Snacks.notifier.hide()
  --     end,
  --     desc = 'Dismiss All Notifications',
  --   },
  --   {
  --     '<leader>tt',
  --     function()
  --       Snacks.terminal()
  --     end,
  --     desc = 'Toggle Terminal',
  --   },
  --   {
  --     ']]',
  --     function()
  --       Snacks.words.jump(vim.v.count1)
  --     end,
  --     desc = 'Next Reference',
  --     mode = { 'n', 't' },
  --   },
  --   {
  --     '[[',
  --     function()
  --       Snacks.words.jump(-vim.v.count1)
  --     end,
  --     desc = 'Prev Reference',
  --     mode = { 'n', 't' },
  --   },
  --   {
  --     '<leader>N',
  --     desc = 'Neovim News',
  --     function()
  --       Snacks.win({
  --         file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
  --         width = 0.6,
  --         height = 0.6,
  --         wo = {
  --           spell = false,
  --           wrap = false,
  --           signcolumn = 'yes',
  --           statuscolumn = ' ',
  --           conceallevel = 3,
  --         },
  --       })
  --     end,
  --   },
  -- },

  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has('nvim-0.11') == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.diagnostics():map(K.key(km.toggle, 'diagnostics'), { desc = K.desc(km.toggle, 'diagnostics') })
        Snacks.toggle.treesitter():map(K.key(km.toggle, 'treesitter'), { desc = K.desc(km.toggle, 'treesitter') })
        Snacks.toggle.inlay_hints():map(K.key(km.toggle, 'inlay_hints'), { desc = K.desc(km.toggle, 'inlay_hints') })
        Snacks.toggle.dim():map(K.key(km.toggle, 'dim'), { desc = K.desc(km.toggle, 'dim') })
        -- Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
        -- Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
        -- Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
        -- Snacks.toggle.line_number():map('<leader>ul')
        -- Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map('<leader>uc')
        -- Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>ub')
        -- Snacks.toggle.indent():map(
      end,
    })
  end,
}
