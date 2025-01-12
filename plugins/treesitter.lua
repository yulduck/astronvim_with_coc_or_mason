-- :TSInstall lua
-- NOTE: https://github.com/AstroNvim/AstroNvim/commit/377db3f7d6273779533c988dadc07a08e0e43f2e new textobject
-- NOTE: treesitter new textobject. k: block, c: class, ?: conditional, f: function, l: loop, a: parameter, ""< | > | A ,F ,K" swap textobject
local utils = require "astronvim.utils"
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Ensure that opts.ensure_installed exists and is a table or string "all".
    if opts.ensure_installed ~= "all" then
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "ron")
    end
    return require("astronvim.utils").extend_tbl(opts, {
      autotag = {
        enable = true,
        -- WARN: https://github.com/windwp/nvim-ts-autotag/issues/124 autocompletion bug
        enable_close_on_slash = true,
      },
      ensure_installed = { "astro", "tsx", "typescript", "html" },
      auto_install = true,
      highlight = {
        enable = true,
      },
    })
  end,
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
    -- [options]
  },
  lazy = false,
}

-- return require("astronvim.utils").extend_tbl(opts, {
--   auto_install = true,
--   ensure_installed = {
--     "http",
--     "go",
--     "regex",
--     "bash",
--     "markdown",
--     "markdown_inline",
--     "json",
--     "html",
--     "css",
--     "vim",
--     "lua",
--     "javascript",
--     "typescript",
--     "tsx",
--     "python",
--     "toml",
--     "markdown",
--     "markdown_inline",
--     "vue",
--     "prisma",
--   },
--   rainbow = {
--     enable = true,
--   },
--   highlight = {
--     enable = true,
--     --disable = function(lang, buf)
--     --    local max_filesize = 100 * 1024 -- 100 KB
--     --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--     --    if ok and stats and stats.size > max_filesize then
--     --        return true
--     --    end
--     --end,
--     additional_vim_regex_highlighting = { "markdown", "yaml" },
--   },
-- })
