#lang racket

(require rackunit "8.rkt")

(test-case
 "rember-f"
 (check-equal? ((rember-f eq?) 'tuna '(tuna salad is good))
               '(salad is good))
 (check-equal? ((rember-f eq?) 'eq? '(equal? eq? eqan? eqlist? eqpair?))
               '(equal? eqan? eqlist? eqpair?)))

(test-case
 "multirember-f"
 (check-equal? ((multirember-f eq?) 'tuna '(shrimp salad tuna salad and tuna))
               '(shrimp salad salad and)))

(test-case
 "multiremberT"
 (define eq?-tuna (eq?-c 'tuna))
 (check-equal? (multiremberT eq?-tuna '(shrimp salad tuna salad and tuna))
               '(shrimp salad salad and)))

(test-case
 "multirember&co"
 (define last-friend (lambda (x y) (length x)))
 (check-equal? (multirember&co 'tuna
                               '(strawberries tuna and swordfish)
                               last-friend)
               3))

(test-case
 "multiinsert&co"
 (check-equal? (multiinsertLR&co 'salty 'fish 'chips
                                 '(chips and fish or fish and chips)
                                 (lambda (newlat left right) newlat))
               '(chips salty and salty fish or salty fish and chips salty)))

(test-case
 "evens-only*"
 (check-equal? (evens-only* '((9 1 2 8) 3 10 ((9 9) 7 6) 2))
               '((2 8) 10 (() 6) 2)))

(test-case
 "evens-only*&co"
 (define the-last-friend (lambda (newl product sum)
                           (cons sum
                                 (cons product newl))))
 (define l '((9 1 2 8) 3 10 ((9 9) 7 6) 2))
 (check-equal? (evens-only*&co l the-last-friend)
               '(38 1920 (2 8) 10 (() 6) 2)))