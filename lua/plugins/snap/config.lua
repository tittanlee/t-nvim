

local snap = require'snap'
snap.maps {
    {"<Leader>sf", snap.config.file {producer = "ripgrep.file", reverse = true, suffix = ">>"}},
    {"<Leader>sb", snap.config.file {producer = "vim.buffer"}},
    {"<Leader>so", snap.config.file {producer = "vim.oldfile"}},
    -- {"<Leader>sg", snap.config.vimgrep {}},
}


snap.register.map({"n"}, {"<Leader>sg"}, function ()
    snap.run {
        producer = snap.get'producer.ripgrep.vimgrep'.args({'--ignore-case'}),
        steps = {{
            consumer = snap.get'consumer.fzf',
            config = {prompt = "FZF>"}
        }},
        select = snap.get'select.file'.select,
        multiselect = snap.get'select.file'.multiselect,
        views = {snap.get'preview.vimgrep'}
    }
end)




