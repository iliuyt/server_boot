
#!/bin/bash

# 使用阿里云源无法安装vim

mv /etc/apt/sources.list /etc/apt/sources.list.bak
mv ./lib/conf/2004_sources.list  /etc/apt/sources.list

apt update

# 检测vim 是否安装
if !command -v vim >/dev/null 2>&1; then  
    apt install -y vim
fi

# 检测git 是否安装
if !command -v curl >/dev/null 2>&1; then  
    apt install -y curl
fi

# 检测git 是否安装
if !command -v git >/dev/null 2>&1; then  
    apt install -y git 
fi

apt install -y zs
chsh -s /bin/zsh
sh  ./lib/ohmyzsh/install.sh
# 自动补全插件
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestion
sed -i '/plugins=(git)/ a\plugins=(zsh-autosuggestions)' ~/.zshr
# 主机名修改
cp ~/.oh-my-zsh/themes/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/myrobbyrussell.zsh-theme
sed -i 's/➜/>>>/g' ~/.oh-my-zsh/themes/myrobbyrussell.zsh-them
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="myrobbyrussell"/g' ~/.zshr
# docker 自定义快捷命令安装
mv ./lib/docker/.dkrc ~/.dkr
echo '. ~/.dkrc' >> ~/.zshr
source ~/.zshr
# docker 安装
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyu
# docker-compose 安装
curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compos
chmod +x /usr/local/bin/docker-compose


# 创建文件夹
# 日志
mkdir -p /data/log
# 配置
mkdir -p /data/conf
# 中间件
mkdir -p /data/lib
# 项目
mkdir -p /data/www
# docker
mkdir -p /data/docker
# 脚本
mkdir -p /data/script
# 静态资源
mkdir -p /data/static
# 工具
mkdir -p /data/tool
# 临时目录
mkdir -p /data/tmp

echo "install success"
