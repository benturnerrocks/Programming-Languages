;(+ 1 2)
;(if (equal? 'a 'b)
;    9
;    10)
;(cond ((equal? 10 3) (+ 3 8))
;      ((equal? 10 8) 12)
;      (else (* 8 3)))
;(equal? '(hi there) '(hi there))
;(equal? '(hi there) '(bye now))
;(equal? 3 3)
;(equal? 3 (+ 2 1))
;(equal? 3 3.0)
;(equal? 3 (/ 6 2))
;(equal? -1/2 -0.5)
;(eqv? '(hi there) '(hi there))
;(eqv? '(hi there) '(bye now))
;(eqv? 3 3)
;(eqv? 3 (+ 2 1))
;(eqv? 3 3.0)
;(eqv? 3 (/ 6 2))
;(eqv? -1/2 -0.5)
;(= 3 3)
;(= 3 (+ 2 1))
;(= 3 3.0)
;(= 3 (/ 6 2))
;(= -1/2 -0.5)
;(= '(hi there) '(hi there))  ;; yes, this will give an error

;looks like '=' is used for numbers, 'eqv?' is used for values, and 'equals?' is used for vectors lists and strings if eqv doesnt wrk

;(lambda (x)
;  (+ x 1))
;useless since it automatically gets removed from memory

;(define add-one
;  (lambda (x)
;    (+ x 1)))
;(define another-add-one add-one)
;(another-add-one 5)
;the define function takes a pointer, names it the first argument, and then points at the second argument

;(define a 5)
;(define b 6)
;(define c 7)
;(define strange
;  (lambda (x)
;    (let ((a 1) (b 2) (c 3))
;      (+ x a b c))))
;the define creates variables too, but the let overrides them temporarily

;(define fact
;  (lambda (n)
;    (if (equal? n 1)
;        1
;        (* n (fact (- n 1))))))

;write a recursive function that sums all the elements in the list
(define sum
  (lambda (x)
    (if (equal? x '())
      0 (+ (car x) (sum (cdr x))))))
,tr (sum '(4 5 -10 1))

(define list_length
  (lambda (x) (if (equal? x '()) 0 (+ 1 (list_length (cdr x)))))
  )

,tr (list_length '(1 2 3 4 5 6 7))

(define keep-first-n
  (lambda (n x)
    (cond ((equal? n 0) '()) ((< n 0) '()) ((< (- (list_length x) n) 0) '()) (else (cons (car x) (keep-first-n (- n 1) (cdr x)))))
    )
  )
,tr (keep-first-n -2 '(1 2 3 4 5 6 7))
