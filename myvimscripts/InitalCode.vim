nmap mf :call ConvertTabsToSpaces()<CR>i#include <stdio.h><ESC>o#include <stdlib.h><Esc>o#include <sys/types.h><Esc>o#include <sys/stat.h><Esc>o#include<error.h><Esc>o#include <string.h><Esc>o#include <unistd.h><Esc>o#include <math.h><Esc>o#include <time.h><Esc>o<CR>int main(int argc,char *argv[]) {<Esc>oreturn 0;<Esc>o}<Esc>2ko

nmap mfc i#include<iostream><ESC>ousing namespace std;<CR>#include<vector><Esc>o#include<string><Esc>o#include<list><Esc>o#include<map><Esc>o#include<algorithm><Esc>o#include<functional><Esc>o#include<numeric><Esc>o#include<time.h><Esc>o#include<math.h><Esc>o<CR><CR><CR><CR><CR>int main(int argc,char *argv[])<Esc>o{<Esc>o<CR><CR><TAB>return 0;<CR><Esc>o}<Esc>2ko

" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitle()"
" 加入注释
func SetComment()
    call setline(1,"/*================================================================")
    let l:currentLine = line(".")
    call append(l:currentLine,   "*   Copyright (C) ".strftime("%Y")." Ltd. All rights reserved.")
    call append(l:currentLine+1, "*")
    call append(l:currentLine+2, "*   file        : ".expand("%:t"))
    call append(l:currentLine+3, "*   owner       : bairong.li")
    call append(l:currentLine+4, "*   date        : ".strftime("%Y-%m-%d"))
    call append(l:currentLine+5, "*   description :")
    call append(l:currentLine+6, "*")
    call append(l:currentLine+7, "================================================================*/")
    call append(l:currentLine+8, "")
    call append(l:currentLine+9, "")
endfunc
" 加入shell,Makefile注释
func SetComment_sh()
    call setline(3, "#================================================================")
    call setline(4, "#   Copyright (C) ".strftime("%Y")." Ltd. All rights reserved.")
    call setline(5, "#")
    call setline(6, "#   file        : ".expand("%:t"))
    call setline(7, "#   owner       : bairong.li")
    call setline(8, "#   date        : ".strftime("%Y-%m-%d"))
    call setline(9, "#   description : ")
    call setline(10, "#")
    call setline(11, "#================================================================")
    call setline(12, "")
    call setline(13, "")
endfunc
" 定义函数SetTitle，自动插入文件头
func SetTitle()
    if &filetype == 'make'
        call setline(1,"")
        call setline(2,"")
        call SetComment_sh()

    elseif &filetype == 'sh'
        call setline(1,"#!/bin/bash")
        call setline(2,"")
        call SetComment_sh()

    else
         call SetComment()
         if expand("%:e") == 'hpp'
             " call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H")
             " call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H")
             " call append(line(".")+12, "#ifdef __cplusplus")
             " call append(line(".")+13, "extern \"C\"")
             " call append(line(".")+14, "{")
             " call append(line(".")+15, "#endif")
             " call append(line(".")+16, "")
             " call append(line(".")+17, "#ifdef __cplusplus")
             " call append(line(".")+18, "}")
             " call append(line(".")+19, "#endif")
             " call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H")

         elseif expand("%:e") == 'h'
             call append(line(".")+10, "#pragma once")
         elseif &filetype == 'c'
             " call append(line(".")+10,"#include \"".expand("%:t:r").".h\"")
	     call setline(10, "#include <stdio.h>")
             call setline(11, "#include <stdlib.h>")
             call setline(12, "#include <sys/types.h>")
             call setline(13, "#include <sys/stat.h>")
             call setline(14, "#include <error.h>")
             call setline(15, "#include <string.h>")
             call setline(16, "#include <unistd.h>")
             call setline(17, "#include <math.h>")
             call setline(18, "#include <time.h>")
             call setline(19, "")
             call setline(20, "int main(int argc, char *argv[]) {")
             call setline(21, "    return 0;")
             call setline(22, "}")
         elseif &filetype == 'cpp'
             call SetComment()
             " call append(line(".")+10, "#include \"".expand("%:t:r").".h\"")
         endif
    endif
endfunc
