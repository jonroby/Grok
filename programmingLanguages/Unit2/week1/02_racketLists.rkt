#lang racket

;; empty list: null
;; cons constructor: cons
;; access head of list: car
;; access tail of list: cdr
;; check for empty: null?

;; note:
;; - unlike Scheme, () doesn't work for null, but '() does
;; - (list e1 ... en) for building lists
;; - names car and cdr are a historical accident

(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs) (sum(cdr xs)))))

(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs) ys))))

(define (my-map fn lst)
  (if (null? lst)
      null
      (cons (fn (car lst)) (my-map fn (cdr lst)))))

;; note (cons 4 (cons 5 (cons 6 null))) is the same as
;; '(4 5 6)
