
-- -- Define autocmd that generates the highlight groups from the new colorscheme
-- -- Then reset the highlights for feline
-- edn.aug.FelineColorschemeReload = {
--   {
--     { "SessionLoadPost", "ColorScheme" },
--     function()
--       require("eden.modules.ui.feline.colors").gen_highlights()
--       -- This does not look like it is required. If this is called I see the ^^^^^^ that
--       -- seperates the two sides of the bar. Since the entire config uses highlight groups
--       -- all that is required is to redefine them.
--       -- require("feline").reset_highlights()
--     end,
--   },
-- }

return {
    "freddiehaddad/feline.nvim",
    opts = {
        components = { active = active, inactive = inactive },
        highlight_reset_triggers = {},
        force_inactive = {
            filetypes = {
                "NvimTree",
                "packer",
                "dap-repl",
                "dapui_scopes",
                "dapui_stacks",
                "dapui_watches",
                "dapui_repl",
                "LspTrouble",
                "qf",
                "help",
            },
            buftypes = { "terminal" },
            bufnames = {},
        },
        disable = {
            filetypes = {
                "dashboard",
                "startify",
            },
        },
    },
    config = function(_, opts)
        -- Feline statusline definition.
        --
        -- Note: This statusline does not define any colors. Instead the statusline is
        -- built on custom highlight groups that I define. The colors for these
        -- highlight groups are pulled from the current colorscheme applied. Check the
        -- file: `lua/eden/modules/ui/colors.lua` to see how they are defined.

        local u = { vi = {} }

        u.vi.text = {
            n = "NORMAL",
            no = "NORMAL",
            i = "INSERT",
            v = "VISUAL",
            V = "V-LINE",
            [""] = "V-BLOCK",
            c = "COMMAND",
            cv = "COMMAND",
            ce = "COMMAND",
            R = "REPLACE",
            Rv = "REPLACE",
            s = "SELECT",
            S = "SELECT",
            [""] = "SELECT",
            t = "TERMINAL",
        }

        u.vi.colors = {
            n = "EdenRvCyan",
            no = "EdenRvCyan",
            i = "EdenSLStatus",
            v = "EdenRvMagenta",
            V = "EdenRvMagenta",
            [""] = "EdenRvMagenta",
            R = "EdenRvRed",
            Rv = "EdenRvRed",
            r = "EdenRvBlue",
            rm = "EdenRvBlue",
            s = "EdenRvMagenta",
            S = "EdenRvMagenta",
            [""] = "FelnMagenta",
            c = "EdenRvYellow",
            ["!"] = "EdenRvBlue",
            t = "EdenRvBlue",
        }

        u.vi.sep = {
            n = "EdenCyan",
            no = "EdenCyan",
            i = "EdenSLStatusBg",
            v = "EdenMagenta",
            V = "EdenMagenta",
            [""] = "EdenMagenta",
            R = "EdenRed",
            Rv = "EdenRed",
            r = "EdenBlue",
            rm = "EdenBlue",
            s = "EdenMagenta",
            S = "EdenMagenta",
            [""] = "FelnMagenta",
            c = "EdenYellow",
            ["!"] = "EdenBlue",
            t = "EdenBlue",
        }

        u.icons = {
            locker = "", -- #f023
            page = "☰", -- 2630
            line_number = "", -- e0a1
            connected = "", -- f817
            dos = "", -- e70f
            unix = "", -- f17c
            mac = "", -- f179
            mathematical_L = "𝑳",
            vertical_bar = "┃",
            vertical_bar_thin = "│",
            left = "",
            right = "",
            block = "█",
            left_filled = "",
            right_filled = "",
            slant_left = "",
            slant_left_thin = "",
            slant_right = "",
            slant_right_thin = "",
            slant_left_2 = "",
            slant_left_2_thin = "",
            slant_right_2 = "",
            slant_right_2_thin = "",
            left_rounded = "",
            left_rounded_thin = "",
            right_rounded = "",
            right_rounded_thin = "",
            circle = "●",
        }

        local fmt = string.format

        -- "┃", "█", "", "", "", "", "", "", "●"

        local get_diag = function(str)
          local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity[str] })
          local count = #diagnostics

          return (count > 0) and " " .. count .. " " or ""
        end

        local function vi_mode_hl()
          return u.vi.colors[vim.fn.mode()] or "EdenSLViBlack"
        end

        local function vi_sep_hl()
          return u.vi.sep[vim.fn.mode()] or "EdenSLBlack"
        end

        local c = {
          vimode = {
            provider = function()
              return string.format(" %s ", u.vi.text[vim.fn.mode()])
            end,
            hl = vi_mode_hl,
            right_sep = { str = " ", hl = vi_sep_hl },
          },
          gitbranch = {
            provider = "git_branch",
            icon = " ",
            hl = "EdenSLGitBranch",
            right_sep = { str = "  ", hl = "EdenSLGitBranch" },
            enabled = function()
              return vim.b.gitsigns_status_dict ~= nil
            end,
          },
          file_type = {
            provider = function()
              return fmt(" %s ", vim.bo.filetype:upper())
            end,
            hl = "EdenSLAlt",
          },
          fileinfo = {
            provider = { name = "file_info", opts = { type = "relative" } },
            hl = "EdenSLAlt",
            left_sep = { str = " ", hl = "EdenSLAltSep" },
            right_sep = { str = " ", hl = "EdenSLAltSep" },
          },
          file_enc = {
            provider = function()
              local os = u.icons[vim.bo.fileformat] or ""
              return fmt(" %s %s ", os, vim.bo.fileencoding)
            end,
            hl = "StatusLine",
            left_sep = { str = u.icons.left_filled, hl = "EdenSLAltSep" },
          },
          cur_position = {
            provider = function()
              -- TODO: What about 4+ diget line numbers?
              return fmt(" %3d:%-2d ", unpack(vim.api.nvim_win_get_cursor(0)))
            end,
            hl = vi_mode_hl,
            left_sep = { str = u.icons.left_filled, hl = vi_sep_hl },
          },
          cur_percent = {
            provider = function()
              return " " .. require("feline.providers.cursor").line_percentage() .. "  "
            end,
            hl = vi_mode_hl,
            left_sep = { str = u.icons.left, hl = vi_mode_hl },
          },
          default = { -- needed to pass the parent StatusLine hl group to right hand side
            provider = "",
            hl = "StatusLine",
          },
          lsp_status = {
            provider = function()
              return require("lsp-status").status()
            end,
            hl = "EdenSLStatus",
            left_sep = { str = "", hl = "EdenSLStatusBg", always_visible = true },
            right_sep = { str = "", hl = "EdenSLErrorStatus", always_visible = true },
          },
          lsp_error = {
            provider = function()
              return get_diag("ERROR")
            end,
            hl = "EdenSLError",
            right_sep = { str = "", hl = "EdenSLWarnError", always_visible = true },
          },
          lsp_warn = {
            provider = function()
              return get_diag("WARN")
            end,
            hl = "EdenSLWarn",
            right_sep = { str = "", hl = "EdenSLInfoWarn", always_visible = true },
          },
          lsp_info = {
            provider = function()
              return get_diag("INFO")
            end,
            hl = "EdenSLInfo",
            right_sep = { str = "", hl = "EdenSLHintInfo", always_visible = true },
          },
          lsp_hint = {
            provider = function()
              return get_diag("HINT")
            end,
            hl = "EdenSLHint",
            right_sep = { str = "", hl = "EdenSLFtHint", always_visible = true },
          },

          in_fileinfo = {
            provider = "file_info",
            hl = "StatusLine",
          },
          in_position = {
            provider = "position",
            hl = "StatusLine",
          },
        }

        local active = {
          { -- left
            c.vimode,
            c.gitbranch,
            c.fileinfo,
            c.default, -- must be last
          },
          { -- right
            c.lsp_status,
            c.lsp_error,
            c.lsp_warn,
            c.lsp_info,
            c.lsp_hint,
            c.file_type,
            c.file_enc,
            c.cur_position,
            c.cur_percent,
          },
        }

        local inactive = {
          { c.in_fileinfo }, -- left
          { c.in_position }, -- right
        }
        require("feline").setup(opts)
    end,
}
