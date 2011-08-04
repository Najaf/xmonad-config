--
-- Basic xmonad config
--
-- on ubuntu, you'll need to run:
--
-- $ sudo apt-get install xmobar happy cabal-install
-- $ cabal-install xmonad-extras
--

import XMonad
import XMonad.Actions.Volume
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do 
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/.xmobarrc"
  xmonad $ defaultConfig
    { borderWidth = 2
    , normalBorderColor = "#cccccc"
    , focusedBorderColor = "#cd8b00" 
    , modMask = mod4Mask 
    , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")
    , ((mod4Mask, xK_Down), lowerVolume 10 >> return ())
    , ((mod4Mask, xK_Up),   raiseVolume 10 >> return ())
    , ((mod4Mask, xK_m),    toggleMute     >> return ())
    ]
