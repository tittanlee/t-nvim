

local status_ok, hop = pcall(require, "hop")
if not status_ok then
    return
end

hop.setup {
    keys                    = "asdfjklhmnwertzxcvbuio",
    quit_key                = '<SPC>',
    jump_on_sole_occurrence = true,
    case_insensitive        = false,
}
