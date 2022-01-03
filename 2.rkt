#lang racket

(require "1.rkt")

(define lat?
  (lambda (lst)
    (if (null? lst)
        #t
        (and (atom? (car lst)) (lat? (cdr lst))))))

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

(provide member?)