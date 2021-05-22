#lang racket

(require rackunit "5.rkt")

(define l1 '((coffee) cup ((tea) cup) (and (hick)) cup))
(define l2 '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce)))
(define l3 '(a b c))
(check-equal? (rember* 'cup l1) '((coffee) ((tea)) (and (hick))))
(check-equal? (rember* 'sauce l2) '(((tomato)) ((bean)) (and ((flying)))))
(check-equal? (rember* 'b l3) '(a c))