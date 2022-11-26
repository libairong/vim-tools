function! g:utils#GetStrByInput()
   let str = input('Search string: ')
   return str
endfunction

function! g:utils#FileIsExisted(fileName)
   if findfile(a:fileName, ".") == a:fileName
     return "exited"
   endif
   return "NoExited"
endfunction
