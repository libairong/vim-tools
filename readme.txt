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

<Ctrl+]>：跳转到函数、宏、枚举等定义的位置（同理，可在命令模式下输入tag 函数\变量名）（此配置支持Ctrl+左键实现函数跳转）
<CTRL+W+]>：分隔当前窗口并跳转到光标下的tag
<Ctrl+T>：返回上一次跳转的位置
<Ctrl+\>+g：查找函数、宏、枚举等定义的位置，类似ctags所提供的功能（比如有可能只在头文件处）
<Ctrl+\>+s：查找C语言符号，即查找函数名、宏、枚举值等出现的地方（包括头文件）
<Ctrl+\>+t：查找指定的字符串
<Ctrl+\>+c：查找调用本函数的函数
<Ctrl+\>+d：查找本函数调用的函数
<Ctrl+\>+e：查找egrep模式，相当于egrep功能，但查找速度快多了
<Ctrl+\>+f：查找并打开文件，类似vim的find功能
<Ctrl+\>+i：查找包含本文件的文件
上面功能同理可在命令模式下输入cs find g\s\t\c\d\e\f\i 函数、宏、枚 等实现相应功能
更多其他功能可输入：help cscope查看

输入模式下通过<Ctrl+n>，<Ctrl+p>，可以实现单词（给查单词的部分字符）的自动补全和输入提示的功能。

支持Ctrl+v实现粘贴
支持Ctrl+a实现全选