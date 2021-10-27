" VimSessionManager
" Version: 0.0.1
" Author: 
" License: 

if exists('g:loaded_VimSessionManager')
  finish
endif
let g:loaded_VimSessionManager = 1

if !exists("g:VimSelectInfoDir")
    let s:VimSelectSession=expand("~/.cache/viminfo")
else
    let s:VimSelectSession=expand(g:VimSelectInfoDir)
endif

command! -nargs=? -complete=customlist,CompInfo SelectSession call VimSessionManager#SelectSession('<args>')

function! CompInfo(lead, line, pos )
    let l:matches = []
    let l:dir = s:VimSelectSession
    let l:sep = fnamemodify(',' , ':p')[-1:]
    let l:Filter = { file -> !isdirectory( l:dir . l:sep . file ) }
    let l:files = readdir( l:dir , l:Filter )

    for file in l:files
        if file =~? '^' . strpart(a:lead,0)
            call add(l:matches,file)
        endif
    endfor
    return l:matches
endfunction

"let s:save_cpo = &cpo
"set cpo&vim
"
"
"let &cpo = s:save_cpo
"unlet s:save_cpo

" vim:set et:

"""setting
""dir
""

""save
""load
