# zielisme.nvim

Here lies my Neovim setup :3.

![](./assets/dashboard.png)

![](./assets/code.png)

## How to install

Before installing this Neovim configuration, you need to do this following steps.

### Install dependencies

You must first install these dependencies using your favorite package manager:

1. `neovim`, e.g. `brew install neovim`, `sudo pacman -S neovim`, and etc.
2. Any patched font such as MesloLG Nerd Font (used in the screenshot), JetBrainsMono Nerd Font, and etc.

Moreover, you can install these dependencies in order for specific language server and/or formatter to work properly.

1. Rust: `rust-analyzer`(optional).
2. Python: `black`, e.g. `brew install black`.
3. Eslint: `vscode-langservers-extracted`, e.g. `npm install -g vscode-langservers-extracted` (optional).
4. Markdown: `marksman`, e.g. `brew install marksman` (optional).
5. JavaScript & TypeScript: `typescript` and `typescript-language-server`, e.g. `npm install -g typescript typescript-language-server` (optional). It also supports `jsx` and `tsx`.

6. Go: `gopls`, e.g. `go install golang.org/x/tools/gopls@latest`

### Backup previous configuration

If you have previous Neovim configuration, it's recommended to back it up unless you don't want it to.

```bash
mv ~/.config/nvim ~/.config/nvim.old
```

### Install Neovim configuration

To install this configuration, you need to clone this repository to `$HOME/.config/nvim` (on Linux or Mac).

```bash
git clone git@github.com:fzl-22/zielisme.nvim.git "$HOME/.config/nvim" && nvim
```

Once the plugins are installed, restart Neovim to start using it.

## Attribution

This configuration is adapted from [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) and draws significant inspiration from [NvChad/NvChad](https://github.com/NvChad/NvChad)
