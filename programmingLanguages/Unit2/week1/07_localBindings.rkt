#lang racket

(define (max-of-list xs)
  (cond [(null? xs) (error "max-of-list given empty list")]
        [(null? (cdr xs)) (car xs)]
        [#t (let ([tlans (max-of-list (cdr xs))])
              (if (> tlans (car xs))
                  tlans
                  (car xs)))]))

;; Racket has 4 ways to define local variables.
;; - let
;; - let*
;; - letrec
;; - define

;; They all have different semantics. Though if all work,
;; prefer let.

;; Let
;; A let expression can bind any number of local variables
;; The expressions are all evaluated in the environment before
;; the let-expression.
;; - Except that the body can use all the local variables.
;; - This is not how ML let-expressions work.
;; - Convenient for things like (let ([x y] [y x]) ...)
;; Below, both x's refer to the x that is passed into silly-double

(define (silly-double x)
  (let ([x (+ x 3)]
        [y (+ x 2)])
    (+ x y -5)))

;; Let*
;; The expressions are evaluated in the environment produced
;; from the previous bindings
;; - Can repeat bindings
;; - This is how ML let-expressions work
;; Below, 
(define (silly-double x)
  (let* ([x (+ x 3)]
         [y (+ x 2)])
    (+ x y -8)))



;; Letrec
;; The expressions are evaluated in the environment that includes
;; all the bindings.
;; - Needed for mutual recursion.
;; - But expressions are still evaluated in order. Accessing
;;   uninitialized binding would produce an error.
;; Advice is to ONLY use for mutual recursion.
;; Note w uses later binding. This only works because function
;; body does is not evaluated until run time. And at run time,
;; w is available.
;; x will use parameter to function.
(define (silly-triple x)
  (letrec ([y (+ x 2)]
           [f (lambda (z) (+ z y w x))]
           [w (+ x 7)])
    (f -9)))


;; define
;; In certain positions like the beginning of function bodies,
;; you can put defines
;; - For defining local variables, same semantics as letrec
;; Local defines is preferred racket style, but course materials
;; will avoid them to emphasize let, let*, letrec distinction.

;; NOW IT IS CONSIDERED PREFERRED STYLE BY WRITERS OF RACKET TO
;; PREFER define.







