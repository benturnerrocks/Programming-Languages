;; takes in a function and 3 parameters and curries it so they can be called separately
(define curry3
  (lambda (func)
    (lambda (x)
      (lambda (y)
        (lambda (z)
          (func x y z))))))

;; test
((((curry3 list) 1) 2) 3)

;; uncurries curry3 (makes it a normal function calling all parameters at once)
(define uncurry3
  (lambda (func)
    (lambda (x y z)
      (((func x) y) z))))

;; test
((uncurry3 (curry3 list)) 1 2 3)

;; an example function using args
(define get-all-but-first-input
  (lambda args
    (cdr args)))

;; test
(get-all-but-first-input 1 2 3)     ; -->  (2 3)
(get-all-but-first-input 1 2 3 4 5) ; -->  (2 3 4 5)

;; takes a curried function with any number of arguments and turns it back into a normal function
(define uncurry
  (lambda (func)
    (lambda args
      (if (null? (cdr args))
        (func (car args))
        (apply (uncurry (func (car args))) (cdr args))))))

;; test
((uncurry (curry3 *)) 1 2 3)
((uncurry (curry3 *)) 3 4 5)

;; returns a list of all the values in the given list that the function returns true for
(define my-filter
  (lambda (func lst)
    (cond
      ((null? lst) '())
      ((func (car lst)) (cons (car lst) (my-filter func (cdr lst))))
      (else (my-filter func (cdr lst))))))

;; test
(my-filter odd? '(1 2 3 4))
(my-filter even? '(1 2 3 4))

;; combines the elements of two lists without any duplicates
(define union
  (lambda (lst1 lst2)
    (if (null? lst1)
      lst2
      (append (my-filter (lambda (x) (if (member x lst2) #f #t)) (list (car lst1))) (union (cdr lst1) lst2)))))

;; test
(union '(1 2 3) '(3 2 1))           ; --> (1 2 3)
(union '(1 2 3) '(3 4 5))           ; --> (1 2 3 4 5)
(union '(a b c) '(3 2 1))           ; --> (a b c 1 2 3)

;; returns a list of all the elements that are the same between two lists
(define intersect
  (lambda (lst1 lst2)
    (if (null? lst1)
      '()
      (append (my-filter (lambda (x) (if (eqv? x (car lst1)) #t #f)) lst2) (intersect (cdr lst1) lst2)))))

;; test
(intersect '(1 2 3) '(3 2 1))       ; --> (1 2 3)
(intersect '(1 2 3) '(4 5 6))       ; --> ()
(intersect '(1 2 3) '(2 3 4 5 6))   ; --> (2 3)

;; returns true if there exists an element in the given list that satisfies the given function
(define exists
  (lambda (func lst)
    (cond
      ((null? lst) #f)
      ((func (car lst)) #t)
      (else (exists func (cdr lst))))))

;; test
(exists (lambda (x) (eq? x 0)) '(-1 0 1))   ; -->   #t
(exists (lambda (x) (eq? x 2)) '(-1 0 1))   ; -->   #f
