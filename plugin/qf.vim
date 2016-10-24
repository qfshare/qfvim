
" load sub functions, run 'Call QFVimPath' to check the current path
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
function! QFVimPath()
  echom s:path
endfunction

" =.= update_time.vim
" source s:path/update_time.vim

" =.= utility.vim
" source s:path/utility.vim

" =.= space_fold.vim
" source s:path/space_fold.vim

" =.= message_highlight.vim
" source s:path/message_highlight.vim

" =.= ic_enhance.vim
" source s:path/ic_enhance.vim


