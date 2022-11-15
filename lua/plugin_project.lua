require("project_nvim").setup({
	patterns = { ".git", ".svn", ".clang-format", "Makefile", "go.mod", "package.json" },
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	},
})
