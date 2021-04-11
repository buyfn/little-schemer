#lang racket

(require "1.rkt")

(define lat?
  (lambda (lst)
    (if (null? lst)
        #t
        (and (atom? (car lst)) (lat? (cdr lst))))))