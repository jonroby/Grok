;; Previous examples used nested ifs. It is better style to use
;; cond.

;; General syntax: (cond [e1a e1b]
;;                       [e2a e2b]
;;                       ...
;;                       [eNa eNb])

;; Good style: eNa should be #t. This is the default case!

(define (sum3 xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum3 (cdr xs)))]
        [#t (+ (sum3 (car xs)) (sum3 (cdr xs)))]))

;; For both if and cond, it will treat anything other than #f
;; as true. In some languages other things are false. Not in racket.

;; Some consider using this feature poor style, but it can be
;; convenient.


