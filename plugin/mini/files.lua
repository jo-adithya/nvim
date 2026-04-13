vim.pack.add({ "https://github.com/nvim-mini/mini.files" })

local options = {
  height_ratio = 0.75,
  width_ratio = 0.8,
  width_focused_ratio = 0.35,
  width_preview_ratio = 0.45,
}

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    vim.keymap.set("n", "q", function()
      MiniFiles.synchronize()
      MiniFiles.close()
    end, { buffer = args.data.buf_id })
  end,
})

-- Notes:
-- depth_focus == 1: means the focused window is at the very left

local ensure_center_layout = function(ev)
  vim.schedule(function()
    local state = MiniFiles.get_explorer_state()
    if state == nil then
      return
    end

    -- get the current window global/absolute depth from mini files state
    local path_this = vim.api.nvim_buf_get_name(ev.data.buf_id):match("^minifiles://%d+/(.*)$")
    local depth_this
    for i, path in ipairs(state.branch) do
      if path == path_this then
        depth_this = i
      end
    end
    if depth_this == nil then
      return
    end

    local depth_offset = depth_this - state.depth_focus

    local total_width = math.floor(options.width_ratio * vim.o.columns)
    local width_focused = math.floor(options.width_focused_ratio * total_width)
    local width_child = math.floor(options.width_preview_ratio * total_width)
    local width_other = total_width - width_focused - width_child

    -- Determine this window's width based on its position
    local win_width
    if depth_offset == 0 then
      win_width = width_focused
    elseif depth_offset == 1 then
      win_width = width_child
    else
      win_width = width_other
    end

    local win_config = vim.api.nvim_win_get_config(ev.data.win_id)
    win_config.width = win_width
    win_config.zindex = 99
    win_config.col = math.floor(0.5 * (vim.o.columns - width_focused))

    local leftmost_col = math.floor(0.5 * (vim.o.columns - total_width))
    local col

    local num_left = 0
    for i, w in ipairs(state.windows) do
      if w.win_id == ev.data.win_id then
        num_left = i - 1
      end
    end

    -- calculate the col position of each window
    local num_windows = #state.windows
    if depth_offset == 0 then
      col = leftmost_col + num_left * (width_other + 2)
    elseif depth_offset == 1 then
      col = leftmost_col + (num_left - 1) * (width_other + 2) + width_focused + 2
    elseif depth_offset >= 2 then
      col = leftmost_col + (num_left - 2) * (width_other + 2) + width_focused + 2 + width_child + 2
    else
      col = leftmost_col + num_left * (width_other + 2)
    end

    win_config.col = col
    win_config.height = math.floor(0.75 * vim.o.lines)
    win_config.row = math.floor(0.5 * (vim.o.lines - win_config.height))
    vim.api.nvim_win_set_config(ev.data.win_id, win_config)

    -- Set the win border highlight
    if depth_offset == 0 then
      vim.wo[ev.data.win_id].winhighlight = "FloatBorder:MiniFilesBorderFocused"
      vim.wo[ev.data.win_id].relativenumber = true
      vim.wo[ev.data.win_id].statuscolumn = " %=%{v:relnum?v:relnum:v:lnum}   "
    else
      vim.wo[ev.data.win_id].winhighlight = "FloatBorder:MiniFilesBorder"
      vim.wo[ev.data.win_id].relativenumber = false
      vim.wo[ev.data.win_id].statuscolumn = " "
    end
  end)
end

vim.api.nvim_create_autocmd("User", { pattern = "MiniFilesWindowUpdate", callback = ensure_center_layout })

require("mini.files").setup({
  content = {
    prefix = function(fs_entry)
      local prefix, hl = MiniFiles.default_prefix(fs_entry)
      return prefix .. " ", hl -- add extra space after the icon
    end,
  },
  windows = {
    preview = true,
    width_preview = 50,
    max_number = 3,
  },
  mappings = {
    go_in = "l",
    go_in_plus = "l",
    go_out = "h",
    go_out_plus = "",
  },
})

vim.api.nvim_set_hl(0, "MiniFilesBorderFocused", { link = "MiniIconsBlue" })
vim.api.nvim_set_hl(0, "MiniFilesBorder", { link = "Comment" })

vim.keymap.set("n", "<leader>e", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open file explorer" })
