# Neovim Config

Personal Neovim config using `lazy.nvim`, LSP, completion, [fff](https://github.com/dmtrKovalenko/fff) for file and content search, Tree-sitter, and Catppuccin Mocha.

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

## Theme

[Catppuccin](https://github.com/catppuccin/nvim) Mocha, configured in
`lua/conf/plugins/colorscheme.lua` and applied when lazy.nvim loads it.

Dark only. The terminal this runs in (Ghostty) is pinned to Mocha, so there is
no light background for a light variant to sit on — the palette is shared with
fish, bat, eza and atuin, all configured in the
[dotfiles repo](https://github.com/IsaacWang254/dotfiles).

This replaced two hand-written colorschemes, `slate` (dark) and `chalk`
(light), adapted from [Ghostex](https://github.com/maddada/Ghostex). They are
in the history if you want them back:

```sh
git log --diff-filter=D --format=%H -1 -- colors/slate.lua   # the commit that removed it
git show <that-commit>^:colors/slate.lua
```
