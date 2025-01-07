return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",

  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Right>"] = { "snippet_forward", "fallback" },
      ["<Left>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" } },
    },
  },
}
