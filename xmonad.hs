import XMonad

main = do
   xmonad $ defaultConfig
     {
	modMask = mod4Mask,
	borderWidth = myBorderWidth,
	focusedBorderColor = myFocusedBorderColor
     }

myBorderWidth = 3
myFocusedBorderColor = "#66ff66"