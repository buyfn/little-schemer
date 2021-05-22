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
                
(provide rember*)