#lang racket
(define o+
  (lambda (a b)
    (if (zero? b)
        a
        (o+ (add1 a) (sub1 b)))))

(define o-
  (lambda (a b)
    (if (zero? b)
        a
        (o- (sub1 a) (sub1 b)))))

(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (o+ (car tup) (addtup (cdr tup)))))))

(define o*
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (o+ n (o* n (sub1 m)))))))