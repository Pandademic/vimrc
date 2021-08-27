import XMonad
import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Util.SpawnOnce

myConfig = def
  { modMask     = mod1Mask -- set 'Mod' to windows key
  , terminal    = "gnome-terminal" -- for Mod + Shift + Enter
  , startupHook = spawnOnce "bash ~/.fehbg &"
  }

main = xmonad =<< xmobar myConfig

