-- Minify all the things
return {
  {
    'Wansmer/treesj',
    keys = {
      '<space>m',
    },
    config = function()
      require('treesj').setup {}
    end,
  },
}
