# vim-tools

## 安装
在用户根目录下clone 项目，项目目录改名为.vim

## 导入插件配置
清空.vimrc，然后在里面添加代码：source ~/.vim/my_vimrc

## 使用方法
参考 readme.txt ...

## 常见问题
### 函数列表没有显示
左侧函数列表空空如也，并且console报找不到ctags。这说明你的电脑没装ctags，你可以安装这个软件或者关闭函数列表。
如下变量设置为1就是开启，设置成0就是关闭
let Tlist_Auto_Open = 1

