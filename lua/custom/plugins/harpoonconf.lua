return {
  "badmagick329/harpoon",
  keys = {
    { "<leader>kk", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon Quickmenu" },
    { "<leader>ka", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Add file" },
    { "<leader>kq", "<cmd>lua require('harpoon.mark').nav_file(1)<CR>", desc = "Go to File 1" },
    { "<leader>kw", "<cmd>lua require('harpoon.mark').nav_file(2)<CR>", desc = "Go to File 2" },
    { "<leader>ke", "<cmd>lua require('harpoon.mark').nav_file(3)<CR>", desc = "Go to File 3" },
    { "<leader>kr", "<cmd>lua require('harpoon.mark').nav_file(4)<CR>", desc = "Go to File 4" },
    { "<leader>kt", "<cmd>lua require('harpoon.mark').nav_file(5)<CR>", desc = "Go to File 5" },
  }
}
