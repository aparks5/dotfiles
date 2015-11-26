import XMonad
import Data.Monoid
import System.Exit

import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

main = do
   xmproc <- spawnPipe myBar
   xmonad $ defaultConfig
     {
	modMask = mod4Mask,
	borderWidth = myBorderWidth,
	focusedBorderColor = myFocusedBorderColor,
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts  $  layoutHook defaultConfig
     }


myBar = "/usr/bin/xmobar /home/anthony/.xmobarrc"
myBorderWidth = 3
myFocusedBorderColor = "#66ff66"





