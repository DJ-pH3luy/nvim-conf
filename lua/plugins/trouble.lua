return {
    {
        "folke/trouble.nvim",
        opts = {
            focus = false,
            open_no_results = true,
            warn_no_results = false,
            icons = {
                indent        = {
                    fold_open = ">",
                    fold_closed = "-",
                },
                folder_closed = "",
                folder_open   = "",
                kinds         = {
                    Array         = "",
                    Boolean       = "",
                    Class         = "",
                    Constant      = "",
                    Constructor   = "",
                    Enum          = "",
                    EnumMember    = "",
                    Event         = "",
                    Field         = "",
                    File          = "",
                    Function      = "",
                    Interface     = "",
                    Key           = "",
                    Method        = "",
                    Module        = "",
                    Namespace     = "",
                    Null          = "",
                    Number        = "",
                    Object        = "",
                    Operator      = "",
                    Package       = "",
                    Property      = "",
                    String        = "",
                    Struct        = "",
                    TypeParameter = "",
                    Variable      = "",
                },
            },
            modes = {
                diagnostics = {
                    groups = {
                        { "filename",  format = "{file_icon} {basename:Title} {count}" },
                        { "directory", format = "{dirname}" },
                    },
                },
            },
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle<cr>",
                desc = "Symbols (Trouble)",
            },
            {
            "<leader>cl",
                "<cmd>Trouble lsp toggle win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
