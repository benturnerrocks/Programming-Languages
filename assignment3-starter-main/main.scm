;;;This is our implementation of a BST and its functions

;;this is the entry function, which returns the root of the given bst
(define entry
  (lambda (bst)
    (cond
      ((not (list? bst)) #f)
      ((not (= (length bst) 3)) #f)
      ((not (list? (car (cdr bst)))) #f)
      ((not (list? (car (cdr (cdr bst))))) #f)
      (else (car bst)))))

;;this is the left function, which returns the left subtree of the given bst
(define left
  (lambda (bst)
    (cond
      ((not (list? bst)) #f)
      ((not (= (length bst) 3)) #f)
      ((not (list? (car (cdr bst)))) #f)
      ((not (list? (car (cdr (cdr bst))))) #f)
      (else (car (cdr bst))))))

;;this is the right function, which returns the right subtree of the given bst
(define right
  (lambda (bst)
    (cond
      ((not (list? bst)) #f)
      ((not (= (length bst) 3)) #f)
      ((not (list? (car (cdr bst)))) #f)
      ((not (list? (car (cdr (cdr bst))))) #f)
      (else (car (cdr (cdr bst)))))))

;;creating a dummy bst to test with
(define my_bst
  '(5 (3 () (4 () ()) ) ()))

;;testing the above functions
(entry my_bst)
(left my_bst)
(right my_bst)

;;this function makes a bst given the root and the two subtrees
(define make-bst
  (lambda (elt left_bst right_bst)
    (cond
      ((not (integer? elt)) #f)
      ((if (equal? left_bst '()) #f (not (entry left_bst))) #f)
      ((if (equal? right_bst '()) #f (not (entry right_bst))) #f)
      (else (list elt left_bst right_bst)))))

;;creating another test bst using our make-bst
(define my_bst_2 (make-bst 5 '(3 () (4 () ()) ) '()))

;;testing
my_bst_2
(entry my_bst_2)
(left my_bst_2)
(right my_bst_2)

;;transversals

;;we want to return a list of values in the tree in preorder (root left right)
(define preorder
  (lambda (bst)
    (cond
      ((not (entry bst)) '())
      ;;if we have a valid root (havent reach bottom)
      (else (append (list (entry bst)) (preorder (left bst)) (preorder (right bst)))))))

;;testing
(preorder my_bst_2)

;;we want to return a list of values in the tree inorder (left root right)
(define inorder
  (lambda (bst)
    (cond
      ((not (entry bst)) '())
      ;;if we have a valid root (havent reach bottom)
      (else (append (inorder (left bst)) (list (entry bst)) (inorder (right bst)))))))

;;testing
(inorder my_bst_2)

;;we want to return a list of values in the tree in postorder (left right root)
(define postorder
  (lambda (bst)
    (cond
      ((not (entry bst)) '())
      ;;if we have a valid root (havent reach bottom)
      (else (append (postorder (left bst)) (postorder (right bst)) (list (entry bst)))))))

;;testing
(postorder my_bst_2)

;;insert a value into it's correct spot in the given bst
(define insert
  (lambda (v bst)
    (cond
      ((equal? bst '())
        (make-bst v '() '()))
      ((= (entry bst) v)
        bst)
      ((< v (entry bst))
        (make-bst (entry bst) (insert v (left bst)) (right bst)))
      ((> v (entry bst))
        (make-bst (entry bst) (left bst) (insert v (right bst)))))))

;;testing
(insert 2 my_bst_2)
(insert 6 my_bst_2)
(insert 5 my_bst_2)

(make-bst 1.5 '() '())
