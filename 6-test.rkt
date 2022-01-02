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

(test-case
 "value"
 (define u 13)
 (define x '(1 + 3))
 (define y '(1 + (3 ↑ 4)))
 (define z 'cookie)
 (check-equal? (value u) 13)
 (check-equal? (value x) 4)
 (check-equal? (value y) 82))