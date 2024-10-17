vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { desc = '[N]ext [D]iagnostic'})
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = '[P]revious [D]iagnostic'})
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = '[R]ename'})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[A]ction'})
    vim.keymap.set('n', '<leader>cd', require('telescope.builtin').diagnostics, { desc = "[D]iagnostics"})
    vim.keymap.set('n', '<leader>ct', require('telescope.builtin').lsp_type_definitions, { desc = '[T]ype Definition'})
    vim.keymap.set('n', '<leader>cs', require('telescope.builtin').lsp_document_symbols, { desc = 'Document [S]ymbols'})
    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = '[F]ormat buffer'})
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition'})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences'})
    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation'})
    vim.keymap.set('n', '<S-k>', vim.lsp.buf.hover, {desc = 'Open Documentations'})
  end,
})

local lsp_config = require('lspconfig')

lsp_config.ts_ls.setup({})

lsp_config.lua_ls.setup({})

lsp_config.rust_analyzer.setup({})
