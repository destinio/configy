return {
  "nvim-zh/colorful-winsep.nvim",
  config = function()
    require("colorful-winsep").setup({
      highlight = {
        fg = "#ff0000", -- Border color
        bg = "NONE", -- Background (optional)
      },
      no_exec_files = { "packer", "lazy" }, -- Avoid affecting plugin windows
    })
  end,
}
