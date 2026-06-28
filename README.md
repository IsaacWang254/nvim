# Neovim Config

Personal Neovim config using `lazy.nvim`, LSP, completion, Telescope, nvim-tree, Tree-sitter, and local Slate/Chalk themes.

Slate and Chalk were adapted from [Ghostex](https://github.com/maddada/Ghostex).

## Requirements

- Neovim 0.12+
- Git
- A Nerd Font, such as JetBrainsMono Nerd Font

## Install

Clone this config to Neovim's config directory:

```sh
git clone <repo-url> ~/.config/nvim
```

Open Neovim once to bootstrap `lazy.nvim` and install plugins:

```sh
nvim
```

Install configured Tree-sitter parsers from inside Neovim:

```vim
:TSInstallConfigured
```

Mason will manage the configured LSP servers from `lua/conf/plugins/lsp.lua`.

## Themes

The default theme is `slate`:

```vim
:colorscheme slate
```

The matching light theme is also available:

```vim
:colorscheme chalk
```

Both themes are local ports adapted from Ghostex's bundled themes.
