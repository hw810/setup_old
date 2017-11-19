flag_add_repo=0




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

if [[ $flag_add_repo -eq 1 ]]; then
    sudo echo "needs admin permission"
    pkg_mgr=yum  # apt for ubuntu; yum for centos/scientific linux
    # add repo: sl-ustc, epel
    backup /etc/yum.repos.d/sl-ustc.repo
    sudo wget https://lug.ustc.edu.cn/wiki/_export/code/mirrors/help/scientificlinux?codeblock=0 -O /etc/yum.repos.d/sl-ustc.repo
    sudo wget http://repo.fdzh.org/chrome/google-chrome-mirrors.repo -O /etc/yum.repos.d/google-chrome-mirrors.repo

    sudo yum install epel-release
    sudo yum makecache
fi

# install basic
install_if_needed vim git guake terminator google-chrome-stable tmux

 
# install shadowsocks-qt5
#sudo add-apt-repository ppa:hzwhuang/ss-qt5
#sudo apt-get install shadowsocks-qt5

function override {
    local s_fn=$1
    local d_fn=$2
    if [[ -e $d_fn ]]; then
        mv ${d_fn} ${d_fn}.bk
    else
        mkdir -p $(dirname ${d_fn})
    fi
    
    cp -r ${s_fn} ${d_fn}
}

override "./inputrc" "${HOME}/.inputrc"
override "./terminator.config" "${HOME}/.config/terminator/config"
override "./tmux.conf" "${HOME}/.tmux.conf"
override "./bash_prompt" "${HOME}/.bash_prompt"
echo "source ~/.bash_prompt" >> ~/.bashrc



# gnome setting
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Shift>k', '<Control><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control><Shift>j', '<Control><Alt>Up']"


#vim
override "../vim_runtime" "${HOME}/.vim_runtime"
sh ~/.vim_runtime/install_awesome_vimrc.sh

git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim_runtime/sources_non_forked/
