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

<a id="Keymaps"></a>
<img src="https://readme-typing-svg.herokuapp.com?font=Lexend+Giga&size=25&pause=1000&color=9A9A9A&vCenter=true&width=435&height=25&lines=KEYBINDS+REFERENCE" width="450"/>

> [!NOTE]
> The `leader` key is set to `space`. You can use `<space>k` to fuzzy search for a specific keymap. Also, you can change any keybind to whatever you desire.

### Global Keymaps (`global-keymaps.lua`)

| Key | Mode | Description |
|---|---|---|
| `<Space>` | Normal | Disable space (leader key) |
| `jk` | Insert | Exit insert mode |
| `sa` | Normal | Select all |
| `<C-d>` | Normal | Scroll down and center |
| `<C-u>` | Normal | Scroll up and center |
| `<C-h>` | Normal | Move to left split |
| `<C-l>` | Normal | Move to right split |
| `<C-j>` | Normal | Move to split below |
| `<C-k>` | Normal | Move to split above |
| `<Leader>p` | Visual | Paste without overwriting register |
| `<Leader>_` | Normal | Vertical split |
| `<Leader>-` | Normal | Horizontal split |
| `j` | Normal | Move down (visual lines) |
| `k` | Normal | Move up (visual lines) |
| `<Leader>f` | Normal | Format buffer |
| `<leader>b` | Normal | Open file in browser |
| `<Space>` | Terminal | Space in terminal mode |
| `<Leader>t` | Normal | Toggle terminal |
| `jk` | Terminal | Exit terminal mode |
| `<C-h>` | Terminal | Move to left split |
| `<C-j>` | Terminal | Move to split below |
| `<C-k>` | Terminal | Move to split above |
| `<C-l>` | Terminal | Move to right split |
| `<Leader>_` | Terminal | New terminal in vertical split |


### Alpha (Dashboard) (`plugins/alpha.lua`)

| Key | Description |
|---|---|
| `f` | Find file |
| `n` | New file |
| `p` | Projects |
| `r` | Recent files |
| `q` | Quit |


### Blink.cmp (Completion) (`plugins/blink.lua`)

| Key | Description |
|---|---|
| `<C-y>` | Toggle completion / show docs |
| `<C-n>` | Select and accept |
| `<C-k>` | Select previous item |
| `<C-j>` | Select next item |
| `<C-b>` | Scroll documentation down |
| `<C-f>` | Scroll documentation up |
| `<C-l>` | Next snippet placeholder |
| `<C-h>` | Previous snippet placeholder |
| `<CR>` | Accept and enter (cmdline) |


### Bufferline (`plugins/bufferline.lua`)

| Key | Description |
|---|---|
| `<A-1>` to `<A-9>` | Go to buffer 1-9 |
| `<A-0>` | Go to last buffer |
| `<leader>bp` | Pin buffer |
| `<leader>bd` | Close buffer |
| `<leader>br` | Close buffers to the right |
| `<leader>bl` | Close buffers to the left |


### Fzf-lua (`plugins/fzf.lua`)

#### Global keymaps

| Key | Description |
|---|---|
| `<C-f>` | Find files |
| `<C-g>` | Live grep |
| `<leader>k` | Find keymaps |
| `<leader>h` | Find help |
| `<leader>fb` | Find buffers |

#### Fzf window keymaps

| Key | Description |
|---|---|
| `<C-f>` | Preview page down |
| `<C-b>` | Preview page up |
| `<C-p>` | Toggle preview |

#### Fzf navigation

| Key | Description |
|---|---|
| `ctrl-a` | Toggle all |
| `ctrl-t` | Jump to first result |
| `ctrl-g` | Jump to last result |
| `ctrl-d` | Half page down |
| `ctrl-u` | Half page up |

#### File actions

| Key | Description |
|---|---|
| `ctrl-q` | Send selection to quickfix |
| `ctrl-n` | Toggle .gitignore |
| `ctrl-h` | Toggle hidden files |
| `enter` | Open file or quickfix |


### Oil.nvim (`plugins/oil.lua`)

| Key | Description |
|---|---|
| `e` | Toggle oil file explorer |
| `<CR>` | Open file/directory |
| `-` | Go up a directory |
| `_` | Go to current working directory |
| `g.` | Toggle hidden files |
| `gp` | Preview file |
| `q` | Close oil |


### Mini.nvim (`plugins/mini.lua`)

| Plugin | Default Keybinds |
|---|---|
| `mini.comment` | `gcc` = comment line, `gc` = comment in visual mode |
| `mini.move` | `Alt+h/j/k/l` = move lines/selection |
| `mini.pairs` | Auto-close brackets and quotes |
| `mini.ai` | `a/i` + `a/f/(,),/` text objects (functions, classes, arguments, tags) |

---

<a id="contributing"></a>
<img src="https://readme-typing-svg.herokuapp.com?font=Lexend+Giga&size=25&pause=1000&color=9A9A9A&vCenter=true&width=435&height=25&lines=CONTRIBUTING" width="450"/>

This is a personal config but suggestions are welcome. Feel free to open an issue if you spot something broken or have an idea worth adding. Pull requests are fine too — keep changes focused and explain the reasoning.

---

<a id="postscript"></a>
<img src="https://readme-typing-svg.herokuapp.com?font=Lexend+Giga&size=25&pause=1000&color=9A9A9A&vCenter=true&width=435&height=25&lines=POST+SCRIPT" width="450"/>

If this configuration helps you or you find it worth an appreciation. Please ⭐ this repo, I'd be grateful if you did. `La Pasion` .
