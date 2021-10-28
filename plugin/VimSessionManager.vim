" VimSessionManager
" Version: 0.0.1
" Author: ambergon
" License: MIT

"setting
"g:VimSelectSessionDir=

if exists('g:loaded_VimSessionManager')
  finish
endif
let g:loaded_VimSessionManager = 1

command! -nargs=1 -complete=customlist,CompInfo SessionSave call VimSessionManager#SaveSession('<args>')
command! -nargs=1 -complete=customlist,CompInfo SessionLoad call VimSessionManager#LoadSession('<args>')

if !exists("g:VimSelectSessionDir")
    let g:VimSelectSessionDirectory=expand("~/.cache/VimSession")
else
    let g:VimSelectSessionDirectory=expand(g:VimSelectSessionDir)
endif

function! CompInfo(lead, line, pos )
    let l:matches = []
    let l:dir = g:VimSelectSessionDirectory
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

