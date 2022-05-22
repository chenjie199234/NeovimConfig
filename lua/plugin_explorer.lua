--explorer toggle
vim.api.nvim_set_keymap('n','f',':NvimTreeToggle<CR>',{silent = true})

--explorer setting
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_add_trailing = 0
vim.g.nvim_tree_group_empty = 0
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_symlink_arrow = ' ➛ '
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_create_in_closed_folder = 0
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	folder_arrows = 1,
	files = 0
}
vim.g.nvim_tree_icons = {
	default = ' ',
	symlink = ' ',
	git = {
		unstaged = "┲",
		staged = "✿",
		unmerged = "❋",
		renamed = "➜",
		untracked = "★",
		deleted = "✘",
		ignored = "●"
	},
	folder = {
		arrow_open = "<",
		arrow_closed = ">",
		default = ">",
		open = "<",
		empty = ">",
		empty_open = "<",
		symlink = ">",
		symlink_open = "<",
	}
}
require("nvim-tree").setup {
      auto_close = false,
      auto_reload_on_write = true,
      disable_netrw = false,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = true,
      ignore_buffer_on_setup = false,
      open_on_setup = true,
      open_on_setup_file = true,
      open_on_tab = false,
      sort_by = "name",
      update_cwd = true,
      reload_on_bufenter = false,
      view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
          custom_only = false,
          list = {
            -- user mappings go here
	    { key = "f", action = "" },
	    { key = "F", action = "" },
	    { key = "<M-f>", action = "live_filter" },
	    { key = "<C-f>", action = "live_filter" },
          },
        },
      },
      renderer = {
	indent_markers = {
	  enable = true,
	  icons = {
	    corner = "└ ",
	    edge = "│ ",
	    none = "  ",
	  },
        },
        icons = {
	  webdev_colors = true,
	  git_placement = "before",
	},
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      ignore_ft_on_setup = {},
      system_open = {
        cmd = nil,
        args = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "H",
          info = "I",
          warning = "W",
          error = "E",
        },
      },
      filters = {
        dotfiles = true,
        custom = {},
        exclude = {".gitignore",".clang-format"},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 400,
      },
      actions = {
        use_system_clipboard = true, 
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
        },
      },
}
