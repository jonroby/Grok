; Exercise 1.4.  Observe that our model of evaluation allows for combinations
; whose operators are compound expressions. Use this observation to describe the
; behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; If b is greater than 0, + is returned, and it is applied to a and b (+ a b).
; Similarly, if b is less than 0, - is returned, and it is applied to a and b.
