(define list_length
  (lambda (x) (if (equal? x '()) 0 (+ 1 (list_length (cdr x)))))
  )
(define x 3)

(list_length '(1 2 3))

(define nth
  (lambda (n lst)
    (cond
      ((< n 1) '())
      ((equal? lst '()) '())
      ((= n 1) (car lst))
      (else (nth (- n 1) (cdr lst)))
    )
  )
)
(nth 10 '(1 5 6 7 8 9))

(define remove_first
  (lambda (value lst)
    (cond
      ((equal? lst '()) '())
      ((eqv? (car lst) value) (cdr lst))
      (else (cons (car lst) (remove_first value (cdr lst))))
    )
  )
)

,tr (remove_first 5 '(1 2 3 6 3))

(define remove_all
  (lambda (value lst)
    (cond
      ((equal? lst '()) '())
      ((eqv? (car lst) value) (remove_all value (cdr lst)))
      (else (cons (car lst) (remove_all value (cdr lst))))
    )
  )
)
,tr (remove_all 5 '(1 2 3 6 3))

(define cons-each
    (lambda (item lst)
        (if (null? lst)
            '()
            (cons (cons item (car lst))
                  (cons-each item (cdr lst))))))

(cons-each 3 '(1 2 4))
