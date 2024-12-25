return {
	{ 'echasnovski/mini.nvim', version = false, config = function()
		require('mini.surround').setup()
		require('mini.ai').setup()
		require('mini.comment').setup()
		require('mini.icons').setup()
		require('mini.pairs').setup()
		require('mini.statusline').setup()
		require('mini.surround').setup()
		-- require('mini.tabline').setup()

	end },
}
