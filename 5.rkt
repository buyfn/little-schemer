#lang racket

(require "1.rkt")

(define rember*
  (lambda (a l)
    (cond
      ((null? l) null)
      ((atom? (car l))
       (cond
         ((eq? (car l) a) (rember* a (cdr l)))
         (else (cons (car l) (rember* a (cdr l))))))
      (else (cons (rember* a (car l))
                  (rember* a (cdr l)))))))

(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) null)
      ((atom? (car l))
       (cond
         ((eq? (car l) old)
          (cons old (cons new (insertR* new old (cdr l)))))
         (else (cons (car l) (insertR* new old (cdr l))))))
      (else (cons (insertR* new old (car l))
                  (insertR* new old (cdr l)))))))
                
(provide rember* insertR*)
