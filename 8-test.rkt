#lang racket

(require rackunit "8.rkt")

(test-case
 "rember-f"
 (check-equal? ((rember-f eq?) 'tuna '(tuna salad is good))
               '(salad is good))
 (check-equal? ((rember-f eq?) 'eq? '(equal? eq? eqan? eqlist? eqpair?))
               '(equal? eqan? eqlist? eqpair?)))