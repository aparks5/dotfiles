import XMonad
import Data.Monoid
import System.Exit
import XMonad.Hooks.SetWMName

-- spawn xmobar
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- change vertical size
import XMonad.Layout.ResizableTile
import XMonad.Util.EZConfig -- or use another me$

main = do
   xmproc <- spawnPipe myBar
   xmonad $ defaultConfig
     {
        startupHook = setWMName "LG3D",
        modMask = mod4Mask,
        borderWidth = myBorderWidth,
        focusedBorderColor = myFocusedBorderColo$
        manageHook = manageDocks <+> manageHook $
        layoutHook = myLayout
      } `additionalKeysP` myKeys

myLayout = ResizableTall 1 (2/100) (1/2) []
-- avoidStruts  $ myLayout

myKeys =  -- resize both axes in resizableTall
    [ ("M-m", sendMessage $ MirrorExpand)
    , ("M-n", sendMessage $ MirrorShrink)
    , ("M-v", sendMessage $ Shrink)
    , ("M-b", sendMessage $ Expand)
    , ("M-l", spawn "xscreensaver-command -lock")
    , ("M-s", spawn "scrot -d 2")
    ]

myBar = "/usr/bin/xmobar /home/sonosdeveloper/.x$
myBorderWidth = 3
myFocusedBorderColor = "#669999"
