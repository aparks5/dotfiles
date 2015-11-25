# must run as superuser, but in home directory
aptitude install build-essential python idle3 emacs xmonad dzen2 git thunar gnome-icon-theme-full lxappearance
cp .emacs ~/
mkdir ~/.xmonad
cp xmonad.hs ~/

# install source code pro font
chmod u+x installSourceCodePro.hs
sh installSourceCodePro.hs

# todo: copy xsession
