vim 
===

使用github管理vim插件

#使用github 管理vim 插件

#1.备份原来的 .vimrc 文件和 .vim 目录
mv .vimrc{ ,.bak} # .vimrc -> .vimrc.bak
mv .vim{ ,.bak}   # .vim -> .vim.bak 

#2.新建 .vim/bundle 目录
mkdir -p ~/.vim/bundle

#3.初始化 Git 仓库
cd ~/.vim
git init
git add .
git commit -m "init"

#4.将代码托管到 Github
#登陆到 https://github.com/ ，新建一个 Repositorie 命名为 vim，然后执行
git remote add origin git@github.com:maobonet/vim.git # 请改成自己的代码仓库地址
git push origin master

#5.安装并配置启用 vim-pathogen 插件
git submodule add git://github.com/tpope/vim-pathogen.git bundle/vim-pathogen
echo -e "runtime bundle/vim-pathogen/autoload/pathogen.vim\ncall pathogen#infect()\n" >> ~/.vim/vimrc
# 如果想使用原来的 .vimrc 文件则可以
# cp ~/.vimrc.bak ~/.vim/vimrc
# 但是必须将以下2行加到 vimrc 的首行
# runtime bundle/vim-pathogen/autoload/pathogen.vim
# call pathogen#infect()
ln -s ~/.vim/vimrc ~/.vimrc

#6.安装插件
#git submodule add 插件 Git 仓库地址 bundle/插件名字
git submodule add git://github.com/tpope/vim-markdown.git bundle/vim-markdown

#7.升级插件
cd ~/.vim/bundle/vim-markdown # 将 vim-markdown 替换为需要升级的插件名字
git pull origin master

#8.升级所有插件
cd ~/.vim
git submodule foreach git pull origin master

#9.删除插件
git rm bundle/vim-markdown # 将 vim-markdown 替换为需要升级的插件名字

#10.将整个目录提交到 Github
cd ~/.vim
git push origin master

#11.在其他机器使用相同配置
git clone http://github.com/maobonet/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update

#enjoy it
