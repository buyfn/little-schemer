#lang racket

(require rackunit "6.rkt")

(test-case
    "numbered?"
  (define x 1)
  (define y '(3 + (4 × 5)))
  (define z '(2 × sausage))
  (check-equal? (numbered? x) #t)
  (check-equal? (numbered? y) #t)
  (check-equal? (numbered? z) #f))
