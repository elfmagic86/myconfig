; key
; ---

; 1. capslock to esc
CapsLock:: Send {Esc}

; 2. del
NumpadDot:: Send {Del}
+NumpadDot:: Send +{Del}
^NumpadDot:: Send ^{Del}
!NumpadDot:: Send !{Del}

; 3. home/end, pgup/pgdn
NumpadDiv:: Send {Home}
NumpadAdd:: Send {End}
NumpadMult::Send {PgUp}
NumpadSub::Send {PgDn}

;; shift
+NumpadDiv:: Send +{Home}
+NumpadAdd:: Send +{End}
+NumpadMult::Send +{PgUp}
+NumpadSub::Send +{PgDn}

;; ctrl
^NumpadDiv:: Send ^{Home}
^NumpadAdd:: Send ^{End}
^NumpadMult::Send ^{PgUp}
^NumpadSub::Send ^{PgDn}

;; alt
!NumpadDiv:: Send !{Home}
!NumpadAdd:: Send !{End}
!NumpadMult::Send !{PgUp}
!NumpadSub::Send !{PgDn}

; 4. disalbe insert key
Insert::return
NumpadIns::return


; else
; ---

; numlock always on
; https://www.reddit.com/r/Windows10/comments/3gjcxd/numlock_disabled_after_booting_up_windows_10/
; TODO 다시 찾아봐양함.
SetNumlockState, On
SetNumLockState, AlwaysOn
