" Go in to writing mode, with hard wrapping at 80 chars
noremap <silent> <Leader>w :call WritingMode()<CR>
function WritingMode()
  echo "Writing Mode ON"
  setlocal nocursorline
  setlocal colorcolumn=
  setlocal formatoptions=ant
  setlocal textwidth=80
  setlocal wrapmargin=0
  setlocal foldcolumn=10
  setlocal spell
  highlight NonText ctermfg=darkgray
  highlight StatusLine ctermfg=black ctermbg=darkgray cterm=NONE
  " highlight two spaces between sentences -- we only want one
  match ExtraWhitespace /\.\s\s\S/
  " auto-remove EOL whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e
endfunction

" Switch a soft-wrapped file to hard wrapped
noremap <silent> <Leader>h :call HardWrap()<CR>
function HardWrap()
  setlocal textwidth=80
  setlocal noautoindent
  setlocal nocindent
  setlocal nosmartindent
  setlocal indentexpr=
  normal gggqG
endfunction

" Switch a hard-wrapped file to soft wrapped
noremap <silent> <Leader>s :call SoftWrap()<CR>
function SoftWrap()
  setlocal textwidth=999999
  normal gggqG
endfunction
