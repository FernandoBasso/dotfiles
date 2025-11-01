local xs = {}
table.insert(xs, "one")
table.insert(xs, "two")
print(table.concat(xs, ", "))

vim.api.nvim_create_user_command(
  "LspStop",
  function()
    local buf = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients()
    local stopped = {}

    for _, client in pairs(clients) do
      vim.lsp.stop_client(client.id)
      table.insert(stopped, client.name)
    end

    print("Stopped: " .. table.concat(stopped, ", "))
  end,
  {
    desc = "Stop LSP clients for current buffer",
    force = false,
  }
)

vim.api.nvim_create_user_command("LspInfo", function()
	local buf = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = buf })
	local filetype = vim.bo[buf].filetype
	local buf_name = vim.api.nvim_buf_get_name(buf)

	print("LSP Information")
	print("===============")
	print("")

	print("Buffer: " .. (buf_name ~= "" and buf_name or "[No Name]"))
	print("Filetype: " .. (filetype ~= "" and filetype or "[No filetype]"))
	print("Buffer number: " .. buf)
	print("")

	if #clients == 0 then
		print("No LSP clients attached to this buffer")
		print("")

		local all_clients = vim.lsp.get_clients()
		if #all_clients > 0 then
			print("Available LSP clients (attached to other buffers):")
			for _, client in pairs(all_clients) do
				local attached_buffers = {}
				for _, attached_buf in pairs(client.attached_buffers) do
					table.insert(attached_buffers, tostring(attached_buf))
				end
				print(
					string.format(
						"  - %s (id: %d, buffers: %s)",
						client.name,
						client.id,
						table.concat(attached_buffers, ", ")
					)
				)
			end
		else
			print("No LSP clients running")
		end
	else
		print("Active LSP clients for this buffer:")
		print("")

		for i, client in pairs(clients) do
			print(string.format("Client %d: %s", i, client.name))
			print("  - id: " .. client.id)
			print("  - root directory: " .. (client.config.root_dir or "Not set"))
			print(
				"  - filetypes: "
					.. (client.config.filetypes and table.concat(client.config.filetypes, ", ") or "Not specified")
			)

			if client.server_capabilities then
				local caps = {}
				if client.server_capabilities.completionProvider then
					table.insert(caps, "completion")
				end
				if client.server_capabilities.hoverProvider then
					table.insert(caps, "hover")
				end
				if client.server_capabilities.definitionProvider then
					table.insert(caps, "goto_definition")
				end
				if client.server_capabilities.referencesProvider then
					table.insert(caps, "find_references")
				end
				if client.server_capabilities.documentFormattingProvider then
					table.insert(caps, "formatting")
				end
				if client.server_capabilities.renameProvider then
					table.insert(caps, "rename")
				end
				if client.server_capabilities.codeActionProvider then
					table.insert(caps, "code_actions")
				end

				if #caps > 0 then
					print("  - capabilities: " .. table.concat(caps, ", "))
				end
			end

			local attached_buffers = {}
			for _, attached_buf in pairs(client.attached_buffers) do
				table.insert(attached_buffers, tostring(attached_buf))
			end
			print("  - attached buffers: " .. table.concat(attached_buffers, ", "))

			local log_path = vim.lsp.get_log_path()
			if i == 1 then
				print("  - log file: " .. log_path)
			end

			print("")
		end
	end

	print("Helpful commands:")
	print("  :lua vim.lsp.buf.hover() - Show hover information")
	print("  :lua vim.lsp.buf.definition() - Go to definition")
	print("  :lua vim.lsp.buf.references() - Find references")
	print("  :lua vim.lsp.buf.format() - Format buffer")
	print("  :checkhealth lsp - Check LSP health")
end, {
	desc = "Show LSP client information for current buffer",
	force = true,
})
