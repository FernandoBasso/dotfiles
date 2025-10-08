return {
	'zbirenbaum/copilot.lua',
	cmd = 'Copilot',
	event = 'InsertEnter',
	config = function()
		require('copilot').setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = '<Tab>',
					next = '<M-]>',
					prev = '<M-[>',
					dismiss = '<C-]>',
				},
			},
			panel = { enabled = false },
		})

		vim.keymap.set('n', '<leader>gc', function()
			require('copilot.suggestion').toggle_auto_trigger()
		end, { desc = 'Toggle [G]ithub [C]opilot' })
	end,
}
