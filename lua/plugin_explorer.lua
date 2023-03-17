--explorer toggle
vim.api.nvim_set_keymap('n','f',':NvimTreeToggle<CR>',{silent = true})
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function (data)
		-- buffer is a real file on the disk
		local real_file = vim.fn.filereadable(data.file) == 1

		-- buffer is a [No Name]
		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

		-- only files please
		if not real_file and not no_name then
			return
		end

		-- open the tree but don't focus it
		require("nvim-tree.api").tree.toggle({ focus = false })
	end
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup {
      auto_reload_on_write = true,
      disable_netrw = false,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = true,
      sort_by = "name",
      root_dirs = {},
      prefer_startup_root = false,
      sync_root_with_cwd = true,
      reload_on_bufenter = false,
      respect_buf_cwd = false,
      on_attach = "disable",
      select_prompts = false,
      view = {
	centralize_selection = false,
	cursorline = true,
	debounce_delay = 15,
        width = 30,
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
	float = {
          enable = false,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 30,
            height = 30,
            row = 1,
            col = 1,
          },
	}
      },
      renderer = {
	add_trailing = false,
	group_empty = false,
	highlight_git = false,
        full_name = false,
	highlight_opened_files = "none",
	highlight_modified = "none",
	root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
	indent_markers = {
	  enable = true,
          inline_arrows = true,
	  icons = {
	    corner = "└",
	    edge = "│",
            item = "│",
            bottom = "─",
	    none = " ",
	  },
        },
        icons = {
	  webdev_colors = true,
	  git_placement = "before",
	  modified_placement = "after",
	  padding = " ",
	  symlink_arrow = " ➛ ",
	  show = {
	    file = false,
	    folder = true,
	    folder_arrow = false,
	    git = true,
	    modified = true,
	  },
	  glyphs = {
	    default = ' ',
	    symlink = ' ',
	    modified = ' ',
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
	      ignored = "◌",
	    },
  	  },
	},
	special_files = { "Makefile", "README.md", "readme.md" },
	symlink_destination = true,
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      system_open = {
        cmd = "",
        args = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
	show_on_open_dirs = true,
	debounce_delay = 50,
	severity = {
	  min = vim.diagnostic.severity.HINT,
	  max = vim.diagnostic.severity.ERROR,
	},
        icons = {
          hint = "H",
          info = "I",
          warning = "W",
          error = "E",
        },
      },
      filters = {
        dotfiles = true,
	git_clean = false,
	no_buffer = false,
        custom = {},
        exclude = {".gitignore",".clang-format"},
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
      },
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
	show_on_open_dirs = true,
        timeout = 400,
      },
      modified = {
	enable = false,
	show_on_dirs = true,
	show_on_open_dirs = true,
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
          exclude = {},
	},
	file_popup = {
          open_win_config = {
            col = 1,
            row = 1,
            relative = "cursor",
            border = "shadow",
            style = "minimal",
          },
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
	    picker = "default",
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
        cmd = "gio trash",
      },
      live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
      },
      tab = {
	sync = {
	  open = false,
	  close = false,
	  ignore = {},
	},
      },
      notify = {
	threshold = vim.log.levels.INFO,
      },
      ui = {
	confirm = {
	  remove = true,
	  trash = true,
	},
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          dev = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
      },
}

