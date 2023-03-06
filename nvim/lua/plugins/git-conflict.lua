--------------
-- Commands --
--------------
-- GitConflictChooseOurs — Select the current changes.
-- GitConflictChooseTheirs — Select the incoming changes.
-- GitConflictChooseBoth — Select both changes.
-- GitConflictChooseNone — Select none of the changes.
-- GitConflictNextConflict — Move to the next conflict.
-- GitConflictPrevConflict — Move to the previous conflict.
-- GitConflictListQf — Get all conflict to quickfix

--------------
-- Mappings --
--------------
-- co — choose ours
-- ct — choose theirs
-- cb — choose both
-- c0 — choose none
-- ]x — move to previous conflict
-- [x — move to next conflict

return {
  "akinsho/git-conflict.nvim",
  -- tag = "*",
  config = function()
    require("git-conflict").setup({
      default_mappings = true, -- disable buffer local mapping created by this plugin
      default_commands = true, -- disable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = 'DiffAdd',
      } 
    })
  end
}
