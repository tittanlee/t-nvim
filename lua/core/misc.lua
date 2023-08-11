


local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if status_ok then
    nvim_web_devicons.setup {
        override_by_extension = {

            ["txt"] = {
                icon = "",
                name = "Txt"
            },

            ["log"] = {
                icon = "",
                name = "Log"
            },

            ["xml"] = {
                icon = "謹 ",
                name = "Xml",
            },
        }
    }
end
