; primitive procedures
; compound procedures

; substitution model for procedure application
; it can be taken as a model that determines the meaning of procedure
; application. However, the interpreter doesn't really work this way.

; (f 5)
; (sum-of-squares (+ a 1) (* a 2))
; (sum-of-squares (+ 5 1) (* 5 2))
; (sum-of-squares (6) (10))
; (+ (square 6) (square 10))
; (+ (* 6 6) (* 10 10))
; (+ 36 100)
; 136

; fully expand and reduce - normal-order
; (f 5)
; (sum-of-squares (+ 5 1) (* 5 2))
; (+    (square (+ 5 1))      (square (* 5 2))  )
; (+    (* (+ 5 1) (+ 5 1))   (* (* 5 2) (* 5 2)))
; (+         (* 6 6)             (* 10 10))
; (+           36                   100)
;                    136
