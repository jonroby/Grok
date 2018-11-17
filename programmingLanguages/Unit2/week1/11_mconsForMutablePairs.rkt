;; Cons cells are immutable
;; This is a major change from scheme

(define mpr (mcons 1 (mcons #t "hi")))

;; (car mpr) => error
;; (cdr mpr) => error

(mcar mpr)
(mcdr mpr)

(set-mcdr! mpr 47)
(set-mcar! (mcdr mpr) 14)

;; also an mpair?


