if !exists("g:VimSelectSessionDir")
    let s:VimSelectSession=expand("~/.cache/VimSession")
else
    let s:VimSelectSession=expand(g:VimSelectSessionDir)
endif

function! VimSessionManager#LoadSession( name )
    let l:file = s:VimSelectSession. '/' . a:name
    if filereadable(l:file)
        execute("source " . l:file )
    endif
    echo 'load session'
endfunction

function! VimSessionManager#SaveSession( name )
    call VimSessionManager#checkDirectory()
    let l:file = s:VimSelectSession. '/' . a:name
    if filereadable(l:file)
        echo 'overwrite? y / other'
        let l:c = getcharstr()
        if l:c == 'Y' || l:c == 'y'
            execute("mksession! " . l:file )
            echo 'save session'
        else
            echo 'do not'
        endif
    else
        execute("mksession! " . l:file )
        echo 'save session'
    endif
endfunction

function! VimSessionManager#checkDirectory()
    if !isdirectory(s:VimSelectSession)
        call mkdir(s:VimSelectSession)
        echo 'mkdir ' . s:VimSelectSession
    endif
endfunction

