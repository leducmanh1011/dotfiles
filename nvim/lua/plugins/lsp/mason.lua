local mason = require("mason")

mason.setup({
  PATH = "prepend",
  ui = {
      check_outdated_packages_on_open = true,
      border = "rounded",
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
      },
  },
})
