
## centos 7
yum -y install gcc gcc-c++ make
yum -y install rpmdevtool libtool-ltdl-devel freetype-devel ghostscript-devel libwmf-devel lcms-devel bzip2-devel librsvg2 librsvg2-devel libtool-ltdl-devel autotrace-devel fftw3-devel libtiff-devel giflib-devel libXt-devel xz-devel

yum -y install bzip2-devel freetype-devel libjpeg-devel libpng-devel libtiff-devel giflib-devel zlib-devel ghostscript-devel djvulibre-devel libwmf-devel jasper-devel libtool-ltdl-devel libX11-devel libXext-devel libXt-devel lcms-devel libxml2-devel librsvg2-devel OpenEXR-devel php-devel

# install nodejs
yum install epel-release
yum install nodejs

# imagemick 源码安装
// yum install ImageMagick
// yum install ImageMagick-devel
wget http://www.imagemagick.org/download/ImageMagick.tar.gz



# install nginx
rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum install -y nginx
systemctl start nginx.service

# install mysql
yum -y install mariadb*
my.conf:
    character-set-server = utf8
show variables like 'char%';
    
systemctl start mariadb.service  
systemctl enable mariadb.service 
mysql_secure_installation 

# install git
yum install git

# install rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone git://github.com/jamis/rbenv-gemset.git  ~/.rbenv/plugins/rbenv-gemset
git clone git://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone git://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
git clone git://github.com/AndorChen/rbenv-china-mirror.git ~/.rbenv/plugins/rbenv-china-mirror

然后把下面的代码放到 ~/.bash_profile 里
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv install --list  # 列出所有 ruby 版本
* yum install -y readline-devel
rbenv install 2.2.5

# ssh
ssh-keygen -t rsa -C "liangyuliang0335@126.com"
一路确认，什么不不用输入
之后cat id_rsa.pub

# cap production deploy


~~~~~
yum install net-tools
iptables -F 清空规则

question:

1, *1 connect() to unix:///var/www/awifi/shared/tmp/sockets/puma.sock failed (13: Permission denied) while connecting to upstream
-->  
    sudo vi /etc/sysconfig/selinux
    #SELINUX=enforcing
    SELINUX=disabled
    
* setenforce 0
* getenforce

2， RuCaptcha convert: not authorized `-' @ error/constitute.c/ReadImage/454.
convert: no images defined `png:-' @ error/convert.c/ConvertImageCommand/3046.
yum install ImageMagick-devel

# firewall
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload



