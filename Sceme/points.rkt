#lang racket

;filter

(define(mreverse list)
  (define(mreverse2 list list2)
    (if(null? list)
       list2
     (mreverse2 (cdr list) (cons (car list) list2))))
    ;takes reverse of the rest of the list while putting the head on 2
   (mreverse2 list '()))

(define(coordinate)
  (/ (truncate(* (random) 100)) 100))
;multiplies random by 1000, cuts it off then divides

(define(point)
  (list (coordinate)(coordinate)))

(define (xpoint point) (car point))
(define (ypoint point) (car (cdr point)))

(define (pointlist counter)
  (define (maker counter result)
    (if (equal? counter 0)
        result
        (maker ( - counter 1) (cons(point) result))))
  ;counter is amount of points, put points on result list, go till 0
  (maker counter '()))

(define (quadrant1 point)
  (and
   (> (xpoint point) 0.5)
   (> (ypoint point) 0.5)))

