#lang racket

;filter


(define(coordinate)
  (/ (truncate(* (random) 100)) 100))
;multiplies random by 1000, cuts it off then divides

(define(point)
  (list (coordinate)(coordinate)))

(define (xpoint point) (car point))
(define (ypoint point) (car (cdr point)))

(define (pointmakerlist count)
  (define( helper list counter)
    (if (equal? counter 0)
        list
        (helper (cons(point) list) (- counter 1))))
  (helper '() count))
       
        

(define (quadrant1 point)
  (and
   (> (xpoint point) 0.5)
   (> (ypoint point) 0.5)))

