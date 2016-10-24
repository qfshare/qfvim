function! Dedumplicate()
  sort
  %s/^\(.*\)\(\n\1\)\+$/\1/
  "g/^\(.*\)$\n\1/d
endfunction
command -nargs=0 QFDedumplicate call Dedumplicate()





function! Tabback()
  set ts=2
  set noexpandtab
  %retab!
endfunction
command -nargs=0 QFTabback call Tabback()

