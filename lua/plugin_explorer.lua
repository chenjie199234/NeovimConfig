--explorer toggle
vim.api.nvim_set_keymap('n','f',':NvimTreeToggle<CR>',{silent = true})

require("nvim-tree").setup {
      auto_reload_on_write = true,
      create_in_closed_folder = false,
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
      respect_buf_cwd = false,
      view = {
	adaptive_size = false,
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
	group_empty = false,
	highlight_git = false,
	highlight_opened_files = "none",
	root_folder_modifier = ":~",
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
	  padding = " ",
	  symlink_arrow = " ➛ ",
	  show = {
	    file = false,
	    folder = true,
	    folder_arrow = true,
	    git = true,
	  },
	  glyphs = {
	    default = ' ',
	    symlink = ' ',
	    folder = {
	      arrow_open = "<",
	      arrow_closed = ">",
	      default = ">",
	      open = "<",
	      empty = ">",
	      empty_open = "<",
	      symlink = ">",
	      symlink_open = "<",
	    },
	    git = {
	      unstaged = "┲",
	      staged = "✿",
	      unmerged = "❋",
	      renamed = "➜",
	      untracked = "★",
	      deleted = "✘",
	      ignored = "●",
	    },
  	  },
	},
	special_files = { "Makefile", "README.md", "readme.md" },
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
        cmd = "",
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
	expand_all = {
	  max_folder_discovery = 300,
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
	remove_file = {
	  close_window = true,
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
