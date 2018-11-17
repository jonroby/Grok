;; For each language construct the semantics specifies when
;; subexpressions get evaluated. In ML, Racket, Java, C:
;; - Function arguments are eager (call-by-value). 
;;   - Evaluated once before calling the function.
;; - Conditional branches are not eager.

;; It matters: calling factorial-bad never terminates
(define (my-if-bad x y z)
  (if x y z))

(define (factorial-bad n)
  (my-if-bad (= n 0)
             1
             (* n (factorial-bad (- n 1)))))


(define (my-if-strange-but-works e1 e2 e3)
  (if e1 (e2) (e3)))

(define (factorial-okay x)
  (my-if-strange-but-works
   (= x 0)
   (lambda () 1)
   (lambda () (* x (factorial-okay (- x 1))))))


