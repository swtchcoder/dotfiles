--[[
The nvim-treesitter plugin provides
1. functions for installing, updating, and removing tree-sitter parsers;
2. a collection of queries for enabling tree-sitter features built into Neovim
   for these languages;
3. a staging ground for treesitter-based features considered for upstreaming
   to Neovim.
]]
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate"
}
