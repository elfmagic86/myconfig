; key
; ---

; capslock to esc
CapsLock:: Send {Esc}


; home/end, pgup/pgdn
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

; del
NumpadDot:: Send {Del}
+NumpadDot:: Send +{Del}
^NumpadDot:: Send ^{Del}
!NumpadDot:: Send !{Del}