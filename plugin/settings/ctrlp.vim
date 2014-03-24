let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_map = ',t'

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|vendor\/symfony$',
      \ 'file': '\.exe$\|\.so$\|\.dll$' }

" let g:ctrlp_user_command = {
"       \ 'types': {
"       \ 1: ['.git', 'cd %s && git ls-files'],
"       \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"       \ },
"       \ 'fallback': 'find %s -type f'
"       \ }

let g:ctrlp_root_markers = ['.git/']

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
