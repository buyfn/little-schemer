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

(define subset?
  (lambda (set1 set2)
    (cond
      ((null? set1) #t)
      (else (and (member (car set1) set2)
                 (subset? (cdr set1) set2))))))

(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2)
         (subset? set2 set1))))

(define intersect?
  (lambda (set1 set2)
    (cond
      ((null? set1) #f)
      (else (or (member? (car set1) set2)
                (intersect? (cdr set1) set2))))))

(provide set? makeset subset? eqset? intersect?)