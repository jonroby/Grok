; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n < 3 and
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n > 3. Write a procedure that
; computes f by means of a recursive process. Write a procedure that computes f
; by means of an iterative process.

; recursive process
(define (f n)
    (cond ((<= n 3) n)
        (else (+
            (f (- n 1))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3)))
            ))))

; iterative process
(define (f-iter n)
    (if (< n 3)
        n
        (f 2 1 0 n)))

(define (f n1 n2 n3 i)
    (if (= i 2) n1
        (f
           (+ n1 (* 2 n2) (* 3 n3))
           n1
           n2
           (- i 1))))



(f 5)
