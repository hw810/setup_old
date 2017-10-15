set -e

function backup {
    local fnames=$@
    for fn in ${fnames}; do
        if [[ -e $fn ]]; then sudo mv $fn ${fn}.bk; fi 
    done
}

# define install function
function install_if_needed { local ls_programs=$@
    for cur_pro in ${ls_programs}; do
        command -v ${cur_pro}
        if [[ $? -ne 0 ]]; then
            sudo ${pkg_mgr} install ${cur_pro}
        fi
    done
}

sudo echo "needs admin permission"
pkg_mgr=yum  # apt for ubuntu; yum for centos/scientific linux
# add repo: sl-ustc, epel
backup /etc/yum.repos.d/sl-ustc.repo
sudo wget https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/scientificlinux?codeblock=0 -O /etc/yum.repos.d/sl-ustc.repo
sudo wget http://repo.fdzh.org/chrome/google-chrome-mirrors.repo -O /etc/yum.repos.d/google-chrome-mirrors.repo

sudo yum install epel-release
sudo yum makecache

# install basic
install_if_needed vim git guake terminator google-chrome-stable tmux

 
# install shadowsocks-qt5
#sudo add-apt-repository ppa:hzwhuang/ss-qt5
#sudo apt-get install shadowsocks-qt5
 
# config .inputrc
echo "\
\"\C-p\": history-search-backward
\"\C-n\": history-search-forward
set show-all-if-ambiguous on
set completion-ignore-case on" > ~/.inputrc
