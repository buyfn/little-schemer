#lang racket

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) '())
        ((test? (car l) a) (cdr l))
        (else (cons (car l)
                    ((rember-f test?) a (cdr l))))))))

(define rember-eq? (rember-f eq?))

(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a))))

(define eq?-salad (eq?-c 'salad))

(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old)
         (cons new (cons old (cdr l))))
        (else (cons (car l)
                    ((insertL-f test?) new old (cdr l))))))))

(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old)
         (cons old (cons new (cdr l))))
        (else (cons (car l)
                    ((insertR-f test?) new old (cdr l))))))))

(define seqL
  (lambda (new old l)
    (cons new (cons old l))))
(define seqR
  (lambda (new old l)
    (cons old (cons new l))))
(define seqS
  (lambda (new old l)
    (cons new l)))

(define insert-g
  (lambda (test? seq)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((test? (car l) old)
         (seq new old (cdr l)))
        (else (cons (car l)
                    ((insert-g test? seq) new old (cdr l))))))))

(define insertL (insert-g eq? seqL))
(define insertR (insert-g eq? seqR))
(define subst (insert-g eq? seqS))

(provide rember-f rember-eq?)