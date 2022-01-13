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

(test-case
 "weight*"
 (check-equal? (weight* '((a b) c)) 7)
 (check-equal? (weight* '(a (b c))) 5))

(test-case
 "shuffle"
 (check-equal? (shuffle '(a (b c))) '(a (b c)))
 (check-equal? (shuffle '(a b)) '(a b)))