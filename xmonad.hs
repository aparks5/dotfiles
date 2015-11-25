import XMonad

main = do
   xmonad $ defaultConfig
     {
	modMask = mod4Mask,
	borderWidth = myBorderWidth,
	focusedBorderColor = myFocusedBorderColor
     }

myBorderWidth = 1
myFocusedBorderColor = "#000000"