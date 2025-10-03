vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = true
vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true
vim.g["conjure#client#clojure#nrepl#eval#pretty_print"] = true
vim.g["conjure#extract#tree_sitter#enabled"] = true
vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure"
vim.g["conjure#completion#enabled"] = true
vim.g["conjure#completion#omnifunc"] = "v:lua.require'blink.cmp'.omnifunc"
vim.g["conjure#mapping#doc_word"] = false -- Let LSP handle K
vim.g["conjure#log#hud#enabled"] = true -- Use buffer, not popup
vim.g["conjure#mapping#log_vsplit"] = false
vim.g["conjure#mapping#log_tab"] = false

vim.g["conjure#mapping#session_select"] = false
vim.g["conjure#mapping#session_prev"] = false
vim.g["conjure#mapping#session_next"] = false
vim.g["conjure#mapping#session_list"] = false
vim.g["conjure#mapping#session_close"] = false
vim.g["conjure#mapping#session_close_all"] = false
vim.g["conjure#mapping#session_fresh"] = false
vim.g["conjure#mapping#session_clone"] = false
vim.g["conjure#client#clojure#nrepl#test#current_form_names"] =
	{ "deftest", "defflow", "defflow-i18n", "defspec", "facts" }

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = { "conjure-log-*" }, -- Conjure REPL buffer pattern
	callback = function()
		local total_cols = vim.o.columns
		local target_width = math.floor(total_cols * 0.3)
		vim.cmd("vertical resize " .. target_width)
	end,
})
