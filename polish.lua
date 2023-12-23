-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
  vim.filetype.add {
    extension = {
      -- mdx = "mdx",
      -- mdx = 'markdown.mdx',
      -- md = "markdown",
      -- mdx = 'astro-markdown',
      -- md = "astro-markdown",
    },
  }
  -- local ft_to_parser = require("nvim-treesitter.parsers"). ft_to_parser.mdx = "markdown"
  -- vim.treesitter
  -- .language
  -- .register ( "mdx", "markdown"  )
  vim.treesitter.language.register("markdown", "mdx")
  --
  --     vim.treesitter.language.register("astro-markdown", "mdx")
  --     vim.treesitter.language.register("astro-markdown", "md")
  -- vim.treesitter.language.register("astro-markdown", "makrdown")
  -- Set up custom filetypes
  vim.filetype.add {
    extension = {
      md = "markdown",
    },
    filename = {
      ["Markdown"] = "markdown",
    },
    pattern = {
      ["*.md"] = "markdown",
    },
  }
  --
  require "user.autocmds"
  vim.filetype.add {
    extension = {
      astro = "astro",
    },
  }

  local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
  }
  local hooks = require "ibl.hooks"
  -- create the highlight groups in the highlight setup hook, so they are reset
  -- every time the colorscheme changes
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  end)

  vim.g.rainbow_delimiters = { highlight = highlight }
  require("ibl").setup { scope = { highlight = highlight } }

  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end
