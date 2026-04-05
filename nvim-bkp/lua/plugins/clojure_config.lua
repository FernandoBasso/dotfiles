return {
	{
		"Olical/conjure",
		ft = { "clojure", "racket", "scheme", "lisp" },
	},
	{
		"venantius/vim-cljfmt",
		ft = { "clojure" },
	},
	-- {
	-- 	"tpope/vim-dispatch",
	-- 	ft = { "clojure" },
	-- },
	{
		"clojure-vim/vim-jack-in",
		dependencies = { "tpope/vim-dispatch", "radenling/vim-dispatch-neovim" },
		ft = { "clojure" },
	},
	{
		"radenling/vim-dispatch-neovim",
		ft = { "clojure" },
	},
}
