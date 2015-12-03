# must run as superuser, but in home directory
#aptitude install build-essential emacs python idle3 pylint \ 
#    xmonad dzen2 xscreensaver suckless-tools \
#    thunar gnome-icon-theme-full lxappearance

sudo -u ${USERNAME} cp .emacs ~/

# window manager config
sudo -u ${USERNAME} mkdir ~/.xmonad
sudo -u ${USERNAME} cp xmonad.hs ~/.xmonad/
sudo -u ${USERNAME} cp .xmobarrc ~/

# install source code pro font
sudo -u ${USERNAME} chmod u+x installAdobeSourceCodePro.sh
sudo -u ${USERNAME} sh installAdobeSourceCodePro.sh

# todo: copy xsession
sudo -u ${USERNAME} cp .xsession ~/
