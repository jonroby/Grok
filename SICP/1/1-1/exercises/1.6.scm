; Exercise 1.6.  Alyssa P. Hacker doesn't see why if needs to be provided as a
; special form. "Why can't I just define it as an ordinary procedure in terms
; of cond?" she asks. Alyssa's friend Eva Lu Ator claims this can indeed be
; done, and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
; => 5

(new-if (= 1 1) 0 5)
; => 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

; What happens when Alyssa attempts to use this to compute square roots? Explain.

; It will infinitely recurse. As explained in the answer to Exercise 1.5,
; applicative-order will evaluate the subexpressions and then apply sqrt-iter.
; Then in the case of new-if, it evaluates guess and then (sqrt-iter ...). This
; will occur ad infinitum.

; Although it hasn't been noted in the text, the inference is that if, is NOT
; evaluated with applicative-order. And indeed, the result of
; (if (= 0 0) 0 y)
; is just 0. Even though y is never defined. So presumably, it is evaluated with
; normal-order.

; This may raise a question. If the if special form is evaluated this way, then
; why did it infinitely recurse in Exercise 1.5? The answer is that the if
; section of the code was never evaluated. It was stuck at
; (test 0 (p)). Again, applicative order, first evaluates the subexpressions, 0
; and then (p), and so test is never applied.
