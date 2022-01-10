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