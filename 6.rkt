#lang racket

(require "1.rkt" "4.rkt")

(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      (else (and (numbered? (car aexp))
                 (numbered? (car (cdr (cdr aexp)))))))))

(define 1st-sub-exp
  (lambda (aexp) (car aexp)))
(define 2nd-sub-exp
  (lambda (aexp) (car (cdr (cdr aexp)))))
(define operator
  (lambda (aexp) (car (cdr aexp))))

(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (operator nexp) (quote +))
       (op+ (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp))))
      ((eq? (operator nexp) (quote ×))
       (op* (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp))))
      (else
       (op** (value (1st-sub-exp nexp)) (value (2nd-sub-exp nexp)))))))

(define sero?
  (lambda (n) (null? n)))
(define edd1
  (lambda (n) (cons '() n)))
(define zub1
  (lambda (n) (cdr n)))

(define another-op+
  (lambda (n m)
    (cond
      ((sero? m) n)
      (else (another-op+ (edd1 n) (zub1 m))))))

(provide
 numbered?
 1st-sub-exp
 2nd-sub-exp
 operator
 value)