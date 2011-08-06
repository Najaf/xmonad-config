--
-- Basic xmonad config
--
-- on ubuntu, you'll need to run:
--
-- $ sudo apt-get install happy cabal-install
-- $ cabal-install xmonad-extras
--

import XMonad
import XMonad.Actions.Volume
import XMonad.Util.EZConfig(additionalKeys)

main = xmonad $ defaultConfig
    { borderWidth = 1
    , normalBorderColor = "#cccccc"
    , focusedBorderColor = "#cd8b00" 
    , modMask = mod4Mask 
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")
    , ((mod4Mask, xK_Down), lowerVolume 10 >> return ())
    , ((mod4Mask, xK_Up),   raiseVolume 10 >> return ())
    , ((mod4Mask, xK_m),    toggleMute     >> return ())
    ]
