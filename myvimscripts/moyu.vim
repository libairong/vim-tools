" 定义全局变量
let g:bottom_window_id = -1
let g:bottom_window_file = '~/.vim/novel/'
let g:bottom_window_marker_file = expand('~/.vim/novel/bottom_window_marker')  " 保存最后打开的文件

" 定义全局变量
let g:bookmark_file = expand('~/.vim/novel/bookmarks')

" 保存当前文件和光标位置到书签文件
function! SaveBookmark()
  let l:current_file = expand('%:p')
  let l:cursor_pos = getpos('.')

  " 读取已有的书签
  let l:bookmarks = []
  if filereadable(g:bookmark_file)
    let l:bookmarks = readfile(g:bookmark_file)
  endif

  " 更新或添加当前文件的书签
  let l:found = 0
  for l:line in l:bookmarks
    let l:parts = split(l:line, ' ')
    if len(l:parts) >= 2 && l:parts[0] == l:current_file
      " 更新光标位置
      let l:bookmarks[match(l:line, l:current_file)] = l:current_file . ' ' . join(l:cursor_pos, ',')
      let l:found = 1
      break
    endif
  endfor

  if !l:found
    " 添加新的书签
    call add(l:bookmarks, l:current_file . ' ' . join(l:cursor_pos, ','))
  endif

  " 写入书签文件
  call writefile(l:bookmarks, g:bookmark_file)
endfunction

" 恢复光标到书签位置
function! RestoreBookmark()
  let l:current_file = expand('%:p')

  if filereadable(g:bookmark_file)
    let l:bookmarks = readfile(g:bookmark_file)
    for l:line in l:bookmarks
      let l:parts = split(l:line, ' ')
      if len(l:parts) >= 2 && l:parts[0] == l:current_file
        let l:cursor_pos = split(l:parts[1], ',')
        call setpos('.', l:cursor_pos)
        return
      endif
    endfor
  endif
endfunction

" 创建一个函数来处理底部窗口的打开和关闭
function! ToggleBottomWindow()
  if g:bottom_window_id != -1 && win_id2win(g:bottom_window_id) > 0
    " 如果底部窗口 ID 存在且有效，关闭它
    " 切换到底部窗口
    call win_gotoid(g:bottom_window_id)
    " 记录当前光标位置和文件名到临时文件
    let l:cursor_pos = getpos('.')
    let l:current_file = expand('%:p')
    " 清空文件
    call writefile([], g:bottom_window_marker_file)
    call writefile([l:current_file . ' ' . join(l:cursor_pos, ',')], g:bottom_window_marker_file)

    " 保存到书签里面
    call SaveBookmark()

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
    " 读取标记文件中的文件名和光标位置
    if filereadable(g:bottom_window_marker_file)
      " echo "start"
      let l:marker_data = readfile(g:bottom_window_marker_file)
      if l:marker_data == []
	execute 'edit ' . g:bottom_window_file
      else
        " echo l:marker_data
        let l:marker_datas = split(l:marker_data[0], ' ')
        " echo l:marker_datas
        let l:target_file = l:marker_datas[0]
        let l:cursor_pos = l:marker_datas[1]
        " 打开标记文件中保存的文件
        execute 'edit ' . l:target_file
        " 定位到保存的光标位置
        call setpos('.', l:cursor_pos)
      endif
    else
      " 默认打开的文件
      execute 'edit ' . g:bottom_window_file
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
nnoremap <silent> <Space>j :call ToggleBottomWindow()<CR>
nnoremap <silent> <Space>r :call RestoreBookmark()<CR>

