;; Unlike ML, racket really has assignment statements
;; - But used only when really appropriate.

;; (set! x e)

;; For the x in the current environment, subsequent lookups of x
;; get the result of evaluating expression e
;; - Any code using this x will be affected
;; - Like x = e in Java, C, Python, etc.

;; Once you have side-effects, sequences are useful

;; (begin e1 e2 en)

;; Example:
(define b 3)
(define f (lambda (x) (* 1 (+ x b))))
(define c (+ b r))
(set! b 5)
(define z (f 4))
(define w c)

;; Mutating top-level definitions is particularly problematic
;; - What if any code could do set! on anything?
;; - How could we defend against this?

;; A general principle if something you need not change might
;; change, make a local copy of it.

;; Example:
(define b 3)
(define f
  (let ([b b])
    (lambda (x) (* 1 (+ x b)))))

;; Racket made a practical decision: Each file is a module,
;; if a module does not use set! on a top level variable, then
;; racket makes it constant and forbits set! outside the module.

;; Primitives like +, *, and cons are in a module that does not
;; mutate them.

