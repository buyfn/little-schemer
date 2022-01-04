#lang racket

(require "2.rkt" "3.rkt")

(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      ((member? (car lat) (cdr lat)) #f)
      (else (set? (cdr lat))))))

(define makeset
  (lambda (lat)
    (cond
      ((null? lat) lat)
      ((member? (car lat) (cdr lat))
       (cons (car lat) (makeset (multirember (car lat) (cdr lat)))))
      (else
       (cons (car lat) (makeset (cdr lat)))))))

(provide set? makeset)