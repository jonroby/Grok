; Exercise 1.12.  The following pattern of numbers is called Pascal's triangle:

;                 1
;             1       1
;         1       2       1
;     1       3       3       1
; 1       4       6       4       1

; The numbers at the edge of the triangle are all 1, and each number inside the
; triangle is the sum of the two numbers above it. Write a procedure that
; computes elements of Pascal's triangle by means of a recursive process.

;   1   5   15  35  70
;   1   4   10  20  35
;   1   3   6   10  15
;   1   2   3   4   5
;   1   1   1   1   1


(define (pascal x y)
  (if (or (= x 0) (= y 0) (and (= x 0) (= y 0)))
    1
      (+ (pascal (- x 1) y) (pascal x (- y 1)))))
