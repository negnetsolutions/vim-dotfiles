"statusline setup

" hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
" hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black
" 
" function! MyStatusLine(mode)
" 
"   let statusline=""
"   if a:mode == 'Enter'
"     let statusline.="%#StatColor#"
"   endif
"   let statusline.="\(%n\)\ %f\ "
"   if a:mode == 'Enter'
"     let statusline.="%*"
"   endif
"   let statusline.="%#Modified#%m"
"   if a:mode == 'Leave'
"     let statusline.="%*%r"
"   elseif a:mode == 'Enter'
"     let statusline.="%r%*"
"   endif
"   return statusline
" 
" endfunction

" au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
" au WinLeave * setlocal statusline=%!MyStatusLine('Leave')

" set statusline=%!MyStatusLine('Enter')
" set statusline=%#StatColor#
set statusline=%#DiffAdd#
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline=%#DiffAdd#
set statusline+=%f\  
set statusline+=%#LineNr# "switch to colors used for line number
set statusline+=%{fugitive#statusline()}
set statusline+=%#DiffAdd#  "switch back to normal
set statusline+=%=      "left/right separator
set statusline+=%m      "modified flag

"display a warning if &paste is set
set statusline+=%#DiffChange#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%#LineNr# "switch to colors used for line number
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%#DiffAdd# "switch to colors used for line number
set statusline+=%c:     "cursor column
set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
set laststatus=2

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" function! InsertStatuslineColor(mode)
"   if a:mode == 'i'
"     hi StatColor guibg=orange ctermbg=lightred
"   elseif a:mode == 'r'
"     hi StatColor guibg=#e454ba ctermbg=magenta
"   elseif a:mode == 'v'
"     hi StatColor guibg=#e454ba ctermbg=magenta
"   else
"     hi StatColor guibg=red ctermbg=red
"   endif
" endfunction 
" 
" au InsertEnter * call InsertStatuslineColor(v:insertmode)
" au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

