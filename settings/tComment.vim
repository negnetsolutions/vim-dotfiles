if has('nvim')
map <leader>/ :CommentToggle<CR>

lua << EOF
require('nvim_comment').setup({
  create_mappings = true,
  comment_empty = true
})
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}
EOF
else
  nmap <silent> gcp <c-_>p
  map <leader>/ :TComment<CR>
endif
