return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {"nvim-telescope/telescope-file-browser.nvim"},
  },

  cmd = {'Telescope'},

  opts = {
    defaults = {
      file_ignore_patterns = {
        ".git/",
        ".cache",
        "%.o", "%.a",
        "%.out",
        "%.class",
        "%.pdf",
        "%.mkv",
        "%.mp4",
        "%.zip",
        "node_modules/"
      },
    },
  },

  config = function()
    require('telescope').load_extension('fzf')
  end,

}
