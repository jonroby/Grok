#lang racket

(require math/number-theory)

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below
(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (if (null? xs)
      suffix
      (cons (car xs) (string-append-map (cdr xs) suffix))))

(define (list-nth-mod xs n)
  (cond [(negative? n) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (if (= n 0) (car xs) (list-nth-mod (cdr xs) (- n 1)))]))

(define (stream-for-n-steps s n)
  (if (= n 0)
      (car (s))
      (stream-for-n-steps (cdr (s)) (- n 1))))

;; (define (f x) (cons x (lambda () (f (+ x 1)))))


(define funny-number-stream
  (letrec ([div-by-five (lambda (x) (if (divides? 5 x) (- x) x))]
           [fn (lambda (x) (cons (div-by-five x) (lambda () (fn (+ x 1)))))])
    (lambda () (fn 1))))

(define ones (lambda () (cons 1 ones)))

(define dan-then-dog
  (letrec ([interval (lambda (x) (if (eq? x "dan.jpg") "dog.jpg" "dan.jpg"))]
           [fn (lambda (x) (cons x (lambda () (fn (interval x)))))])
    (lambda () (fn "dan.jpg"))))

(define (stream-add-zero s1)
  (letrec ([ret-zero (lambda (x) (if (= (car (x)) 0) (cons 0 (car (x))) (car (x))))])
    (lambda () (cons (ret-zero s1) (stream-add-zero (cdr s1))))))
