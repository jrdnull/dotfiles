import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Util.Run

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { modMask = mod4Mask
        , terminal = "urxvt"
        , normalBorderColor = "#cccccc"
        , focusedBorderColor = "#cd8b00"
        , borderWidth = 2
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        } `additionalKeysP`
        [ ("M-<Left>", spawn "xdotool click 1")
        , ("M-<Down>", spawn "xdotool click 2")
        , ("M-<Right>", spawn "xdotool click 3")
        , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 20")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 20")
        , ("<XF86AudioLowerVolume>", spawn "amixer -c 1 set Master 2-")
        , ("<XF86AudioRaiseVolume>", spawn "amixer -c 1 set Master 2+")
        , ("<XF86AudioMute>", spawn "amixer -c 1 set Master toggle")
        , ("C-M-l", spawn "slock")
        , ("C-<Print>", spawn "sleep 0.2; scrot -s")
        , ("<Print>", spawn "scrot")
        ]

