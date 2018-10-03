; Exercise 1.5.  Ben Bitdiddle has invented a test to determine whether the
; interpreter he is faced with is using applicative-order evaluation or
; normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order
; evaluation? What behavior will he observe with an interpreter that uses
; normal-order evaluation? Explain your answer. (Assume that the evaluation rule
; for the special form if is the same whether the interpreter is using normal or
; applicative order: The predicate expression is evaluated first, and the result
; determines whether to evaluate the consequent or the alternative expression.)

; applicative-order
; (test 0 (p))
; (test 0 (p))
; ...

; With applicative-order the evaluation never terminates, because the operands
; are evaluated, and in this case, the second argument, (p) evaluates to (p)
; ad infinitum.

; normal-order
; (test 0 (p))
; ((if (= 0 0) 0 (p)))
; ((if (#t) 0 (p)))
; ((0))
; (0)

; With normal-order, the operands aren't evaluated until they're needed, and
; since the predicate is true, only the first expression is evaluated, in this
; case, 0. So that is returned without ever evaluating (p).
