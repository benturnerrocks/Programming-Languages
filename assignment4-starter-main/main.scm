;;; assignment 4: lazy lists

;; generates a list of integers going from start to stop
(define gen-list
  (lambda (start stop)
    (cond
      ((> start stop) '())
      (else (cons start (gen-list (+ start 1) stop))))))
(gen-list 1 5)

;; given a list and a value, it checks if any two consecutive numbers sum to the given value
(define pair-sum?
  (lambda (lst val)
    (cond
      ((equal? (cdr lst) '()) #f)
      ((= (+ (car lst) (car (cdr lst))) val) #t)
      (else (pair-sum? (cdr lst) val)))))

(pair-sum? '(1 3 4 4) 7) ; true
(pair-sum? '(1 3 5 4) 7); false

;; generates a lazy list
(define gen-lazy-list
  (lambda (start stop)
    (if (> start stop)
        #f
        (cons start
            (lambda () (gen-lazy-list (+ start 1) stop))))))

(define x (gen-lazy-list 1 10)) ;test lazy lists
(car x)
((cdr x))

;; given a lazy list and a value, it checks if any two consecutive numbers sum to the given value
(define pair-sum-lazy?
  (lambda (lzylst val)
    (cond
      ((not ((cdr lzylst))) #f)
      ((= (+ (car lzylst) (car ((cdr lzylst)))) val) #t)
      (else (pair-sum-lazy? ((cdr lzylst)) val)))))

(pair-sum-lazy? (gen-lazy-list 1 3) 5) ; true
(pair-sum-lazy? (gen-lazy-list 4 10) 7); false

;; converts a list into a lazy list
(define make-lazy
  (lambda (lst)
    (if (equal? lst '()) #f
    (cons (car lst)
          (lambda () (make-lazy  (cdr lst)))))))

(define y (make-lazy (gen-list 1 5))) ;testing make-lazy
(car x)
((cdr x))
(car ((cdr ((cdr (make-lazy '(3 4 5)))))))
