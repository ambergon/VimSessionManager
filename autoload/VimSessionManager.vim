



function! VimSessionManager#LoadSession( name )
    let l:file = g:VimSelectSessionDirectory. '/' . a:name
    if filereadable(l:file)
        execute("source " . l:file )
    endif
    echo 'load session'
endfunction



function! VimSessionManager#SaveSession( name )
    
    let l:file_ext = ''
    if a:name =~ '\.vim$'
        l:file_ext = a:name
    else
        l:file_ext = a:name . '.vim'
    endif

    call VimSessionManager#checkDirectory()
    let l:file = g:VimSelectSessionDirectory. '/' . l:file_ext
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


function! VimSessionManager#DeleteSession( name )
    let l:file = g:VimSelectSessionDirectory. '/' . a:name
    if filereadable(l:file)
        echo 'delete this session? y / other'
        let l:c = getcharstr()
        if l:c == 'Y' || l:c == 'y'
            call delete( l:file )
            echo 'delete session'
        else
            echo 'do not'
        endif
    else
        echo 'not exist file : ' . l:file
    endif
endfunction


function! VimSessionManager#checkDirectory()
    if !isdirectory(g:VimSelectSessionDirectory)
        call mkdir(g:VimSelectSessionDirectory)
        echo 'mkdir ' . g:VimSelectSessionDirectory
    endif
endfunction























