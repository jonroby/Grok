#lang racket
;; Then racket-run! And that's it!

(define x 4)
(define y (+ x 2))

(define cube1
  (lambda (x)
    (* x (* x x))))

(define cube2
  (lambda (x)
    (* x x x)))

; Sugar for lambda
(define (cube3 x)
  (* x x x))

; Conditional
(define (pow1 x y)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1)))))

(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

