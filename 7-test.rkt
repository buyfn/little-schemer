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

(test-case
 "subset?"
 (define set1 '(5 chicken wings))
 (define set2 '(5 hamburgers 2 pieces fried chicken and light duckling wings))
 (define set3 '(4 pounds of horseradish))
 (define set4 '(four pounds chicken and 5 ounces horseradish))
 (check-equal? (subset? set1 set2) #t)
 (check-equal? (subset? set3 set4) #f))