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

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) null)
      (else (cons (o+ (car tup1) (car tup2))
                  (tup+ (cdr tup1) (cdr tup2)))))))