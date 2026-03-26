# Skill Registry — nvim

Generated: 2026-03-26

## Project Standards

- **Language**: Lua (Neovim config)
- **Plugin manager**: lazy.nvim (all plugins in `lua/plugins/*.lua`, auto-imported)
- **Indent**: 4 spaces (tabs expanded)
- **Comments**: Spanish
- **Keymaps**: `vim.keymap.set` via local `map` alias with `{ desc = "..." }`
- **Options**: `local opt = vim.opt` then `opt.*`
- **Leader**: `<Space>`
- **Formatters managed by mason**: stylua, prettierd, black, shfmt, goimports, rustfmt
- **Linters managed by mason**: eslint_d, pylint, golangci-lint

## User Skills

| Skill | Trigger | Path |
|-------|---------|------|
| judgment-day | "judgment day", "juzgar", "dual review", "que lo juzguen" | `~/.claude/skills/judgment-day/SKILL.md` |

## Compact Rules

### lua
- Return a lazy.nvim spec table from each plugin file in `lua/plugins/`
- Use 4-space indentation
- Prefer `opts = { ... }` over `config = function() ... end` when no complex setup is needed
- Comments in Spanish
- Keymaps use `{ desc = "..." }` — always include a description

### keymaps
- Group under leader prefixes: `<leader>l*` for LSP, `<leader>g*` for git, `<leader>c*` for code actions, `<leader>w*` for windows, `<leader>b*` for buffers
- Use `<leader>` + mnemonic letter; document with `desc`
- Never override arrow keys (already nopped)

### plugins
- Each plugin lives in its own file under `lua/plugins/`
- Use `event`, `cmd`, or `ft` for lazy-loading
- LSP servers are managed through `mason-lspconfig` — add new servers to `ensure_installed` in `lua/plugins/lsp.lua`
- Formatters/linters installed via `mason-tool-installer` in `lua/plugins/lsp.lua`
