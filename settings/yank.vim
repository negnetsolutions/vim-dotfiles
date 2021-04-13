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

if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>
  endif
endif

" automatically run yank(1) whenever yanking in Vim
" (this snippet was contributed by Larry Sanderson)
function! CopyYank() abort
  if match(v:event.regname, '+') != -1
    call Yank(join(v:event.regcontents, "\n"))
  endif
endfunction
autocmd TextYankPost * call CopyYank()
