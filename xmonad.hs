import XMonad

main = do
   xmonad $ defaultConfig
     {
	borderWidth = myBorderWidth,
	focusedBorderColor = myFocusedBorderColor
     }

myBorderWidth = 1
myFocusedBorderColor = "#000000"
