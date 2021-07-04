#lang racket

(require rackunit "5.rkt")

(test-case
    "rember*"
  (define l1 '((coffee) cup ((tea) cup) (and (hick)) cup))
  (define l2 '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce)))
  (define l3 '(a b c))
  (check-equal? (rember* 'cup l1) '((coffee) ((tea)) (and (hick))))
  (check-equal? (rember* 'sauce l2) '(((tomato)) ((bean)) (and ((flying)))))
  (check-equal? (rember* 'b l3) '(a c)))

(test-case
    "insertR*"
  (define l '((how much (wood))
              could
              ((a (wood) chuck))
              (((chuck)))
              (if (a) ((wood chuck)))
              could chuck wood))
  (check-equal? (insertR* 'roast 'chuck l)
                '((how much (wood))
                  could
                  ((a (wood) chuck roast))
                  (((chuck roast)))
                  (if (a) ((wood chuck roast)))
                  could chuck roast wood)))

(test-case
    "occur*"
  (define l '((banana)
              (split ((((banana ice)))
                      (cream (banana))
                      sherbet))
              (banana)
              (bread)
              (banana brandy)))
  (check-equal? (occur* 'banana l) 5))

(test-case
    "subst*"
  (define l '((banana)
              (split ((((banana ice)))
                      (cream (banana))
                      sherbet))
              (banana)
              (bread)
              (banana brandy)))
  (check-equal? (subst* 'orange 'banana l)
                '((orange)
                  (split ((((orange ice)))
                          (cream (orange))
                          sherbet))
                  (orange)
                  (bread)
                  (orange brandy))))

(test-case
 "insertL*"
 (define l '((how much (wood))
             could
             ((a (wood) chuck))
             (((chuck)))
             (if (a) ((wood chuck)))
             could chuck wood))
 (check-equal? (insertL* 'pecker 'chuck l)
               '((how much (wood))
                 could
                 ((a (wood) pecker chuck))
                 (((pecker chuck)))
                 (if (a) ((wood pecker chuck)))
                 could pecker chuck wood)))

(test-case
 "member*"
 (define l '((potato) (chips ((with) fish) (chips))))
 (check-equal? (member* 'chips l) #t))

(test-case
 "leftmost"
 (define l1 '((potato) (chips ((with) fish) (chips))))
 (define l2 '(((hot) (tuna (and))) cheese))
 (check-equal? (leftmost l1) 'potato)
 (check-equal? (leftmost l2) 'hot))

(test-case
 "eqlist?"
 (define l1 '(strawberry ice cream))
 (define l2 '(strawberry cream ice))
 (define l3 '(banana ((split))))
 (define l4 '((banana) (split)))
 (define l5 '(beef ((sausage)) (and (soda))))
 (define l6 '(beef ((salami)) (and (soda))))
 (check-equal? (eqlist? l1 l1) #t)
 (check-equal? (eqlist? l1 l2) #f)
 (check-equal? (eqlist? l3 l4) #f)
 (check-equal? (eqlist? l5 l6) #f)
 (check-equal? (eqlist? l5 l5) #t)
 )
