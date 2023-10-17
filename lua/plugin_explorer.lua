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
end})

local function on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	-- My Delete:
	vim.keymap.del('n','f',{ buffer = bufnr })
	vim.keymap.del('n','F',{ buffer = bufnr })
	vim.keymap.set('n','<C-f>',api.live_filter.start,opts("Filter"))
	vim.keymap.set('n','<M-f>',api.live_filter.start,opts("Filter"))
	vim.keymap.set('n','F',api.live_filter.clear,opts("Clean Filter"))
	vim.keymap.set('n','?',api.tree.toggle_help,opts("Help"))
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup {
	on_attach = on_attach,
	hijack_cursor = false,
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = true,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	select_prompts = false,
	sort = {
		sorter = "name",
		folders_first = true,
		files_first = false,
	},
	view = {
		centralize_selection = false,
		cursorline = true,
		debounce_delay = 15,
		side = "left",
		preserve_window_proportions = true,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		width = 30,
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
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		full_name = false,
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
		highlight_git = false,
		highlight_diagnostics = false,
		highlight_opened_files = "none",
		highlight_modified = "none",
		highlight_bookmarks = "none",
		highlight_clipboard = "name",
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
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
			git_placement = "before",
			modified_placement = "after",
			diagnostics_placement = "signcolumn",
			bookmarks_placement = "signcolumn",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = false,
				folder = true,
				folder_arrow = false,
				git = true,
				modified = true,
				diagnostics = true,
				bookmarks = true,
			},
			glyphs = {
				default = ' ',
				symlink = ' ',
				bookmark = ' ',
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
	git = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		disable_for_dirs = {},
		timeout = 400,
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
	modified = {
		enable = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	filters = {
		git_ignored = true,
		dotfiles = true,
		git_clean = false,
		no_buffer = false,
		custom = {},
		exclude = {".gitignore",".clang-format"},
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
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
			eject = true,
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
	tab = {
		sync = {
			open = false,
			close = false,
			ignore = {},
		},
	},
	notify = {
		threshold = vim.log.levels.INFO,
		absolute_path = true,
	},
	ui = {
		confirm = {
			remove = true,
			trash = true,
		},
	},
	experimental = {},
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
