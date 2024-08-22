" 定义一个全局变量来跟踪底部窗口的 ID
let g:bottom_window_id = -1
let g:bottom_window_file = '~/.vim/novel/shui_hu_zhuan.c'
let g:bottom_window_marker_file = expand('~/.vim/novel/bottom_window_marker')

" 创建一个函数来处理底部窗口的打开和关闭
function! ToggleBottomWindow()
  if g:bottom_window_id != -1 && win_id2win(g:bottom_window_id) > 0
    " 如果底部窗口 ID 存在且有效，关闭它
    " 切换到底部窗口
    call win_gotoid(g:bottom_window_id)
    " 记录当前光标位置到临时文件
    let l:cursor_pos = getpos('.')
    call writefile([join(l:cursor_pos, ',')], g:bottom_window_marker_file)
    " 关闭底部窗口，删除对应的 buffer
    execute 'bd'
    " 重置全局变量
    let g:bottom_window_id = -1
  else
    " 如果底部窗口不存在，创建它
    " 保存当前窗口 ID
    let l:current_win = win_getid()

    " 在底部创建一个新的水平分割窗口，并设置高度为 3 行
    botright new
    resize 3

    " 确保新窗口的宽度与 Vim 主窗口相同
    let l:width = winwidth(0)
    vertical resize l:width

    " 设置全局变量标记底部窗口的 ID
    let g:bottom_window_id = win_getid()

    " 切换到底部窗口
    call win_gotoid(g:bottom_window_id)
    " 打开指定的文件
    execute 'edit ' . g:bottom_window_file

    " 恢复光标位置
    if filereadable(g:bottom_window_marker_file)
      let l:cursor_pos = split(readfile(g:bottom_window_marker_file)[0], ',')
      call setpos('.', l:cursor_pos)
      " 删除临时文件
      call delete(g:bottom_window_marker_file)
    endif

    " 选中新创建的窗口
    " let l:new_win = win_getid()
    " if l:current_win != l:new_win
    "   " 返回到原窗口
    "   call win_gotoid(l:current_win)
    " endif
  endif
endfunction

" 绑定快捷键来调用这个函数
nnoremap <silent> <Space>a :call ToggleBottomWindow()<CR>
