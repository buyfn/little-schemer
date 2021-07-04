#lang racket
(define op+
  (lambda (a b)
    (if (zero? b)
        a
        (op+ (add1 a) (sub1 b)))))

(define op-
  (lambda (a b)
    (if (zero? b)
        a
        (op- (sub1 a) (sub1 b)))))

(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (op+ (car tup) (addtup (cdr tup)))))))

(define op*
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (op+ n (op* n (sub1 m)))))))

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) null)
      (else (cons (op+ (car tup1) (car tup2))
                  (tup+ (cdr tup1) (cdr tup2)))))))

(define op>
  (lambda (n m)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else (op> (sub1 n) (sub1 m))))))

(define op<
  (lambda (n m)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else (op< (sub1 n) (sub1 m))))))

(define op=
  (lambda (n m)
    (not (or (op> n m) (op< n m)))))

(define op**
  (lambda (n m)
    (cond
      ((zero? m) 1)
      (else (op* n (op** n (sub1 m)))))))

(define op/
  (lambda (n m)
    (cond
      ((< n m) 0)
      (else (add1 (op/ (op- n m) m))))))

(define length
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (length (cdr lat)))))))

(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else (pick (sub1 n) (cdr lat))))))

(define rempick
  (lambda (n lat)
    (cond
      ((one? n) (cdr lat))
      (else (cons (car lat) (rempick (sub1 n) (cdr lat)))))))

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) null)
      ((number? (car lat)) (no-nums (cdr lat)))
      (else (cons (car lat) (no-nums (cdr lat)))))))

(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) null)
      ((number? (car lat))
       (cons (car lat) (all-nums (cdr lat))))
      (else (all-nums (cdr lat))))))

(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2)) (= a1 a2))
      ((and (not (number? a1)) (not (number? a2)))
       (eq? a1 a2))
      (else #f))))

(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      (else
       (cond
         ((eqan? a (car lat))
          (add1 (occur a (cdr lat))))
         (else (occur a (cdr lat))))))))

(define one?
  (lambda (n) (= n 1)))

(provide op+ eqan?)
