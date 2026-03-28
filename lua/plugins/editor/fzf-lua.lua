return {
  'ibhagwan/fzf-lua',
  enabled = false,

  -- Optional: but highly recommended for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local fzf = require('fzf-lua')
    fzf.setup({
      -- Layout: 'flex' adapts to your window size automatically
      winopts = {
        height = 0.85,
        width = 0.80,
        border = 'none',
        preview = {
          delay = 100,
          layout = 'vertical', -- Vertical preview is better for long C/Python files
          vertical = 'down:45%',
          hidden = 'hidden',
        },
      },
      -- 5. Force fzf-lua to use a simpler layout logic
      fzf_opts = {
        -- Disable some heavy fzf animations
        ['--no-height'] = '',
        ['--layout'] = 'reverse',
      },

      files = {
        -- Use fd for maximum speed if available
        cmd = 'fd --type f --hidden --follow --exclude .git',
      },

      grep = {
        -- Enable ripgrep (rg) with smart-case
        rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
      },
    })

    -- KEYMAPS (Customized for your workflow)
    local opts = { noremap = true, silent = true }

    -- 1. Find Files (Equivalent to Snacks/Telescope ff)
    vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Fzf Find Files' })

    -- 2. Live Grep (The gold standard for speed)
    vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'Fzf Live Grep' })

    -- 3. Grep Current Word (Essential for tracking GPU driver symbols)
    vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = 'Fzf Grep Current Word' })

    -- 4. Search Yank History (Yes, fzf-lua also supports registers!)
    vim.keymap.set('n', '<leader>sy', fzf.registers, { desc = 'Fzf Search Registers' })

    -- 5. Resume last search (Very useful when you accidentally closed the window)
    vim.keymap.set('n', '<leader>fr', fzf.resume, { desc = 'Fzf Resume Last Search' })
  end,
}
