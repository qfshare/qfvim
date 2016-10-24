

function! QFHighlightAutoDoc()
highlight despic ctermbg=6 ctermfg=0 guibg=blue guifg=white
2match despic /^ *#@description:\<\|\>/

highlight des ctermbg=10 ctermfg=0 guibg=blue guifg=white
2match des /^ *#@description:/

highlight faq guibg=Grey40 guifg=red
1match  faq /^ *#faq:/

highlight pnrwarn guibg=Grey40 guifg=white
3match pnrwarn /^ *.*-WARN.*/

endfunction
command! -nargs=? QFHighlightAutoDoc call QFHighlightAutoDoc(<args>)

function! QFHighlightMessage()
highlight pnrerror cterm=bold ctermbg=1 ctermfg=248 guibg=red guifg=white
2match pnrerror /^ *\(QF\|QF\)-ERROR.*/

highlight comerror ctermbg=14 ctermfg=1 guibg=Grey40 guifg=red
1match comerror / Error /

highlight pnrwarn ctermbg=14 ctermfg=248 guibg=Grey40 guifg=white
3match pnrwarn /^ *\(QF\|QF\)-WARN.*/

endfunction
command! -nargs=? QFHighlightMessage call QFHighlightMessage(<args>)

