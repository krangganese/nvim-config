# nvim Config

## Structure

```text
~/.config/nvim/
├── init.lua              # Config entry
├── .stylua.toml          # Lua formatter rules
└── lua/
    ├── config/           # nvim settings (no plugin deps)
    │   ├── options.lua
    │   ├── keymaps.lua
    │   ├── autocmds.lua
    │   └── lazy.lua
    └── plugins/          # lazy.nvim plugins
        ├── colorscheme.lua
        ├── mini.lua
        ├── editor.lua
        ├── treesitter.lua
        ├── completion.lua
        ├── lsp.lua
        ├── formatting.lua
        └── flutter.lua
```

## Key Note

| Symbol | Meaning | Example |
| :--- | :--- | :--- |
| `<leader>` | **Spacebar** (press `Space`, then the next keys) | `<leader>w` = `Space` then `w` |
| `<C-...>` | **Ctrl** + key | `<C-b>` = `Ctrl + b` |
| `<S-...>` | **Shift** + key | `<S-h>` = `Shift + h` |
| `<CR>` | **Enter / Return** | |
| `<Esc>` | **Escape** | |

---

## Keybindings Cheat Sheet

### General & Windows

| Key | Mode | Action |
| :--- | :--- | :--- |
| `<leader>w` | Normal | Save file |
| `<leader>qq` | Normal | Force quit all |
| `<Esc>` | Normal | Clear search highlight |
| `<C-v>` | Normal / Insert | Paste from system clipboard |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Normal | Move focus between left / lower / upper / right splits |
| `<Esc><Esc>` | Terminal | Exit terminal insert mode |
| `q` | Normal | Close help, quickfix, checkhealth, or info popups |

### Buffers

| Key | Mode | Action |
| :--- | :--- | :--- |
| `<S-h>` | Normal | Previous buffer |
| `<S-l>` | Normal | Next buffer |
| `<leader>bd` | Normal | Close current buffer |

### File Explorer & Search (`nvim-tree` & `fzf-lua`)

| Key | Mode | Action |
| :--- | :--- | :--- |
| `<C-b>` | Normal | Toggle file explorer |
| `<leader>e` | Normal | Focus file explorer |
| `<leader>ff` | Normal | Find files |
| `<C-p>` | Normal | Find Git tracked files |
| `<leader>fg` | Normal | Live grep across project |
| `<leader>fb` | Normal | Switch open buffers |
| `<leader>fw` / `<leader>fW` | Normal | Grep word / WORD under cursor |
| `<leader>fd` | Normal | List workspace diagnostics |
| `<leader>fk` / `<leader>fh` | Normal | Search keymaps / help tags |

### LSP & Code Navigation

| Key | Mode | Action |
| :--- | :--- | :--- |
| `K` | Normal | Show hover documentation |
| `gl` | Normal | Open line diagnostics in float |
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Find references |
| `gI` | Normal | Go to implementation |
| `<leader>D` | Normal | Type definition |
| `<leader>ds` / `<leader>ws` | Normal | Document symbols / Workspace symbols |
| `<leader>cr` | Normal | Rename symbol |
| `<leader>ca` | Normal / Visual | Code actions |
| `<leader>th` | Normal | Toggle inlay hints |

### Autocompletion (`blink.cmp`)

| Key | Mode | Action |
| :--- | :--- | :--- |
| `<C-l>` | Insert | Manually trigger completion menu |
| `<C-j>` / `<C-k>` | Insert | Next / previous completion item |
| `<C-y>` | Insert | Accept selected completion |
| `<C-e>` | Insert | Dismiss completion menu |

### Flutter Android (`flutter-tools.nvim`)

*Ehen opening `.dart` files or triggers anything below.*

| Key | Mode | Action |
| :--- | :--- | :--- |
| `<leader>Fr` | Normal | Run Flutter app (`:FlutterRun`) |
| `<leader>Fd` | Normal | Select target device (`:FlutterDevices`) |
| `<leader>Fe` | Normal | Launch Android emulator (`:FlutterEmulators`) |
| `<leader>Fh` | Normal | Hot reload |
| `<leader>FR` | Normal | Hot restart |
| `<leader>Fo` | Normal | Toggle widget outline |
| `<leader>Fl` | Normal | Toggle dev log split |
| `<leader>Fp` | Normal | Run `flutter pub get` |
| `<leader>Fq` | Normal | Quit running Flutter session |

### Debugger / DAP (`nvim-dap` & `nvim-dap-ui`)

| Key | Mode | Action |
| :--- | :--- | :--- |
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dc` | Normal | Start or continue debugging |
| `<leader>di` | Normal | Step into |
| `<leader>do` | Normal | Step over |
| `<leader>dO` | Normal | Step out |
| `<leader>du` | Normal | Toggle debug UI panels |
| `<leader>dt` | Normal | Terminate debug session |

### Formatting (`conform.nvim`)

*Files are formatted automatically on save 

| Key | Mode | Action |
| :--- | :--- | :--- |
| `<leader>bf` | Normal | Format current buffer manually |
| `<leader>br` | Normal | Save and run current file with `bun run %` |
| `<leader>bt` | Normal | Run `bun test` in a bottom split |
| `<leader>bi` | Normal | Run `bun install` in a bottom split |
