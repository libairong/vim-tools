""" vim_which_key
" https://www.jianshu.com/p/e47f7ec27cea
set timeoutlen=500

let g:mapleader="\<Space>"

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"" test demo

let g:which_key_map = {}

let g:which_key_map.a = "open novels"
"" end test demo

let g:which_key_map.h = {
            \ 'name':"hex format show and write!",
            \ 's':"show data",
            \ 'w':"write data back to file",
            \}

let g:which_key_map.d = {
            \ 'name':"delete char in file",
            \ 's':"delete space in tail",
            \}

let g:which_key_map.t = {
            \ 'name':"change tag to space",
            \ 'c':"convert tag to 4 space",
            \ 's':"set tag to 4 space",
            \}
let g:which_key_map.tl = {
            \ 'name':"ctags list",
            \}

let g:which_key_map.bl = "git blame"

call which_key#register('<Space>', "g:which_key_map")
""" end vim_which_key
