;; A term (in the language) is either:
;; - atom (#t, #f, 34, "hi", null, 4.0, x)
;; - special form (define, lambda, if)
;;   - macros will let us define our own
;; - sequence (t1 t2 ... tn)
;;   - if t1 is a special form, sematnics of sequence is special
;;   - else a function call

;; Why is this good?
;; By parenthesizing everything, convert the program text into a tree
;; representing the program (parsing), is trivial and unambiguous
;;   - atoms are leaves
;;   - sequences are nodes with elements as children
;;   - (no other rules)

;; (define cube
;;   (lambda (x)
;;     (* x x x)))

;;                define
;;            cube       lambda
;;                      x       *
;;                            x x x

;; no need to discuss operator precedence
