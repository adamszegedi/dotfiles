local lsp_zero = require('lsp-zero')
local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

lsp_zero.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({
        buffer = bufnr,
    })

    nmap('[d', vim.diagnostic.goto_next, '[N]ext [D]iagnostic')
    nmap(']d', vim.diagnostic.goto_prev, '[P]revious [D]iagnostic')
    nmap('<leader>cr', vim.lsp.buf.rename, '[R]ename')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[A]ction')
    nmap('<leader>cd', require('telescope.builtin').diagnostics, "[D]iagnostics")
    nmap('<leader>ct', require('telescope.builtin').lsp_type_definitions, '[T]ype Definition')
    nmap('<leader>cs', require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols')
    nmap('<leader>cf', vim.lsp.buf.format, '[F]ormat buffer')
    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    -- Create a `:Format` local to the LSP Buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end)

require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    }
})

require('lspconfig').lua_ls.setup({})
