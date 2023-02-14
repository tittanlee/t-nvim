
local status_ok, fzf = pcall(require, "fzf")
if not status_ok then
    return
end

local fzf_cmd_files  = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.files")
local fzf_ctags_jump = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.ctags")
local fzf_gtags      = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.gtags")


local module_key = require("environment").keys.module.fzf

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix.lhs] = {
            name = module_key.prefix.desc,
            [module_key.find_files.lhs]       = { fzf_cmd_files       , module_key.find_files.desc       },
            [module_key.ctags_jump.lhs]       = { fzf_ctags_jump      , module_key.ctags_jump.desc       },

            [module_key.gtags_definition.lhs] = { fzf_gtags.definition, module_key.gtags_definition.desc },
            [module_key.gtags_reference.lhs]  = { fzf_gtags.reference , module_key.gtags_reference.desc  },
            [module_key.gtags_symbol.lhs]     = { fzf_gtags.symbol    , module_key.gtags_symbol.desc     },
            [module_key.gtags_grepper.lhs]    = { fzf_gtags.grepper   , module_key.gtags_grepper.desc    },
        },
    })
else
    local keymap = require("utils").keymap
    keymap("n", module_key.prefix.lhs .. module_key.find_files.lhs      , fzf_cmd_files       , {desc = module_key.find_files.desc       })
    keymap("n", module_key.prefix.lhs .. module_key.ctags_jump.lhs      , fzf_ctags_jump      , {desc = module_key.ctags_jump.desc       })

    keymap("n", module_key.prefix.lhs .. module_key.gtags_definition.lhs, fzf_gtags.definition, {desc = module_key.gtags_definition.desc })
    keymap("n", module_key.prefix.lhs .. module_key.gtags_reference.lhs , fzf_gtags.reference , {desc = module_key.gtags_reference.desc  })
    keymap("n", module_key.prefix.lhs .. module_key.gtags_symbol.lhs    , fzf_gtags.symbol    , {desc = module_key.gtags_symbol.desc     })
    keymap("n", module_key.prefix.lhs .. module_key.gtags_grepper.lhs   , fzf_gtags.grepper   , {desc = module_key.gtags_grepper.desc    })
end
