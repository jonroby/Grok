; Exercise 1.3.  Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers.

; No lists
(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (greatest-two x y)
  (if (>= x y) x y))

(define (sum-squares-greatest-two x y z)
  (if (> x y)
    (+ (square x) (square (greatest-two y z)))
    (+ (square y) (square (greatest-two x z)))))

(sum-squares-greatest-two 5 3 4)
