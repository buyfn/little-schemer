#lang racket

(require rackunit "9.rkt")

(test-case
 "keep-looking"
 (check-equal? (keep-looking 'caviar 7 '(6 2 4 caviar 5 7 3)) #t))

(test-case
 "looking"
 (check-equal? (looking 'caviar '(6 2 4 caviar 5 7 3)) #t)
 (check-equal? (looking 'caviar '(6 2 grits caviar 5 7 3)) #f))

(test-case
 "shift"
 (check-equal? (shift '((a b) c)) '(a (b c)))
 (check-equal? (shift '((a b) (c d))) '(a (b (c d)))))