﻿
					《VIM简易使用说明》

进入项目根目录（.vim里的东西放在用户根目录），执行：
ctags -R `pwd`
find `pwd` -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files
cscope -bR -i cscope.files
以上命令也可以通过直接执行.vim/buildenv.sh脚本执行
此配置安装了插件并设置了自动递归查找索引文件，会自动加载cscope.out 和 tags

F2：屏幕双开打开文件并浏览（同理，可在命令模式下输入fe实现）
F3：快速粘贴
F4：查看文件修改内容（同理，可在命令模式下输入changes实现）
F7：打开\关闭左侧Taglist窗口
F8：打开\关闭右侧winmanage窗口
F9：打开BufExplorer，历史文件列表

<Ctrl+w+w>：切换Taglist和显示区域等多个窗口

<shift+#> ：向前实现快速查找并高亮显示某个单词
<shift+*> ：向后实现快速查找并高亮显示某个单词

<空格>+f：快速搜索当前文件里出现某个单词的位置并小窗口预览（v键可选择单词）。
<空格>+ww：保存
<空格>+wq：保存退出
<空格>+wf：强制保存
<空格>+qf：强制退出
<空格>+qq：退出
<空格>+ds：自动删除尾随空格
<空格>+dm：自动删除尾随^M
<空格>+fe：打开一个垂直分隔的窗口浏览当前文件所在的目录
<空格>+lk：通过名字搜索某个文件（需要事先执行.vim/buildfile.sh脚本生成索引文件）

"""" ctrlP_config
"" options:
" <leader>pb   # 模糊搜索最近打开的文件(MRU)
" <leader>pp   # 模糊搜索当前目录及其子目录下的所有文件
" ctrl + j/k  # 进行上下选择
" ctrl + x    # 在当前窗口水平分屏打开文件
" ctrl + v    # 同上, 垂直分屏
" ctrl + t    # 在tab中打开
" F5          # 刷新可搜索文件
" <c-d>       # 只能搜索全路径文件
" <c-r>       # 可以使用正则搜索文件
"""" end_ctrlP_config

"""" ctrlP-funky_config
"" options
" <leader>fk      # 进入当前文件的函数列表搜索
" <leader>ff      # 搜索当前光标下单词对应的函数
"""" end_ctrlP-funky_config


" <Ctrl+]>：跳转到函数、宏、枚举等定义的位置（同理，可在命令模式下输入tag 函数\变量名）（此配置支持Ctrl+左键实现函数跳转）
" <CTRL+W+]>：分隔当前窗口并跳转到光标下的tag
" <Ctrl+T>：返回上一次跳转的位置
" <Ctrl+\>+g：查找函数、宏、枚举等定义的位置，类似ctags所提供的功能（比如有可能只在头文件处）
" <Ctrl+\>+s：查找C语言符号，即查找函数名、宏、枚举值等出现的地方（包括头文件）
" <Ctrl+\>+t：查找指定的字符串
" <Ctrl+\>+c：查找调用本函数的函数
" <Ctrl+\>+d：查找本函数调用的函数
" <Ctrl+\>+e：查找egrep模式，相当于egrep功能，但查找速度快多了
" <Ctrl+\>+f：查找并打开文件，类似vim的find功能
" <Ctrl+\>+i：查找包含本文件的文件
" 上面功能同理可在命令模式下输入cs find g\s\t\c\d\e\f\i 函数、宏、枚 等实现相应功能
" 更多其他功能可输入：help cscope查看

输入模式下通过<Ctrl+n>，<Ctrl+p>，可以实现单词（给查单词的部分字符）的自动补全和输入提示的功能。

支持Ctrl+v实现粘贴
支持Ctrl+a实现全选


# 搜索/模糊搜索
搜索使用命令:
/string

其中 / 是命令，string 是要找到字符串。搜索方向是当前关标向文件尾部，? 命令是同样的功能，不过搜索方向相反。

模糊搜索：
/ {regex}

比方模糊匹配newNode 字符：/new.*od

# 查找文件
命令：
find {regex}
回车后结果会出现新窗口上

# 跳转
搜索后，跳转，可以通过ctrl+o 返回到跳转前的地方。还可以ctrl+i 向前跳转。

# mark
支持 vim-bookmarks，用法参考插件的readme

# 空格 + p
当前目录下模糊查找文件

# 空格 + vs
当前目录下全局查找字符串

# 空格 + vv
当前目录下全局查找指针所在字符串

# 空格 + vg
当前文件下查找指针所在字符串

# 普通模式下 按<F5> 可以显示一个浮窗终端；按<F6> show term，按<F7> hide term；按<F8> kill term；

# 空格 + ds
删除后面有多余的空格的行

# 查看二进制文件
命令模式下 :%!xxd
可以修改，改完后:%!xxd -r 进行逆向转成二进制数据。然后可以保存退出。

# 当前目录下模糊搜索文件内容
空格 + f

# 不支持将vim 拷贝到系统剪切板的情况下，可以通过xsel 实现，需要依赖xsel
选择内容，ctrl + y

# 依赖（需要安装软件给LeaderF 调用）
pipgrep（模糊搜索文件内容）、xsel（复制到系统剪切板）

# term的使用
https://blog.csdn.net/ningyanggege/article/details/115623934
