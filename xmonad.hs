--
-- Basic xmonad config
--
import XMonad
import XMonad.Util.EZConfig(additionalKeys)

main = xmonad $ defaultConfig
    { borderWidth = 2
    , normalBorderColor = "#cccccc"
    , focusedBorderColor = "#cd8b00" 
    , modMask = mod4Mask 
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")
    ]
