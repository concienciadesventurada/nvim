vim.pack.add({
  "https://github.com/folke/todo-comments.nvim"
})

-- OOTB keywords: FIX, TODO, HACK, WARN, PERF, NOTE, TEST
local keywords = {
  TODO = { icon = "⎕ ", color = "warning", alt = { "WARNING", "XXX", "MISSING" } },
  DONE = { icon = "🗹 ", color = "hint", alt = { "EXITO", "LISTO", "APROBADO" } },
  IDEA = { icon = "", color = "warning" },
  WARNING = { icon = "", color = "warning" },
  EN_PROCESO = { icon = "", color = "default", alt = { "ONGOING" } },
  PROCESO = { icon = "", color = "proceso", alt = { "PROCESO" } },
  POSTERGADO = { icon = " ", color = "warning" },
  PENDIENTE = { icon = " ", color = "error", alt = { "DEPENDE" } },
  ERROR = { icon = " ", color = "error", alt = { "WARNING", "FALLIDO", "MISSING" } },
  REQUISITO = { icon = " ", color = "info", alt = { "TRAMITE", "TRAMITOLOGIA" } },
}

local general = table.concat({ "TODO", "IDEA", "PROCESO", "PENDIENTE", "EN_PROCESO", "REQUISITO" }, ",")
local problemas = table.concat({ "ERROR", "PENDIENTE" }, ",")

require("todo-comments").setup({
  keywords = keywords,
  colors = { proceso = { "Identifier", "#FF00FF" } }
})

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>tc", "<cmd>TodoTelescope<cr>", { desc = "Todo... completo" })

vim.keymap.set("n", "<leader>tl", "<cmd>TodoTelescope keywords=DONE<cr>", { desc = "Todo listo o dones" })

vim.keymap.set("n", "<leader>tp", "<cmd>TodoTelescope keywords=ONGOING,EN_PROCESO,PROCESO,PENDIENTE<cr>",
  { desc = "Todo procesos" })

vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope keywords=TODO<cr>", { desc = "Todos" })

vim.keymap.set("n", "<leader>tt", ("<cmd>TodoTelescope keywords=%s<cr>"):format(general), { desc = "Todo por hacer" })

-- BUG: esto funciono un toque, pero le agregue el missing y se fue a la chucha en el markdown
vim.keymap.set("n", "<leader>tp", ("<cmd>TodoTelescope keywords=%s<cr>"):format(problemas), { desc = "Todo problemas" })
