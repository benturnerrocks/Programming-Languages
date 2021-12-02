;;; assignment 6

;; takes in a start and end value and constructs a lazy list of the numbers between those
(define seq
  (lambda (first last)
    (if
      (> first (+ last 1)) #f
      (cons first (lambda () (seq (+ first 1) last))))))

;; testing seq
(define my_list (seq 1 5))
(car my_list) ;1
(cdr my_list) ;2
(car ((cdr my_list))) ;3

;; creates an infinite lazy list starting at the given value
(define inf-seq
  (lambda (first)
    (cons first (lambda () (inf-seq (+ first 1))))))

;; testing inf-seq
(define my_inf_list (inf-seq 5))
(car my_inf_list) ;4
(cdr my_inf_list) ;5
(car ((cdr my_inf_list))) ;6

;; takes a lazy list and returns a normal list with the first n values
(define first-n
  (lambda (lazy-list n)
    (cond
      ((and (eqv? ((cdr lazy-list)) #f) (>= n 1)) '())
      ((< n 1) '())
      (else (cons (car lazy-list) (first-n ((cdr lazy-list)) (- n 1)))))))

;; testing
(define my_list_2 (seq 1 10))
(first-n my_list_2 11) ;7

;; returns the value at the nth spot in the given lazy list
(define nth
  (lambda (lazy-list n)
    (cond
      ((eqv? ((cdr lazy-list)) #f) #f)
      ((= n 1) (car lazy-list))
      (else (nth ((cdr lazy-list)) (- n 1))))))

;; testing
(define my_list_3 (seq 1 6))
(nth my_list_3 2) ;8
(nth my_list_3 7) ;9

;; takes in a lazy list and returns a new lazy list without the multiples of n
(define filter-multiples
  (lambda (lazy-list n)
    (cond
      ((eqv? lazy-list #f) #f)
      ((= 0 (remainder (car lazy-list) n)) (filter-multiples ((cdr lazy-list)) n))
      (else (cons (car lazy-list) (lambda () (filter-multiples ((cdr lazy-list)) n)))))))

;; testing
(define my_list_4 (seq 2 6))
(filter-multiples my_list_4 2) ;10
((cdr (filter-multiples my_list_4 2))) ;11


;;; Sieve of Eratosthenes

;; takes a lazy-list and returns a list with the first element and every following element that is not a multiple of the first
(define almost-eratosthenes
  (lambda (lazy-list)
    (cons
      (car lazy-list)
      (lambda () (filter-multiples lazy-list (car lazy-list))))))

;; testing
(first-n (almost-eratosthenes (inf-seq 2)) 10) ;12
(first-n (almost-eratosthenes (inf-seq 3)) 10) ;13

;; takes a lazy list and returns a lazy list of just prime numbers
(define eratosthenes
  (lambda (lazy-list)
    (cons
      (car lazy-list)
      (lambda () (eratosthenes (filter-multiples lazy-list (car lazy-list)))))))

;; testing
(first-n (eratosthenes (inf-seq 2)) 10) ;14
(first-n (eratosthenes (inf-seq 3)) 10) ;15

;; when called it returns a lazy list of all the prime numbers
(define primes
  (lambda ()
    (eratosthenes (inf-seq 2))))

;; testing
(first-n (primes) 10) ;16
;(nth (primes) 20) ;17

;; resolving any failed TESTS
(first-n (seq 5 30) 500)
(filter-multiples (seq 5 30) 7)
(first-n (filter-multiples (seq 5 30) 7) 500)
