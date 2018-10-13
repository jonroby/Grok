;; #lang racket
;; (load "test.rkt")

;; (define city "Salt Lake City")
;; (define state "Utah")
;; (define x "Hello")
;; (printf "~a, ~a\n" city state)

(define x 3)
(define y (+ x 2))

(define cube1
  (lambda (x)
    (* x (* x x))))

(define cube2
  (lambda (x)
    (* x x x)))

(define (cube3 x)
  (* x x x))

(define (pow1 x y)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1)))))

(define pow2
  (lambda (x)
    (lambda (y)
      (pow 1 x y))))

(define three-to-the (pow2 3))
