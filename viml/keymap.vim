" ========================================
" General vim sanity improvements
" ========================================
"
"make Y consistent with C and D
nnoremap Y y$

" Leader
let mapleader = ","
let maplocalleader = "\\"

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" ========================================
" RSI Prevention - keyboard remaps
" ========================================
" Certain things we do every day as programmers stress
" out our hands. For example, typing underscores and
" dashes are very common, and in position that require
" a lot of hand movement. Vim to the rescue
"
" Don't have to use Shift to get into command mode, just hit semicolon
nnoremap ; :

"Go to last edit location with ,.
nnoremap <leader>. '.

" ,q to toggle quickfix window (where you have stuff like GitGrep)
" ,oq to open it back up (rare)
nmap <silent> <leader>q :cclose<CR>
nmap <silent> <leader>oq :copen<CR>

"toggle between last two buffers with Z (normally ctrl-shift-6)
nnoremap <silent> <leader>z <C-^>

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Use Q to kill a buffer
nnoremap <silent> Q :bw<CR>

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <leader>cf :let @* = expand("%:p")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>pt :set paste<CR>:put  +<CR>:set nopaste<CR>

" copy to attached terminal using the yank(1) script:
" https://github.com/sunaku/home/blob/master/bin/yank
function! Yank(text) abort
  let escape = system('yank', a:text)
  if v:shell_error
    echoerr escape
  else
    call writefile([escape], '/dev/tty', 'b')
  endif
endfunction

" automatically run yank(1) whenever yanking in Vim
" (this snippet was contributed by Larry Sanderson)
function! CopyYank() abort
  if match(v:event.regname, '+') != -1
    call Yank(join(v:event.regcontents, "\n"))
  endif
endfunction

if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>
    autocmd TextYankPost * call CopyYank()
  elseif !v:shell_error && s:uname == "Darwin"
    noremap <silent> <Leader>y "*y
  endif
endif

" Map Commenting
map <leader>/ :CommentToggle<CR>

" Map Telescope Keys
nmap ,be :Telescope buffers<CR>
nmap ,f :Telescope find_files<CR>
nmap ,bd :Telescope diagnostics<CR>

nnoremap / /\v
vnoremap / /\v
