import XMonad
import Data.Monoid
import System.Exit

-- spawn xmobar
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- change vertical size
import XMonad.Layout.ResizableTile
import XMonad.Util.EZConfig -- or use another method of binding resizable keys

main = do
   xmproc <- spawnPipe myBar
   xmonad $ defaultConfig
     {
	modMask = mod4Mask,
	borderWidth = myBorderWidth,
	focusedBorderColor = myFocusedBorderColor,
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = myLayout
      } `additionalKeysP` myKeys

myLayout = ResizableTall 1 (2/100) (1/2) []
-- avoidStruts  $ myLayout

myKeys =  -- resize both axes in resizableTall
    [ ("M-m", sendMessage $ MirrorExpand)
    , ("M-n", sendMessage $ MirrorShrink)
    , ("M-v", sendMessage $ Shrink)
    , ("M-b", sendMessage $ Expand)
    ]
 
myBar = "/usr/bin/xmobar /home/anthony/.xmobarrc"
myBorderWidth = 3
myFocusedBorderColor = "#669999"





