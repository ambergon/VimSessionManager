" VimSessionManager
" Version: 0.0.2
" Author: ambergon
" License: MIT

"setting
"g:VimSelectSessionDir=

if exists('g:loaded_VimSessionManager')
  finish
endif
let g:loaded_VimSessionManager = 1

command! -nargs=1 -complete=customlist,VimSessionManager#CompInfo SessionSave call VimSessionManager#SaveSession('<args>')
command! -nargs=? -complete=customlist,VimSessionManager#CompInfo SessionLoad call VimSessionManager#LoadSession('<args>')
command! -nargs=1 -complete=customlist,VimSessionManager#CompInfo DeleteSession call VimSessionManager#DeleteSession('<args>')




if !exists("g:VimSelectSessionDir")
    let g:VimSelectSessionDirectory=expand("~/.cache/VimSession")
else
    let g:VimSelectSessionDirectory=expand(g:VimSelectSessionDir)
endif


function! VimSessionManager#CompInfo(lead, line, pos )
    let l:matches = []
    let l:dir = g:VimSelectSessionDirectory
    let l:sep = fnamemodify(',' , ':p')[-1:]
    let l:Filter = { file -> !isdirectory( l:dir . l:sep . file ) }
    let l:files = readdir( l:dir , l:Filter )

    for file in l:files
        if file =~ '\.vim$'
            if file =~? '^' . strpart(a:lead,0)
                call add(l:matches,file)
            endif
        endif
    endfor
    return l:matches
endfunction





















