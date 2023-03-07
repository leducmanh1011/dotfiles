local null_ls = require("null-ls")

local null_ls_sources = {
  formatting = {
      "eslint",
      "erb_lint",
      "stylua",
      "rubocop",
  },
}

local sources = {
  null_ls.builtins.formatting.rubocop,
  null_ls.builtins.diagnostics.rubocop,
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

null_ls.setup({
  sources = sources,
  border = "rounded",
})
