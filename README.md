# Neovim Config

Personal Neovim config using `lazy.nvim`, LSP, completion, [fff](https://github.com/dmtrKovalenko/fff) for file and content search, Tree-sitter, and a local Vercel colorscheme (`colors/vercel.lua`) that follows the terminal's light/dark appearance.

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

The default theme is the local `colors/vercel.lua` (Geist palette, light and
dark), set in `lua/conf/init.lua`. It picks its palette from `'background'`,
which Neovim updates from the terminal — so with Ghostty following the macOS
appearance, Neovim does too. `:set background=light` / `dark` forces one.

The local Slate/Chalk themes remain available as alternates:

```vim
:colorscheme slate
:colorscheme chalk
```

Both are local ports adapted from Ghostex's bundled themes.
