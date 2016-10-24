
function! QFSpaceFold(...)
  let tab2space=repeat(nr2char(32),&ts)
  if a:0==0
    let g:HiStr='\t\|'.tab2space
  else
    let g:HiStr=a:1
  endif
  let g:hiLen=strlen(substitute(g:HiStr, ".", "x", "g"))
  set fillchars="fold:"
  set foldmethod=expr
  set foldexpr=QFFoldExpr(v:lnum)
  set foldtext=QFFoldText()
  hi Folded term=bold cterm=bold gui=bold
  hi Folded guibg=NONE guifg=LightBlue
  nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
endfunction

function! QFFoldExpr(lnum)
  if getline(a:lnum)!~'\S'
    return "="
  endif
  let si=getline(prevnonblank(a:lnum))
  let sj=getline(nextnonblank(a:lnum+1))
  let i=QFGetHi(si)
  let j=QFGetHi(sj)
  if j==i
    return "="
  elseif j>i
    return ">" . i 
  else
    return "<" . j
  endif
endfunction

function! QFGetHi(sline)
  let c=1
  while 1
    let shead='^\(' . g:HiStr . '\)\{' . string(c) . '}'
    if a:sline=~shead
      let c+=1
      continue
    endif
    break
  endwhile
  return (c)
endfunction

function! QFFoldText()
  let sLine=getline(v:foldstart)
  let tab2space=repeat(nr2char(32),&ts)
  let sLine=substitute(sLine,"\t",tab2space,"g")
  let a=(sLine=~"^" . nr2char(32))?".":"^"
  let sLine=substitute(sLine,a,"+","")
  let sLine=sLine . " ~" . string(v:foldend-v:foldstart)
  return sLine
endfunction

command! -nargs=? QFSpaceFold call QFSpaceFold(<args>)

