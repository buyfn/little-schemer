#lang racket

(require rackunit "7.rkt")

(test-case
 "set?"
 (define lat1 '(apples peaches pears plums))
 (define lat2 '(apple peaches apple plum))
 (define lat3 '())
 (define lat4 '(apple 3 pear 4 9 apple 3 4))
 (check-equal? (set? lat1) #t)
 (check-equal? (set? lat2) #f)
 (check-equal? (set? lat3) #t)
 (check-equal? (set? lat4) #f))

(test-case
 "makeset"
 (define lat1 '(apple peach pear peach plum apple lemon peach))
 (define lat2 '(apple 3 pear 4 9 apple 3 4))
 (check-equal? (makeset lat1) '(apple peach pear plum lemon))
 (check-equal? (makeset lat2) '(apple 3 pear 4 9))
)