# Neovim Config

Personal Neovim config using `lazy.nvim`, LSP, completion, [fff](https://github.com/dmtrKovalenko/fff) for file and content search, Tree-sitter, and the [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) theme (hard contrast, dark) to match the terminal's Gruvbox Dark Hard.

Local Slate/Chalk themes are also kept as alternates; they were adapted from [Ghostex](https://github.com/maddada/Ghostex).

## Requirements

- Neovim 0.12+
- Git
- A Nerd Font, such as JetBrainsMono Nerd Font

## Install Neovim

macOS with Homebrew:

```sh
brew install neovim git
```

Windows with winget:

```powershell
winget install Neovim.Neovim
winget install Git.Git
```

Verify Neovim is available:

```sh
nvim --version
```

## Install Config

Clone this config to Neovim's config directory:

```sh
git clone https://github.com/IsaacWang254/nvim ~/.config/nvim
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

The default theme is [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)
with `contrast = "hard"` and a dark background — configured in
`lua/conf/plugins/gruvbox.lua` to match the terminal's Gruvbox Dark Hard.

The local Slate/Chalk themes remain available as alternates:

```vim
:colorscheme slate
:colorscheme chalk
```

Both are local ports adapted from Ghostex's bundled themes.
