; Exercise 1.7.  The good-enough? test used in computing square roots will not
; be very effective for finding the square roots of very small numbers. Also, in
; real computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers. Explain
; these statements, with examples showing how the test fails for small and large
; numbers. An alternative strategy for implementing good-enough? is to watch how
; guess changes from one iteration to the next and to stop when the change is a
; very small fraction of the guess. Design a square-root procedure that uses
; this kind of end test. Does this work better for small and large numbers?

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (display guess) (newline)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; As x approaches (and becomes smaller than) 0.001, sqrt-iter will yield an
; inaccurate result for smaller values because the actual square root is smaller
; than 0.001. So then, for values where (<= (sqrt y) 0.001), the result will be
; increasingly inaccurate. To illustrate clearly, say the epsilon were 100. Then
; (sqrt-iter 1 16) will yield the result from the first iteration, whatever the
; difference, because it will be < 100.

; For larger values, the problem is that the answer may never terminate. Before
; examining specifically why, notice that the underlying idea behind this method
; is that (= (average v (/ x v)) v^2). So if there were some v (on a computer),
; returned true, a problem could arise, since if the difference between that
; number (guess) and x were greater than epsilon, then sqrt-iter would never
; terminate. And that is precisely what happens.

; 1 ]=> (sqrt-iter 1.0 20000000000000000000000)
; 1.
; 1e22
; 5e21
; 2.5e21
; 1.25e21
; 6.25e20
; 3.125e20
; 1.5625e20
; 7.8125e19
; 3.90625e19
; 1.953125e19
; 9.765625e18
; 4.882812500000001e18
; 2.4414062500000026e18
; 1.2207031250000054e18
; 610351562500010900.
; 305175781250021800.
; 152587890625043680.
; 76293945312587380.
; 38146972656424760.
; 19073486328474524.
; 9536743164761550.
; 4768371583429351.
; 2384185793811827.5
; 1192092901100217.7
; 596046458938716.9
; 298023246246574.1
; 149011656677716.53
; 74505895447702.11
; 37253081941417.87
; 18626809404875.42
; 9313941563033.781
; 4658044440819.166
; 2331169044066.388
; 1169874215234.746
; 593485035137.9342
; 313592142088.4394
; 188684625181.45886
; 147340801420.34634
; 141540263664.63852
; 141421406184.1441
; 141421356237.31833
; 141421356237.3095
; Value: 141421356237.3095
