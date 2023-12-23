local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ 
        buffer = bufnr,
        preserve_mappings = false
    })
end)

require('mason').setup({})
local rust_tools = require('rust-tools')

require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer' },
    handlers = {
        lsp_zero.default_setup,
        rust_analyzer = function()
            rust_tools.setup()
        end,
    }
})

