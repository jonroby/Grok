;; Not having types can be frustrating, but the advantage is that
;; it lets us build flexible data structures without going through
;; work of determing type of data structure.

;; Consider adding all elements of a list that can be either lists
;; or lists of lists.

;; My reply: Int | List Int
;; Pretty easy to come up with that type. Maybe there are harder
;; ones and this is just a simple illustration???

#lang racket

(define xs (list 4 5 6))
(define ys (list (list 4 5) 6 7 (list 8) 9 2 3 (list 0 1)))
(define zs (list (list 4 "a") 6 7 (list 8) 9 2 3 (list 0 1)))

(define (sum1 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum1 (cdr xs)))
          (+ (sum1 (car xs)) (sum1 (cdr xs))))))

;; However if you have string in there, you'll have a run-time
;; error

(define (sum2 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum2 (cdr xs)))
          (if (list? (car xs))
              (+ (sum2 (car xs)) (sum2 (cdr xs)))
              (sum2 (cdr xs))))))
