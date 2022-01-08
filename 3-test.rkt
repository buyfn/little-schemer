#lang racket

(require rackunit "3.rkt")

(test-case
 "firsts"
 (define l1 '((apple peach pumpkin)
              (plum pear cherry)
              (grape raisin pea)
              (bean carrot eggplant)))
 (define l2 '((a b) (c d) (e f)))
 (define l3 '((five plums)
              (four)
              (eleven green oranges)))
 (define l4 '(((five plums) four)
              (eleven green oranges)
              ((no) more)))
 (check-equal? (firsts l1) '(apple plum grape bean))
 (check-equal? (firsts l2) '(a c e))
 (check-equal? (firsts '()) '())
 (check-equal? (firsts l3) '(five four eleven))
 (check-equal? (firsts l4) '((five plums) eleven (no))))