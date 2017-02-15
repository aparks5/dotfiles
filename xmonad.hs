import XMonad
import Data.Monoid
import System.Exit
import System.IO (Handle, hPutStrLn)
-- java workaround
import XMonad.Hooks.SetWMName
import XMonad.Prompt

import XMonad.Actions.WorkspaceNames

-- cycle workspace
import XMonad.Actions.CycleWS

-- spawn xmobar
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog


import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- change vertical size
import XMonad.Layout.ResizableTile
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.EZConfig


main = do
   xmproc <- spawnPipe myBar
   xmonad $ defaultConfig
     {
	logHook = workspaceNamesPP xmobarPP {
	  ppOutput = hPutStrLn xmproc
	, ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
	, ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
	, ppSep = "    "
	}  >>= dynamicLogWithPP
        , startupHook = setWMName "LG3D",
	modMask = mod4Mask,
	borderWidth = myBorderWidth,
	focusedBorderColor = myFocusedBorderColor,
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = myLayout
      } `additionalKeysP` myKeys

myLayout = avoidStruts ( ResizableTall 1 (2/100) (1/2) [] )


myKeys =  -- resize both axes in resizableTall
    [ ("M-m", sendMessage $ MirrorExpand)
    , ("M-n", sendMessage $ MirrorShrink)
    , ("M-v", sendMessage $ Shrink)
    , ("M-b", sendMessage $ Expand)
    , ("M-l", spawn "xscreensaver-command -lock") 
    , ("M-s", spawn "scrot -d 2")
    , ("M-r", renameWorkspace defaultXPConfig)
    , ("M-<Page_Down>",  nextWS)
    , ("M-<Page_Up>",  prevWS)
    , ("M-<Home>", toggleWS)  
    ]

myBar = "/home/user/.cabal/bin/xmobar /home/user/xmobar.hs"
myBorderWidth = 3
myFocusedBorderColor = "#669999"
-- Color of current window title in xmobar.
xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"
