;; (define (expt b n)
;;   (if (= n 0)
;;       1
;;      (* b (expt b (- n 1)))))          

;; This is a linear recursive process, which requires theta(n) space and time.

(define (expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))

(define (even? n)
  (= (remainder n 2) 0))

;; (define (fast-expt b n)
;;   (cond ((= n 0) 1)
;;         ((even? n) (square (fast-expt b (/ n 2))))
;;         (else (* b (fast-expt b (- n 1))))))

;; Design a procedure that evolves an iterative exponentiation process that uses
;; successive squaring and uses a logarithmic number of steps, as does fast-expt.

(define (square x) (* x x))

(define (fast-expt b n)
  (fast-expt-iter acc b n))

(define (fast-expt-iter acc b n)
  (cond ((= n 0) acc)
        ((even? n) (fast-expt-iter acc (square b) (/ n 2)))
        (else (iter (* a b) b (- n 1)))))

