#lang racket
(require rackunit "10.rkt")

(test-case
 "entry"
 (check-equal? (entry '(appetizer entree beverage)
                      '(pate boeuf vin))
               '((appetizer entree beverage)
                 (pate boeuf vin)))
 (check-equal? (entry '(appetizer entree beverage)
                      '(beer beer beer))
               '((appetizer entree beverage)
                 (beer beer beer)))
 (check-equal? (entry '(beverage dessert)
                      '((food is) (number one with us)))
               '((beverage dessert)
                 ((food is) (number one with us)))))

(test-case
 "lookup-in-table"
 (define table-f (lambda (name) "no value found"))
 (define table '(((entree desser)
                  (spaghetti spumoni))
                 ((appetizer entree beverage)
                  (food tastes good))))
 (check-equal? (lookup-in-table 'entree table table-f) 'spaghetti))