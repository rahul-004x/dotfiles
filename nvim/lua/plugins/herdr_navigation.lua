-- Seamless <C-h/j/k/l> movement between nvim windows and herdr panes,
-- the same behaviour vim-tmux-navigator gave under tmux.
--
-- herdr owns <C-h/j/k/l> and forwards them to nvim when nvim is the pane's
-- foreground process (see ~/.config/herdr/navigate.sh). nvim moves between
-- its own windows first and only hands focus back to herdr at the edge.

local M = {}

local herdr_direction_by_wincmd_key = {
	h = "left",
	j = "down",
	k = "up",
	l = "right",
}

local function focus_herdr_pane(direction)
	local pane_id = vim.env.HERDR_PANE_ID
	if not pane_id then
		return
	end
	local herdr_executable = vim.env.HERDR_BIN_PATH or "herdr"
	-- Async so a slow socket round-trip never freezes the editor.
	vim.system({ herdr_executable, "pane", "focus", "--pane", pane_id, "--direction", direction })
end

function M.navigate(wincmd_key)
	local window_before = vim.api.nvim_get_current_win()
	vim.cmd("wincmd " .. wincmd_key)
	local is_at_edge = vim.api.nvim_get_current_win() == window_before
	if is_at_edge and vim.env.HERDR_ENV then
		focus_herdr_pane(herdr_direction_by_wincmd_key[wincmd_key])
	end
end

function M.setup()
	for wincmd_key, direction in pairs(herdr_direction_by_wincmd_key) do
		vim.keymap.set({ "n", "t" }, "<C-" .. wincmd_key .. ">", function()
			M.navigate(wincmd_key)
		end, { desc = "Navigate " .. direction .. " (nvim window, then herdr pane)" })
	end
end

return M
