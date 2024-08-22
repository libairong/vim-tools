" 创建一个高 3 行的新窗口，并确保它位于底部
function! ToggleBottomWindow()
  " 检查是否已经有打开的窗口
  let l:bottom_win = -1

  " 遍历所有窗口，检查是否有高为 3 行且在底部的窗口
  for l:win in range(1, winnr('$'))
    if win_getid() == l:bottom_win
      continue
    endif
    call win_gotoid(l:win)
    if &buftype == 'nofile' && winheight(0) == 3
      let l:bottom_win = l:win
      break
    endif
  endfor

  " 如果找到已有的底部窗口，则关闭它
  if l:bottom_win != -1
    call win_gotoid(l:bottom_win)
    quit
  else
    " 保存当前窗口 ID
    let l:current_win = win_getid()

    " 创建一个新的水平分割窗口，并设置高度为 3 行
    botright new
    resize 3

    " 确保新窗口的宽度与 Vim 主窗口相同
    let l:width = winwidth(0)
    vertical resize l:width

    " 切换到新创建的窗口
    let l:new_win = win_getid()
    call win_gotoid(l:new_win)

    " 打开指定的文件
    execute 'edit ~/.vim/novel'

    " 切换回原窗口
    call win_gotoid(l:current_win)
  endif
endfunction

" 绑定快捷键来调用这个函数
nnoremap <silent> <Space>a :call ToggleBottomWindow()<CR>
