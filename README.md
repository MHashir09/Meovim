<div align="center">

<img src="https://readme-typing-svg.herokuapp.com?font=Lexend+Giga&size=30&pause=1000&color=9A9A9A&vCenter=true&width=435&height=40&lines=Mhiatic+Meovim" width="450"/>

Mhiatic Meovim( Yea meovim, it isn't a typo, I did this intentionally hehe ) is a simple yet powerful Neovim configuration I made for my personal use. It is modern and modular and can be used for professional development. It's a complete rewrite of my first Neovim configuration, but this time with a better and minimal configuration.

</div>

https://github.com/user-attachments/assets/c0b4f31c-e72c-4277-ab12-3f34e304b2f6

---

<a id="features"></a>
<img src="https://readme-typing-svg.herokuapp.com?font=Lexend+Giga&size=25&pause=1000&color=9A9A9A&vCenter=true&width=435&height=25&lines=FEATURES" width="450"/>

- **Native LSP** via Neovim 0.12's built-in `vim.lsp` — no legacy lspconfig setup
- **Auto-installing LSP servers** via Mason and mason-lspconfig
- **Robust completions** via blink.cmp with LSP, path, buffer, and snippet sources
- **Fuzzy finding** via fzf-lua — files, grep, buffers, keymaps, help
- **File navigation** via oil.nvim — edit the filesystem like a buffer
- **Visual buffer tabs** via bufferline with Alt+number switching
- **Statusline** via mini.statusline — mode, filename, diagnostics, filetype, line:col
- **Dashboard** via alpha-nvim with custom configuration
- **Syntax highlighting** via native Treesitter with auto-install
- **Quality of life modules** via mini.nvim — pairs, comments, move, ai text objects, indent scope
- **Discord presence** via cord.nvim
- **Markdown rendering** via markview.nvim
- **Nice UI** via noice.nvim

---

<a id="structure"></a>
<img src="https://readme-typing-svg.herokuapp.com?font=Lexend+Giga&size=25&pause=1000&color=9A9A9A&vCenter=true&width=435&height=25&lines=STRUCTURE" width="450"/>

```
~/.config/nvim/
├── init.lua                    # entry point — bootstraps lazy, loads core modules
└── lua/
    ├── vim-options.lua         # editor options (vim.opt)
    ├── functions-autocmds.lua  # autocmds and shared functions (toggle terminal etc)
    ├── global-keymaps.lua      # global keybindings
    └── plugins/
        ├── alpha.lua           # dashboard
        ├── blink.lua           # completions
        ├── bufferline.lua      # buffer tabs
        ├── colorscheme.lua     # colorscheme (koda.nvim & catppuccin too but it is commented out )
        ├── fzf.lua             # fuzzy finder
        ├── mason.lua           # LSP server management
        ├── mini.lua            # mini.nvim modules
        ├── miscellaneous.lua   # noice, markview and cord
        └── oil.lua             # file explorer
```

---

<a id="installation"></a>
<img src="https://readme-typing-svg.herokuapp.com?font=Lexend+Giga&size=25&pause=1000&color=9A9A9A&vCenter=true&width=435&height=25&lines=INSTALLATION" width="450"/>

**1. Dependencies**

> [!NOTE]
> All of the dependencies listed below might be already installed on your system depending on the linux distro you are using but its better to check and install if they aren't already installed. All of these dependencies are crucially required by this config and it may through weird errors if any of these isn't present so make sure to have them all installed.

- **Git**: You can follow these [steps](https://www.theodinproject.com/lessons/foundations-setting-up-git#step-1-install-git) to install git.
- **Nodejs**: You can follow these [steps](https://www.theodinproject.com/lessons/foundations-installing-node-js#installing-nvm) to install nvm and then install nodejs via it.
- **Treesitter-cli**: You can install tree-sitter-cli using node-package-manager as: `npm install tree-sitter-cli`.
- **Rust/Cargo**: You can follow these [steps](https://doc.rust-lang.org/book/ch01-01-installation.html) to install rust and cargo.
- **Unzip**: You can follow these [steps](https://linuxvox.com/blog/install-unzip-linux/#installing-unzip-on-different-linux-distributions) to install unzip for your linux distribution.
- *Wget & Curl*: You can follow these [steps](https://www.dotlinux.net/blog/how-to-install-wget-in-linux/#3-installing-wget-on-major-linux-distributions) to install wget and these [steps](https://www.dotlinux.net/blog/how-to-install-curl-in-linux/#1-prerequisites) to install curl for your favorite linux distribution.
- **Fzf**: You can follow these [steps](https://github.com/junegunn/fzf#installation) to install fzf utility. It is required by FzfLua plugin.
- **Nerd Font**: You can follow these [steps](https://www.nerdfonts.com/) to download your favorite nerd font. It is necessary for many stuff to show properly.
- **Neovim**: Finally you can simply install Neovim by using your distro's package manager as: `sudo <your package manager's syntax> neovim` . A `0.12` version Neovim is required for this configuration to work. You can check your Neovim version by: `nvim --version`. If its not 0.12  then your distro does not has 0.12v in its repo's yet. You can uninstall the previously installed Neovim and install it via source by following these [steps](https://github.com/neovim/neovim#install-from-source) .

**2. Clone the config**

```bash
# Back up existing config if you have one
mv ~/.config/nvim ~/.config/nvim.bak

# Or create the nvim directory if it doesn't exist already:
mkdir -p ~/.config/nvim

# Clone the repo
git clone https://github.com/MHashir09/nvim ~/.config/nvim
```

**3. Launch Neovim**

```bash
nvim
```

On first launch, lazy.nvim will bootstrap itself and install all plugins automatically. Mason will then install all LSP servers. This may take a minute or two depending on your connection.

> [!NOTE]
> If you see errors on the first launch, simply restart Neovim. Some plugins need to be installed before they can be configured.

---

<a id="lsp"></a>
<img src="https://readme-typing-svg.herokuapp.com?font=Lexend+Giga&size=25&pause=1000&color=9A9A9A&vCenter=true&width=435&height=25&lines=LSP+SERVERS" width="450"/>

The following LSP servers are installed and enabled automatically via Mason:

| Server | Language |
|---|---|
| `lua_ls` | Lua |
| `ts_ls` | TypeScript / JavaScript |
| `html` | HTML |
| `cssls` | CSS |
| `emmet_ls` | HTML / CSS abbreviations |
| `pyright` | Python |
| `ruff` | Python (linting) |
| `rust_analyzer` | Rust |
| `clangd` | C / C++ |
| `bashls` | Bash |
| `eslint` | JavaScript / TypeScript (linting) |

You can add or remove servers by editing `lua/plugins/mason.lua`.

> [!TIP]
> Run `:Mason` inside Neovim to manage servers manually — browse, install, update, or remove.

---
