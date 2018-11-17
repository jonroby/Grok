;; Thunks let you skip expensive computations if they are not
;; needed.

;; Great if you take the true-branch:
;; (define f (th)
;;   (if (...) 0 (... (th) ...)))

;; But worse if you end up using the thunk more than once:
;; (define f (th)
;;   (... (if (...) 0 (... th) ...))
;;   (... (if (...) 0 (... th) ...))
;;   (... (if (...) 0 (... th) ...))
;;   ...

;; In general, it might not be known how many times a result
;; is needed.

;; What if we could get best of both worlds?
;; - Not compute until needed
;; - Remember the answer so future uses completely immediately.
;; This is called lazy evaluation.

;; Languages where most constructs, including function arguments
;; work this way are lazy languages.
;; - Haskell

;; Racket predefines support for promises, but we can make our own.
;; - Thunks and mutable pairs are enough.
