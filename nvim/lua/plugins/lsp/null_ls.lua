local null_ls = require("null-ls")

local null_ls_sources = {
  formatting = {
      "eslint_d",
      "erb_lint",
      "stylua",
      "rubocop",  -- Require ruby version >= 2.6.0 & gem install onkcop
  },
}

local sources = {
  null_ls.builtins.formatting.rubocop,
  null_ls.builtins.diagnostics.rubocop,
  null_ls.builtins.code_actions.eslint_d,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.diagnostics.erb_lint,
  null_ls.builtins.formatting.erb_lint
}

for type, type_sources in pairs(null_ls_sources) do
  for _, source in ipairs(type_sources) do
    if source == "jq" then
      table.insert(
        sources,
        null_ls.builtins[type][source].with({
            args = { "--indent", "2" },
        })
      )
    else
      table.insert(sources, null_ls.builtins[type][source])
    end
  end
end

local lspconfig = require("lspconfig")

null_ls.setup({
  sources = sources,
  border = "rounded",
  root_dir = lspconfig.util.root_pattern(
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.yml",
		".eslintrc.json"
	),
})
