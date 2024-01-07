local ls = require("luasnip")
local f = ls.function_node
local treesitter_postfix = require("luasnip.extras.treesitter_postfix").treesitter_postfix

-- TODO console.log postfix completion
-- treesitter_postfix({
--     trig = ".log",
--     matchTSNode = {
--         query = [[
--             [
--               (identifier)
--               (expression_statement)
--             ] @prefix
--         ]],
--         query_lang = "javascript",
--     },
-- }, {
--     f(function(_, parent)
--         local node_content = table.concat(parent.snippet.env.LS_TSMATCH, '\n')
--         local replaced_content = ("console.log(%s)"):format(node_content)
--         return vim.split(ret_str, "\n", { trimempty = false })
--     end)
-- })
