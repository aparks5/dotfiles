# must run as superuser, but in home directory
aptitude install build-essential python idle3 emacs xmonad dzen2 git thunar gnome-icon-theme-full lxappearance
sudo -u ${USERNAME} cp .emacs ~/
sudo -u ${USERNAME} mkdir ~/.xmonad
cp xmonad.hs ~/

# install source code pro font
sudo -u ${USERNAME} chmod u+x installSourceCodePro.hs
sudo -u ${USERNAME} sh installSourceCodePro.hs

# todo: copy xsession
sudo -u ${USERNAME} cp .xsession ~/
