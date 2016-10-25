" File: update_time.vim
" Last Change: 2016-10-24 15:38:06 PDT
" Description: Automatic update Last Change time

" SECTION: Init"{{{
if exists("g:qf_loaded_update_time")
    finish
endif
let g:qf_loaded_update_time = 1

let s:save_cpo = &cpo
set cpo&vim
"}}}
" SECTION: Varible"{{{
if !exists('g:qf_update_time_time_stamp_leader')
    let s:time_stamp_leader = 'Last Change: '
else
    let s:time_stamp_leader = g:qf_update_time_time_stamp_leader
endif

if !exists('g:qf_update_time_time_format')
    let s:time_format = '%Y-%m-%d %H:%M:%S %Z'
else
    let s:time_format = g:qf_update_time_time_format
endif

if !exists("g:qf_update_time_line_start")
    let s:begin_line = 0
else
    let s:begin_line = g:qf_update_time_line_start
endif

if !exists('g:qf_update_time_line_end')
    let s:end_line = 10
else
    let s:end_line = g:qf_update_time_line_end
endif

if !exists('g:qf_update_time_enable')
    let s:qf_update_time_enable = 1
else
    let s:qf_update_time_enable = g:qf_update_time_enable
endif
"}}}
" SECTION: Funtions"{{{
fun Update_time_update()
    if ! &modifiable
        return
    endif
    if ! s:qf_update_time_enable
        return
    endif
    let bufmodified = getbufvar('%', '&mod')
    if ! bufmodified
        return
    endif
    let pos = line('.').' | normal! '.virtcol('.').'|'
    exe s:begin_line
    let line_num = search(s:time_stamp_leader, '', s:end_line)
    if line_num > 0
        let line = getline(line_num)
        let line = substitute(line, s:time_stamp_leader . '\zs.*', strftime(s:time_format), '')
        call setline(line_num, line)
    endif
    exe pos
endf
fun Update_time_toggle()
    if !exists('s:update_time_enable')
      let s:update_time_enable = 1
    endif
    let s:update_time_enable = !s:update_time_enable
endf
"}}}
" SECTION: Autocommands"{{{
autocmd BufWritePre * call Update_time_update()
"}}}
" SECTION: Commands"{{{
com! -nargs=0 QFUpdateTimeToggle call Update_time_toggle()
"}}}
" SECTION: Clean up"{{{
let &cpo = s:save_cpo
unlet s:save_cpo
"}}}             

" vim: ft=vim foldmethod=marker
