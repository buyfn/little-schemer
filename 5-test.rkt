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
