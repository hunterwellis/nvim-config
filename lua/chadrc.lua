local M = {

  base46 = {
    theme = "vscode_dark", -- default theme
    theme_toggle = { "onedark", "one_light" },
  },

  ui = {
    telescope = { style = "bordered" }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = "vscode_colored",
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {
"            :=*#%SSSSSS%#*=:            ",
"        .+%SSSSSSSSSSSSSSSSSS%+.        ",
"      =%SSSSS#+-:.    .:-+#SSSSS%=      ",
"    -%SSSS+:   -*#%%#*=:    :+SSSS%-    ",
"   *SSSS=     *SSSSSSSSSS+     =SSSS*   ",
"  %SSS#.      SSSS%*******:     .#SSS%  ",
" #SSS*        SSSS-               *SSS# ",
"-SSS%         SSSS- .              %SSS-",
"#SSS-       :*SSSS##SS%#*=         -SSS#",
"SSSS.       #SSSSSSSSSSSS-         .SSSS",
"SSSS.       :SSSSSSSSSSSS-         .SSSS",
"#SSS=        SSSSSSSSSSSS-         =SSS#",
":SSSS        -SSSS*=SSSSS-         SSSS-",
" *SSS#       %SSSSS:SSSSS:        #SSS* ",
"  *SSS%:     .SSSS*+SSSSS:      :%SSS*  ",
"   +SSSS*.    SSSS+%SSSSS:    .*SSSS+   ",
"    .#SSSS#=. -##+ :SSSSS: .=#SSSS#.    ",
"      :*SSSSS%*+=-:-SSSSS#%SSSSS*:      ",
"         -*%SSSSSSSSSSSSSSSS%*-         ",
"               '=*#%%#*='               ",
"                                        ",
    },

    buttons = {
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
      },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
  },

  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", M, status and chadrc or {})
