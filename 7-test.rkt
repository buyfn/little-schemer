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

(test-case
 "eqset?"
 (define set1 '(6 large chickens with wings))
 (define set2 '(6 chickens with large wings))
 (check-equal? (eqset? set1 set2) #t))

(test-case
 "intersect?"
 (define set1 '(stewed tomatoes and macaroni))
 (define set2 '(macaroni and cheese))
 (check-equal? (intersect? set1 set2) #t))

(test-case
 "intersect"
 (define set1 '(stewed tomatoes and macaroni))
 (define set2 '(macaroni and cheese))
 (check-equal? (eqset? (intersect set1 set2) '(and macaroni)) #t))

(test-case
 "union"
 (define set1 '(stewed tomatoes and macaroni casserole))
 (define set2 '(macaroni and cheese))
 (check-equal? (eqset? (union set1 set2)
                       '(stewed tomatoes casserole macaroni and cheese))
               #t))

(test-case
 "intersectall"
 (define l-set '((a b c) (c a d e) (e f g h a b)))
 (define l-set-2 '((6 pears and)
                   (3 peaches and 6 peppers)
                   (8 pears and 6 plums)
                   (and 6 prunes with some apples)))
 (check-equal? (intersectall l-set) '(a))
 (check-equal? (intersectall l-set-2) '(6 and)))

(test-case
 "a-pair?"
 (define p1 '(pear pear))
 (define p2 '(3 7))
 (define p3 '((2) (pair)))
 (define p4 '(full (house)))
 (check-equal? (a-pair? p1) #t)
 (check-equal? (a-pair? p2) #t)
 (check-equal? (a-pair? p3) #t)
 (check-equal? (a-pair? p4) #t)
 (check-equal? (a-pair? 3) #f))

