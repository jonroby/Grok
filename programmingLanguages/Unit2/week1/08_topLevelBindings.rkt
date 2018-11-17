
;; The bindings in a file
;; Like ML you can refer to earlier bindings.
;; Unlike ML, you can also refer to later bindings.
;; But refer to later bindings only in function bodies.
;; - Because bindings are evaluated in order
;; - An error to use undefined variable
;; - Unlike ML, cannot define the same variable twice in module.
;;   - Would make no sense, cannot have both in environment.

;; Advice for REPL, don't use recursive functions.

;; Will study Racket's module system in next section (optional)
;; - Each file is implicity a module
;;   - Not really a "top-level"
;; - A module can shadow bindings from other modules it uses
;;   - Including Racket standard lib
;; - So we could redefine + or any other function
;;   - Poor style to do so
;;   - Only shadows in our module (else messes up rest of std lib)
;; Note: Scheme is different

