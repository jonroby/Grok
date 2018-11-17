;; Cons can also make a pair
;; Often called a cons cell
;; By convention and std lib, lists are nested pairs that eventually
;; end with null

;; In the repl, pairs will have dots in them when evaluated.

(define pr (cons 1 (cons #t "hi")))
(cdr (cdr pr))
;; > "hi"

(define lst (cons 1 (cons #t (cons "hi" null))))
(cdr (cdr lst))
;; > '("hi")

;; if you want just "hi" then
(car (cdr (cdr lst)))

;; can also use (caddr lst)

;; Remember the only two things are a list are null or a pair
;; that ends with a null.

;; Note that some things will work fine on lists, but not on
;; pairs. Proper list vs improper list.

;; Pairs are usually just for a pair or a tuple of three things.
