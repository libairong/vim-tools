function! g:utils#GetStrByInput()
   let str = input('Search string: ')
   return str
endfunction

function! g:utils#CurDir()
   let curdir = substitute(getcwd(), '/home/', "~/", "g")
   return curdir
endfunction

function! g:utils#GetFullPath()
   let currPath = getcwd()
   return currPath
endfunction

function! g:utils#GetFullPathForSed()
   let currPath = substitute(getcwd(), '/', '\\/', 'g')
   return currPath . '\/'
endfunction

function! g:utils#FileIsExisted(fileName)
   if findfile(a:fileName, ".") == a:fileName
     return "exited"
   endif
   return "NoExited"
endfunction

function! g:utils#CreateVimFile()
    let cwd = getcwd()
    let vimCacheFile = '.vim' . substitute(cwd, '/', '-', 'g')
    let filepath = cwd . '/' . vimCacheFile
    if !filereadable(filepath)
        execute 'silent !touch ' . vimCacheFile
    endif
    return vimCacheFile
endfunction

