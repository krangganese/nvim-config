return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-mini/mini.icons" },
	opts = {
		files = {
			rg_opts = "--files --hidden -g !.git -g !node_modules -g !dist",
		},
		grep = {
			rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden -g !.git -g !node_modules -g !dist",
		},
	},
}
